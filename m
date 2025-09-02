Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0192BCA0FFE
	for <webhook@archiver.kernel.org>; Tue,  2 Sep 2025 07:50:47 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web11.71770.1756799445279331867
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Sep 2025 00:50:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=krCtbQMH;
 spf=pass (domain: konsulko.com, ip: 209.85.218.53, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b0428b537e5so290674466b.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 02 Sep 2025 00:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1756799443; x=1757404243; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=czjoTsGEzsu2lRXyEPjqlZBYHIAdZY1bfiBucJMfLmY=;
        b=krCtbQMH/0wh5OZLDWr+k9hsEjC3qIgJzIuHZn8dJa+YowSVpLCGdq3A43AoLWGkv8
         I4wjiG++NfISKBF42Mukx7HV7Azn+n6QIpISkgUNtoBjSjQAwC3jNp1VrKhCALVZrAXI
         AnwEq7tfbIhYSOyuAlTz3bDxEboOZkr6uiyJc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756799443; x=1757404243;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=czjoTsGEzsu2lRXyEPjqlZBYHIAdZY1bfiBucJMfLmY=;
        b=iMgqEHV4pnbo+O3HKxMmlforxr4049aaYuLELJXni8qYcmNvuUbUmQoPftS9isXkX5
         VWOv8GEQexQa+ivHyQAPKSCff3pChVAqiTQwgSmYDdMvoWkESu8m2AAGXs96WVP0LiyB
         cKPYX8IJogzANXtx0M5F7cA0+SCBLMu8kojUv426wempDTk0vgdzbSVu0H04ONT71/6n
         SoIJUuB+sMYlHfpBjTYHg4wCDJhK6i+I0mgGxvbaE/buF1q0aivB4socOO8z/6BK0j8r
         Ytqrl/kgzKsNCnFxUXyVIuFNe4ppGVq4n3bHMz2lbsx5R0dZwNGt7ZtBLLa6FBfMjZ5S
         lgMA==
X-Gm-Message-State: AOJu0Yx/HtWcbzjcUG/PI2dD/futoHrvnXxBdQosIkdUy4+FSD78DRzV
	7W0IPFVqvLfg3yF49GwTqz2hTqbcMGcX9bUgw0bDRUy4I33ZJZiYT9L0i3npGvuUpKwul8VrPt7
	GIMjS
X-Gm-Gg: ASbGncvV0oHSVysRwND/5881/rlTt/Q8SD04rKskvMoVaEvGZJKOBO8umj7pltE0SRt
	EY+n/VPj4gPwTX+fto2xaFA9/7ZAkdArD6G/1hJfUZTgFxgULNWgHmMT8j+VbnzBP5OgzIjadgh
	0jUpxwjMEuDmY+pWtcG3M2toIYUmadfHYEDe60zVn8RNWT6u3gjjqeaGIWxhjnSD51buKg0rqf5
	7gU6CoKxXq0XRr3SArzW8RURCJBWLEndFLbmEN64urwAc4shQmrwHL2kcWvJyyaj2t18mMH/QDv
	0sYFnuMZ/2RF8GN2pRfHcL6HyZNRGM2Mtljq/RtEbDhNwXmsCfIsgxOtJhGtHCGuCI0Q3KosIfo
	djb6Pq2eGL8A6CYVr+l1LWEKF2Akrvvtr4QiR
X-Google-Smtp-Source: AGHT+IFCfPJQo0N3zNVpiMXlpHNs0ktsweQoVl09WZrQsTge+cLw1I+pXelMIXhJt0oqTcF8lEo31A==
X-Received: by 2002:a17:907:1c0f:b0:afe:9880:8a9b with SMTP id a640c23a62f3a-b01d8a30e2bmr1041408966b.2.1756799442981;
        Tue, 02 Sep 2025 00:50:42 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b0416842ffasm599959466b.38.2025.09.02.00.50.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 00:50:42 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-oe][PATCH] ssd1306: Update to newer version
Date: Tue,  2 Sep 2025 10:50:34 +0300
Message-ID: <20250902075034.2494084-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Sep 2025 07:50:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119176

Update to the latest version of the source code in GitHub:

- Use snprintf to replace strncpy without null string at last

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 meta-oe/recipes-devtools/ssd1306/ssd1306_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/ssd1306/ssd1306_git.bb b/meta-oe/recipes-devtools/ssd1306/ssd1306_git.bb
index 7824ed1a68..8a8f5d8d25 100644
--- a/meta-oe/recipes-devtools/ssd1306/ssd1306_git.bb
+++ b/meta-oe/recipes-devtools/ssd1306/ssd1306_git.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=7b694e603a996c3bfdc6093ed1f70c8f"
 SRC_URI = " \
     git://github.com/armlabs/ssd1306_linux.git;protocol=https;branch=master \
 "
-SRCREV = "34b42992a43fda69c6ba2557b718601cafe16251"
+SRCREV = "19128ed4b6108408fea05b9d0551236b6d638dbc"
 
 
 # coreutils provides fmt which is used in the Makefile
-- 
2.47.2


