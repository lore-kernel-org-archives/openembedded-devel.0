Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	by mail.openembedded.org (Postfix) with ESMTP id 9A5DF6BA9D
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Mar 2019 20:24:21 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id l7so953543ljg.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Mar 2019 13:24:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=ycEm+Sl7LqMgQhzT+XFhvfGc7kfUstS+ECFGNvVUyog=;
	b=1kHMAeAPwaFIsR79UKkG2cuAMZbrk25kZhjBsv+/WJ1Dm6fjvrk1EX6fkjRk1NdCIk
	dZmTXn+LbdiPwmJ5K2QS1edyDD3LKQQny5sjx3Rw2NiuJVMXVDXBe54no8o3MCcrtsec
	ITEpuRkEHuBrCzlAB55+Y4q61dmI+uNpRSyj/UbFhIzTjpNy6GZwSZN/3kSntRH+Kr72
	3l/T9DldZhDmGeqFZwD3WDkhjdXZ2W1doCiMlG1tSkD60gG3AZrD59n1Nb9ryQhsEyBC
	OcORJZlbcqpeqof7YwYKBRRhJw795bN8lNoORFKuCVDjCMpCTwDrSXC4/+PgG1NsKfXT
	rf+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ycEm+Sl7LqMgQhzT+XFhvfGc7kfUstS+ECFGNvVUyog=;
	b=flT9rk9CUMlpoC8oYwEeOSrn/OFam7RpTsJ/BUasnAfnBt4rgQtOlW0thPdftRixbq
	+m9icDv3Gm9oxruUGOTKOfLcSmBQTsR8usQybq4Uask3DsTAIGUfSzYGzTIZzfAZBYBC
	21gGL80IqVxKlh5jdRyb5OKM4OVDtx/QEZxoQmFoK46meUZpqqrNgbOxHrSQ/j5mvxIO
	LGXhdwLMvsnaBMlhsh0HFx5y4Ij3mKMY2+jlZW6QuLK+yEyF7DB4B2gOeZkZW6BbQmA7
	E8fU9VLg8ewQGepQNUE2F1ig3SKS4k7m9Z7GtVFCAegOba7m4Ta7Kfurd2HoyB5KPIEI
	tOKw==
X-Gm-Message-State: APjAAAVY93gB2yvJcaw1u8nils/NAWIt+oLD+5zZPe+kLmdyE2mjxsm1
	GsPwk90OTvFqg1qJ9DkUnp5sJHpuOYY=
X-Google-Smtp-Source: APXvYqxghwr0ijSBcVa6rEgrlNDZRHktz0diU0p8GEd+B+2Fdpr3ZAnvBrwW30zM7DXjB4emWKhorg==
X-Received: by 2002:a2e:9850:: with SMTP id e16mr6248352ljj.121.1552767861683; 
	Sat, 16 Mar 2019 13:24:21 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	l141sm1096176lfe.92.2019.03.16.13.24.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 16 Mar 2019 13:24:21 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 16 Mar 2019 21:24:10 +0100
Message-Id: <20190316202410.31173-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-oe][PATCH] libev: update to 4.25
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
X-List-Received-Date: Sat, 16 Mar 2019 20:24:24 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../libev/{libev_4.24.bb => libev_4.25.bb}                   | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-connectivity/libev/{libev_4.24.bb => libev_4.25.bb} (79%)

diff --git a/meta-oe/recipes-connectivity/libev/libev_4.24.bb b/meta-oe/recipes-connectivity/libev/libev_4.25.bb
similarity index 79%
rename from meta-oe/recipes-connectivity/libev/libev_4.24.bb
rename to meta-oe/recipes-connectivity/libev/libev_4.25.bb
index a5838d368..9456e51f1 100644
--- a/meta-oe/recipes-connectivity/libev/libev_4.24.bb
+++ b/meta-oe/recipes-connectivity/libev/libev_4.25.bb
@@ -5,9 +5,8 @@ LICENSE = "BSD-2-Clause | GPL-2.0+"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d6ad416afd040c90698edcdf1cbee347"
 
 SRC_URI = "http://dist.schmorp.de/libev/Attic/${BP}.tar.gz"
-
-SRC_URI[md5sum] = "94459a5a22db041dec6f98424d6efe54"
-SRC_URI[sha256sum] = "973593d3479abdf657674a55afe5f78624b0e440614e2b8cb3a07f16d4d7f821"
+SRC_URI[md5sum] = "911daf566534f745726015736a04f04a"
+SRC_URI[sha256sum] = "78757e1c27778d2f3795251d9fe09715d51ce0422416da4abb34af3929c02589"
 
 inherit autotools
 
-- 
2.17.1


