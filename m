Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D9F2C561E6
	for <webhook@archiver.kernel.org>; Thu,  6 Aug 2026 09:00:08 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15038.1786006806820940405
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Aug 2026 02:00:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=T9tlWMbE;
 spf=pass (domain: konsulko.com, ip: 209.85.221.52, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-47fdd674e17so1181036f8f.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 06 Aug 2026 02:00:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1786006805; x=1786611605; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AvZkkT+Q1G6hylw+rnK5jRSfC/LPgUhT2OYI8M0bQhE=;
        b=T9tlWMbEeFhCyVPSkSTm6YMI6x5wFgq6WIgJ8vuyywljHBnSTHE7VLc11GDdgK965z
         EvX9qxT1N4enXqVfyw4H7WIsukBDB38TRpIUEykcGPAPWSgI5gaqSD4MJ0+t4Jgu9gBt
         /d35rGDz9qGmp3itkYisMreBwjcstUIxHyrTQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786006805; x=1786611605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AvZkkT+Q1G6hylw+rnK5jRSfC/LPgUhT2OYI8M0bQhE=;
        b=fwGfUFPwr6AGbv5jjJ+yzkruXKVgDzS8hFseSk6EMNd3cZgqn1iREPfO2Y8Ct5EKnt
         sFWxiw1tIohMyXP2P5k6qS/Ghr8TKFIHadhn/93sAuIZoGh4ldqM6gaoSLaTx/vRxDYZ
         OahzKPB0HHxCxG5+NZqWodS9RdCvjLK/Ms/ejWQCMCc/8IWTf6PELkPbPjBqcExkHCz/
         KOTutx7Xh+PiwbnxhuHHK7VO6znyRmAFIkcZMb/Syh/Psm1O0XBkZMpH2+YHwOj9cBL6
         vu0YRezORjHujLTy+wS7XsYJsx0VXSRFcEesxP/gr8Cs6pq55hj6wgDvpyhunD4zWUW7
         s/aQ==
X-Gm-Message-State: AOJu0Yz4HKKHSntnsitbUGvwDXuAIIGoaZR8+r58SzpUeOI8Q4wuyYYc
	rFOY4hBQdbWUrcAHBPx0O12m5blwIdhig4x3Tbj1eZgD0QyFNkC7v+XLgHxVo9bKsqvpQfQ/wZI
	7pGHf
X-Gm-Gg: AR+sD11ksTi1KawYiZqm8SA7Oe8k2tpaMG/Agc5oYKy2xnVJt+SqH1s3yOjNpHny4iu
	NSvQDIQr6ldmVcyTnt5bc+Kw3oAZNVpiyBnfMAOYy0ttJhBdlYYdmJXmPkQpHj5Bp5UbAWWLh4t
	Onyka7Ll/uq9f8TG88cK6S3Kw8JDomZ9zy/MW417t1Sy0Ik66pNThS8YRfkrFBpFpLU5dH3vseV
	2WM6jT1QaOnkf3J5FDK0kle68yGjr3U2xGwA/Rvv8rJkYYdbcFf5oIDN1oytcQDqKP7L/xJpUlE
	FxQkUVFAVeS3wVzaOpyDk7OnJV/8penjhbQpwsA54JDcYAmdsxkkfHA47kMRoHZq8v7+lqOJjOU
	oq0hiTvPX/CzOvYl3awAsTYhrvs3DtLvl4CZSlEQiqZ555yre4Zjqu4bRggMYFN1whFi0EUVhiV
	+4YpQuQ8PaBMKQLkGmVdjDuET2qibxTWgyi7MEmdcjN93nd42hKfrKFoEqq2dg9J20ofuNThvHC
	s4gqSQWWRHUcE6++8FwPcdLCW/y7nyaPbUtKD9XgApPH3PiQcH4AloV3WoLqhoAG11Bg4EsIT3x
	WINNWaAP8QwCtA==
X-Received: by 2002:a05:6000:248a:b0:47f:756f:9a8f with SMTP id ffacd0b85a97d-47fec632a8fmr21535392f8f.26.1786006804445;
        Thu, 06 Aug 2026 02:00:04 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47ff79b496esm4819011f8f.14.2026.08.06.02.00.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 02:00:04 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-oe][PATCH] exempi: Add recipe
Date: Thu,  6 Aug 2026 11:59:58 +0300
Message-ID: <20260806085958.3886559-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 06 Aug 2026 09:00:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128839

Add recipe for exempi, an implementation of XMP based on Adobe XMP
SDK and released under a BSD-style license like Adobe's.

This work was sponsored by GOVCERT.LU.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../recipes-support/exempi/exempi_2.6.6.bb    | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 meta-oe/recipes-support/exempi/exempi_2.6.6.bb

diff --git a/meta-oe/recipes-support/exempi/exempi_2.6.6.bb b/meta-oe/recipes-support/exempi/exempi_2.6.6.bb
new file mode 100644
index 0000000000..711f54f552
--- /dev/null
+++ b/meta-oe/recipes-support/exempi/exempi_2.6.6.bb
@@ -0,0 +1,24 @@
+SUMMARY = "An implementation of XMP"
+DESCRIPTION = "An implementation of XMP based on Adobe XMP SDK\
+and released under a BSD-style license like Adobe's."
+HOMEPAGE = "https://libopenraw.freedesktop.org/exempi/"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://COPYING;md5=f816aac8b22d16134477b8e156f0a0f4"
+
+SRC_URI = "https://libopenraw.freedesktop.org/download/${BPN}-${PV}.tar.xz"
+SRC_URI[sha256sum] = "900fb9957be2095c78e5111b99c49378adac58161a358f52f93c55126f34eb8f"
+
+S = "${UNPACKDIR}/${BPN}-${PV}"
+
+inherit autotools pkgconfig
+
+DEPENDS = "expat zlib"
+
+EXTRA_OECONF = "--disable-samples --disable-unittest"
+
+PACKAGES =+ "${PN}-bin"
+FILES:${PN}-bin = "${bindir}/exempi"
+FILES:${PN} = "${libdir}/lib*${SOLIBS}"
+FILES:${PN}-dev += "${libdir}/lib*${SOLIBSDEV} ${libdir}/pkgconfig ${includedir}"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.47.3


