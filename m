Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com [209.85.214.193])
 by mx.groups.io with SMTP id smtpd.web11.15345.1599072274800950503
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Sep 2020 11:44:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=a4LUjuwE;
 spf=pass (domain: gmail.com, ip: 209.85.214.193, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f193.google.com with SMTP id c15so177197plq.4
        for <openembedded-devel@lists.openembedded.org>; Wed, 02 Sep 2020 11:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=K30X+dSQewN3WK5UwqQwbluWZ4G/S2KqroPAH9OSRfA=;
        b=a4LUjuwEXY5CWBHUMG7pcsy9FTLykwwogc73YIjMZQ3kc+j+VPHK9/YvtiLlKmYO9M
         WJy3sEJbC6ORgZvSgzs+FsdidMzlgpraskxQOpAlL54UKLxgDclSJc/4FXqbO2guKCSn
         A1cFHrwqSy1D81xTk/oJ6ePtk//QMP2A594GoXhI5mCnUyfBRb77IYCy+JB+VL0LZELG
         T0WfWsEo0/0/ocdJTWavo724VWUc+gSCqzJeJvxActv/EgyYZ9C0x7lM13I/+efh3iJX
         fjg0S0Tfc7SqceQNnL7Uzqq3N7AlFLt7Z26ZpzjJ7SFoNXJEd21jSW1y7fsaz3C3FEMX
         vkeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=K30X+dSQewN3WK5UwqQwbluWZ4G/S2KqroPAH9OSRfA=;
        b=pW0weTPjF2+4CDPWSagrsUMRR0ssyifFGtAjJOhLVtukbjmQwTSYGecXBONaR4qjOb
         YwRdq4c7DpGcKGyKXDw4PtazF7RiFjbHbLUdboHHM8F9+4hIEuQDIaV1i165+TDRcd68
         REXId5RLLz/ZbWzu5bmM+zoge5SNHagiWzStS1kTH2TPQZr08u8fzB6KuDcBIn47GQPP
         9oGoDvx4b4H9/NvQasReunTjUbTIs61x2kZzyGR6za6Hp6cpaI5qKynsYZrHx2osXiGo
         ykKGQzfDwzNcoMuWGCOJM2+7AQOZL46+VSMLY52RAmFI44UkF4EtEJgDEkRDRACH4XC5
         xchg==
X-Gm-Message-State: AOAM531feL3J0Uwo7AB6yvKkIkaMLlkK8NqEHar1i6bqKpDcV7xWk/Im
	mWnd0HwKoi1M3GAfeU2RJ1hmIXqZ9gzkWA==
X-Google-Smtp-Source: ABdhPJzMsF4/3JutLz5uJYX4lRARQXABv3Ri0W53lUFeBVpkZM0uf+RLw0vaCORBusMWftoiTjFfnQ==
X-Received: by 2002:a17:90b:384c:: with SMTP id nl12mr2256810pjb.205.1599072273953;
        Wed, 02 Sep 2020 11:44:33 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e89d])
        by smtp.gmail.com with ESMTPSA id x12sm126813pjq.43.2020.09.02.11.44.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2020 11:44:33 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 1/3] packagegroup-meta-networking: Remove dhcpcd and kea
Date: Wed,  2 Sep 2020 11:44:29 -0700
Message-Id: <20200902184431.1098556-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

They moved out from meta-networking into core

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-core/packagegroups/packagegroup-meta-networking.bb  | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-networking/recipes-core/packagegroups/packagegroup-meta-networking.bb b/meta-networking/recipes-core/packagegroups/packagegroup-meta-networking.bb
index 1034ad9786..0e668f7dd3 100644
--- a/meta-networking/recipes-core/packagegroups/packagegroup-meta-networking.bb
+++ b/meta-networking/recipes-core/packagegroups/packagegroup-meta-networking.bb
@@ -37,12 +37,10 @@ RDEPENDS_packagegroup-meta-networking-connectivity = "\
     ${@bb.utils.contains("DISTRO_FEATURES", "bluetooth x11", "blueman", "", d)} \
     cannelloni \
     civetweb \
-    dhcpcd \
     libdnet \
     dibbler-client \
     dibbler-relay \
     dibbler-server \
-    kea \
     relayd \
     lftp \
     sethdlc \
-- 
2.28.0

