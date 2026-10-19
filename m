Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1771.1792434893985416959
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Oct 2026 11:34:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=O5lWC5AD;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3ac9f49b984so1600986a91.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Oct 2026 11:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792434893; x=1793039693; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fvhPDqS5sPT2cWB3ValAlfCGYO+uarNt9OZa4oxr64A=;
        b=O5lWC5ADJlqJZ9VrOOAoZiHNeO0ZRaeAcMx6SRLtZfu3wqkqpDe/zaB65edKtm2aRA
         GCztGxqPZ0gL2Ob++eh1GgsL3EQ3KVtZZvGB8Ox3JNIrnX36aRyKFIwkfTHDVeNW75/p
         e5+ZfljsVmt7WOSlURxDmTTvPwN+X0P6kXYmvPDSSOoQKfO5YsTde2HnKaeeR5dQWXVN
         ynBgG6I1AbgjyedaBV5JnVB2E6n8RjkmB0RCWo+8QPsVpGWLV3Wj1k/KFlK5xQs+sd4P
         UyXyveGnq4TH137DTsAQsBG9C0vUje6vT+t93kU8kwPv413V7shJUdg38oSNZBMY70V/
         Adqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792434893; x=1793039693;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fvhPDqS5sPT2cWB3ValAlfCGYO+uarNt9OZa4oxr64A=;
        b=gbt2JDEwxY1sB5/JI0vSwWq/esxS0BK6I9MIDopGJBCZ0zxwnu/5s74eJdwS9/yjGp
         SYzW5AGxHd1fqY+Tx4/3++U5mmFDXyBCFLNJAA4MMTFoiQ1PzVWYyzqpFE2qBxtccecA
         WVj+DDqRiitZ+wYogAXvOZDdpR8b8ITnx3VNBWc8vr1ACZDKbgw4PYcxIuOaZPLDSgvj
         pZJm6HbeId07z/WOq8I0OyeXOzkwSQXvPQrZFZrDhw4HpvLb6Ke23Pdk1LjSq5WNqdh8
         rgSRQwzD9/8ufSeyUvQc/Bh5WPDFXGBLUF9xgiAVn/7hZ7sZA2BXyNO40d07kwZlAY0r
         cfxw==
X-Gm-Message-State: AFq9FYJP5SkDfyu5C0TB5EHiU2E9YUutomLlrebN5osGdRlZO/3I0aXz
	6sB9ht/4S69RMqS21Ig59NjUg/I8ICg611n2sUY/yvWSn2rei1P1K0Bj5E5M1A==
X-Gm-Gg: AYBFou31FmO9/ZszgcLSi/fuESYzrnsLC/L0Teo1p5ZtYpDgpkM4hMeuKh8g+pcUTux
	Kyg6S5bIz3kzqK0YbVPFUjK2Z+CB3JjlJIrAgXUMJNwT5xTePzUHHbIpT/WRm4Z+tbOLxh/emPE
	Vfhhj7QtT6ldfz8HdTwAeDAMXbA8eET5RsvxUcSBd0Y+bWz9d59Im/JRtYhST7hGlyQGnJOraBf
	+j1kIRrzWf2HySSCK/EuCmGMSjty+qcV9YaiLrJMG25zu+xWwWp2354rgeTK79cCqQeO9V5/rnI
	zUGyfsY1mNPrQGuAvCK6ZvOZIzg1W/k9EyUGm800y3Kx8w7tdsPVRpMs38Id7xJXyEHxaNwJsE/
	H8B7qWAoTGJOKkXlHxFvMTvEg3jyq1y+dDLzBUcOU+TH7SuJMboYXZQJGjYb2d2JHaPDAkFUG//
	wW7vnKSikRbxjby2H2mrn/46LQs6F1cXhxsyqzOTafNA7XM/JwcHj702ddn5GncvFXj+SGHud/4
	kYhLa6WE6TvC3hmZnMQ5sroNX/G6xq41lO9bKc=
X-Received: by 2002:a17:90b:264a:b0:3ac:84b8:c0ce with SMTP id 98e67ed59e1d1-3acbb8f1039mr8279931a91.36.1792434893224;
        Mon, 19 Oct 2026 11:34:53 -0700 (PDT)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd6549fb556sm4632865a12.22.2026.10.19.11.34.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 11:34:52 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-webserver][PATCH 16/20] swagger-ui: upgrade 5.33.2 -> 5.33.3
Date: Tue, 20 Oct 2026 07:34:02 +1300
Message-ID: <20261019183407.1037972-16-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261019183407.1037972-1-ankur.tyagi85@gmail.com>
References: <20261019183407.1037972-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 19 Oct 2026 18:34:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131142
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/swagger-api/swagger-ui/releases/tag/v5.33.3

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../swagger-ui/{swagger-ui_5.33.2.bb => swagger-ui_5.33.3.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-webserver/recipes-devtools/swagger-ui/{swagger-ui_5.33.2.bb => swagger-ui_5.33.3.bb} (94%)

diff --git a/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.33.2.bb b/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.33.3.bb
similarity index 94%
rename from meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.33.2.bb
rename to meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.33.3.bb
index aeee9e4da6..6f69070033 100644
--- a/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.33.2.bb
+++ b/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.33.3.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRC_URI = "git://github.com/swagger-api/swagger-ui;branch=main;protocol=https;tag=v${PV}"
 
-SRCREV = "e89a91f13cdee432d97ca9d3d1ac1969ff797036"
+SRCREV = "38ca10e1867a66525751590d8d51011973107ad1"
 
 CVE_STATUS[CVE-2016-1000229] = "fixed-version: fixed since 2.2.1"
 
