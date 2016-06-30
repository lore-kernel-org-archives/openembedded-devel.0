Return-Path: <net147@gmail.com>
Received: from mail-pa0-f68.google.com (mail-pa0-f68.google.com
	[209.85.220.68])
	by mail.openembedded.org (Postfix) with ESMTP id 3F2916014F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Jun 2016 02:46:56 +0000 (UTC)
Received: by mail-pa0-f68.google.com with SMTP id hf6so5881726pac.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Jun 2016 19:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=3ChiBG+pmZwWQRHldS9tHcPMWl6SiVLV0hcTPXOhG/Y=;
	b=lpAMAIEiY6oPAD9bIZ2rNQFoX9QiCQEGuL6o3Zf/BY6IPz9Sqg3BoI6tUNgxV90nM7
	qah8RcyJUawnVAi0/PEv3I7ZkV/7AMpgiN60CdyoVeKmWDDAD/JMFopoLHZjlTDjJlpd
	+uCklLG5aIXZTei7iM7isgLIbGfeoXWSf0JBv4cP3LWHCdgVb16LQhtJnGE5gB9ez115
	XTTr7NVwImxjbDRHEm3JBEyYhGw5RbdImg7Qk4eUG488KlxdYuF+jg0BE8iEg6SuMqOW
	6G3A8ffOP4YLDqqZBdJlIbHVOlLR0nfh4Q25anMI1ztMM3C3abTJwJSaxhTO3Jk9Yvpt
	XzMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=3ChiBG+pmZwWQRHldS9tHcPMWl6SiVLV0hcTPXOhG/Y=;
	b=OqYaVtxqQffVq+jmKe48BQYBfmUKmmOIdrQacbFh4vUisNARpfszuOzRye8ss5DObg
	0RTn/MVfciZmQNoxyx/4+1CXCCVmaCBEA38w8CZCRFFK86nqSsLZp14EVleY//6SbFVg
	N53Q2OcuRtuDmaINugDK9VU7VqMlEfNun2GdbUaerufBa1dUA1BrDj/ZiEUIOEVCSGWj
	rEDeWptr/EtgSRmY/XJlkhdOdNJK9Xg9Ta3NHHhLDVugWDs0IMSW7nZI8iCbJG18mb/6
	319FAbpClT4HqFgHALEpy2JTl1qxKXz0iwp8HSHOVaWP+tPZNTjl3KeuznJNjGQNjbEf
	EJnA==
X-Gm-Message-State: ALyK8tKiZW6jwctMyUsAAFAwf/DKTgoyf9dmvHcjdZx0bZmoLZs3B4byoEBnA9QpaloMQA==
X-Received: by 10.67.3.7 with SMTP id bs7mr17467205pad.86.1467254817688;
	Wed, 29 Jun 2016 19:46:57 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by smtp.gmail.com with ESMTPSA id g26sm746831pfj.82.2016.06.29.19.46.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 29 Jun 2016 19:46:57 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 30 Jun 2016 12:46:00 +1000
Message-Id: <20160630024600.14944-1-net147@gmail.com>
X-Mailer: git-send-email 2.9.0
Subject: [meta-oe][PATCH] nodejs: update to 4.4.7
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
X-List-Received-Date: Thu, 30 Jun 2016 02:46:59 -0000

LICENSE checksum updated due to change in ESLint copyright line:
-    Copyright (c) 2013 Nicholas C. Zakas. All rights reserved.
+    Copyright jQuery Foundation and other contributors, https://jquery.org/

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 .../recipes-devtools/nodejs/{nodejs_4.4.5.bb => nodejs_4.4.7.bb}    | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-devtools/nodejs/{nodejs_4.4.5.bb => nodejs_4.4.7.bb} (93%)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_4.4.5.bb b/meta-oe/recipes-devtools/nodejs/nodejs_4.4.7.bb
similarity index 93%
rename from meta-oe/recipes-devtools/nodejs/nodejs_4.4.5.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs_4.4.7.bb
index 479c973..671d604 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_4.4.5.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_4.4.7.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "nodeJS Evented I/O for V8 JavaScript"
 HOMEPAGE = "http://nodejs.org"
 LICENSE = "MIT & BSD & Artistic-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=96aa1ac122c41f8c08a0683d4b2126b5"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=8e3c01094f0fcb889b13f0354e52f914"
 
 DEPENDS = "openssl"
 
@@ -12,8 +12,8 @@ COMPATIBLE_MACHINE_mips64 = "(!.*mips64).*"
 SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz \
     file://no-registry.patch \
 "
-SRC_URI[md5sum] = "376140907bbe362f36065a30af04f020"
-SRC_URI[sha256sum] = "eaec2cd3c26a1cc101b829d32fef392268285187d1d9eda3718db288e7be28c6"
+SRC_URI[md5sum] = "e4d118a3762a3e60b97a62cf83194efd"
+SRC_URI[sha256sum] = "1ef900b9cb3ffb617c433a3247a9d67ff36c9455cbc9c34175bee24bdbfdf731"
 
 S = "${WORKDIR}/node-v${PV}"
 
-- 
2.9.0


