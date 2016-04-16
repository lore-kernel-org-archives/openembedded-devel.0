Return-Path: <net147@gmail.com>
Received: from mail-pa0-f50.google.com (mail-pa0-f50.google.com
	[209.85.220.50])
	by mail.openembedded.org (Postfix) with ESMTP id AF2176014F
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Apr 2016 01:42:08 +0000 (UTC)
Received: by mail-pa0-f50.google.com with SMTP id fs9so41474157pac.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Apr 2016 18:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=9FXl80UPUmc2eMf8XlLLzfHMXKmsyMaaUa2iaNp4mRo=;
	b=xv5HAdSDMs+FyXAz0gNyt4fW9W++owPT+Xfd6O9t/blysIAxOpEtZfXKzwlp2LAe4s
	MqO6QJzdfyMvVUH0c/lOLV938oFLJ3mG+m7iIgbGGZWewfdbZspyefcHHJhyCARX3fNx
	uDDBRha8/x2vCchWw/z0Dkypqe+U1KxGmaSzG2ZKT0/PkurG1HhPMSqK+tITVstGZHaS
	ni6K0MO1njFHJwf6eDL2btVtf04PegngLDWO+G+rz0bTf6BLPgPUtL1SUdeEqGCBaa6E
	WHrXJXXN8AWiO0B86/t814r1Cex508L92g1Cu5rFS3eePYEnHIQZ3vcr1+zFJ8cxNw/l
	dRHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=9FXl80UPUmc2eMf8XlLLzfHMXKmsyMaaUa2iaNp4mRo=;
	b=jBr+aM+g0vxlrBtjrkLYQ8nPWBZycjUxwIbkthVYE2q19Gtn0XqfP1xOUt/0WrDFmb
	5BF2eT+ppWqnmXTA1kPF77p2qdfdtWr0WD+EqqS6TWrXm5m1eHYLeXKlOvRWosiq+oE3
	vcvkM4rrpCz1ELUjcaJVMRX/0lGnVNjJCjorHk+JVcKHuC7UjkKLTf5rgnX2i+a/Ryfo
	/nDrFfWkb7Q+7V0iwb06ukearO1N3OlsdhZNqKmsiBFw41ShfN1Z82G7mp2PybWqRLtF
	wgFdSU6DCPnq1Iipq21PDkHUrPWDxGdK6G3zEM4tfAMl6ZfRkh8ja3W13u44DoPsslOy
	zdiA==
X-Gm-Message-State: AOPr4FXGs8ZPNgLKTHIGgpmtWqsn4XBfEakRQ6d3lPdn7f5uLqCOzAp5GRwJArnDZpAtMA==
X-Received: by 10.66.236.232 with SMTP id ux8mr33596608pac.145.1460770929112; 
	Fri, 15 Apr 2016 18:42:09 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by smtp.gmail.com with ESMTPSA id
	z2sm67329450pfa.90.2016.04.15.18.42.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 15 Apr 2016 18:42:08 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 16 Apr 2016 11:42:03 +1000
Message-Id: <1460770923-9369-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-oe][PATCH] nodejs: update to 4.4.3
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
X-List-Received-Date: Sat, 16 Apr 2016 01:42:10 -0000

LICENSE checksum has changed due to OpenSSL copyright year being
bumped from 1998-2011 to 1998-2016.

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 .../recipes-devtools/nodejs/{nodejs_4.4.2.bb => nodejs_4.4.3.bb}    | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-devtools/nodejs/{nodejs_4.4.2.bb => nodejs_4.4.3.bb} (93%)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_4.4.2.bb b/meta-oe/recipes-devtools/nodejs/nodejs_4.4.3.bb
similarity index 93%
rename from meta-oe/recipes-devtools/nodejs/nodejs_4.4.2.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs_4.4.3.bb
index 830677b..43761ae 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_4.4.2.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_4.4.3.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "nodeJS Evented I/O for V8 JavaScript"
 HOMEPAGE = "http://nodejs.org"
 LICENSE = "MIT & BSD & Artistic-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=b70c304f43f326ddbc3474ba2b685522"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=96aa1ac122c41f8c08a0683d4b2126b5"
 
 DEPENDS = "openssl"
 
@@ -12,8 +12,8 @@ COMPATIBLE_MACHINE_mips64 = "(!.*mips64).*"
 SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz \
     file://no-registry.patch \
 "
-SRC_URI[md5sum] = "3ace056f387d88ccbff44c1792e33d31"
-SRC_URI[sha256sum] = "49051fd930e36181509dc8fcf584fc01971083b6bf9e14f2bbec49cc9c4224e9"
+SRC_URI[md5sum] = "74e83c9c512bd99b38a02edd740b4334"
+SRC_URI[sha256sum] = "57499bb0b1b86080459d4066e3c138579a278b2d0b1f5b2f19e66c69b4e8433c"
 
 S = "${WORKDIR}/node-v${PV}"
 
-- 
2.7.4


