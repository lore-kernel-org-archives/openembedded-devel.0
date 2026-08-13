Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC17DC5B572
	for <webhook@archiver.kernel.org>; Thu, 13 Aug 2026 20:11:01 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28173.1786651857495043501
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Aug 2026 13:10:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=qfSKfBPk;
 spf=pass (domain: gmail.com, ip: 209.85.210.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8487b7b3fc8so161095b3a.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 13:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786651857; x=1787256657; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9aO6ZY32yPm2bVPq2MCNZgs39/w4NMfdXcKON6feMNc=;
        b=qfSKfBPkaOjoyK+1CgDv7ShRS2OXP22NB+GYM9IJ6Cr54v0vi/HgM2EcCoagQqvNNR
         EOYFkCzePJ6bPw7IJ0pu7ye5kZdT24ZeaQLScl9NyaQLJNZ9j9MxiaqTgu4x4WW8zyVg
         U3LfRjIIPuUGTdgZkSQpjzJbd+K0GBU/7UJo3UZyDhdMF8mfQr2CJQ0I9T3EoplGTVIX
         GgIEvMdCFwT4W8AE2ob/sed8EgKUzjexlvUTtG7rQVupt5GJDJJMLB/6kwC8QSuiWW0h
         NvPDTOClo6jrAqFjjmN4Uci3m3I/v0P0L+w1/ruVVFelZpo5Y0JpBx/pdg6rSl4x6mp4
         Nu9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786651857; x=1787256657;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9aO6ZY32yPm2bVPq2MCNZgs39/w4NMfdXcKON6feMNc=;
        b=VqT9ML0OKRG280IdwICTeCLAf4s7ZwrebbHPJ6Ggv4r/0AxI7B9uZR5GBVwIvvOqhQ
         GOB8tADzwkDFTjF2it95/2kP0A0vvQ0LSTEK2FPF3pwJd4AuEumWaknCIoaEUgm/Dgf+
         tTC4s+IjPfnsiAuQxokEhNAY/0fJ/Ua9RqocoWOw2rR4tRiNAdDMXEBHnCJSzd/g7+XP
         TArbh8STSD6tzvf/26skWFu6cSkUPhmpBsQ2uOWkuoj5VjgOkmRj6FBx3393lY45yiam
         rScxMk+JlyiXtgEREL+FhW2JMXmhALHtojN3Bpv0O+ueuOBzLvAiNmmIzFJFTF4LNNiE
         4tCg==
X-Gm-Message-State: AOJu0YyNOM8IQzfZfLMEHnMrQvhquIt2PFwYM/2fEZBqU0Fj3BBJg+4Z
	/izMhAF7/6CyspMq1G1SrkdJbx74vzK6ESX8GOC7U3XL959hZ0lc+rT9CsFZCCmL
X-Gm-Gg: AR+sD11E5/VCesiYF6vtHOTkz968oNlKciq/mCHf746sNz6fJIwCbyj5ZFbWnjNuqjF
	Ne9vgZVw3UFuYxvyY5LmgWIOrLobRuFOJJx1dV1JzqyqnAZzpced8iih68W72FD67hHW8IhsgEW
	7j9BJDSkkGXjm/4vHHfaYgwOKSsNs+Oaam/wj6iTDqdRzu5IKJ9u9E/6lyYuN/RuFIpsadzbDRU
	8fPVALzBIXMSQ1yOF4v0tk2aiY3GQAVrlNOMVu2Db2FnU3b6LCKrSvUzfEtbQTSGfJGSBpScBe9
	/q5hySMtQb0+Qsx3Id9XGdwbmntEaxsykdqmpN5MEqmiFERnw9n03m2c/CuC02X3P6mXmd9R3/Y
	7UeaKzyFUCud114khV5kGKH41eubvSyp0wXcBpc68Lypf6y0cvT1tzXS5q0fwqWrKHSgY7+yULT
	AlZPHsBR8nhdHMFmxOKkwDB4L6S5teT4O25hwfUM9+d9PlD9MBPJuO2q65HYqkWOKx6maWb32R5
	CVlwCzSNmWpYVH9zvXPgp68PDkH0EYuHHnijpcLLoo8vvoTV9To0Uf9v6tWiVABP4NknMZErfR5
	TBvuI93BGQaz5Nh3EgZ403bZR7NF1/DGGz/fG6DJM3xMUfF7uZvnlBuTrjaZtWLM4xMDrnonUKK
	+u5OV+RptPxGMu4nYH63PIef/tcIYlgwVbIXZZAzs4u85rA==
X-Received: by 2002:a05:6a20:431b:b0:3c3:a3fd:db0a with SMTP id adf61e73a8af0-3cc71ba62bdmr342755637.16.1786651856779;
        Thu, 13 Aug 2026 13:10:56 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31ebfc37202sm10012289eec.20.2026.08.13.13.10.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 13:10:55 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 79/80] python3-exhale: add python3-wheel-native to DEPENDS
Date: Thu, 13 Aug 2026 13:08:33 -0700
Message-ID: <20260813200834.1302829-79-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260813200834.1302829-1-khem.raj@oss.qualcomm.com>
References: <20260813200834.1302829-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 20:11:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129023

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
 .../recipes-devtools/python3-exhale/python3-exhale_0.3.7.bb     | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python3-exhale/python3-exhale_0.3.7.bb b/meta-python/recipes-devtools/python3-exhale/python3-exhale_0.3.7.bb
index e0e30763d4..01c5566e0d 100644
--- a/meta-python/recipes-devtools/python3-exhale/python3-exhale_0.3.7.bb
+++ b/meta-python/recipes-devtools/python3-exhale/python3-exhale_0.3.7.bb
@@ -11,6 +11,8 @@ SRC_URI[sha256sum] = "752a96d0a59456511d933311d4a81f642cd668296eacd2561905727d5e
 
 inherit pypi python_setuptools_build_meta
 
+DEPENDS += "python3-wheel-native"
+
 PYPI_PACKAGE = "exhale"
 
 RDEPENDS:${PN} = "\

