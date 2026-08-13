Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DEC5C5DF6D
	for <webhook@archiver.kernel.org>; Thu, 13 Aug 2026 20:10:41 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27826.1786651833857518998
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Aug 2026 13:10:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=pAJ6mv09;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2caed617615so4593375ad.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 13:10:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786651833; x=1787256633; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gD17aJfRqgJSq6hcPNBQg9aZRx6BqQAyXrodsgMKh78=;
        b=pAJ6mv09jYxXWxxSaKoWor7yr2/P6qxAEAW+NDn7NLadHOn3lAJJ9ougJwWoD0Npip
         kXeFTHnlXiL8uHNFuBPSOJe29ZGGCFsk//K+933dK1iTL/qZAo018ocTxENAy3ZA+lSJ
         maqGlwGRyj17nRf6KnPWd+IB5ZDbpIXMn5p1u9IxZHRDGFOs+lvXv3sPKoz+zDosm6YP
         f/WpAJgB8C2Owg1Rz6zIehL3T4rOd2b5Is36vqtW/7dXUCFEa+/KWHrZ9i1jUHoFtPZX
         O8aPtMU12Kh53PvSK7l8PDChThbQ2rYh09bdECOU/M54qGdTdpqK7kbwzdofdxnUUPg4
         2MeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786651833; x=1787256633;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gD17aJfRqgJSq6hcPNBQg9aZRx6BqQAyXrodsgMKh78=;
        b=Xd+WIAyBlGLxa3n/FRoNqS7ZCPd4g9AQArv+bayjwVgGbEwKfF+x2Ea4ootTi88uRp
         Dfd73KYnJCNcqKcE4bicG1/L38sfNn6cdqwmZlUzw+Mc3CXw1wWknZU65PXUKxetlE0T
         aQvS5PUqFG6slWqXwQgMdXy5lJEgJWXQJ4FR+LKRJ+dxjtuJ5egB4yYgqWrAdaQLWD/U
         RRAsDsv8XMH7y5cxL6zHkoWgaBVynN71kLbNQTxmOOph6Z8mu3V//SCARotL9sl/6Lv0
         1mrylNzr08lal6+/ne76hu5mXRYwJ6Ls4zFSsNkAxPW3LQ+mdPwhb/dhbZvBBMkG3jQi
         DQlg==
X-Gm-Message-State: AOJu0Yyf7zqgat9IQAds+veog0ee9l+/N8DDY6iLLweg+lN2+l8EFhgX
	POHTjZZuCbIs4om6KNG7YeHkFT5HPshD2Na4mm2A/WDR4EJgKavX3Mg1hUNV5kGF
X-Gm-Gg: AR+sD10gP5oHoXOVBkkin5dEKusbQjTximL1QBEnh9rqc557dWMjrn82vhYFmvGFHVw
	HzYJLiuyCSULzd+7VR9EeEk0tC2hP3QnxF4lhMtQCXXxFhunyjftkKFUoSro8cNTXMDns9jH+4O
	TPxU3tV1vrqQdx2jowiCM5dQa3DlnothL57zR4WLsevDiFzmLE5mnr5TCXhISjxHJ6zNqvkfKi0
	AWLBH6wLhIdxf0nmIXe+9gWYFJFLeyYLPJUOcMhehUTr8tCtk01LUSNV5pKs0FvDiRs9ht00QA0
	tnvJ8wKVmwYVk6rsyOZV+G8uvtAK0fdiQuisZPByIx+7DaeIoW+JizQRA3LbCMxAWwKZ9tTlP0p
	T4Fi272DKqtup4L1tg+eoeeqiV/tDuUXb3J7ZfSHrLKhx5NxvvZlauYP5eb8+LUDfpsxATvxmB/
	1tflhAOWATyJ9IdpRCUYUw+2UJdurnIT/t3FxVYrXPiSgAyMr6/AkVOCA9b7pkWpGAszmG3pjb/
	kPN7pI4+uazfbGcCjakRNnwM9+vQAZJA7uTRWpA3Fmmk/EXE5NHC83YkuEbkte0LYopnhq5+hLA
	m1V2pssyyZ5AWvF1vKpM8UD6M6/jeEm3+/ZEoKlICGjSsf7Ns+NIN+JD+UGXhGqsCiBFMiu8Y8L
	5IpOqzuxsho+1oN+RudtW+4v4d7fm/2pwVZf4FLlz670OZg==
X-Received: by 2002:a05:6a20:728a:b0:3cc:51ff:c2e7 with SMTP id adf61e73a8af0-3cc71dd8814mr224949637.10.1786651833161;
        Thu, 13 Aug 2026 13:10:33 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31ebfc37202sm10012289eec.20.2026.08.13.13.10.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 13:10:32 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 64/80] python3-rstr: add python3-wheel-native to DEPENDS
Date: Thu, 13 Aug 2026 13:08:18 -0700
Message-ID: <20260813200834.1302829-64-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260813200834.1302829-1-khem.raj@oss.qualcomm.com>
References: <20260813200834.1302829-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 20:10:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129008

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
 meta-python/recipes-devtools/python/python3-rstr_3.2.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-rstr_3.2.2.bb b/meta-python/recipes-devtools/python/python3-rstr_3.2.2.bb
index 1af7a3bc8f..01c27127a8 100644
--- a/meta-python/recipes-devtools/python/python3-rstr_3.2.2.bb
+++ b/meta-python/recipes-devtools/python/python3-rstr_3.2.2.bb
@@ -7,6 +7,8 @@ SRC_URI[sha256sum] = "c4a564d4dfb4472d931d145c43d1cf1ad78c24592142e7755b8866179e
 
 inherit pypi python_setuptools_build_meta
 
+DEPENDS += "python3-wheel-native"
+
 DEPENDS += "python3-setuptools-scm-native"
 
 BBCLASSEXTEND = "native nativesdk"

