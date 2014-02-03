Return-Path: <ticotimo@gmail.com>
Received: from mail-pd0-f170.google.com (mail-pd0-f170.google.com
	[209.85.192.170])
	by mail.openembedded.org (Postfix) with ESMTP id 1D8C96E991
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  3 Feb 2014 06:50:44 +0000 (UTC)
Received: by mail-pd0-f170.google.com with SMTP id p10so6528819pdj.15
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 02 Feb 2014 22:50:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=k9T/B4kGtLR1QPZA+qQa34epRIS6txn2RkQuvHWBtDU=;
	b=KF+l7uzqvfZWVa4cZxrTdnmqGG18Ci6eRZ4JyjnDBHBn285MjKMK8fZscHUmVa5hib
	l3IxfQYqW7rvhr9kktkwZh65lPLQAwzRtrgEQBQJirLVGCiFHtq0iy6Cv4/ZzN1FRlrm
	xBs/x7+ZgROOlp3pn30Q2V8G1tmNpVee0M108pM+uLb/WIRNhQhs+V795yQHQNSiOh9Z
	4hh4FPqtBXfRpae4QKsW8v8jiUr9LZR6yRUUVoo74SOVWpNjkoonXr0mUL1HSaW910lh
	l3j6WB1dzk1w4G8GNF3PSUlyUObClbd3AiyNPqqY57PjlcEj0yAhO8xjyEARrjns3p1d
	iUIw==
X-Received: by 10.68.171.193 with SMTP id aw1mr35386167pbc.117.1391410245344; 
	Sun, 02 Feb 2014 22:50:45 -0800 (PST)
Received: from localhost.localdomain (75-128-22-150.dhcp.snlo.ca.charter.com.
	[75.128.22.150]) by mx.google.com with ESMTPSA id
	i10sm137068968pat.11.2014.02.02.22.50.43
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 02 Feb 2014 22:50:44 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  2 Feb 2014 22:51:12 -0800
Message-Id: <1391410275-31251-8-git-send-email-ticotimo@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1391410275-31251-1-git-send-email-ticotimo@gmail.com>
References: <1391410275-31251-1-git-send-email-ticotimo@gmail.com>
Subject: [meta-perl][PATCH v2 07/10] libextutils-installpaths-perl: add 0.010
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
X-List-Received-Date: Mon, 03 Feb 2014 06:50:44 -0000

[Description from CPAN]
This module tries to make install path resolution as easy
as possible.

Signed-off-by: Tim Orling <ticotimo@gmail.com>
---
 .../libextutils-installpaths-perl_0.010.bb         |   25 ++++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 meta-perl/recipes-perl/libextutils/libextutils-installpaths-perl_0.010.bb

diff --git a/meta-perl/recipes-perl/libextutils/libextutils-installpaths-perl_0.010.bb b/meta-perl/recipes-perl/libextutils/libextutils-installpaths-perl_0.010.bb
new file mode 100644
index 0000000..4cfdfc4
--- /dev/null
+++ b/meta-perl/recipes-perl/libextutils/libextutils-installpaths-perl_0.010.bb
@@ -0,0 +1,25 @@
+SUMMARY = "ExtUtils::InstallPaths - Build.PL install path logic made easy"
+DESCRIPTION = "This module tries to make install path resolution as easy \
+as possible."
+SECTION = "libs"
+
+HOMEPAGE = "http://search.cpan.org/~leont/ExtUtils-InstallPaths/"
+
+LICENSE = "Artistic-1.0 | GPL-1.0+"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=15bbcc2806d297df9e944b8955b38d82"
+
+SRC_URI = "http://search.cpan.org/CPAN/authors/id/L/LE/LEONT/ExtUtils-InstallPaths-${PV}.tar.gz"
+SRC_URI[md5sum] = "f0b00cc6c04653588a6298fa1f16c07f"
+SRC_URI[sha256sum] = "d14cbff118e467900c2c488b55b83ef697d6eb1b8f592c0521f1d82848bf2156"
+
+S = "${WORKDIR}/ExtUtils-InstallPaths-${PV}"
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
1.7.9.5


