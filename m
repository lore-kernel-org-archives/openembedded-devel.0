Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
	[209.85.167.67])
	by mail.openembedded.org (Postfix) with ESMTP id 38FAB7E08E
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Sep 2019 21:45:15 +0000 (UTC)
Received: by mail-lf1-f67.google.com with SMTP id d10so20549991lfi.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Sep 2019 14:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=9qbR4MmpjjgZwyry6yESYSnJ2nZ8WZcFWaRMcKpbdu4=;
	b=dOki0QJ5h2HmQJZiPb12vEsjQVGtX4eVpy8Ojxguos1cRNsgtz0zU9hy+oLmep4XbX
	+FyaipUEj+8QYjMTq3I2ag2cOc9ZImW5YvddCPYPbv+EOOD+ATJbdXmZEqlmqQmInh2e
	W9BicYsqcaGNpJ9cYWrSVy6JT/sLxE/K3uumuM+5E0SurcIQMhY+olvEQ+7faf0iCrQ4
	NgGwmlYI5c+YSHfWaCY2d/OCvMH3xR8PQq0wxZaJGTOtf5hFGdHmLH5//pmYB2CsvFLC
	ledAEuvZf25q7kFR4Z950N+yyHv6w2ILOSjE+7LdQCkbkCr6MG3IY9M8tYY8idbUMpxH
	DQpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=9qbR4MmpjjgZwyry6yESYSnJ2nZ8WZcFWaRMcKpbdu4=;
	b=f0+r8k1VHS662trF6IjVBwFIVMmPHT52N86EbPSjDau7OzQI+rnH15bN1QAwUR+j0k
	oZGugxwnw/fDRoz+0AG9R6XRhy9ejCBhBQAzbdXV+NjydnfKKd+Odr+oFyW6K07frzSP
	YxOe4hP67fm2XsnYNlk3ACnfQVGV61SNUaRrp8Qkbpp55N+eTTOArAIaN9/YmGPluwrj
	4sR3GKgggCjwOY+eQAp4mfdgEyLimt0HlY4KRnbLkTsU4ppPDCJjyxinikcHgwy+C1V2
	M5mDxU5tqy08ypb/fo+3n9r6SLMXBzYLTckemTcDIdCWeY46zv316cu6wH+lzsFhL4r2
	O3ig==
X-Gm-Message-State: APjAAAVXitMGb+dGwRNAhbrQAIyAb1iKoxzTofDUZy1T6dnM0ekfT2Y+
	Px6LAmGZnTp3eEJxsWJRoBXNVVvmygc=
X-Google-Smtp-Source: APXvYqwm3+9Zl4pDiBUPXwC/VjWa2GEqI4i+7Bwo205UoOF0VHFyeBCjhiFDmXpxoiSo4Db9XldCGA==
X-Received: by 2002:ac2:514c:: with SMTP id q12mr29477777lfd.145.1568324715642;
	Thu, 12 Sep 2019 14:45:15 -0700 (PDT)
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se.
	[213.89.0.115]) by smtp.gmail.com with ESMTPSA id
	o18sm1828131lfb.25.2019.09.12.14.45.14
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 12 Sep 2019 14:45:15 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 12 Sep 2019 23:45:13 +0200
Message-Id: <20190912214513.2969-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-oe] libev: update to 4.27
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
X-List-Received-Date: Thu, 12 Sep 2019 21:45:15 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../libev/{libev_4.25.bb => libev_4.27.bb}                    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-connectivity/libev/{libev_4.25.bb => libev_4.27.bb} (79%)

diff --git a/meta-oe/recipes-connectivity/libev/libev_4.25.bb b/meta-oe/recipes-connectivity/libev/libev_4.27.bb
similarity index 79%
rename from meta-oe/recipes-connectivity/libev/libev_4.25.bb
rename to meta-oe/recipes-connectivity/libev/libev_4.27.bb
index 9456e51f1..b72b7af4f 100644
--- a/meta-oe/recipes-connectivity/libev/libev_4.25.bb
+++ b/meta-oe/recipes-connectivity/libev/libev_4.27.bb
@@ -5,8 +5,8 @@ LICENSE = "BSD-2-Clause | GPL-2.0+"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d6ad416afd040c90698edcdf1cbee347"
 
 SRC_URI = "http://dist.schmorp.de/libev/Attic/${BP}.tar.gz"
-SRC_URI[md5sum] = "911daf566534f745726015736a04f04a"
-SRC_URI[sha256sum] = "78757e1c27778d2f3795251d9fe09715d51ce0422416da4abb34af3929c02589"
+SRC_URI[md5sum] = "d38925fbc030153fe674c4e0e864a69a"
+SRC_URI[sha256sum] = "2d5526fc8da4f072dd5c73e18fbb1666f5ef8ed78b73bba12e195cfdd810344e"
 
 inherit autotools
 
-- 
2.17.1


