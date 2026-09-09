Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BA73C79FB9
	for <webhook@archiver.kernel.org>; Wed,  9 Sep 2026 08:32:36 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7119.1788942754740506708
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Sep 2026 01:32:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=nvoFt8XB;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2dcff8f44f2so5476575ad.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 09 Sep 2026 01:32:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788942754; x=1789547554; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EJhHMu3WP5axg6wYuj8RUCpXRPX7Im5vhoWxE50p1ng=;
        b=nvoFt8XBClTSwhk8ArxO6dyGrBGCiHGQhf6vKS7X4Nvotie1hwVprGFeVZGOQLjWEo
         LLYa/XkrYN1PLgOBZd3+wp9TUXhFu75zRZVjuBhAbUlZTIkPHiTFbIDQZzKtaHdd5EIm
         JhFdWx7uiGBGdaxmoUMLoU8SitTGA+X3gmJefr7dB7G+52cBZlUoFo1O81v7xZvx3OPF
         j4wRWbpqg4kFuucWKuVv6ZotJAGS+ddUEjPqon1h7djo6Cr9I2uxx/dcimIJPnVbtLxl
         uEVjTLXhvupCbNWc2jeYoRGnbjirdOACPqb1aHyLoCfXjwhlvoc35vLuUTNdxp5A5qRy
         VpxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788942754; x=1789547554;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EJhHMu3WP5axg6wYuj8RUCpXRPX7Im5vhoWxE50p1ng=;
        b=OyATYxvknhRRDeN+ht5LxSXuj3Ab4DggzvjV3OQVWGhgEFMVEDMwu4LhFHipcBMUCY
         xkwvOTa7nJoEsMeRytyGqEXXbcgQd5vvM/ooFZmqUggL5qbnoV2AMmK+7xn6dBSSYKvV
         8MMxBSRAGGLOzLBDtOl0yfD14wFJvPf2J8DHj7VnJV7HW43L1hcvHWNzNhSC0vFzeBeS
         BJL9wmZaW/pHvlLJ/pso0b5pscj5dQjQkTDN8HiX4Pj0k261Zs1xcGjGCfo9F4h5H4+L
         QzaNbCtIkliV5msKbYhgsNPHnMFAg2qPlFcZGy576TYcP5/Ss4HaN+GU184FF6Mra60a
         l5RA==
X-Gm-Message-State: AFuF++kIW1t2hDQK7USTlzDSKRP+nNZO0bKCZPMkOKY7yz8MQpGw3zlv
	xD5nMZhzrSK6MPMf2Z7iYBgUWoJg2aFjxlLEi3B5RtHeoC9hR9zJeRqpyVGbeZsM
X-Gm-Gg: AYBFou0XcXg19RHEYMnWQlokySJUMtzGLgP2rOYZrPsD9oC4u5z+S1/fiH3PeK3ScVH
	Fy6SzSimVJ7ScGks86oYcvdGlTTzTdDtdRXMD0y+gb2ElIY9PwfH/OfxXsF2Yxc5ZeC2boPJ3ZD
	fjJeDU13g0t7x2tX7XyOJF3FGhLeBU4QCA5FBFGuIx8BkE2dujMlc15etLEUnBZVUUO6yxJiOHB
	R0apmgY81LfGjcmyZj1gKFpHYbH9+7yudTKMNvHUIeWsqVwfxGbSEFZkOr4htYS5Wl3fiw8KJbQ
	YMYYUGSgF7KyGaLBPvJ073IrTBnzocWq65eRysehuZp3wItb6LxZ6Z4GmwWW0hd1I33JeRcsaZS
	1TdiuhefnkCHN9f+uAYeoEydKSRhvoXLDNS+/Eqt/hrdZbSwI3HdZljLReyNhkcNMyop/CrScaN
	OSdIFDIGERaZf3/0QVTQ+e9aiQkYFYEAwBehHvP8Mh85WEcIZ/jqj5bmi7GoV+C63hCP2hbI3DG
	0dcJAlz4RTbKGRtBpJm09E=
X-Received: by 2002:a17:90b:4b90:b0:38e:49c0:75a7 with SMTP id 98e67ed59e1d1-39b2610f2fbmr47436302a91.8.1788942754096;
        Wed, 09 Sep 2026 01:32:34 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39cfa5c1d17sm788649a91.4.2026.09.09.01.32.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 01:32:33 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][wrynose][PATCH 15/15] python3-h11: mark CVE-2025-43859 patched
Date: Wed,  9 Sep 2026 20:31:40 +1200
Message-ID: <20260909083140.2494932-15-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260909083140.2494932-1-ankur.tyagi85@gmail.com>
References: <20260909083140.2494932-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Sep 2026 08:32:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129886

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2025-43859

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-python/recipes-devtools/python/python3-h11_0.16.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-h11_0.16.0.bb b/meta-python/recipes-devtools/python/python3-h11_0.16.0.bb
index ed1702ff54..0bc1cd5c41 100644
--- a/meta-python/recipes-devtools/python/python3-h11_0.16.0.bb
+++ b/meta-python/recipes-devtools/python/python3-h11_0.16.0.bb
@@ -10,3 +10,5 @@ SRC_URI[sha256sum] = "4e35b956cf45792e4caa5885e69fba00bdbc6ffafbfa020300e549b208
 CVE_PRODUCT = "python-hyper:h11"
 
 RDEPENDS:${PN} += "python3-profile"
+
+CVE_STATUS[CVE-2025-43859] = "fixed-version: fixed in v0.16.0"

