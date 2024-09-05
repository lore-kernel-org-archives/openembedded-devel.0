Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A58A4CD5BA3
	for <webhook@archiver.kernel.org>; Thu,  5 Sep 2024 09:30:26 +0000 (UTC)
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web11.5266.1725528619740945034
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Sep 2024 02:30:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=3xubVLm0;
 spf=pass (domain: smile.fr, ip: 209.85.221.66, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f66.google.com with SMTP id ffacd0b85a97d-374c180d123so281003f8f.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 05 Sep 2024 02:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1725528617; x=1726133417; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VXOuy6T56whQocQB30dLkLyF/AdPR2TFzYLgRw1HZmw=;
        b=3xubVLm0H3BM/5rZOT1+bFQDjJr/9mMdcRFokIOQu8YSHBr7dlaKyI2O0ez752drPM
         ePmhm8KZk+QrMbfxHXwvzWzGs0Hr/VgIgnQsqGsSz7OGlbENYA/XQnppNvCXP81POGyE
         505zg6DR+tt13UMJlk76qn0FGuVqCAsqY1tfI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725528617; x=1726133417;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VXOuy6T56whQocQB30dLkLyF/AdPR2TFzYLgRw1HZmw=;
        b=EyeG8n9MwSj6Ih1SLhRCxDAjrkAJhv7BsrjjMWFQgnERoJ2DAh68Vk9jnnCknB7Il2
         s0RzvCLLoS7MSh28CY9wl/FOeTx4yPdgOsq22LitIdeo+I9OI7w9/teccVXeliJX3P6f
         uLh71sjSFqy6Fm9d7AxuTlrz8cmu1vJvHZEzV7Mp9mXHUo/TQrsltHG67DK7wz/tVftb
         Xad+Tdn8v7TZvChvQeValIu64/owGdskbwlB60zpYv+p0CfALGyMFXv3n5V1D3y5AZAg
         WnZ6k8sXqlrgjOk6fMHnKUj9wMWu/Ro70p9nhaYAO9k8+DLOrBpUrwWGz+aGq+eG63AE
         RDIg==
X-Gm-Message-State: AOJu0YxKYGGmeeRwRwCpwIqR3nmU/uTT713RTGqw7heuC9d+5iZ+Jok+
	wfZqimcoNdy43WY6qh2e3MmJVRdH/SdgEsyVkprNemA2q31cjkdzao9fr2SrJdHnQhJKhfPoy6H
	x1dkZzg==
X-Google-Smtp-Source: AGHT+IFt5QlCZzYgM5R7gF4HLPAYvJdAkXhZ6ZbblKKBupIPjvZUKFJYiMRl6pbXffqTwsfZty80CA==
X-Received: by 2002:adf:e5ce:0:b0:374:c712:507a with SMTP id ffacd0b85a97d-374c71250b6mr7859426f8f.32.1725528617128;
        Thu, 05 Sep 2024 02:30:17 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-374caf10f37sm10220154f8f.28.2024.09.05.02.30.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 02:30:16 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [meta-oe][PATCH v2 2/2] polkit: fix build on sysvinit
Date: Thu,  5 Sep 2024 11:30:05 +0200
Message-Id: <20240905093005.2731956-2-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240905093005.2731956-1-yoann.congal@smile.fr>
References: <20240905093005.2731956-1-yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 05 Sep 2024 09:30:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112098

From: Yoann Congal <yoann.congal@smile.fr>

Polkit unconditionally installs a systemd service, remove it in
do_install() on SysVinit systems to avoid "installed but not packaged
file" error.

Fixes this error:
ERROR: polkit-125-r0 do_package: QA Issue: polkit: Files/directories were installed but not shipped in any package:
  /usr/lib/systemd
  /usr/lib/systemd/system
  /usr/lib/systemd/system/polkit.service
Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
polkit: 3 installed and not shipped files. [installed-vs-shipped]
ERROR: polkit-125-r0 do_package: Fatal QA errors were found, failing task.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
v1->v2: no change
---
 meta-oe/recipes-extended/polkit/polkit_125.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-oe/recipes-extended/polkit/polkit_125.bb b/meta-oe/recipes-extended/polkit/polkit_125.bb
index 54a2b3636f..348722a561 100644
--- a/meta-oe/recipes-extended/polkit/polkit_125.bb
+++ b/meta-oe/recipes-extended/polkit/polkit_125.bb
@@ -53,6 +53,12 @@ do_install:append() {
 		chmod 700 ${D}/${sysconfdir}/polkit-1/rules.d
 		chown polkitd:root ${D}/${sysconfdir}/polkit-1/rules.d
 	fi
+
+	# Polkit unconditionally installs a systemd service, remove it on SysVinit
+	# systems to avoid "installed but not packaged file" error.
+	if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
+		rm -r ${D}${libdir}/systemd
+	fi
 }
 
 FILES:${PN} += " \

