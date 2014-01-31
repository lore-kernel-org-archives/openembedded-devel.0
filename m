Return-Path: <ticotimo@gmail.com>
Received: from mail-pd0-f180.google.com (mail-pd0-f180.google.com
	[209.85.192.180])
	by mail.openembedded.org (Postfix) with ESMTP id D50446EADC
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Jan 2014 15:11:30 +0000 (UTC)
Received: by mail-pd0-f180.google.com with SMTP id x10so4361739pdj.25
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Jan 2014 07:11:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=+6ggjQ7n4Zv/2wH8Ufbqg6x2yuf08Xoyk8/o7UFXx2Y=;
	b=SyEMlwpaMiPB6Tb67JXhiM5kkyLWS6qrAbrHY4XIt/aT9wre8WCte35QKH19deJsjZ
	4wOdZbvEDo4wRyja4sYErl+QIw4nAnwg4zl79VvC4CTLX9DpP/Yq3ZV0ZhLsf5fV/l+P
	XjwLTdH7Mxcuod4wayKeb/CXEEjkGpcSlb2t0bjNCXdD8FP8QOEiQxtmvc0cJOhfzx8t
	9Pi/NomR2CMFUAgidSrJ+bE2WXQnCdY469mZPqXTObWSVd5qFSiQ3PdFPr5GK1O059sz
	jrXh/y9LIAVsHv9Do0/HVDdRkvc0RGws5U7AuDqYyFwERBA31mTFDMabdYMjkEUCU0iv
	i6Nw==
X-Received: by 10.68.170.66 with SMTP id ak2mr21211296pbc.5.1391181092156;
	Fri, 31 Jan 2014 07:11:32 -0800 (PST)
Received: from localhost.localdomain (75-128-22-150.dhcp.snlo.ca.charter.com.
	[75.128.22.150]) by mx.google.com with ESMTPSA id
	zc6sm69486700pab.18.2014.01.31.07.11.30
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 31 Jan 2014 07:11:31 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 31 Jan 2014 07:11:37 -0800
Message-Id: <1391181100-32525-6-git-send-email-ticotimo@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1391181100-32525-1-git-send-email-ticotimo@gmail.com>
References: <1391181100-32525-1-git-send-email-ticotimo@gmail.com>
Subject: [meta-perl][PATCH 6/9] perl-module-extutils-helpers: add 0.021
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
X-List-Received-Date: Fri, 31 Jan 2014 15:11:31 -0000

[Description from CPAN]
This module provides various portable helper functions for module building modules.

Signed-off-by: Tim Orling <ticotimo@gmail.com>
---
 .../extutils/perl-module-extutils-helpers_0.021.bb |   28 ++++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 meta-perl/recipes-perl/extutils/perl-module-extutils-helpers_0.021.bb

diff --git a/meta-perl/recipes-perl/extutils/perl-module-extutils-helpers_0.021.bb b/meta-perl/recipes-perl/extutils/perl-module-extutils-helpers_0.021.bb
new file mode 100644
index 0000000..e18dea1
--- /dev/null
+++ b/meta-perl/recipes-perl/extutils/perl-module-extutils-helpers_0.021.bb
@@ -0,0 +1,28 @@
+SUMMARY = "ExtUtils::Helpers - Various portability utilities for module builders"
+DESCRIPTION = "This module provides various portable helper function for module building modules."
+
+HOMEPAGE = "http://search.cpan.org/~leont/ExtUtils-Helpers/"
+
+LICENSE = "Artistic-1.0 | GPL-1.0+"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=307057ce232899f5caa8858560c7274b"
+
+SRC_URI = "http://search.cpan.org/CPAN/authors/id/L/LE/LEONT/ExtUtils-Helpers-${PV}.tar.gz"
+SRC_URI[md5sum] = "94aa8eaf92def26d9af0cb25fcb1570f"
+SRC_URI[sha256sum] = "26b85077f4197b30e62ffec87d3f78111522619d62858d2ab45a64687351892a"
+
+S = "${WORKDIR}/ExtUtils-Helpers-${PV}"
+
+inherit cpan
+
+RDEPENDS_${PN} = " perl-module-file-copy \
+                   perl-module-extutils-makemaker \
+                   perl-module-exporter \
+                   perl-module-carp \
+                   perl-module-test-more \
+                   perl-module-text-parsewords \
+                   perl-module-module-load \
+                   perl-module-file-temp \
+                   perl-module-file-spec-functions \
+"
+
+BBCLASSEXTEND = "native"
-- 
1.7.9.5


