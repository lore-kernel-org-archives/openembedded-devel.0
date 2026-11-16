Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34296.1794851661628558349
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Nov 2026 09:54:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=CW1UqQm0;
 spf=pass (domain: gmail.com, ip: 74.125.82.176, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-36fc0a3fe93so7088436eec.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 09:54:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794851661; x=1795456461; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mnbYx8DqCMhtg27f+L7TxT2vR7eiWHSvYopePo6OLuQ=;
        b=CW1UqQm0skNSldotXY/Wz2vw8WXcqmYYalutnlZ85Atx0OOdgOjql40wKNE80sMtl3
         M7n7II6DNcPmdHsoc1mdGrVXJGUTS0hGlyr+gRp6MrKZzM9rHybIUrw7Lr+hz8yQ3qS5
         zaOE+V1hR9fdn95292Hz2flZSnOxdO4y3z5O6Y1Eem0I4KjZ69k/eVNVd9MEcQXmvCbv
         US+0Vj5zEayMLEoB5oWQVlA739dRIm+kw/vtMKUyWh7qXY17c6rcW7QgWRBIvF0UOUkR
         m8efzAd5RSDcXpbggVlxvsLU3TwZNQQnJfwv9WxsfetmMQPSlA8n/cSyG39AdKHa2TSy
         7XYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794851661; x=1795456461;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mnbYx8DqCMhtg27f+L7TxT2vR7eiWHSvYopePo6OLuQ=;
        b=xWdZHpLXQ1jKAPP9PU0qrN1V/6OjYYFM/q60MrPv2LOb/oDrA7ZQdD7UNBLG9P28it
         J/G/0Y9LIN9Au9iBA+wDXOefy0nEoV1TuKa6d2c3J1db8sRWaWU3t93TEJLWcgVgpPaY
         oSo1baiuPmZv1LR3UcYkrJZ9kfWg5dYphfHBlbKcZDVx4INE1BD3K/lB3v52DQJu9LKx
         kg33m8I52T7EjzhLQ2lJVu82SV393s1KdkfX+tz9DeHjNCe+d6Ou/YDQBcdtXfbSmx2b
         ajaDpOenJA5wNaRgBsZ6MneyJAxW51+thcFtusNVIrL2o32DHc2b7IRu/Y7PwNGjIOyc
         zUBw==
X-Gm-Message-State: APuU4Z90B5G1FMnZVZg3rswgq/z9rjMjl2j9kF/jiNc7gLGUdLLXyRp/
	cUnALaCpejONMBvOS794WSNWu7mOdWLfqGi1CA6x0G9HOBIbW1CcaVWaOPxlTg2v
X-Gm-Gg: AYBFou01ZxEFoWZivV0A38kjD7D6BYsgH2Ezwiq0iuBYSZBRFKDhFrMiqTGxXZmpwrg
	2iKVLSFa7Jba6gQAqtduRNOvtCl7OyCPPR6tIC40+WEqSF2cjU6fsiuTTlRzESTCOQl4BOwdjPU
	FOA6A+0vSDCR6LjQsfnxghSF8hC4kxRO3/Q68Jnvf+XS8TawcimDvXfKoJndsyGrSfbxpGYDTWx
	v3VodIl8M3APx6y+o+3UnZt4wJ3l/X7xZqeTvHxg4T6dbjNQ0uhB7LE2V96AhWmN+bgGlqhr71c
	k0B7cBajOK5xw1yYe+gVn/29HDkG8XUrpG21p1xM/ysGQgzMvFfk4vfrEOMYUUyLl9VWAjMbSA8
	Nvpnnd6nATIFMq8TN7jV2YISzaPa3NXMbgIpdVd1S9IoVZHItiA3+jog907Vttre3ruEbOg06ZZ
	mdweHLjEgMYM7J76FmNOPePrKPRfWqPTD4GKUbhArn4MV7lY+2mdpH+WQ5dTrAL57IFkB0CafAe
	JVmgg5OeZooDPBIJMc7uKj80ciQldZGcN8w7nyp8yMSY6UK9uHNpnSg3XyLTjCOAeb7vRtrduGI
	dhvDpsIc1mej/UJlegYV8j1Qocx3RsOV6SUUcG7HHJicsJ0OtfE5jXlX8PHcMyST84vbQ/KZwDQ
	Wngnf/SimPm7V2QE3zh8DgTEuZPTXh/GeDq/O81t59ubmtCoiwOGbXuTAlbNqDy9tRHiZN/hw2n
	D3J1LZrw0W2RSJELsIEtq5Om7j1ALm5LvJc+ViTQDtIEYL/oXK3js0UVrNYyUzOGMQdVhIpxR9w
	LK9a8EDDt5Uz/JplfRpkWdt9YaV3DK+Wmcl5FTvKf0l9Y8k/9BUpwdC/I4glmhRp7Elz1T5UkvZ
	tdzu
X-Received: by 2002:a05:693c:8114:b0:36e:a321:5353 with SMTP id 5a478bee46e88-37963371e09mr11938975eec.2.1794851660844;
        Mon, 16 Nov 2026 09:54:20 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379560f5e06sm48391884eec.19.2026.11.16.09.54.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:54:19 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 013/105] python3-click-repl: upgrade 0.3.0 -> 0.4.1
Date: Mon, 16 Nov 2026 09:52:25 -0800
Message-ID: <20261116175359.342679-13-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
References: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 17:54:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132469
Content-Type: text/plain; charset="utf-8"

click-repl now depends on typing-extensions; add it to RDEPENDS.

Changes:
- Requires Python 3.9+ (was 3.6); dropped 3.8 in tests, added 3.13;
  new runtime dependency typing-extensions>=4.7.0; click<9 pinned.
- Compatibility with click 8.2+; add ReplContext class and type hints.
- Completion: hide already-used non-multiple options, new shortest_only
  option, no value completion for boolean flags, fixes for wrong
  option values and unhandled exceptions during autocomplete.
- 0.4.1: guard the click-repl import when stdin is unavailable.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...ython3-click-repl_0.3.0.bb => python3-click-repl_0.4.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-click-repl_0.3.0.bb => python3-click-repl_0.4.1.bb} (72%)

diff --git a/meta-python/recipes-devtools/python/python3-click-repl_0.3.0.bb b/meta-python/recipes-devtools/python/python3-click-repl_0.4.1.bb
similarity index 72%
rename from meta-python/recipes-devtools/python/python3-click-repl_0.3.0.bb
rename to meta-python/recipes-devtools/python/python3-click-repl_0.4.1.bb
index cb5827fc30..b1b6502431 100644
--- a/meta-python/recipes-devtools/python/python3-click-repl_0.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-click-repl_0.4.1.bb
@@ -3,15 +3,15 @@ HOMEPAGE = "https://github.com/untitaker/click-repl"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=580facc4832cac548fad94845542da44"
 
-SRC_URI[sha256sum] = "17849c23dba3d667247dc4defe1757fff98694e90fe37474f3feebb69ced26a9"
+SRC_URI[sha256sum] = "c32a1cf6f95e5bd6e92076f81ce24eafd33f2f0ffb0135887e335b8e446d1c0b"
 
 inherit pypi python_setuptools_build_meta
 
-PYPI_PACKAGE_SDIST = "click-repl"
 
 DEPENDS += "python3-wheel-native"
 
 RDEPENDS:${PN} += " \
 	python3-click \
 	python3-prompt-toolkit \
+	python3-typing-extensions \
 	"
