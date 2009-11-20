Received: from mail-bw0-f217.google.com ([209.85.218.217])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1NBQcq-0004oA-4Y
	for openembedded-devel@lists.openembedded.org;
	Fri, 20 Nov 2009 11:22:03 +0100
Received: by bwz9 with SMTP id 9so3086508bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Nov 2009 02:20:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=0FT2RzbC2deiGcheYL9Yzxv1RBIjBQpoXhRoNG65cUg=;
	b=lQ9fWCTaBjkB36AM/EK7OHQZPd9tW7GJw5/z7jI8APX2X9XAgnEJ6S/OZi3wNfiF4j
	mEvuasxE2f6+ViIPHqV3h1AdCVJqSPSnedP18Hl+5MC1BVBinO9azV5480pQF1qAQmjQ
	NTvEVpkckWYYP29vcMiLIAi0O66sWyrtZQB0k=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=NQDnZYXFw4etIBhQZS4acEjc9POfTqfLRKJEAB8OJZq862rcreWldxGhUyYqFjXWdN
	hemBnJjlOv5zOOY73+qX+7ojtzm2wGhJEtdJ/H9mktn83xcZ973sZSqgZE1lyOw2n4+d
	hk1qPTHtqhf9qc5Bg7DHZXOw4P9+/ro5YTY8s=
Received: by 10.204.2.196 with SMTP id 4mr1231611bkk.7.1258712434811;
	Fri, 20 Nov 2009 02:20:34 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 15sm488821fxm.14.2009.11.20.02.20.32
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 20 Nov 2009 02:20:33 -0800 (PST)
Date: Fri, 20 Nov 2009 11:20:30 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20091120102030.GB3281@jama>
References: <hdra17$t4d$1@ger.gmane.org>
	<1258368570.5799.99.camel@dax.rpnet.com>
	<hdrb9v$1dp$1@ger.gmane.org>
	<1258371591.5799.112.camel@dax.rpnet.com>
	<hdrffa$do6$1@ger.gmane.org>
	<1258375022.16625.3.camel@dax.rpnet.com>
	<20091116134339.GC23383@jama>
	<1258379748.16625.8.camel@dax.rpnet.com>
	<20091117085518.GF23383@jama>
	<1258452062.8810.5.camel@dax.rpnet.com>
MIME-Version: 1.0
In-Reply-To: <1258452062.8810.5.camel@dax.rpnet.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.218.217
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: SRCPV migration
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
X-List-Received-Date: Fri, 20 Nov 2009 10:22:03 -0000
X-Groupsio-MsgNum: 14515
Content-Type: multipart/mixed; boundary="sdtB3X0nJg68CQEu"
Content-Disposition: inline

--sdtB3X0nJg68CQEu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Even better fix for builders with BB_GIT_CLONE_FOR_SRCREV enabled.

-- 
uin:136542059                jid:Martin.Jansa@gmail.com
Jansa Martin                 sip:jamasip@voip.wengo.fr 
JaMa                         

--sdtB3X0nJg68CQEu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="0002-BB_GIT_CLONE_FOR_SRCREV-using-only-_sortable_buildnu.patch"

From b2a572666d6cf31c2c39b3123b97e972f01bbb36 Mon Sep 17 00:00:00 2001
From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 17 Nov 2009 15:44:43 +0100
Subject: [PATCH 2/2] BB_GIT_CLONE_FOR_SRCREV using only _sortable_buildnumber() for known revision

* Sortable_buildnumber: return old count value if new isn't available
* Protects before putting wrong number (ie 0) to persistent cache when
  git repo is not available, or something happen to local git checkout
* Buildnumber shouldn't go backwards ever
* If this error happen always for some recipe SRCPV cannot ensure
  upgradeable versions
---
 lib/bb/fetch/__init__.py |   18 ++++++++++--------
 lib/bb/fetch/git.py      |   36 +++++++++++++-----------------------
 2 files changed, 23 insertions(+), 31 deletions(-)

diff --git a/lib/bb/fetch/__init__.py b/lib/bb/fetch/__init__.py
index 9508908..3e04f2e 100644
--- a/lib/bb/fetch/__init__.py
+++ b/lib/bb/fetch/__init__.py
@@ -553,21 +553,20 @@ class Fetch(object):
         """
         
         """
-        has_want_sortable = hasattr(self, "_want_sortable_revision")
-        has_sortable = hasattr(self, "_sortable_revision")
+        has_want_sortable_buildnumber = hasattr(self, "_want_sortable_buildnumber")
+        has_sortable_buildnumber = hasattr(self, "_sortable_buildnumber")
+        has_sortable_revision = hasattr(self, "_sortable_revision")
 
-        if not has_want_sortable and has_sortable:
+        if has_sortable_revision:
             return self._sortable_revision(url, ud, d)
-        elif has_want_sortable and self._want_sortable_revision(url, ud, d) and has_sortable:
-            return self._sortable_revision(url, ud, d)
-        
-
+    
         pd = persist_data.PersistData(d)
         key = self.generate_revision_key(url, ud, d)
 
         latest_rev = self._build_revision(url, ud, d)
         last_rev = pd.getValue("BB_URI_LOCALCOUNT", key + "_rev")
         uselocalcount = bb.data.getVar("BB_LOCALCOUNT_OVERRIDE", d, True) or False
+        usesortable_buildnumber = has_sortable_buildnumber and has_want_sortable_buildnumber and self._want_sortable_buildnumber(url, ud, d)
         count = None
         if uselocalcount:
             count = Fetch.localcount_internal_helper(ud, d)
@@ -577,9 +576,12 @@ class Fetch(object):
         if last_rev == latest_rev:
             return str(count + "+" + latest_rev)
 
+        if usesortable_buildnumber:
+            count = self._sortable_buildnumber(url, ud, d, latest_rev, count)
+
         if count is None:
             count = "0"
-        elif uselocalcount:
+        elif uselocalcount or usesortable_buildnumber:
             count = str(count)
         else:
             count = str(int(count) + 1)
diff --git a/lib/bb/fetch/git.py b/lib/bb/fetch/git.py
index 5cdf656..23fc377 100644
--- a/lib/bb/fetch/git.py
+++ b/lib/bb/fetch/git.py
@@ -146,44 +146,34 @@ class Git(Fetch):
     def _build_revision(self, url, ud, d):
         return ud.tag
 
-    def _want_sortable_revision(self, url, ud, d):
+    def _want_sortable_buildnumber(self, url, ud, d):
         return bb.data.getVar("BB_GIT_CLONE_FOR_SRCREV", d, True) or False
 
-    def _sortable_revision(self, url, ud, d):
+    def _sortable_buildnumber(self, url, ud, d, rev, count):
         """
-        This is only called when _want_sortable_revision called true
+        This is only called when _want_sortable_buildnumber called true
 
-        We will have to get the updated revision.
+        Latest revision is already known, we need only to count revisions in git repo.
         """
         gitsrcname = '%s%s' % (ud.host, ud.path.replace('/', '.'))
         repodir = os.path.join(data.expand('${GITDIR}', d), gitsrcname)
 
-        key = "GIT_CACHED_REVISION-%s-%s"  % (gitsrcname, ud.tag)
-        if bb.data.getVar(key, d):
-            return bb.data.getVar(key, d)
-
-
-        # Runtime warning on wrongly configured sources
-        if ud.tag == "1":
-            bb.msg.error(1, bb.msg.domain.Fetcher, "SRCREV is '1'. This indicates a configuration error of %s" % url)
-            return "0+1"
-
         cwd = os.getcwd()
 
         # Check if we have the rev already
         if not os.path.exists(repodir):
-            print "no repo"
-            self.go(None, ud, d)
+            bb.msg.error(bb.msg.domain.Fetcher, "GIT repository for %s doesn't exist in %s, cannot get sortable buildnumber, using old value" % (url, repodir))
+            return count
 
         os.chdir(repodir)
-        if not self._contains_ref(ud.tag, d):
-            self.go(None, ud, d)
 
-        output = runfetchcmd("git rev-list %s -- 2> /dev/null | wc -l" % ud.tag, d, quiet=True)
+        output = runfetchcmd("git rev-list %s -- 2> /dev/null | wc -l" % rev, d, quiet=True)
         os.chdir(cwd)
 
-        sortable_revision = "%s+%s" % (output.split()[0], ud.tag)
-        bb.data.setVar(key, sortable_revision, d)
-        return sortable_revision
-        
+        sortable_buildnumber= "%s" % (output.split()[0])
+        bb.msg.debug(1, bb.msg.domain.Fetcher, "GIT repository for %s in %s is returning %s revisions in rev-list before %s, old valued is %s" % (url, repodir, sortable_buildnumber, rev, count))
+        if sortable_buildnumber < count:
+            bb.msg.error(bb.msg.domain.Fetcher, "GIT repository for %s in %s is returning %s revisions in rev-list before %s which is lower than previous count %s, using old value" % (url, repodir, sortable_buildnumber, rev, count))
+            return count
 
+        return sortable_buildnumber
-- 
1.6.5.3


--sdtB3X0nJg68CQEu--
