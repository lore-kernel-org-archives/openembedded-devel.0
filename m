Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web09.12561.1629882280530588490
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Aug 2021 02:04:41 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: changqing.li@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 17P94c8j021986
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Wed, 25 Aug 2021 02:04:39 -0700
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 25 Aug 2021 02:04:38 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Wed, 25 Aug 2021 02:04:38 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Wed, 25 Aug 2021 02:04:37 -0700
From: "Changqing Li" <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [hardknott][meta-oe][PATCH] linuxptp: upgrade 3.1 -> 3.1.1
Date: Wed, 25 Aug 2021 17:01:09 +0800
Message-ID: <20210825090109.41340-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

* fix WARNING: linuxptp-3.1-r0 do_fetch: Failed to fetch URL
http://sourceforge.net/projects/linuxptp/files/v3.1/linuxptp-3.1.tgz,
attempting MIRRORS if available

linuxptp-3.1.tgz replace by linuxptp-3.1.1.tgz

* 3.1.1 release note
Version 3.1.1

Fixes:

    CVE-2021-3570 linuxptp: missing length check of forwarded messages
    CVE-2021-3571 linuxptp: wrong length of one-step follow-up in transparent clock

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../linuxptp/{linuxptp_3.1.bb => linuxptp_3.1.1.bb}         | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-connectivity/linuxptp/{linuxptp_3.1.bb => linuxptp_3.1.1.bb} (73%)

diff --git a/meta-oe/recipes-connectivity/linuxptp/linuxptp_3.1.bb b/meta-oe/recipes-connectivity/linuxptp/linuxptp_3.1.1.bb
similarity index 73%
rename from meta-oe/recipes-connectivity/linuxptp/linuxptp_3.1.bb
rename to meta-oe/recipes-connectivity/linuxptp/linuxptp_3.1.1.bb
index c8527260b..6f2f1b46d 100644
--- a/meta-oe/recipes-connectivity/linuxptp/linuxptp_3.1.bb
+++ b/meta-oe/recipes-connectivity/linuxptp/linuxptp_3.1.1.bb
@@ -2,13 +2,13 @@ DESCRIPTION = "Precision Time Protocol (PTP) according to IEEE standard 1588 for
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-SRC_URI = "http://sourceforge.net/projects/linuxptp/files/v${PV}/linuxptp-${PV}.tgz \
+SRC_URI = "http://sourceforge.net/projects/linuxptp/files/v3.1/linuxptp-${PV}.tgz \
            file://build-Allow-CC-and-prefix-to-be-overriden.patch \
            file://Use-cross-cpp-in-incdefs.patch \
            "
 
-SRC_URI[md5sum] = "2264cb69c9af947028835c12c89a7572"
-SRC_URI[sha256sum] = "f58f5b11cf14dc7c4f7c9efdfb27190e43d02cf20c3525f6639edac10528ce7d"
+SRC_URI[md5sum] = "3b79ab5e77c5b5cf06bc1c8350d405bb"
+SRC_URI[sha256sum] = "94d6855f9b7f2d8e9b0ca6d384e3fae6226ce6fc012dbad02608bdef3be1c0d9"
 
 EXTRA_OEMAKE = "ARCH=${TARGET_ARCH} EXTRA_CFLAGS='${CFLAGS}'"
 
-- 
2.17.1

