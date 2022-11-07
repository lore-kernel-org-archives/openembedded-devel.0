Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F4C4C43217
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 08:30:20 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web10.1219.1667809813381494455
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Nov 2022 00:30:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=t27GoiA4;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1667809815; i=@fujitsu.com;
	bh=UdGgvrRSF6qgh9Ngap5imHHMMNzBujflE/7u88ziVAU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=t27GoiA4ehwBnVjb2IyC8bJD+E7G/EAFxanVjbQT2J/C1oK5sax0mP/a4F/aiCXWU
	 0t8bcFFWioObbZs7OThs8ew2ZH+c1hR200bQzuuXXUruRaQe7W+v54rQk0e5EtopAg
	 cAT8Y0xeSAg/swqTtPZNJ7+22XvqG3gnFpvFlyQrtq97NV2vUDAiDCWock03lqkboN
	 Ox/yMJGLuFCvirF8hS2mKM4jI82+n5t8Vt6jS98YTY7z3SPt5xLWZjnLhSXJNnnAF9
	 xaGQTpScw1midixWlSmOJLjlpLEbBGG5fPg4hVk5+BP3dWRIdeaApbye78X816ljb2
	 2Nu7o4yv5UwHA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrIIsWRWlGSWpSXmKPExsViZ8ORqCt2KCP
  ZYMVtc4uLh5cyOzB6nNu4gjGAMYo1My8pvyKBNeP3Mb2CswIVTVsWMjUwHuXrYuTiEBJ4wigx
  b+MCRgjnOpNEy/Z+VghnN6PEodebgRxODjYBKYkb9/+zgdgiAvoSS2fvYQaxmQVUJF787mEHs
  YUF3CXaL34Dsjk4WIDifessQMK8Ak4SZzt/gZVLCChITHn4HszmFHCWWP/yJdh4IaCal6+nME
  PUC0qcnPmEBWK8hMTBFy+gehUlZl9uZoGwKyRmzWpjgrDVJK6e28Q8gVFwFpL2WUjaFzAyrWI
  0K04tKkst0jUy0EsqykzPKMlNzMzRS6zSTdRLLdUtTy0u0TXUSywv1kstLtYrrsxNzknRy0st
  2cQIDN2UYsYpOxh7lv3RO8QoycGkJMr7e3lGshBfUn5KZUZicUZ8UWlOavEhRhkODiUJ3hsbg
  XKCRanpqRVpmTnAOIJJS3DwKInwhu0DSvMWFyTmFmemQ6ROMepyzPzadoBZiCUvPy9VSpz32m
  6gIgGQoozSPLgRsJi+xCgrJczLyMDAIMRTkFqUm1mCKv+KUZyDUUmYl3kP0BSezLwSuE2vgI5
  gAjqiuiAN5IiSRISUVAOTh2dK1vy/eml+nmt/dGmu/yN0eOrddK33Sukm/RVnK6d31E+61NK6
  +pbUv1U2k8+++pd15OWLa9K7w3JmLIzg+9TuFZVz4Qp/gNHE3gcXXMs6fA5sn7Knu8r612ZBe
  RvRGO4zEax/P6dn1ad8WlcQ+N3dvpdfuYfdJ03hpFsVx98Y52X9oRHxJbbtC6K2XsrMEDjEKJ
  IYpLyDxcNL4b9o3tL7/2VO1L2UzbBccjdA5Ypo7YRDlhwX4jIutoh7vth1wP9eTfz6jT4+Zx5
  eFvwhqJ/ytThm78lNtXInqo5PDs6d5LtqxhcP5Wcnj2pazbquXXB26UPGxLP/JlYGtXyd9LNn
  YnP15p0KRVMftYoosRRnJBpqMRcVJwIAPVO/pWQDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-5.tower-591.messagelabs.com!1667809814!249456!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.100.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 19010 invoked from network); 7 Nov 2022 08:30:14 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-5.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 7 Nov 2022 08:30:14 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 860C6100198
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Nov 2022 08:30:14 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 7A3FB100194
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Nov 2022 08:30:14 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 7 Nov 2022 08:30:12 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] openvpn: upgrade 2.5.7 -> 2.5.8
Date: Mon, 7 Nov 2022 16:29:48 +0800
Message-ID: <1667809788-30849-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1667809788-30849-1-git-send-email-wangmy@fujitsu.com>
References: <1667809788-30849-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Nov 2022 08:30:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99451

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
  tls-crypt-v2: bail out if the client key is too small
  Remove useless empty line from CR_RESPONSE message
  Allow running a default configuration with TLS libraries without BF-CBC
  Change command help to match man page and implementation
  Fix OpenVPN querying user/password if auth-token with user expires
  t_client: Allow to force FAIL on prerequisite fails
  t_client.sh: do not require fping6
  Preparing release 2.5.8
  msvc: add branch name and commit hash to version output
  Update the replay-window backtrack log message
  Do not skip ERROR:/SUCCESS: response from management interface
  Fix auth-token usage with management-def-auth
  Allow a few levels of recursion in virtual_output_callback()
  Ensure --auth-nocache is handled during renegotiation
  Purge auth-token as well while purging passwords
  Do not copy auth_token username to itself

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../openvpn/{openvpn_2.5.7.bb => openvpn_2.5.8.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/openvpn/{openvpn_2.5.7.bb => openvpn_2.5.8.bb} (97%)

diff --git a/meta-networking/recipes-support/openvpn/openvpn_2.5.7.bb b/meta-networking/recipes-support/openvpn/openvpn_2.5.8.bb
similarity index 97%
rename from meta-networking/recipes-support/openvpn/openvpn_2.5.7.bb
rename to meta-networking/recipes-support/openvpn/openvpn_2.5.8.bb
index a28c73ab5..b2783d992 100644
--- a/meta-networking/recipes-support/openvpn/openvpn_2.5.7.bb
+++ b/meta-networking/recipes-support/openvpn/openvpn_2.5.8.bb
@@ -14,7 +14,7 @@ SRC_URI = "http://swupdate.openvpn.org/community/releases/${BP}.tar.gz \
 
 UPSTREAM_CHECK_URI = "https://openvpn.net/community-downloads"
 
-SRC_URI[sha256sum] = "08340a389905c84196b6cd750add1bc0fa2d46a1afebfd589c24120946c13e68"
+SRC_URI[sha256sum] = "a6f315b7231d44527e65901ff646f87d7f07862c87f33531daa109fb48c53db2"
 
 # CVE-2020-7224 and CVE-2020-27569 are for Aviatrix OpenVPN client, not for openvpn.
 CVE_CHECK_IGNORE += "CVE-2020-7224 CVE-2020-27569"
-- 
2.25.1


