Return-Path: <ticotimo@gmail.com>
Received: from mail-yk0-f180.google.com (mail-yk0-f180.google.com
	[209.85.160.180])
	by mail.openembedded.org (Postfix) with ESMTP id D0974766D3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Aug 2015 15:20:42 +0000 (UTC)
Received: by ykaz130 with SMTP id z130so62133959yka.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Aug 2015 08:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=keoxRhuTUOmBBI46ikz+2FIvUKfv4Ndj3mV1em1xPR4=;
	b=pwA3bdny5+qWyMihwKcP/9V1G62IGPYlnqH+VADdclwtbMTDHaPinkYxHuXsYi+VJo
	2ZMVWJSIg5PDkLolNlY1O7MoPgOVyaBurilhrVxLNkMFELfck0bvONn5/hcHF0Z8VJDR
	MhU0reIPLUzF61HU1Lo2MEITKjZvX3beZZ0GgGCRhpVDfjvGJaDsi0h7v6Sp1Je0v/S0
	bONiODqTRBsE9bu6TtkvQnPPgZUzPQP2q/MIAmvYq2+6DigRn2qTHCWTyOqRSkrhRzeQ
	wwsJKFxnGAZdF3LimAZw2Y693e53sUygEozf7gZG2OjcwrcuA/1/gxPeAfUbOCzX+drL
	Ijqg==
X-Received: by 10.13.240.6 with SMTP id z6mr8231837ywe.51.1439306442844;
	Tue, 11 Aug 2015 08:20:42 -0700 (PDT)
Received: from localhost.localdomain.localdomain
	(75-128-22-150.dhcp.snlo.ca.charter.com. [75.128.22.150])
	by smtp.gmail.com with ESMTPSA id
	x22sm1855189ywd.46.2015.08.11.08.20.41
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 11 Aug 2015 08:20:42 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <TicoTimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 11 Aug 2015 08:20:26 -0700
Message-Id: <1439306426-1152-1-git-send-email-TicoTimo@gmail.com>
X-Mailer: git-send-email 2.1.0
Subject: [meta-perl][PATCH] libclass-method-modifiers-perl: add 2.11 recipe
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
X-List-Received-Date: Tue, 11 Aug 2015 15:20:44 -0000

Signed-off-by: Tim Orling <TicoTimo@gmail.com>
---
 .../libclass-method-modifiers-perl_2.11.bb         | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 meta-perl/recipes-perl/libclass/libclass-method-modifiers-perl_2.11.bb

diff --git a/meta-perl/recipes-perl/libclass/libclass-method-modifiers-perl_2.11.bb b/meta-perl/recipes-perl/libclass/libclass-method-modifiers-perl_2.11.bb
new file mode 100644
index 0000000..93d6e54
--- /dev/null
+++ b/meta-perl/recipes-perl/libclass/libclass-method-modifiers-perl_2.11.bb
@@ -0,0 +1,28 @@
+SUMMARY = "Class::Method::Modifiers - provides Moose-like method modifiers"
+DESCRIPTION = "Method modifiers are a convenient feature from the CLOS \
+(Common Lisp Object System) world."
+
+SECTION = "libs"
+
+HOMEPAGE = "https://github.com/moose/Class-Method-Modifiers/"
+
+LICENSE = "Artistic-1.0 | GPL-1.0+"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=16fd0ec7b73c0e158426f753943f1058"
+
+SRC_URI = "${CPAN_MIRROR}/authors/id/E/ET/ETHER/Class-Method-Modifiers-${PV}.tar.gz"
+SRC_URI[md5sum] = "c6982e9e89325713d5afaff82cfe1744"
+SRC_URI[sha256sum] = "debf979fbd9ac25cc6fe7d1cab81103c60a21f7027d2a9b4bf5cb264e313d392"
+
+S = "${WORKDIR}/Class-Method-Modifiers-${PV}"
+
+inherit cpan
+
+RDEPENDS_${PN} = " perl-module-b \
+                   perl-module-base \
+                   perl-module-carp \
+                   perl-module-exporter \
+                   perl-module-strict \
+                   perl-module-warnings \
+"
+
+BBCLASSEXTEND = "native"
-- 
2.1.0


