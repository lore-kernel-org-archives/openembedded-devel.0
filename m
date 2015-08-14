Return-Path: <ticotimo@gmail.com>
Received: from mail-yk0-f169.google.com (mail-yk0-f169.google.com
	[209.85.160.169])
	by mail.openembedded.org (Postfix) with ESMTP id 0B87875716
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Aug 2015 16:14:02 +0000 (UTC)
Received: by ykfw73 with SMTP id w73so19381420ykf.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Aug 2015 09:14:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=YFvnEg5VlzwzpxHJrZB4EFohKUTSr7wTStPlzF4VAeI=;
	b=MhVpvUfaxkrfzXHIrDoWMjeXjU0b+WtPFq37V2+poc3G4r2ZVuqOUQ6JTIB//o34Ct
	HaMauRwiMO3MSkZz1hFKKgdFWv9F9gxuF7szxwH6iF9eDcpr3NquvOHbl+oOKDF1jov1
	haUoiLRg4BC6bar4bGyPUZZM0h28Uih7hCcmOs3CQRr5tLrKGFsOwscF46xmSvjvil7i
	6t3veHVzB2xekVMAwAsspLMj3iNre2FG2zk8weoxGlbMZZgKFXNHf+/+3PU1Obyw5oYS
	RuIf7GrtBZ6UzRV9kPut0IhlyzewB9CQc4r0fg+lB607wx4OOUzV2eXFhu9Zg32TcjBL
	bLWQ==
X-Received: by 10.170.40.147 with SMTP id 141mr8509194yki.40.1439568842621;
	Fri, 14 Aug 2015 09:14:02 -0700 (PDT)
Received: from localhost.localdomain.localdomain
	(75-128-22-150.dhcp.snlo.ca.charter.com. [75.128.22.150])
	by smtp.gmail.com with ESMTPSA id c6sm5559241ywe.12.2015.08.14.09.14.00
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 14 Aug 2015 09:14:01 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <TicoTimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 14 Aug 2015 09:13:27 -0700
Message-Id: <1439568807-1839-3-git-send-email-TicoTimo@gmail.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1439568807-1839-1-git-send-email-TicoTimo@gmail.com>
References: <1439568807-1839-1-git-send-email-TicoTimo@gmail.com>
Subject: [meta-perl][PATCH 3/3] libmoo-perl: add 2.000002 recipe
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
X-List-Received-Date: Fri, 14 Aug 2015 16:14:04 -0000

Signed-off-by: Tim Orling <TicoTimo@gmail.com>
---
 .../recipes-perl/libmoo/libmoo-perl_2.000002.bb    | 44 ++++++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100644 meta-perl/recipes-perl/libmoo/libmoo-perl_2.000002.bb

diff --git a/meta-perl/recipes-perl/libmoo/libmoo-perl_2.000002.bb b/meta-perl/recipes-perl/libmoo/libmoo-perl_2.000002.bb
new file mode 100644
index 0000000..fe119fa
--- /dev/null
+++ b/meta-perl/recipes-perl/libmoo/libmoo-perl_2.000002.bb
@@ -0,0 +1,44 @@
+SUMMARY = "Moo - Minimalist Object Orientation (with Moose compatibility)"
+DESCRIPTION = "This module us an extremely light-weight subset of \"Moose\" \
+optimised for rapid startup and \"pay only for what you use\"."
+
+SECTION = "libs"
+
+HOMEPAGE = "http://metapan.org/release/Moo/"
+
+LICENSE = "Artistic-1.0 | GPL-1.0+"
+LIC_FILES_CHKSUM = "file://README;beginline=688;endline=733;md5=27efedd175eeaddbd18f4e3572bd72a8"
+
+SRC_URI = "${CPAN_MIRROR}/authors/id/H/HA/HAARG/Moo-${PV}.tar.gz"
+SRC_URI[md5sum] = "8b84a7289fc6247de5ec5d151105fd6b"
+SRC_URI[sha256sum] = "fb4bfa751f0dd06bd70f2e06e811f85a640501f263c228a8efafbf6b26691fd4"
+
+S = "${WORKDIR}/Moo-${PV}"
+
+inherit cpan
+
+RDEPENDS_${PN} = " libclass-method-modifiers-perl \
+                   libdevel-globaldestruction-perl \
+                   libmodule-runtime-perl \
+                   librole-tiny-perl \
+                   perl-module-constant \
+                   perl-module-exporter \
+                   perl-module-mro \
+                   perl-module-scalar-util \
+"
+
+RPROVIDES_${PN} = " libmethod-inliner-perl \
+                    libmethod-generate-accessor-perl \
+                    libmethod-generate-buildall-perl \
+                    libmethod-generate-constructor-perl \
+                    libmethod-generate-demolishall-perl \
+                    libmoo-perl \
+                    libmoo-handlemoose-perl \
+                    libmoo-handlemoose-fakemetaclass-perl \
+                    libmoo-object-perl \
+                    libmoo-role-perl \
+                    libsub-defer-perl \
+                    libsub-quote-perl \
+"
+
+BBCLASSEXTEND = "native"
-- 
2.1.0


