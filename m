Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36147C433FE
	for <webhook@archiver.kernel.org>; Fri, 14 Jan 2022 14:10:13 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.7612.1642169412614966185
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Jan 2022 06:10:12 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0CD59101E
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Jan 2022 06:10:12 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8FBE83F774
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Jan 2022 06:10:11 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 2/2] python3-pycrypto: remove obsolete pycrypto module
Date: Fri, 14 Jan 2022 14:10:08 +0000
Message-Id: <20220114141008.3998380-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220114141008.3998380-1-ross.burton@arm.com>
References: <20220114141008.3998380-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Jan 2022 14:10:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94838

pycrypto hasn't had a commit upstream since June 2014, which for a
security-critical module is not a good sign.

Everyone has migrated to the pycryptodome or cryptography modules, so
remove pycrypto from meta-python.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../packagegroups/packagegroup-meta-python.bb |  1 -
 ...ce-time.clock-with-time.process_time.patch | 34 -------
 .../python3-pycrypto/CVE-2013-7459.patch      | 98 -------------------
 .../python3-pycrypto/cross-compiling.patch    | 23 -----
 .../python/python3-pycrypto_2.6.1.bb          | 29 ------
 5 files changed, 185 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-pycrypto/=
0001-Replace-time.clock-with-time.process_time.patch
 delete mode 100644 meta-python/recipes-devtools/python/python3-pycrypto/=
CVE-2013-7459.patch
 delete mode 100644 meta-python/recipes-devtools/python/python3-pycrypto/=
cross-compiling.patch
 delete mode 100644 meta-python/recipes-devtools/python/python3-pycrypto_=
2.6.1.bb

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-pyt=
hon.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.=
bb
index 288227db82..70481f2b93 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -315,7 +315,6 @@ RDEPENDS:packagegroup-meta-python3 =3D "\
     python3-pycodestyle \
     python3-pyconnman \
     python3-pycparser \
-    python3-pycrypto \
     python3-pycurl \
     python3-pydbus \
     python3-pydbus-manager \
diff --git a/meta-python/recipes-devtools/python/python3-pycrypto/0001-Re=
place-time.clock-with-time.process_time.patch b/meta-python/recipes-devto=
ols/python/python3-pycrypto/0001-Replace-time.clock-with-time.process_tim=
e.patch
deleted file mode 100644
index 282fdd3e2b..0000000000
--- a/meta-python/recipes-devtools/python/python3-pycrypto/0001-Replace-t=
ime.clock-with-time.process_time.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 1d90727ff2368012d6e2f91b1a3198f626495b7f Mon Sep 17 00:00:00 2001
-From: Ming Liu <liu.ming50@gmail.com>
-Date: Sat, 25 Jan 2020 14:36:16 +0100
-Subject: [PATCH] Replace time.clock() with time.process_time()
-
-The use of time.clock() is deprecated in python 3.8, change to use
-time.process_time().
-
-Reference:
-https://docs.python.org/3.3/library/time.html#time.clock
-
-Upstream-Status: Pending
-
-Signed-off-by: Ming Liu <liu.ming50@gmail.com>
----
- lib/Crypto/Random/_UserFriendlyRNG.py | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/lib/Crypto/Random/_UserFriendlyRNG.py b/lib/Crypto/Random/_=
UserFriendlyRNG.py
-index 957e006..d2a0259 100644
---- a/lib/Crypto/Random/_UserFriendlyRNG.py
-+++ b/lib/Crypto/Random/_UserFriendlyRNG.py
-@@ -74,7 +74,7 @@ class _EntropyCollector(object):
-         self._time_es.feed(struct.pack("@I", int(2**30 * (t - floor(t))=
)))
-=20
-         # Add the fractional part of time.clock()
--        t =3D time.clock()
-+        t =3D time.process_time()
-         self._clock_es.feed(struct.pack("@I", int(2**30 * (t - floor(t)=
))))
-=20
-=20
---=20
-2.7.4
-
diff --git a/meta-python/recipes-devtools/python/python3-pycrypto/CVE-201=
3-7459.patch b/meta-python/recipes-devtools/python/python3-pycrypto/CVE-2=
013-7459.patch
deleted file mode 100644
index 9006c5c350..0000000000
--- a/meta-python/recipes-devtools/python/python3-pycrypto/CVE-2013-7459.=
patch
+++ /dev/null
@@ -1,98 +0,0 @@
-From 8dbe0dc3eea5c689d4f76b37b93fe216cf1f00d4 Mon Sep 17 00:00:00 2001
-From: Legrandin <helderijs@gmail.com>
-Date: Sun, 22 Dec 2013 22:24:46 +0100
-Subject: [PATCH] Throw exception when IV is used with ECB or CTR
-
-The IV parameter is currently ignored when initializing
-a cipher in ECB or CTR mode.
-
-For CTR mode, it is confusing: it takes some time to see
-that a different parameter is needed (the counter).
-
-For ECB mode, it is outright dangerous.
-
-This patch forces an exception to be raised.
-
-Upstream-Status: Backport
-[https://github.com/dlitz/pycrypto/commit/8dbe0dc3eea5c689d4f76b37b93fe2=
16cf1f00d4]
-
-CVE: CVE-2013-7459
-
-Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
----
- lib/Crypto/SelfTest/Cipher/common.py | 31 +++++++++++++++++++++++------=
--
- src/block_template.c                 | 11 +++++++++++
- 2 files changed, 34 insertions(+), 8 deletions(-)
-
-diff --git a/lib/Crypto/SelfTest/Cipher/common.py b/lib/Crypto/SelfTest/=
Cipher/common.py
-index 8bebed9..91ec743 100644
---- a/lib/Crypto/SelfTest/Cipher/common.py
-+++ b/lib/Crypto/SelfTest/Cipher/common.py
-@@ -239,19 +239,34 @@ class RoundtripTest(unittest.TestCase):
-         return """%s .decrypt() output of .encrypt() should not be garb=
led""" % (self.module_name,)
-=20
-     def runTest(self):
--        for mode in (self.module.MODE_ECB, self.module.MODE_CBC, self.m=
odule.MODE_CFB, self.module.MODE_OFB, self.module.MODE_OPENPGP):
-+
-+        ## ECB mode
-+        mode =3D self.module.MODE_ECB
-+        encryption_cipher =3D self.module.new(a2b_hex(self.key), mode)
-+        ciphertext =3D encryption_cipher.encrypt(self.plaintext)
-+        decryption_cipher =3D self.module.new(a2b_hex(self.key), mode)
-+        decrypted_plaintext =3D decryption_cipher.decrypt(ciphertext)
-+        self.assertEqual(self.plaintext, decrypted_plaintext)
-+
-+        ## OPENPGP mode
-+        mode =3D self.module.MODE_OPENPGP
-+        encryption_cipher =3D self.module.new(a2b_hex(self.key), mode, =
self.iv)
-+        eiv_ciphertext =3D encryption_cipher.encrypt(self.plaintext)
-+        eiv =3D eiv_ciphertext[:self.module.block_size+2]
-+        ciphertext =3D eiv_ciphertext[self.module.block_size+2:]
-+        decryption_cipher =3D self.module.new(a2b_hex(self.key), mode, =
eiv)
-+        decrypted_plaintext =3D decryption_cipher.decrypt(ciphertext)
-+        self.assertEqual(self.plaintext, decrypted_plaintext)
-+
-+        ## All other non-AEAD modes (but CTR)
-+        for mode in (self.module.MODE_CBC, self.module.MODE_CFB, self.m=
odule.MODE_OFB):
-             encryption_cipher =3D self.module.new(a2b_hex(self.key), mo=
de, self.iv)
-             ciphertext =3D encryption_cipher.encrypt(self.plaintext)
--           =20
--            if mode !=3D self.module.MODE_OPENPGP:
--                decryption_cipher =3D self.module.new(a2b_hex(self.key)=
, mode, self.iv)
--            else:
--                eiv =3D ciphertext[:self.module.block_size+2]
--                ciphertext =3D ciphertext[self.module.block_size+2:]
--                decryption_cipher =3D self.module.new(a2b_hex(self.key)=
, mode, eiv)
-+            decryption_cipher =3D self.module.new(a2b_hex(self.key), mo=
de, self.iv)
-             decrypted_plaintext =3D decryption_cipher.decrypt(ciphertex=
t)
-             self.assertEqual(self.plaintext, decrypted_plaintext)
-=20
-+
- class PGPTest(unittest.TestCase):
-     def __init__(self, module, params):
-         unittest.TestCase.__init__(self)
-diff --git a/src/block_template.c b/src/block_template.c
-index c36b316..8746948 100644
---- a/src/block_template.c
-+++ b/src/block_template.c
-@@ -170,6 +170,17 @@ ALGnew(PyObject *self, PyObject *args, PyObject *kw=
dict)
- 				"Key cannot be the null string");
- 		return NULL;
- 	}
-+	if (IVlen !=3D 0 && mode =3D=3D MODE_ECB)
-+	{
-+		PyErr_Format(PyExc_ValueError, "ECB mode does not use IV");
-+		return NULL;
-+	}
-+	if (IVlen !=3D 0 && mode =3D=3D MODE_CTR)
-+	{
-+		PyErr_Format(PyExc_ValueError,
-+			"CTR mode needs counter parameter, not IV");
-+		return NULL;
-+	}
- 	if (IVlen !=3D BLOCK_SIZE && mode !=3D MODE_ECB && mode !=3D MODE_CTR)
- 	{
- 		PyErr_Format(PyExc_ValueError,
---=20
-2.7.4
-
diff --git a/meta-python/recipes-devtools/python/python3-pycrypto/cross-c=
ompiling.patch b/meta-python/recipes-devtools/python/python3-pycrypto/cro=
ss-compiling.patch
deleted file mode 100644
index 712f3e8dde..0000000000
--- a/meta-python/recipes-devtools/python/python3-pycrypto/cross-compilin=
g.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-Index: pycrypto-2.6/setup.py
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- pycrypto-2.6.orig/setup.py
-+++ pycrypto-2.6/setup.py
-@@ -271,7 +271,8 @@ class PCTBuildConfigure(Command):
-         if not os.path.exists("config.status"):
-             if os.system("chmod 0755 configure") !=3D 0:
-                 raise RuntimeError("chmod error")
--            cmd =3D "sh configure"    # we use "sh" here so that it'll =
work on mingw32 with standard python.org binaries
-+            host =3D os.environ.get("HOST_SYS")
-+            cmd =3D "ac_cv_func_malloc_0_nonnull=3Dyes sh configure --h=
ost " + host   # we use "sh" here so that it'll work on mingw32 with stan=
dard python.org binaries
-             if self.verbose < 1:
-                 cmd +=3D " -q"
-             if os.system(cmd) !=3D 0:
-@@ -370,7 +371,7 @@ kw =3D {'name':"pycrypto",
-       'ext_modules': plat_ext + [
-             # _fastmath (uses GNU mp library)
-             Extension("Crypto.PublicKey._fastmath",
--                      include_dirs=3D['src/','/usr/include/'],
-+                      include_dirs=3D['src/'],
-                       libraries=3D['gmp'],
-                       sources=3D["src/_fastmath.c"]),
-=20
diff --git a/meta-python/recipes-devtools/python/python3-pycrypto_2.6.1.b=
b b/meta-python/recipes-devtools/python/python3-pycrypto_2.6.1.bb
deleted file mode 100644
index 78a1ef2ac0..0000000000
--- a/meta-python/recipes-devtools/python/python3-pycrypto_2.6.1.bb
+++ /dev/null
@@ -1,29 +0,0 @@
-DESCRIPTION =3D "Cryptographic modules for Python."
-HOMEPAGE =3D "http://www.pycrypto.org/"
-LICENSE =3D "PSFv2"
-LIC_FILES_CHKSUM =3D "file://COPYRIGHT;md5=3D35f354d199e8cb7667b059a2357=
8e63d"
-
-DEPENDS +=3D " gmp"
-
-export HOST_SYS
-
-inherit pypi autotools-brokensep distutils3
-
-SRC_URI +=3D "file://cross-compiling.patch \
-            file://CVE-2013-7459.patch \
-            file://0001-Replace-time.clock-with-time.process_time.patch =
\
-           "
-
-SRC_URI[md5sum] =3D "55a61a054aa66812daf5161a0d5d7eda"
-SRC_URI[sha256sum] =3D "f2ce1e989b272cfcb677616763e0a2e7ec659effa67a88aa=
92b3a65528f60a3c"
-
-do_compile[noexec] =3D "1"
-
-# We explicitly call distutils_do_install, since we want it to run, but
-# *don't* want the autotools install to run, since this package doesn't
-# provide a "make install" target.
-do_install() {
-       distutils3_do_install
-}
-
-BBCLASSEXTEND =3D "native nativesdk"
--=20
2.25.1


