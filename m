Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id DA6EA78087
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Dec 2017 20:55:10 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id m59so21684668qte.11
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Dec 2017 12:55:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=/SX0XAVMWWJ9cD1J+Mh43VS/QAS6tuGfh7XKywMhRiw=;
	b=HvC53b0t5whHUmwBYcCR7HmJ0WRJVvgVQIjHFy5Xd5sk7073vOD6BL7SEIPPQZZirN
	Mk34DSMcG1q6NOYLcY2j3T1W/IMyB0LBQxGXc7nys3UCDjPwksdl0PBqmcVCkImDJDV/
	BW7O7ZEO1gpQq/vPNIfYt3O6OimO6PytzHddFx2Uajp2sk8wptDwwfzqZBXdkysBWBJL
	GSMrybCW9G6wxR1onxKpJnatW7gqfggq5lOIv69LUn6yBLV24d/MhvMUYbV20UXRVu8h
	tVHdiTYztBB4oz3mLaRnR3kBI0tAvI8q8ArG8d4CC4+oyA2zwkX0KNjQGBV1HK+8CZ0d
	E7LA==
X-Gm-Message-State: AKGB3mLyZPC6tJRKB+rfb/nNJWrrYIbSGoV/JABWknz1FD3by6Z/zCMX
	xzkO5KoNa61hAUH5nEZo7h3YYYpt
X-Google-Smtp-Source: ACJfBosizWh6m7LnVq0mhE3sJ/IyU2FIyfv2001xGe0QKVAHrBKypa64vJe+qj+F09S4vg2vkSimgw==
X-Received: by 10.200.8.11 with SMTP id u11mr1622668qth.315.1513630511759;
	Mon, 18 Dec 2017 12:55:11 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	b47sm8816514qtb.89.2017.12.18.12.55.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 18 Dec 2017 12:55:11 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 18 Dec 2017 15:55:04 -0500
Message-Id: <1513630504-19177-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-flask-login: update to version 0.4.1
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
X-List-Received-Date: Mon, 18 Dec 2017 20:55:11 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-flask-login.inc            | 4 ++--
 .../{python-flask-login_0.4.0.bb => python-flask-login_0.4.1.bb}      | 0
 .../{python3-flask-login_0.4.0.bb => python3-flask-login_0.4.1.bb}    | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-flask-login_0.4.0.bb => python-flask-login_0.4.1.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-flask-login_0.4.0.bb => python3-flask-login_0.4.1.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-flask-login.inc b/meta-python/recipes-devtools/python/python-flask-login.inc
index 7dddba0..59eb64f 100644
--- a/meta-python/recipes-devtools/python/python-flask-login.inc
+++ b/meta-python/recipes-devtools/python/python-flask-login.inc
@@ -6,8 +6,8 @@ HOMEPAGE = " https://github.com/maxcountryman/flask-login"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=8aa87a1cd9fa41d969ad32cfdac2c596"
 
-SRC_URI[md5sum] = "e050efaa2c4dbc2d97f480a70f4d44aa"
-SRC_URI[sha256sum] = "d25e356b14a59f52da0ab30c31c2ad285fa23a840f0f6971df7ed247c77082a7"
+SRC_URI[md5sum] = "25b34c74bd509792f291c16e184225df"
+SRC_URI[sha256sum] = "c815c1ac7b3e35e2081685e389a665f2c74d7e077cb93cecabaea352da4752ec"
 
 PYPI_PACKAGE = "Flask-Login"
 
diff --git a/meta-python/recipes-devtools/python/python-flask-login_0.4.0.bb b/meta-python/recipes-devtools/python/python-flask-login_0.4.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-flask-login_0.4.0.bb
rename to meta-python/recipes-devtools/python/python-flask-login_0.4.1.bb
diff --git a/meta-python/recipes-devtools/python/python3-flask-login_0.4.0.bb b/meta-python/recipes-devtools/python/python3-flask-login_0.4.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-flask-login_0.4.0.bb
rename to meta-python/recipes-devtools/python/python3-flask-login_0.4.1.bb
-- 
2.7.4


