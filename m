Return-Path: <ticotimo@gmail.com>
Received: from mail-pa0-f42.google.com (unknown [209.85.220.42])
	by mail.openembedded.org (Postfix) with ESMTP id B2F1765D1A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 May 2014 07:46:52 +0000 (UTC)
Received: by mail-pa0-f42.google.com with SMTP id rd3so1160503pab.15
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 May 2014 00:46:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=DcQof6cRAnGBEaDNZJ1OFpizllw7+SQ7J7mdzb9iitA=;
	b=DrIwoY4sy5XrVOlUA5IRfhFY4/O2dhTL/aBKPQ6x5Z2CYHz/dilq9rAK/SXFeCD849
	F7FcMjB9p23BGLwMxHUD7kCs9rtgPhS9t0EBy9F8IPt/NuIyjPzlHSl+b+wad/lhqe3C
	o9degdJpwsixkA9s7cs//Iv9owbSZ7jAos2EPFcTwTskB804BgV1dCl36GmQwQjmtW9f
	pcAy/fEqMvx3zIt9JwDYg6RxJBT9Xz9VYClPHqw8vMM9J6XlRwQeqPiFss9m0wNXicVz
	yJe+FjYEv6dmaNUaJOcrQ9hIWCdyAYsnukX5yhoqs5olE3NibhGwYscYsYF7r+/S0vf2
	XmnA==
X-Received: by 10.68.245.162 with SMTP id xp2mr56997023pbc.69.1400658103506;
	Wed, 21 May 2014 00:41:43 -0700 (PDT)
Received: from gentoo.localdomain (75-128-22-150.dhcp.snlo.ca.charter.com.
	[75.128.22.150])
	by mx.google.com with ESMTPSA id it4sm6669337pbc.39.2014.05.21.00.41.41
	for <multiple recipients>
	(version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128/128);
	Wed, 21 May 2014 00:41:42 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 21 May 2014 00:43:34 -0700
Message-Id: <1400658223-15804-2-git-send-email-ticotimo@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1400658223-15804-1-git-send-email-ticotimo@gmail.com>
References: <1400658223-15804-1-git-send-email-ticotimo@gmail.com>
Subject: [meta-perl][PATCH v4 01/10] libtext-diff-perl: add 1.41
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
X-List-Received-Date: Wed, 21 May 2014 07:46:56 -0000

From: Tim Orling <TicoTimo@gmail.com>

[Description from CPAN]
diff() provides a basic set of services akin to the GNU diff
utility. It is not anywhere near as feature complete as GNU diff, but it
is
better integrated with Perl and available on all platforms. It is often
faster than shelling out to a system's diff executable for small files,
and generally slower on larger files.

* Add ${CPAN_MIRROR} since default has become flaky

Signed-off-by: Tim Orling <TicoTimo@gmail.com>
---
 .../recipes-perl/libtext/libtext-diff-perl_1.41.bb | 27 ++++++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 meta-perl/recipes-perl/libtext/libtext-diff-perl_1.41.bb

diff --git a/meta-perl/recipes-perl/libtext/libtext-diff-perl_1.41.bb b/meta-perl/recipes-perl/libtext/libtext-diff-perl_1.41.bb
new file mode 100644
index 0000000..a4c246e
--- /dev/null
+++ b/meta-perl/recipes-perl/libtext/libtext-diff-perl_1.41.bb
@@ -0,0 +1,27 @@
+SUMMARY = "Text::Diff - Perform diffs on files and record sets"
+DESCRIPTION = "diff() provides a basic set of services akin to the GNU diff \
+utility. It is not anywhere near as feature complete as GNU diff, but it is \
+better integrated with Perl and available on all platforms. It is often \
+faster than shelling out to a system's diff executable for small files, \
+and generally slower on larger files."
+SECTION = "libs"
+
+HOMEPAGE = "http://search.cpan.org/~ovid/Text-Diff/"
+
+LICENSE = "Artistic-1.0 | GPL-2.0+"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=385c55653886acac3821999a3ccd17b3"
+
+SRC_URI = "${CPAN_MIRROR}/authors/id/O/OV/OVID/Text-Diff-${PV}.tar.gz"
+SRC_URI[md5sum] = "30d56e6dd5551ca16b8e16cc7299dc21"
+SRC_URI[sha256sum] = "a67f50a48e313c1680cc662109ce5f913ea71454db355d0cf4db87ac89d2d2fa"
+
+S = "${WORKDIR}/Text-Diff-${PV}"
+
+inherit cpan
+
+RDEPENDS_${PN} = " libalgorithm-diff-perl \
+                   perl-module-extutils-makemaker \
+                   perl-module-exporter \
+"
+
+BBCLASSEXTEND = "native"
-- 
1.8.3.2


