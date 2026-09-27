Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAB8AC9830E
	for <webhook@archiver.kernel.org>; Sun, 27 Sep 2026 10:50:12 +0000 (UTC)
Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.35325.1790506211531745597
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Sep 2026 03:50:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Xn7pWcFq;
 spf=pass (domain: gmail.com, ip: 74.125.228.12, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc4d2fe2056so707365a12.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 27 Sep 2026 03:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790506211; x=1791111011; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oOWVBtL1KqAisSOrcy/K4ZhLxsWLi0pn2CH3SThw+6U=;
        b=Xn7pWcFqzqUBCCiaW+PoekNn0wOkf0TdM7lcmZIV0bn21LdcdEA0CCe5AUlfvD/LUr
         wHh6id3nQYerIgufVLIIaGYL10wOhx1F8+mg4HDXWauOqXOcdLX13+UPVd+WW9PVECJM
         9vZ5YhnwuYGET3H+4E/ifTEKc5ywySVbXaBBeiep6dRoJZM3pBd3keiya22FXNov33OE
         bPjWc2IDXS9QdSQe4JV7F8zNB/7OkmkHJyCEz6Z3so7acw49V8Iff3hauAarovt+CPfx
         fW/4UbcHwQvg6nwbvzX+RBWKhAIDFRs1yps+mhbGT2unJpUrqpB/Tx07P0Z7OBXbPtSy
         R8iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790506211; x=1791111011;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oOWVBtL1KqAisSOrcy/K4ZhLxsWLi0pn2CH3SThw+6U=;
        b=wrhYuOQvBJipvjFNGQ4p8zmBcU/PXTLi3F/y6F2YdmJNI1jmaJQB/eOw5O3bvwyqVO
         P7PgFmtO2kvBtzXbM7h8Kvzw+0XBjzdSyVqemvuxNmN5JrFoxukz+LqauFD3zCp35EAI
         kvMI3OCZe3PXM888GMtwlq/hM+00bzmbuMT1KdJBmRw7e6UY7xQlbAzCvx5PQw+k0duh
         PL79w/hqAj1bo2/e6MFslMQJyc6soNUIjmQIMhTlGVJEWzb3mC3Mebf4KJl+gz+Sd9KU
         xPVYL8aX9ox4i8AvYzyKt1AEjgJv6T8DYE8mWEypK9/CGjNkU3TXQfzb5BN4wePLPyHz
         S2hg==
X-Gm-Message-State: AFuF++nZcARQtJSHdeA4JM/uaxa+ykTfmWPIFZQnAmjPkbmwPxVO5gOw
	ZC4YF9sSiAiq61zk0KbFwd4ovBq5ebQF9w1SK3eP2QgfAgjnhi1t9x4ZB9CtsA==
X-Gm-Gg: AYBFou0ht6Lt0H+oQ+oOH4NSDRe/cQbXz/JJTBakJgSejNf1g7gfacn8CO9UCW3/+Cx
	2BXAjnZl2rGAFvlO9/H8R5tQm2ZiaHYZ7fKd6KdEeCESi5ufc97/F9gCorLShiCVbujrysdo2sT
	XzSzFiiGEs86WnSfU3dW9+nowyHpeTs6vgIymse0cereV8vnuvFcNIhjFn6XWAHILW/P+Llb5f5
	Krv8MNY6u8uU8AjeOSIGcwQAFOiIVW3N4Bb9l5HTlYZcfmFmwYMQGiOmk/h0NziBikyGVSrUURG
	LxcfnBGAZRKSvpyknpxvgxnaXaeOzARntD6nZJEAsUWEGvW0fkyPtcQnR1bTKmFUdLFxQun/89u
	N0+fH9d7vk7YraLRp6JnmqW0znI8b3fA3dTzMYMvoSJyOb7p0rcQjjzgno6ednUI0liMTaSyhuD
	rmNmDZzPtTpjfw9vgYDLuPekseUy/CEi3wtxWk5/ZGDQhrEOSd6GQV305C9TNV7dRLU0jhy/7p+
	hriLXtSGBdgdorgJaX7LZI=
X-Received: by 2002:a05:6a00:2346:b0:87c:b126:8e4d with SMTP id d2e1a72fcca58-87e9a70b411mr8134359b3a.3.1790506210705;
        Sun, 27 Sep 2026 03:50:10 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88268c5ed75sm640542b3a.48.2026.09.27.03.50.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 03:50:10 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-gnome][PATCH 1/35] gimp: upgrade 3.2.4 -> 3.2.6
Date: Sun, 27 Sep 2026 23:49:28 +1300
Message-ID: <20260927105002.1832451-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 27 Sep 2026 10:50:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130335

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://gitlab.gnome.org/GNOME/gimp/-/blob/GIMP_3_2_6/NEWS?ref_type=tags

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-gnome/recipes-gimp/gimp/{gimp_3.2.4.bb => gimp_3.2.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gimp/gimp/{gimp_3.2.4.bb => gimp_3.2.6.bb} (98%)

diff --git a/meta-gnome/recipes-gimp/gimp/gimp_3.2.4.bb b/meta-gnome/recipes-gimp/gimp/gimp_3.2.6.bb
similarity index 98%
rename from meta-gnome/recipes-gimp/gimp/gimp_3.2.4.bb
rename to meta-gnome/recipes-gimp/gimp/gimp_3.2.6.bb
index bcd69985fb..835a501a92 100644
--- a/meta-gnome/recipes-gimp/gimp/gimp_3.2.4.bb
+++ b/meta-gnome/recipes-gimp/gimp/gimp_3.2.6.bb
@@ -66,7 +66,7 @@ SRC_URI = "https://download.gimp.org/gimp/v3.2/${BP}.tar.xz \
            file://0004-meson.build-dont-check-for-python3-pygobject-gexiv2-.patch \
            file://0005-docs-meson.build-disable-gimprc-man-build.patch \
 "
-SRC_URI[sha256sum] = "7312bc53e9c6d2d0056ca7b93f1c6b98707946dd934f714c21b8746ecb601588"
+SRC_URI[sha256sum] = "40b15e90ad0c0c631b76da3c467ea9847fa5c24f37413ac5b492804860a28cd8"
 
 PACKAGECONFIG[aa] = "-Daa=enabled,-Daa=disabled,aalib"
 PACKAGECONFIG[alsa] = "-Dalsa=enabled,-Dalsa=disabled,alsa-lib"

