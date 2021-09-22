Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web12.958.1632338536933194863
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Sep 2021 12:22:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=PEeIdW10;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id k17so3572187pff.8
        for <openembedded-devel@lists.openembedded.org>; Wed, 22 Sep 2021 12:22:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7R1TdzAxghQZhWxDvmTmx/Egq/1swzsIFmXcvz4v3TU=;
        b=PEeIdW10PqxRvfzQrGDzQIWzvJ8uzaDefv0KfHAa6ljpPN3Iuj+juzR5DMIP0Oo39Q
         3lFlQ4TP+PrQNZyQGfBVnSROVKhScl1bT/HWrD60BJJ5x+GjDLwiyR86co0Dx7tREqiJ
         z/mhHn2g4GPncRYs+x3U2m4s4GKQh2pKohUdSl/6bAi+3VaxC1EhmenNzGSk146KlrdZ
         9q7Mc+VpN7QgGpWIBsLAGXZXoJYV4PHYVPYh7zIaxJH22eO08Mi87U/ZaOU8ScOS2WEC
         /g3zedGGXP/fFBp86SkSUnc1vf9Csao7PAit0kAng0jh7PLWV9/XSQajzbhfF2GV0gOF
         q54Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7R1TdzAxghQZhWxDvmTmx/Egq/1swzsIFmXcvz4v3TU=;
        b=UEEABWa+GM0XbC03n34pz3nPZqQrbMrfAFmS7ggjQkJgbKZX5o80Fi4G9hoes2itix
         ZtG2ROu/VhiKJXSwzaP0Bl9mVDHKBnREfUt6e1BWqtq9dM2oGrSE8pjp5N5UArdRU4q9
         PoKgKQuFQzKDlEjivZVCbDaU0T4eqI1CVNMY/zL3StZOGOP8sm+xSsUdLuPkOKlI3NmC
         QGW5GlnWd0yWCP0lksG4CV9SxlU6HTydAp4pUkH//YaIlrMpcm3MsYMPqa7xJVl8KbPX
         E1B4ltD70zKPRyzD7SKqe+KaMX8aYACm7PUiWbefaeKs+soljv90kZarajPSm6+TvSvp
         /DhQ==
X-Gm-Message-State: AOAM530wu/V7IyEPDVdJ6I39O9+QD67/Pjl1A1/JEE6Tf7IGPQAPDVkC
	sjWGi0Hq1h+EvJpHMmeXjw0ijhRwWosNxg==
X-Google-Smtp-Source: ABdhPJyBvA+vtZykcPSflv2rwV19seOF4HJdbx3Jij+ObOGMQj2k9y0WocCMDWOuJpaNJj6q88sOvg==
X-Received: by 2002:a63:2cce:: with SMTP id s197mr463549pgs.45.1632338536168;
        Wed, 22 Sep 2021 12:22:16 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::728f])
        by smtp.gmail.com with ESMTPSA id y13sm3083119pjc.50.2021.09.22.12.22.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 12:22:15 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 01/39] libgnt: Inherit pkgconfig
Date: Wed, 22 Sep 2021 12:21:35 -0700
Message-Id: <20210922192213.3062719-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-support/libtevent/libtevent_0.10.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/libtevent/libtevent_0.10.2.bb b/meta-networking/recipes-support/libtevent/libtevent_0.10.2.bb
index fa5b4ade8c..5d7e1a0d60 100644
--- a/meta-networking/recipes-support/libtevent/libtevent_0.10.2.bb
+++ b/meta-networking/recipes-support/libtevent/libtevent_0.10.2.bb
@@ -15,7 +15,7 @@ LIC_FILES_CHKSUM = "file://tevent.h;endline=26;md5=4e458d658cb25e21efc16f720e78b
 SRC_URI[md5sum] = "105c7a4dbb96f1751eb27dfd05e7fa84"
 SRC_URI[sha256sum] = "f8427822e5b2878fb8b28d6f50d96848734f3f3130612fb574fdd2d2148a6696"
 
-inherit waf-samba
+inherit pkgconfig waf-samba
 
 PACKAGECONFIG ??= "\
     ${@bb.utils.filter('DISTRO_FEATURES', 'acl', d)} \
-- 
2.33.0

