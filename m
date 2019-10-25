Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
	[209.85.221.49])
	by mail.openembedded.org (Postfix) with ESMTP id 7EDEC7F7C6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Oct 2019 07:21:27 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id a11so1043088wra.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Oct 2019 00:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=9Kn2O2xJ5HYYY6bEwtOOxM6LWQoKh8TjA+R+0kHWhms=;
	b=ET5gk7ZzEAB8yISNpp+qTacMoPfJgx24TBQYLYDj6lVXug/+aD+iaWoK076qxHKiRX
	rFpAPLio6wr8WoAnOfrcyntP+NV6ENdMQn/UUB9LQEGzexOu+IGyUOepW2TdAXBvV1ZU
	jgC1M5K/CCNMfYrmF+JKJy+D5DRlS4zcigL5WrYCJR4aqeQ3tEAoqh/jWejxcIX5vqIv
	+kB4IvsG2CjyvdbwkrKHvwXm4qNv81wu5kK+fyu9Bk0xdS3CP4VxD716/0j+YDkgi0zT
	hKvDjY60iVZng7xK15ZPUTRCLJ6ZB+EjCQ3WQj0etLGLE11LVjZob3zlf1gyEuOuQsxg
	dvqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=9Kn2O2xJ5HYYY6bEwtOOxM6LWQoKh8TjA+R+0kHWhms=;
	b=SIX2SviHr/kHA3SbWqOOCKEMq5r/DChJ3/kx8jxCP4+ufXgSibYzDyCJUJ+J8E8p+h
	SA1eXCcBNYVdLu4rbJJsUK7sV0E6QMGF+l4XaatjLmlVo783Yele+Wi+MARmV1y3aNcz
	1ITPR8fobElWlZ9oplzNAF8A3igKXfUbcYWllAAhK3njoLkj0Wt8QM3XOKwwgOZoA1eC
	pBute8kfFNmSScpVlinN7I9QWRbqSYw9XdGGetXAv9/lOOAJSk+O3Gx1cJNag92zZTOm
	UsfiSVu0Ao1maZMYK4JHR4sLTmLPCs7wLX1nbTdx1AmSps5QJKojbdAc66DlZioJwpE9
	2AwQ==
X-Gm-Message-State: APjAAAX0AQrbFYnJYZoKsxS73MBBF2bzOJs3c9jJUHo8WLI4XM/PwcXV
	KuB/hg4fDgR2iRF+GPVksffuDI64
X-Google-Smtp-Source: APXvYqy20BzzQfV4Ebwngw84oqBjlbAJvq1N6NTyOFa9ToxeZkWzKvYjPTZnBY6mePO4O+LVtW1o/Q==
X-Received: by 2002:adf:e28f:: with SMTP id v15mr1407216wri.130.1571988087862; 
	Fri, 25 Oct 2019 00:21:27 -0700 (PDT)
Received: from superandy.speedport.ip
	(p200300F07F12337293F05085D4C59AB5.dip0.t-ipconnect.de.
	[2003:f0:7f12:3372:93f0:5085:d4c5:9ab5])
	by smtp.gmail.com with ESMTPSA id y5sm1207095wmi.10.2019.10.25.00.21.27
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 25 Oct 2019 00:21:27 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 25 Oct 2019 09:21:01 +0200
Message-Id: <20191025072113.11172-4-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191025072113.11172-1-schnitzeltony@gmail.com>
References: <20191025072113.11172-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 03/15] geany-plugins: upgrade 1.34 -> 1.36
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
X-List-Received-Date: Fri, 25 Oct 2019 07:21:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../geany/{geany-plugins_1.34.bb => geany-plugins_1.36.bb}  | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-devtools/geany/{geany-plugins_1.34.bb => geany-plugins_1.36.bb} (98%)

diff --git a/meta-oe/recipes-devtools/geany/geany-plugins_1.34.bb b/meta-oe/recipes-devtools/geany/geany-plugins_1.36.bb
similarity index 98%
rename from meta-oe/recipes-devtools/geany/geany-plugins_1.34.bb
rename to meta-oe/recipes-devtools/geany/geany-plugins_1.36.bb
index 84adc7abe..f76899845 100644
--- a/meta-oe/recipes-devtools/geany/geany-plugins_1.34.bb
+++ b/meta-oe/recipes-devtools/geany/geany-plugins_1.36.bb
@@ -29,11 +29,11 @@ inherit distro_features_check autotools pkgconfig gtk-icon-cache
 REQUIRED_DISTRO_FEATURES = "x11"
 
 SRC_URI = " \
-    http://plugins.geany.org/${BPN}/${BP}.tar.bz2 \
+    https://plugins.geany.org/${BPN}/${BP}.tar.bz2 \
     file://0001-Use-pkg-config-to-find-gpgme.patch \
 "
-SRC_URI[md5sum] = "bf5fdd50727ad8bbbfe00027ccf2dac5"
-SRC_URI[sha256sum] = "244417c681636e82a63cf6f9901b5b7f3889168f7d9b5ba9b45601767a589c3b"
+SRC_URI[md5sum] = "91fb4634953702f914d9105da7048a33"
+SRC_URI[sha256sum] = "ebe18dd699292174622e8cb8745b020ada8a5be3b604ab980af36e8518df7ce6"
 
 do_configure_prepend() {
     rm -f ${S}/build/cache/glib-gettext.m4
-- 
2.21.0


