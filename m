Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1A55C433EF
	for <webhook@archiver.kernel.org>; Tue, 16 Nov 2021 01:54:48 +0000 (UTC)
Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com
 [195.245.230.5])
 by mx.groups.io with SMTP id smtpd.web09.4232.1637027687749069161
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Nov 2021 17:54:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=BJPZgX+k;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.5,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1637027685; i=@fujitsu.com;
	bh=7e7IYMvltfcbnmcNcU/90JysKa2WNUXrw0zJAWdzJK4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=BJPZgX+kgFcpms0NJhf8SyOjWLAhYouzPmjgcuYCDT/byu1FTvnyFmjsvPgVsGihf
	 +PIS7cfL2MFbi2mNg/XNd4Gj4l/T970pENiMlJQvx/MayaHerwMVYjflebXeSzkgrz
	 W8Gz1Sh3u/bhIihEhwx6o14mnWB/+eVU88TSJzgCOE+kmnlV1mLbcJUCjJES1PfmQe
	 rFekzp3R8Xj757ZxiBfvdzOh/MCaGtulCNNAxgGo4pDy85ed8uv+iS/1hrBIs/Lif1
	 8iNgrbNfaXPeoAjIe5VM6/u4IJS+1E1LM8UMxA3OgKbBOxwntJncdP/7/w4tZbupZc
	 XLAmnccBND73Q==
Received: from [100.112.195.167] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-5.bemta.az-a.eu-west-1.aws.symcld.net id 1C/82-11077-46F03916;
 Tue, 16 Nov 2021 01:54:44 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrMIsWRWlGSWpSXmKPExsViZ8ORqJvMPzn
  R4NYyC4uLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePcgyXsBZt5KpafOs/ewDiZu4uRi0NI4Amj
  xPsLXxghnAtMEpvPTmWCcE4wSsxdf4qli5GTg01ATWL6rRusILaIgL7E0tl7mEFsZgEViRe/e
  9hBbGGBYolN7x+A1bAIqEp8vz+bCcTmFXCS2PR7M1i9hICCxJSH75kh4oISJ2c+YYGYIyFx8M
  ULqBpFidmXm1kg7AqJWbPamCBsNYmr5zYxT2Dkn4WkfRaS9gWMTKsYLZKKMtMzSnITM3N0DQ0
  MdA0NjXQNLU11jQxN9RKrdBP1Ukt1y1OLS3QN9RLLi/WKK3OTc1L08lJLNjECQzKl4PD1HYy3
  Xn/QO8QoycGkJMobt2hSohBfUn5KZUZicUZ8UWlOavEhRhkODiUJXk/OyYlCgkWp6akVaZk5w
  PiASUtw8CiJ8AbxAaV5iwsSc4sz0yFSpxiNOd79XLyImWPVgemrmIVY8vLzUqXEedlASgVASj
  NK8+AGweL2EqOslDAvIwMDgxBPQWpRbmYJqvwrRnEORiVhXjmQKTyZeSVw+14BncIEdIr9vX6
  QU0oSEVJSDUzR76NPBOZsuNSQemDG1iibuvmflt/dVjlZRT1X7UWyyfcDpdUhDIdChJfe9HLi
  XX5tisSkihA1g7ser2K33784K1qfZYHGnOgOSf9zB2+pLHtq+dHy95fDd9Z5SX+M/9WoHNmp1
  3xQw9gheHvFwcKzbwMPfwiSv7v63KPp8VHnpl/mP6nQ15eipCJ0tm6/3pwuGf4Z3d8D5/saPJ
  w0M1ql7Hn8Hav59i26Ge+sbeap5Ms9eMT7K4TDourqy3eTi/VPzuMTuPbRpLS1w1PBtPzS/hY
  tdp7ndRJN026kzi2YPcmYL8/cY7n1yrpbl1K75FdVOfif9znt/EEkaL/uV6a4lya9gYXtcjNk
  v4Td01BiKc5INNRiLipOBAB8ze3OVgMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-4.tower-271.messagelabs.com!1637027683!54092!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 11064 invoked from network); 16 Nov 2021 01:54:43 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-4.tower-271.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 16 Nov 2021 01:54:43 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 79F97100229
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Nov 2021 01:54:43 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 6EC70100228
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Nov 2021 01:54:43 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.24; Tue, 16 Nov 2021 01:54:21 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] openvpn: Change the default cipher to
 AES-256-GCM for server configurations
Date: Tue, 16 Nov 2021 09:54:04 +0800
Message-ID: <1637027644-80438-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Nov 2021 01:54:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93962

This change makes the server use AES-256-GCM instead of BF-CBC as the default
cipher for the VPN tunnel.  To avoid breaking existing running configurations
defaulting to BF-CBC, the Negotiable Crypto Parameters (NCP) list contains
the BF-CBC in addition to AES-CBC.  This makes it possible to migrate
existing older client configurations one-by-one to use at least AES-CBC unless
the client is updated to v2.4 (which defaults to upgrade to AES-GCM automatically)

Upstream-Status: Backport [https://src.fedoraproject.org/rpms/openvpn/blob/rawhide/f/0001-Change-the-default-cipher-to-AES-256-GCM-for-server-.patch]

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-support/openvpn/openvpn/openvpn@.service            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/openvpn/openvpn/openvpn@.service b/meta-networking/recipes-support/openvpn/openvpn/openvpn@.service
index 358dcb791a..01dd2e8c25 100644
--- a/meta-networking/recipes-support/openvpn/openvpn/openvpn@.service
+++ b/meta-networking/recipes-support/openvpn/openvpn/openvpn@.service
@@ -6,7 +6,7 @@ After=syslog.target network.target
 PrivateTmp=true
 Type=forking
 PIDFile=/var/run/openvpn/%i.pid
-ExecStart=/usr/sbin/openvpn --daemon --writepid /var/run/openvpn/%i.pid --cd /etc/openvpn/ --config %i.conf
+ExecStart=/usr/sbin/openvpn --daemon --writepid /var/run/openvpn/%i.pid --cd /etc/openvpn/ --cipher AES-256-GCM --data-ciphers AES-256-GCM:AES-128-GCM:AES-256-CBC:AES-128-CBC:BF-CBC --config %i.conf
 
 [Install]
 WantedBy=multi-user.target
-- 
2.25.1


