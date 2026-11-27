Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8083.1795739717773819676
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 16:35:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=kZfHyorn;
 spf=pass (domain: gmail.com, ip: 74.125.82.180, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-386d1859e1cso1899633eec.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 16:35:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795739717; x=1796344517; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=auJo/GMBJI6laAZ4eS2ekAh5p8ONMp78Prm9KDAUjpY=;
        b=kZfHyorn/Lu05TZL+hg3DQ8NoJRUS9+3ycBowXmkIHtajR6XfI3V002KaM9ltCJjW7
         icjmpx2LuWUPz+ieNWlIUPQ35ohE9rMiKPkurzp0Gsg+RjPjIVPWjyffL3y1c1xHPQ6d
         cahXOkvt1yA9YN6d3mmTTf/M2O4jK99E8FMzqLOxXcvvYmagpv2PQ6zo4IDVtlLXFjrG
         3hVNVz6UBT1IgFpx5rvca3saB5Lzw+DoOOihrs1iUljvrirkwBxWRDnSTAak6pdvCWAi
         V4Y/Js21sV+phL/IRYNugSR6kOMCIk6tkTYeyf6FgyWVHbc+lncc/vDMDiHKKNcvEgtL
         R8lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795739717; x=1796344517;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=auJo/GMBJI6laAZ4eS2ekAh5p8ONMp78Prm9KDAUjpY=;
        b=OoiiqQiAvQ2mMpC/VwxqWHTCnyG4kpuIgTJSxiKn5YQF7sxSG4j5ttoJyD8YYvsusr
         KLVwUoYkcLdDe1qvcyh4zYsWX1nVPSfLm4pRtqk129fqWqsw+iwv5w4vwtCWSrpGz7Bd
         4fXNrF78ChyDkBjSG1s8riCYWAkYLcJy2GRaL2NRWbEqouZSskgtbbUAD+GYR1YYSFKw
         9bK6fydM/vdTcpT+MgZ91zmckl6vvL1U8YLiV/qsNpI7JJfJ5sR8AB7IK9paRVFwRHGL
         jwluIqqoCc9YEfIoMPnJtZyhNCmoPAME6U/NK0zg9jgEbXhqzHfw4zrz4N7HgNCLL3L9
         nkpQ==
X-Gm-Message-State: APuU4Z9Ci5mwHG8C+dEihnmZWOz/iS6+aFv8a4R8Mzr1uZO981rEL0sd
	OpLSJPWcfI0Zsy4yR4XnoNj5y/13bO0caczLjzZG0AhvvwYoO5tGvyekRwR5OoJ8
X-Gm-Gg: AZFdTZcH5VVI3bk/LKUpy4+UB+2djGGOMXHX7QhM+I06GA5LnOyojCS0ozOUhLupToc
	Wd8/+dVWmrVPKN2E0aLCCSsyxzhsCXs/nluJmd48ksdaxi9Ub6KHtvv/6nxK9txBj4+jhuznWdp
	0SI9yLAei39KHRhgEM+4sXvUltRHtgV7euHcegefHJfxb2Sv6A/yR1ZObhv6NMTIeZtEyFPfdJG
	l+vsBseXlFXJaEmx+HiFYGMvbzdY4sTZc6cKYPYTG/rukDnJZsCOb6kAnIgqJjO/X7fkkty3vHY
	qHc4jPze77acYgw9w5Thz2LAY3Bo9exJE+goFLPK2/V8akAtaNMLg1lzEyvUJEWmNnw4TsvZGCy
	2fNLH+AiM2t11CfS9OQhzDjpuMSgpWhIfUYPScZu+FuSCyeMyM9Zou2uTLOuUMXIGdnH5MQUyOa
	Qm0r/ikZQB40fR6CR/glXGwVtAvp87YGa1nrVmbJuUZGPtYecLJXaV6pJmAUkHHAOX3kJ7BzW/i
	Tc4N1fYDKkB5GxC4UFyYMgiKZ900RdpKzhp0xV4teBvzTN7Cz882NkGKqQhFF5uBOT0AtK2WUar
	KvmaKStCqnNzgWTWAWeD2EJjB0tlLEC3Ca7jSCUUIfvRXg/86/NnICgeKZAUU7i2oA/VW2VHQXF
	v0ZknR5hxOKfeSCuzd9dyQ/HzDG7cyPQ8w8rJSRouP/31POS+4BZkSW7RtwHDU0i040FrW+UZ0s
	T8kz268iOf1NAm96nEkwyrJvJIbHr/gODRZ4FMIwmfmSaZkSIqaWiEBdnqPphEydEGxvwi4qUYK
	Jfq7/Gm4X1x46QdReJ+m49AIGDDT6FJqU3W3hJD7epGFaNfhhMNuPdi7fUutUk29KUTgdKzvtFZ
	IiMb
X-Received: by 2002:a05:693c:811c:b0:386:ddd5:14e2 with SMTP id 5a478bee46e88-386ddd52196mr3537387eec.0.1795739717032;
        Thu, 26 Nov 2026 16:35:17 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672ce402sm63029314eec.16.2026.11.26.16.35.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 16:35:16 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 45/69] libspatialite: Fix upstream version check
Date: Thu, 26 Nov 2026 16:34:01 -0800
Message-ID: <20261127003425.2166632-46-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127003425.2166632-1-khem.raj@oss.qualcomm.com>
References: <20261127003425.2166632-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 00:35:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133145
Content-Type: text/plain; charset="utf-8"

The default regex accepted release candidates such as
libspatialite-5.1.0-RC1 and reported them as newer. Only match final
libspatialite-<version>.tar.gz tarballs.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-navigation/libspatialite/libspatialite_5.1.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-navigation/libspatialite/libspatialite_5.1.0.bb b/meta-oe/recipes-navigation/libspatialite/libspatialite_5.1.0.bb
index e4b9513cf5..4411379839 100644
--- a/meta-oe/recipes-navigation/libspatialite/libspatialite_5.1.0.bb
+++ b/meta-oe/recipes-navigation/libspatialite/libspatialite_5.1.0.bb
@@ -13,6 +13,8 @@ SRC_URI = "http://www.gaia-gis.it/gaia-sins/libspatialite-sources/libspatialite-
 "
 SRC_URI[sha256sum] = "43be2dd349daffe016dd1400c5d11285828c22fea35ca5109f21f3ed50605080"
 
+UPSTREAM_CHECK_REGEX = "libspatialite-(?P<pver>\d+(\.\d+)+)\.tar\.gz"
+
 inherit autotools-brokensep pkgconfig
 
 EXTRA_OECONF = "--enable-freexl=no --disable-rttopo --disable-minizip"
