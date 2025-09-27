Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20AFFCAC5B0
	for <webhook@archiver.kernel.org>; Sat, 27 Sep 2025 06:32:46 +0000 (UTC)
Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
 by mx.groups.io with SMTP id smtpd.web10.6897.1758954757718667800
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Sep 2025 23:32:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lOiRc2d4;
 spf=pass (domain: gmail.com, ip: 209.85.166.175, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-il1-f175.google.com with SMTP id e9e14a558f8ab-4248746aabfso14776485ab.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 26 Sep 2025 23:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758954757; x=1759559557; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VnBTIPYef5e75Up7o3wwo25FiffG+DCyjEDkXABaOyM=;
        b=lOiRc2d443qVVsGg4hWR07ks3uWP/8sq6Xpws0/vKu5hEtLfJknQTHaU8qx3BjbUbA
         EQB8WznZKH69Njbn8AJxQa7GQfwrz5gTvfukGi45zmj1+DzPqt1nRFOThzwcTjwZXW4G
         h/vtv+JLvww9LIqINOo7hW97GRp3Avnx4UveEvXbz1+TFcDPm1LrgNWatPMvQtiiB8Hw
         LUmbSFONBRjpLXgDQJmOvPRr5D2FgvO+mwZjiFtmhTAIaZL2Ec346L4JKI8X0CwExY92
         6z4g6pXEgh1tQ4Ff7rBaaDx/YuA5upQvfhbOMjz5LlPqaMUeLI3Fu1hvs5SzMLg/SSmO
         Ud8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758954757; x=1759559557;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VnBTIPYef5e75Up7o3wwo25FiffG+DCyjEDkXABaOyM=;
        b=s7UyY8ChcxVqFu709YbIJRtRWEI3NxBXqlCc4OAjYBzpRPGhRK/pgHklAxb9Zs9l6D
         StINdZwAH1J4vEw4PgeUnnqsTYyMkFY9ZRgqoO7wfmcpx7x2t/+eFZttZOHDvxQw7um6
         zs08andfyUsZdheBgfeZJJ0Da7rbNtbtuML/13Mz61uCjrl0OTfBCqXUyWtS3ao5Ax1m
         r3i/ipN/r3pBfC1XwBViGKg0rUMBtRj9ECtTAA27s0XRuCxaBN+OZAVvwvQrwJ14z1Bf
         YNH7xjYDVgAObY4rHo1lBV5pp7EdlQXPf/s8lEo96VkMpRoSTchnnE+cQj6+oFF0fCkd
         TK0g==
X-Gm-Message-State: AOJu0YynalDH8zhmmHZo2feTvIFbddx414YNg8OhHxJ04x8aPgWlP4Oc
	GVxcfJFGjv6M6KphPxfJ1BFCDLAR9jrRFtjPmVNT5f0Ek/0Lsf+9OI+or3Ta6A==
X-Gm-Gg: ASbGncutD1WCfMwg9eXL2vA2JNTQu/DwH5QAOSRrzdlrDXQWy8czA2ftmNc2pONeNut
	H+ehTQOSGNBIRUJUptxHObDPcAxcv7Nr4YPv03kgJXQVHX7fdOCBuGGDuHF1+mphwwPceKSl0aZ
	torXFf2kAmfHLsgZwHxz75lzLlmJlneWgvPcpFZMTW3g7z/vxMSqBsygEHeh963cE8uzi3IgK69
	iAYRa2vbdW9TFv4hR6YMMIWzUfF0/1H2Ef8dNIVxIBJA6QHbAJfwjUV6tLDze29xOK5D61y4jGg
	nCRAdJuIawpWyQOWUNCiMIaBzH3tjL4LfhwTpa7kZjdTRrPO4DeIcjiiQtzoM6ahGwh7x8LgkyU
	m0CBckvUPv+skfsisS+zaPVvT8Gm64qhdaRw9uMgqenLRfhcglPvjFo4BK4/I+A==
X-Google-Smtp-Source: AGHT+IHxroSFveI9rdUF9SO7d3ldZt5Rxde32EYDAChd+HBJU7rahpTQoUrnx/d/wYv4DmotP2oiaQ==
X-Received: by 2002:a05:6e02:1a08:b0:41a:6194:c251 with SMTP id e9e14a558f8ab-425955af66cmr149350375ab.3.1758954756765;
        Fri, 26 Sep 2025 23:32:36 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([147.161.217.10])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-425bfab12c4sm30225685ab.22.2025.09.26.23.32.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 23:32:36 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][walnascar][PATCH 05/21] ser2net: upgrade 4.6.4 -> 4.6.5
Date: Sat, 27 Sep 2025 18:32:00 +1200
Message-ID: <20250927063216.1865627-6-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250927063216.1865627-1-ankur.tyagi85@gmail.com>
References: <20250927063216.1865627-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 27 Sep 2025 06:32:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119959

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 6cb55698985a13190a596c7bc8ae1f2ad301dc0b)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../ser2net/{ser2net_4.6.4.bb => ser2net_4.6.5.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/ser2net/{ser2net_4.6.4.bb => ser2net_4.6.5.bb} (91%)

diff --git a/meta-oe/recipes-connectivity/ser2net/ser2net_4.6.4.bb b/meta-oe/recipes-connectivity/ser2net/ser2net_4.6.5.bb
similarity index 91%
rename from meta-oe/recipes-connectivity/ser2net/ser2net_4.6.4.bb
rename to meta-oe/recipes-connectivity/ser2net/ser2net_4.6.5.bb
index ae8a5108d8..59322dae09 100644
--- a/meta-oe/recipes-connectivity/ser2net/ser2net_4.6.4.bb
+++ b/meta-oe/recipes-connectivity/ser2net/ser2net_4.6.5.bb
@@ -11,7 +11,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/project/ser2net/ser2net/ser2net-${PV}.tar.gz \
     file://ser2net.service \
 "
 
-SRC_URI[sha256sum] = "75864434c4f002fa3570daaffeb6f794354fca6d8b5814b8386977a3b1416be9"
+SRC_URI[sha256sum] = "96dfc3fd06b1bf4d7c1f46d7e8cc1eff555de64f419d76f57bd0346e000f9781"
 
 UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/ser2net/files/ser2net"
 

