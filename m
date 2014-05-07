Return-Path: <ticotimo@gmail.com>
Received: from mail-pd0-f177.google.com (mail-pd0-f177.google.com
	[209.85.192.177])
	by mail.openembedded.org (Postfix) with ESMTP id 2C7F560E79
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 May 2014 02:07:59 +0000 (UTC)
Received: by mail-pd0-f177.google.com with SMTP id p10so337065pdj.22
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 May 2014 19:08:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=dcbRv5qVwLY0G4gY/D65tCjGV7xtLYRhT8opNE6sICg=;
	b=z+oj0EghGPKPEehyH0jAYtx6S6U2AGKwyYm2h1+ImQLLJ+f1AHLnn+o7I9N9E5hQiG
	vgQneiSuXeUFqmfIWeRr32ZBNYVi6wo4MZRNjuSe+eHqNzbT9mppBoi0m6gb/tNTFdOc
	3CdDl9BQ2VCqDtgxodx8OgKuSm0icdXIkHVbfjA99ow/vNwPCtS2QvDZdQu6z9+t+iEO
	lNqPFYn0a9flJx3Hl78+YHvOo8j3zfqTATsazlydhc/i1BeQMz4jAjEtzOTDXw1rDRHu
	vl4Y5wzcuEYcoaM6rr7qNBx+fEImB6KtIxZjAzaSXY4wuLabPxhGqqWWBQpXPxdxogZh
	wTIw==
X-Received: by 10.66.149.37 with SMTP id tx5mr13003055pab.81.1399428480740;
	Tue, 06 May 2014 19:08:00 -0700 (PDT)
Received: from gentoo.localdomain (75-128-22-150.dhcp.snlo.ca.charter.com.
	[75.128.22.150])
	by mx.google.com with ESMTPSA id ec2sm142236pbc.63.2014.05.06.19.07.58
	for <multiple recipients>
	(version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128/128);
	Tue, 06 May 2014 19:07:59 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  6 May 2014 19:09:17 -0700
Message-Id: <1399428565-30499-2-git-send-email-ticotimo@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1399428565-30499-1-git-send-email-ticotimo@gmail.com>
References: <1399428565-30499-1-git-send-email-ticotimo@gmail.com>
Subject: [meta-perl][PATCH v3 1/9] libtext-diff-perl: add 1.41
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
X-List-Received-Date: Wed, 07 May 2014 02:08:04 -0000

From: Tim Orling <TicoTimo@gmail.com>

[Description from CPAN]
diff() provides a basic set of services akin to the GNU diff
utility. It is not anywhere near as feature complete as GNU diff, but it
is
better integrated with Perl and available on all platforms. It is often
faster than shelling out to a system's diff executable for small files,
and generally slower on larger files.

Signed-off-by: Tim Orling <TicoTimo@gmail.com>
---
 .../recipes-perl/libtext/libtext-diff-perl_1.41.bb | 27 ++++++++++++++++++++++
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
1.8.3.2


