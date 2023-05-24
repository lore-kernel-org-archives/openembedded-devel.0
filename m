Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45BCFC7EE31
	for <webhook@archiver.kernel.org>; Wed, 24 May 2023 23:27:35 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web10.417.1684970847814706093
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 May 2023 16:27:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=jFFWXZDd;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-25566708233so769891a91.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 24 May 2023 16:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684970847; x=1687562847;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AaNzBu6/MlmaUl/gLEhbr8Ow8y+U274c9XJBjs5vACU=;
        b=jFFWXZDdVV7jKuGEmymmx7YIuqweCu+XqyONe7E+ix3txfIx3SUGG/R9MHkNQojC4o
         IJB1wH7u4eLO0xJdbQojOyUHQ4qaPiyxMdwV3PJnqkOr4l7ttf0FLFleNtzgpFAX+maq
         uRKSk/8CcUJe21lN05alGMsBZNWQ1BSPMsNk8BMkxJ01DcrfvuI8UkfemjiSRNurlhdW
         kd+9sKdjj1A3pri4fCrCarjjF+NeV6Sr+2Vp7dRV70jC4O2EW8xfLqiv4Gw3//pGTTQm
         lHNGici+IRkgjdIrOHJIDhbWCwqaZ7RIxrwf39uADwHtoGdlp/ZFVQ7fddKYRlyiWDIA
         GntA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684970847; x=1687562847;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AaNzBu6/MlmaUl/gLEhbr8Ow8y+U274c9XJBjs5vACU=;
        b=JQ8AOQ5ASUtF8w4ssWbWohzkW59YzUyqi0v9xuHHuc7A6ZhyJGzVRWdnK4CB8onLwe
         qv8LWTJG6kBRK4r53CppBJnpowHNtv+FFoBiIa/Sjd3b1yba4DNwI2L70aj8JczRCffO
         4usB+Prffa6mDFh8+l/U461ECLlGUq5Ut1JnpgSTB8nYe73yfu2Qreo0wYH2EENhVNOy
         fCLDupvEfytdteeZrS06hkcLBHIffG1DH8JYZZzFNN9AZ35Haxwr17diDVWcbjgtP3Kx
         G0sUv57vCS+1kNe96ZKtxGPp4/eAVi7e4Mox04q4DzX/qmXLHXZzKJNFwZ6PMyvBGcDi
         CCCQ==
X-Gm-Message-State: AC+VfDxpIun3mAWw1rBprdHcMRWJfDdigPoCPu/anFw85AwuebSCvxp2
	7C9cpGX8E/WyOkxbAPG5HVp5wlUhdI8=
X-Google-Smtp-Source: ACHHUZ4mC1eietaWWjoYUjSca6u6oyzmXqlIP1n+lsgIDpBICDGFoaCXITJkp3h2eM5UjVZ7kmrPfg==
X-Received: by 2002:a17:90b:958:b0:250:69c7:a95e with SMTP id dw24-20020a17090b095800b0025069c7a95emr16082907pjb.48.1684970847017;
        Wed, 24 May 2023 16:27:27 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::c675])
        by smtp.gmail.com with ESMTPSA id h22-20020a17090aa89600b0025315f7fef7sm1806013pjq.33.2023.05.24.16.27.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 May 2023 16:27:26 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-xfce][PATCH 4/4] packagegroup-xfce-extended: Blueman also needs gobject introspection distro feature
Date: Wed, 24 May 2023 16:27:23 -0700
Message-Id: <20230524232723.869580-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230524232723.869580-1-raj.khem@gmail.com>
References: <20230524232723.869580-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 May 2023 23:27:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102798

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-xfce/packagegroups/packagegroup-xfce-extended.bb    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb b/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb
index 64f8863116..4da2964e8a 100644
--- a/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb
+++ b/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb
@@ -50,7 +50,7 @@ RRECOMMENDS:${PN} = " \
     xfce4-verve-plugin \
     \
     ${@bb.utils.contains('DISTRO_FEATURES','polkit','xfce-polkit','',d)} \
-    ${@bb.utils.contains("DISTRO_FEATURES", "bluetooth", "blueman", "", d)} \
+    ${@bb.utils.contains("DISTRO_FEATURES", "bluetooth gobject-introspection", "blueman", "", d)} \
     \
     thunar-media-tags-plugin \
     thunar-archive-plugin \
-- 
2.40.1


