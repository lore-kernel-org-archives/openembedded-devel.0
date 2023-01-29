Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AFB3C05027
	for <webhook@archiver.kernel.org>; Sun, 29 Jan 2023 17:25:42 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web11.20592.1675013140398666969
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 29 Jan 2023 09:25:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=UmilGm/3;
 spf=pass (domain: gmail.com, ip: 209.85.215.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f182.google.com with SMTP id q9so6154934pgq.5
        for <openembedded-devel@lists.openembedded.org>; Sun, 29 Jan 2023 09:25:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D+KMau2eIVPvAUZz87XmW5Td658HeOHA9GAVS75c+/A=;
        b=UmilGm/3rqzmnH/5uGzi2C8mSkismwKasyO8AUrqE64ixcZ1aRVYyZCBJD4/lDeRrz
         Ni1yymTt1+5cMokS3Uxf8/2Yc+FB3vFh6+/rYyd6TWp8GAnPVbXrnXqojIg6K8MGrdd/
         IWOSLTOjKfGG7nlC5PI518cxGsbwV5JFHlXSwztb4+nFuAs9ityjdzU34FayDuyATNh8
         a5pMIplVjntD2dr9pWVG4qaIu9owJhZvWQDqvFaFO4/vl/ECbftSNmdp5yAndJKi1Wio
         2dGo9pUgEp0jBjv9B/xsp5Q3WWAcETmtVhazrSrvsyCp37lVfWYFj3J6dfqKd6zpbMIY
         487g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D+KMau2eIVPvAUZz87XmW5Td658HeOHA9GAVS75c+/A=;
        b=mTPlsHSJXL8dndojQoksVZwcDTSq8aLC5D7g14SIMUAZlDU+J0fZ7TrPT1N4NbVjGJ
         I0tqhbXEgBHVBqJeBaH9YLHv8VKinOd/DOqY5mM13q6DiSZn48di0uCwz5fo9ArOzeTH
         hI5Kf+PeWfxteoJKuRUF0THEPew22BzrFhnJCD4FpOi3tWb7OTOj39TiyZQ9ewiEG4we
         SUgxioljzPXsSUfn5ecxR+5buuf6Ky1h2FNTgsBuQIIxRyelyJXSnRIXIwJi1qjCxp+R
         NZcDCaQNLM+8U/nQYWjHUl9SZyckjf+sPwsDkdeLCD0si4+gM4zIOjVwWilKfLo2hv6s
         juhQ==
X-Gm-Message-State: AO0yUKXpFwvhArz31t5VZ5RtLzaKuqnzDGsQUX5pKPHiZ6nlGvZSatFk
	jN1UaKQEXR9ARSjflLZEnB8Kj0ReJGJ6qw==
X-Google-Smtp-Source: AK7set9hQ1OeJEHqCFCMfQgEuoSWA7TtuACIIaDW86iTQPaq0d9QNo3Trz1SaXBvaawlJKFiyGpfQg==
X-Received: by 2002:aa7:9183:0:b0:592:5dd5:7655 with SMTP id x3-20020aa79183000000b005925dd57655mr9769205pfa.28.1675013139538;
        Sun, 29 Jan 2023 09:25:39 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::aee3])
        by smtp.gmail.com with ESMTPSA id o3-20020a62cd03000000b0058a3d8eab6asm4972781pfg.134.2023.01.29.09.25.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jan 2023 09:25:39 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/2] openthread: Use __attribute__ ((unused)) instead of removing 't'
Date: Sun, 29 Jan 2023 09:25:35 -0800
Message-Id: <20230129172535.1185410-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230129172535.1185410-1-raj.khem@gmail.com>
References: <20230129172535.1185410-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 29 Jan 2023 17:25:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100833

This helps clang to not warn about this variable

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../openthread/ot-br-posix/mbedtls.patch              | 11 +----------
 .../openthread/ot-daemon/mbedtls.patch                | 11 +----------
 2 files changed, 2 insertions(+), 20 deletions(-)

diff --git a/meta-networking/recipes-connectivity/openthread/ot-br-posix/mbedtls.patch b/meta-networking/recipes-connectivity/openthread/ot-br-posix/mbedtls.patch
index 91b3046484..23e4368d27 100644
--- a/meta-networking/recipes-connectivity/openthread/ot-br-posix/mbedtls.patch
+++ b/meta-networking/recipes-connectivity/openthread/ot-br-posix/mbedtls.patch
@@ -17,19 +17,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  void mpi_mul_hlp( size_t i, mbedtls_mpi_uint *s, mbedtls_mpi_uint *d, mbedtls_mpi_uint b )
  {
 -    mbedtls_mpi_uint c = 0, t = 0;
-+    mbedtls_mpi_uint c = 0;
++    mbedtls_mpi_uint c = 0, t __attribute__ ((unused)) = 0;
  
  #if defined(MULADDC_HUIT)
      for( ; i >= 8; i -= 8 )
-@@ -1595,8 +1595,6 @@ void mpi_mul_hlp( size_t i, mbedtls_mpi_
-     }
- #endif /* MULADDC_HUIT */
- 
--    t++;
--
-     do {
-         *d += c; c = ( *d < c ); d++;
-     }
 --- a/third_party/openthread/repo/third_party/mbedtls/repo/CMakeLists.txt
 +++ b/third_party/openthread/repo/third_party/mbedtls/repo/CMakeLists.txt
 @@ -192,7 +192,7 @@ if(CMAKE_COMPILER_IS_GNU)
diff --git a/meta-networking/recipes-connectivity/openthread/ot-daemon/mbedtls.patch b/meta-networking/recipes-connectivity/openthread/ot-daemon/mbedtls.patch
index be26a20dad..ffaff48dd4 100644
--- a/meta-networking/recipes-connectivity/openthread/ot-daemon/mbedtls.patch
+++ b/meta-networking/recipes-connectivity/openthread/ot-daemon/mbedtls.patch
@@ -17,19 +17,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  void mpi_mul_hlp( size_t i, mbedtls_mpi_uint *s, mbedtls_mpi_uint *d, mbedtls_mpi_uint b )
  {
 -    mbedtls_mpi_uint c = 0, t = 0;
-+    mbedtls_mpi_uint c = 0;
++    mbedtls_mpi_uint c = 0, t __attribute__ ((unused)) = 0;
  
  #if defined(MULADDC_HUIT)
      for( ; i >= 8; i -= 8 )
-@@ -1595,8 +1595,6 @@ void mpi_mul_hlp( size_t i, mbedtls_mpi_
-     }
- #endif /* MULADDC_HUIT */
- 
--    t++;
--
-     do {
-         *d += c; c = ( *d < c ); d++;
-     }
 --- a/third_party/mbedtls/repo/CMakeLists.txt
 +++ b/third_party/mbedtls/repo/CMakeLists.txt
 @@ -192,7 +192,7 @@ if(CMAKE_COMPILER_IS_GNU)
-- 
2.39.1


