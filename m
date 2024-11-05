Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8CF1D2C109
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 14:37:00 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
 by mx.groups.io with SMTP id smtpd.web10.19607.1730817412892266139
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 06:36:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=X7/6V1Fi;
 spf=pass (domain: gmail.com, ip: 209.85.128.177, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-6ea11b32ab4so36753437b3.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 06:36:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730817412; x=1731422212; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CoQ6EP3PdQuMpoPXSMinDDzL6cNeFdkvjk9t/9qH6wY=;
        b=X7/6V1Fix0Ai1VIvKT/EC/sVL5aZimYsrZjOn5AqOtT07jsFTgwk6pW7aMOwumKzFF
         R2HVW9CYVchWjL2F1I306OgIccGwbh9kfynN2gcyPO6/2iRII1WwN2I+nAZXruQbSPFa
         dfW77oVZfflPXeMfVMJp5YWX06tf8e9waY1DLPcFzhHhHpjYN8B8JlEwVwimvthxDznB
         YhLS/bu3njwoITvMuAwVQluMpKxWUKp5/Nb6e/1y5d3TnP7+FmDCid+7SRCeB3veCByS
         h1C4+tLX4qedQKOgLSXpypnyvLifd98Owg6UJeeAfZouRr8p9URImFBxCzYvg4ypK4J4
         okLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730817412; x=1731422212;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CoQ6EP3PdQuMpoPXSMinDDzL6cNeFdkvjk9t/9qH6wY=;
        b=vnHFY17E4SOJe9S3pp77wdPdmyU/KIvT+kKTo3C8gP7qkUEyIcNgjFDWBeF96T3YZP
         epLwUmJvZJj/dKTTw9SFAC8LHC62EqRcd/PH9iLCUV0eJ0FptKE+es/r01cXmGKnuYMZ
         4bh13awAwPHF+iIYbuRUcZkZHKZPV+yQfQvVPMLmRSObtEzqvcwbK8sWuowHlkVn7zdI
         +bLaXUfN6LC/89P+NfPUkI+CsMhI+cyfxC/qhE8OrSBfRSoam5+sCHUbwJf7eGsL4QE6
         e1v5tLyztV4tWtpa0lwDyO6AyaMDwOABA7Bk1NQI7ORkPK+wpxTVCwLVv5NAkSENpWre
         /RIQ==
X-Gm-Message-State: AOJu0Yzw/vaaT7KpfhTDHQpN+I2uT0oUhYhYDMZe98T2bkgBPr9HRh6E
	Z9+Q2i+4OZs1IbERM1GneskTpbc36eHpaZYaPBj0mFfmXUU5Q3v/yqusnw==
X-Google-Smtp-Source: AGHT+IHa64AUlf2Ll7Xag2QsT6HkssOFTx2Cjroe9nkfI3A1Zl2t0VsZx7Dl4V1TfvyYX+EbpZOsHA==
X-Received: by 2002:a05:690c:7304:b0:6e2:fcb5:52fa with SMTP id 00721157ae682-6ea558288e0mr152364917b3.9.1730817411925;
        Tue, 05 Nov 2024 06:36:51 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:45dd:7000::29])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c8723esm22495977b3.126.2024.11.05.06.36.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 06:36:51 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][styhead][PATCH 28/90] traceroute: upgrade 2.1.5 -> 2.1.6
Date: Tue,  5 Nov 2024 09:34:53 -0500
Message-ID: <20241105143638.2301245-29-akuster808@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105143638.2301245-1-akuster808@gmail.com>
References: <20241105143638.2301245-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 14:37:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113446

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
- Let getaddrinfo(3) select the default IPv4 or IPv6 protocol version
  when it is not explicitly specified on the command line

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../traceroute/{traceroute_2.1.5.bb => traceroute_2.1.6.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/traceroute/{traceroute_2.1.5.bb => traceroute_2.1.6.bb} (94%)

diff --git a/meta-networking/recipes-support/traceroute/traceroute_2.1.5.bb b/meta-networking/recipes-support/traceroute/traceroute_2.1.6.bb
similarity index 94%
rename from meta-networking/recipes-support/traceroute/traceroute_2.1.5.bb
rename to meta-networking/recipes-support/traceroute/traceroute_2.1.6.bb
index 862cba91e9..b72c375400 100644
--- a/meta-networking/recipes-support/traceroute/traceroute_2.1.5.bb
+++ b/meta-networking/recipes-support/traceroute/traceroute_2.1.6.bb
@@ -17,7 +17,7 @@ UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/traceroute/files/tracerou
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/traceroute/traceroute/${BP}/${BP}.tar.gz \
 "
-SRC_URI[sha256sum] = "9c6c260d96eaab51e3ce461b0a84fe87123ebc6dd6c9a59fab803f95b35a859e"
+SRC_URI[sha256sum] = "9ccef9cdb9d7a98ff7fbf93f79ebd0e48881664b525c4b232a0fcec7dcb9db5e"
 
 EXTRA_OEMAKE = "VPATH=${STAGING_LIBDIR}"
 LTOEXTRA += "-flto-partition=none"
-- 
2.43.0


