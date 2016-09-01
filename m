Return-Path: <twoerner@gmail.com>
Received: from mail-it0-f66.google.com (mail-it0-f66.google.com
	[209.85.214.66])
	by mail.openembedded.org (Postfix) with ESMTP id 4E77F6FF84
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Sep 2016 13:42:58 +0000 (UTC)
Received: by mail-it0-f66.google.com with SMTP id i184so5592752itf.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Sep 2016 06:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=1dTxryo1+mua9L32/WgTwDgZfY1GCxacefJBNc9FCKY=;
	b=KJEtlUaoXNaMHJZ0AMOsFXl/J526Qj8nW9ZziTclInEHxW4MALN4cg6japeubjcNBS
	ni88HTvzZ7NGoG7zimScTOJ6ht7JMTmGsqjuvlFRaO820PGcGtNqn/JQKkhSQQVAU87K
	Iga789t6v7mZZ5+BjcX/kyeJRP7A8QJxWbGKn8PzyE0+GIR8Kovuuu18eWmpFbF5a9hI
	qCNeQQZa3JBATntFx1UpB+bvUvIr928EVRpSjlq1hunDzfEQTYNyZSR14fd5MwFnfB/U
	Au8rSfCfyaXdQClpNVUyRnx5ejMDge1YNe2jJMBMkyHOibgfll7RQLffdpMfga54sMSr
	KgCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=1dTxryo1+mua9L32/WgTwDgZfY1GCxacefJBNc9FCKY=;
	b=KqcfpIBMFQO7vR+DJxcXhlDiE2Kl7EtkUFCa6MjZ1uK5heoLThxmO0TLQu4niYaiPW
	7oTzS1EVpqRCL63oZV1Dold+CzfbFmJXkuGxaFJdVOwh2gq/5faqHQBuBSpb+q1odmTp
	A+e1scuHgOlBosZNc2FITj9+HtZHyFnMN/PtLgQ7RWLB/3EwSxoDmjfcn/v+nkZYQlNN
	VFw0J48yUnlxm/BpLSMpVu0qRJCWijx4r1U0SMUiQ4v5jK6YXFgwYi3BBxadehK78qHT
	XofOjSEEQjYWybYTWyMdW3J6aVm3EVIezoDqIxddmeH0730w9ioSGN1rzPSyIw3l6b1v
	wRxg==
X-Gm-Message-State: AE9vXwO6ZkyvFoNK4aCG53ej+beuXRZuPcy+LGAMpAiizjxylRewy8PHklZA2QGfAcNdCQ==
X-Received: by 10.36.19.209 with SMTP id 200mr20364052itz.83.1472737379067;
	Thu, 01 Sep 2016 06:42:59 -0700 (PDT)
Received: from openSUSE-i7.site ([45.72.199.207])
	by smtp.gmail.com with ESMTPSA id
	h63sm15990991ita.12.2016.09.01.06.42.51
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 01 Sep 2016 06:42:53 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  1 Sep 2016 09:42:40 -0400
Message-Id: <20160901134240.5272-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.9.2
Subject: [meta-oe][PATCH] imagemagick: upgrade patchset
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
X-List-Received-Date: Thu, 01 Sep 2016 13:42:59 -0000

...from 7.0.2-7 to 7.0.2-10.

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 meta-oe/recipes-support/imagemagick/imagemagick_7.0.2.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.2.bb b/meta-oe/recipes-support/imagemagick/imagemagick_7.0.2.bb
index 472e42d..adfcf55 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.2.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.0.2.bb
@@ -8,11 +8,11 @@ DEPENDS = "lcms bzip2 jpeg libpng librsvg tiff zlib virtual/fftw freetype"
 # Important note: tarballs for all patchsets within a version are deleted when
 # a new pachset is created. To avoid multiple patches for each patchset, try to
 # update to the last pachset of a version
-PATCHSET = "7"
+PATCHSET = "10"
 SRC_URI = "http://www.imagemagick.org/download/releases/ImageMagick-${PV}-${PATCHSET}.tar.xz \
 "
-SRC_URI[md5sum] = "bd66b19bd6fc3d320bd8d51869c874f9"
-SRC_URI[sha256sum] = "1168f44cfcd1243acda6bb9663f5d9b3a4bca2acd372e979b97b58ecf5c713e2"
+SRC_URI[md5sum] = "e1cb23d9c10a8eff228ef30ee281711a"
+SRC_URI[sha256sum] = "dad306bfd7730e1665c6fdb6eb478fb2c41e2db71ab56451bbaebe9df546b1d2"
 
 S = "${WORKDIR}/ImageMagick-${PV}-${PATCHSET}"
 
-- 
2.9.2


