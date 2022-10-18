Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E49EAC433FE
	for <webhook@archiver.kernel.org>; Tue, 18 Oct 2022 01:08:36 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web09.1752.1666055309789698116
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Oct 2022 18:08:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Q52tYXbQ;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1666055308; i=@fujitsu.com;
	bh=dVGrwDdvHDWhjr49JDf8WiqsAWj5vkJa52qG62NWZLU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=Q52tYXbQW0/eVEYgE2+0MIsXy6QtPQomdNoTs+da/m41pYilveELj2TKG8sQ9n2jK
	 v23594UcbJOXMMi8wQ4Grh63BbGYgd6x6hlbM2gqMVf8qox2WXnXHahMPAnPsfUGe0
	 Dzy29xhRDmBcyTWvF1aJKANe1rGEhR66AQouEUUoOFHbFpLPLQAHc5DyKhXDMLu4kT
	 +i4DmrFPtI8AT2KANl3bvbmirSVMt4P9+a7xBpQ85O5inJQlx0UockRj6peYZwCKEh
	 TaFCOCfbMWBAEd5aiEQL10FgSpZj1wVKJBgmY0tgz7jm1lACB+qYzxgNhRbhas86HA
	 Nnw2NZNyj8xrg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrEIsWRWlGSWpSXmKPExsViZ8ORqNv9xzf
  ZoGeNpMXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmrFg2yWWgtWcFd1b57E1MG7m6GLk4hASeMIo
  ceTTChYI5zqTxIon21khnD2MEpPf9gNlODnYBNQkpt+6wQpiiwjoSyydvYcZxGYWUJF48buHH
  cQWFnCXWL+niw3EZhFQldi9chIjiM0r4Cgxo+srWK+EgILElIfvwXo5BZwknu5cABYXAqo5Pf
  8MO0S9oMTJmU9YIOZLSBx88YIZoldRYvblZhYIu0Ji1qw2JghbTeLquU3MExgFZyFpn4WkfQE
  j0ypG0+LUorLUIl1TvaSizPSMktzEzBy9xCrdRL3UUt3y1OISXUO9xPJivdTiYr3iytzknBS9
  vNSSTYzA4E0pZizbwdi97I/eIUZJDiYlUd6OGb7JQnxJ+SmVGYnFGfFFpTmpxYcYZTg4lCR4O
  34A5QSLUtNTK9Iyc4CRBJOW4OBREuGNOgOU5i0uSMwtzkyHSJ1i1OWY+bXtALMQS15+XqqUOO
  /p30BFAiBFGaV5cCNgUX2JUVZKmJeRgYFBiKcgtSg3swRV/hWjOAejkjBv6i+gKTyZeSVwm14
  BHcEEdETGfi+QI0oSEVJSDUwTjee4OazgWbi6cjrnWqutRo7b0juDj15ck/v/3wLB9IDpt76+
  3c8XHG8lGfp/J1dn4QWBL7y7jl715/KSSBSfeeGfx41v2Z5TD9158vi9w75L/IyzFzMs/fFA9
  exDMS+Fdd/v1J5rPzTBS8o7bP/lZ2mpinpm2fpFB3pf/Nljeycj9XzMT6/yTJnSZ/7vDr2qVn
  G8uqtN8EJfzo2a+xHtPo1tm5IiP72w2DO7X3LP+pC0eC2m1/I1fddUVhVvPHE+/8TmfU/fzO4
  trpsZtH9dsO4mHpnr7wOfyb/2PXqwNGXvu6YLytv9DvT+S82x3L9YvvK8zC0Bg883HTvfcrC8
  uHZ5O0/C/BfznGP352UkK7EUZyQaajEXFScCAOCqipBlAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-5.tower-591.messagelabs.com!1666055307!280041!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 18394 invoked from network); 18 Oct 2022 01:08:27 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-5.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 18 Oct 2022 01:08:27 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 1304C10018D
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Oct 2022 02:08:27 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 0741A100043
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Oct 2022 02:08:27 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 18 Oct 2022 02:08:25 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] blueman: upgrade 2.3.2 -> 2.3.4
Date: Tue, 18 Oct 2022 09:07:56 +0800
Message-ID: <1666055276-8042-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1666055276-8042-1-git-send-email-wangmy@fujitsu.com>
References: <1666055276-8042-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Oct 2022 01:08:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99216

Bugs fixed
==========
    Errors when connected to a device with the DisconnectItems plugin enabled

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../blueman/{blueman_2.3.2.bb => blueman_2.3.4.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/blueman/{blueman_2.3.2.bb => blueman_2.3.4.bb} (97%)

diff --git a/meta-networking/recipes-connectivity/blueman/blueman_2.3.2.bb b/meta-networking/recipes-connectivity/blueman/blueman_2.3.4.bb
similarity index 97%
rename from meta-networking/recipes-connectivity/blueman/blueman_2.3.2.bb
rename to meta-networking/recipes-connectivity/blueman/blueman_2.3.4.bb
index eed00fce02..c3cde1f27a 100644
--- a/meta-networking/recipes-connectivity/blueman/blueman_2.3.2.bb
+++ b/meta-networking/recipes-connectivity/blueman/blueman_2.3.4.bb
@@ -13,7 +13,7 @@ SRC_URI = " \
     file://0001-meson-add-pythoninstalldir-option.patch \
 "
 S = "${WORKDIR}/git"
-SRCREV = "4275c35ffe372c3b194080726fbe1c99f974360f"
+SRCREV = "89bb5313a7cc24ca6fdbeaf2b02f6142dc1a8e60"
 
 EXTRA_OEMESON = "-Druntime_deps_check=false -Dpythoninstalldir=${@noprefix('PYTHON_SITEPACKAGES_DIR', d)}"
 
-- 
2.25.1


