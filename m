Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F0B1C32793
	for <webhook@archiver.kernel.org>; Wed, 24 Aug 2022 01:02:19 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web09.5936.1661302932927507207
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Aug 2022 18:02:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@fujitsu.com
 header.s=170520fj header.b=n8OhZzcn;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1661302931; i=@fujitsu.com;
	bh=VC0QbdVvQlHwEC1+pGEoo6N6sSe1HwTEhLyAD1mv54Y=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	b=n8OhZzcniltVIMNUz0kN1U58q+eU/g1I6cWBVceiZR1shJSwV57+3BnYzl8SzXsNv
	 efogmxrVhy3kYydDjhtC+dvCbgaZQrPqRx3UWvgtd8alKpxGHKhMdeUn2qc9ooYdgm
	 RwfvDGtGNR0raqecB3D1fRWLEjmA8wpcOsd2ivHHlBHeCq0HVTBrJKVJXGeLNrEQbA
	 WN/PHDjkgMJ+H/OHPOq9RF+X7AsxpcwYVpYAmHlKqMFOLLl1dteFvLAqHcp3aMPrKD
	 CD1ZCu4rq/6cdh4I0hDXRyb/qvp1qZPiwz/Za0AqfYU4+kfIwybXyJLMk5OORvcRzq
	 zhpIM7fhjeMsg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrOIsWRWlGSWpSXmKPExsViZ8MxSbe3gjX
  Z4O1CY4uLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePVM96C0/wV3Z9uszQwPuPtYuTiEBJ4wijx
  e3sDK4Rzg0li+vEnzBDOXkaJnpmLGbsYOTnYBNQkpt+6wQpiiwjoSyydvYcZxGYWUJF48buHH
  cQWFvCU2HVoDhOIzSKgKvH12nOgGg4OXgEniTWf5UHCEgIKElMevgdr5RUQlDg58wkLxBhNid
  btv9khbHmJ5q2zmSHqFSVmX25mgbArJfbM6meCsNUkrp7bxDyBUWAWklGzkIyahWTUAkbmVYw
  2SUWZ6RkluYmZObqGBga6hoamQNpQ19hAL7FKN1EvtVQ3L7+oJEPXUC+xvFgvtbhYr7gyNzkn
  RS8vtWQTIzCMU4pT5XYwHtj3S+8QoyQHk5Io7zUx1mQhvqT8lMqMxOKM+KLSnNTiQ4wyHBxKE
  ry25UA5waLU9NSKtMwcYEzBpCU4eJREeFekAaV5iwsSc4sz0yFSpxh1Oa5eubKXWYglLz8vVU
  qcd00ZUJEASFFGaR7cCFh8X2KUlRLmZWRgYBDiKUgtys0sQZV/xSjOwagkzHuhBGgKT2ZeCdy
  mV0BHMAEdEbSbGeSIkkSElFQDk+jxSiHhhVY+e8P4DfnVloko2IqL2C9zFHhvc0teKueYo3zU
  9x7xtVGfdZ+b9B/02+Z43KQ9+8NN24efnFbKeC/L6/om8XhaUPVegZyT58rk9h0uSnj+fPuTu
  +fX1E9oufs3d/LCmTEeX/mbOHeyrEz7pjPtP8fPJ7WvHWPTfni+430pLJvy+53JfxOlmtSc32
  ZC7+NEdM3m3TqQlJol++MeQ/f5kmM9RkolSRWZZbLvv79+dlbSdueta2zsyc0pc1aH8E6asmX
  So93bDykwlxaeeui+6+nVxAuvm2v+PbqSL80YYberIllmx0NjuS9Wr6LT7Apfcqqxt/3X6Z1g
  XtB8xzM0uKrWlOF355ozSizFGYmGWsxFxYkA2jm/p2oDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-6.tower-728.messagelabs.com!1661302925!105142!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 25277 invoked from network); 24 Aug 2022 01:02:05 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-6.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 24 Aug 2022 01:02:05 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 4180D1000CC
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Aug 2022 02:02:05 +0100 (BST)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223
 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 34F261000C0
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Aug 2022 02:02:05 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Wed, 24 Aug 2022 02:02:03 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] unbound: upgrade 1.16.1 -> 1.16.2
Date: Wed, 24 Aug 2022 09:01:46 +0800
Message-ID: <1661302907-10612-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Aug 2022 01:02:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98408

Changelog:
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Features
- Merge #718: Introduce infra-cache-max-rtt option to config max
  retransmit timeout.

Bug Fixes
- Fix the novel ghost domain issues CVE-2022-30698 and CVE-2022-30699.
- Fix bug introduced in 'improve val_sigcrypt.c::algo_needs_missing for
  one loop pass'.
- Merge PR #668 from Cristian Rodr=C3=ADguez: Set IP_BIND_ADDRESS_NO_PORT on
  outbound tcp sockets.
- Fix verbose EDE error printout.
- Fix dname count in sldns parse type descriptor for SVCB and HTTPS.
- For windows crosscompile, fix setting the IPV6_MTU socket option
  equivalent (IPV6_USER_MTU); allows cross compiling with latest
  cross-compiler versions.
- Merge PR 714: Avoid treat normal hosts as unresponsive servers.
  And fixup the lock code.
- iana portlist update.
- Update documentation for 'outbound-msg-retry:'.
- Tests for ghost domain fixes.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../unbound/{unbound_1.16.1.bb =3D> unbound_1.16.2.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/unbound/{unbound_1.16.1.bb =3D> unbound_1.16.2.bb} (96%)

diff --git a/meta-networking/recipes-support/unbound/unbound_1.16.1.bb b/meta-networking/recipes-support/unbound/unbound_1.16.2.bb
similarity index 96%
rename from meta-networking/recipes-support/unbound/unbound_1.16.1.bb
rename to meta-networking/recipes-support/unbound/unbound_1.16.2.bb
index c11bf513ac..63036f6eb8 100644
--- a/meta-networking/recipes-support/unbound/unbound_1.16.1.bb
+++ b/meta-networking/recipes-support/unbound/unbound_1.16.2.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D5308494bc0590c0cb036afd781d78f06"
 SRC_URI =3D "git://github.com/NLnetLabs/unbound.git;protocol=3Dhttp;branch=3Dmaster;protocol=3Dhttps \
 	file://0001-contrib-add-yocto-compatible-init-script.patch \
 "
-SRCREV =3D "903538c76e1d8eb30d0814bb55c3ef1ea28164e8"
+SRCREV =3D "cbed768b8ff9bfcf11089a5f1699b7e5707f1ea5"
 
 inherit autotools pkgconfig systemd update-rc.d
 
-- 
2.25.1


