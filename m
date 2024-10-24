Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91E23D10376
	for <webhook@archiver.kernel.org>; Thu, 24 Oct 2024 20:36:14 +0000 (UTC)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
 by mx.groups.io with SMTP id smtpd.web10.6185.1729801142155734811
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Oct 2024 13:19:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AynRma6P;
 spf=pass (domain: gmail.com, ip: 209.85.128.181, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-6e2e41bd08bso17278797b3.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 24 Oct 2024 13:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729801141; x=1730405941; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kanIdvyXalZTW5Sxx0ej3gA5qqev2Mm0A97RIsA7G5o=;
        b=AynRma6PuOJkN7aKaXfb/fY6HduDyx1N1OZu2dmzfUN+0dH5WhvYvEMFlVLeunoFMw
         yoXGUHtI+UK5qckYfZZdZuoegX6R3v5VCiPvLsYNnUH1we80io5W+s8fiXz4fXe6NliM
         DhFY4B3WAtPbrwu1VFLk7akgMI3h6RKaF5oYcGUmN8E2ze3nX4VkDD5HWCE4QRugDVW9
         gLvGyW2utsRJY2AvLJjUBhZMkLtTRxkM8kLrwlQ97/TwelFBZHqQFyYzJ9hS/HuLP6f5
         vxbVMqLG9uwzyqYTLl1kuozsoP0vGHQriH71rcD0tVt2o/ORWQBH7/NcWRDK+5RgBTCK
         C5bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729801141; x=1730405941;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kanIdvyXalZTW5Sxx0ej3gA5qqev2Mm0A97RIsA7G5o=;
        b=CWN1pvzh0TvRvhNoCM4wYaG0Ej3FTyRvOsuJsdpB+8g+62Z6oKD9crC1RyTj4JbB0t
         KoQ9P8DlTiLjhJr6VKR3aIYGGxS2VOS6ThLEJBaIOlDV+2SHAKzo1UwmIj8ggmb0wrC8
         Ht9bLW1y9NoHlk5kFm2LFf7nzteYyg3O+SI/4mvwpBm/QrgSanQVkeqgvPMkDay9M5P7
         Ma+T23BPnMO0U4e4/UOIeLyvyY5a6yZcTBlZoH4hmXAG52IMmsJbzzmXF0/Lhdh5kJDf
         X3F+/oVIUiJ213wefhBNPi/+I293TYIggEIZVsHyp/TDIeib1fsvT1qvEhSONBt0wCWg
         +Jvg==
X-Gm-Message-State: AOJu0YyBxBXZU5azLYMFBZhIpTshvsBdoUs1X88g431vJrX0+9c0sXg2
	Lyv4dm4mqNRGJlVpAr4OtYR6EqqV2wxo6rvDWEzuvchQYWfN4w+szFXEcg==
X-Google-Smtp-Source: AGHT+IGGZIqbKLurmLsSDwkl6O8W2RVU5x6CWWA3mPMxSJWCAQ+9HSCCW/TYARzG1uaZbHGPusxd5g==
X-Received: by 2002:a05:690c:2b04:b0:6db:e045:3b07 with SMTP id 00721157ae682-6e7f0df59f8mr66918717b3.17.1729801140776;
        Thu, 24 Oct 2024 13:19:00 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5f59f551csm21484897b3.10.2024.10.24.13.19.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 13:19:00 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-perl][PATCH 12/42] libextutils-config-perl: Change references to search.cpan.org to use metacpan.org
Date: Thu, 24 Oct 2024 16:07:31 -0400
Message-ID: <20241024201806.440273-13-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241024201806.440273-1-schonm@gmail.com>
References: <20241024201806.440273-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Oct 2024 20:36:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113190

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../recipes-perl/libextutils/libextutils-config-perl_0.008.bb   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-perl/recipes-perl/libextutils/libextutils-config-perl_0.008.bb b/meta-perl/recipes-perl/libextutils/libextutils-config-perl_0.008.bb
index 0f43c537c..b6e80cd88 100644
--- a/meta-perl/recipes-perl/libextutils/libextutils-config-perl_0.008.bb
+++ b/meta-perl/recipes-perl/libextutils/libextutils-config-perl_0.008.bb
@@ -2,7 +2,7 @@ SUMMARY = "ExtUtils::Config - A wrapper for perl's configuration"
 DESCRIPTION = "ExtUtils::Config is an abstraction around the %Config hash."
 SECTION = "libs"
 
-HOMEPAGE = "http://search.cpan.org/~leont/ExtUtils-Config/"
+HOMEPAGE = "https://metacpan.org/dist/ExtUtils-Config"
 
 LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1932ab4d8b84c25fd7967aa18088e57e"
-- 
2.43.0


