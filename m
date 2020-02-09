Return-Path: <straka.derek@gmail.com>
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
	[209.85.210.68])
	by mail.openembedded.org (Postfix) with ESMTP id D3D1D6084A
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  9 Feb 2020 16:05:52 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id a15so3989872otf.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 09 Feb 2020 08:05:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=6ZaNFWPzcmvI8CUrDlRzd6NikvaWAZQIzEqweOIx2UM=;
	b=L3wdJLMgOwEQg+DzovgdiWjG/5vqbqVilDL+GylbTKGiZBadHmKkuEq8cvYK4mUMW+
	laEf/SbXDz6+X39BePEB9az+PomHvx//R+kFn5hPGy/PWM9X/XELi6xO+H+5UWBVnEA/
	KQ2Nkba+TgdWPFLE2Ay9MCo1yLoNNkq9Pvuo+x0lkMxo5UNMCawPxWN+LeMOSCK1VGKo
	IH0bLq7epozzo6kwvfHOCeRQJtlvYSk06vK4EOby/GJvoYXeLEHNZvvtWFO3OIqLwV2X
	Ynpa7PdFu/KEfvWHuUhSIOLm7/0iXkJ5PEeFpR+9CZ1B2NvcI0W86KG6YFA6uPFBbsZl
	X5bQ==
X-Gm-Message-State: APjAAAUAoroc6m/InItFYWhFK59o6LkCE5B9FDUF1fpn32IJnrkyFHi1
	zqBKJSxwBK1vCFfZBBGybf4Agj7cvGg=
X-Google-Smtp-Source: APXvYqwoPXs14035BlTDziU4sciW7J+rRiLdH9WJjcO3A+DY7J81WB0LooiZMG01+9Z4igDzvs1eug==
X-Received: by 2002:a9d:7f16:: with SMTP id j22mr7257851otq.256.1581264353617; 
	Sun, 09 Feb 2020 08:05:53 -0800 (PST)
Received: from sparta.lan1 (cpe-24-28-77-115.austin.res.rr.com. [24.28.77.115])
	by smtp.gmail.com with ESMTPSA id
	z21sm3510233oto.52.2020.02.09.08.05.52
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 09 Feb 2020 08:05:53 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  9 Feb 2020 11:05:36 -0500
Message-Id: <20200209160536.12357-1-derek@asterius.io>
X-Mailer: git-send-email 2.17.1
Subject: [meta-webserver][PATCH] nginx: update to the latest development version (1.17.8)
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
X-List-Received-Date: Sun, 09 Feb 2020 16:05:53 -0000

See Changelog: https://nginx.org/en/CHANGES

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-webserver/recipes-httpd/nginx/nginx_1.17.0.bb |  6 ------
 meta-webserver/recipes-httpd/nginx/nginx_1.17.8.bb | 10 ++++++++++
 2 files changed, 10 insertions(+), 6 deletions(-)
 delete mode 100644 meta-webserver/recipes-httpd/nginx/nginx_1.17.0.bb
 create mode 100644 meta-webserver/recipes-httpd/nginx/nginx_1.17.8.bb

diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.17.0.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.17.0.bb
deleted file mode 100644
index 8774a87fff..0000000000
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.17.0.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require nginx.inc
-
-LIC_FILES_CHKSUM = "file://LICENSE;md5=52e384aaac868b755b93ad5535e2d075"
-
-SRC_URI[md5sum] = "56767fd62302508295b31adc48b99a59"
-SRC_URI[sha256sum] = "e21b5d06cd53e86afb94f0b3678e0abb0c0f011433471fa3d895cefa65ae0fab"
diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.17.8.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.17.8.bb
new file mode 100644
index 0000000000..3d2a5edd26
--- /dev/null
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.17.8.bb
@@ -0,0 +1,10 @@
+require nginx.inc
+
+# 1.16.x branch is the current stable branch, the recommended default
+# 1.17.x is the current mainline branches containing all new features
+DEFAULT_PREFERENCE = "-1"
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=52e384aaac868b755b93ad5535e2d075"
+
+SRC_URI[md5sum] = "29cd861a13aae69a058cbabaae86177b"
+SRC_URI[sha256sum] = "97d23ecf6d5150b30e284b40e8a6f7e3bb5be6b601e373a4d013768d5a25965b"
-- 
2.17.1


