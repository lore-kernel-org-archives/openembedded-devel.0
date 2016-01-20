Return-Path: <Rongqing.Li@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9146B607A5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Jan 2016 06:12:58 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u0K6CwkG011997
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Jan 2016 22:12:58 -0800
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Tue, 19 Jan 2016 22:12:57 -0800
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 20 Jan 2016 14:12:17 +0800
Message-ID: <1453270337-4985-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 2.5.0
MIME-Version: 1.0
Subject: [PATCH] ebtables: enable KERNEL_64_USERSPACE_32 for powerpc
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
X-List-Received-Date: Wed, 20 Jan 2016 06:12:58 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

Enable KERNEL_64_USERSPACE_32 when powerpc is using 64bit kernel and 32bit
userspace.

Some structs, which is used to communicate between user space and kernel,
have the alignment issue on 64bit kernel with 32 bit userspace. To fix
this issue, ebtables redefines these struct, not use the kernel(sysroot)
include/uapi/linux/netfilter_bridge/ebtables.h, like ebt_entry_target:

The kernel's:
struct ebt_entry_target {
       union {
               char name[EBT_FUNCTION_MAXNAMELEN];
               struct xt_target *target;
       } u;
       /* size of data */
       unsigned int target_size;
       unsigned char data[0] __attribute__ ((aligned (__alignof__(struct ebt_replace))));
};

The ebtables:
struct ebt_entry_target
{
        union {
                char name[EBT_FUNCTION_MAXNAMELEN];
                struct ebt_target *target;
        } u;
        /* size of data */
        unsigned int target_size;
|#ifdef KERNEL_64_USERSPACE_32
        unsigned int pad;
|#endif
        unsigned char data[0] __attribute__ ((aligned (__alignof__(struct ebt_replace))));
};

If the MLPREFIX of package matchs "lib.?32", the 32bit multilib package on
64bit kernel is being built, then enable KERNEL_64_USERSPACE_32.

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 .../recipes-filter/ebtables/ebtables_2.0.10-4.bb            | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/meta-networking/recipes-filter/ebtables/ebtables_2.0.10-4.bb b/meta-networking/recipes-filter/ebtables/ebtables_2.0.10-4.bb
index 2e49dab..e9b726c 100644
--- a/meta-networking/recipes-filter/ebtables/ebtables_2.0.10-4.bb
+++ b/meta-networking/recipes-filter/ebtables/ebtables_2.0.10-4.bb
@@ -27,6 +27,19 @@ S = "${WORKDIR}/ebtables-v${PV}"
 
 inherit update-rc.d systemd
 
+python __anonymous () {
+    import re
+
+    karch = d.getVar('KARCH', True)
+    multilib = d.getVar('MLPREFIX', True)
+
+    if multilib and karch == 'powerpc64':
+        searchstr = "lib.?32"
+        reg = re.compile(searchstr)
+        if reg.search(multilib):
+            d.appendVar('CFLAGS' ,' -DKERNEL_64_USERSPACE_32 -DEBT_MIN_ALIGN=8')
+}
+
 EXTRA_OEMAKE = " \
         BINDIR=${base_sbindir} \
         MANDIR=${mandir} \
-- 
2.5.0


