Return-Path: <ticotimo@gmail.com>
Received: from mail-pd0-f170.google.com (mail-pd0-f170.google.com
	[209.85.192.170])
	by mail.openembedded.org (Postfix) with ESMTP id D51CB65DDE
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 May 2014 02:08:05 +0000 (UTC)
Received: by mail-pd0-f170.google.com with SMTP id v10so346754pde.29
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 May 2014 19:08:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=dN2TOegbunkVcpDjS3zkgBeCL8SZkhWjh2JQM6iYiyc=;
	b=GPeYClWcK2pvcHh1DOl9FeWxDmFDuKHBAi2Kh6Ny5w8whQYHEbv4DPpDSqePbh46Jn
	CeHUA9WxkuUBHOOuuMhCbxm270SjYHKhmcAf4u7FGCFUjdetpSEp72KDe+4Zo7tSzIpA
	JpJHjAWoCePhaQsAPr+hEHkW/71wISbInIeVfRjK4rdz19CXdMdy55Tpf1tVk9TKQcgs
	QCCcSxi66y6IkInboFfBZ5aoRDXo5auVXWZEWrypNK5nj09ZmabJiCtK7YGpXdxM/wqh
	UNEq4aS+HTp0EVN323zHu7nzxYMeASLnHl38gzbsN9i2wgovhREhI01wozWMZLQdGsHe
	isAw==
X-Received: by 10.66.65.204 with SMTP id z12mr13039631pas.60.1399428486549;
	Tue, 06 May 2014 19:08:06 -0700 (PDT)
Received: from gentoo.localdomain (75-128-22-150.dhcp.snlo.ca.charter.com.
	[75.128.22.150])
	by mx.google.com with ESMTPSA id ec2sm142236pbc.63.2014.05.06.19.08.04
	for <multiple recipients>
	(version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128/128);
	Tue, 06 May 2014 19:08:05 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  6 May 2014 19:09:20 -0700
Message-Id: <1399428565-30499-5-git-send-email-ticotimo@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1399428565-30499-1-git-send-email-ticotimo@gmail.com>
References: <1399428565-30499-1-git-send-email-ticotimo@gmail.com>
Subject: [meta-perl][PATCH v3 4/9] libextutils-config-perl: add 0.007
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
X-List-Received-Date: Wed, 07 May 2014 02:08:06 -0000

From: Tim Orling <TicoTimo@gmail.com>

[Description from CPAN]
ExtUtils::Config is an abstraction around the %Config hash.

Signed-off-by: Tim Orling <TicoTimo@gmail.com>
---
 .../libextutils/libextutils-config-perl_0.007.bb   | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 meta-perl/recipes-perl/libextutils/libextutils-config-perl_0.007.bb

diff --git a/meta-perl/recipes-perl/libextutils/libextutils-config-perl_0.007.bb b/meta-perl/recipes-perl/libextutils/libextutils-config-perl_0.007.bb
new file mode 100644
index 0000000..8276d28
--- /dev/null
+++ b/meta-perl/recipes-perl/libextutils/libextutils-config-perl_0.007.bb
@@ -0,0 +1,24 @@
+SUMMARY = "ExtUtils::Config - A wrapper for perl's configuration"
+DESCRIPTION = "ExtUtils::Config is an abstraction around the %Config hash."
+SECTION = "libs"
+
+HOMEPAGE = "http://search.cpan.org/~leont/ExtUtils-Config/"
+
+LICENSE = "Artistic-1.0 | GPL-1.0+"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=b1b813683bd988732e7fd6a796bf7f47"
+
+SRC_URI = "http://search.cpan.org/CPAN/authors/id/L/LE/LEONT/ExtUtils-Config-${PV}.tar.gz"
+SRC_URI[md5sum] = "2829c0dfa8a7e51b3f582efbee4bb128"
+SRC_URI[sha256sum] = "2c1465078b876fd16a90507092805265528c2532d4937b03547a6dbdb8ac0eef"
+
+S = "${WORKDIR}/ExtUtils-Config-${PV}"
+
+inherit cpan
+
+RDEPENDS_${PN} = " perl-module-extutils-makemaker \
+                   perl-module-data-dumper \
+                   perl-module-test-more \
+                   perl-module-file-temp \
+"
+
+BBCLASSEXTEND = "native"
-- 
1.8.3.2


