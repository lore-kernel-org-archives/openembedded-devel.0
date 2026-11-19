Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.493.1795102823435448189
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Nov 2026 07:40:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=QHceZOMf;
 spf=pass (domain: konsulko.com, ip: 209.85.128.44, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4bb6c7b6dbdso33051575e9.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 19 Nov 2026 07:40:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1795102821; x=1795707621; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s6MOS395Ve1z/8jLTw0ZnphOS0AWng6DB6qucuclHPw=;
        b=QHceZOMftCKWs/2kw68FDitOhfxU8KVlNbm2fctL49Bv5f4ICHprWrcC5oy13VUBMw
         pcEZlHTbvKtzusPfu2fEjPGJPbIL7IRwl5iZ0ZTRBG8dLnRDmgchi6oh+onrotI+dB1h
         6pObZ/oS486/fR3AuimAmJ7122uDWG4X/e5w0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795102821; x=1795707621;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=s6MOS395Ve1z/8jLTw0ZnphOS0AWng6DB6qucuclHPw=;
        b=Y7Ogapr9MXG4eMRLXa97Ajab38PE3uq0qf5jpIaNAHZ9LeA5LfG+pFzwrnBaS1p4Eh
         8Tnn9Er0/0KDdK9Ulqio1JgnqoEAaneL6oIDaJ0S+vni2Bz3cJik1wZ0WyibOYK+yoZC
         Aa+QnIOk/qLYCGfC/N7iUTDBYx9qSvxSQ7b4pPmNDm1oTeh5HjTHTLweJWur47SrgPpR
         sD5u/tn7USAIVGaawMYT28tqbs5ltL4uJH3W4HoTsLmiL9OgpCfmQcj5O/MIs65aOg9+
         JqVAxcr0xbGG31JEjO2vpAOP2HEtBKJ0B/OaHUdyOBoHjeb/odFjfqJ9yM3oPS/uTslj
         Gnzw==
X-Gm-Message-State: APuU4Z8d2JqjEaUs42cvBBVPMd1wzh+m30ulB16YyPK4g47M0Leo+6nL
	ngSmRlziYdlrqknKsfNj8801/xYngtLN+ozvUMPK52I8LocSjny++bbATJUw8vCJI00NoPgAXQ3
	Fvpoj
X-Gm-Gg: AYBFou3FV/EeM2gZfnQdL/djTP7srpBmgJLdYdbKIYAqT0eKQMGOgalTx4RlzoIeA1F
	lw63x33lFmyyvNwcl9b4SlAMhigJJK8lh3xcRteM1YKYEfNKOJxURVEDGRjyAhmvpgGZDJUJQ7Q
	84lLPWjBtx0xauPJapSbeldcdOnZSlQK1LemplOKDZg+c5OAIMN6Hmd78nEd7QNVhvmVlkw+/zh
	EkKfna/9GNp5Qk9J4gjORzYaIahqrXKenyX/aRe7WUkDO6eG+yK+RW/Tw8Z+zTQwMkhNsgoEWOf
	FEsTQqBvovHCnJODh+ubw8Q2DcQqgY0XCfLm5+TfLs8oZuS3rKQwSAMfopeu6pv31qvM1mJral2
	gmR6Bkeb7EC2KfuNAA4pRO58Bpp01oCuLO2n7ZfYtNeYIX4HmemsxnlXV9zvGjFAT54ZoAaRjg7
	ByypN283EYXPQz+Oe0QLjj0mMWmtWict1rUfNUn+vwSdbvEQd7nM/6vSX2rYzEb0ysa4OFIJZeK
	VQppysBbrcjOPUZEM6Y+hZnXklqjW8xIl4PPFvYEo5T15XAdygwcokNnsxc3gLZNbQGd6RJ6+Cb
	REkNtyctPaZH5EfFoj7iWD3S2wNd/j9TnVgvZ4Ht4/tqLAuCUVEufXmH8TA0659ysJtZ4G0uqUl
	nV7is75pd98PX+lWBMrS+ztADnIHROkKPXUvOkt11c/3UAiSTJ3xtGg==
X-Received: by 2002:a05:600c:e54a:10b0:4bb:875b:3d91 with SMTP id 5b1f17b1804b1-4bb875b3d97mr19045085e9.30.1795102821611;
        Thu, 19 Nov 2026 07:40:21 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bb989e3sm225495f8f.52.2026.11.19.07.40.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 07:40:21 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 03/11] python3-grpcio-channelz: Upgrade 1.85.1 -> 1.85.3
Date: Thu, 19 Nov 2026 17:40:06 +0200
Message-ID: <20261119154014.1039002-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261119154014.1039002-1-leon.anavi@konsulko.com>
References: <20261119154014.1039002-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 19 Nov 2026 15:40:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132681
Content-Type: text/plain; charset="utf-8"

Upgrade to release 1.85.3:

- Fixed a deadlock that could freeze the entire Python process when
  closing a channel (synchronous API) while gRPC's background
  threads were running Python callbacks (for example, call
  credentials plugins).

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...cio-channelz_1.85.1.bb => python3-grpcio-channelz_1.85.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-grpcio-channelz_1.85.1.bb => python3-grpcio-channelz_1.85.3.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-grpcio-channelz_1.85.1.bb b/meta-python/recipes-devtools/python/python3-grpcio-channelz_1.85.3.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-grpcio-channelz_1.85.1.bb
rename to meta-python/recipes-devtools/python/python3-grpcio-channelz_1.85.3.bb
index e8a82a0dfa..82739760f8 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio-channelz_1.85.1.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio-channelz_1.85.3.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=fe8c552b7748e45c00ac55ac0257f6c9"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "bab93349a820e714c6b827e374bb10896dbf6acfa45df6b6ccfa9af13301e4da"
+SRC_URI[sha256sum] = "6455f89056b250884500fe07f5e8d177b9e1e54841bae16278b60c03845b707d"
 
 DEPENDS += "python3-grpcio python3-wheel-native"
 
-- 
2.47.3

