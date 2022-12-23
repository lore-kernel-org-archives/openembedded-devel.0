Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53350C4167B
	for <webhook@archiver.kernel.org>; Fri, 23 Dec 2022 18:09:20 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web10.78799.1671818957176806728
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Dec 2022 10:09:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jpKPwt2O;
 spf=pass (domain: gmail.com, ip: 209.85.210.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id g1so3786587pfk.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 23 Dec 2022 10:09:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d3lx7/G7kuH6O0ZVQvXvLDdtFJeUBf/ZMZRFJ20O780=;
        b=jpKPwt2OKGzyoRGvA1Ig2wbkiHgqm6m3ZcVsmI4SXsmRBWsgJNEyeztM0zvRhcExuT
         ExxXlvjPcKfnYPiFAY+YveGsNG7UkcN3OQiswC7XKHwKjB4u2Jw7gok7jK/xglaiuIOL
         tbci4DpYzd2i4WrUD7AJkAWl8tuj6qtoe723we1ujZGdZLewDCZOWmGVu7OuQpcD2Ase
         9dmGfakP0lOvYAJIuj4ACxyX/sHFKEq3TNKxPM6UqD2qpyCmGilZdRk/cUVUBDpnzVRQ
         ccVwsii0k6VwhxbJ4LC36+ftKihXz+aE4WPYwY2h/ROLWyHkP/3Jz2w9/gUYdSYK/fNm
         V2/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d3lx7/G7kuH6O0ZVQvXvLDdtFJeUBf/ZMZRFJ20O780=;
        b=IV5Y5ejmDNYsrejBovt/MhS07eV1gX5poyMTqaw2f3jJN+E1C61ZhmQ6vRJcTnHdUT
         69DwNgB++bWHdX5TsHQOFyvMoC901nLFdn2io5gZwAcqb8Kr6/oxslPS6JQExS6sAuvL
         kXVzQt/UkbpiLx+hoT125Rb+TL/vDEGWCjWFOOTc8BlY37cI1wmL7QZdZ9RsauTcQ9j5
         RHx/wRMM7Pi8XllwWeV/J6lUheGh1dwBYaVVkCYXnLpRpfMPpiZL5WzsN/2FJdYqSDhp
         tEE85GmKvLisMGbJkjPqOflX4pKuoEZ/vz44SUuFDcjhE4lHHu4XalgIaaQW/CnWyPAt
         rjOg==
X-Gm-Message-State: AFqh2kqSxfFwQL1v1cc+Xh9/415GWQ4TxkiNUMOQrJM/ykKrmI1drtlB
	6tOT/0DlABLVNvZEun8lbFzKd21CYeI=
X-Google-Smtp-Source: AMrXdXsLaeeUiAIWL7FS8NjUGH6d8c/83Vr6UhGPfo0nttGZLDcYSI8c+ZkhLn4A/frL+G36vjD8MA==
X-Received: by 2002:aa7:8043:0:b0:573:487d:e852 with SMTP id y3-20020aa78043000000b00573487de852mr12253416pfm.4.1671818956307;
        Fri, 23 Dec 2022 10:09:16 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::bccc])
        by smtp.gmail.com with ESMTPSA id r27-20020aa7989b000000b0056bb36c047asm2811238pfl.105.2022.12.23.10.09.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Dec 2022 10:09:15 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-filesystems][PATCH 2/2] xfstests: Add -D_LARGEFILE64_SOURCE on musl
Date: Fri, 23 Dec 2022 10:09:13 -0800
Message-Id: <20221223180913.874888-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221223180913.874888-1-raj.khem@gmail.com>
References: <20221223180913.874888-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 23 Dec 2022 18:09:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100200

it used lfs64 funcitons which are under _LARGEFILE64_SOURCE and musl
does not define it indirectly undet _GNU_SOURCE like glibc

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-filesystems/recipes-utils/xfstests/xfstests_2022.12.11.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-filesystems/recipes-utils/xfstests/xfstests_2022.12.11.bb b/meta-filesystems/recipes-utils/xfstests/xfstests_2022.12.11.bb
index 136fea8adc..b7cbd3a6d5 100644
--- a/meta-filesystems/recipes-utils/xfstests/xfstests_2022.12.11.bb
+++ b/meta-filesystems/recipes-utils/xfstests/xfstests_2022.12.11.bb
@@ -41,6 +41,7 @@ USERADD_PARAM:${PN} = "-U -m fsgqa; -N 123456-fsgqa; -N fsgqa2"
 
 EXTRA_OECONF = "INSTALL_USER=root INSTALL_GROUP=root"
 
+TARGET_CC_ARCH:append:libc-musl = " -D_LARGEFILE64_SOURCE"
 # install-sh script in the project is outdated
 # we use the one from the latest libtool to solve installation issues
 # It looks like the upstream is not interested in having it fixed :(
-- 
2.39.0


