Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F455C43217
	for <webhook@archiver.kernel.org>; Thu, 16 Dec 2021 15:23:37 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com
 [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web11.11754.1639668216142939077
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Dec 2021 07:23:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fw3aAQ15;
 spf=pass (domain: gmail.com, ip: 209.85.215.171,
 mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f171.google.com with SMTP id d11so14684646pgl.1
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Dec 2021 07:23:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=XqFKIvSuNM7fnnBjhurqxjlsHZpHnJH/FVCpg3KQrfc=;
        b=fw3aAQ15vwtUW3hLjZpNggEA+JFbfWLJE6uYXmFasApX5kxQLpw8m9Ma/zh/CaJ1kf
         vWZ2vaceHqRixtt+flFY9uP+JKkhakemmqfDVsZA5JMsoB8MqcpYroZLpdxucCe9TFdz
         f4i8da8EJvuCD1JgkU2zbcpaijDaRXDUoQLMMFAQ9Z6jgsI7unA+TvpgkQoPPjryePdR
         c//hqDlnaYJ2XibqeJpPGMzLlkBPHZMzBufeZPMRbsQ9/eoxkb64GN/KHQmDmV/NunYk
         JoBEmyHVq/1ntMDdX8B/dk58HFqbk+XhOI98DLAhnoY/LxnK/27GolL1dvCHfRvTOdqf
         4PkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XqFKIvSuNM7fnnBjhurqxjlsHZpHnJH/FVCpg3KQrfc=;
        b=z42ozbcaqr+L6ZiB6W1mTsSh+3i2UulDCirK4+Hfip3b/5/o/6S9aucOj+k00EdM78
         U5+xRA5hhiUNiAJhFD4CYylS20KroDvLj0/GJrHDSjgWrHPkW/cA3/SwsyFiMSU72bTu
         L3Y1zgneU2t1CsvKDhueNTpMkfi5s+i16fLxnmIimCEA8RDWhI0T9+q5iP13mCFjRh1M
         43or1xzG03lu//NRR9QDgeJYuRMQOxp3xc7DOj0xG2VAhIrWrB4LkW471AIlel/KUIfv
         Lc4LQUiQOSoWU3c1sX1MsnHXh2z18n9ahMswQsjYAM6JEpQ4ZCUnEF19KG6swntsrPLO
         7UtA==
X-Gm-Message-State: AOAM531KxIznMKnXJOwj/Zzk52D85TR2a7c5S75TiSyxO3NW11V7N+uv
	O+MoQpw7EMlpGEaH8gqconIcSIsGymQ=
X-Google-Smtp-Source: 
 ABdhPJzlnZa/6Q/QC2n3mURK/BXWcKOCzzy2kgEArlbqTsYGGW65alB3kzKZe2WqZXWs6DoXL5qwcg==
X-Received: by 2002:aa7:9af4:0:b0:4a4:cd7f:2732 with SMTP id
 y20-20020aa79af4000000b004a4cd7f2732mr14699468pfp.60.1639668215527;
        Thu, 16 Dec 2021 07:23:35 -0800 (PST)
Received: from keaua.hsd1.ca.comcast.net
 ([2601:202:4180:a5c0:7d7:ca51:b150:8ee7])
        by smtp.gmail.com with ESMTPSA id
 k15sm6795703pff.215.2021.12.16.07.23.34
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Dec 2021 07:23:35 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [honister 10/18] python3-cryptography: set precise BSD license
Date: Thu, 16 Dec 2021 07:23:15 -0800
Message-Id: 
 <85bd2259782464ff89c2ae9de8f0fe82a77b2587.1639668121.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1639668121.git.akuster808@gmail.com>
References: <cover.1639668121.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Dec 2021 15:23:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94395

From: Ross Burton <ross@burtonini.com>

"BSD" is ambiguous, use the precise license BSD-3-Clause.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
(cherry picked from commit 378dbb135b4ce6f44cf647e8aa08f01497c160cb)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-devtools/python/python3-cryptography_3.3.2.bb   | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-cryptography_3.3.2.bb b/meta-python/recipes-devtools/python/python3-cryptography_3.3.2.bb
index baec105a3e..6c70284564 100644
--- a/meta-python/recipes-devtools/python/python3-cryptography_3.3.2.bb
+++ b/meta-python/recipes-devtools/python/python3-cryptography_3.3.2.bb
@@ -1,8 +1,10 @@
 SUMMARY = "Provides cryptographic recipes and primitives to python developers"
 HOMEPAGE = "https://cryptography.io/"
 SECTION = "devel/python"
-LICENSE = "Apache-2.0 | BSD"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=bf405a8056a6647e7d077b0e7bc36aba"
+LICENSE = "Apache-2.0 | BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=bf405a8056a6647e7d077b0e7bc36aba \
+                    file://LICENSE.APACHE;md5=4e168cce331e5c827d4c2b68a6200e1b \
+                    file://LICENSE.BSD;md5=5ae30ba4123bc4f2fa49aa0b0dce887b"
 
 LDSHARED += "-pthread"
 
-- 
2.25.1


