Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15342C433F5
	for <webhook@archiver.kernel.org>; Mon, 28 Feb 2022 14:08:07 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web08.20431.1646057285534415774
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Feb 2022 06:08:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=YwSypOzV;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1646057283; i=@fujitsu.com;
	bh=A3brMJwHvT7vNHprWXBzUo2UnVeEodxSeznXs1/q7A0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=YwSypOzVE6o9j0l7K9wa01EQqk5uKn4KFosiHVs3eZF81v+qt4WjSNQNZ/Nn0T1LF
	 JRsuw69uXAyCRzXmf3C6QKhAgTpCYUY8AEOJX25RZxcH54DArVFgHSdRfw7aNi2YTw
	 yFAlotbk7B/emiDz0J+yZySvR3Ekic4y5Ewb3iySSgMorcBt2n7UFdBMsXUtjRYHST
	 Mtl5BY1oVXQKidn/MLfO4UHMNH0nEkIcWBgxMZkKwVm00OjBnw44G+WVSNRz/GWT+L
	 mK/DUA72pnlT5LdAo7e2IKH/1+orCYOaJoU/k/CnOYDTMkkTIwxgdDK2QXy6cmQMYo
	 oV2K4ZiebBknA==
Received: from [100.115.66.23] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-a.eu-central-1.aws.ess.symcld.net id
 67/C4-13301-347DC126; Mon, 28 Feb 2022 14:08:03 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrJIsWRWlGSWpSXmKPExsViZ8MxSdfuuky
  SweHdkhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8aODW1sBUc5Ks4u/M7SwPiSvYuRi0NI4Amj
  xObO+SwQzgUmie+H7jFBOCcYJR6vnMfYxcjJwSagJjH91g1WEFtEQF9i6ew9zCA2s4CKxIvfP
  ewgtrCAo8TjxV+BJnFwsAioSjw9wgQS5hVwkjix5AjYGAkBBYkpD98zg5RwCjhL7L2oAhIWAi
  q58u04M0S5oMTJmU9YIKZLSBx88YIZolVRYvblZhYIu0Ji1qw2JghbTeLquU3MExgFZyFpn4W
  kfQEj0ypGu6SizPSMktzEzBxdQwMDXUNDU10zC11DE2O9xCrdRL3UUt3k1LySokSgtF5iebFe
  anGxXnFlbnJOil5easkmRmAopxS79O9gvN/3U+8QoyQHk5IoL2eXZJIQX1J+SmVGYnFGfFFpT
  mrxIUYZDg4lCd7OYzJJQoJFqempFWmZOcC4gklLcPAoifA+vQyU5i0uSMwtzkyHSJ1i1OX4++
  nvXmYhlrz8vFQpcd6Ua0BFAiBFGaV5cCNgMX6JUVZKmJeRgYFBiKcgtSg3swRV/hWjOAejkjA
  vP8gUnsy8ErhNr4COYAI64m+wFMgRJYkIKakGpt78q6YLhdZqh4iZRojXzpRtvnNj8eanIQcn
  G/6WX1SwL5dXUuHL3a1PRFhvt3RY7mwVn/bPd4LE1hCZmUmN8kYXJx5q5bq9de5Lxmlb7vH62
  8Q4JdzY+2RmY+7xYL19ppqJn1gCbp54c/VfMMNr0ecPlRYZbRPO613K/XmZjNGsjIc+O2ae+S
  nIzya0s/alXjgf375jJ1aGr6lXmPxb+wNHaD7npy1lf63erYowywuX1drE46NxYMpBycDQReo
  yi748eLP7Qd+lnf/WLnX2rbJPSFrd2WDnr11+gGfj41wB98Nbmn7HFDfNK+Sd1/EnwPCxXUxJ
  buFnkSop3bK9LuECiz8VMD+b+rnx1KWWu0osxRmJhlrMRcWJAH+30OJsAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-9.tower-545.messagelabs.com!1646057278!1!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 17983 invoked from network); 28 Feb 2022 14:07:58 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-9.tower-545.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 28 Feb 2022 14:07:58 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id B83BE10044A
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Feb 2022 14:07:57 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 9DCDD100440
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Feb 2022 14:07:57 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Mon, 28 Feb 2022 14:07:47 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH] gegl: upgrade 0.4.34 -> 0.4.36
Date: Mon, 28 Feb 2022 22:07:37 +0800
Message-ID: <1646057257-36047-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1646057257-36047-1-git-send-email-wangmy@fujitsu.com>
References: <1646057257-36047-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Feb 2022 14:08:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95570

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-gnome/recipes-gimp/gegl/{gegl_0.4.34.bb => gegl_0.4.36.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gimp/gegl/{gegl_0.4.34.bb => gegl_0.4.36.bb} (96%)

diff --git a/meta-gnome/recipes-gimp/gegl/gegl_0.4.34.bb b/meta-gnome/recipes-gimp/gegl/gegl_0.4.36.bb
similarity index 96%
rename from meta-gnome/recipes-gimp/gegl/gegl_0.4.34.bb
rename to meta-gnome/recipes-gimp/gegl/gegl_0.4.36.bb
index 2f8928d164..d7595b7c9a 100644
--- a/meta-gnome/recipes-gimp/gegl/gegl_0.4.34.bb
+++ b/meta-gnome/recipes-gimp/gegl/gegl_0.4.36.bb
@@ -22,7 +22,7 @@ REQUIRED_DISTRO_FEATURES = "x11"
 SHPV = "${@gnome_verdir("${PV}")}"
 
 SRC_URI = "https://download.gimp.org/pub/${BPN}/${SHPV}/${BP}.tar.xz"
-SRC_URI[sha256sum] = "ef63f0bca5b431c6119addd834ca7fbb507c900c4861c57b3667b6f4ccfcaaaa"
+SRC_URI[sha256sum] = "6fd58a0cdcc7702258adaeffb573a389228ae8f0eff47578efda2309b61b2ca6"
 
 PACKAGECONFIG ??= "gexiv2 jpeg libpng libraw librsvg pango poppler sdl2"
 PACKAGECONFIG:class-native = "libpng librsvg"
-- 
2.25.1


