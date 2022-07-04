Return-Path: <davidegarde2000@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A873C43334
	for <webhook@archiver.kernel.org>; Mon,  4 Jul 2022 09:46:40 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web09.70625.1656927998049170420
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Jul 2022 02:46:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VJIUSBUg;
 spf=pass (domain: gmail.com, ip: 209.85.218.49,
 mailfrom: davidegarde2000@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id mf9so15847034ejb.0
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Jul 2022 02:46:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Cc8QZQUCVOrTLrbdWIwwKfjET2vkEojtjwdaWExJg8g=;
        b=VJIUSBUgPs6Gra8d87zEMsE8BvYLY/8P+Y+3hQ6C7pI6G+yxdta415wM8ga3/4VSuU
         BVlRSKqD0LJnfsugrs1uZTXGiqiEwgJbq8j9hAozqfvyTeQkHqd1U8VzY2ZwIabVe4Yg
         9jgKuRdFTXpWsHgC/tLw6dmH3Ke/gI2piq3KSdmeUQeM8nkE3adb6ypnF5msQjbZ0IhH
         VaDVGulzia04dE/DO6KxfeiKRRJ9ih4B1z+IiKIUrGrckKjK4znk9/lSBsyUGsc70nXu
         xZuu8RqV/uIlRF/qBHKFjODiFkN7FITzgk9/TRkDfA/PjIFacypWUcQasXCauIXo7Xmo
         R9rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Cc8QZQUCVOrTLrbdWIwwKfjET2vkEojtjwdaWExJg8g=;
        b=ZC2whZMOLfEsgzHnzTN13pk5htX0vD1Jg1TKIb9YOnVwBPynjRbjG+w4BG/P9WGylV
         G7BmGFaXsKPvGFDx+8+VimphVAtxk/5f9givKEXk/R4aY7t3lChMIBGizZBoz/uedi1k
         mbGsQnNe0fcMEuIXS+TEqKlbW9gM8CiSrhefzYZQpjkoMrLvfWtxzJ3NH6/3PyojO4I8
         uqFI3OXg88MnIW0erw9byjytSHGJn8ElS35QS943MMoG92mwawvfTyTjqHAkOJznteSk
         iOtxG5Gx478i6qCzFggF7tGUmKLXQrptYd8L3O2dy3pYlyHyDuwrtXXAiRLIq0WN3C7J
         T0aA==
X-Gm-Message-State: AJIora/r744yAGionOoUSLcN+s3+JZJWizFnDExceDWA/HYuGHb0uU8V
	DVAfmPvovElAvu7NEsrDBQuVA0ORXBM=
X-Google-Smtp-Source: 
 AGRyM1sLR2eFvNkMTLtLSwx8bumUiYDhpk9uuqDM+LXyAWULNRI4cHLgdIDOtWMGJ7SAmnKw/3FVZQ==
X-Received: by 2002:a17:907:3f88:b0:726:a6a3:750c with SMTP id
 hr8-20020a1709073f8800b00726a6a3750cmr28306509ejc.142.1656927996101;
        Mon, 04 Jul 2022 02:46:36 -0700 (PDT)
Received: from tony3oo3-XPS-13-9370.home
 (host-82-60-178-162.retail.telecomitalia.it. [82.60.178.162])
        by smtp.gmail.com with ESMTPSA id
 kv12-20020a17090778cc00b0072ac3f06615sm1469707ejc.133.2022.07.04.02.46.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Jul 2022 02:46:35 -0700 (PDT)
From: Davide Gardenal <davidegarde2000@gmail.com>
X-Google-Original-From: Davide Gardenal <davide.gardenal@huawei.com>
To: openembedded-devel@lists.openembedded.org
Cc: Davide Gardenal <davide.gardenal@huawei.com>
Subject: [meta-oe][master][kirkstone][PATCH v2] emlog: ignore unrelated CVEs
Date: Mon,  4 Jul 2022 11:40:55 +0200
Message-Id: <20220704094055.43185-1-davide.gardenal@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 04 Jul 2022 09:46:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97687

This product is not present in the NVD database but another
one with exactly the same name is in fact present. For that
reason cve-check is outputting CVEs that are unrelated so they
can be ignored.

Signed-off-by: Davide Gardenal <davide.gardenal@huawei.com>
---
Updates:
    -v2: fix typo
---
 meta-oe/recipes-core/emlog/emlog_git.bb | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/meta-oe/recipes-core/emlog/emlog_git.bb b/meta-oe/recipes-core/emlog/emlog_git.bb
index be9ae5823..e2dcd4633 100644
--- a/meta-oe/recipes-core/emlog/emlog_git.bb
+++ b/meta-oe/recipes-core/emlog/emlog_git.bb
@@ -24,3 +24,14 @@ do_install() {
 }
 
 RRECOMMENDS:${PN} += "kernel-module-emlog"
+
+# The NVD database doesn't have a CPE for this product,
+# the name of this product is exactly the same as github.com/emlog/emlog
+# but it's not related in any way. The following CVEs are from that project
+# so they can be safely ignored
+CVE_CHECK_IGNORE += "\
+    CVE-2019-16868 \
+    CVE-2019-17073 \
+    CVE-2021-44584 \
+    CVE-2022-1526 \
+"
-- 
2.34.1


