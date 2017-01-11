Return-Path: <moritz.fischer@ettus.com>
Received: from mail-pf0-f175.google.com (mail-pf0-f175.google.com
	[209.85.192.175])
	by mail.openembedded.org (Postfix) with ESMTP id DF85260290
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Jan 2017 22:50:25 +0000 (UTC)
Received: by mail-pf0-f175.google.com with SMTP id 127so1246601pfg.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Jan 2017 14:50:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ettus-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=E5aEZn/DJvp9g2apMm4PdmGskzKg1r9oSrrncDvIi9M=;
	b=knvIqIvLzwCs6cusmTItszGDhw4XtvfYKQ81xGRYt9H1YkQA77w4qcsaj2T6vR1/3H
	0O08xTOkl86vGpvrzxhvo6xgeqgF81sM5RgYbneHa5W5Laf2G7yu9hIrC3KYfVfpwR6o
	DIB5Pn/a4aYGlbH4/lm45XZPwFvzdfqJzhQ7x/Zq/DimmIVSthUnOthgCiwIvyeORHhz
	ygahm4XR87LFq+EfHcWRxmMpxG1Yh5jJ7RLyoQqaAPQmcBlI/iO//asU1sC+6ja0K+Bd
	KUddfvvipfpAyrLHOfSoB1rgQyZx5PNo+wso/Yf/LBJUE9RrmUPZsg/JMsSayHOZJSlk
	v4kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=E5aEZn/DJvp9g2apMm4PdmGskzKg1r9oSrrncDvIi9M=;
	b=eyjqHM+GK1uv8MW0poOQ4/BiVUWA5YWHIKvAv+F9ZfA27zIsDcQ++b85NYtZHc92eM
	ujly+gQMxcmW4hf6uqP/64l1LwTtZRVnqzFq13Yt7MuDSIwj1Zgt+d1U+napu2KJcms/
	B0uUzfSqf956CjX6cZRmUbam4fX/VoRGneCSWi7UL6Sedu5M9C4SawrPbdZRrhXOvDop
	OIINdwCW2QyaXPMcWivu7MAiB1AD3WLFeN4X5CwKN5XZeZCt80OsL88bnfukt9Fugo/3
	l9nQxCNKXx4DGXglBw/AZU2oqrfLr8vgSUM0imbsVoMgQuBGST27cvfkAUbb0BHYKKRc
	zJWg==
X-Gm-Message-State: AIkVDXKhBilY2UUqeEydMOxf1m32T1eCnx79GreK9rXU816EHfQmvH3Dp29Wj/i54kEbbKG6
X-Received: by 10.84.232.141 with SMTP id i13mr13371166plk.119.1484175025618; 
	Wed, 11 Jan 2017 14:50:25 -0800 (PST)
Received: from tyrael.amer.corp.natinst.com
	(207-114-172-147.static.twtelecom.net. [207.114.172.147])
	by smtp.gmail.com with ESMTPSA id
	q145sm16150519pfq.22.2017.01.11.14.50.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 11 Jan 2017 14:50:25 -0800 (PST)
From: Moritz Fischer <moritz.fischer@ettus.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 11 Jan 2017 14:50:13 -0800
Message-Id: <1484175013-360-1-git-send-email-moritz.fischer@ettus.com>
X-Mailer: git-send-email 2.7.4
Cc: koen@dominion.thruhere.net, mdf@kernel.org
Subject: [meta-oe][PATCH v5] Chromium-utils: add recipe for Chromium Embedded Controller utilities
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
X-List-Received-Date: Wed, 11 Jan 2017 22:50:26 -0000

Add a recipe to build 'ectool' a utility to interact with the embedded
controller on Google's chromebooks (and other platforms using it).

Signed-off-by: Moritz Fischer <moritz.fischer@ettus.com>
---
Changes from v1:

- Replaced DESCRIPTION with SUMMARY (Martin)
- Use EXTRA_OEMAKE (Martin)
- Removed FILESEXTRAPATHS (Martin)
- Changed PV (Martin / Khem)
- Removed FILES_PN (Khem)

Changes from v2:

- Changed PV (Martin)

Changes from v3:

- Patch now against meta-oe (Khem, Ross)
- No longer need patch for HOST_LDFLAGS since merged upstream

Changes from v4:
- Change commitmsg (Koen)
- Install to ${sbindir} vs ${bindir} (Koen)

---

 .../chromium-utils/chromium-utils.bb               | 23 ++++++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/chromium-utils/chromium-utils.bb

diff --git a/meta-oe/recipes-devtools/chromium-utils/chromium-utils.bb b/meta-oe/recipes-devtools/chromium-utils/chromium-utils.bb
new file mode 100644
index 0000000..c3c465e
--- /dev/null
+++ b/meta-oe/recipes-devtools/chromium-utils/chromium-utils.bb
@@ -0,0 +1,23 @@
+SUMMARY = "Chromium EC utilities"
+DEPENDS = "libftdi"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=562c740877935f40b262db8af30bca36"
+
+SRCREV = "a7bf207add71cfb20308ed6858b1b028c866304a"
+SRC_URI = "git://chromium.googlesource.com/chromiumos/platform/ec;protocol=https \
+          "
+
+PV = "1.1.9999+gitr${SRCPV}"
+
+S = "${WORKDIR}/git"
+
+EXTRA_OEMAKE = "'HOSTCC=${CC}' 'HOSTCFLAGS=${CFLAGS}' 'HOST_LDFLAGS=${LDFLAGS}'"
+
+do_compile() {
+    oe_runmake utils
+}
+
+do_install() {
+    install -m 0755 -d ${D}${sbindir}
+    install -m 0755 ${S}/build/bds/util/ectool ${D}${sbindir}/ectool
+}
-- 
2.7.4


