Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com [209.85.208.65])
 by mx.groups.io with SMTP id smtpd.web11.10084.1603278295733567602
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Oct 2020 04:04:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=SZDQd2TU;
 spf=pass (domain: gmail.com, ip: 209.85.208.65, mailfrom: costamagna.gianfranco@gmail.com)
Received: by mail-ed1-f65.google.com with SMTP id v19so2112803edx.9
        for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2020 04:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gUfYYDEo6VaeiGDRmof5Hp4VVVE8xv8ZPjUyBO3odVg=;
        b=SZDQd2TU+TmupdgiGni/EX2jnlzPNZ1QA6RiOijViyXRM45ecOLhF51ToxPZzaGcEs
         V3FBSGREszNSsAyeDPJg81H/Pvs0QBq6l5HXAVs36WxIa6JtazZkROMRC6ssFiBbP4gP
         AEOHX10IdwwRLrFUQ8t+uUmsgnwSuaekaqZYW0atHpU68xEdLRFhbLlSCFoEtEiyTTc8
         K1/y4z77Jj34xF8+jVvVHODd9or+i2EsFKG6H2R5Xv7ORjbBaj5ygwMpEaY7nKGY9Enw
         M6hja2SLum34NXGJKLCCZS+N/Ao645V7brFx9WNchY6Ah4fItkQZNfkDI3gvgkBkMEy1
         AHFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gUfYYDEo6VaeiGDRmof5Hp4VVVE8xv8ZPjUyBO3odVg=;
        b=rVEqi0vLGNxU7Z99IGUt8cQ+BiVjcPDfwKgbGA3sxg4Jkw5+ahFz2tmzT5nXJUQj7C
         n7j3fEskszbWJonS6InNecKDD4qVkdFB+WJTlLYYzXRXD8CAHHluFudDDfWB5D0GBrbP
         F5NphUlUTJU1Bq0VO7Z7En1JK0klo0qDQSo/XqN7AHx8xkIq2aL8lH6fzmaCAlXbyLEf
         P5WKQDy9MIF80XBHGBSGVnj6ncg4ytrmIpFpLDUYTb/u8KqlZqB6pt5jTOQ9/v13KW85
         KciTIpDz7rcm/Oj43PE/kWBVfcA/Rnx9hvdV1cYUoMMkM2dq/lKNMC9yxw2hM3t6u2o3
         0rRA==
X-Gm-Message-State: AOAM532FEZ1oXj5tWezMPSHEesn2/QqK6DsBmMAEgcqmtSZgVW21BHmk
	fTnl34Px5LmktSe0c7JDI3fIcIKM0Ic=
X-Google-Smtp-Source: ABdhPJyHHasLtXxhvc583VpZwvL57/HIuSOHtK84odsA9qMseXSo1e8RkP3HBmLLduTzf5t6/huvqQ==
X-Received: by 2002:a05:6402:74f:: with SMTP id p15mr2529479edy.69.1603278293697;
        Wed, 21 Oct 2020 04:04:53 -0700 (PDT)
Return-Path: <costamagna.gianfranco@gmail.com>
Received: from Unimatrix08-Focal.lan ([2001:b07:5d32:c012:2dd8:736c:4808:3abc])
        by smtp.gmail.com with ESMTPSA id i14sm2078474ejp.2.2020.10.21.04.04.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2020 04:04:52 -0700 (PDT)
From: "Gianfranco" <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
To: openembedded-devel@lists.openembedded.org
Cc: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>,
	Gianfranco Costamagna <locutusofborg@debian.org>
Subject: [meta-oe][PATCH] vboxguestdrivers: upgrade 6.1.14 -> 6.1.16
Date: Wed, 21 Oct 2020 13:04:51 +0200
Message-Id: <20201021110451.97808-1-costamagnagianfranco@yahoo.it>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
---
 ...{vboxguestdrivers_6.1.14.bb => vboxguestdrivers_6.1.16.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/vboxguestdrivers/{vboxguestdrivers_6.1.14.bb => vboxguestdrivers_6.1.16.bb} (95%)

diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.14.bb b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.16.bb
similarity index 95%
rename from meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.14.bb
rename to meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.16.bb
index 35dc4953b..9282f663b 100644
--- a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.14.bb
+++ b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.16.bb
@@ -14,8 +14,8 @@ VBOX_NAME = "VirtualBox-${PV}"
 SRC_URI = "http://download.virtualbox.org/virtualbox/${PV}/${VBOX_NAME}.tar.bz2 \
     file://Makefile.utils \
 "
-SRC_URI[md5sum] = "6e4313df24fd00b0dc0437c3746b940d"
-SRC_URI[sha256sum] = "91fa05bcfce36316ca93e3927c9550ea66286fff4c5bec900b753fca278ce1a0"
+SRC_URI[md5sum] = "a12a647f6c114f2cb1571089b36841fe"
+SRC_URI[sha256sum] = "49c1990da16d8a3d5bda8cdb961ec8195a901e67e4c79aea44c1521a5fc2f9f1"
 
 S ?= "${WORKDIR}/vbox_module"
 S_task-patch = "${WORKDIR}/${VBOX_NAME}"
-- 
2.25.1

