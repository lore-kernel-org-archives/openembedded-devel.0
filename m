Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
	[209.85.128.52])
	by mail.openembedded.org (Postfix) with ESMTP id 5A6CA7D86E
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 May 2019 07:06:27 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id 7so2251029wmo.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 May 2019 00:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=+bNkW4ypkV0AFYJH1IR54qAorWg6XXxE6y/M292P4nA=;
	b=Dh127LliPJwhu5lik+Nr7QfItCvJzrGVM/53Sur4XxJ46Qdm7Pc6VVDNjZLDf5aZYM
	ACLt8bSV8ytChos22xXKHRJgbNTDuV6108432tFakJpCYjCi80nPpYmdAI4c7Zusls7W
	Fs3UD7qOzVJOFYfVP7kDBvo/YafkA8ASUDO7jIttQ/TxM7kpwtBxKyE/g+nPa1gYwX4I
	P5KJhtKfbC/gsERYYvAS2jJjJOJP7PhrqD9Ku/61LxeU2K49d1aGyeB5IjvLiSLmXBen
	9Xn985klrUdYoXaqCDc7hlTm5vYDgSix+VEd4B9ZTbvhXQDGk3xooPFcqgvF7SSb7f5y
	09+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=+bNkW4ypkV0AFYJH1IR54qAorWg6XXxE6y/M292P4nA=;
	b=jUG0ASQe6NM1I2y6wOwkzCZnz9Q6v18/i1dxzbUdpsUKAmNd5lX4If5P8oWkV5190t
	GlgLsOlrBqoLI3tvPb6vupdaFXymWYHg+/8X0TBERhR63IHLv8drnT/o8mjvq4PlmrLW
	EGkea07Qrso+vyNVIMiIJ08cvTPtjTWAPI7HdIStIb5dWMCKB0LR/qq+zVWITPGi/gRF
	qD+PUY2um2tYoOkZRGDp5YlR9MPjsMrydYPqOBx9VUUO4kVbCQsYAGw8DeIsyg37qi+1
	W2/5USSW0p7W3D49OBPKvAAlXGbexb96DxjB7DePxP7TeZG1Ttw9J2cwDLVQE2zAXVab
	Qd+w==
X-Gm-Message-State: APjAAAUt93XaH5VU8jC1fNOSqsqVjJD2E4mNAQL7gXBqV6ZP6BxiCGkc
	9u7ZelSIwX+vayvPU9hlBopxWxUr
X-Google-Smtp-Source: APXvYqwYn12erV0aDrsV7G1ihKsmvy6lQR7EG+DAlPbqyxEeFIWK144dXF+w7Ue/nu1BRKv4Lry2Ww==
X-Received: by 2002:a1c:3cc2:: with SMTP id j185mr26569939wma.26.1557990387896;
	Thu, 16 May 2019 00:06:27 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id o6sm7307070wrh.55.2019.05.16.00.06.26
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 16 May 2019 00:06:27 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 16 May 2019 07:06:22 +0000
Message-Id: <20190516070624.27975-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH 1/3] gtkwave: add distro_features_check
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
X-List-Received-Date: Thu, 16 May 2019 07:06:27 -0000

* fixes:
ERROR: Nothing PROVIDES 'gtk+' (but /OE/build/luneos-warrior/webos-ports/meta-openembedded/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.98.bb DEPENDS on or otherwise requires it)
gtk+ was skipped: one of 'x11 directfb' needs to be in DISTRO_FEATURES
ERROR: Required build target 'meta-world-pkgdata' has no buildable providers.
Missing or unbuildable dependency chain was: ['meta-world-pkgdata', 'gtkwave', 'gtk+']

and

ERROR: Nothing PROVIDES 'tk' (but /OE/build/luneos-warrior/webos-ports/meta-openembedded/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.98.bb DEPENDS on or otherwise requires it)
tk was skipped: missing required distro feature 'x11' (not in DISTRO_FEATURES)
ERROR: Required build target 'meta-world-pkgdata' has no buildable providers.
Missing or unbuildable dependency chain was: ['meta-world-pkgdata', 'gtkwave', 'tk']

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.98.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.98.bb b/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.98.bb
index 60df6f773b..b9aae0f6c8 100644
--- a/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.98.bb
+++ b/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.98.bb
@@ -14,6 +14,10 @@ inherit pkgconfig autotools gettext texinfo
 DEPENDS = "tcl tk gperf-native bzip2 xz pango zlib gtk+ gdk-pixbuf glib-2.0"
 RDEPENDS_${PN} = "tk-lib"
 
+# depends on gtk+ which has this restriction
+inherit distro_features_check
+ANY_OF_DISTRO_FEATURES = "${GTK2DISTROFEATURES}"
+
 EXTRA_OECONF = "--with-tcl=${STAGING_BINDIR_CROSS} --with-tk=${STAGING_BINDIR_CROSS}"
 
 FILES_${PN} = "${bindir} ${datadir}"
-- 
2.17.1


