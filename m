Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51D0DC433EF
	for <webhook@archiver.kernel.org>; Tue, 25 Jan 2022 13:19:41 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com
 [195.245.230.17])
 by mx.groups.io with SMTP id smtpd.web08.6836.1643116780150424756
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Jan 2022 05:19:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=kJdMoA0n;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.17,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1643116778; i=@fujitsu.com;
	bh=vtOvoDdsB8iBrFBX3+dTWAK9fyR1hzQ5PfafRemVHBY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=kJdMoA0nCX8hAkaacL8Ss5N5DPas9BtcBHdEiJCshDk9BZcnzUaLuIqSW93fjvjSc
	 TJyS2Cnlk+aRE5lno+6+LPW+QJ55A9e8L8B3Mc0vATCRp/TohwgWbB4PsXlxHXOrMj
	 9rkmclrvB5FpJHcIMRNWC2l2tTekFIabp0OAuNfqQFMtI3hb5gnW7NmtXp+Mu+Jppx
	 bFATo+2LmWXYlhvtuC1w9fjR8gTaMcBaO0QJHzfJAQspbcANq5dP7ozP8vDn8kIlvu
	 hwUKWsAkDWctjMVNoZTevU6sk5MtyVMb363pWgkWUGj4SJxIbM3EWmj/6VniqOLqVX
	 /7+tdkdraZCpQ==
Received: from [100.115.3.167] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-west-1.aws.ess.symcld.net id 41/95-28285-9E8FFE16;
 Tue, 25 Jan 2022 13:19:37 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrNIsWRWlGSWpSXmKPExsViZ8ORqPvyx/t
  Eg8tn1S0uHl7K7MDocW7jCsYAxijWzLyk/IoE1oyPs9sZCw5yVJyb2MbSwPiYvYuRi0NI4Amj
  xMfNO6CcC0wSVw53QTknGCU+vdjF2MXIycEmoCYx/dYNVhBbREBfYunsPcwgNrOAisSL3z3sI
  LawgL3Ej6arYDUsAqoS374dZwGxeQUcJR5dvMkEYksIKEhMefgerJdTwEli6cOnYDVCQDXvZ5
  9lhqgXlDg58wkLxHwJiYMvXjBD9CpKzL7czAJhV0jMmtUGNVNN4uq5TcwTGAVnIWmfhaR9ASP
  TKkarpKLM9IyS3MTMHF1DAwNdQ0NTXRNdI2NLvcQq3US91FLd8tTiEl1DvcTyYr3U4mK94src
  5JwUvbzUkk2MwDBOKWZ5v4Oxqe+n3iFGSQ4mJVHexHXvE4X4kvJTKjMSizPii0pzUosPMcpwc
  ChJ8L79BpQTLEpNT61Iy8wBxhRMWoKDR0mE9zpImre4IDG3ODMdInWKUVFKnPf2d6CEAEgioz
  QPrg0Wx5cYZaWEeRkZGBiEeApSi3IzS1DlXzGKczAqCfOKApOCEE9mXgnc9FdAi5mAFv8+/w5
  kcUkiQkqqgck/I8+IzTMw68o1wzajmA+bnoXmufD97lH5EFn7i03n4O8Jamobp9ly79STD104
  Z8r79uW2v6b1/VTI1FaXfnQiMLDs6sSIPf9c9jyRnmh8PKi8aZ+/wH05sXSRZNl971/tX/dFp
  0rCYGZ6j4o16751zx8sD/5+7MJ7wROPop/Wy6yOz2rh6xH7ZnCzKpxRdcYNjfyjN90uCM16rL
  znEVvFZ9lTPQddpaxPTCh9+zRW+ZpQWPPnN5ZMrm5J3bnlQvou7o03Mh032ZayWYl3nqgX7ry
  ZdtIssvzvBdGZDAF3+4tatoQWHoqI9TT8Y+ab0T/Vn4/7wtsG7ap/Yl9LJ4n4ctuFN8jv+cly
  NDlIiaU4I9FQi7moOBEAnPn5pF4DAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-5.tower-585.messagelabs.com!1643116777!900!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 19637 invoked from network); 25 Jan 2022 13:19:37 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-5.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 25 Jan 2022 13:19:37 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id F255A10019F
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Jan 2022 13:19:36 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id DF351100194
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Jan 2022 13:19:36 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Tue, 25 Jan 2022 13:19:22 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] ser2net: upgrade 4.3.4 -> 4.3.5
Date: Tue, 25 Jan 2022 21:19:04 +0800
Message-ID: <1643116744-7391-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1643116744-7391-1-git-send-email-wangmy@fujitsu.com>
References: <1643116744-7391-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Jan 2022 13:19:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95062

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ser2net/{ser2net_4.3.4.bb => ser2net_4.3.5.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/ser2net/{ser2net_4.3.4.bb => ser2net_4.3.5.bb} (84%)

diff --git a/meta-oe/recipes-connectivity/ser2net/ser2net_4.3.4.bb b/meta-oe/recipes-connectivity/ser2net/ser2net_4.3.5.bb
similarity index 84%
rename from meta-oe/recipes-connectivity/ser2net/ser2net_4.3.4.bb
rename to meta-oe/recipes-connectivity/ser2net/ser2net_4.3.5.bb
index fcd254647..63b97d20b 100644
--- a/meta-oe/recipes-connectivity/ser2net/ser2net_4.3.4.bb
+++ b/meta-oe/recipes-connectivity/ser2net/ser2net_4.3.5.bb
@@ -9,7 +9,7 @@ DEPENDS = "gensio libyaml"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/ser2net/ser2net/ser2net-${PV}.tar.gz"
 
-SRC_URI[sha256sum] = "c714d6777849100b2ca3f216d1cfc36d4573639ececc91d5c7809dfe27c8428e"
+SRC_URI[sha256sum] = "848c4fe863806e506832f1ee85b8b68258f06eb19dad43dbeee16a2cfe5d9053"
 
 UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/ser2net/files/ser2net"
 
-- 
2.25.1


