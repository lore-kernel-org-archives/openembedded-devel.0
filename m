Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0AF3C5DF6A
	for <webhook@archiver.kernel.org>; Thu, 13 Aug 2026 20:09:38 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27786.1786651772254566444
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Aug 2026 13:09:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=gT7icbKI;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2cfff5f88dbso4896905ad.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 13:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786651772; x=1787256572; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LBbDc1G5M2OUptvXvCq2fEiYVHBgL3VRKGq0hmmvaXA=;
        b=gT7icbKIlIXUmus3DPklq4ssBxwQkF5q4kX8IgjfQ4jDh9SXDT6oMYrP0VGj8zFaIn
         Y+b1vPO8eO9ACROsOqVnvvAcC5WPn4lu7+6RdA90k9RPT5bNGI4sJ2YctNxnuCP8qrzN
         HuiK/XkZFq7xsWLOz8/Bf0vCvZsSnOp2MRyUI/2TkQrbyDBlzfxSDDXnza3KPIOu2mI0
         39kdWq6ukaxuuDV5oBZTKc/T6zojRRnLg5UxJKjxiImXb6puIXsnJr9ndh/0UBo/CZ1q
         1nV2QhwI8rABYdBXH8H62bJxNgfCaJkC0HA88GJ/io1HHi+JhJn0DNmyPAX1F6rt5T2j
         fzLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786651772; x=1787256572;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LBbDc1G5M2OUptvXvCq2fEiYVHBgL3VRKGq0hmmvaXA=;
        b=Ov0rqJpRPsxCehfBZEpVksf1k8MNA6EfQ3gjwxKsJEDzJkD2fkm6LaZAZ2QRvk4Idx
         +D/YhGgzv6c9d9vVFkPaGzLr+t5fQD2shSZafi96RRJvDqSZDyQ4pSdtrUbu3spCVAVU
         2prwibpVPuXJFda/qS0zRgMUrpw9SvzIyRCdwWtD9IcC4LWrlTD569Bfs0xrjZpRd+s+
         bUTTkgCy8CKQcg5CRXzStvbYZ0OiLAprsNK8MoBr+5uRZwWIvEQMISRk4Rat+WyW4nmp
         huwP/KHuKfpG1k8lmaBy6lIyJNToYQJcOBEviKPO4Y+GUkyY2u5VxmU38UpAxaoRuguA
         ySMw==
X-Gm-Message-State: AOJu0YyQvyW2eHjttdg1Ths5ZLXJP8t5LlheHkpVdawDjroyjxWoIj92
	Rn1xkrqIbTe63uetKjE3OvPCWXF8lbC3RWOID1zNaInoWNshGOGKJ+F6PIdaQj0/
X-Gm-Gg: AR+sD13TKGQL0A86jBAL3Se5nhGNgr2xp0z2pWMkCiqCsOk6s+rg26vaKUS/LW93pXS
	x22F5NSZoeJE0Ktl++B3YEryr5coveaAYWSAIjdce43wI0FXbUAnGbxR3u5zQRBDVdQQv6EBM4F
	sxw0oaycYEnrSKHO9ek4oCtkOJsZxj35tdk84CAyQPkY5tuOJEje5WBNldDxTDYnIZ+BqAXNNKD
	A1vwYMC0peBORBysyj8x5TZ5tqJFGNvobHfDFwrQtv6aan5fhMSo4QtYHGcGO2RJoAF3JdiQeBA
	hE1RkA208bge2bk0QJtaQ3/vDpaduENxL/0kRxx7laitWgn3x0HX5CPS3KbW9eFRNyi+EuHLFHA
	JgAc5rpvKEN29hYvif68OdKe+vlYbdLTxOiz7R0cWQ4VuZKpH+wgbxU7hO8LlBtz46dbrK0y0fW
	RiUZP46BaeTqImwEmliZJMHYMt35FQyTy/3u1RdTrUi66xBmlbFE1xC00I+Xv7AmZWlrj3RQCsN
	eebKQGEl9578kQOkuwy3Kf+kK3kDa+AC3zDrZTYvxYJuLxnSTjTsm7W++n9uUd5ow4RsDsdnJpD
	gb2I9BzgCY26u1/IJs6T5KPmHA4l8vcnSQddTNd22lxRG8YeZzz2SRFBRULaHvMZhi4ZjaEevE6
	SAm+uJ0IsCaiO6+y/w6zDHv6HO4NWNSCvUU+GHKTJMThvYA==
X-Received: by 2002:a05:6a21:7316:b0:3b4:b276:a789 with SMTP id adf61e73a8af0-3cc71ed6b3bmr264512637.36.1786651771414;
        Thu, 13 Aug 2026 13:09:31 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31ebfc37202sm10012289eec.20.2026.08.13.13.09.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 13:09:30 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 29/80] python3-httplib2: add python3-wheel-native to DEPENDS
Date: Thu, 13 Aug 2026 13:07:43 -0700
Message-ID: <20260813200834.1302829-29-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260813200834.1302829-1-khem.raj@oss.qualcomm.com>
References: <20260813200834.1302829-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 20:09:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128973

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
 meta-python/recipes-devtools/python/python3-httplib2_0.32.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-httplib2_0.32.0.bb b/meta-python/recipes-devtools/python/python3-httplib2_0.32.0.bb
index 4c1d0539e4..801dbb0a32 100644
--- a/meta-python/recipes-devtools/python/python3-httplib2_0.32.0.bb
+++ b/meta-python/recipes-devtools/python/python3-httplib2_0.32.0.bb
@@ -8,6 +8,8 @@ SRC_URI[sha256sum] = "48a0ef30a42db65d8f3399045e1d09ab0ba66e3b9efc360d07f80ea55d
 
 inherit pypi python_setuptools_build_meta
 
+DEPENDS += "python3-wheel-native"
+
 RDEPENDS:${PN} += "\
     python3-compression \
     python3-netclient \

