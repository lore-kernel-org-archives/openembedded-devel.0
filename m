Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DFEDC4332F
	for <webhook@archiver.kernel.org>; Tue, 22 Mar 2022 11:56:54 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web08.8920.1647950213377326780
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Mar 2022 04:56:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=epnHZMv6;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1647950211; i=@fujitsu.com;
	bh=bEf+wdDhfaJHqZ822rmN0E4Bb5rX05ftZ5h60VwyHNg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=epnHZMv6b3fqbDM7KbNEe5sq0e0/x7L0cP7qFDNBeH+5hN98uG0v/y3QNpZtt6VM1
	 02hn5Q3cc6IpKIfjUBm9BQ2caFfW/z+6UfjKbntPKUKL2rj4vgPWHwMQUgiRly0BXl
	 7cLH52farhhlT/xQSJQId1cX7DM21ib5J51qqJ93JAR09R/p8OZQzuqhWfPrkBSPK2
	 7j65jgoiO/KU2Mx9Oi4Hw8w3EBPlCLCLtxf217wrhpmNu4S/s1Z+4jrZOwqxwX6BnS
	 7qchdQJFpfJC1xnPxNTYUROX0FUiYYebmVmiSulR8K6oGYslcSzMdV0zndYZYksppw
	 od2CskLRY/5xw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrBIsWRWlGSWpSXmKPExsViZ8MxSbd5p2W
  SwYmpXBYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8amI1EFBzgq/t+1bGB8xN7FyMUhJPCEUeL/
  vmdMEM4FJokFPztZIZw9jBIbmhexdDFycrAJqElMv3WDFcQWEdCXWDp7DzOIzSygIvHidw87i
  C0s4CLx5/hLJhCbRUBV4t7B20C9HBy8Ao4SC5bagYQlBBQkpjx8D9bKKeAk0ff8EhuILQRU8m
  HZfbA4r4CgxMmZT1ggxktIHHzxghmiV1Fi9uVmFgi7QmLWrDYmCFtN4uq5TcwTGAVnIWmfhaR
  9ASPTKkarpKLM9IyS3MTMHF1DAwNdQ0NTXQNdIxNjvcQq3US91FLd8tTiEl1DvcTyYr3U4mK9
  4src5JwUvbzUkk2MwABOKWb4vINxQd9PvUOMkhxMSqK84sstk4T4kvJTKjMSizPii0pzUosPM
  cpwcChJ8K7fDpQTLEpNT61Iy8wBRhNMWoKDR0mE9+8GoDRvcUFibnFmOkTqFKOilDhv1A6ghA
  BIIqM0D64NFsGXGGWlhHkZGRgYhHgKUotyM0tQ5V8xinMwKgnz5oFM4cnMK4Gb/gpoMRPQYn1
  WM5DFJYkIKakGplgFhow/lsv5FD5ZeMplF87uzN/6Rlpc0W7tdNuy9qtHcnWZQmeZHprIfsov
  dMOV2MULv7mYSh84x3Ko32j3GykuyQPvvv2dKTNx9Tq2ENXMU7f/zFrB+76cdXP421O/7r7wn
  hD1oqBxQjTP26AHKnM6ttYUyUyXtJq/WmLysTMX+/ds+nzrtt7COTVbPTgmLd1mMFHidbvtHP
  mjynYVpQwbdnUsMd9jZqmiYqQWXrTReKv61Tirk5nOoden31L+8KUp/uStOstzRip+L2OtLxx
  jO2iygIUjwuJuw16GnD/h2zJdSz0F2plEPWctLn/IuGf3TgfW+ewx04VfuvqorVe+cufzm21C
  brO2895bYaDEUpyRaKjFXFScCAAYctS3WwMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-2.tower-591.messagelabs.com!1647950210!24421!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.10; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 31923 invoked from network); 22 Mar 2022 11:56:51 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-2.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 22 Mar 2022 11:56:51 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 9B906100450
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Mar 2022 11:56:50 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 8C2AE10044F
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Mar 2022 11:56:50 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 22 Mar 2022 11:56:45 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH v2] libpeas: upgrade 1.30.0 -> 1.32.0
Date: Tue, 22 Mar 2022 19:56:27 +0800
Message-ID: <1647950188-5858-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1647950188-5858-1-git-send-email-wangmy@fujitsu.com>
References: <1647950188-5858-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Mar 2022 11:56:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96137

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libpeas/{libpeas_1.30.0.bb => libpeas_1.32.0.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-gnome/libpeas/{libpeas_1.30.0.bb => libpeas_1.32.0.bb} (88%)

diff --git a/meta-oe/recipes-gnome/libpeas/libpeas_1.30.0.bb b/meta-oe/recipes-gnome/libpeas/libpeas_1.32.0.bb
similarity index 88%
rename from meta-oe/recipes-gnome/libpeas/libpeas_1.30.0.bb
rename to meta-oe/recipes-gnome/libpeas/libpeas_1.32.0.bb
index 0ef733ce99..944b21d1a9 100644
--- a/meta-oe/recipes-gnome/libpeas/libpeas_1.30.0.bb
+++ b/meta-oe/recipes-gnome/libpeas/libpeas_1.32.0.bb
@@ -12,7 +12,7 @@ inherit gnomebase gobject-introspection gtk-doc gtk-icon-cache features_check
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
-SRC_URI[archive.sha256sum] = "0bf5562e9bfc0382a9dcb81f64340787542568762a3a367d9d90f6185898b9a3"
+SRC_URI[archive.sha256sum] = "d625520fa02e8977029b246ae439bc218968965f1e82d612208b713f1dcc3d0e"
 
 PACKAGECONFIG[python3] = "-Dpython3=true,-Dpython3=false,python3-pygobject"
 
-- 
2.25.1


