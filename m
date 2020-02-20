Return-Path: <viktor.rosendahl@gmail.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 34C55615F8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Feb 2020 15:00:02 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id p9so2342009wmc.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Feb 2020 07:00:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=gL4yno3aE1/iAykXCITIHgWiwMgEBwrCcBUn8Da1KO4=;
	b=o2cQGNekgVJ/pEIenRmWsOsg0U+ShGSWdYoFxLWcB65haIe5ARUycae58E5qD96eS8
	whp/oU55H+efep93wdSCr9lAXj3ZQqELot8apuMKhuUiSVt11snYOicZ7a1bT9B3mXrH
	wywbXnx3GiHVWiuXf1jno9YibzY8yzzKBy837752MNoUIN89C0yeP7r5R51VNjCTP6nn
	QV9lnldd0cNBvlGgY902f9J4C28Xu0OvgQxFupBkVG8UoNDHagMjNZL8L7j2JBiaWJ2b
	Mhi8GSMbLStcm/FP8qwMNkDRqaBoAQJ5pcGeuvT+cczdTo3PevZnShjDqfG0VE+ptCoF
	DrGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=gL4yno3aE1/iAykXCITIHgWiwMgEBwrCcBUn8Da1KO4=;
	b=m6yBqTlmi0z8UQ54/39CyFUFt8zlfvZzdm8qD/EdMV0O0BUBx/9M0P9zijQ+UKBaon
	gdlDLDqJzP+E+t5AQk9WAJD+VhcQOpeB9ipsJplMpV7vmIkV4MesYGZjVkEqbNnHUSCb
	Dl3e4I+YUYlXw6A0hNW8HDsE6eUwjpoHCN1FO2hwV5J7+5qzip3xkYAUs59ljh2RYCYZ
	YK0ZFJLvauqHCUqEkHHYss3sGxqW9i4EmixheEucbuarSadLAoIkbX7gXteO8NlJM6eN
	RODHenajKAMRp+94UEJUnG4WUAryhZvHQ4WiVyG8gexajtkk0Nl7OGfpGXJaFqrjnizG
	2VFQ==
X-Gm-Message-State: APjAAAXN/r18/6WnDevnIhVaAwdjkCVs0jw40962AedtsYs6s52GZMhP
	4NRP4wlsbkePVd3rJP8bADvDju0=
X-Google-Smtp-Source: APXvYqxbw8LMm4Gs+tmqc+RSOmoxui0V6QyMuDCWDA+ErZtiYdk/atCBFWxzS3mH3dTG4J8skfbl+w==
X-Received: by 2002:a7b:cab1:: with SMTP id r17mr4975398wml.116.1582210802574; 
	Thu, 20 Feb 2020 07:00:02 -0800 (PST)
Received: from buster-jangle.bmw-carit.intra ([212.118.206.70])
	by smtp.gmail.com with ESMTPSA id
	e22sm4876308wme.45.2020.02.20.07.00.01
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 20 Feb 2020 07:00:02 -0800 (PST)
From: Viktor Rosendahl <viktor.rosendahl@gmail.com>
X-Google-Original-From: Viktor Rosendahl <viktor.rosendahl@bmw.de>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 20 Feb 2020 15:59:56 +0100
Message-Id: <20200220145958.38718-2-viktor.rosendahl@bmw.de>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200220145958.38718-1-viktor.rosendahl@bmw.de>
References: <20200220145958.38718-1-viktor.rosendahl@bmw.de>
Subject: [zeus][PATCH 1/3] perl: Add libperlio-gzip-perl and libjson-perl
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
X-List-Received-Date: Thu, 20 Feb 2020 15:00:02 -0000

From: Viktor Rosendahl <Viktor.Rosendahl@bmw.de>

We need to add these perl modules in order to make lcov compatible
with gcc9.

Signed-off-by: Viktor Rosendahl <Viktor.Rosendahl@bmw.de>
---
 .../perl/libjson-perl_4.02000.bb              | 22 ++++++++++++++
 .../perl/libperlio-gzip-perl_0.20.bb          | 30 +++++++++++++++++++
 2 files changed, 52 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/perl/libjson-perl_4.02000.bb
 create mode 100644 meta-oe/recipes-devtools/perl/libperlio-gzip-perl_0.20.bb

diff --git a/meta-oe/recipes-devtools/perl/libjson-perl_4.02000.bb b/meta-oe/recipes-devtools/perl/libjson-perl_4.02000.bb
new file mode 100644
index 000000000..4e5a8a6ff
--- /dev/null
+++ b/meta-oe/recipes-devtools/perl/libjson-perl_4.02000.bb
@@ -0,0 +1,22 @@
+SUMMARY = "Perl module to decode/encode json files"
+DESCRIPTION = "This package contains the JSON.pm module with friends. \
+The module implements JSON encode/decode."
+
+HOMEPAGE = "https://metacpan.org/pod/JSON"
+SECTION = "libs"
+LICENSE = "Artistic-1.0 | GPL-1.0+"
+LIC_FILES_CHKSUM = "file://README;beginline=1171;endline=1176;md5=3be2cb8159d094768e67386c453e8bbe"
+
+DEPENDS += "perl"
+
+SRC_URI = "git://github.com/makamaka/JSON.git;protocol=https"
+
+SRCREV = "42a6324df654e92419512cee80c0b49155d9e56d"
+
+S = "${WORKDIR}/git"
+
+inherit cpan
+
+RDEPENDS_${PN} += "perl"
+
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-oe/recipes-devtools/perl/libperlio-gzip-perl_0.20.bb b/meta-oe/recipes-devtools/perl/libperlio-gzip-perl_0.20.bb
new file mode 100644
index 000000000..ffe7a7d99
--- /dev/null
+++ b/meta-oe/recipes-devtools/perl/libperlio-gzip-perl_0.20.bb
@@ -0,0 +1,30 @@
+SUMMARY = "Perl module to manipulate and access gzip files"
+DESCRIPTION = "This package contains the gzip.pm module with friends. \
+The module implements perlio layer for gzip."
+
+HOMEPAGE = "https://metacpan.org/pod/PerlIO::gzip"
+SECTION = "libs"
+LICENSE = "Artistic-1.0 | GPL-1.0+"
+LIC_FILES_CHKSUM = "file://README;beginline=55;endline=61;md5=bc3da2dec1fbea59ac91172c5e0eb837"
+
+DEPENDS += "perl"
+
+SRC_URI = "https://cpan.metacpan.org/authors/id/N/NW/NWCLARK/PerlIO-gzip-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "0393eae5d0b23df6cf40ed44af7d711c"
+SRC_URI[sha256sum] = "4848679a3f201e3f3b0c5f6f9526e602af52923ffa471a2a3657db786bd3bdc5"
+
+S = "${WORKDIR}/PerlIO-gzip-${PV}"
+
+EXTRA_CPANFLAGS = "EXPATLIBPATH=${STAGING_LIBDIR} EXPATINCPATH=${STAGING_INCDIR}"
+
+inherit cpan
+
+do_compile() {
+	export LIBC="$(find ${STAGING_DIR_TARGET}/${base_libdir}/ -name 'libc-*.so')"
+	cpan_do_compile
+}
+
+RDEPENDS_${PN} += "perl perl-module-perlio"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1


