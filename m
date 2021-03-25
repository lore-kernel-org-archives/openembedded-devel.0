Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web11.4537.1616655963979970189
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Mar 2021 00:06:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=X1Jdnjn4;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id h3so1045725pfr.12
        for <openembedded-devel@lists.openembedded.org>; Thu, 25 Mar 2021 00:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9x1JSUsJrFLAD5K9bgbgoD4KPLdTRGGzi4jR5XSYvv4=;
        b=X1Jdnjn4zwOvOU7Kl8h/8oFHOwExh9u1eWZYe15PwAGR0qR9m8Pn8BpUxD/HcbSCN3
         jEVge/SkvsbCzVrKpanEziAa5YByMJ9rN5f+i/W0bXYWerg8mQ1UgPl8GCLcSSirwiaZ
         uuWDhoyMmA6k/KSmVPxYNz5zpNfDVlB8Dl7qxZrLPgzXcbikAiaPGdZA5VbaXUuSPtb0
         QmqVbLCWF/BbHchJOwFVOVqR6EUVofcT6CLwe3qquFkkku2KW7ply0A7d+fM2Kh5lWtc
         zNKaaCwv9H1OxC41Tpmd86mQaCFhfq2jZIIdP+gMGlBGmiERkeGwrql4mJMUBgO5jkGg
         kXNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9x1JSUsJrFLAD5K9bgbgoD4KPLdTRGGzi4jR5XSYvv4=;
        b=buKZNLNfHnAVlMgdLxFDra7zq/X9828zdAD7gFxBL2k3y6TWviQu1cXovgaZv04nJ/
         yl8Uqs+ZazsVomlYB4liLLCgrymQCjYfrc3J3p7gpDS8K+OGTlmA4lSKHfQRoEWWUux9
         pfQc1IIGLIG1YrZ8OfJ11+HXWgefRpV1FlWg4DKlWaSvpgXF8t0ednYV8IW6R+KHyyDv
         DavMYiES9lrcccRODZ9PikdAQKk+7K8rZRBDzDUDrqFo/sarWBwH8e2N/SpVADBiHPqM
         PWMyTXZbQSGvEGyutu7F8y1xdliB0Qhixg05hXLxfablxxl+V5/9LwuHM/s1wldC7nvF
         sf3w==
X-Gm-Message-State: AOAM532xTedsf7A2z+ST8F7wGLSznjlYF22tDIokDvdHx2FStvK1JqrS
	5xb2xquPUGqakH5s2kPsbmfaGyWJWw+G+w==
X-Google-Smtp-Source: ABdhPJwltlemedKTlOrm5xUIVtiRn/QkVpXRJ1Iy/GM0nATheCs7I/ee/1kaoKJn/AUTAS2HID001g==
X-Received: by 2002:a17:902:d346:b029:e4:c35b:dc0a with SMTP id l6-20020a170902d346b02900e4c35bdc0amr7912082plk.75.1616655963040;
        Thu, 25 Mar 2021 00:06:03 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::4578])
        by smtp.gmail.com with ESMTPSA id g72sm4708950pfb.189.2021.03.25.00.06.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Mar 2021 00:06:02 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Luca Boccassi <luca.boccassi@microsoft.com>
Subject: [PATCH] cryptsetup: DEPEND on renamed util-linux-libuuid
Date: Thu, 25 Mar 2021 00:06:00 -0700
Message-Id: <20210325070600.1335182-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

OE-core recipe is called util-linux-libuuid now

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Luca Boccassi <luca.boccassi@microsoft.com>
---
 meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.3.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.3.5.bb b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.3.5.bb
index 5faaada4b7..0da9a26e83 100644
--- a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.3.5.bb
+++ b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.3.5.bb
@@ -13,7 +13,7 @@ DEPENDS = " \
     json-c \
     libdevmapper \
     popt \
-    util-linux-uuid \
+    util-linux-libuuid \
 "
 
 RDEPENDS_${PN} = " \
-- 
2.31.0

