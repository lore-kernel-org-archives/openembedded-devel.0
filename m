Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id C18906FF72
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Jun 2016 01:33:44 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id v3so1944950qki.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Jun 2016 18:33:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=bXGWpSHHjplapJGlApeRQuna9zckeDYBMwL/Fi2JTd0=;
	b=ggvn9lAGvls6SmxL7QJlAjTtowwVFS/vnXu+hSfY4TTJ0y0+B5mbkA03ZSRwvwP2T3
	lYqYKZqjEdLZXpD5f74rCJ8Px5C6G4jQj4IsZpzHiPNVWnGM0u7rpF/XiYdLFTEHin5z
	IqRrmDcCG2FbY6M9OTguIxQIkUI2YD64Ouh267RfCSBqR1FHRAZXQ/a25/y27+h5REUk
	eb7TJvPhe0s1aMPpReaNzcSx3VF6AKPIx2vt2BNEFqq7z+uMLJQ2gkUOOxqxJLDy+3GO
	uI/9mGcQ24FsNA3h6ckCB5OevSraHZpCq2+rXrRYS+uNrRZqo7S0G7LpV8cxNxx+D7hD
	HlcQ==
X-Gm-Message-State: ALyK8tLnmon+mOu2hZwVSznngzaZE30W5HUPag3ccRiFm9zMZ2kjATecjzi/zvawWn8riw==
X-Received: by 10.55.97.14 with SMTP id v14mr7958271qkb.39.1465436024972;
	Wed, 08 Jun 2016 18:33:44 -0700 (PDT)
Received: from lnx-dereks-laptop.minotaur.lab
	(c-73-172-178-168.hsd1.md.comcast.net. [73.172.178.168])
	by smtp.gmail.com with ESMTPSA id
	t70sm1071735qhf.12.2016.06.08.18.33.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 08 Jun 2016 18:33:44 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  8 Jun 2016 21:33:35 -0400
Message-Id: <1465436015-3947-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-oe][PATCH] grail: update to version 3.1.1
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
X-List-Received-Date: Thu, 09 Jun 2016 01:33:45 -0000

  * Addresses issues with gcc6

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../canonical-multitouch/{grail_3.1.0.bb => grail_3.1.1.bb}           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/canonical-multitouch/{grail_3.1.0.bb => grail_3.1.1.bb} (81%)

diff --git a/meta-oe/recipes-support/canonical-multitouch/grail_3.1.0.bb b/meta-oe/recipes-support/canonical-multitouch/grail_3.1.1.bb
similarity index 81%
rename from meta-oe/recipes-support/canonical-multitouch/grail_3.1.0.bb
rename to meta-oe/recipes-support/canonical-multitouch/grail_3.1.1.bb
index 6ea10d6..3026744 100644
--- a/meta-oe/recipes-support/canonical-multitouch/grail_3.1.0.bb
+++ b/meta-oe/recipes-support/canonical-multitouch/grail_3.1.1.bb
@@ -13,8 +13,8 @@ inherit autotools pkgconfig
 DEPENDS = "frame"
 
 SRC_URI = "https://launchpad.net/${BPN}/trunk/${PV}/+download/${BPN}-${PV}.tar.bz2"
-SRC_URI[md5sum] = "2ac56af5f6f466b433c99ca12f34c34f"
-SRC_URI[sha256sum] = "c26dced1b3f4317ecf6af36db0e90294d87e43966d56aecc4e97b65368ab78b9"
+SRC_URI[md5sum] = "0df1b3ec6167920f310e2effe6e2ad44"
+SRC_URI[sha256sum] = "5eed1f650f042481daa3a2de5e7d43261fe343b2a1b1e240f3b7fc26572c9df3"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
 PACKAGECONFIG[x11] = "--with-x11, --without-x11, libxi"
-- 
1.9.1


