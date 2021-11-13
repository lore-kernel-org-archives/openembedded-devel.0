Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 202D2C43217
	for <webhook@archiver.kernel.org>; Sat, 13 Nov 2021 17:46:12 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.374.1636825571461737398
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 13 Nov 2021 09:46:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=MGeV8fNA;
 spf=pass (domain: gmail.com, ip: 209.85.214.180,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id u11so11045016plf.3
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 13 Nov 2021 09:46:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vGDodf69H44Lc9Z1bxHzvz9D5j/3lRI7Y7vyRMA0QxY=;
        b=MGeV8fNA4r43E+LxEEHoy51KYAV6GdB8qBszIZxDnIks0xCyDvG4teXhEz6bQiCQzD
         n7Xnu8XVQQojbFoG8puGUvEfx+P753K1XB3rVWoIkCuRYK+f4u6KJPEzrbGn9xmsvNEf
         21zlNJYtplDsmlsYftGt+kSwrrBoPwNQYTzvSEFG297SNfxnX40Nnn8jVJs377vzRi8R
         AthuAWHvRBth1MWUld17uUKr2R9IYOZASNkVHQKBNMmbW5k7cC1C9pMVQ3BoRrWUMcBA
         5ylq4MS5vvB14Yu/MX/ikYEq1cV0Aq6gd0d7w8Y+Y0lYx7YaSEW2lIeKxinoWtLL+8Ov
         iJZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vGDodf69H44Lc9Z1bxHzvz9D5j/3lRI7Y7vyRMA0QxY=;
        b=CmFRCUq/dI8gWHFdTt+34+AunqWndh2uKhQ55heVZmwuTPKTK+KfhKDNU/9Xhpr0U0
         DflnLX6hRjGskTRv9D6lFfCO0uD1ydnOaldmUVX8iiB+NH4bKGsU90naPSXYJMkUv9zx
         CTNI7nE7xCLzmZPtJ/+IKMuLLGqGGfMQGsaHRu0hsS/hA1AOB4jBJb2WWXiBSY8CtjiY
         RldhbJT9bn2Ouh0Moq0HXDOAbxRjBDLj/7XAiuMia3Ag/QSyhhkb2xtNL6UN47GifahF
         HAZZZrgNOK9zE95x+YbKPxlY3G/5jaAWJKo77Kb4OA5srm8LreS96q/jaToqI6rXIMnG
         4P5g==
X-Gm-Message-State: AOAM530w/UvdcLyiuq+1VTREEcSauOIprf8X1wfH3bpZH93a/btSQxM3
	19EnkQ0IM/M79d1cOWcqNjxykH5tkaQ=
X-Google-Smtp-Source: 
 ABdhPJwyVSIsul/0mYo/txhgp2J9OgdxmUytuWVv3dN3bsBsaUAFrDy04gOTVrCO/EseRzfVD0fxXA==
X-Received: by 2002:a17:90b:4b0e:: with SMTP id
 lx14mr46238130pjb.160.1636825570740;
        Sat, 13 Nov 2021 09:46:10 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::7905])
        by smtp.gmail.com with ESMTPSA id
 d13sm10649107pfu.196.2021.11.13.09.46.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Nov 2021 09:46:10 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-gnome][PATCH 4/9] libgweather: introspection is not valid meson
 option
Date: Sat, 13 Nov 2021 09:46:01 -0800
Message-Id: <20211113174606.2044137-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211113174606.2044137-1-raj.khem@gmail.com>
References: <20211113174606.2044137-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 13 Nov 2021 17:46:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93933

meson 0.60+ errors out on unknown options and -Dintrospection
is not a valid option

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-gnome/recipes-gnome/libgweather/libgweather_40.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/libgweather/libgweather_40.0.bb b/meta-gnome/recipes-gnome/libgweather/libgweather_40.0.bb
index 1d9daac1f0..49493b17b2 100644
--- a/meta-gnome/recipes-gnome/libgweather/libgweather_40.0.bb
+++ b/meta-gnome/recipes-gnome/libgweather/libgweather_40.0.bb
@@ -11,7 +11,7 @@ SRC_URI[archive.sha256sum] = "ca4e8f2a4baaa9fc6d75d8856adb57056ef1cd6e55c775ba87
 
 # gobject-introspection is mandatory and cannot be configured
 REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"
-UNKNOWN_CONFIGURE_WHITELIST:append = " introspection"
+GIR_MESON_OPTION = ""
 
 GTKDOC_MESON_OPTION = "gtk_doc"
 
-- 
2.33.1


