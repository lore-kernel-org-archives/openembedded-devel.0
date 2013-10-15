Return-Path: <fathi.boudra@linaro.org>
Received: from mail-lb0-f180.google.com (mail-lb0-f180.google.com
	[209.85.217.180])
	by mail.openembedded.org (Postfix) with ESMTP id BA52F60071
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Oct 2013 12:54:36 +0000 (UTC)
Received: by mail-lb0-f180.google.com with SMTP id q8so6698078lbi.39
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Oct 2013 05:54:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=G5b1lg5srdwKW1zynP+UXiqHlemwVXlBx/6gHwDEl5s=;
	b=gUgFh1U0aH8z9ln181zqYvGrWsoIR3QRMujrQddUSrL8A9X0trHTyrzJeP6OPkILuL
	f4e08bEeZ8FT+L9i5PYXqdGoSxR2IGhJX2V4pO9fEtnvKKgXbCvnDDqx5J5yBTB5B+p8
	w5QxlkpDPdQZRG/vi65irkQxcK6Mir0IUW0D8Eisomp/UKytvCniOaVpB2NGF2ACJcrE
	yGhxCgUSgH9lOWDJifj/ZxFtrdQnjOSFpN4FkfPgcu4CPq2ijoyyPry9H1Ljv1PCwRAD
	/AU1sy3IT0oJA/hDUeOpOHCBaj2/go/Js16qosuQkbO2klWTxy9qt54ksDhWurOC0vV3
	JEzQ==
X-Gm-Message-State: ALoCoQmjF0QpbYQqEcRcZV9grqB/F92R2RXuYJzWDQn+7ClF2ZgxXtF30aRwzdFjHk4N2FvQu8x1
X-Received: by 10.152.36.170 with SMTP id r10mr1220200laj.48.1381841677980;
	Tue, 15 Oct 2013 05:54:37 -0700 (PDT)
Received: from localhost.localdomain (a91-152-78-194.elisa-laajakaista.fi.
	[91.152.78.194]) by mx.google.com with ESMTPSA id
	m13sm47404265lbo.11.1969.12.31.16.00.00
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 15 Oct 2013 05:54:37 -0700 (PDT)
From: Fathi Boudra <fathi.boudra@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 15 Oct 2013 15:54:28 +0300
Message-Id: <1381841668-16211-2-git-send-email-fathi.boudra@linaro.org>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <1381841668-16211-1-git-send-email-fathi.boudra@linaro.org>
References: <1381841668-16211-1-git-send-email-fathi.boudra@linaro.org>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCHv3 2/2] libjpeg-turbo: fix variables spacing
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
X-List-Received-Date: Tue, 15 Oct 2013 12:54:37 -0000

Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
---
 meta-oe/recipes-core/jpeg/libjpeg-turbo_svn.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-core/jpeg/libjpeg-turbo_svn.bb b/meta-oe/recipes-core/jpeg/libjpeg-turbo_svn.bb
index cb3693f..607d9de 100644
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


