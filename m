Return-Path: <fathi.boudra@linaro.org>
Received: from mail-lb0-f176.google.com (mail-lb0-f176.google.com
	[209.85.217.176])
	by mail.openembedded.org (Postfix) with ESMTP id 43DAA6CC72
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Oct 2013 11:15:40 +0000 (UTC)
Received: by mail-lb0-f176.google.com with SMTP id y6so6561465lbh.21
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Oct 2013 04:15:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=PJT8HXlt0x3Bf/oNdt9jMmK+KI/Bk+2V2ZbmzV0nGKU=;
	b=XCuQXrU90j4PvOtu1e2lh9mEl+d58uhYQacVzegXL5Jr0bG3mhuV53AlovKTKZEVWu
	mYBCvnl4X+uDqu9Xp7i6g5+J8s/tNXddNJjJminmz7LXFuIoI0knliKo5s08IaugX6Fc
	Fy2g+zGFKRTm5VHampb0jy3ci9p6eWXB6o4HoD44pmdixpIZXetpI//CSNmIC1hmByZF
	53yvqkBqkHqzm4FZubeyKdOg//e3QuQ5/dRmFRSfnuOaw4iP52Ls58TW3migKG0Sju+1
	xf/hDZcHBLRyOaIqBpZ87wio0EFP3rfct87IXCsZZAvXHLTG4+xerLvEItSZW46Wo5Kh
	YmlQ==
X-Gm-Message-State: ALoCoQlHIsEDHgOLr5M/1yu0TsBHw9ypfTUvdqIyXkTsPgre1dtKjovLe5D0MV42xFnaXswDUfps
X-Received: by 10.152.120.228 with SMTP id lf4mr1072086lab.44.1381835741543;
	Tue, 15 Oct 2013 04:15:41 -0700 (PDT)
Received: from localhost.localdomain (a91-152-78-194.elisa-laajakaista.fi.
	[91.152.78.194])
	by mx.google.com with ESMTPSA id b1sm64273318lah.6.1969.12.31.16.00.00
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 15 Oct 2013 04:15:41 -0700 (PDT)
From: Fathi Boudra <fathi.boudra@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 15 Oct 2013 14:15:34 +0300
Message-Id: <1381835734-6969-2-git-send-email-fathi.boudra@linaro.org>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <1381835734-6969-1-git-send-email-fathi.boudra@linaro.org>
References: <1381835734-6969-1-git-send-email-fathi.boudra@linaro.org>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH 2/2] libjpeg-turbo: fix variables spacing
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
X-List-Received-Date: Tue, 15 Oct 2013 11:15:41 -0000

Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
---
 meta-oe/recipes-core/jpeg/libjpeg-turbo_svn.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-core/jpeg/libjpeg-turbo_svn.bb b/meta-oe/recipes-core/jpeg/libjpeg-turbo_svn.bb
index f18d37d..ce88f7a 100644
--- a/meta-oe/recipes-core/jpeg/libjpeg-turbo_svn.bb
+++ b/meta-oe/recipes-core/jpeg/libjpeg-turbo_svn.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "libjpeg-turbo is a derivative of libjpeg that uses SIMD instructions (MMX, SSE2, NEON) to accelerate baseline JPEG compression and decompression"
 HOMEPAGE = "http://libjpeg-turbo.org/"
 
-LICENSE ="BSD-3-Clause"
+LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://cdjpeg.h;endline=12;md5=78fa8dbac547bb5b2a0e6457a6cfe21d \
                     file://jpeglib.h;endline=14;md5=a08bb0a80f782a9f8da313cc4015ed6f \
                     file://djpeg.c;endline=13;md5=03db065044529233c296324be85530ab \
@@ -25,7 +25,7 @@ EXTRA_OECONF = "--with-jpeg8 "
 PACKAGES =+ "jpeg-tools libturbojpeg"
 
 DESCRIPTION_jpeg-tools = "The jpeg-tools package includes the client programs for access libjpeg functionality.  These tools allow for the compression, decompression, transformation and display of JPEG files."
-FILES_jpeg-tools =  "${bindir}/*"
+FILES_jpeg-tools = "${bindir}/*"
 
 FILES_libturbojpeg = "${libdir}/libturbojpeg.so"
 INSANE_SKIP_libturbojpeg = "dev-so"
-- 
1.8.1.2


