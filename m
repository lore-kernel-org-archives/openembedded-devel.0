Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AAB1E7717F
	for <webhook@archiver.kernel.org>; Thu, 12 Dec 2024 23:25:19 +0000 (UTC)
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
 by mx.groups.io with SMTP id smtpd.web11.4489.1734045916350324940
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Dec 2024 15:25:16 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.161.52, mailfrom: straka.derek@gmail.com)
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-5f2d7868ef0so357265eaf.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 12 Dec 2024 15:25:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734045915; x=1734650715;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mKUq1YlIPmhJH0j86qnKUG9dF3zjSccwKWKMKWDUNWU=;
        b=CVoQcaRC9cRd1muyRVyOXp6+dl9jEIxaSwqM7lPvtLZrxzTx+IfknoQtwhcJXFBWV+
         91JH40rjf+KimOwbpsCnIykxq/0hlKpNfSnLssQBd4soQeeSjlGJrlgbNwW8pVQIsn3B
         p9NlKI6tD+xdKe6y/8xWYXeof+kabRwHop9iKJnMh9FcJ6YzdPrn2l2pCyJ+ArKEWGw7
         WUgoojahZ2lumccW/NXCtHYzju0PMC+9KBabRctM24GnzrFSIj422FEXpkCYv56+Wbap
         v4BS2H/X8J2iiMrSSNhF+YP1hhcLzsyVJfmXaWFvhg8TbjLoY0oKne87i9ZnstUG/Ec7
         VKkg==
X-Gm-Message-State: AOJu0Ywcu0LPOANPmWvy5jP37lJHUgsl2bkSASnGkvGhPAYxzrZvGc61
	H2LF4lASTknh//4keyNcJ3WQZ4EDK31/eNqRHpPE1PMvjQPf3VUTRSrjQg==
X-Gm-Gg: ASbGncs3pWEJr8xSQ7u6sdEbdcDxqOVnqKuOQSa+eyrezwT1ntKjQG6MjYi7tIv5L96
	0H8o0XCucfHcF+7Sw4k1FQqW6iIP/trDMB7n5MEGEdqDgJjDVJNdr20YOOI9I940TgpSZCvlOBq
	sgzsrKI51IGSakaVUqkglUKLORLjUsAnYnfkDKHH7PSlTdcLQWxxiZ7mFG/6g1FbT7aeVLzwlKy
	b9mxKY0N9QcgOjY6X/jwYlVOZBQ7hS3sAaWTBph5V5YG79qUXiUVNYp9OHa14OJqOTer8DYcBx3
	/SSKMjq9bTd1I93/6iHeAB6P9A==
X-Google-Smtp-Source: AGHT+IEdFRYQs99ymY+H7onklqhw6DDEtLbXFtUG1lm4gI1QDNZk14ITrVlZaO2jsMLq+x3PvPcoEg==
X-Received: by 2002:a05:6870:5492:b0:29e:40f8:ad9b with SMTP id 586e51a60fabf-2a3ac5d3518mr328729fac.14.1734045915045;
        Thu, 12 Dec 2024 15:25:15 -0800 (PST)
Received: from alpha.lab.asterius.io (c-24-118-24-24.hsd1.mn.comcast.net. [24.118.24.24])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-29f787f90d7sm4172368fac.31.2024.12.12.15.25.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 15:25:13 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH] python3-janus: update to version 1.1.0
Date: Thu, 12 Dec 2024 23:25:05 +0000
Message-Id: <20241212232505.3555157-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 Dec 2024 23:25:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114306

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/{python3-janus_1.0.0.bb => python3-janus_1.1.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-janus_1.0.0.bb => python3-janus_1.1.0.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-janus_1.0.0.bb b/meta-python/recipes-devtools/python/python3-janus_1.1.0.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-janus_1.0.0.bb
rename to meta-python/recipes-devtools/python/python3-janus_1.1.0.bb
index c709bcfbf..a5f251f62 100644
--- a/meta-python/recipes-devtools/python/python3-janus_1.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-janus_1.1.0.bb
@@ -3,7 +3,7 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=23878c357ebb4c8ce1109be365043349"
 
-SRC_URI[sha256sum] = "df976f2cdcfb034b147a2d51edfc34ff6bfb12d4e2643d3ad0e10de058cb1612"
+SRC_URI[sha256sum] = "0634df8b2b31f8afda4311abcf7fea912686fef717d13769eeaa01ae08d2b84c"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.34.1


