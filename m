Return-Path: <jan.vermaete@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 869B2C43334
	for <webhook@archiver.kernel.org>; Sun, 17 Jul 2022 17:32:06 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web11.18001.1658079117888772783
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 Jul 2022 10:31:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=G7v+JpsH;
 spf=pass (domain: gmail.com, ip: 209.85.218.46,
 mailfrom: jan.vermaete@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id ss3so17533997ejc.11
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 Jul 2022 10:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wWrk0jXnzb/TK56ei4fHVOPG4DabSDwKWpwJCDIkLpk=;
        b=G7v+JpsHPd5Tg6htK+x3GDUV0KkEzr2emU2okkn+zbKfNyjzCjbYQtzx/r3L4Vstxx
         oskhdIVNjha039E4JaNtU2vxbrgYAMS5Vkgx9TELCpyubwopxgzk51AfCrMPMuIJCRw5
         r6dPaCQdMtyFpX3ijrUWMEb3QkStbg46Ur8ZsXNBD6tt598mKzuttfljkLOgH24sJbwO
         7ODFEqAgFCn5/y+1m24EnzUcxXMi2haOV9TrMaEzYQ4q8ye4hV8oMQm3Akq9FdJ3IPLg
         0PCCNEFMQeCfAaqFjqud7p5EhgtYG7cfy32H7drUIrpey8TUuakpb/WWic/8Z6DD8aI2
         wStg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wWrk0jXnzb/TK56ei4fHVOPG4DabSDwKWpwJCDIkLpk=;
        b=2KPzXFjzC/efw5EsxHIu1KSXJCc1VLx+6qJHqNeADkOm0RnxhPE3lqC7CiBIdsK6HO
         7YmNUs/yZz7Nl/CEXiI2Bs2WfQxJ2vIq3ORNsdgVa+ArEdNr4Ge/X9avSmUlMg/Sj/Lf
         8dvJecm7Ijp/yWAnC21cz7CrkFqZXUl1LBs9f4MoQHWV63uTT8yZwrfT5Hvg0lMuFKEE
         THHJe5punHrjzMuQF9Ul/rEA8FwX6IT7J1cLKdS+JF4x/M0ck1bf6KwY5v5lANxUReHK
         /6zI2RrblIXaoyZm+KaWn1ieuTZe0DDDiFVURLC9Sd5M5RbE5EED6egePQ0e90GLd18x
         cYhA==
X-Gm-Message-State: AJIora+pXoyUhVGLMcYWmF9d+bktX63uKNBlP7T5hk+LvF8sLnjtVel/
	bd9KQyAfPRlEDYNEpGZAVYCc3urCFKE=
X-Google-Smtp-Source: 
 AGRyM1uDLhqwKBBfl81JTIt1RTaZgFAGGhnIxSeDj7m9S8UIoOefCy3G0qAuBSDXjTed4jQAM5d7lQ==
X-Received: by 2002:a17:906:9b0a:b0:72b:4fc2:4b07 with SMTP id
 eo10-20020a1709069b0a00b0072b4fc24b07mr23273752ejc.700.1658079116109;
        Sun, 17 Jul 2022 10:31:56 -0700 (PDT)
Received: from localhost.localdomain
 (ptr-fij45r07ru9hofylq19.18120a2.ip6.access.telenet.be.
 [2a02:1812:512:2c00:fdf0:ba80:8823:350d])
        by smtp.gmail.com with ESMTPSA id
 h5-20020a1709067cc500b00726e108b566sm4587591ejp.173.2022.07.17.10.31.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jul 2022 10:31:55 -0700 (PDT)
From: Jan Vermaete <jan.vermaete@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jan Vermaete <jan.vermaete@gmail.com>
Subject: [meta-python][PATCH 3/3] python3-jsonrpcserver: added the
 python3-oslash rdepends
Date: Sun, 17 Jul 2022 19:31:36 +0200
Message-Id: <20220717173136.2777245-3-jan.vermaete@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220717173136.2777245-1-jan.vermaete@gmail.com>
References: <20220717173136.2777245-1-jan.vermaete@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 17 Jul 2022 17:32:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97862

This one is needed for version 5.0.7.
And should not be needed anymore for version 6.x.

Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
---
 .../recipes-devtools/python/python3-jsonrpcserver_5.0.7.bb     | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-jsonrpcserver_5.0.7.bb b/meta-python/recipes-devtools/python/python3-jsonrpcserver_5.0.7.bb
index 537fd3313..12e900379 100644
--- a/meta-python/recipes-devtools/python/python3-jsonrpcserver_5.0.7.bb
+++ b/meta-python/recipes-devtools/python/python3-jsonrpcserver_5.0.7.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Library to process JSON-RPC requests"
-HOMEPAGE = "https://github.com/bcb/jsonrpcserver"
+HOMEPAGE = "https://github.com/explodinglabs/jsonrpcserver"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=61b63ea9d36f6fb63ddaaaac8265304f"
 
@@ -16,6 +16,7 @@ RDEPENDS:${PN} += "\
     python3-logging \
     python3-netclient \
     python3-pkgutil \
+    python3-oslash \
 "
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.25.1


