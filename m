Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
	[209.85.128.54])
	by mail.openembedded.org (Postfix) with ESMTP id 384717F288
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  8 Aug 2019 14:59:11 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id l2so2763890wmg.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 08 Aug 2019 07:59:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=F+IKScGBNvWXU3rRNrOd+T3K4aJ46cvpGYUdLswiyH4=;
	b=vNi+Hp3ZCg9htxerIG+i9g39ezEsAzAIKJxeYIYfBbJqQQR2Mabnkn8Btv2mu8HH6K
	6yuUb+QTX8ILAOENlxIX8sxdlZrAKQKRRfB1jzExzsNP6KrdMp3W6TNQ/TbEgIZV4Jhj
	JQ1vj5GR8EN0i/8N10MWy1PD1S2AxWXxF+DWj4wVqUrxt7lwaEicsBsmBoXq7ij7Q7wa
	h/HU3r8xHMwJo2urkTEprqCwTEcBKsKLXUtXXiSlFamP6Vgziz3e2yTjKHxmM1OWIhJs
	/THi4NMorbka6tLFTCYNUrxK3InszMmqbNU7G+wO6EGnvjTTfNHP8DHXVs2VFQcNiYZq
	KZyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=F+IKScGBNvWXU3rRNrOd+T3K4aJ46cvpGYUdLswiyH4=;
	b=KQXF6MU2SOK1SbrmEpzRzcn+I7qu6TjwhBcyrwGI5j2E/aTbh3R1cPs75FNrF5Dc55
	lGMBKM+NJWqOPPMW4/3L2cAraaT+tSYwTQsomDZf8akFnsgBtb6rAXYOmfYJIg272cxf
	OPPDtgMC9WxPdAdjwom3dld6XGVCrEcXeu2FuLyhbEuGTgi/NVnqXAIO8izHAsytm2w2
	kwlcqzlyQb0UOEBzmiRYwk5/sMmjNUClrT/jZeCaxx1Xb+yC+dVYNAhQn8LQRQSqhHDX
	8llBXdnxo4lGoRcaVrkkz5ncs2EsbWUhdrmqcjKmil8jym8VcKGyVtZfJ2FcuHTqSOXa
	wAhg==
X-Gm-Message-State: APjAAAUbQVu6EwseUFW+ozDGjhTDkToh55+Z/TCcLUaa/91IcEmkpG8Q
	AEZb85EUgudAOuhWfgotbiGoIJD4LNc=
X-Google-Smtp-Source: APXvYqwjIpxJ8O/mSCtjp3awinxIZtfsemi26O1BGEPOJSykLz8cPFUxThmK+/pJaI+ecE1yeprQ3A==
X-Received: by 2002:a05:600c:54f:: with SMTP id
	k15mr4609089wmc.165.1565276351638; 
	Thu, 08 Aug 2019 07:59:11 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	f3sm79537623wrt.56.2019.08.08.07.59.10
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 08 Aug 2019 07:59:11 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  8 Aug 2019 16:59:06 +0200
Message-Id: <20190808145906.53657-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] python-oauthlib: remove the 2.x version of the recipe
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
X-List-Received-Date: Thu, 08 Aug 2019 14:59:11 -0000

As it requires python-nose, which will be removed from oe-core.

3.x version remains available.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../recipes-core/packagegroups/packagegroup-meta-python.bb    | 2 +-
 meta-python/recipes-devtools/python/python-oauthlib_2.0.6.bb  | 4 ----
 2 files changed, 1 insertion(+), 5 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-oauthlib_2.0.6.bb

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index 34be9d762..e037abf53 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -33,7 +33,7 @@ RDEPENDS_packagegroup-meta-python = "\
     python-robotframework-seriallibrary python-pyalsaaudio python-pytest-helpers-namespace \
     python-alembic python-flask-pymongo python-slip-dbus python-pydbus python-automat python-rfc3987 \
     python-tzlocal python-backports-ssl python-subprocess32 python-asn1crypto python-pybind11 \
-    python-ptyprocess python-babel python-passlib python-oauthlib python-sdnotify \
+    python-ptyprocess python-babel python-passlib python-sdnotify \
     python-lazy-object-proxy python-cryptography-vectors python-crcmod python-pyusb python-vobject \
     python-webcolors python-pyparsing python-beautifulsoup4 python-cffi python-tornado-redis \
     python-itsdangerous python-pyasn1-modules python-netaddr python-vcversioner \
diff --git a/meta-python/recipes-devtools/python/python-oauthlib_2.0.6.bb b/meta-python/recipes-devtools/python/python-oauthlib_2.0.6.bb
deleted file mode 100644
index 4329d21a1..000000000
--- a/meta-python/recipes-devtools/python/python-oauthlib_2.0.6.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-inherit setuptools
-require python-oauthlib.inc
-
-RDEPENDS_${PN} += "${PYTHON_PN}-re ${PYTHON_PN}-lang"
-- 
2.17.1


