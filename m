Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77A49C5DF70
	for <webhook@archiver.kernel.org>; Thu, 13 Aug 2026 20:10:51 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27834.1786651845055910235
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Aug 2026 13:10:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=mbXLZBSc;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2cc73e322dbso6264555ad.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 13:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786651844; x=1787256644; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1YmQqnEymQdBu8DA6nON9Z5wZDIQvAchk64b/MmB5Zg=;
        b=mbXLZBScn1TxM94bhv9tn4e+OI3/iU2S07VedRXtmcRWeEmraeIWK3VlCoNXeZmfDJ
         5KDkF5IvFsVqvV5aJXT+qP5HlYa4CWFwTGr9/htIoGJ1u4t5v8N/fuUm2bOgkYrlcZvE
         kK3LWsMJKibXUgyvM2Gldp80VdT0wTQ7nhehQi9HNeyjgce1YBWicozBsZZLYEB4suZd
         EISfdiM47Qalli2zzRGqeu6Xp72J3gufCztRrdzx1tR1vnvJ+f5KmAsm6XUfVGCIf6uU
         tdjjJBjqJTmAHFOU5+fiUKB6mY4XoJxFrZC72xvxW+1Q3Y5k3N/k512EctYDYTJqsdSX
         rlUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786651844; x=1787256644;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1YmQqnEymQdBu8DA6nON9Z5wZDIQvAchk64b/MmB5Zg=;
        b=ILBHs7Z3UJ0rKg1gVKAkivyZ6+0NJ/rSBTZCb2ee9uRRdcHUcl0v1Ftwp1WSQsY1nt
         y1KB0U9ytF7ke+yj1OtOENAr3YJ++2QZOvkJMak1g9glp22e8qp8tWZ1NBjI4PBlghGh
         YxYLhgQ+3uqXPgFoIT3DSFAQgWb4knf8rXQV2VbG+PP6HwGxnBDIMbr16YCdNN/zvHC2
         viyv1OjhAM8ifsk/xpdqHpAOKA87dlkuTMdeDsWr0bkGpFmXSA9HsEIY7AgvNUCaJrRz
         n1pQttYw9vlJ1/EJDsP54rQgOwiElZIg7EUrBgkkshm9ymuGgpVQfO10EaJyPu5yTL2o
         aPVA==
X-Gm-Message-State: AOJu0YyWvkca257Pvk7a2YFGcDoobMe+XMfjaW46NzrnAP4yPLcveoVO
	kAbuO+cSAgTSGW2LGv1+rsUE/fEs3ReF5ym0UYMCOano2UlhWWIinIwf+fAcWTrF
X-Gm-Gg: AR+sD12IVZ8u2ZsgdzVNVwmTO0Xno6WM7WsG0fR23jWGQdZ1Rk7g7Rnke9ajbMQqlzV
	NeIP7c5ecLnLMuZ0moEYJOXaqe6VRRCWUhNfqwz8/wbauPxidl7fj2jLDVaAhDh++VbfBrlZg5v
	D8Jh4v9w62ywTSa9u/VbOBlHfbiLZXAODAhVwY4c6efTRWwQDzMKaMCT7dQJAUjsHFs04xgEk/M
	F0dSB39eA3AIG7JTsg3jJupgZ3XKDeu3vjZuFEePD+D1vRtXuUMccBNZd+VyfT0b2AvSkKdbWxs
	VDzAoVk2tu2HdADs2NuI/seXgwr3kChcTEv8KaX8xOQv/B05sCZbaoe7FYTQkjVbKgw7FYP6mcv
	464jxoy4Y9Q6jkRnQ9Vg7FmXuxHE6QkNgILsDiUHTVI3amZKQy7YwPe5qTWDxaOQsJIccKkJ+z5
	zUjTxDsX5oj4ClWSUyM51pJ9Jik2Ger1dPPyqbmLuLdJbkeJj53TIaaQG0yAlzjhgX3BMfSZRNu
	f2Wpwb2edDe4jZ+UaRs+lldb35M1HKj1IXwXbkMF6rnUYyPxWwvCEnggFAeuy1LcXaSkIzVpVKQ
	LR/Xw9z7UhZIGi1NUMxAvmOt9OYkw+FKpYK2NUN6B/Hvga6NlSDvijpLGOkDPTANJDOxHV73oZZ
	dfbw8QzweHA/8EpSCq1MnyTQhr4nLq/YmyDB/oi8/skUted6UNloFVQDq
X-Received: by 2002:a05:6a21:1391:b0:3c3:7e9c:e292 with SMTP id adf61e73a8af0-3cc7200c62dmr267330637.25.1786651844256;
        Thu, 13 Aug 2026 13:10:44 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31ebfc37202sm10012289eec.20.2026.08.13.13.10.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 13:10:43 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 71/80] python3-tornado: add python3-wheel-native to DEPENDS
Date: Thu, 13 Aug 2026 13:08:25 -0700
Message-ID: <20260813200834.1302829-71-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260813200834.1302829-1-khem.raj@oss.qualcomm.com>
References: <20260813200834.1302829-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 20:10:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129015

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
 meta-python/recipes-devtools/python/python3-tornado_6.5.7.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-tornado_6.5.7.bb b/meta-python/recipes-devtools/python/python3-tornado_6.5.7.bb
index 4dda1541b8..544c8606e5 100644
--- a/meta-python/recipes-devtools/python/python3-tornado_6.5.7.bb
+++ b/meta-python/recipes-devtools/python/python3-tornado_6.5.7.bb
@@ -10,6 +10,8 @@ SRC_URI[sha256sum] = "66c513a76cda70d53907bc27cf1447557699c2e95aa48ba27a442ff61c
 
 inherit pypi python_setuptools_build_meta
 
+DEPENDS += "python3-wheel-native"
+
 # Requires _compression which is currently located in misc
 RDEPENDS:${PN} += " \
     python3-asyncio \

