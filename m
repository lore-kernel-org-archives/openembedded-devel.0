Return-Path: <pbasista@gmail.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 5F38D6C59E
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Nov 2018 01:49:10 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id r11-v6so10454918wmb.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Nov 2018 17:49:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=JLI25penILppIlQb/qolGsVMucgaIp/tYjXOTdOD0jc=;
	b=iBmaJLfte7lbir5b8lHp0VgpGxPMHi9Q5s6cdFnkBqkZVsMl5GLuI7KUXK7yPKMBPC
	Uo2p50QJNxVFvqLNCO7WwplbNvgIkRl/pOAy25VvCSln41FsDZjYYVMnKFJj4hAoDW8D
	AdlQKAmn3sne1oxnvyshAf4fSGgy7LwM5UCYBDCLCOR+6mACm2P+CYa3RxNSWQ8HFqKc
	BWz/5MssC4zAsTlLLpoo6kFAPA5J4Hk8vp03N+/gdPAmdAy/5znPP6/fEZAyBuLQsfdo
	yQ60etPWHHcVfgZiIrOkfb2p/TT54tmktIb6WV5HBPP7Vn25d0dYZbKBqS5lcIMmGJZW
	c9oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=JLI25penILppIlQb/qolGsVMucgaIp/tYjXOTdOD0jc=;
	b=Ml/UalDCQ+B7+QTfcrNQZ5vVZCuC+whU6dyyEEip5nPMrKKCfO5MKAnJcfuwF2HgaQ
	vaoBTKg2/jDQSI+6l0o2hrQoeq/19lVLwfeW5SIwD/iEvQ4az9g/CS7if6yuXJilVEmI
	XgOhRYXHipUBTJk/9NKSIokTybrowivIQ482ycOHPcV0/UAPpilbVcBvKKJaUYDQd/5r
	mPdkfeFGVFFEFSREMiVmXND8BvAUeaQFbPEBTk9gJAENItFktzMl6yJarUqHmgO3Vja7
	aIGcOljljLcpRA9t4VMjE+tJ0owgslHVvic4p3sFfYwAfEvMMCsSNomME21F6V+O4KuT
	Z3CQ==
X-Gm-Message-State: AA+aEWZDb0aqdF7Iae8oakl/i0cxXKXCLYaKC8BJ0qeUdLmDYb3Za66q
	ComCiRcD0LB3PaBom00vN3dXby0NRCM=
X-Google-Smtp-Source: AFSGD/XDMandnJRvP/XEHs3b5vgrbqK/fWPPJSWCBgxNTzJfjCwvPq1fs8s/8pINwjHYJRJ42/EtnQ==
X-Received: by 2002:a1c:2d5:: with SMTP id 204mr8528963wmc.115.1542937750684; 
	Thu, 22 Nov 2018 17:49:10 -0800 (PST)
Received: from localhost.localdomain (nat-88-212-40-130.antik.sk.
	[88.212.40.130]) by smtp.gmail.com with ESMTPSA id
	g198sm8179811wmd.23.2018.11.22.17.49.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 22 Nov 2018 17:49:09 -0800 (PST)
From: =?UTF-8?q?Peter=20Ba=C5=A1ista?= <pbasista@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 23 Nov 2018 02:48:53 +0100
Message-Id: <20181123014853.26229-1-pbasista@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Cc: =?UTF-8?q?Peter=20Ba=C5=A1ista?= <pbasista@gmail.com>
Subject: [meta-multimedia][PATCH v2] Add a working Tvheadend recipe
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
X-List-Received-Date: Fri, 23 Nov 2018 01:49:10 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The original one was previously removed
by commit ec9e5ed06256ad92c818474cdb490dc0d3a0d0a3
as part of a clean-up of blacklisted recipes.

Signed-off-by: Peter Bašista <pbasista@gmail.com>
---
 .../tvheadend/tvheadend/0-test.patch          | 13 +++++++
 .../recipes-dvb/tvheadend/tvheadend_git.bb    | 34 +++++++++++++++++++
 2 files changed, 47 insertions(+)
 create mode 100644 meta-multimedia/recipes-dvb/tvheadend/tvheadend/0-test.patch
 create mode 100644 meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb

diff --git a/meta-multimedia/recipes-dvb/tvheadend/tvheadend/0-test.patch b/meta-multimedia/recipes-dvb/tvheadend/tvheadend/0-test.patch
new file mode 100644
index 000000000..01e9c2e47
--- /dev/null
+++ b/meta-multimedia/recipes-dvb/tvheadend/tvheadend/0-test.patch
@@ -0,0 +1,13 @@
+diff --git a/src/input/mpegts/linuxdvb/linuxdvb_frontend.c b/src/input/mpegts/linuxdvb/linuxdvb_frontend.c
+index 82021020f..9b8d8edcf 100644
+--- a/src/input/mpegts/linuxdvb/linuxdvb_frontend.c
++++ b/src/input/mpegts/linuxdvb/linuxdvb_frontend.c
+@@ -1268,6 +1268,8 @@ linuxdvb_frontend_open_pid0
+     return;
+   }
+
++  ioctl(fd, _IOW('o', 49, int), &lfe->lfe_number);
++
+   /* Install filter */
+   tvhtrace(LS_LINUXDVB, "%s - open PID %04X (%d) fd %d", name, pid, pid, fd);
+   memset(&dmx_param, 0, sizeof(dmx_param));
diff --git a/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb b/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb
new file mode 100644
index 000000000..89e131200
--- /dev/null
+++ b/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb
@@ -0,0 +1,34 @@
+SUMMARY = "Tvheadend: TV streaming server and recorder"
+HOMEPAGE = "https://tvheadend.org/"
+
+inherit gettext gitpkgv pkgconfig
+
+DEPENDS = "avahi cmake-native libdvbcsa libpcre2 openssl uriparser zlib"
+
+LICENSE = "GPLv3+"
+LIC_FILES_CHKSUM = "file://LICENSE.md;md5=9cae5acac2e9ee2fc3aec01ac88ce5db"
+
+SRC_URI = "git://github.com/tvheadend/tvheadend.git \
+           file://0-test.patch \
+           "
+
+SRCREV = "ccd64e698a38adb7f712a841bc3dc4480bb97dfb"
+PV = "4.3+git${SRCPV}"
+PKGV = "4.3+git${GITPKGV}"
+
+S = "${WORKDIR}/git"
+
+EXTRA_OECONF += "${PACKAGECONFIG_CONFARGS} \
+                 --prefix=${prefix} \
+                 --libdir=${libdir} \
+                 --bindir=${bindir} \
+                 --datadir=${datadir} \
+                 --arch=${TARGET_ARCH} \
+                 --disable-hdhomerun_static \
+                 --disable-ffmpeg_static \
+                 --disable-libav \
+                 "
+
+do_configure() {
+    ${S}/configure ${EXTRA_OECONF}
+}
-- 
2.19.1


