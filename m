Return-Path: <ticotimo@gmail.com>
Received: from mail-pa0-f48.google.com (mail-pa0-f48.google.com
	[209.85.220.48])
	by mail.openembedded.org (Postfix) with ESMTP id B6B7460167
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 May 2014 02:08:03 +0000 (UTC)
Received: by mail-pa0-f48.google.com with SMTP id rd3so379328pab.7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 May 2014 19:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=TFG7OJCD8OPTJ6dbJnhKXXQGIDdbDwWZ/6vcOU8SZ3E=;
	b=JovTxVtnfPN3bpkfg0UGXpvYls6XuWZOXT0QMOGJbFnSatngezSEVldXfQ7apG3yFW
	sd6dEwmHdg+/C10dnajzWDWelaE8WxzQfscuq3kQVgTJZm6bWId8+ts0iKvgXqvH+lRj
	8SUrlo3BQ9spy3ZkbZtlfEc3oYcoxPeW1rFegqNLZn7kXraHXTVqWf3UZZpzvP6DktEh
	hWpJyI2cIzXtkBDD2JyPUpNtQNUe21W/yNAfb+wT8iufRGNIvmYwBCmlVh/GOMqWHFG7
	LHOiax806ILYPqRcpxstWBV0Yhrp7bid4QzKnIXEfdwuvK04ui+SuxEPEwpPtawhK/Pu
	j/ag==
X-Received: by 10.67.23.135 with SMTP id ia7mr13080612pad.5.1399428484422;
	Tue, 06 May 2014 19:08:04 -0700 (PDT)
Received: from gentoo.localdomain (75-128-22-150.dhcp.snlo.ca.charter.com.
	[75.128.22.150])
	by mx.google.com with ESMTPSA id ec2sm142236pbc.63.2014.05.06.19.08.02
	for <multiple recipients>
	(version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128/128);
	Tue, 06 May 2014 19:08:03 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  6 May 2014 19:09:19 -0700
Message-Id: <1399428565-30499-4-git-send-email-ticotimo@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1399428565-30499-1-git-send-email-ticotimo@gmail.com>
References: <1399428565-30499-1-git-send-email-ticotimo@gmail.com>
Subject: [meta-perl][PATCH v3 3/9] libmodule-runtime-perl: add 0.013
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
X-List-Received-Date: Wed, 07 May 2014 02:08:03 -0000

From: Tim Orling <TicoTimo@gmail.com>

[Description from CPAN]
The functions exported by this module deal with runtime
handling of Perl modules, which are normally handled at compile time.
This
module avoids using any other modules, so that it can be used in
low-level
infrastructure.

Signed-off-by: Tim Orling <TicoTimo@gmail.com>
---
 .../libmodule/libmodule-runtime-perl_0.013.bb      | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 meta-perl/recipes-perl/libmodule/libmodule-runtime-perl_0.013.bb

diff --git a/meta-perl/recipes-perl/libmodule/libmodule-runtime-perl_0.013.bb b/meta-perl/recipes-perl/libmodule/libmodule-runtime-perl_0.013.bb
new file mode 100644
index 0000000..58b72af
--- /dev/null
+++ b/meta-perl/recipes-perl/libmodule/libmodule-runtime-perl_0.013.bb
@@ -0,0 +1,35 @@
+SUMMARY = "Module::Runtime - runtime module handling"
+DESCRIPTION = "The functions exported by this module deal with runtime \
+handling of Perl modules, which are normally handled at compile time. This \
+module avoids using any other modules, so that it can be used in low-level \
+infrastructure. \
+The parts of this module that work with module names apply the same syntax \
+that is used for barewords in Perl source. In principle this syntax can vary \
+between versions of Perl, and this module applies the syntax of the Perl on \
+which it is running. In practice the usable syntax hasn't changed yet, but \
+there's a good chance of it changing in Perl 5.18. \
+The functions of this module whose purpose is to load modules include \
+workarounds for three old Perl core bugs regarding require. These workarounds \
+are applied on any Perl version where the bugs exist, except for a case where \
+one of the bugs cannot be adequately worked around in pure Perl."
+SECTION = "libs"
+
+HOMEPAGE = "http://search.cpan.org/~zefram/Module-Runtime/"
+
+LICENSE = "Artistic-1.0 | GPL-1.0+"
+LIC_FILES_CHKSUM = "file://README;beginline=42;endline=43;md5=62e24a93342fede7221d66335c716f34"
+
+SRC_URI = "http://search.cpan.org/CPAN/authors/id/Z/ZE/ZEFRAM/Module-Runtime-${PV}.tar.gz"
+SRC_URI[md5sum] = "62b88b1f5f0e975a5d7c80cd46167b97"
+SRC_URI[sha256sum] = "ec37e03d90dc905679dab62a82f42cf0897ed79244b87fd9d531438dc3c31023"
+
+S = "${WORKDIR}/Module-Runtime-${PV}"
+
+inherit cpan_build
+
+RDEPENDS_${PN} = " perl-module-test-more \
+                   perl-module-strict \
+                   perl-module-build \
+"
+
+BBCLASSEXTEND = "native"
-- 
1.8.3.2


