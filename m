Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E834C5DF69
	for <webhook@archiver.kernel.org>; Thu, 13 Aug 2026 20:09:49 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27796.1786651786218452139
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Aug 2026 13:09:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ABukqYal;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-38dc4553f62so371653a91.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 13:09:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786651785; x=1787256585; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dEgOz6cfoNfY48UDDRnjkdHBl7VEK9qIpAZc6P7kirw=;
        b=ABukqYalhpSRoc2rPUXjPqpSn81304NqVjxt83m2PFYTgUhjbnZErvfDhHpjhOk6Ou
         JNu/sU22SK1YULsXPgZ/GUXhMz85PHsl3bBx3zYfrA7+a0SiffKeJr3sE1k+7rM1T6j5
         DkWxRFu7G/LKQL7OdHbqtP24+kwEupOiKH8kNFYru70NVF9gsJZxRyPzbiywQoykx2Le
         KYvgKsw9JCJSAeVxPGs6n+hm6XB4Nopezn9mcX+QAo7Ev9jVCU6DcrCj/oprC7ORxbNs
         ydBCzBvqZMwszuvZYJT/pDF2AfJ+1CC130IO4RgoJmWnxtRkrDPkgQ0hOy5eRhpf9xtR
         ADCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786651785; x=1787256585;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dEgOz6cfoNfY48UDDRnjkdHBl7VEK9qIpAZc6P7kirw=;
        b=flEPATwyzV8blQIPhlM23Gd9nlBKWvSjxzDuq5Ueng3UEwgJaPUFS1TncXEx7Mhz+j
         fy34DF1NME79hkC2N9BiUhCwEjHDBKjTjrxcZgIGLLFgzlu0pQfSjKb2yA3bmZxIVKRw
         XucEyRtlS7CkUoVh4eDcQ0pITxmSdHX5TALrsagk/a8xAMebij9P1Cm9ph/Zf9s3PwI1
         70yzeTXlOSl8+dJGnPPrvBCfS16F2sLRapawAAC3X/oHU92ZzyQU5zSTbHcaQke0u4nu
         30MChXME0EOpl57mh0MhsvM23pl8G1ZrF3Bqr7P3ueS7uOZzTH6iBI7wr8IF5F9KSpOj
         +ydw==
X-Gm-Message-State: AOJu0YwBXWehlxsAwfy0y69lsylHLZ6WotPLuwTbzrr3XwBaeVmIdHFX
	9c1EZMS1nUnLmmZsXe6DMnsAr41KRH8WKcDp6ZX0su85YnLh2XByn7UOguJZKw==
X-Gm-Gg: AR+sD13Kz77zwPeCtvDHhREEqHvnfleV79EGmzEb72aEyPkaQgQXFmqMhPMiqq/5y8Q
	mTn+WxQ+rZoxcwXsrT0M2LM93DckWXFVDa6wtsauVRLcdWfvIEAYQfMCRc0W+vQEXsITuoMW/3S
	FTpjf8orfy2sRDaKhfBcR0yOUaSNpdRZOo4HOfk7qGt+HAUKoqBidKbl2YkDbZ66g/ItTMyEenz
	c9mXWhBVtU5q2vO+33DZNs0IHojPlx77dshr6gyzO6NKo+25ooV0kVWTm+JkpzTch4eriTCu3km
	LNMaPDN8CXVn4L2/EOUbmrpGqtxwmZL5gtFItmIBloJ6kTc0tayXI4zSTyqm+wS3EqfJvHxQOP4
	2tKtlOCpgIQcmHaqhImHfg/kvyFVERMCmx58YmxkDLblvkn5l37/hihEeakzdFV4d0NcCpMH6ST
	53l5gGF1Oj/Ig+3DlYPHWcuapnnvsPlOq4L4rzOUnXpoSG5OwGqS3L2Ws7XXlqTGwptvOHFP6uM
	eMZdXw5Xr3ZAqjRHFV4qgB2pMY2a4PUpxh5RWgA5eYBojoHX5tcHrgNRER0cOtVEXku89aQ51PO
	m6wlhPY5GOPz+tHdVlKX8uRL7xo2Plan3lkTe1P/XJ/aUU4SNI4FlgY1gj70UUUn9pY/dZTudDM
	TJEaqi3YXj8lHZsLo9btnXf/Ita/CSQeuDwgWMnoW4NqkwYM62/2R7nXT
X-Received: by 2002:a17:90b:384b:b0:37f:e1af:df22 with SMTP id 98e67ed59e1d1-3933ba90e38mr462081a91.17.1786651785546;
        Thu, 13 Aug 2026 13:09:45 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31ebfc37202sm10012289eec.20.2026.08.13.13.09.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 13:09:44 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 37/80] python3-lru-dict: add python3-wheel-native to DEPENDS
Date: Thu, 13 Aug 2026 13:07:51 -0700
Message-ID: <20260813200834.1302829-37-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260813200834.1302829-1-khem.raj@oss.qualcomm.com>
References: <20260813200834.1302829-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 20:09:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128981

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
 meta-python/recipes-devtools/python/python3-lru-dict_1.3.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-lru-dict_1.3.0.bb b/meta-python/recipes-devtools/python/python3-lru-dict_1.3.0.bb
index 236daca490..d136dcb005 100644
--- a/meta-python/recipes-devtools/python/python3-lru-dict_1.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-lru-dict_1.3.0.bb
@@ -7,3 +7,5 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=9d10a486ee04034fdef5162fd791f153"
 SRC_URI[sha256sum] = "54fd1966d6bd1fcde781596cb86068214edeebff1db13a2cea11079e3fd07b6b"
 
 inherit pypi python_setuptools_build_meta
+
+DEPENDS += "python3-wheel-native"

