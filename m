Return-Path: <net147@gmail.com>
Received: from mail-pd0-f178.google.com (mail-pd0-f178.google.com
	[209.85.192.178])
	by mail.openembedded.org (Postfix) with ESMTP id BFEAF6AB9F
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Jul 2015 07:20:54 +0000 (UTC)
Received: by pdbep18 with SMTP id ep18so120688228pdb.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Jul 2015 00:20:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=bU/Jm2eA+m9Px3kLuOJyYgVp6KcOxxhlSVNJDaFHrcY=;
	b=maZuTAukHPndp/X56sFoxew2eyuZwc5Rpkl/VZKr2RzF6HOPxWppaKcetFlKX4Oy/c
	DLjy5W6xAKvATgaCmw3Ij9gUp2IBAGDs4sKJ3ngFUgHJj8VE1H8q3Y2jm6kDHHn9yQeF
	mTP9dx0ByGOlgaFKquJGkxTekfspPlqSYa1cv5lxtw9d54X9Uwcp0dkkFokfQUwxGNVy
	00UmTgCF5FobZwvUKdwJ1vnLeXx6W8o+VtZ+TAD65MoDkS4YFSOaNwQo0GBl4Gh0LJI9
	kgMsncx0I27ihnq8xtf1GWbrJANdCxZ8rw+9l04au+9A97rwCxM2Uz0p6ORy6AKUHTva
	NlHA==
X-Received: by 10.70.33.135 with SMTP id r7mr5812051pdi.121.1436253654259;
	Tue, 07 Jul 2015 00:20:54 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id j3sm17696570pdf.76.2015.07.07.00.20.52
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 07 Jul 2015 00:20:53 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  7 Jul 2015 17:20:48 +1000
Message-Id: <1436253648-15503-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 2.4.4
Subject: [meta-oe][meta-systemd][PATCH] nodejs: update to 0.12.6
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
X-List-Received-Date: Tue, 07 Jul 2015 07:20:56 -0000

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 .../recipes-devtools/nodejs/{nodejs_0.12.5.bb => nodejs_0.12.6.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/nodejs/{nodejs_0.12.5.bb => nodejs_0.12.6.bb} (95%)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_0.12.5.bb b/meta-oe/recipes-devtools/nodejs/nodejs_0.12.6.bb
similarity index 95%
rename from meta-oe/recipes-devtools/nodejs/nodejs_0.12.5.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs_0.12.6.bb
index 5685721..73c0557 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_0.12.5.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_0.12.6.bb
@@ -9,8 +9,8 @@ SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.gz \
     file://enable-armv5e-build.patch \
     file://no-registry.patch \
 "
-SRC_URI[md5sum] = "aa6d22762e70b4f46293a17373788291"
-SRC_URI[sha256sum] = "4bc1e25f4c62ac65324d3cf4aa9de2d801cd708757c3567b6ad2ced7df30cdd2"
+SRC_URI[md5sum] = "698ebd8ecd5c9c61091875bbd54401f4"
+SRC_URI[sha256sum] = "7a3b5ac351973a9dee8edbf0684bc8d0dea44b231e42274ffb008141ffa19ad2"
 
 S = "${WORKDIR}/node-v${PV}"
 
-- 
2.4.4


