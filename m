Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AF63C5B572
	for <webhook@archiver.kernel.org>; Thu, 13 Aug 2026 20:08:47 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28073.1786651723944154139
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Aug 2026 13:08:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=lG3pb0N/;
 spf=pass (domain: gmail.com, ip: 209.85.215.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-c999f162c9aso120883a12.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 13:08:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786651723; x=1787256523; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=96CgsJLAZi7tybJN/gBjCZb37xDPdgX/+c4bAgRdxfY=;
        b=lG3pb0N//4UUqAhA153nPqjf0P9hJEpcSQJELBwBZWsrHMXR98x/wGlHeXJk8jCMLp
         M08dypSvsaALL/ZI/63GRcnKdP3k3Xq5vrh7tRGGqU+C8CwH+fFyEJalpQmb+50CHxHx
         i0j86kaK0AWiAv5wiKzKDKD6KKxWKhoLCNZB3Now+ZSyevtLoYCD/rrvjYYrHmzLbH13
         JE87fcYWeUGR/71BuheEF3WMf4+yqNjVYvFSzckTsRKDkytex6c8oR6rdLRIVspIEmGs
         N4paR2X4Dpz+Um4LdHIFh0XnXB+EUWLxngDRQ4/u/9rjlZIM/Hihd43sKBatza3lczjv
         cihQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786651723; x=1787256523;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=96CgsJLAZi7tybJN/gBjCZb37xDPdgX/+c4bAgRdxfY=;
        b=gvfFpu3XlViHbpFnEJTgECrhEFbL+4cbBhx69ssBAcyu97+cRyFTbqyPj41lwbEe27
         MLq9h1ByeXq1L2Af/th8CVBdaLkeJKkEzUbV0DP8ewSGBQzHDsWDJLH2AhMMJzvLxugR
         /+EACW65oem/ky5g7rpIaM+pOKyW4ZooCu4w1F1CX8CiL6jnummKfLX36m3mNl8dJx3V
         nXG4Ocs4l1Yynd+1ABwjFDcrEVzw5d/89MxaeVuTwbYgkNfeQLtVHmHn8ul5csaTj5u+
         vXuJZrHSbJf/vYxtU1brWOINQy9cXYwW1aWWAaCezopsJ8MXbkucYCo/wq7X00JG7FBr
         W3Nw==
X-Gm-Message-State: AOJu0YzgxKy0qlvZeYCLCfJIzV8NMKUhKErO2wPpHJ8vOjEmV+3UTydC
	rAUZxrToCWMTWy4Bru5MS17gxAzB7DnQeQOo6Rm99voqhLWnRcnfLHRbQodJG8Ck
X-Gm-Gg: AR+sD12mFVlWKt0sEDfw9uulGWXnBQuYQOS/EcaoDn+s3NtlkJh2t3wvXbmrkFG5qtB
	bJISt2vrc4NZY760B3bUBX3Vqtfrlhe5A2OkuZ0ow+okVTcfSzdM7+L5hspMgsX03/Gx0guvUbv
	Z3yjcoM5u4GYfZ3r1D1++UTdoaQB0dYBz/XcXLmqPuolr0mW/YHuWBUVsxWpkGNP5GqAAoDKQGG
	eX3bfMKewCd8+feL1SWmOVFdVtlNmSaerQ8SwR1OQ6xrzB45tNp2FpsdhrWPnmRVAwBMQbOTZ9C
	NO/I0/mLN4IAozTaIEVcOlD8Dn+cyU0A9uEOWmTzVy395lg1NxKHBa1LcNkvzGwtgqdHU3dMOat
	2xBDyG7W1Sv3dKpJcgyFYlgZ7qE0H7A0q2mV/7MqJsUHh/QBgtblv1JT2K1FNXR1jFayWPbVbSd
	xyEBX6sxwiDW7ADmtSRtq2Q//iVg+HTyXvHD5pn4bk1XIfMBeCqQEUah6GW0UGqIsWyHmgDCHjN
	5LYPGrI4WsI+9JFxiABKuCVKPErQ4JN626LYWqT29bWBABXtvUReW3fSNBA2tVaaR2zDgk9K1Ia
	FmfFHgK5Fywm+T+WuHFPjxxKhMYmTYkV5akd4PXuHWVSMznmTnzdYphr4N+ErQTwGueN0D/q6sS
	VQHjZW8umgbp/Ip688cuzziHLWzgiovBhZbIdM5UhDq/2QQ==
X-Received: by 2002:a05:6a21:7111:b0:3b1:882a:607b with SMTP id adf61e73a8af0-3cc71d24898mr349043637.22.1786651723008;
        Thu, 13 Aug 2026 13:08:43 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31ebfc37202sm10012289eec.20.2026.08.13.13.08.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 13:08:41 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 02/80] b4: add python3-wheel-native to DEPENDS
Date: Thu, 13 Aug 2026 13:07:16 -0700
Message-ID: <20260813200834.1302829-2-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260813200834.1302829-1-khem.raj@oss.qualcomm.com>
References: <20260813200834.1302829-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 20:08:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128946

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
 meta-oe/recipes-devtools/b4/b4_0.15.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-devtools/b4/b4_0.15.2.bb b/meta-oe/recipes-devtools/b4/b4_0.15.2.bb
index 002f6ccfeb..3a6fd79615 100644
--- a/meta-oe/recipes-devtools/b4/b4_0.15.2.bb
+++ b/meta-oe/recipes-devtools/b4/b4_0.15.2.bb
@@ -5,6 +5,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 inherit pypi python_pep517 python_setuptools_build_meta
 
+DEPENDS += "python3-wheel-native"
+
 SRC_URI[sha256sum] = "b815f2aed2288718cfe2a14c76421a00bc4f0918ea32b45dd1645c999fdda69d"
 
 RDEPENDS:${PN} += " \

