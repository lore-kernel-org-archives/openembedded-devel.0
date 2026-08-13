Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A90AC5B572
	for <webhook@archiver.kernel.org>; Thu, 13 Aug 2026 20:09:28 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27773.1786651758300978115
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Aug 2026 13:09:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=mOufvbUc;
 spf=pass (domain: gmail.com, ip: 209.85.215.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-ca7c1176317so191259a12.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 13:09:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786651758; x=1787256558; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q4sFPFROU+eZm3bCubf9VEayWKlb0yNG6Sih6iyPJ0Q=;
        b=mOufvbUcfhP1ryDPT+6WnSuTUQPysfZPNDVnZQAssdXXcLC3pUhRKmfK+JPfTso/tc
         XXi4mLjFLk68cNISzqnmaRCvaS1c5J6QMATOQaRpSrAXlS7qwP3IE4PaDBK5yP2Xts16
         EX8q6EPP/tSGw80ZcRMs6YLzsJ76nLjxlc7GTaE9MZE45n/tq6SUw8sUFpy+7Cfux30j
         C7ljBD+QKV0HtBVWCsKSWUh7UB44eM/FBepkcYENYGyAUSzaS4lx+0qAAMvFsgPbC83J
         hPLtUahURowQrv8xQQU4yeCc2jBWr0Nd8FyHfD34GmgWV3AX7+lG/ttsQf4Z6GGT1YR0
         6YsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786651758; x=1787256558;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=q4sFPFROU+eZm3bCubf9VEayWKlb0yNG6Sih6iyPJ0Q=;
        b=c7ebrSaxvc3L98CvJAeSbH7tc+dWOpGwnkBYSCzQedHAdLZSrxsGJFdcaDKxaeGlCX
         5vw1WbwDKrv9XWDT3TNFWIaXyD/X10sT/hirkMkZA0QXnjJma11GFBGHP/M6/hpG4ZnY
         /fB2l99a+/p2ysO5PvdZfUbxGQvWF1tdxRveNxbCdmmuhvCmKRo1XdQ1pE2Oq/S6XmGa
         EYUBcwWwUw54en/pNZuWSA8EAssJR6mMYd12s3h/FOmHdjQa68vUDCwA72vnAZNOMWJx
         yfr++RsWYzJIjKRWU1Pf9o/7riPSqkGOnpaihLHKiu3F4GbrwUkIRIWLdqcHVBQMhoTX
         1zLQ==
X-Gm-Message-State: AOJu0Yz/NaSY9B309mbYCzeedj9htSVbvGOc4Cqu0cBzZgqS6JDqNISA
	0o6E/aHzwN8r+tbE3V/8GoKpnjq02EyW6IFMv0AbZe6nd0syE/K/0jIu46dqbDzg
X-Gm-Gg: AR+sD125cmjGY5UURYz44IwBOhJvmsfPKAQz68EHLewFe4ihdPTAt6VdTUaTt+oOcFe
	PL2+OQgLDxe1vmvHh+X5gdRm15tJhlhTH2u2BFObxnMSWbo3Gh3IZo9epbc26isFu6VhuiP9tVZ
	v3AGXFtCqzlFynB8BqxEboM0ZkSQBNfXHvm+2yC6QbkH1PIEK1CemZjEgLlPyyBlne1cYQxQOCw
	SU5SJm5pgON15FwRwpy5H79kd40CbowSq/K6rJWH6wgqCJ5l4Tm2sj4R7fvXhALtoGjQmQqQVPm
	QPp4q/gU4LvcTNc1x+jybtBbetWRrdKZWPfqv4Eo5isqjbwQzBiVAmG/UzFyfqad6R0a3r3lhEd
	xni1VNGorWkY7zU7CkS4QFXBd6ltPyYdA/MNmRFX/KH9cS8XV55kbYzEvfXwJFPVxutJcew8ePt
	LXtlMuL+H9GkCUbGQXL230JS56aYJ37p0a6HX5UHcaWPGKiLy+yAYmDSIA/NNcgHTwoYQWOTa6G
	SQDSQyvlZouEunGmadKdWGWPV1V6eIkntw/gJOlP3Cxam0uhXtBAt9PkL47Ddl8qvnCkrB6G2NW
	utlxMnh3/jeC76MkF/fcpFQhuMjnWRVbC5Jx3X+vBGdDg2MJs8T7SCPCPZuRrck+g1EKnCKtyfg
	M0NHqDOiquMPY9Zx+v6LKVPY3LuJ2YYX5tYf48NJl4dK24A==
X-Received: by 2002:a05:6a20:2443:b0:3c3:9070:96bf with SMTP id adf61e73a8af0-3cc71b60f1emr340637637.9.1786651757700;
        Thu, 13 Aug 2026 13:09:17 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31ebfc37202sm10012289eec.20.2026.08.13.13.09.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 13:09:16 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 21/80] python3-file-magic: add python3-wheel-native to DEPENDS
Date: Thu, 13 Aug 2026 13:07:35 -0700
Message-ID: <20260813200834.1302829-21-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260813200834.1302829-1-khem.raj@oss.qualcomm.com>
References: <20260813200834.1302829-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 20:09:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128965

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
 meta-python/recipes-devtools/python/python3-file-magic_0.4.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-file-magic_0.4.1.bb b/meta-python/recipes-devtools/python/python3-file-magic_0.4.1.bb
index 0491d02b1d..cf0296b018 100644
--- a/meta-python/recipes-devtools/python/python3-file-magic_0.4.1.bb
+++ b/meta-python/recipes-devtools/python/python3-file-magic_0.4.1.bb
@@ -9,6 +9,8 @@ SRC_URI[sha256sum] = "a91d1483117f7ed48cd0238ad9be36b04824d57e9c38ea7523113989e8
 
 inherit pypi python_setuptools_build_meta
 
+DEPENDS += "python3-wheel-native"
+
 RDEPENDS:${PN} += " \
     file \
     python3-core \

