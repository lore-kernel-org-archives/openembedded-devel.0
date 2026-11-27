Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8067.1795739694853100620
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 16:34:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=hF+wUXB6;
 spf=pass (domain: gmail.com, ip: 74.125.82.180, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-3282db206d3so4103100eec.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 16:34:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795739694; x=1796344494; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DUG2bKXaZPj1xcybKOssnbhMupcyj5bwZ/F8buY7IZE=;
        b=hF+wUXB6DSW7fsSxEPv+6QJm8gp+QvdJfDAoW2X2HKWfAdZYY/6K2Wk6OjdgilKnez
         sZ1ZunTxffKmhZqPJ47Q4zXQtwJg7uGFxC0VA2FMNOPQllgByu3IaarYlnjglKcALTWw
         /XLsilQkTQO7yewuYxlwj99QQ6i5+W9OfXeyjNJ4yGs5RG4Cj0V7/r2fi2hOXoFWiSjV
         V7QX21JEIbw9fNFoHm9Vq5aGnyNG+34uJ9NqlsC5ukggvmi14OKmihtgJIO/rcY4uM5C
         dOAjNAFiKzi+oHSJJ7OClqBLeE3GqJTBbC5EBxHP3Dk0UQpvuDdVIcWW++Jr8JbOOoIa
         L8/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795739694; x=1796344494;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DUG2bKXaZPj1xcybKOssnbhMupcyj5bwZ/F8buY7IZE=;
        b=H7dlmfcqBeFGkhwAY+Gv2xub2IoVzyVaN2SXmYPNrtrIXJmBxojDe2BgxKg36z4RZh
         YRCuzN4AFRN9zoDGey4epL7RwHFNbMo9VvRnZRulLKVlBvD/myr81HR0CSMTuNu/QIeg
         mxjVc9nzwUCz/msmWb7gwBBmx2fp5Zwou9Pl3gm7nAQU3nGzzBQ8P6N0PbAk0FNCk5Jc
         zuhLX38mm/oFJOu78JaxJ+Bspfv+3+xLDNeGmN8aCTftPvQoR8WrCrhBCsll70Bs+jKE
         GQEqVM/yqOUiRmmeOexrClfXfa0mC/XmqQjG9Pq2/BLWJfSx/mv/XVrj3yzvPbrY436e
         xJvQ==
X-Gm-Message-State: APuU4Z9e1ckpWhB4TxWCGjxeb1zkjZIiuueHa3s7H4Ql3NZlXCLW4kN2
	TxPBgeWpWYnGpxz3HFIjCzHLmuhwD6Sgi/xfsiqTYqbOsukmw6IHbxICEJaIklpv
X-Gm-Gg: AZFdTZfp4KlkuyFmD8Rjovt9TMKr03NqeZsOwSkshsdK+xw0hQD+YFkOoB9GaiDr0L6
	bPsYkAIwQjpDaAVKpZp3mZZQIHI1+6g9wwkoHJrz4COb85g0kl4RBRVZFbWmtvHSt9OmM9fBW7P
	xsInEhE3x0iWE/TSvqrinrL8isgMzcqySX7qkxM8Auva6et9fcVpG9ILzBB7C3a4ajAohwp4VhJ
	jpF8rqjuzQd+BQLKHAVrEwD1jPOUK5z4LZPds3fYjwWlwsVpDV//It5wRXEh4a/TB3qTBdKvxYX
	3MHiRyof8Ot8iDwNVlY4mxNEr3gvDlSWZOt5M8gGXGxlj0q/iOwWuRnKgdgEVw45RjCN4J6/1+H
	s21VfBEpLs5hq/CjTZpeOtgTXhPs04hvFgNHLyGKjy9Naxv8ym11xth+KQVpzUkKGMWsgcKqBMm
	qiexRymh6P4YAs825RgR1TAfGHmtySQ888LutN8/2t1vrEtDy7ZKFuDfZSaUuccM2RpeJ0SGA7+
	uip/X1heYCDMCmjlNVU5t9Aeo5cgVxdYXqpWbptKdML3dLdEmymaOlYtHI+3Tk0mUuQPmEkBsto
	pqCXXzhWD5snYEaH+03JAltCRHg3DUhd/NlrppIRfLa2EV0Luqc9F51jZP+lWB+75QNsiusjFuG
	I5pMXzEiu5yBQtIOBFJoBp+9+YEpvViRQQNf52T4r+xf5Wtv25QKTU4GW5dXJH2ZNeY6bUZjqZ6
	FZnEvfILVNqincje9bJRTiIF06H0kYNNDLjAhGD0NYcz3vYw9HLVMV1d+khrsdLqOawOFRZLh2w
	Iz6jM4pWMF5vJNcqzYgIMNohlGTNWHzoLjbqHHy4HBIhlLcWgLX1D/Hpg1BlynfhwIXvr/ymYhb
	V+yuJCrAvM2JKaFjKLf437cZVg==
X-Received: by 2002:a05:693c:42c2:b0:386:bc8f:b603 with SMTP id 5a478bee46e88-386bc8fbce1mr11264104eec.38.1795739694189;
        Thu, 26 Nov 2026 16:34:54 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672ce402sm63029314eec.16.2026.11.26.16.34.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 16:34:53 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 23/69] minio: Fix upstream version check
Date: Thu, 26 Nov 2026 16:33:39 -0800
Message-ID: <20261127003425.2166632-24-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127003425.2166632-1-khem.raj@oss.qualcomm.com>
References: <20261127003425.2166632-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 00:35:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133123
Content-Type: text/plain; charset="utf-8"

PV is the mc commit hash, so comparing it with the RELEASE.<date>
tags reported 2025 as a newer version. The recipe follows master;
check for new commits there instead.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-extended/minio/minio_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-extended/minio/minio_git.bb b/meta-oe/recipes-extended/minio/minio_git.bb
index d08b5e754d..3b9f785c3a 100644
--- a/meta-oe/recipes-extended/minio/minio_git.bb
+++ b/meta-oe/recipes-extended/minio/minio_git.bb
@@ -22,6 +22,7 @@ LICENSE = "AGPL-3.0-only"
 LIC_FILES_CHKSUM = "file://src/${GO_IMPORT}/LICENSE;md5=eb1e647870add0502f8f010b19de32af"
 
 PV = "${SRCREV_mc}"
+UPSTREAM_CHECK_COMMITS = "1"
 
 inherit go
 inherit goarch
