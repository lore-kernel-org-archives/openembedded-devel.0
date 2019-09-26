Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
	[209.85.221.43])
	by mail.openembedded.org (Postfix) with ESMTP id 3D3BB7F26C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Sep 2019 22:32:18 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id o18so479064wrv.13
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Sep 2019 15:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=f99cbwTWHVS2Pj56XuCVTxaPlW9sMrEPJSXwdqvTOnA=;
	b=Eydh4GQ1HlXLNMEOUA3I/9RYZbgM5rDe/LJegNduyxMrGJ69WruQYXAMu7IbHeQFmR
	vDrkWgW9uu7uY27DAQF/e5PEGkosQEyYa1RpNqeUKyA6+s05q9UdgwrtFy/c5M+hFrpa
	um3/iHtVmh791EClaZhbuGApiu3l+bV83LU9uS0VE5TeDyLkubNOVUWAvcEk817jdKK9
	Q2jo5cFOn0dYfKitxQoAVXeimPHtnix+HbeykhgiI6bph8e/K9JvQow9wyyEI7v6uJFF
	1igXyMxqwOo+LGmY5LaQZbCYvvVMd4adcvBCRV+P0WkWOmu22LyVUngfExAbaFe6QRQD
	XcgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=f99cbwTWHVS2Pj56XuCVTxaPlW9sMrEPJSXwdqvTOnA=;
	b=K0o/SNMfHQDkUNThy0ogtJI7HaR6LcfUVBZF6KSZmoJ9xuEk1cLBT8F+VnV/h+lg3h
	IxA0j7RbHV8rLeNh4wBAEj6ev/cbX6PH2HEu3j+H0gU2tiWfWv7kV9vfs7Hwhyd1xszv
	QMp6c06RjdmXDYq13tdLBLnbBEr6yYAQ4TshBfwxs2nKocICFKJ+ZHfXsOFxAee+5mi2
	1IyRgtvMin6DwjIYtmDuidymtuCT9HLIvpORJa5ZsOWmcYhuR9au3ovhhYAff9RtUsP3
	UgQS7f8ffYcxBHelJYBrSY/wUyxlnsKJ8Tf9eRrqh1jJ2Xhwl/NSmKr1IMlNhpJLoPLg
	F6pQ==
X-Gm-Message-State: APjAAAW3ZeDCYRPOJgIpUz4cipMS12woMED9Y3eymuEZWHAuyv6R8Klm
	2h/nyDZs+qRt/WsktsI/btmPZb9Y
X-Google-Smtp-Source: APXvYqwajrXnY/R3BCe5U+pwuQEznZLjXKgCs9hzOpsWZ3lboyVOX6MjQbWHBT9Iz1kXTiZ1c432fQ==
X-Received: by 2002:adf:ef0c:: with SMTP id e12mr481702wro.81.1569537138599;
	Thu, 26 Sep 2019 15:32:18 -0700 (PDT)
Received: from superandy.speedport.ip
	(p200300F07F05552433B9EECE553F1384.dip0.t-ipconnect.de.
	[2003:f0:7f05:5524:33b9:eece:553f:1384])
	by smtp.gmail.com with ESMTPSA id
	c18sm1205023wrv.10.2019.09.26.15.32.17
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 26 Sep 2019 15:32:17 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	kai.kang@windriver.com
Date: Fri, 27 Sep 2019 00:32:05 +0200
Message-Id: <20190926223206.26850-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [meta-xfce][PATCH v2 1/2] catfish: upgrade 1.4.9 -> 1.4.10
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
X-List-Received-Date: Thu, 26 Sep 2019 22:32:18 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../catfish/{catfish_1.4.9.bb => catfish_1.4.10.bb}           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-apps/catfish/{catfish_1.4.9.bb => catfish_1.4.10.bb} (72%)

diff --git a/meta-xfce/recipes-apps/catfish/catfish_1.4.9.bb b/meta-xfce/recipes-apps/catfish/catfish_1.4.10.bb
similarity index 72%
rename from meta-xfce/recipes-apps/catfish/catfish_1.4.9.bb
rename to meta-xfce/recipes-apps/catfish/catfish_1.4.10.bb
index eec525b88..602368b3a 100644
--- a/meta-xfce/recipes-apps/catfish/catfish_1.4.9.bb
+++ b/meta-xfce/recipes-apps/catfish/catfish_1.4.10.bb
@@ -9,8 +9,8 @@ DEPENDS += "python3-distutils-extra-native"
 
 B = "${S}"
 
-SRC_URI[md5sum] = "829824fba33e86d03345bbc718e7b2d9"
-SRC_URI[sha256sum] = "29a39b85804336e4819dceff203693a5904b7e11d7e024b49b5aab2649ed944e"
+SRC_URI[md5sum] = "1b8e7bfd955364b7912fb0a248329b3a"
+SRC_URI[sha256sum] = "2573a004105031f871c92fed22a0c4b15bb96f2dff6e36c4f2959f56b62e343d"
 
 FILES_${PN} += "${datadir}/metainfo"
 
-- 
2.21.0


