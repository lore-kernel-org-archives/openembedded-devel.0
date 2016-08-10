Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 5C11F771DB
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Aug 2016 11:14:44 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id q128so8864124wma.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Aug 2016 04:14:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=KMuF7bT+bC0Vw+/e924w7WxRK9w0JzT13P8D6anM+5k=;
	b=AIEXLNhVFxIdFbUv3aTdD0G3fNSKFgkvUXOpW69Yx0DZW2uiAM0+QtRYp5z+XRN4Pe
	kSglXXGzRjvsUxyuhg3y5Qb5fT39oWFyClpDclstZnsOT6xVOkl0/53El2eph/fD6pmD
	zfLTCv6B3w5OFDE61T2Jt7HLcFn8JTktkRDl949uWfGpCg2/Q704FllGUvpK5+FaPP1h
	Tz5LR9scvJXzl6mSscXSkT5/9dKyeblAUD8TXAcJwGwYUZIYHqmqtbptm/KoaeDPuaKr
	02PZBRcqBBQRnx7a57s3HprtieoVO5rwscwsKMGyUA0fCYEOkEfZE0V1SuDDJ9l4X8NM
	BHQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=KMuF7bT+bC0Vw+/e924w7WxRK9w0JzT13P8D6anM+5k=;
	b=XJGwwCfJy/L+32Z7MPTZH3ITRHGMgzMxUh7eENddqfKb7NzgZ75CXbjezPZYPNUnRx
	HhwBan/aa6V0YWuNq9jIln5EjUpWcUH0aJQ9kJO5c2YWP+4YsomiXt4kmrZFn5be5v11
	S6bwimAB2e+XvNNlnXo2WaD7oiRh7HF4bEKuVKirsrghqCCSL5cnLyrgShVfZOb1JwrS
	Dek5tahdgo6BMi2UDjgVkmqD3KZicwpWDQpDxRXFfuSg6R5CahogDvfjJpcDV5KCHCzg
	QgSk3oeO1bH3wEcPctXp9QXmC03VIaDA7fHMEgc2qIAVTVSFwF+LhMv/GDGh+rgYToLk
	mX3A==
X-Gm-Message-State: AEkoouvIjgFIF7xRDcmk8O+XTH3aOnIIUM15FMKSTaApThtuDG4PVEmB2DpDZJLhXcs0Jw==
X-Received: by 10.25.157.19 with SMTP id g19mr620148lfe.216.1470827683406;
	Wed, 10 Aug 2016 04:14:43 -0700 (PDT)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id g3sm7548638lfe.14.2016.08.10.04.14.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 10 Aug 2016 04:14:42 -0700 (PDT)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 10 Aug 2016 13:14:37 +0200
Message-Id: <1470827677-19644-1-git-send-email-ricardo.ribalda@gmail.com>
X-Mailer: git-send-email 2.8.1
Subject: [meta-oe][PATCH] glog: Add missing dependency
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
X-List-Received-Date: Wed, 10 Aug 2016 11:14:44 -0000

Fixes:

WARNING: glog-0.3.3-r0 do_package_qa: QA Issue:
/usr/lib/libglog.so.0.0.0 contained in package glog requires
libgflags.so.2()(64bit), but no providers found in RDEPENDS_glog?
[file-rdeps]

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
 meta-oe/recipes-support/glog/glog.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/glog/glog.inc b/meta-oe/recipes-support/glog/glog.inc
index 8a1fb4250bbb..503904164312 100644
--- a/meta-oe/recipes-support/glog/glog.inc
+++ b/meta-oe/recipes-support/glog/glog.inc
@@ -6,6 +6,6 @@ HOMEPAGE = "https://code.google.com/p/google-glog/"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=dc9db360e0bbd4e46672f3fd91dd6c4b"
 
-DEPENDS = "libunwind"
+DEPENDS = "libunwind gflags"
 
 inherit autotools pkgconfig
-- 
2.8.1


