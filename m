Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8EFEC433EF
	for <webhook@archiver.kernel.org>; Thu,  3 Mar 2022 13:07:17 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.10264.1646312836616675342
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Mar 2022 05:07:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=dD8zxFKQ;
 spf=pass (domain: gmail.com, ip: 209.85.128.45,
 mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id
 7-20020a05600c228700b00385fd860f49so2364781wmf.0
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Mar 2022 05:07:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sXrOoaU2BMxnYAZw+ry7kh2dPjyN/BF5o9S7NebCRnM=;
        b=dD8zxFKQfFP4dz8B6NkVGJ2K9SbDrf+cvwHVJVCBCFMBqpArkMYl0givm3G8DYVT8E
         Q1zl8Q048YuWBtu2RH0JxLz3yCjuOhFdrXAEOLIrEfA8PnsbqJgfGfhfx+PLXSA9vA16
         uqQw3ho/Jhf6Bh/BA6//RS9c+KSyKOANq7SX9Mzpnlc+Y4T+KOWzmGEwO9CtMzsubq/1
         gNYJWjvG5HBcWxRCXSs2r7EhBbuVXw8/nxiYPcBYv+4XQv6rykjcqXHlJ/DnvYEC3a5Y
         iNaiBiYmhnu6kEX5NQpvPlwKG9Kqdd23ovch96ln73Sov4yUhVSGoYDIZbPtdTQ85oO9
         aAIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sXrOoaU2BMxnYAZw+ry7kh2dPjyN/BF5o9S7NebCRnM=;
        b=50CLhbK81F/1WJhTluxGY4DVNedy/o3y/FlyjbNY/f59xbWFPeAP4VcAgJ8Ng3r9wz
         WX+blQrIdKLt4c+Z7qMADzEhHHzqaT4a1H7oxn9GyxZ/pbQixBBdG9Np0Ymcct9CvUcF
         usQ9hWhCOBhmq7T8yq7YBc8efRmY69Ir+WdCOUNEn5iisgjxamK6u19PIIX+qzB2PA+u
         f2yAgws8TBMdkrrZfJjzGifqjuTST7LQGzByEF71VdxN3EzAz4SNMR0S2Hd+nnXNN8b8
         tC+xiSyc+GokAC7xfezZb8DFQaYqq7gBu9Lh9M3pr62QAo/3oFutj4tXORMA+Dc+l2hG
         wYiA==
X-Gm-Message-State: AOAM530X8f/laz+I9jRByULbcrEWZAjffXeeGpRdKG9Ezr+GF9gkVvm4
	nrSgzA6cypGZTE1ValWkN6jtJG99YuU=
X-Google-Smtp-Source: 
 ABdhPJwq3iEu1O0jIiqXurSQ5f78+K9kCEOOU1cnn2i70rFhXqxTYLSw9NA6T+7NNCDXFPjJ8U4otg==
X-Received: by 2002:a05:600c:384a:b0:37b:e8ac:851f with SMTP id
 s10-20020a05600c384a00b0037be8ac851fmr3775998wmr.158.1646312834818;
        Thu, 03 Mar 2022 05:07:14 -0800 (PST)
Received: from md2ramxc.ad001.siemens.net ([62.32.0.69])
        by smtp.gmail.com with ESMTPSA id
 n15-20020a05600c500f00b003814673f202sm9612380wmr.47.2022.03.03.05.07.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Mar 2022 05:07:14 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [meta-oe][PATCH 4/4] networkmanager: replace deprecated licenses
Date: Thu,  3 Mar 2022 14:06:18 +0100
Message-Id: <20220303130618.1108977-5-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220303130618.1108977-1-adrian.freihofer@siemens.com>
References: <20220303130618.1108977-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 03 Mar 2022 13:07:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95743

NetworkManager should only be licensed under LGPL 2.1 or higher. But as far as
I understand, the process is not finished yet and some codes are still under
GPL-2.0.
https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/blob/main/RELICENSE.md

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 .../networkmanager/networkmanager_1.36.0.bb                     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.36.0.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.36.0.bb
index 2f8b616a68..f6d1b6c385 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.36.0.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.36.0.bb
@@ -2,7 +2,7 @@ SUMMARY = "NetworkManager"
 HOMEPAGE = "https://wiki.gnome.org/Projects/NetworkManager"
 SECTION = "net/misc"
 
-LICENSE = "GPLv2+ & LGPLv2.1+"
+LICENSE = "GPL-2.0-or-later & LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://COPYING.LGPL;md5=4fbd65380cdd255951079008b364516c \
 "
-- 
2.34.1


