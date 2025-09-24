Return-Path: <jan.vermaete@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5B07CAC5AE
	for <webhook@archiver.kernel.org>; Wed, 24 Sep 2025 19:43:40 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web10.23457.1758743017542843187
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Sep 2025 12:43:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=b0nIwq0G;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: jan.vermaete@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3ece1102998so140075f8f.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 12:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758743015; x=1759347815; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hELqOFyVcPfZvZAbvK0hUPFRNPupF94sqem7wFRAdf0=;
        b=b0nIwq0G3fGjwp918OAhBdNws4jVrScS3hpJ4yCwxcvv6uYTLOK1vGn+T6ZowOLHvE
         ORtO/VsSXzzxMc/vOwuaWCyPmzNchZoF6Yia5RBSTPu8/HhoLSKCwIqDbfkUkJNuRhAS
         nBkMXMUQzsafoNwsVi9vrNypipK5uBGtdPsaDvghUajtbduYcYod5hnXeCzGUS+BAeZE
         eVGWflZNwXT6GWHgiA1tRl3FrSBi1Mvd8aji9WZGxHJhRYxrqjD6wMVrKWQDKqBMZcB1
         s8b2slr83wgHYgHQafdacIX6pz9qZwJLtf2MyJZb/+4L9pp6jWYx9uXKeqVrsvXReaBu
         I8Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758743015; x=1759347815;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hELqOFyVcPfZvZAbvK0hUPFRNPupF94sqem7wFRAdf0=;
        b=lIx+1fO8wyzUCCjpWbvfPGp9BChZaHN4LoNsgDyhXTBCw+Iapmk+bqf8oyH7wLCoPM
         5oV9bZI/8wh0bCsDumC0yOCqrnGEjVMaxveXz92d6qPRQ0FgIUOxAAXvW3T2reWJWa4P
         nENLAH94bkU/VVLdIizqz4RalpCbIqAPMNfdY4/WGXRsIwSsjtaj2araqy6ccDMBCfxj
         Bg3lNtJoNkUbjaIVchM3b66WMkIbP/lEDn9vTeLnPXFYh9AeUqQgaoJtMFYG6LXrZRFL
         iLKrDZ7gLTnb8bdpAm+txARH1iyGb/Uj8W/2VZrf/8YGAC1KyNdYBVxTQA3WQ128dfYf
         +r5w==
X-Gm-Message-State: AOJu0YzG1xPjOptJEQ2aRjKMmTReoIEqr+TyNaek0GVlJLELCTm7UquS
	jhyVxQaVvjNbemhloj2TdfZfexqVVzcdCU0VYJLvmEoPMorOeAacxx8GONkZQQkd
X-Gm-Gg: ASbGncv02cMRyOQ26UiLR6U7We7G/fH9JOyZie9xBrZFpSrtvcejeEaM830/iV5h5Nl
	vehiMtLDTE8+ow7paIRvw+2zGK0kwJGWjUrBKQPMGloPT+6D78c7BcNuRo9eT1n1LNPCU2hqgI2
	WVVLpYSoQq3IKmey2MwN/tate1CyLoiLCMoyboYF15EfraYGXTAZoa8MqAHVCTcHMOD/hrhZUCU
	OovqGWgnB6mWfw9xAQGY8pU+GWa6lqnm4j3HYV32l6L3gBhmvgFSdyzo85Ig0YhaqnMPyq7KxwS
	60GILAG0WqCkQxUTJsIcneWm+NpAkOZ/ToQu/6OXuS7/unN05FJLNnC7UW1iQJAgkIzPSBWt1fH
	8wimAfG0jx/h4i222hbERQSfP9fjCyPeGLKF7t1jtoer/Fi0LtfUgKAtPyGPWP5j954PMi8KK1o
	N3+3viyJuW6WwzG+sqJ1kdRjPYuYzPgHunoL0Y2g==
X-Google-Smtp-Source: AGHT+IGVwGfWJ+FO4P/Bkgy9K/DXe+3Epv9Kc+cLrSh116do/JAY3CW8iswGiBp8+2ddeNbeV0rPiw==
X-Received: by 2002:a05:6000:26ce:b0:3e7:471c:1de3 with SMTP id ffacd0b85a97d-40e436422e6mr1138604f8f.14.1758743015558;
        Wed, 24 Sep 2025 12:43:35 -0700 (PDT)
Received: from localhost.localdomain (2a02-1812-512-2c00-5cba-763c-2ed2-f98a.ip6.access.telenet.be. [2a02:1812:512:2c00:5cba:763c:2ed2:f98a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e33baa53dsm1060075e9.6.2025.09.24.12.43.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 12:43:35 -0700 (PDT)
From: Jan Vermaete <jan.vermaete@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jan Vermaete <jan.vermaete@gmail.com>
Subject: [meta-python][PATCH v2] python3-pyproj: added native
Date: Wed, 24 Sep 2025 21:43:22 +0200
Message-ID: <20250924194322.44308-1-jan.vermaete@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 19:43:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119838

+ homepage added

Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
---
 meta-python/recipes-devtools/python/python3-pyproj_3.7.2.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-pyproj_3.7.2.bb b/meta-python/recipes-devtools/python/python3-pyproj_3.7.2.bb
index b7e6646c97..576e4a5535 100644
--- a/meta-python/recipes-devtools/python/python3-pyproj_3.7.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pyproj_3.7.2.bb
@@ -1,5 +1,6 @@
 SUMMARY = "Python interface to PROJ (cartographic projections and coordinate transformations library)"
 LICENSE = "MIT"
+HOMEPAGE = "https://pyproj4.github.io/pyproj/stable/index.html"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3f3574263859ef2dc9bd7817d51adbaa"
 
 inherit pypi python_setuptools_build_meta cython
@@ -21,3 +22,5 @@ RDEPENDS:${PN} = " \
 export PROJ_INCDIR = "${STAGING_INCDIR}"
 export PROJ_LIBDIR = "${STAGING_LIBDIR}"
 export PROJ_DIR = "${STAGING_BINDIR_NATIVE}/.."
+
+BBCLASSEXTEND = "native"
-- 
2.47.3


