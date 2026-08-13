Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45E7CC5DF6A
	for <webhook@archiver.kernel.org>; Thu, 13 Aug 2026 20:10:20 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28148.1786651815018589582
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Aug 2026 13:10:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=JgRK0KrV;
 spf=pass (domain: gmail.com, ip: 209.85.215.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cbb8b54fcf8so186079a12.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 13:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786651814; x=1787256614; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lp0xUVfSGi/LfdnI7ZcZKSfuDdL6fDnVmw3zPF6NHv8=;
        b=JgRK0KrVOzs6Ef3iGI43pDI1fqOjiq82NodvQR7V7yU4R5CF4UPvhbv9qNXjCQtSu4
         itivtMPDqqVAOC12Z0utYHGfKMxKKTgcWeWgepENo72gaFDSLmsyWcLPNX/g/22mm6Pt
         qd4rxUZBY7n2ZOcT3hgsI5U9nX++TXZCG9pjNwI/pwHFlBs1Hyf3mb1zkZP/UrM/HbAk
         WZ50RM4wIfY9JER+G29IxCB5N7mIgNj7L/hoJw6tJmUZ+vf0TCnQH1XR3jt4fT0f3Ec4
         SeMWL5wu7zb+vTc9OW8l+r9HLovET57T2Llr3ZcU/DIyxukzD8OpnIO1zUSyzmSHFMVT
         fkNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786651814; x=1787256614;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lp0xUVfSGi/LfdnI7ZcZKSfuDdL6fDnVmw3zPF6NHv8=;
        b=YhGFnwCvJ5QgJedIQ5Zyuskc1ivrdbs9IaxvUv6ytQejGogaB43Ib9d7VpEMwenolR
         /RpdddPCaDV7n68pwSfxcvQApNRVJqwEgzKDTnaC3VOzjOoDJsyJs3kMsJQyNqOrsJoV
         Vv/vZBFYqcIn42lMAVy7RtPTXjNP7D+ohCG1pJqAhJj+d7s5DLk8F0Mk8dt4LBlctbwo
         SRzX6zRJvJQAT6SXM8Nhlw2vN8mr1i16JR49ksBScUUe2px2kMI8JoUBuhZQbMYTA3Xv
         X4g09mzBixPvbX6DcYHXu8/9lOPEtjpKawTobp9cNLksnEz2aByGMRUZMeTAdWSDBkCy
         3jfg==
X-Gm-Message-State: AOJu0Yz5qs7qzN3mVipyVak0VfUXYTjlcwbaitt39kDCH71HibZEJN3E
	Gqjlv09FW7dzp32NIajLB6a7Ii+et8bqKrwVGE16evV/Pl8ddeWvyITBBpUK9kt3
X-Gm-Gg: AR+sD10IUy4/bfNTzz7WVm3wql6guPs5sKo8kw6HqVnFJKUzV+KPR0eaF1h0SrX1be0
	6YSvGzthZkp5SlN/Ljeh9NkaW1qogAbJS4PpUV51WJesVf1MHXZotOgtJA9KvuNcVZkc6lHMAsL
	dGD9pvd6vVx2HZMNARUmDk/zsgOhH5zkFqYonp9AS0eoOgj8uEyzRcuu0zv1n+5fmd+Qt8rKKCI
	EBLCywBI0yZn1+TgD56sy0NjVW9KxwFALzxQuFfX3iW3czmIOvH2XRv7G+Egt/V5/4LfQinsny6
	rTwAFoCNnrn9H/ernhlcFbJzy6a3FQQLSfYAgoUOmKQws4JtAAkqxMjMpMwkQqdmhRj7YmrYewc
	xbf5Ns17WWG8NKJLZYw262RfOHzKlXAv3zMq5fSHiksywaIiMMsnBpDS7uNNDZM5jCA9QbHpeD9
	eiWO/doI9nLIIyRsQlgo+ELKkb8NnqjkHDqRBfkwSbfd7yI2BY4lYdWNA4A37vuL1rnbzoevCc+
	AII0kDAwKdWQRzi9I6T9KSZjnLjTKXhbGS6bCALUcP0VFbOoHQ5bm9ryF6+qFOS+MIfzcceiIHo
	V/zP1aAQUZ6NaHIR5a14gEO5I/9J10IQJa5IoI/tiiqhISdjjlwLX9//Bof5w3a2bGSbHVc62hB
	WqlrTkiYzy+g+gaQy475EnWq0K3kuWZOmjP5o7P/Cr3ezST0V768COPa/
X-Received: by 2002:a05:6a20:12d2:b0:3c3:a024:1360 with SMTP id adf61e73a8af0-3cc71de3b8dmr271226637.28.1786651814194;
        Thu, 13 Aug 2026 13:10:14 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31ebfc37202sm10012289eec.20.2026.08.13.13.10.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 13:10:12 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 53/80] python3-pycurl: add python3-wheel-native to DEPENDS
Date: Thu, 13 Aug 2026 13:08:07 -0700
Message-ID: <20260813200834.1302829-53-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260813200834.1302829-1-khem.raj@oss.qualcomm.com>
References: <20260813200834.1302829-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 20:10:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128997

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
 meta-python/recipes-devtools/python/python3-pycurl_7.47.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-pycurl_7.47.0.bb b/meta-python/recipes-devtools/python/python3-pycurl_7.47.0.bb
index 97d66d6461..b81547f055 100644
--- a/meta-python/recipes-devtools/python/python3-pycurl_7.47.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pycurl_7.47.0.bb
@@ -20,6 +20,8 @@ DEPENDS = "curl"
 
 inherit pypi python_setuptools_build_meta ptest
 
+DEPENDS += "python3-wheel-native"
+
 RDEPENDS:${PN}-ptest += " \
     python3-pytest \
     python3-core \

