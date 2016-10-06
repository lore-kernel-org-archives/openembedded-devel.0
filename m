Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id EF06560720
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Oct 2016 08:07:31 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id 123so2204903wmb.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 Oct 2016 01:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=t0vZ5YKl9gynuCBzu/fF+46lyBpsFmd6QoqN75C9zNc=;
	b=W10RC9haxthnV4dom+m7pTspCjzMnUStIEX07rjLSGSaOY8spCdYs+/xXWLas/qyvs
	A2W8tyC0TTYWsUzQ0ELXJDFJyLBJf9EeJ0gCflLu/CGI1yCt6mKhM7cypcyEmo5nkKlJ
	rmAwrMBA0dvz9FlK9XbN0JbrMPPca8tScoGa2qOeFs4Pshd37pXHzYgm/hq0kxp7xQf1
	CK1n+Xn2YvPDHZSYf1Knc0NrdCWOw4g8BdeovenRqEok3eiHxO+o+61dyf5wv9kvzacS
	Zd12VW/8d3nRnmi/nOSGMq5geEtJU2aj213YZRpnWZPhopT4wq5pgyMerEvB//PT7xAE
	6Ygw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=t0vZ5YKl9gynuCBzu/fF+46lyBpsFmd6QoqN75C9zNc=;
	b=SkvFhHbZ0Jflr/ha10XoAv389bPBxtCUm2BScaPtLXjiX5pzukwE+FyJWKN440ZL+t
	cbIwmNsV4KIf0bxrZ4oHmUrbCXUqAiIgzfXXxeJMV8FkMPg/QZZEvPcAQZJbegqV/Z7T
	b1A3xNyOM4zr+h4omBVJ5pOuu9xPllcy/o0pypFZtggIBqpMfe/Q2mF69ZHf79YTfySu
	xUa6DtxIFklbA9SCqHIcCyUp+QB19sAF1MUU3Hj99WvOaf5uBM5lsmMsnx9ZHFYyMts1
	A4Wmk6aOF13J3jhEqohovJK4vdGxkd97BJcLzkRXVO+VxZvL8AWhPAI4oVV2vhh1djzG
	i07Q==
X-Gm-Message-State: AA6/9Rkov/5QhbGkaNFHHwWw1WE5J50bzqPMycvgMSSEMuUsDZn6WX81aNXByD8obG1WZA==
X-Received: by 10.28.8.139 with SMTP id 133mr190332wmi.80.1475741253158;
	Thu, 06 Oct 2016 01:07:33 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169]) by smtp.gmail.com with ESMTPSA id
	iq2sm13018191wjb.19.2016.10.06.01.07.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 06 Oct 2016 01:07:32 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  6 Oct 2016 10:07:29 +0200
Message-Id: <20161006080729.26628-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.10.1
In-Reply-To: <20161006080729.26628-1-Martin.Jansa@gmail.com>
References: <20161006080729.26628-1-Martin.Jansa@gmail.com>
Cc: Juhee Cho <juhee.cho@lge.com>
Subject: [meta-oe][WIP][PATCH 2/2] leptonica: add PACKAGECONFIG for giflib
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
X-List-Received-Date: Thu, 06 Oct 2016 08:07:32 -0000

From: Juhee Cho <juhee.cho@lge.com>

* make it easier to disable giflib

Signed-off-by: Juhee Cho <juhee.cho@lge.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-graphics/leptonica/leptonica_1.73.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-graphics/leptonica/leptonica_1.73.bb b/meta-oe/recipes-graphics/leptonica/leptonica_1.73.bb
index 0aebe89..c32d24a 100644
--- a/meta-oe/recipes-graphics/leptonica/leptonica_1.73.bb
+++ b/meta-oe/recipes-graphics/leptonica/leptonica_1.73.bb
@@ -1,5 +1,5 @@
 DESCRIPTION = "A pedagogically-oriented open source site containing software that is broadly useful for image processing and image analysis applications"
-DEPENDS = "jpeg tiff libpng zlib giflib"
+DEPENDS = "jpeg tiff libpng zlib"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://leptonica-license.txt;md5=20cdd3af097ca431b82004c691f406a6"
 
@@ -11,7 +11,8 @@ EXTRA_OECONF += " \
     --without-libwebp \
 "
 
-PACKAGECONFIG ??= ""
+PACKAGECONFIG ??= "giflib"
 PACKAGECONFIG[openjpeg] = "--with-libopenjpeg,--without-libopenjpeg,openjpeg"
+PACKAGECONFIG[giflib] = "--with-giflib,--without-giflib,giflib"
 
 inherit autotools pkgconfig
-- 
2.10.1


