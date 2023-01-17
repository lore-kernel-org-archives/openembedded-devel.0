Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE2B3C63797
	for <webhook@archiver.kernel.org>; Tue, 17 Jan 2023 07:17:12 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web11.191257.1673939823478428272
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Jan 2023 23:17:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=pmEZDapY;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1673939821; i=@fujitsu.com;
	bh=cIuXjUG8bz/u/tZUuTBoRBqtP07rDe5tlc9f//GcS6Y=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=pmEZDapYD/jwDeIQwdTErWxOrIXEyT+B47v5mSbSWXAV74CEnMNyPCtPwbSowkQ0/
	 j1KMNZU5nrlUh9qrpAmR3bfbh6vjL5jx4d6vtL7ihvLOAtpo+TCI+WfAiVnWc0mGh+
	 j2ghSfDDQjTtG2246y33At2/lXIpqgS0T4HarQeQzveHgM7XMxKbASgN9tQ5eYt+5P
	 s2PHBneFZmgc/wWUv3ueadjwPKnHAx6WcWA6/QWxwo3bTHB9WSDXolEvioFnhjVXuG
	 Y6DJenF+rVDF++8BJJtItLIYjDRfMSDjMEkwZBqBCfyfQ1ajaIJ2IpQL6zTia993TO
	 cL2j/o8RbnBMg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrMIsWRWlGSWpSXmKPExsViZ8OxWTfX+1i
  ywbPTnBYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8a/L2dZC3qVK6ZcPMrWwLhItouRi0NI4CGj
  xMrOe2wQzhUmiW27n7FAOHsZJbZePsjaxcjJwSYgJXHj/n82EFtEQF9i6ew9zCA2s4CKxIvfP
  ewgtrCAo8SuNa1gNSwCqhK3F68Dq+EVcJJ4/OY+C4gtIaAgMeXhe6A4BwengLNE21szkLAQUM
  mTaX2sEOWCEidnPmGBGC8hcfDFC2aIVkWJ2ZebocZUSrR++AVlq0lcPbeJeQKj4Cwk7bOQtC9
  gZFrFaF6cWlSWWqRraKGXVJSZnlGSm5iZo5dYpZuol1qqm5dfVJKha6iXWF6sl1pcrFdcmZuc
  k6KXl1qyiREYvinFKQE7GDct+6N3iFGSg0lJlPek6bFkIb6k/JTKjMTijPii0pzU4kOMMhwcS
  hK8p7yAcoJFqempFWmZOcBYgklLcPAoifCGWwKleYsLEnOLM9MhUqcYdTmuXrmyl1mIJS8/L1
  VKnPcayAwBkKKM0jy4EbC4vsQoKyXMy8jAwCDEU5BalJtZgir/ilGcg1FJmPeJB9AUnsy8Erh
  Nr4COYAI6wqPkKMgRJYkIKakGJmGDh7PO7lp2fMpvm/QAdrEHUsuZJW/k8MjktYUx3LAK+9P9
  oohh27dVSbe+nW9PVtD0mP/n1ad/vTx7imbzmW6dfoMrXehCj2lW/KI3KcxfkxtCZvQcumlf8
  2knh/rFeydX/xAy6imY52z72eCb6q9kZ1l1bx+FeI2VmR2W05wTnhqJxku6ztV9JXLmRufJio
  cHPheX1XQIpRsyKV9X3nPIsvfG3Lsnp3yYs8zseMVJXVchmx0To9ScD6zZyxQ3P4Pp86ET5/9
  MDDdq7nmwc7qhrtPUi08893hGyb5V/f+TIZP7jGQ8I28IZxwH19/DOfyFN2eZyQlHnuWVSbnS
  7Lxz5SW1UtMsO7ulFk/9lFiKMxINtZiLihMBXmhDLmYDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-20.tower-745.messagelabs.com!1673939820!378650!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.102.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 9580 invoked from network); 17 Jan 2023 07:17:01 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-20.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 17 Jan 2023 07:17:01 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 8F5C3150
	for <openembedded-devel@lists.openembedded.org>; Tue, 17 Jan 2023 07:17:00 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 832E973
	for <openembedded-devel@lists.openembedded.org>; Tue, 17 Jan 2023 07:17:00 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Tue, 17 Jan 2023 07:16:58 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] librelp: upgrade 1.10.0 -> 1.11.0
Date: Tue, 17 Jan 2023 15:16:23 +0800
Message-ID: <1673939785-20072-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1673939785-20072-1-git-send-email-wangmy@fujitsu.com>
References: <1673939785-20072-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Jan 2023 07:17:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100601

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- code cleanup
  During the initial librelp implementation it was thought about an
  auto-retry feature (whatever that means). Variable bAutoRetry was
  created to control that behaviour. It's default was 0 (inactive).
  Some code has been written to evaluate that variable and act
  accordingly. However, no setter method for this variable was
  created and it was also nowhere changed from the default value
  of zero. As such, the code activated by it was never used.
  This patch now removes both the variable and the few code lines
  accessing it. This will have no effect, as the code was never
  used.
- testbench: Fix commands in some openssl tests
  Those commands were not correctly handeled on AIX, now they are.
- AIX: Changed ERRNO handling after connect in tcp.c
- AIX: Add handling for other ERRNO codes in tcp.c
- bugfix/TCP: relpTcpGetRtryDirection onyl needs to check direction if SSL is active.
- AIX: in relpTcpRcv we need to set RETRY_recv if errno is 0
  On AIX 10.x, when a recv call fails with len -1 and errno 0
  we can still go into relpTCP_RETRY_recv mode. Testbench on
  rsyslog side appears to be finally working with this fix.
  On AIX 10.x, same problem as above appear to happen with
  connect() as well not setting errno to EINPROGRESS on failure.
  rsyslog ptcp driver does not check errno value at all, which is
  why we did not have this problem on AIX with rsyslog.
  Reduce test message count in receiver-abort.sh to 50000,
  because otherwise the test can timeout on very slow machines.
- openssl: fix openssl exit code avoid double free of ctx
  When more than one librelp instance are used in the same process,
  and the relpTcpExitTLS call was called a second time, the process
  could freeze due a double free (See SSL_CTX_free call).
  Thanks to David GOUARIN <david.gouarin@thalesgroup.com> for the
  discovery and initial fix.
  Also added an openssl instance counter to avoid freeing the SSL library
  which could be still in use by another librelp instance
  in the same process.
- librelp hardening: Fix multiple minor issues causing debugging trouble
  - avoid invalid dbgprint calls
  - avoid double free in relpTcpDestruct (if called twice).
  - add debug output into relpTcpRcv
- OpenSSL: fix depreacted API issues for OpenSSL 3.x
  - OpenSSL error strings are loaded automatically now
  - Adapted Debug Callback for 3.x
- bugfix: compatiblity problem with openssl 1.1
  There were undefined reference to CRYPTO_set_id_callback if system
  use openssl 1.1, which lead to load and/or other erros.
- bugfix: Forward return code from relpEngineSetTLSLib to relpEngineSetTLSLibName
  Previous situation: In case librelp is compiled without openssl
  support but openssl is requested from the user side, then librelp
  silently switches to the default tls driver(gnutls).
- bugfix: make relpEngineSetTLSLib debug safe
  In case pThis == NULL condition is true at line
- bugfix: warnings reported by coverity scan
- testbench: Added compatiblity to run on AIX
  - removed long options from receive send utilities (Not supported on AIX).
  - added checks for existing commands in some tests.
  - added msleep utility from rsyslog (sleep, timeout etc. not supported on AIX).
  - github workflow: Disabled some unrelated tests from rsyslog testbench
- gnutls drvr bugfix: library called exit() under some circumstances
  When relpTcpRcv ran into an error, it could call exit() and thus
  terminate the calling process.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../rsyslog/{librelp_1.10.0.bb => librelp_1.11.0.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/rsyslog/{librelp_1.10.0.bb => librelp_1.11.0.bb} (88%)

diff --git a/meta-oe/recipes-extended/rsyslog/librelp_1.10.0.bb b/meta-oe/recipes-extended/rsyslog/librelp_1.11.0.bb
similarity index 88%
rename from meta-oe/recipes-extended/rsyslog/librelp_1.10.0.bb
rename to meta-oe/recipes-extended/rsyslog/librelp_1.11.0.bb
index acdbbb7d1..7d3b82b61 100644
--- a/meta-oe/recipes-extended/rsyslog/librelp_1.10.0.bb
+++ b/meta-oe/recipes-extended/rsyslog/librelp_1.11.0.bb
@@ -9,7 +9,7 @@ DEPENDS = "gmp nettle libidn zlib gnutls openssl"
 SRC_URI = "git://github.com/rsyslog/librelp.git;protocol=https;branch=stable \
 "
 
-SRCREV = "9e749453d51d602d8159717f8a7c27971dcb4c6c"
+SRCREV = "b421f56d9ee31a966058d23bd23c966221c91396"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


