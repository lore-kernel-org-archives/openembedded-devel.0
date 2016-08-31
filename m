Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 6F92773285
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Aug 2016 19:41:13 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id c133so290392wmd.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Aug 2016 12:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=hUavy/sPG7yQCFgEfdb3TXkWrVv8FXQXqDTt1N+j1Kk=;
	b=Vz0RoPmJAVt4l/qpeYid9kOkrTJLpqd3NvW8euHtKRekRXprN2QGG/MuxhSFemEvK0
	54Bi9vFOc3z36hkPubKehKvsScPpBVdk7+W8FPKcr6MR1NDl6kSeqdlRlPinm6Nq5JAK
	qSBpKcZ9AQWa3Fli+DUgAnQ5G415MJkE14ok887hbh/GjIN5AQzufjszOhG4nSEnlmJw
	VabFHajin2M2qeOVERKIHVJxWc1r9NTESEe72Vw/+K4GDExGrNDzgwTAna2lm7a6Rn+O
	QJhGL9TxSbBHHMgp3i/C41bYFAhjbbl/KTSPJYQ37zK03YIJGqYaV4l9hExWVJpFfkPQ
	RSUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=hUavy/sPG7yQCFgEfdb3TXkWrVv8FXQXqDTt1N+j1Kk=;
	b=bzuQtUGmk5iOeGisFWRYk6jWYQdYydEwMh4GCWf4cTYwAoifHTJHMVHhve8+JglidQ
	hSLsD6eQKigcDlQeEgOC0gLFuVKCV3DwqQhp8iWhjoMmmJw1giJwzdNbsOH+Sp9O/KyY
	m6KLV0r4COBykS1bk24cf5LjzJfwDr3wHD0BDHGSAjxbRyJEKS3dmS9G1cDgyctaz2rd
	kfEhYe4cnAvDVwEPQGQWCcbSj6EU2j+mhNuYE4MAkd8F9uNOZW9QvZ0IwODiyTRvRWej
	cXGWHh2WTgM1rbOTE5sY8IBcARgg1bwq0gEn21WtE1abrNb5ETf4pyjBONCOkZTVA+Pi
	PHVw==
X-Gm-Message-State: AE9vXwN3FU1TUpXRvnETIEADjs0uxfyk7NQKhb4iGplNNlI61MSC0dK5ji5G7dBMvB96/A==
X-Received: by 10.28.50.199 with SMTP id y190mr24262591wmy.61.1472672473596;
	Wed, 31 Aug 2016 12:41:13 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169]) by smtp.gmail.com with ESMTPSA id
	x203sm25168583wmg.0.2016.08.31.12.41.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 31 Aug 2016 12:41:12 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 31 Aug 2016 21:40:57 +0200
Message-Id: <20160831194106.14065-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.9.2
In-Reply-To: <20160831194106.14065-1-Martin.Jansa@gmail.com>
References: <20160831194106.14065-1-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 02/11] efl: remove dependency on tslib
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
X-List-Received-Date: Wed, 31 Aug 2016 19:41:14 -0000

* tslib was removed from oe-core

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/efl/efl.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-efl/recipes-efl/efl/efl.inc b/meta-efl/recipes-efl/efl/efl.inc
index 5436b40..a24da6d 100644
--- a/meta-efl/recipes-efl/efl/efl.inc
+++ b/meta-efl/recipes-efl/efl/efl.inc
@@ -3,7 +3,7 @@ LICENSE = "MIT & BSD & LGPL-2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=ca7873210523dcfd32694b94286dca60"
 
 DEPENDS_class-native = "freetype-native libxext-native libpng-native jpeg-native tiff-native libfribidi-native glib-2.0-native dbus-native openssl-native"
-DEPENDS = "virtual/libiconv tslib curl glib-2.0 gnutls pkgconfig zlib jpeg openssl libsndfile1 dbus libexif librsvg freetype libpng tiff libxext virtual/libx11 libxdamage libxrender fontconfig libfribidi giflib udev libxcursor libxcomposite libxinerama libxrandr libxtst libxscrnsaver efl-native util-linux libunwind"
+DEPENDS = "virtual/libiconv curl glib-2.0 gnutls pkgconfig zlib jpeg openssl libsndfile1 dbus libexif librsvg freetype libpng tiff libxext virtual/libx11 libxdamage libxrender fontconfig libfribidi giflib udev libxcursor libxcomposite libxinerama libxrandr libxtst libxscrnsaver efl-native util-linux libunwind"
 
 inherit efl gettext pkgconfig
 
-- 
2.9.2


