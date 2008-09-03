Received: from [81.169.183.159] (helo=coruscant.onosendai.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <zecke@selfish.org>) id 1KavoF-0003kC-5U
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Sep 2008 19:06:23 +0200
Received: from [92.117.9.219] (helo=tamarin.local)
	by coruscant.onosendai.de with esmtpsa
	(TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.69)
	(envelope-from <zecke@selfish.org>) id 1Kavlw-0001jH-O7
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Sep 2008 19:04:16 +0200
From: Holger Freyther <zecke@selfish.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 3 Sep 2008 15:54:52 +0200
User-Agent: KMail/1.9.9
MIME-Version: 1.0
Message-Id: <200809031554.52267.zecke@selfish.org>
X-Broken-Reverse-DNS: no host name found for IP address 92.117.9.219
Subject: Hash based SCMs and OpenEmbedded/Bitbake
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 03 Sep 2008 17:06:23 -0000
X-Groupsio-MsgNum: 5828
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_scpvImR4GNU7B5Z"

--Boundary-00=_scpvImR4GNU7B5Z
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hey guys,

we have a couple of issues with hash based SCMs (like git) and how we handle 
them.

1.) sane-srcrev. During stabilisation you want to lock down a rev, so you set 
one in sane-srcrev.

Issue: The PV says something like PV = "1.0.0+gitr${SRCREV}". Now the SRCREV 
is fixed and will not go through the python hook. So the resulting package 
will be PV = "1.0.0+gitrdeadbeef" and if you want to upgrade to the 
ref "affe" you will have a package called "1.0.0+gitraffe" which is not 
upgradable.

Approach at Openmoko: Invent "SRCPV" and put that into the PV line. SRCPV will 
go throuh the bitbake fetcher hook and will generate a string which includes 
an increasing number (like on the autorev's).

This will allow people to set a SRCREV and people will be able to upgrade. 
Afterward you can remove PR from the PV line to allow such things...

This involves a change to conf/bitbake.conf and a fix to the various bb files 
to use SRCPV (which was also used to fix the PV line to say +SCMr..)


2.) The monotonely increasing number is completely random and local. So if two 
people generate packages on two different systems the one having built more 
often (more revs) will have the upgradable package.

Approach at Openmoko: We assume that upstream has a fast forward history (no 
rev is suddenly vanishing) and we will use git-rev-list to count the revs 
(from henryk) to get a monotonic revision number. This means suddenly the 
monotonic number is global. This patch is optional and needs to be enabled 
with a config key.

Issues:
	- Assume history is fast forward, if not packages are not upgraded
	- This forces to have a local git tree (making distributing git-checkouts 
impossible) of everything bitbake will look at during parse.

Werner Almesberger's proposal:
	- For the decision if we should rebuild or not any id is good enough. So we 
could ping/check upstream, check if the last rev was different and then 
schedule it for rebuild (like we do now)
	- When packaging we will use the right revision and put that into the 
package.

Issues:
	+ Only git repos of what we need! Faster parse time
	- tmp/work/foo-PV-PR and tmp/deploy/glibc/ipk/... will not relate..

 

comments, I would be happy to merge some of those bits from Openmoko to 
Openembedded.


	z.

--Boundary-00=_scpvImR4GNU7B5Z
Content-Type: text/x-diff;
  charset="us-ascii";
  name="0002-Allow-to-conditionally-implement-sortable-revision-i.patch"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="0002-Allow-to-conditionally-implement-sortable-revision-i.patch"

From ddc21607f0ac083fcd240e3dc7a186e5e294b2dd Mon Sep 17 00:00:00 2001
From: Holger Freyther <zecke@openmoko.org>
Date: Fri, 16 May 2008 12:12:54 +0200
Subject: [PATCH] Allow to conditionally implement sortable revision in the =
fetcher

---
 lib/bb/fetch/__init__.py |    8 +++++++-
 1 files changed, 7 insertions(+), 1 deletions(-)

diff --git a/lib/bb/fetch/__init__.py b/lib/bb/fetch/__init__.py
index c3bea44..4a0d091 100644
--- a/lib/bb/fetch/__init__.py
+++ b/lib/bb/fetch/__init__.py
@@ -510,8 +510,14 @@ class Fetch(object):
         """
        =20
         """
-        if hasattr(self, "_sortable_revision"):
+        has_want_sortable =3D hasattr(self, "_want_sortable_revision")
+        has_sortable =3D hasattr(self, "_sortable_revision")
+
+        if not has_want_sortable and has_sortable:
+            return self._sortable_revision(url, ud, d)
+        elif has_want_sortable and self._want_sortable_revision(url, ud, d=
) and has_sortable:
             return self._sortable_revision(url, ud, d)
+       =20
=20
         pd =3D persist_data.PersistData(d)
         key =3D self._revision_key(url, ud, d)
--=20
1.5.4.3


--Boundary-00=_scpvImR4GNU7B5Z
Content-Type: text/x-diff;
  charset="us-ascii";
  name="0005-git-Optionally-use-git-rev-list-to-get-a-sortable.patch"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="0005-git-Optionally-use-git-rev-list-to-get-a-sortable.patch"

From 6edcc2fa065194fd29fdeb340d15d9cc4b412a0e Mon Sep 17 00:00:00 2001
From: Holger Freyther <zecke@openmoko.org>
Date: Fri, 16 May 2008 12:25:27 +0200
Subject: [PATCH] [git] Optionally use git-rev-list to get a sortable revisi=
on
     With setting BB_GIT_CLONE_FOR_SRCREV=3D"1" you can get a sensible
     and global (per repository with only fast forwards) revision. The down=
sides
     are you will have to have a repository at parse time which means you w=
ill
     git-clone certain trees you don't even use. This is also the reason wh=
y
     this is optional. This also means you might need to download your git
     checkouts to get this feature working.

---
 lib/bb/fetch/git.py |   35 +++++++++++++++++++++++++++++++++++
 1 files changed, 35 insertions(+), 0 deletions(-)

diff --git a/lib/bb/fetch/git.py b/lib/bb/fetch/git.py
index 3de3529..b256fd0 100644
--- a/lib/bb/fetch/git.py
+++ b/lib/bb/fetch/git.py
@@ -145,3 +145,38 @@ class Git(Fetch):
     def _build_revision(self, url, ud, d):
         return ud.tag
=20
+    def _want_sortable_revision(self, url, ud, d):
+        return bb.data.getVar("BB_GIT_CLONE_FOR_SRCREV", d, True) or False
+
+    def _sortable_revision(self, url, ud, d):
+        """
+        This is only called when _want_sortable_revision called true
+
+        We will have to get the updated revision.
+        """
+        gitsrcname =3D '%s%s' % (ud.host, ud.path.replace('/', '.'))
+        repodir =3D os.path.join(data.expand('${GITDIR}', d), gitsrcname)
+
+
+        # Runtime warning on wrongly configured sources
+        if ud.tag =3D=3D "1":
+            bb.msg.error(1, bb.msg.domain.Fetcher, "SRCREV is '1'. This in=
dicates a configuration error of %s" % url)
+            return "0+1"
+
+        cwd =3D os.getcwd()
+
+        # Check if we have the rev already
+        if not os.path.exists(repodir):
+            print "no repo"
+            self.go(None, ud, d)
+
+        os.chdir(repodir)
+        if not self._contains_ref(ud.tag, d):
+            self.go(None, ud, d)
+
+        output =3D runfetchcmd("git rev-list %s -- 2> /dev/null | wc -l" %=
 ud.tag, d, quiet=3DTrue)
+        os.chdir(cwd)
+
+        return "%s+%s" % (output.split()[0], ud.tag)
+       =20
+
--=20
1.5.4.3


--Boundary-00=_scpvImR4GNU7B5Z
Content-Type: text/x-diff;
  charset="us-ascii";
  name="0007-git-Do-not-run-git-rev-list-everytime-to-increase.patch"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="0007-git-Do-not-run-git-rev-list-everytime-to-increase.patch"

From 16740d951cd253a0f1297487b842ac97ef9322cd Mon Sep 17 00:00:00 2001
From: Holger Freyther <zecke@openmoko.org>
Date: Mon, 26 May 2008 16:05:14 +0200
Subject: [PATCH] [git] Do not run git-rev-list everytime to increase the sp=
eed
     Cache the result of git-rev-list for a repo and hash. This
     speeds up do_package of the linux kernel tremendously.

---
 lib/bb/fetch/git.py |    8 +++++++-
 1 files changed, 7 insertions(+), 1 deletions(-)

diff --git a/lib/bb/fetch/git.py b/lib/bb/fetch/git.py
index b256fd0..774bd1a 100644
--- a/lib/bb/fetch/git.py
+++ b/lib/bb/fetch/git.py
@@ -157,6 +157,10 @@ class Git(Fetch):
         gitsrcname =3D '%s%s' % (ud.host, ud.path.replace('/', '.'))
         repodir =3D os.path.join(data.expand('${GITDIR}', d), gitsrcname)
=20
+        key =3D "GIT_CACHED_REVISION-%s-%s"  % (gitsrcname, ud.tag)
+        if bb.data.getVar(key, d):
+            return bb.data.getVar(key, d)
+
=20
         # Runtime warning on wrongly configured sources
         if ud.tag =3D=3D "1":
@@ -177,6 +181,8 @@ class Git(Fetch):
         output =3D runfetchcmd("git rev-list %s -- 2> /dev/null | wc -l" %=
 ud.tag, d, quiet=3DTrue)
         os.chdir(cwd)
=20
-        return "%s+%s" % (output.split()[0], ud.tag)
+        sortable_revision =3D "%s+%s" % (output.split()[0], ud.tag)
+        bb.data.setVar(key, sortable_revision, d)
+        return sortable_revision
        =20
=20
--=20
1.5.4.3


--Boundary-00=_scpvImR4GNU7B5Z--
