Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78EECC433F5
	for <webhook@archiver.kernel.org>; Tue, 22 Feb 2022 23:45:23 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web12.1010.1645573522412164360
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Feb 2022 15:45:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=BQY3thMM;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1645573520; i=@fujitsu.com;
	bh=jxZO0Q5kzaXuVfrNtaCIj0llxyqwd8wkHFcTJFEAhK0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=BQY3thMM6hnm6ooALYnBSkLVoJ/TqpttOvfzWGVwaAgixm/IitOV6VDB7HN1H6oHn
	 3EMCm5NtSW1US3F2HfisFYzndZaC1eqhpCDgUviDy8HZehNeJQN2tUahxZMN0RVqdj
	 AdhD5rv0f1wrLNIXlpEXq1dTiyZHKavSdYcyljjhzuqrwP1dnbc9RYMWf/+Lb8KA7v
	 d3JPqYBBcv3BmaIwn0U4jjdk5KGH0JYkbDLJodtrRDlK/9A28szL41HRftYcpkxKPF
	 ZsqT8cxcwhiP0yT2WBQkGgR2CNDCxLQmZpuucUt1sV6B++NyIaU/LMoyBWkRR8+qBQ
	 Pl2IDrdfaDkFw==
Received: from [100.115.69.48] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-a.eu-central-1.aws.ess.symcld.net id
 16/40-25243-09575126; Tue, 22 Feb 2022 23:45:20 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrPIsWRWlGSWpSXmKPExsViZ8MxSXdCqWi
  Swcs93BYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bNd99ZC06ZVbz8fpilgXGzQRcjF4eQwBNG
  iV8/bzFDOBeYJL7++MEG4ZxglNg8/xFLFyMnB5uAmsT0WzdYQWwRAX2JpbP3MIPYzAIqEi9+9
  7CD2MIC7hLvj90Hq2ERUJXonbcSrIZXwEni+q+5bCC2hICCxJSH78HinALOElf+TAOzhYBqZj
  beYYGoF5Q4OfMJC8R8CYmDL14wQ/QqSsy+3MwCYVdIzJrVxgRhq0lcPbeJeQKj4Cwk7bOQtC9
  gZFrFaJdUlJmeUZKbmJmja2hgoGtoaKprZqJrZGKql1ilm6iXWqqbnJpXUpQIlNZLLC/WSy0u
  1iuuzE3OSdHLSy3ZxAgM55Rih687GI/3/dQ7xCjJwaQkyjvXXzRJiC8pP6UyI7E4I76oNCe1+
  BCjDAeHkgSvSiFQTrAoNT21Ii0zBxhbMGkJDh4lEV6VYqA0b3FBYm5xZjpE6hSjopQ4r2EJUE
  IAJJFRmgfXBovnS4yyUsK8jAwMDEI8BalFuZklqPKvGMU5GJWEeeeDTOHJzCuBm/4KaDET0OI
  pWUIgi0sSEVJSDUzzvOa0736rmvrMi7+uMF9B1jVbi/F4jNi9FXHr22eXRlxd8do3VDuNZ9Jx
  +cz8t7qrd3rPN2GOCNUNvFDy40HfKtla9xstqas79r90T5o8S2n+Z79a41gJtcsfF3QInJ5VP
  pHjhPoleW+Hf6W2AQ9v3jhssvzw/rIXz68uYa5UWBWkkWp/8f0Kv+Wngs2cbWt/1v6+O+vABP
  7NKnH3/7j2CB7WmyitcWhygrvOQ8bTsfqcqu1lemcWvND1vCj+bq9F6JO+S+e2OV4RfyL2ZNX
  tdSeMMzSStu1QbunSXPK9i0+1OllWWE53/tXkA/x7Nnad33nc9O6+2mcTHZ/+9b8YYsPe8yaL
  2WvToaOzra8osRRnJBpqMRcVJwIAbbEo/2IDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-11.tower-545.messagelabs.com!1645573519!42729!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 7974 invoked from network); 22 Feb 2022 23:45:20 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-11.tower-545.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 22 Feb 2022 23:45:20 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id A9078100455
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Feb 2022 23:45:19 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 976DF10033B
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Feb 2022 23:45:19 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Tue, 22 Feb 2022 23:45:00 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] netplan: upgrade 0.103 -> 0.104
Date: Wed, 23 Feb 2022 07:44:46 +0800
Message-ID: <1645573488-27207-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1645573488-27207-1-git-send-email-wangmy@fujitsu.com>
References: <1645573488-27207-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Feb 2022 23:45:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95452

refresh patches for 0.104:
0001-Makefile-do-not-use-Werror.patch
0001-don-t-fail-if-GLOB_BRACE-is-not-defined.patch

0001-parse-nm-fix-32bit-format-string.patch
removed since it's included in 0.104

Changelog:
=========
Enable embedded-switch-mode setting on SmartNICs (#253)
Permit multiple patterns for the driver globs in match (#202), LP#1918421
Improve routing capabilities (#248), LP#1892272, LP#1805038
Support additional link offload options for networkd (#225) (#242), LP#1771740
Consolidate enum-to-string arrays (#230)
Handle differing ip6-privacy default value for NetworkManager (#263)
YAML state tracking (--state rootdir) for DBus API and netplan try (#231), LP#1943120
Support ConfigureWithoutCarrier (ignore-carrier) for networkd (#215)
Move primary git branch master to main
Documentation improvements (#226)
Compatibility for glib-2.70 (#235)
Cleanup Makefile, install only public headers
Improve test reliability & enable integration testing CI for autopkgtests
Netplan get to use the libnetplan parser (#252)
libnetplan:
- introduce the notion of NetplanState (#232)
- use an explicit parser context (#233)
- expose coherent generator APIs (#239)
- improve overall error handling (#234)
- consolidation of YAML parsing into the library (#241, #249, #250, #251)
Restrict the symbol export to a determined public API (#227)
- WARNING: We dropped some internal symbols from the API that we know
  have no external consumers (that we are aware of)
- 0.103: _serialize_yaml, contains_netdef_type, tmp, validate_default_route_consistency
- 0.102: cur_filename, netplan_netdef_new
- 0.100: address_option_handlers, is_hostname, validate_ovs_target, wireguard_peer_handlers
- 0.99: current_file, is_ip4_address, is_ip6_address, missing_id,
  missing_ids_found, parser_error, validate_backend_rules, validate_netdef_grammar,
  yaml_error

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../0001-Makefile-do-not-use-Werror.patch     | 11 +++++---
 ...-t-fail-if-GLOB_BRACE-is-not-defined.patch | 16 ++++++------
 ...001-parse-nm-fix-32bit-format-string.patch | 25 -------------------
 .../{netplan_0.103.bb => netplan_0.104.bb}    |  5 ++--
 4 files changed, 18 insertions(+), 39 deletions(-)
 delete mode 100644 meta-networking/recipes-connectivity/netplan/netplan/0001-parse-nm-fix-32bit-format-string.patch
 rename meta-networking/recipes-connectivity/netplan/{netplan_0.103.bb => netplan_0.104.bb} (95%)

diff --git a/meta-networking/recipes-connectivity/netplan/netplan/0001-Makefile-do-not-use-Werror.patch b/meta-networking/recipes-connectivity/netplan/netplan/0001-Makefile-do-not-use-Werror.patch
index ddc44c3ca0..613858f6fd 100644
--- a/meta-networking/recipes-connectivity/netplan/netplan/0001-Makefile-do-not-use-Werror.patch
+++ b/meta-networking/recipes-connectivity/netplan/netplan/0001-Makefile-do-not-use-Werror.patch
@@ -10,14 +10,17 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  1 file changed, 1 deletion(-)
 
 diff --git a/Makefile b/Makefile
-index 8645aee..50fc0da 100644
+index 0368e41..53d6a9d 100644
 --- a/Makefile
 +++ b/Makefile
-@@ -7,7 +7,6 @@ BUILDFLAGS = \
- 	-D_XOPEN_SOURCE=500 \
+@@ -8,7 +8,6 @@ BUILDFLAGS = \
  	-DSBINDIR=\"$(SBINDIR)\" \
+ 	-I${CURDIR}/include \
  	-Wall \
 -	-Werror \
  	$(NULL)
  
- SYSTEMD_GENERATOR_DIR=$(shell pkg-config --variable=systemdsystemgeneratordir systemd)
+ SRCS = \
+-- 
+2.25.1
+
diff --git a/meta-networking/recipes-connectivity/netplan/netplan/0001-don-t-fail-if-GLOB_BRACE-is-not-defined.patch b/meta-networking/recipes-connectivity/netplan/netplan/0001-don-t-fail-if-GLOB_BRACE-is-not-defined.patch
index c7d371dfa0..8779c251a5 100644
--- a/meta-networking/recipes-connectivity/netplan/netplan/0001-don-t-fail-if-GLOB_BRACE-is-not-defined.patch
+++ b/meta-networking/recipes-connectivity/netplan/netplan/0001-don-t-fail-if-GLOB_BRACE-is-not-defined.patch
@@ -4,18 +4,17 @@ Date: Fri, 25 Dec 2020 11:41:43 +0900
 Subject: [PATCH] don't fail if GLOB_BRACE is not defined
 
 Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
-
 ---
  src/util.c | 6 ++++++
  1 file changed, 6 insertions(+)
 
 diff --git a/src/util.c b/src/util.c
-index a4c0dba..fd4542d 100644
+index 841ec12..59595da 100644
 --- a/src/util.c
 +++ b/src/util.c
-@@ -25,6 +25,12 @@
- #include "util.h"
- #include "netplan.h"
+@@ -32,6 +32,12 @@
+ #include "names.h"
+ #include "yaml-helpers.h"
  
 +/* Don't fail if the standard library
 + * doesn't provide brace expansion */
@@ -23,6 +22,9 @@ index a4c0dba..fd4542d 100644
 +#define GLOB_BRACE 0
 +#endif
 +
- GHashTable* wifi_frequency_24;
- GHashTable* wifi_frequency_5;
+ NETPLAN_ABI GHashTable*
+ wifi_frequency_24;
  
+-- 
+2.25.1
+
diff --git a/meta-networking/recipes-connectivity/netplan/netplan/0001-parse-nm-fix-32bit-format-string.patch b/meta-networking/recipes-connectivity/netplan/netplan/0001-parse-nm-fix-32bit-format-string.patch
deleted file mode 100644
index 72f04a15ad..0000000000
--- a/meta-networking/recipes-connectivity/netplan/netplan/0001-parse-nm-fix-32bit-format-string.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From 2f0ff65eaa93f18d9edb5d03329b00d8e5e73869 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Lukas=20M=C3=A4rdian?= <lukas.maerdian@canonical.com>
-Date: Wed, 4 Aug 2021 15:55:00 +0200
-Subject: [PATCH] parse-nm: fix 32bit format string
-
----
- src/parse-nm.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/parse-nm.c b/src/parse-nm.c
-index 9b09e34..bf998b7 100644
---- a/src/parse-nm.c
-+++ b/src/parse-nm.c
-@@ -136,7 +136,7 @@ static void
- handle_bridge_uint(GKeyFile* kf, const gchar* key, NetplanNetDefinition* nd, char** dataptr) {
-     if (g_key_file_get_uint64(kf, "bridge", key, NULL)) {
-         nd->custom_bridging = TRUE;
--        *dataptr = g_strdup_printf("%lu", g_key_file_get_uint64(kf, "bridge", key, NULL));
-+        *dataptr = g_strdup_printf("%"G_GUINT64_FORMAT, g_key_file_get_uint64(kf, "bridge", key, NULL));
-         _kf_clear_key(kf, "bridge", key);
-     }
- }
--- 
-2.25.1
-
diff --git a/meta-networking/recipes-connectivity/netplan/netplan_0.103.bb b/meta-networking/recipes-connectivity/netplan/netplan_0.104.bb
similarity index 95%
rename from meta-networking/recipes-connectivity/netplan/netplan_0.103.bb
rename to meta-networking/recipes-connectivity/netplan/netplan_0.104.bb
index 81e20b9c8e..6a32f55d47 100644
--- a/meta-networking/recipes-connectivity/netplan/netplan_0.103.bb
+++ b/meta-networking/recipes-connectivity/netplan/netplan_0.104.bb
@@ -11,11 +11,10 @@ LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 S = "${WORKDIR}/git"
-SRCREV = "51c872d856db80281ea810ebc02e05c09d5310fa"
-PV = "0.103"
+SRCREV = "3e522b7255310bdecca6c781137741dfc4abc021"
+PV = "0.104"
 
 SRC_URI = "git://github.com/CanonicalLtd/netplan.git;branch=main;protocol=https \
-           file://0001-parse-nm-fix-32bit-format-string.patch \
            file://0001-Makefile-do-not-use-Werror.patch \
            "
 
-- 
2.25.1


