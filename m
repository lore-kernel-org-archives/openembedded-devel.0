Return-Path: <luca.fancellu@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40D12C4167B
	for <webhook@archiver.kernel.org>; Tue, 28 Nov 2023 16:13:47 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.36491.1701188022343871239
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Nov 2023 08:13:42 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: luca.fancellu@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 57655C15
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Nov 2023 08:14:29 -0800 (PST)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8E0303F6C4
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Nov 2023 08:13:41 -0800 (PST)
From: Luca Fancellu <luca.fancellu@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH] linuxptp: Update downstream patches
Date: Tue, 28 Nov 2023 16:12:53 +0000
Message-Id: <20231128161253.3900351-1-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Nov 2023 16:13:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107097

Downstream patches for linuxptp are upstreamed on the project
development branch, update them with their latest status and
update the Upstream-Status.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
 .../0001-include-string.h-for-strncpy.patch   | 13 +++++-----
 .../0002-linuxptp-Use-CC-in-incdefs.sh.patch  | 24 +++++++++++++++----
 2 files changed, 26 insertions(+), 11 deletions(-)

diff --git a/meta-oe/recipes-connectivity/linuxptp/linuxptp/0001-include-=
string.h-for-strncpy.patch b/meta-oe/recipes-connectivity/linuxptp/linuxp=
tp/0001-include-string.h-for-strncpy.patch
index ae544699272f..b117dcf670bd 100644
--- a/meta-oe/recipes-connectivity/linuxptp/linuxptp/0001-include-string.=
h-for-strncpy.patch
+++ b/meta-oe/recipes-connectivity/linuxptp/linuxptp/0001-include-string.=
h-for-strncpy.patch
@@ -1,18 +1,16 @@
-From ecfc8e287eb6811e42c4e2800a913822f554d7c8 Mon Sep 17 00:00:00 2001
+From 6120cee594c543d17ae015bc601012debcf57177 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 31 Aug 2022 19:09:18 -0700
+Date: Mon, 23 Oct 2023 10:43:42 +0100
 Subject: [PATCH] include string.h for strncpy()
=20
-Upstream-Status: Pending
-
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
+Upstream-Status: Backport [master: 6120cee594c543d17ae015bc601012debcf57=
177]
 ---
  interface.c | 1 +
  1 file changed, 1 insertion(+)
=20
 diff --git a/interface.c b/interface.c
-index 29229ad..9a83c36 100644
+index 29229ad6f53d..9a83c36933e7 100644
 --- a/interface.c
 +++ b/interface.c
 @@ -5,6 +5,7 @@
@@ -23,3 +21,6 @@ index 29229ad..9a83c36 100644
  #include "interface.h"
 =20
  struct interface {
+--=20
+2.34.1
+
diff --git a/meta-oe/recipes-connectivity/linuxptp/linuxptp/0002-linuxptp=
-Use-CC-in-incdefs.sh.patch b/meta-oe/recipes-connectivity/linuxptp/linux=
ptp/0002-linuxptp-Use-CC-in-incdefs.sh.patch
index e6a3386df0b2..3cf3a63b94dc 100644
--- a/meta-oe/recipes-connectivity/linuxptp/linuxptp/0002-linuxptp-Use-CC=
-in-incdefs.sh.patch
+++ b/meta-oe/recipes-connectivity/linuxptp/linuxptp/0002-linuxptp-Use-CC=
-in-incdefs.sh.patch
@@ -1,6 +1,6 @@
-From 2cc19a679ec37715df546dd9f00d8d9b0ab20059 Mon Sep 17 00:00:00 2001
+From cffb4807ac0b9ff7aea2aa4f3842985b5363d184 Mon Sep 17 00:00:00 2001
 From: Luca Fancellu <luca.fancellu@arm.com>
-Date: Wed, 18 Oct 2023 11:10:18 +0100
+Date: Mon, 23 Oct 2023 10:43:43 +0100
 Subject: [PATCH] linuxptp: Use ${CC} in incdefs.sh
=20
 The Makefile is defining CC and incdefs.sh is using
@@ -8,13 +8,14 @@ ${CROSS_COMPILE}cpp inside it, allowing both to use dif=
ferent
 compilers depending on what the user pass during make invocation
 as CC.
=20
-Align them using ${CC} also inside incdefs.sh
+Align them using ${CC} also inside incdefs.sh.
=20
 Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
-Upstream-Status: Pending
+Upstream-Status: Backport [master: cffb4807ac0b9ff7aea2aa4f3842985b5363d=
184]
 ---
  incdefs.sh | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
+ makefile   | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
=20
 diff --git a/incdefs.sh b/incdefs.sh
 index a9e94f777f6b..391e63c7fac6 100755
@@ -29,6 +30,19 @@ index a9e94f777f6b..391e63c7fac6 100755
 =20
  	# Look for clock_adjtime().
  	for d in $dirs; do
+diff --git a/makefile b/makefile
+index 3e3b8b35fc96..7fc5f6fb8fa8 100644
+--- a/makefile
++++ b/makefile
+@@ -39,7 +39,7 @@ OBJECTS	=3D $(OBJ) hwstamp_ctl.o nsm.o phc2sys.o phc_c=
tl.o pmc.o pmc_agent.o \
+ SRC	=3D $(OBJECTS:.o=3D.c)
+ DEPEND	=3D $(OBJECTS:.o=3D.d)
+ srcdir	:=3D $(dir $(lastword $(MAKEFILE_LIST)))
+-incdefs :=3D $(shell $(srcdir)/incdefs.sh)
++incdefs :=3D $(shell CC=3D"$(CC)" $(srcdir)/incdefs.sh)
+ version :=3D $(shell $(srcdir)/version.sh $(srcdir))
+ VPATH	=3D $(srcdir)
+=20
 --=20
 2.34.1
=20

base-commit: 09142fe47984bd7ae0e00697404131dcd18f712f
--=20
2.34.1


