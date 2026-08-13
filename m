Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F704C5CFDB
	for <webhook@archiver.kernel.org>; Thu, 13 Aug 2026 20:10:51 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28167.1786651850871702343
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Aug 2026 13:10:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ZiJmk9Fs;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-38511175ad3so250451a91.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 13:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786651850; x=1787256650; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rcGJU/jYZUyLN0hygPRMHvUfmR0fDeSJcXBs/xPMnqM=;
        b=ZiJmk9FsEyIuoqM5Ton50gTjSsFyaGSV3Khbrlu5eKTGtAXpZMrzaH70JlCD8Ra4yy
         CKIODC+sJlNtLzTZGSJvA+ktmhmIRTn5/BTpn+eKn0qbULjG00XLwh5JbqfxjLZ9Gn7d
         rVsn4wgPKzVx2Yu7mVeogXGAh8FDjg3kTUiSwuuu7EK9ClelqDgSNf/Bt3hLWn0U8spd
         hLAae96cGM6it31Wk48w9gZoiiMkC3z9m5GleOvJTLRdPIpA/xG7SGnFFiWpZHFsevnE
         CA6lh3jnYx6oUPVR2j1fVFX57ErIRy5HhuszxKQTD+b19SUZgcLfQbDtWKX8fyGp5wjB
         CBXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786651850; x=1787256650;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rcGJU/jYZUyLN0hygPRMHvUfmR0fDeSJcXBs/xPMnqM=;
        b=cla8nNqfdz7oZfgA5l8bMJ4GCCWzYmpKLhVbycLJ3gp/VOUrXd6YnOFHyNXqiCaScq
         II2jpI3K6YlBxQRkNKF5O6l0RHMeEVNlkwXRa0qM8ir9jSsrwbgYWCUHghZ1H/M9opq/
         Y3cmfkH+FC23cuEq4Tdb2QeIcw/Yh5c0pDBoGAyr9W+SPxv0JZ+2qntyW6Y5Elu6ZzJE
         cYcNnOQKFCJAhAUGt0PpObadDvtdhr7x5rMF+910aFgpIJqcYkIIEcA8HPiCeiXy5JyJ
         HGY73TWPGmFGoNDWZXwR+1toO86cy/CpnVo93e1h67rM9xY83wrOMa8rCz1+G5i8qDeA
         VaMg==
X-Gm-Message-State: AOJu0Yy5Y9Q+5+FEqgDWw3r8byJWBp53bZsETKkKK6llS4JsLx2Wtufb
	8BC0B9Z9IjR4GLIQwnCIkRcE4Lcy2tYyz8Az5JBmYo95yoRLCtEtuZXZMDpnZtMp
X-Gm-Gg: AR+sD12f0oWFXCyD98su+90K/vsOYZZyVjULieFcBaIl+GifoA+HAjkKohPwUxfgOJ0
	TvMK5UqQhcRceVqkjX6ibV641cPgwpn0Ve3NnSJ2262RiY/URP0NLdutyVpoOFjzOCS4spF13zU
	tnNmRWr9WMQkPpayX2s4tCkL+CbimB+fV61m+wHxAelZdj/ymwyNW3DrWMMzy/4LLBOw+Z4xiVI
	9x24vWpbuvbAKrNp6VG+hwPvf8Ek8nPEhhLIqcLN3Q77QqdFbwtb7E2MenrQEOoBDQ/wv96y+Pr
	aDRkumoNjEaD5SWrk+wmkW19k0fVewsEsArTtXHUTe2F59F2rz2L9N0j/DMqiLqyNWx3gBv7b8b
	e/WY8x63bFm1oYPoKaTzPch/8Px7Qo2JWFKOPNEJc6Pb9UARaCMzH9N0OhWthmpZ8N4IjOuSqU+
	6z2qkSBn/2unjTFMo9qBC8mVQsxhqm5YbtXoZ1Tk0LNvxdVkMclrDYepf2QpcyC9o9cqVJLjaPu
	s55W2IbV+3Fo9LtMFt4HLR7BaxSkoEvS76qkxsxtZWdQGVQl+QP6IJtWNw7Q2yMEkOZEw8Qza0s
	Ud+PHIrpFr/oJHGoyMV0syyUJ/fvptZXWyMySwJuDJl5IZRAaI6J3bJu6lzHFWAY70+J8wBJlvf
	QqSlfARNWd77axR+lPrDMS/IvNH38y6XQxwxwHxE8gHKQhw==
X-Received: by 2002:a17:90b:2587:b0:38e:8300:af51 with SMTP id 98e67ed59e1d1-3933b84b0b5mr609163a91.8.1786651850156;
        Thu, 13 Aug 2026 13:10:50 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31ebfc37202sm10012289eec.20.2026.08.13.13.10.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 13:10:49 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 75/80] python3-wrapt: add python3-wheel-native to DEPENDS
Date: Thu, 13 Aug 2026 13:08:29 -0700
Message-ID: <20260813200834.1302829-75-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260813200834.1302829-1-khem.raj@oss.qualcomm.com>
References: <20260813200834.1302829-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 20:10:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129019

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
 meta-python/recipes-devtools/python/python3-wrapt_2.3.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-wrapt_2.3.0.bb b/meta-python/recipes-devtools/python/python3-wrapt_2.3.0.bb
index c493f80f13..9bc9b5d7ee 100644
--- a/meta-python/recipes-devtools/python/python3-wrapt_2.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-wrapt_2.3.0.bb
@@ -6,6 +6,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=63a78af2900bfcc5ce482f3b8d445898"
 
 inherit pypi python_setuptools_build_meta ptest-python-pytest
 
+DEPENDS += "python3-wheel-native"
+
 SRC_URI[sha256sum] = "681a2d0eefd721998f90642762b8e75c2159ec531b20ad5e437245ea7b06a107"
 
 # python3-misc for 'this' module

