Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
	[209.85.221.45])
	by mail.openembedded.org (Postfix) with ESMTP id 4626F7E719
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Sep 2019 07:12:12 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id n14so1079104wrw.9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Sep 2019 00:12:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=f99cbwTWHVS2Pj56XuCVTxaPlW9sMrEPJSXwdqvTOnA=;
	b=RIJ5j+28P75uaswKXM0/xpAgjpYFAgOGE6wRQFozpDGuY2+OgDRTziz7UGZpG5UT5D
	qMBNEyI14XLZd+g6rOTGlYrNBM3TlSq53C60yHzo8EaHt1UhA7GHUyJRzh23V9L7z6D2
	cNsaUTXyzIVcOpPN51aoIbSXapY97jpcztZTICe7+zAWWEV8+XYf20QCGkopBvFANzQu
	TsoD0IzcwnUZrNE3OItoY1CFKWeMLq065FWBovYKSZzi+jtOebyYvJ9GtURDug6Woa0+
	S6QCB5+tgJ60M5jtw0WqKfZSzcWFEDXAJrNz5fwieFx/yIHlwzH0FQtC/txW0cegxxyw
	I4qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=f99cbwTWHVS2Pj56XuCVTxaPlW9sMrEPJSXwdqvTOnA=;
	b=W0KwRi1OBC3amcxxMRe5BSP1ZR2ErhQH2ZmCcT8s7RJf5s5QDyYvKaFV0rfvSY2eSP
	Zfr4uDPwtZQ3BGdQJCkWtgHGpDAApsmirJ/bCNytRHn8A0tx2aE61XP4IF0tZpUcoDrr
	Lj3qaPebNnrSwpoPs2HceADQ/eRH19FyuioIPJF6dHeVkLArOIcGiyCA3y7jG5sCNthI
	+3gGV2eLv4pQrxkodr0jimUcHaf0IDWD6vOqy9uolWGW7gv8ebDrjiIBdIKm3283bR9Y
	+4gepsTPW3I3isps0vzgjuQZvqWHI+yWV2LxV+7eLFyQIABs5dmcUIOsihDdgzQgAHF5
	PBow==
X-Gm-Message-State: APjAAAWyYOZUlaXh17243UVCeYoiEB4CbjRj10RRh8Bv9hmgKSaycXcT
	IZDQ/oyHWjH4/7CLTKmlb709yhUh
X-Google-Smtp-Source: APXvYqw8hCi9jMsp6Pc1CsaMa1zIMMmuMqKO49BjzNGtbNDTBfKvTKH8EcYOWQI8jFfnOl16QqApVQ==
X-Received: by 2002:adf:fa10:: with SMTP id m16mr1595342wrr.322.1569481932803; 
	Thu, 26 Sep 2019 00:12:12 -0700 (PDT)
Received: from superandy.speedport.ip
	(p200300F07F05552433B9EECE553F1384.dip0.t-ipconnect.de.
	[2003:f0:7f05:5524:33b9:eece:553f:1384])
	by smtp.gmail.com with ESMTPSA id
	s19sm5183753wrb.14.2019.09.26.00.12.11
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 26 Sep 2019 00:12:11 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	kai.kang@windriver.com
Date: Thu, 26 Sep 2019 09:12:02 +0200
Message-Id: <20190926071202.9750-2-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190926071202.9750-1-schnitzeltony@gmail.com>
References: <20190926071202.9750-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [meta-xfce][PATCH 2/2] catfish: upgrade 1.4.9 -> 1.4.10
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
X-List-Received-Date: Thu, 26 Sep 2019 07:12:12 -0000
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


