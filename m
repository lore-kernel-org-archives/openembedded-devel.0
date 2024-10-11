Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66062D0EE27
	for <webhook@archiver.kernel.org>; Fri, 11 Oct 2024 19:12:12 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web11.20199.1728673927894548364
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 11 Oct 2024 12:12:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lQmbxto4;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-20ca1b6a80aso8901865ad.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 11 Oct 2024 12:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728673927; x=1729278727; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ILvdECKnM+mQkCwysezGp1cgPvjg9oHNq+db8qtJNWY=;
        b=lQmbxto4NOirGNA4yrw206Y6e0kz7O/QklYV/qdRQ8EzcONUZMn1NR+kLThZ1GKKuJ
         bCSrjwSwCFILcAck8JaSkZ//c7ox+W18IzvT1jHHSb1xnNmnwu0JWGAF6JlnBUGOJMTQ
         oFHYww80so740tZEEBzz6s1U193LZ8yJfYsUsLB9cwioMeldvZ0nN6+9SuM2Ggo9DwhV
         uShX3EwdScH+zueQBCyViTi4gC31mdQ2FQNCOqAM4t8PzxkBI1p59iPZNIje8sFz312/
         YNI8ccG+F3AoTWc/T3lU4ZRyTPOTGzTYazCLGSvVacBdr8CahkLZk51PRmtEyPTPfrQ9
         n0/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728673927; x=1729278727;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ILvdECKnM+mQkCwysezGp1cgPvjg9oHNq+db8qtJNWY=;
        b=ZeaiiqCUrOkgCIg+ZtxLZUMkvrVjRopHXBGdvrHkKFKzy3a3TEg/MtPU/u8ihTR1NZ
         UCZQDs9EHTjkrL5XizCwsze+0CoLXUuql3fskAF76mIrEY5lICzmOSsIAMZTlupDVJNU
         hleyBu/nLtG8GVl/WXvMuLk91IyLiZnCRG7oEWe8EJDKQJ3qfgcy1/5zT9JsyES9K8l/
         OyOslAFH++k+bCkGqkFIAohYPjlSvsDmuW1NGV3A8zNdXqP0eo0XznN2acjbVL0W0tL0
         qhm36TrUDQhRdAzSMrWpnB2/IN4F92Fj8LAafJ3R67yWvy0uIQb4I9+YdYbcXSEd3gaG
         gdrg==
X-Gm-Message-State: AOJu0YzoKduvIMt3GV0DESiB2/jQmSXsvU4O4K1rROpzPu0Klvpc9/Bo
	OKqyTseodDp83/8HarH/w7Z8GahHmDEdNjd8EqtQiUj2sq2Etp2G3uf+DSEW
X-Google-Smtp-Source: AGHT+IF6/gE6UXbDpuZo+SLZ3XRS8WC2K5ty2qDPJPl5FsvS4ac+DTAkheH0WMOw0DSFLvHYreGHNQ==
X-Received: by 2002:a17:902:e852:b0:208:d856:dbb7 with SMTP id d9443c01a7336-20cbb240d37mr8488865ad.39.1728673926957;
        Fri, 11 Oct 2024 12:12:06 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::f083])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c8bc0ca82sm26584075ad.68.2024.10.11.12.12.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 12:12:06 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 1/2] python3-propcache: Fix ptest dependencies
Date: Fri, 11 Oct 2024 12:12:04 -0700
Message-ID: <20241011191205.808096-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 11 Oct 2024 19:12:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112813

Do not overwerite implicit dependencies, otherwise
ptests stop depending upon the correcpoding python module
resulting in runtime failures

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/recipes-devtools/python/python3-propcache_0.2.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-propcache_0.2.0.bb b/meta-python/recipes-devtools/python/python3-propcache_0.2.0.bb
index 5f9fbda5f1..69e0bed4be 100644
--- a/meta-python/recipes-devtools/python/python3-propcache_0.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-propcache_0.2.0.bb
@@ -16,7 +16,7 @@ DEPENDS += " \
 	python3-cython-native \
 "
 
-RDEPENDS:${PN}-ptest = " \
+RDEPENDS:${PN}-ptest += " \
 	python3-pytest \
 	python3-pytest-xdist \
 	python3-unittest-automake-output \

