Return-Path: <alex.kiernan@gmail.com>
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
	[209.85.208.50])
	by mail.openembedded.org (Postfix) with ESMTP id DCEF36C387
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 10 Nov 2018 18:48:35 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id b34-v6so4246338ede.13
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 10 Nov 2018 10:48:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=U8ffugiojku0M3vxVM7OQcM0MQqSFHPdyMarVz9KFAE=;
	b=InKuRuXTORsWAsMTNiq7qbpz+MI4s6akUd5X+6SMhVVaN+clZ2FUtCYxkpe9dZ5/y2
	gxd4WbobJOvl5s68ECIXkjtbPd6CPVtB+4nJoBuOT2RvENVmC3t8VVymd+bCl8odGwLk
	PbnDDvv4tldxTNkoy+OdKpwsLef4XY82wrHDATCXk9UsNsYZ5d5llOYrxZmoeyL0YL8J
	bnJYlk9lqieTQ+NygFMtZft0wVjVCfQONzYF5DtOuc5J//RrnPx4EbkRunYJDxY3RWgc
	5/w5Qy/hcRcC1nZPYFmJORuLSKFS2WJOb6DzR6oXHR0kTV8S2Ru3CVqJ+fAT7xyI4oDZ
	Fa7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=U8ffugiojku0M3vxVM7OQcM0MQqSFHPdyMarVz9KFAE=;
	b=UlhkqSZ/NQwgwQu2Aol+UG/4VtLBT6NgcH6/Oshr/HFwgDzBZnaDmAPqxr8DviW/73
	5lZ47073Q8lmCbRVixEzU24oPRF4Kl/wCsBcc5RBwoTYvJCNHWtwwAtrg3RgG/4DHsm9
	BRjPkoQKocSRab9/DJHLtDDcxcSg1eUibdfG236owh1kmueAORhlTVmvwMpyDkvu0kUf
	l3kulXsM0QQL7XJWOh2rhEz6oO3UDIrKDyZ/AHoT+G/dEWZ5DA51XhEcPqoLxeA/D7tM
	XJ75HEqyAdwLCgKw4RW+lspvJ755axOlk8g1kqZtXnxHo6TEuyb+AgwUUSESJ3GQFvDQ
	tNiA==
X-Gm-Message-State: AGRZ1gKxH7l8DsCEBYTAafjhFcnCfAJYkAJynVrNwlefYoXNtsMNaCpm
	GdNGtV1fY9RiUfXGA6vOWkw+dQyzhl8=
X-Google-Smtp-Source: AJdET5fOFpwHEWfFT0w2jNLvtwfp1gaCUjUpimZHD+Kp1xf1t4CQXKog82nP6LQrEciTW/KgGQTEyw==
X-Received: by 2002:a50:9f64:: with SMTP id b91mr6270478edf.235.1541875715667; 
	Sat, 10 Nov 2018 10:48:35 -0800 (PST)
Received: from localhost.localdomain
	(ec2-52-17-69-150.eu-west-1.compute.amazonaws.com. [52.17.69.150])
	by smtp.gmail.com with ESMTPSA id
	g13-v6sm3052827edv.48.2018.11.10.10.48.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 10 Nov 2018 10:48:35 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-devel@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>,
	Joe MacDonald <joe@deserted.net>
Date: Sat, 10 Nov 2018 18:48:01 +0000
Message-Id: <1541875681-24701-2-git-send-email-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1541875681-24701-1-git-send-email-alex.kiernan@gmail.com>
References: <1541875681-24701-1-git-send-email-alex.kiernan@gmail.com>
MIME-Version: 1.0
Subject: [meta-networking][PATCH 2/2] nftables: Upgrade to 0.9.0
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 10 Nov 2018 18:48:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Drop all the backports as they're upstream

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 ...licit-network-ctx-assignment-for-icmp-icm.patch | 323 ---------------------
 .../0002-proto-Add-some-exotic-ICMPv6-types.patch  | 147 ----------
 ...oad-split-ll-proto-dependency-into-helper.patch |  62 ----
 ...update-of-net-base-w.-meta-l4proto-icmpv6.patch |  65 -----
 ...itch-implicit-dependencies-to-meta-l4prot.patch |  98 -------
 ...orce-ip-ip6-protocol-depending-on-icmp-or.patch |  84 ------
 ...ch-implicit-dependencies-to-meta-l4proto-.patch |  86 ------
 .../nftables/files/fix-to-generate-ntf.8.patch     |  26 --
 .../recipes-filter/nftables/nftables_0.7.bb        |  27 --
 .../recipes-filter/nftables/nftables_0.9.0.bb      |  20 ++
 10 files changed, 20 insertions(+), 918 deletions(-)
 delete mode 100644 meta-networking/recipes-filter/nftables/files/0001-payload-explicit-network-ctx-assignment-for-icmp-icm.patch
 delete mode 100644 meta-networking/recipes-filter/nftables/files/0002-proto-Add-some-exotic-ICMPv6-types.patch
 delete mode 100644 meta-networking/recipes-filter/nftables/files/0003-payload-split-ll-proto-dependency-into-helper.patch
 delete mode 100644 meta-networking/recipes-filter/nftables/files/0004-src-allow-update-of-net-base-w.-meta-l4proto-icmpv6.patch
 delete mode 100644 meta-networking/recipes-filter/nftables/files/0005-src-ipv6-switch-implicit-dependencies-to-meta-l4prot.patch
 delete mode 100644 meta-networking/recipes-filter/nftables/files/0006-payload-enforce-ip-ip6-protocol-depending-on-icmp-or.patch
 delete mode 100644 meta-networking/recipes-filter/nftables/files/0007-src-ip-switch-implicit-dependencies-to-meta-l4proto-.patch
 delete mode 100644 meta-networking/recipes-filter/nftables/files/fix-to-generate-ntf.8.patch
 delete mode 100644 meta-networking/recipes-filter/nftables/nftables_0.7.bb
 create mode 100644 meta-networking/recipes-filter/nftables/nftables_0.9.0.bb

diff --git a/meta-networking/recipes-filter/nftables/files/0001-payload-explicit-network-ctx-assignment-for-icmp-icm.patch b/meta-networking/recipes-filter/nftables/files/0001-payload-explicit-network-ctx-assignment-for-icmp-icm.patch
deleted file mode 100644
index 86a3d53dfd12..000000000000
--- a/meta-networking/recipes-filter/nftables/files/0001-payload-explicit-network-ctx-assignment-for-icmp-icm.patch
+++ /dev/null
@@ -1,323 +0,0 @@
-From 0011985554e269e1cc8f8e5b41eb9dcd795ebe8c Mon Sep 17 00:00:00 2001
-From: Arturo Borrero Gonzalez <arturo@debian.org>
-Date: Wed, 25 Jan 2017 12:51:08 +0100
-Subject: [PATCH] payload: explicit network ctx assignment for icmp/icmp6 in
- special families
-
-In the inet, bridge and netdev families, we can add rules like these:
-
-% nft add rule inet t c ip protocol icmp icmp type echo-request
-% nft add rule inet t c ip6 nexthdr icmpv6 icmpv6 type echo-request
-
-However, when we print the ruleset:
-
-% nft list ruleset
-table inet t {
-	chain c {
-		icmpv6 type echo-request
-		icmp type echo-request
-	}
-}
-
-These rules we obtain can't be added again:
-
-% nft add rule inet t c icmp type echo-request
-<cmdline>:1:19-27: Error: conflicting protocols specified: inet-service vs. icmp
-add rule inet t c icmp type echo-request
-                  ^^^^^^^^^
-
-% nft add rule inet t c icmpv6 type echo-request
-<cmdline>:1:19-29: Error: conflicting protocols specified: inet-service vs. icmpv6
-add rule inet t c icmpv6 type echo-request
-                  ^^^^^^^^^^^
-
-Since I wouldn't expect an IP packet carrying ICMPv6, or IPv6 packet
-carrying ICMP, if the link layer is inet, the network layer protocol context
-can be safely update to 'ip' or 'ip6'.
-
-Moreover, nft currently generates a 'meta nfproto ipvX' depedency when
-using icmp or icmp6 in the inet family, and similar in netdev and bridge
-families.
-
-While at it, a bit of code factorization is introduced.
-
-Fixes: https://bugzilla.netfilter.org/show_bug.cgi?id=1073
-Signed-off-by: Arturo Borrero Gonzalez <arturo@debian.org>
-Signed-off-by: Pablo Neira Ayuso <pablo@netfilter.org>
----
-Upstream-Status: Backport
-Signed-off-by: André Draszik <adraszik@tycoint.com>
- src/payload.c                       | 70 ++++++++++++++++---------------------
- tests/py/any/icmpX.t.netdev         |  8 +++++
- tests/py/any/icmpX.t.netdev.payload | 36 +++++++++++++++++++
- tests/py/bridge/icmpX.t             |  8 +++++
- tests/py/bridge/icmpX.t.payload     | 36 +++++++++++++++++++
- tests/py/inet/icmpX.t               |  8 +++++
- tests/py/inet/icmpX.t.payload       | 36 +++++++++++++++++++
- 7 files changed, 162 insertions(+), 40 deletions(-)
- create mode 100644 tests/py/any/icmpX.t.netdev
- create mode 100644 tests/py/any/icmpX.t.netdev.payload
- create mode 100644 tests/py/bridge/icmpX.t
- create mode 100644 tests/py/bridge/icmpX.t.payload
- create mode 100644 tests/py/inet/icmpX.t
- create mode 100644 tests/py/inet/icmpX.t.payload
-
-diff --git a/src/payload.c b/src/payload.c
-index af533b2..74f8254 100644
---- a/src/payload.c
-+++ b/src/payload.c
-@@ -223,6 +223,34 @@ static int payload_add_dependency(struct eval_ctx *ctx,
- 	return 0;
- }
- 
-+static const struct proto_desc *
-+payload_gen_special_dependency(struct eval_ctx *ctx, const struct expr *expr)
-+{
-+	switch (expr->payload.base) {
-+	case PROTO_BASE_LL_HDR:
-+		switch (ctx->pctx.family) {
-+		case NFPROTO_INET:
-+			return &proto_inet;
-+		case NFPROTO_BRIDGE:
-+			return &proto_eth;
-+		case NFPROTO_NETDEV:
-+			return &proto_netdev;
-+		default:
-+			break;
-+		}
-+		break;
-+	case PROTO_BASE_TRANSPORT_HDR:
-+		if (expr->payload.desc == &proto_icmp)
-+			return &proto_ip;
-+		if (expr->payload.desc == &proto_icmp6)
-+			return &proto_ip6;
-+		return &proto_inet_service;
-+	default:
-+		break;
-+	}
-+	return NULL;
-+}
-+
- /**
-  * payload_gen_dependency - generate match expression on payload dependency
-  *
-@@ -276,46 +304,8 @@ int payload_gen_dependency(struct eval_ctx *ctx, const struct expr *expr,
- 
- 	desc = ctx->pctx.protocol[expr->payload.base - 1].desc;
- 	/* Special case for mixed IPv4/IPv6 and bridge tables */
--	if (desc == NULL) {
--		switch (ctx->pctx.family) {
--		case NFPROTO_INET:
--			switch (expr->payload.base) {
--			case PROTO_BASE_LL_HDR:
--				desc = &proto_inet;
--				break;
--			case PROTO_BASE_TRANSPORT_HDR:
--				desc = &proto_inet_service;
--				break;
--			default:
--				break;
--			}
--			break;
--		case NFPROTO_BRIDGE:
--			switch (expr->payload.base) {
--			case PROTO_BASE_LL_HDR:
--				desc = &proto_eth;
--				break;
--			case PROTO_BASE_TRANSPORT_HDR:
--				desc = &proto_inet_service;
--				break;
--			default:
--				break;
--			}
--			break;
--		case NFPROTO_NETDEV:
--			switch (expr->payload.base) {
--			case PROTO_BASE_LL_HDR:
--				desc = &proto_netdev;
--				break;
--			case PROTO_BASE_TRANSPORT_HDR:
--				desc = &proto_inet_service;
--				break;
--			default:
--				break;
--			}
--			break;
--		}
--	}
-+	if (desc == NULL)
-+		desc = payload_gen_special_dependency(ctx, expr);
- 
- 	if (desc == NULL)
- 		return expr_error(ctx->msgs, expr,
-diff --git a/tests/py/any/icmpX.t.netdev b/tests/py/any/icmpX.t.netdev
-new file mode 100644
-index 0000000..a327ce6
---- /dev/null
-+++ b/tests/py/any/icmpX.t.netdev
-@@ -0,0 +1,8 @@
-+:ingress;type filter hook ingress device lo priority 0
-+
-+*netdev;test-netdev;ingress
-+
-+ip protocol icmp icmp type echo-request;ok;icmp type echo-request
-+icmp type echo-request;ok
-+ip6 nexthdr icmpv6 icmpv6 type echo-request;ok;icmpv6 type echo-request
-+icmpv6 type echo-request;ok
-diff --git a/tests/py/any/icmpX.t.netdev.payload b/tests/py/any/icmpX.t.netdev.payload
-new file mode 100644
-index 0000000..8b8107c
---- /dev/null
-+++ b/tests/py/any/icmpX.t.netdev.payload
-@@ -0,0 +1,36 @@
-+# ip protocol icmp icmp type echo-request
-+netdev test-netdev ingress
-+  [ meta load protocol => reg 1 ]
-+  [ cmp eq reg 1 0x00000008 ]
-+  [ payload load 1b @ network header + 9 => reg 1 ]
-+  [ cmp eq reg 1 0x00000001 ]
-+  [ payload load 1b @ transport header + 0 => reg 1 ]
-+  [ cmp eq reg 1 0x00000008 ]
-+
-+# icmp type echo-request
-+netdev test-netdev ingress
-+  [ meta load protocol => reg 1 ]
-+  [ cmp eq reg 1 0x00000008 ]
-+  [ payload load 1b @ network header + 9 => reg 1 ]
-+  [ cmp eq reg 1 0x00000001 ]
-+  [ payload load 1b @ transport header + 0 => reg 1 ]
-+  [ cmp eq reg 1 0x00000008 ]
-+
-+# ip6 nexthdr icmpv6 icmpv6 type echo-request
-+netdev test-netdev ingress
-+  [ meta load protocol => reg 1 ]
-+  [ cmp eq reg 1 0x0000dd86 ]
-+  [ payload load 1b @ network header + 6 => reg 1 ]
-+  [ cmp eq reg 1 0x0000003a ]
-+  [ payload load 1b @ transport header + 0 => reg 1 ]
-+  [ cmp eq reg 1 0x00000080 ]
-+
-+# icmpv6 type echo-request
-+netdev test-netdev ingress
-+  [ meta load protocol => reg 1 ]
-+  [ cmp eq reg 1 0x0000dd86 ]
-+  [ payload load 1b @ network header + 6 => reg 1 ]
-+  [ cmp eq reg 1 0x0000003a ]
-+  [ payload load 1b @ transport header + 0 => reg 1 ]
-+  [ cmp eq reg 1 0x00000080 ]
-+
-diff --git a/tests/py/bridge/icmpX.t b/tests/py/bridge/icmpX.t
-new file mode 100644
-index 0000000..8c0a597
---- /dev/null
-+++ b/tests/py/bridge/icmpX.t
-@@ -0,0 +1,8 @@
-+:input;type filter hook input priority 0
-+
-+*bridge;test-bridge;input
-+
-+ip protocol icmp icmp type echo-request;ok;icmp type echo-request
-+icmp type echo-request;ok
-+ip6 nexthdr icmpv6 icmpv6 type echo-request;ok;icmpv6 type echo-request
-+icmpv6 type echo-request;ok
-diff --git a/tests/py/bridge/icmpX.t.payload b/tests/py/bridge/icmpX.t.payload
-new file mode 100644
-index 0000000..19efdd8
---- /dev/null
-+++ b/tests/py/bridge/icmpX.t.payload
-@@ -0,0 +1,36 @@
-+# ip protocol icmp icmp type echo-request
-+bridge test-bridge input
-+  [ payload load 2b @ link header + 12 => reg 1 ]
-+  [ cmp eq reg 1 0x00000008 ]
-+  [ payload load 1b @ network header + 9 => reg 1 ]
-+  [ cmp eq reg 1 0x00000001 ]
-+  [ payload load 1b @ transport header + 0 => reg 1 ]
-+  [ cmp eq reg 1 0x00000008 ]
-+
-+# icmp type echo-request
-+bridge test-bridge input
-+  [ payload load 2b @ link header + 12 => reg 1 ]
-+  [ cmp eq reg 1 0x00000008 ]
-+  [ payload load 1b @ network header + 9 => reg 1 ]
-+  [ cmp eq reg 1 0x00000001 ]
-+  [ payload load 1b @ transport header + 0 => reg 1 ]
-+  [ cmp eq reg 1 0x00000008 ]
-+
-+# ip6 nexthdr icmpv6 icmpv6 type echo-request
-+bridge test-bridge input
-+  [ payload load 2b @ link header + 12 => reg 1 ]
-+  [ cmp eq reg 1 0x0000dd86 ]
-+  [ payload load 1b @ network header + 6 => reg 1 ]
-+  [ cmp eq reg 1 0x0000003a ]
-+  [ payload load 1b @ transport header + 0 => reg 1 ]
-+  [ cmp eq reg 1 0x00000080 ]
-+
-+# icmpv6 type echo-request
-+bridge test-bridge input
-+  [ payload load 2b @ link header + 12 => reg 1 ]
-+  [ cmp eq reg 1 0x0000dd86 ]
-+  [ payload load 1b @ network header + 6 => reg 1 ]
-+  [ cmp eq reg 1 0x0000003a ]
-+  [ payload load 1b @ transport header + 0 => reg 1 ]
-+  [ cmp eq reg 1 0x00000080 ]
-+
-diff --git a/tests/py/inet/icmpX.t b/tests/py/inet/icmpX.t
-new file mode 100644
-index 0000000..1b467a1
---- /dev/null
-+++ b/tests/py/inet/icmpX.t
-@@ -0,0 +1,8 @@
-+:input;type filter hook input priority 0
-+
-+*inet;test-inet;input
-+
-+ip protocol icmp icmp type echo-request;ok;icmp type echo-request
-+icmp type echo-request;ok
-+ip6 nexthdr icmpv6 icmpv6 type echo-request;ok;icmpv6 type echo-request
-+icmpv6 type echo-request;ok
-diff --git a/tests/py/inet/icmpX.t.payload b/tests/py/inet/icmpX.t.payload
-new file mode 100644
-index 0000000..81ca774
---- /dev/null
-+++ b/tests/py/inet/icmpX.t.payload
-@@ -0,0 +1,36 @@
-+# ip protocol icmp icmp type echo-request
-+inet test-inet input
-+  [ meta load nfproto => reg 1 ]
-+  [ cmp eq reg 1 0x00000002 ]
-+  [ payload load 1b @ network header + 9 => reg 1 ]
-+  [ cmp eq reg 1 0x00000001 ]
-+  [ payload load 1b @ transport header + 0 => reg 1 ]
-+  [ cmp eq reg 1 0x00000008 ]
-+
-+# icmp type echo-request
-+inet test-inet input
-+  [ meta load nfproto => reg 1 ]
-+  [ cmp eq reg 1 0x00000002 ]
-+  [ payload load 1b @ network header + 9 => reg 1 ]
-+  [ cmp eq reg 1 0x00000001 ]
-+  [ payload load 1b @ transport header + 0 => reg 1 ]
-+  [ cmp eq reg 1 0x00000008 ]
-+
-+# ip6 nexthdr icmpv6 icmpv6 type echo-request
-+inet test-inet input
-+  [ meta load nfproto => reg 1 ]
-+  [ cmp eq reg 1 0x0000000a ]
-+  [ payload load 1b @ network header + 6 => reg 1 ]
-+  [ cmp eq reg 1 0x0000003a ]
-+  [ payload load 1b @ transport header + 0 => reg 1 ]
-+  [ cmp eq reg 1 0x00000080 ]
-+
-+# icmpv6 type echo-request
-+inet test-inet input
-+  [ meta load nfproto => reg 1 ]
-+  [ cmp eq reg 1 0x0000000a ]
-+  [ payload load 1b @ network header + 6 => reg 1 ]
-+  [ cmp eq reg 1 0x0000003a ]
-+  [ payload load 1b @ transport header + 0 => reg 1 ]
-+  [ cmp eq reg 1 0x00000080 ]
-+
--- 
-2.11.0
-
diff --git a/meta-networking/recipes-filter/nftables/files/0002-proto-Add-some-exotic-ICMPv6-types.patch b/meta-networking/recipes-filter/nftables/files/0002-proto-Add-some-exotic-ICMPv6-types.patch
deleted file mode 100644
index 4d9e9d11a46c..000000000000
--- a/meta-networking/recipes-filter/nftables/files/0002-proto-Add-some-exotic-ICMPv6-types.patch
+++ /dev/null
@@ -1,147 +0,0 @@
-From 9ade8fb75f8963375b45b3f2973b8bb7aa66ad76 Mon Sep 17 00:00:00 2001
-From: Phil Sutter <phil@nwl.cc>
-Date: Thu, 16 Mar 2017 13:43:20 +0100
-Subject: [PATCH] proto: Add some exotic ICMPv6 types
-
-This adds support for matching on inverse ND messages as defined by
-RFC3122 (not implemented in Linux) and MLDv2 as defined by RFC3810.
-
-Note that ICMPV6_MLD2_REPORT macro is defined in linux/icmpv6.h but
-including that header leads to conflicts with symbols defined in
-netinet/icmp6.h.
-
-In addition to the above, "mld-listener-done" is introduced as an alias
-for "mld-listener-reduction".
-
-Signed-off-by: Phil Sutter <phil@nwl.cc>
-Signed-off-by: Pablo Neira Ayuso <pablo@netfilter.org>
----
-Upstream-Status: Backport
-Signed-off-by: André Draszik <adraszik@tycoint.com>
- src/proto.c                       |  8 ++++++++
- tests/py/ip6/icmpv6.t             |  8 ++++++--
- tests/py/ip6/icmpv6.t.payload.ip6 | 34 +++++++++++++++++++++++++++++++++-
- 3 files changed, 47 insertions(+), 3 deletions(-)
-
-diff --git a/src/proto.c b/src/proto.c
-index fb96530..79e9dbf 100644
---- a/src/proto.c
-+++ b/src/proto.c
-@@ -632,6 +632,10 @@ const struct proto_desc proto_ip = {
- 
- #include <netinet/icmp6.h>
- 
-+#define IND_NEIGHBOR_SOLICIT	141
-+#define IND_NEIGHBOR_ADVERT	142
-+#define ICMPV6_MLD2_REPORT	143
-+
- static const struct symbol_table icmp6_type_tbl = {
- 	.base		= BASE_DECIMAL,
- 	.symbols	= {
-@@ -643,6 +647,7 @@ static const struct symbol_table icmp6_type_tbl = {
- 		SYMBOL("echo-reply",			ICMP6_ECHO_REPLY),
- 		SYMBOL("mld-listener-query",		MLD_LISTENER_QUERY),
- 		SYMBOL("mld-listener-report",		MLD_LISTENER_REPORT),
-+		SYMBOL("mld-listener-done",		MLD_LISTENER_REDUCTION),
- 		SYMBOL("mld-listener-reduction",	MLD_LISTENER_REDUCTION),
- 		SYMBOL("nd-router-solicit",		ND_ROUTER_SOLICIT),
- 		SYMBOL("nd-router-advert",		ND_ROUTER_ADVERT),
-@@ -650,6 +655,9 @@ static const struct symbol_table icmp6_type_tbl = {
- 		SYMBOL("nd-neighbor-advert",		ND_NEIGHBOR_ADVERT),
- 		SYMBOL("nd-redirect",			ND_REDIRECT),
- 		SYMBOL("router-renumbering",		ICMP6_ROUTER_RENUMBERING),
-+		SYMBOL("ind-neighbor-solicit",		IND_NEIGHBOR_SOLICIT),
-+		SYMBOL("ind-neighbor-advert",		IND_NEIGHBOR_ADVERT),
-+		SYMBOL("mld2-listener-report",		ICMPV6_MLD2_REPORT),
- 		SYMBOL_LIST_END
- 	},
- };
-diff --git a/tests/py/ip6/icmpv6.t b/tests/py/ip6/icmpv6.t
-index afbd451..a898fe3 100644
---- a/tests/py/ip6/icmpv6.t
-+++ b/tests/py/ip6/icmpv6.t
-@@ -11,7 +11,8 @@ icmpv6 type echo-request accept;ok
- icmpv6 type echo-reply accept;ok
- icmpv6 type mld-listener-query accept;ok
- icmpv6 type mld-listener-report accept;ok
--icmpv6 type mld-listener-reduction accept;ok
-+icmpv6 type mld-listener-done accept;ok
-+icmpv6 type mld-listener-reduction accept;ok;icmpv6 type mld-listener-done accept
- icmpv6 type nd-router-solicit accept;ok
- icmpv6 type nd-router-advert accept;ok
- icmpv6 type nd-neighbor-solicit accept;ok
-@@ -19,8 +20,11 @@ icmpv6 type nd-neighbor-advert accept;ok
- icmpv6 type nd-redirect accept;ok
- icmpv6 type parameter-problem accept;ok
- icmpv6 type router-renumbering accept;ok
-+icmpv6 type ind-neighbor-solicit accept;ok
-+icmpv6 type ind-neighbor-advert accept;ok
-+icmpv6 type mld2-listener-report accept;ok
- icmpv6 type {destination-unreachable, time-exceeded, nd-router-solicit} accept;ok
--icmpv6 type {router-renumbering, mld-listener-reduction, time-exceeded, nd-router-solicit} accept;ok
-+icmpv6 type {router-renumbering, mld-listener-done, time-exceeded, nd-router-solicit} accept;ok
- icmpv6 type {mld-listener-query, time-exceeded, nd-router-advert} accept;ok
- icmpv6 type != {mld-listener-query, time-exceeded, nd-router-advert} accept;ok
- 
-diff --git a/tests/py/ip6/icmpv6.t.payload.ip6 b/tests/py/ip6/icmpv6.t.payload.ip6
-index 9fe2496..30f58ca 100644
---- a/tests/py/ip6/icmpv6.t.payload.ip6
-+++ b/tests/py/ip6/icmpv6.t.payload.ip6
-@@ -54,6 +54,14 @@ ip6 test-ip6 input
-   [ cmp eq reg 1 0x00000083 ]
-   [ immediate reg 0 accept ]
- 
-+# icmpv6 type mld-listener-done accept
-+ip6 test-ip6 input
-+  [ payload load 1b @ network header + 6 => reg 1 ]
-+  [ cmp eq reg 1 0x0000003a ]
-+  [ payload load 1b @ transport header + 0 => reg 1 ]
-+  [ cmp eq reg 1 0x00000084 ]
-+  [ immediate reg 0 accept ]
-+
- # icmpv6 type mld-listener-reduction accept
- ip6 test-ip6 input
-   [ payload load 1b @ network header + 6 => reg 1 ]
-@@ -118,6 +126,30 @@ ip6 test-ip6 input
-   [ cmp eq reg 1 0x0000008a ]
-   [ immediate reg 0 accept ]
- 
-+# icmpv6 type ind-neighbor-solicit accept
-+ip6 test-ip6 input
-+  [ payload load 1b @ network header + 6 => reg 1 ]
-+  [ cmp eq reg 1 0x0000003a ]
-+  [ payload load 1b @ transport header + 0 => reg 1 ]
-+  [ cmp eq reg 1 0x0000008d ]
-+  [ immediate reg 0 accept ]
-+
-+# icmpv6 type ind-neighbor-advert accept
-+ip6 test-ip6 input
-+  [ payload load 1b @ network header + 6 => reg 1 ]
-+  [ cmp eq reg 1 0x0000003a ]
-+  [ payload load 1b @ transport header + 0 => reg 1 ]
-+  [ cmp eq reg 1 0x0000008e ]
-+  [ immediate reg 0 accept ]
-+
-+# icmpv6 type mld2-listener-report accept
-+ip6 test-ip6 input
-+  [ payload load 1b @ network header + 6 => reg 1 ]
-+  [ cmp eq reg 1 0x0000003a ]
-+  [ payload load 1b @ transport header + 0 => reg 1 ]
-+  [ cmp eq reg 1 0x0000008f ]
-+  [ immediate reg 0 accept ]
-+
- # icmpv6 type {destination-unreachable, time-exceeded, nd-router-solicit} accept
- __set%d test-ip6 3
- __set%d test-ip6 0
-@@ -129,7 +161,7 @@ ip6 test-ip6 input
-   [ lookup reg 1 set __set%d ]
-   [ immediate reg 0 accept ]
- 
--# icmpv6 type {router-renumbering, mld-listener-reduction, time-exceeded, nd-router-solicit} accept
-+# icmpv6 type {router-renumbering, mld-listener-done, time-exceeded, nd-router-solicit} accept
- __set%d test-ip6 3
- __set%d test-ip6 0
- 	element 0000008a  : 0 [end]	element 00000084  : 0 [end]	element 00000003  : 0 [end]	element 00000085  : 0 [end]
--- 
-2.11.0
-
diff --git a/meta-networking/recipes-filter/nftables/files/0003-payload-split-ll-proto-dependency-into-helper.patch b/meta-networking/recipes-filter/nftables/files/0003-payload-split-ll-proto-dependency-into-helper.patch
deleted file mode 100644
index 50cac300e82d..000000000000
--- a/meta-networking/recipes-filter/nftables/files/0003-payload-split-ll-proto-dependency-into-helper.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-From 8d8cfe5ad6ca460a5262fb15fdbef3601058c784 Mon Sep 17 00:00:00 2001
-From: Florian Westphal <fw@strlen.de>
-Date: Thu, 18 May 2017 13:30:54 +0200
-Subject: [PATCH 1/4] payload: split ll proto dependency into helper
-
-will be re-used in folloup patch for icmp/icmpv6 depenency
-handling.
-
-Signed-off-by: Florian Westphal <fw@strlen.de>
----
-Upstream-Status: Backport
-Signed-off-by: André Draszik <adraszik@tycoint.com>
- src/payload.c | 29 ++++++++++++++++++-----------
- 1 file changed, 18 insertions(+), 11 deletions(-)
-
-diff --git a/src/payload.c b/src/payload.c
-index 55128fe..31e5a02 100644
---- a/src/payload.c
-+++ b/src/payload.c
-@@ -224,21 +224,28 @@ static int payload_add_dependency(struct eval_ctx *ctx,
- }
- 
- static const struct proto_desc *
-+payload_get_get_ll_hdr(const struct eval_ctx *ctx)
-+{
-+	switch (ctx->pctx.family) {
-+	case NFPROTO_INET:
-+		return &proto_inet;
-+	case NFPROTO_BRIDGE:
-+		return &proto_eth;
-+	case NFPROTO_NETDEV:
-+		return &proto_netdev;
-+	default:
-+		break;
-+	}
-+
-+	return NULL;
-+}
-+
-+static const struct proto_desc *
- payload_gen_special_dependency(struct eval_ctx *ctx, const struct expr *expr)
- {
- 	switch (expr->payload.base) {
- 	case PROTO_BASE_LL_HDR:
--		switch (ctx->pctx.family) {
--		case NFPROTO_INET:
--			return &proto_inet;
--		case NFPROTO_BRIDGE:
--			return &proto_eth;
--		case NFPROTO_NETDEV:
--			return &proto_netdev;
--		default:
--			break;
--		}
--		break;
-+		return payload_get_get_ll_hdr(ctx);
- 	case PROTO_BASE_TRANSPORT_HDR:
- 		if (expr->payload.desc == &proto_icmp)
- 			return &proto_ip;
--- 
-2.11.0
-
diff --git a/meta-networking/recipes-filter/nftables/files/0004-src-allow-update-of-net-base-w.-meta-l4proto-icmpv6.patch b/meta-networking/recipes-filter/nftables/files/0004-src-allow-update-of-net-base-w.-meta-l4proto-icmpv6.patch
deleted file mode 100644
index 180edb3504cb..000000000000
--- a/meta-networking/recipes-filter/nftables/files/0004-src-allow-update-of-net-base-w.-meta-l4proto-icmpv6.patch
+++ /dev/null
@@ -1,65 +0,0 @@
-From 9a1f2bbf3cd2417e0c10d18578e224abe2071d68 Mon Sep 17 00:00:00 2001
-From: Florian Westphal <fw@strlen.de>
-Date: Tue, 21 Mar 2017 19:47:22 +0100
-Subject: [PATCH 2/4] src: allow update of net base w. meta l4proto icmpv6
-
-nft add rule ip6 f i meta l4proto ipv6-icmp icmpv6 type nd-router-advert
-<cmdline>:1:50-60: Error: conflicting protocols specified: unknown vs. icmpv6
-
-add icmpv6 to nexthdr list so base gets updated correctly.
-
-Reported-by: Thomas Woerner <twoerner@redhat.com>
-Signed-off-by: Florian Westphal <fw@strlen.de>
----
-Upstream-Status: Backport
-Signed-off-by: André Draszik <adraszik@tycoint.com>
- src/proto.c                 | 1 +
- tests/py/any/meta.t         | 1 +
- tests/py/any/meta.t.payload | 7 +++++++
- 3 files changed, 9 insertions(+)
-
-diff --git a/src/proto.c b/src/proto.c
-index 79e9dbf..fcdfbe7 100644
---- a/src/proto.c
-+++ b/src/proto.c
-@@ -779,6 +779,7 @@ const struct proto_desc proto_inet_service = {
- 		PROTO_LINK(IPPROTO_TCP,		&proto_tcp),
- 		PROTO_LINK(IPPROTO_DCCP,	&proto_dccp),
- 		PROTO_LINK(IPPROTO_SCTP,	&proto_sctp),
-+		PROTO_LINK(IPPROTO_ICMPV6,	&proto_icmp6),
- 	},
- 	.templates	= {
- 		[0]	= PROTO_META_TEMPLATE("l4proto", &inet_protocol_type, NFT_META_L4PROTO, 8),
-diff --git a/tests/py/any/meta.t b/tests/py/any/meta.t
-index c3ac0a4..2ff942f 100644
---- a/tests/py/any/meta.t
-+++ b/tests/py/any/meta.t
-@@ -38,6 +38,7 @@ meta l4proto { 33, 55, 67, 88};ok;meta l4proto { 33, 55, 67, 88}
- meta l4proto != { 33, 55, 67, 88};ok
- meta l4proto { 33-55};ok
- meta l4proto != { 33-55};ok
-+meta l4proto ipv6-icmp icmpv6 type nd-router-advert;ok;icmpv6 type nd-router-advert
- 
- meta priority root;ok
- meta priority none;ok
-diff --git a/tests/py/any/meta.t.payload b/tests/py/any/meta.t.payload
-index e432656..871f1ad 100644
---- a/tests/py/any/meta.t.payload
-+++ b/tests/py/any/meta.t.payload
-@@ -187,6 +187,13 @@ ip test-ip4 input
-   [ byteorder reg 1 = hton(reg 1, 2, 1) ]
-   [ lookup reg 1 set __set%d 0x1 ]
- 
-+# meta l4proto ipv6-icmp icmpv6 type nd-router-advert
-+ip test-ip4 input
-+  [ meta load l4proto => reg 1 ]
-+  [ cmp eq reg 1 0x0000003a ]
-+  [ payload load 1b @ transport header + 0 => reg 1 ]
-+  [ cmp eq reg 1 0x00000086 ]
-+
- # meta mark 0x4
- ip test-ip4 input
-   [ meta load mark => reg 1 ]
--- 
-2.11.0
-
diff --git a/meta-networking/recipes-filter/nftables/files/0005-src-ipv6-switch-implicit-dependencies-to-meta-l4prot.patch b/meta-networking/recipes-filter/nftables/files/0005-src-ipv6-switch-implicit-dependencies-to-meta-l4prot.patch
deleted file mode 100644
index f600ae05c0f0..000000000000
--- a/meta-networking/recipes-filter/nftables/files/0005-src-ipv6-switch-implicit-dependencies-to-meta-l4prot.patch
+++ /dev/null
@@ -1,98 +0,0 @@
-From 2366ed9ffcb4f5f5341f10f0a1d1a4688d37ad87 Mon Sep 17 00:00:00 2001
-From: Florian Westphal <fw@strlen.de>
-Date: Wed, 22 Mar 2017 15:08:48 +0100
-Subject: [PATCH 3/4] src: ipv6: switch implicit dependencies to meta l4proto
-
-when using rule like
-
-ip6 filter input tcp dport 22
-nft generates:
-  [ payload load 1b @ network header + 6 => reg 1 ]
-  [ cmp eq reg 1 0x00000006 ]
-  [ payload load 2b @ transport header + 2 => reg 1 ]
-  [ cmp eq reg 1 0x00001600 ]
-
-which is: ip6 filter input ip6 nexthdr tcp dport 22
-IOW, such a rule won't match if e.g. a fragment header is in place.
-
-This changes ip6_proto to use 'meta l4proto' which is the protocol header
-found by exthdr walk.
-
-A side effect is that for bridge we get a shorter dependency chain as it
-no longer needs to prepend 'ether proto ipv6' for old 'ip6 nexthdr' dep.
-
-Only problem:
-
-ip6 nexthdr tcp tcp dport 22
-will now inject a (useless) meta l4 dependency as ip6 nexthdr is no
-longer flagged as EXPR_F_PROTOCOL, to avoid this add a small helper
-that skips the unneded meta dependency in that case.
-
-Signed-off-by: Florian Westphal <fw@strlen.de>
----
-Upstream-Status: Backport
-Signed-off-by: André Draszik <adraszik@tycoint.com>
- src/payload.c | 19 ++++++++++++++++++-
- src/proto.c   |  2 +-
- 2 files changed, 19 insertions(+), 2 deletions(-)
-
-diff --git a/src/payload.c b/src/payload.c
-index 31e5a02..38db15e 100644
---- a/src/payload.c
-+++ b/src/payload.c
-@@ -117,6 +117,23 @@ static const struct expr_ops payload_expr_ops = {
- 	.pctx_update	= payload_expr_pctx_update,
- };
- 
-+/*
-+ * ipv6 is special case, we normally use 'meta l4proto' to fetch the last
-+ * l4 header of the ipv6 extension header chain so we will also match
-+ * tcp after a fragmentation header, for instance.
-+ *
-+ * If user specifically asks for nexthdr x, treat is as a full
-+ * dependency rather than injecting another (useless) meta l4 one.
-+ */
-+static bool proto_key_is_protocol(const struct proto_desc *desc, unsigned int type)
-+{
-+	if (type == desc->protocol_key ||
-+	    (desc == &proto_ip6 && type == IP6HDR_NEXTHDR))
-+		return true;
-+
-+	return false;
-+}
-+
- struct expr *payload_expr_alloc(const struct location *loc,
- 				const struct proto_desc *desc,
- 				unsigned int type)
-@@ -129,7 +146,7 @@ struct expr *payload_expr_alloc(const struct location *loc,
- 	if (desc != NULL) {
- 		tmpl = &desc->templates[type];
- 		base = desc->base;
--		if (type == desc->protocol_key)
-+		if (proto_key_is_protocol(desc, type))
- 			flags = EXPR_F_PROTOCOL;
- 	} else {
- 		tmpl = &proto_unknown_template;
-diff --git a/src/proto.c b/src/proto.c
-index fcdfbe7..3b20a5f 100644
---- a/src/proto.c
-+++ b/src/proto.c
-@@ -707,7 +707,6 @@ const struct proto_desc proto_icmp6 = {
- const struct proto_desc proto_ip6 = {
- 	.name		= "ip6",
- 	.base		= PROTO_BASE_NETWORK_HDR,
--	.protocol_key	= IP6HDR_NEXTHDR,
- 	.protocols	= {
- 		PROTO_LINK(IPPROTO_ESP,		&proto_esp),
- 		PROTO_LINK(IPPROTO_AH,		&proto_ah),
-@@ -720,6 +719,7 @@ const struct proto_desc proto_ip6 = {
- 		PROTO_LINK(IPPROTO_ICMPV6,	&proto_icmp6),
- 	},
- 	.templates	= {
-+		[0]	= PROTO_META_TEMPLATE("l4proto", &inet_protocol_type, NFT_META_L4PROTO, 8),
- 		[IP6HDR_VERSION]	= HDR_BITFIELD("version", &integer_type, 0, 4),
- 		[IP6HDR_DSCP]		= HDR_BITFIELD("dscp", &dscp_type, 4, 6),
- 		[IP6HDR_ECN]		= HDR_BITFIELD("ecn", &ecn_type, 10, 2),
--- 
-2.11.0
-
diff --git a/meta-networking/recipes-filter/nftables/files/0006-payload-enforce-ip-ip6-protocol-depending-on-icmp-or.patch b/meta-networking/recipes-filter/nftables/files/0006-payload-enforce-ip-ip6-protocol-depending-on-icmp-or.patch
deleted file mode 100644
index 00076d7cef99..000000000000
--- a/meta-networking/recipes-filter/nftables/files/0006-payload-enforce-ip-ip6-protocol-depending-on-icmp-or.patch
+++ /dev/null
@@ -1,84 +0,0 @@
-From f21a7a4849b50c30341ec571813bd7fe37040ad3 Mon Sep 17 00:00:00 2001
-From: Florian Westphal <fw@strlen.de>
-Date: Thu, 18 May 2017 13:30:54 +0200
-Subject: [PATCH 4/4] payload: enforce ip/ip6 protocol depending on icmp or
- icmpv6
-
-After some discussion with Pablo we agreed to treat icmp/icmpv6 specially.
-
-in the case of a rule like 'tcp dport 22' the inet, bridge and netdev
-families only care about the lower layer protocol.
-
-In the icmpv6 case however we'd like to also enforce an ipv6 protocol check
-(and ipv4 check in icmp case).
-
-This extends payload_gen_special_dependency() to consider this.
-With this patch:
-
-add rule $pf filter input meta l4proto icmpv6
-add rule $pf filter input meta l4proto icmpv6 icmpv6 type echo-request
-add rule $pf filter input icmpv6 type echo-request
-
-will work in all tables and all families.
-For inet/bridge/netdev, an ipv6 protocol dependency is added; this will
-not match ipv4 packets with ip->protocol == icmpv6, EXCEPT in the case
-of the ip family.
-
-Its still possible to match icmpv6-in-ipv4 in inet/bridge/netdev with an
-explicit dependency:
-
-add rule inet f i ip protocol ipv6-icmp meta l4proto ipv6-icmp icmpv6 type ...
-
-Implicit dependencies won't get removed at the moment, so
-  bridge ... icmp type echo-request
-will be shown as
-  ether type ip meta l4proto 1 icmp type echo-request
-
-Signed-off-by: Florian Westphal <fw@strlen.de>
----
-Upstream-Status: Backport
-Signed-off-by: André Draszik <adraszik@tycoint.com>
- src/payload.c | 27 +++++++++++++++++++++++----
- 1 file changed, 23 insertions(+), 4 deletions(-)
-
-diff --git a/src/payload.c b/src/payload.c
-index 38db15e..8796ee5 100644
---- a/src/payload.c
-+++ b/src/payload.c
-@@ -264,10 +264,29 @@ payload_gen_special_dependency(struct eval_ctx *ctx, const struct expr *expr)
- 	case PROTO_BASE_LL_HDR:
- 		return payload_get_get_ll_hdr(ctx);
- 	case PROTO_BASE_TRANSPORT_HDR:
--		if (expr->payload.desc == &proto_icmp)
--			return &proto_ip;
--		if (expr->payload.desc == &proto_icmp6)
--			return &proto_ip6;
-+		if (expr->payload.desc == &proto_icmp ||
-+		    expr->payload.desc == &proto_icmp6) {
-+			const struct proto_desc *desc, *desc_upper;
-+			struct stmt *nstmt;
-+
-+			desc = ctx->pctx.protocol[PROTO_BASE_LL_HDR].desc;
-+			if (!desc) {
-+				desc = payload_get_get_ll_hdr(ctx);
-+				if (!desc)
-+					break;
-+			}
-+
-+			desc_upper = &proto_ip6;
-+			if (expr->payload.desc == &proto_icmp)
-+				desc_upper = &proto_ip;
-+
-+			if (payload_add_dependency(ctx, desc, desc_upper,
-+						   expr, &nstmt) < 0)
-+				return NULL;
-+
-+			list_add_tail(&nstmt->list, &ctx->stmt->list);
-+			return desc_upper;
-+		}
- 		return &proto_inet_service;
- 	default:
- 		break;
--- 
-2.11.0
-
diff --git a/meta-networking/recipes-filter/nftables/files/0007-src-ip-switch-implicit-dependencies-to-meta-l4proto-.patch b/meta-networking/recipes-filter/nftables/files/0007-src-ip-switch-implicit-dependencies-to-meta-l4proto-.patch
deleted file mode 100644
index 5b72437d2755..000000000000
--- a/meta-networking/recipes-filter/nftables/files/0007-src-ip-switch-implicit-dependencies-to-meta-l4proto-.patch
+++ /dev/null
@@ -1,86 +0,0 @@
-From 0825c57d571bb7121e7048e198b9b023f7e7f358 Mon Sep 17 00:00:00 2001
-From: Florian Westphal <fw@strlen.de>
-Date: Sun, 7 May 2017 03:53:30 +0200
-Subject: [PATCH] src: ip: switch implicit dependencies to meta l4proto too
-
-after ip6 nexthdr also switch ip to meta l4proto instead of ip protocol.
-
-While its needed for ipv6 (due to extension headers) this isn't needed
-for ip but it has the advantage that
-
-tcp dport 22
-
-produces same expressions for ip/ip6/inet families.
-
-Signed-off-by: Florian Westphal <fw@strlen.de>
----
-Upstream-Status: Backport
-Signed-off-by: André Draszik <adraszik@tycoint.com>
- src/payload.c | 17 +++++++++++------
- src/proto.c   |  3 ++-
- 2 files changed, 13 insertions(+), 7 deletions(-)
-
-diff --git a/src/payload.c b/src/payload.c
-index 8796ee5..11b6df3 100644
---- a/src/payload.c
-+++ b/src/payload.c
-@@ -118,17 +118,22 @@ static const struct expr_ops payload_expr_ops = {
- };
- 
- /*
-- * ipv6 is special case, we normally use 'meta l4proto' to fetch the last
-- * l4 header of the ipv6 extension header chain so we will also match
-+ * We normally use 'meta l4proto' to fetch the last l4 header of the
-+ * ipv6 extension header chain so we will also match
-  * tcp after a fragmentation header, for instance.
-+ * For consistency we also use meta l4proto for ipv4.
-  *
-- * If user specifically asks for nexthdr x, treat is as a full
-- * dependency rather than injecting another (useless) meta l4 one.
-+ * If user specifically asks for nexthdr x, don't add another (useless)
-+ * meta dependency.
-  */
- static bool proto_key_is_protocol(const struct proto_desc *desc, unsigned int type)
- {
--	if (type == desc->protocol_key ||
--	    (desc == &proto_ip6 && type == IP6HDR_NEXTHDR))
-+	if (type == desc->protocol_key)
-+		return true;
-+
-+	if (desc == &proto_ip6 && type == IP6HDR_NEXTHDR)
-+		return true;
-+	if (desc == &proto_ip && type == IPHDR_PROTOCOL)
- 		return true;
- 
- 	return false;
-diff --git a/src/proto.c b/src/proto.c
-index 3b20a5f..2afedf7 100644
---- a/src/proto.c
-+++ b/src/proto.c
-@@ -587,7 +587,6 @@ const struct proto_desc proto_ip = {
- 	.name		= "ip",
- 	.base		= PROTO_BASE_NETWORK_HDR,
- 	.checksum_key	= IPHDR_CHECKSUM,
--	.protocol_key	= IPHDR_PROTOCOL,
- 	.protocols	= {
- 		PROTO_LINK(IPPROTO_ICMP,	&proto_icmp),
- 		PROTO_LINK(IPPROTO_ESP,		&proto_esp),
-@@ -600,6 +599,7 @@ const struct proto_desc proto_ip = {
- 		PROTO_LINK(IPPROTO_SCTP,	&proto_sctp),
- 	},
- 	.templates	= {
-+		[0]	= PROTO_META_TEMPLATE("l4proto", &inet_protocol_type, NFT_META_L4PROTO, 8),
- 		[IPHDR_VERSION]		= HDR_BITFIELD("version", &integer_type, 0, 4),
- 		[IPHDR_HDRLENGTH]	= HDR_BITFIELD("hdrlength", &integer_type, 4, 4),
- 		[IPHDR_DSCP]            = HDR_BITFIELD("dscp", &dscp_type, 8, 6),
-@@ -779,6 +779,7 @@ const struct proto_desc proto_inet_service = {
- 		PROTO_LINK(IPPROTO_TCP,		&proto_tcp),
- 		PROTO_LINK(IPPROTO_DCCP,	&proto_dccp),
- 		PROTO_LINK(IPPROTO_SCTP,	&proto_sctp),
-+		PROTO_LINK(IPPROTO_ICMP,	&proto_icmp),
- 		PROTO_LINK(IPPROTO_ICMPV6,	&proto_icmp6),
- 	},
- 	.templates	= {
--- 
-2.11.0
-
diff --git a/meta-networking/recipes-filter/nftables/files/fix-to-generate-ntf.8.patch b/meta-networking/recipes-filter/nftables/files/fix-to-generate-ntf.8.patch
deleted file mode 100644
index 8dce90a754b8..000000000000
--- a/meta-networking/recipes-filter/nftables/files/fix-to-generate-ntf.8.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-[PATCH] disable to make ntf.8 man
-
-Upstream-Status: Pending
-
-$DB2MAN do not support the xinclude parameter whether it is
-docbook2x-man or other, so disable to make ntf.8 man
-
-Signed-off-by: Roy Li <rongqing.li@windriver.com>
----
- doc/Makefile.am | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/doc/Makefile.am b/doc/Makefile.am
-index a92de7f..537c36b 100644
---- a/doc/Makefile.am
-+++ b/doc/Makefile.am
-@@ -1,5 +1,5 @@
- if BUILD_MAN
--man_MANS = nft.8
-+#man_MANS = nft.8
- endif
- 
- if BUILD_PDF
--- 
-1.9.1
-
diff --git a/meta-networking/recipes-filter/nftables/nftables_0.7.bb b/meta-networking/recipes-filter/nftables/nftables_0.7.bb
deleted file mode 100644
index 287c350b9c64..000000000000
--- a/meta-networking/recipes-filter/nftables/nftables_0.7.bb
+++ /dev/null
@@ -1,27 +0,0 @@
-SUMMARY = "Netfilter Tables userspace utillites"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=d1a78fdd879a263a5e0b42d1fc565e79"
-SECTION = "net"
-
-DEPENDS = "libmnl libnftnl readline gmp bison-native"
-RRECOMMENDS_${PN} += "kernel-module-nf-tables \
-    "
-
-SRC_URI = "http://www.netfilter.org/projects/nftables/files/${BP}.tar.bz2 \
-           file://fix-to-generate-ntf.8.patch \
-           \
-           file://0001-payload-explicit-network-ctx-assignment-for-icmp-icm.patch \
-           file://0002-proto-Add-some-exotic-ICMPv6-types.patch \
-           \
-           file://0003-payload-split-ll-proto-dependency-into-helper.patch \
-           file://0004-src-allow-update-of-net-base-w.-meta-l4proto-icmpv6.patch \
-           file://0005-src-ipv6-switch-implicit-dependencies-to-meta-l4prot.patch \
-           file://0006-payload-enforce-ip-ip6-protocol-depending-on-icmp-or.patch \
-           file://0007-src-ip-switch-implicit-dependencies-to-meta-l4proto-.patch \
-          "
-SRC_URI[md5sum] = "4c005e76a15a029afaba71d7db21d065"
-SRC_URI[sha256sum] = "fe639239d801ce5890397f6f4391c58a934bfc27d8b7d5ef922692de5ec4ed43"
-
-ASNEEDED = ""
-
-inherit autotools pkgconfig
diff --git a/meta-networking/recipes-filter/nftables/nftables_0.9.0.bb b/meta-networking/recipes-filter/nftables/nftables_0.9.0.bb
new file mode 100644
index 000000000000..aadf4f7f5d6b
--- /dev/null
+++ b/meta-networking/recipes-filter/nftables/nftables_0.9.0.bb
@@ -0,0 +1,20 @@
+SUMMARY = "Netfilter Tables userspace utillites"
+SECTION = "net"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d1a78fdd879a263a5e0b42d1fc565e79"
+
+DEPENDS = "libmnl libnftnl readline gmp bison-native"
+
+SRC_URI = "http://www.netfilter.org/projects/nftables/files/${BP}.tar.bz2 \
+           "
+SRC_URI[md5sum] = "d4dcb61df80aa544b2e142e91d937635"
+SRC_URI[sha256sum] = "ad8181b5fcb9ca572f444bed54018749588522ee97e4c21922648bb78d7e7e91"
+
+inherit autotools manpages pkgconfig
+
+PACKAGECONFIG ?= ""
+PACKAGECONFIG[man] = "--enable--man-doc, --disable-man-doc"
+
+ASNEEDED = ""
+
+RRECOMMENDS_${PN} += "kernel-module-nf-tables"
-- 
2.7.4


