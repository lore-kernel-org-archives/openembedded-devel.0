Return-Path: <rehsack@gmail.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id AA2AF7FA4C
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 Jan 2020 13:40:29 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id p17so15321729wmb.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Jan 2020 05:40:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id;
	bh=h3B7+QoqBVQIxA22cxVAeA4aZmcp6Zli9nT7/HRNf4M=;
	b=VHeKUxlwlXSQXev637uRAEd1QjJsiKA9G6cu2mF7G3u00KV1X5+Ml8eFfB5Tn3I5hT
	HV6oNNxVX7Wc7QidTTtPqFXqMHY2w3UMHJ2fL0bDNI6JiOzxaPby0yV8/m/PSIK+VYHH
	0s9jDoiUGeKAWkFLmFzV1jpzkHLwQ7npOeJsoRY39MfMKh+7A3FwQUS7q6GENoMuLVUn
	GrsAR1RChWtSaUrDUPd5hBE5GA04toutn+c6Z26X9EfanYr2A/wWBl15LgJ4yO98MTKi
	4o8IVfMTn5z9jYNQQigncB/awEljh6iWF43kzvbSLM4Wwlbik/Yt5hBO/XkQQ7GQigdN
	rQvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=h3B7+QoqBVQIxA22cxVAeA4aZmcp6Zli9nT7/HRNf4M=;
	b=thxJZ7aFXUt9JIXRKy7IT4z/ctupzDohdK6/oRvVikS8Nr2r2FYpWI7S8JUON9Z/Cr
	J/0WB+/u0BtvhiKtvB3Btp7hbA7m6lkSrfwouTpx9utuJYYCGnq5TsW+4f7pX4szWS1n
	r8+pTO6VyEYczii8LE1ETqpxbYf9K/oSb1Auo0izWaKisoDEefNlwkA5iyjowYJ7wUzg
	6OHZ+0DGVmMqqN473NgpzIUOtneE+5zVM+0D5Wu8nxA4iXrk2eaxXy9sK12RyZHRs12H
	dqwaQWe3Tyn4LaaZ4qra3L/AWEiWwE2TRWCirFwt2HtjfwG7XwW9o/3ob7BjADRSeomD
	UUDA==
X-Gm-Message-State: APjAAAUB10TJp+Gj2fKt3NWivacUAJoB6h0xynUXOFIvE2te+6TLkzEU
	VPXuHX7PSfitkIUJelJ5beAasmrONxs=
X-Google-Smtp-Source: APXvYqxGMboib7ywNsBA2tS7ElbE2gvHpe1yD0f7e8drQ9rC/vkRhpyzkXiZSts1C3Vz1IbrIKh53A==
X-Received: by 2002:a7b:cd11:: with SMTP id f17mr35263050wmj.48.1578318030075; 
	Mon, 06 Jan 2020 05:40:30 -0800 (PST)
Received: from beaker.muppets.liwing.de (p5B25B970.dip0.t-ipconnect.de.
	[91.37.185.112]) by smtp.gmail.com with ESMTPSA id
	z6sm74550296wrw.36.2020.01.06.05.40.29
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 06 Jan 2020 05:40:29 -0800 (PST)
Sender: Jens Rehsack <rehsack@gmail.com>
From: Jens Rehsack <sno@netbsd.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  6 Jan 2020 14:40:23 +0100
Message-Id: <20200106134023.23589-1-sno@netbsd.org>
X-Mailer: git-send-email 2.17.1
Cc: Jens Rehsack <sno@netbsd.org>
Subject: [meta-perl][PATCH v2] libunix-statgrab: add recipe
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
X-List-Received-Date: Mon, 06 Jan 2020 13:40:29 -0000

Add recipe for Unix::Statgrab perl module, a sane language binding for
libstatgrab.

Signed-off-by: Jens Rehsack <sno@netbsd.org>
---
 .../libstatgrab/libunix-statgrab_0.112.bb     | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 meta-perl/recipes-perl/libstatgrab/libunix-statgrab_0.112.bb

diff --git a/meta-perl/recipes-perl/libstatgrab/libunix-statgrab_0.112.bb b/meta-perl/recipes-perl/libstatgrab/libunix-statgrab_0.112.bb
new file mode 100644
index 000000000..a1bb4a399
--- /dev/null
+++ b/meta-perl/recipes-perl/libstatgrab/libunix-statgrab_0.112.bb
@@ -0,0 +1,38 @@
+SUMMARY = "Perl interface to the libstatgrab library"
+DESCRIPTION = "Unix::Statgrab is a wrapper for libstatgrab as available from \
+<http://www.i-scream.org/libstatgrab/>. It is a reasonably portable attempt \
+to query interesting stats about your computer. It covers information on \
+the operating system, CPU, memory usage, network interfaces, hard-disks \
+etc."
+
+HOMEPAGE = "https://metacpan.org/release/Unix-Statgrab"
+SECTION = "libs"
+LICENSE = "Artistic-1.0 | GPL-1.0+ | LGPL-2.1+"
+DEPENDS += "libcapture-tiny-perl-native"
+DEPENDS += "libconfig-autoconf-perl-native"
+DEPENDS += "libstatgrab"
+RDEPENDS_${PN} += "\
+    libstatgrab \
+    perl-module-autoloader \
+    perl-module-carp \
+    perl-module-dynaloader \
+    perl-module-exporter \
+    perl-module-strict \
+    perl-module-vars \
+    perl-module-warnings \
+"
+
+SRC_URI = "${CPAN_MIRROR}/authors/id/R/RE/REHSACK/Unix-Statgrab-${PV}.tar.gz"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Artistic-1.0;md5=cda03bbdc3c1951996392b872397b798 \
+    file://${COMMON_LICENSE_DIR}/GPL-1.0;md5=e9e36a9de734199567a4d769498f743d \
+    file://${COMMON_LICENSE_DIR}/LGPL-2.1;md5=1a6d268fd218675ffea8be556788b780 \
+"
+
+SRC_URI[md5sum] = "a6bc06b3f7749f7d77a2b1bd13402821"
+SRC_URI[sha256sum] = "16a29f7acaeec081bf0e7303ba5ee24fda1d21a1104669b837745f3ea61d6afa"
+
+S = "${WORKDIR}/Unix-Statgrab-${PV}"
+
+inherit cpan pkgconfig ptest-perl
+
+BBCLASSEXTEND = "native"
-- 
2.17.1


