Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 704ACC433F5
	for <webhook@archiver.kernel.org>; Tue, 22 Mar 2022 00:42:05 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web11.4015.1647909724487463691
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Mar 2022 17:42:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=PGLrycrK;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1647909722; i=@fujitsu.com;
	bh=ubk8Vyv3aq3GiK1iXySsfenzuksanDirCsFGINu3kFs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=PGLrycrKLt0xI0HS+uKMOFZWr5wecOQCMQBdABHIf+expWFh73mRLfuIzwH87r3QX
	 Oe3iPj8xXbBx8MvFzDP1Hi2DMi0HVw2QvmDLV+ehnSJEh9GhSM2gW1HeJ8QPIiwbmH
	 N0Te7IHFf+AYoyjt3b4Gs7kTCVrHAZejzkgUcLR66wQqINzKCINdcsTcIcCIaPKH2n
	 Tvx+9vnAKNv6szsO5GhuU2seNAbMEnbNZV/PlHhTix2nI0PKxjxxfydcwv4C8B7T4E
	 uA+PsB/xeGugTSLKZiZzeIZ3EtYKqthC6gqS+hYeokIdhwmYUrZaakCAw0LSjEqB/Y
	 BGQgRJILngwVQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrHIsWRWlGSWpSXmKPExsViZ8ORqBspbZl
  kcP67qcXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmvH2EXfBGq6KTR1b2RsYL3B2MXJxCAk8YZRo
  vdzAAuFcYJKY2NTFCuHsYZR4MqUNyOHkYBNQk5h+6waYLSKgL7F09h5mEJtZQEXixe8edhBbW
  MBX4vKW/WA1LAKqEidvLgSr4RVwlGia9o8JxJYQUJCY8vA9WJxTwEliRctjsF4hoJqJ/w6xQ9
  QLSpyc+YQFYr6ExMEXL5ghehUlZl9uZoGwKyRmzWqDmqkmcfXcJuYJjIKzkLTPQtK+gJFpFaN
  dUlFmekZJbmJmjq6hgYGuoaGprpmlrqGlqV5ilW6iXmqpbnJqXklRIlBaL7G8WC+1uFivuDI3
  OSdFLy+1ZBMjMJhTil0P72Dc3fdT7xCjJAeTkijvi4cWSUJ8SfkplRmJxRnxRaU5qcWHGGU4O
  JQkeN+IWyYJCRalpqdWpGXmACMLJi3BwaMkwsv/AaiVt7ggMbc4Mx0idYpRUUqc97QUUJ8ASC
  KjNA+uDRbNlxhlpYR5GRkYGIR4ClKLcjNLUOVfMYpzMCoJ896SBJrCk5lXAjf9FdBiJqDF+qx
  mIItLEhFSUg1MjeU96+5OPPL4keCOb4oGZxffz9psbhd5dXLbvrBa9nLbbc8lvWayn5mfPfHC
  nOO88yoaMoPk/vvvbN57MHNn4iP5d2996hOM43qVpHpvG1YVT9fYWGn/WPGAh/6+Cm251v3Ob
  gULpnx6Yfe27CzbjeP3GX54qhTlm4hOD4nhDmtrElTkMohpTiz9mzWhPiLVo6WjrsfWWHvzzE
  OTpy9KmfYu5+rpSi7ZyY9ynqmYit6udYyN/vn63NfFafsarHd7K+ef2GZx/k/kpRevNjcf5pL
  4LPjZ7d1h008/6jWZz944t6LoL1f33adXY9JVFsSqavrc+6wUkP3Z492SkkLvj+UH5sV/qdmn
  KcB/egK3EktxRqKhFnNRcSIAEq5c72EDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-20.tower-528.messagelabs.com!1647909721!49278!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.10; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 21488 invoked from network); 22 Mar 2022 00:42:01 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-20.tower-528.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 22 Mar 2022 00:42:01 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 6881D100185
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Mar 2022 00:42:01 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 5B58910004E
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Mar 2022 00:42:01 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 22 Mar 2022 00:41:42 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH] gnome-system-monitor: upgrade 41.0 -> 42.0
Date: Tue, 22 Mar 2022 08:41:26 +0800
Message-ID: <1647909686-2107-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1647909686-2107-1-git-send-email-wangmy@fujitsu.com>
References: <1647909686-2107-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Mar 2022 00:42:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96120

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...nome-system-monitor_41.0.bb => gnome-system-monitor_42.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-system-monitor/{gnome-system-monitor_41.0.bb => gnome-system-monitor_42.0.bb} (88%)

diff --git a/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_41.0.bb b/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_42.0.bb
similarity index 88%
rename from meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_41.0.bb
rename to meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_42.0.bb
index c0b4b39375..219a069b6a 100644
--- a/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_41.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_42.0.bb
@@ -22,7 +22,7 @@ REQUIRED_DISTRO_FEATURES = "x11 polkit"
 def gnome_verdir(v):
     return oe.utils.trim_version(v, 1)
 
-SRC_URI[archive.sha256sum] = "c7fc44c61949b794b0289968ebbbcc0c15f8cfc3d9e45bfaa81ed45c12139e5f"
+SRC_URI[archive.sha256sum] = "13239d22032201a22bd29833c575b684816700d2de168a1530223577c5c075dc"
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
 PACKAGECONFIG[systemd] = "-Dsystemd=true, -Dsystemd=false, systemd"
-- 
2.25.1


