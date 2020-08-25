Received: from outbound.soverin.net (outbound.soverin.net [116.202.65.218])
 by mx.groups.io with SMTP id smtpd.web12.9741.1598345801989907005
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Aug 2020 01:56:43 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: embed.me.uk, ip: 116.202.65.218, mailfrom: ml@embed.me.uk)
Received: from smtp.soverin.net (unknown [10.10.3.24])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by outbound.soverin.net (Postfix) with ESMTPS id 1CF0360AEC
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Aug 2020 08:56:39 +0000 (UTC)
Received: from smtp.soverin.net (smtp.soverin.net [159.69.232.138]) by soverin.net
From: "Jack Mitchell" <ml@embed.me.uk>
To: openembedded-devel@lists.openembedded.org
Cc: Jack Mitchell <ml@embed.me.uk>
Subject: [meta-networking][PATCH] meta-networking: dhcpcd: backport ALIGN compile error fix
Date: Tue, 25 Aug 2020 09:56:21 +0100
Message-Id: <20200825085621.3445046-1-ml@embed.me.uk>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at c03mi01
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable

Fails to build on an aarch64 system with ipv6 disabled. This backported
patch fixes it.

Signed-off-by: Jack Mitchell <ml@embed.me.uk>
---
 .../dhcpcd/dhcpcd_9.1.4.bb                    |  3 +-
 ...-on-systems-that-do-not-define-ALIGN.patch | 34 +++++++++++++++++++
 2 files changed, 36 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-connectivity/dhcpcd/files/000=
2-Fix-compile-without-IPv6-on-systems-that-do-not-define-ALIGN.patch

diff --git a/meta-networking/recipes-connectivity/dhcpcd/dhcpcd_9.1.4.bb =
b/meta-networking/recipes-connectivity/dhcpcd/dhcpcd_9.1.4.bb
index defd3420f..766df3a2b 100644
--- a/meta-networking/recipes-connectivity/dhcpcd/dhcpcd_9.1.4.bb
+++ b/meta-networking/recipes-connectivity/dhcpcd/dhcpcd_9.1.4.bb
@@ -12,7 +12,8 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D9674cc803c5d=
71306941e6e8b5c002f2"
 UPSTREAM_CHECK_URI =3D "https://roy.marples.name/downloads/dhcpcd/"
=20
 SRC_URI =3D "http://roy.marples.name/downloads/${BPN}/${BPN}-${PV}.tar.x=
z \
-           file://0001-remove-INCLUDEDIR-to-prevent-build-issues.patch"
+           file://0001-remove-INCLUDEDIR-to-prevent-build-issues.patch \
+	   file://0002-Fix-compile-without-IPv6-on-systems-that-do-not-define-A=
LIGN.patch"
=20
 SRC_URI[sha256sum] =3D "5fe133e5497d8af6d26bd6e6b8dd48ab12d124d6cc4cefe6=
de6536ff97f76820"
=20
diff --git a/meta-networking/recipes-connectivity/dhcpcd/files/0002-Fix-c=
ompile-without-IPv6-on-systems-that-do-not-define-ALIGN.patch b/meta-netw=
orking/recipes-connectivity/dhcpcd/files/0002-Fix-compile-without-IPv6-on=
-systems-that-do-not-define-ALIGN.patch
new file mode 100644
index 000000000..2c7f24ebf
--- /dev/null
+++ b/meta-networking/recipes-connectivity/dhcpcd/files/0002-Fix-compile-=
without-IPv6-on-systems-that-do-not-define-ALIGN.patch
@@ -0,0 +1,34 @@
+From 7643b6615aab4de290ead6c1a6b56f10a82bbe6f Mon Sep 17 00:00:00 2001
+From: Roy Marples <roy@marples.name>
+Date: Sat, 4 Jul 2020 13:21:09 +0100
+Subject: [PATCH] Fix compile without IPv6 on systems that do not define =
ALIGN
+
+Upstream-Status: backport
+
+---
+ src/dhcpcd.h | 5 -----
+ 1 file changed, 5 deletions(-)
+
+diff --git a/src/dhcpcd.h b/src/dhcpcd.h
+index 61a6a081..d9719c0a 100644
+--- a/src/dhcpcd.h
++++ b/src/dhcpcd.h
+@@ -96,7 +96,6 @@ TAILQ_HEAD(if_head, interface);
+=20
+ #include "privsep.h"
+=20
+-#ifdef INET6
+ /* dhcpcd requires CMSG_SPACE to evaluate to a compile time constant. *=
/
+ #if defined(__QNX) || \
+ 	(defined(__NetBSD_Version__) && __NetBSD_Version__ < 600000000)
+@@ -113,10 +112,6 @@ TAILQ_HEAD(if_head, interface);
+ #define	CMSG_SPACE(len)	(ALIGN(sizeof(struct cmsghdr)) + ALIGN(len))
+ #endif
+=20
+-#define IP6BUFLEN	(CMSG_SPACE(sizeof(struct in6_pktinfo)) + \
+-			CMSG_SPACE(sizeof(int)))
+-#endif
+-
+ struct passwd;
+=20
+ struct dhcpcd_ctx {
--=20
2.28.0

