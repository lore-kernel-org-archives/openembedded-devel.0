Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
	[209.85.221.46])
	by mail.openembedded.org (Postfix) with ESMTP id B5D2E79490
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Oct 2018 19:25:16 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id n1-v6so7373946wrt.10
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Oct 2018 12:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=Q3bWTc9u1Yvpg2jlb6dVw7sjUNcG2Z5gvHmNBZN3Ylc=;
	b=N4aq9ACOiYUbHz3Zk+m9UeVvSvHnQlRl7QdH7ovVmXTzbBUH5suUOgb+hutoKdSDfU
	mrFPxnRTrSgaFomNMAV5BZ/imICgBn6LgafdW5AvJaa76wiv/BNdbijJxM/51QNJzmhh
	3rXdst0vrSGmitpi51M6Yeb4sO8URMtYKqzMwFJGNCWgIqPzT4tHdDHA1MWGCdmP11Me
	6VoKo6QL0z1vQ0+TqkA62ogpDc76PBap9Vjy53LoGJfGH8m/up837nWaS7fYrmhFDFi9
	hxO+KX5pCYrPSg4JcMmSiZPyi4ZOEPRJ+xIPqtYKG3nZlONWxd6rQejGJDuMsIy2UEau
	zuvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Q3bWTc9u1Yvpg2jlb6dVw7sjUNcG2Z5gvHmNBZN3Ylc=;
	b=clbvbJQ/dX/2E7QmEnPMwMEHiWavN6NebH9S55Zh9wZF5pZDYq0d96bH5W8IULATp3
	wbKwA8m1gy0sGOBizlSf3oaHkMuQ0/BGMTS0k2ZqNPOi3VxhLdcAGy9qlliMQ+Hd214Z
	C7MuF4Oth3f/Q8pZmg1+seQkDB00QLGTKuiBJzZduIVPCjyaOH6tE3F+JagAPFmMb5lM
	OzFJRDNYEy0RRFZaRamV3oGZUDrQu99+0eIpa3/oLjl+sGThDfOcRu29PMZfWJg1WrfT
	RDUnUoReVGp3I2NXAwpwPI7YuwgojX4Uhhs9CrVJzCTEKfEvrzVoBWdRHv4+nynm41f+
	QpBg==
X-Gm-Message-State: ABuFfoh1fflxYuAypKD+uA/3LhFFfWnTysCN1eCalYOdEEFTeJOhqNri
	gB2RGvs+VXUjBhlmocg9leQw9wJ6
X-Google-Smtp-Source: ACcGV60hU2qTFiD9lk2WMMb2Yaq+9tEkF6lfmDRh8f3HMkp9V1Es9XJR/vM5isMSZOVAqZemPigTpw==
X-Received: by 2002:adf:9069:: with SMTP id
	h96-v6mr2279895wrh.65.1538594717114; 
	Wed, 03 Oct 2018 12:25:17 -0700 (PDT)
Received: from localhost.localdomain
	(p200300F07BC1EA401E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:f0:7bc1:ea40:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id
	143-v6sm3533019wmv.6.2018.10.03.12.25.15
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 03 Oct 2018 12:25:16 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  3 Oct 2018 21:24:50 +0200
Message-Id: <20181003192455.24921-3-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.4
In-Reply-To: <20181003192455.24921-1-schnitzeltony@gmail.com>
References: <20181003192455.24921-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 3/8] poppler: upgrade 0.67.0 -> 0.69.0
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
X-List-Received-Date: Wed, 03 Oct 2018 19:25:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../recipes-support/poppler/{poppler_0.67.0.bb => poppler_0.69.0.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/poppler/{poppler_0.67.0.bb => poppler_0.69.0.bb} (94%)

diff --git a/meta-oe/recipes-support/poppler/poppler_0.67.0.bb b/meta-oe/recipes-support/poppler/poppler_0.69.0.bb
similarity index 94%
rename from meta-oe/recipes-support/poppler/poppler_0.67.0.bb
rename to meta-oe/recipes-support/poppler/poppler_0.69.0.bb
index 210c87112..f7e34cf2a 100644
--- a/meta-oe/recipes-support/poppler/poppler_0.67.0.bb
+++ b/meta-oe/recipes-support/poppler/poppler_0.69.0.bb
@@ -8,8 +8,8 @@ SRC_URI = "http://poppler.freedesktop.org/${BP}.tar.xz \
            file://0001-glib-CMakeLists.txt-Add-libpoppler-to-link-along-wit.patch \
            file://basename-include.patch \
            "
-SRC_URI[md5sum] = "bcfbdcaca2a1f72435e4aaa3c06664ca"
-SRC_URI[sha256sum] = "a34a4f1a0f5b610c584c65824e92e3ba3e08a89d8ab4622aee11b8ceea5366f9"
+SRC_URI[md5sum] = "0881d921de62673ab558872dadc2b27b"
+SRC_URI[sha256sum] = "637ff943f805f304ff1da77ba2e7f1cbd675f474941fd8ae1e0fc01a5b45a3f9"
 
 DEPENDS = "fontconfig zlib cairo lcms glib-2.0"
 
-- 
2.14.4


