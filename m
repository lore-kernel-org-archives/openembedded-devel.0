Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D13B7C6FA89
	for <webhook@archiver.kernel.org>; Tue, 13 Sep 2022 10:16:08 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web09.3115.1663064165658096648
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Sep 2022 03:16:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=tCIghUrS;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1663064164; i=@fujitsu.com;
	bh=xJZcRni4D/VZE5K3m/3htg0UxMgOSyNOXMPct61UOsM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=tCIghUrSCDP1G7yrNPcNLJ9cbepPZLf5VMDzVeVovJYjSjWcEKJtcOUnIWmtGldyw
	 +a9UrOxfqlRJSr1O0zmdCWNGGlRUFLAC3S0214DdXvJ1QHkDdCf0SQLB/W2Dhi+oFF
	 KaJtgp/DHN1dMH5MT8anGa3pirC/QxkJBLdJj62A9BIMZSI2CVtJYmuI2CiCxgxKDI
	 AP1JvWzlLtSuhOFEV+SVmLQsUpfUugJHHt0KSCahOgAw2t80+wmKZwIkCZQTwZzcqn
	 ystghs4nBGbUS3lP1bNdmcdwzrDV6T7y9EWZ8hr7E+QBHovGhQPQW1NAx5v203ORBj
	 lckBnjAFYyWmg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrFIsWRWlGSWpSXmKPExsViZ8OxWTc5QiH
  ZoGeVmsXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmjHhxAfWgsm8Ffc+xTQwfufuYuTiEBJ4yChx
  8VwDE4RzmUliy6MGNghnD6NEf/9jli5GTg42ATWJ6bdusILYIgL6Ektn72EGsZkFVCRe/O5hB
  7GFBZwlfsx4BlbDIqAqManjI1gNr4CjxI+nr8HiEgIKElMevgeLcwo4SWzuuwMWFwKqeX33EV
  S9oMTJmU9YIOZLSBx88YIZoldRYvblZhYIu0KicfohJghbTeLquU3MExgFZyFpn4WkfQEj0yp
  Gq6SizPSMktzEzBxdQwMDXUNDU10zXSNDA73EKt1EvdRS3fLU4hJdQ73E8mK91OJiveLK3OSc
  FL281JJNjMAgTilmu7SDcW7fT71DjJIcTEqivJFeCslCfEn5KZUZicUZ8UWlOanFhxhlODiUJ
  HjjQ4BygkWp6akVaZk5wIiCSUtw8CiJ8PIEA6V5iwsSc4sz0yFSpxgVpcR5Z3oDJQRAEhmleX
  BtsCi+xCgrJczLyMDAIMRTkFqUm1mCKv+KUZyDUUmYVyIMaApPZl4J3PRXQIuZgBYbWcuDLC5
  JREhJNTBFW+5y07h1XHTz2i8lOc/krb+lfnIL/fY113NegHF4nZO6QK/94Z9b+/tn/v8/uyeL
  l9vxt91hw/n/7zrW72A52J/ZPL082UL0d++64oVrImdtWBjeaeZw/P6+tzGe0x+Ivl90qjyi1
  zzop3DvzYqGnowi2WsMp8xZ1rtmrdOIrBJ3jH869cyTWVz7Wk+vmyJ56Y7L/z0PlzAE7BUsvd
  a27XDnQb4CpWhPV73/Z1xXHjvR9zVYROjvKsaFv47FPYm5vefl3Z1bVkRtd++6oyAw69ZULZO
  Tp44eTZXbvuXw1mqP458uvYl/xmvJcc5v/RzfbO6e/8en33/M9NrT9ZGEazXH480iDe4tEaJH
  +JT7lFiKMxINtZiLihMBJnvze10DAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-10.tower-591.messagelabs.com!1663064163!150958!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 21164 invoked from network); 13 Sep 2022 10:16:03 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-10.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 13 Sep 2022 10:16:03 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 42113142
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Sep 2022 11:16:03 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121
 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 358117C
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Sep 2022 11:16:03 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 13 Sep 2022 11:16:01 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] syslog-ng: upgrade 3.37.1 -> 3.38.1
Date: Tue, 13 Sep 2022 18:15:42 +0800
Message-ID: <1663064143-3176-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1663064143-3176-1-git-send-email-wangmy@fujitsu.com>
References: <1663064143-3176-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Sep 2022 10:16:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98765

License-Update:
Add description to intention with the choice of licenses and the location of a license file.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../syslog-ng/{syslog-ng_3.37.1.bb => syslog-ng_3.38.1.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/syslog-ng/{syslog-ng_3.37.1.bb => syslog-ng_3.38.1.bb} (97%)

diff --git a/meta-oe/recipes-support/syslog-ng/syslog-ng_3.37.1.bb b/meta-oe/recipes-support/syslog-ng/syslog-ng_3.38.1.bb
similarity index 97%
rename from meta-oe/recipes-support/syslog-ng/syslog-ng_3.37.1.bb
rename to meta-oe/recipes-support/syslog-ng/syslog-ng_3.38.1.bb
index 10d63ccc68..76945095ac 100644
--- a/meta-oe/recipes-support/syslog-ng/syslog-ng_3.37.1.bb
+++ b/meta-oe/recipes-support/syslog-ng/syslog-ng_3.38.1.bb
@@ -10,7 +10,7 @@ ideal for firewalled environments. \
 HOMEPAGE = "http://www.balabit.com/network-security/syslog-ng/opensource-logging-system"
 
 LICENSE = "GPL-2.0-only & LGPL-2.1-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=189c3826d32deaf83ad8d0d538a10023"
+LIC_FILES_CHKSUM = "file://COPYING;md5=71d15c2fb22f43e1a380f3f799ebde30"
 
 # util-linux added to get libuuid
 DEPENDS = "libpcre flex glib-2.0 openssl util-linux bison-native"
@@ -24,7 +24,7 @@ SRC_URI = "https://github.com/balabit/syslog-ng/releases/download/${BP}/${BP}.ta
            file://syslog-ng.service-the-syslog-ng-service.patch \
 "
 
-SRC_URI[sha256sum] = "d67a320cb896cd5d62f24d9e1bec138847fa4618ae13a3946cae2b75c528ee14"
+SRC_URI[sha256sum] = "5491f686d0b829b69b2e0fc0d66a62f51991aafaee005475bfa38fab399441f7"
 
 UPSTREAM_CHECK_URI = "https://github.com/balabit/syslog-ng/releases"
 
-- 
2.25.1


