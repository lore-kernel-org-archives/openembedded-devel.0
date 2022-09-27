Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFD6CC07E9D
	for <webhook@archiver.kernel.org>; Tue, 27 Sep 2022 08:22:02 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web10.8551.1664266912496566200
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Sep 2022 01:21:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=eyhhtw3A;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1664266910; i=@fujitsu.com;
	bh=7CGmvRgOzXCTWbuBIcKIrEmdNLdl4yM9mw9VSo51P4A=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=eyhhtw3AppNpLnoGAT7Zhf1yrLwa30kjSsneqFakD+lyINlUIiLBnI+LJw0Gutp9a
	 /Rbb/yU6WwzFEW6AHp4J1nX42wHGEo5wSjESjKvSNBYvhUBfP5x7UaxU/fj8S4yzWV
	 FBjhXyBZ8+dPenhk0roNemYdvUfAxXBfNGFsuBvE6roTKK4G/dEq8JHB2v/TeqyFSm
	 Gvkjh7hqmn29jA5+WcWeySyLl2omi+cBhcM8Bw6Bj24nxoJ5lRhOYffK44g4Mn1Y9l
	 QNEUYSN2158q5nY+Ail3W2BfVigXyBAZ9T3C+jMO8xdv3huesw3QdyqDdk0ofkjh0g
	 dBkVBM4zi+A5A==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrFIsWRWlGSWpSXmKPExsViZ8MxSXfuJqN
  kgxUrlCwuHl7K7MDocW7jCsYAxijWzLyk/IoE1owdbyYwF7wIqHj57SBrA+NMly5GLg4hgSeM
  Eh82zGCHcK4zSXx4NIsNwtnDKNH7eidzFyMnB5uAmsT0WzdYQWwRAX2JpbP3gMWZBVQkXvzuY
  QexhQVcJXovPmfsYuTgYBFQlbh4WAgkzCvgKLHk20YWEFtCQEFiysP3YK2cAk4Sk27fAmsVAq
  rZu2oaM0S9oMTJmU9YIMZLSBx88YIZoldRYvblZqg5FRKN0w8xQdhqElfPbWKewCg4C0n7LCT
  tCxiZVjHaJBVlpmeU5CZm5ugaGhjoGhqa6lpaAilLvcQq3US91FLdvPyikgxdQ73E8mK91OJi
  veLK3OScFL281JJNjMBATilOLt/BuH3fL71DjJIcTEqivPaLjJKF+JLyUyozEosz4otKc1KLD
  zHKcHAoSfAyrQfKCRalpqdWpGXmAKMKJi3BwaMkwrtuCVCat7ggMbc4Mx0idYrRnmPq7H/7mT
  mWg8mZX9sOMHNs2td1gFmIJS8/L1VKnHfmRqA2AZC2jNI8uKGwJHCJUVZKmJeRgYFBiKcgtSg
  3swRV/hWjOAejkjDv0rVAU3gy80rgdr8COosJ6Cw7Pn2Qs0oSEVJSDUzTI7pzQx4sOze3U3eH
  g9W57NV/Vy/iSpw289XdtSkPO04pTmQ+Vpm4Q1vz6qot840ELltmWe1mtA0RmyDy5xCnq6uU/
  UanHzen3rj3ecPVrFfOTfNklv80frbu/dWGtxozF+96qpSV8Hrj1JrTPqEzruZHzd35K3/T97
  ne15eZOr5Y+P9/1Iw9p2Mebvs5z+J/8+rT69sr8k5Hz3trNkfx2cEFDXZzuM55nPm9/fuez9G
  81jWnWZ6fv5J7fZLOr7vfdv522M3X5DL31g4J/X8+LmnXrd6vWXal3bvphpxE8uI1XrkC8kEL
  j7bqn4uc3Do15NqDac8OvjkdtlXVeJ2G7QJD6xttM5bsmRwbc6rtxuJCJZbijERDLeai4kQAz
  WARyX0DAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-8.tower-745.messagelabs.com!1664266909!964!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 28974 invoked from network); 27 Sep 2022 08:21:49 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-8.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 27 Sep 2022 08:21:49 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id E490A1000C2
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Sep 2022 09:21:48 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121
 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id D72181000C1
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Sep 2022 09:21:48 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 27 Sep 2022 09:21:47 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] dnsmasq: upgrade 2.86 -> 2.87
Date: Tue, 27 Sep 2022 16:21:20 +0800
Message-ID: <1664266883-2234-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1664266883-2234-1-git-send-email-wangmy@fujitsu.com>
References: <1664266883-2234-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Sep 2022 08:22:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98965

License-Update : format of License file changed.

CVE-2022-0934.patch
deleted since it's included in 2.87.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-support/dnsmasq/dnsmasq.inc       |   5 +-
 .../dnsmasq/dnsmasq/CVE-2022-0934.patch       | 191 ------------------
 .../recipes-support/dnsmasq/dnsmasq_2.86.bb   |   8 -
 .../recipes-support/dnsmasq/dnsmasq_2.87.bb   |   7 +
 4 files changed, 10 insertions(+), 201 deletions(-)
 delete mode 100644 meta-networking/recipes-support/dnsmasq/dnsmasq/CVE-2022-0934.patch
 delete mode 100644 meta-networking/recipes-support/dnsmasq/dnsmasq_2.86.bb
 create mode 100644 meta-networking/recipes-support/dnsmasq/dnsmasq_2.87.bb

diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq.inc b/meta-networking/recipes-support/dnsmasq/dnsmasq.inc
index 136c65d8fd..a8ff21a125 100644
--- a/meta-networking/recipes-support/dnsmasq/dnsmasq.inc
+++ b/meta-networking/recipes-support/dnsmasq/dnsmasq.inc
@@ -3,8 +3,9 @@ HOMEPAGE = "http://www.thekelleys.org.uk/dnsmasq/doc.html"
 SECTION = "net"
 # GPLv3 was added in version 2.41 as license option
 LICENSE = "GPL-2.0-only | GPL-3.0-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
-                    file://COPYING-v3;md5=d32239bcb673463ab874e80d47fae504"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
+                    file://COPYING-v3;md5=d32239bcb673463ab874e80d47fae504 \
+                    "
 
 #at least versions 2.69 and prior are moved to the archive folder on the server
 SRC_URI = "http://www.thekelleys.org.uk/dnsmasq/${@['archive/', ''][float(d.getVar('PV').split('.')[1]) > 69]}dnsmasq-${PV}.tar.gz;name=dnsmasq-${PV} \
diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq/CVE-2022-0934.patch b/meta-networking/recipes-support/dnsmasq/dnsmasq/CVE-2022-0934.patch
deleted file mode 100644
index 6bd734d756..0000000000
--- a/meta-networking/recipes-support/dnsmasq/dnsmasq/CVE-2022-0934.patch
+++ /dev/null
@@ -1,191 +0,0 @@
-From 3cdecc159e0f417a2f8d43d99632af26beea630f Mon Sep 17 00:00:00 2001
-From: Simon Kelley <simon@thekelleys.org.uk>
-Date: Thu, 31 Mar 2022 21:35:20 +0100
-Subject: [PATCH] Fix write-after-free error in DHCPv6 code. CVE-2022-0934
- refers.
-
-CVE: CVE-2022-0934
-
-Upstream-Status: Backport
-[https://thekelleys.org.uk/gitweb/?p=dnsmasq.git;a=commitdiff;h=03345ecefe]
-
-Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
----
- CHANGELOG     |  3 +++
- src/rfc3315.c | 48 +++++++++++++++++++++++++++---------------------
- 2 files changed, 30 insertions(+), 21 deletions(-)
-
-diff --git a/CHANGELOG b/CHANGELOG
-index 5e54df9..a28da2a 100644
---- a/CHANGELOG
-+++ b/CHANGELOG
-@@ -1,4 +1,7 @@
- version 2.86
-+	Fix write-after-free error in DHCPv6 server code.
-+	CVE-2022-0934 refers.
-+
- 	Handle DHCPREBIND requests in the DHCPv6 server code.
- 	Thanks to Aichun Li for spotting this omission, and the initial
- 	patch.
-diff --git a/src/rfc3315.c b/src/rfc3315.c
-index 5c2ff97..6ecfeeb 100644
---- a/src/rfc3315.c
-+++ b/src/rfc3315.c
-@@ -33,9 +33,9 @@ struct state {
-   unsigned int mac_len, mac_type;
- };
- 
--static int dhcp6_maybe_relay(struct state *state, void *inbuff, size_t sz, 
-+static int dhcp6_maybe_relay(struct state *state, unsigned char *inbuff, size_t sz, 
- 			     struct in6_addr *client_addr, int is_unicast, time_t now);
--static int dhcp6_no_relay(struct state *state, int msg_type, void *inbuff, size_t sz, int is_unicast, time_t now);
-+static int dhcp6_no_relay(struct state *state, int msg_type, unsigned char *inbuff, size_t sz, int is_unicast, time_t now);
- static void log6_opts(int nest, unsigned int xid, void *start_opts, void *end_opts);
- static void log6_packet(struct state *state, char *type, struct in6_addr *addr, char *string);
- static void log6_quiet(struct state *state, char *type, struct in6_addr *addr, char *string);
-@@ -104,12 +104,12 @@ unsigned short dhcp6_reply(struct dhcp_context *context, int interface, char *if
- }
- 
- /* This cost me blood to write, it will probably cost you blood to understand - srk. */
--static int dhcp6_maybe_relay(struct state *state, void *inbuff, size_t sz, 
-+static int dhcp6_maybe_relay(struct state *state, unsigned char *inbuff, size_t sz, 
- 			     struct in6_addr *client_addr, int is_unicast, time_t now)
- {
-   void *end = inbuff + sz;
-   void *opts = inbuff + 34;
--  int msg_type = *((unsigned char *)inbuff);
-+  int msg_type = *inbuff;
-   unsigned char *outmsgtypep;
-   void *opt;
-   struct dhcp_vendor *vendor;
-@@ -259,15 +259,15 @@ static int dhcp6_maybe_relay(struct state *state, void *inbuff, size_t sz,
-   return 1;
- }
- 
--static int dhcp6_no_relay(struct state *state, int msg_type, void *inbuff, size_t sz, int is_unicast, time_t now)
-+static int dhcp6_no_relay(struct state *state, int msg_type, unsigned char *inbuff, size_t sz, int is_unicast, time_t now)
- {
-   void *opt;
--  int i, o, o1, start_opts;
-+  int i, o, o1, start_opts, start_msg;
-   struct dhcp_opt *opt_cfg;
-   struct dhcp_netid *tagif;
-   struct dhcp_config *config = NULL;
-   struct dhcp_netid known_id, iface_id, v6_id;
--  unsigned char *outmsgtypep;
-+  unsigned char outmsgtype;
-   struct dhcp_vendor *vendor;
-   struct dhcp_context *context_tmp;
-   struct dhcp_mac *mac_opt;
-@@ -296,12 +296,13 @@ static int dhcp6_no_relay(struct state *state, int msg_type, void *inbuff, size_
-   v6_id.next = state->tags;
-   state->tags = &v6_id;
- 
--  /* copy over transaction-id, and save pointer to message type */
--  if (!(outmsgtypep = put_opt6(inbuff, 4)))
-+  start_msg = save_counter(-1);
-+  /* copy over transaction-id */
-+  if (!put_opt6(inbuff, 4))
-     return 0;
-   start_opts = save_counter(-1);
--  state->xid = outmsgtypep[3] | outmsgtypep[2] << 8 | outmsgtypep[1] << 16;
--   
-+  state->xid = inbuff[3] | inbuff[2] << 8 | inbuff[1] << 16;
-+    
-   /* We're going to be linking tags from all context we use. 
-      mark them as unused so we don't link one twice and break the list */
-   for (context_tmp = state->context; context_tmp; context_tmp = context_tmp->current)
-@@ -347,7 +348,7 @@ static int dhcp6_no_relay(struct state *state, int msg_type, void *inbuff, size_
-       (msg_type == DHCP6REQUEST || msg_type == DHCP6RENEW || msg_type == DHCP6RELEASE || msg_type == DHCP6DECLINE))
-     
-     {  
--      *outmsgtypep = DHCP6REPLY;
-+      outmsgtype = DHCP6REPLY;
-       o1 = new_opt6(OPTION6_STATUS_CODE);
-       put_opt6_short(DHCP6USEMULTI);
-       put_opt6_string("Use multicast");
-@@ -619,11 +620,11 @@ static int dhcp6_no_relay(struct state *state, int msg_type, void *inbuff, size_
- 	struct dhcp_netid *solicit_tags;
- 	struct dhcp_context *c;
- 	
--	*outmsgtypep = DHCP6ADVERTISE;
-+	outmsgtype = DHCP6ADVERTISE;
- 	
- 	if (opt6_find(state->packet_options, state->end, OPTION6_RAPID_COMMIT, 0))
- 	  {
--	    *outmsgtypep = DHCP6REPLY;
-+	    outmsgtype = DHCP6REPLY;
- 	    state->lease_allocate = 1;
- 	    o = new_opt6(OPTION6_RAPID_COMMIT);
- 	    end_opt6(o);
-@@ -809,7 +810,7 @@ static int dhcp6_no_relay(struct state *state, int msg_type, void *inbuff, size_
- 	int start = save_counter(-1);
- 
- 	/* set reply message type */
--	*outmsgtypep = DHCP6REPLY;
-+	outmsgtype = DHCP6REPLY;
- 	state->lease_allocate = 1;
- 
- 	log6_quiet(state, "DHCPREQUEST", NULL, ignore ? _("ignored") : NULL);
-@@ -924,7 +925,7 @@ static int dhcp6_no_relay(struct state *state, int msg_type, void *inbuff, size_
- 	int address_assigned = 0;
- 
- 	/* set reply message type */
--	*outmsgtypep = DHCP6REPLY;
-+	outmsgtype = DHCP6REPLY;
- 	
- 	log6_quiet(state, msg_type == DHCP6RENEW ? "DHCPRENEW" : "DHCPREBIND", NULL, NULL);
- 
-@@ -1057,7 +1058,7 @@ static int dhcp6_no_relay(struct state *state, int msg_type, void *inbuff, size_
- 	int good_addr = 0;
- 
- 	/* set reply message type */
--	*outmsgtypep = DHCP6REPLY;
-+	outmsgtype = DHCP6REPLY;
- 	
- 	log6_quiet(state, "DHCPCONFIRM", NULL, NULL);
- 	
-@@ -1121,7 +1122,7 @@ static int dhcp6_no_relay(struct state *state, int msg_type, void *inbuff, size_
- 	log6_quiet(state, "DHCPINFORMATION-REQUEST", NULL, ignore ? _("ignored") : state->hostname);
- 	if (ignore)
- 	  return 0;
--	*outmsgtypep = DHCP6REPLY;
-+	outmsgtype = DHCP6REPLY;
- 	tagif = add_options(state, 1);
- 	break;
-       }
-@@ -1130,7 +1131,7 @@ static int dhcp6_no_relay(struct state *state, int msg_type, void *inbuff, size_
-     case DHCP6RELEASE:
-       {
- 	/* set reply message type */
--	*outmsgtypep = DHCP6REPLY;
-+	outmsgtype = DHCP6REPLY;
- 
- 	log6_quiet(state, "DHCPRELEASE", NULL, NULL);
- 
-@@ -1195,7 +1196,7 @@ static int dhcp6_no_relay(struct state *state, int msg_type, void *inbuff, size_
-     case DHCP6DECLINE:
-       {
- 	/* set reply message type */
--	*outmsgtypep = DHCP6REPLY;
-+	outmsgtype = DHCP6REPLY;
- 	
- 	log6_quiet(state, "DHCPDECLINE", NULL, NULL);
- 
-@@ -1275,7 +1276,12 @@ static int dhcp6_no_relay(struct state *state, int msg_type, void *inbuff, size_
-       }
- 
-     }
--  
-+
-+  /* Fill in the message type. Note that we store the offset,
-+     not a direct pointer, since the packet memory may have been 
-+     reallocated. */
-+  ((unsigned char *)(daemon->outpacket.iov_base))[start_msg] = outmsgtype;
-+
-   log_tags(tagif, state->xid);
-   log6_opts(0, state->xid, daemon->outpacket.iov_base + start_opts, daemon->outpacket.iov_base + save_counter(-1));
-   
--- 
-2.25.1
-
diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.86.bb b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.86.bb
deleted file mode 100644
index 0f7880ce8c..0000000000
--- a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.86.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require dnsmasq.inc
-
-SRC_URI[dnsmasq-2.86.sha256sum] = "ef15f608a83ee2b1d1d2c1f11d089a7e0ac401ffb0991de73fc01ce5f290e512"
-SRC_URI += "\
-    file://lua.patch \
-    file://CVE-2022-0934.patch \
-"
-
diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.87.bb b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.87.bb
new file mode 100644
index 0000000000..793b61d712
--- /dev/null
+++ b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.87.bb
@@ -0,0 +1,7 @@
+require dnsmasq.inc
+
+SRC_URI[dnsmasq-2.87.sha256sum] = "ae39bffde9c37e4d64849b528afeb060be6bad6d1044a3bd94a49fce41357284"
+SRC_URI += "\
+    file://lua.patch \
+"
+
-- 
2.25.1


