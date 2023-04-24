Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E378C77B73
	for <webhook@archiver.kernel.org>; Mon, 24 Apr 2023 03:19:39 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web11.42761.1682306371437445387
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 23 Apr 2023 20:19:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=bdPfyuB1;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1682306369; i=@fujitsu.com;
	bh=nFPIbKz5Gd1fT/OLNlCgHkoXca3ReqKNPAmJSotDjlo=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=bdPfyuB1TcitDsQglj0LaZETMpFCj3pR52ujF6y25Nc1c37azXzimut27Ps49rj9M
	 /DUqMy1RQhrdRpsBQima+r3vMyvU32MtNpdhGesz55NisXHui2hkJDqwqdVQH1FkCv
	 lDI2qO1r9O/UgCq01gg5MHnHmkAOCn2ZPRtFEB0+XpQhJVBh5M2whABBPIf/YxKp2U
	 dVH0Y2adPs4Dhy5r1G+ERofvR+nnaFTE3Mb1Qt7Jh5P4KXKAv2op6Z39BYcnAIuLob
	 AsNdaFblpJ0SXG/MLEEUBx0dJjUgiCksqj870WJiA0hzAHgKRUW1ddqIvovjusNyur
	 rrfOSZsPi1riQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrNIsWRWlGSWpSXmKPExsViZ8MxSdfhq2u
  Kwf1f4hYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8aNnWfYC5o4Kw5+2sTSwDiLo4uRi0NI4Amj
  xJe3hxi7GDmBnBtMEktmyUEk9gIlZrezgiTYBKQkbtz/zwZiiwjoSyydvYcZxGYWUJF48buHH
  cQWFnCWWPSjE2gQBweLgKpE2zsWEJNXwEli/i9DkAoJAQWJKQ/fg3XyCghKnJz5hAViioTEwR
  cvmCFqFCVmX25mgbArJVo//IKy1SSuntvEPIGRfxaS9llI2hcwMq1iNC1OLSpLLdI110sqykz
  PKMlNzMzRS6zSTdRLLdUtTy0u0TXSSywv1kstLtYrrsxNzknRy0st2cQIDMOUYqWeHYz/dv7V
  O8QoycGkJMq7ZINLihBfUn5KZUZicUZ8UWlOavEhRhkODiUJ3qJPrilCgkWp6akVaZk5wJiAS
  Utw8CiJ8OaeBErzFhck5hZnpkOkTjEqSonztoH0CYAkMkrz4NpgcXiJUVZKmJeRgYFBiKcgtS
  g3swRV/hWjOAejkjCv5AegKTyZeSVw018BLWYCWryL2wVkcUkiQkqqgSlmTtjU328Onvv3piH
  g2TX/O6mvVmgenbby1tKp0mXH+uL18/Pqoqa9s5m/vnOvVpKUSMns7S5KZcXTI8znd7l9iTm5
  WvFG7K8Df+KLvP9bzFLc/NJ96Qeb2D0C6/b6rTlp6iDxQY4596uwzQfZ+YeVOhmPvjrMtyW5x
  P2q/g+9hQwzYyYxLWsXuyNkuGiOeBrPn7kaLFoXXm0/t0VWIXcq98nt+rUNM3V8Il9FCdilO5
  29ecW+gk3YdYv+q7drehWXvti7fIpSl3jVkdrk/8vfT3v7fGXj+id/ph9nYPJhnnb30ke1mUn
  TL4TwOktr31AU2LnzW6+obUWs2/vH53WPVanLZzhsWPBthqtW+CRPJZbijERDLeai4kQASbLz
  4T4DAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-17.tower-565.messagelabs.com!1682306368!214709!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.105.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 7366 invoked from network); 24 Apr 2023 03:19:28 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-17.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 24 Apr 2023 03:19:28 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 1EC9310032B
	for <openembedded-devel@lists.openembedded.org>; Mon, 24 Apr 2023 04:19:28 +0100 (BST)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 0667A1000FC
	for <openembedded-devel@lists.openembedded.org>; Mon, 24 Apr 2023 04:19:28 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 24 Apr 2023 04:19:26 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH] babl: upgrade 0.1.102 -> 0.1.104
Date: Mon, 24 Apr 2023 11:19:07 +0800
Message-ID: <1682306351-11741-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 24 Apr 2023 03:19:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102149

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 LUT code-paths re-enabled, some array overflow proofing.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-gimp/babl/{babl_0.1.102.bb => babl_0.1.104.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gimp/babl/{babl_0.1.102.bb => babl_0.1.104.bb} (84%)

diff --git a/meta-gnome/recipes-gimp/babl/babl_0.1.102.bb b/meta-gnome/recipes-gimp/babl/babl_0.1.104.bb
similarity index 84%
rename from meta-gnome/recipes-gimp/babl/babl_0.1.102.bb
rename to meta-gnome/recipes-gimp/babl/babl_0.1.104.bb
index 68b3f933d..a79dd4d1d 100644
--- a/meta-gnome/recipes-gimp/babl/babl_0.1.102.bb
+++ b/meta-gnome/recipes-gimp/babl/babl_0.1.104.bb
@@ -11,7 +11,7 @@ inherit setuptools3 gnomebase gobject-introspection vala
 DEPENDS += "lcms"
 
 SRC_URI = "https://download.gimp.org/pub/${BPN}/0.1/${BP}.tar.xz"
-SRC_URI[sha256sum] = "a88bb28506575f95158c8c89df6e23686e50c8b9fea412bf49fe8b80002d84f0"
+SRC_URI[sha256sum] = "22e38e1d19c5391abc8ccf936033a9d035e8a8ec7523e5cd76a4c01137d7160c"
 
 FILES:${PN} += "${libdir}/${BPN}-${@gnome_verdir("${PV}")}"
 
-- 
2.34.1


