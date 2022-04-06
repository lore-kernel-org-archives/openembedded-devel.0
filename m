Return-Path: <ralph.siemsen@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EDFDC4321E
	for <webhook@archiver.kernel.org>; Wed,  6 Apr 2022 18:41:41 +0000 (UTC)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com
 [209.85.160.172])
 by mx.groups.io with SMTP id smtpd.web11.1482.1649269069239206114
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Apr 2022 11:17:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=B0M8Mutr;
 spf=pass (domain: linaro.org, ip: 209.85.160.172,
 mailfrom: ralph.siemsen@linaro.org)
Received: by mail-qt1-f172.google.com with SMTP id t2so5786533qtw.9
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Apr 2022 11:17:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iGMPZvA3UN2qv+N+Aj52LIlKyiOZurx9JJyAvXFfCa0=;
        b=B0M8MutrKOzEfmO3yVqeUjej+to7MjKRiZj0gswSoYHObWj1oZrjw4UsspTVFODquU
         RDcPYl12BCDtEOQ+tYJ1/5L0XXxA0h+CzUuro0IyI+offam9pOryU22Z6sly6xhJzWjQ
         Hkv2xsgYG/RhC+A9FeIAWsYcW4gUBxxNcfW7ck7U3Pr0jptTXB64oiCV2iM74PYGcy9b
         E4Y1NVOddlwAk7CXQLNTze5miNAabjCwEk1U85/IE3lGu80k8kNmo3lNwLqZLqFTQVFe
         MFZZsPcdUnYTIuQIlobUWsYavaeDrp/YA+umBbVe771X7nkYqnBVvW01aJIGVncBYeHY
         08zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iGMPZvA3UN2qv+N+Aj52LIlKyiOZurx9JJyAvXFfCa0=;
        b=UMvw4w+6vkSxPNolv6KI2uX2iO/RV35q15eXHGWiAXDDRmNN3PJZoY/KArhhL9Z4P7
         eaMf3bkz90RzK08PV+CS4nwn8v5sMwIgxS+ZS8cVQ9kSbqbJyhfZEaKgzzIGnsYeoFe4
         kZWFmxUnnL15GZ8tLOAcJhaDEYm6EKGWCx8gB48cairS8DEubmvoLGgJgM7M6rvZqNQM
         oee4f9xqe9R8yz4t7kwFFXW40i84IfoIdTH3QdBo0vpQFaUOusPYq7ZpOc/sMHZKmbI3
         E+mGNCWiQIs6ewYIr2ribd1dPAiasLrHM9RGzSf50V0zbF0ZQleN2NQqp3WfPAmBRN8D
         4Rpw==
X-Gm-Message-State: AOAM530jcOImUN9jznJD0XKRcpzmL8Z2uHv4NeO1+IYBpwl1YxaEQJCz
	SkXMoMAbSpwLnrjnOtQ9/IOnywbP4lR8rw==
X-Google-Smtp-Source: 
 ABdhPJyaT7Fz/qDaugOVIOczW8F3c331AjQgFM9euWLkOKHG1fmlsHlpM0tGFb16UGNn8XKSxYETaA==
X-Received: by 2002:a05:622a:15c7:b0:2eb:9af4:cdf4 with SMTP id
 d7-20020a05622a15c700b002eb9af4cdf4mr8433444qty.241.1649269068330;
        Wed, 06 Apr 2022 11:17:48 -0700 (PDT)
Received: from maple.netwinder.org (rfs.netwinder.org. [206.248.184.2])
        by smtp.gmail.com with ESMTPSA id
 f18-20020a05622a105200b002e1eb06ece3sm13447831qte.31.2022.04.06.11.17.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Apr 2022 11:17:47 -0700 (PDT)
From: Ralph Siemsen <ralph.siemsen@linaro.org>
To: openembedded-devel@lists.openembedded.org
Cc: ranjitsinhrathod1991@gmail.com,
	Ralph Siemsen <ralph.siemsen@linaro.org>
Subject: [dunfell][PATCH] polkit: fix overlapping changes in recent CVE
 patches
Date: Wed,  6 Apr 2022 14:17:39 -0400
Message-Id: <20220406181739.1403657-1-ralph.siemsen@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Apr 2022 18:41:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96440

Commit 17e931e77 ("polkit: fix CVE-2021-3560") contains
- upstream commit a04d13affe0fa53ff618e07aa8f57f4c0e3b9b81

Commit 67ec3e049 ("polkit: Fix for CVE-2021-4115") contains both:
- upstream commit a04d13affe0fa53ff618e07aa8f57f4c0e3b9b81 (CVE-2021-3560)
- upstream commit 41cb093f554da8772362654a128a84dd8a5542a7 (CVE-2021-4115)

Thus the fix for CVE-2021-3560 is applied twice, resulting in warnings
during do_patch. Curiously it neither fails nor complains about patch
already applied. Also devtool silently discards the duplicate patch.

Drop the duplicate patch, to resolve following warnings:

WARNING: polkit-0.116-r0 do_patch: Fuzz detected:

Applying patch 0001-GHSL-2021-074-authentication-bypass-vulnerability-in.patch
patching file src/polkit/polkitsystembusname.c
Hunk #1 succeeded at 438 with fuzz 2 (offset 3 lines).

Applying patch CVE-2021-4115.patch
patching file src/polkit/polkitsystembusname.c
Hunk #4 succeeded at 439 with fuzz 2.

Signed-off-by: Ralph Siemsen <ralph.siemsen@linaro.org>
---
 ...thentication-bypass-vulnerability-in.patch | 32 -------------------
 .../recipes-extended/polkit/polkit_0.116.bb   |  1 -
 2 files changed, 33 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/polkit/files/0001-GHSL-2021-074-authentication-bypass-vulnerability-in.patch

diff --git a/meta-oe/recipes-extended/polkit/files/0001-GHSL-2021-074-authentication-bypass-vulnerability-in.patch b/meta-oe/recipes-extended/polkit/files/0001-GHSL-2021-074-authentication-bypass-vulnerability-in.patch
deleted file mode 100644
index 2a2373ed5..000000000
--- a/meta-oe/recipes-extended/polkit/files/0001-GHSL-2021-074-authentication-bypass-vulnerability-in.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From a04d13affe0fa53ff618e07aa8f57f4c0e3b9b81 Mon Sep 17 00:00:00 2001
-From: Jan Rybar <jrybar@redhat.com>
-Date: Wed, 2 Jun 2021 15:43:38 +0200
-Subject: [PATCH] GHSL-2021-074: authentication bypass vulnerability in polkit
-
-initial values returned if error caught
-
-Upstream-Status: Backport [https://gitlab.freedesktop.org/polkit/polkit/-/commit/a04d13affe0fa53ff618e07aa8f57f4c0e3b9b81.patch]
-CVE: CVE-2021-4115
-Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
-
----
- src/polkit/polkitsystembusname.c | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/src/polkit/polkitsystembusname.c b/src/polkit/polkitsystembusname.c
-index 8daa12c..8ed1363 100644
---- a/src/polkit/polkitsystembusname.c
-+++ b/src/polkit/polkitsystembusname.c
-@@ -435,6 +435,9 @@ polkit_system_bus_name_get_creds_sync (PolkitSystemBusName           *system_bus
-   while (!((data.retrieved_uid && data.retrieved_pid) || data.caught_error))
-     g_main_context_iteration (tmp_context, TRUE);
- 
-+  if (data.caught_error)
-+    goto out;
-+
-   if (out_uid)
-     *out_uid = data.uid;
-   if (out_pid)
--- 
-GitLab
-
diff --git a/meta-oe/recipes-extended/polkit/polkit_0.116.bb b/meta-oe/recipes-extended/polkit/polkit_0.116.bb
index ac48cf6c2..dd8e20861 100644
--- a/meta-oe/recipes-extended/polkit/polkit_0.116.bb
+++ b/meta-oe/recipes-extended/polkit/polkit_0.116.bb
@@ -27,7 +27,6 @@ SRC_URI = "http://www.freedesktop.org/software/polkit/releases/polkit-${PV}.tar.
            file://0003-make-netgroup-support-optional.patch \
            file://CVE-2021-3560.patch \
            file://CVE-2021-4034.patch \
-           file://0001-GHSL-2021-074-authentication-bypass-vulnerability-in.patch \
            file://CVE-2021-4115.patch \
            "
 SRC_URI[md5sum] = "4b37258583393e83069a0e2e89c0162a"
-- 
2.25.1


