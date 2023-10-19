Return-Path: <fabien.thomas@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50837CDB465
	for <webhook@archiver.kernel.org>; Thu, 19 Oct 2023 15:27:21 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.30821.1697729238015627602
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Oct 2023 08:27:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=gzwOqG7A;
 spf=pass (domain: smile.fr, ip: 209.85.128.50, mailfrom: fabien.thomas@smile.fr)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4064876e8b8so80535795e9.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 19 Oct 2023 08:27:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1697729236; x=1698334036; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Pdm9rJSRTbni/7dOjVgk9wYcm/Li9JxuY1xtVHWXm8w=;
        b=gzwOqG7Ap9qT43MLzZMUQxu9rqWeSyNudl4GgC5eJzTVuexaT+CT1+dUVcnvWWudAJ
         RzgYxTjwO5erb4t5u4uEPm5363XZ/E1nhbjmtIo1lrWW6ZHMYpzUvPA/Xa0sCTrwFxR9
         O0bIPT6XvBiQscEFC6q6xX/OHOieQgvGxSzENPxJDYTRVG50uzvY945mdIci0aJrt8lu
         XApF6bM4kZY7+xPQh619H4sWMBiPKNXQ/FtFUYI0rhPWyCLOQ0k0FUNL5YHYzdOoqf0t
         eum4F42IqfaTSDXzM742vVRJDDNuJzSo6xRDUO/Hn4EHiFwGy71yx4M7PCBzSCZVc+TW
         K/Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697729236; x=1698334036;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pdm9rJSRTbni/7dOjVgk9wYcm/Li9JxuY1xtVHWXm8w=;
        b=npGvnj80qsS1c5tVdpvm8vmVV+gB9uQbetn+C4A3Zqs9AbboersQclv680W6U8PHrB
         i4v0gyuxG0ziwwrvTRlb3qDijf9mnV8Aofk8jK4TkL5CL58/aV7JAQV6WWkAsxSX8wLD
         eoHLCqaJKDxVBOKkaEtKFTNIdHAwsRuK8+qwDCLOYSiOg0DHRRKjrqYLplm/TPzrLvQg
         NDOTLfZO5y+GAD4eGPCiaGw+kVVx+nFo2d5FwyS0CJZz9I0Kb2dkB4Ckil04WbNVIZIl
         DxcEVkzgrNSuvZgCsqmPUaIrMWd31gHuK+JkqzUjSTc3csmFKcV+BFUiwkFkqvf2n5VD
         oaHg==
X-Gm-Message-State: AOJu0YxErfp+oWkem8tWzeoOkZF80GVyMhbMrX9ynaKqV1Lgb25Jrdxe
	l9zt1XIhdN7DPhIcyV2egJg7utXrAx5q0MH8BxWL6w==
X-Google-Smtp-Source: AGHT+IGqqji9+UEvKglPEyLpJi5h2ilu+qf6rGDTl8l3rClTVESTRe2YTqFK7y/f0AgvV/ze4xtGqg==
X-Received: by 2002:a05:600c:4fc1:b0:3fe:2b8c:9f0b with SMTP id o1-20020a05600c4fc100b003fe2b8c9f0bmr1934206wmq.23.1697729236157;
        Thu, 19 Oct 2023 08:27:16 -0700 (PDT)
Received: from p-nan-fatho.nantes.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id i18-20020a05600c355200b00407752bd834sm4762498wmq.1.2023.10.19.08.27.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Oct 2023 08:27:15 -0700 (PDT)
From: Fabien Thomas <fabien.thomas@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Fabien Thomas <fabien.thomas@smile.fr>,
	Yoann Congal <yoann.congal@smile.fr>
Subject: [meta-networking][PATCH] samba.bb : Disable ad-dc by default
Date: Thu, 19 Oct 2023 17:27:12 +0200
Message-Id: <20231019152712.430461-1-fabien.thomas@smile.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 Oct 2023 15:27:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105604

When this feature is enabled by default in packageconfig
this implies a dependency to python3-dnspython which is in meta-python.

Disable ac-dc PACKAGECONFIG by default to avoid adding a layer
dependency only for this feature.

Signed-off-by: Fabien Thomas <fabien.thomas@smile.fr>
Reviewed-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta-networking/recipes-connectivity/samba/samba_4.18.8.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/samba/samba_4.18.8.bb b/meta-networking/recipes-connectivity/samba/samba_4.18.8.bb
index dc9bc1a7f..f80742640 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.18.8.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.18.8.bb
@@ -74,7 +74,7 @@ export WAF_NO_PREFORK="yes"
 # Use krb5. Build active domain controller.
 #
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd zeroconf', d)} \
-                   acl cups ad-dc ldap mitkrb5 \
+                   acl cups ldap mitkrb5 \
 "
 
 PACKAGECONFIG[acl] = "--with-acl-support,--without-acl-support,acl"
-- 
2.34.1


