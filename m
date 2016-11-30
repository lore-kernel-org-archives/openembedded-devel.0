Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f179.google.com (mail-qk0-f179.google.com
	[209.85.220.179])
	by mail.openembedded.org (Postfix) with ESMTP id 7B88F71AAB
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Nov 2016 18:22:10 +0000 (UTC)
Received: by mail-qk0-f179.google.com with SMTP id n204so218704176qke.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Nov 2016 10:22:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ZYw5ICtnOVG5jMDHeTe0Edl2TdImr9EdlzFgTHm4T1w=;
	b=U++gPm4B408im6qBbaV7DRpi33ZhEko9XB0Ub9qJ+u+3/Qd1u5teXaM7VwhPbC91Yu
	f/6Q/F2JYBs79Wefe7fnYVjV8iQqHAr27ww5cUM0yRhZCkWUp/4H15RC/ENu6arZqhD4
	ljcPEmcho2I+2RJHDQC0nijR5rZX9iTBVRDKLsc9YUkluwg+7IyESMvSjXHFPx89tUwQ
	ZP9QmUWkTLDNRmhZaIE6yLSM7cqR/3nocmWphBqmx7drM5oBzBvmT6G35A1xH0IP5JsJ
	Hc94YTehZPbdmlIB0KFAEZL3IWFbPcPt5b6wRwlxGemYZA031q8o8iIOAqwEW0q7p2Dg
	bLYQ==
X-Gm-Message-State: AKaTC01vL1+frv2nNixBKZ61rNm34eBxyG+THgUsCyV7Fwegp9OZumL8A5G2MTJzS77H3A==
X-Received: by 10.55.156.81 with SMTP id f78mr32796062qke.123.1480530131539;
	Wed, 30 Nov 2016 10:22:11 -0800 (PST)
Received: from sparta.ny.asterius.io (ool-457cd903.dyn.optonline.net.
	[69.124.217.3]) by smtp.gmail.com with ESMTPSA id
	q3sm33912856qte.41.2016.11.30.10.22.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 30 Nov 2016 10:22:11 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 30 Nov 2016 13:22:04 -0500
Message-Id: <1480530124-6898-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-pyasn1: fix RDEPENDS to work correctly when building native version
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
X-List-Received-Date: Wed, 30 Nov 2016 18:22:10 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-pyasn1.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python-pyasn1.inc b/meta-python/recipes-devtools/python/python-pyasn1.inc
index 7c25de8..72cabc4 100644
--- a/meta-python/recipes-devtools/python/python-pyasn1.inc
+++ b/meta-python/recipes-devtools/python/python-pyasn1.inc
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=425e62320d430219736139b134db2fc4"
 SRC_URI[md5sum] = "f00a02a631d4016818659d1cc38d229a"
 SRC_URI[sha256sum] = "853cacd96d1f701ddd67aa03ecc05f51890135b7262e922710112f12a2ed2a7f"
 
-RDEPENDS_${PN} += " \
+RDEPENDS_${PN}_class-target += " \
     ${PYTHON_PN}-lang \
     ${PYTHON_PN}-shell \
 "
-- 
2.7.4


