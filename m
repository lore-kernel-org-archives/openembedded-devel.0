Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
	[209.85.128.43])
	by mail.openembedded.org (Postfix) with ESMTP id 0D5B07D15B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Mar 2019 15:35:39 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id o25so457275wmf.5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Mar 2019 08:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=BxVNMqJ9Mm31fasCSxhlUarmmhFTLUkqbmXdOaYrZr0=;
	b=hqQlpGPNfWPU2Cz6nSpzCkxp3hwjwU00blaRt17J9tBLEhHNmiM0Eh9cFxR1mSutkd
	Iybj8bGh5YOdjV1G/CO65hN+hSi74vEXCKy2gU2ueJ2WOV9GIMEfCmUIsBDjgAuJfpmF
	SFYNG1ZaoSvA2eoCWpZLOpWsrHYo3IhXJXvVvv411LHaBjaax2uF87mef/TicKjBAEuN
	rSaV2nCIfh0Xlkbf+eRtP5Q0ncdJAEWxqX+fuy4XmUZSbYUGUG/ja0wSpBYy1xa/myor
	2VdtC4Kuzv4FfnonopT/uYeaIMKUe4urRA92MVqCoDXwPBQ0WoVxrYD7LOXXTOU83ij4
	Gh9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=BxVNMqJ9Mm31fasCSxhlUarmmhFTLUkqbmXdOaYrZr0=;
	b=ivCs6YZE86ZI7mlMGBObNV84OshbtV5Yj725Y4y6LDbMhxesBReoJqYCnmv/376D+8
	5ftmX4UNRN7jUtMS986nZ1op+5HQ3quFu0cDOK8sobst/hgQ+maooaiQFLAhHZbcWkDJ
	RfxotZ+4TJ9HVG5fjS+9oFu49+ox06ucdp9OPyiAVyuYw9hVXYX3hAwz1MOvdBITKfse
	+xErerit7VTuj1QNpyWmbiHK6sURq4B8g7ZMCezTOoca69p8u2oR2hlPxjnZ0L5S+xxk
	SlWl196mgQrU9+zpJ6yGW5aMsY6Bb3GwVVkHuj/LAFtyfEgkekpjRwC6JNWkfXKiHShW
	asOg==
X-Gm-Message-State: APjAAAX3TfdyrtxI+8wNI7a6pp4DgvcdiS7fp4e7qV3/CcwdUTDV+B2A
	i+Gg1R0a2srJYKVwC+muOA3p2iju
X-Google-Smtp-Source: APXvYqzymUY1h/mEjr7TlA/+t7VZPtnp15dngpmayjUoGCEw8H6Lo655yXLz/35mnoMAmZ3c+B9JGQ==
X-Received: by 2002:a1c:4187:: with SMTP id o129mr9004151wma.57.1553700940421; 
	Wed, 27 Mar 2019 08:35:40 -0700 (PDT)
Received: from localhost.localdomain (p509737a3.dip0.t-ipconnect.de.
	[80.151.55.163])
	by smtp.gmail.com with ESMTPSA id q4sm7517518wrx.25.2019.03.27.08.35.39
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 27 Mar 2019 08:35:39 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 27 Mar 2019 16:35:04 +0100
Message-Id: <20190327153509.23928-10-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190327153509.23928-1-schnitzeltony@gmail.com>
References: <20190327153509.23928-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 10/15] gtksourceview3: upgrade 3.24.8 -> 3.24.10
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
X-List-Received-Date: Wed, 27 Mar 2019 15:35:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../{gtksourceview3_3.24.8.bb => gtksourceview3_3.24.10.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/gtksourceview/{gtksourceview3_3.24.8.bb => gtksourceview3_3.24.10.bb} (81%)

diff --git a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview3_3.24.8.bb b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview3_3.24.10.bb
similarity index 81%
rename from meta-gnome/recipes-gnome/gtksourceview/gtksourceview3_3.24.8.bb
rename to meta-gnome/recipes-gnome/gtksourceview/gtksourceview3_3.24.10.bb
index 7cb88665a..d91e479d8 100644
--- a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview3_3.24.8.bb
+++ b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview3_3.24.10.bb
@@ -15,7 +15,7 @@ inherit gnomebase lib_package gettext distro_features_check gtk-doc gobject-intr
 REQUIRED_DISTRO_FEATURES = "x11"
 
 SRC_URI = "http://ftp.gnome.org/pub/gnome/sources/gtksourceview/3.24/${PNAME}-${PV}.tar.xz"
-SRC_URI[md5sum] = "52f8c83ad21ad75e9ee6cca03ce2e63f"
-SRC_URI[sha256sum] = "1e9bb8ff190db705deb916dd23ff681f0e8803aec407bf0fd64c7e615ac436fe"
+SRC_URI[md5sum] = "e43337d17c40eae440a76630db76c54e"
+SRC_URI[sha256sum] = "ab5406cdd0bdcf66afcd52b1e048a2f43c0f3ab391644ee30d9ac419b93cd59b"
 
 FILES_${PN} += " ${datadir}/gtksourceview-3.0"
-- 
2.20.1


