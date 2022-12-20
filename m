Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F26B6C4332F
	for <webhook@archiver.kernel.org>; Tue, 20 Dec 2022 12:25:02 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com [195.245.230.17])
 by mx.groups.io with SMTP id smtpd.web11.48932.1671539094690300990
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Dec 2022 04:24:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=m06y0v9k;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.17, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1671539093; i=@fujitsu.com;
	bh=MfxmUWTOjaNP9J036gJNuRG328sylnWTkBi3ZpPe1gA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=m06y0v9kOLtSbIoL6Du4n/xg0uX+YyAZcjANvTZrR4i/RfPNZvT9XrQyHC3IXqNN8
	 f2JITZ8pX9WODFguyz7T2anKPdj+Oyi4AOPuBQN7+vWQrld528nsdlu9vgfpxluKAe
	 BseEFp96Dp3uxX7vWu+vRuEcbnDXWhnDL/3wNH+PIr5p+WkQBma0LWr8T541bpgIPS
	 TYzpFb55bAnLYuUbuJmZROxyh4QTFA6yhBhuaXr/kkSi0soofrsxFZ1n/+oJxM17Ni
	 APMhBxhvHVQX+oncJ6t6B2t1Q/8e7svbJ31wGB2fufeRc5vJmM2XdKoMdoh6JREPFz
	 vE6CvUevaCJPA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrOIsWRWlGSWpSXmKPExsViZ8ORqDtl5cJ
  kg52z1C0uHl7K7MDocW7jCsYAxijWzLyk/IoE1oz1mz6wFDzlrPh84gtLA+MTji5GTg4hgSeM
  Er8fRncxcgHZ15kkLm39xwrh7GGUODuvjxWkik1ASuLG/f9sILaIgL7E0tl7mEFsZgEViRe/e
  9hBbGEBL4kJ/z+zgNgsAqoS0+cvYQKxeQUcJbZPWghWIyGgIDHl4XuwXk4BJ4mDjzawQ1zhKH
  Fvwzo2iHpBiZMzn7BAzJeQOPjiBTNEr6LE7MvNLBB2hcSsWW1MELaaxNVzm5gnMArOQtI+C0n
  7AkamVYymxalFZalFusZ6SUWZ6RkluYmZOXqJVbqJeqmluuWpxSW6hnqJ5cV6qcXFesWVuck5
  KXp5qSWbGIGhm1LMVr2D8e3SP3qHGCU5mJREecPCFyYL8SXlp1RmJBZnxBeV5qQWH2KU4eBQk
  uCdsQgoJ1iUmp5akZaZA4wjmLQEB4+SCO/7FUBp3uKCxNzizHSI1ClGY461DQf2MnPM/Np2gF
  mIJS8/L1VKnPcySKkASGlGaR7cIFh8X2KUlRLmZWRgYBDiKUgtys0sQZV/xSjOwagkzCsCTBZ
  CPJl5JXD7XgGdwgR0yqFLc0FOKUlESEk1MDEEVeU/sL8VUlE37V5f78/i4Adp5kt8C4QNs8wb
  3m0qrK/eftZ54tzy3zceFHMuF1R9diyqfhZP9LczGkI8G57aqro65Zs8mbFcWLHGePfBlIenp
  k+vy7hR73d9h9fn1piXda9sH1X1rHW/96xtsatpyz0+ibja+TzBl0/d/GVY3eB5ffemirQGxw
  kRWbzZQpNLS6VD8+KdJ7jp/TcLCHe2sKzflvlSeglTlB4fQ7VF2taEzUofDn18M/3ZU5M/zhX
  zyt4a+T03+SR7RdlJ+KnUPqlp7qENPWeyewqjshOrdl7fySb36PExp931bzZM3q1168WO4r3b
  4iSeXXV4tvWl3PkH1nL/djOYBr/apMRSnJFoqMVcVJwIAAbc7LJqAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-10.tower-585.messagelabs.com!1671539092!393597!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 9248 invoked from network); 20 Dec 2022 12:24:52 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-10.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 20 Dec 2022 12:24:52 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 43E3210019D
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 Dec 2022 12:24:52 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 3746510019A
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 Dec 2022 12:24:52 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Tue, 20 Dec 2022 12:24:50 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-filesystems] [PATCH] xfsdump: upgrade 3.1.11 -> 3.1.12
Date: Tue, 20 Dec 2022 20:24:03 +0800
Message-ID: <1671539043-7306-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1671539043-7306-1-git-send-email-wangmy@fujitsu.com>
References: <1671539043-7306-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Dec 2022 12:25:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100153

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../xfsdump/{xfsdump_3.1.11.bb => xfsdump_3.1.12.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-filesystems/recipes-utils/xfsdump/{xfsdump_3.1.11.bb => xfsdump_3.1.12.bb} (93%)

diff --git a/meta-filesystems/recipes-utils/xfsdump/xfsdump_3.1.11.bb b/meta-filesystems/recipes-utils/xfsdump/xfsdump_3.1.12.bb
similarity index 93%
rename from meta-filesystems/recipes-utils/xfsdump/xfsdump_3.1.11.bb
rename to meta-filesystems/recipes-utils/xfsdump/xfsdump_3.1.12.bb
index 2e5977cce..659d604a6 100644
--- a/meta-filesystems/recipes-utils/xfsdump/xfsdump_3.1.11.bb
+++ b/meta-filesystems/recipes-utils/xfsdump/xfsdump_3.1.12.bb
@@ -14,7 +14,7 @@ SRC_URI = "https://www.kernel.org/pub/linux/utils/fs/xfs/xfsdump/${BP}.tar.xz \
            file://remove-install-as-user.patch \
            ${@bb.utils.contains('DISTRO_FEATURES','usrmerge','file://0001-xfsdump-support-usrmerge.patch','',d)} \
            "
-SRC_URI[sha256sum] = "5657a2ca26a55682dc9724fb0331c860fe362c778225cbfc8c710f1375f458a3"
+SRC_URI[sha256sum] = "f39c4c1b306b2dd7ec979c0e94d60fe69083d2ecf9af051cac5ef3bed772c74a"
 
 inherit autotools-brokensep
 
-- 
2.25.1


