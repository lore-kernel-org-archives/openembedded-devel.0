Received: from mail-fx0-f220.google.com ([209.85.220.220])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1Nzs1j-0003MY-9G
	for openembedded-devel@lists.openembedded.org;
	Thu, 08 Apr 2010 15:44:12 +0200
Received: by fxm20 with SMTP id 20so1932987fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 08 Apr 2010 06:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=FOvQeh5WNXrF3PrXoQeVpy5+xkE25O9EApsixMAnwm8=;
	b=Fqp7AnDVyjFybzl2OCQaRWCyQa0h55Fs4RTo2s0SunSGZXR0Do38bWAGPxsj+uVd7I
	oCY3h4CzWtTWjKRKFtoo5m/7cnho74jTpsMrJWAhYQwW4DC0mhPyvhDFG1CPB+m0IrpL
	+VpYDM01UVA6g37nktU8eXRkytMsADCm1nMww=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=JlCMiUoJy/Ego7LUpzmm8fFHAHHEABnzONx2B/a4ZqsS5OF+SVhG1oEBVOzXuRuI3b
	9X3AqgApUYg5qSSBsBo/iGq8hYUDNj8/TYD6cLSVQ1r5RFJW040J1FyEK0dkaaVzregj
	aeKPffvAvCXFiC9JqcMTh+DFewHIij2OompwQ=
Received: by 10.87.58.6 with SMTP id l6mr435835fgk.15.1270734048571;
	Thu, 08 Apr 2010 06:40:48 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 14sm63056fxm.9.2010.04.08.06.40.47
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 08 Apr 2010 06:40:48 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  8 Apr 2010 15:40:47 +0200
Message-Id: <1270734047-11286-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.0.4
X-SA-Exim-Connect-IP: 209.85.220.220
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [RFC] [PATCH] utils.bbclass: simplify checksum check, prepare for checksums.ini removal
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
X-List-Received-Date: Thu, 08 Apr 2010 13:44:12 -0000

* only RFC, because it needs more testing and bb.note for every checksum
  only in checksums.ini is maybe too much (but I'm ready to move all
  checksums in some semi-automated way).
* unify OE_STRICT_CHECKSUMS and OE_ALLOW_INSECURE_DOWNLOADS, one option
  for insane people should be enough, when the later is enabled, don't
  raise Exception even for missing md5sum/oe_sha256sum command or
  different checksums
* show note, when there are checksums only in checksums.ini (prepare for
  script for moving all to recipes)
* parse checksums.ini only when there is no checksum in recipe (could be
  faster, but for more checked items in SRC_URI it is parsed repeatedly)
* if one checksum doesn't match then count and show both (md5 as well as
  sha256) - usefull for copy&paste checksums for new recipe.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 classes/base.bbclass  |   20 +-----
 classes/utils.bbclass |  189 ++++++++++++++++++++++---------------------------
 2 files changed, 86 insertions(+), 123 deletions(-)

diff --git a/classes/base.bbclass b/classes/base.bbclass
index e865738..28cd4a6 100644
--- a/classes/base.bbclass
+++ b/classes/base.bbclass
@@ -112,24 +112,6 @@ python base_do_fetch() {
 		raise bb.build.FuncFailed("Unknown fetch Error: %s" % value)
 
 
-	# Verify the SHA and MD5 sums we have in OE and check what do
-	# in
-	checksum_paths = bb.data.getVar('BBPATH', d, True).split(":")
-
-	# reverse the list to give precedence to directories that
-	# appear first in BBPATH
-	checksum_paths.reverse()
-
-	checksum_files = ["%s/conf/checksums.ini" % path for path in checksum_paths]
-	try:
-		parser = base_chk_load_parser(checksum_files)
-	except ValueError:
-		bb.note("No conf/checksums.ini found, not checking checksums")
-		return
-	except:
-		bb.note("Creating the CheckSum parser failed: %s:%s" % (sys.exc_info()[0], sys.exc_info()[1]))
-		return
-
 	pv = bb.data.getVar('PV', d, True)
 	pn = bb.data.getVar('PN', d, True)
 
@@ -146,7 +128,7 @@ python base_do_fetch() {
 				if not "name" in params and first_uri:
 					first_uri = False
 					params["name"] = ""
-				if not (base_chk_file_vars(parser, localpath, params, d) or base_chk_file(parser, pn, pv,uri, localpath, d)):
+				if not base_chk_file(pn, pv, uri, localpath, params, d):
 					if not bb.data.getVar("OE_ALLOW_INSECURE_DOWNLOADS", d, True):
 						bb.fatal("%s-%s: %s has no checksum defined, cannot check archive integrity" % (pn,pv,uri))
 					else:
diff --git a/classes/utils.bbclass b/classes/utils.bbclass
index 6ff11dd..4b97eca 100644
--- a/classes/utils.bbclass
+++ b/classes/utils.bbclass
@@ -84,106 +84,34 @@ def base_chk_load_parser(config_paths):
 
     return parser
 
-def base_chk_file_vars(parser, localpath, params, data):
-    try:
-        name = params["name"]
-    except KeyError:
-        return False
-    if name:
-        md5flag = "%s.md5sum" % name
-        sha256flag = "%s.sha256sum" % name
-    else:
-        md5flag = "md5sum"
-        sha256flag = "sha256sum"
-    want_md5sum = bb.data.getVarFlag("SRC_URI", md5flag, data)
-    want_sha256sum = bb.data.getVarFlag("SRC_URI", sha256flag, data)
-
-    if (want_sha256sum == None and want_md5sum == None):
-        # no checksums to check, nothing to do
-        return False
-
+def base_chk_file_checksum(localpath, expected_md5sum, expected_sha256sum, data):
+    strict_checking =  bb.data.getVar("OE_ALLOW_INSECURE_DOWNLOADS", data, True)
     if not os.path.exists(localpath):
         localpath = base_path_out(localpath, data)
         bb.note("The localpath does not exist '%s'" % localpath)
         raise Exception("The path does not exist '%s'" % localpath)
 
-    if want_md5sum:
-        try:
-	    md5pipe = os.popen('PATH=%s md5sum "%s"' % (bb.data.getVar('PATH', data, True), localpath))
-            md5data = (md5pipe.readline().split() or [ "" ])[0]
-            md5pipe.close()
-        except OSError, e:
-            raise Exception("Executing md5sum failed")
-        if want_md5sum != md5data:
-            bb.note("The MD5Sums did not match. Wanted: '%s' and Got: '%s'" % (want_md5sum, md5data))
-            raise Exception("MD5 Sums do not match. Wanted: '%s' Got: '%s'" % (want_md5sum, md5data))
-
-    if want_sha256sum:
-        try:
-            shapipe = os.popen('PATH=%s oe_sha256sum "%s"' % (bb.data.getVar('PATH', data, True), localpath))
-            sha256data = (shapipe.readline().split() or [ "" ])[0]
-            shapipe.close()
-        except OSError, e:
-            raise Exception("Executing shasum failed")
-        if want_sha256sum != sha256data:
-            bb.note("The SHA256Sums did not match. Wanted: '%s' and Got: '%s'" % (want_sha256sum, sha256data))
-            raise Exception("SHA256 Sums do not match. Wanted: '%s' Got: '%s'" % (want_sha256sum, sha256data))
-
-    return True
-
-
-def base_chk_file(parser, pn, pv, src_uri, localpath, data):
-    no_checksum = False
-    # Try PN-PV-SRC_URI first and then try PN-SRC_URI
-    # we rely on the get method to create errors
-    pn_pv_src = "%s-%s-%s" % (pn,pv,src_uri)
-    pn_src    = "%s-%s" % (pn,src_uri)
-    if parser.has_section(pn_pv_src):
-        md5    = parser.get(pn_pv_src, "md5")
-        sha256 = parser.get(pn_pv_src, "sha256")
-    elif parser.has_section(pn_src):
-        md5    = parser.get(pn_src, "md5")
-        sha256 = parser.get(pn_src, "sha256")
-    elif parser.has_section(src_uri):
-        md5    = parser.get(src_uri, "md5")
-        sha256 = parser.get(src_uri, "sha256")
-    else:
-        no_checksum = True
-
-    # md5 and sha256 should be valid now
-    if not os.path.exists(localpath):
-        localpath = base_path_out(localpath, data)
-        bb.note("The localpath does not exist '%s'" % localpath)
-        raise Exception("The path does not exist '%s'" % localpath)
-
-
-    # call md5(sum) and shasum
     try:
-	md5pipe = os.popen('PATH=%s md5sum "%s"' % (bb.data.getVar('PATH', data, True), localpath))
+        md5pipe = os.popen('PATH=%s md5sum "%s"' % (bb.data.getVar('PATH', data, True), localpath))
         md5data = (md5pipe.readline().split() or [ "" ])[0]
         md5pipe.close()
-    except OSError:
-        raise Exception("Executing md5sum failed")
+    except OSError, e:
+        if strict_checking:
+            raise Exception("Executing md5sum failed")
+        else:
+            bb.note("Executing md5sum failed")
 
     try:
         shapipe = os.popen('PATH=%s oe_sha256sum "%s"' % (bb.data.getVar('PATH', data, True), localpath))
-        shadata = (shapipe.readline().split() or [ "" ])[0]
+        sha256data = (shapipe.readline().split() or [ "" ])[0]
         shapipe.close()
-    except OSError:
-        raise Exception("Executing shasum failed")
-
-    if no_checksum == True:	# we do not have conf/checksums.ini entry
-        try:
-            file = open("%s/checksums.ini" % bb.data.getVar("TMPDIR", data, 1), "a")
-        except:
-            return False
-
-        if not file:
-            raise Exception("Creating checksums.ini failed")
-        
-        file.write("[%s]\nmd5=%s\nsha256=%s\n\n" % (src_uri, md5data, shadata))
-        file.close()
+    except OSError, e:
+        if strict_checking:
+            raise Exception("Executing shasum failed")
+        else:
+            bb.note("Executing shasum failed")
 
+    if (expected_md5sum == None or expected_md5sum == None):
         from string import maketrans
         trtable = maketrans("", "")
         uname = src_uri.split("/")[-1].translate(trtable, "-+._")
@@ -196,29 +124,82 @@ def base_chk_file(parser, pn, pv, src_uri, localpath, data):
         if not ufile:
             raise Exception("Creating %s.sum failed" % uname)
 
-        ufile.write("SRC_URI = \"%s;name=%s\"\nSRC_URI[%s.md5sum] = \"%s\"\nSRC_URI[%s.sha256sum] = \"%s\"\n" % (src_uri, uname, uname, md5data, uname, shadata))
+        ufile.wrote("SRC_URI = \"%s;name=archive\"\nSRC_URI[archive.md5sum] = \"%s\"\nSRC_URI[archive.sha256sum] = \"%s\"\n" % (src_uri, md5data, sha256data))
         ufile.close()
+        bb.note("This package has no checksums, please add to recipe")
+        bb.note("SRC_URI = \"%s;name=archive\"\nSRC_URI[archive.md5sum] = \"%s\"\nSRC_URI[archive.sha256sum] = \"%s\"\n" % (src_uri, md5data, sha256data))
 
-        if not bb.data.getVar("OE_STRICT_CHECKSUMS",data, True):
-            bb.note("This package has no entry in checksums.ini, please add one")
-            bb.note("\n[%s]\nmd5=%s\nsha256=%s" % (src_uri, md5data, shadata))
-            bb.note("This package has no checksums in corresponding recipe, please add")
-            bb.note("SRC_URI = \"%s;name=%s\"\nSRC_URI[%s.md5sum] = \"%s\"\nSRC_URI[%s.sha256sum] = \"%s\"\n" % (src_uri, uname, uname, md5data, uname, shadata))
-            return True
-        else:
-            bb.note("Missing checksum")
-            return False
-
-    if not md5 == md5data:
-        bb.note("The MD5Sums did not match. Wanted: '%s' and Got: '%s'" % (md5,md5data))
-        raise Exception("MD5 Sums do not match. Wanted: '%s' Got: '%s'" % (md5, md5data))
+        # fail for strict, continue for disabled strict checksums
+        return not strict_checking
 
-    if not sha256 == shadata:
-        bb.note("The SHA256 Sums do not match. Wanted: '%s' Got: '%s'" % (sha256,shadata))
-        raise Exception("SHA256 Sums do not match. Wanted: '%s' Got: '%s'" % (sha256, shadata))
+    if (expected_md5sum and expected_md5sum != md5data) or (expected_sha256sum and expected_sha256sum != sha256data):
+        bb.note("The checksums did not match.\nExpected MD5: '%s' and Got: '%s'\nExpected SHA256: '%s' and Got: '%s'" % (expected_md5sum, md5data, expected_sha256sum, sha256data))
+        bb.note("SRC_URI = \"%s;name=archive\"\nSRC_URI[archive.md5sum] = \"%s\"\nSRC_URI[archive.sha256sum] = \"%s\"\n" % (src_uri, expected_md5sum, expected_sha256sum))
+	return False
 
     return True
 
+def base_get_checksums(pn, pv, src_uri, localpath, params, data):
+    # Try checksum from recipe and then parse checksums.ini 
+    # and try PN-PV-SRC_URI first and then try PN-SRC_URI
+    # we rely on the get method to create errors
+    try:
+        name = params["name"]
+    except KeyError:
+        return False
+    if name:
+        md5flag = "%s.md5sum" % name
+        sha256flag = "%s.sha256sum" % name
+    else:
+        md5flag = "md5sum"
+        sha256flag = "sha256sum"
+    expected_md5sum = bb.data.getVarFlag("SRC_URI", md5flag, data)
+    expected_sha256sum = bb.data.getVarFlag("SRC_URI", sha256flag, data)
+
+    if (expected_md5sum and expected_sha256sum):
+        return (expected_md5sum,expected_sha256sum)
+    else:
+        # missing checksum, parse checksums.ini
+
+        # Verify the SHA and MD5 sums we have in OE and check what do
+        # in
+        checksum_paths = bb.data.getVar('BBPATH', data, True).split(":")
+
+        # reverse the list to give precedence to directories that
+        # appear first in BBPATH
+        checksum_paths.reverse()
+
+        checksum_files = ["%s/conf/checksums.ini" % path for path in checksum_paths]
+        try:
+            parser = base_chk_load_parser(checksum_files)
+        except ValueError:
+            bb.note("No conf/checksums.ini found, not checking checksums")
+            return (None,None)
+        except:
+            bb.note("Creating the CheckSum parser failed: %s:%s" % (sys.exc_info()[0], sys.exc_info()[1]))
+            return (None,None)
+        pn_pv_src = "%s-%s-%s" % (pn,pv,src_uri)
+        pn_src    = "%s-%s" % (pn,src_uri)
+        if parser.has_section(pn_pv_src):
+            expected_md5sum    = parser.get(pn_pv_src, "md5")
+            expected_sha256sum = parser.get(pn_pv_src, "sha256")
+        elif parser.has_section(pn_src):
+            expected_md5sum    = parser.get(pn_src, "md5")
+            expected_sha256sum = parser.get(pn_src, "sha256")
+        elif parser.has_section(src_uri):
+            expected_md5sum    = parser.get(src_uri, "md5")
+            expected_sha256sum = parser.get(src_uri, "sha256")
+        else:
+            return (None,None)
+        
+        bb.note("This package has no checksums in corresponding recipe, please consider moving its checksums from checksums.ini file \
+            \nSRC_URI = \"%s;name=archive\"\nSRC_URI[archive.md5sum] = \"%s\"\nSRC_URI[archive.sha256sum] = \"%s\"\n" % (src_uri, expected_md5sum, expected_sha256sum))
+        return (expected_md5sum, expected_sha256sum)
+
+def base_chk_file(pn, pv, src_uri, localpath, params, data):
+    (expected_md5sum, expected_sha256sum) = base_get_checksums(pn, pv, src_uri, localpath, params, data)
+    return base_chk_file_checksum(localpath, expected_md5sum, expected_sha256sum, data)
+
 def base_read_file(filename):
 	try:
 		f = file( filename, "r" )
-- 
1.7.0.4



