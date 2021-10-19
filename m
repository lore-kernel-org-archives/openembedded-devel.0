Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 923F7C433EF
	for <webhook@archiver.kernel.org>; Tue, 19 Oct 2021 02:18:03 +0000 (UTC)
Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com
 [195.245.230.69])
 by mx.groups.io with SMTP id smtpd.web12.4358.1634609882243183590
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Oct 2021 19:18:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=aq+tdpAS;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.69,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1634609880; i=@fujitsu.com;
	bh=bsRzC6eEKtJktR82DZEQzEdNCVF8oBDuY4y9AyjroL8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=aq+tdpASP4YdBe6pgtHQiY5jhm4e+B0dssHHIEa5wtuq+8a7XQTNyXdcWq7jQY1XY
	 hxGfDYaGgSH2D/2c1y9tUGBueK/71lt+9V1yQyTVoFJJmw/Rm2psRqTGbSLVndcRgr
	 sqWx6NQ7gjrrkDUxE2ghdXQACT361XJwWRhCtdCnJtagyyO5IPWdmUBMGuZPdYanw8
	 ogA0qKrx5HQJ//S1Nv8yFFmst6WoVaHedGF4NiaJGZ01SyyNTzCY0PLGPXLFJJf2i3
	 EBgOOeDHmgWITjvuN4NvmF/FfXY5Sa9OsZQfl+NBBM3rd6zZjdhP24x/ogyks7gZd6
	 3qI3rVPnPJJTQ==
Received: from [100.112.197.4] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-5.bemta.az-b.eu-west-1.aws.symcld.net id C3/F0-09957-7DA2E616;
 Tue, 19 Oct 2021 02:17:59 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrOIsWRWlGSWpSXmKPExsViZ8MxSfe6Vl6
  iQe9JLouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPem2fsBT/ZK17sOsbSwDiDvYuRi0NI4Amj
  xNxzUxm7GDmBnAtMEsu7kyASJxglXi/fwgaSYBNQk5h+6wYriC0ioC+xdPYeZhCbWUBF4sXvH
  nYQW1jAXuLBqu9A9RwcLAKqEpNf84GEeQWcJSZtPg1WLiGgIDHl4Xswm1PARaLj3RtWiL3OEl
  1XGlgg6gUlTs58wgIxXkLi4IsXUL2KErMvN7NA2BUSs2a1MUHYahJXz21insAoOAtJ+ywk7Qs
  YmVYxWiQVZaZnlOQmZuboGhoY6BoaGukaWlroGhob6CVW6SbppZbqlqcWl+ga6iWWF+sVV+Ym
  56To5aWWbGIEhm9KwbGmHYwnX3/QO8QoycGkJMrrcDE3UYgvKT+lMiOxOCO+qDQntfgQowwHh
  5IEb59GXqKQYFFqempFWmYOMJZg0hIcPEoivP9UgNK8xQWJucWZ6RCpU4yKUuK82ZpACQGQRE
  ZpHlwbLH4vMcpKCfMyMjAwCPEUpBblZpagyr9iFOdgVBLmdQCZwpOZVwI3/RXQYiagxVedc0A
  WlyQipKQamBxz1GfHaf5USfdZI+d1+vKqN3IdG4v2pT5N3cYlviBs6+o50xlrHsqdXMB6d0qg
  dpjBvxvvLeu2pJ8MD1TgNqn+7CIiEbjz07Ggssvf9oWvPDljoaPkoXZ1nr6TWzy+PNBI8JuY8
  LD2LAOv/Mzyc09kr9xd9Xh9dbvRjJ4shgty2//ft3sQ/vaT2uevs2fev57xda/hJTGuA76S6t
  rrnnnbvZ5it7Rhk/gbmQXKN5MSeH09V/uuN7Fz8d8gpJ6y0nGD5Y7+WT4KllwixWx6BkoC6Zc
  SEtn+Xc9cfC+637W+Y30wxwWL1k09nRlbZMs2RCtUX3uXb7h2plj/8wWH3/tI3lLpZFqYfuLE
  1xcaPkosxRmJhlrMRcWJAJUQkchaAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-8.tower-291.messagelabs.com!1634609878!2329290!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 14432 invoked from network); 19 Oct 2021 02:17:59 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-8.tower-291.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 19 Oct 2021 02:17:59 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id B6AC5100465
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Oct 2021 03:17:58 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id AA33F10045E
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Oct 2021 03:17:58 +0100 (BST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.23; Tue, 19 Oct 2021 03:17:42 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] libgusb: upgrade 0.3.7 -> 0.3.8
Date: Tue, 19 Oct 2021 10:17:25 +0800
Message-ID: <1634609846-130627-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1634609846-130627-1-git-send-email-wangmy@fujitsu.com>
References: <1634609846-130627-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Oct 2021 02:18:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93446

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libgusb/{libgusb_0.3.7.bb => libgusb_0.3.8.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/libgusb/{libgusb_0.3.7.bb => libgusb_0.3.8.bb} (69%)

diff --git a/meta-oe/recipes-support/libgusb/libgusb_0.3.7.bb b/meta-oe/recipes-support/libgusb/libgusb_0.3.8.bb
similarity index 69%
rename from meta-oe/recipes-support/libgusb/libgusb_0.3.7.bb
rename to meta-oe/recipes-support/libgusb/libgusb_0.3.8.bb
index 2b87281793..c22030b983 100644
--- a/meta-oe/recipes-support/libgusb/libgusb_0.3.7.bb
+++ b/meta-oe/recipes-support/libgusb/libgusb_0.3.8.bb
@@ -6,6 +6,6 @@ DEPENDS = "glib-2.0 libusb"
 
 inherit meson gobject-introspection gtk-doc gettext vala
 
-SRC_URI = "git://github.com/hughsie/libgusb.git"
-SRCREV = "ff9c606d9d72c7dd369ad220d92729556faaaf0c"
+SRC_URI = "git://github.com/hughsie/libgusb.git;branch=main"
+SRCREV = "db9edbd8b45662d551194a0985173732f8f557a5"
 S = "${WORKDIR}/git"
-- 
2.25.1


