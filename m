Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1NxVTK-0007hS-3P
	for openembedded-devel@lists.openembedded.org;
	Fri, 02 Apr 2010 03:15:05 +0200
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1NxVQ7-0000RR-TE from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 Apr 2010 18:11:35 -0700
Received: from NA1-MAIL.mgc.mentorg.com ([147.34.98.181]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Thu, 1 Apr 2010 18:11:35 -0700
Received: from 172.30.80.132 ([172.30.80.132]) by NA1-MAIL.mgc.mentorg.com
	([147.34.98.181]) with Microsoft Exchange Server HTTP-DAV ; 
	Fri,  2 Apr 2010 01:11:02 +0000
Received: from trini-m4400 by na1-mail.mgc.mentorg.com;
	01 Apr 2010 18:10:59 -0700
From: Tom Rini <tom_rini@mentor.com>
To: oe-devel <openembedded-devel@lists.openembedded.org>
Organization: Mentor Graphics Corporation
Date: Thu, 01 Apr 2010 18:10:58 -0700
Message-ID: <1270170658.7652.0.camel@trini-m4400>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-OriginalArrivalTime: 02 Apr 2010 01:11:35.0682 (UTC)
	FILETIME=[70724E20:01CAD201]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] Switch insane.bbclass to endswith() and fix la/pc check
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
X-List-Received-Date: Fri, 02 Apr 2010 01:15:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This changes insane.bbclass to use s.endswith("str") rather than s[-3:]
=3D=3D "str".  The primary motivation for this is that we have tests that
check for 'la' and 'pc' files when we really want '.la' and '.pc' to be
what we check for.  Also, our -dev symlink test does if test1:  if test2
and test3: action, when it could just be if test1 and test2 and test3.

Signed-off-by: Tom Rini <tom_rini@mentor.com>

diff --git a/classes/insane.bbclass b/classes/insane.bbclass
index c2e8d9c..c85703e 100644
--- a/classes/insane.bbclass
+++ b/classes/insane.bbclass
@@ -263,11 +263,10 @@ def package_qa_check_dev(path, name,d, elf):
         if bb.data.inherits_class(s, d):
             return True
=20
-    if not "-dev" in name:
-        if path[-3:] =3D=3D ".so" and os.path.islink(path):
-            error_msg =3D "non -dev package contains symlink .so: %s path
'%s'" % \
-                     (name, package_qa_clean_path(path,d))
-            sane =3D package_qa_handle_error(0, error_msg, name, path, d)
+    if not name.endswith("-dev") and path.endswith(".so") and
os.path.islink(path):
+        error_msg =3D "non -dev package contains symlink .so: %s path '%
s'" % \
+                 (name, package_qa_clean_path(path,d))
+        sane =3D package_qa_handle_error(0, error_msg, name, path, d)
=20
     return sane
=20
@@ -412,7 +411,7 @@ def package_qa_check_staged(path,d):
     for root, dirs, files in os.walk(path):
         for file in files:
             path =3D os.path.join(root,file)
-            if file[-2:] =3D=3D "la":
+            if file.endswith(".la"):
                 file_content =3D open(path).read()
                 # Don't check installed status for native/cross
packages
                 if not iscrossnative:
@@ -422,7 +421,7 @@ def package_qa_check_staged(path,d):
                 if workdir in file_content:
                     error_msg =3D "%s failed sanity test (workdir) in
path %s" % (file,root)
                     sane =3D package_qa_handle_error(8, error_msg,
"staging", path, d)
-            elif file[-2:] =3D=3D "pc":
+            elif file.endswith(".pc"):
                 file_content =3D open(path).read()
                 if pkgconfigcheck in file_content:
                     error_msg =3D "%s failed sanity test (tmpdir) in path
%s" % (file,root)


--=20
Tom Rini <tom_rini@mentor.com>
Mentor Graphics Corporation



