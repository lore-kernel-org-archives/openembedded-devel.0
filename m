Return-Path: <ticotimo@gmail.com>
Received: from mail-pa0-f48.google.com (unknown [209.85.220.48])
	by mail.openembedded.org (Postfix) with ESMTP id B0ECA65D1A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 May 2014 07:41:46 +0000 (UTC)
Received: by mail-pa0-f48.google.com with SMTP id rd3so1157202pab.35
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 May 2014 00:41:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=bmXnYJhxFmdf5Qneq8JrfmPMWYUza3c37H/UVYgDmLI=;
	b=uExSTRfDJI1JLYvkOj9zYBC/Xspb7lysqEQKYWMWNbudXbeA6twdReFpEOfoFOYTck
	jOfhE2VGf0vZ5diLnFmBPF3xI+fDO3lEmyi1x8he3K1H/xW0Q9P8hfUDIeueG9NRBdHo
	kuKOaxpkcslX3skUhKO5/ERITOA2fZiCe+3S2gG4bHsEeo2bXyOWemEY8utFb/ieMKB1
	73AMmvgRxwIM/RlVYkB8mMsUdGt3O00xpFkTD4yE3JZt8Lcdoq4gmW4H1gWagRsp5wAQ
	4uBwMm0KHRWW1zZH6wSvyoXAqMmwX9iu/BrFybWGL3CvgBf1AdW/ZzYtq9dMOOt8Y9jc
	IZvA==
X-Received: by 10.66.66.66 with SMTP id d2mr56878494pat.36.1400658107461;
	Wed, 21 May 2014 00:41:47 -0700 (PDT)
Received: from gentoo.localdomain (75-128-22-150.dhcp.snlo.ca.charter.com.
	[75.128.22.150])
	by mx.google.com with ESMTPSA id it4sm6669337pbc.39.2014.05.21.00.41.45
	for <multiple recipients>
	(version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128/128);
	Wed, 21 May 2014 00:41:46 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 21 May 2014 00:43:36 -0700
Message-Id: <1400658223-15804-4-git-send-email-ticotimo@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1400658223-15804-1-git-send-email-ticotimo@gmail.com>
References: <1400658223-15804-1-git-send-email-ticotimo@gmail.com>
Subject: [meta-perl][PATCH v4 03/10] libmodule-runtime-perl: add 0.014
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
X-List-Received-Date: Wed, 21 May 2014 07:41:48 -0000

From: Tim Orling <TicoTimo@gmail.com>

[Description from CPAN]
The functions exported by this module deal with runtime
handling of Perl modules, which are normally handled at compile time.
This
module avoids using any other modules, so that it can be used in
low-level
infrastructure.

* Add ${CPAN_MIRROR} option
* License line numbers changed from 0.013, same LICENSE.

Signed-off-by: Tim Orling <TicoTimo@gmail.com>
---
 .../libmodule/libmodule-runtime-perl_0.014.bb      | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 meta-perl/recipes-perl/libmodule/libmodule-runtime-perl_0.014.bb

diff --git a/meta-perl/recipes-perl/libmodule/libmodule-runtime-perl_0.014.bb b/meta-perl/recipes-perl/libmodule/libmodule-runtime-perl_0.014.bb
new file mode 100644
index 0000000..d68ae2a
--- /dev/null
+++ b/meta-perl/recipes-perl/libmodule/libmodule-runtime-perl_0.014.bb
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
+LIC_FILES_CHKSUM = "file://README;beginline=43;endline=44;md5=62e24a93342fede7221d66335c716f34"
+
+SRC_URI = "${CPAN_MIRROR}/authors/id/Z/ZE/ZEFRAM/Module-Runtime-${PV}.tar.gz"
+SRC_URI[md5sum] = "a6597bc25536a30476f0d75b64d35734"
+SRC_URI[sha256sum] = "4c44fe0ea255a9fd00741ee545063f6692d2a28e7ef2fbaad1b24a92803362a4"
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


