Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by mail.openembedded.org (Postfix) with ESMTP id BD1E46AC0D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Nov 2014 17:54:01 +0000 (UTC)
Received: by mail-wi0-f170.google.com with SMTP id r20so2554633wiv.5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Nov 2014 09:54:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=bN5rqptK/JWSndVwCW+nF4JeJ//nwpX04ZhabIjuRpE=;
	b=b/NKRIiHyy1t995Jz/O35cdyUwgePd/ScfYykhPu0Tdr8wlcgFPw3HV8YH22bhRQEW
	vpgnGLV1jj4dEIRHV5tbOGBxWMjpXenEYX27qIEZl4QQs0U+pIEWlR2Wm/onK2l3XntO
	Z9yCHJlSx565lHTCUbhCIPDFgw1T1xDtwmUyzzIsIpX4m/6l4UVi5+gQdb7meVZGr06U
	y7bC3Gb7jxb1DOazDqwf4kEfcHiVBB/YdFVM/VahvscmMhdpJZaNTMJlGzx3VRqu/IbL
	ePrPSpOqb7xh7RfdYlMHKOS7dLGxRh878Jy7uctBEelQNDRERUX11AtDuWa2ytgvkMfe
	vW4Q==
X-Gm-Message-State: ALoCoQm6ZTdUfZAe641+CjfXu0U39WqTNv3sALeRkKuVlPGyLt3jJ0UxHK9EB8voauIjJo7ewhuL
X-Received: by 10.180.101.102 with SMTP id ff6mr43599494wib.34.1415728441658; 
	Tue, 11 Nov 2014 09:54:01 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id dx8sm14461196wib.2.2014.11.11.09.54.00
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 11 Nov 2014 09:54:01 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 11 Nov 2014 17:53:49 +0000
Message-Id: <1415728430-30366-4-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1415728430-30366-1-git-send-email-ross.burton@intel.com>
References: <1415728430-30366-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 4/5] gupnp-dlna: upgrade to 0.9.5
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 11 Nov 2014 17:54:02 -0000

Also use GNOME_MIRROR in SRC_URI.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../gupnp/{gupnp-dlna_0.9.2.bb => gupnp-dlna_0.9.5.bb}           |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-multimedia/recipes-connectivity/gupnp/{gupnp-dlna_0.9.2.bb => gupnp-dlna_0.9.5.bb} (72%)

diff --git a/meta-multimedia/recipes-connectivity/gupnp/gupnp-dlna_0.9.2.bb b/meta-multimedia/recipes-connectivity/gupnp/gupnp-dlna_0.9.5.bb
similarity index 72%
rename from meta-multimedia/recipes-connectivity/gupnp/gupnp-dlna_0.9.2.bb
rename to meta-multimedia/recipes-connectivity/gupnp/gupnp-dlna_0.9.5.bb
index b7e71cf..c936750 100644
--- a/meta-multimedia/recipes-connectivity/gupnp/gupnp-dlna_0.9.2.bb
+++ b/meta-multimedia/recipes-connectivity/gupnp/gupnp-dlna_0.9.5.bb
@@ -5,9 +5,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
 
 DEPENDS = "libxml2 glib-2.0"
 
-SRC_URI = "http://download.gnome.org/sources/${BPN}/0.9/${BPN}-${PV}.tar.xz"
-SRC_URI[md5sum] = "d972f9b03f0f3793cb895eb034ea314f"
-SRC_URI[sha256sum] = "c28d5650604c7da4f193e6b85049a4885f3a01f1996df768d55b5cb898a9fc53"
+SRC_URI = "${GNOME_MIRROR}/${BPN}/0.9/${BPN}-${PV}.tar.xz"
+SRC_URI[md5sum] = "b0c9e5e6edc5ca6fe854bc53560431bf"
+SRC_URI[sha256sum] = "44a226300287ffbee1899c35775b4b9153930f29433a75d8c1577d8547c29e83"
 
 inherit autotools pkgconfig
 
-- 
1.7.10.4


