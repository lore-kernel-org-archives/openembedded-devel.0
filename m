Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f176.google.com (mail-qk0-f176.google.com
	[209.85.220.176])
	by mail.openembedded.org (Postfix) with ESMTP id 03DBB77A56
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Aug 2017 19:49:34 +0000 (UTC)
Received: by mail-qk0-f176.google.com with SMTP id o63so6878845qkb.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Aug 2017 12:49:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=xfyOMRvzOJNx6YqjJk7hd6dPP3RAU0Iv8Naiukqxegw=;
	b=f0RYnV6hIEU0w70DJ66o0nX4daD78AySO2sDuMlUobXlBUpctLoY+/aexccPGKpNpe
	p+1xOQc41ljvwkvFB4/BeRJqRNWDE9ZiKzM+Dyt43uGVRZCR97EPxGrGezjziDUyEFDZ
	kNfKL9v6S/Zn9wkeBbpU2p190AYpCnaTtxmmKWQEboeYzkRXMt3b7km2o+W1mBqjNPk9
	c7zRE+UAecTBTDmj3VB/VxSHTocPHKYVRIaA3tk06l/i4JGDbGXDolVsHnamUOPBHsm5
	XBs3ZDFgDTxmgClkc+uAFtDm23VpwPqom6KWFCzVBC18EjRkdIsLRiq9tmkjwA/Hm7lo
	m5EA==
X-Gm-Message-State: AHYfb5gOvoGGeNYRzW7gARPQYxlaxK4mIEebFTe5GZxmT58rjiYZty8B
	lYKQMoAIudmwSxKe
X-Received: by 10.55.33.90 with SMTP id h87mr2539903qkh.279.1503949775682;
	Mon, 28 Aug 2017 12:49:35 -0700 (PDT)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id o79sm786981qka.3.2017.08.28.12.49.32
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 28 Aug 2017 12:49:34 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Mon, 28 Aug 2017 16:49:26 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Mon, 28 Aug 2017 16:49:26 -0300
Message-Id: <20170828194926.5176-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.14.1
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-python PATCH] python3-pycrypto: Add python3 version of recipe
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
X-List-Received-Date: Mon, 28 Aug 2017 19:49:35 -0000

The python2 version of the recipe already exist but there was no
python3 alternative. This patch adds the missing bits.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 .../python/python3-pycrypto/cross-compiling.patch  | 23 ++++++++++++++++++++++
 .../python/python3-pycrypto_2.6.1.bb               | 11 +++++++++++
 2 files changed, 34 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pycrypto/cross-compiling.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-pycrypto_2.6.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-pycrypto/cross-compiling.patch b/meta-python/recipes-devtools/python/python3-pycrypto/cross-compiling.patch
new file mode 100644
index 000000000..712f3e8dd
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pycrypto/cross-compiling.patch
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
diff --git a/meta-python/recipes-devtools/python/python3-pycrypto_2.6.1.bb b/meta-python/recipes-devtools/python/python3-pycrypto_2.6.1.bb
new file mode 100644
index 000000000..00ea5d00b
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pycrypto_2.6.1.bb
@@ -0,0 +1,11 @@
+inherit distutils3
+require python-pycrypto.inc
+
+SRC_URI += "file://cross-compiling.patch"
+
+# We explicitly call distutils_do_install, since we want it to run, but
+# *don't* want the autotools install to run, since this package doesn't
+# provide a "make install" target.
+do_install() {
+       distutils3_do_install
+}
-- 
2.14.1


