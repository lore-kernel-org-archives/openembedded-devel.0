Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E97B7D1F9B0
	for <webhook@archiver.kernel.org>; Thu,  4 Dec 2025 10:26:04 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.40297.1764843964380829938
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Dec 2025 02:26:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=c/+RLd/6;
 spf=pass (domain: konsulko.com, ip: 209.85.218.41, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b79ea617f55so134149966b.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 04 Dec 2025 02:26:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1764843962; x=1765448762; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V8wwv2AxvTefV3P90c4Eb/g0srnh6kpPhNo+JiGNH/I=;
        b=c/+RLd/6p1GslIE2v8QKatFHERAZCLXSJtYugrI5QC61i3y6BHpLG8HEZXPA9Sa3AB
         94cLzpNsWz8LKAG/p4y/mrAd7dUaK6iXVaqOkhrdcV05OsdjzjV3znV/JfEzia7Lc9hi
         aP2E1AacgRpEujB6TptPKgyysP2JMmYXtH8+0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764843962; x=1765448762;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=V8wwv2AxvTefV3P90c4Eb/g0srnh6kpPhNo+JiGNH/I=;
        b=k6BObbh3VtZzWl3/aQ/49hKH7vl80LLbp9MU1yBZNiQorRa89vnnhZoh5FDOcENgM8
         /w1J5r+1tGwT743Pi4Hxf5nQMLwhPe6sFK8ORoGSDuILNv1WfzUtTf1kzYpd57dn232q
         Ni3lu108/U83JkdetKE0knyTfeynZbWcwyxLDS/7t/eNzpTyQiGqZgxlg4OC0Nio1SU8
         WJiBKmnLv/HQOQJlHh9XBnldS0vf/SbOhya3BxpH4sWA1598cg7g1nTE/0C6NdtwJE5B
         GV1hx3dlQzDzWLn1gcF6l9LszPGhJGI9hyVCAThZ01++ApKOAvC2Ad+1m3DM0f0684el
         G4Tw==
X-Gm-Message-State: AOJu0Yxik6CHQmQ4613OiCpZVfP2nrSjr2TwMbn5MQ7NIFygBC/hW1r+
	MNGUwGIuHG/bhdLJS8lIDtoH5JEom8xVW29aIk87yEnIKba7dIPNTLIJWvJeQOtCzA2Eu5TcDBz
	3JOuP
X-Gm-Gg: ASbGncta0vi5PlPcC9VZQ3mRHftIkaKi8NcR9PW3q8etOgeJL8D74mm7Ryl5fV332p7
	EBm7ohTffZoJSslxlYQlkjAh08UWh02UTEmF/s1bfLuMvgfMAhQqPYONA1l0NpOD0OKoVC/JLWD
	yC06QCDotFkgUzgjjGYBr1uj1yHTBvcN9N04pOkFkfrrls3Rk3Azyi4O2GVSm7eyKhm7uhhen3J
	xxapkJkRw1Wl0GLW5EuNT5ZI434YWEuYcns8ipmpYKYAmDNmsEl7aU/Lqh8CNdaUYHa4NR+JGz6
	QnnJ/moxeOjCTFryFFj73TqaytTe3fdcRCADf7XO9+k2z54QI8Fl+Y7aOTQ7zVlwxOywhoBXRPn
	SQlMaxxFdFnLede45X9KlnWJMfT0qMu3cUQN+4Q3S3ajVMi/VYQpt7LC8TZYkX/SqlAZu4Z67cn
	XlmaNE2AJc7JUyTmxxuE8a0579GqZbr711Xqo=
X-Google-Smtp-Source: AGHT+IHQvbb6WIm9ZXzSEtZmP4GOMYHvCTqI8khFQYIVucvzEUWE6LB3X4gimAiNklnIqBNghxHY5g==
X-Received: by 2002:a17:907:3f19:b0:b76:4426:3a3a with SMTP id a640c23a62f3a-b79dc7825d8mr605116366b.58.1764843960276;
        Thu, 04 Dec 2025 02:26:00 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b79f449d0b9sm98826366b.28.2025.12.04.02.25.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Dec 2025 02:25:59 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/3] python3-cloudpickle: Upgrade 3.1.1 -> 3.1.2
Date: Thu,  4 Dec 2025 12:25:56 +0200
Message-ID: <20251204102556.1702492-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251204102556.1702492-1-leon.anavi@konsulko.com>
References: <20251204102556.1702492-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 04 Dec 2025 10:26:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122317

Upgrade to release 3.1.2:

- Fix pickling of abstract base classes containing type annotations
  for Python 3.14.

License-Update: Use file LICENSE

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...cloudpickle_3.1.1.bb => python3-cloudpickle_3.1.2.bb} | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-cloudpickle_3.1.1.bb => python3-cloudpickle_3.1.2.bb} (55%)

diff --git a/meta-python/recipes-devtools/python/python3-cloudpickle_3.1.1.bb b/meta-python/recipes-devtools/python/python3-cloudpickle_3.1.2.bb
similarity index 55%
rename from meta-python/recipes-devtools/python/python3-cloudpickle_3.1.1.bb
rename to meta-python/recipes-devtools/python/python3-cloudpickle_3.1.2.bb
index 7e2fadda1c..9c285bf80c 100644
--- a/meta-python/recipes-devtools/python/python3-cloudpickle_3.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-cloudpickle_3.1.2.bb
@@ -8,11 +8,8 @@ data."
 HOMEPAGE = "https://github.com/cloudpipe/cloudpickle"
 
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://${UNPACKDIR}/LICENSE.cloudpickle;md5=b4d59aa5e2cc777722aac17841237931"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=b4d59aa5e2cc777722aac17841237931"
 
-inherit pypi python_flit_core
-
-SRC_URI += "https://raw.githubusercontent.com/cloudpipe/cloudpickle/v${PV}/LICENSE;downloadfilename=LICENSE.cloudpickle;name=license"
+SRC_URI[sha256sum] = "7fda9eb655c9c230dab534f1983763de5835249750e85fbcef43aaa30a9a2414"
 
-SRC_URI[sha256sum] = "b216fa8ae4019d5482a8ac3c95d8f6346115d8835911fd4aefd1a445e4242c64"
-SRC_URI[license.sha256sum] = "3029ea34173e9fdc233ad315dc6b100bd1ea71f529b1c1af97664a272fdc55f5"
+inherit pypi python_flit_core
-- 
2.47.3


