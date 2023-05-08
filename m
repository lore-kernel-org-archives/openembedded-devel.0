Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64444C7EE22
	for <webhook@archiver.kernel.org>; Mon,  8 May 2023 10:08:08 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web10.103654.1683540482954145705
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 May 2023 03:08:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=y7xsTwl/;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1683540483; i=@fujitsu.com;
	bh=DfyiVskBWsUHTn1yeLtC6oSBMSf/1+E/5woKWYvjerw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
	b=y7xsTwl/z+/7yUl+5yKBh3eOMQMgw2psb/J1Ahua11LndkVlvnJbM+zg1CU1uGQHs
	 sOcu25MDyRg9nmMm3Sz8Zz3aJMb6Te6l7f71E5u3oyjA+8trLLFA0M9G9zT/Bu19jK
	 f01dnIp1hI9vbTFspy0dkq+vf1dKOHf09s6le1of+IBgwX1u6gdV3z4AhUdybnVWGK
	 2qojUL6bltjulIdgswdNbO5+QVpqJJedXKi9KAECAw6aBW0rcenn41NywjUTzWScXz
	 sX/DS4W0Jtt5Jfjq3P3PU09XDCCDE1hwuS1cAo15MtYnMg1sEue3nZ5mkjsqTZd96n
	 bI1QAabMuv59g==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrLLMWRWlGSWpSXmKPExsViZ8ORpMt8KiL
  FYMI/AYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNeP6qz3sBbe4K3ZP3sPSwPiaq4uRi0NIYCOj
  xNutp1ggnGlMEnPab7F3MXJysAlISEzfexLMFhHQlfj4YS4jiM0soCIxY/IRJhBbWCBY4kvTV
  1YQm0VAVWL531/MIDavgJPE9XunwGokBBQkpjx8DxTn4OAUcJa4vUAAJCwEVNJ58jhUiZrE1X
  ObmCcw8ixgZFjFaFacWlSWWqRrqZdUlJmeUZKbmJmjl1ilm6iXWqqbl19UkqFrqJdYXqyXWly
  sV1yZm5yTopeXWrKJERgSKcWps3cwLt71V+8QoyQHk5Ior+nBsBQhvqT8lMqMxOKM+KLSnNTi
  Q4wyHBxKErxt2yJShASLUtNTK9Iyc4DhCZOW4OBREuGVPQKU5i0uSMwtzkyHSJ1i1OWYN/vff
  mYhlrz8vFQpcV6RE0BFAiBFGaV5cCNgsXKJUVZKmJeRgYFBiKcgtSg3swRV/hWjOAejkjDvZp
  ApPJl5JXCbXgEdwQR0hP/lcJAjShIRUlINTPEnzha1BSlNfGN6gf2x63c3xre/z/StM+8U0zn
  O0xT//O3Rae437gR+vzJ5Kbc8y+oqbyeurJ1XF+bO/3vbZ8ZG7c83tP6mXDh2OYNl8sE5D07Z
  2p7iuLH0zMJGy1lcB37alk9YnJTsu8J7yuFI3Y7U3MBz5eLsriIsvKyb7F9/rBORPfvz4reUx
  MtLX85bce1I07/HL69/Pl0kvfxDenDC+p+GxnvWzD34nMuNJ0Egcpr0ea8G3/uFTBPW3k5Y47
  DZqPNz5qOWGUdqIzwnJZ3/4HVcp/r20oV/FHJrJif7W9mY7/sX4bLh8p29x3hP7NKvPlz1fWM
  2r73Cr+bsnaHyGg/UTu7a4Vh57bhK/GNTJZbijERDLeai4kQA10dwpBADAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-12.tower-732.messagelabs.com!1683540482!495596!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.105.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 30462 invoked from network); 8 May 2023 10:08:03 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-12.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 8 May 2023 10:08:03 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id B1D241D4;
	Mon,  8 May 2023 11:08:02 +0100 (BST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id D6CCB1C2;
	Mon,  8 May 2023 11:08:01 +0100 (BST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-perl] [PATCH] libmodule-build-tiny-perl: upgrade 0.043 -> 0.045
Date: Mon,  8 May 2023 18:07:48 +0800
Message-Id: <1683540471-25268-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1683540471-25268-1-git-send-email-wangmy@fujitsu.com>
References: <1683540471-25268-1-git-send-email-wangmy@fujitsu.com>
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 May 2023 10:08:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102396

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Fix compilation issue on Windows
- Add module sharedirs
- Only add src/*.c files to primary XS file

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ld-tiny-perl_0.043.bb => libmodule-build-tiny-perl_0.045.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-perl/recipes-perl/libmodule/{libmodule-build-tiny-perl_0.043.bb => libmodule-build-tiny-perl_0.045.bb} (95%)

diff --git a/meta-perl/recipes-perl/libmodule/libmodule-build-tiny-perl_0.043.bb b/meta-perl/recipes-perl/libmodule/libmodule-build-tiny-perl_0.045.bb
similarity index 95%
rename from meta-perl/recipes-perl/libmodule/libmodule-build-tiny-perl_0.043.bb
rename to meta-perl/recipes-perl/libmodule/libmodule-build-tiny-perl_0.045.bb
index dd60d01db4..17ee50d7c8 100644
--- a/meta-perl/recipes-perl/libmodule/libmodule-build-tiny-perl_0.043.bb
+++ b/meta-perl/recipes-perl/libmodule/libmodule-build-tiny-perl_0.045.bb
@@ -15,7 +15,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=6374136f6774db2f51cc116f5efbf705"
 DEPENDS = "libextutils-config-perl-native libextutils-helpers-perl-native libextutils-installpaths-perl-native"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/L/LE/LEONT/Module-Build-Tiny-${PV}.tar.gz"
-SRC_URI[sha256sum] = "68f4e4620e8a75124ce2dadee48d2ba5160b9167012924588d6fb242ff2d7206"
+SRC_URI[sha256sum] = "d20692eee246d0b329b7f7659f36286b14ae0696fe91078a64b7078f8876d300"
 
 S = "${WORKDIR}/Module-Build-Tiny-${PV}"
 
-- 
2.34.1


