Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB0A2C43334
	for <webhook@archiver.kernel.org>; Mon,  6 Jun 2022 12:25:24 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com
 [195.245.230.17])
 by mx.groups.io with SMTP id smtpd.web08.31336.1654518316279083022
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Jun 2022 05:25:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=rche/ANa;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.17,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1654518314; i=@fujitsu.com;
	bh=lELA3J8keKW0kJT0n7mjNyGKdizeRNngmRXpqIq0cUs=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=rche/ANaZSSJ1UJ1Obqqeai3W+zAAMs220jh5q85c37KXK0JPgSbq0xidbsRE8HNl
	 MEDINwhfchorhFZNfzH4JU5OHWZBFDcMLL4DWGo9Jb6yW6tNckO2YZuDu+pxjXRFj/
	 AG1WaOsw9rstpu7WysDWkwV7jorS6GH/CsegGUyzQAPbdSMo0YFTUteZovWMbgS0AK
	 dc3oXNvt+Q/yOhZ+6KRiCMC2S12VPlseXoI1Xy+5bPeAuXLaWRAPQUSI0D6rnXeNg0
	 Vh9hvGDAQt3v2YdoX4PFGBZ6OkIfSbT59wZMMcJl0E1CdD80goAA3My1oWyZrKMgaq
	 EtLs9YOmTjxxg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrAIsWRWlGSWpSXmKPExsViZ8MxSVfr09w
  kg96bnBYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8br8+fZCw7rVBx4cIC9gfGMahcjF4eQwBNG
  iXU3zjFDOBeYJJpXbGOBcHYzSrzYtR4ow8nBJqAmMf3WDVYQW0RAX2Lp7D1gcWYBFYkXv3vYQ
  WxhAU+JiV3bgeIcHCxA8etrM0DCvAKOErdufGcDsSUEFCSmPHzPDBEXlDg58wkLxBgJiYMvXj
  BD1ChKzL7czAJhV0jMmLENqldN4uq5TcwTGPlnIWmfhaR9ASPTKkarpKLM9IyS3MTMHF1DAwN
  dQ0NTXSBpaqKXWKWbqJdaqlueWlyia6iXWF6sl1pcrFdcmZuck6KXl1qyiREYlCnFDLN2MM7q
  +6l3iFGSg0lJlNf+2twkIb6k/JTKjMTijPii0pzU4kOMMhwcShK8dR+AcoJFqempFWmZOcAIg
  UlLcPAoifBavwNK8xYXJOYWZ6ZDpE4x2nNcvXJlLzPH1Nn/9jNzLAeTM7+2HWAWYsnLz0uVEu
  c9DjJVAKQtozQPbigsoi8xykoJ8zIyMDAI8RSkFuVmlqDKv2IU52BUEuZ9ADKFJzOvBG73K6C
  zmIDO8nkwB+SskkSElFQD02Tz6RnnWBgd1XZs8JG096ivnZH0/najpMRbfSmLlMvb2oOMD3es
  F1jOZyu8Z2N7z5+L7LM4z62qWO2+fqHqdb6WsEtmEsK+j7olL77kEbDfYdP75MzWyjTB5Xzdq
  Qtvr/589eMK56vtF+uu3ao9kHwnvydJhoPr8rI3LKmZv42DvQRfGeZ3fVhcyfwt915YW1zAr5
  u33FRqddomnTKSe8Zs6Pb7R+LcHRNzWnIbZn/85tXK02kwTUFo+71fzrGrXNkaV34oX3w2LCl
  UbPq/aM+Fpx/2uD2qYtOvml7S8n9HSElGaeu289KdXIFe9qZH7+ekz/o39ebTD/dKDnwK7kvd
  tXj96tjCIyV593v6lFiKMxINtZiLihMB8CQHE2MDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-19.tower-585.messagelabs.com!1654518313!149080!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 27140 invoked from network); 6 Jun 2022 12:25:14 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-19.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 6 Jun 2022 12:25:14 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id AC7331009B3
	for <openembedded-devel@lists.openembedded.org>;
 Mon,  6 Jun 2022 13:25:13 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 9ECA81009AE
	for <openembedded-devel@lists.openembedded.org>;
 Mon,  6 Jun 2022 13:25:13 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 6 Jun 2022 13:24:51 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] unbound: upgrade 1.15.0 -> 1.16.0
Date: Mon, 6 Jun 2022 20:24:39 +0800
Message-ID: <1654518280-9166-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Jun 2022 12:25:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97428

Changelog:
==========
This release has EDE support, for extended EDNS error reporting,
it fixes unsupported ZONEMD algorithms to load, and has more bug fixes.

The EDE errors can be turned on by 'ede: yes', it is default disabled.
Validation errors and other errors are then reported. If you also want
stale answers for expired responses to have an error code, the option
'ede-serve-expired: yes' can be used.

Features
- Merge PR #604: Add basic support for EDE (RFC8914).

Bug Fixes
- Fix #412: cache invalidation issue with CNAME+A.
- Fix that TCP interface does not use TLS when TLS is also configured.
- Fix #624: Unable to stop Unbound in Windows console (does not
  respond to CTRL+C command).
- Fix #618: enabling interface-automatic disables DNS-over-TLS.
  Adds the option to list interface-automatic-ports.
- Remove debug info from #618 fix.
- Fix #628: A rpz-passthru action is not ending RPZ zone processing.
- Fix for #628: fix rpz-passthru for qname trigger by localzone type.
- Fix that address not available is squelched from the logs for
  udp connect failures. It is visible on verbosity 4 and more.
- Merge #631 from mollyim: Replace OpenSSL's ERR_PACK with
  ERR_GET_REASON.
- Fix to detect that no IPv6 support means that IPv6 addresses are
  useless for delegation point lookups.
- update Makefile dependencies.
- Fix check interface existence for support detection in remote lookup.
- Fix #633: Document unix domain socket support for unbound-control.
- Fix for #633: updated fix with new text.
- Fix edns client subnet to add the option based on the option list,
  so that it is not state dependent, after the state fix of #605 for
  double EDNS options.
- Fix for edns client subnet option add fix in removal code, from review.
- Fix #630: Unify the RPZ log messages.
- Merge #623 from rex4539: Fix typos.
- Fix pythonmod for change in iter_dp_is_useless function prototype.
- Fix compile warnings for printf ll format on mingw compile.
- Merge PR #632 from scottrw93: Match cnames in ipset.
- Various fixes for #632: variable initialisation, convert the qinfo
  to str once, accept trailing dot in the local-zone ipset option.
- Fix #637: Integer Overflow in sldns_str2period function.
- Fix for #637: fix integer overflow checks in sldns_str2period.
- Fix configure for python to use sysutils, because distutils is
  deprecated. It uses sysutils when available, distutils otherwise.
- Merge #644: Make 'install-lib' make target install the pkg-config
  file.
- Fix to ensure uniform handling of spaces and tabs when parsing RRs.
- Fix to describe auth-zone and other configuration at the local-zone
  configuration option, to allow for more broadly view of the options.
- Merge PR #648 from eaglegai: fix -q doesn't work when use with
  'unbound-control stats_shm'.
- Fix #651: [FR] Better logging for refused queries.
- Fix spelling error in comment in sldns_str2wire_svcparam_key_lookup.
- Fix zonemd check to allow unsupported algorithms to load.
  If there are only unsupported algorithms, or unsupported schemes,
  and no failed or successful other ZONEMD records, or malformed
  or bad ZONEMD records, the unsupported records allow the zone load.
- Fix zonemd unsupported algo check.
- Fix zonemd unsupported algo check reason to not copy to next record,
  and check for success for debug printout.
- Fix zonemd unsupported algo check to print unsupported reason before
  zeroing it.
- Fix zonemd unsupported algo check to set reason to NULL before the
  check routine, but after malformed checks, to get the correct NULL
  output when the digest matches.
- Fix #670: SERVFAIL problems with unbound 1.15.0 running on
  OpenBSD 7.1.
- Fix Python build in non-source directory; based on patch by
  Michael Tokarev.
- Fix #673: DNS over TLS: error: SSL_handshake syscall: No route to
  host.
- Merge #677: Allow using system certificates not only on Windows,
  from pemensik.
- For #677: Added tls-system-cert to config parser and documentation.
- Fix #417: prefetch and ECS causing cache corruption when used
  together.
- Fix #678: [FR] modify behaviour of unbound-control rpz_enable zone,
  by updating unbound-control's documentation.
- Fix typos in config_set_option for the 'num-threads' and
  'ede-serve-expired' options.
- Fix to silence test for ede error output to the console from the
  test setup script.
- Fix ede test to not use default pidfile, and use local interface.
- Fix some lint type warnings.
- Fix #684: [FTBS] configure script error with libmnl on openSUSE 15.3
  (and possibly other distributions)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../unbound/{unbound_1.15.0.bb => unbound_1.16.0.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/unbound/{unbound_1.15.0.bb => unbound_1.16.0.bb} (96%)

diff --git a/meta-networking/recipes-support/unbound/unbound_1.15.0.bb b/meta-networking/recipes-support/unbound/unbound_1.16.0.bb
similarity index 96%
rename from meta-networking/recipes-support/unbound/unbound_1.15.0.bb
rename to meta-networking/recipes-support/unbound/unbound_1.16.0.bb
index e5b649164..cf59d2918 100644
--- a/meta-networking/recipes-support/unbound/unbound_1.15.0.bb
+++ b/meta-networking/recipes-support/unbound/unbound_1.16.0.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5308494bc0590c0cb036afd781d78f06"
 SRC_URI = "git://github.com/NLnetLabs/unbound.git;protocol=http;branch=master;protocol=https \
 	file://0001-contrib-add-yocto-compatible-init-script.patch \
 "
-SRCREV = "c29b0e0a96c4d281aef40d69a11c564d6ed1a2c6"
+SRCREV = "edc1d07718fb0ecabf9ddd3cf65503de1810834c"
 
 inherit autotools pkgconfig systemd update-rc.d
 
-- 
2.25.1


