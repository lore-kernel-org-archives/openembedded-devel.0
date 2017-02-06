Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id 5E50B71994
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 Feb 2017 16:37:17 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id v184so9498562pgv.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Feb 2017 08:37:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=fqJDB4x7yLy8sgr0hU2Q6LWI3tPzSbUPRKUoCHzLF6o=;
	b=QUfdlGslRgKCJaw4T/I4MmtDNEgS4NfTT1LINNmLzA7C4UJqf6MrrgFnjPAIh/Bj8E
	M0lhbMZDHYADMdObZeJw+d9WsWffMRTVxuhKBmbGEheX52haz6Xp81h/OiTfHpd14ddv
	hIrNncMiIst13XEjvtN1muudeyrZ6NbO5VELgEczGsfQwJIBkuXNZxZHo9L5j7rwCfm2
	VnMjPCbB+BhBDf234Gvn1c8Osvq3HMBSGfn6U9F+p3w+HZifid5Qv2xZqyU9HhKS2PT+
	p+CANGLKz/S+BgvXJtcDe5HjHE2dqaJ0jYOmFOtAvaOScv5hO38yRtjnBS73uLDShvKi
	O37A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=fqJDB4x7yLy8sgr0hU2Q6LWI3tPzSbUPRKUoCHzLF6o=;
	b=VRxrFSr5N3e8p8S+1Vn3qTiobsZvSrsjDamVH4zrIh2cyQkZioLd4j/R3jNkeKu+Yh
	lUqS3o2VVuqHIH/ALb7ZEY1KOwoBlM2diCBE1OlH2T7zawGfYlhnmAfpSQXJIjLDuUZ/
	RD3ZwspXJF1ZYhtt/e35ot2wu014FDgMQhRzcgDmw3TObotNBxIXqln95FP2hawsWxWk
	3ITglfm2kQpynS66llL0Euvv6u+hlyvIyQG8VOrh/o8KqiymXM/BeL3ibE9K42yTfXB/
	GlHtYJgy3C982KepTyfw09ZbhPCutW/nMaXJKrgqP5lm7xbYBuMM+2Q5/Yqj70yyFVNO
	0kRA==
X-Gm-Message-State: AIkVDXL47T50aNuZ97xUt3VvwYUbUWtvp/87A4fJkYfwmE0K1RbN4FEuq+wCMiJQrXO3TQ==
X-Received: by 10.84.140.1 with SMTP id 1mr18600965pls.38.1486399037746;
	Mon, 06 Feb 2017 08:37:17 -0800 (PST)
Received: from akuster-ThinkPad-X240.hsd1.ca.comcast.net
	([2601:202:4001:9ea0:ac48:9a90:c71a:12ad])
	by smtp.gmail.com with ESMTPSA id
	z74sm3919652pfd.70.2017.02.06.08.37.17
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 06 Feb 2017 08:37:17 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  6 Feb 2017 08:37:15 -0800
Message-Id: <1486399036-28846-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH 1/2] python-pycrypto: add app to meta-python
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
X-List-Received-Date: Mon, 06 Feb 2017 16:37:18 -0000

move it from meta-security

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-devtools/python/python-pycrypto.inc    | 18 +++++++++++++++++
 .../python/python-pycrypto/cross-compiling.patch   | 23 ++++++++++++++++++++++
 .../python/python-pycrypto_2.6.1.bb                | 11 +++++++++++
 3 files changed, 52 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-pycrypto.inc
 create mode 100644 meta-python/recipes-devtools/python/python-pycrypto/cross-compiling.patch
 create mode 100644 meta-python/recipes-devtools/python/python-pycrypto_2.6.1.bb

diff --git a/meta-python/recipes-devtools/python/python-pycrypto.inc b/meta-python/recipes-devtools/python/python-pycrypto.inc
new file mode 100644
index 0000000..42e31a9
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-pycrypto.inc
@@ -0,0 +1,18 @@
+DESCRIPTION = "Cryptographic modules for Python."
+HOMEPAGE = "http://www.pycrypto.org/"
+LICENSE = "PSFv2"
+LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=35f354d199e8cb7667b059a23578e63d"
+
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
+
+DEPENDS += " gmp"
+PYPI_PACKAGE = "pycrypto"
+
+inherit pypi autotools-brokensep
+
+SRC_URI[md5sum] = "55a61a054aa66812daf5161a0d5d7eda"
+SRC_URI[sha256sum] = "f2ce1e989b272cfcb677616763e0a2e7ec659effa67a88aa92b3a65528f60a3c"
+
+do_compile[noexec] = "1"
+
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python-pycrypto/cross-compiling.patch b/meta-python/recipes-devtools/python/python-pycrypto/cross-compiling.patch
new file mode 100644
index 0000000..712f3e8
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-pycrypto/cross-compiling.patch
@@ -0,0 +1,23 @@
+Index: pycrypto-2.6/setup.py
+===================================================================
+--- pycrypto-2.6.orig/setup.py
++++ pycrypto-2.6/setup.py
+@@ -271,7 +271,8 @@ class PCTBuildConfigure(Command):
+         if not os.path.exists("config.status"):
+             if os.system("chmod 0755 configure") != 0:
+                 raise RuntimeError("chmod error")
+-            cmd = "sh configure"    # we use "sh" here so that it'll work on mingw32 with standard python.org binaries
++            host = os.environ.get("HOST_SYS")
++            cmd = "ac_cv_func_malloc_0_nonnull=yes sh configure --host " + host   # we use "sh" here so that it'll work on mingw32 with standard python.org binaries
+             if self.verbose < 1:
+                 cmd += " -q"
+             if os.system(cmd) != 0:
+@@ -370,7 +371,7 @@ kw = {'name':"pycrypto",
+       'ext_modules': plat_ext + [
+             # _fastmath (uses GNU mp library)
+             Extension("Crypto.PublicKey._fastmath",
+-                      include_dirs=['src/','/usr/include/'],
++                      include_dirs=['src/'],
+                       libraries=['gmp'],
+                       sources=["src/_fastmath.c"]),
+ 
diff --git a/meta-python/recipes-devtools/python/python-pycrypto_2.6.1.bb b/meta-python/recipes-devtools/python/python-pycrypto_2.6.1.bb
new file mode 100644
index 0000000..06a0cc4
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-pycrypto_2.6.1.bb
@@ -0,0 +1,11 @@
+inherit distutils
+require python-pycrypto.inc
+
+SRC_URI += "file://cross-compiling.patch"
+
+# We explicitly call distutils_do_install, since we want it to run, but
+# *don't* want the autotools install to run, since this package doesn't
+# provide a "make install" target.
+do_install() {
+       distutils_do_install
+}
-- 
2.7.4


