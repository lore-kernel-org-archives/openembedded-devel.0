Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id CF9AB71B2A
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Dec 2017 20:53:03 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id g10so21677380qtj.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Dec 2017 12:53:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=NNkpkLwVd0ve69EyU4OKvN6QPsn1DSx9pQhFlDaFlLk=;
	b=pWjycJjW/ob0YD38kZkZOFl3WvmxhTp+X+wKLHj1n6huyUnWFqN1YS9fBLscwZZTgN
	movVY52jXCU0bGCNSNQ8hoDGRBg1/QbgDsS5bOqN2rn727/qEHiG0egmAHGkH5VEre+v
	HkzbuvZsY8VT1koah8+sAxW3FjAkpTZfZTGcG7eto+dYmSz0OGiCQqKIDi2xFGP1OH08
	Guzm8tNNeABMZBDl/Wko/kTqRTNjjXkRvrZHD6SC4HQRmA2fS4hllcL0v3Pgex6BhMOT
	biUd36YW24ab4iDTiPTL3Imth8XPHylFkHvbIxO3drYaYjZLIHQTy0l236bbzyGq/C8V
	xncg==
X-Gm-Message-State: AKGB3mKW08aiiEQwa6r8T/pOIHXOnv0ZupHo+ahgTC01E+r9Gcz0J+Lg
	l7z4n4jiXypN7ccniD9tHfvcChTZ
X-Google-Smtp-Source: ACJfBoui0aZmRr+ul3Y6aAEYDYmJjVc+K4BGCaIqugnZXefPuG4Pe4WoW+3ew1RgaKFWtQpxBuAMpg==
X-Received: by 10.200.55.155 with SMTP id d27mr1591210qtc.115.1513630384458;
	Mon, 18 Dec 2017 12:53:04 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	g194sm3951215qkg.6.2017.12.18.12.53.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 18 Dec 2017 12:53:03 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 18 Dec 2017 15:52:54 -0500
Message-Id: <1513630374-15820-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-webserver][PATCHv2] phpmyadmin: update to version 4.7.6
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
X-List-Received-Date: Mon, 18 Dec 2017 20:53:04 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../phpmyadmin/{phpmyadmin_4.7.5.bb => phpmyadmin_4.7.6.bb}           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-webserver/recipes-php/phpmyadmin/{phpmyadmin_4.7.5.bb => phpmyadmin_4.7.6.bb} (90%)

diff --git a/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.7.5.bb b/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.7.6.bb
similarity index 90%
rename from meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.7.5.bb
rename to meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.7.6.bb
index fa447b9..672db58 100644
--- a/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.7.5.bb
+++ b/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.7.6.bb
@@ -11,8 +11,8 @@ SRC_URI = "https://files.phpmyadmin.net/phpMyAdmin/${PV}/phpMyAdmin-${PV}-all-la
            file://apache.conf \
 "
 
-SRC_URI[md5sum] = "23f65155f37bef0addb7324d45671a4e"
-SRC_URI[sha256sum] = "e4f53b8a5a8e32cea389718c6f6f282e9ac22ed5f31f67d88266aa27ae0a1ca3"
+SRC_URI[md5sum] = "a9aec05d44c68b4ac5e4987118d70cd7"
+SRC_URI[sha256sum] = "5fab6b92336386646bbb189d55817799487b5c27b06cab0cdfdcab3c88f5988f"
 
 S = "${WORKDIR}/phpMyAdmin-${PV}-all-languages"
 
-- 
2.7.4


