Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CE1AC43327
	for <webhook@archiver.kernel.org>; Sun, 28 Jun 2026 08:12:05 +0000 (UTC)
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.69132.1782634323960641641
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Jun 2026 01:12:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ql5+yvnS;
 spf=pass (domain: gmail.com, ip: 74.125.82.169, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-30eac9abd79so818897eec.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 01:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782634323; x=1783239123; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5q+ueWFY6zAUBnArgSEMY6NdcLlq/2E0XA45TdKfSLw=;
        b=ql5+yvnSuhkM4FMdZHkb4hiJHSWKgKQ+in5JTjcgQT9jI2MoSjiHC7lGxCcF9zcN9E
         cgcKBN/2Bi/gwfF1k6WGmP+avJAdYJfL/FMD5dh9s2flGX78+zy4d257vOtgX9GhvF2c
         AHLXeDVw1wqQFITeyyexr26KJ7AbV7/M7haKKZsSYEq0diTTRQONyN+ICVIbOLMny2b/
         Gh3+Eqo3KBS6bEo2iX1PhqNdnGPQfRUWDDkVCnPwPtdqqete1V/Zg9R2LoLG4Pp1nWJT
         prTo5lrgO8GAYQZLfjTONJ0ypZUGjjRJynZA3Mpw4PkX9U36ohThBgforMzXUwC7RimQ
         SndA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782634323; x=1783239123;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5q+ueWFY6zAUBnArgSEMY6NdcLlq/2E0XA45TdKfSLw=;
        b=tCuAxGZduZemAczVs0gLnjzaoDDx+64uBh8Bkwzmfh0f7LdaAvS4qmgtHWgvtsR948
         /RiQz3bWPRIvEYRrPez4g0zGmhpaqmGqSQHBRmh4luOg4uGYYasKPEyBqeRrVf3II2pq
         FUeski3h0c7TSopp52jDBDHhxUKBYeBOlxihhi0mMnT4kZMct0HrcQins6K5vqTR4lMw
         ayo3fJlsZeRIgYxVWB/vRJP0hSJX9o8vDqC53VnZMLUeXxpNXJKVIM00k7cx6gxn0PbC
         x4f1Hso6KWggyPMAR83IBYYq1JOA49bWehwbMeoqpiUdNPn710jrPRpFaO4VBvcQDQKB
         q8uA==
X-Gm-Message-State: AOJu0YyHATsv3Y6qdE2e1nTMWr8CQEa1zGmH9cRixaSz34dKplG8k/n8
	4gjTG10XWK6NKD/26yzX/jp18RjpfxciOzu3pOlPA/3FlsI33bgeeHhO6GPdn9lskR1rBw==
X-Gm-Gg: AfdE7cnpt7e7JFYdMWzmCATeRqcYQUKWHGAzfPhcdg91b5TTCsPzI5RswwGl3897+sw
	vaKcFn6yFfhWWyRPJ4rSeZ1bsHZdSWh1wdHKSU9GKsTXh7UnCXsydeM/DQ3vKixjT2daFuSvZ8y
	Napa1BfnHiBhJzA39CJdxgpcECuB2/Wk6EuHNHKglycxCAevjEZbroVTeMPylsAZH4Xc9IRM3Ew
	Dvw4u8JKrpEn7Rm7YT2ewp6m5qZ94GVYRpPKlf/HiFCyEaWxc/axHAh4LD29DYklwp5xUmCmSAl
	VAU4ZYqS4viW4NpyQo7/Q6opWCPMG/BNvmYtDErKmMUkxLfvJNwuGgTlR4whMwhcxruMG3EDZeA
	4u9xHvPHeP50/kETwZ+7rW59LfLpg9B9Fahpb+JP5MfDsyrzGdffUz34Hwd5F1fH2sKTUIlciZE
	E2YZtWpPYavGWM340JzKgQAPHWm0Z+DzL8MH3BBMtfyUze9rIXNER2Qpd6Q2YDXyinXobAswR/L
	7GP2jljSzzJwHsUDmlspZARcOy9WCw7h4vs2dwWQ1NeoSKaPo8CQgMnoSFknY6tlqAN4uIxwbPx
	ZfbnanYRqNbjgmdaO0Kvkm076sIHMg==
X-Received: by 2002:a05:7300:a145:b0:30c:38e8:54da with SMTP id 5a478bee46e88-30cab36a243mr8341830eec.24.1782634323238;
        Sun, 28 Jun 2026 01:12:03 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ea81b39easm6306040eec.31.2026.06.28.01.12.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 01:12:02 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 041/128] libio-pty-perl: upgrade 1.20 -> 1.31
Date: Sun, 28 Jun 2026 01:09:52 -0700
Message-ID: <20260628081122.178348-41-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
References: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 08:12:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127851

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../perl/{libio-pty-perl_1.20.bb => libio-pty-perl_1.31.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/perl/{libio-pty-perl_1.20.bb => libio-pty-perl_1.31.bb} (87%)

diff --git a/meta-oe/recipes-devtools/perl/libio-pty-perl_1.20.bb b/meta-oe/recipes-devtools/perl/libio-pty-perl_1.31.bb
similarity index 87%
rename from meta-oe/recipes-devtools/perl/libio-pty-perl_1.20.bb
rename to meta-oe/recipes-devtools/perl/libio-pty-perl_1.31.bb
index 56cbb70dbc..37231b0ec0 100644
--- a/meta-oe/recipes-devtools/perl/libio-pty-perl_1.20.bb
+++ b/meta-oe/recipes-devtools/perl/libio-pty-perl_1.31.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;beginline=11;endline=15;md5=1810a9b670f4c8593
 
 SRC_URI = "https://cpan.metacpan.org/authors/id/T/TO/TODDR/IO-Tty-${PV}.tar.gz"
 
-SRC_URI[sha256sum] = "b15309fc85623893289cb9b2b88dfa9ed1e69156b75f29938553a45be6d730af"
+SRC_URI[sha256sum] = "d597af221628571cbecf35b44520148c44798dfc8a9867774e60453f79d25ff7"
 
 S = "${UNPACKDIR}/IO-Tty-${PV}"
 

