Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F5F5C433F5
	for <webhook@archiver.kernel.org>; Thu, 12 May 2022 23:43:15 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web08.2304.1652398989514660748
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 May 2022 16:43:10 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 85F2440CEB
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 May 2022 23:43:08 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eJIzvwz93lKx
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 May 2022 23:43:08 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
 [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 61E3B40CE7
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 May 2022 23:43:08 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 21EC1174930
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 May 2022 19:43:08 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Subject: [kirkstone][PATCH 2/3] devmem2: add support for different page sizes
Date: Thu, 12 May 2022 23:43:06 +0000
Message-Id: <20220512234307.1189721-2-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220512234307.1189721-1-denis@denix.org>
References: <20220512234307.1189721-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 May 2022 23:43:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97084

Instead of hardcoding 4K page size, query the system and use the value fo=
r
memory mapping.

Signed-off-by: Denys Dmytriyenko <denis@denix.org>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Denys Dmytriyenko <denis@denix.org>
---
 meta-oe/recipes-support/devmem2/devmem2.bb    |  4 ++-
 ...ort-different-page-sizes-at-run-time.patch | 35 +++++++++++++++++++
 2 files changed, 38 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/devmem2/devmem2/0001-devmem2-=
support-different-page-sizes-at-run-time.patch

diff --git a/meta-oe/recipes-support/devmem2/devmem2.bb b/meta-oe/recipes=
-support/devmem2/devmem2.bb
index c6b8df5e4..ba7aad8ab 100644
--- a/meta-oe/recipes-support/devmem2/devmem2.bb
+++ b/meta-oe/recipes-support/devmem2/devmem2.bb
@@ -5,7 +5,9 @@ PR =3D "r7"
=20
 SRC_URI =3D "http://www.free-electrons.com/pub/mirror/devmem2.c;download=
filename=3Ddevmem2-new.c \
            file://devmem2-fixups-2.patch;apply=3Dyes;striplevel=3D0 \
-           file://0001-devmem.c-ensure-word-is-32-bit-and-add-support-fo=
r-6.patch"
+           file://0001-devmem.c-ensure-word-is-32-bit-and-add-support-fo=
r-6.patch \
+           file://0001-devmem2-support-different-page-sizes-at-run-time.=
patch \
+"
=20
 S =3D "${WORKDIR}"
=20
diff --git a/meta-oe/recipes-support/devmem2/devmem2/0001-devmem2-support=
-different-page-sizes-at-run-time.patch b/meta-oe/recipes-support/devmem2=
/devmem2/0001-devmem2-support-different-page-sizes-at-run-time.patch
new file mode 100644
index 000000000..0da0732c5
--- /dev/null
+++ b/meta-oe/recipes-support/devmem2/devmem2/0001-devmem2-support-differ=
ent-page-sizes-at-run-time.patch
@@ -0,0 +1,35 @@
+From 0f6af48b2fbc71ec8abe862d3e9eb6da7b03538b Mon Sep 17 00:00:00 2001
+From: Denys Dmytriyenko <denys@ti.com>
+Date: Wed, 8 Aug 2018 14:38:00 -0400
+Subject: [PATCH] devmem2: support different page sizes at run-time
+
+Signed-off-by: Denys Dmytriyenko <denys@ti.com>
+---
+ devmem2.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/devmem2.c b/devmem2.c
+index 68131b2..76af2d6 100644
+--- a/devmem2.c
++++ b/devmem2.c
+@@ -53,8 +53,6 @@
+ #define FATAL do { fprintf(stderr, "Error at line %d, file %s (%d) [%s]=
\n", \
+   __LINE__, __FILE__, errno, strerror(errno)); exit(1); } while(0)
+ =20
+-#define MAP_SIZE 4096UL
+-#define MAP_MASK (MAP_SIZE - 1)
+=20
+ static inline void *fixup_addr(void *addr, size_t size);
+=20
+@@ -66,6 +64,8 @@ int main(int argc, char **argv) {
+ 	int access_type =3D 'w';
+ 	char fmt_str[128];
+ 	size_t data_size;
++	unsigned long MAP_SIZE =3D sysconf(_SC_PAGE_SIZE);
++	unsigned long MAP_MASK =3D (MAP_SIZE - 1);
+ =09
+ 	if(argc < 2) {
+ 		fprintf(stderr, "\nUsage:\t%s { address } [ type [ data ] ]\n"
+--=20
+2.7.4
+
--=20
2.25.1


