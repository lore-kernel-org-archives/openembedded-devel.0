Return-Path: <ticotimo@gmail.com>
Received: from mail-pb0-f50.google.com (mail-pb0-f50.google.com
	[209.85.160.50])
	by mail.openembedded.org (Postfix) with ESMTP id D0A676E987
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Jan 2014 15:11:20 +0000 (UTC)
Received: by mail-pb0-f50.google.com with SMTP id rq2so4524940pbb.9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Jan 2014 07:11:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=lIGrBm3fIBNxdhuNWtQoRJcNscdX4twuwnrbeu67s88=;
	b=x9fmoA3OKyYsFZuhonmhEgQAl8G0xsHEUEYF85U/L6F9Pzv8bruupTqdzGlZp5MOAn
	6wUNILVf2zXMNWpdATFeaJCKWi+s0FQXfl0/DGDCZ4kQ2Nnj2BPk02nVbmBeJbkXTpaa
	ZJTCnuToAr1W73FTi8XtsvzDcFuULe3GcBOmAj4KmWLvO/DqmXOmt9EGd3ODgPBq+Mwk
	9BtGa0/UhI9mqlsleeBq+5WfcoY3cknnLjMIJsZ3nL4S9YZDNAt9Yu57efxrixW+MwHJ
	sRJcUZilKeZ0MaQglb74etJbjunaM4Fizmj5u9cUIi49CVXayz2urVpQ0kTQoBNvFUin
	0+3A==
X-Received: by 10.68.130.169 with SMTP id of9mr21268953pbb.79.1391181081680;
	Fri, 31 Jan 2014 07:11:21 -0800 (PST)
Received: from localhost.localdomain (75-128-22-150.dhcp.snlo.ca.charter.com.
	[75.128.22.150]) by mx.google.com with ESMTPSA id
	zc6sm69486700pab.18.2014.01.31.07.11.19
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 31 Jan 2014 07:11:20 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 31 Jan 2014 07:11:32 -0800
Message-Id: <1391181100-32525-1-git-send-email-ticotimo@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-perl][PATCH 1/9] perl-module-metadata: add 1.000019
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
X-List-Received-Date: Fri, 31 Jan 2014 15:11:22 -0000

[Description from CPAN]
This module provides a standard way to gather metadata about a .pm file through (mostly) static analysis and (some) code execution. When determining the version of a module, the $VERSION assignment is "eval"ed, as is traditional in the CPAN toolchain.

Signed-off-by: Tim Orling <ticotimo@gmail.com>
---
 .../perl-module-metadata_1.000019.bb               |   32 ++++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 meta-perl/recipes-perl/module-metadata/perl-module-metadata_1.000019.bb

diff --git a/meta-perl/recipes-perl/module-metadata/perl-module-metadata_1.000019.bb b/meta-perl/recipes-perl/module-metadata/perl-module-metadata_1.000019.bb
new file mode 100644
index 0000000..974cc80
--- /dev/null
+++ b/meta-perl/recipes-perl/module-metadata/perl-module-metadata_1.000019.bb
@@ -0,0 +1,32 @@
+SUMMARY = "Module::Metadata - Gather package and POD information from perl module files"
+DESCRIPTION = "This module provides a standard way to gather metadata about \
+a .pm files through (mostly) static analysis and (some) code execution. When \
+determining the version of a module, the $VERSION assignment is eval-ed, as \
+is traditional in the CPAN toolchain."
+
+HOMEPAGE = "http://search.cpan.org/~ether/Module-Metadata/"
+
+LICENSE = "Artistic-1.0 | GPL-1.0+"
+LIC_FILES_CHKSUM = "file://README;beginline=185;endline=190;md5=e1b24eebe5d819b40bb68ad06b72d3ee"
+
+SRC_URI = "http://search.cpan.org/CPAN/authors/id/E/ET/ETHER/Module-Metadata-${PV}.tar.gz"
+SRC_URI[md5sum] = "838ecf97f7daff79e0f81e104a6be823"
+SRC_URI[sha256sum] = "5afca94dc0213608101ad519eb1b25133cdc9e44c2a053a45a5a59422c2ee554"
+
+S = "${WORKDIR}/Module-Metadata-${PV}"
+
+inherit cpan
+
+RDEPENDS_${PN} = " perl-module-io-file \
+                   perl-module-data-dumper \
+                   perl-module-extutils-makemaker \
+                   perl-module-file-spec \
+                   perl-module-version \
+                   perl-module-exporter \
+                   perl-module-carp \
+                   perl-module-test-more \
+                   perl-module-file-temp \
+                   perl-module-file-path \
+"
+
+BBCLASSEXTEND = "native"
-- 
1.7.9.5


