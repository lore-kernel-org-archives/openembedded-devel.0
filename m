Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88627C6FA89
	for <webhook@archiver.kernel.org>; Sun,  4 Sep 2022 07:34:54 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web12.11493.1662276887486390260
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Sep 2022 00:34:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=bEXY2yUH;
 spf=pass (domain: gmail.com, ip: 209.85.214.176,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id x1so1418785plv.5
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Sep 2022 00:34:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=G7Bqpq3g2Gh1NplVuj4rPhfdZaDP2XixZIbO9leZuTc=;
        b=bEXY2yUHVCqYNNDFemS4VGTldTSG0+QwnD6YzCRVhIaTl1x33WHRa914fqq4hEaaLE
         Kp1EpBAvQevgIm5v7y3PMyYx+bwbonzKLlDUbL8BVfSRFG9u+nsCvYEwHvev1lCyl5vs
         /05uv1iR42eLfUQwhmS28Xu59wOLhbFjfaOvpkxdPxZXimcrTCyl2fdZ0GaFTXhYxjkK
         qZQt5/w08IFRs7+97Xrt6WzWMQIEIOjOC3Eiq/5Fb+ai5wcFFzphGpUxIDI8abmveSdk
         Ae70CHxbHXRxyf8JWF5Hc6zCWa5OKnPvXBG5irk1jelSJ2fMsy0JsknKU6zM/Z+5AI8H
         e2bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=G7Bqpq3g2Gh1NplVuj4rPhfdZaDP2XixZIbO9leZuTc=;
        b=OG4WwBUm9yt5BWgJ7dlvLRpfn0G0TdF/gKFDFH7CpISw2rNxAvuEPAd/+y0nyz9TbP
         OF0fm3U9posfItfuZvJTKZ99JtNsfj2ruyYuolrqMbhj5Jblz8Odcm9IyS+VJd2072Be
         ryF6HCcQNIWaYWJ6vE6twJjCzr9nkYpbE4fcz+ZG1rdXPm+VuzXkmWJ8fPOVtx8kxoEl
         Q4NYW86cyvr3wnm1JDZKPEL1D2qOMgAfGhEP9Fr/NuDTo41CN87zYQxoRcYVoDpK7NoC
         rCgW7YXqXLgiivrF5sSzBTxsBqiDZkn7rZk0PfFI+oFTEMcECzH4DSxwtv1Y/jZvCaX1
         fbmw==
X-Gm-Message-State: ACgBeo0P2p+TFH4+/M47RSnFmKbl+WoLXYB4XCeexmK4wv+7Iq9Drbor
	6/a5r1gFQlq7fWUxQRk0MRsUMnf21zlwHg==
X-Google-Smtp-Source: 
 AA6agR6yjqHV1AHcaooOroTrpQ/4H/e6XpNO/peJE2hok5gb2S4kGdlQbMp2JHOcVBukEkrvhnUHFg==
X-Received: by 2002:a17:90b:3e81:b0:1fd:8357:cbc8 with SMTP id
 rj1-20020a17090b3e8100b001fd8357cbc8mr13937853pjb.48.1662276886555;
        Sun, 04 Sep 2022 00:34:46 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::48c3])
        by smtp.gmail.com with ESMTPSA id
 w11-20020a62820b000000b00537a38ec2c6sm5089800pfd.164.2022.09.04.00.34.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Sep 2022 00:34:45 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 25/63] srecord: Fix AC_CHECK_LIB for gpg-error
Date: Sun,  4 Sep 2022 00:33:39 -0700
Message-Id: <20220904073417.3251865-25-raj.khem@gmail.com>
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
 https://lists.openembedded.org/g/openembedded-devel/message/98619

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-Fix-AC_CHECK_LIB-test-for-gpg-error.patch | 29 +++++++++++++++++++
 .../recipes-support/srecord/srecord_1.64.bb   |  1 +
 2 files changed, 30 insertions(+)
 create mode 100644 meta-oe/recipes-support/srecord/files/0001-configure-Fix-AC_CHECK_LIB-test-for-gpg-error.patch

diff --git a/meta-oe/recipes-support/srecord/files/0001-configure-Fix-AC_CHECK_LIB-test-for-gpg-error.patch b/meta-oe/recipes-support/srecord/files/0001-configure-Fix-AC_CHECK_LIB-test-for-gpg-error.patch
new file mode 100644
index 0000000000..9a411f05d4
--- /dev/null
+++ b/meta-oe/recipes-support/srecord/files/0001-configure-Fix-AC_CHECK_LIB-test-for-gpg-error.patch
@@ -0,0 +1,29 @@
+From f9e50aba10f9d2c58e5d88f51810ca7143f4372b Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 1 Sep 2022 13:20:01 -0700
+Subject: [PATCH] configure: Fix AC_CHECK_LIB test for gpg-error
+
+Use check function which is found in libgpg-error
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ etc/configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/etc/configure.ac b/etc/configure.ac
+index d4ae290..ea0936d 100644
+--- a/etc/configure.ac
++++ b/etc/configure.ac
+@@ -30,7 +30,7 @@ AC_CHECK_PROGS(SOELIM, gsoelim soelim roffpp)
+ AC_CHECK_FUNCS(snprintf vsnprintf)
+ 
+ dnl! This is needed for MingGW build, but not for Unix or Linux, etc.
+-AC_CHECK_LIB(gpg-error, main)
++AC_CHECK_LIB(gpg-error, gpg_strerror_r)
+ 
+ dnl! @synopsis AC_ADD_CFLAGS
+ dnl!
+-- 
+2.37.3
+
diff --git a/meta-oe/recipes-support/srecord/srecord_1.64.bb b/meta-oe/recipes-support/srecord/srecord_1.64.bb
index 5765272ce8..0629c0f648 100644
--- a/meta-oe/recipes-support/srecord/srecord_1.64.bb
+++ b/meta-oe/recipes-support/srecord/srecord_1.64.bb
@@ -7,6 +7,7 @@ SRC_URI = " \
     http://srecord.sourceforge.net/srecord-${PV}.tar.gz \
     file://add-option-to-remove-docs.patch \
     file://libtool.patch \
+    file://0001-configure-Fix-AC_CHECK_LIB-test-for-gpg-error.patch \
 "
 
 SRC_URI[md5sum] = "4de4a7497472d7972645c2af91313769"
-- 
2.37.3


