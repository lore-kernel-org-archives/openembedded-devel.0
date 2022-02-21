Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 573BAC433EF
	for <webhook@archiver.kernel.org>; Mon, 21 Feb 2022 13:20:25 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web12.10452.1645449624202804910
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Feb 2022 05:20:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=o046DVr4;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1645449622; i=@fujitsu.com;
	bh=bms+CnozY3VFF7OcVs4wQmOIgSFxOthxMMFXQNAH5aQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=o046DVr4CajJ8DUwXaX1wnbnr0NJC9DV1r7wVUNifuzhhAvwTgRf0+uF1kKFJvchS
	 qDSs2PF23INEq8m8zjpcFonRpE7y7qu05IX8VDXW+1d2MgtLB1bDJDm1BMSIq/6z/U
	 r4nVpeuRdvnYjBWeecMAXtkv0LEPHdmImK9Fe0JsH4z1pQscnW/4nFn7+7bh89/2QR
	 1UopJcO6QhPmMzOR1ilPkl/S5dp3N0OniF8CtuVAwLDjnW9jZX3zp0spSic8+Ewx1u
	 QS/ffmauhBjmLjcL8Uw/ysBaOZ8sJcsG6BzSSUz501PhHVSIJIz/vsv915REgKXWDE
	 CAhtAT+xyBRCg==
Received: from [100.115.69.174] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-a.eu-central-1.aws.ess.symcld.net id
 8F/3F-25243-59193126; Mon, 21 Feb 2022 13:20:21 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrKIsWRWlGSWpSXmKPExsViZ8MxRXfqROE
  kg9Vn1S0uHl7K7MDocW7jCsYAxijWzLyk/IoE1ozd678yFszhrFh54RN7A+MMji5GLg4hgZlM
  Ept6mlghnBOMEtP3fWfqYuTkYBNQk5h+6wYriC0ioC+xdPYeZhCbWUBF4sXvHnYQW1jASeLv2
  w8sIDaLgKrE/amXwWxeoPjKTbvZQGwJAQWJKQ/fg/VyCjhLzLjeBTZfCKjm0ZKtrBD1ghInZz
  5hgZgvIXHwxQtmiF5FidmXm1kg7AqJWbPamCYw8s9C0jILScsCRqZVjLZJRZnpGSW5iZk5uoY
  GBrqGhqa6Zha6RiZ6iVW6iXqppbrJqXklRYlAWb3E8mK91OJiveLK3OScFL281JJNjMDQTCl2
  kdjBeLPvp94hRkkOJiVR3tp24SQhvqT8lMqMxOKM+KLSnNTiQ4wyHBxKErzC/UA5waLU9NSKt
  MwcYJzApCU4eJREeMubgdK8xQWJucWZ6RCpU4yKUuK8n0D6BEASGaV5cG2w2LzEKCslzMvIwM
  AgxFOQWpSbWYIq/4pRnINRSZhXZwLQFJ7MvBK46a+AFjMBLZ6SJQSyuCQRISXVwMR48xbj/yN
  qB+b4GeqlnfaMV66KWPL62srLm37E60cev3538qpOdYaa6YIqz9kqfuuu5rk8fSZD1dcXKZP8
  xH/pZ5yauI3T+ckWljPPFgq/lbqW9OfmvyT5JcdvVPx6vlav7NaRE6Ftu5U4F6rNtHGOz917u
  Icj+Lx4upm+MtO3mZ//rt26bIHPSzuxH2s+5but+Xh9BtOWhafC1bpeyoWlv58iL/BEmOeS4v
  clMwSWGvord9/evuxy2dm/jIoxpTZRSpdu/C0MLv/60kbn88Z1dnZGEes+vfQM2lq4cC6vxfb
  Hkic0Oi9sbfhQeXqS0T35qrgm3+uG8mr3gs3DfJbWLnuz60Gq0aJMQ5FgZ8XjSizFGYmGWsxF
  xYkA+1krxkgDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-2.tower-528.messagelabs.com!1645449621!14492!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 11659 invoked from network); 21 Feb 2022 13:20:21 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-2.tower-528.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 21 Feb 2022 13:20:21 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 21LDKDHV017111
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Feb 2022 13:20:21 GMT
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Mon, 21 Feb 2022 13:20:19 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH] libwacom: upgrade 1.12 -> 2.1.0
Date: Mon, 21 Feb 2022 21:20:00 +0800
Message-ID: <1645449601-23151-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1645449601-23151-1-git-send-email-wangmy@fujitsu.com>
References: <1645449601-23151-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 21 Feb 2022 13:20:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95408

Changelog:
=========
- New Devices:
  - Dell Latitude 5290
  - Lenovo ThinkPad X1 Tablet Gen3, Yoga 7
  - Pine64 PineNote
  - HP ProBook x360

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libwacom/{libwacom_1.12.bb => libwacom_2.1.0.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-support/libwacom/{libwacom_1.12.bb => libwacom_2.1.0.bb} (93%)

diff --git a/meta-gnome/recipes-support/libwacom/libwacom_1.12.bb b/meta-gnome/recipes-support/libwacom/libwacom_2.1.0.bb
similarity index 93%
rename from meta-gnome/recipes-support/libwacom/libwacom_1.12.bb
rename to meta-gnome/recipes-support/libwacom/libwacom_2.1.0.bb
index d35bbaacbf..226446dcbb 100644
--- a/meta-gnome/recipes-support/libwacom/libwacom_1.12.bb
+++ b/meta-gnome/recipes-support/libwacom/libwacom_2.1.0.bb
@@ -8,7 +8,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=40a21fffb367c82f39fd91a3b137c36e"
 
 SRC_URI = "git://github.com/linuxwacom/libwacom.git;branch=master;protocol=https"
-SRCREV = "942628be9faffa96ae1068833eccb00a1bfe4578"
+SRCREV = "0f263ce26edc47587d5f7604e44fad1b61240c3d"
 
 DEPENDS = " \
     libxml2-native \
-- 
2.25.1


