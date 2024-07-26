Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2516CC52CDA
	for <webhook@archiver.kernel.org>; Fri, 26 Jul 2024 09:41:58 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web11.57888.1721986916546206632
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Jul 2024 02:41:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=mMq9mrTZ;
 spf=pass (domain: linaro.org, ip: 209.85.167.51, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-52efdf02d13so1693483e87.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 26 Jul 2024 02:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721986915; x=1722591715; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IFGEl1lv9e4L65zqhceTQitaqiuN5rwMZJ+nRs+99qU=;
        b=mMq9mrTZVbwrdNcHN3LZZYMA/jnhyZK0JHEFDXpz0sclVxXPa5TY7Gc7N/qB5fJFtM
         IibDNLCJmbTr8uLJgeKVAspcxWakRjHAU07n79N5T7hsc13y/tE8bk74zLGprlT6uCFw
         JvIq3l5xolIC8A4py2OWOzygeYH6rJrMNoxUk5QfiAJC2fPk7Cqp+cBrfiBK2aEE9vR1
         mGI6sGOFdDNyL3B0v6EvAUZ6jSicCNLtcdzGdDLU9zrURwzxbBrOfzgEckSigiU6aoUR
         9JXBWv1k+yifCmx204oFnEor5Wvw8gJUg1JTU4S9zo+rzW+xZpyYkx5ZAhY1GdDKJHja
         nKYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721986915; x=1722591715;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IFGEl1lv9e4L65zqhceTQitaqiuN5rwMZJ+nRs+99qU=;
        b=o3RZ5Gy6z5sIDcUkgOAINGfsmKjm+rxRRkJaPkZbXunamCcDemTDasXQK8EHeT7Y+v
         uIJ1s/Y8XarA1Vc0o8RR6N+xjgg6F1rPSEGxbRQBDvMd/PXhdVokSSXNd5A6VXqWWGvf
         8Tym6bUBf+O9Fl0CAwK78PECGAq1Sc8lUPMYue0OlmyQ4d9N9DjnEy0Ge7N3JROv5bN8
         nMTQtxzBpf2MYcn2DK9BT+k+Dx6J8UWRdOjMLTOQyW2E5rf65l83bWaa3e7cLPKmRUzJ
         jFeuEs+fcsjK5kqWJ90rU39+m+kUjBr4VMMFP4BtuCfNcxzml1YZVZZ6EUKLbnf1rdui
         BAKQ==
X-Gm-Message-State: AOJu0YwStEYERy5w66mMPayeMGZsTY5mqJF4wueSz2uMR33Og5FcO/+4
	l2SKsyvsXibztN2+UIi/8p+5XDNPXFMUdZfGUsajadBfRRvOR93fhZpRZFKc5OqI6mBGeGumvu2
	D
X-Google-Smtp-Source: AGHT+IF8X9tsKiFsrTjjynuGmmIFgXS1CnzWyfJ+MndnohN2d/b7cdmbuaM7p8r8kvzug0/Jd1iRwg==
X-Received: by 2002:a05:6512:e83:b0:52c:df8e:a367 with SMTP id 2adb3069b0e04-52fd60918b4mr3716105e87.53.1721986914616;
        Fri, 26 Jul 2024 02:41:54 -0700 (PDT)
Received: from localhost.localdomain (drt4d6yyyyyyyyyyyyhlt-3.rev.dnainternet.fi. [2001:14ba:7430:3d00::193])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52fd5c090fesm453733e87.131.2024.07.26.02.41.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jul 2024 02:41:54 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-devel@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [meta-gnome][PATCH 3/3] libjcat: skip buildpaths check
Date: Fri, 26 Jul 2024 12:41:14 +0300
Message-ID: <20240726094114.13263-3-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240726094114.13263-1-mikko.rapeli@linaro.org>
References: <20240726094114.13263-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 26 Jul 2024 09:41:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111440

Test binary has embedded build time paths. Ignore
for now.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta-oe/recipes-gnome/libjcat/libjcat_0.2.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-gnome/libjcat/libjcat_0.2.1.bb b/meta-oe/recipes-gnome/libjcat/libjcat_0.2.1.bb
index 2d95e1444..7dc88d727 100644
--- a/meta-oe/recipes-gnome/libjcat/libjcat_0.2.1.bb
+++ b/meta-oe/recipes-gnome/libjcat/libjcat_0.2.1.bb
@@ -32,3 +32,5 @@ GTKDOC_MESON_OPTION = "gtkdoc"
 RDEPENDS:${PN}:class-target = "\
     ${@bb.utils.contains('PACKAGECONFIG', 'gpg', 'gnupg', '', d)} \
 "
+
+INSANE_SKIP:${PN}-ptest += "buildpaths"
-- 
2.34.1


