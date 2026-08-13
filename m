Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78F7DC5DF6D
	for <webhook@archiver.kernel.org>; Thu, 13 Aug 2026 20:09:28 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27774.1786651761723321058
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Aug 2026 13:09:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=AziWgOoD;
 spf=pass (domain: gmail.com, ip: 209.85.215.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-c9ef3e1337fso150456a12.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 13:09:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786651761; x=1787256561; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7Jxfwq1WkPj5rfhCjw+6qwgOJHg5/uX4ssOtpVS/wDU=;
        b=AziWgOoDIx7v91dbZ+WmYjKEMhbwxqhy/9EiLgqjI3uT8xMJ0nKIsIimTxosYiVcwT
         hFsJJpkK1RFNnPtsr9FV7u3l95NXOJqaclXkXF0o4oH7t55I2g6MREV65r9qrvlM885s
         pjQuxaP02LHrO6W5Zy8VVKFrnxDtJX0SIws+9v3JBZmyIrzemTwto4kPxZLyzp6JCudI
         1PB7VKmtsq4ijysJowz18DTKO0U+PgmnPbRKnHR4nYBEmYSndQ3NFaSutK5iUsu9+il9
         xyqmVQvRZujiCbBu2IpWUe0h9Akd2LKzoK0A9hvUKNHTLIkDJ+zRnQjwpWPmpbAfFMpp
         k+EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786651761; x=1787256561;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7Jxfwq1WkPj5rfhCjw+6qwgOJHg5/uX4ssOtpVS/wDU=;
        b=exbMd/D2JvG368uV0cp3ZJhnlqb0wEBZNcsi3+vWr2JrSkykbFBpTkzuuHniGu6Drc
         UIkzrUx6NbfoFrl5X6UYtL2dyq3kRT8ZiEVj+PL/uWvTyYzSHFNiu3y51WikGOH2JKVz
         ri1iw01aRyHsegCW2HDH1E/FosZgOgXR8lWam4SFZcS2vssKimNJpVWgkREeW6bOSlkQ
         qM4CJgyMsF1/Xq8SSTKUKyQbmUEUNxb42V9zIVSc9OpHdBq4hWdChxsSEc9xA0x/fcV5
         WfVQMXV6g12oZE+pL3oPSeLqFiwp6Qfjry8PnzqRpmydA6Xv4PA12JGaaieOjVqycX8k
         4zvg==
X-Gm-Message-State: AOJu0YzP3ZF+9kkwxsx+XWsc9SKL1fXK1Iyri+mT7dDA7yjQcKvo1gN/
	hLKsMZsYnXpJ7AxEnKw/exgNEYb2fcavRX3oKIBjz851wDtRJkZ9OIpIa3mASjtK
X-Gm-Gg: AR+sD13e7g4q1BEMTyvfLNcNaIv0FwI9X1HQopglqrbpXoiY5peBwFSf0K5DuQoE6NC
	aUcue1Ij3cbew7YvJKFlTBdAEmCYBaqHKQAezajfILw+tF/DVTASswAca+xiJxphzV0VEYpoI8q
	DDrOW6QiNlIOSlhrn+2cORJGjmEpLgRoHiOsQTcLb5/t372J0TaZKNu0ALNpIulGH6txpZvEqtp
	pnN3Dud/uDv+BaRZuofjjonHTldcvEkc6aalQfxm8PsddxLzOQbbAtApIRdSzxpHRh5iyml2Qga
	j4PfMdLIDroXZdMUT+3fNd7tHjHoGWvQPMt2faAlEqia95h+bwYKVnK1TXp+/gzAGSD3i3T0sSr
	vFFAuKpwNaMTFdRIcUzJUQ0NjaYEg8OitODfIDsLvzcJMSjm6MqRKLer+uWWspZvE9CGD5fuGIi
	Qytbtu4JzFGZSNw/VBkHiw0D0PkFcnx5imlUtSmj1f4clQ8GsYfc4ntJ12idd2kTTpPwaeOkx13
	+sTW4exkdurRV+/XbKdUcZBFqPYvOF610RoQpc34a0DC/1bK2lHPeCve1xDiybXGIyhqTw4OhwY
	zqK3u2Ese6qbcqmv3znhOAggDcU2YdylXnM48+VHpg0+4QVuthZwafUBB3nCZwKMfiw9Td19vHf
	dnBVqMU53bjYFR5CZ+COMaQX/WlaNvZbymSGYaM0rzMWp8g==
X-Received: by 2002:a05:6a20:4388:b0:3c1:fbf:1e2e with SMTP id adf61e73a8af0-3cc71abd254mr398696637.10.1786651761084;
        Thu, 13 Aug 2026 13:09:21 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31ebfc37202sm10012289eec.20.2026.08.13.13.09.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 13:09:19 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 23/80] python3-flexcache: add python3-wheel-native to DEPENDS
Date: Thu, 13 Aug 2026 13:07:37 -0700
Message-ID: <20260813200834.1302829-23-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260813200834.1302829-1-khem.raj@oss.qualcomm.com>
References: <20260813200834.1302829-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 20:09:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128967

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
 meta-python/recipes-devtools/python/python3-flexcache_0.3.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-flexcache_0.3.bb b/meta-python/recipes-devtools/python/python3-flexcache_0.3.bb
index 35769b45c4..e86d7553ca 100644
--- a/meta-python/recipes-devtools/python/python3-flexcache_0.3.bb
+++ b/meta-python/recipes-devtools/python/python3-flexcache_0.3.bb
@@ -6,6 +6,8 @@ DEPENDS += "python3-setuptools-scm-native"
 SRC_URI[sha256sum] = "18743bd5a0621bfe2cf8d519e4c3bfdf57a269c15d1ced3fb4b64e0ff4600656"
 
 inherit pypi python_setuptools_build_meta ptest-python-pytest
+
+DEPENDS += "python3-wheel-native"
 PYPI_PACKAGE = "flexcache"
 
 PTEST_PYTEST_DIR = "flexcache/testsuite"

