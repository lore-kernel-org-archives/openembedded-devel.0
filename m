Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id DD39D7C0D7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Dec 2018 14:42:01 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id g67so6694669wmd.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Dec 2018 06:42:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=kvCAHDWAIJh1EYoQV+z1pMJoxV9E15gGddtEhkJ3QYY=;
	b=AZPk5rL4a0nq+WacTRHQEeZMtot/vhIkV+z89DS7mliDHu+iKHtE6NQ9H6PGVjAnly
	7eWL+u3rC/SfWvOqdnblUr7io6+PIZD0Y0O4e79UfJABOr8RLSngerul5gKYSSvAnzj9
	k1exodh127rYUyXiap2QihzFCJBUIv/KGy55+SXWerXA9q059byIMSwxjYBLfCfJk8rW
	0uWocPU948v4qMCdAIpHo5O7rlxi/l9xbdB1revGedOwYNSz06blric36Mxl9t8TKQnx
	739z4/PSaVvc+FU4uQpraYUx6J/leFyGXkT7ZB3bKmehM6NwgH/MUJnL78r35G+z9/2q
	42gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=kvCAHDWAIJh1EYoQV+z1pMJoxV9E15gGddtEhkJ3QYY=;
	b=coduXpTBUnjWjhpVfCDKni8ntiP/edLuJI4B+/F3ieeWPZxs7m+frR61mCTodWdixv
	hLz9OC2lMY5XHS9gruLVnkNx4Jhq2jwy3aiD6H2c7NzUoqrqXt2aowsRarraxg38a35T
	JZ1TkJhzM4mV+yvVYnsFrMUHYYsqMKHOwRn8tmcPNRw7N5hX995o5JfC9UetrrG6Cgnb
	P/crQs4RU3zmD3f6kYkSLRmFgOukgMcYgkB2Adxi2R7t6rIvlX76351gGuRY7Sdhlz3d
	cGgLzfN0RrlB3M8D2Vx6VmnP/qMD8MIiSdxEbO5SYCX6RotwTW6o4BdiPjVOlGm+I68U
	XbqQ==
X-Gm-Message-State: AA+aEWa5RoOSNCYL0J8JljMtlqFB/TDWenZ5iaYtqXfBgmQit/MIwAjo
	owlPbhj5vyoRHmzth0Snb68wRGAe
X-Google-Smtp-Source: AFSGD/U9/3+Zl1LM1G3FxQDDOVMg6Tjw0fXIM3MLeJLu7+mu0HkLqxgWeCEwRy9rMQaK0tUo4NCe/g==
X-Received: by 2002:a1c:bb04:: with SMTP id l4mr6899708wmf.142.1545230522450; 
	Wed, 19 Dec 2018 06:42:02 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	l37sm10111471wre.69.2018.12.19.06.42.01
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 19 Dec 2018 06:42:01 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 19 Dec 2018 14:41:55 +0000
Message-Id: <20181219144155.31236-6-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181219144155.31236-1-Martin.Jansa@gmail.com>
References: <20181219144155.31236-1-Martin.Jansa@gmail.com>
Subject: [sumo][meta-oe][PATCH 6/6] geoip: update SRC_URI
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
X-List-Received-Date: Wed, 19 Dec 2018 14:42:02 -0000

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


