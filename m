Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
	[209.85.208.195])
	by mail.openembedded.org (Postfix) with ESMTP id AB5997EC47
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Sep 2019 23:42:35 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id s19so1350969lji.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Sep 2019 16:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=vFUSlnDQ2qmPgYte9xBCsw7v2F+3C8qapdxI1PCmFWs=;
	b=bwVh1JdoGBerpa2e8KkBobNbdm3V0GgLNFlTvTH6/2Tm33x9rNpBMy92mrzERsS92M
	wokKy4eTS8ocYujZXTrwYDhLzIY26WA5TYbuSdcZRUi8xKlRkuZQSMOc1O1wZgLDwwcL
	t3r4z11DnYZGVo3h5MqQF9Y7ogCsGv7hto/EkC8gAJu5gjAE31Q/ZxOCAWE7oBl2ujeP
	W1d8xqhkS3OaMon0sEyMjgqKaL8HrYH3z02fqjG3TwcxSuj0PmDyGIbq01YEAsTUYtJv
	9Qj0DflHC1MB+TgOeW8tMDERfWeri9xcyVd/hV3SyQJbgRqbve4+C2w47j9/xon6ikE6
	ddqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=vFUSlnDQ2qmPgYte9xBCsw7v2F+3C8qapdxI1PCmFWs=;
	b=OSFXaUAuAVhtYHcvxJ1ZYN+kXyixueDV7MbrFHKo3EQ2UvGj6k4PJZ9RqwbwPaDuaw
	Gqu7rR8jmCWOxLvIN6PYBWj33BW8UxB+GdYRg1cUpxNm6gqFDDj0aVy5bLjMAyJ+GQku
	D/KtWqo6OS1Hiae1+518tiN3teioE7ZEWqdMKxBge4P0NXygXSNZua8TtcIksh5PMDHm
	jSlI5mX9xvuCFMzTYqWeYn/S63u4aw4z+O8bZ+se+8CDkg2NmD2zzPgErXylSv68hFMk
	mnZqIxN1HWhFEUOtvqpXQ31uOY7KFo1cTdzssEkMzwlawVeLJN6biC2ON038tvEUGwB9
	AArA==
X-Gm-Message-State: APjAAAVLGpp7xO2/40SqCXLmVESnL5WC90BBnZjGbnV8Yfsv5A48Rnw7
	et3EE8f3ivaBwU0T0uSQwRFfL9h+COI=
X-Google-Smtp-Source: APXvYqzaf702ShyCyC8/v2u2VW+A5zc0MJVMdeFfidg7KN6Kdv2cRQi9+miCSzRFdxlNZAVCkQ2ocA==
X-Received: by 2002:a2e:b4c4:: with SMTP id r4mr9217192ljm.69.1568590955925;
	Sun, 15 Sep 2019 16:42:35 -0700 (PDT)
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se.
	[213.89.0.115])
	by smtp.gmail.com with ESMTPSA id h1sm9097086lja.18.2019.09.15.16.42.35
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 15 Sep 2019 16:42:35 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 Sep 2019 01:42:33 +0200
Message-Id: <20190915234233.13529-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-oe] iwd: update to 0.20
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
X-List-Received-Date: Sun, 15 Sep 2019 23:42:36 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 meta-oe/recipes-connectivity/iwd/{iwd_0.19.bb => iwd_0.20.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/iwd/{iwd_0.19.bb => iwd_0.20.bb} (95%)

diff --git a/meta-oe/recipes-connectivity/iwd/iwd_0.19.bb b/meta-oe/recipes-connectivity/iwd/iwd_0.20.bb
similarity index 95%
rename from meta-oe/recipes-connectivity/iwd/iwd_0.19.bb
rename to meta-oe/recipes-connectivity/iwd/iwd_0.20.bb
index 2b4530e3c..42205034c 100644
--- a/meta-oe/recipes-connectivity/iwd/iwd_0.19.bb
+++ b/meta-oe/recipes-connectivity/iwd/iwd_0.20.bb
@@ -7,7 +7,7 @@ inherit autotools pkgconfig systemd
 DEPENDS = "ell readline dbus"
 
 SRC_URI = "git://git.kernel.org/pub/scm/network/wireless/iwd.git"
-SRCREV = "899d802744b7e12409e259f546ba5594ab90262c"
+SRCREV = "00f0039232cc73bbcf7a1875f8f9aae464d90a8f"
 S = "${WORKDIR}/git"
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
-- 
2.17.1


