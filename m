Received: from mail-bw0-f217.google.com ([209.85.218.217])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1NAPkN-0004N1-8Y
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 Nov 2009 16:13:38 +0100
Received: by bwz9 with SMTP id 9so82250bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Nov 2009 07:12:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:cc:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=QczADMkmZAjpMVnBRRVjoXCQ8u+46E+UJlVM5fk2eZs=;
	b=YajffO7kGV2+rSTn9ukt0wH8pFmWKUhQt7gNw25hxKGq2HuTr8dDOtyIQFEjhKk2en
	hpjN2fmewPbQ1ITaJUcM+o5GSoB9Ajr9dZqYUR0jbOJppyxCJzQcUy9CI1z5U1VeKf5W
	H7PS3VTDSI/0lTt/oyjH1rg5fvQz3XZl8jMGU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=gWvpKnw63Mcd1bbEdUA9RPJ+ceCUvpBjhpxKw/YpDnKup+0MYncJOPflIsDOnmdh0q
	yyOJ7Bbl+bDtzxUFqt40t6424xqj+20vh7GeFK9WfueJCR7O1i1M1Y3tviJFOGMjkAdc
	VgBYbPph6fOpzRdPCaNlg1tqsXUvwD9LI/OhI=
Received: by 10.204.141.4 with SMTP id k4mr4194235bku.28.1258470732110;
	Tue, 17 Nov 2009 07:12:12 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 16sm129639fxm.4.2009.11.17.07.12.08
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 17 Nov 2009 07:12:08 -0800 (PST)
Date: Tue, 17 Nov 2009 16:12:12 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: mok@mnet-online.de
Message-ID: <20091117151212.GJ23383@jama>
References: <hdra17$t4d$1@ger.gmane.org>
	<1258368570.5799.99.camel@dax.rpnet.com>
	<hdrb9v$1dp$1@ger.gmane.org>
	<1258371591.5799.112.camel@dax.rpnet.com>
	<hdrffa$do6$1@ger.gmane.org>
	<1258375022.16625.3.camel@dax.rpnet.com>
	<20091116134339.GC23383@jama>
	<1258379748.16625.8.camel@dax.rpnet.com>
	<20091117085518.GF23383@jama>
	<20091117101802.GA26627@mrdenker.localdomain>
MIME-Version: 1.0
In-Reply-To: <20091117101802.GA26627@mrdenker.localdomain>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.218.217
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Tue, 17 Nov 2009 15:13:38 -0000
X-Groupsio-MsgNum: 14387
Content-Type: multipart/mixed; boundary="2Z2K0IlrPCVsbNpk"
Content-Disposition: inline

--2Z2K0IlrPCVsbNpk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Nov 17, 2009 at 11:18:02AM +0100, mok@mnet-online.de wrote:
> On Tue, 17 Nov 2009, Martin Jansa wrote:
> 
> > BTW: SRCPV seems to be expanded in PV a bit sooner than SRCREV was,
> > which with combination with BB_GIT_CLONE_FOR_SRCREV means that all git
> > repositories are checked during recipe parsing (Klaus Kurzmann has a
> > list of git repositories used in OE recipes which are not accessible)

Hopefully resolved with this bitbake patch

-- 
uin:136542059                jid:Martin.Jansa@gmail.com
Jansa Martin                 sip:jamasip@voip.wengo.fr 
JaMa                         

--2Z2K0IlrPCVsbNpk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="0002-BB_GIT_CLONE_FOR_SRCREV-using-only-_sortable_buildnu.patch"

From 6956d60446de01af655eb992cbe31d02c8bb2a21 Mon Sep 17 00:00:00 2001
From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 17 Nov 2009 15:44:43 +0100
Subject: [PATCH 2/2] BB_GIT_CLONE_FOR_SRCREV using only _sortable_buildnumber() for known revision

---
 lib/bb/fetch/__init__.py |   15 +++++++--------
 lib/bb/fetch/git.py      |   32 ++++++--------------------------
 2 files changed, 13 insertions(+), 34 deletions(-)

diff --git a/lib/bb/fetch/__init__.py b/lib/bb/fetch/__init__.py
index 9508908..db3eb40 100644
--- a/lib/bb/fetch/__init__.py
+++ b/lib/bb/fetch/__init__.py
@@ -553,14 +553,8 @@ class Fetch(object):
         """
         
         """
-        has_want_sortable = hasattr(self, "_want_sortable_revision")
-        has_sortable = hasattr(self, "_sortable_revision")
-
-        if not has_want_sortable and has_sortable:
-            return self._sortable_revision(url, ud, d)
-        elif has_want_sortable and self._want_sortable_revision(url, ud, d) and has_sortable:
-            return self._sortable_revision(url, ud, d)
-        
+        has_want_sortable = hasattr(self, "_want_sortable_buildnumber")
+        has_sortable = hasattr(self, "_sortable_buildnumber")
 
         pd = persist_data.PersistData(d)
         key = self.generate_revision_key(url, ud, d)
@@ -577,6 +571,11 @@ class Fetch(object):
         if last_rev == latest_rev:
             return str(count + "+" + latest_rev)
 
+        if not has_want_sortable and has_sortable:
+            count = self._sortable_buildnumber(url, ud, d, latest_rev)
+        elif has_want_sortable and self._want_sortable_buildnumber(url, ud, d) and has_sortable:
+            count = self._sortable_buildnumber(url, ud, d, latest_rev)
+
         if count is None:
             count = "0"
         elif uselocalcount:
diff --git a/lib/bb/fetch/git.py b/lib/bb/fetch/git.py
index 5cdf656..b5c4c0b 100644
--- a/lib/bb/fetch/git.py
+++ b/lib/bb/fetch/git.py
@@ -146,44 +146,24 @@ class Git(Fetch):
     def _build_revision(self, url, ud, d):
         return ud.tag
 
-    def _want_sortable_revision(self, url, ud, d):
+    def _want_sortable_buildnumber(self, url, ud, d):
         return bb.data.getVar("BB_GIT_CLONE_FOR_SRCREV", d, True) or False
 
-    def _sortable_revision(self, url, ud, d):
+    def _sortable_buildnumber(self, url, ud, d, rev):
         """
         This is only called when _want_sortable_revision called true
 
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
 
-        # Check if we have the rev already
-        if not os.path.exists(repodir):
-            print "no repo"
-            self.go(None, ud, d)
-
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
-
+        sortable_buildnumber= "%s" % (output.split()[0])
+        return sortable_buildnumber
-- 
1.6.5.2


--2Z2K0IlrPCVsbNpk--
