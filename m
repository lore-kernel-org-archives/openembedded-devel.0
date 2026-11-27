Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10255.1795752999185162369
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 20:16:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=vAYaWLvz;
 spf=pass (domain: gmail.com, ip: 74.125.82.45, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-170135e43c7so11892592c88.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 20:16:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795752998; x=1796357798; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tp5lrLHneHcOdMA0vq45mCC49pS5PXcZi0TAK0u8Hks=;
        b=vAYaWLvzoSm64sYOe56gE0pXw3HoBVxDSgB2VVma7IZctW58bKXtWsguJaM9r6GZNU
         QVRM66oJzcOfb4wbWKocB6YX4IR7AfDb8/nBVJf6WuepZTOX1Mh38wHbJtM/pAI621vb
         WSkV/B0XR171B6FbwBV2BvSjlnsq8AmPmeilKea+yEWzkKRcJzGeNYBlNAf0xx6JRj4G
         oZNiNppTM4vch1dM0gcM7aDuUyZMs/H3eBOiqe466HDE1N5n0bzIHz9IWsAZxmQWgMvt
         RUwoVFojqBzduATeVSlSLkyfvI1XBUZfFqgtgOs+bsZ7yR41z+ut/7DrAMG561XH3AWc
         s/mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795752998; x=1796357798;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Tp5lrLHneHcOdMA0vq45mCC49pS5PXcZi0TAK0u8Hks=;
        b=pU7RUmWO/NCjlx7YNYGB09xNTIRE5/kTcWZYL8ZfsWOQerVxzJNAFWle2JG5pjcf7D
         WYksgO67D556zfwn6aZcn2WUq66EPeB3IUVDO5wCZhjp1J0N4aBfGWmnVysiiKVWlfkj
         holQ2XDA1G/QT9W7x0SijRSKezyhf167QKXUk+oluwN4e2/i5OPeCIV7VwR81k9y4Qvu
         vZhRiBuKHCzRmQLiFvE7RG4RPnR95NCUN3qRxqbSr9kg+XEm6Jsj6bNwOKLYh41YXlUS
         sLRqKT650WFLhUmphlF8SoF7vAH0CWIRhdfx9c3dn5Vvfk7RuUuU9Y5S/SA1NeWMYMOe
         4osg==
X-Gm-Message-State: APuU4Z+FTcATjyE6o0ZDejYShYHo7Wfm3OI9zW1mh91lWyN+7akXUXKz
	Pd5hv3MRZbHyy0y4RbIXZchcA0KZp1fJuX5b4b2nqnRgluNpFEb/VFxp4LPp+BqA
X-Gm-Gg: AZFdTZfXux2dWouXblARIhhXZJYNZnGO+UpPO21b4b5ssv+yGMXEMt7+NPNKhu6Zk18
	6SyaBrndO0kwzXM33BjFq4zw+unqZb8p+GL5WlrgRsyHPqIvQyfMkvW+MrWiaR7XRPWV9GPX3vB
	UOiSGlM6Zq5GOP9XcypOiJOKtGZPonh2IPlyqLfa42MHwcdB+k5O782mGeK5UX2BbWNmGxgZzzE
	M9EFGlKlntuRECd/dcx13oQXmyDyoGqTH1oz5gdtay8nNdF0Sjdj+ioYMQDQq6fzj+HzaMtIzck
	ZwnwixeT7DP7He3oPEvGme1VjlAXOVNFp1zkED94egIRAh/lI5AtfqBwMtbbARl/MOYalA0Az8G
	cKFxCilj2o6MT/qy7EblDjUIynIRYi1zRkUECoNN2wHfGbiP+WqkWfY0Ss+uroydo1ZntVGVaoo
	AownmJdxhYtT/5xqAPoHIwxOB12pVFsKTGt5xL/EwNIo+EJLfJfIPqSuN5k8f9dLkA1Bt6qpXpZ
	g35+4n4LtchpnloVUdLVXh3cCpkDy3r47r3shNu039MJxcB36XBmZzhgSsgSQsnola4F3RMSo1z
	KKwmC5yMF6Brw5u43u+kqjt2+56W+AJj8wjdNrg8slD5XIlQf8ckYOdpdSYFh25MAxgviI2WvF+
	1MPT2kEjpQkXknd/514F5WPpK9aH1nI5XXh1+b2lpww7W0dMrBzQlB6PRt1mOd7LbeA7hnv793y
	xYSr+Qiiv80PL2hVejNZuob/ZW0Vgl1D3xnvN0RtVL/VrdAT0wiBbxGb9tkFrq3A/j5XLzMBWwC
	ogM5ldAEdQ8MOWN5Fl8Kgnjfv5y9jG02vPMUsIyGmCpc1ZvgMZ/yj2FIqFBQdpiftGKSk/XZere
	ATqA
X-Received: by 2002:a05:701b:2704:b0:1b5:4f6d:8277 with SMTP id a92af1059eb24-1b5568e78b1mr21892699c88.26.1795752998430;
        Thu, 26 Nov 2026 20:16:38 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5566c1142sm52062757c88.2.2026.11.26.20.16.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 20:16:37 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 19/32] python3-pymongo: upgrade 4.20.1 -> 4.20.2
Date: Thu, 26 Nov 2026 20:16:01 -0800
Message-ID: <20261127041614.1775064-20-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127041614.1775064-1-khem.raj@oss.qualcomm.com>
References: <20261127041614.1775064-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 04:16:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133238
Content-Type: text/plain; charset="utf-8"

- GridFS get_version/get_last_version now raise TypeError for a
  non-string filename instead of treating a dict as query criteria.
- Honor MONGODB_LOG_MAX_DOCUMENT_LENGTH (the misspelled name is still
  read as a fallback).
- Fix the C extension's BSON decoder reading past the end of the input
  buffer for an array whose last element is truncated.
- Harden handling of stapled OCSP responses.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../{python3-pymongo_4.20.1.bb => python3-pymongo_4.20.2.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pymongo_4.20.1.bb => python3-pymongo_4.20.2.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-pymongo_4.20.1.bb b/meta-python/recipes-devtools/python/python3-pymongo_4.20.2.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-pymongo_4.20.1.bb
rename to meta-python/recipes-devtools/python/python3-pymongo_4.20.2.bb
index bb58dd8722..fc71a2aa5d 100644
--- a/meta-python/recipes-devtools/python/python3-pymongo_4.20.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pymongo_4.20.2.bb
@@ -8,7 +8,7 @@ HOMEPAGE = "https://github.com/mongodb/mongo-python-driver"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "1ac112b3ffa3d010cfc2fc54e3ae677a12c63d18c6115db4451df64f1a1175eb"
+SRC_URI[sha256sum] = "b6407c115176d9aef64594630b8f79ea10d8a272dc2df586b158534d7e152e16"
 
 CVE_PRODUCT = "mongodb:python_driver mongodb:pymongo"
 
