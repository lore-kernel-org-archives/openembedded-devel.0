Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E681FC5DF6D
	for <webhook@archiver.kernel.org>; Thu, 13 Aug 2026 20:11:01 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27843.1786651858831332297
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Aug 2026 13:10:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=VOQHziQZ;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2caed617615so4597405ad.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 13:10:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786651858; x=1787256658; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9aHWJzp9nQpvvsGwTaxfitaEj5SHsnlLvuFlff3YJcc=;
        b=VOQHziQZZYKPRuYSiRclNbudf8PBzPp68QiPGainv5h2VEuXwk/pW5QvGbbIpt27nd
         E5GxgNkO1sTnfYrAYaJEXkWP0iQi29HlgGfmY5s0VNIu92NuCiGNsxZXHffmszayXq1G
         Ec3SimFY9GvaQYWo4bicid6XT9p6I9ZAJr6IWUGyOc0vZsmzACifGnQJqKIRSDdQv/Ck
         85eHYsTUalBE06mP3bzMorz16h3HozlJH7QK69IZbgjgquAtlkRsGP8UHz2K0ZJLYq0B
         AVAxSqLc80XPAoLUysy5j+Cuo8jmuwzfyUsznG55iB+HIQ2a+kfnmUtjIG7hCMR9PqH3
         QMXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786651858; x=1787256658;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9aHWJzp9nQpvvsGwTaxfitaEj5SHsnlLvuFlff3YJcc=;
        b=JPYLMVwssWrs3mwkXO6GF22gPobbrzNdY3NU0NaSVcPSlfxuckWSHJinEBstLOVQc9
         xcYsQ2yUrboGbqePCWRZN38ixU5rB/mPsTPtdDT4F5MVAvNLrP1re6IcDSRs2GSvu8Hr
         6SDo8Aaf9f5nK1toWDESfKly8dU/R2Yj7EDQyJP5iLH10My8v3FRTYnHWVCR4b2Crr7V
         3wUI+BhV6dGYFyIdEn+gUGHNRndpLiXYQ32xGU2/miY6yzGGuYcbrOK+o9hs4NOkZm9L
         yOjjnMwxQ9LMwvF+C/Llqr9KIFaW+jjqhNOnUPiqUpVHL8J54tckWhoCdBzGC1Ldv/c9
         l68A==
X-Gm-Message-State: AOJu0YxbVQ3lAqRhvDmU0UeZ8Vvg34JOWR3NztmN/dAcpBKfSz010RpY
	lWdCSt7A+YL1gH46oVudWvvIewYbmb/cPCWuwdwkJjdgBeYAnQ/L/3ZFE2PUjreN
X-Gm-Gg: AR+sD13OOpcHYBU0aHifDQKAv/sQdpBdBLInhOCH9SDId5ygx4xCL3YbLfq8EPmmSC7
	tRK0G2VhPALFljuvmZOQ/awGBEwxXwEGl9aPboaxIkPLVMvnY06AaacMA4a2bNGAKamRuGn29YF
	tZ7V/CWuJPYdyouQe9QqLCRn89VWTKTEqfxlwveUdx7/8IQSU6tOulh6uGgfggHlWf/wkyAIy83
	/YPp+bFi/yI/rrE974GZwtv6nDyjxLVBhjGmZZPUPUEVDs5hMofnif6UEN2nFVt4jCOB+Hp49wy
	YNy4vws59SlP2sYTKfJYO+x4zVmbSZHzJMapi0PkfOX9LmSqrMwsAbuMtuZqJxY8AXYR7+w1zLk
	H0NixZbBrukqDDsX8mcGm5I+mKCjKzM4unqX9HF4NnpP+/zgNuL1Dgjmn3XKjUUOOs14w8Ed75c
	a/9P5SJU3UdJeglYQp1lZCUGuMG5QGInoy7op7VTxQdWnVpuurEY0+hWh5tR0Yhp1IixR2Xv2Jn
	TMHvBaDDlyVQ67r6N2oZOGx0AtGYFfgl7KENTEEXTiU6iw/SFm9erRvd+gmCCTvUWFjhHn3gDH+
	yH9RrDVyD290wj51qMkSFGQKw89kIYRNGvfSXFLNTgY1/SR1qUYQy6/y1d2b1n1ODF+dN7nI11Z
	HopNSBp4bwHux+C6v61KUDZ+G3XDTPpqlM/LFjFClYXTr98D3JbP6HKCApA==
X-Received: by 2002:a05:6a20:3d1c:b0:3c6:3c5b:f2e3 with SMTP id adf61e73a8af0-3cc72086fafmr223259637.33.1786651858125;
        Thu, 13 Aug 2026 13:10:58 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31ebfc37202sm10012289eec.20.2026.08.13.13.10.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 13:10:57 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 80/80] python3-gpt-image: add python3-wheel-native to DEPENDS
Date: Thu, 13 Aug 2026 13:08:34 -0700
Message-ID: <20260813200834.1302829-80-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260813200834.1302829-1-khem.raj@oss.qualcomm.com>
References: <20260813200834.1302829-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 20:11:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129024

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
 .../python3-gpt-image/python3-gpt-image_0.9.1.bb                | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-extended/python3-gpt-image/python3-gpt-image_0.9.1.bb b/meta-python/recipes-extended/python3-gpt-image/python3-gpt-image_0.9.1.bb
index 33bb3deca8..4255de4199 100644
--- a/meta-python/recipes-extended/python3-gpt-image/python3-gpt-image_0.9.1.bb
+++ b/meta-python/recipes-extended/python3-gpt-image/python3-gpt-image_0.9.1.bb
@@ -14,6 +14,8 @@ SRC_URI[sha256sum] = "07363562ec1cf5b50319ad0389486b576ed43c4682a16a8286822af9fd
 
 inherit pypi python3native python_setuptools_build_meta ptest-python-pytest
 
+DEPENDS += "python3-wheel-native"
+
 do_install:append() {
 	rm -fr ${D}${libdir}/python*/site-packages/gpt-image/__pycache__
 }

