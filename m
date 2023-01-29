Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56F03C636CD
	for <webhook@archiver.kernel.org>; Sun, 29 Jan 2023 21:00:53 +0000 (UTC)
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
 by mx.groups.io with SMTP id smtpd.web11.25727.1675026046995950153
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 29 Jan 2023 13:00:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fzSSP1c1;
 spf=pass (domain: gmail.com, ip: 209.85.167.176, mailfrom: akuster808@gmail.com)
Received: by mail-oi1-f176.google.com with SMTP id bx13so2777058oib.13
        for <openembedded-devel@lists.openembedded.org>; Sun, 29 Jan 2023 13:00:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Od55+50zt5IIESPxV0PMFrXl9ljx9srODZZQTTBphzk=;
        b=fzSSP1c1pML3bER69OM7ueJlrVNDLjeQPfAT2KZK2VMAFuxAzXPdnF3Kbo3Cb5Amgh
         7HE+7aBN5R5IMdpBVM/PB4tfTYoUK9mawuLZrsFNTFt+jnOHtlz3hs9jJTMu937YRe2G
         /KQpAkzteVFOofACL+NP1G3//FivCu4I1WYsZXZioSbRJAHjHrzEX5QFHNxHx9AdVal7
         Qdyd2GAi0ggLJ/VLjl7tIaoyNRkZ+UmQ2px+qWRtDNVdYxIglTppOVCloGB+R+gYc76F
         StQV6r8pfuEHS/jjY4wJEIGk8+hVypHxKOa2RNH01hed//JazqWvy8gBR1DdZEQVA3oN
         YB/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Od55+50zt5IIESPxV0PMFrXl9ljx9srODZZQTTBphzk=;
        b=rffx+LY/88qjk5wySLNAGaqRIy/tffxNlh28fjX0FK7chVsmm1x8qX5rIHU9O1UL6r
         T16Nhsq8Z3bAIEO/OD4e73iyIHTSwVofsuAEnrZMi3wEexDSXcI/g8hq2rap9+kvOSZh
         AKCQ6mTijxCQmHQzRZAdD7dXL0wUT6GD383BZ0ZsRGiO1D6CPLq77DDHwOB0ciXj1kr3
         cdIw9qmjxwJYae//8Bo32grvSXLhEH2VO18QEjGt9f52y0Ws3/RpTjwctv6nJKyNHWYT
         Un27lQw8CGluRmT4p80YdksaerhQEsYGEVl1RKpJtt8iTk4j+zhRDfdobz5ljQcktbka
         f55w==
X-Gm-Message-State: AFqh2krPDpA/jFDkhmUunPhpER5zEifR9Xdu5xQYIF28KPjIRQ+8ZrTw
	3IVMAAajYq1VpXIPaS/CuP9jGHhjhkQ=
X-Google-Smtp-Source: AMrXdXuIGM40iP1gIVgQdw5rPhnKsAkqc20TIuE8kEfmOYDG7sJWSd6mV3SIuv9aEl1Rv6eCRRR9BA==
X-Received: by 2002:a05:6808:1144:b0:364:ebf2:735f with SMTP id u4-20020a056808114400b00364ebf2735fmr29325871oiu.24.1675026048663;
        Sun, 29 Jan 2023 13:00:48 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:9bdc:8bb4:6dc0:aa04])
        by smtp.gmail.com with ESMTPSA id m17-20020a0568080f1100b0035028730c90sm4024065oiw.1.2023.01.29.13.00.48
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jan 2023 13:00:48 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [kirkstone 09/10] nftables: Fix missing leading whitespace with ':append'
Date: Sun, 29 Jan 2023 16:00:37 -0500
Message-Id: <0e02dfbd1f9456a59cea5f8da383899f79128222.1675025970.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1675025970.git.akuster808@gmail.com>
References: <cover.1675025970.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 29 Jan 2023 21:00:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100843

From: Niko Mauno <niko.mauno@vaisala.com>

Mitigate occurence where ':append' operator is used and leading
whitespace character is obviously missing, risking inadvertent
string concatenation.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit d25967208bc8c4b1e2099e34150a67508744e4b9)
Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-networking/recipes-filter/nftables/nftables_1.0.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-filter/nftables/nftables_1.0.2.bb b/meta-networking/recipes-filter/nftables/nftables_1.0.2.bb
index e078be79a1..080a0ed85c 100644
--- a/meta-networking/recipes-filter/nftables/nftables_1.0.2.bb
+++ b/meta-networking/recipes-filter/nftables/nftables_1.0.2.bb
@@ -38,7 +38,7 @@ RDEPENDS:${PN}-ptest += " make bash python3-core python3-ctypes python3-json pyt
 
 TESTDIR = "tests"
 
-PRIVATE_LIBS:${PN}-ptest:append = "libnftables.so.1"
+PRIVATE_LIBS:${PN}-ptest:append = " libnftables.so.1"
 
 do_install_ptest() {
     cp -rf ${S}/build-aux ${D}${PTEST_PATH}
-- 
2.25.1


