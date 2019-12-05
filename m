Return-Path: <maxime.roussinbelanger@gmail.com>
Received: from mail-qv1-f67.google.com (mail-qv1-f67.google.com
	[209.85.219.67])
	by mail.openembedded.org (Postfix) with ESMTP id E5E5D7F87F
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Dec 2019 19:44:17 +0000 (UTC)
Received: by mail-qv1-f67.google.com with SMTP id t7so1760923qve.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Dec 2019 11:44:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=EjLmz/fwIj819GLMPZyUe1Vyhp+o1YY+4iGyTklkni0=;
	b=WH5XUCRbBaC7evXvgN42eJcTIsXp7YHb+RIpShl1kTTxFx8KBrLgeXbcIXVVTpfGc4
	2mGn26f4n4mg4JbYlupGfeiFkLfShe3AEuTlTK8dsCDmww9UWc1C7JkhGKowMhhFa2XY
	4ycJ1XpBk0VEcyMNlJMSURnr6MZY674hcul4rx/9LzcNNhgzlcXGQnXs8NJXlkW+0Pz5
	4UM0M7l76/jj8mFcWJZst7T+UbXawadk/B9kqVA0ylp32m8j6yuiQx+fhHqTS7zdz9yY
	uNt5218/6q3WeqhvTlABEWBS/ZlIav9v74uRdqc4hunKCuPVFUfBJq6K7UcBv+gsJOPt
	tofQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=EjLmz/fwIj819GLMPZyUe1Vyhp+o1YY+4iGyTklkni0=;
	b=LDxhzPqSbkNm5vkH4BfWDiZu9K1WU5AmSP5Fr+s3GatTpMsUoTK3oFeeIv1dPt+3Pc
	GnjTT9DEIwFlJ+uEWNYW+xOi/DRUDw9Woa77aReAlsh6SKk7nyHYtxD428z9ZR4ajRzv
	3YtVCzcAxJyTCvibxenJn1Q49WE2if+SszlI78vVyQ/JEPna0qF9CJ6PCZpsym5rxq+I
	x0I8a+p4cpzeLQl67JLH6SQnzO4fd6r6OPaKz1C2j73SkBN5E/Gindkmh2PL0d15gaya
	Zr1tAnJrwVw0wE2K4rMlVcTWbktJ0qzJ1c0CDJGATlAgs+W+anq65bgoUJzGvFHFMb1v
	YeXw==
X-Gm-Message-State: APjAAAVaz9jJy6OIrXVP43TAjv4g11tPyJCo1Pp5H9t5ftiEM56ncq9X
	77/2/w5d/g5gHYR4g1P8OK+Fy4kpCvY=
X-Google-Smtp-Source: APXvYqwAR2mfu6b60jzO/goSVgSDQi0uf+dOknB6o1cGy6cuKLK5trsD8mdbH0/gcU2P5nwaAbFISQ==
X-Received: by 2002:a0c:b0fa:: with SMTP id p55mr9459578qvc.239.1575575058136; 
	Thu, 05 Dec 2019 11:44:18 -0800 (PST)
Received: from mbedesk.Sonatest.net
	(ipagstaticip-d73c7528-4de5-0861-800b-03d8b15e3869.sdsl.bell.ca.
	[174.94.156.236])
	by smtp.gmail.com with ESMTPSA id o3sm5202855qkc.77.2019.12.05.11.44.17
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 05 Dec 2019 11:44:17 -0800 (PST)
From: =?UTF-8?q?Maxime=20Roussin-B=C3=A9langer?=
	<maxime.roussinbelanger@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  5 Dec 2019 14:44:08 -0500
Message-Id: <20191205194408.10866-1-maxime.roussinbelanger@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH v2] libvncserver: add missing cmake configration option to packageconfig
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
X-List-Received-Date: Thu, 05 Dec 2019 19:44:18 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Maxime Roussin-Bélanger <maxime.roussinbelanger@gmail.com>
---
v2:
	- Fixed double `-` on ipv6 cmake configuration

.../libvncserver/libvncserver_0.9.12.bb           | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.12.bb b/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.12.bb
index 4e4acb835c..74aa7de076 100644
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
+PACKAGECONFIG[ipv6] = "-DWITH_IPv6=ON,-DWITH_IPv6=OFF,"
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


