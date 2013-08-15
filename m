Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f180.google.com (mail-ea0-f180.google.com
	[209.85.215.180])
	by mail.openembedded.org (Postfix) with ESMTP id CC8866B83F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2013 07:20:02 +0000 (UTC)
Received: by mail-ea0-f180.google.com with SMTP id h10so179581eaj.39
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2013 00:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=c3xVWqcGU+hXgtuf7m6yFTgnxsOvpFat0M/1fa1VEe0=;
	b=G7qpofiqo+Z16TuOy4d2IPP8+ZiSWGReZG5Z547TFHnRXRTdlw6pfdL09/ltylKSwN
	yMyk3E3yXmfF8EIiad1Xa98acvntHEWct6WaOBmfXw3G+wIFyv/syTAVIn/hAG3oxxGz
	tLkm8rDjhSMxQY0kt9Tou8IS9v9YaG0MmcoTZ3HSaK1tYuRZA4qfBkBE0H2/dK1zfxjk
	+RsFtRV3o9kL9pb+HSQfOI2X0FILpkLqyudKe0pf3zXHGnAaO3foA+ZFuC6/XteP516c
	1pDgK4tAuRiWugq8Xpii+ncKke/rBAZWyYglux7UxaYk4Iq8aWqdxx6Py0KxF4NbICbR
	taZQ==
X-Received: by 10.14.5.78 with SMTP id 54mr2620593eek.55.1376551203228;
	Thu, 15 Aug 2013 00:20:03 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	r48sm74958041eev.14.2013.08.15.00.20.02
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 15 Aug 2013 00:20:02 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 15 Aug 2013 09:19:32 +0200
Message-Id: <003602d7d57e3ceba505bf49dfd0f57a71200141.1376551136.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1376551134.git.Martin.Jansa@gmail.com>
References: <cover.1376551134.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1376551134.git.Martin.Jansa@gmail.com>
References: <cover.1376551134.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][dylan][PATCH 52/60] libftdi: add PACKAGECONFIG for cpp-wrapper
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
X-List-Received-Date: Thu, 15 Aug 2013 07:20:03 -0000

* also fixes
  WARNING: QA Issue: libftdi: The compile log indicates that host include and/or library paths were used.
           Please check the log '/OE/oe-core/tmp-eglibc/work/x86_64-oe-linux/libftdi/0.19-r1/temp/log.do_compile' for more information.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/libftdi/libftdi_0.19.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-support/libftdi/libftdi_0.19.bb b/meta-oe/recipes-support/libftdi/libftdi_0.19.bb
index 2b8068b..a62236f 100644
--- a/meta-oe/recipes-support/libftdi/libftdi_0.19.bb
+++ b/meta-oe/recipes-support/libftdi/libftdi_0.19.bb
@@ -20,6 +20,9 @@ SRC_URI = "http://www.intra2net.com/en/developer/libftdi/download/libftdi-${PV}.
 SRC_URI[md5sum] = "e6e25f33b4327b1b7aa1156947da45f3"
 SRC_URI[sha256sum] = "567c9d2c42d92fc401c5aba2deed45ffb2433990984e816bcdf31e441aef06be"
 
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[cpp-wrapper] = "--enable-libftdipp,--disable-libftdipp,boost"
+
 inherit autotools binconfig pkgconfig
 
 BBCLASSEXTEND = "native"
-- 
1.8.3.2


