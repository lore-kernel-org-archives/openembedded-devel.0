Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A93CFC5B572
	for <webhook@archiver.kernel.org>; Thu, 13 Aug 2026 20:10:09 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27806.1786651800748508030
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Aug 2026 13:10:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=BomTIatq;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-38dd55ad76cso187801a91.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 13:10:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786651800; x=1787256600; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Rf9o+y1XCtz9dhLQmy7gAy0+FV575wgmj5nOKRoo5IY=;
        b=BomTIatqjKpaLdmFyHmH28MoQ3V3hbcaYdHiVyaG4Es2KL5uA3zRRkjToBc5eZ8FSW
         vwhUC2FFLUhOJ6N7pREgaxjgIjPPTR19iUDdlKT/yjThPmkyk4o8eGVfbBb2SHf0xHyy
         POYjc8Jms7KpvsExMY/A/xwaV5jjVb6I5R6vDyiGsrpuR+GWFTDsWaimpBJJvigv7veT
         k7oTuq7uusY+DFI5sLO/7DYIYV21QHNE0eLYy3LxFz2VP39dIQh3hmFLfp6g410H0LJ9
         0vBerOQZgxNvmUOsUYQNw4txbv0ofkKS1NWIsvZaENtQRre6h+7LUUiXY1mptMAVR3XJ
         drYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786651800; x=1787256600;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Rf9o+y1XCtz9dhLQmy7gAy0+FV575wgmj5nOKRoo5IY=;
        b=MhOR7Q584mUhqs8F2eZBA6+h+PlRxsQVP7mE9xArMUZKrn1ab0X9DAsnFFMrJgceP3
         OuK3sVnR2fUkq7FQfP7q3HqIrrrV3iLy92EPBZK3E15StX0lYbdXrMu4stEkjS9cv7ua
         Evgo1Lr9U42dz1U1TgVXWfp6F1/qOPI5BgdMD3PumtDPbbJdJ+e84Ts7KLCu+pqBBiFU
         t8UY3crnn3689kGc7ozLRy628q4HYUZkUsUQRu0peifhTfaysur+5XK7Vjuo1EzSUq7I
         f/0jufOHCdEtq/s7RmpPI2klAZUcj8o5YkGcQtHvGjgjzsgAXCl1DiNV7RuxsyqsyT8m
         ickQ==
X-Gm-Message-State: AOJu0YyzsU1xHJ3Muw6zfUkZvbihaG//LgydKobft2OXsw40eB/UHT8d
	eUHBdzyMmqYl4h9Krelr++FtPttc7fdui3iVHWceq4lWXUM8vxgFtoSlEgd0Y56K
X-Gm-Gg: AR+sD11yK8GHSnxVQlQaLuOTF9lak9gK/Zr7scfHdzalfY5353TbKVQbMustg7vpt1I
	rNOGSRVRD9b1mz8FrWEiFlehGyljXrki6EGgKH1KMAcwpgBXFi7OGquyZnTBpzxGw6U1fxYef3e
	1xzeRXZ38YBobg1KPXuRQQVCwL/IimIk4TJYJe4ap/B5r7i7OB7r1INjeqSr2VKtrr198IgIbfb
	Uhx7Pz0p6hwB2PzFiB1zDpMBO0lFr3J/s97wh7CnDFRxoT7p3BqC0rAQvQNS9TVj3LOHPjCHUQp
	tgC3jFyVR3L/cs7ToPrGRoNAbeYcwla8/CwZOgckoAMNcLaXms0PTU6XSLLf/HFxiwejPaZBChT
	pleiQTVvE4/qf0JHe+pps5ZcG/5klUCLJtgb7CxsWNVv6WdSpLdbcIIh7sglRlnlrmvm+TPR6Va
	3W02J1aKR2oJunNbTtG7wu7A+H7kTyoerxXg6qj5/xSIz+Njul4W3pb0h1is8IsM+LxF/SKwTHT
	vz8ctlchBcqlRfi8DEw3M9Ngaumbz2o6JSK/6bFGyABVucVM5kzDFlNg6fjtcIW8fdjkvOAmr2u
	4uL9Qx92QBdHCDl0glOfTpDK0SIaa9Iucv8lfNs8CaF9zbL0CXGni/obHOjIOLnlYfsKNNzxJK8
	qdHuhT7hevEOJUVFsMRxUYXrx1rFbXgqcMcQ3B2UB7jWQXg==
X-Received: by 2002:a17:90b:5630:b0:37e:1620:dabc with SMTP id 98e67ed59e1d1-3931f24d641mr4978705a91.0.1786651800015;
        Thu, 13 Aug 2026 13:10:00 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31ebfc37202sm10012289eec.20.2026.08.13.13.09.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 13:09:58 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 45/80] python3-nocaselist: add python3-wheel-native to DEPENDS
Date: Thu, 13 Aug 2026 13:07:59 -0700
Message-ID: <20260813200834.1302829-45-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260813200834.1302829-1-khem.raj@oss.qualcomm.com>
References: <20260813200834.1302829-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 20:10:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128989

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
 meta-python/recipes-devtools/python/python3-nocaselist_2.2.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-nocaselist_2.2.0.bb b/meta-python/recipes-devtools/python/python3-nocaselist_2.2.0.bb
index 744c8312be..038be6c73c 100644
--- a/meta-python/recipes-devtools/python/python3-nocaselist_2.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-nocaselist_2.2.0.bb
@@ -7,6 +7,8 @@ SRC_URI[sha256sum] = "b06b3d6fec1abc05c607aa8e813599388727a08e18c223431d7469cf6e
 
 inherit pypi python_setuptools_build_meta
 
+DEPENDS += "python3-wheel-native"
+
 DEPENDS += " \
 	python3-setuptools-scm-native \
 	python3-toml-native \

