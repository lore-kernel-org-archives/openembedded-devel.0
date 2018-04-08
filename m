Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f66.google.com (mail-pl0-f66.google.com
	[209.85.160.66])
	by mail.openembedded.org (Postfix) with ESMTP id CA22F745AB
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  8 Apr 2018 06:59:23 +0000 (UTC)
Received: by mail-pl0-f66.google.com with SMTP id x4-v6so3202420pln.7
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 07 Apr 2018 23:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=HYHSUyorF57fqV9kqk1P2T6zWlTu5zCNL7PgjhjCDaQ=;
	b=EdugvmC7DIDdg4PNNdOU86NDMWXi40up/mfHHkkosFnLQFvZPKNlmmFZhB7pi3ZKcJ
	0KryJ5nzrRZyf0RGDfxAwqJldinBEP5Ik3Ls+Zl51Ko0MorbT1GBbti+HcyM8q3s/XkW
	zn9XT3Humr/MaGKe0dkLNMM8P8+HvBpQur77fq0vXMjUisZMexcWQ80f6uvsY2Ecw5BN
	GVY3GVSuKLm0BFxJG+OoSbutO+kkWEljm+43v72FiUsC34TseqGi+HUMAznBQaNfQPR3
	iEWn0VXaxC01OWpRaOH93JBacVwTzf/It2+PibB0MDeUxrUZbMuXwngDlLcG4TTpRdKV
	uuAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=HYHSUyorF57fqV9kqk1P2T6zWlTu5zCNL7PgjhjCDaQ=;
	b=sf8iKUvnICjHr0P/h+Qnti0h1Gcax4xyJFAVDOOpg7hmb206/8DS5Mt7ifNUzu/3br
	+kdrVfPuuRfC4TSsfuIp9dH3QaBGFPEItqQwkZ3aELSTn9DRSIaeznXEZbC2GPTwqFUC
	GjtAmzI59mgkHwdW0AAx+XJnVTRfP50eh+6L/lwj/YjZ8DhKUrKeJFTfzzBtE+dOTHaS
	VVYi0+rFnCeTTh0wqPcnA5zEq4Maq63yHhDAuVAZMFHflRs9nwUyuyiiKnSwq41ucxTb
	GKcoI+QNI7/+DtU8WSbDpquYpTuHp0RIRhgAI1+QMGMpA7FW3YphYJpsRj+vDb+kX5st
	XxIw==
X-Gm-Message-State: AElRT7GAFiIJzykpnXPAEmB23FhkFOwFDQGHlGfERLKzDWDXkxnTNw4O
	yjhi6F4P/gYmYs+HQZNL7qI0xg==
X-Google-Smtp-Source: AIpwx49TZ/Bb6/LBIRIxYDhLYAgRak7fYrU1KtPpvwOcvijMIBHDIiir/c3jol6U/5vyZkUWHzkuHA==
X-Received: by 2002:a17:902:5a0b:: with SMTP id
	q11-v6mr34891527pli.199.1523170764985; 
	Sat, 07 Apr 2018 23:59:24 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:932:e5ef:c5a4:fdbd])
	by smtp.gmail.com with ESMTPSA id
	c186sm20506137pfb.40.2018.04.07.23.59.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 07 Apr 2018 23:59:24 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Sat,  7 Apr 2018 23:58:45 -0700
Message-Id: <1523170729-26321-33-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1523170729-26321-1-git-send-email-akuster808@gmail.com>
References: <1523170729-26321-1-git-send-email-akuster808@gmail.com>
Subject: [meta-oe][PATCH 33/37] python-grpcio: refresh patches
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
X-List-Received-Date: Sun, 08 Apr 2018 06:59:23 -0000

WARNING: python-grpcio-1.8.4-r0 do_patch:
Some of the context lines in patches were ignored. This can lead to incorrectly applied patches.
The context lines in the patches can be updated with devtool:

    devtool modify <recipe>
    devtool finish --force-patch-refresh <recipe> <layer_path>

Then the updated patches and the source tree (in devtool's workspace)
should be reviewed to make sure the patches apply in the correct place
and don't introduce duplicate lines (which can, and does happen
when some of the context is ignored). Further information:
http://lists.openembedded.org/pipermail/openembedded-core/2018-March/148675.html
https://bugzilla.yoctoproject.org/show_bug.cgi?id=10450
Details:
Applying patch 0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch
patching file setup.py
Hunk #1 succeeded at 115 with fuzz 2 (offset -1 lines).

Now at patch 0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...setup.py-Do-not-mix-C-and-C-compiler-options.patch | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python-grpcio/0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch b/meta-python/recipes-devtools/python/python-grpcio/0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch
index 3abbc6d..0c1d964 100644
--- a/meta-python/recipes-devtools/python/python-grpcio/0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch
+++ b/meta-python/recipes-devtools/python/python-grpcio/0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch
@@ -18,19 +18,16 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  setup.py | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/setup.py b/setup.py
-index cb85273..f79878d 100644
---- a/setup.py
-+++ b/setup.py
-@@ -116,7 +116,7 @@ if EXTRA_ENV_COMPILE_ARGS is None:
-   elif 'win32' in sys.platform:
-     EXTRA_ENV_COMPILE_ARGS += ' -D_PYTHON_MSVC'
+Index: grpcio-1.8.4/setup.py
+===================================================================
+--- grpcio-1.8.4.orig/setup.py
++++ grpcio-1.8.4/setup.py
+@@ -115,7 +115,7 @@ if EXTRA_ENV_COMPILE_ARGS is None:
+     else:
+       EXTRA_ENV_COMPILE_ARGS += ' -D_ftime=_ftime64 -D_timeb=__timeb64'
    elif "linux" in sys.platform:
 -    EXTRA_ENV_COMPILE_ARGS += ' -std=c++11 -std=gnu99 -fvisibility=hidden -fno-wrapv -fno-exceptions'
 +    EXTRA_ENV_COMPILE_ARGS += ' -fvisibility=hidden -fno-wrapv -fno-exceptions'
    elif "darwin" in sys.platform:
-     EXTRA_ENV_COMPILE_ARGS += ' -fvisibility=hidden -fno-wrapv'
+     EXTRA_ENV_COMPILE_ARGS += ' -fvisibility=hidden -fno-wrapv -fno-exceptions'
  
--- 
-2.13.4
-
-- 
2.7.4


