Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web10.2296.1620753244068976660
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 May 2021 10:14:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20150623.gappssmtp.com header.s=20150623 header.b=aq2SwXR3;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.49, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f49.google.com with SMTP id t18so20917376wry.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 11 May 2021 10:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RvNTgit6ZrYtFm6rk+eRyLzWfRnrDsVDqA773hMpqg0=;
        b=aq2SwXR3ttqCEVATC0RAobOrtjck4fZkvzQPwNHChwKoB0ev6I6xPNn+s1MSdlS5RA
         t6xpUa294YsPn6QgvUiq3nleYFkHHpF9q5ZMTZLv/oEqFgLHlDmXED5gvKKSos0K4DPH
         Sw4fkT9h45ttMvZFbJ+hZa/P8PuynPmDC5X5r2XDI+lUffo7v9BNPoHEPibZEPPsdlsK
         QJ/2YoI97BEecvcpUcp4SNomOJ8KjDSXlxFE6H8fiMJGCfFJ7q03/QRy9TUCzHP5IgzF
         7QGMWsrlO+/kTbDRFY3boAwK3CcsbmXLUWBpxdqNLfypwwJ469Bg5v598BVGzX7Ip8SC
         bFdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RvNTgit6ZrYtFm6rk+eRyLzWfRnrDsVDqA773hMpqg0=;
        b=JHZskHUnxAeXo6hsAR7br44Lob4X7+6r53MvliR4qXcV/6X13qQea6vK0qtMTOkVPp
         9d0zFvgcgTA8eBkYQo5o8mWcGCEaSARDXqbtWEfkts96hIDdIj+C59pbNLC/dHOTrWNe
         QkPTYWRGOir3NqCJROs8xQDO5O8t39AF562Kg8y5qR9vhuAPA3yBodpPfm0OxPi/kpiq
         8X6qHhdsZ7ffEMPEUHFFpkjsEBTSgm/9RUU8IF97mCKgqKDB09czcywlfXFjCPBCaEJ5
         HYXYqWDmLLKWHbBsA9WrToC77hJN5r4SAnj7dm8gxoapaDcQrDUZxHvztHQz07c2jPQ6
         +r7w==
X-Gm-Message-State: AOAM533jDj/9veCbs0xCXD0AdObCmCJOMZpRdjbgXM+VVbkOrYe/f2+j
	GHQjzlKH/IS5hn+LV3FgZEMzoA==
X-Google-Smtp-Source: ABdhPJwNGSoZzxD3QwDdxGFmheIFm1ZNnno1SGWyTypeAg0XfrHnbv02xyvc0paZZp79BFcbIwFjpA==
X-Received: by 2002:adf:8b09:: with SMTP id n9mr40141733wra.148.1620753242436;
        Tue, 11 May 2021 10:14:02 -0700 (PDT)
Return-Path: <brgl@bgdev.pl>
Received: from debian-brgl.home (lfbn-nic-1-149-6.w2-15.abo.wanadoo.fr. [2.15.231.6])
        by smtp.gmail.com with ESMTPSA id p17sm28401807wru.1.2021.05.11.10.14.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 May 2021 10:14:02 -0700 (PDT)
From: "Bartosz Golaszewski" <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Armin Kuster <akuster808@gmail.com>,
	Tim moto-timo Orling <TicoTimo@gmail.com>,
	Derek Straka <derek@asterius.io>,
	Trevor Gamblin <trevor.gamblin@windriver.com>
Cc: openembedded-devel@lists.openembedded.org,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [meta-python][PATCH] python3-pycocotools: new package
Date: Tue, 11 May 2021 19:13:59 +0200
Message-Id: <20210511171359.4534-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a recipe for building pycocotools - a Python wrapper for cocapi.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 .../python/python3-pycocotools_2.0.2.bb           | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pycocotools_2.0.2.bb

diff --git a/meta-python/recipes-devtools/python/python3-pycocotools_2.0.2.bb b/meta-python/recipes-devtools/python/python3-pycocotools_2.0.2.bb
new file mode 100644
index 000000000..4821c313e
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pycocotools_2.0.2.bb
@@ -0,0 +1,15 @@
+SUMMARY = "COCO is a large image dataset designed for object detection, segmentation, \
+           person keypoints detection, stuff segmentation, and caption generation."
+LICENSE = "BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://pycocotools/coco.py;beginline=45;endline=45;md5=12cb539683cf245df8b6ce782d78f647"
+
+inherit setuptools3 pypi
+
+SRC_URI[md5sum] = "33858f23c8b99ce8116b70c32f6b6dd9"
+SRC_URI[sha256sum] = "24717a12799b4471c2e54aa210d642e6cd4028826a1d49fcc2b0e3497e041f1a"
+
+DEPENDS = "python3-cython-native \
+           python3-numpy-native \
+           libxcrypt"
+
+RDEPENDS_${PN} = "python3-matplotlib python3-pillow python3-profile"
-- 
2.30.1

