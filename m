Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17516C433F5
	for <webhook@archiver.kernel.org>; Mon, 21 Mar 2022 12:35:03 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com
 [195.245.230.81])
 by mx.groups.io with SMTP id smtpd.web08.29728.1647866101424916384
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Mar 2022 05:35:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=t30aUy7F;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.81,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1647866099; i=@fujitsu.com;
	bh=e8JWZirWGkhMhpOqiK5hJ8P50lZpKbxalJBJGGjExic=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=t30aUy7FqboqB6gZJixdojgxIqdb5NbFVTqgRFXjWhz7IosuzA9kaBmSILmEfXW7a
	 oGN4+07kRny1MloT8+lyxCHE7r0sQzeRoOeqLJy44yJtiYodMtxgTWeiOPfLp7TeMo
	 ENLvoEI38UpfiLQuN9XLkyxB2y1iePpGb6XVSFIyFXI+aOfT8tgiYdpsGPhVuArxa4
	 eHBoWZO4fR7jKQ+XberW8qg6RiXDQnp6pjPOPm/PpbICBwBoK4+K8sUIqTlTMQxHUV
	 Zw8POK1RogNBDMSHqN/JHWX9utsanEXKDrQvbZyAawsBi7rANEnEFBLfGWgvC85K+e
	 1bJMuBk6bj2ZA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrMIsWRWlGSWpSXmKPExsViZ8MxRfdzgUW
  SwZQ5rBYXDy9ltrg3fwGbA5PHuY0rGD06fl9nDGCKYs3MS8qvSGDNWPznP3PBfPaKVVOusTcw
  HmTrYuTiEBJ4ySgxa+07li5GTiBnD6PE7GfJIDabgJrE9Fs3WEFsEQF9iaWz9zCD2MwC8hLLN
  /1hA7GFBawl1u6YyQRiswioSqz9vYcRxOYVcJJYcfsTWI2EgILElIfvmSHighInZz5hgZgjIX
  HwxQtmiBpFidmXm1kg7AqJWbPamCYw8s5C0jILScsCRqZVjFZJRZnpGSW5iZk5uoYGBrqGhqa
  6prpGpqZ6iVW6iXqppbrlqcUluoZ6ieXFeqnFxXrFlbnJOSl6eaklmxiBYZdSzPp/B2N330+9
  Q4ySHExKorx1RhZJQnxJ+SmVGYnFGfFFpTmpxYcYZTg4lCR4OfKAcoJFqempFWmZOcAYgElLc
  PAoifDeyQZK8xYXJOYWZ6ZDpE4xKkqJ8/7JB0oIgCQySvPg2mBxd4lRVkqYl5GBgUGIpyC1KD
  ezBFX+FaM4B6OSMO9bkCk8mXklcNNfAS1mAlqsz2oGsrgkESEl1cC0SnX75ckPP23w3P5ZWNV
  sQcI05sqnmjymKy68eZb9MjQppFvfwWapaGnhRVfWNTofv0mE2O38cdzauTqlcFGk78rYBQIf
  jukVz+yKuRCpPGGfjMDu1o5z73qjJ5zZscW0Re+PxaG6GzdZeMPVlkzLF2YVWS6e+D81cfqGj
  ETP7pmhs689XPDn39xPddffPnwVptiTynJw6fdprjuUwxcdV+4WepZ5pvNlv3prW9LRpXwT9r
  3YrLi6qFOtzefdhDfy1cKx+QtsVD9o6lq9mCrg56kTukrNrvvX/b3VVzjOFH69ssOjed62fV9
  rds0xiTau+xjan1Uf2qQUviIw3MmEJ3U2y7r1r04sjJUp3zpLiaU4I9FQi7moOBEAt6oapTYD
  AAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-20.tower-585.messagelabs.com!1647866098!179457!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.10; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 25624 invoked from network); 21 Mar 2022 12:34:59 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-20.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 21 Mar 2022 12:34:59 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 22LCYd6h025608
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Mon, 21 Mar 2022 12:34:48 GMT
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 21 Mar 2022 12:34:37 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Upgrade Helper <uh@not.set>
Subject: [oe] [meta-oe] [PATCH] php: upgrade 8.1.3 -> 8.1.4
Date: Mon, 21 Mar 2022 20:34:27 +0800
Message-ID: <1647866068-30929-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 21 Mar 2022 12:35:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96109

From: Upgrade Helper <uh@not.set>

---
 meta-oe/recipes-devtools/php/{php_8.1.3.bb => php_8.1.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/php/{php_8.1.3.bb => php_8.1.4.bb} (99%)

diff --git a/meta-oe/recipes-devtools/php/php_8.1.3.bb b/meta-oe/recipes-devtools/php/php_8.1.4.bb
similarity index 99%
rename from meta-oe/recipes-devtools/php/php_8.1.3.bb
rename to meta-oe/recipes-devtools/php/php_8.1.4.bb
index 8086bac550..bf6c543097 100644
--- a/meta-oe/recipes-devtools/php/php_8.1.3.bb
+++ b/meta-oe/recipes-devtools/php/php_8.1.4.bb
@@ -33,7 +33,7 @@ SRC_URI:append:class-target = " \
           "
 
 S = "${WORKDIR}/php-${PV}"
-SRC_URI[sha256sum] = "354c4e2c506046eca812d1fc2526884a2f54b5e3d20ef0ede919a69eb232d0be"
+SRC_URI[sha256sum] = "b3f688cb69758523838b8e7f509aaef0152133d9b84a84a0b7cf68eeafc1df76"
 
 inherit autotools pkgconfig python3native gettext
 
-- 
2.25.1


