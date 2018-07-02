Return-Path: <Changqing.Li@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id CC254754CA
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Jul 2018 02:31:27 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w622VSsK017961
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 1 Jul 2018 19:31:28 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.399.0; Sun, 1 Jul 2018 19:31:07 -0700
From: Changqing Li <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 2 Jul 2018 10:31:05 +0800
Message-ID: <1530498665-132100-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH][meta-oe] crash: fix do_compile relocation error
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
X-List-Received-Date: Mon, 02 Jul 2018 02:31:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

error info:

id: relocation error: /lib/x86_64-linux-gnu/libnss_nis.so.2:
symbol _nsl_default_nss version GLIBC_PRIVATE not defined in
file libnsl.so.1 with link time reference

Recent glibc change removed libnss-nis module from glibc and
a new recipe libnss-nis.bb was added. After this change,
we need to include native libnss_nis in crash. otherwise,
with "nis" in /etc/nssswitch.conf, we will met above error．

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta-oe/recipes-kernel/crash/crash_7.2.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-kernel/crash/crash_7.2.0.bb b/meta-oe/recipes-kernel/crash/crash_7.2.0.bb
index 440a69d..09fe50d 100644
--- a/meta-oe/recipes-kernel/crash/crash_7.2.0.bb
+++ b/meta-oe/recipes-kernel/crash/crash_7.2.0.bb
@@ -11,6 +11,7 @@ LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING3;md5=d32239bcb673463ab874e80d47fae504"
 
 DEPENDS = "zlib readline coreutils-native"
+DEPENDS_append_libc-glibc = " libnss-nis-native"
 
 SRC_URI = "https://github.com/crash-utility/${BPN}/archive/${PV}.tar.gz;downloadfilename=${BP}.tar.gz \
            http://ftp.gnu.org/gnu/gdb/gdb-7.6.tar.gz;name=gdb;subdir=${BP} \
-- 
2.7.4


