Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
	[209.85.208.173])
	by mail.openembedded.org (Postfix) with ESMTP id C36B47EC4C
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Sep 2019 23:41:46 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id f1so505037ljc.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Sep 2019 16:41:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=ytje8WO4ZTzRJUOSt1HKW/Qun3vCpdPJ69etZ7AaGAY=;
	b=D0/J+U6wZTmJ9TqSQ3UWOLWl20nLyK0lY5EtIlf7md+vGKfCgLsJ1MQEMbanPUf04r
	XYxMgUQhFSVsqDibBPJPHUIhHjiItGFejKGz2wv+97Y9J67t8IKOfzo8vsGQ4xUQkWc3
	6c6hDMoh+VUblUPGf26nR0HAuYI8YBc7/zRvm2Dh6ULX/SGu7P3BoQhKahu8xvCM7KrD
	fYSKVJIexQ+U1QXta1E0O3QTrnUovBKTIxokhdHaDdxIzrwZxFipPR63HPYB0XbM9FZ3
	IjCY3OtF4ZBbkG3rXH9mBxHuhN9RE6XJ11OcqQulJdKcFAt2q43GUdih5aEYsutQ9xhw
	sBRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ytje8WO4ZTzRJUOSt1HKW/Qun3vCpdPJ69etZ7AaGAY=;
	b=YRR3bdADHPXhCGNRjDsTEcH3gnR9P8x1j268kMGKhx/O5eN3u4uelDnJdX+Ws7VoRZ
	/r2bKbzFm/KjTt7OjUqvs6xDEvtTgoY060Yf/2jvHtxj5mXvxQ0Kj5jho6f1oYP6zYbn
	TyKS9JTMZGJsIvXfskXmyP9V2TfBd0MNDLaizvrbqsLixsAU3U3a1N/mjW78FD+PFFYp
	DEXvgDrYn8nS6TK1WVNRmUgmvNhy5H+sKKjuJyATGL+sqdzddngZ5BjcwQ9LB0thR+ub
	AWpbWB4BT5A7o/lrhwRNiv2oMrp/UJskvTESfPXT/t/2zasuHNuXbOVdE147snbLW25u
	DYug==
X-Gm-Message-State: APjAAAVyA9lE/XZuVdZPjzoTh7UySI3b6uRiuvoib+dnn6rf3Ev3vVXs
	yNd9DKGKTkAGj7gJVJJQ6MU0KW8eh70=
X-Google-Smtp-Source: APXvYqxBWumOfEe1SXub+f8QIzGb+82jMl68V+3FM/eHJl9pxjMY4DehwLBxyw9NQZrXfyxUdXC1yA==
X-Received: by 2002:a2e:1648:: with SMTP id 8mr26820866ljw.194.1568590906485; 
	Sun, 15 Sep 2019 16:41:46 -0700 (PDT)
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se.
	[213.89.0.115]) by smtp.gmail.com with ESMTPSA id
	y206sm8596596lfc.6.2019.09.15.16.41.45
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 15 Sep 2019 16:41:46 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 Sep 2019 01:41:44 +0200
Message-Id: <20190915234144.12484-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-oe] proj: update to 6.1.1
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
X-List-Received-Date: Sun, 15 Sep 2019 23:41:47 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../recipes-navigation/proj/{proj_4.9.3.bb => proj_6.1.1.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-navigation/proj/{proj_4.9.3.bb => proj_6.1.1.bb} (70%)

diff --git a/meta-oe/recipes-navigation/proj/proj_4.9.3.bb b/meta-oe/recipes-navigation/proj/proj_6.1.1.bb
similarity index 70%
rename from meta-oe/recipes-navigation/proj/proj_4.9.3.bb
rename to meta-oe/recipes-navigation/proj/proj_6.1.1.bb
index f45f8948d..a4281b6b2 100644
--- a/meta-oe/recipes-navigation/proj/proj_4.9.3.bb
+++ b/meta-oe/recipes-navigation/proj/proj_6.1.1.bb
@@ -6,8 +6,8 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=74d9aaec5fa0cd734341e8c4dc91b608"
 
 SRC_URI = "http://download.osgeo.org/proj/proj-${PV}.tar.gz"
-SRC_URI[md5sum] = "d598336ca834742735137c5674b214a1"
-SRC_URI[sha256sum] = "6984542fea333488de5c82eea58d699e4aff4b359200a9971537cd7e047185f7"
+SRC_URI[md5sum] = "9a82a3174cacf319d94360a759fbcc8a"
+SRC_URI[sha256sum] = "5cf0a2360a28b5d724c53edbb87f3f3b14fd96001265411ac4e56f369e2d503f"
 
 inherit autotools pkgconfig lib_package
 
-- 
2.17.1


