Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id EB65A795DE
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Aug 2018 14:42:07 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id v16-v6so11454105wro.11
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Aug 2018 07:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=TnGBQKBQSzh0GG2L6DaqTjLIeEHGnIwgCNITQhKPSKE=;
	b=CqyJVBo+kdmNBrEx6SC8Q4E//nGN+6/XBeUI8Gx2HNVrgPrXUanKw1LZALqXQughow
	3RlL7AUZUZ6kgWwGCOZJR6k8wuIEpvDUB2FbriUzAFkctLq3iwz84LMZyBQYXfV6bRbL
	jpx7sZkE5jbyQH9MKX+GblC/ScjrSa4t8ZR224vJjqGlu6t9/JGimNKP4wn2OtNiv2Kx
	zHewk2L1cy36DfNXwjN+pXZWi8e70CpP3vNcVlqVEKIaVeUTWKAKxCyh3BrXI9xWtBOn
	UTC5a83o8EITgM7eKv4sz3VGqkpiKw2bhJ70jSvKWHqS+YA9ND0EmrgKLg1ZGTzORI2L
	R7mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=TnGBQKBQSzh0GG2L6DaqTjLIeEHGnIwgCNITQhKPSKE=;
	b=QVDVfwiP2EGSGUwLQQ6f7Jo9HSIeGaLBB0Wn0JMLizZnK3CGv/6Iw7jtIJ29GT6VUb
	CbyZ56Hurv2WlqjJP2ulphGZNud4vADhHaK3MQJ6xOt76D1+OqpJ7GwpAtQim5xSBUvG
	O3HpCEDft0RABpJWuCrAEzQ3awcMdEBrkWzgSV3lHabpLgWSR59S8AkUrywUneKteRg6
	SFSOz/h/xLJavd2Se8K1O+hxcDZY3nREhCop2qNLxl6lRdBHMzZYcC+PjQMADQEXA+CS
	/iDc1HcJZeWVsgTTGI+ebb1WShiRY8EElBXLfZUN5AwtI66aCD8N/dA837BlInyOLCP0
	abvg==
X-Gm-Message-State: APzg51AYMPqEPLKOYVMgxvBl/ExognFbN7GZYunV/X4BrkP+XZTpBbmc
	DpCJRLGDjABWy4oqXVIIRBh5LRxhfHk=
X-Google-Smtp-Source: ANB0VdaLDMr4FI+eYCkByAr+nab0SSCSjL7rU0N+60RvAFgK1esz6Tkb6d9zzKnzLWkQGSR3zTSU6Q==
X-Received: by 2002:adf:c554:: with SMTP id
	s20-v6mr10689862wrf.46.1535726528434; 
	Fri, 31 Aug 2018 07:42:08 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	i125-v6sm6742229wmd.23.2018.08.31.07.42.07
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 31 Aug 2018 07:42:07 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 31 Aug 2018 15:42:06 +0100
Message-Id: <20180831144206.5151-1-ross.burton@intel.com>
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
X-List-Received-Date: Fri, 31 Aug 2018 14:42:08 -0000

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


