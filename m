Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1PJZIG-0000CJ-Lq
	for openembedded-devel@lists.openembedded.org;
	Fri, 19 Nov 2010 23:18:58 +0100
Received: by pwi8 with SMTP id 8so1172938pwi.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Nov 2010 14:17:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=DJ1mJgUcvhywFA6T4SGmBYgLglGsXIoBobhEmGUnYLo=;
	b=sfBBtxl9PmERZItQ/TleweWrVm9GdeacOSb1gzILphi5NgRgmuWLC967bsY8E8FSxv
	heRzFYqQ/K9FsdeutE/8v8WIwyLWh7btr0SPeqxxt2K5btbsEw/PK90iacOuU0liE75/
	+B1FioP/68i86lDUxEH5hMMoFZ6cgUw+/frVk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=YT82ezKBDWJ4pKbOlrkQETvNcyZg37o/JSs3zVxlfAWaEnX/ilPWgsaj+YfXE+KywL
	9bLwLVpAc6g5iaIDutopRnfxVbqW6TDjha/6dxyimQEKTH/esw6BcPpIhqpprHi9/Myo
	GL5H4A3zqtG0/kxNHnhFodKdGGzLI4EEYnu6Y=
Received: by 10.142.90.17 with SMTP id n17mr2277325wfb.280.1290205066045;
	Fri, 19 Nov 2010 14:17:46 -0800 (PST)
Received: from localhost.localdomain (ip24-251-170-95.ph.ph.cox.net
	[24.251.170.95])
	by mx.google.com with ESMTPS id p8sm2399181wff.16.2010.11.19.14.17.43
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 19 Nov 2010 14:17:44 -0800 (PST)
From: Chris Larson <kergoth@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 19 Nov 2010 15:17:38 -0700
Message-Id: <1290205058-7035-1-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 1.7.3.2.164.g6f10c
X-SA-Exim-Connect-IP: 209.85.160.47
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Chris Larson <chris_larson@mentor.com>
Subject: [PATCH] Kill some direct usages of 'print'
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
X-List-Received-Date: Fri, 19 Nov 2010 22:18:58 -0000

From: Chris Larson <chris_larson@mentor.com>

Instead, use the bitbake messaging functions, to ensure the output goes to the
bitbake UI, rather than directly to stdout.

Signed-off-by: Chris Larson <chris_larson@mentor.com>
---
 classes/base.bbclass         |    2 +-
 classes/package_ipk.bbclass  |    7 ++-----
 classes/package_tar.bbclass  |    7 ++-----
 classes/seppuku.bbclass      |   28 +++++++++++-----------------
 classes/staging.bbclass      |    1 -
 classes/tinderclient.bbclass |    9 +--------
 6 files changed, 17 insertions(+), 37 deletions(-)

diff --git a/classes/base.bbclass b/classes/base.bbclass
index 308498f..c875006 100644
--- a/classes/base.bbclass
+++ b/classes/base.bbclass
@@ -241,7 +241,7 @@ python build_summary() {
 		statusvars = bb.data.getVar("BUILDCFG_VARS", e.data, 1).split()
 		statuslines = ["%-17s = \"%s\"" % (i, bb.data.getVar(i, e.data, 1) or '') for i in statusvars]
 		statusmsg = "\n%s\n%s\n" % (bb.data.getVar("BUILDCFG_HEADER", e.data, 1), "\n".join(statuslines))
-		print statusmsg
+		bb.msg.plain(statusmsg)
 
 		needed_vars = bb.data.getVar("BUILDCFG_NEEDEDVARS", e.data, 1).split()
 		pesteruser = []
diff --git a/classes/package_ipk.bbclass b/classes/package_ipk.bbclass
index 5d388da..eac7c82 100644
--- a/classes/package_ipk.bbclass
+++ b/classes/package_ipk.bbclass
@@ -28,11 +28,8 @@ python package_ipk_install () {
 	try:
 		bb.mkdirhier(rootfs)
 		os.chdir(rootfs)
-	except OSError:
-		import sys
-		(type, value, traceback) = sys.exc_info()
-		print value
-		raise bb.build.FuncFailed
+	except OSError, exc:
+		bb.fatal("Unable to mkdir and chdir to %s: %s" % (rootfs, exc))
 
 	# Generate ipk.conf if it or the stamp doesnt exist
 	conffile = os.path.join(stagingdir,"opkg.conf")
diff --git a/classes/package_tar.bbclass b/classes/package_tar.bbclass
index 4ba69c7..ddaf775 100644
--- a/classes/package_tar.bbclass
+++ b/classes/package_tar.bbclass
@@ -16,11 +16,8 @@ python package_tar_install () {
 	try:
 		bb.mkdirhier(rootfs)
 		os.chdir(rootfs)
-	except OSError:
-		import sys
-		(type, value, traceback) = sys.exc_info()
-		print value
-		raise bb.build.FuncFailed
+	except OSError, exc:
+		bb.fatal("Unable to mkdir and chdir to %s: %s" % (rootfs, exc))
 
 	if not os.access(pkgfn, os.R_OK):
 		bb.debug(1, "%s does not exist, skipping" % pkgfn)
diff --git a/classes/seppuku.bbclass b/classes/seppuku.bbclass
index 81e7ff6..70c0ec7 100644
--- a/classes/seppuku.bbclass
+++ b/classes/seppuku.bbclass
@@ -140,11 +140,9 @@ def seppuku_find_bug_report(debug_file, opener, query, product, component, bugna
     if len(scanner.result()) == 0:
         print >> debug_file, "Scanner failed to scan the html site"
         print >> debug_file, "%(query)sproduct=%(product)s&component=%(component)s&short_desc_type=substring&short_desc=%(bugname)s" % vars()
-        #print >> debug_file, txt
         return (False,None)
     else: # silently pick the first result
         print >> debug_file, "Result of bug search is "
-        #print >> debug_file, txt
         (number,status) = scanner.result()[0]
         return (not status in ["CLOS", "RESO", "VERI"],number)
 
@@ -172,11 +170,10 @@ def seppuku_reopen_bug(poster, file, product, component, bug_number, bugname, te
     try:
         result = poster.open( uri, param )
     except urllib2.HTTPError, e:
-        print e.geturl()
-        print e.info()
+        bb.error("Unable to reopen bug at %s: %s" % (e.geturl(), e.info()))
         return False
     except Exception, e:
-        print e
+        bb.error("Unable to reopen bug: %s" % e)
         return False
 
     if result.code != 200:
@@ -211,22 +208,21 @@ def seppuku_file_bug(poster, file, product, component, bugname, text):
     try:
         result = poster.open( uri, param )
     except urllib2.HTTPError, e:
-        print e.geturl()
-        print e.info()
+        bb.error("Unable to file bug at %s: %s" % (e.geturl(), e.info()))
         return False
     except Exception, e:
-        print e
+        bb.error("Unable to file bug: %s" % e)
         return False
 
     # scan the result for a bug number
-    # it will look like 
+    # it will look like
     # '<title>Bug 2742 Submitted</title>'
     import re
     res = re.findall(("\>Bug (?P<int>\d+) Submitted"), result.read() )
     if result.code != 200 or len(res) != 1:
-        return None 
+        return None
     else:
-        return res[0] 
+        return res[0]
 
 def seppuku_create_attachment(data, debug, poster, attach_query, product, component, bug_number, text, file):
     """
@@ -255,11 +251,9 @@ def seppuku_create_attachment(data, debug, poster, attach_query, product, compon
     try:
         result = poster.open( attach_query, param )
     except urllib2.HTTPError, e:
-        print e.geturl()
-        print e.info()
+        bb.error("Unable to open %s: %s" % (e.geturl(), e.info()))
         return False
     except Exception, e:
-        print e
         print >> debug, "Got exception in poster.open( attach_query, param )"
 	print >> debug, "attach_query: %s  param: %s" % (attach_query, param )
 	return False
@@ -269,7 +263,7 @@ def seppuku_create_attachment(data, debug, poster, attach_query, product, compon
         print >> debug, "Got bad return code (%s)" % result.code
         return False
     else:
-        print >> debug, "Got good return code (200)" 
+        print >> debug, "Got good return code (200)"
         return True
 
 
@@ -339,7 +333,7 @@ python seppuku_eventhandler() {
         if name == "TaskFailed":
             bugname = "%(package)s-%(pv)s-autobuild" % { "package" : bb.data.getVar("PN", data, True),
                                                                "pv"      : bb.data.getVar("PV", data, True),
-                                                               }  
+                                                               }
             log_file = glob.glob("%s/log.%s.*" % (bb.data.getVar('T', event.data, True), event.task))
             text     = "The %s step in %s failed at %s for machine %s" % (e.task, bb.data.getVar("PN", data, True), bb.data.getVar('DATETIME', data, True), bb.data.getVar( 'MACHINE', data, True ) )
             if len(log_file) != 0:
@@ -371,7 +365,7 @@ python seppuku_eventhandler() {
                 print >> debug_file, "Failed to reopen the bug #%s" % bug_number
             else:
                 print >> debug_file, "Reopened the bug #%s" % bug_number
-        else:	
+        else:
             bug_number = seppuku_file_bug(poster, newbug, product, component, bugname, text)
             if not bug_number:
                 print >> debug_file, "Couldn't acquire a new bug_numer, filing a bugreport failed"
diff --git a/classes/staging.bbclass b/classes/staging.bbclass
index 3e7adbb..e049aad 100644
--- a/classes/staging.bbclass
+++ b/classes/staging.bbclass
@@ -14,7 +14,6 @@ def package_stagefile(file, d):
     if bb.data.getVar('PSTAGING_ACTIVE', d, True) == "1":
         destfile = file.replace(bb.data.getVar("TMPDIR", d, 1), bb.data.getVar("PSTAGE_TMPDIR_STAGE", d, 1))
         bb.mkdirhier(os.path.dirname(destfile))
-        #print "%s to %s" % (file, destfile)
         bb.copyfile(file, destfile)
 
 package_stagefile_shell() {
diff --git a/classes/tinderclient.bbclass b/classes/tinderclient.bbclass
index 7ccc1f2..16f1f52 100644
--- a/classes/tinderclient.bbclass
+++ b/classes/tinderclient.bbclass
@@ -19,11 +19,9 @@ def tinder_http_post(d, server, selector, content_type, body):
            h.endheaders()
            h.send(body)
            errcode, errmsg, headers = h.getreply()
-           #print errcode, errmsg, headers
            return (errcode,errmsg, headers, h.file)
        except Exception, e:
-           print "Error sending the report! ", e
-           # try again
+           bb.error("Unable to send the report: %s" % e)
            pass
 
     # return some garbage
@@ -120,11 +118,8 @@ def tinder_build_start(d):
 
     selector = url + "/xml/build_start.pl"
 
-    #print "selector %s and url %s" % (selector, url)
-
     # now post it
     errcode, errmsg, headers, h_file = tinder_http_post(d,server,selector,content_type, body)
-    #print errcode, errmsg, headers
     report = h_file.read()
 
     # now let us find the machine id that was assigned to us
@@ -159,8 +154,6 @@ def tinder_send_http(d, status, _log):
     while len(new_log) > 0:
         content_type, body = tinder_format_http_post(d,status,new_log[0:18000])
         errcode, errmsg, headers, h_file = tinder_http_post(d,server,selector,content_type, body)
-        #print errcode, errmsg, headers
-        #print h.file.read()
         new_log = new_log[18000:]
 
 
-- 
1.7.3.2.164.g6f10c



