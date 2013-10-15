Return-Path: <fathi.boudra@linaro.org>
Received: from mail-la0-f45.google.com (mail-la0-f45.google.com
	[209.85.215.45])
	by mail.openembedded.org (Postfix) with ESMTP id 0275D6CBAC
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Oct 2013 11:37:41 +0000 (UTC)
Received: by mail-la0-f45.google.com with SMTP id eh20so6731624lab.18
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Oct 2013 04:37:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=plnS1cX2e0sEdrEsNyRiAMVOa9cfr3LhN65tiYwEf8E=;
	b=IKm/i+QtqCyxOC7C6/l3hhlhCsnvjFqzRep91KWdz7xsKgoziBuaCtxLpxgTHjmoKk
	qdecX+auI7bg63SJi3pZtBfCG7eWxhDmeo7gFjdqtb1H1iF1nPNHj4gL5DeaKo4V2s1z
	K6YrIiOTbu6rpk4UwIRc0IzCC7jwRV8omV6s7OHT0PW0cpk1/UKda7kC/+0LwxScCFbm
	YL0EfXV4i4kkAW1FuNwdWrz2ysB0vVdafciYoo4euZZZeOIeE5KtJWkV8vslvAKfDDWZ
	C1TiXR9megmW3Sxns244nzVl1LERGDcq1mBFOTzaOm5wkA3XUQ+Bde37xISAkms491R7
	fyhg==
X-Gm-Message-State: ALoCoQmMKwiLtupO84wsrdRk7MeLLKt3i2ZVvRtpLjkYD1JjcpAL+fpRACeOKNEBL0KJOzSXIP5m
X-Received: by 10.152.3.42 with SMTP id 10mr35971740laz.22.1381837063351;
	Tue, 15 Oct 2013 04:37:43 -0700 (PDT)
Received: from localhost.localdomain (a91-152-78-194.elisa-laajakaista.fi.
	[91.152.78.194]) by mx.google.com with ESMTPSA id
	vs11sm64213095lac.3.1969.12.31.16.00.00
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 15 Oct 2013 04:37:43 -0700 (PDT)
From: Fathi Boudra <fathi.boudra@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 15 Oct 2013 14:37:36 +0300
Message-Id: <1381837057-9403-1-git-send-email-fathi.boudra@linaro.org>
X-Mailer: git-send-email 1.8.1.2
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCHv2 1/2] libjpeg-turbo: update to 1.3.0 release (svn r988)
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
X-List-Received-Date: Tue, 15 Oct 2013 11:37:42 -0000

 License files changes:
 + * This file was part of the Independent JPEG Group's software:
   * Copyright (C) 1991-1998, Thomas G. Lane.
   * Modified 2002-2009 by Guido Vollbeding.
 - * Copyright (C) 2009-2011, D. R. Commander.
 - * This file is part of the Independent JPEG Group's software.
 + * Modifications:
 + * Copyright (C) 2009-2011, 2013, D. R. Commander.

Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
---
 meta-oe/recipes-core/jpeg/libjpeg-turbo_svn.bb | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/meta-oe/recipes-core/jpeg/libjpeg-turbo_svn.bb b/meta-oe/recipes-core/jpeg/libjpeg-turbo_svn.bb
index 4fd258f..f18d37d 100644
--- a/meta-oe/recipes-core/jpeg/libjpeg-turbo_svn.bb
+++ b/meta-oe/recipes-core/jpeg/libjpeg-turbo_svn.bb
@@ -3,12 +3,11 @@ HOMEPAGE = "http://libjpeg-turbo.org/"
 
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
+PV = "8d+1.3.0"
+SRCREV = "988"
 SRC_URI = "svn://libjpeg-turbo.svn.sourceforge.net/svnroot/libjpeg-turbo;protocol=https;module=trunk"
 
 S = "${WORKDIR}/trunk"
-- 
1.8.1.2


