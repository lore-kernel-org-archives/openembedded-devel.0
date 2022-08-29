Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F3E6ECAAD4
	for <webhook@archiver.kernel.org>; Mon, 29 Aug 2022 06:32:24 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web12.67629.1661754737661395192
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Aug 2022 23:32:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=rQhQqVZm;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1661754736; i=@fujitsu.com;
	bh=CIRe5AAw5JnYmjpcQyGTTWsqkpOB4PuFPLr+lgHKM0c=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=rQhQqVZm0eOAlfg3BmJcvKV9oZe1nEf+uyDc3cKqfLQQWCHOpT3viT6xjH6NG7f03
	 hYNNlzuCZtm1hS8H32Hzyp7Kv/YO8sDRspJXX0jc9cnmGqIRdAkR8R4yjD9tSAxKbU
	 +6lMEuI04gbS9AhiKuDYFHlsLu9QqGlfIXePcMt9oE2ywvo5LtL0aUR+aibFbljNQz
	 IsJhGsKgUftmf26qJAaBTckVsfsSV/DoJ+dgZHQwVPqtZJrcpidQ8bJhyvwJq5fKHO
	 qwgP74MOmr0t/ijeRuOJSrw1ExraCXYK9J8pohStxNaGi/U8rqXK8gCRC1caJzRLtM
	 TQJRq5y1PfXbQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrJIsWRWlGSWpSXmKPExsViZ8MxSTc/lif
  ZoOmcjsXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmvHibVLBWo6KzgVqDYy32LsYuTiEBJ4wSlyf
  fJQZwrnBJLH//BsmCGcvo8SPaTtZuxg5OdgE1CSm37oBZosI6Essnb2HGcRmFlCRePG7B2gUB
  4ewgL3EnBNxIGEWAVWJP+c3M4HYvAKOEnuWNrCD2BICChJTHr4Ha+UUcJJo2fUWLC4EVHNw21
  qoekGJkzOfsECMl5A4+OIFM0SvosTsy80sEHalxJ5Z/UwQtprE1XObmCcwCs5C0j4LSfsCRqZ
  VjNZJRZnpGSW5iZk5uoYGBrqGhqa6xka6hkZmeolVuol6qaW65anFJbpGeonlxXqpxcV6xZW5
  yTkpenmpJZsYgSGcUqxQt4Px2sqfeocYJTmYlER5Tcx5koX4kvJTKjMSizPii0pzUosPMcpwc
  ChJ8N6OBMoJFqWmp1akZeYA4wkmLcHBoyTC+8oBKM1bXJCYW5yZDpE6xagoJc67MRooIQCSyC
  jNg2uDxfAlRlkpYV5GBgYGIZ6C1KLczBJU+VeM4hyMSsK8wlFAU3gy80rgpr8CWswEtPjhEm6
  QxSWJCCmpBia3v6133oQ1x77W0SjMXbpi+bPdB0Sk1IT2M1s+z/w4cU6YKePf2ObpPya36Lh+
  +NdaWXiK87P43XNhT9pSz2QvO2VUsHxlM+8hzRNnZVK2PLc94C536L3G1jO10ZGTE5553ZzAZ
  hr2OvZJR/Nuxpl7JeY/32Us8aZRQWXxKg/VFou5fG+5Tp0Ufb0sdKLtxp7zU2df+tF77sE6td
  RClqnTnjrG5lkcXtNfqq1eyOMmuP7t4hdnmQ+t+HXdr1mr8qlD8p5cF52LbKarYpc2W7CLnF2
  heNmaLzP+KNM81cmuphu+nZB7XuMbdVBSQWvnFb+7vzMVH0gqZan+iVaN71zyMffsv84QU97l
  Rbd3Pr2kxFKckWioxVxUnAgAf2m471wDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-2.tower-548.messagelabs.com!1661754735!257812!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 1817 invoked from network); 29 Aug 2022 06:32:15 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-2.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 29 Aug 2022 06:32:15 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 6C0E71000E7
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Aug 2022 07:32:15 +0100 (BST)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223
 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 4C4DD1000CC
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Aug 2022 07:32:15 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 29 Aug 2022 07:32:13 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH] gtk4: upgrade 4.6.6 -> 4.6.7
Date: Mon, 29 Aug 2022 14:31:41 +0800
Message-ID: <1661754703-4722-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1661754703-4722-1-git-send-email-wangmy@fujitsu.com>
References: <1661754703-4722-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 29 Aug 2022 06:32:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98502

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-gnome/recipes-gnome/gtk4/{gtk4_4.6.6.bb => gtk4_4.6.7.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gtk4/{gtk4_4.6.6.bb => gtk4_4.6.7.bb} (98%)

diff --git a/meta-gnome/recipes-gnome/gtk4/gtk4_4.6.6.bb b/meta-gnome/recipes-gnome/gtk4/gtk4_4.6.7.bb
similarity index 98%
rename from meta-gnome/recipes-gnome/gtk4/gtk4_4.6.6.bb
rename to meta-gnome/recipes-gnome/gtk4/gtk4_4.6.7.bb
index dcebd0de5a..c71be23a7d 100644
--- a/meta-gnome/recipes-gnome/gtk4/gtk4_4.6.6.bb
+++ b/meta-gnome/recipes-gnome/gtk4/gtk4_4.6.7.bb
@@ -33,7 +33,7 @@ MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
 UPSTREAM_CHECK_REGEX = "gtk-(?P<pver>\d+\.(\d*[02468])+(\.\d+)+)\.tar.xz"
 
 SRC_URI = "http://ftp.gnome.org/pub/gnome/sources/gtk/${MAJ_VER}/gtk-${PV}.tar.xz"
-SRC_URI[sha256sum] = "7bbfe4d13569f7c297ed49834ac7263e318b7bf102d3271cb466d5971f59ae70"
+SRC_URI[sha256sum] = "effd2e7c4b5e2a5c7fad43e0f24adea68baa4092abb0b752caff278e6bb010e8"
 
 S = "${WORKDIR}/gtk-${PV}"
 
-- 
2.25.1


