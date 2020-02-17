Return-Path: <viktor.rosendahl@gmail.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 26059614EA
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Feb 2020 16:39:40 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id t14so19160176wmi.5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Feb 2020 08:39:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=gL4yno3aE1/iAykXCITIHgWiwMgEBwrCcBUn8Da1KO4=;
	b=R6BBuFQfAiVvF2V6Xl3BfUJ3AXjIycm7T+YnoS+Gfx4KGn3F4T7ZoSyzHAOnAAU2yd
	BdLQFJdQ9SMhW8Kf4No1DfYWEUZWZHCJr+65lW0utr5JMUQ/QrJ9DRVmbTwGtv+GRwAn
	BSux9Ne5uzOAir4c6J4YNaEyf9VLtKNLEBJaiFhejbI5Ufh7xnh0+Am3FTt+aKmc7H58
	oeHiMwhRVzPtZMFrN0umiZzlZPn+8DKoogsloQHCCx+uQgWlBOEztIj2vYLY0Pk0M3Wj
	5Xn31KvQIhSd5QmnldQpNzpD9fN8I8+1qjwAagniHuXrjiy3rPu/w3cQVNTIXc6e6dhz
	3rEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=gL4yno3aE1/iAykXCITIHgWiwMgEBwrCcBUn8Da1KO4=;
	b=Pdc+C5tqjJvnCzmpz6vUzphzUxxEbpvL+Zgh4VGo/MEUwFyfKmv+R0DeMc5TUTaPtY
	E9+k3NtpWbslQj3lnAjXpYi44gsfSCBYzmmhNCmQ4/1mX7hwhlAWubUf9+WOJusxW9uY
	d3PfpXZziRS6Q/i8Ma93asUYSqqvMjbxqfPTU6wE6wR5R6xNlRImnP3eSZYwQALOiDj2
	U5Qhuaqcmfa0gEE4btv+j2Cdgq97S1LCyJGnFT/tN04rsaUjo1NJmtIo3uFb5cZihPc4
	h+5cO07wyPe2j2kCfdJbHb+wnmGMoUk4Fzz+Gdc+UOYTxdEyttmB1V60hbar1CQq23nD
	EYXg==
X-Gm-Message-State: APjAAAXVaL6BAK5ErJVf/7dVEX8TZjCxjtwCWYiGl332sOySpIJwA7KP
	bRJUlOOYqjLr5PA/iu7DeYEUGZw=
X-Google-Smtp-Source: APXvYqyz5wzWquZjIJAeKHxspSqhRcuPL8OmDz7RLl6UsYP74O/oygYQ7zTWkZe+JR1IK5BeuWPmkA==
X-Received: by 2002:a05:600c:2:: with SMTP id g2mr22510322wmc.18.1581957580701;
	Mon, 17 Feb 2020 08:39:40 -0800 (PST)
Received: from buster-jangle.bmw-carit.intra ([212.118.206.70])
	by smtp.gmail.com with ESMTPSA id
	s65sm1242289wmf.48.2020.02.17.08.39.40
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 17 Feb 2020 08:39:40 -0800 (PST)
From: Viktor Rosendahl <viktor.rosendahl@gmail.com>
X-Google-Original-From: Viktor Rosendahl <viktor.rosendahl@bmw.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 17 Feb 2020 17:39:35 +0100
Message-Id: <20200217163937.29925-2-viktor.rosendahl@bmw.de>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200217163937.29925-1-viktor.rosendahl@bmw.de>
References: <20200217163937.29925-1-viktor.rosendahl@bmw.de>
Subject: [meta-oe][PATCH 1/3] perl: Add libperlio-gzip-perl and libjson-perl
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
X-List-Received-Date: Mon, 17 Feb 2020 16:39:41 -0000

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


