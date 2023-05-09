Return-Path: <liu.ming50@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38C8FC77B7C
	for <webhook@archiver.kernel.org>; Tue,  9 May 2023 07:50:01 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.web10.26373.1683618598367156203
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 May 2023 00:49:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=mExt+d5P;
 spf=pass (domain: gmail.com, ip: 209.85.208.180, mailfrom: liu.ming50@gmail.com)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2ac80ed7f26so59366551fa.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 09 May 2023 00:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683618596; x=1686210596;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7N8YEFGosF2SBpj/20w9qYUvjk35pn52JJbYnqpufnc=;
        b=mExt+d5P+8PuUV2m5dNLbSF3QmdxJ5AJlwqt7+y5Xgv0LIpEDu4s9fjGz2dJDdKDfR
         AUb7Y6JPKZodPP+KHGxzbAaoEsDqT1kC8I3/YhRMZTpWwGcPGWhdMcyF59jUx5M9RdQu
         rLL1l49zwGnksldots7WBJ4GMZmm0lNbhyoelmS4mlE6dhn5rMGrwYbJqnwEfM5KFWXm
         Hdoj03s3yTMVl4mfkQlvDz3GKVuCw+5pniXGvZawz4CnR2wTVZpQ9qYjG3pvuCvtgtXK
         F+HsEGF8OzJ5MG7Bt8N+QbV0srNVToqqHK8D2YtmmClwMq3IlRy196D49rsfhCpURB7O
         Uslg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683618596; x=1686210596;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7N8YEFGosF2SBpj/20w9qYUvjk35pn52JJbYnqpufnc=;
        b=cj0rF8iUJZQC6Q1fwlqvJ3tufr0sac+Uvbu/ycs8SvGzbd6XVnE3WD7vOfjXYpKPsq
         jcy2n+J23TRLC7uKV3WAn/MZXvIC9NbiijCtaZ0CU8ouGckJQxgWW5GcfnInyecCR9AZ
         7KH/tljKqKSEZpqPFyi6hd9HuKHhuVa8njsvW+PBYGft9izz50vz7lbtpgWgc3hf516n
         /QP5Iziw4484PoM/izbmEnbg1VmIjq+Zboj7p+m+dBERPFPwpJkzf20z2lblfVJYCsZ+
         KN2guB+7PsCK2czfabYqjAKBdtWgZlewYk4I3tMsZowfHtht8N29SiaEVp6s/wUe/BQ+
         jY6w==
X-Gm-Message-State: AC+VfDzZD4C4InPausAKp5k8t5C8WMqut36TYwtjCYYpnGKMByq2p7KP
	uc6I1P/0tG38pVGANjEcYArm9KED76I=
X-Google-Smtp-Source: ACHHUZ47aE8qJI7I36FXBPqjWGBfJJX6eGCLSH4P6CT0GGNVL7p8ALuG+YJek5+dwOLISlXRshc0FA==
X-Received: by 2002:a2e:958a:0:b0:2a7:6e94:751a with SMTP id w10-20020a2e958a000000b002a76e94751amr473841ljh.50.1683618596283;
        Tue, 09 May 2023 00:49:56 -0700 (PDT)
Received: from peterliu-Precision-7530.emea.group.atlascopco.com ([2a00:801:724:fbaf:9ccd:45e1:5af6:d3a6])
        by smtp.gmail.com with ESMTPSA id u21-20020a2ea175000000b002adab10a1fdsm16583ljl.117.2023.05.09.00.49.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 00:49:56 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: francesco.dolcini@toradex.com,
	Ming Liu <liu.ming50@gmail.com>
Subject: [meta-oe] [PATCH V2 0/2] libusbgx: uprev to the latest/fix hotplug
Date: Tue,  9 May 2023 09:49:44 +0200
Message-Id: <20230509074946.8246-1-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 May 2023 07:50:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102489

From: Ming Liu <liu.ming50@gmail.com>

Changes in V2:

1 I mistakenly have sent
  "[meta-oe] [kirkstone] [PATCH 1/1] lmdb: Don't inherit base"
  in V1, drop it in V2.

Marcel Ziswiler (1):
  libusbgx: fix device hot-plug use case

Ming Liu (1):
  libusbgx: uprev to the latest commit

 ...-overflow-in-usbg_f_foo_attr_val-pro.patch | 796 ++++++++++++++++++
 ...erface-name-for-NCM-Feature-Descript.patch |  52 ++
 .../libusbgx/libusbgx/usbgx.service           |   2 +-
 .../recipes-support/libusbgx/libusbgx_git.bb  |   4 +-
 4 files changed, 852 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-support/libusbgx/libusbgx/0001-fix-stack-buffer-overflow-in-usbg_f_foo_attr_val-pro.patch
 create mode 100644 meta-oe/recipes-support/libusbgx/libusbgx/0001-libusbgx-Add-interface-name-for-NCM-Feature-Descript.patch

-- 
2.25.1


