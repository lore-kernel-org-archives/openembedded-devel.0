Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 269C7FA3740
	for <webhook@archiver.kernel.org>; Mon, 31 Oct 2022 08:40:10 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web09.6952.1667205606075801460
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 31 Oct 2022 01:40:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=d6UnNl8J;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1667205604; i=@fujitsu.com;
	bh=WYn/zSyLmCA8ZwpqgZAsgM2mLuQIZtVY+SxPQqeZzVI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=d6UnNl8JBt2fzSOwq92LQ88JKDYZt5kq0OQkqZKtKIt9B+96fiwco5+PkSvnywHPn
	 NoDxSibPTIy1G6OYevDzGhAcYBjGrKHKxcr93LgfV1Ik5trXNg9J+HpNQTqpSU3j5J
	 87N78zpfqKjqfBBVbLd/ByFaI+KuxwfCf60awhcBu4M5khDl0yXSPWm9W8by9WSVGW
	 dbrHvYbJBQhJvEgnIO15mQhz2QUSRsxt5BB0e9GhgKb8+O/XkQD3+9blX6Ezcgumk6
	 SfssuZYUCNlMi834DzTpuOZOfdxUjpsSbcKsFAZ2Z4NzFErM7XumLPPkgSE07FDGZv
	 zRfSpWkPEu80w==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrIIsWRWlGSWpSXmKPExsViZ8MxSfdJZ3y
  ywbwVbBYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa0bT/pyCTq6Kc9NPszcwTuDsYuTkEBJ4wihx
  +btPFyMXkH2dSeJA/xZmCGcPo8THw1NYQKrYBKQkbtz/zwZiiwjoSyydvYcZxGYWUJF48buHH
  cQWFvCUeHtvJhOIzSKgKjHvyDWwXl4BR4mZ/5eAxSUEFCSmPHwP1ssp4CSxaNccJogrHCWevL
  vGDlEvKHFy5hMWiPkSEgdfvGCG6FWUmH25mQXCrpCYNasNaqaaxNVzm5gnMArOQtI+C0n7Aka
  mVYxmxalFZalFuoaWeklFmekZJbmJmTl6iVW6iXqppbrlqcUlukZ6ieXFeqnFxXrFlbnJOSl6
  eaklmxiBoZtSrLhuB+P0ZX/0DjFKcjApifK+a4lPFuJLyk+pzEgszogvKs1JLT7EKMPBoSTBy
  9gOlBMsSk1PrUjLzAHGEUxagoNHSYS3txUozVtckJhbnJkOkTrFqMsx82vbAWYhlrz8vFQpcd
  7uDqAiAZCijNI8uBGwmL7EKCslzMvIwMAgxFOQWpSbWYIq/4pRnINRSZh3K8glPJl5JXCbXgE
  dwQR0BFt7HMgRJYkIKakGJguXSMX44hNdK/S1LQMWLDk717yqecG0uyU7nK9luvnP08y5Kh6x
  +Enq/TlZL6x5rttUf9MMv2Z1vMZDm3PD8ul3/Y7NuSqea8x8SPFlT1YQn1zCX+aMg8Kp9SzSV
  3Yv7dvd+H/Zqisbn/EcXRxwnPdrWiVT49bGH/ceBJ8u/cQf+XzbhKN3Y7gOXFPaI7LWnPvRvy
  /a2dP+zf72SFPYK1BPemuK0esHElNDHjXxl+/8WTRt4+FJf2YJ8a9q6gqRVT4VcKmRu6e78wn
  nr5rl7d9XdE5ZwbHLvX+Kcs+6hoPpG8yfX91cxsn1RCZc4Vjl9Teb+nn62YQ+NkXwWqt7Pigx
  Wuwsn/GMY65rXdAaMSWW4oxEQy3mouJEABYxk3lkAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-21.tower-571.messagelabs.com!1667205603!267714!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.100.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 11880 invoked from network); 31 Oct 2022 08:40:04 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-21.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 31 Oct 2022 08:40:04 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id C25901000DB
	for <openembedded-devel@lists.openembedded.org>; Mon, 31 Oct 2022 08:40:03 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id B5A791000D7
	for <openembedded-devel@lists.openembedded.org>; Mon, 31 Oct 2022 08:40:03 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 31 Oct 2022 08:40:02 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH] tracker-miners: upgrade 3.2.1 -> 3.4.1
Date: Mon, 31 Oct 2022 16:39:43 +0800
Message-ID: <1667205585-3786-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1667205585-3786-1-git-send-email-wangmy@fujitsu.com>
References: <1667205585-3786-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 31 Oct 2022 08:40:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99367

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{tracker-miners_3.2.1.bb => tracker-miners_3.4.1.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/tracker/{tracker-miners_3.2.1.bb => tracker-miners_3.4.1.bb} (96%)

diff --git a/meta-gnome/recipes-gnome/tracker/tracker-miners_3.2.1.bb b/meta-gnome/recipes-gnome/tracker/tracker-miners_3.4.1.bb
similarity index 96%
rename from meta-gnome/recipes-gnome/tracker/tracker-miners_3.2.1.bb
rename to meta-gnome/recipes-gnome/tracker/tracker-miners_3.4.1.bb
index 92039a2a68..273110e8ef 100644
--- a/meta-gnome/recipes-gnome/tracker/tracker-miners_3.2.1.bb
+++ b/meta-gnome/recipes-gnome/tracker/tracker-miners_3.4.1.bb
@@ -19,7 +19,7 @@ SRC_URI += "file://0001-meson.build-Just-warn-if-we-build-without-libseccomp.pat
             file://0001-Set-header-file-to-a-fixed-path-instead-of-a-host-pa.patch \
            "
 
-SRC_URI[archive.sha256sum] = "44369f53e2edef41437406dbeecd477a97f8a9afdd9134832ea45d1ba2aa2c47"
+SRC_URI[archive.sha256sum] = "2fce0ec85fb7617c8b2887c22797740d5dec84ec036db74d6c208bbab5c58c24"
 
 # gobject-introspection is mandatory and cannot be configured
 REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"
-- 
2.25.1


