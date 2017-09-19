Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id 1C386780B8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Sep 2017 14:36:18 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id u48so2438773qtc.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Sep 2017 07:36:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=wFFO/jmxJK+cmS4Hm8hQxB0rc+CKFo9ZBpd4hEL/1tY=;
	b=XF1QGSWnDzpzYH2mI2x4NASLuAQOsTWNxqUY8xoWySNXbnTjwZvrhI8NwWPYWOPurw
	FCGtzhCThEQgAzuAsD9XiqSujTJ9UacqarsmHCBFTghFqTtFIh+JLpMlLKYpztrZUjcx
	mKbOFE+X7nvqQop/TYxdBGsYvUQHqtXymyTZPa9AbI863qPRtlvBnbH7VQ1M5AsJ73cE
	xAUfvrwZB5ETOwNQkQXtYRD1coEF5t+V/GpiNeY/rrJeT3GFAnRYKLhRnKv4xuHFlhv3
	OILKxy33D+2S/qOI7aiquza83ejsom6IwH7XDjq6ovaf7AjJeF3ThtMk1nk3w0znv55C
	osew==
X-Gm-Message-State: AHPjjUhRf0L2OdX+Ottm8KxWHgZC2O30O9b7ngdVo5uHEEdv+NtinwNb
	sOJYNrzbH8pM97GbYB6UKVbHfLck
X-Google-Smtp-Source: AOwi7QDKnMDZzOIQ4rR0LPud79Bzv/7ArfX54PxjvjgaHllS6r7+zgwy4KYjsKqdctFmSDopAhLP5w==
X-Received: by 10.237.62.129 with SMTP id n1mr2384923qtf.39.1505831779922;
	Tue, 19 Sep 2017 07:36:19 -0700 (PDT)
Received: from sparta.ny.asterius.io
	(pool-108-30-199-218.nycmny.fios.verizon.net. [108.30.199.218])
	by smtp.gmail.com with ESMTPSA id w23sm7135731qtj.0.2017.09.19.07.36.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 19 Sep 2017 07:36:18 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 19 Sep 2017 10:36:12 -0400
Message-Id: <1505831772-31480-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-pyasn1: update to version 0.3.5
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
X-List-Received-Date: Tue, 19 Sep 2017 14:36:19 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-pyasn1.inc                 | 4 ++--
 .../python/{python-pyasn1_0.3.4.bb => python-pyasn1_0.3.5.bb}         | 0
 .../python/{python3-pyasn1_0.3.4.bb => python3-pyasn1_0.3.5.bb}       | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pyasn1_0.3.4.bb => python-pyasn1_0.3.5.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-pyasn1_0.3.4.bb => python3-pyasn1_0.3.5.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pyasn1.inc b/meta-python/recipes-devtools/python/python-pyasn1.inc
index 4166b89..4bb214f 100644
--- a/meta-python/recipes-devtools/python/python-pyasn1.inc
+++ b/meta-python/recipes-devtools/python/python-pyasn1.inc
@@ -3,8 +3,8 @@ HOMEPAGE = "http://pyasn1.sourceforge.net/"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=280606d9c18f200e03e0c247ac61475a"
 
-SRC_URI[md5sum] = "738e645ff075c9eb95fbee0411529323"
-SRC_URI[sha256sum] = "3946ff0ab406652240697013a89d76e388344866033864ef2b097228d1f0101a"
+SRC_URI[md5sum] = "285377a0ebc63a3fe903a08135241997"
+SRC_URI[sha256sum] = "c7a1186416bcdaf19b56f5b2506200306d7d4cf222d3d7c2d4cb600ccacdaf1b"
 
 RDEPENDS_${PN}_class-target += " \
     ${PYTHON_PN}-codecs \
diff --git a/meta-python/recipes-devtools/python/python-pyasn1_0.3.4.bb b/meta-python/recipes-devtools/python/python-pyasn1_0.3.5.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pyasn1_0.3.4.bb
rename to meta-python/recipes-devtools/python/python-pyasn1_0.3.5.bb
diff --git a/meta-python/recipes-devtools/python/python3-pyasn1_0.3.4.bb b/meta-python/recipes-devtools/python/python3-pyasn1_0.3.5.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pyasn1_0.3.4.bb
rename to meta-python/recipes-devtools/python/python3-pyasn1_0.3.5.bb
-- 
2.7.4


