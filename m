Return-Path: <rehsack@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id ED3827F876
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 Jan 2020 13:40:13 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id z7so49553345wrl.13
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Jan 2020 05:40:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id;
	bh=muZx1gcGmAjmqeNQqd6lWx9xnHjHcLeeMM9i042TZcc=;
	b=WKFkUoBaF0uwcUSXjSooYJK3ICYBKA3yCIo6CQCPwiPMjjo7qPh/TZ8XsrjSMav2Bm
	66DcyFoUVrt2/o4DDjUP3eoXSaUm4uwiXgCDRc01SIzP0U9l/hkkbDcAYZjE/JxYWRQm
	/RJaTZZWDanP8Jgf3mZrEvp6dwWiLjn7gLznLVCb/DhpUSjM3SEnRwhxr8x6+fA0W0Q2
	VYiVJ3cNf5WCaOnD1kjh5Di73vemLxQfEgAt1xXENBIuJDUNy2y7DfYudAO9mH9nyX5W
	xRR6nAZcmXNzVcafZ8gTeRiGUwMZKt24w/ZJGx5poKag+CTmKsbb1h0V/v507z3ah46L
	8X7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=muZx1gcGmAjmqeNQqd6lWx9xnHjHcLeeMM9i042TZcc=;
	b=GBHqYbeWt4JWyVADFJPkRB3R1sFvKOJPWk38b4v1ol/uIo/qNFAjDFOF8nS6yWK6uT
	ymRZIqFD6t6mftQfkj06oruoUkLu7xYf5En45w8WFAfsFuyFsNIOGmCn0IzqJxRIo+ll
	+dAn/iGG7mojtqRr5pXemh7tU6RuT8YCjAOQv9X2fbSj4lDypsjve5zNdNGBjLZdkmU8
	qpXlwwZWYkvBmL77NFGpcGUcQIah2qneW6W68Su9SAwrZQt6CuNgUMuPplUFl2MUfPAh
	yzNKaZnkggkjdeeM9uMFccu/A48hko7OMftDHeCaFpKOtiw9cDUEaOi669YXNlPevzm6
	soIA==
X-Gm-Message-State: APjAAAUfMpCZvtZHGLWeUkphSQ4mcFRPZ9b1hyCL2+x7ALcVJjUYzDKT
	sOuLRazxPhptpIWMr7eD64A3dCgk0bs=
X-Google-Smtp-Source: APXvYqzFCVWf64zmLX0OKo/e3uMeHQbchTGvbqBY8eTgmlTi4DdyJwUJ90sOS4rNPpeVmmhv4TsLOw==
X-Received: by 2002:a05:6000:1288:: with SMTP id
	f8mr103145106wrx.66.1578318014374; 
	Mon, 06 Jan 2020 05:40:14 -0800 (PST)
Received: from beaker.muppets.liwing.de (p5B25B970.dip0.t-ipconnect.de.
	[91.37.185.112]) by smtp.gmail.com with ESMTPSA id
	e6sm70975694wru.44.2020.01.06.05.40.13
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 06 Jan 2020 05:40:13 -0800 (PST)
Sender: Jens Rehsack <rehsack@gmail.com>
From: Jens Rehsack <sno@netbsd.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  6 Jan 2020 14:39:57 +0100
Message-Id: <20200106133957.8305-1-sno@netbsd.org>
X-Mailer: git-send-email 2.17.1
Cc: Jens Rehsack <sno@netbsd.org>
Subject: [meta-perl][PATCH v2] libconfig-autoconf-perl: add recipe
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
X-List-Received-Date: Mon, 06 Jan 2020 13:40:14 -0000

Introduce Config::Autoconf module to meta-perl which will allow some
probes can be run without leaving perl5 context.

Signed-off-by: Jens Rehsack <sno@netbsd.org>
---
 .../libconfig-autoconf-perl_0.318.bb          | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 meta-perl/recipes-perl/libconfig/libconfig-autoconf-perl_0.318.bb

diff --git a/meta-perl/recipes-perl/libconfig/libconfig-autoconf-perl_0.318.bb b/meta-perl/recipes-perl/libconfig/libconfig-autoconf-perl_0.318.bb
new file mode 100644
index 000000000..e4f8fe7e2
--- /dev/null
+++ b/meta-perl/recipes-perl/libconfig/libconfig-autoconf-perl_0.318.bb
@@ -0,0 +1,41 @@
+# Copyright (C) 2020 Jens Rehsack <sno@netbsd.org>
+# Released under the MIT license (see COPYING.MIT for the terms)
+
+SUMMARY = "A module to implement some of AutoConf macros in pure perl"
+DESCRIPTION = "Config::AutoConf is intended to provide the same opportunities to Perl \
+developers as GNU Autoconf <http://www.gnu.org/software/autoconf/> does for \
+Shell developers."
+
+HOMEPAGE=       "https://metacpan.org/release/Config-AutoConf"
+
+SECTION = "libs"
+LICENSE = "Artistic-1.0 | GPL-1.0+"
+
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Artistic-1.0;md5=cda03bbdc3c1951996392b872397b798 \
+file://${COMMON_LICENSE_DIR}/GPL-1.0;md5=e9e36a9de734199567a4d769498f743d"
+
+SRC_URI = "${CPAN_MIRROR}/authors/id/R/RE/REHSACK/Config-AutoConf-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "0bea721ad3996e20324b84b3b924ec71"
+SRC_URI[sha256sum] = "33c930feec3003de251ca222abe8bbeb74610ad07f65fc16f27d74d195eeab34"
+RDEPENDS_${PN} += "libcapture-tiny-perl"
+RDEPENDS_${PN} += "perl-module-base"
+RDEPENDS_${PN} += "perl-module-carp"
+RDEPENDS_${PN} += "perl-module-config"
+RDEPENDS_${PN} += "perl-module-constant"
+RDEPENDS_${PN} += "perl-module-file-basename"
+RDEPENDS_${PN} += "perl-module-file-spec"
+RDEPENDS_${PN} += "perl-module-file-temp"
+RDEPENDS_${PN} += "perl-module-extutils-cbuilder"
+RDEPENDS_${PN} += "perl-module-extutils-cbuilder-platform-unix"
+RDEPENDS_${PN} += "perl-module-scalar-util"
+RDEPENDS_${PN} += "perl-module-strict"
+RDEPENDS_${PN} += "perl-module-text-parsewords"
+RDEPENDS_${PN} += "perl-module-warnings"
+RRECOMMENDS_${PN} += "libfile-slurper-perl"
+
+S = "${WORKDIR}/Config-AutoConf-${PV}"
+
+inherit cpan ptest-perl allarch
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1


