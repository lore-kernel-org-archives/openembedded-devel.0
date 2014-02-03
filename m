Return-Path: <ticotimo@gmail.com>
Received: from mail-pb0-f43.google.com (mail-pb0-f43.google.com
	[209.85.160.43])
	by mail.openembedded.org (Postfix) with ESMTP id 808766E937
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  3 Feb 2014 06:50:38 +0000 (UTC)
Received: by mail-pb0-f43.google.com with SMTP id md12so6692248pbc.16
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 02 Feb 2014 22:50:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=L0vUNq8mmNDx9CsupdzXzzDupKDo6WOtlgyviokiFtI=;
	b=f6zKKTCXKelNgToF8dvUTlK+7Whmyo5momorANRH3NXnHvykcwCGhm6aD3fE3ZYnn3
	3rC0QhNneQxX+erbMXIKuKGI6A0evRlWBBSatXPEYWElMJrKUeIK2wBDBffDecmCTlB9
	WGwhRL05ER9qrcawTvE2ufrU6g5Zw8V2Y3wjqupnfTb7813DhLU9fMggLAfRXStYClPz
	kISy5oHedfKbvtmpCREkOYyId5xp/dzTaZx/HV1jWMfQDapUpBox16VBB8GHxZS7gy5r
	FmcOzjnlZIFLvwYcjxaVFLNJZGFNVvne/OqvQWpktyU9oi4QCl+AUKjAdiduS+wTUoF1
	S4iw==
X-Received: by 10.66.136.229 with SMTP id qd5mr35809008pab.118.1391410239583; 
	Sun, 02 Feb 2014 22:50:39 -0800 (PST)
Received: from localhost.localdomain (75-128-22-150.dhcp.snlo.ca.charter.com.
	[75.128.22.150]) by mx.google.com with ESMTPSA id
	i10sm137068968pat.11.2014.02.02.22.50.37
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 02 Feb 2014 22:50:38 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  2 Feb 2014 22:51:09 -0800
Message-Id: <1391410275-31251-5-git-send-email-ticotimo@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1391410275-31251-1-git-send-email-ticotimo@gmail.com>
References: <1391410275-31251-1-git-send-email-ticotimo@gmail.com>
Subject: [meta-perl][PATCH v2 04/10] libmodule-runtime-perl: add 0.013
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
X-List-Received-Date: Mon, 03 Feb 2014 06:50:38 -0000

[Description from CPAN]
The functions exported by this module deal with runtime
handling of Perl modules, which are normally handled at compile time. This
module avoids using any other modules, so that it can be used in low-level
infrastructure.

Signed-off-by: Tim Orling <ticotimo@gmail.com>
---
 .../libmodule/libmodule-runtime-perl_0.013.bb      |   35 ++++++++++++++++++++
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
1.7.9.5


