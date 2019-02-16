Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
	[209.85.210.170])
	by mail.openembedded.org (Postfix) with ESMTP id 12BBA600E3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Feb 2019 05:58:43 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id j5so1391374pfa.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Feb 2019 21:58:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=URFh9RTTcM9ZoPwk1SjzGa7FDrHKkQy0J33hPGL3gTw=;
	b=ntiO8g+jvaq/nas51RWgCHTfW+qt9Obyd4bwzuCFJyCyXRw3GMLoZHROchf8PoiTCH
	xDZt3XXXbDDLlQq52aiUGGHhJl0pInBT+aQSveOGFB8mabiPQRLUV1PX/SIYxQcObO4p
	iRgVIs+wjAL09raRo4COKG0Q0aj8PwIeUvYX8tAfH8P2SQZhvO2TP9Wz/q3GkICZ7jct
	Z20Voht3xwT1I6dRbErl68Z1wZHMfESj3i4tDab1DGOW2jbYt2cRSEbWy/xSLxLh7gI8
	ZN43sEtrT6TxD4RUTYBv5HkHGJvmJNEruXZhh8DqM9B/XjaMSB/QaAGe9y8d33ZDLnng
	m5bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=URFh9RTTcM9ZoPwk1SjzGa7FDrHKkQy0J33hPGL3gTw=;
	b=pYOLoyeC+91nBdcpUxl4s5eTxDiT3KcGoIEuCKqsdLJXwtAi7kYhFExzEZC07JAezi
	TlF0H9pk/nLeZ+7Zz3GGYXnMNFAtf6DP0vJw4HR6MfAU0+t8Jw0ae1gFuseiICVxkorI
	138Dlh4HFqFFm54bFaaYXMX+EoM4bjdf16SpAABdRu66bLHzqa23o6DVAC3BznY3RE2T
	1Sk4+dPnER0sJbkfegWU5TGHZMp/+xGVVrTBLWaAFZcrLJObaSbVBSbrL01FeJfBfUdP
	yrz6XUdrCRQ7hfm4ZJqtA76TJ890nRiL2tVdeQpnIiOYnmq8xS7dCbfQdlOI2N4hLecp
	EnEg==
X-Gm-Message-State: AHQUAuZvXPFEybTeVkHj5v7TA5bawv08BpzbNGBwpqPLkUbjA86NbYC0
	w9MYj2j5uHTptgMJDqY9AcJAx2Lz
X-Google-Smtp-Source: AHgI3IZZhGoUmp5XNzioUT7jmkFWRNASUOIWjkkOv+mrdyxufUcL/ADr7yVGkL5nQJKKYXn/C2fcUA==
X-Received: by 2002:a65:514c:: with SMTP id g12mr8736249pgq.169.1550296724462; 
	Fri, 15 Feb 2019 21:58:44 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::dc44])
	by smtp.gmail.com with ESMTPSA id
	b9sm9124494pfi.118.2019.02.15.21.58.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 15 Feb 2019 21:58:43 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 15 Feb 2019 21:58:36 -0800
Message-Id: <20190216055836.39541-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [meta-networking][PATCH] znc: Strip out DEBUG_PREFIX_MAP options and --sysroot from znc.pc
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
X-List-Received-Date: Sat, 16 Feb 2019 05:58:44 -0000
Content-Transfer-Encoding: 8bit

This fixes issues e.g.
ERROR: znc-1.7.1-r0 do_populate_sysroot: QA Issue: znc.pc failed sanity test (tmpdir) in path /mnt/a/yoe/build/tmp/work/aarch64-yoe-linux/znc/1.7.1-r0/sysroot-destdir/usr/lib/pkgconfig [pkgconfig]
ERROR: znc-1.7.1-r0 do_populate_sysroot: QA staging was broken by the package built above

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-irc/znc/znc_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-irc/znc/znc_git.bb b/meta-networking/recipes-irc/znc/znc_git.bb
index 8c6979c2e2..728ef87463 100644
--- a/meta-networking/recipes-irc/znc/znc_git.bb
+++ b/meta-networking/recipes-irc/znc/znc_git.bb
@@ -30,5 +30,5 @@ do_configure_prepend() {
 }
 
 do_install_append() {
-    sed -i 's/-fdebug-prefix-map[^ ]*//g; s#${STAGING_DIR_TARGET}##g' ${D}${libdir}/pkgconfig/*.pc
+    sed -i -e 's|${DEBUG_PREFIX_MAP}||g; s|--sysroot=${STAGING_DIR_TARGET}||g' ${D}${libdir}/pkgconfig/*.pc
 }
-- 
2.20.1


