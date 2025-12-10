Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EBF0D3C906
	for <webhook@archiver.kernel.org>; Wed, 10 Dec 2025 13:28:13 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15370.1765373285832514840
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Dec 2025 05:28:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EzJx78s4;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7bab7c997eeso7806198b3a.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 05:28:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765373285; x=1765978085; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9BxEeZdM73+PFWkv/vngxzlHJMXLZunZ+Petvx+8ms0=;
        b=EzJx78s4cWI+aPk07mneXxtzxxuNXDvKCt2w0xr4OuAZmX2hn0ngDdTUz4xf7YjpOR
         cwGyv853ScRqqsVrq802VXOhrnQbN1h52fBaG4ciLEPY+g0WCV9VtTRQz3rvNZD68ywI
         zU90WjFFJUgy4eyBxlqc8vV93npAHb3qkd614R8Xktj6ZY9afbjdeUrbNH2UtI5ZaBXp
         YDGP9Uum/R33X0uhF7ZKSQnfANsgjXhlhLViGMagmqZmsGfqT2hFbtj5U8HdEkd2jJY3
         aJ9F3qCUAvnDPw90Mvi1eZx4c7QEuR9FJ0TQPRXFMAErLP7NhCm/qg8tuASpeunOQm86
         FzGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765373285; x=1765978085;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9BxEeZdM73+PFWkv/vngxzlHJMXLZunZ+Petvx+8ms0=;
        b=uKbdlBWLNe2h5vGcUjXH9IDviD8q2+u1tPo//ZR2zlq1K7feri0QCGZa3Kb8SU17kl
         vnDHItONsXLKGgusehBlOub+862rSdmMXNmGVwwuM8ynNEQr58brH9qyHTrCwb1uJKt3
         MUTvKxO3ekqFkv23M8aP4RKuZvnolbGsmmkyY/kq8g7qtMJ7NrNt9lkFsVfmETBDv8mu
         d/JhLOLxio4iRpOrkJuwuRnM+EfQ0HSX/3X3kBOmcvZ9ulSac5so3Or1sR+ApqbyEf6u
         y6S0hSN5x9DfNHHy2GCwQ60tz9HMJCm0Oky+ZzqCLxuc2kgL2/1CrZJAw9NUM93fbZAY
         YvJA==
X-Gm-Message-State: AOJu0YyCineEj++kXAsbu/XUJ26SDSD10ha7T3mh5tW12+dx/H3uu3MM
	etlwnsf0NpmZ0eaBz5ZBgVir9PXghCHeZ/tmV6R6qBQX4jvJwi7thgnbvD+UCw==
X-Gm-Gg: ASbGncuFICKoEsdAls4Dq4/xPkwKFtnS9cyZu83PnVcaLObrePE70RotLNYMEMI3ai8
	l8y24lAH9XC7f9zEyNw042ZQe4gun/zTNhF8C1En2K99g5FoIRIKxyl3W9PMHg6DWI8zkRLmqeB
	25d4bc2J/t7QVkvw5GBgVs0XE0KtTTEuY6CxEbKohTxJb4Vflq8WTGhphP0AhVKJKZ8ylqO0Qwy
	ftLCrrGgTpZt77Olnf1rsYGj1ZeS2SF3+S8QWgFOKxvubP++pBrXMSr2NEGhJ0DVWPtFP7uht0R
	J7E6XahZL9SdeDFlvaBLHEa1GbJBlgTddk6PAGD7H5pugYocu9P7Qn+M6W+sbfs8qRkZiWdl9Mr
	Wb8bLx3v6tRHnWKVMnxQ8ekpj2o6tFaXs2uqbe/2Mq0pmS2Odu32Q+5t+kS7dvCHjf8ysuD3/Rw
	llvQhEl86ZsJE20xvzDVAxH8c=
X-Google-Smtp-Source: AGHT+IGIErmNjcEKAim5tUcXcEiENyuxt9QmtYYoA8EsPJHUyWd0uRaqnOXr69Y65flXW+3GHxZefA==
X-Received: by 2002:a05:6a00:1785:b0:77f:2efb:11d5 with SMTP id d2e1a72fcca58-7f22c93a8ebmr2353111b3a.1.1765373285015;
        Wed, 10 Dec 2025 05:28:05 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([122.161.48.114])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7e2ae6fa824sm19163006b3a.47.2025.12.10.05.28.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 05:28:04 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Changqing Li <changqing.li@windriver.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][whinlatter][PATCH 41/43] version-check.conf: mute version mismatch warning for bpftrace
Date: Wed, 10 Dec 2025 18:57:42 +0530
Message-ID: <20251210132744.336180-6-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251210132744.336180-1-ankur.tyagi85@gmail.com>
References: <20251210132744.336180-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 13:28:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122545

From: Changqing Li <changqing.li@windriver.com>

bpftrace set the version by "git describe --dirty", since we have local
patch for bpftrace, '-dirty' will be added into the version, set
CHECK_VERSION_PV to mute the version mismatch warning

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 219328f37cbf6aa4b2d7b77d21e00240543d73ad)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/conf/version-check.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/conf/version-check.conf b/meta-oe/conf/version-check.conf
index d1a6cdf7a5..3ff0bccfd6 100644
--- a/meta-oe/conf/version-check.conf
+++ b/meta-oe/conf/version-check.conf
@@ -36,3 +36,4 @@ CHECK_VERSION_PV:pn-libusb-compat = "0.1.12"
 CHECK_VERSION_PV:pn-jemalloc = "${@d.getVar('PV').split('+')[0]}%"
 CHECK_VERSION_PV:pn-dialog = "${@d.getVar('PV').split('-')[0]}%"
 CHECK_VERSION_PV:pn-flite = '%'
+CHECK_VERSION_PV:pn-bpftrace = '${PV}%'

