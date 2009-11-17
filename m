Received: from mail-bw0-f217.google.com ([209.85.218.217])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1NAJrc-0008Bk-GK
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 Nov 2009 09:56:43 +0100
Received: by bwz9 with SMTP id 9so6215357bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Nov 2009 00:55:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=Iw6I5cXjENti1ZV/8z1GCf05ULbRPVTLS1eM8u+jl1k=;
	b=bs/MLWrDoLFxz12IyVvChUZ5Dne1g2smwvc2EsQsW1mpCendGSULY0M09X73v+n36T
	dfHGEjQI3CpMqYsgltTmHJ0SYNMc6MmUvJrljkWUICm+qO9/E3r11PprUOAuPK+aQqbM
	tYCh6BErNHLjQf4AuLzuY3EvXyMpg+DSY+72s=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=RcBU+ItmXttgAvqn0tXNj529x0uRAQfrDWrbxMLHJ9OMS1wiDTjdQfCOXaeobhzpdf
	+1P3FnxGTT95Boe9Wy60PeInM10VS87l/ar8jgAa0QYTOJtt/8BILV+6TbHexLlt22ed
	YczSDLqGId1zwv4h3Bvd7CEqeZ0mYSBW9liHs=
Received: by 10.204.8.145 with SMTP id h17mr507466bkh.156.1258448117516;
	Tue, 17 Nov 2009 00:55:17 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 16sm274817fxm.8.2009.11.17.00.55.14
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 17 Nov 2009 00:55:15 -0800 (PST)
Date: Tue, 17 Nov 2009 09:55:18 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20091117085518.GF23383@jama>
References: <hdr31n$8b0$1@ger.gmane.org>
	<1258364356.5799.94.camel@dax.rpnet.com>
	<hdra17$t4d$1@ger.gmane.org>
	<1258368570.5799.99.camel@dax.rpnet.com>
	<hdrb9v$1dp$1@ger.gmane.org>
	<1258371591.5799.112.camel@dax.rpnet.com>
	<hdrffa$do6$1@ger.gmane.org>
	<1258375022.16625.3.camel@dax.rpnet.com>
	<20091116134339.GC23383@jama>
	<1258379748.16625.8.camel@dax.rpnet.com>
MIME-Version: 1.0
In-Reply-To: <1258379748.16625.8.camel@dax.rpnet.com>
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
X-List-Received-Date: Tue, 17 Nov 2009 08:56:43 -0000
X-Groupsio-MsgNum: 14371
Content-Type: multipart/mixed; boundary="f2QGlHpHGjS2mn6Y"
Content-Disposition: inline

--f2QGlHpHGjS2mn6Y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 16, 2009 at 01:55:48PM +0000, Richard Purdie wrote:
> On Mon, 2009-11-16 at 14:43 +0100, Martin Jansa wrote:
> > On Mon, Nov 16, 2009 at 12:37:02PM +0000, Richard Purdie wrote:
> > > On Mon, 2009-11-16 at 13:10 +0100, Koen Kooi wrote:
> > > I think we will have to hold off some of the SRCPV migration until
> > > bitbake has some kind of lock down functionality for the local build
> > > numbers. Any volunteers to write a patch?
> > 
> > This could be enough?
> > 
> > Just putting
> > BB_GIT_LOCALCOUNT_FOR_SRCREV = "0"
> > somewhere (local.conf/distro.conf) and _count will always stay on 0
> > (gitr0+abc1234def)
> 
> No, we need to be able to control the version and it shouldn't be git
> specific...
> 
> Cheers,
> 
> Richard

OK better version

with this you can add

LOCALCOUNT_pn-bar ?= "4"
to ie sane-srcrevs.inc

or

LOCALCOUNT ?= "4" to 
recipes/foo/bar_git.bb

(btw seems like LOCALCOUNT_pn-bar has higher preferrence even if I use
"LOCALCOUNT = 4" in recipe, why?)

And it will be ignored for all distros where BB_LOCALCOUNT_OVERRIDE is
not set. 

With BB_LOCALCOUNT_OVERRIDE enabled, you can use LOCALCOUNT instead of
PR bump if you just change SRCREV, for others will be LOCALCOUNT in
SRCPV incremented by default.

If BB_GIT_CLONE_FOR_SRCREV is set than LOCALCOUNT is ALWAYS set to 
"git list-rev | wc -l" which could be considered also as consistent PV
scheme for multiple buildhosts.

BTW: SRCPV seems to be expanded in PV a bit sooner than SRCREV was,
which with combination with BB_GIT_CLONE_FOR_SRCREV means that all git
repositories are checked during recipe parsing (Klaus Kurzmann has a
list of git repositories used in OE recipes which are not accessible)

-- 
uin:136542059                jid:Martin.Jansa@gmail.com
Jansa Martin                 sip:jamasip@voip.wengo.fr 
JaMa                         

--f2QGlHpHGjS2mn6Y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="0001-Optional-LOCALCOUNT-for-recipe.patch"

From dcb8732640c031ab86150deb4933f1a87501c78b Mon Sep 17 00:00:00 2001
From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 17 Nov 2009 08:24:52 +0100
Subject: [PATCH 1/2] Optional LOCALCOUNT for recipe

* Instead of autoincrement from persistent cache when srcrev is changed.
* Should be used by distributions with multiple builders, where consistent
  PV is needed.
* Can be used instead of PR bump in PVs like this "0.0+${PR}+gitr${SRCPV}"
---
 lib/bb/fetch/__init__.py |   36 +++++++++++++++++++++++++++++++-----
 1 files changed, 31 insertions(+), 5 deletions(-)

diff --git a/lib/bb/fetch/__init__.py b/lib/bb/fetch/__init__.py
index 8c0d7ea..3b527e2 100644
--- a/lib/bb/fetch/__init__.py
+++ b/lib/bb/fetch/__init__.py
@@ -448,6 +448,27 @@ class Fetch(object):
 
     srcrev_internal_helper = staticmethod(srcrev_internal_helper)
 
+    def localcount_internal_helper(ud, d):
+        """
+        Return:
+            a) a locked localcount if specified
+	    b) None otherwise
+        """
+
+        localcount= None
+        if 'name' in ud.parm:
+            pn = data.getVar("PN", d, 1)
+            localcount = data.getVar("LOCALCOUNT_pn-" + pn + "_" + ud.parm['name'], d, 1)
+        if not localcount:
+            localcount = data.getVar("LOCALCOUNT", d, 1)
+        if localcount == "INVALID":
+            raise InvalidSRCREV("Please set LOCALCOUNT to a valid value")
+        if not localcount:
+            return None
+        return localcount
+
+    localcount_internal_helper = staticmethod(localcount_internal_helper)
+
     def try_mirror(d, tarfn):
         """
         Try to use a mirrored version of the sources. We do this
@@ -550,15 +571,20 @@ class Fetch(object):
 
         latest_rev = self._build_revision(url, ud, d)
         last_rev = pd.getValue("BB_URI_LOCALCOUNT", key + "_rev")
-        count = pd.getValue("BB_URI_LOCALCOUNT", key + "_count")
+        localcount = Fetch.localcount_internal_helper(ud, d)
+        if localcount is None:
+            count = pd.getValue("BB_URI_LOCALCOUNT", key + "_count")
+        else:
+            count = localcount
 
         if last_rev == latest_rev:
             return str(count + "+" + latest_rev)
 
-        if count is None:
-            count = "0"
-        else:
-            count = str(int(count) + 1)
+        if localcount is None:
+            if count is None:
+                count = "0"
+            else:
+                count = str(int(count) + 1)
 
         pd.setValue("BB_URI_LOCALCOUNT", key + "_rev", latest_rev)
         pd.setValue("BB_URI_LOCALCOUNT", key + "_count", count)
-- 
1.6.5.2


--f2QGlHpHGjS2mn6Y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="0002-BB_LOCALCOUNT_OVERRIDE-to-enable-setting-LOCALCOUNT-.patch"

From 1b010656ae8a77a6a5ce12d8ef7ec2a8ef628704 Mon Sep 17 00:00:00 2001
From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 17 Nov 2009 09:11:57 +0100
Subject: [PATCH 2/2] BB_LOCALCOUNT_OVERRIDE to enable setting LOCALCOUNT for recipe

* This way LOCALCOUNTs can be specified directly in recipes instead of
  separated distro config (as not all want to use them). And will be
  used only when BB_LOCALCOUNT_OVERRIDE set in distro config.
---
 lib/bb/fetch/__init__.py |    8 +++++++-
 1 files changed, 7 insertions(+), 1 deletions(-)

diff --git a/lib/bb/fetch/__init__.py b/lib/bb/fetch/__init__.py
index 3b527e2..9e50de6 100644
--- a/lib/bb/fetch/__init__.py
+++ b/lib/bb/fetch/__init__.py
@@ -183,6 +183,9 @@ def checkstatus(d):
         if not ret:
             bb.msg.fatal(bb.msg.domain.Fetcher, "URL %s doesn't work" % u)
 
+def want_localcount_override(d):
+    return bb.data.getVar("BB_LOCALCOUNT_OVERRIDE", d, True) or False
+
 def localpaths(d):
     """
     Return a list of the local filenames, assuming successful fetch
@@ -571,7 +574,10 @@ class Fetch(object):
 
         latest_rev = self._build_revision(url, ud, d)
         last_rev = pd.getValue("BB_URI_LOCALCOUNT", key + "_rev")
-        localcount = Fetch.localcount_internal_helper(ud, d)
+        localcount = None
+        if want_localcount_override(d):
+            bb.msg.error(1, 'LOCALCOUNT override enabled')
+            localcount = Fetch.localcount_internal_helper(ud, d)
         if localcount is None:
             count = pd.getValue("BB_URI_LOCALCOUNT", key + "_count")
         else:
-- 
1.6.5.2


--f2QGlHpHGjS2mn6Y--
