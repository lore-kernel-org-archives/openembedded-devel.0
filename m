Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0A0ECFC26E
	for <webhook@archiver.kernel.org>; Tue, 15 Oct 2024 06:19:18 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web10.7030.1728973153875195051
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Oct 2024 23:19:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=h4LfHeIl;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-71e72db7bb1so678990b3a.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 23:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728973153; x=1729577953; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Xo3gHA2xdyV32QK3Ltw1mktMLHEJ8yA2b82y5Dsdq0k=;
        b=h4LfHeIlBxDgOSXyP8UEmBmiSKWnnBtTuB8vOiWYqTUxKEZdaqfw4gIIa5xIF96Ezw
         kAxfgunfEJDyjDdX6TS8f8h7uDau3TBqjIH7/e008Erj70+in6vMG2cc2n1SOHLj1xzv
         jMM5sMBqm3wsHgpEUAXcSCt7icChXhgqEPdGZOxO8GmvjM8WA+91XrWqjsPJnThnV47G
         XuomdUGSiVywHGZCMhBRv+6fwsOGBwSSUawU8dUORBNZtXI81Ropi83QatZyxcuV4F9A
         Vx8y1gTj+u5oJ1po/yBnOLt1DGyCd5DLvmzmVJEksRme3Kk3qVF073rz+Ba/bk1Xk9Ar
         TLdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728973153; x=1729577953;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xo3gHA2xdyV32QK3Ltw1mktMLHEJ8yA2b82y5Dsdq0k=;
        b=l9asrl220RyHxl58JKqoeTxkNYR/+1gu9EP/oSkK2atTWdije8aVaUl0e1mRtBKFNz
         v0IyjB5083pXmV7TH444wUWtlXrwVp4MoOa3cEU3+0k6q1MfKN7LwNfNUx6oT2rnKH/1
         Jz7MHq1FOEmUdoEPMPcwMfwkS5H7SDYzVFm5JEgBMzQazKdwIruHhW4E8xIMc4yUgZBN
         fvQuVrkoQlMoOSe0DP/c6r+4IfdLREOzIgUf8Ylw6Lg1xC2D5NYpZIr/IvxI2U6xnDAv
         CmnWyJDLY0ZFGw0cPYk7i49Co5jYNf63jijWzmEB1iDPJLHFDkYU1yGVojVadS3qGfU8
         FZaA==
X-Gm-Message-State: AOJu0YznvTgUKdrL9mBUU8eWw4ytj82CCKUTbV3AHl6jR2RgfXq2+ZKa
	1tfOrGFSbE5ODuujo0mDwZZeCEweUY79H9rcmIGAUMzMCWaZlCDEJ48Ue50M
X-Google-Smtp-Source: AGHT+IHS7lb3FEUzHg3goiNzbPn0Vu/WLgaiNC+VYLu6nx0mVZABHX2zmzmEid8/1eZ4tpN04rQdAg==
X-Received: by 2002:a05:6a00:180c:b0:71d:ec05:1101 with SMTP id d2e1a72fcca58-71e380beb29mr21670786b3a.25.1728973152983;
        Mon, 14 Oct 2024 23:19:12 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::7932])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71e77370ddcsm540620b3a.8.2024.10.14.23.19.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2024 23:19:12 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] psqlodbc: Update SRC_URI to point to latest location of 16.00.0000 tarballs
Date: Mon, 14 Oct 2024 23:19:10 -0700
Message-ID: <20241015061910.3666621-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 15 Oct 2024 06:19:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112922

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-dbs/psqlodbc/psqlodbc_16.00.0000.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-dbs/psqlodbc/psqlodbc_16.00.0000.bb b/meta-oe/recipes-dbs/psqlodbc/psqlodbc_16.00.0000.bb
index a1ef8e75e9..d3b3ea5109 100644
--- a/meta-oe/recipes-dbs/psqlodbc/psqlodbc_16.00.0000.bb
+++ b/meta-oe/recipes-dbs/psqlodbc/psqlodbc_16.00.0000.bb
@@ -19,7 +19,7 @@ HOMEPAGE = "https://odbc.postgresql.org/"
 LICENSE = "LGPL-2.0-only"
 LIC_FILES_CHKSUM = "file://license.txt;md5=6db3822fc7512e83087ba798da013692"
 
-SRC_URI = "http://ftp.postgresql.org/pub/odbc/versions/src/${BPN}-${PV}.tar.gz \
+SRC_URI = "http://ftp.postgresql.org/pub/odbc/versions.old/src/${BPN}-${PV}.tar.gz \
     file://psqlodbc-remove-some-checks-for-cross-compiling.patch \
     file://psqlodbc-donot-use-the-hardcode-libdir.patch \
     file://psqlodbc-fix-for-ptest-support.patch \

