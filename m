Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id CA50D752A5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Jun 2018 20:08:28 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id m13-v6so2119136qth.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Jun 2018 13:08:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=sYPq7QXAF9xxK8Cl8BVzLH3zqiSJpFbEzmJBpoNeBIM=;
	b=pogcj7Cj/rj+biYesIQurkSkv+xPC07NjJ7s1IZZSIH+pvx+yvAzPJpsrpLH5l+NW+
	d2FH232/UDH/pmaQc4jclNdXI9AGoA9wmuWJM3AIV8Fs9DHuHzAIu42Vsad4jvjoSMpI
	EK7oCOcWeD1LPuQ6IfqgDPaMgnj6BmdFhEf3B6vJDNunxRsjhhnxkxXUn9JPxc0ilFIh
	ruEIu4ytgbVnVLIlMzbY9aI3dluX88ky3EmS6MvqA+TjMxj6R4EMferaQwtRtc0OfxJr
	W4EqrFDJlE+BJ7hn0SeaM1GpjqfVE+1obHVt/+JFPnnLhi+JSNmKpWdJOezgRF2u29eZ
	0euQ==
X-Gm-Message-State: APt69E0LdvtIwhJSwMKbhiW20gj74ccw55/co6ar8Ccsx+WqLjqRwym+
	suydEvi71TNdhB5QmxIuGpkGDi0h
X-Google-Smtp-Source: AAOMgpeWeuhS/SCGF5z8CQnDpIKwo1QW+isDD5d7TyYOh/s2d6p5uKChhjRlJIRtqeEdcI+FoYHbDA==
X-Received: by 2002:ac8:914:: with SMTP id
	t20-v6mr15125024qth.298.1530302909340; 
	Fri, 29 Jun 2018 13:08:29 -0700 (PDT)
Received: from sparta.ny.asterius.io
	(pool-100-33-240-84.nycmny.fios.verizon.net. [100.33.240.84])
	by smtp.gmail.com with ESMTPSA id
	k30-v6sm8730873qtc.31.2018.06.29.13.08.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 29 Jun 2018 13:08:28 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 29 Jun 2018 16:08:25 -0400
Message-Id: <1530302905-17394-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-pyasn1-modules: update to version 0.2.2
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
X-List-Received-Date: Fri, 29 Jun 2018 20:08:29 -0000

License-Update: Checksum changed due to copyright year update

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-pyasn1-modules.inc       | 6 +++---
 ...ython-pyasn1-modules_0.2.1.bb => python-pyasn1-modules_0.2.2.bb} | 0
 ...hon3-pyasn1-modules_0.2.1.bb => python3-pyasn1-modules_0.2.2.bb} | 0
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pyasn1-modules_0.2.1.bb => python-pyasn1-modules_0.2.2.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-pyasn1-modules_0.2.1.bb => python3-pyasn1-modules_0.2.2.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pyasn1-modules.inc b/meta-python/recipes-devtools/python/python-pyasn1-modules.inc
index 9fa54cf..87dbd1d 100644
--- a/meta-python/recipes-devtools/python/python-pyasn1-modules.inc
+++ b/meta-python/recipes-devtools/python/python-pyasn1-modules.inc
@@ -4,10 +4,10 @@ DESCRIPTION = "A collection of ASN.1 modules expressed in form of pyasn1\
  data structures (X.509, PKCS etc.)."
 HOMEPAGE = "https://github.com/etingof/pyasn1-modules"
 LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=280606d9c18f200e03e0c247ac61475a"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=815ac3f9ca693006349094b358ab3155"
 
-SRC_URI[md5sum] = "ff938698590f314ff9b3d5c48737d899"
-SRC_URI[sha256sum] = "af00ea8f2022b6287dc375b2c70f31ab5af83989fc6fe9eacd4976ce26cd7ccc"
+SRC_URI[md5sum] = "65ce1ea1021679bffe96065baab232de"
+SRC_URI[sha256sum] = "a0cf3e1842e7c60fde97cb22d275eb6f9524f5c5250489e292529de841417547"
 
 inherit pypi
 
diff --git a/meta-python/recipes-devtools/python/python-pyasn1-modules_0.2.1.bb b/meta-python/recipes-devtools/python/python-pyasn1-modules_0.2.2.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pyasn1-modules_0.2.1.bb
rename to meta-python/recipes-devtools/python/python-pyasn1-modules_0.2.2.bb
diff --git a/meta-python/recipes-devtools/python/python3-pyasn1-modules_0.2.1.bb b/meta-python/recipes-devtools/python/python3-pyasn1-modules_0.2.2.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pyasn1-modules_0.2.1.bb
rename to meta-python/recipes-devtools/python/python3-pyasn1-modules_0.2.2.bb
-- 
2.7.4


