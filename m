Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web09.12807.1611774370205355943
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Jan 2021 11:06:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=LhLfQIwC;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id p15so1817822pjv.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 27 Jan 2021 11:06:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4MVItmX2j/0LV1UqieUwjbPbu7wPT1MZoVnyfzvnStE=;
        b=LhLfQIwCiwYUsq04od5JpTDGRYidPKUjKom+8h0QtdYqCni3C4dxIgWgF6uY5AmWP8
         yAe8VUx09sNzsWnPsRF4YED9UrIMxRAwM2eYFaRzfCb7FFiFwzoITw/Z4WYbQ4/HC3B+
         1KO12JsxIfTI1iEeVZDVys1EUCqJtcaJtAeUmOkVA5TGWbswUFX7uPbCyghbXcN8sleG
         tNJxj8FhqezGtsuVmtWUkqLhqrQU1Tu8Ok8kWNcANnvKsTP8VcSvrzG77O5K8biDTYkP
         rCG5xSNH5HezC9vSu6/XKNlG9ZvKN9H2jRuEbdsAN25yugc0uyEIaGedUbpUCx62lLLu
         wTpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4MVItmX2j/0LV1UqieUwjbPbu7wPT1MZoVnyfzvnStE=;
        b=P2GNtYXzCmMEvbwv7BBWckKvYWbMEH9/ww2LfXyQxZ5BlRFUIOCe+/2aDe4vpuAqMq
         eifYaP0nuGREV83ZCGsTz9UOIWl2JshTpkrHKmoWPzwur0LqGm8ou7yiwWN2KfreD5QF
         6pJrVClqHi752m+T1IxHaODxGQQvVBR+9n1Id0fgMYme9oT5zUasvuT/QAa7g5MdU0EI
         liUv1praOPgfaf8fnpO1KR8kLnx64tCbJX/i4QIO/7M4akzznJxAwui5SM0KkdpDe61+
         hBi3bRs2A7HB6DYR7yThl2ExUYsMbt/kDyylVvDtdpm2JgEkJCE74mzxshE0ndAhNWS6
         AdAg==
X-Gm-Message-State: AOAM53032mJEKjfE6UjxIE6x09cSQbslE2oWq/32gPqYKLry8g1N3tix
	faVoF5eh86lWh0P4gvEV7qg6hODoKQ+ZeA==
X-Google-Smtp-Source: ABdhPJxG/vckHeZu/Lp54UffcgQW1NQnPwDe6DLNTQqqgYmVEi/5QrF5c3cIV9STzQFOqrnd/MVwuw==
X-Received: by 2002:a17:90b:490c:: with SMTP id kr12mr7162179pjb.227.1611774369552;
        Wed, 27 Jan 2021 11:06:09 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::9296])
        by smtp.gmail.com with ESMTPSA id p64sm3060739pfb.201.2021.01.27.11.06.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Jan 2021 11:06:08 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] dfu-util-native: Adjust Inherit order
Date: Wed, 27 Jan 2021 11:06:07 -0800
Message-Id: <20210127190607.344240-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes
dfu-util-native_0.10.bb: QA Issue: dfu-util-native: native/nativesdk class is not inherited last, this can result in unexpected behaviour.  [native-last]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/dfu-util/dfu-util-native_0.10.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/dfu-util/dfu-util-native_0.10.bb b/meta-oe/recipes-support/dfu-util/dfu-util-native_0.10.bb
index 4305e3b408..4641b0181a 100644
--- a/meta-oe/recipes-support/dfu-util/dfu-util-native_0.10.bb
+++ b/meta-oe/recipes-support/dfu-util/dfu-util-native_0.10.bb
@@ -1,6 +1,6 @@
 require dfu-util_${PV}.bb
 
-inherit native deploy
+inherit deploy native
 
 DEPENDS = "libusb1-native"
 
-- 
2.30.0

