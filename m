Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0999FC43219
	for <webhook@archiver.kernel.org>; Sat, 30 Apr 2022 19:19:01 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
 [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web08.25969.1651346339865696515
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Apr 2022 12:18:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mih0vESi;
 spf=pass (domain: gmail.com, ip: 209.85.215.180,
 mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f180.google.com with SMTP id q12so8876662pgj.13
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Apr 2022 12:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=IdTMq3lIJJg0afBSQCtu4OY+nTbkUJlxBC0dw2F/rEY=;
        b=mih0vESiqcLwSYj07l4sLLODNO5dko2E5CrTR7tv4fERb2VguKdfwvYj1FARn6ufTB
         HhG2Q+2Qo1csBBpGxd7TNRGWfEgmF/SrtL1+l/DO+T7S90SnNDAimmgfXtbLnPcis5Mw
         d0sy9PSXC8hKfcE3nfio3+XFr/sBeetU4JKR6P/iIBchJCmKo/h6fYKNKdHP8ofRKgnC
         tpDVXwkl5hKpUTknwryG6cFN1qv1ale3Jvl/oupHhK5XeW4MAz9yjTZ9JPFujEdRqO4r
         qKc5QOsFInqSabGu2oUKxV4qbxuaymSnCD3pNfja7iSfMwmvrNq62+doPJIllSTB29LP
         JbZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IdTMq3lIJJg0afBSQCtu4OY+nTbkUJlxBC0dw2F/rEY=;
        b=vpDYXahlv1nakiedm6gzeF5pTThhb0sz5nHAj9HzmQUrP+eJ0OXANUgxfY9So/tnp/
         eRWIU1kaIlnKK2iOoR8qb+wllZIaksUdy81iavDC8cp/Cbbq7llJ/q/vrIThqDW4rSZr
         JjAVhJvzOdqJTipAOrmHbe7p/MCoZjnO2Jrd/XCopbAOhFHgy79ndjTc6OFN2BjFhfe8
         doQgbVpou1GAuuvLIaSQi25qRL42/fSDDwJ2e2RhNgrBFlKSMLN4d7PBxPTvbV66TZU3
         893VULYUYJmnJBkAXORAhp56XAoHRQOkFi6jf+YiXHHCwyPhP9kq7HK3zfIYGe/M38uo
         h4fQ==
X-Gm-Message-State: AOAM530PGdMPRTjTRwQlQo9+T0VEETZ6gYR3RodwMP6LUT21TVNBcSOH
	BpoX8J773dP013W8IG6FEdaQn1uVuwz0Sw==
X-Google-Smtp-Source: 
 ABdhPJxuvRgVyPu3EuGnxjdhI2ndH7Dgfi1jg7uaD2eGImPnE6Cz/1fuYudopHmF7tJj0fge2ODYJg==
X-Received: by 2002:a63:101:0:b0:3aa:b7e9:6708 with SMTP id
 1-20020a630101000000b003aab7e96708mr4008295pgb.111.1651346339103;
        Sat, 30 Apr 2022 12:18:59 -0700 (PDT)
Received: from keaua.caveonetworks.com
 ([2601:202:4180:a5c0:8e62:e537:ba7a:ce43])
        by smtp.gmail.com with ESMTPSA id
 h10-20020a170902b94a00b0015e8d4eb28bsm1810756pls.213.2022.04.30.12.18.57
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Apr 2022 12:18:58 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [kirkstone 21/39] nautilus: upgrade 42.0 -> 42.1.1
Date: Sat, 30 Apr 2022 12:18:01 -0700
Message-Id: 
 <c083c8954725b62ebe4bf05f232ae44846fa99e3.1651346200.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1651346200.git.akuster808@gmail.com>
References: <cover.1651346200.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 30 Apr 2022 19:19:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96888

From: wangmy <wangmy@fujitsu.com>

Major changes in 42.1.1
=========================
 Revert wrongly introduced dependency on unstable gnome-desktop.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 2ff1569067ceb4fb9e16d0b03db0d01475731c34)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../nautilus/{nautilus_42.0.bb => nautilus_42.1.1.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/nautilus/{nautilus_42.0.bb => nautilus_42.1.1.bb} (92%)

diff --git a/meta-gnome/recipes-gnome/nautilus/nautilus_42.0.bb b/meta-gnome/recipes-gnome/nautilus/nautilus_42.1.1.bb
similarity index 92%
rename from meta-gnome/recipes-gnome/nautilus/nautilus_42.0.bb
rename to meta-gnome/recipes-gnome/nautilus/nautilus_42.1.1.bb
index 08277416f3..6d942204f6 100644
--- a/meta-gnome/recipes-gnome/nautilus/nautilus_42.0.bb
+++ b/meta-gnome/recipes-gnome/nautilus/nautilus_42.1.1.bb
@@ -21,7 +21,7 @@ inherit gnomebase gsettings gobject-introspection gtk-doc gettext features_check
 def gnome_verdir(v):
     return oe.utils.trim_version(v, 1)
 
-SRC_URI[archive.sha256sum] = "3c904f33ba2d2a078892bee2af71484cd608923cd78ec7e8a1517bc2155113d5"
+SRC_URI[archive.sha256sum] = "8519d4565e842aa3d31d0fe39b21d48ac54edc0f0658fe1d8ea2da4e704c1b66"
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-- 
2.25.1


