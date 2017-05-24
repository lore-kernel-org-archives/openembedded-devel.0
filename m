Return-Path: <maryan.pricak@gmail.com>
Received: from mail-lf0-f68.google.com (mail-lf0-f68.google.com
	[209.85.215.68])
	by mail.openembedded.org (Postfix) with ESMTP id F3A48780E4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 May 2017 20:54:13 +0000 (UTC)
Received: by mail-lf0-f68.google.com with SMTP id 99so11823129lfu.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 May 2017 13:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=Kn/sPdzx5uzBsGHmIxzUEDOpmeNEMO0v+3TGSBGuINA=;
	b=Xjk1um9wLSQUnpRMkXcLpQtkc0Y8rq5n1eRPZ1hjSerYQM/TaFSoaThCp9z5ij9++M
	QLbV3NQneChSK2mSZVNVM/LbJtKNxOXPrtIe+Zho20IjR8JWXfVbN9tTI4Cw7vfehdS8
	eeYCPKBGAy8rU+ZK0hniBu2R0rQPkwFFdaIQ0QyfhsC3Fn4Pu2QEq+561LJpT11aGKZv
	46TMe//e7sAAq2FJ5IR8aVUueG4nniy+j/TskTM8m5V2QRuPf0pW6DWFbzKS4YmNXA/B
	erjl8Nc0s+Y5IFTuHJIskR9qnyEeodJHNk5I913gaVp1G8JUQ4OtlbYUlhSbY95zdFYq
	/tVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Kn/sPdzx5uzBsGHmIxzUEDOpmeNEMO0v+3TGSBGuINA=;
	b=pqWDxHiAZxn6d1TYKzbKpZuL3b+15uMvFwMeEdaTqNa5KPh/guEZz+eJ+OMaCMht47
	05zFM07VkEwedtFibnhfWk+0mpw0/QAsyR+8c4+bEtX/K+nFwC1Sm1dekBrragLBdnUr
	wUV2raXK/lXENgZ7alpHY8rxwUEYSh7cao3VGT41ncz9155HGFBAJbJPzQG1JclzBPBb
	3dNuojQSUBXbfzcIXDZy3Y8+BxaMKsl78l7gD+AiBBeDCvBHrLg6mUHLa0iA7OBS1dNC
	gf6N8KlRWRZhb1Hbw8CDIP/dADxXoUcWMMluTMSfUuKCoov5cdSNZHz/75Wd6ezD/vXm
	/zsw==
X-Gm-Message-State: AODbwcCxzewCb4NMX1EK/OI9ETdCP2eBaW0VmD6QF7J60K9IR0IR7SPY
	3XXG3tOzGClY5w==
X-Received: by 10.25.202.93 with SMTP id h29mr10102289lfj.139.1495659254245;
	Wed, 24 May 2017 13:54:14 -0700 (PDT)
Received: from localhost.localdomain ([93.75.94.160])
	by smtp.gmail.com with ESMTPSA id
	x13sm1017245ljd.64.2017.05.24.13.54.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 24 May 2017 13:54:13 -0700 (PDT)
From: Marian Pritsak <maryan.pricak@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 24 May 2017 23:54:10 +0300
Message-Id: <1495659250-20595-1-git-send-email-maryan.pricak@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-oe][PATCH] libteam: Initial support
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
X-List-Received-Date: Wed, 24 May 2017 20:54:14 -0000

libteam is a library for controlling team network device.
Provides utils package for network device configuration.

Signed-off-by: Marian Pritsak <maryan.pricak@gmail.com>
---
 meta-oe/recipes-support/libteam/libteam_1.26.bb | 33 +++++++++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 meta-oe/recipes-support/libteam/libteam_1.26.bb

diff --git a/meta-oe/recipes-support/libteam/libteam_1.26.bb b/meta-oe/recipes-support/libteam/libteam_1.26.bb
new file mode 100644
index 0000000..2cb9e8f
--- /dev/null
+++ b/meta-oe/recipes-support/libteam/libteam_1.26.bb
@@ -0,0 +1,33 @@
+SUMMARY = "Library for controlling team network device"
+HOMEPAGE = "http://www.libteam.org/"
+SECTION = "libs/network"
+
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
+
+DEPENDS = "libnl libdaemon jansson"
+
+SRC_URI = "git://github.com/jpirko/libteam"
+SRCREV = "8c1cea00a21950089058e4e33ea1f7bf4deaddeb"
+
+SRC_URI[md5sum] = "565114d70c41bff6093d8e57be284e8a"
+SRC_URI[sha256sum] = "d65286379141db141bea33424ec0507bb0f827a0bf03d9c65004bb593e3d5545"
+
+S = "${WORKDIR}/git"
+
+inherit autotools pkgconfig
+
+FILES_${PN} = "${libdir}/libteam${SOLIBS} \
+"
+
+PACKAGES += "${PN}-dctl ${PN}-utils"
+FILES_${PN}-dctl = "${libdir}/libteamdctl${SOLIBS} \
+"
+FILES_${PN}-utils = "${bindir}/bond2team \
+                     ${bindir}/teamd \
+                     ${bindir}/teamdctl \
+                     ${bindir}/teamnl \
+"
+
+RDEPENDS_${PN}-utils = "bash"
+
-- 
2.7.4


