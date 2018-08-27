Return-Path: <rehsack@gmail.com>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id D5CB760685
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Aug 2018 14:27:55 +0000 (UTC)
Received: by mail-wm0-f49.google.com with SMTP id o18-v6so8527423wmc.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Aug 2018 07:27:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id;
	bh=w8y0qeqvDeNl2qtZu5C6QMIpQD5RPz3AK4dhl/VveNU=;
	b=H9W7Cqb6p7ksSGig2M1ir0q75EgpRoRjTFpb8w9rqJH+s26WHAL3q6EYGIJiYxzy63
	GYsHSvSYePzo+Z4/Q4MKiZxXGVo3UzCJ0BBJXKbLRCyjA2aBrI6r0HhHYHQbmWq8oRRT
	+cqvYF/1pK6gqX9eUYm/9fboPoFqgWUpbMv+cnTedS677ZmIWy8BRG07b2Mcm7wqPPY+
	0MlB0JoZIptodL9yPaKF3YAOpFkw/wBvtiC6nJL1X9QuwXFSM40kFHdDkPVkqWkVG455
	UYFes1TtyB8SIIToeMva6tqcg7+jH8jzu5Hw5PpJS4jEXcih2hSlkxkn1E5llW8v5L2x
	lVtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=w8y0qeqvDeNl2qtZu5C6QMIpQD5RPz3AK4dhl/VveNU=;
	b=d6unD2ZXEWf1W7r/kOxe9cK6jme7m2ioM1qUOqjZzIFrdDXxnoF0HWJBNAOfyIduTS
	XTjN9NBhYFVwz+JA1cjnC8Jcz7Gb7x/W9/pM05RLXfGADmLs6JRDMwhwhachVsyVWEEp
	pLVPZmbOs0mwHIunfVW1cL311yMQjsee2KK1dJheisXJ1RMzmVwbQHorH94fw3Vuc9Pw
	4Y52hQKSY9urw4CmTnqkRJYB0ioFtD3IVmU9lKAYmbozeuDv0+qErwHjaptz2oaRF7oa
	3s12NvDYcAGMPzsh06KR13wU/szoWeZ+ZuYpVGsxuhwr2hnE8didwVAMe5W9JdEpiZHD
	ZS6w==
X-Gm-Message-State: APzg51Cskiv7ZsO+/3yB5qn2qgWHeCfE9t3GPqgy8L0lKC6ra+IqI6k3
	MHGiGWAhZLINR0bVI1wX4i4NMHaq
X-Google-Smtp-Source: ANB0VdZkeVolwsjECkHOXR7652bjtePWGQ29d/DuAqg8GwGZ8gBgk/U6r3wcggSgxUGde/D4hSQTHQ==
X-Received: by 2002:a1c:3e8e:: with SMTP id
	l136-v6mr2252669wma.72.1535380076540; 
	Mon, 27 Aug 2018 07:27:56 -0700 (PDT)
Received: from beaker.muppets.liwing.de (b2b-78-94-80-58.unitymedia.biz.
	[78.94.80.58]) by smtp.gmail.com with ESMTPSA id
	j44-v6sm25766083wre.40.2018.08.27.07.27.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 27 Aug 2018 07:27:55 -0700 (PDT)
Sender: Jens Rehsack <rehsack@gmail.com>
From: Jens Rehsack <sno@netbsd.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 27 Aug 2018 16:27:37 +0200
Message-Id: <20180827142738.18615-1-sno@netbsd.org>
X-Mailer: git-send-email 2.17.1
Cc: Jens Rehsack <sno@netbsd.org>
Subject: [meta-perl][PATCH 1/2] libcrypt-openssl-guess: Add recipe
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
X-List-Received-Date: Mon, 27 Aug 2018 14:27:56 -0000

Add recipe for CPAN hosted Perl5 module Crypt::OpenSSL::Guess
version 0.11 as prerequisite for libcrypt-openssl-rsa-perl update
to express our love for the Perl Programming Language.

Signed-off-by: Jens Rehsack <sno@netbsd.org>
---
 .../libcrypt/libcrypt-openssl-guess_0.11.bb   | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 meta-perl/recipes-perl/libcrypt/libcrypt-openssl-guess_0.11.bb

diff --git a/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-guess_0.11.bb b/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-guess_0.11.bb
new file mode 100644
index 000000000..21be04720
--- /dev/null
+++ b/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-guess_0.11.bb
@@ -0,0 +1,21 @@
+SUMMARY = "Guess OpenSSL include path"
+SECTION = "libs"
+LICENSE = "Artistic-1.0 | GPL-1.0+"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=ea914cc2718e8d53bd7744d96e66c03c"
+
+SRC_URI = "http://www.cpan.org/modules/by-module/Crypt/Crypt-OpenSSL-Guess-${PV}.tar.gz "
+
+SRC_URI[md5sum] = "e768fe2c07826b0ac9ea604c79f93032"
+SRC_URI[sha256sum] = "aa6b18e38cb852cbad80a58cd90c395b40819d4d01e0ab37e7703149094d7167"
+
+DEPENDS += "openssl"
+
+RDEPENDS_${PN}="perl-module-config perl-module-exporter perl-module-symbol perl-module-file-spec"
+
+EXTRA_CPANFLAGS = "INC='-I${STAGING_INCDIR}' LIBS='-L${STAGING_LIBDIR} -lssl -L${STAGING_DIR_TARGET}${base_libdir} -lcrypto'"
+
+S = "${WORKDIR}/Crypt-OpenSSL-Guess-${PV}"
+
+inherit cpan
+
+BBCLASSEXTEND = "native"
-- 
2.17.1


