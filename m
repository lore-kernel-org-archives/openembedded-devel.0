Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
	[209.85.208.41])
	by mail.openembedded.org (Postfix) with ESMTP id BB5F27D40B
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  7 Apr 2019 14:45:14 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id f19so2358206edw.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 07 Apr 2019 07:45:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=T8OABYYtVnX1A6b9qF7tdfAYSk16pG91QxAO7NUUw7Y=;
	b=qkMHkS6cZtpwYZIwdcp4pJ2/Vo22rNjmcvLCxlBqQBS/Y7dUhTjd+LSJ2Eoj/+dtqv
	iSmFosx7e2O26xzap6AvXI625v9Jfa6CUwcDFW4wqT+jgBqizhNOlaDsmEjGReMZWyMo
	JLbSzhE+bx+LRkn1urKmnfYfMyDly+acgZL4Ns0hSp7JNSfCsMkBpoRthLrtYddehso1
	KaZunFiFbyBZlaeDPbtw9UH/Ae1X6jr60J8yDouwPinhlCx1ITd+Ls3X2ZcUYeUR7wPd
	Mqv0DeRUisXL1jWSUAeDcESz6IR+ONmOwiVTmPlCQt5msJb3ru1+H9C+OxfJU5QcsG7T
	UMsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=T8OABYYtVnX1A6b9qF7tdfAYSk16pG91QxAO7NUUw7Y=;
	b=ICccXjqjDE4s9/jgVGkPaMpDWi640QJSIrW9DZkp/H5DzQVzU2KK1Tip9GmkO3jDeS
	REOYNBotFUyfecTb1gysfkWg/Rau/+SY2z/Bl2SW46dbzs0yWXxGdcYohrdYYLTMDUUu
	XDreHSPocIj4dgQ69VhDS67lwVPf7ussj3i+xg6Og0ygL2qsLixNFXYfyf04o2tUm6sf
	D0qNO01UbG9dRUc3mJDnn/3vqAz2Pq1p81MenP1hl3P/iv31ozh71hnMzwBnIRxOZiMc
	uFeSjDPUSweA2pY2lmpBq3L+kjA8KIn2RCZ72TJaHe29Xf46Sec0t9A9c4FzamK3lHFk
	KEOA==
X-Gm-Message-State: APjAAAUvTfH/siHxHGV6j/IGhyhergnkgEFZwzBTM0I7UCmQ0rpt7lCc
	ixP6s+9NDLvA9uaQcKcau+ct+TlL348=
X-Google-Smtp-Source: APXvYqwVyOSZllhnaefXazImWHf8pD/T8HPs5a3DSoWVu+PzRpJGY2Zvo7+97FFmA+BCaVU5H/FLqQ==
X-Received: by 2002:a17:906:eb96:: with SMTP id
	mh22mr13784195ejb.186.1554648315097; 
	Sun, 07 Apr 2019 07:45:15 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108])
	by smtp.gmail.com with ESMTPSA id q3sm7871915edr.31.2019.04.07.07.45.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 07 Apr 2019 07:45:14 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  7 Apr 2019 16:45:12 +0200
Message-Id: <20190407144512.29494-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-networking] usbredir: update to 0.8.0
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
X-List-Received-Date: Sun, 07 Apr 2019 14:45:15 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../spice/{usbredir_git.bb => usbredir_0.8.0.bb}               | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-networking/recipes-support/spice/{usbredir_git.bb => usbredir_0.8.0.bb} (83%)

diff --git a/meta-networking/recipes-support/spice/usbredir_git.bb b/meta-networking/recipes-support/spice/usbredir_0.8.0.bb
similarity index 83%
rename from meta-networking/recipes-support/spice/usbredir_git.bb
rename to meta-networking/recipes-support/spice/usbredir_0.8.0.bb
index 3fea7528e..9ee43be1e 100644
--- a/meta-networking/recipes-support/spice/usbredir_git.bb
+++ b/meta-networking/recipes-support/spice/usbredir_0.8.0.bb
@@ -7,8 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 
 DEPENDS = "libusb1"
 
-SRCREV = "39aa3c69f61bba28856a3eef3fe4ab37a3968e88"
-PV = "0.7.1+git${SRCPV}"
+SRCREV = "07b98b8e71f620dfdd57e92ddef6b677b259a092"
 
 SRC_URI = " \
     git://anongit.freedesktop.org/spice/usbredir \
-- 
2.17.1


