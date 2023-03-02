Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CDF6C7EE2F
	for <webhook@archiver.kernel.org>; Thu,  2 Mar 2023 15:45:00 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.19435.1677771890688680012
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 02 Mar 2023 07:44:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20210112.gappssmtp.com header.s=20210112 header.b=SoXUI93y;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.128.49, mailfrom: brgl@bgdev.pl)
Received: by mail-wm1-f49.google.com with SMTP id k37so11023729wms.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 02 Mar 2023 07:44:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112; t=1677771889;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JEb6y/Wt/RLbXie9UYVft049WxiZU1JfI7NdE5siS/Y=;
        b=SoXUI93yPv+gV0vr7rmabJU0taYCIVG/WNr9DRayrzz7W3JjJdjY3GomynFXNdB9Lx
         05lLC3nlT8A3NcncHip+fvjgh2zOcxkMTVxJKsYr+vMWRtUW+1JBtNxkW5GCS8nDrDDf
         0tyzGZb3HpAq9HclYR7sFFidkp0C8vRygdHFaht7AlQYQF4x4Dz/GSWdsmkyTlWOG0E6
         WXbXlRY3eRekZ0tzPpRP87qR6Z50KMnvYSrsi5O3S2uEYuvI3w3Fg6zWSY+ZJ2Bw8Z43
         rkkdpkIl/b7ass+xxqTRO+xe7nnqUpeyBl0r4iSdOMJWW/hA3b4iZ5MHD/9vRst8ZBup
         u2Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677771889;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JEb6y/Wt/RLbXie9UYVft049WxiZU1JfI7NdE5siS/Y=;
        b=ZKvz6MHZ5QgL88myVsvAKvsYUysl/TAjwUxqRvOiqZ/60vkY2QnhS7TMYU0qQ7rnN2
         b9/YfAki2TlnJNj0iFdxGs3Ug4ZtBUhniG2VmARY0G1MX7m0jO8I68ASTeryjtfSdEx7
         DGpaZRpSC219cx0TgVoyzUUs0GObJUiIUHJgaaOxyQQee+iv7E9kTNIGn0MhNQqBcd9A
         kPybQV2+s8m3sRvlGQfEODSeJyhC65vpYTMjDghm+zn9whGEnd3DmhI9/90zQzBsSLSo
         NKf1gVJ72GmJ9qPZJRaQZtHeHxMXQr+XvT4edo8n/51khRZHj97HVJ8pjpa9BPDXREoE
         V/+w==
X-Gm-Message-State: AO0yUKXvD8xfbsrgf0rFUHfVHuwASiSTPXDyH57z2yvhBWM5gKz18ff1
	UNZsXGe15XDXwepFzrH/GGgQbg==
X-Google-Smtp-Source: AK7set9Kge4oHCi1BaZgJWFaeoCpbRD62iowTFPyTQOixSsi9IDhl4SiL8BgV9XSVtt6BAvinjkIWg==
X-Received: by 2002:a05:600c:3c8a:b0:3ea:c654:acf1 with SMTP id bg10-20020a05600c3c8a00b003eac654acf1mr8207169wmb.3.1677771888975;
        Thu, 02 Mar 2023 07:44:48 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:10a0:b7b3:4dd6:973c])
        by smtp.gmail.com with ESMTPSA id bg37-20020a05600c3ca500b003dc4fd6e624sm3784719wmb.19.2023.03.02.07.44.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Mar 2023 07:44:48 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-oe][PATCH 1/2] libgpiod: update to v2.0
Date: Thu,  2 Mar 2023 16:44:42 +0100
Message-Id: <20230302154443.349083-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230302154443.349083-1-brgl@bgdev.pl>
References: <20230302154443.349083-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Mar 2023 15:45:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101336

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The final v2.0 release is out so update the recipe.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../libgpiod/{libgpiod-2.0-rc3 => libgpiod-2.0}/run-ptest       | 0
 .../libgpiod/{libgpiod_2.0-rc3.bb => libgpiod_2.0.bb}           | 2 +-
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/libgpiod/{libgpiod-2.0-rc3 => libgpiod-2.0}/run-ptest (100%)
 rename meta-oe/recipes-support/libgpiod/{libgpiod_2.0-rc3.bb => libgpiod_2.0.bb} (90%)

diff --git a/meta-oe/recipes-support/libgpiod/libgpiod-2.0-rc3/run-ptest b/meta-oe/recipes-support/libgpiod/libgpiod-2.0/run-ptest
similarity index 100%
rename from meta-oe/recipes-support/libgpiod/libgpiod-2.0-rc3/run-ptest
rename to meta-oe/recipes-support/libgpiod/libgpiod-2.0/run-ptest
diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_2.0-rc3.bb b/meta-oe/recipes-support/libgpiod/libgpiod_2.0.bb
similarity index 90%
rename from meta-oe/recipes-support/libgpiod/libgpiod_2.0-rc3.bb
rename to meta-oe/recipes-support/libgpiod/libgpiod_2.0.bb
index e56459b96..becc9adb2 100644
--- a/meta-oe/recipes-support/libgpiod/libgpiod_2.0-rc3.bb
+++ b/meta-oe/recipes-support/libgpiod/libgpiod_2.0.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = " \
     file://LICENSES/CC-BY-SA-4.0.txt;md5=fba3b94d88bfb9b81369b869a1e9a20f \
 "
 
-SRC_URI[sha256sum] = "1d1756d465525deb668526571dc6ed7e08f7b8e7745b10fc028208a22fb7adf8"
+SRC_URI[sha256sum] = "f74cbf82038b3cb98ebeb25bce55ee2553be28194002d2a9889b9268cce2dd07"
 
 S = "${WORKDIR}/libgpiod-2.0"
 
-- 
2.37.2


