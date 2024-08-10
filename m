Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7F8AC52D7C
	for <webhook@archiver.kernel.org>; Sat, 10 Aug 2024 15:28:19 +0000 (UTC)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
 by mx.groups.io with SMTP id smtpd.web11.7795.1723303689652961586
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 10 Aug 2024 08:28:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YLnZGbff;
 spf=pass (domain: gmail.com, ip: 209.85.128.180, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-6659e81bc68so31485397b3.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 10 Aug 2024 08:28:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723303688; x=1723908488; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5JijibKZiziATb6DWgXb8RMnub/MDZUuTJshJqt8DYQ=;
        b=YLnZGbffGeSaBsHRFCQ1J8X+3LZq63VUh+do0XbzqkFJZMs85IbVSU7yrczO+GrExf
         ey/I+aT1SzIIkifPDQr5uaJYczN1raohe3DlTF4eeu2m3jzXBHcP4S37A5MEyOCkcheY
         xt75RDWSmObUadU6PnXKf5+fY4hak+BsxsG1zUEq6xR5t3NGV3Zas/CRKcISVN2e/E6c
         iI1cu2UwYvz0XQPTlFouVLjmRmdJatGwOyqKcEKVwEwfJcBe/+hjwflZpP5h0dYtXjYm
         TdJB8N9HWc2/0chvDlZBdT7cs4vAfWJ/crwpIG2E2UjZ5PJrXXTm5pOVlkD163vTsRJ0
         RzJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723303688; x=1723908488;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5JijibKZiziATb6DWgXb8RMnub/MDZUuTJshJqt8DYQ=;
        b=at2GqLg3SddyAJkm4GHkIPeYTUr8fARSeOudwMHEVTR78lA+QWEyu5h37ydUajH6K4
         hQoKjsTy6q7eZqe0BBlIe75df72fAW0mAO4P0gDPcVb9TZcVcE0AU04cVv39ccytUx/e
         diMTz361TRZi3kIg+zZNg1ceSnJSLedtb263LNWhIsRIatm2Ug/udwJL9lQUYlg8J0Hv
         +JCfpG7tuJeZvuA8QcP2ixLLMRgTb3yMaoYH4C6m1SYCOsgZYGz+VoOVp4GMUDyRzgcN
         FRqADSHOh78Sw26gDhFRB5V9KacJk+aBZik5k1QdzZrERPdUCtS9i8MAVN6NbUbquyGH
         FgSg==
X-Gm-Message-State: AOJu0Yy7Jaom8sNuk8sQoCXHq5DwHPGf83H57OfoGKbPrZpiLG54Ny4M
	xr2w/5OEu9/K8rduvmb+BBK9YUxJ9DFHVMS7+KmKzTpHlV2IKj4gzq5ilQ==
X-Google-Smtp-Source: AGHT+IG42+QYl6vKMmgdMjk/0AyrhV4OwPUtN0//AwRcCgy1hHRvHoWWh5C/Ty0aTzydEitjb8CqfQ==
X-Received: by 2002:a05:690c:289:b0:64a:4728:eed with SMTP id 00721157ae682-69ec9636187mr52296167b3.46.1723303688606;
        Sat, 10 Aug 2024 08:28:08 -0700 (PDT)
Received: from keaua.attlocal.net ([2600:1700:45dd:7000:ad:eb2b:7538:7504])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6a0a068cf32sm2848947b3.48.2024.08.10.08.28.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Aug 2024 08:28:08 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][scarthgap][PATCH 2/7] gcab: ignore buildpaths error from sources
Date: Sat, 10 Aug 2024 11:28:02 -0400
Message-Id: <20240810152807.899873-2-akuster808@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240810152807.899873-1-akuster808@gmail.com>
References: <20240810152807.899873-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 10 Aug 2024 15:28:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111739

From: Mikko Rapeli <mikko.rapeli@linaro.org>

gcab-src has some meson generated files which embed
absolute paths from build environment. meson seems
ot do this on purpose to fix other issues.

Ignored those issues for now.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit db91757e7bd98494666ca00bc7727a7607b6004f)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-gnome/gcab/gcab_1.6.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-gnome/gcab/gcab_1.6.bb b/meta-oe/recipes-gnome/gcab/gcab_1.6.bb
index 4278fc9453..49c64f0ba6 100644
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


