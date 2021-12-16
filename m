Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DD2AC4332F
	for <webhook@archiver.kernel.org>; Thu, 16 Dec 2021 15:23:40 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web08.11881.1639668219527853815
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Dec 2021 07:23:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Ba2HOcvA;
 spf=pass (domain: gmail.com, ip: 209.85.214.175,
 mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id c6so841869plg.3
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Dec 2021 07:23:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=4jq7p5GDh+EOA3VfsqRY8n36HNiVZi7z9NPOPZUY23E=;
        b=Ba2HOcvAGDlI8r9do4es5jXECm2DbOnhqb12P6LDsJrErUnXKPA/C7ZZ/3e6IyyHt0
         YPl3ss5zJ1DdPuC+kXF0quqlQWrMxPgurAdoaxvXAbd35mgQ3W47e/4OZvLOri8FXiGD
         i8O/0CgGBbbpU43h7vLXb2vWQG3lY9hK+Na5zzOsos65k0KHJQBJeLYxDafl/EHrvlvP
         vuol1ZdQCoW3tDDs3g/u37Qp++Q4wqcSGXrCZ7nswyN6reQRMznuytegcruybWOVm5V8
         VK0RDTkPjiszJv3uhWTn1QMNT1O7HWAWJ4Wd9NmVhZ8NQdmqzt5LzGBBvEx4GmmWmzLS
         EoeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4jq7p5GDh+EOA3VfsqRY8n36HNiVZi7z9NPOPZUY23E=;
        b=RqNFpbsrWDnRs1OSkdaNbVPqXRk8WoRe4kKj7hEI7jonHPceibBC62p5CTMM6uNhGb
         3pMUKCJSmfUel/TE/zJ5SY5GyOA6JIixsguSjVO/PC3ivvQhnJrcU3Ws9OMqLcLGJorM
         TR9mEquV9gKXN2qqSNr3AfRMkPTgXHRDAmbS6fxxtP8QcHG7NE8yXa76izaTu4Os19hy
         0eSmzHasuYTQGVhjHLXdGB/O6gF77oNA9AiWtEnJL/Wk47Tf2gevdErxaYTZpeyhUCIA
         cf6W1Jze6t0zhInP9j9T8tpRPkziN8h/ozSGSw9Wz1WP9ney9/UcovREBTkbIhkfAfVz
         RMjg==
X-Gm-Message-State: AOAM531ryhEFIr0Vz8rUmlMHwXHwH1ONkbZj0Nx7HNCp+L7dCqMZ0Kv1
	PCnsKSzgAxKkrUi0E2/KdlOBNqn+d+s=
X-Google-Smtp-Source: 
 ABdhPJzSykyJWfRl+cadBefSGzFKR7FKPeeT7MSvbmEEHCxypivIjDprkAjuYQTsCSJF5KvZh8x8RQ==
X-Received: by 2002:a17:902:db12:b0:142:3ac:7ec3 with SMTP id
 m18-20020a170902db1200b0014203ac7ec3mr17160516plx.2.1639668218834;
        Thu, 16 Dec 2021 07:23:38 -0800 (PST)
Received: from keaua.hsd1.ca.comcast.net
 ([2601:202:4180:a5c0:7d7:ca51:b150:8ee7])
        by smtp.gmail.com with ESMTPSA id
 k15sm6795703pff.215.2021.12.16.07.23.38
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Dec 2021 07:23:38 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [honister 14/18] python3-lxml: set precise BSD license
Date: Thu, 16 Dec 2021 07:23:19 -0800
Message-Id: 
 <f9707f700ec6b7f2128ceebf3b9ffec844b4a15e.1639668121.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1639668121.git.akuster808@gmail.com>
References: <cover.1639668121.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Dec 2021 15:23:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94399

From: Ross Burton <ross@burtonini.com>

"BSD" is ambiguous, use the precise license BSD-3-Clause.

Also update the HOMEPAGE.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
(cherry picked from commit 45e5b27db6f34cefeb4d66197161fbfa9ebd476a)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-python/recipes-devtools/python/python3-lxml_4.6.3.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-lxml_4.6.3.bb b/meta-python/recipes-devtools/python/python3-lxml_4.6.3.bb
index 669c2eaeeb..d5594847f4 100644
--- a/meta-python/recipes-devtools/python/python3-lxml_4.6.3.bb
+++ b/meta-python/recipes-devtools/python/python3-lxml_4.6.3.bb
@@ -4,9 +4,9 @@ libxslt libraries. It provides safe and convenient access to these \
 libraries using the ElementTree API. It extends the ElementTree API \
 significantly to offer support for XPath, RelaxNG, XML Schema, XSLT, \
 C14N and much more."
-HOMEPAGE = "http://codespeak.net/lxml"
+HOMEPAGE = "https://lxml.de/"
 SECTION = "devel/python"
-LICENSE = "BSD & GPLv2 & MIT & PSF"
+LICENSE = "BSD-3-Clause & GPLv2 & MIT & PSF"
 LIC_FILES_CHKSUM = "file://LICENSES.txt;md5=e4c045ebad958ead4b48008f70838403 \
                     file://doc/licenses/elementtree.txt;md5=eb34d036a6e3d56314ee49a6852ac891 \
                     file://doc/licenses/BSD.txt;md5=700a1fc17f4797d4f2d34970c8ee694b \
-- 
2.25.1


