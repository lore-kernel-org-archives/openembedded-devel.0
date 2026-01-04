Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF5CAC2A074
	for <webhook@archiver.kernel.org>; Sun,  4 Jan 2026 10:38:52 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.40902.1767523129086411093
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Jan 2026 02:38:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FMCfyFPT;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-47795f6f5c0so71146135e9.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 04 Jan 2026 02:38:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767523127; x=1768127927; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2uE3yb2gRVL1nL8D1/cMZC6WKt1+xRenF5w68IZA0Oo=;
        b=FMCfyFPT6FXToDLyy32e1nFznKff4jPDW0mXzgB5KjfYrAsy0gHLNr6IQJzjm2HZkw
         13ItnioSoXmSkoQXtQX4s48hVbv5QG84r17TmmNdgJ5m3rZvlIG94E6e++CE9oOvRRCE
         LUUUuBgnbTiH/qWz4x3/yCKlQgz9wnvRdnwVZVscT2Wy3jYbCzUM/8WDUkSFRf1H+uP6
         CiM4+zFZZWIUJcZYNM2KE34ejtFdDVKLASURDy4LY/SbR9ESUWBCCZNMeiVM4UbjMmWV
         xwmOcoB2YbOqTKxQVdKjVpihwjMWXcArgwNztFSKzuLcyQ/kCt0a1JbywzKX3BY0RjLu
         7M7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767523127; x=1768127927;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2uE3yb2gRVL1nL8D1/cMZC6WKt1+xRenF5w68IZA0Oo=;
        b=fhFphosUfvbQy+/Wkg2UcQNhcXVd4ohxlEW41/9ArBNdbtdcVqDl8U7gl5th1SMYmN
         FnSgcRW76IR8YJ4XDMVWJbowhiyDsm+0nHil8q9+GZnF2carIU5bLgWQNv5LxRoD0Wka
         Vu3KyMpqxYtVWu0afUlquTR4fN3XrbnrL/2KualsNkoEVbEv2wV9diWuzLAR4oeNdxdV
         +m+ljkM2KDFUD0ZO4sG5Aa4tlboCxktmiaE4BE0KbLjGXHjurHlfqgn8YpXSsPK/aNOI
         IzaATUtc6LGmJ6oI2uJgc4bN8inH+h5Mq3kdqhuqZ8dHEfWA8vJLUcLNF6e84jMSbM1G
         ej5g==
X-Gm-Message-State: AOJu0YxHZ8pu7xnchN57vwLs/3/RuwapUz8vgUn1AeOoSDU79EgMZs9y
	1AfqJ5TPXLLMivA8e6vmz36NB8Ma3aUnRutxANBCauz12x6m+EPQyB1KDd9BAQ==
X-Gm-Gg: AY/fxX5dbsZ7Q5C8GkFuFMyAlJgeNaxGGnOnip6f7D+6AF6X5fcSwrIJkZrvSHhrk14
	HDMhopE5x5wU0Pd2LM2+bjdejER2gpNj4a4SJkQE4nXt1MU0thAeO1OUl7aWGgLDp8dYHAuKfXb
	aqrBtE/O8c/s0pvTB6sSmXr5TcINb+uk+/Ih0XfsIPIDMTEb+/128UMC9XOiTlVfByRMjmijQrg
	Fv15DzpeWeflWVdYf12CKl8qTa6z+06IUb2QHi6PXcVOi3SFiOzv8/9s1NsMhhWPAp8kgflRhNc
	++E9MFrdZqZ09QNtU+r4mAhB0cqsie0/mw4iWa8y1YngRuohR0RB2MPnDTZza4u5t+DdJtnAyq6
	Aa0RRyDoG4Qf2JmKLEJk6B8EkzsguarGaaCTbzChlhxJIwqI+qrNfpgfZs8fkJmEFFu+ahkZA7W
	d+/QeA7v+m
X-Google-Smtp-Source: AGHT+IHMRM7igRnG/PMst9LgLp032XCeycNX/CSCsaKE7wb63dg7tDl/qxsJyO3CuuXMT9M6Dg1STQ==
X-Received: by 2002:a05:600c:3b87:b0:477:aed0:f3fd with SMTP id 5b1f17b1804b1-47d1953b7b0mr630329255e9.8.1767523127420;
        Sun, 04 Jan 2026 02:38:47 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea1aee5sm95885178f8f.4.2026.01.04.02.38.46
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jan 2026 02:38:47 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 4/5] spitools: upgrade 1.0.1 -> 1.0.2
Date: Sun,  4 Jan 2026 11:38:42 +0100
Message-ID: <20260104103843.3450950-4-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260104103843.3450950-1-skandigraun@gmail.com>
References: <20260104103843.3450950-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 04 Jan 2026 10:38:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123117

This is a bugfix release, with some ioctl handling fixes.

Changelog:
- Adjust the handling of SPI_IOC_RD_LSB_FIRST ioctl call
- Parameter for SPI_IOC_WR_LSB_FIRST ioctl is {0, 1}.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-support/spitools/spitools_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/spitools/spitools_git.bb b/meta-oe/recipes-support/spitools/spitools_git.bb
index e1b9302a98..9dfb23cc7c 100644
--- a/meta-oe/recipes-support/spitools/spitools_git.bb
+++ b/meta-oe/recipes-support/spitools/spitools_git.bb
@@ -5,8 +5,8 @@ LICENSE="GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=8c16666ae6c159876a0ba63099614381"
 
 BPV = "1.0.0"
-PV = "1.0.1"
-SRCREV = "87da3bfc03f3088e2e880b6b48195bb225fafeac"
+PV = "1.0.2"
+SRCREV = "1748e092425a4a0ff693aa347062a57fc1ffdd00"
 
 S = "${WORKDIR}/git"
 

