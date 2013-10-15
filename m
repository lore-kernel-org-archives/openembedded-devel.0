Return-Path: <fathi.boudra@linaro.org>
Received: from mail-la0-f43.google.com (mail-la0-f43.google.com
	[209.85.215.43])
	by mail.openembedded.org (Postfix) with ESMTP id 2F340610FC
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Oct 2013 14:13:27 +0000 (UTC)
Received: by mail-la0-f43.google.com with SMTP id ec20so726181lab.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Oct 2013 07:13:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=zzEKOUNfAcRUxx8lKmh73VudYNOdHuz72gffJUZ77M4=;
	b=UAG3TWNzvzBRnUxW95RQi1R3ItDMMHgemkJgaPeSVfEdaUUJvprDSJqth7rmS6fBHp
	y3tDw3Wdc/xJa7p2gPmKCeD5a1wXH3inFEsd+4K3Li4DyDN6BP1zOnzeejotDvt5Bk/+
	8kCq35MRJkTXgrKXiEraIYRNyXaqqOhnpYZdeUqD73qUWi4zWVOt4GnWdZ2T6J24n10k
	/MifZ9Z1rbeVNJhymfWCwFxmBxmQCnwQmnr0a1XW/FsjhlrQS2ICkuH8dhEFj5TScLXk
	kuV4QFFN2moM5LSe/acc8N3A+htuefumoeL+i2jQDgQuelp0GtbO+0RCcbPxSjNUjQE0
	0scQ==
X-Gm-Message-State: ALoCoQme1dGdopHctXwalGkKbyGkly1lWL7M54dhgKr20r6KuiAxWHalewD0KBDjbAtuBrsUP7P/
X-Received: by 10.112.210.66 with SMTP id ms2mr1419452lbc.51.1381846408921;
	Tue, 15 Oct 2013 07:13:28 -0700 (PDT)
Received: from localhost.localdomain (a91-152-78-194.elisa-laajakaista.fi.
	[91.152.78.194])
	by mx.google.com with ESMTPSA id u20sm47633002lbh.7.1969.12.31.16.00.00
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 15 Oct 2013 07:13:28 -0700 (PDT)
From: Fathi Boudra <fathi.boudra@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 15 Oct 2013 17:13:20 +0300
Message-Id: <1381846401-29710-1-git-send-email-fathi.boudra@linaro.org>
X-Mailer: git-send-email 1.8.1.2
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCHv4 1/2] libjpeg-turbo: update to 1.3.0 release (svn r988)
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
X-List-Received-Date: Tue, 15 Oct 2013 14:13:28 -0000

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
+SRC_URI = "svn://svn.code.sf.net/p/libjpeg-turbo/code;protocol=svn;module=trunk"
 
 S = "${WORKDIR}/trunk"
 
-- 
1.8.1.2


