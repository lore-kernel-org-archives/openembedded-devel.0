Return-Path: <joe@deserted.net>
Received: from mail-io0-f170.google.com (mail-io0-f170.google.com
	[209.85.223.170])
	by mail.openembedded.org (Postfix) with ESMTP id B1EA377139
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Oct 2015 17:06:07 +0000 (UTC)
Received: by iow1 with SMTP id 1so98123479iow.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Oct 2015 10:06:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:subject:date:message-id;
	bh=n9z+VHUeGrAx0/fs96ERvHmxFilotWLe1B0M6FIC4VQ=;
	b=DV8RxmDZsVRpaTE3VCe0egjqrJ3EywEuNt3T3dJJQgCyPxUxLDBstJx4DHRPlGbVWj
	aP/Zl5ZKZY/m2zM44ruxK5TWEgWluv5f6xZbW7U3n9KlxmwJ59N7sOmrIYCkJGz559gk
	op2ZMcTbzUJJyz1kHents0eLxbT85Mg1azAj0SgIE92M/rJaVjdS2WccN/psxM4B2ijf
	DDr/XPOT7E45I5o5cch4mYoBO4hpo5CSJah4gK4/HBEEsIrZ6eZuSucoY0lQ8hHW2w/L
	Dyg4gdMWfDIR/RQ7EDV7yMUbTSGJjwv3uifT40/NbVlPxIDb5JS8zNde0PsL0q9WeIgg
	i0XA==
X-Gm-Message-State: ALoCoQkvpo4/5iWQblHQyaBfgn6j5Zr9aH3MJMLitDmWbhsNhF57rus8MpUVsqTeSUVswA0E+6+1
X-Received: by 10.107.157.80 with SMTP id g77mr15890144ioe.118.1445533568070; 
	Thu, 22 Oct 2015 10:06:08 -0700 (PDT)
Received: from mir.deserted.net ([23.233.31.74])
	by smtp.gmail.com with ESMTPSA id
	e20sm6379192ioe.42.2015.10.22.10.06.07
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 22 Oct 2015 10:06:07 -0700 (PDT)
Sender: Joe MacDonald <joe@deserted.net>
From: Joe MacDonald <joe_macdonald@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 22 Oct 2015 13:06:34 -0400
Message-Id: <1445533594-14760-1-git-send-email-joe_macdonald@mentor.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-networking][PATCH] lldpad: remove obsolete recipe
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
X-List-Received-Date: Thu, 22 Oct 2015 17:06:08 -0000

Based on this thread:

        http://comments.gmane.org/gmane.comp.handhelds.openembedded/70890

it seems that lldpd is a more complete implementation of the LLDP
protocol.  Remove this implementation to provide better direction to
newcomers and to attempt to focus support for a single implementation in
the meta-networking layer.

Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
---
 ...-functions-work-with-both-gnu11-and-gnu89.patch | 99 ----------------------
 .../recipes-daemons/lldpad/lldpad_0.9.46.bb        | 29 -------
 2 files changed, 128 deletions(-)
 delete mode 100644 meta-networking/recipes-daemons/lldpad/lldpad/0001-get-inline-functions-work-with-both-gnu11-and-gnu89.patch
 delete mode 100644 meta-networking/recipes-daemons/lldpad/lldpad_0.9.46.bb

diff --git a/meta-networking/recipes-daemons/lldpad/lldpad/0001-get-inline-functions-work-with-both-gnu11-and-gnu89.patch b/meta-networking/recipes-daemons/lldpad/lldpad/0001-get-inline-functions-work-with-both-gnu11-and-gnu89.patch
deleted file mode 100644
index 9ff7c0f..0000000
--- a/meta-networking/recipes-daemons/lldpad/lldpad/0001-get-inline-functions-work-with-both-gnu11-and-gnu89.patch
+++ /dev/null
@@ -1,99 +0,0 @@
-From 67399dcc2575c0e9c64fc77354f9653127cddf64 Mon Sep 17 00:00:00 2001
-From: Roy Li <rongqing.li@windriver.com>
-Date: Mon, 14 Sep 2015 17:07:26 +0800
-Subject: [PATCH] get inline functions work with both gnu11 and gnu89
-
-Upstream-status: Pending
-
-After gcc upgraded to gcc5, and if the codes are compiled without optimization(-O0),
-and the below error will happen:
-
-./include/lldp_8021qaz.h:237:12: error: inline function 'ieee8021qaz_clif_cmd' declared but never defined [-Werror]
- inline int ieee8021qaz_clif_cmd(void *data, struct sockaddr_un *from,
-            ^
-./include/lldp_8021qaz.h:222:13: error: inline function 'set_prio_map' declared but never defined [-Werror]
- inline void set_prio_map(u32 *prio_map, u8 prio, int tc);
-             ^
-./include/lldp_8021qaz.h:221:12: error: inline function 'get_prio_map' declared but never defined [-Werror]
- inline int get_prio_map(u32 prio_map, int tc);
-
-gcc5 defaults to -std=gnu11 instead of -std=gnu89, and it requires that exactly one C
-source file has the callable copy of the inline function. Consider the following
-program:
-
-  inline int
-  foo (void)
-  {
-    return 42;
-  }
-
-  int
-  main (void)
-  {
-    return foo ();
-  }
-
-The program above will not link with the C99 inline semantics, because no out-of-line
-function foo is generated. To fix this, either mark the function foo as static, or
-add the following declaration:
-  static inline int foo (void);
-
-more information refer to: https://gcc.gnu.org/gcc-5/porting_to.html;
-
-but the use of "extern inline" will lead to the compilation issue if gcc is not
-gcc5, so replace inline with "static inline"
-
-Signed-off-by: Roy Li <rongqing.li@windriver.com>
----
- include/lldp_8021qaz.h | 5 -----
- lldp_8021qaz.c         | 4 ++--
- 2 files changed, 2 insertions(+), 7 deletions(-)
-
-diff --git a/include/lldp_8021qaz.h b/include/lldp_8021qaz.h
-index 55353b8..d321625 100644
---- a/include/lldp_8021qaz.h
-+++ b/include/lldp_8021qaz.h
-@@ -218,8 +218,6 @@ int ieee8021qaz_mod_app(struct app_tlv_head *head, int peer,
- 			u8 prio, u8 sel, u16 proto, u32 ops);
- int ieee8021qaz_app_sethw(char *ifname, struct app_tlv_head *head);
- 
--inline int get_prio_map(u32 prio_map, int tc);
--inline void set_prio_map(u32 *prio_map, u8 prio, int tc);
- 
- struct ieee8021qaz_tlvs *ieee8021qaz_data(const char *);
- 
-@@ -234,9 +232,6 @@ int ieee8021qaz_rchange(struct port *port, struct lldp_agent *,
- void ieee8021qaz_ifup(char *ifname, struct lldp_agent *);
- void ieee8021qaz_ifdown(char *ifname, struct lldp_agent *);
- u8 ieee8021qaz_mibDeleteObject(struct port *port, struct lldp_agent *);
--inline int ieee8021qaz_clif_cmd(void *data, struct sockaddr_un *from,
--				socklen_t fromlen, char *ibuf, int ilen,
--				char *rbuf);
- int ieee8021qaz_check_operstate(void);
- int get_dcbx_hw(const char *ifname, __u8 *dcbx);
- 
-diff --git a/lldp_8021qaz.c b/lldp_8021qaz.c
-index 094676d..f154317 100644
---- a/lldp_8021qaz.c
-+++ b/lldp_8021qaz.c
-@@ -396,7 +396,7 @@ static int read_cfg_file(char *ifname, struct lldp_agent *agent,
- 	return 0;
- }
- 
--inline int get_prio_map(u32 prio_map, int prio)
-+static inline int get_prio_map(u32 prio_map, int prio)
- {
- 	if (prio > 7)
- 		return 0;
-@@ -404,7 +404,7 @@ inline int get_prio_map(u32 prio_map, int prio)
- 	return (prio_map >> (4 * (7-prio))) & 0xF;
- }
- 
--inline void set_prio_map(u32 *prio_map, u8 prio, int tc)
-+static inline void set_prio_map(u32 *prio_map, u8 prio, int tc)
- {
- 	u32 mask = ~(0xffffffff & (0xF << (4 * (7-prio))));
- 	*prio_map &= mask;
--- 
-1.9.1
-
diff --git a/meta-networking/recipes-daemons/lldpad/lldpad_0.9.46.bb b/meta-networking/recipes-daemons/lldpad/lldpad_0.9.46.bb
deleted file mode 100644
index b191df5..0000000
--- a/meta-networking/recipes-daemons/lldpad/lldpad_0.9.46.bb
+++ /dev/null
@@ -1,29 +0,0 @@
-SUMMARY = "Intel LLDP Agent"
-DESCRIPTION = "\
-This package contains the Linux user space daemon and configuration tool for \
-Intel LLDP Agent with Enhanced Ethernet support for the Data Center."
-SECTION = "net"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=8c2bc283e65df398ced5f5b747e78162"
-DEPENDS = "libconfig libnl readline"
-SRCREV = "48a5f38778b18d6659a672ccb4640f25c6720827"
-
-SRC_URI = "git://github.com/jrfastab/lldpad.git;protocol=http \
-           file://0001-get-inline-functions-work-with-both-gnu11-and-gnu89.patch \
-"
-
-S = "${WORKDIR}/git"
-
-inherit autotools-brokensep pkgconfig systemd
-
-do_configure_prepend() {
-    sed -i "s:-Werror::g" ${S}/Makefile.am
-}
-
-do_install_append () {
-    install -m 0755 -d ${D}${systemd_unitdir}
-    mv ${D}${prefix}${systemd_unitdir}/* ${D}${systemd_unitdir}/
-    rmdir ${D}${prefix}${systemd_unitdir}
-}
-
-FILES_${PN} += "${systemd_unitdir}"
-- 
1.9.1


