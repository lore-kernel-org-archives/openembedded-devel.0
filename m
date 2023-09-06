Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EC0CEB8FB6
	for <webhook@archiver.kernel.org>; Wed,  6 Sep 2023 10:58:01 +0000 (UTC)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
 by mx.groups.io with SMTP id smtpd.web10.5797.1693997876171391431
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Sep 2023 03:57:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=HHkjribN;
 spf=pass (domain: gmail.com, ip: 209.85.128.176, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-58d41109351so10955887b3.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 06 Sep 2023 03:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693997875; x=1694602675; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TIhjbeK7FPI6oDaag/hFICS00X/ntVXpQxn1cx2UX4M=;
        b=HHkjribN+KGPWYY9yFD2VNDbI/Y37KiYsCVGcYi5daHj2OJaBYK4Qt8YgyLbNqnuzO
         MMPnUGfRfVIRtJcWcf7AfGVochd51W9/0LwllpzxiDpOhqKL7ELcHQRQvWcgMqZJtsaW
         ImBhsPC84DvKUdvcnnhZfqtDuBVgd1TNEKEGxa0Cm/uJj2aY6va203lbiR4h2ZqQxhY2
         YqIfQQ4coxr2i//39iQ+f3D67kh5Rm1Kkpnq50SzSIug8xKRvO4QRCqQJRnK++pfGSao
         l5u4qjQknyx4lpowTXJnpxjrlLYeL9+Jp96GSI3pLiNnv5hqyoaE3iOkRRGWnPoMlHo4
         mc4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693997875; x=1694602675;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TIhjbeK7FPI6oDaag/hFICS00X/ntVXpQxn1cx2UX4M=;
        b=XDGY0JII6BZW8vS/pvSnAas1yWIgz/PAnmMlLsc1yEHAQX84KAn6Fm5BpLiYs70tM/
         M6tay9KvziLjQyqPn7lAVAzbEyaBPnltUe0vWQczjxukzfdCWpoQ739S0ikvPAVa+hyp
         kDZ0uoPhc9fYotTfPfqqNWKbgINouTeA2rSXc3xT1nrZ+L8dLAZU8HTFnYFILnNGyyWe
         4D+m6xKtGa+ZZhVrN1gIzz8DXrCPn6e5baIZR9kf1GPJq6iSx00u5lHxWU/SdIL2S7Te
         bdsczOIAbf5KRBPupxoRcbcKIIJia7nwnaHHs/PF4E4WZ+HHHg/M0ELmhFO9wBSvH1qL
         rxbw==
X-Gm-Message-State: AOJu0YyNukyc5CYKKT2xEY8UHuCOIjaK4JvXFeVFKapcop42JSbnad0L
	mUGrI7Wj2RnGA+3FuyyugEHe+sQhmjY=
X-Google-Smtp-Source: AGHT+IHrn6VQJJtBeAajGMKA6Bet9Eh775lK4Hy6HqbHPmT+Hg8UTJvg8rAUw1MNZJskocAYCvoiMA==
X-Received: by 2002:a0d:db4f:0:b0:583:9db5:7e89 with SMTP id d76-20020a0ddb4f000000b005839db57e89mr21740888ywe.24.1693997875088;
        Wed, 06 Sep 2023 03:57:55 -0700 (PDT)
Received: from keaua.caveonetworks.com ([2600:1700:9190:ba10:5654:1c56:e678:3eb1])
        by smtp.gmail.com with ESMTPSA id dg4-20020a05690c0fc400b0059590440338sm2425687ywb.43.2023.09.06.03.57.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Sep 2023 03:57:54 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][kirkstone][PATCH 1/3] tcpdump: upgrade 4.99.1 -> 4.99.2
Date: Wed,  6 Sep 2023 06:57:52 -0400
Message-Id: <20230906105754.847690-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Sep 2023 10:58:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104775

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
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 68db0a388005c319784ec3b6ca533d0d9a142554)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../tcpdump/{tcpdump_4.99.1.bb => tcpdump_4.99.2.bb}           | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-networking/recipes-support/tcpdump/{tcpdump_4.99.1.bb => tcpdump_4.99.2.bb} (90%)

diff --git a/meta-networking/recipes-support/tcpdump/tcpdump_4.99.1.bb b/meta-networking/recipes-support/tcpdump/tcpdump_4.99.2.bb
similarity index 90%
rename from meta-networking/recipes-support/tcpdump/tcpdump_4.99.1.bb
rename to meta-networking/recipes-support/tcpdump/tcpdump_4.99.2.bb
index 322a826f07..0a541acfea 100644
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
2.34.1


