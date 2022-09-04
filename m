Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92E78C6FA8D
	for <webhook@archiver.kernel.org>; Sun,  4 Sep 2022 07:34:54 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
 [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web10.11310.1662276865171884035
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Sep 2022 00:34:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=eaiWhZO0;
 spf=pass (domain: gmail.com, ip: 209.85.215.169,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f169.google.com with SMTP id bh13so5608222pgb.4
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Sep 2022 00:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=lkkScy6qXZp7pV/GUaMh1Wmv/G2HG6KbdL+pAotIUzE=;
        b=eaiWhZO0ZkCTxz0XZEhUtnYhr/XsmqU4W3g37TqBgeP+JO5cBhsgsech6eXperikS8
         JIJLys4bS0nbMvpMiWLbkX5y0d53qKb8AIXQK8KyVNLQTlJ3sHnneDIwq/CWb1APlPkv
         JjVxKHc5HbSbsRiT4bn1I1XD26pV+2XrAKMVjjAGCcAE9Bv/N3ceqQU0q84S8b5t++oK
         sV8UP+f5plgdSpeeGvigsTX5q/nBDlCUPV+yIC1EszNP4fnnHk07/lIzUigxlm4e+Kbt
         a6qIaE6+Dr2TwfMdav8DrHrzAbJK4goRVMTBSvKhr2MdwVJLkXte7aZHIqTIwfAfEo5B
         InWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=lkkScy6qXZp7pV/GUaMh1Wmv/G2HG6KbdL+pAotIUzE=;
        b=IsXayBH0qLizeU1gSJUaBB+d5p9qckIi9eYVUADwfQaiiCeWs54Y6imKmSZOCgnUX2
         i05MND2eSJGNopXYorBNRhczXJWJtn/BQJlyvbv8SI5P6WbHhrqa42xfJ58d9s3EHTVE
         9Lg1gPW2MEp8Em8ivha6bwcVBOUtoQv/X4V8aS7Nr1MIjDAljqZOHNIhoPdeMztcnHKT
         infrq+4vhos0to1GNP+Th0ZTDB5LGsEqxIhsbCWGcccLrRJp8BvFabsAcgbQV49OB7Ot
         ICWNVNXEIoTSf/3C4cxOhSMpvwYBFUkMYpXe9quWxdlkJW2U+Z2mYqon/0NGWXp/tPUJ
         G/Ug==
X-Gm-Message-State: ACgBeo2tqPn3fZFuBdYyvIBz23iUvtbf2rH+aQ2MrL93MlDLx69ELX0K
	QCusYHCXVIO+HaLepyxPm65T/Cdat0Hvxg==
X-Google-Smtp-Source: 
 AA6agR6EdZFP4dUUbnErYlvZ9IpQWapsAR8mvYv73Uqt4HmoHZsYcHDiDp/sknpD3aoXldQRCl/RUg==
X-Received: by 2002:a63:5a61:0:b0:41b:b021:f916 with SMTP id
 k33-20020a635a61000000b0041bb021f916mr36404842pgm.387.1662276885494;
        Sun, 04 Sep 2022 00:34:45 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::48c3])
        by smtp.gmail.com with ESMTPSA id
 w11-20020a62820b000000b00537a38ec2c6sm5089800pfd.164.2022.09.04.00.34.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Sep 2022 00:34:45 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 24/63] rdfind: Fix AC_CHECK_LIB for libnettle
Date: Sun,  4 Sep 2022 00:33:38 -0700
Message-Id: <20220904073417.3251865-24-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220904073417.3251865-1-raj.khem@gmail.com>
References: <20220904073417.3251865-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 04 Sep 2022 07:34:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98618

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...configure-Fix-check-for-AC_CHECK_LIB.patch | 30 +++++++++++++++++++
 .../recipes-support/rdfind/rdfind_1.4.1.bb    |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta-oe/recipes-support/rdfind/rdfind/0001-configure-Fix-check-for-AC_CHECK_LIB.patch

diff --git a/meta-oe/recipes-support/rdfind/rdfind/0001-configure-Fix-check-for-AC_CHECK_LIB.patch b/meta-oe/recipes-support/rdfind/rdfind/0001-configure-Fix-check-for-AC_CHECK_LIB.patch
new file mode 100644
index 0000000000..754c388ae9
--- /dev/null
+++ b/meta-oe/recipes-support/rdfind/rdfind/0001-configure-Fix-check-for-AC_CHECK_LIB.patch
@@ -0,0 +1,30 @@
+From 823a4deb61f6f9b91b0cfc4a7e7b20922c635777 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 1 Sep 2022 13:13:50 -0700
+Subject: [PATCH] configure: Fix check for AC_CHECK_LIB
+
+Check for nettle_pbkdf2_hmac_sha256 from libnettle instead of main()
+which is not in nettle library
+
+Upstream-Status: Submitted [https://github.com/pauldreik/rdfind/pull/115]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index be1b2fd..157a7d7 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -46,7 +46,7 @@ AC_CHECK_HEADER(nettle/sha.h,,[AC_MSG_ERROR([
+  On Debian-ish systems, use "apt-get install nettle-dev" to get a system
+  wide nettle install.
+ ])]) 
+-AC_CHECK_LIB(nettle,main,,[AC_MSG_ERROR([
++AC_CHECK_LIB(nettle,nettle_pbkdf2_hmac_sha256,,[AC_MSG_ERROR([
+  Could not link to libnettle. Please install nettle
+  first. If you have already done so; please run ldconfig
+  as root or check whether the path libnettle was installed
+-- 
+2.37.3
+
diff --git a/meta-oe/recipes-support/rdfind/rdfind_1.4.1.bb b/meta-oe/recipes-support/rdfind/rdfind_1.4.1.bb
index 64ae62a2d3..f8eb5d38d4 100644
--- a/meta-oe/recipes-support/rdfind/rdfind_1.4.1.bb
+++ b/meta-oe/recipes-support/rdfind/rdfind_1.4.1.bb
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=fa22e16ebbe6638b2bd253338fbded9f"
 DEPENDS = "nettle autoconf-archive"
 
 SRC_URI = "https://rdfind.pauldreik.se/${BP}.tar.gz \
+           file://0001-configure-Fix-check-for-AC_CHECK_LIB.patch \
 "
 
 SRC_URI[md5sum] = "180418c863b861d1df221bc486a07ce7"
-- 
2.37.3


