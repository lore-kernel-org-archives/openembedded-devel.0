Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 431FD6B201
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Jul 2013 06:38:15 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r6G6cGwU018464
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Jul 2013 23:38:16 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.159) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Mon, 15 Jul 2013 23:38:15 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 16 Jul 2013 14:38:13 +0800
Message-ID: <1373956693-24572-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Cc: Joe.macdonald@windriver.com
Subject: [meta-networking][PATCH] ipsec-tools: fix dependencies and enable two configuration
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
X-List-Received-Date: Tue, 16 Jul 2013 06:38:15 -0000
Content-Type: text/plain

From: "Roy.Li" <rongqing.li@windriver.com>

ipsec-tools depends on bison-native
enable ipv6 support by DISTRO_FEATURE, and enable shared library support.

Signed-off-by: Roy.Li <rongqing.li@windriver.com>
---
 meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8.1.bb |    6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8.1.bb b/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8.1.bb
index ef753c0..c44d374 100644
--- a/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8.1.bb
+++ b/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8.1.bb
@@ -5,7 +5,7 @@ SECTION = "console/network"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://src/libipsec/pfkey.c;beginline=6;endline=31;md5=bc9b7ff40beff19fe6bc6aef26bd2b24"
 
-DEPENDS = "virtual/kernel openssl readline flex"
+DEPENDS = "virtual/kernel openssl readline flex bison-native"
 
 SRC_URI = "ftp://ftp.netbsd.org/pub/NetBSD/misc/ipsec-tools/0.8/ipsec-tools-${PV}.tar.bz2 \
            file://0001-Fix-warning-with-gcc-4.8.patch \
@@ -46,7 +46,9 @@ EXTRA_OECONF = "--with-kernel-headers=${STAGING_INCDIR} \
                 --without-libradius \
                 --without-gssapi \
                 --without-libpam \
-                --disable-security-context"
+                --disable-security-context \
+                --enable-shared \
+                ${@base_contains('DISTRO_FEATURES', 'ipv6', '--enable-ipv6=yes', '', d)}"
 
 # See http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=530527
 CFLAGS += "-fno-strict-aliasing"
-- 
1.7.10.4


