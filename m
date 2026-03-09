Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D847EFCD63
	for <webhook@archiver.kernel.org>; Mon,  9 Mar 2026 09:14:43 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9892.1773047677786333788
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Mar 2026 02:14:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TkHRhGqC;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-354bc7c2c46so6797418a91.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 09 Mar 2026 02:14:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773047677; x=1773652477; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TCiurv7lb8Hva/9T7R0ZHkiNegj/wsbgORAmlkk9nO0=;
        b=TkHRhGqCUyrZi2227/rT4L18mFLoLtno0NjLxWSzXl0qhluTR7/K27QbN34dTFuGtG
         KNo7wsnxLp5ljFuyVC+q6hl1dQ4dVB7Sr6mdu+jA9/Tq/1N5orVvIBETDpo2coGV9UrY
         ukBD+OCDaqLSMr3E2m/QkUznUrD7igTR8gBI483FhZSP5V3hFOrmpWnrWzNegOZ30mvo
         eMxrO7u/F21+OqC7fxTnUC9krCbpHfjFHLTgHEhsQrPFoG2JgarBz9UdIjiwwMLECRYp
         OQwtvxBIwmd+nqZw2p+afL3Eyluc4di3ytgZ31U5fSRZ3bRnB7k6mbVX3Nbix0oqpCkx
         sJMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773047677; x=1773652477;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TCiurv7lb8Hva/9T7R0ZHkiNegj/wsbgORAmlkk9nO0=;
        b=Jir4kyIpYHRiNIRtg5pw1JFsLtQbqrLmJcE+7AqxWLwcvqOj9GbN8LOJVM9z+kEbix
         txcM+T4ZM8R65ykZAq8V/5PWNB1YTJD4xHMP2zRQfXssJBSk7mYL7jtdPsN91cFZIPE+
         zChVhIKxsodHwhIFkEj5rBVbDAaVWIv3RASP2O4D8CbXmup4orZEMqMW9BXlPH3Ln/Mg
         arYVS0zs86nFTUl3BmfEkn4KbIWTubrqw69sH7iWudcvF3/fTwMCJKhpuqPtjACMJWVK
         egW4mkvRVKVWedV+izUpoE0ambAD6fMWJ1+70QpX7qooD75aGuJXzjsn2Us0KaQbPt70
         VlGg==
X-Gm-Message-State: AOJu0YxMrzTXsPbnQA7EhGKr3F/9FfoXDz4/VYt4Ic2KFgdkqEa7tkdA
	3Li8+ddmuph/F/XWHwqtmH8fM2CSh1y4+xYnjbPB3shTzhjprmNMfeSr7CC+kg==
X-Gm-Gg: ATEYQzyLpzid11W3FeBn2Qc4n5qw1JKcbWv5bUm2gqE91wCUli+E3CrAdz9SmBdJLdA
	/WhuMRoyse3Y0SGDItPHnvkrTijzAKdjWy8N96bPTHQzxhkuXJNQ9Mt1ZjRxUvhmN44WeePzFhY
	CRycjpIYoL4bjkRi/sCORFHkF/yhRLyKED7PbEr91t9DyP8tl1OR3BxcPm2O6CZ8P83RuGnJ0Ff
	gxmwegL3a2cYCmZAJJhMWOeNOhj2tSTjT70kvS2RltMlPnznrq8b2Is60JNavXK7+3EfauXuqHL
	Z9xBEvZHxXFaHnV0V0YTsYqdx1Q917xpl5KNly9BI3fEzCdHf9fzFx2TpxyRoMFHeijjbgl2Vfg
	8nh+Gs8eLHOVJfn40BipHSvyj4ZMapQ0u3LRqrCExA5g3ptQAT3VGhgI5c0DjCBq7CW322WcjLa
	bxDm3O00H7bHAwt5KCMGEhaKt5HW2tProuCxc=
X-Received: by 2002:a17:90b:55cc:b0:359:83d3:27d3 with SMTP id 98e67ed59e1d1-359be21f3e8mr9329154a91.2.1773047676755;
        Mon, 09 Mar 2026 02:14:36 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([167.103.127.26])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359b2d60767sm13822583a91.8.2026.03.09.02.14.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 02:14:33 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [oe][meta-multimedia][whinlatter][PATCH 1/3] libde265: upgrade 1.0.15 -> 1.0.16
Date: Mon,  9 Mar 2026 22:14:13 +1300
Message-ID: <20260309091415.393661-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 09 Mar 2026 09:14:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124962

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Also included tag in the SRC_URI.

This release fixes some rare decoding errors and some build issues.

Changelog:
https://github.com/strukturag/libde265/compare/v1.0.15...v1.0.16

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 625a2be8a8fff0ff8705bf35a858f832e5a27660)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../libde265/{libde265_1.0.15.bb => libde265_1.0.16.bb}       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-multimedia/recipes-multimedia/libde265/{libde265_1.0.15.bb => libde265_1.0.16.bb} (90%)

diff --git a/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.15.bb b/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.16.bb
similarity index 90%
rename from meta-multimedia/recipes-multimedia/libde265/libde265_1.0.15.bb
rename to meta-multimedia/recipes-multimedia/libde265/libde265_1.0.16.bb
index f432888fad..3e3381b646 100644
--- a/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.15.bb
+++ b/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.16.bb
@@ -8,8 +8,8 @@ LICENSE = "LGPL-3.0-only & MIT"
 LICENSE_FLAGS = "commercial"
 LIC_FILES_CHKSUM = "file://COPYING;md5=695b556799abb2435c97a113cdca512f"
 
-SRC_URI = "git://github.com/strukturag/libde265.git;branch=master;protocol=https"
-SRCREV = "17bb8d9fcea62db8cdeb0fc7ef8d15dbd19a22e4"
+SRC_URI = "git://github.com/strukturag/libde265.git;branch=master;protocol=https;tag=v${PV}"
+SRCREV = "7ba65889d3d6d8a0d99b5360b028243ba843be3a"
 
 
 inherit cmake pkgconfig

