Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96E2AC5DF6D
	for <webhook@archiver.kernel.org>; Thu, 13 Aug 2026 20:10:30 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27820.1786651823988535669
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Aug 2026 13:10:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ThonJOB1;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2ceab75934dso4376405ad.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 13:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786651823; x=1787256623; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pTg7yyMA6clTIp5uxw0zv8Ps6/PQg0fFWmA4d6qs+No=;
        b=ThonJOB1Y26+mVmnExR/+r+ZOF2aDjawXK8Hvye/IiVF7N+XQoG2K64g9YqqRuKlCg
         XlCk73SZ2fx7BH4ROecdDke6iOw3wll6aNe3Akeb0X64bjleNlByIMgRxfoEhE1yxuv0
         kEl8UwZhf+RQVlR+Up92S86xihNXwyN6plY5QI48urpu2k6Q2LzxbkikztMHmU2scxG3
         2O2h77v1V17Ncj6ABNZ9PId1mjZPgJlAaMaOA5kkgPkzCqGrRre/mW1MzxffDMAyWimf
         oN18MbN6dmLlGrMmrmPDikO55/KmdxjwbXoXXbECTD0yY0B/9AYbOGh6CTCkvC4tPJgx
         hxKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786651823; x=1787256623;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pTg7yyMA6clTIp5uxw0zv8Ps6/PQg0fFWmA4d6qs+No=;
        b=FW7F2sSw/gRpG4u6YKjRRX522NI7+fHsyuyIG7jKdhoHU5cqkjEvLZ50WApUCO6b16
         9DtiTDJ9Yik0+we/TbC4IxIVMiemX4DdCJeCoqFABpr8ybMnfkhIbkkin4vyZ081NFOR
         9J7zeefT7c+lhwFDkI1aCGvDjxLEAh/8dnUN0JRavwOx1YRfN5lLFBcGLrn3bsdBF4QU
         g7Uqg2bcHFno+61PgYgZEAW2aZJswYg4MSCcU71salQ/F8aMN+QgzmHkswkEZpNwNPPR
         hfjqKHYUedzC7wPXHgpnrRWPHJ9Pj0cENuewwl2UV0Xg1tdriBgzWrUWa/v1VeNmnk8u
         igrw==
X-Gm-Message-State: AOJu0YzMbLoW8DpMy3hMqkkFWkxIfi4f76b7IR6Zbi8jvwBBSbr92ReS
	lgn7G3mqzjRxxgWcneSQNxVrmAKUbH5jHk1Mv07le+e4HOCIYB8lb+LGjLkzT05l
X-Gm-Gg: AR+sD12HlmgQRqZedZxpT0yA8hWPUb7+wq/TGk0JZODBp0SSn8XBe6PLZu966EEeDlc
	P5xyekCn/33oWlqI2nb5dL38S+rYJv10yduUR+kQbWk4zJ2Gzo7heg2waFZl6W3Gx69+QMUkVEz
	+yIkODhJ04pMlclpwUpdoAJxEQsmwemIsGw4sSYAHPg7xJ+KqIoRL8Lzg8eVXtsOK60GxwY2R1H
	rrR3KQ1QmVFwM51lHdCtYX92/IxTbiNMaKPonuChDwhLoc/QT50fidDn8i5jye1dzY7gFt7n71n
	5WpPPZ2Jrfgk1Jg7yOBRdj+tXvExBtR6IGAb9Rk+WgQJnZBnI3/P+GriOyu+eHjjJ9AMbOUIIBf
	VXvC39NG2cc1iN4hJcF5S2PP6zWILQ/gOtJ2kjtJvyOpCeEm3ZuNp2Eb66DOuXOgsT9f1m7JTst
	4dOpCEEJQFKhNudm9Qi0QLiI3iW1gXGbeXu70tStNsYoPwLCqVpNOfKyLCiIdhMQe6PbMH2R4Ck
	a3EPkWLhtSt6jZ1PhjJizI30A4Ws3vAmZVxLjg74694SLQsO3Mc9S2tTpqTZENh8szNQuIkp9G6
	V/hfYrqdcVIIdJF8wHi4TZC8DsI4ZeL64gZmpjcCVH1AotQ7WlE+Hu+2N9yEvLxaXzyfZJkbE2W
	gT/2kE7wVDb8cPjk12ZC93s/qKECc3P44qqkHRNjr30TSV1Mb51h2YWHT
X-Received: by 2002:a05:6a21:398a:b0:3c1:b9c:4890 with SMTP id adf61e73a8af0-3cc71ebe179mr290081637.22.1786651823149;
        Thu, 13 Aug 2026 13:10:23 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31ebfc37202sm10012289eec.20.2026.08.13.13.10.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 13:10:22 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 58/80] python3-pyroute2: add python3-wheel-native to DEPENDS
Date: Thu, 13 Aug 2026 13:08:12 -0700
Message-ID: <20260813200834.1302829-58-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260813200834.1302829-1-khem.raj@oss.qualcomm.com>
References: <20260813200834.1302829-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 20:10:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129002

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
 meta-python/recipes-devtools/python/python3-pyroute2_0.9.6.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-pyroute2_0.9.6.bb b/meta-python/recipes-devtools/python/python3-pyroute2_0.9.6.bb
index 41318412a7..ec72b450ee 100644
--- a/meta-python/recipes-devtools/python/python3-pyroute2_0.9.6.bb
+++ b/meta-python/recipes-devtools/python/python3-pyroute2_0.9.6.bb
@@ -8,6 +8,8 @@ SRC_URI[sha256sum] = "6bc5e2ea9a372ded682b4ede4028ba00236bd6e35b42d833f39a96b219
 
 inherit python_setuptools_build_meta pypi ptest-python-pytest
 
+DEPENDS += "python3-wheel-native"
+
 RDEPENDS:${PN} += " \
     python3-ctypes \
     python3-fcntl \

