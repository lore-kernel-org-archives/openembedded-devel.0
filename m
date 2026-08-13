Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61893C5CFDB
	for <webhook@archiver.kernel.org>; Thu, 13 Aug 2026 20:09:28 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27775.1786651763519142453
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Aug 2026 13:09:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=AJCE7HyR;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2cf27856f9cso3456405ad.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 13:09:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786651763; x=1787256563; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9tDTM7rW5PT4CyZWrPbTkYk/jV9uyjwkgL3J++fH2Pg=;
        b=AJCE7HyR6Vt1yb8nH2jr5zcjs5zrpZ4cacKZFdVLyUt+/pCwCEXCWCFnmTaeuakGjr
         tQcsROLvcmxJVHPocHP5+N6+OwkNbOmuItqTRrB0Ek6mf4K3kc+L6s3bZuBePsCZvtB9
         2RmufyhaJU1LH9GssWSjsLGAaYXe02x07ezIMCPK83tx13F16hhcpsX0qBVv0njefsYp
         uRttpwmPtyxBnOkxu9S8fnXzFsk/buzVjowvAgSWT7h5lQXonEX1UlBKa9Nf31Fe9eqw
         fO58gC8QB5ajxDHlk+s7ZUMlskIRq1LTorx/VjyN3KsCh9mZz+0pq+rVv1A0AVTVYcAv
         T6Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786651763; x=1787256563;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9tDTM7rW5PT4CyZWrPbTkYk/jV9uyjwkgL3J++fH2Pg=;
        b=BmgE6du+MXrCs9MddtEXQw0QJdSoi2Yt5PCK7cV8EqlkmSgIIQqEX0n2mqfc6XWrqj
         0ApLSuMi6Jvf9JOn9Dd48zTWJjIZEYVfIc0PaqkZm07EJtcPGaJUCBvvqp6rNj9v/Vb+
         kJqWtQ06wjLw1/UOUu5kMCJ9HLFdYhPCJOOQ/wX9xZNBPVdIVBSFGHfQryw4KCyReA3u
         Zfif5aPYgDOy2lHXVjz8YPGwlCCQYd5vH94T6hEuhNIkl7t17VYaspFiIH1vDAxBZl4c
         dSj3SFEDgiqkxQbgim3q1FPVp0ZJgAi2IOif9JUl/03/24BXSWUaaGyAjuVzUb+4ROlA
         UKFA==
X-Gm-Message-State: AOJu0YxNHrcwK+SbU8e+TU4qDdANoeHTaEuGy2YSFQk2O8ipibOUzXVq
	kcfx7SbXlRbK8Upfi7wers5pMw5/YaiEOrSZ7nevdhttOSF9xhevoLY0cudk8951
X-Gm-Gg: AR+sD12vA4JK63u063+EDDIXIxxUdqYyM2uJ+TOakGm/DbhlYywhgjsWSOiw2Vgkf5k
	3XWSGm8LGcuKwMk+fec0JDVCq5d2sYidEqWRf5oZOf1G0IDkKSjqXf1VbcBbESeaXaqsA1Qyumu
	ar6QDcgjo3uzlgOo7kzj6WsMXqP8pUNqvjJlMMWO9qBy+MPnRVZr9qewxG8H0p2yddFNh3SnwjV
	2G4rMGFr8SF76br7A53Tk6cRxbA6KG8K82C3rKneDBPpc9iUC2RtR0afdWdsQQacbJOFJTJUVwI
	hWJW3DSdvjuFx0UcK/H5LYshq6WwSqHGECxsNK4D/U4D+9eFFRzONpPafYweL/jV+U8Ih3fkVJM
	Nzt0EjnAyuz80cOQIvmJNLHQIpAcM+YGmqbaq0POf4CzlOOHuKyX1cv9NH5gAmsHKtNXIpoMe7v
	baZwgdh1RqgqLZ48wa1Zu4x8qY/7mOgRCiLBdyzlZjQ8jnIzNSNhmjTK/MaY/wGzu8r7ON4Dmds
	2oVhJ25lTXkM/knNHcENIdxf99VGA2h/s4pkJSjzkgMZx0dxGwk6tVh7DR60+e/e1UjmPZjCFIJ
	b0UI1XxwvW+U7Ix4SIkoZDDgjkgjt/PWk1At8PvnGwJ+d7r+QzlvjRVnb/j8now3KSh7QrazibU
	MVPfh4jjeVZzjWmTrE1GXs21wjrv02m1FHt70+KwnqBdgSmYRu+XgK3bY
X-Received: by 2002:a05:6a21:2291:b0:3c3:9aff:7a46 with SMTP id adf61e73a8af0-3cc71dcd499mr298692637.32.1786651762747;
        Thu, 13 Aug 2026 13:09:22 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31ebfc37202sm10012289eec.20.2026.08.13.13.09.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 13:09:21 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 24/80] python3-flexparser: add python3-wheel-native to DEPENDS
Date: Thu, 13 Aug 2026 13:07:38 -0700
Message-ID: <20260813200834.1302829-24-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260813200834.1302829-1-khem.raj@oss.qualcomm.com>
References: <20260813200834.1302829-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 20:09:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128968

setuptools3.bbclass and python_setuptools_build_meta.bbclass no longer
add python3-wheel-native to DEPENDS by default, following oe-core
commit e546c697b7 ("classes/setuptools3: remove wheel dependency"),
since setuptools >= 70.1.0 no longer needs the external wheel package
to build a wheel.

This recipe's pyproject.toml/setup.py still declares wheel as a build
requirement, so pyproject-build's --no-isolation dependency check now
fails:

  ERROR Unmet dependencies (checked against .../recipe-sysroot-native/usr/bin/nativepython3):
  	wheel
  		wanted: any
  		found: not installed

Add python3-wheel-native to DEPENDS directly to satisfy it.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-python/recipes-devtools/python/python3-flexparser_0.4.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-flexparser_0.4.bb b/meta-python/recipes-devtools/python/python3-flexparser_0.4.bb
index c3d8fe28ac..011ba596c4 100644
--- a/meta-python/recipes-devtools/python/python3-flexparser_0.4.bb
+++ b/meta-python/recipes-devtools/python/python3-flexparser_0.4.bb
@@ -8,6 +8,8 @@ SRC_URI[sha256sum] = "266d98905595be2ccc5da964fe0a2c3526fbbffdc45b65b3146d75db99
 
 inherit pypi python_setuptools_build_meta ptest-python-pytest
 
+DEPENDS += "python3-wheel-native"
+
 PYPI_PACKAGE = "flexparser"
 
 PTEST_PYTEST_DIR = "flexparser/testsuite"

