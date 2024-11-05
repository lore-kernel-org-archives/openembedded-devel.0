Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2ADD3D2C10F
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 14:37:11 +0000 (UTC)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
 by mx.groups.io with SMTP id smtpd.web10.19633.1730817429609221359
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 06:37:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QG2rovUf;
 spf=pass (domain: gmail.com, ip: 209.85.219.173, mailfrom: akuster808@gmail.com)
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-e2e444e355fso4996881276.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 06:37:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730817429; x=1731422229; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CaIcrPq52hbnOpy8cCLX1R/iTshb1Ucuqo0UVfPkw2Q=;
        b=QG2rovUfrNkzycUBolRCSdYq8ji1LshLIsajQEJG1dBU8Ec3J9IZLDXvBO2fhZCvpv
         xX5PXZbqkgWGC8SaP9CIb4cHB3+U3IV03SAxf1xD2R2vbNHlRH16sDuM0g1YSLSwftH9
         AgVc4Dv4MVdJCXqFwDgf+ULhd20ZKhOAmxO8+1pdip65DQEBbcvzhhr3GAjtvl5ceo/d
         qDgIUV74Qj6qlQA+orziIIFlDmi/Peio73QP7Jb6AswBTDmmDhe8k2y28fDXq54mLhdA
         F2iYuMaKhM1K82tIsAMfxLeLt302cbwzO2Qtb8poGuBNBoIHDk7WSmybxk4XYigAEOsO
         0l+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730817429; x=1731422229;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CaIcrPq52hbnOpy8cCLX1R/iTshb1Ucuqo0UVfPkw2Q=;
        b=eaQZ7YxEMoHmV303QYyP3HI0Irvm7JJ94Fbs4RaLmPNFADiMabsHvQ2fkNus0ttmnF
         G6ZvbDUpIkL8JZdjRYMpVRbJ9vwxKZjFObUSfoAO4aeUaGJKWOjmyS8Ovu7ylCJu48D7
         JRVQNKW3nLsx+xT2noDF2A2WKw6xwMeFkAj8yzC74gF7ZmQG/svxKDO7BmkJcUMhsbIZ
         y89IIVdbpAUT7bRMvsTUMpRIEE4BgwoW7RKtNTa+U5J4+pS2G06ngu51f9EgT3c8Tyju
         5mU5/hgfmSkFaU56kdWZOq25zhQrOtRI5+/vrdZXgovcF+KdIKwOnhtm4Sy2PGz7GGW2
         b7Xw==
X-Gm-Message-State: AOJu0YxaywNDGCSsxdW1bllJ/hD4s8cB2BQDT6ab+MWX8Cx0sx9kP2Ex
	JONr+czvSVJygJQcI2FwMsRa85Ot6h7SlCTgbURBZ5Cb/p60djL6stMwQw==
X-Google-Smtp-Source: AGHT+IGeGzjvX8o++phranuschzL6FlLt271dFF6YJyRwhx0Ftzb1pqkeMXuI9RjPwpFRcq0RRQhhQ==
X-Received: by 2002:a05:690c:9a8c:b0:6ea:3283:55bd with SMTP id 00721157ae682-6ea5591e0a0mr145784357b3.22.1730817428646;
        Tue, 05 Nov 2024 06:37:08 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:45dd:7000::29])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c8723esm22495977b3.126.2024.11.05.06.37.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 06:37:08 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][styhead][PATCH 63/90] python3-pastedeploy: switch to PEP-517 build backend
Date: Tue,  5 Nov 2024 09:35:28 -0500
Message-ID: <20241105143638.2301245-64-akuster808@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105143638.2301245-1-akuster808@gmail.com>
References: <20241105143638.2301245-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 14:37:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113481

From: alperak <alperyasinak1@gmail.com>

- The project has a proper pyproject.toml which declares the setuptools.build.meta PEP-517 backend.

- Unnecessary dependencies dropped.

Fix:

WARNING: python3-pastedeploy-3.1.0-r0 do_check_backend: QA Issue: inherits setuptools3 but has pyproject.toml with setuptools.build_meta, use the correct class [pep517-backend]

Signed-off-by: alperak <alperyasinak1@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit f421917ff688727cf2197849cbbed1e3c412d3c0)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../python/python3-pastedeploy_3.1.0.bb         | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-pastedeploy_3.1.0.bb b/meta-python/recipes-devtools/python/python3-pastedeploy_3.1.0.bb
index 27f32bf1af..e3405939c7 100644
--- a/meta-python/recipes-devtools/python/python3-pastedeploy_3.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pastedeploy_3.1.0.bb
@@ -3,19 +3,22 @@ HOMEPAGE = "https://pylonsproject.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://license.txt;md5=1798f29d55080c60365e6283cb49779c"
 
-inherit pypi
+inherit pypi python_setuptools_build_meta
+
 PYPI_PACKAGE = "PasteDeploy"
 
 SRC_URI[sha256sum] = "9ddbaf152f8095438a9fe81f82c78a6714b92ae8e066bed418b6a7ff6a095a95"
 
-S = "${WORKDIR}/PasteDeploy-${PV}"
-
-inherit setuptools3
-
 # Uncomment this line to enable all the optional features.
 #PACKAGECONFIG ?= "paste docs"
 PACKAGECONFIG[paste] = ",,,python3-paste"
 PACKAGECONFIG[docs] = ",,,python3-sphinx python3-pylons-sphinx-themes"
 
-DEPENDS= "python3 python3-setuptools-scm-native python3-pytest-runner-native"
-RDEPENDS:${PN} += "python3-core  python3-misc python3-netclient python3-pkgutil python3-setuptools python3-threading python3-core"
+RDEPENDS:${PN} += " \
+	python3-core \
+	python3-misc \
+	python3-netclient \
+	python3-pkgutil \
+	python3-setuptools \
+	python3-threading \
+"
-- 
2.43.0


