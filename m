Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id D2C5B700F3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Aug 2016 14:13:29 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u7UEDUs0004392
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Aug 2016 07:13:30 -0700
Received: from [172.25.44.6] (172.25.44.6) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 30 Aug 2016 07:13:29 -0700
To: <openembedded-devel@lists.openembedded.org>
References: <1472063392-11490-1-git-send-email-raj.khem@gmail.com>
	<e6c87ae1-ca1d-895c-adb3-6c2b75abaaa9@embed.me.uk>
	<CAMKF1spmR94=-VGMJD0LGTLASWeOyq-wt-KM4p0Ut-vowzYcDA@mail.gmail.com>
	<22beaaca-b392-3971-3125-1f579b79e186@windriver.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <53c6d742-152e-53a9-87cc-7fda239b8cb9@windriver.com>
Date: Tue, 30 Aug 2016 10:13:28 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <22beaaca-b392-3971-3125-1f579b79e186@windriver.com>
X-Originating-IP: [172.25.44.6]
Subject: Re: [meta-oe][PATCH] imagemagick: Upgrade 7.0.2 release to patch level 10 from github
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
X-List-Received-Date: Tue, 30 Aug 2016 14:13:30 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

 From 6341ee0be48ee0fea13745e12e6b237947cc82b6 Mon Sep 17 00:00:00 2001
From: Randy MacLeod <Randy.MacLeod@windriver.com>
Date: Mon, 29 Aug 2016 20:00:28 -0400
Subject: [PATCH] imagemagick: use patchlevel 10 from github

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
  meta-oe/recipes-support/imagemagick/imagemagick_7.0.2.bb | 8 ++++----
  1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.2.bb 
b/meta-oe/recipes-support/imagemagick/imagemagick_7.0.2.bb
index 472e42d..185f492 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.2.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.0.2.bb
@@ -8,11 +8,11 @@ DEPENDS = "lcms bzip2 jpeg libpng librsvg tiff zlib 
virtual/fftw freetype"
  # Important note: tarballs for all patchsets within a version are 
deleted when
  # a new pachset is created. To avoid multiple patches for each 
patchset, try to
  # update to the last pachset of a version
-PATCHSET = "7"
-SRC_URI = 
"http://www.imagemagick.org/download/releases/ImageMagick-${PV}-${PATCHSET}.tar.xz 
\
+PATCHSET = "10"
+SRC_URI = 
"https://www.github.com/ImageMagick/ImageMagick/archive/${PV}-${PATCHSET}.tar.gz\
  "
-SRC_URI[md5sum] = "bd66b19bd6fc3d320bd8d51869c874f9"
-SRC_URI[sha256sum] = 
"1168f44cfcd1243acda6bb9663f5d9b3a4bca2acd372e979b97b58ecf5c713e2"
+SRC_URI[md5sum] = "bd8886ed5fa8553b09a4565e10bea162"
+SRC_URI[sha256sum] = 
"0fef845d3516a2c41047aff8bf19bd812dd94cf74d1f4c9a423e8fc422981b0e"

  S = "${WORKDIR}/ImageMagick-${PV}-${PATCHSET}"

-- 
2.7.4



