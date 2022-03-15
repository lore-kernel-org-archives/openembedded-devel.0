Return-Path: <ralph.siemsen@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 527E1C433F5
	for <webhook@archiver.kernel.org>; Tue, 15 Mar 2022 18:17:26 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com
 [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.web10.14861.1647368245128545411
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Mar 2022 11:17:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=b12BXGdA;
 spf=pass (domain: linaro.org, ip: 209.85.219.51,
 mailfrom: ralph.siemsen@linaro.org)
Received: by mail-qv1-f51.google.com with SMTP id eq14so155420qvb.3
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Mar 2022 11:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=W6M53Zn5aMPR3ZVABhSqv/COWYg7PejS4vH/vC6+ru0=;
        b=b12BXGdAgO8lbtC/Dnx5ScQeCAr40d5Um1Py1gVatpqAhD57igy+mSb6E00MhBEOch
         sYRm/kis3zCfeI5o6l1PXPFGqfNaIOsCAOv8jIMdz3dH1FmBdjEDxENrYC3cDY73uhX3
         jvNP7cVo71HXfPfeh9jLy9+eKhDbmt8nGAPZw3AtRFCHmXw8RXraLXgdhiLhbJ+5qJSm
         OCHuEH/q79gFJlIHVspBZAKkIHNDAEGvn0nQPZq3VP6c6w4ttVCGJtSbzEm+qzYtkIOk
         Zw0zxRn+cfeghmO9Ruj6zG+xk9Qw1svuMvq6ChxE1wKNCiRy8YwY1TO34VE4Uqo1E75k
         JWVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=W6M53Zn5aMPR3ZVABhSqv/COWYg7PejS4vH/vC6+ru0=;
        b=m3U46bqZLWNX0Jum45J505xMtBTaahDwYJkjUrss+IIte9QnGjmzA+fdUGWf7IvX3p
         sYCDJLJAzx3uLY9fAPNbvLowkdjwI810eI6+t0S0+holrB2cRed9aKCDpSI7o+4TsGZ2
         p0BmNwUafXP/K7snw/8hGyII2i/48QRnQYZiUqNRadxW1dPEBgQUTvQxbTPYbvHbzfGk
         dV9oGBlPGoKYjh2t8WxLfZDPPZZ+B7p8/X/7sCtfUgN5CpWlF+eyBSWVsOHW2S61yILP
         ccRMypeB7RVzX8X39Nzur6vufv7+D49FCGTXAQ0imSIoDX7uBcjOwol0sCNZyarVXPoh
         pZ8Q==
X-Gm-Message-State: AOAM531kGF6JZ0QMnNtHGX11gbfYaFBtez9dMlLy6FTiZOozWK7axOPx
	NLM4ofzjFCtohLVbS3oGGDWq7BW86U3zBQ==
X-Google-Smtp-Source: 
 ABdhPJwyELFD6dMNJ4getiX+kU/sWWeHxXGnblX3Kyxc/EhZWHq8H+iCST2wx3m2frDh8VjI81tNug==
X-Received: by 2002:a05:6214:301a:b0:435:a50d:91fa with SMTP id
 ke26-20020a056214301a00b00435a50d91famr22740964qvb.124.1647368244210;
        Tue, 15 Mar 2022 11:17:24 -0700 (PDT)
Received: from maple.netwinder.org (rfs.netwinder.org. [206.248.184.2])
        by smtp.gmail.com with ESMTPSA id
 q26-20020ae9e41a000000b0067d1a20872fsm9641609qkc.94.2022.03.15.11.17.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Mar 2022 11:17:23 -0700 (PDT)
From: Ralph Siemsen <ralph.siemsen@linaro.org>
To: openembedded-devel@lists.openembedded.org
Cc: Mingli Yu <mingli.yu@windriver.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ralph Siemsen <ralph.siemsen@linaro.org>
Subject: [meta-oe][dunfell][PATCH] polkit: fix CVE-2021-3560
Date: Tue, 15 Mar 2022 14:17:08 -0400
Message-Id: <20220315181708.3193573-1-ralph.siemsen@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 15 Mar 2022 18:17:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96001

From: Mingli Yu <mingli.yu@windriver.com>

Backport a patch [1] to fix CVE-2021-3560.

[1] https://gitlab.freedesktop.org/polkit/polkit/-/commit/a04d13affe0fa53ff618e07aa8f57f4c0e3b9b81

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>

Squashed together 6000f5a3b and 7f4f1ee71
Signed-off-by: Ralph Siemsen <ralph.siemsen@linaro.org>
---
 .../polkit/polkit/CVE-2021-3560.patch         | 33 +++++++++++++++++++
 .../recipes-extended/polkit/polkit_0.116.bb   |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta-oe/recipes-extended/polkit/polkit/CVE-2021-3560.patch

diff --git a/meta-oe/recipes-extended/polkit/polkit/CVE-2021-3560.patch b/meta-oe/recipes-extended/polkit/polkit/CVE-2021-3560.patch
new file mode 100644
index 000000000..76308ffdb
--- /dev/null
+++ b/meta-oe/recipes-extended/polkit/polkit/CVE-2021-3560.patch
@@ -0,0 +1,33 @@
+From a04d13affe0fa53ff618e07aa8f57f4c0e3b9b81 Mon Sep 17 00:00:00 2001
+From: Jan Rybar <jrybar@redhat.com>
+Date: Wed, 2 Jun 2021 15:43:38 +0200
+Subject: [PATCH] GHSL-2021-074: authentication bypass vulnerability in polkit
+
+initial values returned if error caught
+
+CVE: CVE-2021-3560
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/polkit/polkit/-/commit/a04d13affe0fa53ff618e07aa8f57f4c0e3b9b81]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ src/polkit/polkitsystembusname.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/src/polkit/polkitsystembusname.c b/src/polkit/polkitsystembusname.c
+index 8daa12c..8ed1363 100644
+--- a/src/polkit/polkitsystembusname.c
++++ b/src/polkit/polkitsystembusname.c
+@@ -435,6 +435,9 @@ polkit_system_bus_name_get_creds_sync (PolkitSystemBusName           *system_bus
+   while (!((data.retrieved_uid && data.retrieved_pid) || data.caught_error))
+     g_main_context_iteration (tmp_context, TRUE);
+ 
++  if (data.caught_error)
++    goto out;
++
+   if (out_uid)
+     *out_uid = data.uid;
+   if (out_pid)
+-- 
+2.29.2
+
diff --git a/meta-oe/recipes-extended/polkit/polkit_0.116.bb b/meta-oe/recipes-extended/polkit/polkit_0.116.bb
index 77288b008..eaf4187cb 100644
--- a/meta-oe/recipes-extended/polkit/polkit_0.116.bb
+++ b/meta-oe/recipes-extended/polkit/polkit_0.116.bb
@@ -25,6 +25,7 @@ PAM_SRC_URI = "file://polkit-1_pam.patch"
 SRC_URI = "http://www.freedesktop.org/software/polkit/releases/polkit-${PV}.tar.gz \
            ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)} \
            file://0003-make-netgroup-support-optional.patch \
+           file://CVE-2021-3560.patch \
            file://CVE-2021-4034.patch \
            "
 SRC_URI[md5sum] = "4b37258583393e83069a0e2e89c0162a"
-- 
2.25.1


