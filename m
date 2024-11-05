Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FE4FD36114
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 18:55:17 +0000 (UTC)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
 by mx.groups.io with SMTP id smtpd.web11.27778.1730831950728282889
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 10:39:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=l64/m+KO;
 spf=pass (domain: gmail.com, ip: 209.85.128.171, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-6e3cdbc25a0so64380947b3.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 10:39:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730831950; x=1731436750; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y8XUyiaDrQiXTrk3GkVrcKCdmJ0w6YslZEF4X706lMY=;
        b=l64/m+KO6aXL18AwEIkVBpnx+RBdNqqDzJdQREXXCDWlLLMursRFp4haAqy/BzWvYA
         8gYx5on3H1aGlV0D3izPBb3Ok+JTPVg3MGkaxub7imni2Uj9UNqV6RgRnUDUeJBo9QqE
         htMT6XfEIhKb6Tjnp++tZqAsU92cXh2E9QIHJc41h+4CFxeTt+KwMkvBUOYQn70Zf93Y
         Qm798ygym87ezD2qQ/wAEIkpc/iHJg8ucNmDFeCSei54fMHjxMNKNcz5M/hIzPImO7tE
         iSLRwtuiP3TCEW1nGQe3sA1WBah4tuUPmIyCMymOoHm7/6Sv0JkdG2H/V5vrcoUT3nLI
         5EVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730831950; x=1731436750;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y8XUyiaDrQiXTrk3GkVrcKCdmJ0w6YslZEF4X706lMY=;
        b=XZuxH3uhRZYSPB9cpBG8KugopepfJIyGcjgAekBhNmpqxKY0vu2hBlWETwaxH3C1x4
         7eJwvtUj0f/GanLUym3KmR5G57kD/K7SL6yZzeOEtPMXwrv9EFPsOITeuyg2ShEkjnee
         coOz/PeNp3GdwAOJvA57NJ+q9z1gsMgYtanFjXBBuhl06EQuoBQNKcCCfC3et69t9X9q
         Tz4bo5xpZUrxASnfQYa8OspEvFwiTP2mju2TPcmf8L9R82tTzu1wV+fxtfhLVfx9jkjG
         SBItn2BHromQge5KGpbIg4rWwKITLyMNCMUeAD/uiHSOKEqtJ0fugGtnwJGwkAceVFVW
         xoKg==
X-Gm-Message-State: AOJu0YzvficUa5Nceo/0C7pbjMCW6CQx0VQZ8CkZzjW/y/92mVvoeqME
	Kv28Mj3sUCaL6BNPL/RQS3JxhLxCnbZvcvUxQQ5fcwidHrAUkZ/VMBOze2PA
X-Google-Smtp-Source: AGHT+IGKwqWWqPOm6Rp7gz9NTnrReApgmeuiZIHpeKsiyOvpWurltk8rAMfuvC0+KPDtTmSSLp7VQw==
X-Received: by 2002:a05:690c:380a:b0:6e2:ac0a:8926 with SMTP id 00721157ae682-6ea64aa6f72mr182629897b3.9.1730831949351;
        Tue, 05 Nov 2024 10:39:09 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c48b6esm23957617b3.103.2024.11.05.10.39.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 10:39:09 -0800 (PST)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: schonm@gmail.com
Subject: [meta-oe][PATCH 087/161] ttf-pt-sans: Drop unnecessary SRC_URI md5sum
Date: Tue,  5 Nov 2024 13:26:03 -0500
Message-ID: <20241105183658.34982-89-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105183658.34982-2-schonm@gmail.com>
References: <20241105183658.34982-2-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 18:55:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113602

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-oe/recipes-graphics/ttf-fonts/ttf-pt-sans_1.1.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-pt-sans_1.1.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-pt-sans_1.1.bb
index fce76418f..3c3207c67 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-pt-sans_1.1.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-pt-sans_1.1.bb
@@ -13,7 +13,6 @@ inherit allarch fontcache
 # and causes hash build failures
 SRC_URI = "http://pkgs.fedoraproject.org/repo/pkgs/paratype-pt-sans-fonts/PTSans.zip/c3f5a0e20a75cf628387510a720924a7/PTSans.zip"
 
-SRC_URI[md5sum] = "c3f5a0e20a75cf628387510a720924a7"
 SRC_URI[sha256sum] = "0164f824e03c32c99e8a225853ec168893a04a09ade132e93a674e85ae033b2e"
 
 S = "${UNPACKDIR}"
-- 
2.43.0


