Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BEB6C5DF6D
	for <webhook@archiver.kernel.org>; Thu, 13 Aug 2026 20:09:59 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27800.1786651793704712485
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Aug 2026 13:09:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=beQwOrfY;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2cfff5f88dbso4900355ad.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 13:09:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786651793; x=1787256593; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eBIeXbKWgsZGdnf4GIt3S8JpX3UG3kxA5ggMMk+kLFc=;
        b=beQwOrfYPF4c0lQQxEkTt2j+Oxx+FQ3EoYTL70WMTJlgDgEXEOrpzqY/lIAyxS4+3G
         y7EPE0mWazU7bHwDFKztaIJHx2bUUeO3fOQTA8EUXJ/CAyWd3dk6dcOxa2nagCBcbRIL
         9p/en8SQKiFGxRu0pNDvvv1yA001ttG3KFTFINtZ1ZHWIh1vWkeN2VXkDXOcIh+uknXZ
         nQGGHBskcR06ndFCAdXwdR8oMNwehXHvrw0t6KNUTqXJpQ9DfZRYlYn73jYT1a3YWBLU
         RGOIfA/fX5wd1zjP8Gwo+mCB4I4WJgHf/sglTvv4/AFNcYZikYpncdRZh7PPAfEG0Dhn
         ijIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786651793; x=1787256593;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eBIeXbKWgsZGdnf4GIt3S8JpX3UG3kxA5ggMMk+kLFc=;
        b=KZGv+QTzkSOX4qsd7lpt93Pkfx1VVGBmBp+1BDWTPwW1Hh1wlkw19Ndj0uDXcke9A2
         r2P2Ug9KTScavkvV2eI8zNWpcDh5eGSpkRrBCDumzuI6YjighjNuYhZvk2Ec9Z/CK8vs
         dqsYwXIJenHkUzkthir/grtRLzQ9m50EH+Zp0G9ltNDFqJO858JYkAgkph/8R57IouO5
         n+ytuYszzYvp1X0+bL9kDTu+2d9gEJyhJsKjwkPbZ9YlFTyz3GM9rsaLbUqEW4UPnhF9
         XoCoseDDLFF5BU117e8CaPGd2/K+9xpYMlL1ZJ3U3fNyWuXV4apO4W24LHEjIKAoLBwv
         RYdA==
X-Gm-Message-State: AOJu0Yzj5kgEafZHkSIogI7suf8DPLhm44AyJFNoW3pkvAr1khA0OWzg
	8UUq1gGsWFDmDWoagmkmQguIVGviiFd/Tb7LsvFPhfHDBink+ob50VordfXwTArE
X-Gm-Gg: AR+sD12/3PrG0kxPNSIagpiAJz/fvfdP1sxr1Gc2j2pefkMvP9fnHb39O3ckKp0yaws
	6kvhOmWcXtIKdWM/l80k9cM4Dvx2mUth5OI5r9rIHLOBFssNGbVASf773cplgVZlo4rH77WnYds
	EGgFEM2mhAyUXYEnzROmZ1lueS+9jIw2gKq3fCBIiDJH1I+UqLSKPkukZaRMVJwhStKaQTMGP4c
	LXxadSt7DpX4yxU6Rb2GqmBHlxoRpDeCzwrpAX/4WyqsFAmSBD+7hXg6RifPLyLgn9NmChHwElF
	VE2xpyzE5qUOeC/6O3yHZzYmuDFie8zJKKBybFcoiBxAtVbzfF0Z2GtmdbbfuZjJQkS7ZpDbfHD
	uE96RffgANIVREyTluZ/sDe/xey7Hx6nIdDsuS121YHYg0OiPrQcev5ZrtU6uZBmxZ+Y9WIjC86
	fWyECq/rVenvJ8BUeKlNM16bXZAEWVXMdN+Y2CkSmPDrRj5ugHXf8ZJ4lcBHmxW8MzB0q2/qbAA
	fPtVcousal6WxfDOowXnsrp/egrkCt894W1qXo5PlTi5QIm0RtL7m0ZC6RqTBj5bryQ28bgU5F7
	YbPGmPHtI5bnkZktKIlFlZhQyjE2iXIQMceAsa/cwsyln/RIyoajXIZou+PT6Wd3pcMYzhX0y9i
	lNUX54iz5QDwdKiQvnHEBOQnEO7EUw/4LPE0rWiwPJEmjLA==
X-Received: by 2002:a05:6a20:2587:b0:3c3:a1e6:a626 with SMTP id adf61e73a8af0-3cc71e6799emr267218637.32.1786651793019;
        Thu, 13 Aug 2026 13:09:53 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31ebfc37202sm10012289eec.20.2026.08.13.13.09.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 13:09:51 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 41/80] python3-m2crypto: add python3-wheel-native to DEPENDS
Date: Thu, 13 Aug 2026 13:07:55 -0700
Message-ID: <20260813200834.1302829-41-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260813200834.1302829-1-khem.raj@oss.qualcomm.com>
References: <20260813200834.1302829-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 20:09:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128985

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

Note: this alone does not get python3-m2crypto building again; it
still fails separately because its SWIG-generated bindings use
Python 2-era C-API symbols (e.g. PyString_FromString) that no longer
exist in Python 3.14. That is a distinct, pre-existing issue that
needs its own fix.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-python/recipes-devtools/python/python3-m2crypto_0.48.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-m2crypto_0.48.0.bb b/meta-python/recipes-devtools/python/python3-m2crypto_0.48.0.bb
index a94c3f8d33..96c8a8797a 100644
--- a/meta-python/recipes-devtools/python/python3-m2crypto_0.48.0.bb
+++ b/meta-python/recipes-devtools/python/python3-m2crypto_0.48.0.bb
@@ -13,6 +13,8 @@ CVE_STATUS[CVE-2020-25657] = "fixed-version: the used version (0.46.2) contains
 
 inherit pypi siteinfo python_setuptools_build_meta
 
+DEPENDS += "python3-wheel-native"
+
 DEPENDS += "openssl swig-native"
 RDEPENDS:${PN} += "\
   python3-datetime \

