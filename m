Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A837BC5B572
	for <webhook@archiver.kernel.org>; Thu, 13 Aug 2026 20:10:40 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28154.1786651830926587675
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Aug 2026 13:10:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=itYQDz2x;
 spf=pass (domain: gmail.com, ip: 209.85.215.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cbb8b54fcf8so186240a12.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 13:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786651830; x=1787256630; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cXHXpO1/62BviNfKwUfCdF9cMWH/IKDmK0h8YgPeayY=;
        b=itYQDz2xN8gjDwS3C41NQbXtbze9Z0TbJvfAsaAlT2BUQNiIt/9DpgzouF13ddpgef
         iwkMyJe5NeLN3x5b8cIUB1neVuFJ5ZuMHpvLg5nA2jq9/vmcuBO4fKen15k3d241X3C+
         JbNYYOCBkFOGYZPA91K1OR5EqOW0zOLQMHmUcAHMz/mwmZO8V1DeomGR6XWIZBPHn2pA
         NCi7pvR4iqEexRZo8Ljk3uJZVQHOLSaNWISrkCfK/KzNPh617j+LBWxV45Uw5f1y/oq8
         CgcujjHynvar/uPwWP2QXWz8AFk9BHQUBDcA8m2oDdzgos+cLjkoUc0VxL+zZJP5KsQB
         5fog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786651830; x=1787256630;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cXHXpO1/62BviNfKwUfCdF9cMWH/IKDmK0h8YgPeayY=;
        b=WSnMJCqST3HsK8hO/hAxu+dsfr3Ed3j9PMbflnzArU+675cJ5IW6+BupGdXiTt4MRN
         K0gVcG+EiOMbe/GrnDFYPBS/GFbvKC39I09y2U7jhKrMLaujj0szonMrPy9mntQhbu1f
         GyRMyzx6RSefhS5PrnOE5JYr0Wcm70/8UZrkMnQwHRSnkb6VzVb6n4OUnuxxV4nuQ54C
         PGF3qHPSzCjB4Uy54VTATWOnmhvO5XzkmzTbXwGKYa2cNaVVQuOaZbYS80+ralLBwz60
         dsPL8shL4qaRRPu5mELDa/nAp0pDMTSgp1MtTwmwoLdC0JnCfwF5sKY0y8C/TTaT2Xcg
         D1DA==
X-Gm-Message-State: AOJu0YxZxYNCMpxp6DAOsiZy9Gw6YOkwXEx7KOLu2NjJGnSNjlptRHfn
	wHW4T9FE+JW4pmtmx+/61A851wsQ0FN0bMKIWdG1EXnwq9+JbulootplLVxOag==
X-Gm-Gg: AR+sD109jAZgzJX1wVebNoN70mluUjDE+xxivh+SrCCu/+1nmh+aHPETb3T0l7Tq0eA
	pnm+EIRng29LAn4O4O7xKnU1JQd1B7JXzIUWnc+i4rIBtGW+Gl19PwqAchhPklOOJaQr6c20C6t
	kSMxjz7HIuPt2V2EWgvgCr/1lvnl1c1VrYwDT2EIcaA0lh6+fWZzTr7whHcFmAfNjfPJokfHF8j
	36d3M6DBr98USMuPgFlk1W5YhRMLzn1fFKXgSYnShjdzALTMGfTdHxLqEMbycX9kn3dfhdtiH+4
	7HrRqmIyzSYEHhsZzQGR21lJNSCRzI0sn9Yp4Bzcecf2uJyx+gufWgNx+28t1RmLOqQK8+cRPsj
	bRGFg1dQknDtk4mxklT8zKUn26vLakwD6CAay0NQAdpXPzBI2UrLa9UrcdhDb77CTHAWl7c2tqr
	h14oBr9uxeJtZkS2EkLMiSu2jLLZht3iTTdL9u3LNJslXGo7bTL3mzmXo6VKvefujNdKyzy8R9z
	e0UNr5zloJtEn3GTeKgGHVk5iH0dL5DT0L5QN0R2ShEs+peTHa4n1CP2Y4KKcAJbTeKZX0cPvWi
	xyRjzs9xYPa7rOAuAA9p1cqhXMkPdBVB4W+4rlcSPaER1YisWtjOUzZ9T3YIhcMaaTF76sl56qp
	a86qDRJz5wDtGycF6gKKu1DMscGU8xcW8zLXk3OylYXBECw==
X-Received: by 2002:a05:6a21:3a47:b0:3c3:9993:d5c3 with SMTP id adf61e73a8af0-3cc71aae5admr478525637.9.1786651830162;
        Thu, 13 Aug 2026 13:10:30 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31ebfc37202sm10012289eec.20.2026.08.13.13.10.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 13:10:29 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 62/80] python3-reportlab: add python3-wheel-native to DEPENDS
Date: Thu, 13 Aug 2026 13:08:16 -0700
Message-ID: <20260813200834.1302829-62-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260813200834.1302829-1-khem.raj@oss.qualcomm.com>
References: <20260813200834.1302829-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 20:10:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129006

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
 meta-python/recipes-devtools/python/python3-reportlab_5.0.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-reportlab_5.0.0.bb b/meta-python/recipes-devtools/python/python3-reportlab_5.0.0.bb
index 689f7d7bc2..f77a533c31 100644
--- a/meta-python/recipes-devtools/python/python3-reportlab_5.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-reportlab_5.0.0.bb
@@ -10,4 +10,6 @@ CVE_PRODUCT = "reportlab"
 CVE_STATUS[CVE-2020-28463] = "fixed-version: has been fixed since 3.5.55"
 inherit pypi python_setuptools_build_meta
 
+DEPENDS += "python3-wheel-native"
+
 BBCLASSEXTEND = "native nativesdk"

