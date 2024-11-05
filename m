Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3C56D2C10C
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 14:37:00 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
 by mx.groups.io with SMTP id smtpd.web11.19531.1730817412483209689
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 06:36:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VldtzLIM;
 spf=pass (domain: gmail.com, ip: 209.85.128.182, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-6e9ed5e57a7so43455387b3.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 06:36:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730817411; x=1731422211; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Scwj8CkxMYCtXAJKEX24DG3s6qWkxyacy7k/NsfBtw=;
        b=VldtzLIMXWmmyUbXu9jghSs1JjBcuVIHYQJlJdQwqNWDRnhDwx89f4e6HWY6cjIRE2
         0RHE08ORsFAWSLb/FhFPvN3w6+vRkqgdC69CiVaBm8Tf3ZbWyXBdUy8xC4yDz7DH8ySg
         UjRQ1RpAPoIC9BYMwMsoWXdkjZjg2eghh9kHzaSRI3xMb/XmkTmK+ar0WLbmeza7PzHf
         XBpgPdwXZ9yw31kfI5KfKig/zHxNYs484EmwuRRGC6B3kkuoxTo0SNJezwZAIKuUBDqO
         NLKKLh0NqEKKvVdamnmvYrG1W9a5L9aONqrXSByi7jn2nqveTAZK8wVU+qth4tjoGMrw
         41MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730817411; x=1731422211;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5Scwj8CkxMYCtXAJKEX24DG3s6qWkxyacy7k/NsfBtw=;
        b=kJEcCvEfTFP2g2WVBEtsga8xOpOKd6yiVTB3/5RK9g5nDAVf+cCiVhakTUXqWBXeyP
         VUHewT2InpP4sJvvRq6YPDAR41RcAKq4XTXT7J+WK1lMChR3N7fpWPYOBK3K0GYWSAAB
         ckRLBCtvP9qeg9VqqXIfqLul9eWpTYIurqOgpbDpVuVzo1VpGqP+cqxZvJlQYLRQt5Ht
         mIXJ7M0q/MPMupV113e+7r9AZF07YmtL8hhZWZJdnAPA/aMO2yPANVhJ/zHLIjbJMBd9
         QvKQJo6FMyqfASIV6kszmIZqcWExapf9Mlb7QrsAX+hTiYB2fZcG5A/kqB0u8ACGpWXK
         K66Q==
X-Gm-Message-State: AOJu0YxRS1gP64OFH4fcHrYQTkXXF3vuXssLWnsyACLwToJ5KQG8YUKl
	yb4yP3llAfcAf4wtcT2wyOcnb6t8m/vAts9DRISLvkz7NaaDpj2HFoDtQg==
X-Google-Smtp-Source: AGHT+IFU/gKjbTdGbUsWF6EJnz/L0jrepAq9ofWtui4acByl92P3hObCgD7deR5ZYaCguj+Z8HSPIA==
X-Received: by 2002:a81:a9ca:0:b0:6ea:751b:845c with SMTP id 00721157ae682-6ea751b86b8mr90051257b3.46.1730817411513;
        Tue, 05 Nov 2024 06:36:51 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:45dd:7000::29])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c8723esm22495977b3.126.2024.11.05.06.36.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 06:36:51 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][styhead][PATCH 27/90] tecla: upgrade 46.0 -> 47.0
Date: Tue,  5 Nov 2024 09:34:52 -0500
Message-ID: <20241105143638.2301245-28-akuster808@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105143638.2301245-1-akuster808@gmail.com>
References: <20241105143638.2301245-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 14:37:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113445

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Add --parent-handle command line option to integrate
  as a "modal dialog".
- Translation updates
- Set window icon

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-gnome/recipes-gnome/tecla/{tecla_46.0.bb => tecla_47.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/tecla/{tecla_46.0.bb => tecla_47.0.bb} (80%)

diff --git a/meta-gnome/recipes-gnome/tecla/tecla_46.0.bb b/meta-gnome/recipes-gnome/tecla/tecla_47.0.bb
similarity index 80%
rename from meta-gnome/recipes-gnome/tecla/tecla_46.0.bb
rename to meta-gnome/recipes-gnome/tecla/tecla_47.0.bb
index 62b3aa3e3e..e430b167d7 100644
--- a/meta-gnome/recipes-gnome/tecla/tecla_46.0.bb
+++ b/meta-gnome/recipes-gnome/tecla/tecla_47.0.bb
@@ -13,4 +13,4 @@ REQUIRED_DISTRO_FEATURES = "wayland"
 
 inherit gnomebase pkgconfig  features_check
 
-SRC_URI[archive.sha256sum] = "4a081eab867a5a8b09758991cad7645920f323aabca954408290fb6f44591b0f"
+SRC_URI[archive.sha256sum] = "0790b99ec29137a54b546c510661a99aa6f039c8d75f10c08e928682c0804fe5"
-- 
2.43.0


