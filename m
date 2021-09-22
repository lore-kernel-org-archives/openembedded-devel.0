Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web10.922.1632338538596587531
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Sep 2021 12:22:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=QHuh28Dv;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id v19so2805617pjh.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 22 Sep 2021 12:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vAwtsF+lOrMXG4rzQ0hMshXkTh0yENW7qvHKOQAr4DY=;
        b=QHuh28DvSnQW53yeMSyplyizMYk6nn+GLQxhDRRzKx4TNg8hddHDDyRTM35Et/zlB2
         PkynSUlc1shKN/FHQU8vxLUhK3BzalQUYJ6KYHFL59UUq8Q0tYBwhc9dLe6vRuoakuFb
         +jKXK1ubAqtcqJbIL7tRlcfyu+0Z6rV1e+ahJIzn+quXXQR8nkNUk/LH5MoOURZawmrJ
         JRj9k6cwsET3TK66z7s2OCXSow6hmM767F/jbzNufQeYgHHq9CSUT+/5vpsOmJEoYELr
         zLVRZ1dqoKr2TE+gx6tcS4yIihsGyAoE6zqfR3/ZhakC7pb6awXnAnQeJjNnujZ88FIN
         srZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vAwtsF+lOrMXG4rzQ0hMshXkTh0yENW7qvHKOQAr4DY=;
        b=35IKL3e3l6lZIWLcE041Ete7Cc53/hB8AgvA7AOTfPSZp60dVrCcJYiVdW4m4ZSOBj
         MgHvg+KEDh5d2IW9djYZFt2/LuoJxi5R9uK98WOlIXb5oAOLgweYAHH7B8aRrtsDKHby
         OHnsFOfS6ZH68VIi84qux5KqzEjYqb/j9WtY74RIQU2OMyUVoyGWMvH9O1uecs9g5Xzi
         3pUVPNxKG8VnE4nQeuTMAdvQWyFcAN5zh841sQSPGqKpukb6cwoXy8g9yi1JZL2vWFMM
         8cOnfEr31HEIn1wGh5tg5IKreZ+qvPWLQPHwecM+O2S3ODbY05xFgyuUScM7OWRdXuF2
         ow6g==
X-Gm-Message-State: AOAM531SsYb6OqPnOKPlUY4vkVFLj6FDNtPu175FImhqcKb9sPCZr4c/
	npTYDvzirzOBjLU0Vg25torMn745cpcvsA==
X-Google-Smtp-Source: ABdhPJyadVnplt4O5aa7bY9rFjhdnaGK3gm7rGhto6rxxzAr0A6rPQsb1Y6kF9tEP5PRhIfcBMixMg==
X-Received: by 2002:a17:903:1208:b0:13a:8c8:8a33 with SMTP id l8-20020a170903120800b0013a08c88a33mr316093plh.89.1632338537779;
        Wed, 22 Sep 2021 12:22:17 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::728f])
        by smtp.gmail.com with ESMTPSA id y13sm3083119pjc.50.2021.09.22.12.22.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 12:22:17 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 03/39] portaudio-v19: Inherit pkgconfig
Date: Wed, 22 Sep 2021 12:21:37 -0700
Message-Id: <20210922192213.3062719-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210922192213.3062719-1-raj.khem@gmail.com>
References: <20210922192213.3062719-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/portaudio/portaudio-v19_19.7.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/portaudio/portaudio-v19_19.7.0.bb b/meta-oe/recipes-support/portaudio/portaudio-v19_19.7.0.bb
index c0b32e725d..ac360659ae 100644
--- a/meta-oe/recipes-support/portaudio/portaudio-v19_19.7.0.bb
+++ b/meta-oe/recipes-support/portaudio/portaudio-v19_19.7.0.bb
@@ -13,7 +13,7 @@ SRC_URI = " \
 SRCREV = "147dd722548358763a8b649b3e4b41dfffbcfbb6"
 S = "${WORKDIR}/git"
 
-inherit cmake
+inherit cmake pkgconfig
 
 PACKAGECONFIG ??= "alsa jack"
 PACKAGECONFIG[alsa] = ",,alsa-lib"
-- 
2.33.0

