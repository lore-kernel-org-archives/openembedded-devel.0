Return-Path: <marc.ferland@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 942DCCA0FF9
	for <webhook@archiver.kernel.org>; Fri, 29 Aug 2025 13:06:51 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web10.13156.1756472809601749286
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Aug 2025 06:06:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TCLoti3t;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: marc.ferland@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3c7ba0f6983so1294202f8f.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 29 Aug 2025 06:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756472807; x=1757077607; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wpiGPAEa1iMWEyk2aDlIrij9RX7McmP+hq5SxyhuMYE=;
        b=TCLoti3tnXuyVtHlOK5uy5hiMEshzRKbyr2EUQUpfx+CJH0bZXt0wZ0nQ9NBZSWCVU
         dx4By3FsMzm41tN905BjXP/1ZuHeayuh7yxrgM8RiVSK5G/YNcPdQoLW4f/puNOkLaTF
         zZqHD+TwyQazGmJbW8lT+8U/ltgagwUXeM6tus80H+JGfxEjr7memSf9++jXoXCFuUy4
         rtbltm0OIwoU6oNeKg/r+njCsv6dgS1mq1/GVkCyICRFfKwh3pyCJlUuQm35OgXxBM8e
         pB4F8inoW16+TJVzx3q3IgHmbehfYfYTrhZaPT/uxDVglSs1Sr9o6xthDZBSUqEPm5/d
         smNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756472807; x=1757077607;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wpiGPAEa1iMWEyk2aDlIrij9RX7McmP+hq5SxyhuMYE=;
        b=eL7y4PXY67HPRsRppyMn6yAW7bWaR0SL1nRA1vIBzXun7NANtS952rOq3qaxfGmOAi
         uPncFLaqtamTCiJ/xXzd55nkDd8/ySjVxGiBk962mdkmfdf8hqeYRfhdn/WBCNAYAWPa
         dlqaMIUXDvD30Zjayg27yJ9/ZCCJN7+pN+cdVeDzFp52rxooKNdZgp2unrS9C2zUNnq+
         8AcGDLBNDrgPMOGwEMta91D4ArpGgHGx19ZwzkwTd5lIeOPGJK8D1yjue1Hga0R4WHYk
         Avu0tI6xzSLYcyB+tUmZ6qADvZl1aLDeZg+9ROyanpl8v4FdYg8J0dAGhsnNOBaxDI+r
         zxnQ==
X-Gm-Message-State: AOJu0YxIniIJxlDuiThoHvBAgouLYSLmTtBTJrpFYzkbLScoyc5LW7sV
	5LG7hkIcJ/BHxcCqCPC0nDzbTXRwFO1I0p+HYzNkjUwkTJswDt0iMzcd9Nu2Uw==
X-Gm-Gg: ASbGnctlaVz/9kCy+HIXP+VfA7csIUJTJzcbryEc771TwAMmWFiXVzFfF4VcIuASWEV
	kRsW3zsjrxXXQZDmqiY6EMXFkQbv4PmZAPtLE3EG1sTeXIhKSG1ShOc/azAl2e7qLuAWqIyDT26
	aR1JE3wNQ0AZETuddTbDAjfoGtRO8fDOtu3NeI/ciIh8UIQDm5cse3nRlobBICvISrC4wVjRLcr
	IM5jkENti2qqa2zFfYdvkvH6tgXQ2yobDN0i2CtYnnKc3smxBvANlZMAuJFpkza+6snP1KORYkm
	AMDfLnrsDJvaYZtOZJ2OYG9D7rzoFpU8kO6tuPeXxH2p9UBCj+x+FjPm1G2tKA7ZtOgad9tzGHU
	PklPxr+WqhYj+KZv1Th/uNwhC6GJrv2+q++bb+iFgjkBgGyQ1zb2kfZMp5JpteZLEHLBJVyOu60
	DHD2paRcqeFRdr/3H9S5ZpLZqo0bgZB1d+GlIzWQiVsGkTMA==
X-Google-Smtp-Source: AGHT+IH12xOYBwpfkgO9MP8XBetOuJhlVYOYJtqXN6oyqyHpQgFihkdZbDpTNPureTRmnvYgi8pSrg==
X-Received: by 2002:a05:6000:40ca:b0:3d0:c6bf:60c6 with SMTP id ffacd0b85a97d-3d0c6bf6478mr1551148f8f.13.1756472806926;
        Fri, 29 Aug 2025 06:06:46 -0700 (PDT)
Received: from mfe-desktop.Sonatest.net (ipagstaticip-d73c7528-4de5-0861-800b-03d8b15e3869.sdsl.bell.ca. [174.94.156.236])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3cf276d5e5fsm3407413f8f.27.2025.08.29.06.06.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Aug 2025 06:06:46 -0700 (PDT)
From: marc.ferland@gmail.com
X-Google-Original-From: marc.ferland@sonatest.com
To: openembedded-devel@lists.openembedded.org
Cc: Marc Ferland <marc.ferland@sonatest.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][walnascar][PATCH 2/2] libvncserver: fix generated LibVNCServerTargets.cmake
Date: Fri, 29 Aug 2025 09:06:38 -0400
Message-Id: <20250829130638.2227550-2-marc.ferland@sonatest.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250829130638.2227550-1-marc.ferland@sonatest.com>
References: <20250829130638.2227550-1-marc.ferland@sonatest.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 29 Aug 2025 13:06:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119139

From: Marc Ferland <marc.ferland@sonatest.com>

The currently generated LibVNCServerTargets.cmake will include the
following 'set_target_properties':

    set_target_properties(LibVNCServer::vncclient PROPERTIES
      INTERFACE_INCLUDE_DIRECTORIES "${_IMPORT_PREFIX}/include"
      INTERFACE_LINK_LIBRARIES "systemd;/usr/lib/libz.so;/usr/lib/liblzo2.so;/usr/lib/libjpeg.so;/usr/lib/libgcrypt.so;/usr/lib/libgnutls.so"
    )

INTERFACE_LINK_LIBRARIES here points to absolute paths which hardcodes
the library paths. From CMake doc [1]:

    Note that it is not advisable to populate the INTERFACE_LINK_LIBRARIES
    of a target with absolute paths to dependencies. That would hard-code
    into installed packages the library file paths for dependencies as
    found on the machine the package was made on.

This breaks krfb build (kde desktop sharing server) since CMake cannot
find these libraries. Removing the absolute paths solves the issue.

Note: I also added a 'inherit pkgconfig' since libvncserver uses it to
detect libsystemd presence.

1: https://cmake.org/cmake/help/latest/prop_tgt/INTERFACE_LINK_LIBRARIES.html

Signed-off-by: Marc Ferland <marc.ferland@sonatest.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 215694286716cf83bf9e52c5e61b4cbc861098fc)
---
 meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.14.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.14.bb b/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.14.bb
index ce01593b8b..6f271ee0d3 100644
--- a/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.14.bb
+++ b/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.14.bb
@@ -42,7 +42,7 @@ PACKAGECONFIG[zlib] = "-DWITH_ZLIB=ON,-DWITH_ZLIB=OFF,zlib"
 PACKAGE_BEFORE_PN = "libvncclient"
 FILES:libvncclient = "${libdir}/libvncclient.*"
 
-inherit cmake
+inherit cmake pkgconfig
 
 SRC_URI = "git://github.com/LibVNC/libvncserver;branch=master;protocol=https"
 SRCREV = "10e9eb75f73e973725dc75c373de5d89807af028"
@@ -52,5 +52,5 @@ S = "${WORKDIR}/git"
 EXTRA_OECMAKE = "-DMAKE_INSTALL_LIBDIR=${libdir}"
 
 do_install:append() {
-    sed -i -e 's|${STAGING_DIR_HOST}||g' ${D}${libdir}/cmake/LibVNCServer/LibVNCServerTargets.cmake
+    sed -i -e 's|${STAGING_DIR_HOST}${libdir}/||g' ${D}${libdir}/cmake/LibVNCServer/LibVNCServerTargets.cmake
 }
-- 
2.34.1


