Return-Path: <alexyao1@meraki.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E5E3C7618E
	for <webhook@archiver.kernel.org>; Wed, 26 Apr 2023 17:08:05 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web10.1724.1682528882293064110
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Apr 2023 10:08:02 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@meraki.com header.s=google header.b=HOsLbGxL;
 spf=pass (domain: meraki.net, ip: 209.85.210.173, mailfrom: alex.yao@meraki.net)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-63b60366047so5830794b3a.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 26 Apr 2023 10:08:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=meraki.com; s=google; t=1682528881; x=1685120881;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=abv4HfhAbEJor5ZQmFCfAxktL/yijkaynTbP4Tlbz+4=;
        b=HOsLbGxLyHu/ETWm6/zmWbmLY5yb1oGuLpJBS8wiGkrADUuYhKcBLBEZQSM9XqZ3lN
         4NoprxLK5CETkrvoMUvOrP9vvxn7AQC6uNPp2tAs5d5LhQ4ogeKF0d+tYhMOYgz/Kllm
         cYhBVTF8Ns15Qir+2ortByPoZWWhcedOOFWL8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682528881; x=1685120881;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=abv4HfhAbEJor5ZQmFCfAxktL/yijkaynTbP4Tlbz+4=;
        b=Qxm7JproaFgthwk7zqkTr/r1hdAOccAJpe55/riVK+n2IrmVwqnulKS45ynKbIxn9S
         KmnAZE9Oz19aDpze54iid6TaZ5IViKAQrgd/3Be08/Ip68ab9C0DI0SUiAIgvmazlo8E
         b/4SoI/mCyUfNn+lj4vLdS9hwZ6jKYo/52ikcXcpW4ZKbYEOJhkJz6IcSAOptnA8o3Mr
         XxHjY2l7PyNpjHeqSdjj6ouqjyX/O/n+kkwR8bDGut0nSM9hAHh0OE2qto9uU/IKySbD
         QtnPiV5Av6/nlzMMK07tBknWEMFEM0tuoNzGk76S8RSQ5Zgg3uwH5kQtdAp9eFcc/lmN
         FYiA==
X-Gm-Message-State: AAQBX9fJ7wr52pPDBDIGNOwge/eglr1OwaeTkPX5vpJv2Z/O8J6jkFui
	2wY684odA87Ta233lPSmbJH9yhWeiiGwuc/xb+g=
X-Google-Smtp-Source: AKy350Z3lu2S1c7TU30ODDYcYXCtTDGCirtfsjZTwFSxVcfsMziho3l96MQWqJKrBMiaCmhUOvdxAg==
X-Received: by 2002:a05:6a00:17a9:b0:63d:2f13:1f3 with SMTP id s41-20020a056a0017a900b0063d2f1301f3mr34176373pfg.33.1682528881594;
        Wed, 26 Apr 2023 10:08:01 -0700 (PDT)
Received: from sdg988.meraki.com ([2620:12f:c000:115:d2e0:42ff:fe54:2ce8])
        by smtp.gmail.com with ESMTPSA id q22-20020a63e956000000b005033e653a17sm10025569pgj.85.2023.04.26.10.08.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Apr 2023 10:08:01 -0700 (PDT)
From: alexyao1@meraki.com
To: openembedded-devel@lists.openembedded.org
Cc: Alex Yao <alexyao1@meraki.com>
Subject: [meta-oe][PATCH] lcov: Fix homepage
Date: Wed, 26 Apr 2023 10:07:36 -0700
Message-Id: <20230426170736.32691-1-alexyao1@meraki.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 26 Apr 2023 17:08:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102199

From: Alex Yao <alexyao1@meraki.com>

Lcov moved to GitHub so fix the homepage.

Signed-off-by: Alex Yao <alexyao1@meraki.com>
---
 meta-oe/recipes-support/lcov/lcov_1.16.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/lcov/lcov_1.16.bb b/meta-oe/recipes-support/lcov/lcov_1.16.bb
index 6b9e050f0f..22d68814ee 100755
--- a/meta-oe/recipes-support/lcov/lcov_1.16.bb
+++ b/meta-oe/recipes-support/lcov/lcov_1.16.bb
@@ -1,5 +1,5 @@
 SUMMARY = "A graphical front-end for gcov"
-HOMEPAGE = "http://ltp.sourceforge.net/coverage/lcov.php"
+HOMEPAGE = "https://github.com/linux-test-project/lcov"
 DESCRIPTION = "LCOV is a graphical front-end for GCC's coverage testing \
 tool gcov. It collects gcov data for multiple source files and creates \
 HTML pages containing the source code annotated with coverage information. \
-- 
2.40.1


