Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
	[209.85.128.54])
	by mail.openembedded.org (Postfix) with ESMTP id 095D07D14C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Mar 2019 15:35:33 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id f3so468407wmj.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Mar 2019 08:35:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=3UWAfiHczOURUCn2AzBgHqnrqqSKu9xMWCPe8IkpadU=;
	b=mXK+Mf/u60MJ4VaYr/TjwriN9h1upID+A2dQFjK+gLqWDkWU38F65jkNJtAUrDxRsu
	AV2gtDUyu3lW6IPCeDWI4WzXLf9W3WhgV5c31z4TW58lb2+2fkcyGR2WHSurDsFnjDXv
	o6EAZ5bLs9EXEOQLkoW2EmvRUEkkS2jf6lTs5I7XFlErO3JxXXHUOHiXdwM7Y481bRMr
	4KM5F4btj/36R/87xLH3h78VVBBrHfvEYFzGG0OQts4IO+sbyFteAD+cUmNlW5616f7H
	a51NP0f2vWX+nZniD9TN0L+ZoRzRXMiYXAgEWT5e4CdiWqFgtkzeCFI2Rut0geFaUnND
	zIzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=3UWAfiHczOURUCn2AzBgHqnrqqSKu9xMWCPe8IkpadU=;
	b=sCInlAc74pqpAmlK5wwIoIOtUzgOHJEfeaCm+U3GJu8TNouLXNk5tJX6B01g79f6I9
	N5cR5oOHY0hNCNEM5tpQN41QgvzDer0E323L/vk+TWetJ8zjr7MRZoIdvT+I9cNlxfro
	I+D8e72Eqbc7Xx+Yad8ngvbZLzm5aCYOpC56PI6AFSZB+uQIkM+dUmrBgin/aCW6Eecq
	qCM8ApSMBG73G83peHUwooSAmDIO7o75NPbpeEj8kA7jv62yg2K/vE1GdkfPH31j8leP
	h2HbYHemyz7i4SwXmqwR8IGQV6Ba8MWl53M1o02y17WO55EOIgy3XcMYsg2tbFx+SnYQ
	tbhg==
X-Gm-Message-State: APjAAAUi8FzFnkbLLAt7QfRrwQALTDRJhdDeaUqEYF05mI2vbhyHBPKP
	ZjySeOEz7G08R/+wj2ucQMfurMKK
X-Google-Smtp-Source: APXvYqxVgzKS5WkWd/mRATyQwdExECAWULGlQBo/RAUkh/GZOt/pBB/BqqF2+jXhWQ4zCLAT1rbjkQ==
X-Received: by 2002:a1c:cc0a:: with SMTP id h10mr18744304wmb.22.1553700933688; 
	Wed, 27 Mar 2019 08:35:33 -0700 (PDT)
Received: from localhost.localdomain (p509737a3.dip0.t-ipconnect.de.
	[80.151.55.163])
	by smtp.gmail.com with ESMTPSA id q4sm7517518wrx.25.2019.03.27.08.35.32
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 27 Mar 2019 08:35:32 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 27 Mar 2019 16:34:59 +0100
Message-Id: <20190327153509.23928-5-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190327153509.23928-1-schnitzeltony@gmail.com>
References: <20190327153509.23928-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 05/15] hunspell: upgrade 1.6.2 -> 1.7.0
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
X-List-Received-Date: Wed, 27 Mar 2019 15:35:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

They changed the license back when hunspell2 was removed [1]. My test
did not show fallout for missing hunspell2.

[1] https://github.com/hunspell/hunspell/commit/35301da115410bdffa6a35ed449be44df2d8a218

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../hunspell/{hunspell_1.6.2.bb => hunspell_1.7.0.bb}  | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)
 rename meta-oe/recipes-support/hunspell/{hunspell_1.6.2.bb => hunspell_1.7.0.bb} (49%)

diff --git a/meta-oe/recipes-support/hunspell/hunspell_1.6.2.bb b/meta-oe/recipes-support/hunspell/hunspell_1.7.0.bb
similarity index 49%
rename from meta-oe/recipes-support/hunspell/hunspell_1.6.2.bb
rename to meta-oe/recipes-support/hunspell/hunspell_1.7.0.bb
index 5feea8987..40da3b496 100644
--- a/meta-oe/recipes-support/hunspell/hunspell_1.6.2.bb
+++ b/meta-oe/recipes-support/hunspell/hunspell_1.7.0.bb
@@ -1,14 +1,14 @@
 SUMMARY = "A spell checker and morphological analyzer library"
 HOMEPAGE = "http://hunspell.github.io/"
-LICENSE = "GPLv3 | LGPLv3"
+LICENSE = "GPLv2 | LGPLv2.1"
 LIC_FILES_CHKSUM = " \
-    file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
-    file://COPYING.LESSER;md5=e6a600fd5e1d9cbde2d983680233ad02 \
+    file://COPYING;md5=75859989545e37968a99b631ef42722e \
+    file://COPYING.LESSER;md5=c96ca6c1de8adc025adfada81d06fba5 \
 "
 
 SRC_URI = "https://github.com/${BPN}/${BPN}/archive/v${PV}.tar.gz"
-SRC_URI[md5sum] = "1a54504cb470aafa6530bb372a10dc04"
-SRC_URI[sha256sum] = "3cd9ceb062fe5814f668e4f22b2fa6e3ba0b339b921739541ce180cac4d6f4c4"
+SRC_URI[md5sum] = "b2399a4aa927e8b3e171d9ea6737cc02"
+SRC_URI[sha256sum] = "bb27b86eb910a8285407cf3ca33b62643a02798cf2eef468c0a74f6c3ee6bc8a"
 
 inherit autotools pkgconfig gettext
 
-- 
2.20.1


