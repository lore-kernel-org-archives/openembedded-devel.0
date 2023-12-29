Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 171A6C4707C
	for <webhook@archiver.kernel.org>; Fri, 29 Dec 2023 19:02:50 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
 by mx.groups.io with SMTP id smtpd.web11.155471.1703876563870832495
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Dec 2023 11:02:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=M0MZKrxT;
 spf=pass (domain: gmail.com, ip: 209.85.128.182, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-5e784ce9bb8so54480137b3.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 29 Dec 2023 11:02:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703876563; x=1704481363; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=udJYx4Ma0+gY9Wufo99bU6Kr2iySKq4fo7haODHpbbU=;
        b=M0MZKrxTiyFTceos9fXoB0vAtBySbaEyA7hYJfYhoI5GtoCojFwdMau3GRieRYXlJb
         7dKuXayxYO+TZ+lCRs+nuXsSKHRHfbkcAWl4g10ZWGbrhgVbZAEOy7GVwAHi5p+MRv1D
         TRfniEPNnVYQoTHNuxi7K8o0CXdceJfVVnbVyFDC4Om0ohxgEzCaSDpS02Qtzb8/2UnB
         9Xi+lwhe67Sn5uacY3tgUkPMq2ZsXWlWudp9Gd3pIuFh8E0d9DPorkmKVYtF7DeOvfV/
         Y0Ip0T0Vv8sbZmGlpGBHLwe3PLULjlzuInf5kRU/MGEGoRowQTRBYk8qgSMEMSJLb4A/
         DoHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703876563; x=1704481363;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=udJYx4Ma0+gY9Wufo99bU6Kr2iySKq4fo7haODHpbbU=;
        b=CousqQwwDyOsOllCoI5kPdZaVKt7iBKMhvPEgcyQigqOkdMaV6kO+iim4wuhjgcqQm
         HsT5sYJRl2CSOF9qJqGdoXgn9dpxurfP3D+LYG8ifMlnQ7efwh+y3yyF/riZ5ZLGvtQG
         KrFeM3lsIG1fNkea2jho8+QKe6XWoHbcUr7yr1pQ9tYCefx3gBxp1lAFNXAKsKZgLkTc
         B8O+nObxiNxrgHn9eo0CzErDkt9kF9QvZHY6oogea19CgZV/XIqL936cgV3oItBypC+6
         nAriAYqfioR0Mvg6k1BUD/Q9a33Fq4PZUkGAexlEeeY8Q7RyirvuXh8w8Z7FxsIFhmyy
         05rQ==
X-Gm-Message-State: AOJu0Yx5nJ+Fzpvm1jeFuA/JFlEx/eyvi62gtqmt4oeOv9shHiNIwQt0
	urc659082AwArt5I1McG6fQHZjH3hH2ehA==
X-Google-Smtp-Source: AGHT+IF6GgfIVELMq3xcsFVGDJ9uDOBa3bFEvzvEkpSxbBQQP4QSvW9Fwl7A5Jy+Gph/38lajee/XQ==
X-Received: by 2002:a81:404c:0:b0:5ee:bce2:cc45 with SMTP id m12-20020a81404c000000b005eebce2cc45mr2280414ywn.33.1703876562765;
        Fri, 29 Dec 2023 11:02:42 -0800 (PST)
Received: from keaua.caveonetworks.com ([2600:1700:9190:ba10:2080:c728:4a66:97cc])
        by smtp.gmail.com with ESMTPSA id d13-20020a81ab4d000000b005e71fbbc661sm8570683ywk.143.2023.12.29.11.02.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Dec 2023 11:02:42 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][nanbield][PATCH 11/17] dnf-plugin-tui: Recover BBCLASSEXTEND variants
Date: Fri, 29 Dec 2023 14:02:24 -0500
Message-Id: <20231229190230.135480-12-akuster808@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231229190230.135480-1-akuster808@gmail.com>
References: <20231229190230.135480-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 29 Dec 2023 19:02:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107893

From: Wang Mingyu <wangmy@fujitsu.com>

dnf-plugin-tui must work on nativesdk environment.
Now there's no warning when run the command "bitbake universe -c fetch".

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 5211242d3f9d4a03cbe9e8af9beed4096a344958)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-devtools/dnf-plugin-tui/dnf-plugin-tui_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-devtools/dnf-plugin-tui/dnf-plugin-tui_git.bb b/meta-oe/recipes-devtools/dnf-plugin-tui/dnf-plugin-tui_git.bb
index a5d614961a..8db456b99c 100644
--- a/meta-oe/recipes-devtools/dnf-plugin-tui/dnf-plugin-tui_git.bb
+++ b/meta-oe/recipes-devtools/dnf-plugin-tui/dnf-plugin-tui_git.bb
@@ -42,4 +42,6 @@ RDEPENDS:${PN} += " \
     dnf \
     libnewt-python \
 "
+BBCLASSEXTEND = "nativesdk"
+
 SKIP_RECIPE[dnf-plugin-tui] ?= "${@bb.utils.contains('PACKAGE_CLASSES', 'package_rpm', '', 'does not build correctly without package_rpm in PACKAGE_CLASSES', d)}"
-- 
2.34.1


