Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63CB6C4332F
	for <webhook@archiver.kernel.org>; Sat, 16 Oct 2021 16:52:28 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web09.12663.1634403147650965236
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 16 Oct 2021 09:52:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=RKiUJW45;
 spf=pass (domain: gmail.com, ip: 209.85.214.175,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id t11so8398930plq.11
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 16 Oct 2021 09:52:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MnsJbaUbe7EWG7S+Sa7H9HoKcg9jGjiM4pi2ii9Vj+w=;
        b=RKiUJW45MpO6Twa5jd+dY9mxoc/WYkIoF572+p8T3SSTlag2tfLVaYd80qnBiADiat
         VrbuSEQ02XCJljrSvLtHmsTAMYmQwwJyyN5AWSOurDr0BawS5wEHcwFwmVlD0qGr6XJ6
         i1WBPFzl8ONYpumbutIeK8ah+awcGK+9wQUBtQ5tKiVYMeMOzR/cI386uZlf+/kZ+X4Y
         YKUwSQnzANK7MFD+Mx1mwOE36jj3yi0AO0XCHoaoEjVxV3bmcT7mEyN29DIXsGX6K4Fe
         Z7Vl+W67Qz4PPTYqJoZeWwFHbvt38r/IAcyjSBpWa54kRcXxv2XCJg9nm2iTsY1uTC6B
         MG7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MnsJbaUbe7EWG7S+Sa7H9HoKcg9jGjiM4pi2ii9Vj+w=;
        b=sZyEUqDq3oCCLyOtO4XdlSqzbwEsilLV6MNkFpEPWlTDwi+qOT3gzY2p0YQCfjcOXV
         Lg0BL5rAAQ9Z5Whzm9nHG1UYjI4xAREmYYifWVo1luwC2GcYNVcWAhKSFUZ5xWEOcbmk
         WWvcvtsY6Vy0Wi3ELynjAjYs8DzDPM2QykMvP5ZOfJJWOc2PzLCKZEfYcM1ulVPJK480
         DHaQfi4MdkFJdHBuA9hfdi2o1W2yHO1GrN1qcSOPRLWtDO3ld/z+z0FhEkdHElyLznVM
         3otP6ugBHANXpDxFAefJGq9l+HktdtnLqz4RpV0m9dnyGrRR+92cA0ZFLqY2EfAXeDQH
         cf2g==
X-Gm-Message-State: AOAM531BzPQ3/OGbQxgzHwIkNUIY2AX8OTlbyNE6PWSaHxFPJMms3bjv
	FgzW7QOhlxXJ+/YVA4vCdvt8DtsCxyWBXw==
X-Google-Smtp-Source: 
 ABdhPJzJiUItf6jM3GqO+QHfCpy8xRNU0yNjJc/l/I7gvJJmsPhkELEhNpcUC7NGPDq0BOROymWSeA==
X-Received: by 2002:a17:903:2451:b0:13f:297b:829e with SMTP id
 l17-20020a170903245100b0013f297b829emr17458900pls.45.1634403146976;
        Sat, 16 Oct 2021 09:52:26 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::3fd8])
        by smtp.gmail.com with ESMTPSA id
 i2sm8740756pjt.21.2021.10.16.09.52.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Oct 2021 09:52:26 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-perl][PATCH 2/3] libcrypt-openssl-rsa-perl: Fix build with
 openssl3+
Date: Sat, 16 Oct 2021 09:52:22 -0700
Message-Id: <20211016165223.1271496-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211016165223.1271496-1-raj.khem@gmail.com>
References: <20211016165223.1271496-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 16 Oct 2021 16:52:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93404

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../files/0001-Fix-for-Issue-31.patch         | 37 +++++++++++++++++++
 .../libcrypt-openssl-rsa-perl_0.32.bb         |  4 +-
 2 files changed, 40 insertions(+), 1 deletion(-)
 create mode 100644 meta-perl/recipes-perl/libcrypt/files/0001-Fix-for-Issue-31.patch

diff --git a/meta-perl/recipes-perl/libcrypt/files/0001-Fix-for-Issue-31.patch b/meta-perl/recipes-perl/libcrypt/files/0001-Fix-for-Issue-31.patch
new file mode 100644
index 0000000000..a5ea43f88b
--- /dev/null
+++ b/meta-perl/recipes-perl/libcrypt/files/0001-Fix-for-Issue-31.patch
@@ -0,0 +1,37 @@
+From 5e8202458e41ba1f7801746c503fe7c60ae340d5 Mon Sep 17 00:00:00 2001
+From: kambe-mikb <77083885+kambe-mikb@users.noreply.github.com>
+Date: Tue, 28 Sep 2021 17:40:18 +1000
+Subject: [PATCH] Fix for Issue 31
+
+Fix Issue 31 by removing reference to RSA_SSLV23_PADDING (removed from OpenSSL starting from v3.0.0)
+
+Upstream-Status: Submitted [https://github.com/toddr/Crypt-OpenSSL-RSA/pull/32]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ RSA.xs | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/RSA.xs b/RSA.xs
+index 46cb199..4f65dfc 100644
+--- a/RSA.xs
++++ b/RSA.xs
+@@ -640,12 +640,16 @@ use_pkcs1_oaep_padding(p_rsa)
+   CODE:
+     p_rsa->padding = RSA_PKCS1_OAEP_PADDING;
+ 
++#if OPENSSL_VERSION_NUMBER < 0x30000000L
++
+ void
+ use_sslv23_padding(p_rsa)
+     rsaData* p_rsa;
+   CODE:
+     p_rsa->padding = RSA_SSLV23_PADDING;
+ 
++#endif
++
+ # Sign text. Returns the signature.
+ 
+ SV*
+-- 
+2.33.1
+
diff --git a/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-rsa-perl_0.32.bb b/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-rsa-perl_0.32.bb
index 48c04531ec..8dd2574e97 100644
--- a/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-rsa-perl_0.32.bb
+++ b/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-rsa-perl_0.32.bb
@@ -3,7 +3,9 @@ SECTION = "libs"
 LICENSE = "Artistic-1.0 | GPL-1.0+"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a67ceecc5d9a91a5a0d003ba50c26346"
 
-SRC_URI = "http://www.cpan.org/modules/by-module/Crypt/Crypt-OpenSSL-RSA-${PV}.tar.gz "
+SRC_URI = "http://www.cpan.org/modules/by-module/Crypt/Crypt-OpenSSL-RSA-${PV}.tar.gz \
+           file://0001-Fix-for-Issue-31.patch \
+"
 
 SRC_URI[sha256sum] = "adc74f0ae125c77f65d5dd32abb9c3429300a79543bf263494f333f9c0b62a61"
 
-- 
2.33.1


