Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D488D2C13E
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 14:37:22 +0000 (UTC)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
 by mx.groups.io with SMTP id smtpd.web10.19652.1730817440788373393
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 06:37:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lK7J3o/L;
 spf=pass (domain: gmail.com, ip: 209.85.128.170, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-6ea8419a57eso30393877b3.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 06:37:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730817440; x=1731422240; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PRoaBNnsvyWpmmIkTr/9SH3Sw5t7M999IxjrGzmrxy0=;
        b=lK7J3o/Lziw1FZFJDFbhLPsT95dc71/HtCc9ZPju4COzA+qAb7O2zA2IQ0Iz675516
         T/YtuIJl2X4ATx59yhkqFNfqs4f1P623fz5N4AnmZ0Ysg4oy9JeIxQ7gLTnIHBVbjeLr
         ayRH5yomqrZIEDjoktDIwnVcmSOsXj40HB2xlOQh8grz0jKoPng3SfrVtB0V6e7/1Aih
         veJGfk6miWuIe99ro5OCpiMQ7UT8r1gdDu6l68fXlqpJvVmLd7iOsa/8+DxTFRAevYjh
         bT+Bb54KJCU3yhraQOrFbKI5FD+ri6eKEaNig4AVHsyXkAKRbpDJ5FLKczYqy19y8a5S
         GZcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730817440; x=1731422240;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PRoaBNnsvyWpmmIkTr/9SH3Sw5t7M999IxjrGzmrxy0=;
        b=eZo8kpSqEdL4eJV4Fw9cS2pkOg9wTb38h07Ghub33MyL3HWGEoPRgnl2/38bZMEeso
         VNqsA/Hxkx9cE73DNmgyknB+krrSE0WpT+rFt6a1lC7y8RZU+MTbcc9Ip3/uw7eBT3vB
         op2SV/29QQtQUs0/pAJTyAj51qLmW7HVHiS92QAQCUpCjlMZExy7uHLAWKkrEOc5WqfK
         U37yhzRPg9IRTI5gqwng7I3uQM2WHaI1f0bEEPn6K//44UjqSTurNbLbzj6IA9c6gwTD
         miJ42u/U4hoF/rUBvsc50ri4v7kFau+N9EM9z58gIf0gH0cz5bbgdRSFLU0/Hvhux2VF
         XMRg==
X-Gm-Message-State: AOJu0Ywn7jv5SaQr5DUrOdLKx8e6yYwTk9h6zhHXVZRxXkaDqr7rCG/Z
	D+iCAe9L+kwU+3Vc/RdBEti2gDFwlFsruJ/clh15HKyzq/aywQXJHmMh1Q==
X-Google-Smtp-Source: AGHT+IHfOX50r/hP/ilqKe/OztMgEd51/6KUTjwcqLxMIjB+/Qmwl7Ter6b707FJhZD78p8pcge+CQ==
X-Received: by 2002:a05:690c:2d08:b0:6e3:10e7:b418 with SMTP id 00721157ae682-6e9d8b554acmr235655137b3.46.1730817439881;
        Tue, 05 Nov 2024 06:37:19 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:45dd:7000::29])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c8723esm22495977b3.126.2024.11.05.06.37.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 06:37:19 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jiaying Song <jiaying.song.cn@windriver.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][styhead][PATCH 87/90] wireguard-tools: fix do_fetch error
Date: Tue,  5 Nov 2024 09:35:52 -0500
Message-ID: <20241105143638.2301245-88-akuster808@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105143638.2301245-1-akuster808@gmail.com>
References: <20241105143638.2301245-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 14:37:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113504

From: Jiaying Song <jiaying.song.cn@windriver.com>

Change the SRC_URI to the correct value due to the following error:

WARNING: wireguard-tools-1.0.20210914-r0 do_fetch: Failed to fetch URL git://git.zx2c4.com/wireguard-tools;branch=master, attempting MIRRORS if available

Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit bc29ed7b10795773fccef2839cfbfc23cd2e115d)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-kernel/wireguard/wireguard-tools_1.0.20210914.bb    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-kernel/wireguard/wireguard-tools_1.0.20210914.bb b/meta-networking/recipes-kernel/wireguard/wireguard-tools_1.0.20210914.bb
index 8def54ece6..c12b8abd5d 100644
--- a/meta-networking/recipes-kernel/wireguard/wireguard-tools_1.0.20210914.bb
+++ b/meta-networking/recipes-kernel/wireguard/wireguard-tools_1.0.20210914.bb
@@ -1,7 +1,7 @@
 require wireguard.inc
 
 SRCREV = "3ba6527130c502144e7388b900138bca6260f4e8"
-SRC_URI = "git://git.zx2c4.com/wireguard-tools;branch=master"
+SRC_URI = "git://github.com/WireGuard/wireguard-tools.git;branch=master;protocol=https"
 
 inherit bash-completion systemd pkgconfig
 
-- 
2.43.0


