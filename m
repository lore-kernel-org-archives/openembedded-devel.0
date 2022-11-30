Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5A35C433FE
	for <webhook@archiver.kernel.org>; Wed, 30 Nov 2022 07:19:31 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web10.5178.1669792763294560203
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 29 Nov 2022 23:19:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=g71IuT1K;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id v3-20020a17090ac90300b00218441ac0f6so1460457pjt.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 29 Nov 2022 23:19:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x6pj+3AFHsXYYMmTdINfcrWwkpre9M2xGY5V2s9J388=;
        b=g71IuT1K+OEjI+TPIJh6GNf9PmGesyh8jcLQj3xyeWxy2oPqNQkdvpc/D+ZPo3QYb3
         0IfLY49qenuX/pOGQ872X20dWLUVWuRGlyGr3VCcA8LgrxWKzRNw4aFd59KTucgLTmBl
         zinw91pcm6/0N9nvCi8sDWFPmvSfkTgcfjYWcxUVyxtPV3CN2guOw+A+n/wBNasORZMI
         +BBXex7GVCiKofWZKVPURge2H5whswPO8Zn1yqK4wBVCG+Hqe4tQxjE+M6I60gMliWmW
         boXRnCnlTHWW2wbNu/nZhFRm50hAXOik51z+2yrATtdheZ4h/RoBVb1uo5sYhXG6mXp/
         bmSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x6pj+3AFHsXYYMmTdINfcrWwkpre9M2xGY5V2s9J388=;
        b=seX2Hos6nRIF7eM81cuj0fBwVQij7DAQNilObWmCpaz0cUG6X+u7ZdjBKbeq+HP8Ix
         VH7huaSwDXdofquhe1a+Ikv0SOXQv1qOYhlJI295Dh1ma+6HLFaVqovF8BTmuDZCHcl4
         jGQre6ffUYsFUxFvea5jU4kVo+p25fTN0KTyWHOHxsVknQknZFwRVnRPPnBiXIZBO2Um
         LqQSdKQgPZmH5A4pt4trnVN2BQGVj5Hr8xg3CFyUfdNvlOuh6uoezgWeML6BuXGHRX9R
         imLwppj7eM58Tep3dHYMJHiX4sXaC1n3Z5Rgzb1TBKSCLxQiNb6+81cC+KIiwXKdkuce
         iXJA==
X-Gm-Message-State: ANoB5plRB0saGO3bDuMIzkuDFsKMIMFYNC6IDgZ7TXZ6CUfoRDlHislQ
	K6wzsGrupGBysxfzemNwujNmj+D9rFo=
X-Google-Smtp-Source: AA0mqf7bSsMD8PIQH030pmz4Ey61Oy8CWrr2ZUh4bC9Lg5adFc1pyMZLMCWCLT/B46eu63rdMjgLPA==
X-Received: by 2002:a17:902:ab12:b0:189:7d4d:b99b with SMTP id ik18-20020a170902ab1200b001897d4db99bmr17984485plb.147.1669792762529;
        Tue, 29 Nov 2022 23:19:22 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::a42c])
        by smtp.gmail.com with ESMTPSA id im15-20020a170902bb0f00b00189812a5397sm577447plb.180.2022.11.29.23.19.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Nov 2022 23:19:22 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 09/10] opensaf: Check for _FILE_OFFSET_BITS instead of __TIMESIZE
Date: Tue, 29 Nov 2022 23:19:12 -0800
Message-Id: <20221130071913.1805812-9-raj.khem@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221130071913.1805812-1-raj.khem@gmail.com>
References: <20221130071913.1805812-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 30 Nov 2022 07:19:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99866

This is fixing both LFS as well as 64bit time_t issue in one go

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...0001-Use-correct-printf-format-for-__fsblkcnt_t.patch | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/meta-networking/recipes-daemons/opensaf/opensaf/0001-Use-correct-printf-format-for-__fsblkcnt_t.patch b/meta-networking/recipes-daemons/opensaf/opensaf/0001-Use-correct-printf-format-for-__fsblkcnt_t.patch
index 0e113f533f..d44ceb0d2e 100644
--- a/meta-networking/recipes-daemons/opensaf/opensaf/0001-Use-correct-printf-format-for-__fsblkcnt_t.patch
+++ b/meta-networking/recipes-daemons/opensaf/opensaf/0001-Use-correct-printf-format-for-__fsblkcnt_t.patch
@@ -15,15 +15,13 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  src/base/os_defs.c | 4 ++++
  1 file changed, 4 insertions(+)
 
-diff --git a/src/base/os_defs.c b/src/base/os_defs.c
-index 83458c2..655c190 100644
 --- a/src/base/os_defs.c
 +++ b/src/base/os_defs.c
-@@ -917,7 +917,11 @@ uint32_t ncs_os_posix_shm(NCS_OS_POSIX_SHM_REQ_INFO *req)
+@@ -917,7 +917,11 @@ uint32_t ncs_os_posix_shm(NCS_OS_POSIX_S
  			    ((statsvfs.f_bfree - 1) * statsvfs.f_frsize)) {
  				syslog(
  				    LOG_ERR,
-+#if __TIMESIZE == 64 && __WORDSIZE == 32
++#if _FILE_OFFSET_BITS == 64 && __WORDSIZE == 32
 +				    "Insufficient shared memory (%lld) to write the data of size: %" PRId64
 +#else
  				    "Insufficient shared memory (%ld) to write the data of size: %" PRId64
@@ -31,6 +29,3 @@ index 83458c2..655c190 100644
  				    "\n",
  				    (statsvfs.f_bfree * statsvfs.f_frsize),
  				    req->info.write.i_write_size);
--- 
-2.29.2
-
-- 
2.38.1


