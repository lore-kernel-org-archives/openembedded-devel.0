Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03339C6FD20
	for <webhook@archiver.kernel.org>; Fri, 24 Mar 2023 13:36:47 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.web10.101595.1679665006352812066
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 24 Mar 2023 06:36:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=TpjwptbH;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-20230324133644738735ab2efc615142-er10pn@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 20230324133644738735ab2efc615142
        for <openembedded-devel@lists.openembedded.org>;
        Fri, 24 Mar 2023 14:36:44 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=XgscYl6h+SekBrV0vFdiMSBOxYyg5zRLrXrQbqT6a/8=;
 b=TpjwptbHTt5cQ2r+Bf9lZbjdptBpJ5j0M4sd4KP3bBrB5nLMNhsNFaOEoqIfblhBWuDyAi
 oD44rtOl5hXtV5U1OWtJBiSn8Xz2OR/+xsIoxnOaw6HiKr5n1Wh8NiiMeMtVr7vxNkoTY0og
 jaZkGIiPNvZPb+bSWDpS8umuSN5pI=;
From: "P. Marko" <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][meta-networking][langdale][kirkstone][PATCH] dnsmasq: fix CVE-2023-28450
Date: Fri, 24 Mar 2023 14:35:42 +0100
Message-Id: <20230324133542.1482964-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 Mar 2023 13:36:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101707

From: Peter Marko <peter.marko@siemens.com>

The patch is modified by removing irrelevant and conflicting
CHANGELOG entry.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../recipes-support/dnsmasq/dnsmasq.inc       |  1 +
 .../dnsmasq/files/CVE-2023-28450.patch        | 48 +++++++++++++++++++
 2 files changed, 49 insertions(+)
 create mode 100644 meta-networking/recipes-support/dnsmasq/files/CVE-2023-28450.patch

diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq.inc b/meta-networking/recipes-support/dnsmasq/dnsmasq.inc
index a8ff21a12..9e0f529ec 100644
--- a/meta-networking/recipes-support/dnsmasq/dnsmasq.inc
+++ b/meta-networking/recipes-support/dnsmasq/dnsmasq.inc
@@ -14,6 +14,7 @@ SRC_URI = "http://www.thekelleys.org.uk/dnsmasq/${@['archive/', ''][float(d.getV
            file://dnsmasq-resolvconf.service \
            file://dnsmasq-noresolvconf.service \
            file://dnsmasq-resolved.conf \
+           file://CVE-2023-28450.patch \
 "
 
 inherit pkgconfig update-rc.d systemd
diff --git a/meta-networking/recipes-support/dnsmasq/files/CVE-2023-28450.patch b/meta-networking/recipes-support/dnsmasq/files/CVE-2023-28450.patch
new file mode 100644
index 000000000..129c9043e
--- /dev/null
+++ b/meta-networking/recipes-support/dnsmasq/files/CVE-2023-28450.patch
@@ -0,0 +1,48 @@
+From eb92fb32b746f2104b0f370b5b295bb8dd4bd5e5 Mon Sep 17 00:00:00 2001
+From: Simon Kelley <simon@thekelleys.org.uk>
+Date: Tue, 7 Mar 2023 22:07:46 +0000
+Subject: [PATCH] Set the default maximum DNS UDP packet size to 1232.
+
+http://www.dnsflagday.net/2020/ refers.
+
+Thanks to Xiang Li for the prompt.
+
+CVE: CVE-2023-28450
+Upstream-Status: Backport [https://thekelleys.org.uk/gitweb/?p=dnsmasq.git;a=commit;h=eb92fb32b746f2104b0f370b5b295bb8dd4bd5e5]
+
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ man/dnsmasq.8 | 3 ++-
+ src/config.h  | 2 +-
+ 2 files changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/man/dnsmasq.8 b/man/dnsmasq.8
+index 41e2e04..5acb935 100644
+--- a/man/dnsmasq.8
++++ b/man/dnsmasq.8
+@@ -183,7 +183,8 @@ to zero completely disables DNS function, leaving only DHCP and/or TFTP.
+ .TP
+ .B \-P, --edns-packet-max=<size>
+ Specify the largest EDNS.0 UDP packet which is supported by the DNS
+-forwarder. Defaults to 4096, which is the RFC5625-recommended size.
++forwarder. Defaults to 1232, which is the recommended size following the
++DNS flag day in 2020. Only increase if you know what you are doing.
+ .TP
+ .B \-Q, --query-port=<query_port>
+ Send outbound DNS queries from, and listen for their replies on, the
+diff --git a/src/config.h b/src/config.h
+index 1e7b30f..37b374e 100644
+--- a/src/config.h
++++ b/src/config.h
+@@ -19,7 +19,7 @@
+ #define CHILD_LIFETIME 150 /* secs 'till terminated (RFC1035 suggests > 120s) */
+ #define TCP_MAX_QUERIES 100 /* Maximum number of queries per incoming TCP connection */
+ #define TCP_BACKLOG 32  /* kernel backlog limit for TCP connections */
+-#define EDNS_PKTSZ 4096 /* default max EDNS.0 UDP packet from RFC5625 */
++#define EDNS_PKTSZ 1232 /* default max EDNS.0 UDP packet from from  /dnsflagday.net/2020 */
+ #define SAFE_PKTSZ 1232 /* "go anywhere" UDP packet size, see https://dnsflagday.net/2020/ */
+ #define KEYBLOCK_LEN 40 /* choose to minimise fragmentation when storing DNSSEC keys */
+ #define DNSSEC_WORK 50 /* Max number of queries to validate one question */
+-- 
+2.20.1
+
-- 
2.30.2


