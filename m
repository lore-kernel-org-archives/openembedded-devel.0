Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55E44C4332F
	for <webhook@archiver.kernel.org>; Mon, 13 Nov 2023 20:10:24 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.web11.1327.1699906217163955113
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Nov 2023 12:10:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=Jna95QhE;
 spf=pass (domain: linaro.org, ip: 209.85.208.174, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2c5039d4e88so67513821fa.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 13 Nov 2023 12:10:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699906215; x=1700511015; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=q/25QlyZxK5jZuSOrq90hFF0v+0qsElyamyf/KvpdAs=;
        b=Jna95QhE9oTOyT1olkPq5+yMtSDU3zXvDWepm8V+/3FFfDyn0XdiNv7FmkWuTfWCkb
         8gLh8KMEzxoCBzA3FJJVjrOIL0bMNqGtndYRUtznH3E0YmXP9aDc5fv2wnhU3zKUgL8x
         sZNfJCn4nGNg3D7y3Ysg08gRkskhO252+h7xqEz5y8R/6aCPWZgmwv+JsAYxjWZosmD9
         opvTg+MI+HWtCPcgAzjqV2XwDrm1YOVVVBrtludNemp1bs3wuRUP6T0MgFB+/CKDETxU
         ThvpkKq/kj6Qs6/iwLsTIvuqKbG4AmiRgcjj/25eXMkR3Xr6o7/cu3qR2CXKjkWlMKa/
         FLEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699906215; x=1700511015;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q/25QlyZxK5jZuSOrq90hFF0v+0qsElyamyf/KvpdAs=;
        b=HNIXNRWEQlewkyartf+I8OQkJ36GTWtF5Gm9Myhs+I8Zt27GYzMBI8VF0/0BKzkeSa
         vnyz5JShbyBb51170191BWXxj5WE1zfPLHDaiXDstKgSdGej7PbydRUivhU9g4CyNrhM
         tIwxZvz8hDJrpJWKgXkj/74fReoT5rjpeb8GTEe7MxsEuFghwhRfcGGNW4JLcV9zLCFf
         0zanu1cnsWb+1wWSQTXoTF7qBJ5Q5nvRwy/WvmXymog/iihRyVZEjxJWldVrp61OorTx
         tEcQCwIK4DzDwh/iX8D90TLlf/XaBynhftBFe94DRoaonDjQrkNZa8H1BfilfDQaKbAK
         i0Dw==
X-Gm-Message-State: AOJu0YyZtgby+N15KfuJikyF7aK+jdof0IXcuS/Sdd9rJ827tuPhmJzp
	XnHXStrLRvDjiVVlE4hmWCnDltzYIYrr7kLm2e0pNQ==
X-Google-Smtp-Source: AGHT+IGG8NdNZZAlkUSQsI4fGSJNaxwcSlEQERrkoY6W3M9GUhkl+I+bYRwfyEjVtar6dtNrmuQbTA==
X-Received: by 2002:a2e:8e3b:0:b0:2c8:3b0b:d974 with SMTP id r27-20020a2e8e3b000000b002c83b0bd974mr268521ljk.15.1699906214636;
        Mon, 13 Nov 2023 12:10:14 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id v28-20020a2e2f1c000000b002c182a942f1sm1067815ljv.139.2023.11.13.12.10.14
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 12:10:14 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH] gnome-menus: tell gnomebase to use autotools build system
Date: Mon, 13 Nov 2023 23:10:13 +0300
Message-Id: <20231113201013.736234-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Nov 2023 20:10:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106682

gnome-menus source does not provide meson.build, so switch it back to
using autotools.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 meta-gnome/recipes-gnome/gnome-menus/gnome-menus_3.36.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-gnome/recipes-gnome/gnome-menus/gnome-menus_3.36.0.bb b/meta-gnome/recipes-gnome/gnome-menus/gnome-menus_3.36.0.bb
index fa162510cb99..d5e5e8575ab1 100644
--- a/meta-gnome/recipes-gnome/gnome-menus/gnome-menus_3.36.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-menus/gnome-menus_3.36.0.bb
@@ -6,6 +6,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 
 DEPENDS = "glib-2.0"
 
+GNOMEBASEBUILDCLASS = "autotools"
+
 inherit gnomebase gettext pkgconfig gobject-introspection upstream-version-is-even
 
 SRC_URI[archive.md5sum] = "a8fd71fcf31a87fc799d80396a526829"
-- 
2.39.2


