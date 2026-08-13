Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EFDBC5B572
	for <webhook@archiver.kernel.org>; Thu, 13 Aug 2026 20:10:51 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27831.1786651842157973745
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Aug 2026 13:10:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=d3QfxaNc;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2d032846c95so4932055ad.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 13:10:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786651841; x=1787256641; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lFUAB1yRy2AW7ZKz1fxJA+/JK91GjvJZ2CxFKg7IBKs=;
        b=d3QfxaNcP7zE05vwm9XyB0A1wXFK2h1wgeIwUY2fRS/4gBFcnW637u9NB19X1iLRhO
         7TMwfJ3cuVCvTMTQCC55Ej1aljuOeZ2ZUxIq1RTaoJIeoGwqOHkupTjm9i9CDgLlVRk+
         D8dOajRQZ1/SKVYZI2kSEIVUR48Ivp2qCFlBn+xqnLClStiPz/mlGA5eWsAs1JhRXyN4
         yzSXWAyHQ0sa7t2jrNY0RdwO3OQFN3dx0kAetii15Iocnu9er7uubLJLAaqAMuY1Ch44
         bgxpmp4PUulhPRpG9IXJkY7A2nQ5nbgSn75bMeb7JOY1yLHn0WtjEWqSAex99dtlmupI
         lQMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786651841; x=1787256641;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lFUAB1yRy2AW7ZKz1fxJA+/JK91GjvJZ2CxFKg7IBKs=;
        b=ZSYu3gLyePPW11MdaV3MpFDvRZXvM5eNXpzwtns2lN4uOPtvfpE7fbNatIiQZNl8XL
         Ck6oPJ4fuLs6v1jZkwB6q0yNAwZEaKZ/mwmbhe+quf8RREU+RAZ6Dh7SM9ZofpGiHloe
         EB4RwvlaTaJRMYnTx95J0ixwaW2Hh6iwbbBoClbe5jh1fpPVpcNFhza1sGPUy9Fo9TuT
         dpTmZLrBaVB16hP9WeOhyrqbEL572caTQuQUMIU9TxOhVi5yFey0tFap7tXdsZFnjZ8E
         jsW/Zxo0IoKXJ1Y94v/wlYLkX4N4As4PnKXk4vZc0UoFzs8BTsXVT813uJW3nNkOoQkw
         plYw==
X-Gm-Message-State: AOJu0YyfoIymk9fPaMC3GmSk6c0bqOehvbkPfQvJ8IMDf6rvwo3Jo/+g
	H+afZqBb7AOd0XkPIJShidMGvaeFU3BefAs3Pu3g5D8dq9jyxhWE+cuGRsgH/pdf
X-Gm-Gg: AR+sD13+wY44HF5oTILFVvh4DCW4wycV9QWCdlS99RZm8AogknvG2MRfC9tLA9ev2Pi
	LoDck5QLLETSt0A0GmIKm1SES0SrpEWd3ck2voE4ncZjCoqY6bWXQm5J47tdOCi7yAfHcVOK6aT
	HJOCxohYC8EIMkJAfRUI7MDKF6HPxBSboiQYoAoxJFLm2WYm/io6e8hwNAAAW8t2QfaBdsh+MRA
	3A+5Hl8CLk1OrI1qlcSvI52y1FwsET2NbXrFG6no9ZyQlyKaBeMf7mv0ZjhiQSwUPyh7i5Lm8yx
	IUYzi+gKmUDkFVsV/6ucwqKsXWVFo3gZFsRBkKMjCLYQZpRfRYxjExd9HcCIi46+TKaqqZrtveY
	mkc06dfuUh04QOF+TEKG7HmSg9E+fMNMzMEwqQR2rZUEioH3xJRWSKWHUG7yp1b47sxhGdq+sl0
	b9l9zEuCXT9SxIN+e6dX2jueHZe4vzXYhSDtvZYV4oGy5H0BhjJESM7rVgnCzDwnMzWx1xQFrgH
	z/TnM2OMH2XT13k5otF26FFKi3Yu/TDTkxaUQGslHWZy5zPR20zosoXfMa9JAsqWz23NjvjgOSD
	cSilzNw2wXmBxTCLRHNJYr+/QdL6c8cS03c+YgppdQI8FQn61SuwAhQixYkrc/e2OxofkL5WAvZ
	WxXKahhSoyoaPE4IuqYWcfz2zeHMswWCwm1CBfAu7rb5M1XI6mEM=
X-Received: by 2002:a17:902:f54d:b0:2c6:9f66:d573 with SMTP id d9443c01a7336-2d3b07f5512mr5404905ad.2.1786651841462;
        Thu, 13 Aug 2026 13:10:41 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31ebfc37202sm10012289eec.20.2026.08.13.13.10.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 13:10:40 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 69/80] python3-term: add python3-wheel-native to DEPENDS
Date: Thu, 13 Aug 2026 13:08:23 -0700
Message-ID: <20260813200834.1302829-69-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260813200834.1302829-1-khem.raj@oss.qualcomm.com>
References: <20260813200834.1302829-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 20:10:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129013

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
 meta-python/recipes-devtools/python/python3-term_3.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-term_3.0.bb b/meta-python/recipes-devtools/python/python3-term_3.0.bb
index b4f801bf4d..2a4fead61e 100644
--- a/meta-python/recipes-devtools/python/python3-term_3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-term_3.0.bb
@@ -7,6 +7,8 @@ SRC_URI[sha256sum] = "a6a81535e68fd98d25b1e2a1dff15400c5678e7f942e2d5bb5bde56784
 
 inherit pypi python_setuptools_build_meta
 
+DEPENDS += "python3-wheel-native"
+
 RDEPENDS:${PN} = "\
     python3-io \
 "

