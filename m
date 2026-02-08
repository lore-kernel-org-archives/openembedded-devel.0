Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAE1BEF06EA
	for <webhook@archiver.kernel.org>; Sun,  8 Feb 2026 14:51:59 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.26626.1770562317098182554
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 08 Feb 2026 06:51:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=F5dCkh0q;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4801eb2c0a5so34141405e9.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 08 Feb 2026 06:51:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770562315; x=1771167115; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Og/vWWdcLtbD0bxbpt942nMqaCL0DGwfaZah8rwR7ZM=;
        b=F5dCkh0qm722o85CFc83UpDoVmrPmf2spV8FwhzJtn8aL/HK/mX34aOWguykG4c2oM
         mmu076E3HxUK4rCrR8tFshequClQnWb0ako9XPtq+VcJEilr3/Cp6L3YFKE/M/xgwi92
         3O2SpXSpOjbhzCWpqhfoZ5lcuBPQ4ttKTqODcCk55mzlXLSzJvhKMEg2KjXM0rWVfl+K
         uLqoLSjyqwlzHOmP/IZqfJ/t40Ry3z9iXVVC9fWOx/xgi2asTmRLux4WKbXZh4pv5XB5
         PAISUsZedx1kAQFuSeYdnQm9vrFEZAlkf05Exi50koF4tIF/0dVJfAvwveeSk8wKQYDR
         AhjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770562315; x=1771167115;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Og/vWWdcLtbD0bxbpt942nMqaCL0DGwfaZah8rwR7ZM=;
        b=l/chfwzKhpCh0QR89aft3KAFM5E1ihGaLVjtC01rHg33NZkvNZR08zCFeJsJkFXOfU
         ISrXusMcVQCdOZefy9ACe9I8VBBLaYiPMxE9F0ShWnAcxukZN7VFdzpsEtF3EI/ebwkT
         +3Rhzv7gHYCtwk1EGhsKUwXLybECoKB9K7bl8S/8TfrNR81Q8ate8TFCWejUrU35b/Cu
         FXGXoG91DmYu98uJDNJJyhlQxAwADigPyHzh4KbZxhL3yyjeXBU8vR+IkUWUgG9DJ6EJ
         8XaAq2wkODJKNHgc4iLFu70+L6FAb0bdBTvqyzzEghk7ookzYKwLukC6D4R/wQ2d3urM
         kwBg==
X-Gm-Message-State: AOJu0Yyyph1lh5syET3YaZhSFeK5Wq16TbmVMDF2VTDZBx48iaWXhLnf
	RH7f4kZW2OV57GpeuU2WtQAniPrLxo9VMUj97I1bZGjKEIGxLe0wE1LHOduk4Q==
X-Gm-Gg: AZuq6aJ3dVq8kiC5aKbQzyEV1qP8Y+jqyBtYgi7v2eX8jysG11TPkFjJ/F+xEBpcY1t
	rNesxg1E++lakEmL3btMSJzeg+QABN4DIJhgkXlpe1xX2MHiHIgvvbZM5b0qMd19CDTsBafjVAh
	QYoCT9R5fF6zcCEQx+GP8aVH0ul1ivn5myJP8StaA5jIZwaBDIMH8Ge12YTegTKNkpX+7xzHw/c
	tCskAT02t8FyhpZso9SnKt5VJD3alnsygSSuwe6NUrtvL3m/TMwRAbdP/o4UpsXXZ7Fp4Jc8Fbm
	TvlGsq+HhA9B+N4b2uqmOSydVIVn0xbVUGOpEACzSRbCaOe6Q3nwbvmlHXX+rPiU9Ulq9aQBybi
	MV0AZQWachR9N2pu+uQcrsFemiu8kY3e8+TBXVutvL2CKMdyJAOExVcQUhQwIpl09r3P8if4X6G
	43dvc9cpBX9SA76hcYggg=
X-Received: by 2002:a05:600c:19c7:b0:479:1ac2:f9b8 with SMTP id 5b1f17b1804b1-483202161femr126106235e9.21.1770562315378;
        Sun, 08 Feb 2026 06:51:55 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48317d2ba61sm402354155e9.1.2026.02.08.06.51.53
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Feb 2026 06:51:53 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][scarthgap][PATCH 10/10] gnome-text-editor: upgrade 46.1 -> 46.3
Date: Sun,  8 Feb 2026 15:51:43 +0100
Message-ID: <20260208145143.20464-10-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260208145143.20464-1-skandigraun@gmail.com>
References: <20260208145143.20464-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 08 Feb 2026 14:51:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124283

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Fix a trivial build error when -Werror=implicit-function-declaration is
- specified.
- Fix an issue with cancellation of closing a page
- Try harder to ensure a buffer disposes associated resources when
  the page is closed.
- Translation updates

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 05627552612ead8bec55ebac7633ff6a017aaa6e)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../{gnome-text-editor_46.1.bb => gnome-text-editor_46.3.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-text-editor/{gnome-text-editor_46.1.bb => gnome-text-editor_46.3.bb} (83%)

diff --git a/meta-gnome/recipes-gnome/gnome-text-editor/gnome-text-editor_46.1.bb b/meta-gnome/recipes-gnome/gnome-text-editor/gnome-text-editor_46.3.bb
similarity index 83%
rename from meta-gnome/recipes-gnome/gnome-text-editor/gnome-text-editor_46.1.bb
rename to meta-gnome/recipes-gnome/gnome-text-editor/gnome-text-editor_46.3.bb
index f37eb71952..1e3268238b 100644
--- a/meta-gnome/recipes-gnome/gnome-text-editor/gnome-text-editor_46.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-text-editor/gnome-text-editor_46.3.bb
@@ -18,7 +18,7 @@ inherit gnomebase gtk-icon-cache itstool gnome-help mime-xdg features_check
 
 REQUIRED_DISTRO_FEATURES = "opengl"
 
-SRC_URI[archive.sha256sum] = "8ebfa0bea12e75f5efeacc721be3b8ae65027b024aa81db9ecab8c312257a2eb"
+SRC_URI[archive.sha256sum] = "005b48104a909be66ae07448d2bc5706c7d113781057a24ff6da55bdf324c73d"
 
 FILES:${PN} += " \
     ${datadir}/metainfo \

