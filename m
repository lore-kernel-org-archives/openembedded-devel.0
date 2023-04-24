Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EE54C77B73
	for <webhook@archiver.kernel.org>; Mon, 24 Apr 2023 03:33:19 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web10.43272.1682307192115959752
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 23 Apr 2023 20:33:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=hDCTX1US;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1682307190; i=@fujitsu.com;
	bh=B4TDLB30TzRHC3aashpFxC8KWnOYLnyjnQTCqWCB+kQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=hDCTX1USO1aGd/p8xBBPkhEXUtZVS581/AUic6j6dZxRk88lfhHCdKgK1TGgBtFOa
	 3z8gDjuALXUl3CjpWjXgpuSAu1urCBHr1fXb3GCk2Ec2kxWeDTlvuAHONMba9FJiHz
	 zLmzANtMS+AaJJCwwkMiadLgCceNz56/kYuGCTlf2UxlD3uM1KCSyZtxTW3tQCrUrs
	 b7V3gbsy319zHi0ofeEhxtvaw2eI4Nn2K5PI8usyyfBJaTgpXrpL4yIXjD2bXgGtEY
	 8n2lATDtY7Szj+tCEwM/jpoOaY4QNZIa86jXIH6aebBYJnSYFAdyWsk1yvk0OuboEO
	 kXGQJdEfq3GnA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrCIsWRWlGSWpSXmKPExsViZ8MxSbf0h2u
  KQfMJHYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPl4i2sBR85Ki58j2lgnMDRxcjFISTwhFHi
  38afzBDODSaJjlkbWSCcvYwSp369Zu9i5ORgE5CSuHH/PxuILSKgL7F09h5mEJtZQEXixe8eo
  BoODmEBR4lNZ1RAwiwCqhLfj+xkAbF5BZwkZlz+wQRiSwgoSEx5+B6slVPAWeLKzrVMIK1CQD
  WTOrQhygUlTs58wgIxXULi4IsXzBCtihKzLzezQNiVEq0ffkHZahJXz21insAoOAtJ+ywk7Qs
  YmVYxmhWnFpWlFuka6SUVZaZnlOQmZuboJVbpJuqllurm5ReVZOga6iWWF+ulFhfrFVfmJuek
  6OWllmxiBAZuSnHyoh2MR3b+1TvEKMnBpCTKu2SDS4oQX1J+SmVGYnFGfFFpTmrxIUYZDg4lC
  d6iT64pQoJFqempFWmZOcAogklLcPAoifAu+wKU5i0uSMwtzkyHSJ1iVJQS57X9DpQQAElklO
  bBtcEi9xKjrJQwLyMDA4MQT0FqUW5mCar8K0ZxDkYlYV7JD0BTeDLzSuCmvwJazAS0eBe3C8j
  ikkSElFQDU2bJws/2E7dNXFTDY1Tjm/5y11z1KXGzXsRuPZJ8YrrxrvqgyxzbfpnGuVtfPMIp
  mrl8u8Tla+mXD+0qjLGZyrl+697vZ1d3905bnbzvUvamu/ptp3qOr5bVE0+J7OPbMI2l0bbUI
  otJOv4e965vYWkeO34/umru2XL2ysq5F0qfzXhzfQvLVMmqvuLDPnP+H+hpk1w8kf2aQ9QM+5
  6oJx9NIi8td99lnFyv0LbhxMslHx+sX+gcU6VxLc//o07ZvP237F/cS/dc/krq7dIfCwOVm5Z
  Gr9w7L3HWrrr/O1KX9pUIHHvo5fna7w1PtvhuLwH3FMO8YBNOtp3xHO8eHlyq/LzIbI3kCs28
  KZekX8xXYinOSDTUYi4qTgQAtpiT31cDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-9.tower-732.messagelabs.com!1682307189!291112!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 15609 invoked from network); 24 Apr 2023 03:33:09 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-9.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 24 Apr 2023 03:33:09 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 2B26410032B
	for <openembedded-devel@lists.openembedded.org>; Mon, 24 Apr 2023 04:33:09 +0100 (BST)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 1F81F100329
	for <openembedded-devel@lists.openembedded.org>; Mon, 24 Apr 2023 04:33:09 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 24 Apr 2023 04:33:07 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] ser2net: upgrade 4.3.11 -> 4.3.12
Date: Mon, 24 Apr 2023 11:32:42 +0800
Message-ID: <1682307162-12043-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1682307162-12043-1-git-send-email-wangmy@fujitsu.com>
References: <1682307162-12043-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 24 Apr 2023 03:33:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102178

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ser2net/{ser2net_4.3.11.bb => ser2net_4.3.12.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/ser2net/{ser2net_4.3.11.bb => ser2net_4.3.12.bb} (84%)

diff --git a/meta-oe/recipes-connectivity/ser2net/ser2net_4.3.11.bb b/meta-oe/recipes-connectivity/ser2net/ser2net_4.3.12.bb
similarity index 84%
rename from meta-oe/recipes-connectivity/ser2net/ser2net_4.3.11.bb
rename to meta-oe/recipes-connectivity/ser2net/ser2net_4.3.12.bb
index ca7982c0a..e38d9edbc 100644
--- a/meta-oe/recipes-connectivity/ser2net/ser2net_4.3.11.bb
+++ b/meta-oe/recipes-connectivity/ser2net/ser2net_4.3.12.bb
@@ -9,7 +9,7 @@ DEPENDS = "gensio libyaml"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/ser2net/ser2net/ser2net-${PV}.tar.gz"
 
-SRC_URI[sha256sum] = "8f831f11b67538280aa0e8787cb0785ff705cf90749aa175d32c337f29412ae3"
+SRC_URI[sha256sum] = "6101bdf937716be9b019c721b28b45d21efddd1ec19ac935aad351c55bd6f83d"
 
 UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/ser2net/files/ser2net"
 
-- 
2.34.1


