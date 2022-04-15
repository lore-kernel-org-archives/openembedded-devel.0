Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A85F9C64EDD
	for <webhook@archiver.kernel.org>; Mon, 18 Apr 2022 14:26:02 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web09.2606.1649986720833239300
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Apr 2022 18:38:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=nvjSlDRP;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1649986719; i=@fujitsu.com;
	bh=/Tfb2QcJydsrPAlBe8OHUHyIkyi2D6s804VRE8Bwpak=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=nvjSlDRP1tap/vDi/do7e2/Ib2cXgc/PkGhOAuI9Hh9fccATTKAS4R7mU5g1bBeOF
	 TBvIjhg/FXKou8UJW2HDpK1Q52Z4Z2pDbfQ8aGFlzM1mGvJk4CdUtaWNzomc0v+qoy
	 77Dr7uTj7YqwCrTzzk17bIFns8Gk7fBb2PgSvac5Jk4zgI3oT9255cxlcMqjNZBpRi
	 N2r9f3Hw3OexXxZUCMTN3fINIzuVakewWWc7m6bLW29pDxqHhTXVjYG5EPiYAbWZgc
	 JIh74ooP7ZJUHSIeaupK84iF58W6fQbzydhnog9erJutg5CX6r/V0prIaxqJSVSt4g
	 sY1hB1RXbp9Bw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrFIsWRWlGSWpSXmKPExsViZ8MxSXfumYg
  kgykTTCwuHl7K7MDocW7jCsYAxijWzLyk/IoE1ow39/wKroRUbF17grGB8YVbFyMXh5DAE0aJ
  5x8ms0M4F5gkDs2ZAOXsYZT49O8mWxcjJwebgJrE9Fs3WEFsEQF9iaWz9zCD2MwCKhIvfvcAN
  XBwCAt4SpzrEAYJswioSrzbPQOslVfASWLBwr1gtoSAgsSUh+/BWjkFnCVOzpkINlIIqKb/4X
  8WiHpBiZMzn7BAjJeQOPjiBTNEr6LE7MvNLBB2hcSsWW1MELaaxNVzm5gnMArOQtI+C0n7Aka
  mVYy2SUWZ6RkluYmZObqGBga6hoamumYWukYmeolVuol6qaW6yal5JUWJQFm9xPJivdTiYr3i
  ytzknBS9vNSSTYzAQE4pdpHYwXiz76feIUZJDiYlUd6p8RFJQnxJ+SmVGYnFGfFFpTmpxYcYZ
  Tg4lCR4558GygkWpaanVqRl5gCjCiYtwcGjJMIrsBMozVtckJhbnJkOkTrFaM9x9cqVvcwcN8
  Dkgt/XgOTfT3/3Mgux5OXnpUqJ80aCTBUAacsozYMbCksClxhlpYR5GRkYGIR4ClKLcjNLUOV
  fMYpzMCoJ8zaCTOHJzCuB2/0K6CwmoLO+rQoFOaskESEl1cAU/aGejZ9lUhKbxYegIAY/46Bq
  HzXWeH3lpCW36h+pFQUWJHFNOX1BX31TvUbU1VY38ZwD5cF7T/0zrZPg1vge/tSvZ6tr7Ix6C
  RXl6Olu396YzTq+b8tBB3v2pYvtvCbf5tCpidtdVXzZ+N5rhyiuB3u6Pn6W7Ls80+kBY43av/
  OcmxsNF6n17Hxx5c3N8opFqy2eqE13Ybn/VG+2+A3BBeurf/JcEF8lYOa4f0d85bOjTRIyk+a
  abuc+nnZPUT/Ka3UqYw6X45ULn8uk5tZ3TfGJXpS69L4l65MXG+4Le77wjG2T/+56MZWxxuPC
  42zvRTEsZhrMrXzbrpTuYuBYeyHE+15QTZaLT8Tr3UosxRmJhlrMRcWJADGnVoR9AwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-5.tower-545.messagelabs.com!1649986717!34008!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 26736 invoked from network); 15 Apr 2022 01:38:37 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-5.tower-545.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 15 Apr 2022 01:38:37 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 609D8100472
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Apr 2022 02:38:37 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 53C90100457
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Apr 2022 02:38:37 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Fri, 15 Apr 2022 02:38:07 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] unbound: upgrade 1.13.2 -> 1.15.0
Date: Fri, 15 Apr 2022 09:37:52 +0800
Message-ID: <1649986673-24913-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1649986673-24913-1-git-send-email-wangmy@fujitsu.com>
References: <1649986673-24913-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 18 Apr 2022 14:26:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96661

Changelog:
=========
Features
- Fix #596: unset the RA bit when a query is blocked by an unbound
  RPZ nxdomain reply. The option rpz-signal-nxdomain-ra allows to
  signal that a domain is externally blocked to clients when it
  is blocked with NXDOMAIN by unsetting RA.
- Add rpz: for-downstream: yesno option, where the RPZ zone is
  authoritatively answered for, so the RPZ zone contents can be
  checked with DNS queries directed at the RPZ zone.
- Merge PR #616: Update ratelimit logic. It also introduces
  ratelimit-backoff and ip-ratelimit-backoff configuration options.
- Change aggressive-nsec default to yes.
- Merge #401: RPZ triggers. This add additional RPZ triggers,
  unbound supports a full set of rpz triggers, and this now
  includes nsdname, nsip and clientip triggers. Also actions
  are fully supported, and this now includes the tcp-only action.
- Merge #519: Support for selective enabling tcp-upstream for
  stub/forward zones.
- Merge PR #514, from ziollek: Docker environment for run tests.
- Support using system-wide crypto policies.
- Fix that --with-ssl can use "/usr/include/openssl11" to pass the
  location of a different openssl version.
- Merged #41 from Moritz Schneider: made outbound-msg-retry
  configurable.
- Implement RFC8375: Special-Use Domain 'home.arpa.'.
- Merge PR #555 from fobser: Allow interface names as scop

Bug Fixes
- Fix compile warning for if_nametoindex on windows 64bit.
- Merge PR #581 from fobser: Fix -Wmissing-prototypes and -Wshadow
  warnings in rpz.
- Fix validator debug output about DS support, print correct algorithm.
- Add code similar to fix for ldns for tab between strings, for
  consistency, the test case was not broken.
- Allow local-data for classes other than IN to inherit a configured
  local-zone's type if possible, instead of defaulting to type
  transparent as per the implicit rule.
- Fix to pick up other class local zone information before unlock.
- Add missing configure flags for optional features in the
  documentation.
- Fix Unbound capitalization in the documentation.
- Fix #591: Unbound-anchor manpage links to non-existent license file.
- contrib/aaaa-filter-iterator.patch file renewed diff content to
  apply cleanly to the current coderepo for the current code version.
- Fix to add test for rpz-signal-nxdomain-ra.
- Fix #596: only unset RA when NXDOMAIN is signalled.
- Fix that RPZ does not set RD flag on replies, it should be copied
  from the query.
- Fix for #596: fix that rpz return message is returned and not just
  the rcode from the iterator return path. This fixes signal unset RA
  after a CNAME.
- Fix unit tests for rpz now that the AA flag returns successfully from
  the iterator loop.
- Fix for #596: add unit test for nsdname trigger and signal unset RA.
- Fix for #596: add unit test for nsip trigger and signal unset RA.
- Fix #598: Fix unbound-checkconf fatal error: module conf
  'respip dns64 validator iterator' is not known to work.
- Fix for #596: Fix rpz-signal-nxdomain-ra to work for clientip
  triggered operation.
- Merge #600 from pemensik: Change file mode before changing file
  owner.
- Fix prematurely terminated TCP queries when a reply has the same ID.
- For #602: Allow the module-config "subnetcache validator cachedb
  iterator".
- Fix EDNS to upstream where the same option could be attached
  more than once.
- Add a region to serviced_query for allocations.
- For dnstap, do not wakeupnow right there. Instead zero the timer to
  force the wakeup callback asap.
- Fix #610: Undefine-shift in sldns_str2wire_hip_buf.
- Fix #588: Unbound 1.13.2 crashes due to p->pc is NULL in
  serviced_udp_callback.
- Merge PR #612: TCP race condition.
- Test for NSID in SERVFAIL response due to DNSSEC bogus.
- Fix #599: [FR] RFC 9156 (obsoletes RFC 7816), by noting the new RFC
  document.
- Fix tls-* and ssl-* documented alternate syntax to also be available
  through remote-control and unbound-checkconf.
- Better cleanup on failed DoT/DoH listening socket creation.
- iana portlist update.
- Fix review comment for use-after-free when failing to send UDP out.
- Merge PR #603 from fobser: Use OpenSSL 1.1 API to access DSA and RSA
  internals.
- Merge PR #532 from Shchelk: Fix: buffer overflow bug.
- Merge PR #617: Update stub/forward-host notation to accept port and
  tls-auth-name.
- Update stream_ssl.tdir test to also use the new forward-host
  notation.
- Fix header comment for doxygen for authextstrtoaddr.
- please clang analyzer for loop in test code.
- Fix docker splint test to use more portable uname.
- Update contrib/aaaa-filter-iterator.patch with diff for current
  software version.
- Fix for #611: Integer overflow in sldns_wire2str_pkt_scan.
- Add test tool readzone to .gitignore.
- Merge #521: Update mini_event.c.
- Merge #523: fix: free() call more than once with the same pointer.
- For #519: note stub-tcp-upstream and forward-tcp-upstream in
  the example configuration file.
- For #519: yacc and lex. And fix python bindings, and test program
  unbound-dnstap-socket.
- For #519: fix comments for doxygen.
- Fix to print error from unbound-anchor for writing to the key
  file, also when not verbose.
- For #514: generate configure.
- Fix for #431: Squelch permission denied errors for udp connect,
  and udp send, they are visible at higher verbosity settings.
- Fix zonemd verification of key that is not in DNS but in the zone
  and needs a chain of trust.
- zonemd, fix order of bogus printout string manipulation.
- Fix to support harden-algo-downgrade for ZONEMD dnssec checks.
- Merge PR #528 from fobser: Make sldns_str2wire_svcparam_buf()
  static.
- Fix #527: not sending quad9 cert to syslog (and may be more).
- Fix sed script in ssldir split handling.
- Fix #529: Fix: log_assert does nothing if UNBOUND_DEBUG is
  undefined.
- Fix #531: Fix: passed to proc after free.
- Fix #536: error: RPZ: name of record (drop.spamhaus.org.rpz.local.)
  to insert into RPZ.
- Fix the stream wait stream_wait_count_lock and http2 buffer locks
  setup and desetup from race condition.
- Fix RPZ locks. Do not unlock zones lock if requested and rpz find
  zone does not find the zone. Readlock the clientip that is found
  for ipbased triggers. Unlock the nsdname zone lock when done.
  Unlock zone and ip in rpz nsip and nsdname callback. Unlock
  authzone and localzone if clientip found in rpz worker call.
- Fix compile warning in libunbound for listen desetup routine.
- Fix asynclook unit test for setup of lockchecks before log.
- Fix #533: Negative responses get cached even when setting
  cache-max-negative-ttl: 1
- Fix tcp fastopen failure when disabled, try normal connect instead.
- Fix #538: Fix subnetcache statistics.
- Small fixes for #41: changelog, conflicts resolved,
  processQueryResponse takes an iterator env argument like other
  functions in the iterator, no colon in string for set_option,
  and some whitespace style, to make it similar to the rest.
- Fix for #41: change outbound retry to int to fix signed comparison
  warnings.
- Fix root_anchor test to check with new icannbundle date.
- Fix initialisation errors reported by gcc sanitizer.
- Fix lock debug code for gcc sanitizer reports.
- Fix more initialisation errors reported by gcc sanitizer.
- Fix crosscompile on windows to work with openssl 3.0.0 the
  link with ws2_32 needs -l:libssp.a for __strcpy_chk.
  Also copy results from lib64 directory if needed.
- For crosscompile on windows, detect 64bit stackprotector library.
- Fix crosscompile shell syntax.
- Fix crosscompile windows to use libssp when it exists.
- For the windows compile script disable gost.
- Fix that on windows, use BIO_set_callback_ex instead of deprecated
  BIO_set_callback.
- Fix crosscompile script for the shared build flags.
- Fix to add example.conf note for outbound-msg-retry.
- Fix chaos replies to have truncation for short message lengths,
  or long reply strings.
- Fix to protect custom regional create against small values.
- Fix #552: Unbound assumes index.html exists on RPZ host.
- Fix that forward-zone name is documented as the full name of the
  zone. It is not relative but a fully qualified domain name.
- Fix analyzer review failure in rpz action override code to not
  crash on unlocking the local zone lock.
- Fix to remove unused code from rpz resolve client and action
  function.
- Merge #565: unbound.service.in: Disable ProtectKernelTunables again.
- Fix for #558: fix loop in comm_point->tcp_free when a comm_point is
  reclaimed more than once during callbacks.
- Fix for #558: clear the UB_EV_TIMEOUT bit before adding an event.
- Improve EDNS option handling, now also works for synthesised
  responses such as local-data and server.id CH TXT responses.
- Merge PR #570 from rex4539: Fix typos.
- Fix for #570: regen aclocal.m4, fix configure.ac for spelling.
- Fix to make python module opt_list use opt_list_in.
- Fix #574: unbound-checkconf reports fatal error if interface names
  are used as value for interfaces:
- Fix #574: Review fixes for it.
- Fix #576: [FR] UB_* error codes in unbound.h
- Fix #574: Review fix for spelling.
- Fix to remove git tracking and ci information from release tarballs.
- iana portlist update.
- Merge PR #511 from yan12125: Reduce unnecessary linking.
- Merge PR #493 from Jaap: Fix generation of libunbound.pc.
- Merge PR #562 from Willem: Reset keepalive per new tcp session.
- Merge PR #522 from sibeream: memory management violations fixed.
- Merge PR #530 from Shchelk: Fix: dereferencing a null pointer.
- Fix #454: listen_dnsport.c:825: error: 'IPV6_TCLASS' undeclared.
- Fix #574: Review fixes for size allocation.
- Fix doc/unbound.doxygen to remove obsolete tag warning.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../unbound/{unbound_1.13.2.bb => unbound_1.15.0.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/unbound/{unbound_1.13.2.bb => unbound_1.15.0.bb} (96%)

diff --git a/meta-networking/recipes-support/unbound/unbound_1.13.2.bb b/meta-networking/recipes-support/unbound/unbound_1.15.0.bb
similarity index 96%
rename from meta-networking/recipes-support/unbound/unbound_1.13.2.bb
rename to meta-networking/recipes-support/unbound/unbound_1.15.0.bb
index 61a75d71f4..e5b649164d 100644
--- a/meta-networking/recipes-support/unbound/unbound_1.13.2.bb
+++ b/meta-networking/recipes-support/unbound/unbound_1.15.0.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5308494bc0590c0cb036afd781d78f06"
 SRC_URI = "git://github.com/NLnetLabs/unbound.git;protocol=http;branch=master;protocol=https \
 	file://0001-contrib-add-yocto-compatible-init-script.patch \
 "
-SRCREV = "8e538dcaa8df2d0fab8ff3dcf94ac1f972450b66"
+SRCREV = "c29b0e0a96c4d281aef40d69a11c564d6ed1a2c6"
 
 inherit autotools pkgconfig systemd update-rc.d
 
-- 
2.25.1


