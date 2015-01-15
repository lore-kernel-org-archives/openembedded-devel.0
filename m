Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by mail.openembedded.org (Postfix) with ESMTP id CD0A5728DC
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Jan 2015 12:35:20 +0000 (UTC)
Received: by mail-wi0-f170.google.com with SMTP id z2so2119917wiv.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Jan 2015 04:35:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=EK3swp9KzxNJcrqddEOEv8Mkibg6sZ7Vdkhktugr+0g=;
	b=YlEUg+INyqypvJY8HJbrbcVdoIRb9CJKc48N0I3nvgDy1QpPASxEDT693WtimhPWPM
	YPSvub/RmJ2sZQ6/ZsFXkPQmSd4Nz6iykAkzXGya+VkoRCY4w2QjEgmdxyV3dwtHJb7O
	9nBjOplLxp28KuNQ22n1f/lVan4K+kGSmlKcqmC2jaZPzI/uxfpmkCPvr6pl3O2zbTUc
	9JetX23V/+josD4Au2I5eY9z2ud+qDOA2Rx9aOOCrkoQkjJsFGxVWK5GAVxEGNdAkYuf
	bMHAjXa6j77lXFnZ2PKUCDZz6DFI3UYmD9dm6WoJfP59aDt5p3F8lk8AB9M/yV5VVHg6
	zPZA==
X-Gm-Message-State: ALoCoQksTzlpnb/BFGNaZ2DOUqHOP389+/D713lisFmorTsomOSX60qP6EOBRvXleUyk0VKfDiBb
X-Received: by 10.194.192.4 with SMTP id hc4mr12123951wjc.117.1421325321046;
	Thu, 15 Jan 2015 04:35:21 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by mx.google.com with ESMTPSA id r3sm22611724wic.10.2015.01.15.04.35.19
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 15 Jan 2015 04:35:20 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 15 Jan 2015 12:33:53 +0000
Message-Id: <1421325233-21580-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH][meta-multimedia] gupnp: add Python recommends to gupnp-dev
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
X-List-Received-Date: Thu, 15 Jan 2015 12:35:26 -0000

gupnp-dev contains a tool which is written in Python, so add a recommends
dependency so that this is usable.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta-multimedia/recipes-connectivity/gupnp/gupnp.inc |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-multimedia/recipes-connectivity/gupnp/gupnp.inc b/meta-multimedia/recipes-connectivity/gupnp/gupnp.inc
index b63f223..e23ba68 100644
--- a/meta-multimedia/recipes-connectivity/gupnp/gupnp.inc
+++ b/meta-multimedia/recipes-connectivity/gupnp/gupnp.inc
@@ -13,6 +13,8 @@ inherit autotools pkgconfig
 FILES_${PN} = "${libdir}/*.so.*"
 FILES_${PN}-dev += "${bindir}/gupnp-binding-tool"
 
+RRECOMMENDS_${PN}-dev = "python"
+
 SYSROOT_PREPROCESS_FUNCS += "gupnp_sysroot_preprocess"
 
 gupnp_sysroot_preprocess () {
-- 
1.7.10.4


