Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 770CF78506
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Sep 2017 17:44:26 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id h4so367497pfk.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Sep 2017 10:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=wG2GmC5GZWvpM8XagA9gVRlex4kco772RulvNrsgOWY=;
	b=uTMVLpOygsm/he4+jrMDPUcc4rOXpcu7rlaRh98kMGUT0kSxyMGshAFQ6XUcpyJNA6
	PVuupVeWbiHWZO2wI+bxDyVgw4f9ORCgMzkvY8gbBv6dawnC4JMYgwuFa4KbHau3z+Hb
	4JE55dXXuqQwDC3A2/oDUQ/fiYVHBctohsDBLU9wJTHXoOCxLZ+eHkZvbeMTNMBrbHPF
	BgUeZED9fJnQqnUVY/a59GHqR9Aela+lmwJYKB71uCHVe0lHRzSnNJRIPhm35SCGpsee
	XuIrGld9+M5GlV14XAgzpc85t38iTKqQNLRCtrA72wEioE9SsM7ahTGa67Q6r/tYTrfi
	56vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=wG2GmC5GZWvpM8XagA9gVRlex4kco772RulvNrsgOWY=;
	b=MmQZoITjD3vSyLr29MManFZzqLY0LBkjk9snecah8BwaZ4DJzEB9XFhmKwR8vZ1NTu
	i7KePFCJwKyA/jxYEtJ2EpZcos/UA5UkauuGbUerXCbqAdIdJwoKxHt6xshBms2sNqI+
	1ubFj3jAmbo0weSk045H9chBLKpNTSUMzp9FXJ8bmW3eEVJqXnonq2hJgCpPreW+0Oy8
	eN2ruiBkZ+/IO9aIC4/eIt12tj6niYHm5LVz/G5shiSIS8wYtk53AfvJKV7js30xAya8
	Nwah9oXcTwe3VzGUiOOQ14IluFih45Z4LYaLSoj/eZiWRXsU1NEf53eAotEb41YbN4Ec
	nGhg==
X-Gm-Message-State: AHPjjUinXUCZCqcBPixTuqU9onU9glol+JHocFyYK2VRE64DEohGBFwW
	AEq3aU1mzOX2RsrK
X-Google-Smtp-Source: ADKCNb6JBTPFQCjrpyE5ifGn5k15lGmGxomfng11B8d0sbzcYhkkyxra3FPeBFHhQIVUYgrVnR1ekw==
X-Received: by 10.98.14.213 with SMTP id 82mr19533339pfo.274.1505324667415;
	Wed, 13 Sep 2017 10:44:27 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::989f])
	by smtp.gmail.com with ESMTPSA id
	75sm13877586pfx.145.2017.09.13.10.44.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Sep 2017 10:44:26 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 13 Sep 2017 10:44:19 -0700
Message-Id: <20170913174419.34815-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.1
Subject: [meta-initramfs][PATCH V3] klibc.bbclass: Add -mfloat-abi on arm
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
X-List-Received-Date: Wed, 13 Sep 2017 17:44:26 -0000

Default toolchain is not configured for hard float
therefore we need to pass the right -mfloat-abi option

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
Changes in V3: Append -mfloat-abi only on armv6

 meta-initramfs/classes/klibc.bbclass                         | 2 ++
 meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_1.5.1.bb | 1 -
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-initramfs/classes/klibc.bbclass b/meta-initramfs/classes/klibc.bbclass
index c9de58cec..1ec7b2b05 100644
--- a/meta-initramfs/classes/klibc.bbclass
+++ b/meta-initramfs/classes/klibc.bbclass
@@ -5,6 +5,8 @@ DEPENDS =+ "klcc-cross"
 # Set CC = "${TARGET_PREFIX}klcc -shared" to build the dynamic version.
 CC_forcevariable = "${TARGET_PREFIX}klcc ${TOOLCHAIN_OPTIONS}"
 CC_forcevariable_armv4_linux-gnueabi = "${TARGET_PREFIX}klcc ${TOOLCHAIN_OPTIONS} -march=armv4 -mthumb-interwork"
+CC_append_armv7ve = " ${@' -mfloat-abi=${TUNE_CCARGS_MFLOAT}' if (d.getVar('TUNE_CCARGS_MFLOAT') != '') else ''}"
+CC_append_armv7a = " ${@' -mfloat-abi=${TUNE_CCARGS_MFLOAT}' if (d.getVar('TUNE_CCARGS_MFLOAT') != '') else ''}"
 
 CPP_forcevariable = "${CC} -E"
 
diff --git a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_1.5.1.bb b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_1.5.1.bb
index 867407723..8ca1ca727 100644
--- a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_1.5.1.bb
+++ b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_1.5.1.bb
@@ -21,7 +21,6 @@ SRC_URI = "git://git.infradead.org/mtd-utils.git;tag=b7455d847ab4f9eeeb6a729efc3
 S = "${WORKDIR}/git/"
 
 EXTRA_OEMAKE = "'CC=${CC}' 'RANLIB=${RANLIB}' 'AR=${AR}' 'CFLAGS=${CFLAGS} -I${S}include -DWITHOUT_XATTR' 'BUILDDIR=${S}'"
-CFLAGS += "${TUNE_CCARGS}"
 
 do_install () {
 
-- 
2.14.1


