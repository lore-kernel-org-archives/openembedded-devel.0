Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4C12C48BF6
	for <webhook@archiver.kernel.org>; Sat, 24 Feb 2024 13:04:22 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.web10.18130.1708779857140916933
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 24 Feb 2024 05:04:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=cudTxH5k;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-202402241304139eca2e866b768cdcce-1dpxog@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 202402241304139eca2e866b768cdcce
        for <openembedded-devel@lists.openembedded.org>;
        Sat, 24 Feb 2024 14:04:14 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=81P/PITrc7inFE61zdU2bwgm90s/N054L128O510qdI=;
 b=cudTxH5kksBWDL2EgevciOPB4EneAToINFuc5gUVWFA33AZIo2hJm66EZ1hSPUdsnBzZ6Q
 eE6rJvfnhLQ+7tVEzmmbZFlb/WdWVIQy3Xn93kl7MgNThmq1T2UtAZpTwTpy8RTaZkdbGh6q
 49yDzkA5Y3BC8LGlq/l3jDeH2pTfM=;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-networking][PATCH] dnsmasq: Upgrade 2.89 -> 2.90
Date: Sat, 24 Feb 2024 14:03:25 +0100
Message-Id: <20240224130325.202922-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 24 Feb 2024 13:04:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109026

From: Peter Marko <peter.marko@siemens.com>

Fixes CVE-2023-50387 and CVE-2023-50868

Remove backported CVE patch.
Remove patch for lua as hardcoding lua version was removed.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../recipes-support/dnsmasq/dnsmasq/lua.patch | 33 -------------
 .../{dnsmasq_2.89.bb => dnsmasq_2.90.bb}      |  4 +-
 .../dnsmasq/files/CVE-2023-28450.patch        | 48 -------------------
 3 files changed, 1 insertion(+), 84 deletions(-)
 delete mode 100644 meta-networking/recipes-support/dnsmasq/dnsmasq/lua.patch
 rename meta-networking/recipes-support/dnsmasq/{dnsmasq_2.89.bb => dnsmasq_2.90.bb} (97%)
 delete mode 100644 meta-networking/recipes-support/dnsmasq/files/CVE-2023-28450.patch

diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq/lua.patch b/meta-networking/recipes-support/dnsmasq/dnsmasq/lua.patch
deleted file mode 100644
index f8697699a..000000000
--- a/meta-networking/recipes-support/dnsmasq/dnsmasq/lua.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From be1b3d2d0f1608cba5efee73d6aac5ad0709041b Mon Sep 17 00:00:00 2001
-From: Joe MacDonald <joe_macdonald@mentor.com>
-Date: Tue, 9 Sep 2014 10:24:58 -0400
-Subject: [PATCH] Upstream-Status: Inappropriate [OE specific]
-
-Signed-off-by: Christopher Larson <chris_larson@mentor.com>
-Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
-
----
-Upstream-Status: Pending
-
- Makefile | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/Makefile b/Makefile
-index 73ea23e..ed3eeb9 100644
---- a/Makefile
-+++ b/Makefile
-@@ -60,8 +60,8 @@ idn2_cflags =   `echo $(COPTS) | $(top)/bld/pkg-wrapper HAVE_LIBIDN2 $(PKG_CONFI
- idn2_libs =     `echo $(COPTS) | $(top)/bld/pkg-wrapper HAVE_LIBIDN2 $(PKG_CONFIG) --libs libidn2`
- ct_cflags =     `echo $(COPTS) | $(top)/bld/pkg-wrapper HAVE_CONNTRACK $(PKG_CONFIG) --cflags libnetfilter_conntrack`
- ct_libs =       `echo $(COPTS) | $(top)/bld/pkg-wrapper HAVE_CONNTRACK $(PKG_CONFIG) --libs libnetfilter_conntrack`
--lua_cflags =    `echo $(COPTS) | $(top)/bld/pkg-wrapper HAVE_LUASCRIPT $(PKG_CONFIG) --cflags lua5.2` 
--lua_libs =      `echo $(COPTS) | $(top)/bld/pkg-wrapper HAVE_LUASCRIPT $(PKG_CONFIG) --libs lua5.2` 
-+lua_cflags =    `echo $(COPTS) | $(top)/bld/pkg-wrapper HAVE_LUASCRIPT $(PKG_CONFIG) --cflags lua`
-+lua_libs =      `echo $(COPTS) | $(top)/bld/pkg-wrapper HAVE_LUASCRIPT $(PKG_CONFIG) --libs lua`
- nettle_cflags = `echo $(COPTS) | $(top)/bld/pkg-wrapper HAVE_DNSSEC     $(PKG_CONFIG) --cflags 'nettle hogweed' \
-                                                         HAVE_CRYPTOHASH $(PKG_CONFIG) --cflags nettle \
-                                                         HAVE_NETTLEHASH $(PKG_CONFIG) --cflags nettle`
-
--- 
-2.9.5
-
diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.89.bb b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.90.bb
similarity index 97%
rename from meta-networking/recipes-support/dnsmasq/dnsmasq_2.89.bb
rename to meta-networking/recipes-support/dnsmasq/dnsmasq_2.90.bb
index 684eb4432..38fa271dc 100644
--- a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.89.bb
+++ b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.90.bb
@@ -11,15 +11,13 @@ DEPENDS += "gettext-native"
 
 #at least versions 2.69 and prior are moved to the archive folder on the server
 SRC_URI = "http://www.thekelleys.org.uk/dnsmasq/${@['archive/', ''][float(d.getVar('PV').split('.')[1]) > 69]}dnsmasq-${PV}.tar.gz \
-           file://lua.patch \
            file://init \
            file://dnsmasq.conf \
            file://dnsmasq-resolvconf.service \
            file://dnsmasq-noresolvconf.service \
            file://dnsmasq-resolved.conf \
-           file://CVE-2023-28450.patch \
 "
-SRC_URI[sha256sum] = "8651373d000cae23776256e83dcaa6723dee72c06a39362700344e0c12c4e7e4"
+SRC_URI[sha256sum] = "8f6666b542403b5ee7ccce66ea73a4a51cf19dd49392aaccd37231a2c51b303b"
 
 inherit pkgconfig update-rc.d systemd
 
diff --git a/meta-networking/recipes-support/dnsmasq/files/CVE-2023-28450.patch b/meta-networking/recipes-support/dnsmasq/files/CVE-2023-28450.patch
deleted file mode 100644
index 129c9043e..000000000
--- a/meta-networking/recipes-support/dnsmasq/files/CVE-2023-28450.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From eb92fb32b746f2104b0f370b5b295bb8dd4bd5e5 Mon Sep 17 00:00:00 2001
-From: Simon Kelley <simon@thekelleys.org.uk>
-Date: Tue, 7 Mar 2023 22:07:46 +0000
-Subject: [PATCH] Set the default maximum DNS UDP packet size to 1232.
-
-http://www.dnsflagday.net/2020/ refers.
-
-Thanks to Xiang Li for the prompt.
-
-CVE: CVE-2023-28450
-Upstream-Status: Backport [https://thekelleys.org.uk/gitweb/?p=dnsmasq.git;a=commit;h=eb92fb32b746f2104b0f370b5b295bb8dd4bd5e5]
-
-Signed-off-by: Peter Marko <peter.marko@siemens.com>
----
- man/dnsmasq.8 | 3 ++-
- src/config.h  | 2 +-
- 2 files changed, 3 insertions(+), 2 deletions(-)
-
-diff --git a/man/dnsmasq.8 b/man/dnsmasq.8
-index 41e2e04..5acb935 100644
---- a/man/dnsmasq.8
-+++ b/man/dnsmasq.8
-@@ -183,7 +183,8 @@ to zero completely disables DNS function, leaving only DHCP and/or TFTP.
- .TP
- .B \-P, --edns-packet-max=<size>
- Specify the largest EDNS.0 UDP packet which is supported by the DNS
--forwarder. Defaults to 4096, which is the RFC5625-recommended size.
-+forwarder. Defaults to 1232, which is the recommended size following the
-+DNS flag day in 2020. Only increase if you know what you are doing.
- .TP
- .B \-Q, --query-port=<query_port>
- Send outbound DNS queries from, and listen for their replies on, the
-diff --git a/src/config.h b/src/config.h
-index 1e7b30f..37b374e 100644
---- a/src/config.h
-+++ b/src/config.h
-@@ -19,7 +19,7 @@
- #define CHILD_LIFETIME 150 /* secs 'till terminated (RFC1035 suggests > 120s) */
- #define TCP_MAX_QUERIES 100 /* Maximum number of queries per incoming TCP connection */
- #define TCP_BACKLOG 32  /* kernel backlog limit for TCP connections */
--#define EDNS_PKTSZ 4096 /* default max EDNS.0 UDP packet from RFC5625 */
-+#define EDNS_PKTSZ 1232 /* default max EDNS.0 UDP packet from from  /dnsflagday.net/2020 */
- #define SAFE_PKTSZ 1232 /* "go anywhere" UDP packet size, see https://dnsflagday.net/2020/ */
- #define KEYBLOCK_LEN 40 /* choose to minimise fragmentation when storing DNSSEC keys */
- #define DNSSEC_WORK 50 /* Max number of queries to validate one question */
--- 
-2.20.1
-
-- 
2.30.2


