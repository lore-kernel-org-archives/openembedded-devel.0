Return-Path: <straka.derek@gmail.com>
Received: from mail-qg0-f42.google.com (mail-qg0-f42.google.com
	[209.85.192.42])
	by mail.openembedded.org (Postfix) with ESMTP id D6C6974197
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  5 Mar 2016 01:27:41 +0000 (UTC)
Received: by mail-qg0-f42.google.com with SMTP id y89so57716926qge.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Mar 2016 17:27:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=jS4aW/WEqs7Xa+y8AO/ijpWUOr9HIWyChnICVzGL0Js=;
	b=LtvEqtG76TO12VTL4pkGVNDWeiY8GpZFDnQrp+hoe/c36FgIDv6vmvdW/YYsNGX5Lv
	efWyFKNckpB+D98/q0u875XOWYXXrgflMi4hhmqKfMXyJ9HbIsqPKZkvicCW8GpCnFJY
	PkL12iia5xrwJ3bDS7/EySVs96YvrGGBXLlyVq2uMrRw+bgJmRuKanTfA/0EWQ/nnJgZ
	UX0CerbbgpPR/eJTyfjDiHnHdOc14R2GESpgyVbAvYH4qYJjdTeWtaV0cYQQarM0jwZm
	QBOoEyypfqdRdMze0gduU9Zy/WOevQXk6C3MKk+JsGcZCu7ip9YFCWY/zp6MvZYzRGJw
	WpgA==
X-Gm-Message-State: AD7BkJKWK8spQGsec615ycgfRhH2rEYT1B2crMNb2jO06xLdzT1XWi09jrF21D8+99l3zA==
X-Received: by 10.140.107.182 with SMTP id h51mr13895491qgf.53.1457141262438; 
	Fri, 04 Mar 2016 17:27:42 -0800 (PST)
Received: from lnx-desktop.minotaur.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168])
	by smtp.gmail.com with ESMTPSA id w1sm2882024qha.3.2016.03.04.17.27.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 04 Mar 2016 17:27:41 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  4 Mar 2016 20:27:19 -0500
Message-Id: <1457141239-15887-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-networking][PATCH] pptp-linux: update to 1.8.0
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 05 Mar 2016 01:27:43 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../pptp-linux-1.7.2/fix-parallel-build.patch         | 19 -------------------
 .../options.pptp                                      |  0
 .../{pptp-linux_1.7.2.bb => pptp-linux_1.8.0.bb}      |  7 +++----
 3 files changed, 3 insertions(+), 23 deletions(-)
 delete mode 100644 meta-networking/recipes-protocols/pptp-linux/pptp-linux-1.7.2/fix-parallel-build.patch
 rename meta-networking/recipes-protocols/pptp-linux/{pptp-linux-1.7.2 => pptp-linux-1.8.0}/options.pptp (100%)
 rename meta-networking/recipes-protocols/pptp-linux/{pptp-linux_1.7.2.bb => pptp-linux_1.8.0.bb} (77%)

diff --git a/meta-networking/recipes-protocols/pptp-linux/pptp-linux-1.7.2/fix-parallel-build.patch b/meta-networking/recipes-protocols/pptp-linux/pptp-linux-1.7.2/fix-parallel-build.patch
deleted file mode 100644
index 77722b0..0000000
--- a/meta-networking/recipes-protocols/pptp-linux/pptp-linux-1.7.2/fix-parallel-build.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-pptp.c and version.c depend on config.h
-
-Upstream-Status: Backport
-
-Upstream has already similar fixes. Will be available on next release.
-
-Signed-off-by: Jesse Zhang <sen.zhang@windriver.com>
-
---- a/Makefile	2013-02-27 17:09:24.431226665 +0800
-+++ b/Makefile	2013-02-27 17:09:03.442075550 +0800
-@@ -43,6 +43,8 @@
- pptpsetup.8: pptpsetup
- 	pod2man $? > $@
- 
-+pptp.o version.o: config.h
-+
- config.h: 
- 	echo "/* text added by Makefile target config.h */" > config.h
- 	echo "#define PPTP_LINUX_VERSION \"$(VERSION)$(RELEASE)\"" >> config.h
diff --git a/meta-networking/recipes-protocols/pptp-linux/pptp-linux-1.7.2/options.pptp b/meta-networking/recipes-protocols/pptp-linux/pptp-linux-1.8.0/options.pptp
similarity index 100%
rename from meta-networking/recipes-protocols/pptp-linux/pptp-linux-1.7.2/options.pptp
rename to meta-networking/recipes-protocols/pptp-linux/pptp-linux-1.8.0/options.pptp
diff --git a/meta-networking/recipes-protocols/pptp-linux/pptp-linux_1.7.2.bb b/meta-networking/recipes-protocols/pptp-linux/pptp-linux_1.8.0.bb
similarity index 77%
rename from meta-networking/recipes-protocols/pptp-linux/pptp-linux_1.7.2.bb
rename to meta-networking/recipes-protocols/pptp-linux/pptp-linux_1.8.0.bb
index 003361c..bc8b2cb 100644
--- a/meta-networking/recipes-protocols/pptp-linux/pptp-linux_1.7.2.bb
+++ b/meta-networking/recipes-protocols/pptp-linux/pptp-linux_1.8.0.bb
@@ -7,17 +7,16 @@ DESCRIPTION = "PPTP Client is a Linux, FreeBSD, NetBSD \
 HOMEPAGE = "http://pptpclient.sourceforge.net"
 SECTION = "net"
 LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 PR = "r1"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/sourceforge/pptpclient/pptp-${PV}.tar.gz \
            file://options.pptp \
-           file://fix-parallel-build.patch \
 "
 
-SRC_URI[md5sum] = "4c3d19286a37459a632c7128c92a9857"
-SRC_URI[sha256sum] = "e98ae0065d2a39fa3131654ff28cb7070e996f668ed6d0e7d9a445b8d37694bc"
+SRC_URI[md5sum] = "4efce9f263e2c3f38d79d9df222476de"
+SRC_URI[sha256sum] = "e39c42d933242a8a6dd8600a0fa7f0a5ec8f066d10c4149d8e81a5c68fe4bbda"
 
 S = "${WORKDIR}/pptp-${PV}"
 
-- 
1.9.1


