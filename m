Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC2BBC4332F
	for <webhook@archiver.kernel.org>; Sat,  3 Dec 2022 11:15:48 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web10.101878.1670066141078430196
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 03 Dec 2022 03:15:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=f2J4IDk2;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1670066139; i=@fujitsu.com;
	bh=utc/1JFN8wWmFucPzmrQjBSwP5BVmtvvCPE2b+ggID8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=f2J4IDk2UVGhnHh0JUxQEs1+VF17iQ1W3Tw1LslIJT68VRh3BGLuKM0X+NJfemKde
	 hKzXwK1PxkJY4OdrRzJ3xLj2x6hV7EAhnma+InLjIaMp118xjMWEOMLMVE2vQXVhQg
	 NZHr+5fBdRvXUPwwghqKoUXGE5Z3RD92BYZxZDyZLSVkXwOt89U94VS6YQtSs2824a
	 jSo7tJAvRM1R0iUnxZ+lfIbEncMmyxA9wrJYmrhLUV93QgwTdkPBZCgACex9+SWQ+5
	 RYTs9MdWFHdgdMSB9e1PpG5opR3KzFlLc1RlEwymT5MVrsgzN478IIhIiEjHx43Csq
	 +cUB92Ge3OwHg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrNIsWRWlGSWpSXmKPExsViZ8MxSfeWfne
  ywZ35BhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bRI2uYCn5zVkx9c4utgbGfs4uRi0NI4Amj
  xPe1P9ghnOtMEjtnd0E5uxklLp7rZO1i5ORgE5CSuHH/PxuILSKgL7F09h5mEJtZQEXixe8ed
  hBbWMBfYtamLUwgNgtQ/OTNSywgNq+Ak8TDNwfAaiQEFCSmPHzPDBEXlDg58wkLxBwJiYMvXj
  BD1ChKzL7czAJhV0jMmtXGBGGrSVw9t4l5AiP/LCTts5C0L2BkWsVoVpxaVJZapGusl1SUmZ5
  RkpuYmaOXWKWbqJdaqpuXX1SSoWuol1herJdaXKxXXJmbnJOil5dasokRGI4pxenrdzC+W/pH
  7xCjJAeTkijvsbCuZCG+pPyUyozE4oz4otKc1OJDjDIcHEoSvNHa3clCgkWp6akVaZk5wNiAS
  Utw8CiJ8HapAqV5iwsSc4sz0yFSpxh1OWZ+bTvALMSSl5+XKiXOK6cHVCQAUpRRmgc3Ahanlx
  hlpYR5GRkYGIR4ClKLcjNLUOVfMYpzMCoJ84qBTOHJzCuB2/QK6AgmoCM28neBHFGSiJCSamC
  Savv6tSuv0kY677TW2fV3nDrvWPx2VZJy3P9WLaT0l9e1ouBlrzkcNrcJhr9/F3J/RfbMK93v
  nuYV/og8zNVQYhf/wuhqq+TSF9MVdf/dvrsx8+5ni0VRvuyc1p07ClWDdyfnP4rt2rz8k1Ge9
  4sjy351/pN5HjEn9uTyDUdimhfv8eya+lgtdPafYzVhonMNPmnaLf+i0t7JpVH2LfnJ/PCE+z
  fMZLdtKeG7Fcu3fqLKG8miO1rv4ruYpzxZIr+X55+ixLI5rdLxjLkruzYzLNa91cjiueCB91p
  n/RQN7om9rQuWaU7dme3B/zinI8rvciy/4Od3SXNmMhYsDXys/vCbbtCyR36pTtq/648psRRn
  JBpqMRcVJwIAqv4bwU4DAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-16.tower-732.messagelabs.com!1670066138!41516!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 13617 invoked from network); 3 Dec 2022 11:15:38 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-16.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 3 Dec 2022 11:15:38 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 46D6F1000D5
	for <openembedded-devel@lists.openembedded.org>; Sat,  3 Dec 2022 11:15:38 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 3A9401000C1
	for <openembedded-devel@lists.openembedded.org>; Sat,  3 Dec 2022 11:15:38 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Sat, 3 Dec 2022 11:15:36 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-perl] [PATCH] libio-socket-ssl-perl: upgrade 2.076 -> 2.077
Date: Sat, 3 Dec 2022 19:15:09 +0800
Message-ID: <1670066113-24646-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 03 Dec 2022 11:15:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99921

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- fix memory leak in session cache, thanks to genuaboro
- more race conditions in tests fixed thanks to jddurand

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...-socket-ssl-perl_2.076.bb => libio-socket-ssl-perl_2.077.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-perl/recipes-perl/libio/{libio-socket-ssl-perl_2.076.bb => libio-socket-ssl-perl_2.077.bb} (95%)

diff --git a/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.076.bb b/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.077.bb
similarity index 95%
rename from meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.076.bb
rename to meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.077.bb
index 171a67588..29214d74b 100644
--- a/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.076.bb
+++ b/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.077.bb
@@ -21,7 +21,7 @@ RDEPENDS:${PN} += "\
 "
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/S/SU/SULLR/IO-Socket-SSL-${PV}.tar.gz"
-SRC_URI[sha256sum] = "bdd148d9feaef1220251676d7053698fcf446c9850d706fe2e1c90ff232ed874"
+SRC_URI[sha256sum] = "5579a61ffc3520e1abe02f4507b56938f34b823d89c32ab051f3fbd3cf166a19"
 
 S = "${WORKDIR}/IO-Socket-SSL-${PV}"
 
-- 
2.25.1


