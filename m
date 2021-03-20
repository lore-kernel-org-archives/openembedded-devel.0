Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web11.9351.1616275430057862492
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 20 Mar 2021 14:23:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20150623.gappssmtp.com header.s=20150623 header.b=KkhAY3yO;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.46, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f46.google.com with SMTP id o16so12683251wrn.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 20 Mar 2021 14:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CUmkOaFa7rfK1wlTl5ZQ42rgM6ll0ULeRd8L4EarQik=;
        b=KkhAY3yOO658m4ywCK2NpHdgVoFbcpj44iKGafnL5wrGmD44AQWEgdT8QumCGJdRTx
         WEbbCCUWhQl2DsB/r2xCPEsYyZExb31lgcFzMY3TaIWVnbbUmg2ezscQeYuwb9NGtjBY
         KHO8fqC5890D1mUR6Uhi69clgCkScE61geCrvQ3Zb5COoMDPbV0QEGzN5X2XZuklTtun
         zHJdLOvQyCKpC4QPwIRH4qitZcFRHRX6iMw4jWwrbcd5tei/b2jAHpEceCADDRXAFcoh
         z4LOCMQrfTBbGC3akIGZKLrG3LfApW53BTr6abMLG31REk1Y5lRAxuYnKZ9ionmdrUHQ
         kZow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CUmkOaFa7rfK1wlTl5ZQ42rgM6ll0ULeRd8L4EarQik=;
        b=ZifGyh66FHV6PwK63wnfzk/ZpCvDxLfvSadmBB1UgOIaTVfCduxldi8tDLUKNWzPtJ
         OKnOQV6HYdhLt/mHhhMV0EZ5AOeuccE2IzvyfOu3cU8JEZCBPMdzFAjtMT48r3R0i4RQ
         ztvcS4UWx9mVHIWFX2nGSulQj7rXtmU9oRNQ4ZNvJK9TXJnsjOctKgRExKgrTKLBPuDj
         Lh5snFMcbRrh67w6gBhegYU8N424EPTuMzDptu18F1fq2zNZTlHCNC5gWC/sW2xPDwUV
         75rhdR7qtJyfa0CDlIcSdOXsujfxH58dMKt4JLqWclL0jK8ZOlKmdANIxr7Lt9NSazHF
         ZKvg==
X-Gm-Message-State: AOAM530wal7lfy8ii6maaCi7LBvQGwnxORWs4dbBJHbf5RbvGsdQ1Cjv
	gtSFflgrqR5UHUWfJUZKnxjeFA==
X-Google-Smtp-Source: ABdhPJwmchS5qXrLCg4SXJYrwhKHKmNnmpef5Fmw+aV04Gsvfp54QA0VyaoFkCFRXnYIy+t2jK4B5w==
X-Received: by 2002:a5d:5088:: with SMTP id a8mr10937135wrt.294.1616275428743;
        Sat, 20 Mar 2021 14:23:48 -0700 (PDT)
Return-Path: <brgl@bgdev.pl>
Received: from debian-brgl.home (lfbn-nic-1-149-6.w2-15.abo.wanadoo.fr. [2.15.231.6])
        by smtp.gmail.com with ESMTPSA id p17sm11308962wmq.47.2021.03.20.14.23.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Mar 2021 14:23:48 -0700 (PDT)
From: "Bartosz Golaszewski" <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Armin Kuster <akuster808@gmail.com>,
	Tim moto-timo Orling <TicoTimo@gmail.com>,
	Derek Straka <derek@asterius.io>,
	Trevor Gamblin <trevor.gamblin@windriver.com>
Cc: openembedded-devel@lists.openembedded.org,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [meta-python][PATCH 4/4] python3-wpa-supplicant: replace DESCRIPTION with SUMMARY
Date: Sat, 20 Mar 2021 22:23:09 +0100
Message-Id: <20210320212309.11310-5-brgl@bgdev.pl>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210320212309.11310-1-brgl@bgdev.pl>
References: <20210320212309.11310-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

SUMMARY seems to be the preferred variable for short info on a project
supported by the recipe. Replace DESCRIPTION with SUMMARY for
python wpa-supplicant module.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 .../recipes-devtools/python/python3-wpa-supplicant_0.2.bb       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-wpa-supplicant_0.2.bb b/meta-python/recipes-devtools/python/python3-wpa-supplicant_0.2.bb
index 55e508805..2309bec5e 100644
--- a/meta-python/recipes-devtools/python/python3-wpa-supplicant_0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-wpa-supplicant_0.2.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Python interface to the wpa_supplicant D-Bus interface"
+SUMMARY = "Python interface to the wpa_supplicant D-Bus interface"
 HOMEPAGE = "https://pypi.org/project/wpa_supplicant/"
 SECTION = "devel/python"
 LICENSE = "MPL-2.0"
-- 
2.30.1

