Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3699C77B60
	for <webhook@archiver.kernel.org>; Mon,  3 Apr 2023 09:02:43 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web11.65536.1680512556212197952
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Apr 2023 02:02:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=eiyq5BhF;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1680512554; i=@fujitsu.com;
	bh=XBDeXyiLkwT8wDqJe7nTRqN7PFJep/A6HL+v8xW+xmg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=eiyq5BhFJxui3Fiu+BvF4xi77gPV/WPxNeDEtAYbq02oxqzHbufNX7eHIYSnXp3Du
	 yI/3bTaNtj0UH+dZf/sIz1BOZEIl/18vO7W/7zL2S00Hb66FQvg43HvjVGoiJXNPOX
	 QOpmNLOhGiyfs5Mbft4mYx87dEM5K6VpVyMwl/iXu5KV4gjXuOgnusV3vFJVdj20Du
	 wJAoAFFcai0/txKW0nIeKKada0uHz5j0chxCEZKqyiDnvs2s3L21UzTDFfa55xBk4N
	 gPrD2YPDZZq3gOzpw+1XYj9tTU8Odw8GpY2LSVaTDdi9hAEQxfKnCGFFdp8Tu7rRWx
	 QziSH+mA7pGEA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGIsWRWlGSWpSXmKPExsViZ8ORpKs5TSv
  FoOOpscXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmnHwyxH2gjkSFVO37GJuYGwV7WLk4hASeMgo
  sfbfQdYuRk4g5wqTROPibIjEbkaJSX/vgCXYBKQkbtz/zwZiiwjoSyydvYcZxGYWUJF48buHH
  cQWFnCX6LvZC2azAMW3rm5jArF5BZwkXpx4CzZHQkBBYsrD92C9nALOEhcWv4Ba7CSx6mQ3G0
  S9oMTJmU9YIOZLSBx88YIZoldRYvblZhYIu0KicfohJghbTeLquU3MExgFZyFpn4WkfQEj0yp
  Gs+LUorLUIl1zvaSizPSMktzEzBy9xCrdRL3UUt28/KKSDF1DvcTyYr3U4mK94src5JwUvbzU
  kk2MwOBNKU7l3MG4su+v3iFGSQ4mJVFewXqtFCG+pPyUyozE4oz4otKc1OJDjDIcHEoSvAcnA
  OUEi1LTUyvSMnOAkQSTluDgURLhDe4FSvMWFyTmFmemQ6ROMSpKifP6TQFKCIAkMkrz4Npg0X
  uJUVZKmJeRgYFBiKcgtSg3swRV/hWjOAejkjDvq4lAU3gy80rgpr8CWswEtLg1SgNkcUkiQkq
  qgWlSc6Sp7VRxtcNfKrf5ZV+ZdTdNKvXHDst1G1pOJZ9hc3xjkui/ZuG6SSYTzNraV++7JO3n
  zbBjWZEtt9aJ5sx3UdzFd2wfB3k7OK5iOX1rjejzwOTsQ80Wcf2VvppX/2aq7+lfo3PsGv+BW
  9ZZLWmJYRtX/F2g5ZD11neRyzzvR/UNrEwqx05W7Vjx9NjUDP+OU351j1hurE4rXXL0left7D
  v6Tr2hArFrjto8F/zp6rZHMbk/Vbl33am1zQ1am3n+7Jz1a1qK3YeQ8GkmQgYTJ+S27BM8cqe
  6X91IN3v/BcHkCavjJebVKqap2iz7tEKl2Z5fsDVEQjfiYRDXid0a3QvXPmr7tJVbI/unjhJL
  cUaioRZzUXEiAD7p2plZAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-8.tower-745.messagelabs.com!1680512553!1417875!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 12077 invoked from network); 3 Apr 2023 09:02:33 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-8.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 3 Apr 2023 09:02:33 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 3F7281D0
	for <openembedded-devel@lists.openembedded.org>; Mon,  3 Apr 2023 10:02:33 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 344661C6
	for <openembedded-devel@lists.openembedded.org>; Mon,  3 Apr 2023 10:02:33 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 3 Apr 2023 10:02:31 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] openvpn: upgrade 2.6.1 -> 2.6.2
Date: Mon, 3 Apr 2023 17:02:03 +0800
Message-ID: <1680512525-30501-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1680512525-30501-1-git-send-email-wangmy@fujitsu.com>
References: <1680512525-30501-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 03 Apr 2023 09:02:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101904

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
 dco: don't use NetLink to exchange control packets
 dco: print version to log if available
 dco-linux: remove M_ERRNO flag when printing netlink error message
 multi: don't call DCO APIs if DCO is disabled
 dco-freebsd: use m->instances[] instead of m->hash
 dco-linux: implement dco_get_peer_stats{, multi} API
 Set netlink socket to be non-blocking
 Ensure n = 2 is set in key2 struct in tls_crypt_v2_unwrap_client_key
 Fix memory leaks in open_tun_dco()
 Fix memory leaks in HMAC initial packet generation
 Use key_state instead of multi for tls_send_payload parameter
 Make sending plain text control message session aware
 Only update frame calculation if we have a valid link sockets
 Improve description of compat-mode
 Simplify --compress parsing in options.c
 Refuse connection if server pushes an option contradicting allow-compress
 Add 'allow-compression stub-only' internally for DCO
 Parse compression options and bail out when compression is disabled
 tests/unit_tests: Fix 'make distcheck' with subdir-objects enabled
 preparing release 2.6.2
 dns option: allow up to eight addresses per server
 dco: print FreeBSD version
 Support --inactive option for DCO
 Fix '--inactive <time> 0' behavior for DCO
 Print DCO client stats on SIGUSR2
 Don't overwrite socket flags when using DCO on Windows
 using OpenSSL3 API for EVP PKEY type name reporting
 Bugfix: Convert ECDSA signature form pkcs11-helper to DER encoded form
 Import some sample certificates into Windows store for testing
 Add tests for finding certificates in Windows cert store
 Refactor SSL_CTX_use_CryptoAPI_certificate()
 Add a test for signing with certificates in Windows store
 Unit tests: add test for SSL_CTX_use_Cryptoapi_certificate()
 Improve error message on short read from socks proxy
 Make error in setting metric for IPv6 interface non-fatal

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../openvpn/{openvpn_2.6.1.bb => openvpn_2.6.2.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/openvpn/{openvpn_2.6.1.bb => openvpn_2.6.2.bb} (97%)

diff --git a/meta-networking/recipes-support/openvpn/openvpn_2.6.1.bb b/meta-networking/recipes-support/openvpn/openvpn_2.6.2.bb
similarity index 97%
rename from meta-networking/recipes-support/openvpn/openvpn_2.6.1.bb
rename to meta-networking/recipes-support/openvpn/openvpn_2.6.2.bb
index 20dac798b..36ae8c96f 100644
--- a/meta-networking/recipes-support/openvpn/openvpn_2.6.1.bb
+++ b/meta-networking/recipes-support/openvpn/openvpn_2.6.2.bb
@@ -14,7 +14,7 @@ SRC_URI = "http://swupdate.openvpn.org/community/releases/${BP}.tar.gz \
 
 UPSTREAM_CHECK_URI = "https://openvpn.net/community-downloads"
 
-SRC_URI[sha256sum] = "8cbc4fd8ce27b85107b449833c3b30fb05f1ca3c81b46a0ba8658036944266bc"
+SRC_URI[sha256sum] = "42d561a9af150b21bc914e3b7aa09f88013d2ffa6d5ce75a025a3b34caa948d4"
 
 # CVE-2020-7224 and CVE-2020-27569 are for Aviatrix OpenVPN client, not for openvpn.
 CVE_CHECK_IGNORE += "CVE-2020-7224 CVE-2020-27569"
-- 
2.34.1


