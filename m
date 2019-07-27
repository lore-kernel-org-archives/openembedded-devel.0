Return-Path: <brgl@bgdev.pl>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 6805C7F1E3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Jul 2019 20:30:22 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id f17so50263270wme.2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Jul 2019 13:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=HbrVCCNNJdFMEppRuQcOrK/0HtdaXC4KwnVMZORdSvk=;
	b=QwQxBEGiPq5TXEFJ6/VnIaYZ/vPS7YVahijNxLs1R7qad6UbtOgaKWZIypffqHETJ3
	VEeugodlJ7s3SQim+dz0+9YENCuRbqqlpbin+r0jDOD66fBH86aytwAZYIebXqRJd3S/
	jYtn2VpqoKyBhO5jwjpVX35rQGcEzTurvZ1jAcrGAruXIwi4Ai7rrDTrSKY1Oucc81Nj
	l0VBQpmsc1lEXRzeqFWP9CKo7TJRHmVMDsQyP649LBUKuOC9Mb8Knc68yxuujuEHbsN2
	/mAw7LIDv+Nvb30SkBkE2X8KRZp+uWc+k2OWLP9x9+CsjQhRuH2j2ecXzJPYeuuoJCXl
	Zq6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=HbrVCCNNJdFMEppRuQcOrK/0HtdaXC4KwnVMZORdSvk=;
	b=gsBAaXiiQslWGK57XbOX+Nnu75SxY/7ZAGNY9BJz01icwomL4DYGBolvgMieSZ6MG/
	Kd+fY5HE1Gls47eu3BjIJCtSOfiL1mwiAn7QFRLGs+pN3Rq58YtC1/NVtrouGYnlPjZT
	tBTQmrpbxgPgM4JqCla035OW6DpoXdHuOXUmQsz/fi5+7hMKIgXaOAPn078/q8L/g5qh
	RllITb0mZP3UA0MO1zh421ONY2rWKhL23TDIq/bIVUf1m+fuToYl/UsKLvDlKmtLIO3f
	KUvGZYs+PbWgVyubr9SnosECD5PVXUHwVMrdQu4nu/ka6Z6gRQbXc9m0AB57l9nnaIL4
	SxGQ==
X-Gm-Message-State: APjAAAUNNGYa5q8eJpZMzvZPHbSN1XEwWzKrymrjL2uZQcO6vaqbPWV2
	xsh63UvDq1wEbJ4NdYBsZCk=
X-Google-Smtp-Source: APXvYqxiL3lnoSelR1C/HuDE9mig1asNct8wldG6af8wAEUX4g0RAw4y/Xe+WF6Ny0REghyZhyyUYA==
X-Received: by 2002:a1c:a101:: with SMTP id k1mr93329968wme.98.1564259422881; 
	Sat, 27 Jul 2019 13:30:22 -0700 (PDT)
Received: from debian-brgl.home ([2a01:cb1d:af:5b00:6d6c:8493:1ab5:dad7])
	by smtp.gmail.com with ESMTPSA id
	n14sm107028610wra.75.2019.07.27.13.30.21
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Sat, 27 Jul 2019 13:30:22 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	openembedded-devel@lists.openembedded.org
Date: Sat, 27 Jul 2019 22:30:20 +0200
Message-Id: <20190727203020.30368-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [meta-oe][PATCH] libgpiod: put gpio utils into an actual separate package
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
X-List-Received-Date: Sat, 27 Jul 2019 20:30:22 -0000
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Currently tools are built conditionally depending on whether the
corresponding PACKAGECONFIG option has been set and, although they
live in a separate libgpiod-tools package, the user cannot simply
select it - he has to additionally extend PACKAGECONFIG. While this
makes sense for python and C++ bindings, the tools don't have any
dependencies other the libgpiod. Make libgpiod-tools an actual
stand-alone package: always build them but install them only if
user selected libgpiod-tools.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 meta-oe/recipes-support/libgpiod/libgpiod.inc | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-support/libgpiod/libgpiod.inc b/meta-oe/recipes-support/libgpiod/libgpiod.inc
index 89679cb91..07ce35a7f 100644
--- a/meta-oe/recipes-support/libgpiod/libgpiod.inc
+++ b/meta-oe/recipes-support/libgpiod/libgpiod.inc
@@ -8,11 +8,9 @@ SRC_URI = "https://www.kernel.org/pub/software/libs/libgpiod/${BP}.tar.xz"
 inherit autotools pkgconfig
 
 PACKAGECONFIG[tests] = "--enable-tests,--disable-tests,kmod udev"
-PACKAGECONFIG[tools] = "--enable-tools,--disable-tools,"
+
+EXTRA_OECONF = "--enable-tools"
 
 PACKAGES =+ " ${PN}-tools"
 
 FILES_${PN}-tools = "${bindir}/*"
-
-RRECOMMENDS_TOOLS = "${@bb.utils.contains('PACKAGECONFIG', 'tools', '${PN}-tools', '',d)}"
-RRECOMMENDS_${PN} += "${RRECOMMENDS_TOOLS}"
-- 
2.21.0


