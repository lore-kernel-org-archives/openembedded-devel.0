Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f47.google.com (mail-pa0-f47.google.com
	[209.85.220.47])
	by mail.openembedded.org (Postfix) with ESMTP id 376E571790
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Dec 2014 16:56:02 +0000 (UTC)
Received: by mail-pa0-f47.google.com with SMTP id kq14so12109676pab.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Dec 2014 08:56:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=H85P+fiK2O5cHybHQ5L3Ebk7BuCKXQgWzM7Om7e8FXo=;
	b=lLVMsDgZtM0WTj2LXSFLKu+SDVOAv/HWsH6vzmylTFY4PlOl5sfr2Xe7ZDmxt0oWaG
	H+E1qY82t3WdzykV1+7aQvkrCdWeCsm2lPGYMuCXi1Ms+VHTpC8UyawtQ/ChtOa9HL/E
	PxcU/x4fcm+HF50FbteweActfaILzA0Td9lxwChpa68gNZ3fuhptgzxN/39we7qAK2vj
	8Hm2Cv9OKhAtKGtQWnhoHeMc4hjP0/vBdmFWO/sO2MWlhGZaJ+MZzj3LHsfRjdHrbQCu
	i9d0kvKWAOcu9ehTxSIfIhoIe/Sf1gBxU/Ukoa7f6zbceDhvL8upWzQQSX1lW7m0xoNh
	lVNA==
X-Received: by 10.70.50.162 with SMTP id d2mr52671016pdo.85.1418662563555;
	Mon, 15 Dec 2014 08:56:03 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207])
	by mx.google.com with ESMTPSA id w4sm9789572pdq.28.2014.12.15.08.56.01
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 15 Dec 2014 08:56:02 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 15 Dec 2014 08:55:50 -0800
Message-Id: <1418662550-13436-4-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1418662550-13436-1-git-send-email-akuster808@gmail.com>
References: <1418662550-13436-1-git-send-email-akuster808@gmail.com>
Subject: [meta-perl][PATCH 4/4] libnet-dns-perl: move package to mete-perl.
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
X-List-Received-Date: Mon, 15 Dec 2014 16:56:03 -0000

please consider this package for meta-perl.

No real need for this to be in meta-security

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-perl/libnet/libnet-dns-perl_0.81.bb    | 25 ++++++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 meta-perl/recipes-perl/libnet/libnet-dns-perl_0.81.bb

diff --git a/meta-perl/recipes-perl/libnet/libnet-dns-perl_0.81.bb b/meta-perl/recipes-perl/libnet/libnet-dns-perl_0.81.bb
new file mode 100644
index 0000000..9dc4268
--- /dev/null
+++ b/meta-perl/recipes-perl/libnet/libnet-dns-perl_0.81.bb
@@ -0,0 +1,25 @@
+DESCRIPTION = "This package contains the DNS.pm module with friends."
+
+SECTION = "libs"
+LICENSE = "Artistic-1.0 | GPL-1.0+"
+
+LIC_FILES_CHKSUM = "file://README;md5=524da96a3365f2caff73fea0ae67c3a0"
+
+DEPENDS += "perl"
+
+SRC_URI = "http://search.cpan.org/CPAN/authors/id/N/NL/NLNETLABS/Net-DNS-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "26375d4310beb108b0e2b3bf30403ee5"
+SRC_URI[sha256sum] = "b36c8ead6edf68da5d9de2b0a22a47d7216e2d7eb52c8cde96724988f68a6d46"
+
+S = "${WORKDIR}/Net-DNS-${PV}"
+
+EXTRA_CPANFLAGS = "EXPATLIBPATH=${STAGING_LIBDIR} EXPATINCPATH=${STAGING_INCDIR}"
+
+inherit cpan
+
+do_compile() {
+	export LIBC="$(find ${STAGING_DIR_TARGET}/${base_libdir}/ -name 'libc-*.so')"
+	cpan_do_compile
+}
+BBCLASSEXTEND = "native"
-- 
1.9.1


