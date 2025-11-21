Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42773CFC50D
	for <webhook@archiver.kernel.org>; Fri, 21 Nov 2025 22:25:29 +0000 (UTC)
Received: from rcdn-iport-3.cisco.com (rcdn-iport-3.cisco.com [173.37.86.74])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18875.1763751183104499809
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 Nov 2025 10:53:03 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=GuMeXjZe;
 spf=temperror, err=temporary DNS error (domain: cisco.com, ip: 173.37.86.74, mailfrom: adongare@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2618; q=dns/txt;
  s=iport01; t=1763751183; x=1764960783;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=3nJjJtJy+ehocgbBxHHsLILSR66gDjUYvypjDPIUeus=;
  b=GuMeXjZeQIw7ukrHY9MjHsC+CwMHjBXbZ4y4m5YuCtkC5giBUMAs+0tT
   KUo6K7hvOWQgdYLsFxC8EPMcL+fiGUieMeMBUOEQbRQ2GSMMiiEJiDyKh
   BaFXU0R4z0fx26axozu3O6cMGVE9ITezmDkw6bTl55SAHA06aQHYQ6QKJ
   afcD6meSEQNc9nx752GRnAdtZNzqHpzedCn++P/HzrnIuTbmVFqBviPII
   X+NNQmVge6I55LCz3iFuPzpqAtiZgLhiYgUMD1lY0HHIKTigKnEx7patk
   oXp/2mMXkWz7FT6R9uXjzRZ88zY3fO+aQQzzV6bEogVMs9l0sNffU1uF/
   Q==;
X-CSE-ConnectionGUID: 93abOtsNQPmH7/tA2ncgpg==
X-CSE-MsgGUID: M7qS4n8AR4ieB2D1g3pkLQ==
X-IPAS-Result: =?us-ascii?q?A0BOBAC5syBp/43/Ja1aHgEBCxIMggULgkd7XUNJlVxsi?=
 =?us-ascii?q?2eSNoF/DwEBAQ9EDQQBAYUHjF8CJjQJDgECBAEBAQEDAgMBAQEBAQEBAQEBA?=
 =?us-ascii?q?QsBAQUBAQECAQcFgQ4Thk8IBYZdNgE9CTBRC0SDAgGCOgM2AxGxfYIsgQHdP?=
 =?us-ascii?q?g2CVQaBSoU7gnmFHXABhHgnGxuBcoEVgTuCLYEFgRqCDGWFdwSCIoEOgXqEL?=
 =?us-ascii?q?YJTHhCQL0iBHgNZLAFVEw0KCwcFgWMDNQwLKhVuMh2BJD4Yc4RdImgPBoESg?=
 =?us-ascii?q?1EGgS6HaQ+KWQMLGA1IESw3FBsGPm4HlCJRgi5ZNQErWZULP4JrjHGCIaAdc?=
 =?us-ascii?q?Qoog3SMHo89hXwaM6prC5h7jgiECZErMWuEaYFoPIFZcBWDIlIZD44uCguIc?=
 =?us-ascii?q?cF2JTILMQIHCwEBAwmTZwEB?=
IronPort-Data: A9a23:sdWEO64ppOLxbEZ23aV1JQxRtD/GchMFZxGqfqrLsTDasY5as4F+v
 mQdWGCFM6uKMGv0KopwPomy8E9X6pGAzddhQAQ4/ypjZn8b8sCt6fZ1gavT04J+CuWZESqLO
 u1HMoGowPgcFyGa/lH2dOC98RGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUw6mJSqYDR7zil5
 5Wo+6UzBHf/g2QpaztOsvrZwP9SlK2aVA0w7wRWic9j5Dcyp1FNZLoDKKe4KWfPQ4U8NoaSW
 +bZwbilyXjS9hErB8nNuu6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTaJLwXXxqZwChxLid/
 jniWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I0DuKxPRL/tS4E4ebNYR8MFrGkd3z
 fk4d3cRR0qFjO2uz+fuIgVsrpxLwMjDJogTvDRkiDreF/tjGcyFSKTR7tge1zA17ixMNa+BP
 IxCNnw1MUmGOkEWUrsUIMpWcOOAj3X4dTJRsl+9rqss6G+Vxwt0uFToGIaPJ4bXGJUEwS50o
 ErjoH3CXhdKHebDyDevqF71ibTXngfCDdd6+LqQs6QCbEeo7nYaClsVVVa+ifa8g0+6HdlYL
 iQ8/TIjq6U3/kGnQtTxGhG1vnOAlhodQMZLVeoi5QeAz6DZ7wqUCi4DVDEpQMQrqMIsAzkjz
 FyOt8joCDlitqbTQnWYnop4thuoMiQTaGtHbigeQE5dv5/ooZo4iVTESdML/LOJs+AZ0ArYm
 1iixBXSTZ1K5SLX/81XJWz6vg8=
IronPort-HdrOrdr: A9a23:exADeqlAxVFUq5eBv4fqY61cI2vpDfIn3DAbv31ZSRFFG/FwWf
 rAoB19726QtN9/YhAdcLy7VZVoIkmsl6Kdg7NwAV7KZmCP0wGVxepZg7cKrQeNJ8SHzJ8/6U
 +lGJIOb+EZyjNB/KLH3DU=
X-Talos-CUID: =?us-ascii?q?9a23=3AQUUraGj/t0me3qI0T/Ob+xTQGjJuIybUxlDMOGm?=
 =?us-ascii?q?BMWNJF/qJYAWW86x8nJ87?=
X-Talos-MUID: 9a23:3rBrZQZx7PKfoOBTkmD1v21kZO5Sv6WjIhohyJpdo8qgDHkl
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.20,216,1758585600"; 
   d="scan'208";a="425255897"
Received: from rcdn-l-core-04.cisco.com ([173.37.255.141])
  by rcdn-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 21 Nov 2025 18:53:02 +0000
Received: from sjc-ads-10055.cisco.com (sjc-ads-10055.cisco.com [10.30.210.59])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-04.cisco.com (Postfix) with ESMTPS id 23261180001A2;
	Fri, 21 Nov 2025 18:53:02 +0000 (GMT)
Received: by sjc-ads-10055.cisco.com (Postfix, from userid 1870532)
	id BE23BCC1288; Fri, 21 Nov 2025 10:53:01 -0800 (PST)
From: "Anil Dongare -X (adongare - E INFOCHIPS PRIVATE LIMITED at Cisco)" <adongare@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com, to@cisco.com,
	Peter Marko <peter.marko@siemens.com>, Khem Raj <raj.khem@gmail.com>,
	Anil Dongare <adongare@cisco.com>
Subject: [meta-openembedded] [scarthgap] [PATCH] uw-imap: patch CVE-2018-19518
Date: Fri, 21 Nov 2025 10:52:55 -0800
Message-ID: <20251121185256.1745520-1-adongare@cisco.com>
X-Mailer: git-send-email 2.44.1
MIME-Version: 1.0
X-Outbound-SMTP-Client: 10.30.210.59, sjc-ads-10055.cisco.com
X-Outbound-Node: rcdn-l-core-04.cisco.com
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 21 Nov 2025 22:25:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121963

From: Peter Marko <peter.marko@siemens.com>

Take patch from Debian from
https://salsa.debian.org/lts-team/packages/uw-imap/-/commit/873b07f46ce40f43bca10ec85fe63a7a0b934294

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 9f7c1e6bd101494c6cc5dad16a7fa65a13cbac70)
Signed-off-by: Anil Dongare <adongare@cisco.com>
---
 .../uw-imap/uw-imap/CVE-2018-19518.patch      | 24 +++++++++++++++++++
 .../recipes-devtools/uw-imap/uw-imap_2007f.bb |  1 +
 2 files changed, 25 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/uw-imap/uw-imap/CVE-2018-19518.patch

diff --git a/meta-oe/recipes-devtools/uw-imap/uw-imap/CVE-2018-19518.patch b/meta-oe/recipes-devtools/uw-imap/uw-imap/CVE-2018-19518.patch
new file mode 100644
index 0000000000..d942a752b3
--- /dev/null
+++ b/meta-oe/recipes-devtools/uw-imap/uw-imap/CVE-2018-19518.patch
@@ -0,0 +1,24 @@
+uw-imap (8:2007f~dfsg-6) unstable; urgency=medium
+
+  * [CVE-2018-19518] 2013_disable_rsh.patch (new): Disable access to IMAP
+    mailboxes through running imapd over rsh, and therefore ssh (Closes:
+    #914632). Code using the library can enable it with tcp_parameters()
+    after making sure that the IMAP server name is sanitized.
+
+ -- Magnus Holmgren <holmgren@debian.org>  Tue, 26 Feb 2019 23:35:43 +0100
+
+CVE: CVE-2018-19518
+Upstream-Status: Inactive-Upstream [lastrelease: 2007]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+
+--- a/src/osdep/unix/Makefile
++++ b/src/osdep/unix/Makefile
+@@ -988,7 +988,7 @@ onceenv:
+ 	 -DMD5ENABLE=\"$(MD5PWD)\" -DMAILSPOOL=\"$(MAILSPOOL)\" \
+ 	 -DANONYMOUSHOME=\"$(MAILSPOOL)/anonymous\" \
+ 	 -DACTIVEFILE=\"$(ACTIVEFILE)\" -DNEWSSPOOL=\"$(NEWSSPOOL)\" \
+-	 -DRSHPATH=\"$(RSHPATH)\" -DLOCKPGM=\"$(LOCKPGM)\" \
++	 -DLOCKPGM=\"$(LOCKPGM)\" \
+ 	 -DLOCKPGM1=\"$(LOCKPGM1)\" -DLOCKPGM2=\"$(LOCKPGM2)\" \
+ 	 -DLOCKPGM3=\"$(LOCKPGM3)\" > OSCFLAGS
+ 	echo $(BASELDFLAGS) $(EXTRALDFLAGS) > LDFLAGS
diff --git a/meta-oe/recipes-devtools/uw-imap/uw-imap_2007f.bb b/meta-oe/recipes-devtools/uw-imap/uw-imap_2007f.bb
index dcb59f4ea0..0fec03524a 100644
--- a/meta-oe/recipes-devtools/uw-imap/uw-imap_2007f.bb
+++ b/meta-oe/recipes-devtools/uw-imap/uw-imap_2007f.bb
@@ -15,6 +15,7 @@ SRC_URI = "https://fossies.org/linux/misc/old/imap-${PV}.tar.gz \
            file://0001-Do-not-build-mtest.patch \
            file://0002-tmail-Include-ctype.h-for-isdigit.patch \
            file://0001-Fix-Wincompatible-function-pointer-types.patch \
+           file://CVE-2018-19518.patch \
            "
 
 SRC_URI[md5sum] = "2126fd125ea26b73b20f01fcd5940369"
-- 
2.44.1


