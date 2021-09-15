Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web12.2508.1631674154744707489
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Sep 2021 19:49:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=OR45GjX8;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1631674152; i=@fujitsu.com;
	bh=GENjcLej/Jgk9swonj9EqXCqXRlzOpPqcp99Vnd/f+s=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=OR45GjX8mOh+YW9wXKcvvMLyaCp88/RALCpKKwODEeZGEqKCPAoEuP6fDfODNu7IH
	 iUrIGP9LYJhvLaQNueTt/uz/X/fjb4I3T7SjXCAUVT5F0apyLNV4/dCm6Wgqx5ifPK
	 wP2edzwNSOyxjByJ3svs4Qzdb6cjWs9e7BUu3rxP6TjsMAIEqiIc0Jnh5reD9VdsGX
	 XUGjxyE1zjG1JdRInIfs0giec9erAJBlSR5vIlL9CN3v18VF4lI88g9GJES9X8Ttev
	 N0OZpw+2vsVp+R2++QBeVqZLeRmibWel+Cfw+BfKvMgbnBcaH1QsSuue4gYFyu+NPK
	 +zfls5qWoavYg==
Received: from [100.113.7.40] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-b.eu-central-1.aws.symcld.net id 0C/94-23595-72F51416; Wed, 15 Sep 2021 02:49:11 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprGIsWRWlGSWpSXmKPExsViZ8MRoqse75h
  oMOu9iMXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmvGr8yZTwR69il3zHRsYN6t3MXJxCAnMZpLY
  PWcSI4RzglFi8oo97F2MnBxsAmoS02/dYAWxRQT0JZbO3sMMYjMLqEi8+N0DViMs4CpxfvZZI
  JuDg0VAVeLKDFWQMK+Ak8SuC31g5RICChJTHr5nhogLSpyc+YQFYoyExMEXL6BqFCVmX25mgb
  ArJGbNamOawMg7C0nLLCQtCxiZVjFaJBVlpmeU5CZm5ugaGhjoGhoa65oBWXqJVbpJeqmlusm
  peSVFiUBJvcTyYr3iytzknBS9vNSSTYzA4EopZOPawfj09Qe9Q4ySHExKorw+wY6JQnxJ+SmV
  GYnFGfFFpTmpxYcYZTg4lCR4U6KBcoJFqempFWmZOcBAh0lLcPAoifC+jwVK8xYXJOYWZ6ZDp
  E4xKkqJ8z4DSQiAJDJK8+DaYNF1iVFWSpiXkYGBQYinILUoN7MEVf4VozgHo5Iwr0gM0BSezL
  wSuOmvgBYzAS0+st8BZHFJIkJKqoFpRaZNvMLc/otHtlacFfPpPZi3Ian24zKbW2zpdlfkw1+
  4fgx49mtfFYPE4iufL6nPvWN43/v7bol1k3mOJO/se3ol4XP7FJ/WJTx5gtu8Lh6bK7Fvw7pJ
  entvHrgU2lNzSKX3osr0BY/Fjlsdqn6X/m3/1l9JuxU4Fnx0ZfyeND1JgpPh65kXM1/+MFxq8
  2/L2ecn26b3xWz5XeC0vcPENL/vhO2z8Nt51Y97ozuPnGCeLimT79Gcy/I5obPW73MH+yYpyV
  dnDk6P/B7kKKumdz7iukxfarq33vKPO49/qj9R+TCs2YVp3nv5P2Ue/5yCVK/OieP4z77onXY
  lu66a+47z+k90WWOc13ikhpw5q8RSnJFoqMVcVJwIAOYuoIUpAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-13.tower-238.messagelabs.com!1631674151!89257!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 30772 invoked from network); 15 Sep 2021 02:49:11 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-13.tower-238.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 15 Sep 2021 02:49:11 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 18F2n5sC000793
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Sep 2021 03:49:10 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.23; Wed, 15 Sep 2021 03:49:03 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] dnsmasq: upgrade 2.85 -> 2.86
Date: Wed, 15 Sep 2021 10:48:51 +0800
Message-ID: <1631674131-37736-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

version 2.86
	Handle DHCPREBIND requests in the DHCPv6 server code.
	Thanks to Aichun Li for spotting this omission, and the initial
	patch.

	Fix bug which caused dnsmasq to lose track of processes forked
	to handle TCP DNS connections under heavy load. The code
	checked that at least one free process table slot was
	available before listening on TCP sockets, but didn't take
	into account that more than one TCP connection could
	arrive, so that check was not sufficient to ensure that
	there would be slots for all new processes. It compounded
	this error by silently failing to store the process when
	it did run out of slots. Even when this bug is triggered,
	all the right things happen, and answers are still returned.
	Only under very exceptional circumstances, does the bug
	manifest itself: see
	https://lists.thekelleys.org.uk/pipermail/dnsmasq-discuss/2021q2/014976.html
	Thanks to Tijs Van Buggenhout for finding the conditions under
	which the bug manifests itself, and then working out
	exactly what was going on.

	Major rewrite of the DNS server and domain handling code.
	This should be largely transparent, but it drastically
	improves performance and reduces memory foot-print when
	configuring large numbers domains of the form
	local=/adserver.com/
	or
	local=/adserver.com/#
	Lookup times now grow as log-to-base-2 of the number of domains,
	rather than greater than linearly, as before.
	The change makes multiple addresses associated with a domain work
	address=/example.com/1.2.3.4
	address=/example.com/5.6.7.8
	It also handles multiple upstream servers for a domain better; using
	the same try/retry algorithms as non domain-specific servers. This
	also applies to DNSSEC-generated queries.
	Finally, some of the oldest and gnarliest code in dnsmasq has had
	a significant clean-up. It's far from perfect, but it _is_ better.

	Revise resource handling for number of concurrent DNS queries. This
	used to have a global limit, but that has a problem when using
	different servers for different upstream domains. Queries which are
	routed by domain to an upstream server which is not responding will
	build up and trigger the limit, which breaks DNS service for
	all other domains which could be handled by other servers. The
	change is to make the limit per server-group, where a server group
	is the set of servers configured for a particular domain. In the
	common case, where only default servers are declared, there is
	no effective change.

	Improve efficiency of DNSSEC. The sharing point for DNSSEC RR data
	used to be when it entered the cache, having been validated. After
	that queries requiring the KEY or DS records would share the cached
	values. There is a common case in dual-stack hosts that queries for
	A and AAAA records for the same domain are made simultaneously.
	If required keys were not in the cache, this would result in two
	requests being sent upstream for the same key data (and all the
	subsequent chain-of-trust queries.) Now we combine these requests
	and elide the duplicates, resulting in fewer queries upstream
	and better performance. To keep a better handle on what's
	going on, the "extra" logging mode has been modified to associate
	queries and answers  for DNSSEC queries in the same way as ordinary
	queries. The requesting address and port have been removed from
	DNSSEC logging lines, since this is no longer strictly defined.

	Connection track mark based DNS query filtering. Thanks to
	Etan Kissling for implementing this It extends query filtering
	support beyond what is currently possible
	with the `--ipset` configuration option, by adding support for:
	1) Specifying allowlists on a per-client basis, based on their
	   associated Linux connection track mark.
	2) Dynamic configuration of allowlists via Ubus.
	3) Reporting when a DNS query resolves or is rejected via Ubus.
	4) DNS name patterns containing wildcards.
	Disallowed queries are not forwarded; they are rejected
	with a REFUSED error code.

	Allow smaller than 64 prefix lengths in synth-domain, with caveats.
	--synth-domain=1234:4567::/56,example.com is now valid.

	Make domains generated by --synth-domain appear in replies
	when in authoritative mode.

	Ensure CAP_NET_ADMIN capability is available when
	conntrack is configured. Thanks to Yick Xie for spotting
	the lack of this.

	When --dhcp-hostsfile --dhcp-optsfile and --addn-hosts are
	given a directory as argument, define the order in which
	files within that directory are read (alphabetical order
	of filename). Thanks to Ed Wildgoose for the initial patch
	and motivation for this.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-networking/recipes-support/dnsmasq/dnsmasq_2.85.bb | 8 --------
 meta-networking/recipes-support/dnsmasq/dnsmasq_2.86.bb | 7 +++++++
 2 files changed, 7 insertions(+), 8 deletions(-)
 delete mode 100644 meta-networking/recipes-support/dnsmasq/dnsmasq_2.85.bb
 create mode 100644 meta-networking/recipes-support/dnsmasq/dnsmasq_2.86.bb

diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.85.bb b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.85.bb
deleted file mode 100644
index 023dda3e53..0000000000
--- a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.85.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require dnsmasq.inc
-
-SRC_URI[dnsmasq-2.85.md5sum] = "4079e1e6e1065e4bd14ded268cdd7bd7"
-SRC_URI[dnsmasq-2.85.sha256sum] = "f36b93ecac9397c15f461de9b1689ee5a2ed6b5135db0085916233053ff3f886"
-SRC_URI += "\
-    file://lua.patch \
-"
-
diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.86.bb b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.86.bb
new file mode 100644
index 0000000000..31ca51ec60
--- /dev/null
+++ b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.86.bb
@@ -0,0 +1,7 @@
+require dnsmasq.inc
+
+SRC_URI[dnsmasq-2.86.sha256sum] = "ef15f608a83ee2b1d1d2c1f11d089a7e0ac401ffb0991de73fc01ce5f290e512"
+SRC_URI += "\
+    file://lua.patch \
+"
+
-- 
2.25.1

