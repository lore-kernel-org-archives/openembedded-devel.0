Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34C73C5B572
	for <webhook@archiver.kernel.org>; Thu, 13 Aug 2026 20:09:49 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27794.1786651782128361011
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Aug 2026 13:09:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=TBWyRmDI;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2caea3f742bso6001895ad.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 13:09:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786651781; x=1787256581; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KccGuH/tiFELGHTxovhlaGg/j/8Nkap0Zh4spwtNlRA=;
        b=TBWyRmDIKqmkJ3uYOqzdB+jLhSsegsASWVbfGKzFBHRMInd2vwp7dJt96dOi1J9hIG
         nWwRuSO1kVc0n25Cke1dsCG+CFbOc4+ldJYDWQL7u9btUi7pjoTdnyqAg7UN8cVthznW
         ZENsa6rmRtx0J3wpQZ+SKWw9PspOzsiIlRIazEpUTfxFPArlAwq+tdYfkAq+4kl9Qv2l
         56g+uCxCgRlGdXshrFsTL0ut+Nv3/LK27+ehoRaPrh0FXQ4qyMhtHvs5ZULsrZdSCvWH
         F+w0H8pllcsMiTpbx1vAic+EUT3ZrBbDYoiRp0KPOdQFyGA4DCzjaDP/qVWGXRVUFR72
         gzJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786651781; x=1787256581;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KccGuH/tiFELGHTxovhlaGg/j/8Nkap0Zh4spwtNlRA=;
        b=hnkKPNCReWxRX+xipD2Czru7rcM++1Fjmyci5L5YLgCO8Swoc8+Z4502SiTPseehju
         LTwj9KCLl0dKPt+5xoRSxGomV65lw08nxRlv4+kFs9jSHlzPiLG41HI8BfVJD1MHxu+E
         eMpq8yhisI0Kn2sTKyUKBM2QoW7mMYzhttpoGypnSb7cpG8fZiMJhiLzWw2DqadvN/3Y
         J2VWP2U+v7m+APghYA8CVAWqWt/fC+Tx7FEM2pAbweL27qgAkP0WD8BHPo647NLmdS17
         OggbzrYstU52XamIFKDbarVjvgt/g5fiULiuSbfhBOEJc+mMiIqS5VzcQz0YptZ0A32k
         hpdw==
X-Gm-Message-State: AOJu0YzMxpaiKvHLfWC1XyRZYllVcBCQO84UNiZrIwYMt0dnzwFSmrzH
	fv0NHtXenqJRVYlvPMAL6c3kTYJkueON1aicJ0P6+R8oaoZpRYo3qTUdos7Jynta
X-Gm-Gg: AR+sD101x57kWssOKMjyeuRvTVAViMUt8bT2URtYeIMBYBFwQ5uyF3BxtKL0u+cIaMD
	hSygSSk+++E152ff7EsqlTpiTgyqcGahgsPr2Kx4RhJcS9lVQsVoQW4gdakxRTxVqkcWrO7z7wh
	uuZEptzSskdKZvq5i1hGADtsvwQrlV3srJWHEq6Db8P6ISzdlO2SECfND1LpfhrQX6xObiDA8qg
	UFX9jbHDuGUGNUl9leAtoQn9tx32PvajPisjxgr14D4b/fMT+0qy++W2rqDOPzPdUfJNphYrwOu
	grN9LfTXWWnJbpT/NAlPne0Brwnnw+8AgtXs337s/3Q6rqqRYPfF0qboFQm+/vnnTjJD0IRJG7Q
	OyeJIalv4aocHsDLp3Ep70tOBXjUj7qZRyL+NKkMwrtSQz9dQbNIpxlJMU/vgI5XgRVE21ASdMj
	LrS8ACE/6heVthFeN58PjZnYVh4e4J7KXRo9ag13iaijnBF5VpJ8yx6fpEUkhIxdUCeGL6WVVwp
	iqlQo0+nLMytgr+8b8zs5w44oM4xchUS1oibHJvNbl0wnCQTxB1JfFcHsxlB/JMakFDIrUHKE3d
	I9jTLdkCWHwe2mE6GsIhQeuxVPRzMZlyzBSt5C/dBDu+enW7e1Ueh1wtS8+KRckGgHBkJerlRug
	eWzeehxhbQyg4epKiWOH+5bWqEuAJfK5dILeNhG49RMyUWiqS5yut8dJe
X-Received: by 2002:a05:6a20:9143:b0:3c3:cc3e:a9 with SMTP id adf61e73a8af0-3cc71ac37a8mr369730637.4.1786651781441;
        Thu, 13 Aug 2026 13:09:41 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31ebfc37202sm10012289eec.20.2026.08.13.13.09.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 13:09:40 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 35/80] python3-janus: add python3-wheel-native to DEPENDS
Date: Thu, 13 Aug 2026 13:07:49 -0700
Message-ID: <20260813200834.1302829-35-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260813200834.1302829-1-khem.raj@oss.qualcomm.com>
References: <20260813200834.1302829-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 20:09:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128979

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
 meta-python/recipes-devtools/python/python3-janus_2.0.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-janus_2.0.0.bb b/meta-python/recipes-devtools/python/python3-janus_2.0.0.bb
index 9209f96d66..1dae961971 100644
--- a/meta-python/recipes-devtools/python/python3-janus_2.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-janus_2.0.0.bb
@@ -7,6 +7,8 @@ SRC_URI[sha256sum] = "0970f38e0e725400496c834a368a67ee551dc3b5ad0a257e132f5b46f2
 
 inherit pypi python_setuptools_build_meta
 
+DEPENDS += "python3-wheel-native"
+
 RDEPENDS:${PN} += "\
     python3-asyncio \
     python3-threading \

