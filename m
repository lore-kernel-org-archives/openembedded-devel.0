Return-Path: <rehsack@gmail.com>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 2537F78CE4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Aug 2018 13:21:24 +0000 (UTC)
Received: by mail-wm0-f43.google.com with SMTP id b19-v6so1912869wme.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Aug 2018 06:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id;
	bh=w8y0qeqvDeNl2qtZu5C6QMIpQD5RPz3AK4dhl/VveNU=;
	b=kBpLDzujm74ycKkKz0Ved14Nx8s82ajWpo8V7rM+v0AxaX/VHhIlWE56UyiaIZ+g0H
	F1Ndckqqqgc1t9LYmchHUwi+c2ri7DxJwXtwTQZnlDJnEhg6OO9zE1x6g1kO/MUQlSpf
	8L6lfp2D15L+wVn6LRsU82C8iRyI436Bw4+/pWFGaJzKXP0h20Gc2j1QIa5V+rCZXkrj
	2dGNwzf6Nv07zSer25PtapKBKPgzRWl+cwvBND3DV3w/OfAWkyLpuQhVP587zYIex7Yw
	oXzzn9c3zwclXbeqOW/PuN3D4ktpY7kND1OjotVu6zzxP8xJAEjKeeui++N0tNJRXXWf
	oeYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=w8y0qeqvDeNl2qtZu5C6QMIpQD5RPz3AK4dhl/VveNU=;
	b=rE8vurimrT5BBCWPlTra/zL55p4RVb6opChUlw2vycwwQzszSG+XI5aqTygXG9pPvp
	yE7C/ayg6xd18th3t5VOJtd5AFP7Tj6NZ85fVqh9mfhxNE3F84wYS/RalcldW+1AF7a0
	C5yQTIfJaMaq0EBt0kaE5L1ISay2taQJq7GTD0wi+uYJzxZwtB6aLZZFEK8OIpqUFtQD
	s+HJF6VezchYQ2gtaj2JsO0/+AY4MNJYV/b+nYYfgPCbY6zJgrCACjDIvpgkjFXQqA+J
	0u41ndBErZJAW5GZOa+MMFPPCVGhrd90hPhw2Yp3M7+TABhCUebO+yk/j6YjoYlUTn0n
	WWhA==
X-Gm-Message-State: APzg51BJJUI2mDYOjABl19gBRwNnRYB4eL37+sgOwrbHZNSCLybdKllZ
	ap8B+3R/TI+Vt8hJjHhQf91ZxwiT
X-Google-Smtp-Source: ANB0VdYRrj9kmZeE4NzInSxjA12zQqqjx86bM+Sl+dkg8Ks3kCkjpxGqqeb5dJk7/OncrFjSzY4OnQ==
X-Received: by 2002:a1c:8291:: with SMTP id
	e139-v6mr1455087wmd.39.1535462484754; 
	Tue, 28 Aug 2018 06:21:24 -0700 (PDT)
Received: from beaker.muppets.liwing.de (b2b-78-94-80-58.unitymedia.biz.
	[78.94.80.58]) by smtp.gmail.com with ESMTPSA id
	d10-v6sm2350488wrv.70.2018.08.28.06.21.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 28 Aug 2018 06:21:23 -0700 (PDT)
Sender: Jens Rehsack <rehsack@gmail.com>
From: Jens Rehsack <sno@netbsd.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 28 Aug 2018 15:21:05 +0200
Message-Id: <20180828132106.22102-1-sno@netbsd.org>
X-Mailer: git-send-email 2.17.1
Cc: Jens Rehsack <sno@netbsd.org>
Subject: [meta-perl][PATCH v2 1/2] libcrypt-openssl-guess: Add recipe
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
X-List-Received-Date: Tue, 28 Aug 2018 13:21:24 -0000

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


