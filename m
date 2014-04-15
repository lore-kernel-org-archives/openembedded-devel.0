Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 84D1665E60
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Apr 2014 07:00:37 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s3F70cpw018818
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Apr 2014 00:00:38 -0700 (PDT)
Received: from pek-kkang-d2.wrs.com (128.224.163.135) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Tue, 15 Apr 2014 00:00:37 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 15 Apr 2014 15:01:25 +0800
Message-ID: <98585e4f0a807976da5b7fae817d2ed1bf5b012c.1397545082.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1397545082.git.jackie.huang@windriver.com>
References: <cover.1397545082.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 2/3] gd: add perl to RDEPENDS
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
X-List-Received-Date: Tue, 15 Apr 2014 07:00:37 -0000
Content-Type: text/plain

From: Hongxu Jia <hongxu.jia@windriver.com>

| Note: adding Smart RPM DB channel
|
| Note: to be installed:  gd@x86_64 run-postinsts@x86_64 kernel-modules@qemux86_64 packagegroup-core-boot@qemux86_64
| Loading cache...
| Updating cache...               ######################################## [100%]
|
| Computing transaction...error: Can't install gd-2.1.0-r0.0@x86_64: no package provides /usr/bin/perl
|
| Saving cache...
|
| WARNING: exit code 1 from a shell command.
| ERROR: Function failed: do_rootfs (log file is located at tmp/work/qemux86_64-wrs-linux/wrlinux-image-glibc-small/1.0-r1/temp/do_rootfs/log.do_rootfs.26487)

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta-oe/recipes-support/gd/gd_2.1.0.bb |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/gd/gd_2.1.0.bb b/meta-oe/recipes-support/gd/gd_2.1.0.bb
index 1b78b9b..3d41eec 100644
--- a/meta-oe/recipes-support/gd/gd_2.1.0.bb
+++ b/meta-oe/recipes-support/gd/gd_2.1.0.bb
@@ -11,6 +11,7 @@ SECTION = "libs"
 LICENSE = "GD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c97638cafd3581eb87abd37332137669"
 DEPENDS = "freetype libpng jpeg zlib"
+RDEPENDS_${PN} = "perl"
 
 SRC_URI = "https://bitbucket.org/libgd/gd-libgd/downloads/libgd-${PV}.tar.bz2"
 SRC_URI[md5sum] = "5a1d5bab3a4a41d9f111bcceee4ad25b"
-- 
1.7.9.5


