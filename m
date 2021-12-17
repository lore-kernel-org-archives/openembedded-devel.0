Return-Path: <jk@codeconstruct.com.au>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9CDFC433F5
	for <webhook@archiver.kernel.org>; Fri, 17 Dec 2021 02:28:51 +0000 (UTC)
Received: from codeconstruct.com.au (codeconstruct.com.au [203.29.241.158])
 by mx.groups.io with SMTP id smtpd.web11.1458.1639708130442442915
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Dec 2021 18:28:51 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: codeconstruct.com.au,
 ip: 203.29.241.158, mailfrom: jk@codeconstruct.com.au)
Received: by codeconstruct.com.au (Postfix, from userid 10000)
	id 8E13B2022C; Fri, 17 Dec 2021 10:28:48 +0800 (AWST)
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH v2 1/2] mctp: upgrade to v1.0
Date: Fri, 17 Dec 2021 10:28:09 +0800
Message-Id: 
 <cce00d3bd3f4f35b181b678181a7e769e010e8b9.1639707922.git.jk@codeconstruct.com.au>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 Dec 2021 02:28:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94417

We have a tag for 1.0, now: better handling of local stack configuration
at runtime, and the 5.15 kernel header change has been integrated.

Signed-off-by: Jeremy Kerr <jk@codeconstruct.com.au>

---
v2:
 - use 1.0 tag
---
 .../0001-build-Adjust-for-kernel-mctp.h.patch | 84 -------------------
 .../recipes-support/mctp/mctp_git.bb          |  8 +-
 2 files changed, 3 insertions(+), 89 deletions(-)
 delete mode 100644 meta-networking/recipes-support/mctp/mctp/0001-build-=
Adjust-for-kernel-mctp.h.patch

diff --git a/meta-networking/recipes-support/mctp/mctp/0001-build-Adjust-=
for-kernel-mctp.h.patch b/meta-networking/recipes-support/mctp/mctp/0001-=
build-Adjust-for-kernel-mctp.h.patch
deleted file mode 100644
index 83bf19770..000000000
--- a/meta-networking/recipes-support/mctp/mctp/0001-build-Adjust-for-ker=
nel-mctp.h.patch
+++ /dev/null
@@ -1,84 +0,0 @@
-From 653eccc918ef993186c312694c288b2a5b39248e Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 5 Nov 2021 13:14:55 -0700
-Subject: [PATCH] build: Adjust for kernel mctp.h
-
-Starting 5.15 kernel has mctp.h as well and provides some of the
-defintions, therefore move the ones we need to provide in this header
-outside the conditional check so its always provided regardless of
-header coming from kernel or not.
-
-Include linux/if_link.h so it can pre-define IFLA_MCTP_UNSPEC and other
-defines and there is a check for conditionally providing them here but
-kernel does not have such a check, so if linux/if_link.h is included
-after this header then we end up with duplicate defines
-
-linux/if_link.h:1267:2: error: redefinition of enumerator 'IFLA_MCTP_UNS=
PEC'
-        IFLA_MCTP_UNSPEC,
-        ^
-../git/src/mctp.h:74:2: note: previous definition is here
-        IFLA_MCTP_UNSPEC,
-        ^
-
-Upstream-Status: Submitted [https://github.com/CodeConstruct/mctp/pull/2=
]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/mctp.h | 21 +++++++++++----------
- 1 file changed, 11 insertions(+), 10 deletions(-)
-
-diff --git a/src/mctp.h b/src/mctp.h
-index 4f73def..e602168 100644
---- a/src/mctp.h
-+++ b/src/mctp.h
-@@ -19,6 +19,7 @@
- #if HAVE_LINUX_MCTP_H
- #include <linux/mctp.h>
- #endif
-+#include <linux/if_link.h>
-=20
- #ifndef AF_MCTP
- #define AF_MCTP 45
-@@ -33,10 +34,6 @@
-=20
- #ifndef MCTP_NET_ANY
-=20
--#ifndef MAX_ADDR_LEN
--#define MAX_ADDR_LEN 32
--#endif
--
- typedef uint8_t			mctp_eid_t;
-=20
- struct mctp_addr {
-@@ -53,6 +50,16 @@ struct sockaddr_mctp {
- 	uint8_t			__smctp_pad1;
- };
-=20
-+#define MCTP_NET_ANY 0
-+#define MCTP_ADDR_ANY 0xff
-+#define MCTP_TAG_OWNER 0x08
-+
-+#endif /* MCTP_NET_ANY */
-+
-+#ifndef MAX_ADDR_LEN
-+#define MAX_ADDR_LEN 32
-+#endif
-+
- struct sockaddr_mctp_ext {
- 	struct sockaddr_mctp	smctp_base;
- 	int			smctp_ifindex;
-@@ -61,12 +68,6 @@ struct sockaddr_mctp_ext {
- 	unsigned char		smctp_haddr[MAX_ADDR_LEN];
- };
-=20
--#define MCTP_NET_ANY 0
--#define MCTP_ADDR_ANY 0xff
--#define MCTP_TAG_OWNER 0x08
--
--#endif /* MCTP_NET_ANY */
--
- #ifndef IFLA_MCTP_MAX
-=20
- /* From if_link.h */
---=20
-2.33.1
-
diff --git a/meta-networking/recipes-support/mctp/mctp_git.bb b/meta-netw=
orking/recipes-support/mctp/mctp_git.bb
index 50d84d204..eabc6fa16 100644
--- a/meta-networking/recipes-support/mctp/mctp_git.bb
+++ b/meta-networking/recipes-support/mctp/mctp_git.bb
@@ -5,13 +5,11 @@ LICENSE =3D "GPLv2"
=20
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D4cc91856b08b094b4f406a29dc61d=
b21"
=20
-PV =3D "0.1+git${SRCPV}"
+PV =3D "1.0+git${SRCPV}"
=20
-SRCREV =3D "072bafe725c50329f99cf9d3b2624e8799e8163a"
+SRCREV =3D "669740432af525c19a6a41cec777406fbbc24836"
=20
-SRC_URI =3D "git://github.com/CodeConstruct/mctp;branch=3Dmain;protocol=3D=
https \
-           file://0001-build-Adjust-for-kernel-mctp.h.patch \
-          "
+SRC_URI =3D "git://github.com/CodeConstruct/mctp;branch=3Dmain;protocol=3D=
https"
=20
 S =3D "${WORKDIR}/git"
=20
--=20
2.33.0


