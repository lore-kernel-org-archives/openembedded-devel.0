Return-Path: <twoerner@gmail.com>
Received: from mail-it0-f48.google.com (mail-it0-f48.google.com
	[209.85.214.48])
	by mail.openembedded.org (Postfix) with ESMTP id 6FC8474C0D
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 May 2018 18:27:20 +0000 (UTC)
Received: by mail-it0-f48.google.com with SMTP id j186-v6so3634009ita.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 May 2018 11:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=pS+4hb89aZhYlyfkmMVGsnczAMbl6tAgQEFyz9SMAG8=;
	b=jJCTnGkC8GdodxAgpv+JX2zt3GAqnFq1nPg9ROjrzGjkKCO6tJhuGmUkBpg8ZwRP6S
	K/tA3ZbtYBKD0dPw7AkT3ReabPq/6pZ7bSiEnevfGVgDWXaI44phyMc4Hvu0Eq7mL95S
	1+xmQc9Dmu+8LvH3n0CKEDI9s+TKIoauxpMKAU18fP2hi/SUHrDpJAotlK5LGTXxnEHM
	SR+zLD6wShwSQbh45D/4LzsVRyMpZpU/I/MoMSeg74rJRlrk16sLbQDCGPKlfJ/CcHzm
	CEXoWCgraqhKCMEu8QGWXuiO4UxmFmQzRdhN7zCKDGlp8Vd+sAqtH3/ef2fPnpBwqBQi
	nCCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=pS+4hb89aZhYlyfkmMVGsnczAMbl6tAgQEFyz9SMAG8=;
	b=gEDqiaHENMrHsMJ3VB8+YFdVSGpU3jJTf3J1dO0P7glcmxgynWApGl6gtfN/cz7ymY
	NHlqNJRivT7VJYfMowq/aajKZn2X2FBTjHNPDAm1OxJAdrdhiHU78bGl+jm7nBFhE3on
	NjAVHi7Hv8XB/KG8ban7t5E13vkUuiXAaDuMNj8+Js/F0d5ZO9dBEOZVOR0dU6vzrGTd
	uoY2DZH9chAe/UFFeA/bULv6eGrhLQhfiE/pqRru2DzjrBZJvHxALC/vOn/RPDoRaD87
	fsIJMOfyXKMgLtPfFiqnEJie1g9pm7+o29Wn5eTZhk3EpqbSKm8wKqAXYQ0TgFmPCh6V
	jK+A==
X-Gm-Message-State: ALKqPwdwC91V9V668St5xwCuZLkwiRDTtpByBMFgkDti+2O6klvpDPIU
	YXI3VMsUJXzEiUoEp0m+Bla0EOSM
X-Google-Smtp-Source: AB8JxZrGAnqCJ0gjAiVammk5sxLY1krH5JqMma/FYO6JXBjCrcUIeDup4A0m87sITAPh1CB53ixa1w==
X-Received: by 2002:a24:6d86:: with SMTP id
	m128-v6mr10943644itc.75.1527186441793; 
	Thu, 24 May 2018 11:27:21 -0700 (PDT)
Received: from linux-uys3.suse ([206.248.190.95])
	by smtp.gmail.com with ESMTPSA id
	o1-v6sm2746196ite.37.2018.05.24.11.27.20
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 24 May 2018 11:27:20 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 24 May 2018 14:26:54 -0400
Message-Id: <20180524182659.19986-7-twoerner@gmail.com>
X-Mailer: git-send-email 2.17.0.582.gccdcbd54c
In-Reply-To: <20180524182659.19986-1-twoerner@gmail.com>
References: <20180524182659.19986-1-twoerner@gmail.com>
Subject: [meta-oe][master-next][PATCH 06/11] openjpeg: variable cleanup
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
X-List-Received-Date: Thu, 24 May 2018 18:27:21 -0000

Reorder recipe variables according to:

	https://www.openembedded.org/wiki/Styleguide

Originally-conceived-by: Andre McCurdy <armccurdy@gmail.com>
Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 meta-oe/recipes-graphics/openjpeg/openjpeg_2.2.0.bb | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-graphics/openjpeg/openjpeg_2.2.0.bb b/meta-oe/recipes-graphics/openjpeg/openjpeg_2.2.0.bb
index f749d62342..22b75d9623 100644
--- a/meta-oe/recipes-graphics/openjpeg/openjpeg_2.2.0.bb
+++ b/meta-oe/recipes-graphics/openjpeg/openjpeg_2.2.0.bb
@@ -1,9 +1,10 @@
 DESCRIPTION = "OpenJPEG library is an open-source JPEG 2000 codec"
 HOMEPAGE = "http://www.openjpeg.org"
-
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c648878b4840d7babaade1303e7f108c"
 
+DEPENDS = "libpng tiff lcms zlib"
+
 SRC_URI = "https://github.com/uclouvain/${BPN}/archive/v${PV}.tar.gz;downloadfilename=${BP}.tar.gz \
            file://0001-bmp_read_info_header-reject-bmp-files-with-biBitCoun.patch \
           "
@@ -12,8 +13,6 @@ SRC_URI[sha256sum] = "6fddbce5a618e910e03ad00d66e7fcd09cc6ee307ce69932666d54c73b
 
 inherit cmake
 
-DEPENDS = "libpng tiff lcms zlib"
-
 # standard path for *.cmake
 EXTRA_OECMAKE += "-DOPENJPEG_INSTALL_PACKAGE_DIR=${baselib}/cmake \
                   -DOPENJPEG_INSTALL_LIB_DIR:PATH=${libdir}"
-- 
2.17.0.582.gccdcbd54c


