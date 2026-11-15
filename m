Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3870.1794729030994150232
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 14 Nov 2026 23:50:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=gnboB5ZR;
 spf=pass (domain: gmail.com, ip: 74.125.82.169, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-37628596783so4144847eec.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 14 Nov 2026 23:50:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794729030; x=1795333830; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7FiHAQtR71H/aC5LaNWtQk+PljBVm0fsohgfxsbyQKo=;
        b=gnboB5ZRK3chP88YHHNy8IbpbjZZelLKSLfwj2ATdAodih647rBBQaT02GxkT0nch4
         E76AHUz1IE9OfsnB9zyRNbAGmUcBNhZLcFC88oFq0LMlWKirtMQPXASGb/IKs3Db9bsc
         gnKbP7xULVm+ZviXOmflNUVb3TOi9OYY/Ix+PdCgK91nXc7KmataqWiLNdJua0kCeyU/
         +yWeKfSQO9g/wa9pDtLvFZIZr9uNPwe6A9URfMK72qSVsqqB5kBInKyn0rU/emjsaqSq
         8np6gmY1bWL+2S+vADbMkm3beUPDsjx927Qe/otoC4DHbLqF5qmt8jiS7tsVb1Ca81Nd
         vF9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794729030; x=1795333830;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7FiHAQtR71H/aC5LaNWtQk+PljBVm0fsohgfxsbyQKo=;
        b=tsddzBT7twmY0ae7DUNkjXMZOA8XtR5pwkHG/fZgZGK2Qw8R104vdd/XyJGqXKwWnj
         mX5oTNkV/L5OQOB5Gv4l25ZWk/eTAs4dxlNgVX9FYfQNY6oCDfCgIiLvb3VBzEbqa9GA
         0tydS5ErQ+cM0QlvmXSJKKK86gDMQ1RTC1mdHfXdA9npEIy0k8Aoc6DsDQ/eT2T737sR
         Emj7a5Sl53mmB5G288ZeNRQqnSPM5oqu2pE/mS9MTDzurxF6LQrtUvSr3Uq4p5BGDKCy
         kRPvw/Lel+GzDz8QysU9d3K7i1NliQ1+TT1TT+22RC+QV7tvYb9fRNw0K5rkjHtBRRNW
         5Xzw==
X-Gm-Message-State: APuU4Z+Az7stFygnaA3VdO8pxMXxmV+6UL9gndMD2dzbqJwJhUFNGzaU
	l+6o6SlRGULdCAn5RnPiZTy9de7+DR98SDEo7rPZDmt+8g3Tfa0G2ZMjW/j13gS+
X-Gm-Gg: AYBFou2v5zXi6lokt9rmFhmSDZGKT79EgfgDDAYqeoH2po+efkk1h1Cl754+MRhlm+x
	q57Ko7kCpxtLjhyPKAZatgk3JQNYXVi8uRYANHuPwC0v7pjBLhDzdWOeXoGgV4ut+ybozFpotU0
	U/4jMuwvrMvkG7QtdOlVodaHo+aJCcYClsYkJLQT89sOEYEdaNpa26CixFEdo6sKNWnCgXTvNmy
	tr7JeOsG4JN5jFBEZeyFhPs/rfaD/m9Wa43CS9EKkNT4QJnfZ4y7hNHUQ9i7lzVhEba8mbcwYL/
	2sWHVsbarjQLAWLU+TOR61cIDISsHUMzb3V64qmp0qPh8xHRaWewN8yieT65FjtG6FoNB3Hs9AK
	W0uftUQvXEotcJ/dE/RfRV3Q83NTqE6B8ofGjfwC1SJCHeTGIXC66z6cn5fI+A+18z0KR2SDoTu
	JPjjhGl+kiWBk9VLstxDDFGJMnuT598bpLvwo31OCgISr+hg+JrEmTUc0F2UUNQpUz+C6EmJKl1
	OYh/OIQBnTcfNyCh8j3GNZFUeABYcD4GoKtoZjzkkw1RL02/PcX0s8qeS+rYi5zwk2p+ilOWI4z
	vMCV92asm7aqoZX+xaiFJc4PEmi5ZiMMVJPS6gNSKyzQs+0jiJEIk/fSWSQ6K8ZgYao/+rUJw1Y
	jKv+FvrNsizz2+94lNGmwKVDQmGVlSPyqYkpZq64ibnWlCWcWmRmP6aUFX3pSzFIQjEbyAZFwQz
	Pa3kebk9A9u19oDgw8HhtIyUguSOkbtXzZdP+5LotHKdXJy4YOq/qG2RcjKm8mNUPqJnCmTCCqE
	l7Xcpv4UcPCA7QX9OCXFFzmXRm3jm8j/jQO9whhKs1KcfHv3K6X/nsFYRGDmJEjjfMwzyZJF6cB
	6lFbPECZQWh5zRC2SV3CaObgjQ==
X-Received: by 2002:a05:693c:829b:10b0:366:703c:5ef8 with SMTP id 5a478bee46e88-379659c6845mr8633242eec.7.1794729030264;
        Sat, 14 Nov 2026 23:50:30 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795591f4f8sm23112817eec.13.2026.11.14.23.50.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 23:50:29 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 43/96] pngcheck: upgrade 3.0.2 -> 3.0.3
Date: Sat, 14 Nov 2026 23:48:21 -0800
Message-ID: <20261115074918.2932593-43-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
References: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 07:50:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132313
Content-Type: text/plain; charset="utf-8"

The 3.0.3 source tarball is only published on libpng.org (SourceForge
has a win32 zip only), fetch it from there and check for updates there.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../pngcheck/{pngcheck_3.0.2.bb => pngcheck_3.0.3.bb}     | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-support/pngcheck/{pngcheck_3.0.2.bb => pngcheck_3.0.3.bb} (70%)

diff --git a/meta-oe/recipes-support/pngcheck/pngcheck_3.0.2.bb b/meta-oe/recipes-support/pngcheck/pngcheck_3.0.3.bb
similarity index 70%
rename from meta-oe/recipes-support/pngcheck/pngcheck_3.0.2.bb
rename to meta-oe/recipes-support/pngcheck/pngcheck_3.0.3.bb
index 69eeb204f8..9542c6b1a8 100644
--- a/meta-oe/recipes-support/pngcheck/pngcheck_3.0.2.bb
+++ b/meta-oe/recipes-support/pngcheck/pngcheck_3.0.3.bb
@@ -4,16 +4,16 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://gpl/COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 DEPENDS = "zlib libpng"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/project/png-mng/${BPN}/${PV}/${BPN}-${PV}.tar.gz \
+SRC_URI = "http://www.libpng.org/pub/png/src/${BPN}-${PV}.tar.gz \
            file://10-pngsplit-format-strings.patch \
            file://0001-png-fix-IDAT-windowsize-Fix-format-string-errors-in-.patch \
            file://0001-make-Respect-variables-from-environement.patch \
            "
 
-SRC_URI[sha256sum] = "0d7e262f24116fddf2847a8ceb5c92d9f5f26efb42e9fff63ec2bb7676131ca7"
+SRC_URI[sha256sum] = "c36a4491634af751f7798ea421321642f9590faa032eccb0dd5fb4533609dee6"
 
-UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/png-mng/files/pngcheck/"
-UPSTREAM_CHECK_REGEX = "${BPN}-(?P<pver>\d+(\.\d+)+)"
+UPSTREAM_CHECK_URI = "http://www.libpng.org/pub/png/apps/pngcheck.html"
+UPSTREAM_CHECK_REGEX = "${BPN}-(?P<pver>\d+(\.\d+)+)\.tar"
 
 CFLAGS += "-DUSE_ZLIB"
 
