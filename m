Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 92B9178BE7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Jul 2018 22:50:13 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id h14-v6so3213843wrw.13
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Jul 2018 15:50:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=TnGBQKBQSzh0GG2L6DaqTjLIeEHGnIwgCNITQhKPSKE=;
	b=SZdBl5lRTfrdRpwb4QbkGW4c4bx+XiEms6UXktokWfS01UZJU7YiHdc5+jrEczV8Hf
	S31AGWrIC7MK/QHzBkgL44qsUvOlTdexA1Z2q8Z11yI1dMs0Qh9O1Bbfsei8EqoK1pcw
	QeS5qo/iViZ72qWQzYTMjudZoaq5MC1ZKv4qoGG7v+f+NIXAxawBKsmn3ybMvdRPxCPJ
	NuGp0RY5TL28HKkYtZcM7XlrvxWp71p3nvQTZXh9m7qMquC4qH00SF5CFYsyq8qo7idH
	UM0R7SD+4d8ax2LMy60hXTg/yGx0MoMynXhAkPW/oqN1LbmLbAOLyfrUdRmnCtNY7kbI
	YhRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=TnGBQKBQSzh0GG2L6DaqTjLIeEHGnIwgCNITQhKPSKE=;
	b=Kgi4xXvaPYCkIpaBdDbVcw4cA360wNbZYuf7A9fdl47jI3mJC82NkwZ2QczCPKHlWF
	DKQLtUvXzhZZP1uWvSWvLmogoeoRd+4FwZ0ZuJ8IifYtf5KzVmwXccUXAVRLyrAb48j4
	QDTu/AeMpCmEteGVz4GtMS4k1GWKpxDnVTRQLHJSuhyW5855ecaApBS3ZLQ6pBJ+RFm/
	4JVzyQybxMXJZgvmPSlWfUVhgxEQnombJsIBw7MKerQobOoBxxJ1kgXE6UWSG02P86ZB
	LD6q4e+9nKrC1XjBBNiYZjCwXrtnZzpD8jBjQgyKyy4ZuXHsQvyKCpre2Ec0AkJnAW3w
	asHg==
X-Gm-Message-State: AOUpUlFt4Q+ADqp3iqgEjd0NvoDM2/D8XnnbXuNjO1R565C5AxvE24Yx
	8nnxpMHyZsknF4VMzso5bfK0ItfGswA=
X-Google-Smtp-Source: AAOMgpc5Pe+CanIBS/wSxxIHB3KwEWsQvSf0CPga+3fcmMgr/QJPJ4ZPj9nwNQnBwyir8hp8ZCYunA==
X-Received: by 2002:adf:92c3:: with SMTP id
	61-v6mr3090958wrn.231.1532645414168; 
	Thu, 26 Jul 2018 15:50:14 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	l10-v6sm3451742wrv.23.2018.07.26.15.50.12
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 26 Jul 2018 15:50:13 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 26 Jul 2018 23:50:11 +0100
Message-Id: <20180726225011.2503-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] rygel: remove obsolete ossp-uuid dependency
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
X-List-Received-Date: Thu, 26 Jul 2018 22:50:15 -0000

Not only was uuid removed as a build dependency of Rygel in 0.27.1, but
oe-core's ossp-uuid has always renamed the library to libossp-uuid so it was
never used (as util-linux provides libuuid.so).

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta-multimedia/recipes-connectivity/rygel/rygel_0.34.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-connectivity/rygel/rygel_0.34.0.bb b/meta-multimedia/recipes-connectivity/rygel/rygel_0.34.0.bb
index f13f5cec06..21331ffcb0 100644
--- a/meta-multimedia/recipes-connectivity/rygel/rygel_0.34.0.bb
+++ b/meta-multimedia/recipes-connectivity/rygel/rygel_0.34.0.bb
@@ -8,7 +8,7 @@ HOMEPAGE = "http://live.gnome.org/Rygel"
 LICENSE = "LGPL-2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
-DEPENDS = "libxml2 glib-2.0 gssdp gupnp gupnp-av gupnp-dlna gstreamer1.0 gstreamer1.0-plugins-base ossp-uuid libgee libsoup-2.4 libmediaart-2.0 libunistring sqlite3 intltool-native"
+DEPENDS = "libxml2 glib-2.0 gssdp gupnp gupnp-av gupnp-dlna gstreamer1.0 gstreamer1.0-plugins-base libgee libsoup-2.4 libmediaart-2.0 libunistring sqlite3 intltool-native"
 RDEPENDS_${PN} = "gstreamer1.0-plugins-base-playback shared-mime-info"
 RRECOMMENDS_${PN} = "rygel-plugin-media-export"
 
-- 
2.11.0


