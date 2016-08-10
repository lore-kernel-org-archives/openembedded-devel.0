Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 66B8C771E9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Aug 2016 11:14:27 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id i5so8865650wmg.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Aug 2016 04:14:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=LLlDqPlfrLWwSSGFRroZqqwyj0bGNHNFGXyo904m34o=;
	b=qMrpd2N4NSIZXVzPi1To1E84d0OPp+h0jvv+2vRMjT2OSvRCjHUaJJRH8v7UpKGYc4
	vTwZf639baaZF/oqS12kYdfzqbqNkR6/PSCppQEh7CiJMYfKUqjzdUpRyFgizUgZhQ6P
	5uZfbuY28EfMchGDXUl04j/6yQ5UI9M6BsrUkwXTOlWbGgv3HdW7yvz2fwX5zUCe5d/9
	w8/F6Rung36L2kuppZVt0al31nPFPxmZY88UTOT9cahZPqjPT29wOUiqb1hZHniLDWy2
	HVnULqucQ+/hymSvM0s2vTXCwoXsLUa6PZqx/Jf+qd885kpLk+dA0mcGeAHyPnmaled4
	xKzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=LLlDqPlfrLWwSSGFRroZqqwyj0bGNHNFGXyo904m34o=;
	b=gcGNnkZcW8KmAvT4aI7iKFbsOPMmqSHpnxOKpGvFjWpOORhJIQWrejBQii48ZaWLFs
	l8npo6L86oV/fEfR/S4G6NENF7s9HDLO1Ix+SyZrkB54pf5VKL6QrcZqfQYRC3N1pQ7Y
	wQ4hoeKZcplKjyDZscANv+9X7rzNOWbTHA6jW8ig/yTzskLRq+KSg0Kfc2FXo9SxOo11
	YRTSZuu3uV2TwMjHg2/r77rPl1z6fS2+YaXWLB3KO51dgMMNyR91BRFf1Nw+s+AvfCeM
	CLtxfL9ayXKOYWSf8P2zxMPg9Lm+GaJXYkixe15s0iTRmTU5STp+H+ovfi2T0J38AQQN
	m9Lw==
X-Gm-Message-State: AEkoouvxykwb53JlPD6m7M3YIHmAvoTVf2kGzcmbe1wFh7Jg1CHNwqyseLPmM11fyizUwg==
X-Received: by 10.46.71.144 with SMTP id u138mr567699lja.20.1470827668223;
	Wed, 10 Aug 2016 04:14:28 -0700 (PDT)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id
	o10sm7393650lfo.47.2016.08.10.04.14.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 10 Aug 2016 04:14:26 -0700 (PDT)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 10 Aug 2016 13:14:24 +0200
Message-Id: <1470827664-19568-1-git-send-email-ricardo.ribalda@gmail.com>
X-Mailer: git-send-email 2.8.1
Subject: [meta-oe][PATCH] imagemagick: Add missing dependency
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
X-List-Received-Date: Wed, 10 Aug 2016 11:14:30 -0000

graphviz is an optional library, but I did not find the correspondent
with/without configure option. Instead I think that it is safer to add
is as a DEPEND.

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
 meta-oe/recipes-support/imagemagick/imagemagick_6.9.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_6.9.2.bb b/meta-oe/recipes-support/imagemagick/imagemagick_6.9.2.bb
index a9f01344a9ff..3dc48ad425c6 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_6.9.2.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_6.9.2.bb
@@ -3,7 +3,7 @@ SECTION = "console/utils"
 LICENSE = "ImageMagick"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0887b670be7ef0c3cb37092b64d57514"
 # FIXME: There are many more checked libraries. All should be added or explicitly disabled to get consistent results.
-DEPENDS = "lcms bzip2 jpeg libpng librsvg tiff zlib virtual/fftw freetype"
+DEPENDS = "lcms bzip2 jpeg libpng librsvg tiff zlib virtual/fftw freetype graphviz"
 
 # Important note: tarballs for all patchsets within a version are deleted when
 # a new pachset is created. To avoid multiple patches for each patchset, try to
-- 
2.8.1


