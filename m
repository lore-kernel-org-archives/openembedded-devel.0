Return-Path: <maxime.roussinbelanger@gmail.com>
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by mail.openembedded.org (Postfix) with ESMTP id 53B5C6C44A
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Dec 2019 19:34:26 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id 5so4695527qtz.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Dec 2019 11:34:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=WBHAMxKkZZcTak3GQBQHARWJ2O7an9TA4+90kwRF9Ao=;
	b=VqnqnnpwgEhJn8k2dpwJSJlfYwm2GnEjqJT+3a86KCPd7UyPR2ZlFyuBkwVDvXG/60
	3X6lUvshNz/Y0WisW2u2FOl9CQDA+m2OTZvREMYmYSuX3BII72thReolpj5Dfj1rafkZ
	kCPNTKUWTChjGFo3nMyl7SBJyk0RM49iGQ+vhd2ou0oHHg7TIqUa7R7M/szdn+hC5+oY
	9R6Nc3B0BNBnbYgQTdrn6aD4S7UZDNXCs8i/NHQPh//RPYdcOaVUmmJuwOkzBNlWZZNa
	/UwWB4NyCSXt4tzNVu2Q16/A8DfelIztkiKE3wtegKDAKPOwn6uwGW9t6cItFHx/uxzV
	ZsFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=WBHAMxKkZZcTak3GQBQHARWJ2O7an9TA4+90kwRF9Ao=;
	b=tssxaOybEaFA+zYFvOpyn7BJ8tfC1cOXlzusYzd5XcHDd25Lde2csHpWXt+NKkVOch
	gACtwLVyuqgb5S8Yzcfj8/jScI4QeLnCIfXDOcaKsRjTBZVzqTluq4vtmacGik/TvZzX
	Id7BTxq0xqTzq+CCuzVkXBdu29JpkJkYxu6yUW3KjAmygwwntjrc0Ve2saavw6glYq1w
	zjBMM6So3zT8DFCjEZ2UuSCiv9ia67EtWSX9C6Gf0SnUlGJyqbhOxNzEs5et4tEbShod
	mZrADZQB73G8NMnrXVuFRhCJ76LkwBbJyK1DTMxFM1tkYLuAvJBNz8DkENzh7ic+eEOa
	ZCTQ==
X-Gm-Message-State: APjAAAWXUkLHQXV7M8cKGF2DUBToWGDLYEGWImqIsJWOwGcEw1pHdrWU
	597LA5EbxMeLwVsIRKYZEuuZDuM83Lc=
X-Google-Smtp-Source: APXvYqz5e1XwVl0POHLX1+yvyZvZ3oAbRU+SZZFCHxz4ocwP0EZPL14NppCtxzxYD1RW7v/DhGIzKg==
X-Received: by 2002:ac8:60d3:: with SMTP id i19mr9182872qtm.391.1575574467067; 
	Thu, 05 Dec 2019 11:34:27 -0800 (PST)
Received: from mbedesk.Sonatest.net
	(ipagstaticip-d73c7528-4de5-0861-800b-03d8b15e3869.sdsl.bell.ca.
	[174.94.156.236]) by smtp.gmail.com with ESMTPSA id
	h28sm5728710qte.54.2019.12.05.11.34.26
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 05 Dec 2019 11:34:26 -0800 (PST)
From: =?UTF-8?q?Maxime=20Roussin-B=C3=A9langer?=
	<maxime.roussinbelanger@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  5 Dec 2019 14:34:15 -0500
Message-Id: <20191205193415.5928-1-maxime.roussinbelanger@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] libvncserver: add missing cmake configration option to packageconfig
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
X-List-Received-Date: Thu, 05 Dec 2019 19:34:26 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Maxime Roussin-Bélanger <maxime.roussinbelanger@gmail.com>
---
 .../libvncserver/libvncserver_0.9.12.bb           | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.12.bb b/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.12.bb
index 4e4acb835c..94a4cf7a83 100644
--- a/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.12.bb
+++ b/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.12.bb
@@ -6,23 +6,38 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=361b6b837cad26c6900a926b62aada5f"
 
 PACKAGECONFIG ??= " \
+    24bpp \
+    filetransfer \
+    ffmpeg \
     gcrypt \
     gnutls \
     jpeg \
     lzo \
     png \
+    pthread \
     ${@bb.utils.contains('DISTRO_FEATURES','systemd','systemd','',d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'ipv6', '',d)} \
+    sasl \
     sdl \
+    websockets \
     zlib \
 "
+
+PACKAGECONFIG[24bpp] = "-DWITH_24BPP=ON,-DWITH_24BPP=OFF,"
+PACKAGECONFIG[filetransfer] = "-DWITH_TIGHTVNC_FILETRANSFER=ON,-DWITH_TIGHTVNC_FILETRANSFER=OFF,"
+PACKAGECONFIG[ffmpeg] = "-DWITH_FFMPEG=ON,-DWITH_FFMPEG=OFF,ffmpeg,ffmpeg"
 PACKAGECONFIG[gcrypt] = "-DWITH_GCRYPT=ON,-DWITH_GCRYPT=OFF,libgcrypt,libgcrypt"
 PACKAGECONFIG[gnutls] = "-DWITH_GNUTLS=ON,-DWITH_GNUTLS=OFF,gnutls"
 PACKAGECONFIG[jpeg] = "-DWITH_JPEG=ON,-DWITH_JPEG=OFF,jpeg"
+PACKAGECONFIG[ipv6] = "-DWITH_IPv6=ON,--DWITH_IPv6=OFF,"
 PACKAGECONFIG[lzo] = "-DWITH_LZO=ON,-DWITH_LZO=OFF,lzo"
 PACKAGECONFIG[openssl] = "-DWITH_OPENSSL=ON,-DWITH_OPENSSL=OFF,openssl"
 PACKAGECONFIG[png] = "-DWITH_PNG=ON,-DWITH_PNG=OFF,libpng,libpng"
+PACKAGECONFIG[pthread] = "-DWITH_THREADS=ON,-DWITH_THREADS=OFF,"
 PACKAGECONFIG[systemd] = "-DWITH_SYSTEMD=ON,-DWITH_SYSTEMD=OFF,systemd"
+PACKAGECONFIG[sasl] = "-DWITH_SASL=ON,-DWITH_SASL=OFF,cyrus-sasl"
 PACKAGECONFIG[sdl] = "-DWITH_SDL=ON,-DWITH_SDL=OFF,libsdl2"
+PACKAGECONFIG[websockets] = "-DWITH_WEBSOCKETS=ON,-DWITH_WEBSOCKETS=OFF,"
 PACKAGECONFIG[zlib] = "-DWITH_ZLIB=ON,-DWITH_ZLIB=OFF,zlib"
 
 PACKAGE_BEFORE_PN = "libvncclient"
-- 
2.20.1


