Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2CFCC636D6
	for <webhook@archiver.kernel.org>; Thu, 16 Feb 2023 12:28:19 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.web10.8627.1676550481338422081
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Feb 2023 04:28:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=c195yngT;
 spf=pass (domain: gmail.com, ip: 209.85.219.50, mailfrom: akuster808@gmail.com)
Received: by mail-qv1-f50.google.com with SMTP id n9so1102696qvs.7
        for <openembedded-devel@lists.openembedded.org>; Thu, 16 Feb 2023 04:28:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OSjG0IBpi8FkDbjsaZsTZOf9Ezjg9OoSEXaxuT50RmI=;
        b=c195yngTnNlN60TLn/1ZWgQFs1E2BI1aH5oqZwYNdW7xS6p+iJbEZs4Gq0xLp9PE2R
         mtiZWlBUo1xvptVQsl9qyzDJkZjJ7zXDWAL6Mq2Em51Iczm5YY3FIFmbL5JwHK4E4voP
         R9XmRpl5gxgwMP/CupUeHKCyVWYx5gEcjYni89L/HoNDuRgKwb/slHKR1fNvp8P5FsFG
         tjJJeGO3uajw7Ng3y5pM1vAFyKw3bKAPq9Gk/nHYa88RcDBWE04z5xy6ItP0OBbj1OHt
         Nh9YgE95GPg74/JCSaSxpORd7m86shz5mLrs5Z7UGnleGqV3ZZVXeNd0eesfptAY5TVH
         rkcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OSjG0IBpi8FkDbjsaZsTZOf9Ezjg9OoSEXaxuT50RmI=;
        b=hCXhVpQOvKdq1BONTwHz44v1276xcBunssW580AGJuMk+Ta/2jc3B2iplyeSB50fq9
         W/0Zty3eYPImOgMNve40a1Iq/1oCYN/08XDA1RDi5yRlJ4C04ycuGZ6mAL5V3RkUB07a
         QhxGiJLKchVnHvbWVlkAZEoI6yWQsUnmleCJCl1++YN9i5zHKivRp/FnAugIChA+psbm
         Gl4XIM0JxDGddgDnvTrX9KJ7BNtj8/ShdtJF/b8k6woCDMlmnUk9Dqpv/ihINiUqEKX6
         JyHfKESPrXlOXCxqWJg2jHu9RK5WLKnaOMa5KHl3vxPGWN1aM48ZjM3iwWQVSnEx76qT
         sbYw==
X-Gm-Message-State: AO0yUKW0Vbw05isXliLzumH9eM5j1VDTk+qOTzUeYwb9hhq3WFKLMrNg
	4o+wsEekdxv0fqf1nF135CA0I2IA5l4=
X-Google-Smtp-Source: AK7set9BFwdBnfkzsUzabPt/DA/s4qaRC7gR3bFelv1oU2JPWfY325+kUvYmzg2eAnH+08JrsE0PuQ==
X-Received: by 2002:ad4:5949:0:b0:56a:b623:9b09 with SMTP id eo9-20020ad45949000000b0056ab6239b09mr10393244qvb.14.1676550489055;
        Thu, 16 Feb 2023 04:28:09 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:2ead:d6b6:b6e2:9e85])
        by smtp.gmail.com with ESMTPSA id t127-20020a379185000000b0073b4d9e2e8dsm1102362qkd.43.2023.02.16.04.28.08
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Feb 2023 04:28:08 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [langdale 13/15] tinyproxy: fix CVE-2022-40468
Date: Thu, 16 Feb 2023 07:27:23 -0500
Message-Id: <9fa9d2e3734e49c3c33d706c312643e82ad6f8b4.1676550369.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1676550369.git.akuster808@gmail.com>
References: <cover.1676550369.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Feb 2023 12:28:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101115

From: Chee Yang Lee <chee.yang.lee@intel.com>

Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 795ccdd86cad05c425adae15af27797f42f33c56)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../tinyproxy/tinyproxy/CVE-2022-40468.patch  | 33 +++++++++++++++++++
 .../tinyproxy/tinyproxy_1.11.1.bb             |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta-networking/recipes-support/tinyproxy/tinyproxy/CVE-2022-40468.patch

diff --git a/meta-networking/recipes-support/tinyproxy/tinyproxy/CVE-2022-40468.patch b/meta-networking/recipes-support/tinyproxy/tinyproxy/CVE-2022-40468.patch
new file mode 100644
index 0000000000..4e2157ca75
--- /dev/null
+++ b/meta-networking/recipes-support/tinyproxy/tinyproxy/CVE-2022-40468.patch
@@ -0,0 +1,33 @@
+From 3764b8551463b900b5b4e3ec0cd9bb9182191cb7 Mon Sep 17 00:00:00 2001
+From: rofl0r <rofl0r@users.noreply.github.com>
+Date: Thu, 8 Sep 2022 15:18:04 +0000
+Subject: [PATCH] prevent junk from showing up in error page in invalid
+ requests
+
+fixes #457
+
+https://github.com/tinyproxy/tinyproxy/commit/3764b8551463b900b5b4e3ec0cd9bb9182191cb7
+Upstream-Status: Backport
+CVE: CVE-2022-40468
+Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
+---
+ src/reqs.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/reqs.c b/src/reqs.c
+index bce69819..45db118d 100644
+--- a/src/reqs.c
++++ b/src/reqs.c
+@@ -343,8 +343,12 @@ static struct request_s *process_request (struct conn_s *connptr,
+                 goto fail;
+         }
+ 
++        /* zero-terminate the strings so they don't contain junk in error page */
++        request->method[0] = url[0] = request->protocol[0] = 0;
++
+         ret = sscanf (connptr->request_line, "%[^ ] %[^ ] %[^ ]",
+                       request->method, url, request->protocol);
++
+         if (ret == 2 && !strcasecmp (request->method, "GET")) {
+                 request->protocol[0] = 0;
+ 
diff --git a/meta-networking/recipes-support/tinyproxy/tinyproxy_1.11.1.bb b/meta-networking/recipes-support/tinyproxy/tinyproxy_1.11.1.bb
index 86f57d88ff..999deff4de 100644
--- a/meta-networking/recipes-support/tinyproxy/tinyproxy_1.11.1.bb
+++ b/meta-networking/recipes-support/tinyproxy/tinyproxy_1.11.1.bb
@@ -7,6 +7,7 @@ SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BP}.tar.gz
            file://disable-documentation.patch \
            file://tinyproxy.service \
            file://tinyproxy.conf \
+           file://CVE-2022-40468.patch \
            "
 
 SRC_URI[sha256sum] = "1574acf7ba83c703a89e98bb2758a4ed9fda456f092624b33cfcf0ce2d3b2047"
-- 
2.25.1


