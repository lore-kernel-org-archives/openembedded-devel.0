Return-Path: <shantanu@senic.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 88B2578678
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Dec 2017 03:50:51 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id f12so3554300pgo.5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Dec 2017 19:50:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=senic-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=xYmLtAqz6Lu12m3vqtnbKDMy4QT2QvNpL48k8QoMBGM=;
	b=HCx7pY+2iOHBoTsK9BFRp/RBbjVBjkgltL4oqpIgDN8N5S7s/zM7BQcPbDW7ZkYiMU
	lLD22BOW7J8AhRi9curkvuC4I5dFvn2HEe7Qsd5Z2CoycbiGsdLSqcCJ+hd/sujgOKYY
	88wf2E84xdqTawuDfqMiplzEmPQbZHLsPdxw8Pf91oQP0LOxBcoF9+u/MTg4WA3+u9h8
	15tcdgILcJ5Ov9nj2FXbHKgRM9Wv6DDSABvZ98CLl2Do8R836Pe1Py8kg+/pNYXVK82N
	pSjA2t1YcYLF08FXZWhdZ8tOYhJTCUtyjUeNNGNdjJsCTZkOYHBH5RNQFIGDKk5EeD9G
	5tiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=xYmLtAqz6Lu12m3vqtnbKDMy4QT2QvNpL48k8QoMBGM=;
	b=OW3G2uMTP+9e32NkzdqPRavKUVbTNFDmJqWiRurMMZRWD88tUmp/an949pl59Ri4l+
	cu+8J0vbRHQJxWRXFJu/fzUd+aHOkAAyOmeTVdC9LvgimWdWzOXV5aJjMqkSaPXvRNyk
	tpbHTDMvi0vS817QqxpZwam0+hpBF/xBq6sq9uj87jYoNF87iBIYKQ8vyOmhocd/iZJn
	bpNWE6GiRUX7Ur0wnDxLhK/u1bczR8zQeMth8EbKVxcEIZbdQciaTHN9A3xYjOvqghOR
	Tb2Q7x6NzrAM6dq+b6ggSdr1e+K019HBmFZcE2616171/5HfEyhX63C15w5he/UCG/ct
	VvVQ==
X-Gm-Message-State: AJaThX5XmpD6e4/sw0sO3VYCdL6STitG1gntxNDXs5G1TFmaW+EI92av
	Fgzahg3ZrtkELsKlIdMp6oPuTVVM
X-Google-Smtp-Source: AGs4zMY+LQrbU7yyKhqu3wsSDEjBz2PNAE56tcz/znYhOfEMvLwgLQaOn4mhpj/3FlOIFvASht/sdQ==
X-Received: by 10.99.119.15 with SMTP id s15mr23159240pgc.90.1512618652325;
	Wed, 06 Dec 2017 19:50:52 -0800 (PST)
Received: from matar-kulcha.domain.name ([59.92.138.162])
	by smtp.gmail.com with ESMTPSA id
	s11sm6036894pgn.80.2017.12.06.19.50.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 06 Dec 2017 19:50:51 -0800 (PST)
From: Shantanu <shantanu@senic.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  7 Dec 2017 09:20:37 +0530
Message-Id: <20171207035037.6093-1-shantanu@senic.com>
X-Mailer: git-send-email 2.14.1
Subject: [PATCH] nghttp: cleaned up the recipe
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
X-List-Received-Date: Thu, 07 Dec 2017 03:50:51 -0000

Fixes in the recipe as suggested by Andre in the comments here:
http://lists.openembedded.org/pipermail/openembedded-devel/2017-October/115154.html

Signed-off-by: Shantanu <shantanu@senic.com>
---
 meta-oe/recipes-support/nghttp2/nghttp2_1.26.0.bb | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/meta-oe/recipes-support/nghttp2/nghttp2_1.26.0.bb b/meta-oe/recipes-support/nghttp2/nghttp2_1.26.0.bb
index 3e6b10a43..3ccd486be 100644
--- a/meta-oe/recipes-support/nghttp2/nghttp2_1.26.0.bb
+++ b/meta-oe/recipes-support/nghttp2/nghttp2_1.26.0.bb
@@ -1,16 +1,13 @@
 SUMMARY = "HTTP/2 C Library and tools"
 HOMEPAGE = "https://nghttp2.org/"
 SECTION = "libs"
-
-DEPENDS = "pkgconfig cunit zlib openssl libxml2 jansson c-ares"
-
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+LIC_FILES_CHKSUM = "file://COPYING;md5=764abdf30b2eadd37ce47dcbce0ea1ec"
 
 SRC_URI = "https://github.com/nghttp2/nghttp2/releases/download/v${PV}/nghttp2-${PV}.tar.bz2"
 SRC_URI[md5sum] = "926f07ad3b50f38f7d8935ced04716cf"
 SRC_URI[sha256sum] = "0df4229f4123b5aa96e834ebcfdffe954e93d986f0252fd10123d50c6f010983"
 
-inherit cmake pythonnative python-dir
+DEPENDS = "libxml2 openssl zlib jansson cunit c-ares"
 
-EXTRA_OECMAKE = ""
+inherit cmake pythonnative python-dir
-- 
2.14.1


