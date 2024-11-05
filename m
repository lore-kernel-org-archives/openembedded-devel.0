Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EAABD2B939
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 14:37:00 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
 by mx.groups.io with SMTP id smtpd.web11.19525.1730817410586691867
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 06:36:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MmhKvDnR;
 spf=pass (domain: gmail.com, ip: 209.85.128.177, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-6e330b7752cso43323497b3.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 06:36:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730817410; x=1731422210; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JHu2+oJNSNK1iuHhEPo0f6ZFnaG6shiFjU/0jRNbrww=;
        b=MmhKvDnRJ/mSt0GSaqDsgqgp394tLx9YubTgNGlmZnofHMDSHS2gP81KoCQWF5/yAQ
         v6ilZcjDNU4YqHF6MdLlc6Qhdi8GqH+cK3/kjnbob6qtP9JnDea9iEbEDhEnvdL5K8BQ
         LSHAnmFM4liTQoRWAMMPW9V1oXIabfaXs1vKkuDoIix+cW3FU0Qqh25SJ1XSCdbKHe/3
         79XrNBNuzKl6fnfEdI6v8d4jNv1jMfo30AVS21N9g1ah2XzRg4VGfbVCXbagbnwrRS0e
         COrqXh7aw1K8FnJff96t/BqDVAP6r3xw2DZ9Ua7EDcOLKh8QKcY9a7Lo+ySNLYjdJtBu
         SW7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730817410; x=1731422210;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JHu2+oJNSNK1iuHhEPo0f6ZFnaG6shiFjU/0jRNbrww=;
        b=Ab6CnaTGGi2GRVf7B/R5H7CFsEFRFUXCg4rE3gHyXkCalVTnxqvH07qLnNIkBbOlAf
         6nyMwTzKug9UKuzsRGq7g7cui/RlG7R1562pdSEMobtBxm9RPxys3SvfmlyS2okGBNMI
         WpRpuT4fVfI1L32E6frOVWggVdB1a+pkiCuhrVOXRp8OeyQpFu7OVGCL68qlZgKkPB2l
         Nj/drDzOISm3CsBnHWUPau8hjySLtU5sgGGmw1/0s0DdOTYTAmAdSeiuXGqJhNReSciY
         sheI+rrJI5YxkDQ2BtF72qa4dst6ilSzmUvkx4JAjbhmpEMBrPkmZVEU1JDAOMrum4EW
         L9Ow==
X-Gm-Message-State: AOJu0YwZhfo3BHyPeDehFh45GhsjgEnB8BZPiDPjCICzyUgodUcDPWSC
	lqZRt+ZA+WPndbEAbKxLeR3fDaHF4WyIMfFM6eAKUitZ4dD62pNM78BdhA==
X-Google-Smtp-Source: AGHT+IEQkBoj3Xoz8N/XIlLEDRKQnKVeeXVuCkELmIFBweh6eKKTJvkYfoxB6eroFWNMi+ozsb84vw==
X-Received: by 2002:a05:690c:7346:b0:6e3:7625:15f7 with SMTP id 00721157ae682-6ea6432725cmr134519437b3.10.1730817409668;
        Tue, 05 Nov 2024 06:36:49 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:45dd:7000::29])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c8723esm22495977b3.126.2024.11.05.06.36.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 06:36:49 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][styhead][PATCH 23/90] python3-virtualenv: upgrade 20.26.4 -> 20.26.5
Date: Tue,  5 Nov 2024 09:34:48 -0500
Message-ID: <20241105143638.2301245-24-akuster808@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105143638.2301245-1-akuster808@gmail.com>
References: <20241105143638.2301245-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 14:37:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113440

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Use uv over pip

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...hon3-virtualenv_20.26.4.bb => python3-virtualenv_20.26.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-virtualenv_20.26.4.bb => python3-virtualenv_20.26.5.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-virtualenv_20.26.4.bb b/meta-python/recipes-devtools/python/python3-virtualenv_20.26.5.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-virtualenv_20.26.4.bb
rename to meta-python/recipes-devtools/python/python3-virtualenv_20.26.5.bb
index aadef0e947..82d60aeaab 100644
--- a/meta-python/recipes-devtools/python/python3-virtualenv_20.26.4.bb
+++ b/meta-python/recipes-devtools/python/python3-virtualenv_20.26.5.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/pypa/virtualenv"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0ce089158cf60a8ab6abb452b6405538"
 
-SRC_URI[sha256sum] = "c17f4e0f3e6036e9f26700446f85c76ab11df65ff6d8a9cbfad9f71aabfcf23c"
+SRC_URI[sha256sum] = "ce489cac131aa58f4b25e321d6d186171f78e6cb13fafbf32a840cee67733ff4"
 
 BBCLASSEXTEND = "native nativesdk"
 inherit pypi python_hatchling
-- 
2.43.0


