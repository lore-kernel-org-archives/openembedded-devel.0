Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EA91C433EF
	for <webhook@archiver.kernel.org>; Tue,  9 Nov 2021 15:09:28 +0000 (UTC)
Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com
 [85.158.142.116])
 by mx.groups.io with SMTP id smtpd.web12.13354.1636470567309720964
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Nov 2021 07:09:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=dIugL/Of;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.116,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1636470565; i=@fujitsu.com;
	bh=dbnGqOjmNJV+Ogpe813iTBKOSXDK5BWQ1bonO+HfBpA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=dIugL/OffYMedEOu9AummBf51uktncv7vggXpXIFng9tjX9QCfi3RbTjd8eR2SKjO
	 f4PI/UCXArEbrcRsbHT1sUM7h3+ThaUI1kVkjATDxN08sCm6SWcVw9w43IpxpE7bF9
	 BkpAAA++7SBq/ZRay69uEmNEW8QyUu+cwxPVkde7JaY1+W1uIMT9ABrjsqTmkBWPFT
	 ctOcakSqfumSnnl0kx8U5j3QXKc9Q/qgl4mNmGtglIjXPzcCIinHQ5xg9hsRjrXpjG
	 m4Yzv3rUlbs5n7+APe6eGyJCsWMATKrPfOQyV6pfzlBGNnsK3UP6rlU6yJ/06gq76g
	 2x0Ovg/UGa+Cw==
Received: from [100.113.4.50] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-5.bemta.az-b.eu-central-1.aws.symcld.net id 98/01-25178-52F8A816;
 Tue, 09 Nov 2021 15:09:25 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrEIsWRWlGSWpSXmKPExsViZ8MxSVelvyv
  RYPIiPYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPx5YvsBUv4K9bencXcwHiIt4uRi0NI4Amj
  xLS931ggnAtMEreW3GeCcI4zSjSdnQHkcHKwCahJTL91gxXEFhHQl1g6ew8ziM0soCLx4ncPO
  4gtLOAt8WDmJbA4C1C8acZ0sF5eASeJHTtvM4LYEgIKElMevmeGiAtKnJz5hAVijoTEwRcvmC
  FqFCVmX25mgbArJGbNamOCsNUkrp7bxDyBkX8WkvZZSNoXMDKtYrRMKspMzyjJTczM0TU0MNA
  1NDTWNdc1MjbUS6zSTdJLLdVNTs0rKUoEyuollhfrFVfmJuek6OWllmxiBAZlSiH78x2Mq958
  0DvEKMnBpCTK+6+rK1GILyk/pTIjsTgjvqg0J7X4EKMMB4eSBO8WkJxgUWp6akVaZg4wQmDSE
  hw8SiK8Yh1Aad7igsTc4sx0iNQpRkUpcd7+eqCEAEgiozQPrg0WlZcYZaWEeRkZGBiEeApSi3
  IzS1DlXzGKczAqCfMm9QJN4cnMK4Gb/gpoMRPQ4oNf2kEWlyQipKQamCZzrupJULnEfOzCdse
  YHvfeiOcHN//ZYH973uqKU2md2gtEk9aaLvkS0xrlYO95+cXXgrYdYWorbYSm6THeir+yny+v
  bdZr1smLEkNPSG2+dTrxhel8yz6XdRWBVm09zfP9j4sUT180a3HBv9XbwxbNFPwjIjjj7+VJ6
  89IzjGbejpKrEaYwW7GFMGnOVcd5QqPPI5UUi87MO3xnC3PGWY7LV+yPc1Oc1vkmRabmoNPzV
  aoyV9jTZis+X157roDJ5N9Ni8ur1ZO2rDuZefNPKY7PjGzJHP+L1vxNWhxhRl/3sm1fIs5Szd
  GXNoh/Uvq4bSKRXnWfRlfo5RCNO23S0VN2Moy24k1Yvuxxo/danuUWIozEg21mIuKEwEwWNd4
  RQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-3.tower-245.messagelabs.com!1636470564!11431!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 25549 invoked from network); 9 Nov 2021 15:09:24 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-3.tower-245.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 9 Nov 2021 15:09:24 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 339B810046C
	for <openembedded-devel@lists.openembedded.org>;
 Tue,  9 Nov 2021 15:09:24 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 26B4E100440
	for <openembedded-devel@lists.openembedded.org>;
 Tue,  9 Nov 2021 15:09:24 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.24; Tue, 9 Nov 2021 15:09:01 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] fetchmail: upgrade 6.4.21 -> 6.4.23
Date: Tue, 9 Nov 2021 23:08:51 +0800
Message-ID: <1636470531-61193-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Nov 2021 15:09:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93885

fetchmail-6.4.23 (released 2021-10-31, 30206 LoC):

 For common ssh-based IMAP PREAUTH setups (i. e. those that use a plugin
 - no matter its contents - and that set auth ssh), change the STARTTLS
 error message to suggest sslproto '' instead.
 This is a commonly reported issue after the CVE-2021-39272 fix in 6.4.22.
 Fixes Redhat Bugzilla 2008160. Fixes GitLab #39.

License-Update:
 Add "SSL library considerations" to COPYING.
 Format of COPYING changed.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../fetchmail/{fetchmail_6.4.21.bb => fetchmail_6.4.23.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/fetchmail/{fetchmail_6.4.21.bb => fetchmail_6.4.23.bb} (83%)

diff --git a/meta-networking/recipes-support/fetchmail/fetchmail_6.4.21.bb b/meta-networking/recipes-support/fetchmail/fetchmail_6.4.23.bb
similarity index 83%
rename from meta-networking/recipes-support/fetchmail/fetchmail_6.4.21.bb
rename to meta-networking/recipes-support/fetchmail/fetchmail_6.4.23.bb
index 892e02844d..9599837644 100644
--- a/meta-networking/recipes-support/fetchmail/fetchmail_6.4.21.bb
+++ b/meta-networking/recipes-support/fetchmail/fetchmail_6.4.23.bb
@@ -6,13 +6,13 @@ connections). It supports every remote-mail protocol now in use on the Internet:
 RPOP, APOP, KPOP, all flavors of IMAP, ETRN, and ODMR. It can even support IPv6 and IPSEC."
 SECTION = "mail"
 LICENSE = "GPLv2 & MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=ad73c6bd421c137fbf18cf8b92474186"
+LIC_FILES_CHKSUM = "file://COPYING;md5=c3a05d9b9d3784c824c9b92a648e1353"
 
 DEPENDS = "openssl"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.xz \
            "
-SRC_URI[sha256sum] = "6a459c1cafd7a1daa5cd137140da60c18c84b5699cd8e7249a79c33342c99d1d"
+SRC_URI[sha256sum] = "5f7a5e13731431134a2ca535bbced7adc666d3aeb93169a0830945d91f492300"
 
 inherit autotools gettext pkgconfig python3-dir python3native
 
-- 
2.25.1


