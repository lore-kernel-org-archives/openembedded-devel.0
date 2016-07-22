Return-Path: <Catalin.Enache@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9AE777317F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Jul 2016 08:39:47 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u6M8dmAN008551
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Jul 2016 01:39:48 -0700 (PDT)
Received: from no3.corp.ad.wrs.com (128.224.124.137) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Fri, 22 Jul 2016 01:39:47 -0700
From: Catalin Enache <catalin.enache@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 22 Jul 2016 11:45:53 +0300
Message-ID: <1469177153-20411-1-git-send-email-catalin.enache@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] python-pygpgme: update tests
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 22 Jul 2016 08:39:47 -0000
Content-Type: text/plain

python-pygpgme tests need to be updated in order to
be compatible with GnuPG 2.1 and newer versions.

Signed-off-by: Catalin Enache <catalin.enache@windriver.com>
---
 ...001-reflect-2.1-reporting-for-key-imports.patch | 88 ++++++++++++++++++++++
 .../0002-passphrase_cb-is-deprecated.patch         | 50 ++++++++++++
 ...ric-error-when-no-passphrase-callback-pre.patch | 28 +++++++
 .../recipes-devtools/python/python-pygpgme_0.3.bb  |  3 +
 4 files changed, 169 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-pygpgme/0001-reflect-2.1-reporting-for-key-imports.patch
 create mode 100644 meta-python/recipes-devtools/python/python-pygpgme/0002-passphrase_cb-is-deprecated.patch
 create mode 100644 meta-python/recipes-devtools/python/python-pygpgme/0003-handle-generic-error-when-no-passphrase-callback-pre.patch

diff --git a/meta-python/recipes-devtools/python/python-pygpgme/0001-reflect-2.1-reporting-for-key-imports.patch b/meta-python/recipes-devtools/python/python-pygpgme/0001-reflect-2.1-reporting-for-key-imports.patch
new file mode 100644
index 0000000..b453710
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-pygpgme/0001-reflect-2.1-reporting-for-key-imports.patch
@@ -0,0 +1,88 @@
+From 1c1812def711803382cc28caea1f35fb7ef774b0 Mon Sep 17 00:00:00 2001
+From: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
+Date: Tue, 26 Jan 2016 14:24:26 -0500
+Subject: [PATCH 1/5] reflect 2.1 reporting for key imports
+
+GnuPG 2.1 changes how it reports key imports.  These changes should
+make the pygpgme test suite compatible with GnuPG 2.1.
+
+See also:
+https://lists.gnupg.org/pipermail/gnupg-devel/2016-January/030718.html
+
+Upstream-Status: Backport
+
+Signed-off-by: Catalin Enache <catalin.enache@windriver.com>
+---
+ tests/test_import.py | 22 +++++++++++-----------
+ 1 file changed, 11 insertions(+), 11 deletions(-)
+
+diff --git a/tests/test_import.py b/tests/test_import.py
+index 10eb816..597eb47 100644
+--- a/tests/test_import.py
++++ b/tests/test_import.py
+@@ -55,7 +55,7 @@ class ImportTestCase(GpgHomeTestCase):
+         ctx = gpgme.Context()
+         with self.keyfile('key1.sec') as fp:
+             result = ctx.import_(fp)
+-        self.assertEqual(result.considered, 1)
++        self.assertEqual(result.considered, 3)
+         self.assertEqual(result.no_user_id, 0)
+         self.assertEqual(result.imported, 1)
+         self.assertEqual(result.imported_rsa, 0)
+@@ -64,18 +64,18 @@ class ImportTestCase(GpgHomeTestCase):
+         self.assertEqual(result.new_sub_keys, 0)
+         self.assertEqual(result.new_signatures, 0)
+         self.assertEqual(result.new_revocations, 0)
+-        self.assertEqual(result.secret_read, 1)
+-        self.assertEqual(result.secret_imported, 1)
++        self.assertEqual(result.secret_read, 3)
++        self.assertEqual(result.secret_imported, 2)
+         self.assertEqual(result.secret_unchanged, 0)
+         self.assertEqual(result.skipped_new_keys, 0)
+         self.assertEqual(result.not_imported, 0)
+         self.assertEqual(len(result.imports), 2)
+         self.assertEqual(result.imports[0],
+                          ('E79A842DA34A1CA383F64A1546BB55F0885C65A4',
+-                          None, gpgme.IMPORT_NEW | gpgme.IMPORT_SECRET))
++                          None, gpgme.IMPORT_NEW))
+         self.assertEqual(result.imports[1],
+                          ('E79A842DA34A1CA383F64A1546BB55F0885C65A4',
+-                          None, gpgme.IMPORT_NEW))
++                          None, gpgme.IMPORT_NEW | gpgme.IMPORT_SECRET))
+         # can we get the public key?
+         key = ctx.get_key('E79A842DA34A1CA383F64A1546BB55F0885C65A4')
+         # can we get the secret key?
+@@ -102,17 +102,17 @@ class ImportTestCase(GpgHomeTestCase):
+         fp = BytesIO(b'\n'.join(keys))
+         ctx = gpgme.Context()
+         result = ctx.import_(fp)
+-        self.assertEqual(result.considered, 3)
++        self.assertEqual(result.considered, 5)
+         self.assertEqual(result.no_user_id, 0)
+         self.assertEqual(result.imported, 2)
+-        self.assertEqual(result.imported_rsa, 1)
++        self.assertEqual(result.imported_rsa, 0)
+         self.assertEqual(result.unchanged, 0)
+         self.assertEqual(result.new_user_ids, 0)
+         self.assertEqual(result.new_sub_keys, 0)
+         self.assertEqual(result.new_signatures, 1)
+         self.assertEqual(result.new_revocations, 0)
+-        self.assertEqual(result.secret_read, 1)
+-        self.assertEqual(result.secret_imported, 1)
++        self.assertEqual(result.secret_read, 3)
++        self.assertEqual(result.secret_imported, 2)
+         self.assertEqual(result.secret_unchanged, 0)
+         self.assertEqual(result.skipped_new_keys, 0)
+         self.assertEqual(result.not_imported, 0)
+@@ -122,10 +122,10 @@ class ImportTestCase(GpgHomeTestCase):
+                           None, gpgme.IMPORT_NEW))
+         self.assertEqual(result.imports[1],
+                          ('E79A842DA34A1CA383F64A1546BB55F0885C65A4',
+-                          None, gpgme.IMPORT_NEW | gpgme.IMPORT_SECRET))
++                          None, gpgme.IMPORT_SIG))
+         self.assertEqual(result.imports[2],
+                          ('E79A842DA34A1CA383F64A1546BB55F0885C65A4',
+-                          None, gpgme.IMPORT_SIG))
++                          None, gpgme.IMPORT_NEW | gpgme.IMPORT_SECRET))
+         self.assertEqual(result.imports[3],
+                          ('93C2240D6B8AA10AB28F701D2CF46B7FC97E6B0F',
+                           None, gpgme.IMPORT_NEW))
+-- 
+2.7.0
+
diff --git a/meta-python/recipes-devtools/python/python-pygpgme/0002-passphrase_cb-is-deprecated.patch b/meta-python/recipes-devtools/python/python-pygpgme/0002-passphrase_cb-is-deprecated.patch
new file mode 100644
index 0000000..fa6f8c5
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-pygpgme/0002-passphrase_cb-is-deprecated.patch
@@ -0,0 +1,50 @@
+From dc75482af095d667a4a92655c4e7eb312e80c42d Mon Sep 17 00:00:00 2001
+From: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
+Date: Mon, 1 Feb 2016 19:25:12 -0500
+Subject: [PATCH 2/5] passphrase_cb is deprecated
+
+https://bugs.gnupg.org/gnupg/issue767 indicates that
+gpgme_set_passphrase_cb is a deprecated corner of the API and that
+developers using gpgme should really rely on the gpg-agent to handle
+this stuff.  This should actually simplify things for most
+installations -- just strip out all passphrase handling from your
+application entirely, relying on gpg to figure out how to find the
+agent, and relying on the agent figuring out how to prompt the user
+(if necessary).
+
+However, if a developer really wants to use the passphrase callback
+approach, they'll have to use loopback pinentry.  This sets up the
+test suite to be able to make those tests.
+
+Upstream-Status: Backport
+
+Signed-off-by: Catalin Enache <catalin.enache@windriver.com>
+---
+ tests/util.py | 8 +++++++-
+ 1 file changed, 7 insertions(+), 1 deletion(-)
+
+diff --git a/tests/util.py b/tests/util.py
+index cd803c2..86892ca 100644
+--- a/tests/util.py
++++ b/tests/util.py
+@@ -28,7 +28,9 @@ keydir = os.path.join(os.path.dirname(__file__), 'keys')
+ 
+ class GpgHomeTestCase(unittest.TestCase):
+ 
+-    gpg_conf_contents = ''
++    gpg_conf_contents = 'pinentry-mode loopback'
++    gpg_agent_conf_contents = 'allow-loopback-pinentry'
++
+     import_keys = []
+ 
+     def keyfile(self, key):
+@@ -41,6 +43,10 @@ class GpgHomeTestCase(unittest.TestCase):
+         fp.write(self.gpg_conf_contents.encode('UTF-8'))
+         fp.close()
+ 
++        fp = open(os.path.join(self._gpghome, 'gpg-agent.conf'), 'wb')
++        fp.write(self.gpg_agent_conf_contents.encode('UTF-8'))
++        fp.close()
++
+         # import requested keys into the keyring
+         ctx = gpgme.Context()
+         for key in self.import_keys:
+-- 
+2.7.0
+
diff --git a/meta-python/recipes-devtools/python/python-pygpgme/0003-handle-generic-error-when-no-passphrase-callback-pre.patch b/meta-python/recipes-devtools/python/python-pygpgme/0003-handle-generic-error-when-no-passphrase-callback-pre.patch
new file mode 100644
index 0000000..2515793
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-pygpgme/0003-handle-generic-error-when-no-passphrase-callback-pre.patch
@@ -0,0 +1,28 @@
+From 024fe219582143017b2f02bc924c0ed107b63619 Mon Sep 17 00:00:00 2001
+From: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
+Date: Mon, 1 Feb 2016 19:27:59 -0500
+Subject: [PATCH 3/5] handle generic error when no passphrase callback present
+
+apparently gpg 2.1 returns ERR_GENERAL right now if the pinentry was
+in loopback mode and no passphrase callback was supplied.  Earlier
+versions supplied ERR_BAD_PASSPHRASE.
+
+Upstream-Status: Backport
+
+Signed-off-by: Catalin Enache <catalin.enache@windriver.com>
+---
+ tests/test_passphrase.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tests/test_passphrase.py b/tests/test_passphrase.py
+index 0a235e9..35b3c59 100644
+--- a/tests/test_passphrase.py
++++ b/tests/test_passphrase.py
+@@ -41,7 +41,7 @@ class PassphraseTestCase(GpgHomeTestCase):
+             new_sigs = ctx.sign(plaintext, signature, gpgme.SIG_MODE_CLEAR)
+         except gpgme.GpgmeError as exc:
+             self.assertEqual(exc.args[0], gpgme.ERR_SOURCE_GPGME)
+-            self.assertEqual(exc.args[1], gpgme.ERR_BAD_PASSPHRASE)
++            self.assertEqual(exc.args[1], gpgme.ERR_GENERAL)
+         else:
+             self.fail('gpgme.GpgmeError not raised')
+ 
+-- 
+2.7.0
+
diff --git a/meta-python/recipes-devtools/python/python-pygpgme_0.3.bb b/meta-python/recipes-devtools/python/python-pygpgme_0.3.bb
index 03c4790..2fd76fe 100644
--- a/meta-python/recipes-devtools/python/python-pygpgme_0.3.bb
+++ b/meta-python/recipes-devtools/python/python-pygpgme_0.3.bb
@@ -6,7 +6,11 @@ HOMEPAGE = "https://launchpad.net/pygpgme"
 LICENSE = "LGPL-2.1"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=6517bdc8f2416f27ab725d4702f7aac3"
 
-SRC_URI = "file://run-ptest"
+SRC_URI = "file://run-ptest \"
+           file://0001-reflect-2.1-reporting-for-key-imports.patch \
+           file://0002-passphrase_cb-is-deprecated.patch \
+           file://0003-handle-generic-error-when-no-passphrase-callback-pre.patch \
+          "
 
 SRC_URI[md5sum] = "d38355af73f0352cde3d410b25f34fd0"
 SRC_URI[sha256sum] = "5fd887c407015296a8fd3f4b867fe0fcca3179de97ccde90449853a3dfb802e1"
-- 
2.7.4


