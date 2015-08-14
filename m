Return-Path: <ticotimo@gmail.com>
Received: from mail-yk0-f176.google.com (mail-yk0-f176.google.com
	[209.85.160.176])
	by mail.openembedded.org (Postfix) with ESMTP id D5BAC7670F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Aug 2015 04:44:09 +0000 (UTC)
Received: by ykaz130 with SMTP id z130so60009260yka.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Aug 2015 21:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=fczbnwXxyqAWzF9EXdiEzQh7DzObhvQ8tZtlFHU8yVA=;
	b=p/PE5O29T0NQ+TdqHO12VrK/IUQmjyBTloT4RwRlWHFLFziSYrETIMOiPpeXD6PdKg
	rcVGqxQ5Hage/FaEpZU70ufO+i+5KTdkcGm4B+FgM+1E36oZ2i9hhqpibN9pwzjU05Yq
	J9iekCpc1//xtX4+siYNv6C75a25wAUHeFhYZuTSFjHzkWTBl7lDhy3VBlYpaUnlDEnq
	p42LiILrEOzZBBGoZdEGA6iq03X4dSJfz7VC7cuoOJkCdEKdU0ueyoabdSGQXYxgmHmI
	m4PPfF6f47JDaSr+5DLrHTNcqBg8VGrVqQZ+KkhdQ/A4OdcpSNLq7yIUiZb57vor/J5G
	Uyzg==
X-Received: by 10.13.239.1 with SMTP id y1mr43272126ywe.155.1439527449306;
	Thu, 13 Aug 2015 21:44:09 -0700 (PDT)
Received: from localhost.localdomain.localdomain
	(75-128-22-150.dhcp.snlo.ca.charter.com. [75.128.22.150])
	by smtp.gmail.com with ESMTPSA id b9sm4220667ywa.38.2015.08.13.21.44.07
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 13 Aug 2015 21:44:08 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <TicoTimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 13 Aug 2015 21:43:50 -0700
Message-Id: <1439527430-7278-1-git-send-email-TicoTimo@gmail.com>
X-Mailer: git-send-email 2.1.0
Subject: [meta-perl][PATCH] libimport-into-perl: add 1.002004 recipe
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
X-List-Received-Date: Fri, 14 Aug 2015 04:44:12 -0000

Signed-off-by: Tim Orling <TicoTimo@gmail.com>
---
 .../libimport/libimport-into-perl_1.002004.bb      | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 meta-perl/recipes-perl/libimport/libimport-into-perl_1.002004.bb

diff --git a/meta-perl/recipes-perl/libimport/libimport-into-perl_1.002004.bb b/meta-perl/recipes-perl/libimport/libimport-into-perl_1.002004.bb
new file mode 100644
index 0000000..af08d63
--- /dev/null
+++ b/meta-perl/recipes-perl/libimport/libimport-into-perl_1.002004.bb
@@ -0,0 +1,32 @@
+SUMMARY = "Import::Into - import packages into other packages"
+DESCRIPTION = "Writing exporters is a pain. Some use \"Exporter\", some use \
+\"Sub::Exporter\", some use \"Moose::Exporter\", some use \
+\"Exporter::Declare\"... and some things are pragmas.\
+\
+Exporting on someone else's behalf is harder. The exporters don't provide a \
+consistent API for this, and pragmas need to have their import method called \
+directly, since they effect the current unit of compilation. \
+\
+\"Import::Into\" provides global methods to make this painless."
+
+SECTION = "libs"
+
+HOMEPAGE = "https://metacpan.org/pod/Import-Into/"
+
+LICENSE = "Artistic-1.0 | GPL-1.0+"
+LIC_FILES_CHKSUM = "file://README;beginline=209;endline=223;md5=3cf363f1e405dea6db2c6cd0ef23680c"
+
+SRC_URI = "${CPAN_MIRROR}/authors/id/E/ET/ETHER/Import-Into-${PV}.tar.gz"
+SRC_URI[md5sum] = "70f2f3b08a5b706ee382a8448c346cb1"
+SRC_URI[sha256sum] = "decb259bc2ff015fe3dac85e4a287d4128e9b0506a0b2c5fa7244836a68b1084"
+
+S = "${WORKDIR}/Import-Into-${PV}"
+
+inherit cpan
+
+RDEPENDS_${PN} = " libmodule-runtime-perl \
+                   perl-module-strict \
+                   perl-module-warnings \
+"
+
+BBCLASSEXTEND = "native"
-- 
2.1.0


