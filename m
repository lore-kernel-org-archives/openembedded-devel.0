Return-Path: <ticotimo@gmail.com>
Received: from mail-pd0-f177.google.com (mail-pd0-f177.google.com
	[209.85.192.177])
	by mail.openembedded.org (Postfix) with ESMTP id DC6316EAF9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Jan 2014 15:11:32 +0000 (UTC)
Received: by mail-pd0-f177.google.com with SMTP id x10so4355804pdj.22
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Jan 2014 07:11:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=enEGZgaUKnD8B2v9W8a585DWbext54RGD7Vmib75HUo=;
	b=FK4xdimo+k5eT3nPbtKXxNqopG7wqhqFkxmwGzSIsGx2m2OgCkTEfqee6Lm/7BDnLr
	Kcr7ARN6LUbxEIPY03tV9yKIOkhg5HHNYyLn0gQtUwddG50oNdlntdNwIf/RmKTE7au5
	vTT4njFAXqc4mh2W/LcBQTxwsRaqr5Mi2mB8TBq7bLcDQNc2LCLRpw0onTsab9L9Nf7h
	Enzusr8XEfe8lxmtoKldf30fQ/qSkqGb5x0vN3U+9izP5xOhv3rhaROaZYZlr3Bko33G
	9Q33im+r/cJfJlCoIeStqs57oJcnczDlihKeaBd7+56341mHn+U5bhU4VGADkYXZnuBh
	2g1A==
X-Received: by 10.66.164.70 with SMTP id yo6mr21501006pab.85.1391181094190;
	Fri, 31 Jan 2014 07:11:34 -0800 (PST)
Received: from localhost.localdomain (75-128-22-150.dhcp.snlo.ca.charter.com.
	[75.128.22.150]) by mx.google.com with ESMTPSA id
	zc6sm69486700pab.18.2014.01.31.07.11.32
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 31 Jan 2014 07:11:33 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 31 Jan 2014 07:11:38 -0800
Message-Id: <1391181100-32525-7-git-send-email-ticotimo@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1391181100-32525-1-git-send-email-ticotimo@gmail.com>
References: <1391181100-32525-1-git-send-email-ticotimo@gmail.com>
Subject: [meta-perl][PATCH 7/9] perl-module-extutils-installpaths: add 0.010
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
X-List-Received-Date: Fri, 31 Jan 2014 15:11:33 -0000

[Description from CPAN]
This module tries to make install path resolution as easy as possible.

When you want to install a module, it needs to figure out where to install things. The nutshell version of how this works is that default installation locations are determined from ExtUtils::Config, and they may be individually overridden by using the install_path attribute. An install_base attribute lets you specify an alternative installation root like /home/foo and prefix does something similar in a rather different (and more complicated) way. destdir lets you specify a temporary installation directory like /tmp/install in case you want to create bundled-up installable packages.

Signed-off-by: Tim Orling <ticotimo@gmail.com>
---
 .../perl-module-extutils-installpaths_0.010.bb     |   24 ++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 meta-perl/recipes-perl/extutils/perl-module-extutils-installpaths_0.010.bb

diff --git a/meta-perl/recipes-perl/extutils/perl-module-extutils-installpaths_0.010.bb b/meta-perl/recipes-perl/extutils/perl-module-extutils-installpaths_0.010.bb
new file mode 100644
index 0000000..e95aec9
--- /dev/null
+++ b/meta-perl/recipes-perl/extutils/perl-module-extutils-installpaths_0.010.bb
@@ -0,0 +1,24 @@
+SUMMARY = "ExtUtils::InstallPaths - Build.PL install path logic made easy"
+DESCRIPTION = "This module tries to make install path resolution as easy \
+as possible."
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


