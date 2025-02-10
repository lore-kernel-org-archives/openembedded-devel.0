Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2336C02198
	for <webhook@archiver.kernel.org>; Mon, 10 Feb 2025 15:45:20 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web10.54613.1739202317723750773
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Feb 2025 07:45:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=k0KKrRmo;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-38dd006a4e1so2161763f8f.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 07:45:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739202316; x=1739807116; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=juLL2HrN24IXuwXxises7HeMHdgHjzZl17SZBygbkwM=;
        b=k0KKrRmoyssaxE/hKJY3Au79pYsksQdxnswj8bRObkUcn6ypSmFpSKZap8qH71Nbtt
         lZCzCxuGHHpDxpcT0VNQZsLs1GDeOSQgnYQh4XE/ntCnZal/9fLlG8mofeNSV27WDVH+
         r7QMCHvyzIzkKrdgpb3Lb5H64HscZB9CIhwUYXy8SXEwdEx74efifMIRtZ99Atagjcr3
         lMyGgCWLvZs7axLV07ou+sCyl/0dHTpnoHI205jmge74wS1zIbYlAqGEdBUq0vkqEV6D
         RwfdSiZB9QZMp+aTb4WvijCEXBN+ZkP3BWMOYEAFlVDUirEZ+GYQF2usAl/EiSaRQ9Rj
         rvKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739202316; x=1739807116;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=juLL2HrN24IXuwXxises7HeMHdgHjzZl17SZBygbkwM=;
        b=nR00usaQUDmbQ0lVY6inJioonsD85Kofl+DnuRxfGrUVTbiFeEYX2r0rE25PSxeIOR
         +KKP3SKAaOi7SZL2G1fk7iUEj4aTobWt8+cBuD6lZZj6HQAcJEGYLbMKeRvyXQnm2TNN
         iZMW1oRTOXuzX/D1ZK/xCu6TC3bJHa7GVX5sJ7utmILEg0VFR7MlSyjRT9FYMz5juj5I
         VE1z941XFT1RY1YQBfOU3SbX75VA7G9dCUQUS0rHu7CrZ9n4FUvZIrCCG4Wk1T3cr1bG
         lg6Agzv/Uqhqdh1HWQMk1vPkS6/FFCV6RzAKQcG3TCjqZ3VRGKgdIU8FO3bFkc6aNU9s
         ndbw==
X-Gm-Message-State: AOJu0YxxWQdsJkvNh2wE1bjZNKyrJwFUfhBCJeY2QWwIQsl6Mo7B9xj4
	RF1ioIOwE7olZDwd3NsFW1Ve1nijydbIkiZmH2Lmb0HNrLg6sJjM2M2ftJFB
X-Gm-Gg: ASbGncuxc6JGGTCiLzrKJ0ZiaVn+fPVthe5urknYMGEFN7IPEmmC5JynSVHp7r6E1a7
	7wMo4KmlUNxUeaSRMN/dt81w8PqaCnA1tokyogk9R1k5nikp8JEkVWfcyxWoun54nHEw8t6BLMk
	19kLFIZVoVzFqrb0QdFbrlzGDoSUzC+6SGSLu4AyOD5jB9SGPhgf9I9KztnfPrljfPK8E161DdE
	o/jN8Qln844jNFp+7EJHnuZks9F1eHWGl7Rf3bIx0mZ+UruaW2gHlz7dnTYM50QTBer7qB1yvws
	EeQilGBUmTBZqGAPCr+1fa6SYhWk7co=
X-Google-Smtp-Source: AGHT+IExHCjwzAJV0toaCdLCSbez5iklEpW95Fak/Qqmwz6Z6F+swbrt+JiKWOiA7DOWCRsV1WmIew==
X-Received: by 2002:a5d:4d42:0:b0:38d:bd82:2f9 with SMTP id ffacd0b85a97d-38dc935122cmr9391948f8f.43.1739202315551;
        Mon, 10 Feb 2025 07:45:15 -0800 (PST)
Received: from localhost.localdomain ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43907f19247sm134869555e9.1.2025.02.10.07.45.14
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 07:45:15 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] mozjs-128: keep persistent state directory in WORKDIR
Date: Mon, 10 Feb 2025 16:45:14 +0100
Message-ID: <20250210154514.2755031-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 15:45:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115405

Mozilla projects (built from Firefox tarball) keep some
content around for the build process, for example Python
virtual environments, which is reused between the tasks.
This folder is by default in $HOME, unless it is overriden
by the MOZBUILD_STATE_PATH environment variable.

Having this content in the $HOME folder can be problematic,
as it can contaminate the build machine. As different
example, when using kas, it creates a new temporary $HOME
with each invokation, which is deleted upon exiting the
kas process. This can fail the build if for example do_compile
and do_install were called in different kas sessions, as the
tools and data stored in this folder are deleted between the
runs.

To solve this, set the MOZBUILD_STATE_PATH environment variable
to a folder inside the $TMPDIR, so this semi-persistent data
can be contained in a known path.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-extended/mozjs/mozjs-128_128.5.2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-extended/mozjs/mozjs-128_128.5.2.bb b/meta-oe/recipes-extended/mozjs/mozjs-128_128.5.2.bb
index 0edfbe73f..4b56a17f8 100644
--- a/meta-oe/recipes-extended/mozjs/mozjs-128_128.5.2.bb
+++ b/meta-oe/recipes-extended/mozjs/mozjs-128_128.5.2.bb
@@ -57,6 +57,7 @@ export HOST_CXXFLAGS = "${BUILD_CXXFLAGS}"
 
 export AS = "${CC}"
 
+export MOZBUILD_STATE_PATH = "${WORKDIR}/mozbuild_state"
 export RUSTFLAGS
 
 JIT ?= ""

