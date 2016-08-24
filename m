Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id 2C39E6612D
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Aug 2016 18:29:58 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id j37so892822qta.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Aug 2016 11:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=z2wb2VEW4NOaCMvYKqRKqWhva73KDFCwQaBp+aYAAQc=;
	b=yJi5rXTiuqKThUsGqiwZnhSQ4CD1tR4nkgg74qYMGFZ59DRj8WWxpSz3F/vRXwSn6v
	hp9652dbKt6eJtb3GUMfmGur/HbJEvir53C/NtzsRsPsWuqbmrU/zwqMz3XBk3ghZghM
	Fi86Spr6qBKslFI5pycVcCLGbDphrkCMmV2RPKdSAGyYOln8+nN1z5jgwXUbRs0c/89U
	TLyBlJMxlQELZL2CFI3C9jyiS6nS4yR1MmjrGdVkp8fPKdxbK+F8eZosHq/YSab7cfSn
	zdDgBPahQPs/paHaKqtz+MqryxdJBRA4tNGXpWH0Rq1P2k0lxKaSRUZm6y7QNTwHwzxY
	+Ipw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=z2wb2VEW4NOaCMvYKqRKqWhva73KDFCwQaBp+aYAAQc=;
	b=czfe6co6rhiWskL3w9dtcDTXzPQhQPUKkjwD7123EhbjkGr//OgQnpA1JVFPHtcn9a
	VcXjdCQWCwH7xokiNL/xFngxf/flRI3aVNvZ8na/dZ6jBo+R+R+nE2lP059H8Oyp2XcF
	G7goalltSf9ajf1HRpyT/mTyOKtWbwPU0QIV5JRmHxs/hYZlyEGL8/Fvh+Z5QMHYeUOC
	HbDOYk7t78AdTPIgoDU4YCFafFEGGE4l4K24HdwarQOx/40pUE2A+L2/BBnrz9X5fXxg
	NaujJ/Li2mjhDvjr4EdiNv4ELYgmrSEtBnZ9wOfxgkekGHql1FiKIPXVs78xl6ajJVTU
	B0HA==
X-Gm-Message-State: AE9vXwM1CI2sIy09geHz16ZmvZQ/wVantOcM3o8j9FV5O3kidfJHH4G56it445OjDNod4w==
X-Received: by 10.200.54.28 with SMTP id m28mr5143442qtb.87.1472063399083;
	Wed, 24 Aug 2016 11:29:59 -0700 (PDT)
Received: from eos.sys.comcast.net (a-96-118-179-133.sys.comcast.net.
	[96.118.179.133]) by smtp.gmail.com with ESMTPSA id
	o65sm3240639qkc.48.2016.08.24.11.29.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 24 Aug 2016 11:29:57 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 24 Aug 2016 18:29:52 +0000
Message-Id: <1472063392-11490-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-oe][PATCH] imagemagick: Upgrade 7.0.3 release to patch level 9
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
X-List-Received-Date: Wed, 24 Aug 2016 18:30:01 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/imagemagick/imagemagick_7.0.2.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.2.bb b/meta-oe/recipes-support/imagemagick/imagemagick_7.0.2.bb
index 472e42d..604a848 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.2.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.0.2.bb
@@ -8,11 +8,11 @@ DEPENDS = "lcms bzip2 jpeg libpng librsvg tiff zlib virtual/fftw freetype"
 # Important note: tarballs for all patchsets within a version are deleted when
 # a new pachset is created. To avoid multiple patches for each patchset, try to
 # update to the last pachset of a version
-PATCHSET = "7"
+PATCHSET = "9"
 SRC_URI = "http://www.imagemagick.org/download/releases/ImageMagick-${PV}-${PATCHSET}.tar.xz \
 "
-SRC_URI[md5sum] = "bd66b19bd6fc3d320bd8d51869c874f9"
-SRC_URI[sha256sum] = "1168f44cfcd1243acda6bb9663f5d9b3a4bca2acd372e979b97b58ecf5c713e2"
+SRC_URI[md5sum] = "2720ab8c480019f79e717b0237570311"
+SRC_URI[sha256sum] = "22df4f197985f36f77b7b0d44de92ff44415885045f0191b3319540bdc82ff53"
 
 S = "${WORKDIR}/ImageMagick-${PV}-${PATCHSET}"
 
-- 
1.9.1


