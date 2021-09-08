Received: from mail3.bemta25.messagelabs.com (mail3.bemta25.messagelabs.com [195.245.230.84])
 by mx.groups.io with SMTP id smtpd.web12.12579.1631112380555564387
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Sep 2021 07:46:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=DRHQ8sqL;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.84, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1631112378; i=@fujitsu.com;
	bh=zyj+blj9iJI4oPAIcoj9meQsixVB75tMhp1Rk0ExFIs=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=DRHQ8sqLHad+7PeH3YqocKm4W0G87U7qVApBZ/W5l2BfFS3Rydsvf7V4TuvdFEn8C
	 S/FC2fOiL5M//Op4OltnMOSAhifQRnXnJ8++3FtyGW8/5UcXeXNnvinYmacJE2jrxb
	 sw82QzeB7CWckJBKgfCCjfiLXizofx7CkJjOEV/N0L/YVNrbnfppb+l4AQIQROGGNc
	 jHd1QlKJJQoeBGb9HeOnuxYEzSj/JXelaoeRp5Bw/XASjDHR2MgDDJocMG0MLILf3F
	 w/fzlGeOpMVlj0QmaEjR4vYX2kdoQ66l3W0PkTwQBHuZp3eGgszT+Zipd7PYE2Unkk
	 oq0TOpvSVD3UA==
Received: from [100.112.196.227] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-b.eu-west-1.aws.symcld.net id 9F/F6-21838-ABCC8316; Wed, 08 Sep 2021 14:46:18 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrCIsWRWlGSWpSXmKPExsViZ8MxRXfnGYt
  Eg7M/tCwuHl7K7MDocW7jCsYAxijWzLyk/IoE1ow1my+yF2zlrtj6/w5zA2MvVxcjF4eQwCwm
  iacr25ghnOOMEv3rZgE5nBxsAmoS02/dYAWxRQT0JZbO3gMWZxZQkXjxu4cdxBYWsJPo+PGdC
  cRmAYpvnjgHrJ5XwEli1aV+FhBbQkBBYsrD98wQcUGJkzOfsEDMkZA4+OIFM0SNosTsy81Q9R
  USs2a1MU1g5J2FpGUWkpYFjEyrGC2SijLTM0pyEzNzdA0NDHQNDY10DS0tdY2MzPUSq3ST9FJ
  LdctTi0t0DfUSy4v1iitzk3NS9PJSSzYxAgMspeD44x2MK9580DvEKMnBpCTKu2u3RaIQX1J+
  SmVGYnFGfFFpTmrxIUYZDg4lCV7NU0A5waLU9NSKtMwcYLDDpCU4eJREeJ2OAKV5iwsSc4sz0
  yFSpxh1OVaeXLyIWYglLz8vVUqcd+5poCIBkKKM0jy4EbDIu8QoKyXMy8jAwCDEU5BalJtZgi
  r/ilGcg1FJmPcJyBSezLwSuE2vgI5gAjqi7aEJyBEliQgpqQYm0XVbA9I42botG9ddC3nte/T
  JjIBZqm6nJxUIXDSokDJj8Nly2MSazzC+USR+/8JjAQo2dbNtTPVLj+5a8Zkv0XtzcjGn0ncG
  xsPOVw+67uOeyLZn0jfGM/OnP7+53HffLPNdLsXRy0P+vhNrii7PP3H+yzLf40Y1Szku8SXd6
  g/3aZs54RyD2ZTfD5qC5PIP5p9pWtoYJrNiQY3QgsOH577+Zv7AZzVz5D0OR6dkrQX3H9j2V7
  wN11XdrLDJSOOh0R69MgPOV5e+pZwwvfj4qmHx69y2aTxzpDZqVi58OmHTHdlHr3Y8v5kedrR
  y9rHXxbYZVUL7/hwUdbDRFSsM4asxY3HV1Gqdl6D+uaNUiaU4I9FQi7moOBEAdksjhzcDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-23.tower-285.messagelabs.com!1631112377!54036!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 28157 invoked from network); 8 Sep 2021 14:46:17 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-23.tower-285.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 8 Sep 2021 14:46:17 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 188EkHrQ027691
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Wed, 8 Sep 2021 15:46:17 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.23; Wed, 8 Sep 2021 15:46:15 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] cppzmq: upgrade 4.7.1 -> 4.8.0
Date: Wed, 8 Sep 2021 22:45:59 +0800
Message-ID: <1631112363-19399-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Fixed:

Fix MSYS libzmq discovery (#510)
Fix handshake event don't need DRAFT API in libzmq v4.3.0 and above (#509)
Use chrono duration for poll default timeout (#497)
context_t close no longer uses deprecated function (#490)
Fix for potential memory leak in monitor_t::check_event (#482)
Fix if constexpr warnings on MSVC (#460)
Fix conversion warnings (#459)
Deprecate confusing connected() function (#458)
Added:

Add all draft socket types up to libzmq 4.3.4 (#488)
Add support for socket_ref to multipart_t ctor/send/recv (#487, #470)
Expose zmq::fd_t (#452)
Add poller_t::size function (#451)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb b/meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb
index 61ea68a605..270df6f0e8 100644
--- a/meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb
+++ b/meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb
@@ -4,10 +4,10 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=db174eaf7b55a34a7c89551197f66e94"
 DEPENDS = "zeromq"
 
-SRCREV = "76bf169fd67b8e99c1b0e6490029d9cd5ef97666"
-PV = "4.7.1"
+SRCREV = "267d300d1c99381a0fbc7e060ae2899e51f5e425"
+PV = "4.8.0"
 
-SRC_URI = "git://github.com/zeromq/cppzmq.git;branch=bugfix-4-7-1"
+SRC_URI = "git://github.com/zeromq/cppzmq.git;branch=master"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1

