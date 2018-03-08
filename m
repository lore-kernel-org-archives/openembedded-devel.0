Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f42.google.com (mail-pl0-f42.google.com
	[209.85.160.42])
	by mail.openembedded.org (Postfix) with ESMTP id C0CF078956
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  8 Mar 2018 17:43:25 +0000 (UTC)
Received: by mail-pl0-f42.google.com with SMTP id 93-v6so3699008plc.9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 08 Mar 2018 09:43:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=bIpbThjvyDKy29Uw4JRML7FAj1ll23lZxNCwbgv8r7U=;
	b=Nz4bFnQNSW/+n7dqlZc2zlIYBgvZ6jOs+BLwjQsBhmfr0YeatpY0riy4JnNoAW3psj
	e4eU5rchO/PZKsXH0DBJV6xu2iqzA0+uZqrXbEhBnUpFMRlHmxf0Z1LRTgjuSNVqYcX3
	4wBc5ijB2me3tIeIrJYhB+3XBFFCSM+xbXZyb9cO3okxKzN/CKXXJV6XEIOOmyZfPK6r
	TgOm+84umDLtB+ADkcg51P4IeS2gXuk1iI3FhRxOwkia/PilId+JD2yKQg6GyiL0QyO4
	5ihSaY9J6qhqsQmxVV7NSniTsjEzrsLijtOMmHJEA/8pcDwVusrMMPxqsLhNP/OF1xnH
	5BSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=bIpbThjvyDKy29Uw4JRML7FAj1ll23lZxNCwbgv8r7U=;
	b=Qng63T5X/X4vCcNCTq5Rz2E+IVXWQlQsq/7VWc3nTLhXnfWJwWyGf0mhigxVK4Onmw
	UoWQyERSJFfSpq3BclmhWU/H+240YJ+1I/OmuEMahtY2AJt7ShEA9dIqPB2X6+CR9mJx
	NFSlBO6ShFaicZFN0h9OxCkC+i8miK2g7gUozQGic9A9UGyi4bp6DoQvnQNuTotCrStF
	u++YkStU+qkXbt/xNHZhcsZ1pE/bUCEOtRsWINsM5zgEbbxhv9cl/RV/swnSFHnNYIE/
	WUJplR+AC6ttIb2fLe2d7/LWRVYdcUEh3t3Qr3W5Uknb2t4TQ/mQySTu8vZ1hZb6TcKD
	3AJg==
X-Gm-Message-State: APf1xPAaR7CcDMbP7Cj5O5ddGDZiPJjm8W9PkbUZBoFEwQKm1qeyJPhE
	4BkiwjYxWaijUidNATT1Cl0CqQ==
X-Google-Smtp-Source: AG47ELthqbH0lLjE39ecVZqTLYxzNws+dJEVfSvkYj1/j/4ytvFmKRPJ2oS5KFPKpp5lDsmWQPiCPg==
X-Received: by 2002:a17:902:7282:: with SMTP id
	d2-v6mr25251254pll.303.1520531006617; 
	Thu, 08 Mar 2018 09:43:26 -0800 (PST)
Received: from localhost.localdomain ([2601:646:8880:466c:6245:cbff:fe64:591])
	by smtp.gmail.com with ESMTPSA id
	f23sm26485575pfn.132.2018.03.08.09.43.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 08 Mar 2018 09:43:25 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  8 Mar 2018 09:43:16 -0800
Message-Id: <20180308174316.36662-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.16.2
Subject: [meta-qt5][PATCH] Pass -DMESA_EGL_NO_X11_HEADERS=1 when x is disabled
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 08 Mar 2018 17:43:25 -0000

Some graphics drives e.g. mali/mesa depend on this define
to use proper guards in eglplatform.h

Fixes

| In file included from /mnt/a/zonit/build/tmp/work/aarch64-bec-linux/qtmultimedia/5.10.1+gitAUTOINC+038716bb1f-r0/recipe-sysroot/usr/include/EGL/egl.h:36:0,
|                  from .moc/../../../../../../git/src/plugins/videonode/egl/qsgvideonode_egl.h:48,
|                  from .moc/moc_qsgvideonode_egl.cpp:9:
| /mnt/a/zonit/build/tmp/work/aarch64-bec-linux/qtmultimedia/5.10.1+gitAUTOINC+038716bb1f-r0/recipe-sysroot/usr/include/EGL/eglplatform.h:125:10: fatal error: X11/Xlib.h: No such file or directory
|  #include <X11/Xlib.h>
|           ^~~~~~~~~~~~
| compilation terminated.
| make[4]: *** [Makefile:461: .obj/moc_qsgvideonode_egl.o] Error 1

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes-qt/qt5/qtmultimedia_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-qt/qt5/qtmultimedia_git.bb b/recipes-qt/qt5/qtmultimedia_git.bb
index 2cb1bd5..efe848f 100644
--- a/recipes-qt/qt5/qtmultimedia_git.bb
+++ b/recipes-qt/qt5/qtmultimedia_git.bb
@@ -25,6 +25,7 @@ EXTRA_QMAKEVARS_CONFIGURE += "${PACKAGECONFIG_CONFARGS}"
 # Disable GStreamer if completely disabled
 EXTRA_QMAKEVARS_CONFIGURE += "${@bb.utils.contains_any('PACKAGECONFIG', 'gstreamer gstreamer010', '', '-no-gstreamer', d)}"
 
+CXXFLAGS += "${@bb.utils.contains('DISTRO_FEATURES', 'x11', '', '-DMESA_EGL_NO_X11_HEADERS=1', d)}"
 # Patches from https://github.com/meta-qt5/qtmultimedia/commits/b5.10
 # 5.10.meta-qt5.2
 SRC_URI += "\
-- 
2.16.2


