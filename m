Return-Path: <fathi.boudra@linaro.org>
Received: from mail-la0-f44.google.com (mail-la0-f44.google.com
	[209.85.215.44])
	by mail.openembedded.org (Postfix) with ESMTP id D9B806D173
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Oct 2013 11:37:42 +0000 (UTC)
Received: by mail-la0-f44.google.com with SMTP id eo20so6811173lab.31
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Oct 2013 04:37:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=PJT8HXlt0x3Bf/oNdt9jMmK+KI/Bk+2V2ZbmzV0nGKU=;
	b=mYXWStfMhNNZktCsBRymlYlAfwYQxuFGNGFnZ4tnSU2mWy3BOcgEuyciAR0qLVieSx
	ut8iofaA0dkje0SFFPExkaPUG+HOruo/G9yAmxVcS5ZMvCkdoy3SYf8SdPzdx2olFONF
	zXm5+JGhJqtBaiRQzFfo/iSrk5g4cqy96lMUgDerRWlEN5sbiEFzimtIMI8SZJkGVE8+
	iMQb8XzuCTtb6PksoSXSfwhW5ahBeixSt0u4AP0LCV6eD8cRvMw85VxW6tsaRk3N0aPN
	8cb81NNUrL45LVf8URwN/YRTYFI3RA8FgOF+xzRmCkwMmRYnVLcB+gTD30YW8Uw1p8kd
	Utug==
X-Gm-Message-State: ALoCoQm5JW4UFmp1VLs1XPE6paHhiAxk86v9zbalI7i7Ty9qFiQ2/0RWh+Dp0CYPzomAYzGgKpQW
X-Received: by 10.112.234.168 with SMTP id uf8mr1400166lbc.35.1381837064038;
	Tue, 15 Oct 2013 04:37:44 -0700 (PDT)
Received: from localhost.localdomain (a91-152-78-194.elisa-laajakaista.fi.
	[91.152.78.194]) by mx.google.com with ESMTPSA id
	vs11sm64213095lac.3.1969.12.31.16.00.00
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 15 Oct 2013 04:37:43 -0700 (PDT)
From: Fathi Boudra <fathi.boudra@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 15 Oct 2013 14:37:37 +0300
Message-Id: <1381837057-9403-2-git-send-email-fathi.boudra@linaro.org>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <1381837057-9403-1-git-send-email-fathi.boudra@linaro.org>
References: <1381837057-9403-1-git-send-email-fathi.boudra@linaro.org>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCHv2 2/2] libjpeg-turbo: fix variables spacing
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
X-List-Received-Date: Tue, 15 Oct 2013 11:37:43 -0000

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


