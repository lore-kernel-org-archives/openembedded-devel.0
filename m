Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f49.google.com (mail-pa0-f49.google.com
	[209.85.220.49])
	by mail.openembedded.org (Postfix) with ESMTP id AD8766CDB6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Oct 2013 23:12:27 +0000 (UTC)
Received: by mail-pa0-f49.google.com with SMTP id lj1so2835714pab.8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Oct 2013 16:12:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=/XchgCcj7UPtspjkI7j/1rr3yobsR8SfY+h8ebIygc4=;
	b=mvYkYsP156vrCHVFAC484HXc5zOLLcNGxxv0CF+DHqpFYtkQ+aVzV3Uwqjjq8gCveH
	KinqVx19NewJSa2W2X9YDCHVVmDqQYv7U34x9ZsDreOUp8qrj4MlyHHsVbKPoIooI2LO
	SpO2B5Pc2FzL3L0ICtUUsBs5h1389E+nNskwdxOv33/As9kgdiX80WashlVl8mwI2rQy
	JktEYCULljvTkBFK3HGA0KJVcFWjIMwn0Ouu6yHkbgGRJB36e3apjtl+NI3CeacGYEtV
	d/JmotE4DePNMiZea6TSOjyh6e9LH7KbvG0wys04C2/au5HByHR+7Ku0RZySISAsMnO4
	HkfQ==
X-Received: by 10.68.172.164 with SMTP id bd4mr10837376pbc.153.1382051549746; 
	Thu, 17 Oct 2013 16:12:29 -0700 (PDT)
Received: from haswell.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPSA id
	fa4sm117337667pab.17.1969.12.31.16.00.00
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 17 Oct 2013 16:12:28 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 17 Oct 2013 16:12:00 -0700
Message-Id: <1382051520-1562-3-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1382051520-1562-1-git-send-email-raj.khem@gmail.com>
References: <1382051520-1562-1-git-send-email-raj.khem@gmail.com>
Subject: [meta-oe][PATCv2 3/3] mikmod: Upgrade 3.3.2 -> 3.3.3
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
X-List-Received-Date: Thu, 17 Oct 2013 23:12:27 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../mikmod/{libmikmod_3.3.2.bb => libmikmod_3.3.3.bb}               | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-multimedia/mikmod/{libmikmod_3.3.2.bb => libmikmod_3.3.3.bb} (70%)

diff --git a/meta-oe/recipes-multimedia/mikmod/libmikmod_3.3.2.bb b/meta-oe/recipes-multimedia/mikmod/libmikmod_3.3.3.bb
similarity index 70%
rename from meta-oe/recipes-multimedia/mikmod/libmikmod_3.3.2.bb
rename to meta-oe/recipes-multimedia/mikmod/libmikmod_3.3.3.bb
index 4ab293f..6a3077f 100644
--- a/meta-oe/recipes-multimedia/mikmod/libmikmod_3.3.2.bb
+++ b/meta-oe/recipes-multimedia/mikmod/libmikmod_3.3.3.bb
@@ -6,10 +6,10 @@ LIC_FILES_CHKSUM = "file://COPYING.LESSER;md5=b2b941d484c442e5c031a51463d8e11b"
 DEPENDS = "alsa-lib texinfo"
 
 SRC_URI = "\
-    http://mikmod.shlomifish.org/files/${P}.tar.gz \
+    ${SOURCEFORGE_MIRROR}/project/mikmod/${BPN}/${PV}/${BPN}-${PV}.tar.gz \
 "
-SRC_URI[md5sum] = "60ac77a804d082230df3009af11ef44f"
-SRC_URI[sha256sum] = "2311b209255bf24e95161907a16778cb054ac6d447fd8d05f1f0e41a555c7580"
+SRC_URI[md5sum] = "0e0f9bce8f8e598ca292b41e0ae385c8"
+SRC_URI[sha256sum] = "79f02478c5abd8b2af73df4cc5f9d52625aa044327c01563168e270cf79b2437"
 
 inherit autotools binconfig lib_package
 
-- 
1.8.3.2


