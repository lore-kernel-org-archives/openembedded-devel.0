Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1330960C04
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Jan 2014 06:12:47 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s0L6ClpA026588
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Jan 2014 22:12:47 -0800 (PST)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.168) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.347.0; Mon, 20 Jan 2014 22:12:46 -0800
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 21 Jan 2014 14:13:04 +0800
Message-ID: <1390284784-25950-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH meta-networking] inetutils: disable rpath
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
X-List-Received-Date: Tue, 21 Jan 2014 06:12:48 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

The rpath, which configuration computers, is a host-related path in
cross-compile environment; In fact, need to not add rpath into elf
file.

   WARNING: QA Issue: package inetutils-ftp contains bad RPATH
   /buildarea/build/new/bitbake_build/tmp/sysroots/qemux86-64/usr/lib64 in file
   /buildarea/build/new/bitbake_build/tmp/work/x86_64-wrs-linux/inetutils/1.9.1-r1/packages-split/inetutils-ftp/usr/bin/ftp.inetutils

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 meta-networking/recipes-connectivity/inetutils/inetutils_1.9.1.bb |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.1.bb b/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.1.bb
index 97fc6a1..b3bacee 100644
--- a/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.1.bb
+++ b/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.1.bb
@@ -38,6 +38,7 @@ PACKAGECONFIG[uucpd] = "--enable-uucpd,--disable-uucpd,readline"
 EXTRA_OECONF = "--with-ncurses-include-dir=${STAGING_INCDIR} \
         ${noipv6} \
         --with-libreadline-prefix=${STAGING_DIR_HOST}${prefix} \
+        --enable-rpath=no \
 "
 
 do_configure_prepend () {
-- 
1.7.10.4


