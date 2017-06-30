Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 4743378268
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Jun 2017 13:00:17 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id e199so17016433pfh.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Jun 2017 06:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=UzCSZkAFo5HORAi9/raagbl+8fP73NzpUGsWlVHnFlM=;
	b=uzea8sBrGKvSHGlnSAEQPY7GjeOy7I9k1aN7MFWct/mobp1ZRnot6YPo/xl9o3kvpY
	vTBgOI4Gymwpdwa8yacEV1haNwa1NFvh+5Z0Qz0BaLwsdxr3Om+lD4e3B+xKjcT0RRcP
	phsDuMm7pLRjZQ2msjOq8Xu+/6XT2Bp6sRJucGObW2qzn36+Y7MTx6845c5iwmzLJPDY
	sVO8l7yMBZMBTHBQr3HVKoSwU9vaZsspj215eOx1vhqyxw20R/XuCtRC+ibW1y1mKJ6F
	ZV669j7xOfXMsx4MJabE6ToG5jcWBpntb4BetYkoH1LhgAQJ7jjcMtW6Q0pM5SbOgHP1
	omsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=UzCSZkAFo5HORAi9/raagbl+8fP73NzpUGsWlVHnFlM=;
	b=chB+h1bSQM9FQpSdnhLAthTpEP1fB2TCpRfU38yHVXFXfqCRfCP9/Uupa5AvlD8Z85
	2afFztB2+ngvg/T8GY7Ds76h5i4JqYONsgffsRiO2l7jJkYZYAlIEa9nUJ+4PYLOdytB
	ttfr5X7VlFzxPRHqPrbVIsqg/VzoYxqxcQHoBTjfOdVKc3ngtiDXtlEzEoji5SuemE7L
	ytcOLOKYctkeEWzxV+x+WALOtWpil3vXP54JOPf5+RyZZGchwjwwEw57xCeIhLk+g8t/
	2cMfCzoVSU6cYeGJDSasJTpTkB77GzSd7+EX4MAZARM0vBOMZEYa26lXGIaiMUIyaUS3
	HIMg==
X-Gm-Message-State: AKS2vOzegQ8n/m4UZVsKgPj8bSSTXiLp6f3j51jaAulufz/e90gV+OnV
	YPrEB1MQSQ7/iaMd
X-Received: by 10.84.224.3 with SMTP id r3mr24461479plj.38.1498827618481;
	Fri, 30 Jun 2017 06:00:18 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::3df3])
	by smtp.gmail.com with ESMTPSA id
	t26sm10735590pfl.41.2017.06.30.06.00.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 30 Jun 2017 06:00:17 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 30 Jun 2017 05:59:45 -0700
Message-Id: <20170630125957.3342-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <20170630125957.3342-1-raj.khem@gmail.com>
References: <20170630125957.3342-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 05/17] gegl: Upgrade to 0.3.18
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
X-List-Received-Date: Fri, 30 Jun 2017 13:00:17 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-graphics/gegl/{gegl_0.3.4.bb => gegl_0.3.18.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/gegl/{gegl_0.3.4.bb => gegl_0.3.18.bb} (91%)

diff --git a/meta-oe/recipes-graphics/gegl/gegl_0.3.4.bb b/meta-oe/recipes-graphics/gegl/gegl_0.3.18.bb
similarity index 91%
rename from meta-oe/recipes-graphics/gegl/gegl_0.3.4.bb
rename to meta-oe/recipes-graphics/gegl/gegl_0.3.18.bb
index 90f02165c..6cc20f5c6 100644
--- a/meta-oe/recipes-graphics/gegl/gegl_0.3.4.bb
+++ b/meta-oe/recipes-graphics/gegl/gegl_0.3.18.bb
@@ -16,8 +16,8 @@ PACKAGECONFIG[webp] = "--with-webp,--without-webp,webp"
 
 SRC_URI = "http://ftp.gimp.org/pub/${BPN}/0.3/${BP}.tar.bz2 \
            file://pkgconfig.patch "
-SRC_URI[md5sum] = "c19478321594d715a4cb324a0decda6f"
-SRC_URI[sha256sum] = "846290a790854d1e6b7c17a2d6f82ad7cb14c72e240bd3b81b98cc0ceddbc3ec"
+SRC_URI[md5sum] = "6e5c6f229261478dc436a38c84405b2a"
+SRC_URI[sha256sum] = "d7858ef26ede136d14e3de188a9e9c0de7707061a9fb96d7d615fab4958491fb"
 
 LDFLAGS += "-lm"
 
-- 
2.13.2


