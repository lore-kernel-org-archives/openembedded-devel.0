Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
	[209.85.128.52])
	by mail.openembedded.org (Postfix) with ESMTP id CF04979CEE
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Dec 2018 14:41:15 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id n190so6358108wmd.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Dec 2018 06:41:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=kvCAHDWAIJh1EYoQV+z1pMJoxV9E15gGddtEhkJ3QYY=;
	b=L9sxGFx5Q4wwGg9vamikS7BLY5xazFzQN492iiwg1MD12lDs9tdP+M/rzcnBClCQuu
	WfhgcmwL9Cxgko4CCDJPltJzg9C7rOdynlUgr2KoIynQvGidSrD0sp96yg5CQAcylb7p
	ojD0tpFaqtEhRE842uK8tfvZDF3+lWwBlFTwQ8ClcHacF5Qa2QgI8J04hPbhfv7Muzra
	rpeEJOXihsoWZqzLZyEO/4KxpL4yXGJxYWZuyBYcOdPrUiilmQWqO0Oo9Pn/U8EBJUU4
	ZAqtZlswOPXimJgc81RQWYnZy7EdyOobpnGQnEzPaWikimeeAhTdNaLD5Q72SSABxJQY
	aKTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=kvCAHDWAIJh1EYoQV+z1pMJoxV9E15gGddtEhkJ3QYY=;
	b=DPMSKDNcTnANm204JCD7dEVw/EBz3Fqgp94UsgBITvTKJGdhhEOSbu0e69oXnWrXVH
	keoll34HdRu9pH0IaPLtY4F6KePTobwa7NxxL8bUR1sTTfQ8bJ46YI8qbRhRX8yHFwbj
	mS5NiXb8yi3M/p9NqbA+HxgsevLl8RdCbdQN3/39BEMNcYbNg86aRNvFtPyG9Ie3Oc2X
	oIsUJ73AqfQjL0mfgZo5z5KbPcxR6nRvfHAuagQTn3FpQGxpU6X4RO6aYyyYVkppBDdV
	+VVY7VES7s7jaytfoqSgk0Gwk/HoNC7h3BJt5PFK5sdz9hE5B1Qb7qlyhlUUC30043Zk
	ikyA==
X-Gm-Message-State: AA+aEWaW+rwPwjLppPoPsKhRkJx0yUjzdFdQDfAiCDpq+8f4Jc6YPR/B
	LVttwfRU1xuG0JlhTfNmtu15Feof
X-Google-Smtp-Source: AFSGD/WjWKq3kWkgyeBl7sje/H9Y7J5iLVjQQ10vF0GQjMCFyjLVyXgYGxiMAdJU0dVzIde24qDI6g==
X-Received: by 2002:a1c:6a16:: with SMTP id f22mr7497141wmc.25.1545230475767; 
	Wed, 19 Dec 2018 06:41:15 -0800 (PST)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id r12sm9096814wrq.3.2018.12.19.06.41.14
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 19 Dec 2018 06:41:14 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 19 Dec 2018 14:41:13 +0000
Message-Id: <20181219144113.31057-3-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181219144113.31057-1-Martin.Jansa@gmail.com>
References: <20181219144113.31057-1-Martin.Jansa@gmail.com>
Subject: [PATCH][thud][meta-oe 3/3] geoip: update SRC_URI
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
X-List-Received-Date: Wed, 19 Dec 2018 14:41:16 -0000

From: Changqing Li <changqing.li@windriver.com>

previous database on maxmind website will be removed from January 2, 2019.
and also we met checksum weekly change problem, so update the SRC_URI to
http://sources.openembedded.org/

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-support/geoip/geoip_1.6.12.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-networking/recipes-support/geoip/geoip_1.6.12.bb b/meta-networking/recipes-support/geoip/geoip_1.6.12.bb
index c3ce4d88a9..4271c2e155 100644
--- a/meta-networking/recipes-support/geoip/geoip_1.6.12.bb
+++ b/meta-networking/recipes-support/geoip/geoip_1.6.12.bb
@@ -11,10 +11,10 @@ SECTION = "libdevel"
 GEOIP_DATABASE_VERSION = "20181205"
 
 SRC_URI = "git://github.com/maxmind/geoip-api-c.git \
-           http://geolite.maxmind.com/download/geoip/database/GeoLiteCountry/GeoIP.dat.gz;apply=no;name=GeoIP-dat;downloadfilename=GeoIP.dat.${GEOIP_DATABASE_VERSION}.gz \
-           http://geolite.maxmind.com/download/geoip/database/GeoIPv6.dat.gz;apply=no;name=GeoIPv6-dat;downloadfilename=GeoIPv6.dat.${GEOIP_DATABASE_VERSION}.gz \
-           http://geolite.maxmind.com/download/geoip/database/GeoLiteCity.dat.gz;apply=no;name=GeoLiteCity-dat;downloadfilename=GeoLiteCity.dat.${GEOIP_DATABASE_VERSION}.gz \
-           http://geolite.maxmind.com/download/geoip/database/GeoLiteCityv6-beta/GeoLiteCityv6.dat.gz;apply=no;name=GeoLiteCityv6-dat;downloadfilename=GeoLiteCityv6.dat.${GEOIP_DATABASE_VERSION}.gz \
+           http://sources.openembedded.org/GeoIP.dat.${GEOIP_DATABASE_VERSION}.gz;apply=no;name=GeoIP-dat; \
+           http://sources.openembedded.org/GeoIPv6.dat.${GEOIP_DATABASE_VERSION}.gz;apply=no;name=GeoIPv6-dat; \
+           http://sources.openembedded.org/GeoLiteCity.dat.${GEOIP_DATABASE_VERSION}.gz;apply=no;name=GeoLiteCity-dat; \
+           http://sources.openembedded.org/GeoLiteCityv6.dat.${GEOIP_DATABASE_VERSION}.gz;apply=no;name=GeoLiteCityv6-dat; \
            file://run-ptest \
 "
 SRCREV = "4b526e7331ca1d692b74a0509ddcc725622ed31a"
-- 
2.17.1


