Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C00FC4332F
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 03:44:59 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web11.3886.1672803896500156542
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Jan 2023 19:44:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Ichfm2In;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1672803894; i=@fujitsu.com;
	bh=wMbVdt6MCwPQMSgn7Nd1/0bRO9imjQUMzkSNzTdgSbU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=Ichfm2InFvu8qY2cWXq0MWeff2kNOvRUQagwRqqHW6OPrX6SZ6ORTEopiTpiFWBpp
	 CzfdUf32h9mpiOEsIQS/VF6hQ+s9YHXQhhyWoS3/CzFt78CGWH9xq7bSGp3/pniLI1
	 ljT0936eOFa9N5nxZIbFsc0jdW3XW3kILT3oa5dd4D/mPfa+dJWLcdOFyy/Dh7tBxu
	 SyoO/7wKcmpbBNZk5V7CHw2sbv80gLsnMbaHKIYK7f2V8sIfRWkHxVgKl4BjwgURxa
	 2mJwCVLkg/H6PIyztPbBXNk0ZbaKfxvuXlaS83uaq2O+5cvY9pbGf5P0IuyaFwWxeb
	 Dy4Wlv4ZK7lBw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrBIsWRWlGSWpSXmKPExsViZ8ORpGv6bUu
  ywddFmhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8akE2/ZCq6bVkw+8pWxgfGFThcjF4eQwENG
  iS03TrN3MXICOZeZJObNjoRI7GaUaFp0iAkkwSYgJXHj/n82EFtEQF9i6ew9zCA2s4CKxIvfP
  UDNHBzCAp4SNz9mg4RZBFQlbs+7zghi8wo4STS0vgIrlxBQkJjy8D2YzSngLHH16WJGiL1OEu
  8+nWSHqBeUODnzCQvEeAmJgy9eQPUqSsy+3MwCYVdIzJrVxgRhq0lcPbeJeQKj4Cwk7bOQtC9
  gZFrFaF6cWlSWWqRraKGXVJSZnlGSm5iZo5dYpZuol1qqm5dfVJKha6iXWF6sl1pcrFdcmZuc
  k6KXl1qyiREYvCnFKQE7GDct+6N3iFGSg0lJlLfk85ZkIb6k/JTKjMTijPii0pzU4kOMMhwcS
  hK86p+AcoJFqempFWmZOcBIgklLcPAoifBmgbTyFhck5hZnpkOkTjEac9xduHcvM0fn/q4DzE
  Isefl5qVLivLe+AJUKgJRmlObBDYJF+CVGWSlhXkYGBgYhnoLUotzMElT5V4ziHIxKwryrQRb
  yZOaVwO17BXQKE9ApSWs2gpxSkoiQkmpgcv3B7n5ATW/O+TlXP2Z7velNzVvdzSvUx9T4W7Y9
  I2S+7v0kp+YUnm1m/UG/2Fw/N9+4aRhlEPXr3ANllhzfKcZ/Co5lXOwNF0irmhzBoPThxvyyb
  xfkT15aLPOzt+dExJoZpYVR7umtknMW77Zo6/q6P/CazzGW7p3MtowL9iV9Ur4y0Rboz7bXoY
  5T2P77Ziz0fmJwkbMx8PjGA7XBGXrhX0NSPqsqm3+capZyRpWrfD5H1pNX02OyGB9M7eX3Lpj
  058FdnTl2EvzLlXdONkzabH1RLP2WccpK38Bp7lEGmpaVB9d/vLey7oDfo4/vnq+1Of6sfcaZ
  E5eklykduaR+9eJTtrXPz7/dV9uixFKckWioxVxUnAgACoHB1GsDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-20.tower-745.messagelabs.com!1672803893!361623!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 14774 invoked from network); 4 Jan 2023 03:44:53 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-20.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 4 Jan 2023 03:44:53 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 19B941B1
	for <openembedded-devel@lists.openembedded.org>; Wed,  4 Jan 2023 03:44:53 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 0E3A17B
	for <openembedded-devel@lists.openembedded.org>; Wed,  4 Jan 2023 03:44:53 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Wed, 4 Jan 2023 03:44:51 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] tcpdump: upgrade 4.99.1 -> 4.99.2
Date: Fri, 30 Dec 2022 13:01:15 +0800
Message-ID: <1672376478-25626-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1672376478-25626-1-git-send-email-wangmy@fujitsu.com>
References: <1672376478-25626-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 04 Jan 2023 03:44:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100386

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
Updated printers:
-----------------
  BGP: Update cease notification decoding to RFC 9003.
  BGP: decode BGP link-bandwidth extended community properly.
  BGP: Fix parsing the AIGP attribute
  BGP: make sure the path attributes don't go past the end of the packet.
  BGP: Shutdown message can be up to 255 bytes length according to rfc9003
  DSA: correctly determine VID.
  EAP: fix some length checks and output issues.
  802.11: Fix the misleading comment regarding "From DS", "To DS" Frame Control Flags.
  802.11: Fetch the CF and TIM IEs a field at a time.
  802.15.4, BGP, LISP: fix some length checks, compiler warnings,
    and undefined behavior warnings.
  PFLOG: handle LINKTYPE_PFLOG/DLT_PFLOG files from all OSes on all OSes.
  RRCP: support more Realtek protocols than just RRCP.
  MPLS: show the EXP field as TC, as per RFC 5462.
  ICMP: redo MPLS Extension code as general ICMP Extension code.
  VQP: Do not print unknown error codes twice.
  Juniper: Add some bounds checks.
  Juniper: Don't treat known DLT_ types as "Unknown".
  lwres: Fix a length check, update a variable type.
  EAP: Fix some undefined behaviors at runtime.
  Ethernet: Rework the length checks, add a length check.
  IPX: Add two length checks.
  Zephyr: Avoid printing non-ASCII characters.
  VRRP: Print the protocol name before any GET_().
  DCCP: Get rid of trailing commas in lists.
  Juniper: Report invalid packets as invalid, not truncated.
  IPv6: Remove an obsolete code in an always-false #if wrapper.
  ISAKMP: Use GET_U_1() to replace a direct dereference.
  RADIUS: Use GET_U_1() to replace a direct dereference.
  TCP: Fix an invalid check.
  RESP: Fix an invalid check.
  RESP: Remove an unnecessary test.
  Arista: Refine the output format and print HwInfo.
  sFlow: add support for IPv6 agent, add a length check.
  VRRP: add support for IPv6.
  OSPF: Update to match the Router Properties registry.
  OSPF: Remove two unnecessary dereferences.
  OSPF: Add support bit Nt RFC3101.
  OSPFv3: Remove two unnecessary dereferences.
  ICMPv6: Fix output for Router Renumbering messages.
  ICMPv6: Fix the Node Information flags.
  ICMPv6: Remove an unused macro and extra blank lines.
  ICMPv6: Add a length check in the rpl_dio_print() function.
  ICMPv6: Use GET_IP6ADDR_STRING() in the rpl_dio_print() function.
  IPv6: Add some checks for the Hop-by-Hop Options header
  IPv6: Add a check for the Jumbo Payload Hop-by-Hop option.
  NFS: Fix the format for printing an unsigned int
  PTP: fix printing of the correction fields
  PTP: Use ND_LCHECK_U for checking invalid length.
  WHOIS: Add its own printer source file and printer function
  MPTCP: print length before subtype inside MPTCP options
  ESP: Add a workaround to a "use-of-uninitialized-value".
  PPP: Add tests to avoid incorrectly re-entering ppp_hdlc().
  PPP: Don't process further if protocol is unknown (-e option).
  PPP: Change the pointer to packet data.
  ZEP: Add three length checks.
  Add some const qualifiers.
Building and testing:
----------------------
  Update config.guess and config.sub.
  Use AS_HELP_STRING macro instead of AC_HELP_STRING.
  Handle some Autoconf/make errors better.
  Fix an error when cross-compiling.
  Use "git archive" for the "make releasetar" process.
  Remove the release candidate rcX targets.
  Mend "make check" on Solaris 9 with Autoconf.
  Address assorted compiler warnings.
  Fix auto-enabling of Capsicum on FreeBSD with Autoconf.
  Treat "msys" as Windows for test exit statuses.
  Clean up some help messages in configure.
  Use unified diff by default.
  Remove awk code from mkdep.
  Fix configure test errors with Clang 15
  CMake: Prevent stripping of the RPATH on installation.
  AppVeyor CI: update Npcap site, update to 1.12 SDK.
  Cirrus CI: Use the same configuration as for the main branch.
  CI: Add back running tcpdump -J/-L and capture, now with Cirrus VMs.
  Remove four test files (They are now in the libpcap tests directory).
  On Solaris, for 64-bit builds, use the 64-bit pcap-config.
  Tell CMake not to check for a C++ compiler.
  CMake: Add a way to request -Werror and equivalents.
  configure: Special-case macOS /usr/bin/pcap-config as we do in CMake.
  configure: Use pcap-config --static-pcap-only if available.
  configure: Use ac_c_werror_flag to force unknown compiler flags to fail.
  configure: Use AC_COMPILE_IFELSE() and AC_LANG_SOURCE() for testing flags.
  Run the test that fails on OpenBSD only if we're not on OpenBSD.
Source code:
-------------
  Fix some snapend-changing routines to protect against pointer underflow.
  Use __func__ from C99 in some function calls.
  Memory allocator: Update nd_add_alloc_list() to a static function.
  addrtoname.c: Fix two invalid tests.
  Use more S_SUCCESS and S_ERR_HOST_PROGRAM in main().
  Add some comments about "don't use GET_IP6ADDR_STRING()".
  Assign ndo->ndo_packetp in pretty_print_packet().
  Add ND_LCHECKMSG_U, ND_LCHECK_U, ND_LCHECKMSG_ZU and ND_LCHECK_ZU macros.
  Update tok2strbuf() to a static function.
  netdissect.h: Keep the link-layer dissectors names sorted.
  setsignal(): Set SA_RESTART on non-lethal signals (REQ_INFO, FLUSH_PCAP)
    to avoid corrupting binary pcap output.
  Use __builtin_unreachable().
  Fail if nd_push_buffer() or nd_push_snaplen() fails.
  Improve code style and fix many typos.
Documentation:
---------------
  Some man page cleanups.
  Update the print interface for the packet count to stdout.
  Note that we require compilers to support at least some of C99.
  Update AIX and Solaris-related specifics.
  INSTALL.txt: Add doc/README.*, delete the deleted win32 directory.
  Update README.md and README.Win32.md.
  Update some comments with new RFC numbers.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../tcpdump/{tcpdump_4.99.1.bb => tcpdump_4.99.2.bb}           | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-networking/recipes-support/tcpdump/{tcpdump_4.99.1.bb => tcpdump_4.99.2.bb} (90%)

diff --git a/meta-networking/recipes-support/tcpdump/tcpdump_4.99.1.bb b/meta-networking/recipes-support/tcpdump/tcpdump_4.99.2.bb
similarity index 90%
rename from meta-networking/recipes-support/tcpdump/tcpdump_4.99.1.bb
rename to meta-networking/recipes-support/tcpdump/tcpdump_4.99.2.bb
index 322a826f0..0a541acfe 100644
--- a/meta-networking/recipes-support/tcpdump/tcpdump_4.99.1.bb
+++ b/meta-networking/recipes-support/tcpdump/tcpdump_4.99.2.bb
@@ -26,8 +26,7 @@ SRC_URI = " \
     file://run-ptest \
 "
 
-SRC_URI[md5sum] = "929a255c71a9933608bd7c31927760f7"
-SRC_URI[sha256sum] = "79b36985fb2703146618d87c4acde3e068b91c553fb93f021a337f175fd10ebe"
+SRC_URI[sha256sum] = "f4304357d34b79d46f4e17e654f1f91f9ce4e3d5608a1badbd53295a26fb44d5"
 
 UPSTREAM_CHECK_REGEX = "tcpdump-(?P<pver>\d+(\.\d+)+)\.tar"
 
-- 
2.25.1


