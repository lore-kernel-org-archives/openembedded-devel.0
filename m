Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96518C5DF70
	for <webhook@archiver.kernel.org>; Thu, 13 Aug 2026 20:09:28 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27776.1786651765334938936
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Aug 2026 13:09:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Kn8fmxeC;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2d0407aedd6so4351395ad.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 13:09:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786651765; x=1787256565; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uCW1CJcpFn2p2SuNYX0eh0/TMYKfCVkS0yjD9/To+yM=;
        b=Kn8fmxeCrFS4IL4Gq0DMiqbwmz4FlvQNs/lUfuoUcZdao7W2Ea1rsNsjpoxjk/vNbA
         wJ6BkLIPoRcuSiFCm9OvLvulSY0r9S0KWa31hQGy+0kkaGka5TCDmMtvHp3zN0+N7h8P
         xkH3qHYDZVW+VzJH57u7zXnH6x5M4raIawDUqH+zozJPXuzyUWjInXBYTOdgmxocQQih
         cA2Kq7zBnlO/qKFahAiYKBFipfN6GymIpeQveimRqKprMne0nUgtLR0SsbQeyNCvacBf
         GngZAq0eaVtA1HJMAiYi3asGFclSfoQ7Y48ZDrgCIOXKlRKmGoQYjmJScMzRCF60lf3v
         6XlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786651765; x=1787256565;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uCW1CJcpFn2p2SuNYX0eh0/TMYKfCVkS0yjD9/To+yM=;
        b=VSMvnKWzY1QbegbA7XLp6mdyGQnS2Edkd5P/O1X4ycP5j4Iqa/cKB0n64fnB76U/ag
         hrumLJcR3lzdxZwGbv0cYtamIXX7SZaf9d0SbO4/PnV3ybbGVJPyNFSNSUVN0rcRkrGE
         gPmmX2z4xzMOlnHMTH6z7axu/4SrbdxJup8l8j6dOU1webtq/ynwjnLDvcWBz/iakqkG
         3HTT1TyMmvUeGsuN5QzE2bxO73sTI90RBmjFJn0eXyLiZGMfsSfG2UBAVVh/kHZCu6QE
         3CI/8egZTpLq0nPdTcgIB1TjkTA8GcthT7wa7OHAFjSd/+BtH9J6sR7gKtjmpeK0Vq3w
         fE1g==
X-Gm-Message-State: AOJu0YzxYMJUgCQKItfAWBKINcPD0C6LUCKQROmvnJgR9wKC8UvwH1Cg
	7fVHaL5SFtQKh3xMs5Je0ZszO5wXRSVfolTy68eFzdovySzAbCPo9Uy9HTpFQnsR
X-Gm-Gg: AR+sD11HWhO7eFZR+93h0s1lk2Fnwz25AToxnqsckquUc7uW94zalgPiM3bzy6gHSzH
	gSi8Blvj9/N4wYUlx2zYicVcFvJuG2/nG0tP/21JAa/mcgN2OpndGqE8ctvLQjQXwZmPGrDhBL8
	tPoSBgw3MecIxKnQngLhuGWazMnauToWP0s/cwRH9KyUuLxymJB0szTnYW0aqMbKOGTR0fkhlhh
	BYO6j0fp3EgNkFzwXABhilF8WZeZj6NA4lHdJdsSpRQpuNu/+ms8EfYJvgUWumoPrNYRlbz/WQb
	lS0BLYcgQgedjavNG/y/sx+J3ZwswCqZdgQaR1Az97pfYfn3kYqpop5hJyFIIQDJK9XzUnJWmVq
	s201t2SWvc4EFPR/r6BA5x0icvDHaEziqHhUtbkR2C8htlbDFeWZVX2frE34qpxijVV8BEhzeck
	AT8TDtYDlSFLqI3HmpBvyv1afl9e5r45PzuIBL8TNjV/LRwUZ67OsoVOeS10Ge/nD/0tsSVO7oA
	/QuLapHoxwSDgxf7+WsBHI0a1yN0uC/yUYDSkClsGd0YybXKTssx0PJK1XqdfnGPM4Ap7giOq9u
	m5EcEfe7yexaqD0mbw9ZymaKJj66+8fJrAtfpvWia+1sfegTxi3tCiDv1lWOb+3jVfW0KpHQsq0
	p+M+IxKdA3JUf+yvA471fKnpuu7wU88aixMaQl+xvTijvBw==
X-Received: by 2002:a17:902:d547:b0:2c9:df1b:e948 with SMTP id d9443c01a7336-2d3b0cdbdcbmr7009005ad.4.1786651764587;
        Thu, 13 Aug 2026 13:09:24 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31ebfc37202sm10012289eec.20.2026.08.13.13.09.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 13:09:23 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 25/80] python3-freezegun: add python3-wheel-native to DEPENDS
Date: Thu, 13 Aug 2026 13:07:39 -0700
Message-ID: <20260813200834.1302829-25-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260813200834.1302829-1-khem.raj@oss.qualcomm.com>
References: <20260813200834.1302829-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 20:09:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128969

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
 meta-python/recipes-devtools/python/python3-freezegun_1.5.5.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-freezegun_1.5.5.bb b/meta-python/recipes-devtools/python/python3-freezegun_1.5.5.bb
index 878d438070..a9ce3d6f00 100644
--- a/meta-python/recipes-devtools/python/python3-freezegun_1.5.5.bb
+++ b/meta-python/recipes-devtools/python/python3-freezegun_1.5.5.bb
@@ -7,6 +7,8 @@ SRC_URI[sha256sum] = "ac7742a6cc6c25a2c35e9292dfd554b897b517d2dec26891a2e8debf20
 
 inherit pypi python_setuptools_build_meta ptest-python-pytest
 
+DEPENDS += "python3-wheel-native"
+
 RDEPENDS:${PN}-ptest += " \
         python3-sqlite3 \
 "

