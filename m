Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com [209.85.216.67])
 by mx.groups.io with SMTP id smtpd.web11.797.1588829757656773517
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 May 2020 22:35:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=NiGC3bLk;
 spf=pass (domain: gmail.com, ip: 209.85.216.67, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f67.google.com with SMTP id y6so2142217pjc.4
        for <openembedded-devel@lists.openembedded.org>; Wed, 06 May 2020 22:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=T74TDTiMTO9SgrS64XLhtA2h63DBlF89NjmEsA1LuDA=;
        b=NiGC3bLkC2yd667oURSLjXDPjrkUu8vciyPoo6NkMuzejxZMzKNww6WKAQCoW6mAlV
         yIOKrinx0mBxo4ldJaA+RmEgxDrFUogvRXYzAEnlqO+TbeGLeque/JRNjGOeW3izQ2Ly
         XMfgJy58J4Fz562ZO8lEB2A6X4DglIaZEmfDdepCNj9le8zjZUITTnDLEFrPlE2Gjv42
         MotRqtzf80YHZDO7x96Dkd7DBu0x4mAT+2r5PVPdvV14/n9GtQ3R/Meujl5ifZBC5MUv
         zFsNscW8LunlGd4PBPObPZLk14wiPkYEK2NKgFf88Roow90AE9QEb0Bt0GRIBYjzjyIb
         FFyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=T74TDTiMTO9SgrS64XLhtA2h63DBlF89NjmEsA1LuDA=;
        b=UsPMEIilDvaZALGzYLgsqLYHWJzezgwsfvFH5bAkUJvjon5YK/pKUczNJkunKeEJDO
         f9UE8lzGdVXLc16YyCZO/xjmor4F5WVRUzH/P9YCGeHM79KM5sLjaxG891CFZJiaGtia
         t+YeRao11O0vrWUxdbXa9upb2MFzInnsZws10fbKLUlQYx/Iz8Bngt6DjcNfGrQh35Nu
         uSe86yTCqcG76ALoQ+yLX3gd/DiClE96n3+aowEtUuq8TyRCAnkH/7Yrn7k1Uu3eGOxo
         cuzdQvn7yF52osODfZXp7xyiAz19ZjiTyJeXM0NX3Vw1Va9r3K0zuKdw0QzoOGwZgiAE
         Uy7g==
X-Gm-Message-State: AGi0PuamoCgrcJUXPd8KpxpOMD/IpJwpX9BdNKDoL71XUhpsz2T1xuYU
	HuSWuXpBdOSaYfRNXrwf9E1/v029CXY=
X-Google-Smtp-Source: APiQypJt+nd6YolquDPXVcQnU+OQHx1YJb/5bQWRSr2jfYtxBs+wX3Kf0ozCSULemf4gYuIr1+OywQ==
X-Received: by 2002:a17:90a:a2d:: with SMTP id o42mr13762659pjo.164.1588829756547;
        Wed, 06 May 2020 22:35:56 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::d90d])
        by smtp.gmail.com with ESMTPSA id v9sm6171722pju.3.2020.05.06.22.35.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2020 22:35:56 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/2] xf86-input-void: Drop INC_PR
Date: Wed,  6 May 2020 22:35:52 -0700
Message-Id: <20200507053553.1540194-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It includes include files from OE-core where this is dropped now

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-graphics/xorg-driver/xf86-input-void_1.4.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/xorg-driver/xf86-input-void_1.4.1.bb b/meta-oe/recipes-graphics/xorg-driver/xf86-input-void_1.4.1.bb
index ca0b486346..88fb4b99a1 100644
--- a/meta-oe/recipes-graphics/xorg-driver/xf86-input-void_1.4.1.bb
+++ b/meta-oe/recipes-graphics/xorg-driver/xf86-input-void_1.4.1.bb
@@ -1,6 +1,6 @@
 require recipes-graphics/xorg-driver/xorg-driver-input.inc
 SUMMARY = "X.Org X server -- void input driver"
-PR = "${INC_PR}.0"
+PR = "r22"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=4be6a915bfbf111cd88706fc6a6f141b"
 
-- 
2.26.2

