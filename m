Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id E038E782E3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Aug 2017 03:01:28 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v7N31SxN003948
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Tue, 22 Aug 2017 20:01:28 -0700
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.361.1;
	Tue, 22 Aug 2017 20:01:27 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 22 Aug 2017 23:01:22 -0400
Message-ID: <5d143386de9338b3a770a44b0590232a53f2301f.1503457180.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1503457180.git.hongxu.jia@windriver.com>
References: <cover.1503457180.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [meta-networking][PATCH 1/3] netcf: upgrade to latest 0.2.8
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
X-List-Received-Date: Wed, 23 Aug 2017 03:01:29 -0000
Content-Type: text/plain

Fix compile failure while gnulib upgraded to 2017-08-20.18
...
| In file included from ../../../git/gnulib/lib/printf-args.h:41:0,
|                  from ../../../git/gnulib/lib/printf-parse.h:29,
|                  from ../../../git/gnulib/lib/printf-parse.c:36:
| ./wchar.h:571:6: error: #if with no expression
|  # if
...

Update HOMEPAGE, SRC_URI since the formers are obsolete.

Update SRCREV, although version not change, but the former
was two years ago.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../recipes-support/netcf/{netcf_git.bb => netcf_0.2.8.bb}    | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)
 rename meta-networking/recipes-support/netcf/{netcf_git.bb => netcf_0.2.8.bb} (88%)

diff --git a/meta-networking/recipes-support/netcf/netcf_git.bb b/meta-networking/recipes-support/netcf/netcf_0.2.8.bb
similarity index 88%
rename from meta-networking/recipes-support/netcf/netcf_git.bb
rename to meta-networking/recipes-support/netcf/netcf_0.2.8.bb
index a7a5000..902eb15 100644
--- a/meta-networking/recipes-support/netcf/netcf_git.bb
+++ b/meta-networking/recipes-support/netcf/netcf_0.2.8.bb
@@ -1,15 +1,14 @@
 SUMMARY = "netcf"
 DESCRIPTION = "netcf is a cross-platform network configuration library."
-HOMEPAGE = "https://fedorahosted.org/netcf/"
+HOMEPAGE = "https://pagure.io/netcf"
 SECTION = "libs"
 LICENSE = "LGPLv2.1"
 
-LIC_FILES_CHKSUM = "file://COPYING;md5=bbb461211a33b134d42ed5ee802b37ff"
+LIC_FILES_CHKSUM = "file://COPYING;md5=fb919cc88dbe06ec0b0bd50e001ccf1f"
 
-SRCREV = "9158278ad35b46ce9a49b2e887483c6d8c287994"
-PV = "0.2.8+git${SRCPV}"
+SRCREV = "2c5d4255857531bc09d91dcd02e86545f29004d4"
 
-SRC_URI = "git://git.fedorahosted.org/netcf.git;protocol=git \
+SRC_URI = "git://pagure.io/netcf.git;protocol=https \
 "
 
 DEPENDS += "augeas libnl libxslt libxml2 gnulib"
@@ -23,6 +22,8 @@ EXTRA_OECONF_append_class-target = " --with-driver=redhat"
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
 PACKAGECONFIG[systemd] = "--with-sysinit=systemd,--with-sysinit=initscripts,"
 
+EXTRA_AUTORECONF += "-I ${S}/gnulib/m4"
+
 do_configure_prepend() {
     currdir=`pwd`
     cd ${S}
-- 
2.8.1


