Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web09.21054.1610905014283165712
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 Jan 2021 09:36:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jrH7EMP3;
 spf=pass (domain: gmail.com, ip: 209.85.215.180, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f180.google.com with SMTP id p18so9451370pgm.11
        for <openembedded-devel@lists.openembedded.org>; Sun, 17 Jan 2021 09:36:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=GKK+muicDs56zPbyzYN0rz2Y/HtiYHYEM1BGKxvKjAI=;
        b=jrH7EMP3Gvb/kQnKkRtr5oTuYwPUEYZoB2TLix+U9cWn+Md+E69t7zjnKlDAO1ql68
         QIBcTPCDf5vZ6E3z1HBCgPkMUuAwd84pGiJAAw3SLWCiHdqhjYfUyBAORRuEGqzSnueL
         8p2hY/u5XjDXEBQ/a+/6nESx4QIqi1QTqdob2f0YtF23BUxPtopJgAehT2eXauJJEu27
         3Mo0ebb57Px2IGuxcgUWMHYZS4moyqilols3qWQFAUK1CGei4ga7v5EHrZflb/UcIZ0o
         m2tSLT1MVXnwd7Ih6nDMsuNgj4C+UPN9tdBj6z+ro76wDrAKwW/Xb7G9gTLOvMdMka5F
         MEdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=GKK+muicDs56zPbyzYN0rz2Y/HtiYHYEM1BGKxvKjAI=;
        b=dvEdkyLoAxLBe9XCJVbDiYFyieE7CEyFD6Ibfk2DmaJFBMLrYLJwN9oaTzy+ytu5z0
         lXIvVPtXaGLMSnApQoMgMoGFX+wwTcthgRoPFRENqNopqqP9V8go2iMPmi44cl5GSrlI
         HDi+jqo5b+8EcOkM8MZsIjsLHhjdPtgRe2zwzENWgzTOGSOq+s7lUBTYfrPMl4ryYLf1
         NwJF2LFCSt9vbiiyjZ130umuCfO3cTXkG2VvSh6F9HgNEePEvKNbh7xJ93q2JNIWDIIj
         rC2R/sw3yb8H12YjrJjagh52od+eRxpAwM8m4QkklinYMsJYtqF7IJ+AIgHHyKHdqpfF
         MGDA==
X-Gm-Message-State: AOAM533Alw+/jfIsaNTun1fl3Xw/pLCTtf76XFNoGQ9TcvMzCzhC1BDw
	xmXLFFO2KkN02U1lCXW2DyIwKr07+VrKJw==
X-Google-Smtp-Source: ABdhPJzf4022wGFtjPA68S1jIdPW8PtSDafhc3yYYMPVYervXQqJbbCkU4nCrGgvvsRfddFmMkj6mA==
X-Received: by 2002:a63:4084:: with SMTP id n126mr16714620pga.80.1610905013748;
        Sun, 17 Jan 2021 09:36:53 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:ed67:500f:ea8f:e947])
        by smtp.gmail.com with ESMTPSA id t4sm13661338pfe.212.2021.01.17.09.36.52
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jan 2021 09:36:53 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [gatesgarth 14/31] openct: use upstream SRC_URI
Date: Sun, 17 Jan 2021 09:36:19 -0800
Message-Id: <f091dc42d1ac817d9b5c622ccf3ef129e9a71372.1610904793.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1610904792.git.akuster808@gmail.com>
References: <cover.1610904792.git.akuster808@gmail.com>

From: Roland Hieber <rhi@pengutronix.de>

The Debian pool URLs are not permanent, and the package is no longer
included in any active Debian release. It is also not available through
any of the default Debian snapshot mirrors. Instead of adding a new
Debian snapshot mirror, use the upstream URL directly.

Signed-off-by: Roland Hieber <rhi@pengutronix.de>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 5265de84b38c3ce946bdc0a489a70cedf7145e1a)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-support/openct/openct_0.6.20.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/openct/openct_0.6.20.bb b/meta-oe/recipes-support/openct/openct_0.6.20.bb
index 08b2e3c232..1514c7a958 100644
--- a/meta-oe/recipes-support/openct/openct_0.6.20.bb
+++ b/meta-oe/recipes-support/openct/openct_0.6.20.bb
@@ -11,7 +11,7 @@ readers to remote machines via TCP/IP."
 DEPENDS += "libtool pcsc-lite libusb-compat"
 
 SRC_URI = " \
-    ${DEBIAN_MIRROR}/main/o/${BPN}/${BPN}_${PV}.orig.tar.gz \
+    https://downloads.sourceforge.net/project/opensc/${BPN}/${BPN}-${PV}.tar.gz \
     file://etc-openct.udev.in-disablePROGRAM.patch \
     file://etc-openct_usb.in-modify-UDEVINFO.patch \
     file://openct.init \
-- 
2.17.1

