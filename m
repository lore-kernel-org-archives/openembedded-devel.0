Return-Path: <jan.vermaete@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE0A8D3A699
	for <webhook@archiver.kernel.org>; Tue, 29 Oct 2024 20:26:34 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.4206.1730233585480886014
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 29 Oct 2024 13:26:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=E/9GEzO0;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: jan.vermaete@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4315eac969aso1514905e9.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 29 Oct 2024 13:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730233584; x=1730838384; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CqB/TI0XOUfpMLtfuFlWqjvh/oJLDWj0SHgScqKAJJ4=;
        b=E/9GEzO0zFhm+2+WFVQHq//PjU4Lc/1sU6C0TqDSo1dkFHUO07BJ7xw6hhP0eVw66B
         ukhIe1Y1syiX62Pr4DZgmViczosB4d7xI1Q5lFKPNJs7wRPLbPRkJy6mdfs42Hd9TFWE
         kOhq9NFq3XFzHhhXYbQcOpHI999RahlwXU1hInIBDapoWtDp9Xmi1GzZbDuAxt1yFf3y
         X5/ra4T400l8MTwW1f830WDVIJBHxVK5D4K2VpYIKWqMAcGbuCDiBJ/eyAq4Sw8yIgK7
         sSr3DlJiAgElQzeHbK9HsStA0GZHfxHDq7LilDjcsv6IcZIwrf8zBQPPL9iGZ6I4ZIz2
         ATug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730233584; x=1730838384;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CqB/TI0XOUfpMLtfuFlWqjvh/oJLDWj0SHgScqKAJJ4=;
        b=Ir09/HQaWYRDYa/LHORw6baY8y9mIBw8zmUPwFczMyVQxNeh144qWXdwlEi9urWNPs
         TVc+hco2VZr3nH1n9DuoiBMvYkynjvql7/YklQooaQ7F7ii/jn/tfOI2uoSVezd2Xcoe
         yPECPy3ZXOdY65F2etVohEjh1ZkgZN39p/1tLT9mCfZCZ3uKesoLE7+12Fq151lRcwII
         t6xX8dW5mcXfp3tb/8EArIR5ug5uT6XPdmMhX4LCnmUDCkMyE+ZRIfvmhuhlY4a9gkaz
         oDeEBt2f2u2LNzfT3P28WDIkKLwYPddJZoxZF+NEi9gWnrTUoQLTMSlt8S1DRkU4dczT
         Ls9g==
X-Gm-Message-State: AOJu0YyXH2LftaSEtH6kHqtVwK42XeTetUKHHjkrtl95GxmPgnLrK1Qj
	TIKWCA3jpU4R+Rjy70vzsl5ziqtFVQ+FWdLR6A6lbe8dwsFUs1Uz5a51/r0S
X-Google-Smtp-Source: AGHT+IG2sKQ1EhgyMxeekb8+7tYAxJcY/0KjxccUC3oNf7ivicH/8Zr78s5sMbt1kfce3nh6akvQTg==
X-Received: by 2002:a05:600c:4508:b0:431:4fbd:f571 with SMTP id 5b1f17b1804b1-431b5737c83mr29061425e9.13.1730233583495;
        Tue, 29 Oct 2024 13:26:23 -0700 (PDT)
Received: from localhost.localdomain (ptr-fij45qxtdobqrxrcewr.18120a2.ip6.access.telenet.be. [2a02:1812:512:2c00:6021:e9a4:5aa0:257b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4318b570880sm186166235e9.35.2024.10.29.13.26.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 13:26:22 -0700 (PDT)
From: Jan Vermaete <jan.vermaete@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jan Vermaete <jan.vermaete@gmail.com>
Subject: [meta-python][PATCH] python3-apispec: Upgrade 6.6.1 to 6.7.0
Date: Tue, 29 Oct 2024 21:26:15 +0100
Message-Id: <20241029202615.1874859-1-jan.vermaete@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 29 Oct 2024 20:26:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113333

Bug fixes:

    Fix handling of fields.Dict() with values unset

Other changes:

    Officially support Python 3.13
    Drop support for Python 3.8

Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
---
 .../{python3-apispec_6.6.1.bb => python3-apispec_6.7.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-apispec_6.6.1.bb => python3-apispec_6.7.0.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-apispec_6.6.1.bb b/meta-python/recipes-devtools/python/python3-apispec_6.7.0.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-apispec_6.6.1.bb
rename to meta-python/recipes-devtools/python/python3-apispec_6.7.0.bb
index 90d7ee271..670c791db 100644
--- a/meta-python/recipes-devtools/python/python3-apispec_6.6.1.bb
+++ b/meta-python/recipes-devtools/python/python3-apispec_6.7.0.bb
@@ -5,6 +5,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=a75956865b40c80a37c1e864716592b4"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "f5caa47cee75fe03b9c50b5594048b4c052eeca2c212e0dac12dbb6175d9a659"
+SRC_URI[sha256sum] = "fa2cf1063bb227ed6f7f66b019f320d7dc0a7cb02acdf166a160e2381f4b2c39"
 
 RDEPENDS:${PN} += "python3-packaging"
-- 
2.39.5


