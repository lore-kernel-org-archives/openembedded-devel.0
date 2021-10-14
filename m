Return-Path: <zangrc.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA67FC433EF
	for <webhook@archiver.kernel.org>; Thu, 14 Oct 2021 08:20:33 +0000 (UTC)
Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com
 [195.245.230.2])
 by mx.groups.io with SMTP id smtpd.web08.6527.1634199632154612741
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Oct 2021 01:20:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=TBu/w++2;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.2,
 mailfrom: zangrc.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1634199630; i=@fujitsu.com;
	bh=Sqqu1JVpEl1dKWDvv+xvYAe8yfdZLKrgd/v2O1m9wIY=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=TBu/w++2SqH386G+PK+KixG+O7VfxVfZKir01Fr2mc/kDb4DI4+o58avHu+9sMw05
	 JY5E7AWvCiKp+fAFLB00Q250qAF7s0KnCGDtrMcNmvMCs2w/HrgakiITXSmGZnvXt7
	 MjQsiEAw51G6GrHym8V0QxPJbGsn5mw6OoteXEnbwKs05K09r+vI7B8gZEHByjc8E3
	 PTT79scniYpamtQTaZPes5UPjRbEOvPekSJclCWjEy90P/2ByDTHPbnk3LX1+Y8SEm
	 2fmZP+inJsD37KNgT9GhGOKa6oRYYjBh2s4aUQek3ig7dwUDdUtCKOeRNrUprpBWVa
	 jAVaBgCVAj7WA==
Received: from [100.112.194.154] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-a.eu-west-1.aws.symcld.net id FA/22-16630-D48E7616;
 Thu, 14 Oct 2021 08:20:29 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrKIsWRWlGSWpSXmKPExsViZ8MxSdf3RXq
  iwekj2hYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bL18uZCv5yVezs/cLewLiCq4uRi0NI4Amj
  xL1tX5ggnAtMEscXfWKDcE4wSkybchQow8nBJqAj0fGimwXEFhHQl1g6ew8ziC0sECGx4fBsN
  hCbRUBVYuGbbewgNq+Am8TZE72MILaEgILElIfvmSHighInZz4Bm8MsICFx8MULZogaRYntO8
  +wQNgVEq8PX4KKq0lcPbeJeQIj3ywk7bOQtC9gZFrFaJFUlJmeUZKbmJmja2hgoGtoaKRraGm
  sa2RsopdYpZuol1qqW55aXKJrqJdYXqxXXJmbnJOil5dasokRGHopBQdf7WBc+eaD3iFGSQ4m
  JVHefefSE4X4kvJTKjMSizPii0pzUosPMcpwcChJ8HI8B8oJFqWmp1akZeYA4wAmLcHBoyTC+
  +YxUJq3uCAxtzgzHSJ1ilFRSpw3HKRPACSRUZoH1waLvUuMslLCvIwMDAxCPAWpRbmZJajyrx
  jFORiVhHkFQKbwZOaVwE1/BbSYCWhxYFQKyOKSRISUVAOT4cQv8o9eZUwq+1go/uZw6OwlS22
  mFSzrdjskpudnFrxqc7veXI2ceRtUnZeF3rf/ftW0Z+MMtdnrBS/cXT2xtpL/ktjhcpblW7e8
  ObNweqXFG13Frx+W7ux5NEnvzcyGHIM7x8OebDl5cP5JbbeQU5e3Hj/6ZsGxgNiAy6+uBU2tr
  l3xT8DyinvI8j2ry9R/7ljl9WDL/smqjpfP/Vh5fcqJ6a8TjXgEjzC7KdsU+SlsYt2QaCSzwi
  hq2qZat9sSxydWiR9cfvC1efT7rwzOYp1/ak/NXnEmTs1uy+Mnufsc1otdX76PZ44dy1+R+R7
  1gi/XfvkgHRD1Ptb4/mb7pj9vhabu2tMbvFqqdqpyr8JfJZbijERDLeai4kQA2dF2DTgDAAA=
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-7.tower-271.messagelabs.com!1634199629!1100!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 18691 invoked from network); 14 Oct 2021 08:20:29 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-7.tower-271.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 14 Oct 2021 08:20:29 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 32650101B78
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Oct 2021 09:20:29 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 25B37100A3D
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Oct 2021 09:20:29 +0100 (BST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.23; Thu, 14 Oct 2021 09:20:07 +0100
From: Zang Ruochen <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-networking] [PATCH] networkmanager-openvpn: upgrade 1.8.14
 -> 1.8.16
Date: Fri, 15 Oct 2021 04:20:00 +0800
Message-ID: <1634242800-6136-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Oct 2021 08:20:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93290

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 ...ager-openvpn_1.8.14.bb => networkmanager-openvpn_1.8.16.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-networking/recipes-connectivity/networkmanager/{networkmanager-openvpn_1.8.14.bb => networkmanager-openvpn_1.8.16.bb} (91%)

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager-openvpn_1.8.14.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager-openvpn_1.8.16.bb
similarity index 91%
rename from meta-networking/recipes-connectivity/networkmanager/networkmanager-openvpn_1.8.14.bb
rename to meta-networking/recipes-connectivity/networkmanager/networkmanager-openvpn_1.8.16.bb
index 9f3054a7c2..19cac13458 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager-openvpn_1.8.14.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager-openvpn_1.8.16.bb
@@ -10,8 +10,7 @@ inherit gnomebase useradd gettext systemd
 
 SRC_URI = "${GNOME_MIRROR}/NetworkManager-openvpn/${@gnome_verdir("${PV}")}/NetworkManager-openvpn-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "bef67eca77bee68da703609b92f804a0"
-SRC_URI[sha256sum] = "e7419053fc3b5a7e25f1a7517c313ad4531b6ea280255524ebb85a70c76fdbeb"
+SRC_URI[sha256sum] = "8920de09c7ae5f1f520c83f844455db8faec31427350268fe2dd95b860f91fb5"
 
 S = "${WORKDIR}/NetworkManager-openvpn-${PV}"
 
-- 
2.25.1


