Received: from [209.85.132.243] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mario.goulart@gmail.com>) id 1LfCgz-0005WI-52
	for openembedded-devel@lists.openembedded.org;
	Thu, 05 Mar 2009 13:28:51 +0100
Received: by an-out-0708.google.com with SMTP id d40so4485095and.42
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Mar 2009 04:24:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:sender:from:to:cc:subject
	:in-reply-to:date:lines:references:user-agent:message-id
	:mime-version:content-type;
	bh=2sjjaHATK2XPG1jyTUs17XQXEZ9S/mHQSCjWk9cdqlk=;
	b=Ch+DJFFZ0P4gIHR/+odc7oGjUjDZkKTW1EpW9XEd/Q8h97z8ELjtL96YFmkN/0WONz
	+fogSqBcpIXrK1jEqhV8jXy9MDf6llqbpB/gcQ3ZAIq9Ybk+3AXCmyqj7ZBVZWU0siNM
	zKSOLLmBL7c9hqa4ZNbie56gjDxRLeaVWlHFU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:in-reply-to:date:lines:references
	:user-agent:message-id:mime-version:content-type;
	b=fv3oqYGqi67EWpcIkoRhLqSFGjtAn0JtCemh1aEUhvaNWhpiMPEZmql0o1SjaDsPff
	POHJkxCa1Lg3DrbhJlqIIpZlptiEZsaFgd4ZPx+g0BT6j6cO32KLe6wkXKKrcj9bAjKB
	jZFvOhVwKqOQAB6wy3CnUPElqXj8Dr81ZkC7g=
Received: by 10.100.9.19 with SMTP id 19mr843047ani.8.1236255869422;
	Thu, 05 Mar 2009 04:24:29 -0800 (PST)
Received: from nachos.gmail.com (189.27.128.49.dynamic.adsl.gvt.net.br
	[189.27.128.49])
	by mx.google.com with ESMTPS id b7sm2917257ana.19.2009.03.05.04.24.27
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 05 Mar 2009 04:24:28 -0800 (PST)
Sender: Mario Domenech Goulart <mario.goulart@gmail.com>
From: Mario Domenech Goulart <mario@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <87iqmp5f58.fsf@neumann.lab.ossystems.com.br> (Otavio Salvador's
	message of "Fri, 13 Feb 2009 00:32:21 -0200")
Date: Wed, 04 Mar 2009 15:34:57 -0300
References: <87iqmp5f58.fsf@neumann.lab.ossystems.com.br>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/23.0.60 (gnu/linux)
Message-ID: <87eixc40oz.fsf@ucpel.tche.br>
MIME-Version: 1.0
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [RFH] Support for automatic package versining using git describe
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
X-List-Received-Date: Thu, 05 Mar 2009 12:28:52 -0000
Content-Type: multipart/mixed; boundary="=-=-="

--=-=-=

Hi

On Fri, 13 Feb 2009 00:32:21 -0200 Otavio Salvador <otavio@ossystems.com.br> wrote:

> One of nice features we've been using is the git-describe to get
> versions based on tags; many projects are using it to name the
> development releases and it does give a better view of how diverged it
> from last released version.
>
> So we're looking for a way to use it to generate the PV based on
> that. The current git fetcher already has the required support to get
> tags, so we can use it as SRCREV, but not yet to use git-describe.

Attached is an attempt to implement this idea.  One could use
bb.fetch.describe_revision for, say, AUTOPV generation, like
bb.fetch.get_srcrev is used for AUTOREV.

Example (from bitbake.conf):

  AUTOREV = "${@bb.fetch.get_srcrev(d)}"
  AUTOPV = "${@bb.fetch.describe_revision(d)}"

It would be nice if somebody could review the attached patch, since I
don't know much about bitbake internals.

P.S.: sorry if this message is messing up threading in your email client.
I'm replying to a fake original message, since I don't have the original
one.

Best wishes.
Mario


--=-=-=
Content-Type: text/x-diff
Content-Disposition: inline; filename=describe-revision.diff

Index: lib/bb/fetch/__init__.py
===================================================================
--- lib/bb/fetch/__init__.py	(revision 1152)
+++ lib/bb/fetch/__init__.py	(working copy)
@@ -196,6 +196,20 @@
 
 srcrev_internal_call = False
 
+def get_scms(d, urldata, rev_support_only = True):
+    scms = []
+    for u in urldata:
+        ud = urldata[u]
+        if rev_support_only or ud.method.suppports_srcrev():
+            if not ud.setup:
+                ud.setup_localpath(d)
+            scms.append(u)
+
+    if len(scms) == 0:
+        bb.msg.error(bb.msg.domain.Fetcher, "SRCREV was used yet no valid SCM was found in SRC_URI")
+
+    return scms
+
 def get_srcrev(d):
     """
     Return the version string for the current package
@@ -217,21 +231,9 @@
     if bb.fetch.srcrev_internal_call:
         return "SRCREVINACTION"
 
-    scms = []
-
-    # Only call setup_localpath on URIs which suppports_srcrev() 
     urldata = init(bb.data.getVar('SRC_URI', d, 1).split(), d, False)
-    for u in urldata:
-        ud = urldata[u]
-        if ud.method.suppports_srcrev():
-            if not ud.setup:
-                ud.setup_localpath(d)
-            scms.append(u)
+    scms = get_scms(d, urldata)
 
-    if len(scms) == 0:
-        bb.msg.error(bb.msg.domain.Fetcher, "SRCREV was used yet no valid SCM was found in SRC_URI")
-        raise ParameterError
-
     bb.data.setVar('__BB_DONT_CACHE','1', d)
 
     if len(scms) == 1:
@@ -253,6 +255,21 @@
 
     return format
 
+def describe_revision(d):
+    urldata = init(bb.data.getVar('SRC_URI', d, 1).split(), d, False)
+    bb.data.setVar('__BB_DONT_CACHE','1', d)
+    scms = get_scms(d, urldata)
+    scm = ''
+    if len(scms) == 1:
+        scm = scms[0]
+    else:
+        bb.msg.error(bb.msg.domain.Fetcher, "describe_revision does not support multiple SCMs.")
+
+    try: 
+        return urldata[scm].method.describe_revision(scm, urldata[scm], d)
+    except NoMethodError:
+        return "NO_REV_DESCR"
+
 def localpath(url, d, cache = True):
     """
     Called from the parser with cache=False since the cache isn't ready 
Index: lib/bb/fetch/git.py
===================================================================
--- lib/bb/fetch/git.py	(revision 1152)
+++ lib/bb/fetch/git.py	(working copy)
@@ -42,11 +42,12 @@
             ud.proto = ud.parm['protocol']
 
         ud.branch = ud.parm.get("branch", "master")
+        ud.tag = None
 
         tag = Fetch.srcrev_internal_helper(ud, d)
         if tag is True:
             ud.tag = self.latest_revision(url, ud, d)	
-        elif tag:
+        elif tag and tag != "1":
             ud.tag = tag
 
         if not ud.tag or ud.tag == "master":
@@ -141,6 +142,16 @@
     def _want_sortable_revision(self, url, ud, d):
         return bb.data.getVar("BB_GIT_CLONE_FOR_SRCREV", d, True) or False
 
+    def _chrepo(self, repodir, ud, d):
+        # Check if we have the rev already
+        if not os.path.exists(repodir):
+            print "no repo"
+            self.go(None, ud, d)
+
+        os.chdir(repodir)
+        if not self._contains_ref(ud.tag, d):
+            self.go(None, ud, d)
+
     def _sortable_revision(self, url, ud, d):
         """
         This is only called when _want_sortable_revision called true
@@ -162,15 +173,8 @@
 
         cwd = os.getcwd()
 
-        # Check if we have the rev already
-        if not os.path.exists(repodir):
-            print "no repo"
-            self.go(None, ud, d)
+        self._chrepo(repodir, ud, d)
 
-        os.chdir(repodir)
-        if not self._contains_ref(ud.tag, d):
-            self.go(None, ud, d)
-
         output = runfetchcmd("git rev-list %s -- 2> /dev/null | wc -l" % ud.tag, d, quiet=True)
         os.chdir(cwd)
 
@@ -179,3 +183,27 @@
         return sortable_revision
         
 
+    def describe_revision(self, url, ud, d):
+        """ 
+        Return the output of 'git describe' or 'NO_REV_DESCR' in
+        case no tag is found.
+        """
+        gitsrcname = '%s%s' % (ud.host, ud.path.replace('/', '.'))
+        repodir = os.path.join(data.expand('${GITDIR}', d), gitsrcname)
+
+        # Runtime warning on wrongly configured sources
+        if ud.tag == "1":
+            bb.msg.error(1, bb.msg.domain.Fetcher, "SRCREV is '1'. This indicates a configuration error of %s" % url)
+            return "0+1"
+
+        cwd = os.getcwd()
+
+        self._chrepo(repodir, ud, d)
+
+        rev_descr = ''
+        try:
+            rev_descr = runfetchcmd("git describe 2>/dev/null", d, quiet=True).strip()
+        except FetchError:
+            rev_descr = "NO_REV_DESCR"
+        os.chdir(cwd)
+        return rev_descr

--=-=-=--
