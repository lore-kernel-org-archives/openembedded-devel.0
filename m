Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E30C9C4332F
	for <webhook@archiver.kernel.org>; Tue, 20 Dec 2022 12:13:32 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web11.48737.1671538405086372047
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Dec 2022 04:13:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=B9FDdUl1;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1671538405; i=@fujitsu.com;
	bh=DF+xnuJMRpv9K7hdXgtlOnqB3eBS6usnyK+lricZH2Y=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=B9FDdUl1P3eaY0ywRoo4RJaQG+os+yulZkY8boPQm0ZwYti98+iuAfeLyubpZskpn
	 20IRC11V2XyHfsifMAf072x5XVncXfWKw/EsXT0WC3WLXnPJmOmQw9PEf5E1aGZSup
	 TjGs8Aay38qBTRzM6dG/hlml8Qt4UchwiYHKQT8uSvniooMwQWWJR64pGupkpgYD0m
	 XBwwZg1rPEV+lJiIC3LXd05YuSvrKl/++DUIvTE8nAdy5uuyFs+eOuA4aTZYnwqq5t
	 r4b6Q/Mot9SwCuqcLoi+P3LKeIRiCvEAZQRXSnRoiMX0THaj+EKgZyRwAgNDI3vPcQ
	 KG/srdfIWbp5A==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrMIsWRWlGSWpSXmKPExsViZ8OxWffJsoX
  JBj1fzS0uHl7K7MDocW7jCsYAxijWzLyk/IoE1owDDfeZC45yVbzecZatgfESZxcjF4eQwENG
  if8rL7BBOFeYJFoXfoNy9jBKnLt5hLGLkZODTUBK4sb9/2wgtoiAvsTS2XuYQWxmARWJF7972
  EFsYQF/idlfOsFqWARUJZa/6mcBsXkFHCXe9zeC1UgIKEhMefgerJdTwEni5pGLYPOFgGq2/F
  zFCFEvKHFy5hMWiPkSEgdfvGCG6FWUmH25mQXCrpCYNauNCcJWk7h6bhPzBEbBWUjaZyFpX8D
  ItIrRrDi1qCy1SNfQWC+pKDM9oyQ3MTNHL7FKN1EvtVS3PLW4RNdIL7G8WC+1uFivuDI3OSdF
  Ly+1ZBMjMHxTihVn7GD8t+yP3iFGSQ4mJVHesPCFyUJ8SfkplRmJxRnxRaU5qcWHGGU4OJQke
  GcsAsoJFqWmp1akZeYAYwkmLcHBoyTC2zMbKM1bXJCYW5yZDpE6xajLMfNr2wFmIZa8/LxUKX
  He5qVARQIgRRmleXAjYHF9iVFWSpiXkYGBQYinILUoN7MEVf4VozgHo5IwbxfIFJ7MvBK4Ta+
  AjmACOuLQpbkgR5QkIqSkGpiWOxzVTmJhruf6OfH37NpFSj9S9jq+uazIZSnbPaGE+TTHP4Hz
  /Ye7K9rY772Ornl15MVq6QfLezbOnM98467qjBd9Ivek36caqQlc2rC7be4rQ321xYmZa/V3z
  bTlfFPLcvb4c+VSGauau9f7dBb8DDY76nHr9rn0Yt60B4sUn/6bd1zdWkZxttDydUwXS0tLjr
  l1ZwsILDTZEaFd/8dL2UnLJePIZPUHK7ddPCid2JkuJMTJ9uZF7zV9uWPSR5Qau9uzV/6TU5o
  rdeLcN/mF6z60Pin2j2HK6giV0J0whbc/g6/Ez1x8jk0G37/Eey+Eb0dPMzz8Mlqw8EJ6z0bD
  Pvaix20bGebKlAsduaXEUpyRaKjFXFScCAB84QtKZgMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-23.tower-565.messagelabs.com!1671538404!391324!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 31567 invoked from network); 20 Dec 2022 12:13:24 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-23.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 20 Dec 2022 12:13:24 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 977C9151
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 Dec 2022 12:13:24 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 8B05C150
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 Dec 2022 12:13:24 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Tue, 20 Dec 2022 12:13:23 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-perl] [PATCH] libio-socket-ssl-perl: upgrade 2.077 -> 2.078
Date: Tue, 20 Dec 2022 20:12:42 +0800
Message-ID: <1671538363-7066-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1671538363-7066-1-git-send-email-wangmy@fujitsu.com>
References: <1671538363-7066-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Dec 2022 12:13:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100133

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- revert decision from 2014 to not verify hostname by default if hostname is
  IP address but no explicit verification scheme given
  https://github.com/noxxi/p5-io-socket-ssl/issues/121

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...-socket-ssl-perl_2.077.bb => libio-socket-ssl-perl_2.078.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-perl/recipes-perl/libio/{libio-socket-ssl-perl_2.077.bb => libio-socket-ssl-perl_2.078.bb} (95%)

diff --git a/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.077.bb b/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.078.bb
similarity index 95%
rename from meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.077.bb
rename to meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.078.bb
index 29214d74b..ff2559b8a 100644
--- a/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.077.bb
+++ b/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.078.bb
@@ -21,7 +21,7 @@ RDEPENDS:${PN} += "\
 "
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/S/SU/SULLR/IO-Socket-SSL-${PV}.tar.gz"
-SRC_URI[sha256sum] = "5579a61ffc3520e1abe02f4507b56938f34b823d89c32ab051f3fbd3cf166a19"
+SRC_URI[sha256sum] = "4cf83737a72b0970948b494bc9ddab7f725420a0ca0152d25c7e48ef8fa2b6a1"
 
 S = "${WORKDIR}/IO-Socket-SSL-${PV}"
 
-- 
2.25.1


