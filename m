Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B4EAE762B7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Sep 2015 09:29:16 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t8E9TGJB012129
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Sep 2015 02:29:16 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.235.1; Mon, 14 Sep 2015 02:29:15 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 14 Sep 2015 17:23:32 +0800
Message-ID: <1442222612-27281-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH][meta-networking] lldap: fix the building failure when gcc5 is used or DEBUG_BUILD is 1
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
X-List-Received-Date: Mon, 14 Sep 2015 09:29:18 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

1. fix the building failure when host is gcc5
2. fix the building failure when DEBUG_BUILD is 1 by removal of -Werror
   Remove -Werror, since it is suitable to develop only; otherwise when
   gcc adds -O0 option to compile codes, the error will be generated
   since the warning:
     //#  warning _FORTIFY_SOURCE requires compiling with optimization (-O)

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 ...-functions-work-with-both-gnu11-and-gnu89.patch | 99 ++++++++++++++++++++++
 .../recipes-daemons/lldpad/lldpad_0.9.46.bb        |  8 +-
 2 files changed, 106 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-daemons/lldpad/lldpad/0001-get-inline-functions-work-with-both-gnu11-and-gnu89.patch

diff --git a/meta-networking/recipes-daemons/lldpad/lldpad/0001-get-inline-functions-work-with-both-gnu11-and-gnu89.patch b/meta-networking/recipes-daemons/lldpad/lldpad/0001-get-inline-functions-work-with-both-gnu11-and-gnu89.patch
new file mode 100644
index 0000000..9ff7c0f
--- /dev/null
+++ b/meta-networking/recipes-daemons/lldpad/lldpad/0001-get-inline-functions-work-with-both-gnu11-and-gnu89.patch
@@ -0,0 +1,99 @@
+From 67399dcc2575c0e9c64fc77354f9653127cddf64 Mon Sep 17 00:00:00 2001
+From: Roy Li <rongqing.li@windriver.com>
+Date: Mon, 14 Sep 2015 17:07:26 +0800
+Subject: [PATCH] get inline functions work with both gnu11 and gnu89
+
+Upstream-status: Pending
+
+After gcc upgraded to gcc5, and if the codes are compiled without optimization(-O0),
+and the below error will happen:
+
+./include/lldp_8021qaz.h:237:12: error: inline function 'ieee8021qaz_clif_cmd' declared but never defined [-Werror]
+ inline int ieee8021qaz_clif_cmd(void *data, struct sockaddr_un *from,
+            ^
+./include/lldp_8021qaz.h:222:13: error: inline function 'set_prio_map' declared but never defined [-Werror]
+ inline void set_prio_map(u32 *prio_map, u8 prio, int tc);
+             ^
+./include/lldp_8021qaz.h:221:12: error: inline function 'get_prio_map' declared but never defined [-Werror]
+ inline int get_prio_map(u32 prio_map, int tc);
+
+gcc5 defaults to -std=gnu11 instead of -std=gnu89, and it requires that exactly one C
+source file has the callable copy of the inline function. Consider the following
+program:
+
+  inline int
+  foo (void)
+  {
+    return 42;
+  }
+
+  int
+  main (void)
+  {
+    return foo ();
+  }
+
+The program above will not link with the C99 inline semantics, because no out-of-line
+function foo is generated. To fix this, either mark the function foo as static, or
+add the following declaration:
+  static inline int foo (void);
+
+more information refer to: https://gcc.gnu.org/gcc-5/porting_to.html;
+
+but the use of "extern inline" will lead to the compilation issue if gcc is not
+gcc5, so replace inline with "static inline"
+
+Signed-off-by: Roy Li <rongqing.li@windriver.com>
+---
+ include/lldp_8021qaz.h | 5 -----
+ lldp_8021qaz.c         | 4 ++--
+ 2 files changed, 2 insertions(+), 7 deletions(-)
+
+diff --git a/include/lldp_8021qaz.h b/include/lldp_8021qaz.h
+index 55353b8..d321625 100644
+--- a/include/lldp_8021qaz.h
++++ b/include/lldp_8021qaz.h
+@@ -218,8 +218,6 @@ int ieee8021qaz_mod_app(struct app_tlv_head *head, int peer,
+ 			u8 prio, u8 sel, u16 proto, u32 ops);
+ int ieee8021qaz_app_sethw(char *ifname, struct app_tlv_head *head);
+ 
+-inline int get_prio_map(u32 prio_map, int tc);
+-inline void set_prio_map(u32 *prio_map, u8 prio, int tc);
+ 
+ struct ieee8021qaz_tlvs *ieee8021qaz_data(const char *);
+ 
+@@ -234,9 +232,6 @@ int ieee8021qaz_rchange(struct port *port, struct lldp_agent *,
+ void ieee8021qaz_ifup(char *ifname, struct lldp_agent *);
+ void ieee8021qaz_ifdown(char *ifname, struct lldp_agent *);
+ u8 ieee8021qaz_mibDeleteObject(struct port *port, struct lldp_agent *);
+-inline int ieee8021qaz_clif_cmd(void *data, struct sockaddr_un *from,
+-				socklen_t fromlen, char *ibuf, int ilen,
+-				char *rbuf);
+ int ieee8021qaz_check_operstate(void);
+ int get_dcbx_hw(const char *ifname, __u8 *dcbx);
+ 
+diff --git a/lldp_8021qaz.c b/lldp_8021qaz.c
+index 094676d..f154317 100644
+--- a/lldp_8021qaz.c
++++ b/lldp_8021qaz.c
+@@ -396,7 +396,7 @@ static int read_cfg_file(char *ifname, struct lldp_agent *agent,
+ 	return 0;
+ }
+ 
+-inline int get_prio_map(u32 prio_map, int prio)
++static inline int get_prio_map(u32 prio_map, int prio)
+ {
+ 	if (prio > 7)
+ 		return 0;
+@@ -404,7 +404,7 @@ inline int get_prio_map(u32 prio_map, int prio)
+ 	return (prio_map >> (4 * (7-prio))) & 0xF;
+ }
+ 
+-inline void set_prio_map(u32 *prio_map, u8 prio, int tc)
++static inline void set_prio_map(u32 *prio_map, u8 prio, int tc)
+ {
+ 	u32 mask = ~(0xffffffff & (0xF << (4 * (7-prio))));
+ 	*prio_map &= mask;
+-- 
+1.9.1
+
diff --git a/meta-networking/recipes-daemons/lldpad/lldpad_0.9.46.bb b/meta-networking/recipes-daemons/lldpad/lldpad_0.9.46.bb
index 8c44a3e..0c8c5d8 100644
--- a/meta-networking/recipes-daemons/lldpad/lldpad_0.9.46.bb
+++ b/meta-networking/recipes-daemons/lldpad/lldpad_0.9.46.bb
@@ -8,12 +8,18 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=8c2bc283e65df398ced5f5b747e78162"
 DEPENDS = "libconfig libnl"
 SRCREV = "48a5f38778b18d6659a672ccb4640f25c6720827"
 
-SRC_URI = "git://github.com/jrfastab/lldpad.git;protocol=http"
+SRC_URI = "git://github.com/jrfastab/lldpad.git;protocol=http \
+           file://0001-get-inline-functions-work-with-both-gnu11-and-gnu89.patch \
+"
 
 S = "${WORKDIR}/git"
 
 inherit autotools-brokensep pkgconfig systemd
 
+do_configure_prepend() {
+    sed -i "s:-Werror::g" ${S}/Makefile.am
+}
+
 do_install_append () {
     install -m 0755 -d ${D}${systemd_unitdir}
     mv ${D}${prefix}${systemd_unitdir}/* ${D}${systemd_unitdir}/
-- 
1.9.1


