Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8207.1795739706891482296
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 16:35:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=fiBBURgG;
 spf=pass (domain: gmail.com, ip: 74.125.82.173, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-33fb4680717so3652194eec.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 16:35:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795739706; x=1796344506; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W8QjgQ8j0YRwtNTak7ZbEqLcY3LNAYC5nnlNvibXRrI=;
        b=fiBBURgG9CdIzgN9bckcztocZGRonuwL/SpnOkDK+3c6YpWJq9uUxj6WLaFsUBdN8C
         pnvoGtrJ+8JDIv0CQBj7o/VV5I4/HgSpl2TVngBtHB3ZI0mSbig/zgW4nMeu5wKSbv0p
         guCTo6AvwCPmXViwcOakWHezApaz+bdK90YAsQnYrVIx8wIfONXkiNRf8TOtXCeeasZP
         NyawqaDyTeMSnlNNODnfw4aZ3xom0bBrrcfvSDuCnUjmYskrmNCtnHmCfDuX0D8jozjX
         TtsYR0pp0rDfNcLUQxxK6z6r70LMZKezWqgjS7HVou+mg3+pRaNsFVyAqUjvbcRUEfCm
         HWSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795739706; x=1796344506;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=W8QjgQ8j0YRwtNTak7ZbEqLcY3LNAYC5nnlNvibXRrI=;
        b=Z05Z1oDvB9BzoWKydtfnzfUJNOgmIUDuNIhg5QdH/NZ3YuhCXSl/LJJpWT3QMv2QWu
         Wnbg7H8rxtGdDkN4mzwqPbkf51cujZRAS9QX/AfytUHlD7416wy9JMksAQko1iJwteSJ
         pY5IV3rEgw3PscWDpL27m0b3o8Ik+0PWF8/nh2DfpwdDAss7HrRSASxBfiUa6nFP6mhK
         nO0gP79ORX7ACuWTuRUlQhL6DwK73Hgz6k+lCF/zEnn9tkcfA6XXxoWhYOwVsUBvrOsI
         eF6v3UEEwgYGFAkQqBPnMrxjwh2FWLaQ1G0T6OGaHkjAbP2K7EpBllqBtlLO29KZrdVP
         DaNQ==
X-Gm-Message-State: APuU4Z/E1Jl6PZbjSWqLEwavXEShlz2IBH7TLHVrI6iWNfCXvMN/RXKt
	DGhNi1HMbtoVfh0/d9A+JvrsRe+2yG2tBRg/ixhdF0bkfrGpKUj2WcfofGJ4z3UF
X-Gm-Gg: AZFdTZcE2w6AEPxz9GacNUofZYzbMoZaF270CJplXpRA/Z2SJt4afvtG4UcEZ4uNlDC
	zDfxQkaMPwzUffON7omnTyttbR5pSLjizM7v2cHhjVmvivG/JvqP229iN3P/XxTAOc+vmqh3G9m
	DBlEPG0csG6WCUeYQaEbSzk5MAeNdqDRPqS6YsomE1UqKMoc6wJMbnROHJ+GiYtLPBEZLm5FSgU
	UzoXlnJfWcu9waXh6GfinK/mAQsgo0Dg+KE12zNK9leiP0ds5iW9VN/biRB4thtWqTuyjJq+clW
	fQbYmQgbmRFQMHPpn605TRCE66X9L2TwlcZr3DIjhQqJHEDYqwlFBsqXDV/pwzDZh1U2kjYQltf
	7sqaydZjVelVwBzYyo+VBhbjTws1ANGycFFacSuCX5WaSlY71thR3TjBBthR8jeRcFMACPSsKk0
	tFKEX0hm/L+iYsXELZhEaZxPCedhz05aCdNejZAh84IYgpj8aMu9pWGtuOe1q6tl93qhtdhgG+b
	xSb/rSSqB92Kda4fjOjz8KHIyYqGRItDT82XN8/Hv1HeT6xsTGWvgP1ef3OES0PAlItXxKnVgSL
	gQ9a27IsACpGVASwESuTlJXI49U8g/XpP75/HHuHefOGI3D+L8vRgXugAraecn5eIpMbitar45r
	Sn0x4yUts5OVYIfmOCQq07STaxKuiDvYGfxFwfzU+PeHmmwsrfLOrwsoCS9A1PYRlaYT3ibKZCs
	HL92+T+VdDCPodq92puiE+0qrj+K+RM0lU3gDjjYrKb+PbexspN4eLxhzlTE2a2cbj/BicACDZ6
	1fdn7G1m8KpDzpZ15sgm17R3tDBgyPY/bXTfOUpCazqsOGysGVuhnwXMHyAxbvL0b+TeAFQ76ie
	UUFr
X-Received: by 2002:a05:7300:2290:b0:379:24d9:cb98 with SMTP id 5a478bee46e88-3856925c033mr24796792eec.0.1795739706306;
        Thu, 26 Nov 2026 16:35:06 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672ce402sm63029314eec.16.2026.11.26.16.35.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 16:35:05 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 35/69] libsdl-mixer: Fix upstream version check
Date: Thu, 26 Nov 2026 16:33:51 -0800
Message-ID: <20261127003425.2166632-36-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127003425.2166632-1-khem.raj@oss.qualcomm.com>
References: <20261127003425.2166632-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 00:35:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133135
Content-Type: text/plain; charset="utf-8"

The default regex also matched the RPM packages on the release page
(SDL_mixer-1.2.12-1.src.rpm), reporting a bogus "1.2.12-1" version.
Match only the SDL_mixer-<version>.tar.gz source tarballs.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-graphics/libsdl/libsdl-mixer_1.2.12.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-graphics/libsdl/libsdl-mixer_1.2.12.bb b/meta-oe/recipes-graphics/libsdl/libsdl-mixer_1.2.12.bb
index d87c15aebc..0e462ee416 100644
--- a/meta-oe/recipes-graphics/libsdl/libsdl-mixer_1.2.12.bb
+++ b/meta-oe/recipes-graphics/libsdl/libsdl-mixer_1.2.12.bb
@@ -10,6 +10,8 @@ SRC_URI = "http://www.libsdl.org/projects/SDL_mixer/release/SDL_mixer-${PV}.tar.
 
 SRC_URI[sha256sum] = "1644308279a975799049e4826af2cfc787cad2abb11aa14562e402521f86992a"
 
+UPSTREAM_CHECK_REGEX = "SDL_mixer-(?P<pver>\d+(\.\d+)+)\.tar\.gz"
+
 S = "${UNPACKDIR}/SDL_mixer-${PV}"
 
 inherit autotools-brokensep pkgconfig
