Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f53.google.com (mail-pg0-f53.google.com [74.125.83.53])
	by mail.openembedded.org (Postfix) with ESMTP id 2F54678270
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Jun 2017 13:00:24 +0000 (UTC)
Received: by mail-pg0-f53.google.com with SMTP id f127so63503119pgc.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Jun 2017 06:00:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=YqDdJL7uLVYs36dfMQDyOLKR6nIfrA0MUZ1mAR6p1lk=;
	b=qP2lUK160p+x9K4OeKuT280VH0wyU7S8mGopwOBSWnHtvoCUDHDNx380EWJciQSiox
	PolFvzwJs3NEc9nUUBAsUBOvCP58SHS0KCGnYXG2CzLcBQNyhKzcunLTF0DyqRvUX2yC
	H6DWKn0fW+9FjDLntVSMxQG8h0Bont6uMzoXs9Ua4g0ADwrXtbFheS3xAdvRGPsWIpva
	0WT1/SFyXgqqFaJTh+SHsbdJIQ6pMQKq7mJHnLqayQ6hJH0/vgbDh/hJNRBmJZovIOFQ
	mvEVJywy78S+42A89X7BI37kWWl8emzUXMlVCdE8QhUGc/s32oGkkMBdAI2kOz5mXu14
	+0Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=YqDdJL7uLVYs36dfMQDyOLKR6nIfrA0MUZ1mAR6p1lk=;
	b=npmU5YzdNxWVJnIHZgE3E5kB2CNxw/MCIq1TUFlOamVNL0Fy0cerS0eNh5sIHwK45+
	MWXKQCAtfpNcgfrjjtj1Jpmro6EekG9VWi9q22FLQabxS3RwSlmoK0civmJy89a5YQmE
	JE2Ff3c/zPtBA5FjXopuJ1XwItCGD1ufLO/rm8UHJ/5YvoRLVM74UjmeylLEv93vN6zk
	DYOQSocC3FwRqyzHKhgVC3J3oq8MeZrTYYPFwCCd/Y17xOKM9djCMkglhv47bwQXrM7U
	98vNlzZJ8Kz4YQQonwwRsHdv29CRkWadL0FoXS3+u94c2uzXdMqAx8O0I08vP/uOlVDS
	d6Ww==
X-Gm-Message-State: AKS2vOxf3JQSiD/US2XmrmDVbRzHFxBXWgVsPaQYFYzv8RRn6+8HlN1R
	PLdyz8n8tX2TXrjj
X-Received: by 10.99.189.18 with SMTP id a18mr21126604pgf.195.1498827625941;
	Fri, 30 Jun 2017 06:00:25 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::3df3])
	by smtp.gmail.com with ESMTPSA id
	t26sm10735590pfl.41.2017.06.30.06.00.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 30 Jun 2017 06:00:24 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 30 Jun 2017 05:59:50 -0700
Message-Id: <20170630125957.3342-10-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <20170630125957.3342-1-raj.khem@gmail.com>
References: <20170630125957.3342-1-raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH 10/17] libsrtp: Fix build on mips
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
X-List-Received-Date: Fri, 30 Jun 2017 13:00:25 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-Rename-conflicting-variable-mips.patch    | 73 ++++++++++++++++++++++
 .../recipes-support/libsrtp/libsrtp_1.5.2.bb       |  4 +-
 2 files changed, 76 insertions(+), 1 deletion(-)
 create mode 100644 meta-multimedia/recipes-support/libsrtp/libsrtp/0001-Rename-conflicting-variable-mips.patch

diff --git a/meta-multimedia/recipes-support/libsrtp/libsrtp/0001-Rename-conflicting-variable-mips.patch b/meta-multimedia/recipes-support/libsrtp/libsrtp/0001-Rename-conflicting-variable-mips.patch
new file mode 100644
index 000000000..b56c78959
--- /dev/null
+++ b/meta-multimedia/recipes-support/libsrtp/libsrtp/0001-Rename-conflicting-variable-mips.patch
@@ -0,0 +1,73 @@
+From 3dc8a678a844247d0afcf7e30fb3cbd5ccbd828f Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 29 Jun 2017 14:05:06 -0700
+Subject: [PATCH] Rename conflicting variable 'mips'
+
+Fixes
+test/srtp_driver.c:344:12: error: expected identifier or '(' before numeric constant
+     double mips = mips_estimate(1000000000, &ignore);
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ test/srtp_driver.c | 20 ++++++++++----------
+ 1 file changed, 10 insertions(+), 10 deletions(-)
+
+diff --git a/test/srtp_driver.c b/test/srtp_driver.c
+index 8872971..d38ea19 100644
+--- a/test/srtp_driver.c
++++ b/test/srtp_driver.c
+@@ -341,7 +341,7 @@ main (int argc, char *argv[]) {
+   if (do_codec_timing) {
+     srtp_policy_t policy;
+     int ignore;
+-    double mips = mips_estimate(1000000000, &ignore);
++    double est = mips_estimate(1000000000, &ignore);
+ 
+     crypto_policy_set_rtp_default(&policy.rtp);
+     crypto_policy_set_rtcp_default(&policy.rtcp);
+@@ -353,33 +353,33 @@ main (int argc, char *argv[]) {
+     policy.allow_repeat_tx = 0;
+     policy.next = NULL;
+ 
+-    printf("mips estimate: %e\n", mips);
++    printf("mips estimate: %e\n", est);
+ 
+     printf("testing srtp processing time for voice codecs:\n");
+     printf("codec\t\tlength (octets)\t\tsrtp instructions/second\n");
+     printf("G.711\t\t%d\t\t\t%e\n", 80, 
+-           (double) mips * (80 * 8) / 
++           (double) est * (80 * 8) / 
+ 	   srtp_bits_per_second(80, &policy) / .01 );
+     printf("G.711\t\t%d\t\t\t%e\n", 160, 
+-           (double) mips * (160 * 8) / 
++           (double) est * (160 * 8) / 
+ 	   srtp_bits_per_second(160, &policy) / .02);
+     printf("G.726-32\t%d\t\t\t%e\n", 40, 
+-           (double) mips * (40 * 8) / 
++           (double) est * (40 * 8) / 
+ 	   srtp_bits_per_second(40, &policy) / .01 );
+     printf("G.726-32\t%d\t\t\t%e\n", 80, 
+-           (double) mips * (80 * 8) / 
++           (double) est * (80 * 8) / 
+ 	   srtp_bits_per_second(80, &policy) / .02);
+     printf("G.729\t\t%d\t\t\t%e\n", 10, 
+-           (double) mips * (10 * 8) / 
++           (double) est * (10 * 8) / 
+ 	   srtp_bits_per_second(10, &policy) / .01 );
+     printf("G.729\t\t%d\t\t\t%e\n", 20, 
+-           (double) mips * (20 * 8) /
++           (double) est * (20 * 8) /
+ 	   srtp_bits_per_second(20, &policy) / .02 );
+     printf("Wideband\t%d\t\t\t%e\n", 320, 
+-           (double) mips * (320 * 8) /
++           (double) est * (320 * 8) /
+ 	   srtp_bits_per_second(320, &policy) / .01 );
+     printf("Wideband\t%d\t\t\t%e\n", 640, 
+-           (double) mips * (640 * 8) /
++           (double) est * (640 * 8) /
+ 	   srtp_bits_per_second(640, &policy) / .02 );
+   }
+ 
+-- 
+2.13.2
+
diff --git a/meta-multimedia/recipes-support/libsrtp/libsrtp_1.5.2.bb b/meta-multimedia/recipes-support/libsrtp/libsrtp_1.5.2.bb
index 324982843..8abaa1284 100644
--- a/meta-multimedia/recipes-support/libsrtp/libsrtp_1.5.2.bb
+++ b/meta-multimedia/recipes-support/libsrtp/libsrtp_1.5.2.bb
@@ -5,7 +5,9 @@ SECTION = "libs"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=15bc16b9d2e305974dde47e733883714"
 
-SRC_URI = "https://github.com/cisco/libsrtp/archive/v${PV}.tar.gz;downloadfilename=${BP}.tar.gz"
+SRC_URI = "https://github.com/cisco/libsrtp/archive/v${PV}.tar.gz;downloadfilename=${BP}.tar.gz \
+           file://0001-Rename-conflicting-variable-mips.patch \
+           "
 SRC_URI[md5sum] = "2309aa6027992810a4285b042c71e644"
 SRC_URI[sha256sum] = "86e1efe353397c0751f6bdd709794143bd1b76494412860f16ff2b6d9c304eda"
 
-- 
2.13.2


