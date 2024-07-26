Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26405C3DA49
	for <webhook@archiver.kernel.org>; Fri, 26 Jul 2024 09:41:58 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web11.57887.1721986914508397232
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Jul 2024 02:41:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=d0MtBymB;
 spf=pass (domain: linaro.org, ip: 209.85.167.45, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-52f01613acbso1098008e87.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 26 Jul 2024 02:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721986913; x=1722591713; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0R0CiXVjskXMubmg3l4Ku4oX+AzXXNj9SKjsHb1avwU=;
        b=d0MtBymBIEkOs0XtvLy840Kht1VMk8YnX7ECToErb6zmOtfVzfmIC5G2Ke03Re22Wa
         7nKkd3kT+rwdzXb9R7JaKmDSiBjTDXQu/MPR+AWOJzI2Y3LUu2AAGkuKL8vrzcB850ur
         UsOnbQHOzsUdevN20pkuHbtLi4ED25eLvZufJ8PGk2q2raA4jSY/NZ66AY4Du5C87nSq
         4czBw6MwUV/Fu0wuzyDoggcPuoBA6idKw/5QDXuWpesII+n42NhfvYaOIoa40CyNxh9n
         yl3nd/gg8W3DSM091yOaljzAAW9ww5Jcbb0qI2HH0rSDRJSzGlMSmuod3uofcHzub8Tk
         5jPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721986913; x=1722591713;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0R0CiXVjskXMubmg3l4Ku4oX+AzXXNj9SKjsHb1avwU=;
        b=XG2wvcTd+Yx1XwaXLcPJU19fxqI87jkc+v2l5ibT1rAxZ2fejEjUdpfSS4s3uW5rwd
         0vngMQ7gl6IUIXWVlGe6l9MLqa/XSRTt8zAZnF+3Rg1uofVXMfV+tDYGIeEt/jV1Oi5g
         d7vnKirGJTMm/tCcuOAS1FCe1+lWccIoe+s0OdUChsR9OkXGZ40rxSAtYVuhaYCpVAgj
         dnhU0y8LnYOWUwKaerULMcgmDM6JJ5TSd/4LVvnpgh2K0aIQM6+9Nw9BVg9DPKVjVnZm
         mP/Vremgm7T2pPFLZDTC6r50WyfupQ68kYYlT01llgvEFjFpaU1KE8hERUxPwgsoQ2yJ
         cGXQ==
X-Gm-Message-State: AOJu0YxK5k5VRPy8syrGenvXHrs3O0vVJln2zlJ/4U723cYEZuO4m++q
	agGqC1wUJ4GNzbrecYZ0HLoyIDmprMFGOX0kO+VzKha7tyehuVEwWmbhUJ/51UPTFI4OgN7XQ8b
	4
X-Google-Smtp-Source: AGHT+IE44LTBIZ6ZR0dBUofmg/CtUcLvyHjjj1g/T1Ks/SzH2xPGkOg5OgpWKjGG79KloI7GCQSPlQ==
X-Received: by 2002:a05:6512:ea1:b0:52f:c24b:175b with SMTP id 2adb3069b0e04-52fcf943855mr2167009e87.27.1721986912645;
        Fri, 26 Jul 2024 02:41:52 -0700 (PDT)
Received: from localhost.localdomain (drt4d6yyyyyyyyyyyyhlt-3.rev.dnainternet.fi. [2001:14ba:7430:3d00::193])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52fd5c090fesm453733e87.131.2024.07.26.02.41.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jul 2024 02:41:52 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-devel@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [meta-gnome][PATCH 2/3] gcab: ignore buildpaths error from sources
Date: Fri, 26 Jul 2024 12:41:13 +0300
Message-ID: <20240726094114.13263-2-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240726094114.13263-1-mikko.rapeli@linaro.org>
References: <20240726094114.13263-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 26 Jul 2024 09:41:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111439

gcab-src has some meson generated files which embed
absolute paths from build environment. meson seems
ot do this on purpose to fix other issues.

Ignored those issues for now.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta-oe/recipes-gnome/gcab/gcab_1.6.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-gnome/gcab/gcab_1.6.bb b/meta-oe/recipes-gnome/gcab/gcab_1.6.bb
index 4278fc945..49c64f0ba 100644
--- a/meta-oe/recipes-gnome/gcab/gcab_1.6.bb
+++ b/meta-oe/recipes-gnome/gcab/gcab_1.6.bb
@@ -22,3 +22,6 @@ PACKAGECONFIG[nls] = "-Dnls=true,-Dnls=false"
 PACKAGECONFIG[tests] = "-Dtests=true -Dinstalled_tests=true,-Dtests=false -Dinstalled_tests=false"
 
 BBCLASSEXTEND = "native"
+
+# meson embeds absolute paths to generated files on purpose
+INSANE_SKIP:gcab-src += "buildpaths"
-- 
2.34.1


