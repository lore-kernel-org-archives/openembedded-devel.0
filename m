Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D62CAC77B60
	for <webhook@archiver.kernel.org>; Mon,  3 Apr 2023 08:59:33 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web11.65472.1680512370755843903
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Apr 2023 01:59:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=xQ+TxJ0T;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1680512369; i=@fujitsu.com;
	bh=V8ep2/tnHYzbkdbpSfj7Z1MGEEidvgDnDsOlFOHfbbc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=xQ+TxJ0TZMPnYi+fumk+cb6XftL7l9/rwMs5DUxpA/ASux7wVyUdfCUMXFhnvXUIP
	 HxB4Vaxp9DzxC2AWbEpfEh75BF4lRvdyiZ3q0y39WhTOZBEod8ovUxc66B3Y2qsDmg
	 5xDnX2qugxRdsSH/TZK+IorCaH8fhLaq6z7CNIk5JW1q/LV2LTr7Z3NcCKZg/nTCWO
	 S6NybX9Nk54sVQEHjQhajWpL8dEYecVoyIKagItTPHSAJiUBCMnOjuC18LozRdPsTe
	 bK0UksjYo9RtmMivJ9CMi7Wi4xt8zmyRc1LkH3T3ULwkbuxmr3VolOI9Snm/EEF49i
	 QDF7yn1s/e0ng==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGIsWRWlGSWpSXmKPExsViZ8MxSTdvqla
  Kwfq/8hYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa0Zb71mmguNcFZPeTmRtYDzB2cXIxSEk8IRR
  4vD02awQznUmiXcfmtkgnN2MEssblgNlODnYBKQkbtz/zwZiiwjoSyydvYcZxGYWUJF48buHv
  YuRg0NYwFFi4mIPkDALUHj57k1g5bwCThLXt+8AGyMhoCAx5eF7sFZOAWeJyT3PwWwhoJq+r8
  /ZIeoFJU7OfMICMV5C4uCLF8wQvYoSsy83s0DYFRKN0w8xQdhqElfPbWKewCg4C0n7LCTtCxi
  ZVjGaFacWlaUW6Rqa6yUVZaZnlOQmZuboJVbpJuqlluqWpxaX6BrpJZYX66UWF+sVV+Ym56To
  5aWWbGIEBm9KsfKRHYw7+v7qHWKU5GBSEuUVrNdKEeJLyk+pzEgszogvKs1JLT7EKMPBoSTBe
  3ACUE6wKDU9tSItMwcYSTBpCQ4eJRHe4F6gNG9xQWJucWY6ROoUo6KUOK/fFKCEAEgiozQPrg
  0WvZcYZaWEeRkZGBiEeApSi3IzS1DlXzGKczAqCfO+mgg0hSczrwRu+iugxUxAi1ujNEAWlyQ
  ipKQamGaGHgnKUTx2KGDKw22r09pn381S+J10KDvTwM3G9bMI25Hi8O/rrpz/x/Y/3lAr5HXw
  jRfJTS9Yn058pGkUuuI3l/HKC38/ztkpPP1anv0utatVx9uMNPl53rxayDlBNGdS+cuEzQvFr
  JPstPYwHVZ9OdOk9N3SmgcBm84cNz+sfvQA47srOrdW8G+xm56kECq4UNhXOSPt4pS0D4/fGj
  ycPP3t2vCMrO0xqytXnPXX/5udpeZYdfjtlrInTXlSi7J5Dgpf7V9dUlzKu1maz8vvofP7UxU
  XSuYG3pxrcpnrx0vhmsZvPyI9FpaeOLLyjEq4eyH/Rcb7gsnLc08fOfSUUfJMSsis8yIn25yZ
  JO8rsRRnJBpqMRcVJwIAcgMjOFkDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-14.tower-571.messagelabs.com!1680512366!350674!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 25164 invoked from network); 3 Apr 2023 08:59:26 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-14.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 3 Apr 2023 08:59:26 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id DE7991009B3
	for <openembedded-devel@lists.openembedded.org>; Mon,  3 Apr 2023 09:59:25 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id D1A8410047F
	for <openembedded-devel@lists.openembedded.org>; Mon,  3 Apr 2023 09:59:25 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 3 Apr 2023 09:59:24 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH] gegl: upgrade 0.4.42 -> 0.4.44
Date: Mon, 3 Apr 2023 16:58:41 +0800
Message-ID: <1680512323-30344-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1680512323-30344-1-git-send-email-wangmy@fujitsu.com>
References: <1680512323-30344-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 03 Apr 2023 08:59:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101894

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
This release fixes a crashing bug what is umasked by GLib 2.75.3 and
newer. Never-allocated data were being passed to g_slice_free, in
GeglBuffer's handling of copy-on-write tiles.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-gnome/recipes-gimp/gegl/{gegl_0.4.42.bb => gegl_0.4.44.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gimp/gegl/{gegl_0.4.42.bb => gegl_0.4.44.bb} (96%)

diff --git a/meta-gnome/recipes-gimp/gegl/gegl_0.4.42.bb b/meta-gnome/recipes-gimp/gegl/gegl_0.4.44.bb
similarity index 96%
rename from meta-gnome/recipes-gimp/gegl/gegl_0.4.42.bb
rename to meta-gnome/recipes-gimp/gegl/gegl_0.4.44.bb
index fd75a38b7..3c1a0243e 100644
--- a/meta-gnome/recipes-gimp/gegl/gegl_0.4.42.bb
+++ b/meta-gnome/recipes-gimp/gegl/gegl_0.4.44.bb
@@ -26,7 +26,7 @@ ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 SHPV = "${@gnome_verdir("${PV}")}"
 
 SRC_URI = "https://download.gimp.org/pub/${BPN}/${SHPV}/${BP}.tar.xz"
-SRC_URI[sha256sum] = "aba83a0cbaa6c56edc29ea22f2e8172950a53b96daa51592083d59222bdde02d"
+SRC_URI[sha256sum] = "0a4cdb41635e406a0849cd0d3f03caf7d97cab8aa13d28707d532d0089d56126"
 
 PACKAGECONFIG ??= "gexiv2 jpeg libpng libraw librsvg pango poppler sdl2"
 PACKAGECONFIG:class-native = "libpng librsvg"
-- 
2.34.1


