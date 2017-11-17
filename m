Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id A1F297876B
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Nov 2017 22:14:00 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id n3so1177508qkn.11
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Nov 2017 14:14:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=LrCtHE1HzKu0ucm73gDunOrr1CAe2eCL0s6rjOiBpaY=;
	b=tKkk8MKxH+zxZdPmY5RLM23y4AdA/Zs7q9RviFu/hJdI4BdLbdGUW319py9eGBEeTl
	O4YTBFdfHIVNx7gn2IbiAMpxK7ADFwsvWUSYVjjM2/FdoEt4TiDWlJ2VjibSWrs5O9Xq
	MPgrSP2p10VIasw8asJMyPww+WENIwBQXRTzg2+IscboyjTCxu4ajpSb+dP+RgHAtvNm
	JDZbumDLmMktyF+yiM1QEm5QE1yl2PWE/ECVk8mDN8xGGqr/gx+XOi2Lvlrey68AlHBC
	1eEtuxPsNjs9jq7VCHshpchQ45QRxRmmOuaiYhqv952BT6v5YPg+0eCOWP8aKtAzwae/
	k9vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=LrCtHE1HzKu0ucm73gDunOrr1CAe2eCL0s6rjOiBpaY=;
	b=sJOJ40AKnUW30fnn9Jg7QUY7X+5Bwen/2OBEAR4rutJWpqBMWPLmIl2SU4BT/d0L/+
	q99Pj7cdZOze1Rm98o6+zZ/p42DGkrzABVuKXZOG/Y6yDh+cM7EtpA9KazZDEFTzYbJy
	Qt/Z2e5WH7gaEnsaKs3u3F+Fy3nSrIzl1mzyzAmjdBiRzpKND2QgNVUsCQx6cQzMXl/A
	8ihrjRqtqEXgEuZNEQjgpPVNYDw8UfwrbEjrgtZiQb6KILI+Hx74QdJ4h3fYJh9m/TTb
	ViQbb5z5lqLVLD/5hlzaW6cDQ8w78dN5pSDOrIfGPTXg00GZ/iJpJvOGhokmY3Oo14mk
	fNPg==
X-Gm-Message-State: AJaThX4ZVqVWF73zYUpOuUezYQuXJIbBizNOP5AvmCExra45cIXsiB3Z
	G9q9gNiGYnO2Q9mMRPpCzseb+A==
X-Google-Smtp-Source: AGs4zMZkN6oqgHlTf2sQ26cmMLfMZZk4FK8TgmrYKIOGj3a2zUBUEC6QbVz+xAedEdgOkmZvuS5IrA==
X-Received: by 10.55.170.15 with SMTP id t15mr10879090qke.114.1510956841383;
	Fri, 17 Nov 2017 14:14:01 -0800 (PST)
Received: from localhost.localdomain ([2601:646:8882:b8c::a4a])
	by smtp.gmail.com with ESMTPSA id
	188sm3090599qkm.24.2017.11.17.14.14.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 17 Nov 2017 14:14:00 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 17 Nov 2017 14:13:51 -0800
Message-Id: <20171117221352.23307-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.15.0
Subject: [meta-xfce][PATCH] xfce4-vala: update vala api to 0.38
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
X-List-Received-Date: Fri, 17 Nov 2017 22:14:00 -0000

oe-core has updated to vala_0.38

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-xfce/recipes-bindings/vala/xfce4-vala_4.10.3.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-xfce/recipes-bindings/vala/xfce4-vala_4.10.3.bb b/meta-xfce/recipes-bindings/vala/xfce4-vala_4.10.3.bb
index d0a0598cd..a25e2e621 100644
--- a/meta-xfce/recipes-bindings/vala/xfce4-vala_4.10.3.bb
+++ b/meta-xfce/recipes-bindings/vala/xfce4-vala_4.10.3.bb
@@ -3,13 +3,13 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=243b725d71bb5df4a1e5920b344b86ad"
 DEPENDS = "libxfce4util garcon xfconf libxfce4ui xfce4-panel exo vala xfce4-dev-tools-native"
 
-inherit xfce
+inherit xfce pkgconfig
 
 SRC_URI = "http://archive.xfce.org/src/bindings/${BPN}/${@xfce_verdir("${PV}")}/${BPN}-${PV}.tar.bz2"
 SRC_URI[md5sum] = "0bbb1d6e473e0fe9b335b7b1b49d8a71"
 SRC_URI[sha256sum] = "07a8f2b7c09fcdd3d86e0c52adea3c58ca011d0142a93997a01b4af77260ae7b"
 
-EXTRA_OECONF = "-with-vala-api=0.36"
+EXTRA_OECONF = "-with-vala-api=0.38"
 
 FILES_${PN} += "${datadir}/vala-*/vapi"
 
-- 
2.15.0


