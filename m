Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E533A65C7B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Nov 2014 02:01:57 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sAC21vNr001661
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Nov 2014 18:01:57 -0800 (PST)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.163.178) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Tue, 11 Nov 2014 18:01:56 -0800
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 12 Nov 2014 10:01:55 +0800
Message-ID: <1415757715-26213-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 2.1.0
MIME-Version: 1.0
Subject: [PATCH][meta-networking][V2] ebtables: make it be able to work on 64bit kernel with 32 bit userspace
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
X-List-Received-Date: Wed, 12 Nov 2014 02:02:00 -0000
Content-Type: text/plain

From: "Roy.Li" <rongqing.li@windriver.com>

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

To make it work on 64bit kernel and 32bit userspace, KERNEL_64_USERSPACE_32
is needed to be enabled.

If the MLPREFIX of package matchs "lib.?32", the 32bit multilib  package on
64bit kernel is being built.

Signed-off-by: Roy.Li <rongqing.li@windriver.com>
---
 meta-networking/recipes-filter/ebtables/ebtables_2.0.10-4.bb | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/meta-networking/recipes-filter/ebtables/ebtables_2.0.10-4.bb b/meta-networking/recipes-filter/ebtables/ebtables_2.0.10-4.bb
index 32cfc75..ca084e3 100644
--- a/meta-networking/recipes-filter/ebtables/ebtables_2.0.10-4.bb
+++ b/meta-networking/recipes-filter/ebtables/ebtables_2.0.10-4.bb
@@ -27,6 +27,17 @@ S = "${WORKDIR}/ebtables-v${PV}"
 
 inherit update-rc.d systemd
 
+python __anonymous () {
+    import re
+
+    multilib = d.getVar('MLPREFIX', True)
+    if multilib:
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
2.1.0


