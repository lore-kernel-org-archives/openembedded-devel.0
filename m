Return-Path: <twoerner@gmail.com>
Received: from mail-it0-f68.google.com (mail-it0-f68.google.com
	[209.85.214.68])
	by mail.openembedded.org (Postfix) with ESMTP id 5EDE074FC2
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 May 2018 19:17:15 +0000 (UTC)
Received: by mail-it0-f68.google.com with SMTP id 144-v6so222728iti.5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 May 2018 12:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=OZy8rW9tjVyOQpBkKu5gra8fgFtEqeu+YiqdFZoyd6A=;
	b=g5lQ1NL6GcWuv1hO1fGLBcyokgvloEFN3Pd7KXERsu4Ip7qpEnPN7fqBczXgmKlSQ1
	aHah5cbwHBeDqeTZjS+r40UYZdnLvPZHiM5ajCLyXtlx9vO7WVSNPghSdjtt/XtI7cH7
	QVxf9Jae68I4f2SpSmKecK6zFDF/fplxdZ8gBLTsIXoIiYb74nwfx/90T0RiYkWORpju
	iZwfz/x1F7zjm6DQDoXvQuKtfTCXXfnm307T6CCKwtQpsrLEoY5JQFa/GNtPJw+aCqcU
	sZl9vwqSz7I0mHQOSwkezE2RxTJNpS471nPvZdq3g9Q7ZghIxv3QZthAmFNj/PWZFU5V
	Uaww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=OZy8rW9tjVyOQpBkKu5gra8fgFtEqeu+YiqdFZoyd6A=;
	b=jG9om3cfmI2PR3UedLtGlAyHrxNQrOvUv7Sz+F6VN8i8vVexpGlSso4DGhtUwR+3OM
	e6rB9CrrI/wTNcRkmCd50Tree/E51dII5ZgigymjTeai7yPdT8dkUh24DY3FL53WJLfA
	lLzdEMAGVkdc2aY2Ha5gNO4F/vyezBtOgkBiGxyd6hUfXGSn6+FlQBuaBVd+nxhNkdDE
	FtRFTf6WwgnSBPG/tXrYAZdMrRvl0zAgscrqpo5/2oPgEp98qoZNUpfrvLekXjb7eve1
	jNEdNJXZdTIdvoSmrumjHI+2S2cENc7e/3UqrqgaarIoj3y9S2UZaZeJ4inEyeBVi0/2
	a1vQ==
X-Gm-Message-State: ALKqPwdNSaJJ65aJSRBjjpxuTTbqkR4dRsLJBWNll+r2JeoAVBsHnGk1
	/Rs1ee+VYr24GuJuUYHV2e7I2bXD
X-Google-Smtp-Source: AB8JxZr7GhaACGx5T+pd4bZEyNP2SIzMbsCX5W/sQvBNcj2hMF2M+ODxlhNS4rQmCIMgCigTQmnezA==
X-Received: by 2002:a24:114f:: with SMTP id
	76-v6mr11922078itf.75.1525893436827; 
	Wed, 09 May 2018 12:17:16 -0700 (PDT)
Received: from linux-uys3.suse ([206.248.190.95])
	by smtp.gmail.com with ESMTPSA id
	g127-v6sm7276222ioa.79.2018.05.09.12.17.15
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 09 May 2018 12:17:15 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  9 May 2018 15:17:10 -0400
Message-Id: <20180509191711.5389-2-twoerner@gmail.com>
X-Mailer: git-send-email 2.17.0.rc2.3.gc2a499e6c
In-Reply-To: <20180509191711.5389-1-twoerner@gmail.com>
References: <20180509191711.5389-1-twoerner@gmail.com>
Subject: [meta-multimedia][PATCH 2/3] gst-instruments: recipe cleanup, fix -staticdev
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
X-List-Received-Date: Wed, 09 May 2018 19:17:16 -0000

Fix the detected QA issue whereby a static (*.a) library (i.e.
${PN}-staticdev) ended up in the main gst-instruments package.

	WARNING: gst-instruments-0.2.3-r0 do_package_qa: QA Issue: non -staticdev
	package contains static .a library: gst-instruments path
	'/work/core2-64-oe-linux/gst-instruments/0.2.3-r0/packages-split/gst-instruments/usr/lib/gstreamer-1.0/libgstinstruments.a'
	[staticdev]

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 .../recipes-support/gst-instruments/gst-instruments_0.2.3.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-multimedia/recipes-support/gst-instruments/gst-instruments_0.2.3.bb b/meta-multimedia/recipes-support/gst-instruments/gst-instruments_0.2.3.bb
index 67d39512f9..07d0c55615 100644
--- a/meta-multimedia/recipes-support/gst-instruments/gst-instruments_0.2.3.bb
+++ b/meta-multimedia/recipes-support/gst-instruments/gst-instruments_0.2.3.bb
@@ -5,15 +5,16 @@ SECTION = "multimedia"
 LICENSE = "LGPL-3.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e6a600fd5e1d9cbde2d983680233ad02"
 
+DEPENDS = "gstreamer1.0"
+
 S = "${WORKDIR}/git"
 SRCREV = "4ce8092636ee6572148b5fa044080734cf5a6b8d"
 SRC_URI = "git://github.com/kirushyk/gst-instruments.git;protocol=https;"
 
+FILES_${PN}-staticdev += "${libdir}/gstreamer-1.0/*a"
 FILES_${PN} += "${libdir}/*"
 
 INSANE_SKIP_${PN} = "dev-so"
 
-DEPENDS = "gstreamer1.0"
-
 inherit autotools pkgconfig
 
-- 
2.17.0.rc2.3.gc2a499e6c


