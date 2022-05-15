Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B894C4321E
	for <webhook@archiver.kernel.org>; Sun, 15 May 2022 13:49:40 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
 [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web12.16975.1652622579849676704
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 May 2022 06:49:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=MnsbJc9m;
 spf=pass (domain: gmail.com, ip: 209.85.215.173,
 mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f173.google.com with SMTP id 202so11757110pgc.9
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 May 2022 06:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=5UXGpwIvoiItHh5BnVs4ntwucACnrouaTsWlvlbSdRc=;
        b=MnsbJc9mIOBU/WWcKi7juadrqYMzZqCOL4ogzahuQFRDfZ5aDDRkgQHst7H6WAkBsw
         gNnfp735RhE5B+Fzt4vOo2Vm7mN6qNgaQ418ZJJlNuY5BxuOsTUQo0jvJuV5jZcueGac
         xBfDgPYZPG/pXhvAJgtD++70EvLl0eM4p+nLjNifjPRLy0MwgqIWG8LI4a7a8wgqhhBp
         3A5uVLY+34nBdFJ+vkrTOtw4yo7K5HBEKMhweRE0o57wZkgWSfjFtl982iH4rHHCP2q2
         RFg2/C7GNU3oclApC0r4AjT6X+j36W0d34EN3Tz30lrgljI0QqykcnPbyQmBAJkuwWBn
         KL/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5UXGpwIvoiItHh5BnVs4ntwucACnrouaTsWlvlbSdRc=;
        b=wYPCqsX4tEFy7HlcxzqkimJkCWYKhVir4IN3Kv8pqgIQR20UbOuSVmU+gnOzGZPI98
         LLSVhQu4DcdCG2qjz3ZoRSgMmImS1oQ5J6kBDAz7wo0Yw0bpcXMQ+1+tQuRcI8euSdZd
         LtfhHZibGa1/GjsJPfaPchFwS/sLHU3QCBb3GYWAxzR77pQd/bmLiZkGv+tHJNbynT+N
         NHCISpXXn6NK+hyS/z3BKbGEa53jxVBC1K7fjuWd1Fitq1CMsAa3AcDRqHBJBW8gtnbO
         DRb3X/8+aK0dWgj7aXX7QzF8KdMZbLAHUwcIFZzm+/LJpMeCCogL2evso+xVXiqdzzMw
         hneQ==
X-Gm-Message-State: AOAM5307aeEW56jZL6sgddfiI9xczdwNkMSW9WbR9PZnmC+rCSgAonwP
	CnRpraqIiMj7wh4TvDOWkllZWTxcn73u1Q==
X-Google-Smtp-Source: 
 ABdhPJz6WCO2WQhEpWPbYH2YztWlsyEN+2CgVpMvghtOOtQ+z9ZMZ97yoVcbDRBoBJcnOMxMLy4Izg==
X-Received: by 2002:aa7:962e:0:b0:50d:5ed8:aa23 with SMTP id
 r14-20020aa7962e000000b0050d5ed8aa23mr12989937pfg.43.1652622578914;
        Sun, 15 May 2022 06:49:38 -0700 (PDT)
Received: from keaua.caveonetworks.com
 ([2601:202:4180:a5c0:48be:3d3d:c26:7949])
        by smtp.gmail.com with ESMTPSA id
 z22-20020a63e556000000b003c644b2180asm4961650pgj.77.2022.05.15.06.49.38
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 May 2022 06:49:38 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [kirkstone 10/22] python3-astroid: upgrade 2.11.2 -> 2.11.3
Date: Sun, 15 May 2022 06:49:10 -0700
Message-Id: 
 <407b37fafc4061519945b2c3822296d1121aa2da.1652622481.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1652622481.git.akuster808@gmail.com>
References: <cover.1652622481.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 15 May 2022 13:49:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97107

From: Xu Huan <xuhuan.fnst@fujitsu.com>

Changelog:
==========
    Fixed an error in the Qt brain when building instance_attrs.
    Fixed a crash in the gi brain.

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 890bf7dffe0446feec625aa5eaf8e49fa88659a9)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../{python3-astroid_2.11.2.bb => python3-astroid_2.11.3.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-astroid_2.11.2.bb => python3-astroid_2.11.3.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-astroid_2.11.2.bb b/meta-python/recipes-devtools/python/python3-astroid_2.11.3.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-astroid_2.11.2.bb
rename to meta-python/recipes-devtools/python/python3-astroid_2.11.3.bb
index c52008ee65..a2e9111374 100644
--- a/meta-python/recipes-devtools/python/python3-astroid_2.11.2.bb
+++ b/meta-python/recipes-devtools/python/python3-astroid_2.11.3.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a70cf540abf41acb644ac3b621b2fad1"
 
-SRC_URI[sha256sum] = "8d0a30fe6481ce919f56690076eafbb2fb649142a89dc874f1ec0e7a011492d0"
+SRC_URI[sha256sum] = "4e5ba10571e197785e312966ea5efb2f5783176d4c1a73fa922d474ae2be59f7"
 
 inherit pypi setuptools3
 
-- 
2.25.1


