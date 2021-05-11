Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.6906.1620698861837876821
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 May 2021 19:07:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jNIkzXxH;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 4-20020a05600c26c4b0290146e1feccd8so356812wmv.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 10 May 2021 19:07:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=06f+u2Al7NPYvMklT0he/1KiVUfV8Kw+IdoQ+hfcb7g=;
        b=jNIkzXxHvuFJSD4t+6l5/GzpMwTgWLklED/DCOzBpi6IWF72ny94LbzxvS8Cd0UKh8
         Q3XXoOc30lVbdA0yWkZn/jfA6gpbEFpKgyAZaKMUV9dPHG2W9rVI107BQjRIAzRfb1Ra
         q7P6e9cXcSAxFY9yLVefB4AjkcUMD8KPLIC5iqk2XQjH6agwgjLhVEVfTMArC9uXvamV
         tdEFs1mxnSi/C2pDJhi9UPcgcJwucNHXYTv9n74RoQYbe+hWNx704V0y0NcU8cl8FN1n
         seM8Ac4LWkIPop/FwqGWXQjpCL5vWbCXXGAxzHESQMrlzx9xbq3LkZ2cbEYkms/exr+8
         0thg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=06f+u2Al7NPYvMklT0he/1KiVUfV8Kw+IdoQ+hfcb7g=;
        b=DJsViwjRadXH2dz4rejOsss8xCn6jM6D/hrdMUv3zelm6zYufSLS98CX9VSE/FrJz0
         3gA3ApZVCw+1rDkeb8p9ay0EXVc2Txthho83vOhr8R+IqrcJ9Pc6tzxqEYZFOvyv/JQN
         tn7+InH//REXTSwjrTu/1hA1H2ExpK/iyKPiYtGjJ9bTz9fvTO1Ef/WQDD89/be2+LzY
         t4dedD+0c+weJPptJUPeoqLAFB569YBRGaTmKWbANkcyH5WggNVYirc7+fn23PWP4Bul
         wGkr+h1AWN7y0CVcUxMlXjQbs7+ATYEPVOt2a41yMa5PLgC6DVfdxm3SEPUelN/+9Pmp
         LMCQ==
X-Gm-Message-State: AOAM533qkEJZEzzjKB8JqBTVvUnuHaV4Fkm+roMwhtR2ZBOUk/ChC8uI
	mVQSCkw7GQ014GhqcWm6gmE5UWuV2s0=
X-Google-Smtp-Source: ABdhPJz0lQPrd49Y7W190m44nYAKSoVtMNAUj7PlurQO/227AMFV+7hv9RWrhGwYjHxsPVYMYlbtYg==
X-Received: by 2002:a1c:2786:: with SMTP id n128mr2448263wmn.82.1620698860533;
        Mon, 10 May 2021 19:07:40 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from thanks-buchmuellers.speedport.ip (p200300f07f4fac346ac282ef7d435921.dip0.t-ipconnect.de. [2003:f0:7f4f:ac34:6ac2:82ef:7d43:5921])
        by smtp.gmail.com with ESMTPSA id n12sm20145075wmq.29.2021.05.10.19.07.39
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 May 2021 19:07:40 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 6/7] gparted: upgrade 1.2.0 -> 1.3.0
Date: Tue, 11 May 2021 04:07:24 +0200
Message-Id: <20210511020725.346160-6-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210511020725.346160-1-schnitzeltony@gmail.com>
References: <20210511020725.346160-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The GParted 1.3.0 release includes some new features in addition to bug
fixes, and language translation updates.

Key changes include:
     - Support resizing open LUKS2 encryption mappings
     - Improve exFAT support such as read FS usage and set UUID
     - Fix crash in Create New Partition dialog when changing type
     - Avoid GParted hanging when non-named device is hung

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../gparted/{gparted_1.2.0.bb => gparted_1.3.0.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-extended/gparted/{gparted_1.2.0.bb => gparted_1.3.0.bb} (91%)

diff --git a/meta-gnome/recipes-extended/gparted/gparted_1.2.0.bb b/meta-gnome/recipes-extended/gparted/gparted_1.3.0.bb
similarity index 91%
rename from meta-gnome/recipes-extended/gparted/gparted_1.2.0.bb
rename to meta-gnome/recipes-extended/gparted/gparted_1.3.0.bb
index d0a499e6e..4eb383bbf 100644
--- a/meta-gnome/recipes-extended/gparted/gparted_1.2.0.bb
+++ b/meta-gnome/recipes-extended/gparted/gparted_1.3.0.bb
@@ -11,7 +11,7 @@ SRC_URI = " \
     ${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}/${BPN}-${PV}/${BPN}-${PV}.tar.gz \
     file://0001-Install-polkit-action-unconditionally-executable-pke.patch \
 "
-SRC_URI[sha256sum] = "6c90715d254d7a7ec0208b29007b64160dd9fb7df4c4aa7f8ec2c9d23114c719"
+SRC_URI[sha256sum] = "8dc180245dd9ea45e6e2f4bc69512f187e08be7f799c98a825a0b04c161cbd2a"
 
 DEPENDS += " \
     glib-2.0-native \
-- 
2.30.2

