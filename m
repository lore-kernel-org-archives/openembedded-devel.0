Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id 13CDB7501A
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 May 2018 21:42:38 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id 94-v6so10523346wrf.5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 May 2018 14:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=w2NrCHfUUuRMkcDsf0wOm72kvjv5hgyDD7ALA4PNvqM=;
	b=fbe46sxK3zHusuejPfVgD+TSYIhvywO+mS9YYSZV+KujSaijhxD9rUDT3VhydFwmXE
	sR8gffvS+LCdPaZ7q+9p0kdDqW3elvwWvZ1XneIOty2e2b19C5isdwl9apP9Xj2YYF6R
	tvNkF1YzPPaLmuKhhmGn7Qgd4yOVDzdjHDheHUhyc0n4MatMynqxMg1rpFj6ZWT3Ux95
	hSguCmCwYHJJZx8ykFtnR6jH04XH+RL+I/wwyq7A8YjUcuB7HZ9ikJ6ZDFPJ8YzCuVl+
	5aWD/uirYdpme7IiHSNmtWxyqnlMFeYdNM8s0fVf5fAo8P41N9nhDCGcNRLiIQVWJ+QO
	Hbgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=w2NrCHfUUuRMkcDsf0wOm72kvjv5hgyDD7ALA4PNvqM=;
	b=JCtx87dhVYJ7s3VCMzlLRkJo5Hla+9A+C0PrR5r+hDECOKL59FaEOk7yldc+L9HBo7
	HsCTJIUW/Uf0W11ZxAhjpkQMWGL3Do1f3BZmzVt1OrcJGwYvScjTce3MCuos1zDGb+fA
	caKweCUKlG8nCtLUZvJPs5UKzTyxQ4Z0JPU+xRC+hPfcPjOPu+8XQPGsqWRkDk4avBfP
	sNiN+UBDcKzMAcCduJts+7OwZ6u/wvf60ke0Y0bRQiLP2o2RjZJpGh+moZSz7ykC+/JW
	l4/SBkEvuYwaxCWPq3Q9oel6NpL7Gphh9HVOeUqtVIUemnNck3ogWvbLf/RrCwbIL8e9
	TeSQ==
X-Gm-Message-State: ALKqPwcskT7NgC8HzEU5Su7P3H16BvxNok8Ckmv0o/hBXaT3S8Yeb9op
	FFU3nuNW7buH1UzNrzZV2h53Ig==
X-Google-Smtp-Source: AB8JxZrGygm1MiSktLfbKilEsPxKMYCQT5ohJzo2EQaUUlT2eW3Q08t08S6UVUc/lEQeUNAbe46Gpg==
X-Received: by 2002:adf:90cd:: with SMTP id
	i71-v6mr8954126wri.136.1526679758867; 
	Fri, 18 May 2018 14:42:38 -0700 (PDT)
Received: from PC192-168-2-116.speedport.ip
	(p200300F07BC0BF121E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:f0:7bc0:bf12:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id
	141-v6sm12705644wmf.35.2018.05.18.14.42.37
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 18 May 2018 14:42:38 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 18 May 2018 23:42:28 +0200
Message-Id: <20180518214228.25819-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.3
MIME-Version: 1.0
Subject: [PATCH] evince: update 3.28.1 -> 3.28.2
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
X-List-Received-Date: Fri, 18 May 2018 21:42:39 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Remove PR this time.

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../recipes-gnome/evince/{evince_3.28.1.bb => evince_3.28.2.bb}      | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-gnome/recipes-gnome/evince/{evince_3.28.1.bb => evince_3.28.2.bb} (93%)

diff --git a/meta-gnome/recipes-gnome/evince/evince_3.28.1.bb b/meta-gnome/recipes-gnome/evince/evince_3.28.2.bb
similarity index 93%
rename from meta-gnome/recipes-gnome/evince/evince_3.28.1.bb
rename to meta-gnome/recipes-gnome/evince/evince_3.28.2.bb
index ce73620b0..c5b548432 100644
--- a/meta-gnome/recipes-gnome/evince/evince_3.28.1.bb
+++ b/meta-gnome/recipes-gnome/evince/evince_3.28.2.bb
@@ -3,7 +3,6 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=96f2f8d5ee576a2163977938ea36fa7b"
 SECTION = "x11/office"
 DEPENDS = "gtk+3 libsecret ${@bb.utils.contains('DISTRO_FEATURES','x11','gnome-desktop3','',d)} poppler gstreamer1.0-plugins-base orc adwaita-icon-theme intltool-native gnome-common-native"
-PR = "r5"
 
 inherit gnome pkgconfig gtk-icon-cache gsettings gobject-introspection distro_features_check systemd
 
@@ -13,8 +12,8 @@ SRC_URI = "${GNOME_MIRROR}/${GNOMEBN}/${@gnome_verdir("${PV}")}/${GNOMEBN}-${PV}
            file://0001-help-remove-YELP-macro.patch \
            file://0001-Add-format-attribute-to-_synctex_malloc.patch \
            "
-SRC_URI[archive.md5sum] = "27107b60ecc78b698e7902906f16ce82"
-SRC_URI[archive.sha256sum] = "caaa3100548b704068efb33f592b53accaf2154090ca68933d841f318d3c4d9e"
+SRC_URI[archive.md5sum] = "66aa1766eaaa37536e48def11a0e67a3"
+SRC_URI[archive.sha256sum] = "0955d22d85c9f6d322b6cbb464f1cc4c352db619017ec95dad4cc5c3440f73e1"
 
 EXTRA_OECONF = "--enable-thumbnailer"
 
-- 
2.14.3


