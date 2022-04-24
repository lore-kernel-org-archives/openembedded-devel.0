Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCC95C47084
	for <webhook@archiver.kernel.org>; Mon, 25 Apr 2022 19:26:11 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web10.13951.1650769813824107159
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 23 Apr 2022 20:10:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Fg/I/ne8;
 spf=pass (domain: gmail.com, ip: 209.85.214.182,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id d15so19552373pll.10
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 23 Apr 2022 20:10:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zLaX2BXtbHO8QdcofcoQN/yuVYOPJcKLGdyPr5+U94s=;
        b=Fg/I/ne8fm4Hr9gSlSSjn5Lf0u1BQxde2jdAj+N5yp3fvr0TodHWeTQzDTDy27LLiU
         wYUr7GJoSyXfRF+QXQX5cht0U1fuxqDcwYVAHUCk8CSVYaY+vMt4OkRr36e5RKASLrxS
         FrjyZJVLMXXizAzy7KvcqJvmy7hTqDsm78Ysl7tILZN2R05ORdvsj0qUSI6zqvTsxwG3
         nopko1uHSS/G5T/oxbmWX5bVB8TuzKCmc33ZUFwbs8AOVoHOVwxPF8hlwMUFUWDIhMF5
         XORx0rv3knVYcv/7IfsMloa0wIgg9Qdn/RVQxhn4WbX9U1PcF8xMibiAcr3UigQAX3y+
         K65Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zLaX2BXtbHO8QdcofcoQN/yuVYOPJcKLGdyPr5+U94s=;
        b=2oNY7n38EIveGDs6JQwbbV50ZN74HHgI1H/5Q3HNuZMkbvlsK4w6YQOatV1MwVnokq
         yQcXxm8eiHEEsxCspBXMGYU4F0mA1GLwPmdSRTVt6dRVM//LbxSjp4FchV06f+iinBoL
         MAN3fxaf6bZ2CwzLsIOUUrOj98N2Vvg6DYK6ZU9M1UPwQQZzMxNyc/2Yi6hLZ8t1SB9P
         Li8dSpBnGiNR3uQLVH2+SEOYcow6RBZ4SazDyVX6TpxbqSHokSnMvcVfSBhO1G0LV85U
         0XLCqo//gNTqIH0oywgdh40yrVHlyBaeXeVELRZn58uEF/SweWRoZqTMJO3s6hC46nes
         l2hw==
X-Gm-Message-State: AOAM53154C9w1PmaZ40uSpwYUXFQ/YJWAQkLIWt2QicoEjc990gFzvui
	zzFtwxio1ZEIjbiGlWZYr36oIWd7G6Buww==
X-Google-Smtp-Source: 
 ABdhPJyImOX784Bb9m/iwguw0cYywH6In72XNfvoKy4BgcK3xW89QSoYuZzQ3az6PmOjxL895ZTVdg==
X-Received: by 2002:a17:90a:db45:b0:1d9:29d0:4c6e with SMTP id
 u5-20020a17090adb4500b001d929d04c6emr6618043pjx.46.1650769813158;
        Sat, 23 Apr 2022 20:10:13 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::2ca3])
        by smtp.gmail.com with ESMTPSA id
 q13-20020a17090a2e0d00b001cd4989feebsm10630987pjd.55.2022.04.23.20.10.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Apr 2022 20:10:12 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 08/12] babeld: Upgrade to 1.11
Date: Sat, 23 Apr 2022 20:10:00 -0700
Message-Id: <20220424031004.3209576-8-raj.khem@gmail.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220424031004.3209576-1-raj.khem@gmail.com>
References: <20220424031004.3209576-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 25 Apr 2022 19:26:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96745

Provide proper prefix so that install works correctly when using
usrmerge

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../babeld/{babeld_1.10.bb => babeld_1.11.bb}               | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-networking/recipes-protocols/babeld/{babeld_1.10.bb => babeld_1.11.bb} (80%)

diff --git a/meta-networking/recipes-protocols/babeld/babeld_1.10.bb b/meta-networking/recipes-protocols/babeld/babeld_1.11.bb
similarity index 80%
rename from meta-networking/recipes-protocols/babeld/babeld_1.10.bb
rename to meta-networking/recipes-protocols/babeld/babeld_1.11.bb
index 529cccf872..dd1d6931dc 100644
--- a/meta-networking/recipes-protocols/babeld/babeld_1.10.bb
+++ b/meta-networking/recipes-protocols/babeld/babeld_1.11.bb
@@ -12,8 +12,8 @@ SECTION = "net"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=411a48ac3c2e9e0911b8dd9aed26f754"
 
-SRC_URI = "git://github.com/jech/babeld.git;protocol=https;branch=master"
-SRCREV = "dbb8799d1b5b3bfaf4387386c92369c847704480"
+SRC_URI = "gitsm://github.com/jech/babeld.git;protocol=https;branch=master"
+SRCREV = "f82a10e97a02849cd82087863055c9af08ca3454"
 
 UPSTREAM_CHECK_GITTAGREGEX = "babeld-(?P<pver>\d+(\.\d+)+)"
 
@@ -24,6 +24,6 @@ do_compile () {
 }
 
 do_install () {
-	oe_runmake install.minimal PREFIX=${D}
+	oe_runmake install.minimal TARGET=${D} PREFIX=${root_prefix}
 }
 
-- 
2.36.0


