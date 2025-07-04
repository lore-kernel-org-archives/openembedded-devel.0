Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFC35C83F09
	for <webhook@archiver.kernel.org>; Fri,  4 Jul 2025 13:31:57 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web11.12530.1751635909891245599
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 04 Jul 2025 06:31:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=ozYDP21X;
 spf=pass (domain: konsulko.com, ip: 209.85.218.48, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ade76b8356cso182083766b.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 04 Jul 2025 06:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1751635908; x=1752240708; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+NR2fU2XI8SflnjyrCl8KeLvbHB6kPvDw92GIuxCJ9Q=;
        b=ozYDP21XDzfrAKWBP4JosUhbYLUzervUrxMoLAjhcU7cyh/h7V7sUjTrN0zim80r3S
         1/R4zovCctv6hynAdNwsr74VDOlh+CU5NR4A+Nf0k5freWu1hIlr9mbvU0cXR6dzCGEh
         lfxaThEldh2vWS7rSE+6nv2Xocj1lXfFun1Go=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751635908; x=1752240708;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+NR2fU2XI8SflnjyrCl8KeLvbHB6kPvDw92GIuxCJ9Q=;
        b=pF3deIPLvE3QS05E46QC14gcz0GK+DN3PMUwwUyE3yZvNjLsWgfDDndD0JetDrMI/L
         XMTfdfHF54K64d97CXveMN61wonxIDTljj5sFBGQGldTxD4fZuboxekJQsG7Y4QLEOyw
         IBrTOBcAIDEHDbc6hNXcsQdcrEeNfy47Gic2CH9+bOXf6lLXd0TdtrsmgN8nUQi9vPVh
         CqiPJUbIiXQZYQM1TaGzoKKkCERRBpxXT3mbbjSo2/znONvWPoVTj/aiSyWsJZLgsl3z
         E85IqdBop8ILTowzUi/U7wuX2I3DD0Ojz/32ynq4Op9gWt6h7p/ZTJpfG1BP+dohWsRG
         NNbQ==
X-Gm-Message-State: AOJu0YxXCS9Fhm+K+m8hvjll7q4maN3hiIetbL0iVXKyuPcaeMYoBVfM
	YODtbdZHzigDX0+8QcxQBfKD9EFH0aFEgt4/aBiH1tyUpJhpgMBXIOGd3z1PVtiJGGcanQRHHAo
	+fS4E
X-Gm-Gg: ASbGncuqIXOSW/2gOmUYL/o7nucOhm+ZTH4ad/gWlwGKNNseTfe9+t59BN2GEJrazvl
	mw72SOV8jBa8Le0OjjBlqMsqLKydTtZWJgyQuzdlwHBB3k8u2Cy8BhskVgo2Dlilb8JEYGlefbn
	cWOZXDb4BV2rty2KOwRrMZ9kAG7OkWDzCX40xzDp+s1o83Nl1l+YgQjcpAWXTvQeQshhGkxPFgl
	H5d64lwgV7C9u0F/fzUYCu2UNL3KgaXpapscGV9y//PhR8SosxslTUQQc5CnGo5lbLWFmE6L0ZC
	DO8itrtOg8SCZqcZe7umrVA/EaWAiNfczhj7epLB3EVqUIgWvwXp/4FSrtDsvEcLRbjrgtgPDKm
	B
X-Google-Smtp-Source: AGHT+IGbwTRkm6eWMAbIfWfjXClq5y84sbOFAjx/lBDAVGWaehN0okwH4N3Uyl6678CAhft9lR9fOQ==
X-Received: by 2002:a17:907:3e0d:b0:ae3:63b2:dfb4 with SMTP id a640c23a62f3a-ae3fbceb9aemr261607166b.27.1751635907492;
        Fri, 04 Jul 2025 06:31:47 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f66d93ffsm174389966b.36.2025.07.04.06.31.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 06:31:47 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/4] python3-cmd2: Upgrade 2.6.2 -> 2.7.0
Date: Fri,  4 Jul 2025 16:31:42 +0300
Message-Id: <20250704133142.712380-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250704133142.712380-1-leon.anavi@konsulko.com>
References: <20250704133142.712380-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 04 Jul 2025 13:31:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118237

Upgrade to release 2.7.0:

- Integrated rich-argparse with cmd2's default argparse help
  formatter (Cmd2HelpFormatter).

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-cmd2_2.6.2.bb => python3-cmd2_2.7.0.bb}    | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cmd2_2.6.2.bb => python3-cmd2_2.7.0.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-cmd2_2.6.2.bb b/meta-python/recipes-devtools/python/python3-cmd2_2.7.0.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-cmd2_2.6.2.bb
rename to meta-python/recipes-devtools/python/python3-cmd2_2.7.0.bb
index a4b98860a8..10733f79d0 100644
--- a/meta-python/recipes-devtools/python/python3-cmd2_2.6.2.bb
+++ b/meta-python/recipes-devtools/python/python3-cmd2_2.7.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=26efe44f9946f43292f90070d9d5590c"
 
 DEPENDS += "python3-setuptools-scm-native"
 
-SRC_URI[sha256sum] = "bde128c0b6dba9d2d9179a1c7c8fe92ab930473d0ddf46f2bc19cb789f942e4d"
+SRC_URI[sha256sum] = "81d8135b46210e1d03a5a810baf859069a62214788ceeec3588f44eed86fbeeb"
 
 inherit pypi python_setuptools_build_meta python3native
 
@@ -18,6 +18,7 @@ RDEPENDS:${PN} += "\
     python3-pydoc \
     python3-json \
     python3-numbers \
+    python3-rich-argparse \
 "
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.39.5


