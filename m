Return-Path: <pbasista@gmail.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id A9EC46C106
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Nov 2018 17:04:57 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id u13-v6so3017004wmc.4
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Nov 2018 09:04:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=QGk7K+5OaUtBCT7dtY0uige5tDQJaUlbOx/+dpyGHPM=;
	b=LohJfTjvTVMmdVFcgHWQvgQFLNKdZPYUP/kMH0AhMaAU0LHkC268q/WHJutxir7mCd
	mk5y7noRtdjPFzZI+eAKMUtK70KoSUh7bSZbAryAYy7YmjAwD2c+Bf6ySBwd13bMTFEZ
	3gScGFzvoGzsqG+0aqSbmZEui+dsXL+b/RcPQ32dExIayxqw0utJwmx+kbkCGSOFNGKC
	W3hE07HJnmWYwpmbqnLMJQHYG6AJ6Ujaz23IDfAT1MuZcgu/05c27jjDm97tImbHuu6D
	EBm3/DR7GkEFnoR20lLzJqn2M91Zs+9LBFeoMEfcPM0ifLj/A2gaOYrMgP/bjMdobi7D
	nF/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=QGk7K+5OaUtBCT7dtY0uige5tDQJaUlbOx/+dpyGHPM=;
	b=Y7FSYH4k28qijoHH5s6DWbaFR0Dal/b+2HXyB4LIOfrChaiyBGMLPkTt74R/OVGCzY
	O1/ELh17rkvViFEibZJPZqPlKZRu6f+UQihOuFnAhBxrdS6u/wq7xtZ8ts3EGswi39N3
	LaVJiQM/i8T/mxaAKGHI0zmvvBeo/lYmpXZOWzlb+8+dFZrxC1FNG3iJIWQspE//gqr9
	JmRhU48bzRBuqu+bNq8IG64H168O6DsfaiBAo7yxxnxyIYSQCXk7fdvwwQvK+Z/zFd9o
	dCJHZcqbnSdNO/sok1OAnnX+dwRHVpzPKqgGDbTA17n2ut6/+WfgyqOcWpifQvnjCDpB
	HLsQ==
X-Gm-Message-State: AGRZ1gK1xDxHrYPy1lIX9UgIGWqqWmbWvaxdxyacRwE42g9Mzse6ayte
	zCMTNtcL2zxt9vqxM9KihsPGikZlWzM=
X-Google-Smtp-Source: AJdET5fRbjRcFCSb80wcbRjuo/Mzaz3TrtLPKJ7M26AVez8b2IzsXFETTo1kcPEO3Vs33P1qyXr78Q==
X-Received: by 2002:a1c:6a01:: with SMTP id f1mr4826906wmc.17.1542560698169;
	Sun, 18 Nov 2018 09:04:58 -0800 (PST)
Received: from coolbox.a ([46.150.193.209]) by smtp.gmail.com with ESMTPSA id
	h62sm9980261wmf.11.2018.11.18.09.04.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 18 Nov 2018 09:04:57 -0800 (PST)
From: =?UTF-8?q?Peter=20Ba=C5=A1ista?= <pbasista@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 18 Nov 2018 18:04:42 +0100
Message-Id: <20181118170442.14670-1-pbasista@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Subject: [meta-multimedia][PATCH] Add a working tvheadend recipe
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
X-List-Received-Date: Sun, 18 Nov 2018 17:04:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The original one was previously removed
by commit ec9e5ed06256ad92c818474cdb490dc0d3a0d0a3
as part of a clean-up of blacklisted recipes.

Signed-off-by: Peter Bašista <pbasista@gmail.com>
---
 .../recipes-dvb/tvheadend/tvheadend_git.bb    | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb

diff --git a/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb b/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb
new file mode 100644
index 000000000..2a76d5d34
--- /dev/null
+++ b/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb
@@ -0,0 +1,37 @@
+SUMMARY = "Tvheadend: TV streaming server and recorder"
+HOMEPAGE = "https://tvheadend.org/"
+
+DEPENDS = "avahi cmake-native gettext-native libpcre2 libdvbcsa openssl zlib python-native"
+
+LICENSE = "GPLv3+"
+LIC_FILES_CHKSUM = "file://LICENSE.md;md5=9cae5acac2e9ee2fc3aec01ac88ce5db"
+
+SRC_URI = "git://github.com/tvheadend/tvheadend.git"
+
+inherit gitpkgv
+SRCREV = "${AUTOREV}"
+PV = "4.3+git${SRCPV}"
+PKGV = "4.3+git${GITPKGV}"
+
+S = "${WORKDIR}/git"
+
+PACKAGECONFIG ?= ""
+PACKAGECONFIG[uriparser] = "--enable-uriparser,--disable-uriparser,uriparser"
+
+do_configure() {
+    ./configure ${PACKAGECONFIG_CONFARGS} \
+                --prefix=${prefix} \
+                --libdir=${libdir} \
+                --bindir=${bindir} \
+                --datadir=${datadir} \
+                --arch=${TARGET_ARCH} \
+                --disable-libav \
+                --disable-ffmpeg_static \
+                --disable-hdhomerun_static
+}
+
+do_install() {
+    oe_runmake install DESTDIR=${D}
+}
+
+FILES_${PN} += "${datadir}/${BPN}"
-- 
2.19.1


