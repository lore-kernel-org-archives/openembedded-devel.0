Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
	[209.85.221.41])
	by mail.openembedded.org (Postfix) with ESMTP id 3BB7D7E2AD
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 May 2019 11:54:58 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id f8so5973099wrt.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 May 2019 04:54:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=+BNCMunE7sNYmtOzZoIDGyPZNVz0kqreC+hqXzUVANM=;
	b=eennet8/cmGlqRpGgEVBUpomGlf4sfl7y6HUsVCKvniF8agJctIjb6bZ+pZaMQ9YGA
	YCnKRBW/+f04J0TElOpApucjqJU1mUVWd+QCx9QPDBEX/POMnhOQybVqVHLBMXhlyUcS
	fnHT9jxgKTLQCtwll5AjniH9mCEBlwVjV6Xv6wDOCYseROdAL/TzS+qCTHgmLuc6sndP
	Rm1SwIH5AIBDL19WE/5B2r7ozA8uoDbnYfP537pAreoSF2XKK1kLmWT4feUAMNj7DTtm
	b+JnszNd/9AXA8TECzLoM2uVEXLvkk4Fgh4IQ/M8NidMahmiP8eItaMxiSplCw5keTkl
	i6Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=+BNCMunE7sNYmtOzZoIDGyPZNVz0kqreC+hqXzUVANM=;
	b=E8JnSVfLZgStttelKs62nCidKk10xiNdsD7G+NUea+KDpD2x4eilzPB5caJOy0lLuW
	bPknc8hbFCoW0qrgJryijB+c44HEpQgrDhbi8/O3E/36qbV33CIert2vXlpSVGruDbfC
	AZiO3GXHz4HqwJhVY2J08kc8YkvGA028DvnaBTCFUygx4BbYPnwVTJETmGMPo6vKFDSj
	6a1+mdzO6gExQlVqZtAOz6W/zwzWvp7zFoq4q2KpJn2GKF+iZmPpNilfYT4t3jTYVaru
	CjEzTfCzw/gFiZ9ns/ERwkSzib0chSmHUfa6HF4YaP7jHrK2FhxyHi/VYUEyYaMBUJjB
	6v2A==
X-Gm-Message-State: APjAAAV/qaDqOyCfRZrb2F2Bq8NNuleY8upNus0F/7JyduwjKP6y9pyJ
	6gpVwYjAEMkQmxYly3fbA0z4GdkH
X-Google-Smtp-Source: APXvYqx0I9Sv3uKpf75toKAwG/McaPq7VRvm2t4g1ZI2qS8Fx3hikOoDw+C6wRe1MvrvudQabkBE2Q==
X-Received: by 2002:adf:83c5:: with SMTP id 63mr28811469wre.33.1558612498816; 
	Thu, 23 May 2019 04:54:58 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id
	f6sm28811784wro.12.2019.05.23.04.54.58
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 23 May 2019 04:54:58 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 May 2019 11:54:59 +0000
Message-Id: <20190523115505.18245-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190523115505.18245-1-Martin.Jansa@gmail.com>
References: <20190523115505.18245-1-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 2/8] pidgin: upgrade to 2.13.0
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
X-List-Received-Date: Thu, 23 May 2019 11:54:58 -0000

* update purple-OE-branding-25.patch to apply cleanly

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../pidgin/pidgin/purple-OE-branding-25.patch               | 6 +++---
 .../pidgin/{pidgin_2.12.0.bb => pidgin_2.13.0.bb}           | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)
 rename meta-oe/recipes-support/pidgin/{pidgin_2.12.0.bb => pidgin_2.13.0.bb} (97%)

diff --git a/meta-oe/recipes-support/pidgin/pidgin/purple-OE-branding-25.patch b/meta-oe/recipes-support/pidgin/pidgin/purple-OE-branding-25.patch
index 9a24fbbc5f..0a1baa9183 100644
--- a/meta-oe/recipes-support/pidgin/pidgin/purple-OE-branding-25.patch
+++ b/meta-oe/recipes-support/pidgin/pidgin/purple-OE-branding-25.patch
@@ -7,7 +7,7 @@ Date: Mon, 24 Jul 2017 21:30:16 +0200
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/libpurple/protocols/irc/irc.h b/libpurple/protocols/irc/irc.h
-index fde35c4..66e52dd 100644
+index 596ddaf..b70f3a9 100644
 --- a/libpurple/protocols/irc/irc.h
 +++ b/libpurple/protocols/irc/irc.h
 @@ -40,9 +40,9 @@
@@ -20,5 +20,5 @@ index fde35c4..66e52dd 100644
 -#define IRC_DEFAULT_QUIT "Leaving."
 +#define IRC_DEFAULT_QUIT "Powered by OE: www.openembedded.org"
  
- #define IRC_INITIAL_BUFSIZE 1024
- 
+ #define IRC_BUFSIZE_INCREMENT 1024
+ #define IRC_MAX_BUFSIZE 16384
diff --git a/meta-oe/recipes-support/pidgin/pidgin_2.12.0.bb b/meta-oe/recipes-support/pidgin/pidgin_2.13.0.bb
similarity index 97%
rename from meta-oe/recipes-support/pidgin/pidgin_2.12.0.bb
rename to meta-oe/recipes-support/pidgin/pidgin_2.13.0.bb
index 148e4b6b51..b094ba25e4 100644
--- a/meta-oe/recipes-support/pidgin/pidgin_2.12.0.bb
+++ b/meta-oe/recipes-support/pidgin/pidgin_2.13.0.bb
@@ -13,8 +13,8 @@ SRC_URI = "\
     file://pidgin-cross-python-265.patch \
 "
 
-SRC_URI[md5sum] = "8287400c4e5663e0e7844e868d5152af"
-SRC_URI[sha256sum] = "8c3d3536d6d3c971bd433ff9946678af70a0f6aa4e6969cc2a83bb357015b7f8"
+SRC_URI[md5sum] = "423403494fe1951e47cc75231f743bb0"
+SRC_URI[sha256sum] = "2747150c6f711146bddd333c496870bfd55058bab22ffb7e4eb784018ec46d8f"
 
 PACKAGECONFIG ??= "gnutls consoleui avahi dbus idn nss \
     ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11 gtk startup-notification', '', d)} \
-- 
2.17.1


