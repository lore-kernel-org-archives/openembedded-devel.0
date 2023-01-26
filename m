Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF5E7C54E94
	for <webhook@archiver.kernel.org>; Thu, 26 Jan 2023 17:19:24 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.79800.1674753559687688588
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Jan 2023 09:19:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=GH7BmTz8;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id d4-20020a05600c3ac400b003db1de2aef0so1607658wms.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Jan 2023 09:19:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0uyXhAkiMxvTvLBtvz9t45N0svdl7jSbyTjxcm6cStQ=;
        b=GH7BmTz8i9LaAoDRj+u3i59E34xYhEoKj+XfA1Jt6VnsCEviEbT2O6afKBToj3ylop
         OtLeB5cks9BmIIJVCdnJdOLOk6C3VD45bZD3EzOpL1gQVMqRJi+5w706CP2SBMT/Jimz
         4XxyP5xDfi7xUegjl8aWLGjzN37SJLqWPzgWpbJoHVlkhgWYgZAsBP7RumRrmP530qV6
         HWCeH7a/EAcpwrSrtaOENgj1COfuebFB3dzFR8z/p7G8Q78qlHbJ+R52Qnt6Q/6+HE9Y
         vMgPBDAnKs7yAHO/gzm0rM+FPbalOh3f7ONau0bQrNAD7QXfqCnX3cYNVbFOPx/i4hda
         gdlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0uyXhAkiMxvTvLBtvz9t45N0svdl7jSbyTjxcm6cStQ=;
        b=z7N2GNTTd+YKy5ZPgwbF7CM/FzQV2eATdxTKK322ZmhVohfZkW878XTReAGzzqbkM8
         ldF5iMgwONwTzuZTZDgeV9BpZDGrNoMtKuFpTHEzF9wuaSe8PBMxznzC0DlKBfwI+UeN
         upqViS08//SZBMLbhvwSKy+2jBaRU749lrVaZ3dgH1vsmkWzwteDrCmDTypRLr9cDCjo
         tfKZxfC7sZv5sfMrSDUTEU0hh55stUSNmMqkCRXSKgMqqEt8lH7fmISILCDd2ySqCQX+
         bMXw4z4A+z6+mNgBDu0c1YG85PkuHu24XROAyXQu8sfdIN1r7NLchOR+Gfd1ePlRnPU+
         W1WA==
X-Gm-Message-State: AFqh2kok0fs2Euli9ehxeiPtmk3C843p7DhsQxoLHXNNafKhv9ydnpd4
	ZOrjihv+2G4XGNUv/UO0gtKwbbYrFNo=
X-Google-Smtp-Source: AMrXdXs3t5DSjzXoULIA27zF+cxtIxSzCOcNaji19u55os05txg6tSx06aHza+6c2+XawWOj/ry4DA==
X-Received: by 2002:a05:600c:4687:b0:3db:2e06:4091 with SMTP id p7-20020a05600c468700b003db2e064091mr26648511wmo.37.1674753558263;
        Thu, 26 Jan 2023 09:19:18 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id l16-20020a7bc350000000b003d9aa76dc6asm6386526wmj.0.2023.01.26.09.19.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jan 2023 09:19:17 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 2/2] smartmontools: fix Upstream-Status format
Date: Thu, 26 Jan 2023 18:19:14 +0100
Message-Id: <20230126171914.2838495-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230126171914.2838495-1-Martin.Jansa@gmail.com>
References: <20230126171914.2838495-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Jan 2023 17:19:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100798

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...0001-configure.ac-Define-SOURCE_DATE_EPOCH-in-CPPFLAGS.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/smartmontools/files/0001-configure.ac-Define-SOURCE_DATE_EPOCH-in-CPPFLAGS.patch b/meta-oe/recipes-extended/smartmontools/files/0001-configure.ac-Define-SOURCE_DATE_EPOCH-in-CPPFLAGS.patch
index 23d0666173..a6b03db72f 100644
--- a/meta-oe/recipes-extended/smartmontools/files/0001-configure.ac-Define-SOURCE_DATE_EPOCH-in-CPPFLAGS.patch
+++ b/meta-oe/recipes-extended/smartmontools/files/0001-configure.ac-Define-SOURCE_DATE_EPOCH-in-CPPFLAGS.patch
@@ -6,7 +6,7 @@ Subject: [PATCH] smartmontools: Improve reproducibility
 Backport changes added to master smartmontools.
 https://github.com/smartmontools/smartmontools/commit/24838916b4c0e91f5c897d44fcdeedb22848f684
 
-Upstream-Status: Backported
+Upstream-Status: Backport
 Signed-off-by: Oleksiy Obitotskyy <oobitots@cisco.com>
 
 ---
-- 
2.39.1


