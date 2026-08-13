Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CA81C5B572
	for <webhook@archiver.kernel.org>; Thu, 13 Aug 2026 20:09:07 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27763.1786651737490394438
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Aug 2026 13:08:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=JTAdGKGl;
 spf=pass (domain: gmail.com, ip: 209.85.215.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cbedda4c154so184655a12.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 13:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786651737; x=1787256537; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C/obM0utgvWJhWcZdlb/3LpoZOuqxBOjmiF4d7IoUWw=;
        b=JTAdGKGlxyvwYE5OYdlixT4bO0AxMROa9/EjeR5W+wIHdC/5ZaHOjFrAjQ9dkjxCR2
         z55fkQ9gOLTVNVB9hGbqbQs3stiQ5pGv9YRCwjqP8q9f22gVykz644GRANJ42GQyuLZ2
         /MJgU3ihCKQI73xvQlfMSzikE0/9Foyt0ZPsR0Wd6kjpQFuBQCczAmJTxGAkY0qqiLPy
         rDUxeBnVY+ejHP5oLK/SISZQ/1l8QPjDCeEn3vJncDub5xu37dZ9X4yVXVUOOa5EOI/W
         ORDn+fBbbYVE0EmVv3jXVLEiEAya1NVXUZmNxAw4JHob+x9fV3pv9Jkz1y1UXujJQ47J
         RXpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786651737; x=1787256537;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=C/obM0utgvWJhWcZdlb/3LpoZOuqxBOjmiF4d7IoUWw=;
        b=FlcCOTeIWyJbwce4rQ7P6YFCpitnolGwOuwH3JEGTT3y07/n5lqtpnUnkAGE4Y4vLF
         NWhJEd1wyaDZYZWALBv1rAWovoNult3nK9zAo5ZJnmPdPe5bIDgidCx+GHv4KB4YeCuX
         hpuDHFrjv2js8Onv47aMdTWsbpGiQ1n3hJ2SIcNdHUs8qW1pBcwnAQTBQLh19+vWrnS8
         EZBdXse6hbCunblB9h9CkBXFxTUYbUbptbPk6CYBDpLPkFuG6hESr3yJrjTVYSVOngXU
         Cz94KDcht8N+mg0ztJ86xHXEa8VOg3N5zUQy/7vM5JsuG22SvTSdy6uQuk0ATScZ04cK
         wD7w==
X-Gm-Message-State: AOJu0YyGyvFD20n2uxVAg46yv60Ch7cIWIjzoPobVm+7OaUKpwTw/225
	hZQd5FAGaNfQjur0UUND2pw/NGm6cG/AD0Nh8uPtOdBJTfRYANUVnqLNScU4VOT0
X-Gm-Gg: AR+sD10O5ynGMie1yCs4iRaKilBLKWrLmC/1cM6CwPD80bklm16nKsj6N+2xra4e3g1
	YGmHzf/gS1ZEEGOskFR2agoNSmIAEmimJf0c1Hii74PqdDlx2HjqvqjEdkP4+eObX78VdnVCSyU
	T6NNX6wGb6scK6B5RIoq7aNcDpOHlS3pwn0BGQ/g6YRO73IHK/zqMKvpecKuF7LbzsQx5s4i8eO
	5U1wlmEPz/luMI/eTkkHWXG5VYwFbPok7J4Yu/Oo+pBT0b6rZmBdWOehUrP0msjxIjtGzGNlnTX
	2M4e2AVu4wX7RXV9PxhlF4X1Zl2N/RdsjOQvMCMkKXa3NkqxOQJa9ZxohekVRdgz86ILahxLsZj
	7IdQ7RrvLJ6yxQw6iRgwgFHOBpIfYLZZ1X0HAJE99X01lUbzYBwhzOJodZ3ZVl1ti9gtaUUwzv0
	s1gd/9FwOjmiIT/vGOg7ME4pinUbYLNSPGasIYeV23K98M/5EudzUXFwSrQsZo1QV9SSrd3TVHM
	OtpXRdfhyyVufZVn7YmLvfTgjpRefAO8QFNR/pnSNoYjjS4voGldEVAQqgy8Ex9WeORhp9dKSN/
	R5EXmVxdirQ3gaLRNcMpw47ELZN/gYNlLMKTrQ8p3Olx/uNQbl5pH3ToF6ZOMrF+pm8yfM+ARUX
	ga6yr3Rs0qfH5uaSj3rHDifB9h9EeurefTJcXQQIzboWV3w==
X-Received: by 2002:a05:6a20:5491:b0:3c4:2fe1:fa36 with SMTP id adf61e73a8af0-3cc71dcde36mr332466637.36.1786651736730;
        Thu, 13 Aug 2026 13:08:56 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31ebfc37202sm10012289eec.20.2026.08.13.13.08.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 13:08:55 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 10/80] python3-behave: add python3-wheel-native to DEPENDS
Date: Thu, 13 Aug 2026 13:07:24 -0700
Message-ID: <20260813200834.1302829-10-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260813200834.1302829-1-khem.raj@oss.qualcomm.com>
References: <20260813200834.1302829-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 20:09:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128954

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
 meta-python/recipes-devtools/python/python3-behave_1.3.3.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-behave_1.3.3.bb b/meta-python/recipes-devtools/python/python3-behave_1.3.3.bb
index 77bbfde7b8..9be8f25b44 100644
--- a/meta-python/recipes-devtools/python/python3-behave_1.3.3.bb
+++ b/meta-python/recipes-devtools/python/python3-behave_1.3.3.bb
@@ -10,6 +10,8 @@ SRC_URI += "git://github.com/behave/behave;branch=release/v1.3.x;protocol=https"
 
 inherit python_setuptools_build_meta
 
+DEPENDS += "python3-wheel-native"
+
 RDEPENDS:${PN} += " \
     python3-parse-type \
     python3-setuptools \

