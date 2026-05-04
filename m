Return-Path: <adam.duskett@amarulasolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14AA8FF885A
	for <webhook@archiver.kernel.org>; Mon,  4 May 2026 09:25:26 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10872.1777886717482108175
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 May 2026 02:25:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amarulasolutions.com header.s=google header.b=B/nXEPpx;
 spf=pass (domain: amarulasolutions.com, ip: 209.85.208.54, mailfrom: adam.duskett@amarulasolutions.com)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-65a1faf828bso829448a12.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 04 May 2026 02:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1777886716; x=1778491516; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jd2EeTew/KP2SRiYUF7HsVQR3i+TDZZGeFXzeh3QVzU=;
        b=B/nXEPpxxVjpQgI5uW+DXL6VvhR3eHDOk6m237PVcFfDTRJEuStV6svsYdjnE5l6rA
         9ahCb5sypKJH4PrbNkIFytaBWj6NICxl5NBvMRj5C0U1ZqgU37kDp0CczmVPRfN8vAhh
         K+anHDXv5d5kUDi4JmRUSMtFeNZpZkQ4+BFFk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777886716; x=1778491516;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jd2EeTew/KP2SRiYUF7HsVQR3i+TDZZGeFXzeh3QVzU=;
        b=HSlF0EfmxMNICTEW1nMKAAo3J+Spv7SVczVyjNmGNRR+1gqTkL5Cl+9hYyK4MTO1Ea
         VKkeq6nUXuBA+us5cPz2GNT3Z8Xfd+7NU0q6jvj3lh3j6SeCXLJYyB3W1g8OEVMgJds2
         igl32QwyH8JjsWQkT7pS40eYXyzZwNksrGo8f99jR+QTOXnO/0SXWlovvNrIGL1mIfpv
         rAiKwCG40e7RcXxKLIfB3veRuK8qQItdD81bWPLfxto9XPzNtZdsoAkg0TAPICrZfDCW
         xBxesQiNwmMs9EmBml/BJC8wd21el5DnWTFOXqSUjfPFKNhX3Kq5l+8//K5SqOvaS/9+
         5R4w==
X-Gm-Message-State: AOJu0Yx/46iPeF2y8BIC1m7aONd2WewNitOwNhnCGMcXwkuGGNVZU6qK
	fzX0++VSZ/97NbJPs8sXOsghemgdxZbqwDzQzOwo8R/XwPPBaWlbCXChnFN08fSE3esN2bYOXJh
	/vUHu
X-Gm-Gg: AeBDietlh0rX26KHX/uT+rkn1AVqCAu6ENhZlfA7hz413ye6fKyzse8m5NTFor5B3x6
	/UtpNbIu8G77ssB61vdgXOMUYfajnww1YZaAsqYmrgStMfcRaZtDZhf/QGDLKxAshWt8JMXrmD7
	LPVZ4xe+kJOlJ2IRt+fFAHcb35c2zMiLrXi7Hc0vxZts3msWhRa1cWRtbHOZnxLLo5MsHhgcch0
	ykFsmNVmRC8WfsDgBn8ie2mshqk8e6hC4WKojgW0lmcLZ4IvN4RIxBXJn2xt33TumW+VN6gfOw4
	gheloCP7YlOnuK2e/OKro38PlXLqGD1CiTzw8hwJWVDlmdEcaMxrhyqDqBocNQPgMqnnf3Frnyo
	ppJfYZS3ZZOOVGd60iLkg4dTcVy27sq/+9JdZ284iIldTf7K2shlgV8hOJePdLnq/yUtGz8SD+3
	kw+TyjUZxU9b+ObrbRt2xOk/CT4QWfMT1OhMfyv5XopF4qp0/qQwzo89itYFQcu6seu8/OsnenI
	FcfHUPcVbo60KOA2EnGTt6hRFJOf8kc/qGHS+bGHvX6fYs1vxPFlREpMFk7QWQ+ZlmObl1aEocI
X-Received: by 2002:a05:6402:404f:10b0:66e:a6a2:5e0 with SMTP id 4fb4d7f45d1cf-67c1b8883c1mr1082079a12.6.1777886715743;
        Mon, 04 May 2026 02:25:15 -0700 (PDT)
Received: from adam.arnhem.chello.nl (2001-1c00-8183-9900-cf61-f7e6-4bb9-ea56.cable.dynamic.v6.ziggo.nl. [2001:1c00:8183:9900:cf61:f7e6:4bb9:ea56])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67b877d57dasm3252254a12.19.2026.05.04.02.25.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 02:25:15 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: openembedded-devel@lists.openembedded.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Subject: [PATCH 1/1] [meta-initramfs] dracut: upgrade 110 -> 111
Date: Mon,  4 May 2026 11:25:13 +0200
Message-ID: <20260504092513.34045-1-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 04 May 2026 09:25:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126776

Changelog: https://github.com/dracut-ng/dracut-ng/releases/tag/111
Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 .../recipes-devtools/dracut/{dracut_110.bb => dracut_111.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-initramfs/recipes-devtools/dracut/{dracut_110.bb => dracut_111.bb} (98%)

diff --git a/meta-initramfs/recipes-devtools/dracut/dracut_110.bb b/meta-initramfs/recipes-devtools/dracut/dracut_111.bb
similarity index 98%
rename from meta-initramfs/recipes-devtools/dracut/dracut_110.bb
rename to meta-initramfs/recipes-devtools/dracut/dracut_111.bb
index d5ca94add8..8b88e441b8 100644
--- a/meta-initramfs/recipes-devtools/dracut/dracut_110.bb
+++ b/meta-initramfs/recipes-devtools/dracut/dracut_111.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 PE = "1"
 
-SRCREV = "25bf13842a5c55f4a5ab1523e005b3b11b9ac38e"
+SRCREV = "b3b4f7ef914b84964a56500cfec83f21dc513e6a"
 SRC_URI = "git://github.com/dracut-ng/dracut-ng.git;protocol=http;branch=main;tag=${PV}"
 
 DEPENDS += "kmod"
-- 
2.54.0


