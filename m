Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15085CCD180
	for <webhook@archiver.kernel.org>; Mon, 29 Sep 2025 13:04:46 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web11.52852.1759151080072066023
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Sep 2025 06:04:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ShJlQiNp;
 spf=pass (domain: gmail.com, ip: 209.85.208.50, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-62fbfeb097eso6648135a12.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 29 Sep 2025 06:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759151078; x=1759755878; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7uXc+arddhr2M7Pnje/HcwBzSuBf20jz4kJUEpoAt4I=;
        b=ShJlQiNpoLwIAwg/3wYTwensb9G0cGNKw87Wl2AmkDJ7OvO3K/eN4GCkmYNkj43M6Q
         H0smLgsHUp9bRgolEbXdsAL7iVDow4WCyJbuseHyTty9x4X4E9UdFTujzMUJVzi+D7tJ
         iBvNjfzUWpAnftb2RC46yYIpYPOkPPJYCvrmUQp/+Ge1wArjNDto07euGDKA4v2y/4YJ
         6GobU9tenn/vB15UKZZt4iwMElx3PLj/Jsvb+3pHDcey1ggqJMam/FkFhYW7SOsgm0pl
         VyzyWsgmGMWouvsnzy0SY9NgBI7O3yA6wSpYS1UmHBON0h1wtE/ifKr6xoKoRLMeie6H
         CsfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759151078; x=1759755878;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7uXc+arddhr2M7Pnje/HcwBzSuBf20jz4kJUEpoAt4I=;
        b=MzgiVDRxXAzZQlYizHuUcyK+9JAxvZy7TUNu/Za4ao6tbaLqsYFKBXj+fFdI6iSQPW
         NcNNvH84yzSOzjs2T8bR8By5vCPZ3bc+IPEjIDIeYekUZCyEsgBdMrxDbCrE1n8nF4nH
         3PuDytNaADyzro6PtEakHMB+Ci+qqXcx6nsILQaLvu7Pwa1FOlfTy2LtnQ4Pawb6dXID
         aUXN/GfJ3XX09GUiX3+fZ+t4Bvlm0MglB4RozOxb8EDL0n/GBkO3yfOhWzbJqtSd4ufX
         dUSTm81DtWya7JUfYAnspIy4bsYGlSMmHIUi5mFbW+sRlQnCO0CbP3LqgnAPgMqNiNEn
         wMRw==
X-Gm-Message-State: AOJu0YzB3OeK/AvMrDd8zpFaRSqOpznad+fGB1eOXE6nKpeKicxUmxaW
	ZiZV1wrePX8FhHA3HSUoXaekLS8tfUmWMWKvhqqJfQughISbsXmTh1AfcPC2HQ==
X-Gm-Gg: ASbGnctouOPcleSWvTb16MbeZz2jDk2FZsZklRSJLcdWURzH3PDpHj4o8xBMjBAgk07
	zKnHBXucV2IMCPAqg3E8baOtYOzuv6BRKNDOn8xVjZyIzQe6chu4ZpaaacHuGCi0UqcPUaH8MzM
	FOKHMYkEkhNiV4XLGt71QYlKwSYTLIyfMeuAOaIkpkInAjaCOhXUk9p1T6+Xco2Ed48cI6LRQ6H
	Ik1x3RGZlOHHUdMLiZV0AgOFdHzar9tmfmqzC2DFUL31Xesi4JgzT6qyykBSxAuYvUwYN7bbbA0
	Adt8Xg3FgWoEgrjSc/6hfft8lq+p5ePTlB4PsIts3/HztglW37kyqmNq0Zj1alhZC4aFzg7nvF9
	aNctBolms2VFfwb/bDUS1c0p/Q9/JoBU=
X-Google-Smtp-Source: AGHT+IGgzMd5523CooaZZmk33u0jPGm6f8170GVLxqvbyQPpsMlRZiDzgGqCTo6AdEJlpfBJ68l+1g==
X-Received: by 2002:a17:907:3f1d:b0:b41:1657:2b15 with SMTP id a640c23a62f3a-b4116573892mr70896866b.6.1759151078248;
        Mon, 29 Sep 2025 06:04:38 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b3cbd81bcfdsm335426166b.82.2025.09.29.06.04.37
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 06:04:37 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][kirkstone][PATCH 12/22] uftp: upgrade 5.0.1 -> 5.0.2
Date: Mon, 29 Sep 2025 15:04:15 +0200
Message-ID: <20250929130425.2912077-13-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250929130425.2912077-1-skandigraun@gmail.com>
References: <20250929130425.2912077-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 29 Sep 2025 13:04:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120025

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
-Fixed bug that caused crash when a CLIENT_KEY arrived out of order
-Fixed option handling on Windows when an argument is missing

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 93a5628ae660bf6aa3cfdc9e0032088e4df8a0c5)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../recipes-support/uftp/{uftp_5.0.1.bb => uftp_5.0.2.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/uftp/{uftp_5.0.1.bb => uftp_5.0.2.bb} (84%)

diff --git a/meta-networking/recipes-support/uftp/uftp_5.0.1.bb b/meta-networking/recipes-support/uftp/uftp_5.0.2.bb
similarity index 84%
rename from meta-networking/recipes-support/uftp/uftp_5.0.1.bb
rename to meta-networking/recipes-support/uftp/uftp_5.0.2.bb
index 6d5cf4b628..ca2a8ce676 100644
--- a/meta-networking/recipes-support/uftp/uftp_5.0.1.bb
+++ b/meta-networking/recipes-support/uftp/uftp_5.0.2.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=d32239bcb673463ab874e80d47fae504"
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/uftp-multicast/files/source-tar/"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/uftp-multicast/source-tar/uftp-${PV}.tar.gz"
-SRC_URI[sha256sum] = "f0435fbc8e9ffa125e05600cb6c7fc933d7d587f5bae41b257267be4f2ce0e61"
+SRC_URI[sha256sum] = "57c12a6ae59942535fb5e620381aedeb17d50009ee71f236427ce237a46c0b14"
 
 DEPENDS = "openssl"
 

