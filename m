Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 82251731CD
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Feb 2017 18:07:42 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id c85so15749388wmi.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Feb 2017 10:07:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=BZY+3rBJo5ef9bGyzWbnsZnUvbzTDURYvwXtFe5oyGs=;
	b=k17z1dS3XVw+pCMfZDXTrznNxGqppcjjoetYwtH7vqCr8n+RbyN/Z4PShAeKbVA4Lk
	GncstLexcnVJgRXrvdXU/E7HEgAdJMgkxtm4jd3ZjbxUS6nc+fW9I5xeCLSJLKGK8Uaf
	sZ2CNkDVPyMNkZIZMGmhAJYN6ckxMmaPuJN8UW5TAFvOJB9YjpS0nkgtZxs9klBPVThx
	ogSFodG7cTKWxd7Eg1fTRMTTjK8O9FFMh/72lYGkDyrobpRjt9ROnkUdx9vYF2iGvZ+L
	EqrIJLhHyiVkWpI51v8EHSzMTZUnIDr1vs+wMEnTpTbis+1RbUWtVzuy6uyXOFQ3xWTw
	UiQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=BZY+3rBJo5ef9bGyzWbnsZnUvbzTDURYvwXtFe5oyGs=;
	b=r5IYe4blWZhTmMP1MhSiuOEPpqpIPcKCGOW9ag2KJxz62BdHHjFVSRnKoq/isV9lxA
	nhO59JhCqJ9md7L1ouJhWjK0s8wWqE869q1b+UUt90+/OYg+x07E2rsJsl1Uf0dYmA9+
	HwB7GkXhFaFYJ3DmSzMeHlWh9pNSkDrH5FvY4yM6sEEnjBOOnozI7v/fXll0CJURjBI6
	F0VCefVIUXXONzRe6MIECOvZvXOdiUA8srsxOCtALUPUlD9jOpQfldK4BgvSzFWNFDTq
	Q0de0JQbl3WumS5ap2I3oBU4fmdaA47y8uxpp0whcyKRml2EOWQvjygxHrp1OIzA2zp2
	WB1g==
X-Gm-Message-State: AMke39lBXIMulyWIgIfa6lN/ZEy4W+Ows7LxnWHVSPUGdQ49DKCH3Mg8hHvX177Hjh3MXg==
X-Received: by 10.28.103.3 with SMTP id b3mr18975617wmc.99.1487614062560;
	Mon, 20 Feb 2017 10:07:42 -0800 (PST)
Received: from PC192-168-2-116.speedport.ip
	(p20030046E911DE631E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:46:e911:de63:1e6f:65ff:fe3e:7f61])
	by smtp.googlemail.com with ESMTPSA id
	96sm2863710wrb.14.2017.02.20.10.07.41
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 Feb 2017 10:07:42 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 Feb 2017 19:06:43 +0100
Message-Id: <20170220180700.29836-28-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170220180700.29836-1-schnitzeltony@googlemail.com>
References: <20170220180700.29836-1-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 27/44] libmbim: add glib-2.0-native to DEPENDS and unblacklist
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
X-List-Received-Date: Mon, 20 Feb 2017 18:07:43 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-connectivity/libmbim/libmbim_1.14.0.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta-oe/recipes-connectivity/libmbim/libmbim_1.14.0.bb b/meta-oe/recipes-connectivity/libmbim/libmbim_1.14.0.bb
index 0f18112..f89ef9d 100644
--- a/meta-oe/recipes-connectivity/libmbim/libmbim_1.14.0.bb
+++ b/meta-oe/recipes-connectivity/libmbim/libmbim_1.14.0.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = " \
     file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c \
 "
 
-DEPENDS = "glib-2.0 libgudev"
+DEPENDS = "glib-2.0 glib-2.0-native libgudev"
 
 inherit autotools pkgconfig bash-completion
 
@@ -16,5 +16,3 @@ SRC_URI = "http://www.freedesktop.org/software/${BPN}/${BPN}-${PV}.tar.xz \
 "
 SRC_URI[md5sum] = "2ed809e65c85353d3ab59e372890e549"
 SRC_URI[sha256sum] = "ca8d52a95a18cbabae8f15f83f1572316e888b6504f946e6645d24405127ab5b"
-
-PNBLACKLIST[libmbim] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130590/"
-- 
2.9.3


