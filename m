Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16.1794851767876146323
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Nov 2026 09:56:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=y2QzoXJm;
 spf=pass (domain: gmail.com, ip: 74.125.82.180, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-36fc0a3fe93so7092580eec.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 09:56:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794851767; x=1795456567; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=juSDkbOItMWVEAAc+I5NhjzRqKpMV4Tp5ehJAiBuKiM=;
        b=y2QzoXJmmeYGnnI90qw+qERm1gn4Wusanc6FFoy9QmaicPMgph6PlhQmVMhpyC5L+L
         WjMJh+FE22YeYbtNYrypvEGRX3xMeb0bUk4JYFK/vYvdjfpkEjUlPkoOvEbL+rDO56Tw
         45PoPk1W5q2b975fxkOR33eQ3W4eQqcLU3n0zZA1PRU+UIhiDBwHmUltwyIWvM7PAri1
         qZaR3DZZXKCnA1bzT0bwGzULoUsGjPCHeRg6svd3x0bHwaFBMCxHsekE2cU1VxD+4DkF
         NoXnjZIsU/a4/TpguHwm6C9DPYF08CnHmfy0WCTfAND2Zn0xBqLCVl6jKOcZrnPbiXw7
         2/7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794851767; x=1795456567;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=juSDkbOItMWVEAAc+I5NhjzRqKpMV4Tp5ehJAiBuKiM=;
        b=q8TfO3B892RVDeaMtGOp38RX5D48pAoMRIs/JfU3F8IQSg5nj7XFcIcCTnmzmlLvsu
         vOKuVKBXYHhEKfkwlDl4UUYu4P5PrFVvJWjK0nUPLAb0uwhzRiHag5TiQ11nO26CIpoo
         cTGN+UmrhZFpUfTk3HuXzYRffyP3sNlrxefpGmUr6vZdOb7atNz7l1B/t9AMiloOvNnr
         MN84klsif3v0xvAO74KbDIUppR2xyIbDCqORqXMBa6OuwygT815R+6o6x9EVEuy+bxln
         y9XnAoT8rRGVkPQiZjDsk+7vTxVtQBJdEwi0mVbq97HmI6way7gZ4EMppoUVePdvhVBB
         B62g==
X-Gm-Message-State: APuU4Z8ji2kK9V3H3VWFFHAMOgJFZYPEl6yOcCYzdNJLHyM9oZQ6vm/R
	M0RB1ZrfHTZxdkQfcHjDTRKPWZkIosC2t0r9G4JxIqcbOvLj6kl3z5pWmdKSKsl2
X-Gm-Gg: AZFdTZdZ5LmcVeWkwJLYY/rFqcktBUg9oHMZUKQtuJHehPnaGVrAXbclLYExVrZCGRv
	T0cj/El7fnH0PCmW1X0//dMWkcwP0TWH3upo3Pc3tPP/zjO7R7T5V0DVrLyNUgxdAPcId/EdSzD
	4kRk+cirwvaV0t4HHF6c6VIp8MTzFr8SOKuTqo9dvfuoaLHxK/mLNKxpLlr5JeCU8FVYe6VNNwx
	W+7091K8Wy4LRfx/mdjdmmPvdhf1Ht8i9NI3mb28IKRz/E/WjMEsqr9dUvhwWlV3mMNDAX6sMZf
	KAg2A1sn4ojZAX7vnlR0faMUKFeVd2OZDZfkxuuDSbs5IYUix8/pYoyIxmCwhqTLi3OljMSdnCC
	YtNuRHuoP6EXi8naSHbzSvE3plFfDR834Is/XPjXeA4oSYLW09PdOwivypZBuOZ/fhZ9PxTQooK
	6MfGBj3c5M8pXhj8/ozUUxqtGDH3RrTGrpVE+tXfJpaO1fWbzWLAktb/5KDgg1G2sfCZJB72Mac
	ZRuGNI3viHxuG4lzS/Jhu8nUMjyNJjFZkgM3NgRpmMg3STj+E1WjGjLy0q2/wVSe42HbpLCCLnk
	YKWJQSNIu3vPHqWtjfcnSylTF+xHTGx1HyzeTk0xMcu60CDmwLxTFcT7g9iPWkVu5hGxxJuXMou
	ZhZN1P7Y6t5dFS2VAz696p7yPdDWnqD3sqLT0hU+HohhIaOPPX6crkaXJ4qLKwsRqL/yxM6uS5C
	qtktDHQWnkiG2fHGnug59t2m6zzPXSpKuZcGAOb7BKjSqnTxIHZHS4YUcjdbjtPGW5DcEw8vkAl
	N1z5K7kdNo7Y8qjXJ148KsSKJ0fuVNM5cDsxq39hfwqW0fuCzi5LfBi6HPfe1jbT40Vew4Yxsdb
	ErGx+3NFATLwAd/llSuvbY9kcw==
X-Received: by 2002:a05:7301:d814:b0:36f:be1f:1191 with SMTP id 5a478bee46e88-37a8852abe3mr9898389eec.29.1794851767127;
        Mon, 16 Nov 2026 09:56:07 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379560f5e06sm48391884eec.19.2026.11.16.09.56.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:56:06 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 093/105] python3-tox: upgrade 4.67.1 -> 4.67.13
Date: Mon, 16 Nov 2026 09:53:45 -0800
Message-ID: <20261116175359.342679-93-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
References: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 17:56:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132548
Content-Type: text/plain; charset="utf-8"

Add hatch-fancy-pypi-readme to DEPENDS, now required by the build.

Changes:
- Bug-fix series (4.67.2 to 4.67.13), no new dependencies noted.
- Package staging and work dir permissions hardened: owner-only
  staging directories, works under umask 0002, stale group/world-
  writable .tox is made private and emptied (needed on shared CI).
- Hardening of inputs: requirement/constraint files limited to 10 MiB,
  PEP 723 metadata parsed strictly, inline script dependencies
  validated, symlink/junction meta_dir refused, args_are_paths no
  longer turns file names starting with "-" into options.
- Fixed set_env quoting with trailing backslashes, glob patterns when
  tox_root contains [, * or ?, factor names like py-django-4-2,
  --config-settings in requirement files, --runner choices.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../python/{python3-tox_4.67.1.bb => python3-tox_4.67.13.bb}   | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-tox_4.67.1.bb => python3-tox_4.67.13.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-tox_4.67.1.bb b/meta-python/recipes-devtools/python/python3-tox_4.67.13.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-tox_4.67.1.bb
rename to meta-python/recipes-devtools/python/python3-tox_4.67.13.bb
index f6c33af82e..b0a6c81e22 100644
--- a/meta-python/recipes-devtools/python/python3-tox_4.67.1.bb
+++ b/meta-python/recipes-devtools/python/python3-tox_4.67.13.bb
@@ -6,12 +6,13 @@ HOMEPAGE = "https://tox.readthedocs.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=11610a9d8fd95649cf8159be12b98cb7"
 
-SRC_URI[sha256sum] = "a68602f64421b199016127364ee47347b958391d19c2b2e53fe95673a8fe98e9"
+SRC_URI[sha256sum] = "9f70b44ca2e31d91d8fe2e2917f505554950adc3961c0ee70bb42db16d903f62"
 
 BBCLASSEXTEND = "native nativesdk"
 inherit pypi python_hatchling
 
 DEPENDS += "\
+    python3-hatch-fancy-pypi-readme-native \
     python3-hatch-vcs-native \
     python3-docutils-native \
 "
