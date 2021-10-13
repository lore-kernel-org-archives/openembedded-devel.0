Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 296D5C433FE
	for <webhook@archiver.kernel.org>; Wed, 13 Oct 2021 04:56:13 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web10.3857.1634100972336544025
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Oct 2021 21:56:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=MdytMliA;
 spf=pass (domain: gmail.com, ip: 209.85.210.169,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id 187so1357711pfc.10
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Oct 2021 21:56:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=l+dDPvxcQLqX250BVg0Yhc6AWGXGML64wKQUHPfwPOg=;
        b=MdytMliAxsEhh8GGEMBrRsdFWafaFq5rhNngXiKS3RtWZGBIR2xl+fPCVrxqggLIVX
         VIWO65nJxwPPJxLSpUj5z0JgCypcGCK9eZ6yGT2vtStpKcrPKNBhZ59ZjHFvTNKMW01n
         Y9B/ukSR3qCHs5cMrWfxkEKDjuYJWq2iuu5/HtUetIIGUf5Ojoni7WiihZp3jOe9Hmo4
         nDtB/rNhsvkgFzBvk/bQS80lNeR2HUZ4YDT6Xx1B7pirHeKo8K03lUboc0auVr5+24b0
         rwpX886qpCl3aIX6YfiGuO5ZIUsFY7EKiSrMNrIZpBx8X+Hp7CHQcdrzJH+3CRD799Gr
         iaIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=l+dDPvxcQLqX250BVg0Yhc6AWGXGML64wKQUHPfwPOg=;
        b=Lf5lpS6KFplpH/StyOlvZS9bhNIjdEA5B0V4LRFg+qkpo0/JrE9Cq/mOkL2uioNmG9
         9I7OKnZ5ZqXrEOs178SkIwivErqD+SN4IBwAgK4ViGeM5lCjqa9xDj/GxfEoOO18p6Sj
         Izgsol5SQAHdGUqrUd4GeNlx3x6k+EZStfXiqy2+VB6vUAmMiwSmrjoe1QhHmQ4ouIzN
         Dad86Sd7mMetw0BO4U4OvCYw7fG4OtMVvlwpTZsDPg2/uJR9w4iYlB5n7835LuFlglWW
         zQLSVx04AJYEzqMSsSJY705/Ly49/2XAm00X9YOvaF6HSAwpE0gANwxboZ8rZWLGOCor
         KW1g==
X-Gm-Message-State: AOAM530znIB9lySgBKVLMU0TNqITDG6RIrhh6Q4oqHVMgK64zizpbCHu
	4vwuyp6S7i7BXA0UR2FVueQrSTmEiftMKA==
X-Google-Smtp-Source: 
 ABdhPJxNHVc/mGcwDVCYTlVwWKK6EYd7CwPTrdhv930pxvjo6VlyoIHvcFP5RI/r+Y0FtZ/O3JfGhg==
X-Received: by 2002:a63:33cb:: with SMTP id
 z194mr26264336pgz.380.1634100971563;
        Tue, 12 Oct 2021 21:56:11 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::ba74])
        by smtp.gmail.com with ESMTPSA id
 x30sm8516257pfj.219.2021.10.12.21.56.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Oct 2021 21:56:10 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-gnome][PATCH 3/3] devilspie: Add missing dependency on
 libxinerama
Date: Tue, 12 Oct 2021 21:56:07 -0700
Message-Id: <20211013045607.399687-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211013045607.399687-1-raj.khem@gmail.com>
References: <20211013045607.399687-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 Oct 2021 04:56:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93266

Fixes
| src/xutils.c:29:10: fatal error: 'X11/extensions/Xinerama.h' file not found
| #include <X11/extensions/Xinerama.h>
|          ^~~~~~~~~~~~~~~~~~~~~~~~~~~
| 1 error generated.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-gnome/recipes-gnome/devilspie/devilspie2_0.43.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/devilspie/devilspie2_0.43.bb b/meta-gnome/recipes-gnome/devilspie/devilspie2_0.43.bb
index ce2f51fc68..a5b6d8410c 100644
--- a/meta-gnome/recipes-gnome/devilspie/devilspie2_0.43.bb
+++ b/meta-gnome/recipes-gnome/devilspie/devilspie2_0.43.bb
@@ -4,7 +4,7 @@ LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=00aefaa50aad75c21367df66102d542c \
                     file://GPL3.txt;md5=d32239bcb673463ab874e80d47fae504"
 
-DEPENDS = "gtk+ glib-2.0 libwnck lua virtual/libx11"
+DEPENDS = "gtk+ glib-2.0 libwnck lua virtual/libx11 libxinerama"
 
 PV .= "+git${SRCPV}"
 
-- 
2.33.0


