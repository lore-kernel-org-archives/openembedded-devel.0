Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id C636E71A88
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  9 Mar 2018 09:52:18 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id t6so2765848wmt.5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 09 Mar 2018 01:52:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=dominion-thruhere-net.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=8v2OzRWtcmWIYZ/dKfmkOXxVVo0yNUccAwaNC+0muBU=;
	b=ux7+GiyE6qZz3sMqb2LtLi7jyg94sr6BKd+h7UgjoiLgor3Dd72sNha83ufkGgt/no
	ux5v0uT/MXB+4ulvVuXzfk4oDFAveULWWVq4rLx6OBxKDs3l8Z45NsUYDMfrpTLpLt4o
	82abcgMkmoo8g6Xqn3I/Dd3YZw0ngj43InPaJgJfc282lOv5DivPBtZJFrtVhtZHV+/u
	chBe2UOleslE+QbuoObm9i6Uim1UlKGsD9N35QDI52K1hZ7phZQ4UX66q533F4ZbSObI
	YXfR3SmdI9xXKcmg1Q1G2KYFplG2YuwP42NCxfrNp1oK37YGxRCTRYxldV5hr6Y8/evc
	FAVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=8v2OzRWtcmWIYZ/dKfmkOXxVVo0yNUccAwaNC+0muBU=;
	b=IK8a5Rz/GLWtmQt9eQybqr6ZnT8ThSKr2M2a1nDIbWRpYpD2sSvhGA0h3qvzDby6UB
	Cp0Y/GVXHxxLHC33/ygUFaahP1OSvVuTW5R5a5j7IcTQqJ3h4+kBZVWxkFaOUyWV6q7Y
	OXnipGNdnkUf/555jgVQV+dPcoAB5PTarnZGlOHJ2QcRVMEEn6seX5o55VwPJPKwd+uv
	TwE/OgOL4kQ22fKCkrLSviGTyIdu9A3VAwbNQHNXrGYkvCCOpgvMG+0tXBulc+fsT7AX
	G4TyaCe00q+QLNdgWMoT1v0cQdkXUKK/Pr+25q8KYQQVEWKgJZk4g8R9beZgAUsCkm0M
	tfUw==
X-Gm-Message-State: APf1xPApkpsewFqvpID/qGp9+p5t7AWnUrDOJls7XMAjyNR0+1rH/joS
	bCxLMjjQXxsJMZ74Ptnofr8cbv7y
X-Google-Smtp-Source: AG47ELt9rQ2CipUkl+Xg1Kzb6mnFiXvRFGBMqib/3OOL6pw2h9NZltr6i7QGcoDkkNAQnTiYgIykUA==
X-Received: by 10.80.232.1 with SMTP id e1mr36771016edn.257.1520589139053;
	Fri, 09 Mar 2018 01:52:19 -0800 (PST)
Received: from localhost.localdomain ([185.47.135.167])
	by smtp.gmail.com with ESMTPSA id e24sm680924edb.0.2018.03.09.01.52.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 09 Mar 2018 01:52:18 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
X-Google-Original-From: Koen Kooi <koen.kooi@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  9 Mar 2018 10:51:47 +0100
Message-Id: <20180309095147.23136-1-koen.kooi@linaro.org>
X-Mailer: git-send-email 2.9.5
Cc: Koen Kooi <koen.kooi@linaro.org>
Subject: [PATCH] ncurses: fix do_install failure when base_libdir has more than one level
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
X-List-Received-Date: Fri, 09 Mar 2018 09:52:19 -0000

Other sections of the .inc already use mkdir -p, so use it here as well.

Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
---
 meta/recipes-core/ncurses/ncurses.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/ncurses/ncurses.inc b/meta/recipes-core/ncurses/ncurses.inc
index 1f21cd4..106dcb0 100644
--- a/meta/recipes-core/ncurses/ncurses.inc
+++ b/meta/recipes-core/ncurses/ncurses.inc
@@ -227,7 +227,7 @@ do_install() {
         if [ ! -d "${D}${base_libdir}" ]; then
             # Setting base_libdir to libdir as is done in the -native
             # case will skip this code
-            mkdir ${D}${base_libdir}
+            mkdir -p ${D}${base_libdir}
             mv ${D}${libdir}/libncurses.so.* ${D}${base_libdir}
             ! ${ENABLE_WIDEC} || \
                 mv ${D}${libdir}/libncursesw.so.* ${D}${base_libdir}
-- 
2.9.5


