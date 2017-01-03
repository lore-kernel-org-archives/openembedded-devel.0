Return-Path: <oleksandr.kravchuk@pelagicore.com>
Received: from mail-wj0-f180.google.com (mail-wj0-f180.google.com
	[209.85.210.180])
	by mail.openembedded.org (Postfix) with ESMTP id 263DD60750
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Jan 2017 08:57:34 +0000 (UTC)
Received: by mail-wj0-f180.google.com with SMTP id c11so234907006wjx.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Jan 2017 00:57:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=pelagicore-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=nOOjCjvhdE7BVf+Pa4n5neSHzq84v8BQe2AAwN89lvs=;
	b=MqSNAHlfWn2YudqVnEm12Ab4LIvEGx/XiiLBT/z2ndRuNDnkayi4xRN5yA9GrU/7W/
	9bWDeRVlLlfMwvB0sDuUAFo1+ykYHzuUviZr3ewHBwKKXKlt37i0M7xGkIwGNto0VJQq
	ttkwskdQO2N12H/eR90GrYoy6JxnlAMC0zDVPz+SEfwa6Rjim9Gw+BD7DRpakfblez9r
	YxH0WegizSiCF4mSEnhSDGc+O8u9NrK73XinIy6Xg4Tm0F7hqNQrlUyZytVPG+1I1QOY
	JCFeWJFzVenIa2DuLpgQjLJvnDvRFBjbGEGCI2D9DsHkaM2LPoHtQJW14R1jE/rJna3l
	j5Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=nOOjCjvhdE7BVf+Pa4n5neSHzq84v8BQe2AAwN89lvs=;
	b=q8EscE6OmGmcmCOtCqdhWuLiqO2fA4noXGdD+yxGVSnuRgLD1Gaxo7X5mTasWQx1f0
	+NjV1FM4OsvsdDEVYivkud63THEWHXt2GsRw5qWV2tFHOnoMul3AUbMBbwYWEIE3DqIX
	/TXrGH9bFyZWArK8UVQXDZWmkSwvAemLzLBRC0qvdZ9baqTmL1me9Jf3nTc4bkTgwbfb
	zddpoqenxhFYvpGr+7CEBGBjPvYCUEGe+KIKZRdzu+ewqf9ELuEsMqJb2jlswziwLgLg
	57QZTBPuoU28wK4mOUl3/SUSSfnbZTNZtkjVy+qD5ZXlpF+cMgHF5tHn4ejJR4KWiXz4
	NyZg==
X-Gm-Message-State: AIkVDXI8F2+zYn7fOdv9QEfIytMkEE+HqjrjhjWh+4QhVGftLB1VxRcqYPEWyYx9pBgw+PFp
X-Received: by 10.194.81.233 with SMTP id d9mr64712649wjy.118.1483433854834;
	Tue, 03 Jan 2017 00:57:34 -0800 (PST)
Received: from stout.office.pelagicore.net ([83.218.80.242])
	by smtp.gmail.com with ESMTPSA id
	wp2sm53983206wjc.35.2017.01.03.00.57.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 03 Jan 2017 00:57:34 -0800 (PST)
From: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  3 Jan 2017 09:57:21 +0100
Message-Id: <1483433841-18258-1-git-send-email-oleksandr.kravchuk@pelagicore.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-devtools][PATCH] nodejs: upgrade to 4.7.0
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
X-List-Received-Date: Tue, 03 Jan 2017 08:57:36 -0000

Section with information regarding few third-party components has been
removed from the LICENSE file:
https://github.com/nodejs/node/commit/f7c4e9489f0d72533.

Signed-off-by: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
---
 .../recipes-devtools/nodejs/{nodejs_4.6.1.bb => nodejs_4.7.0.bb}    | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-devtools/nodejs/{nodejs_4.6.1.bb => nodejs_4.7.0.bb} (94%)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_4.6.1.bb b/meta-oe/recipes-devtools/nodejs/nodejs_4.7.0.bb
similarity index 94%
rename from meta-oe/recipes-devtools/nodejs/nodejs_4.6.1.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs_4.7.0.bb
index 574d50a..54d6829 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_4.6.1.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_4.7.0.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "nodeJS Evented I/O for V8 JavaScript"
 HOMEPAGE = "http://nodejs.org"
 LICENSE = "MIT & BSD & Artistic-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=8e3c01094f0fcb889b13f0354e52f914"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=f45e9ffb97e64da46d14f462d34a039f"
 
 DEPENDS = "openssl zlib"
 
@@ -12,8 +12,8 @@ COMPATIBLE_MACHINE_mips64 = "(!.*mips64).*"
 SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz \
     file://no-registry.patch \
 "
-SRC_URI[md5sum] = "4f70295e3eebef1f998fa38456263eaf"
-SRC_URI[sha256sum] = "fe2a85df8758001878abb5bbaf17a6b6cdc12b3e465b1d3bace83b37fdf0345a"
+SRC_URI[md5sum] = "f4a7ca6912d0688b37712bb09b65d2d4"
+SRC_URI[sha256sum] = "b03c777ba8817a8478d57f00797db86dc7e7953d2066c34edbceeba8ad056142"
 
 S = "${WORKDIR}/node-v${PV}"
 
-- 
2.7.4


