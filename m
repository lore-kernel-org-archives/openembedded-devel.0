Return-Path: <Yi.Zhao@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 26B38782A8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Aug 2017 05:55:47 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v7O5tl4M016069
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Aug 2017 22:55:47 -0700 (PDT)
Received: from localhost (128.224.162.198) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Wed, 23 Aug 2017 22:55:46 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 24 Aug 2017 13:56:32 +0800
Message-ID: <1503554192-6493-1-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.198]
Subject: [meta-python][PATCH] python-pycrypto: Security fix CVE-2013-7459
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
X-List-Received-Date: Thu, 24 Aug 2017 05:55:48 -0000
Content-Type: text/plain

CVE-2013-7459: Heap-based buffer overflow in the ALGnew function in
block_templace.c in Python Cryptography Toolkit (aka pycrypto) allows
remote attackers to execute arbitrary code as demonstrated by a crafted
iv parameter to cryptmsg.py.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2013-7459

Patch from:
https://github.com/dlitz/pycrypto/commit/8dbe0dc3eea5c689d4f76b37b93fe216cf1f00d4

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../python/python-pycrypto/CVE-2013-7459.patch     | 98 ++++++++++++++++++++++
 .../python/python-pycrypto_2.6.1.bb                |  4 +-
 2 files changed, 101 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python-pycrypto/CVE-2013-7459.patch

diff --git a/meta-python/recipes-devtools/python/python-pycrypto/CVE-2013-7459.patch b/meta-python/recipes-devtools/python/python-pycrypto/CVE-2013-7459.patch
new file mode 100644
index 0000000..9006c5c
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-pycrypto/CVE-2013-7459.patch
@@ -0,0 +1,98 @@
+From 8dbe0dc3eea5c689d4f76b37b93fe216cf1f00d4 Mon Sep 17 00:00:00 2001
+From: Legrandin <helderijs@gmail.com>
+Date: Sun, 22 Dec 2013 22:24:46 +0100
+Subject: [PATCH] Throw exception when IV is used with ECB or CTR
+
+The IV parameter is currently ignored when initializing
+a cipher in ECB or CTR mode.
+
+For CTR mode, it is confusing: it takes some time to see
+that a different parameter is needed (the counter).
+
+For ECB mode, it is outright dangerous.
+
+This patch forces an exception to be raised.
+
+Upstream-Status: Backport
+[https://github.com/dlitz/pycrypto/commit/8dbe0dc3eea5c689d4f76b37b93fe216cf1f00d4]
+
+CVE: CVE-2013-7459
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ lib/Crypto/SelfTest/Cipher/common.py | 31 +++++++++++++++++++++++--------
+ src/block_template.c                 | 11 +++++++++++
+ 2 files changed, 34 insertions(+), 8 deletions(-)
+
+diff --git a/lib/Crypto/SelfTest/Cipher/common.py b/lib/Crypto/SelfTest/Cipher/common.py
+index 8bebed9..91ec743 100644
+--- a/lib/Crypto/SelfTest/Cipher/common.py
++++ b/lib/Crypto/SelfTest/Cipher/common.py
+@@ -239,19 +239,34 @@ class RoundtripTest(unittest.TestCase):
+         return """%s .decrypt() output of .encrypt() should not be garbled""" % (self.module_name,)
+ 
+     def runTest(self):
+-        for mode in (self.module.MODE_ECB, self.module.MODE_CBC, self.module.MODE_CFB, self.module.MODE_OFB, self.module.MODE_OPENPGP):
++
++        ## ECB mode
++        mode = self.module.MODE_ECB
++        encryption_cipher = self.module.new(a2b_hex(self.key), mode)
++        ciphertext = encryption_cipher.encrypt(self.plaintext)
++        decryption_cipher = self.module.new(a2b_hex(self.key), mode)
++        decrypted_plaintext = decryption_cipher.decrypt(ciphertext)
++        self.assertEqual(self.plaintext, decrypted_plaintext)
++
++        ## OPENPGP mode
++        mode = self.module.MODE_OPENPGP
++        encryption_cipher = self.module.new(a2b_hex(self.key), mode, self.iv)
++        eiv_ciphertext = encryption_cipher.encrypt(self.plaintext)
++        eiv = eiv_ciphertext[:self.module.block_size+2]
++        ciphertext = eiv_ciphertext[self.module.block_size+2:]
++        decryption_cipher = self.module.new(a2b_hex(self.key), mode, eiv)
++        decrypted_plaintext = decryption_cipher.decrypt(ciphertext)
++        self.assertEqual(self.plaintext, decrypted_plaintext)
++
++        ## All other non-AEAD modes (but CTR)
++        for mode in (self.module.MODE_CBC, self.module.MODE_CFB, self.module.MODE_OFB):
+             encryption_cipher = self.module.new(a2b_hex(self.key), mode, self.iv)
+             ciphertext = encryption_cipher.encrypt(self.plaintext)
+-            
+-            if mode != self.module.MODE_OPENPGP:
+-                decryption_cipher = self.module.new(a2b_hex(self.key), mode, self.iv)
+-            else:
+-                eiv = ciphertext[:self.module.block_size+2]
+-                ciphertext = ciphertext[self.module.block_size+2:]
+-                decryption_cipher = self.module.new(a2b_hex(self.key), mode, eiv)
++            decryption_cipher = self.module.new(a2b_hex(self.key), mode, self.iv)
+             decrypted_plaintext = decryption_cipher.decrypt(ciphertext)
+             self.assertEqual(self.plaintext, decrypted_plaintext)
+ 
++
+ class PGPTest(unittest.TestCase):
+     def __init__(self, module, params):
+         unittest.TestCase.__init__(self)
+diff --git a/src/block_template.c b/src/block_template.c
+index c36b316..8746948 100644
+--- a/src/block_template.c
++++ b/src/block_template.c
+@@ -170,6 +170,17 @@ ALGnew(PyObject *self, PyObject *args, PyObject *kwdict)
+ 				"Key cannot be the null string");
+ 		return NULL;
+ 	}
++	if (IVlen != 0 && mode == MODE_ECB)
++	{
++		PyErr_Format(PyExc_ValueError, "ECB mode does not use IV");
++		return NULL;
++	}
++	if (IVlen != 0 && mode == MODE_CTR)
++	{
++		PyErr_Format(PyExc_ValueError,
++			"CTR mode needs counter parameter, not IV");
++		return NULL;
++	}
+ 	if (IVlen != BLOCK_SIZE && mode != MODE_ECB && mode != MODE_CTR)
+ 	{
+ 		PyErr_Format(PyExc_ValueError,
+-- 
+2.7.4
+
diff --git a/meta-python/recipes-devtools/python/python-pycrypto_2.6.1.bb b/meta-python/recipes-devtools/python/python-pycrypto_2.6.1.bb
index 06a0cc4..919f91e 100644
--- a/meta-python/recipes-devtools/python/python-pycrypto_2.6.1.bb
+++ b/meta-python/recipes-devtools/python/python-pycrypto_2.6.1.bb
@@ -1,7 +1,9 @@
 inherit distutils
 require python-pycrypto.inc
 
-SRC_URI += "file://cross-compiling.patch"
+SRC_URI += "file://cross-compiling.patch \
+            file://CVE-2013-7459.patch \
+           "
 
 # We explicitly call distutils_do_install, since we want it to run, but
 # *don't* want the autotools install to run, since this package doesn't
-- 
2.7.4


