Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id C91C479CB2
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  3 Jan 2019 18:49:49 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id t27so34511240wra.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 03 Jan 2019 10:49:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=r/DHth9KSlv7se9o5tyJX19egPySyW9b1H6i7ci6SQA=;
	b=beRqnDSrTLSjA8BcDDnJFdtdGYR1YEOesBmcdxzRNTFTUJ7rie60UTGrdcQhQkbqRi
	hbVfbdHLSYrhdMtGgW/8okyUGM9tYufIDZxCldK5MH2IUxZWApnA2xZdoy1zWyl6h+xP
	0gth2yUhg3E/8gdryIsNBIOyejgOjlkK8CsZtvvUgvsOYC3LM2QsgRS4ajgIkV4DWL3E
	IRDXQ4IVuDiHMiCqFTcXNokP0wKVeMJXWbNjKgL4zyvCdWAI17ViWjGfs72YqIyONcE+
	7LlhcgSwIi2IDFla3wz4ufKKdK98ZxRM8DVpQ5NXcbxBAStMbS5yA0PMNd5HH2uiR9ql
	xyHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=r/DHth9KSlv7se9o5tyJX19egPySyW9b1H6i7ci6SQA=;
	b=NZ7DgD9p9/rpHkkmDrEI6DnjmicIBfQEd/FQJCwkrJoQw7Unv/+dTLK2VOIhBRUI5s
	FV+unT8W+6Zd5k8xK0ZTLRBPo0c/+BkXxWmuLBwt0UHIwxa3NBR9ig8ATmxicc0Hq3rN
	HUvA7dZA7ob/ZknLfnfhiWigAQgEJfxL6697BPTL47aD4ljYtlTiRG3gQPk8WJC014xp
	o4H6vBEFeeChfNGuWPMEPhOBp5ZobNbVHb0QAM3kgl7GAO7xEMkMMsmgmJnFv3lz5oQl
	ILQulCaXplHEkE+l69E/vgYs1W4UiIRc5dZcKXKjkDMjeWwq3j+Uf7o+9+/wjTHlHMPT
	mKDw==
X-Gm-Message-State: AJcUukcxXk3nFE3Ro1BLstpJRwsaOIFKgDCsevll9+8NyDNRP5kPAnWm
	ecQ3PoRAfd8yS91hmP6CcwOARrUxhRg=
X-Google-Smtp-Source: ALg8bN5ZEGoK/jrgbyP1TyYv4hOhD851kTn4sJUf7qgCBipKAdpFB8HlFa4CJ3kgDb+TF9i3LiMdlw==
X-Received: by 2002:a05:6000:51:: with SMTP id
	k17mr39965746wrx.259.1546541390063; 
	Thu, 03 Jan 2019 10:49:50 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	t63sm36302594wmt.8.2019.01.03.10.49.49
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 03 Jan 2019 10:49:49 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  3 Jan 2019 18:49:45 +0000
Message-Id: <20190103184945.8601-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] faad2: upgrade to 2.8.8
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
X-List-Received-Date: Thu, 03 Jan 2019 18:49:50 -0000

Upgrade to the latest release, 2.8.8.

Stop splitting the package up excessively, and use lib_package to put the
binaries into PN-bin.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta-oe/recipes-multimedia/faad2/faad2_2.7.bb   | 31 -------------------------
 meta-oe/recipes-multimedia/faad2/faad2_2.8.8.bb | 14 +++++++++++
 2 files changed, 14 insertions(+), 31 deletions(-)
 delete mode 100644 meta-oe/recipes-multimedia/faad2/faad2_2.7.bb
 create mode 100644 meta-oe/recipes-multimedia/faad2/faad2_2.8.8.bb

diff --git a/meta-oe/recipes-multimedia/faad2/faad2_2.7.bb b/meta-oe/recipes-multimedia/faad2/faad2_2.7.bb
deleted file mode 100644
index 9e5a3817aa..0000000000
--- a/meta-oe/recipes-multimedia/faad2/faad2_2.7.bb
+++ /dev/null
@@ -1,31 +0,0 @@
-SUMMARY = "An open source MPEG-4 and MPEG-2 AAC decoding library"
-HOMEPAGE = "http://www.audiocoding.com/faad2.html"
-SECTION = "libs"
-LICENSE = "GPLv2"
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=381c8cbe277a7bc1ee2ae6083a04c958"
-
-LICENSE_FLAGS = "commercial"
-
-PR = "r1"
-
-inherit autotools
-
-SRC_URI = "${SOURCEFORGE_MIRROR}/faac/faad2-src/faad2-${PV}/${BP}.tar.bz2;name=faad2 \
-"
-
-SRC_URI[faad2.md5sum] = "4c332fa23febc0e4648064685a3d4332"
-SRC_URI[faad2.sha256sum] = "14561b5d6bc457e825bfd3921ae50a6648f377a9396eaf16d4b057b39a3f63b5"
-
-PACKAGES =+ "libfaad libfaad-dev libmp4ff libmp4ff-dev"
-
-FILES_${PN} = "${bindir}/faad"
-
-FILES_libfaad = "${libdir}/libfaad.so.*"
-FILES_libfaad-dev = "${libdir}/libfaad.so ${libdir}/libfaad.la ${includedir}/faad.h"
-FILES_libfaad-staticdev = "${libdir}/libfaad.a"
-
-FILES_libmp4ff = "${libdir}/libmp4ff.so.*"
-FILES_libmp4ff-dev = "${libdir}/libmp4ff.so ${libdir}/libmp4ff.la ${includedir}/mp4ff.h"
-FILES_libmp4ff-staticdev = "${libdir}/libmp4ff.a"
-
diff --git a/meta-oe/recipes-multimedia/faad2/faad2_2.8.8.bb b/meta-oe/recipes-multimedia/faad2/faad2_2.8.8.bb
new file mode 100644
index 0000000000..8b3aafc3b5
--- /dev/null
+++ b/meta-oe/recipes-multimedia/faad2/faad2_2.8.8.bb
@@ -0,0 +1,14 @@
+SUMMARY = "An open source MPEG-4 and MPEG-2 AAC decoding library"
+HOMEPAGE = "http://www.audiocoding.com/faad2.html"
+SECTION = "libs"
+LICENSE = "GPLv2"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=381c8cbe277a7bc1ee2ae6083a04c958"
+
+LICENSE_FLAGS = "commercial"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/faac/faad2-src/faad2-2.8.0/${BP}.tar.gz"
+SRC_URI[md5sum] = "28f6116efdbe9378269f8a6221767d1f"
+SRC_URI[sha256sum] = "985c3fadb9789d2815e50f4ff714511c79c2710ac27a4aaaf5c0c2662141426d"
+
+inherit autotools lib_package
-- 
2.11.0


