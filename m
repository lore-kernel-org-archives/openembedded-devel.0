Return-Path: <moritz.fischer@ettus.com>
Received: from mail-pg0-f46.google.com (mail-pg0-f46.google.com [74.125.83.46])
	by mail.openembedded.org (Postfix) with ESMTP id 2D57171C5A
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Jan 2017 19:47:17 +0000 (UTC)
Received: by mail-pg0-f46.google.com with SMTP id 14so9999349pgg.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 Jan 2017 11:47:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ettus-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=a/mwEIn55J1sVL6EUHaScCm1SJK7qihor/Fm0Bd/8BI=;
	b=QHrkVPtj8+gPG3DnUVhRUm24+GPiMAtkJyYBGlniM7g8yMw5YEpLrMHQjsSvsfmubf
	IZ4ZXHZheVe/fkXU4XxCaADq2G46tIqGmzfwV+oqVfemgJ4+B9sPVord3SGLaKkxHliV
	zxY3WfFKhliSWMF+oBncJQWJag1SS5poaCYhggpQ9ct8VVQCmhR6MyIKffpqRGVH+gea
	JMdA80yM24+efrUFPLA4wiLFgM38EfxJIO5/6sO2NwlvZrhvnHhlUU8IuVu2xGqNj6ou
	ysmlEk35hCOX+XoCbEo1m6N6yRIWff6bc5t58fKOdTQPVoKg34I6twCJEJdXVFitMw4g
	rsFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=a/mwEIn55J1sVL6EUHaScCm1SJK7qihor/Fm0Bd/8BI=;
	b=HJrUq6w+9ePK47ToDebsd3nFwvUfY9Gj4YEwBb+bBD2W4gnPDnSddcozOaEKHm+SRC
	4m+3beGRqt5U2B5lpI8AAUya0SwM2u419rKzTv54ybls+FRLnyOVxy4mptN6K0zDDi5J
	VgAhN3o6CblNIoTWLrLSc5YbCuCdNDovdRSpocO8PSCTKuLsGdS58gdM7ECJHcQ6WGP3
	uGQiFCPYlkrUtMN4ojXxfdLVlAOa6HMi9WdhLaS3QSoOQalZ0K5jLu9mXLDh/NhWJ6f+
	yQP37wXQtR6BfWKSQtkwDT7CJLENugZxxZru3bbKq6crwCGstpjVsvQAJvDgqo3t7O9K
	wtVA==
X-Gm-Message-State: AIkVDXLtnmn5kzBEYzeRrQo2tYwdaIz4FOWbg6uvbS6FGpkAZGiWinaEyoooBebhKtlYehFm
X-Received: by 10.84.210.130 with SMTP id a2mr171005412pli.106.1483732038164; 
	Fri, 06 Jan 2017 11:47:18 -0800 (PST)
Received: from tyrael.amer.corp.natinst.com
	(207-114-172-147.static.twtelecom.net. [207.114.172.147])
	by smtp.gmail.com with ESMTPSA id
	n84sm112337370pfk.25.2017.01.06.11.47.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Jan 2017 11:47:17 -0800 (PST)
From: Moritz Fischer <moritz.fischer@ettus.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  6 Jan 2017 11:47:00 -0800
Message-Id: <1483732020-31128-1-git-send-email-moritz.fischer@ettus.com>
X-Mailer: git-send-email 2.7.4
Cc: koen@dominion.thruhere.net, mdf@kernel.org
Subject: [meta-oe][PATCH v4] devtools: Add recipe for Chromium Embedded Controller utilities
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
X-List-Received-Date: Fri, 06 Jan 2017 19:47:18 -0000

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

---
 .../chromium-utils/chromium-utils.bb               | 23 ++++++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/chromium-utils/chromium-utils.bb

diff --git a/meta-oe/recipes-devtools/chromium-utils/chromium-utils.bb b/meta-oe/recipes-devtools/chromium-utils/chromium-utils.bb
new file mode 100644
index 0000000..49d2647
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
+    install -m 0755 -d ${D}${bindir}
+    install -m 0755 ${S}/build/bds/util/ectool ${D}${bindir}/ectool
+}
-- 
2.7.4


