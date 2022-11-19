Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29E15C4332F
	for <webhook@archiver.kernel.org>; Sat, 19 Nov 2022 07:36:55 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web10.15895.1668843406853718055
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Nov 2022 23:36:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=TwFgyuIv;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1668843407; i=@fujitsu.com;
	bh=CFH++fP4O/8Y3FMJFQaXgI/S3v5LjqHZEX5vLDhODPQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=TwFgyuIvrdYivlwsduD7oM81ehWuzsLcqbRW83F7JQxvJWMkbE39BFUy9xoDCVxT6
	 krdqYnKh+KMAZ8Qm1cpYB8cYAm3oLUlCO0kZ83Sev/CRKtNJGzr2CIHLQUxX+pxqBc
	 yLyg6Aek+g2OtLmq+gjCRJ4foZ2VWx45G6MdXtdyHY0O4y9bH9v9Y5YytZbbJkkmUJ
	 zYwB/xAlb3MmXGepfP2OZvuCTtg62caLNpV/pAXRIMyHMTzpgwJbwJS3icg/MyoiSA
	 ylqS6R/Phma5sBJLVgY/ygQoDLtQBwjoGviVeOqUQ4k8beLe63+76R1OLhYe6VnUoJ
	 M1La/M43Xe3Hg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrEIsWRWlGSWpSXmKPExsViZ8MxSbe/vSL
  Z4Fwjl8XFw0uZHRg9zm1cwRjAGMWamZeUX5HAmjH76nLGglPcFTOXbGdpYNzK1cXIySEk8IRR
  YvWjjC5GLiD7OpPElL6lzBDOHkaJs+cuMoFUsQlISdy4/58NxBYR0JdYOnsPM4jNLKAi8eJ3D
  zuILSzgKLH9+H4WEJtFQFVi78ZHrF2MHBy8QPFbk0tAwhICChJTHr4Ha+UUcJI4+OANE8QRjh
  KbW5aAjeEVEJQ4OfMJC8R4CYmDL14wQ/QqSsy+3MwCYVdIzJrVxgRhq0lcPbeJeQKj4Cwk7bO
  QtC9gZFrFaF6cWlSWWqRraKiXVJSZnlGSm5iZo5dYpZuol1qqm5dfVJKha6iXWF6sl1pcrFdc
  mZuck6KXl1qyiREYvCnFqeY7GL8v+6N3iFGSg0lJlHdve3myEF9SfkplRmJxRnxRaU5q8SFGG
  Q4OJQneuLaKZCHBotT01Iq0zBxgJMGkJTh4lER4RXyA0rzFBYm5xZnpEKlTjLocM7+2HWAWYs
  nLz0uVEudNApkhAFKUUZoHNwIW1ZcYZaWEeRkZGBiEeApSi3IzS1DlXzGKczAqCfNOB5nCk5l
  XArfpFdARTEBH5DiXgRxRkoiQkmpgevDy0wLxCS8TtOPtVfKOz/h/cKVaiEW515Iu/bDDZxot
  Hp8tTZH8tUK6SSap53Ttf9PGoEfMCjknQ9by2Z/umi6VY/Vj6ZfD864q7fvz6vEJBo1tDkt+J
  AVZz/8oeUF2D2N2zF7mNwuucAb9DtK8teXgx/5Nq47aqhTw7Al/xsq10vCt0qxJiV0P73HzaH
  PYrJMQL3hdeLR4n/iRJTYbjP+abHjN+/JXo+VCLsm01drmJ3ivL92XILF07Y5Cu64/oXnMS6u
  41C9tVtvrvlbx3O5lGrnHMz9Vdei/kO5eLqp9aLOL+RK979EH4nQ2PFvFe/HurL4r7pK6CVWq
  om67piZsE2P/y+79YPPRNZEntZVYijMSDbWYi4oTAe3bPTtlAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-5.tower-745.messagelabs.com!1668843406!58673!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 4909 invoked from network); 19 Nov 2022 07:36:47 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-5.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 19 Nov 2022 07:36:47 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id A21C71039D9
	for <openembedded-devel@lists.openembedded.org>; Sat, 19 Nov 2022 07:36:46 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 959AD1039D8
	for <openembedded-devel@lists.openembedded.org>; Sat, 19 Nov 2022 07:36:46 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Sat, 19 Nov 2022 07:36:45 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH] gegl: upgrade 0.4.38 -> 0.4.40
Date: Sat, 19 Nov 2022 15:36:01 +0800
Message-ID: <1668843361-2892-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1668843361-2892-1-git-send-email-wangmy@fujitsu.com>
References: <1668843361-2892-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 19 Nov 2022 07:36:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99625

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
Operations:
-----------
*newsprint: do not drop alpha channel in RGB modes.

Core
----------
*fixes for legacy build, still supporting building latest GEGL for
 stable GIMP with old babl (not recommended if distros can have
 recent enough meson.).
*avoiding possible multi thread race in babl garbage collection

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-gnome/recipes-gimp/gegl/{gegl_0.4.38.bb => gegl_0.4.40.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gimp/gegl/{gegl_0.4.38.bb => gegl_0.4.40.bb} (96%)

diff --git a/meta-gnome/recipes-gimp/gegl/gegl_0.4.38.bb b/meta-gnome/recipes-gimp/gegl/gegl_0.4.40.bb
similarity index 96%
rename from meta-gnome/recipes-gimp/gegl/gegl_0.4.38.bb
rename to meta-gnome/recipes-gimp/gegl/gegl_0.4.40.bb
index 541565809..335ce24aa 100644
--- a/meta-gnome/recipes-gimp/gegl/gegl_0.4.38.bb
+++ b/meta-gnome/recipes-gimp/gegl/gegl_0.4.40.bb
@@ -22,7 +22,7 @@ ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 SHPV = "${@gnome_verdir("${PV}")}"
 
 SRC_URI = "https://download.gimp.org/pub/${BPN}/${SHPV}/${BP}.tar.xz"
-SRC_URI[sha256sum] = "e4a33c8430a5042fba8439b595348e71870f0d95fbf885ff553f9020c1bed750"
+SRC_URI[sha256sum] = "cdde80d15a49dab9a614ef98f804c8ce6e4cfe1339a3c240c34f3fb45436b85d"
 
 PACKAGECONFIG ??= "gexiv2 jpeg libpng libraw librsvg pango poppler sdl2"
 PACKAGECONFIG:class-native = "libpng librsvg"
-- 
2.25.1


