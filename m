Return-Path: <fathi.boudra@linaro.org>
Received: from mail-lb0-f179.google.com (mail-lb0-f179.google.com
	[209.85.217.179])
	by mail.openembedded.org (Postfix) with ESMTP id 80AEE60071
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Oct 2013 12:54:35 +0000 (UTC)
Received: by mail-lb0-f179.google.com with SMTP id x18so6660486lbi.24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Oct 2013 05:54:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=K+pDg5fWwLjFtj/1Ur/933qeYv0xsVnDxSKf4uagOB0=;
	b=VX1bm5EuTOg1Ln9T4zUkGvd7TqMhWqs8mZtfmrSyf3v903/Hod7z4g9KD84DYc8NgC
	SaVJEuUeV61cddgJBqqwiL4qdiGbg0twA+UbQ1j0hxWNsa8wluU0lFO54AtRFUvetOjl
	SiHKiWgMZdAXbTnr/kpy1kf+8aEWyHJuReZIbWTMLli036bD2OBeOaNMd9wFEW+FovdN
	PtH8sWxhEzWVW1H2g9zcaXrmaOaHD0KH6GWsYqHSiApmYDHy/oiQ737t44tzGNPzB2ud
	sJrU/1P9TLE9ZRjwa6vBqtExAu6ggGA5UTw1Z0fxJdDFX10Z7awWOwriIoVt52RljwFx
	cxUQ==
X-Gm-Message-State: ALoCoQmDyv8yGvI+z2DNIBWFWaiwTiZwlUIQmzPfJYZfPClDzbdgTv2imBoWaf/yNTNt/CE7rJBG
X-Received: by 10.152.10.99 with SMTP id h3mr36049656lab.13.1381841676523;
	Tue, 15 Oct 2013 05:54:36 -0700 (PDT)
Received: from localhost.localdomain (a91-152-78-194.elisa-laajakaista.fi.
	[91.152.78.194]) by mx.google.com with ESMTPSA id
	m13sm47404265lbo.11.1969.12.31.16.00.00
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 15 Oct 2013 05:54:35 -0700 (PDT)
From: Fathi Boudra <fathi.boudra@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 15 Oct 2013 15:54:27 +0300
Message-Id: <1381841668-16211-1-git-send-email-fathi.boudra@linaro.org>
X-Mailer: git-send-email 1.8.1.2
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCHv3 1/2] libjpeg-turbo: update to 1.3.0 release (svn r988)
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 15 Oct 2013 12:54:36 -0000

License files changes:
 + * This file was part of the Independent JPEG Group's software:
   * Copyright (C) 1991-1998, Thomas G. Lane.
   * Modified 2002-2009 by Guido Vollbeding.
 - * Copyright (C) 2009-2011, D. R. Commander.
 - * This file is part of the Independent JPEG Group's software.
 + * Modifications:
 + * Copyright (C) 2009-2011, 2013, D. R. Commander.

Update SRC_URI to match new SF layout.

Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
---
 meta-oe/recipes-core/jpeg/libjpeg-turbo_svn.bb | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/meta-oe/recipes-core/jpeg/libjpeg-turbo_svn.bb b/meta-oe/recipes-core/jpeg/libjpeg-turbo_svn.bb
index 4fd258f..cb3693f 100644
--- a/meta-oe/recipes-core/jpeg/libjpeg-turbo_svn.bb
+++ b/meta-oe/recipes-core/jpeg/libjpeg-turbo_svn.bb
@@ -3,13 +3,12 @@ HOMEPAGE = "http://libjpeg-turbo.org/"
 
 LICENSE ="BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://cdjpeg.h;endline=12;md5=78fa8dbac547bb5b2a0e6457a6cfe21d \
-                    file://jpeglib.h;endline=14;md5=7bb9a39828a1b1e84acd4e8aec1e5532 \
-                    file://djpeg.c;endline=13;md5=e85613b52f2906c5dfc0e21ec902cb33 \
+                    file://jpeglib.h;endline=14;md5=a08bb0a80f782a9f8da313cc4015ed6f \
+                    file://djpeg.c;endline=13;md5=03db065044529233c296324be85530ab \
 "
-PV = "8d+1.2.1"
-PR = "r2"
-SRCREV = "837"
-SRC_URI = "svn://libjpeg-turbo.svn.sourceforge.net/svnroot/libjpeg-turbo;protocol=https;module=trunk"
+PV = "8d+1.3.0"
+SRCREV = "988"
+SRC_URI = "svn://svn.code.sf.net/p/libjpeg-turbo/code/trunk;protocol=https;module=trunk"
 
 S = "${WORKDIR}/trunk"
 
-- 
1.8.1.2


