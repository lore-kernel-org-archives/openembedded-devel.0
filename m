Received: from [74.125.92.145] (helo=qw-out-1920.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mario.goulart@gmail.com>) id 1LfLE1-00030d-97
	for openembedded-devel@lists.openembedded.org;
	Thu, 05 Mar 2009 22:35:29 +0100
Received: by qw-out-1920.google.com with SMTP id 5so114376qwf.36
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Mar 2009 13:31:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:sender:from:to:cc:subject
	:references:date:in-reply-to:message-id:user-agent:mime-version
	:content-type; bh=13ladPXjg0hoCX2fNwmbzAa7VJVXPAI+uvvfAV+4e10=;
	b=ld1hGzxAvCs+cQo4vO4oUYpstkzQxmnsP4BGVRFRcxXp7gtHT3wIW04naIsDr4tK4V
	aAnvmud9ott1Iptpk8XmGDdvasu5HahADgd8Z+o6FnuctpFrtUZBQK7vSTFekwugD7KH
	dFZXiBiCfgNnmIwxtAbKUgeKCPLr9mvgx02Yo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
	:user-agent:mime-version:content-type;
	b=AVi7hBnme6IDExqOqr3sk7/gkHecgOGwauTrkfCXtW4f5m3duEuMZi40MASb2GRYrA
	qR69RsVcTIUTRPfDXuEYDE4mmRYVn80DXXwBQd3tNLXP8xQ5x9iqk2t1PqMhVthWSBVt
	T2RLTebkiUYPDOjQoLPMU4o7jGci1SqhCUXDU=
Received: by 10.224.80.202 with SMTP id u10mr2614552qak.355.1236288666172;
	Thu, 05 Mar 2009 13:31:06 -0800 (PST)
Received: from nachos.gmail.com (189.27.133.159.dynamic.adsl.gvt.net.br
	[189.27.133.159])
	by mx.google.com with ESMTPS id 6sm404975qwd.23.2009.03.05.13.31.04
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 05 Mar 2009 13:31:05 -0800 (PST)
Sender: Mario Domenech Goulart <mario.goulart@gmail.com>
From: Mario Domenech Goulart <mario@ossystems.com.br>
To: Otavio Salvador <otavio@ossystems.com.br>
References: <87iqmp5f58.fsf@neumann.lab.ossystems.com.br>
	<87eixc40oz.fsf@ucpel.tche.br>
	<87skls2ihj.fsf@neumann.lab.ossystems.com.br>
Date: Thu, 05 Mar 2009 18:31:05 -0300
In-Reply-To: <87skls2ihj.fsf@neumann.lab.ossystems.com.br> (Otavio Salvador's
	message of "Thu, 05 Mar 2009 10:43:04 -0300")
Message-ID: <87sklr3bdy.fsf@ossystems.com.br>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/23.0.60 (gnu/linux)
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Thu, 05 Mar 2009 21:35:29 -0000
Content-Type: multipart/mixed; boundary="=-=-="

--=-=-=

On Thu, 05 Mar 2009 10:43:04 -0300 Otavio Salvador <otavio@ossystems.com.br> wrote:

> Mario Domenech Goulart <mario@ossystems.com.br> writes:
>
>> Index: lib/bb/fetch/git.py
>> ===================================================================
>> --- lib/bb/fetch/git.py	(revision 1152)
>> +++ lib/bb/fetch/git.py	(working copy)
>> @@ -42,11 +42,12 @@
>>              ud.proto = ud.parm['protocol']
>>  
>>          ud.branch = ud.parm.get("branch", "master")
>> +        ud.tag = None
>>  
>>          tag = Fetch.srcrev_internal_helper(ud, d)
>>          if tag is True:
>>              ud.tag = self.latest_revision(url, ud, d)	
>> -        elif tag:
>> +        elif tag and tag != "1":
>>              ud.tag = tag
>>  
>>          if not ud.tag or ud.tag == "master":
>
> [...]
>
> Please drop this hook since it is our internal workaround for the lack
> of the AUTOREV in our recipes.

Sure.  Attached is the new patch.

Best wishes.
Mario


--=-=-=
Content-Type: text/x-diff
Content-Disposition: inline; filename=describe-revision2.diff

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
@@ -253,6 +255,25 @@
 
     return format
 
+def describe_revision(d):
+    """ 
+    Return the output of 'git describe' or 'NO_REV_DESCR' in case no
+    tag is found.
+    """
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
@@ -141,6 +141,16 @@
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
@@ -162,15 +172,8 @@
 
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
 
@@ -179,3 +182,23 @@
         return sortable_revision
         
 
+    def describe_revision(self, url, ud, d):
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
