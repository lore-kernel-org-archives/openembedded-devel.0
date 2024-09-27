Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6F73CF6493
	for <webhook@archiver.kernel.org>; Sat, 28 Sep 2024 12:54:14 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web11.1371.1727470648051018663
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Sep 2024 13:57:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@loftorbital.com header.s=google header.b=Dv9FfRdS;
 spf=pass (domain: loftorbital.com, ip: 209.85.214.176, mailfrom: charlie.johnston@loftorbital.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-206aee4073cso28659985ad.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 27 Sep 2024 13:57:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=loftorbital.com; s=google; t=1727470647; x=1728075447; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Q2ZBVq5U4m0ga2xX8IzLleNJnJzvxVhk2cJSIDofzcQ=;
        b=Dv9FfRdSoEtJDBTqCm477/fvptjtIYz48TKwA/r6BF+H1freMC5+ype+SHDV+DnkkC
         /yNzlG4tmyx6PwdPMss9Lx1jARaw+DZZmi29Kza6caw+pv4ZT7xRLYXAXhvIpp1CQIYV
         2+Jn91guIBb5A5Tfx5vFotiQTQydHh8mcAAn8zPyup//qj/Ji5GKrznOUXHXiyWoBCDE
         F2uOkqtLhhIbPPq7fkzMt64q7cnzEN4NKP3hkC1etko+1Cwxt7DxnZjdP/zB7a/iRRfq
         +eKueci3oCZ3b8V2UhgM5yvrjagGnZWpQBi72P7kILwcT3CtjzypB0sMD/1b2MhZrW7X
         cTdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727470647; x=1728075447;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q2ZBVq5U4m0ga2xX8IzLleNJnJzvxVhk2cJSIDofzcQ=;
        b=dgRKFmxvBBQ/MMqGMl/5bpHXSbnax2bfyfzyzT8+HOle3rxt8qXaBlTaRFytIWMchl
         tqzBCum/kkmy6wZU5maOyP1JRuQyMAfzo+KYXpc4s8YkjOwEwUxcuXVCk9eebUEDZBNG
         AmGxwF2M2cjOqFXgA/uMsLCk2Jjqvs+M220S8t0x6q17RH7ya38GmwuGKgF/uLUobJvC
         pQpqR32UgEDk1+LMsQVB8ksI1TGtLiguHlVpPDlkzqCk8xPS7g08AZ/Xus8EsPIqzevD
         bQpgig/T1X1Yg30RvnC5Nil+ogfGNpsh80KWQNKTQK5TJyGN1vs5Aqz7b7LUeFIrPgkM
         RYGg==
X-Gm-Message-State: AOJu0YxuHg6kZqo2ypLtLxCGkhxTGMDBnT0MLpNPda5oY4+9gO4Zv3lX
	g1HkzsRhRT7IAGIqF50seM1eiarBr6AeUuL21saGGCCkG2a8eIU+YX+crC9y8aZOVJc+uCRc8AG
	r
X-Google-Smtp-Source: AGHT+IE5N++B0aybpVdJTqCRTVyHl5Rb3KPrDvdDE2c7fHDQeQpZ/YcIDXmlOOeRFEg7NWSAXC+upg==
X-Received: by 2002:a17:902:db09:b0:20b:44e1:b489 with SMTP id d9443c01a7336-20b44e1b693mr38585805ad.13.1727470647281;
        Fri, 27 Sep 2024 13:57:27 -0700 (PDT)
Received: from cjohnsto-vivado-vm.tail48d8e.ts.net ([12.172.216.189])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20b37d8ccfcsm17550845ad.72.2024.09.27.13.57.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Sep 2024 13:57:26 -0700 (PDT)
From: "Charlie Johnston" <charlie.johnston@loftorbital.com>
To: openembedded-devel@lists.openembedded.org
Cc: Charlie Johnston <charlie.johnston@loftorbital.com>
Subject: [meta-oe][kirkstone][PATCH] libdevmapper: Add inherit nopackages since PACKAGES is empty.
Date: Fri, 27 Sep 2024 13:57:16 -0700
Message-Id: <20240927205716.1656303-1-charlie.johnston@loftorbital.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 28 Sep 2024 12:54:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112541

Recent commits to buildhistory uncovered a build error here. Since
the recipe does not build packages, the find performed in
buildhistory_list_pkg_files was failing but was previously covered
up by a for loop.

(Introduced by OE-Core kirkstone rev: e4de762adbfa38af7c5fdc86b46c840e77f4f984)

Signed-off-by: Charlie Johnston <charlie.johnston@loftorbital.com>
---
 meta-oe/recipes-support/lvm2/libdevmapper_2.03.11.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/lvm2/libdevmapper_2.03.11.bb b/meta-oe/recipes-support/lvm2/libdevmapper_2.03.11.bb
index be558ce1d..1264e4784 100644
--- a/meta-oe/recipes-support/lvm2/libdevmapper_2.03.11.bb
+++ b/meta-oe/recipes-support/lvm2/libdevmapper_2.03.11.bb
@@ -13,5 +13,6 @@ do_install() {
 
 # Do not generate package libdevmapper
 PACKAGES = ""
+inherit nopackages
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.34.1


