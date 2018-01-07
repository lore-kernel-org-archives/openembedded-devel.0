Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 8CBDA783C6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Jan 2018 08:28:46 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="35171402"
Received: from bogon (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 11 Jan 2018 16:28:46 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 755CD48AEA13
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Jan 2018 16:28:47 +0800 (CST)
Received: from localhost.localdomain (10.167.225.156) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.361.1; Thu, 11 Jan 2018 16:28:45 +0800
From: zhengrq <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Sun, 7 Jan 2018 18:59:40 +0800
Message-ID: <1515322780-20975-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.156]
X-yoursite-MailScanner-ID: 755CD48AEA13.A881F
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-networking][PATCH] lldpad: new add
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
X-List-Received-Date: Thu, 11 Jan 2018 08:28:48 -0000
Content-Type: text/plain

Add a new recipe lldpad_git.bb.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../lldpad/lldpad/0001-fix-build-warnings.patch    | 94 ++++++++++++++++++++++
 .../lldpad/0002-Change-CFLAGS-to-avoid-error.patch | 25 ++++++
 .../recipes-daemons/lldpad/lldpad_git.bb           | 35 ++++++++
 3 files changed, 154 insertions(+)
 create mode 100644 meta-networking/recipes-daemons/lldpad/lldpad/0001-fix-build-warnings.patch
 create mode 100644 meta-networking/recipes-daemons/lldpad/lldpad/0002-Change-CFLAGS-to-avoid-error.patch
 create mode 100644 meta-networking/recipes-daemons/lldpad/lldpad_git.bb

diff --git a/meta-networking/recipes-daemons/lldpad/lldpad/0001-fix-build-warnings.patch b/meta-networking/recipes-daemons/lldpad/lldpad/0001-fix-build-warnings.patch
new file mode 100644
index 0000000..52c0978
--- /dev/null
+++ b/meta-networking/recipes-daemons/lldpad/lldpad/0001-fix-build-warnings.patch
@@ -0,0 +1,94 @@
+From: Chris Leech <cleech@redhat.com>
+Date: Wed, 17 Jun 2015 10:40:34 -0700
+Subject: [PATCH] fix build warnings
+
+Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
+---
+ include/lldp_8021qaz.h | 6 ------
+ lldp/agent.c           | 5 +++++
+ lldp/agent.h           | 6 +++---
+ lldp_util.c            | 4 ++--
+ 4 files changed, 10 insertions(+), 11 deletions(-)
+
+diff --git a/include/lldp_8021qaz.h b/include/lldp_8021qaz.h
+index 55353b8..09dee20 100644
+--- a/include/lldp_8021qaz.h
++++ b/include/lldp_8021qaz.h
+@@ -218,9 +218,6 @@ int ieee8021qaz_mod_app(struct app_tlv_head *head, int peer,
+ 			u8 prio, u8 sel, u16 proto, u32 ops);
+ int ieee8021qaz_app_sethw(char *ifname, struct app_tlv_head *head);
+ 
+-inline int get_prio_map(u32 prio_map, int tc);
+-inline void set_prio_map(u32 *prio_map, u8 prio, int tc);
+-
+ struct ieee8021qaz_tlvs *ieee8021qaz_data(const char *);
+ 
+ int ieee8021qaz_tlvs_rxed(const char *ifname);
+@@ -234,9 +231,6 @@ int ieee8021qaz_rchange(struct port *port, struct lldp_agent *,
+ void ieee8021qaz_ifup(char *ifname, struct lldp_agent *);
+ void ieee8021qaz_ifdown(char *ifname, struct lldp_agent *);
+ u8 ieee8021qaz_mibDeleteObject(struct port *port, struct lldp_agent *);
+-inline int ieee8021qaz_clif_cmd(void *data, struct sockaddr_un *from,
+-				socklen_t fromlen, char *ibuf, int ilen,
+-				char *rbuf);
+ int ieee8021qaz_check_operstate(void);
+ int get_dcbx_hw(const char *ifname, __u8 *dcbx);
+ 
+diff --git a/lldp/agent.c b/lldp/agent.c
+index 4bc5394..45def9a 100644
+--- a/lldp/agent.c
++++ b/lldp/agent.c
+@@ -36,6 +36,11 @@
+ #include "lldp_mand_clif.h"
+ #include "lldp/agent.h"
+ 
++/* IEEE 802.1AB-2009 - Table 7-1: group MAC addresses used by LLDP */
++const u8 nearest_bridge[ETH_ALEN] = {0x01,0x80,0xc2,0x00,0x00,0x0e};
++const u8 nearest_nontpmr_bridge[ETH_ALEN] = {0x01,0x80,0xc2,0x00,0x00,0x03};
++const u8 nearest_customer_bridge[ETH_ALEN] = {0x01,0x80,0xc2,0x00,0x00,0x00};
++
+ static const u8 * agent_groupmacs[AGENT_MAX] = {
+ 	nearest_bridge,
+ 	nearest_nontpmr_bridge,
+diff --git a/lldp/agent.h b/lldp/agent.h
+index a54f72f..90da3e0 100644
+--- a/lldp/agent.h
++++ b/lldp/agent.h
+@@ -48,9 +48,9 @@ enum agent_type {
+ };
+ 
+ /* IEEE 802.1AB-2009 - Table 7-1: group MAC addresses used by LLDP */
+-static const u8 nearest_bridge[ETH_ALEN] = {0x01,0x80,0xc2,0x00,0x00,0x0e};
+-static const u8 nearest_nontpmr_bridge[ETH_ALEN] = {0x01,0x80,0xc2,0x00,0x00,0x03};
+-static const u8 nearest_customer_bridge[ETH_ALEN] = {0x01,0x80,0xc2,0x00,0x00,0x00};
++extern const u8 nearest_bridge[ETH_ALEN];
++extern const u8 nearest_nontpmr_bridge[ETH_ALEN];
++extern const u8 nearest_customer_bridge[ETH_ALEN];
+ 
+ struct agenttimers {
+ /* Tx */
+diff --git a/lldp_util.c b/lldp_util.c
+index 754b0cd..304ddc5 100644
+--- a/lldp_util.c
++++ b/lldp_util.c
+@@ -1177,7 +1177,7 @@ int check_link_status(const char *ifname)
+ int get_arg_val_list(char *ibuf, int ilen, int *ioff,
+ 			    char **args, char **argvals)
+ {
+-	u8 arglen;
++	u8 arglen = 0;
+ 	u16 argvalue_len;
+ 	int *arglens = NULL;
+ 	int *argvallens = NULL;
+@@ -1245,7 +1245,7 @@ int get_arg_val_list(char *ibuf, int ilen, int *ioff,
+ 
+ int get_arg_list(char *ibuf, int ilen, int *ioff, char **args)
+ {
+-	u8 arglen;
++	u8 arglen = 0;
+ 	int *arglens = NULL;
+ 	int *p;
+ 	int numargs;
+-- 
+2.7.4
+
diff --git a/meta-networking/recipes-daemons/lldpad/lldpad/0002-Change-CFLAGS-to-avoid-error.patch b/meta-networking/recipes-daemons/lldpad/lldpad/0002-Change-CFLAGS-to-avoid-error.patch
new file mode 100644
index 0000000..5cb2a0a
--- /dev/null
+++ b/meta-networking/recipes-daemons/lldpad/lldpad/0002-Change-CFLAGS-to-avoid-error.patch
@@ -0,0 +1,25 @@
+Subject: [PATCH] Change CFLAGS to avoid error
+Fix compile error like: warning: this statement may fall
+ through [-Wimplicit-fallthrough=]
+
+Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
+---
+ Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 4889d32..321bd7c 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -16,7 +16,7 @@ ACLOCAL_AMFLAGS = -I m4
+ parse_cli.o: CFLAGS+=-U_FORTIFY_SOURCE -Wno-error
+ 
+ ## system requires a shared libconfig
+-AM_CFLAGS = -Wall -Werror -Wextra -Wformat=2 $(LIBCONFIG_CFLAGS) $(LIBNL_CFLAGS)
++AM_CFLAGS = -Wall -Wno-error -Wextra -Wformat=2 $(LIBCONFIG_CFLAGS) $(LIBNL_CFLAGS)
+ AM_LDFLAGS = $(LIBCONFIG_LIBS) $(LIBNL_LIBS)
+ 
+ ## header files to be installed, for programs using the client interface to lldpad 
+-- 
+2.7.4
+
diff --git a/meta-networking/recipes-daemons/lldpad/lldpad_git.bb b/meta-networking/recipes-daemons/lldpad/lldpad_git.bb
new file mode 100644
index 0000000..5203eb1
--- /dev/null
+++ b/meta-networking/recipes-daemons/lldpad/lldpad_git.bb
@@ -0,0 +1,35 @@
+SUMMARY = "Intel LLDP Agent"
+DESCRIPTION = "\
+This package contains the Linux user space daemon and configuration tool for \
+Intel LLDP Agent with Enhanced Ethernet support for the Data Center."
+
+HOMEPAGE = "http://open-lldp.org/"
+SECTION = "System Environment/Daemons"
+LICENSE = "GPLv2"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=8c2bc283e65df398ced5f5b747e78162"
+DEPENDS = "libconfig libnl readline"
+
+SRC_URI = "git://open-lldp.org/open-lldp.git \
+           file://0001-fix-build-warnings.patch \
+           file://0002-Change-CFLAGS-to-avoid-error.patch \
+          "
+
+SRCREV = "2b7e05cff2b461efd0fb3e6e73b1bb0a23a330c1"
+
+PV = "1.0.1+git${SRCPV}"
+S = "${WORKDIR}/git"
+
+inherit autotools-brokensep pkgconfig systemd
+
+do_configure_prepend () {
+        ${S}/bootstrap.sh
+}
+
+do_install_append () {
+    install -m 0755 -d ${D}${systemd_unitdir}
+    mv ${D}${prefix}${systemd_unitdir}/* ${D}${systemd_unitdir}/
+    rmdir ${D}${prefix}${systemd_unitdir}
+}
+
+FILES_${PN} += "${systemd_unitdir}"
-- 
2.7.4




