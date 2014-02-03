Return-Path: <ticotimo@gmail.com>
Received: from mail-pa0-f47.google.com (mail-pa0-f47.google.com
	[209.85.220.47])
	by mail.openembedded.org (Postfix) with ESMTP id 493B76E963
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  3 Feb 2014 06:50:34 +0000 (UTC)
Received: by mail-pa0-f47.google.com with SMTP id kp14so6727905pab.20
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 02 Feb 2014 22:50:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=HWKUuAkoGYicnVtxMC0Jl3Is7HUzsBWcGN7xFqZkn2g=;
	b=GZDw5dTL8+cvw+6aIPj5W7sKeCQpMt4gLw4L4o8zPQmdZh8+qiJMIzLLgFOW4OeL5+
	ZhcVKSwYG6YSoz3caDXH4Lh0MOyjg3GnGOIx+4GpY9UDCyVclB97mgFhPNSNjogiRI+n
	TU83i2sQs39gZ/QnvjHwN7cPOnUpTr73oBe8ap6mL/EHKtj3jsG/kMBsYq740orv7yzW
	Z4PLWlRrWBofqD097aI/1GfR5+RvdgTrEYBQfwpNpN/5rLMsPVzvOdnaqnhqsBbLmf5N
	YELk+G8owUsFg8xDf6st3bUXTPSgWqAA7qcrUAVN4DhTTyKhOEWSOGpRKxdGz3KmK7NL
	kyrg==
X-Received: by 10.68.226.70 with SMTP id rq6mr35754201pbc.107.1391410235632;
	Sun, 02 Feb 2014 22:50:35 -0800 (PST)
Received: from localhost.localdomain (75-128-22-150.dhcp.snlo.ca.charter.com.
	[75.128.22.150]) by mx.google.com with ESMTPSA id
	i10sm137068968pat.11.2014.02.02.22.50.33
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 02 Feb 2014 22:50:34 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  2 Feb 2014 22:51:07 -0800
Message-Id: <1391410275-31251-3-git-send-email-ticotimo@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1391410275-31251-1-git-send-email-ticotimo@gmail.com>
References: <1391410275-31251-1-git-send-email-ticotimo@gmail.com>
Subject: [meta-perl][PATCH v2 02/10] libtext-diff-perl: add 1.41
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
X-List-Received-Date: Mon, 03 Feb 2014 06:50:34 -0000

[Description from CPAN]
diff() provides a basic set of services akin to the GNU diff
utility. It is not anywhere near as feature complete as GNU diff, but it is
better integrated with Perl and available on all platforms. It is often
faster than shelling out to a system's diff executable for small files,
and generally slower on larger files.

Signed-off-by: Tim Orling <ticotimo@gmail.com>
---
 .../recipes-perl/libtext/libtext-diff-perl_1.41.bb |   27 ++++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 meta-perl/recipes-perl/libtext/libtext-diff-perl_1.41.bb

diff --git a/meta-perl/recipes-perl/libtext/libtext-diff-perl_1.41.bb b/meta-perl/recipes-perl/libtext/libtext-diff-perl_1.41.bb
new file mode 100644
index 0000000..1960ee0
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
+SRC_URI = "http://search.cpan.org/CPAN/authors/id/O/OV/OVID/Text-Diff-${PV}.tar.gz"
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
1.7.9.5


