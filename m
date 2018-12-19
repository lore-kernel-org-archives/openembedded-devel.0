Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
	[209.85.221.42])
	by mail.openembedded.org (Postfix) with ESMTP id CBE7679E1E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Dec 2018 14:41:55 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id j2so19809218wrw.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Dec 2018 06:41:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=T5OHjJxkHNH8B5y2uUbBeiI2y4aOn+/Ee/5TiYrGXCQ=;
	b=VM6LvACbKT95QiM9UjYoN18pYIUrF1baW3DIfj42eXFDBTY71FoHbQjiKcH20sqZjW
	m86UUKDGzAo3WrFd4P9dyhhSBUNslP9AXvKZ4N+4uU2AELuqdm3pj5k9uPjlVZgbm8RI
	YOp7cP2pozKVN/De1f5q6T0GMB2w3HtI8FMVYk49E1DViw28Vn0IpGkDQNYqaBd/+mKJ
	sZfB2GA41XypE5uKbI2Tz9LDrPqVqKK30CHl9x2IGd+fVOkucRpKMQTQLEkWjbd2ic/m
	Q25jcNn9krT2cFdG3jKwrqJ1jbJPLY1M5cnVwofaXak5pBbtdLSAjKFavynTuWmf5JQY
	ZwtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=T5OHjJxkHNH8B5y2uUbBeiI2y4aOn+/Ee/5TiYrGXCQ=;
	b=EqfGMmRsTq2C08FTByhYvZL2CZf6VpWQWW6BRVJtMHleUr9DLt1++N4E89u4jbNs8K
	7Y9Ib41UgZ/4cVTpxf40YOeerlBiGEkrVoX7r9jCzU/nQ5GufT8JhYUSfNU0vK1PJDNW
	OxnQW5s9UieZ4uRlzmiXzGq9jVTljsAJ9F7o/s+P5AOpdPxjlT7dh6jCaHhRRC/uHNNm
	fFQF/DEyHEzsEwy/sV/CvthIPkgzfbG96mZEetwxStHG9MCvfo7yrUSArVR1JAhspPB4
	rPx6v4+MDeiktarImiJVk/e5aCVQauVaQXv2FdXhPJNrlXLDjaWpYx/78cs2woszeOOy
	P5bQ==
X-Gm-Message-State: AA+aEWaK7LZvs61QFYgIW7xreT5h9ip3UURt3VKVmBubqFaiX2KHVHav
	PpHCoHcFW6YoQxw9/lnBxpWaMTuz
X-Google-Smtp-Source: AFSGD/XaML51720bF4ZQ7o595ksHVjY0pxmR7CJtTL1MCZXx07imt5QixyM8qoVuAe/i7X2m8Ym03g==
X-Received: by 2002:a5d:5443:: with SMTP id w3mr17529094wrv.4.1545230516259;
	Wed, 19 Dec 2018 06:41:56 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	y13sm4335235wrw.85.2018.12.19.06.41.55
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 19 Dec 2018 06:41:55 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 19 Dec 2018 14:41:50 +0000
Message-Id: <20181219144155.31236-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [sumo][meta-oe][PATCH 1/6] geoip: upgrade 1.6.11 -> 1.6.12
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 19 Dec 2018 14:41:56 -0000

From: Changqing Li <changqing.li@windriver.com>

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-support/geoip/{geoip_1.6.11.bb => geoip_1.6.12.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/geoip/{geoip_1.6.11.bb => geoip_1.6.12.bb} (98%)

diff --git a/meta-networking/recipes-support/geoip/geoip_1.6.11.bb b/meta-networking/recipes-support/geoip/geoip_1.6.12.bb
similarity index 98%
rename from meta-networking/recipes-support/geoip/geoip_1.6.11.bb
rename to meta-networking/recipes-support/geoip/geoip_1.6.12.bb
index 3527d0cba7..4e717e4b95 100644
--- a/meta-networking/recipes-support/geoip/geoip_1.6.11.bb
+++ b/meta-networking/recipes-support/geoip/geoip_1.6.12.bb
@@ -15,7 +15,7 @@ SRC_URI = "git://github.com/maxmind/geoip-api-c.git \
            http://geolite.maxmind.com/download/geoip/database/GeoLiteCityv6-beta/GeoLiteCityv6.dat.gz;apply=no;name=GeoLiteCityv6-dat \
            file://run-ptest \
 "
-SRCREV = "3169a8a88808c8df862e0b0355f99c738cce9f7e"
+SRCREV = "4b526e7331ca1d692b74a0509ddcc725622ed31a"
 
 SRC_URI[GeoIP-dat.md5sum] = "37c84ead332dda0362a5ac7b049b72d4"
 SRC_URI[GeoIP-dat.sha256sum] = "79ff1099e96c2dc1c2539c9a18aaa13a9afd085cae477df60d95f1644d42bc07"
-- 
2.17.1


