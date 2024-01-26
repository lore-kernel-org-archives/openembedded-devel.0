Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 181E5C47DDB
	for <webhook@archiver.kernel.org>; Fri, 26 Jan 2024 21:48:48 +0000 (UTC)
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
 by mx.groups.io with SMTP id smtpd.web10.2233.1706305726555905180
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Jan 2024 13:48:46 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.43, mailfrom: straka.derek@gmail.com)
Received: by mail-io1-f43.google.com with SMTP id ca18e2360f4ac-7bc32b04d16so37675739f.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 26 Jan 2024 13:48:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706305725; x=1706910525;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZYX14/e2WN+cxCOByvifroggeVL8yisAO2Zf0bzGgBY=;
        b=YwnQG6rFUm3ucrroYK7qa1emCNfvRC5VdI9IYYjR0VROStXAQHoCw22As4sRPXuz5i
         LmREJujH8MrjeMybwsCf18ttZfPIHCBr94mpITZALYXgleUBIxnvO628ad4I/Ttq1/fP
         /TzqdyjBNYrQS/B2eapGmRuDPe9j32wCmiWyseNwVq3igNr5n2tke3iKYDyzqXc6wWir
         O76YlDd0qzeGSTXhSDAUPR+938o5xdtr0AITChkJvrtjOKaM+jg0ERQ1aRhDHwU1X1d7
         59m7fj81TkQZQ30pptXmBj//op5rJsBnIu0PMe3tpIiWsKEvCj9Bvy9pPdREdenlAPQL
         mlWg==
X-Gm-Message-State: AOJu0YxHHwuCHcd9uhXo22AyZvLhZVNmuaoLPYZXx4TIPssUvlaRL0Wg
	/R6jklxBWqv2BuXWLPVrY47hKsftXyuh7zrd11o1o89bz5GwSxEA3A7Zvf73OphnAAXe
X-Google-Smtp-Source: AGHT+IE7TKwBYXtpmzx40NSFbwbrpZctyaxxUGyt7Gyq/2+IoCpgQKO0kaEISHKiyPrSXJyddiL6UA==
X-Received: by 2002:a6b:ea05:0:b0:7bf:1ddd:f3a2 with SMTP id m5-20020a6bea05000000b007bf1dddf3a2mr608104ioc.8.1706305724999;
        Fri, 26 Jan 2024 13:48:44 -0800 (PST)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id u5-20020a5edd45000000b007bf306f0d44sm560468iop.52.2024.01.26.13.48.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 13:48:44 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH] python3-argh: update to version 0.31.2
Date: Fri, 26 Jan 2024 21:48:34 +0000
Message-Id: <20240126214834.1592528-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 26 Jan 2024 21:48:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108475

Remove a redundant checksum that changes with every release.  Leverage the COPYING file instead

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/{python3-argh_0.31.0.bb => python3-argh_0.31.2.bb}  | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-argh_0.31.0.bb => python3-argh_0.31.2.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-argh_0.31.0.bb b/meta-python/recipes-devtools/python/python3-argh_0.31.2.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-argh_0.31.0.bb
rename to meta-python/recipes-devtools/python/python3-argh_0.31.2.bb
index 24a579fb9..afcd7d966 100644
--- a/meta-python/recipes-devtools/python/python3-argh_0.31.0.bb
+++ b/meta-python/recipes-devtools/python/python3-argh_0.31.2.bb
@@ -12,10 +12,9 @@ tool; Argh just makes it easy to use."
 
 LICENSE = "LGPL-3.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING.LESSER;md5=3000208d539ec061b899bce1d9ce9404 \
-                    file://README.rst;beginline=261;endline=275;md5=ba124578a6853962d5038eabef535d12 \
                     "
 
-SRC_URI[sha256sum] = "b93093544309ddbfe6c73dc9bfd60dbc4acecef39f3f464774b3084a1ec5d7b0"
+SRC_URI[sha256sum] = "db1c34885804f7d4646c385dc2fb19b45298561322f4c15eae1b133993f9e323"
 
 inherit pypi python_flit_core
 
-- 
2.34.1


