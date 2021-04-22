Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.3])
 by mx.groups.io with SMTP id smtpd.web09.8394.1619071069993450911
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Apr 2021 22:57:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=TBroaUpy;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.3, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1619071067; i=@fujitsu.com;
	bh=tmdmk49uuRfH5saafhFuevSKyuMX0JTZNOHBYI635Ys=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=TBroaUpybfxB5HjWsJ72EqWHw1MiYN3Rrs+NFHIzftwWyLfFworW7ve/FZvSEw+wM
	 6SYOHIsDQ/9JCzLAU5HAYh4QlWtjQ9rNrTvpwj5r5Dbt/gSd6jK9JmkN7wIWGGMm1i
	 BqyapEKmHEuOABbXo0m/Kcq52LqoAkQ9glytz8lOYV2qEEWALbx1YmeXzreW0TiVCh
	 21hDZbseFDljnvF/6Z9+LWg4HzdQe6De97uGcLGhtKOuOvSXFIIy++VvpErT/9udBg
	 Ms9DuFLgkw8hOzzS+dndkjDr1rNTdAV5Yg91AZ66Sv+8Lu05hB7BhZkFsW6CJ40vDX
	 H0wy7csh3FNXA==
Received: from [100.113.3.92] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-a.eu-central-1.aws.symcld.net id AF/D7-41911-B5011806; Thu, 22 Apr 2021 05:57:47 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuphkeJIrShJLcpLzFFi42Kxs+GYohsl0Jh
  gMOW0jcXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmvHilUVBD1fFhzUr2RoYN3B2MXJxCAnMZpL4
  dX4hK4RznFFixZ0/bF2MnBxsAjoSHS+6WUBsEQF9iaWz9zCD2MICThKHNneA2SwCqhJzv60Hq
  +EVcJO43PeIHcSWEFCQmPLwPTNEXFDi5MwnYDXMAhISB1+8YIaoUZTYvvMMC4RdKbF92lnGCY
  w8s5C0zELSsoCRaRWjZVJRZnpGSW5iZo6uoYGBrqGhsS6QNDbQS6zSTdRLLdVNTs0rKUoEyuo
  llhfrFVfmJuek6OWllmxiBAZSSiFD0w7Gd68+6B1ilORgUhLlXcjXmCDEl5SfUpmRWJwRX1Sa
  k1p8iFGGg0NJgvcISE6wKDU9tSItMwcY1DBpCQ4eJRHe37xAad7igsTc4sx0iNQpRkUpcd6dI
  H0CIImM0jy4NlgkXWKUlRLmZWRgYBDiKUgtys0sQZV/xSjOwagkzHsWZApPZl4J3PRXQIuZgB
  ZrT6kFWVySiJCSamCKzpB9HNomVuKiWCxbzvBxrczn/gnRZZf9o7XcLB71v5dSqf7p8MFqSaP
  8utvv9pyq8nd49GeJlenF6yz5Phzfdf9lOidHa8Ru0Q2d9fXoPJuOaelcNxnzWn2ObZux+pLj
  oa7cN2ULrI6eWP1qf9ahqyvd2QLdcq3Z30wWdj3/8s/frTdEbuTX899hFHV5+d/6lYeBeMy3W
  9KXj39c+n/ru4Xvi6Wv31JTajVZ7XSrRe/tZxvLe1s+SrxoezfdrEvhap52Y2Cc8wnrM7Un+f
  jbm9QWVVzf1Pk8XmHuB+7Jc/VjctSXMvpcLHiuf0t7lcdSE6uIZ01q28tT9aqyvOqVn2QWGTc
  J/e3gOuW57q4SS3FGoqEWc1FxIgCBSECsHwMAAA==
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-9.tower-226.messagelabs.com!1619071066!77030!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 31389 invoked from network); 22 Apr 2021 05:57:46 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-9.tower-226.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 22 Apr 2021 05:57:46 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 13M5vknx015951
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 22 Apr 2021 06:57:46 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 22 Apr 2021 06:57:44 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] libdvdread: upgrade 6.1.1 -> 6.1.2
Date: Fri, 23 Apr 2021 01:57:37 +0800
Message-ID: <1619114257-4875-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 .../libdvdread/{libdvdread_6.1.1.bb => libdvdread_6.1.2.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-multimedia/libdvdread/{libdvdread_6.1.1.bb => libdvdread_6.1.2.bb} (71%)

diff --git a/meta-oe/recipes-multimedia/libdvdread/libdvdread_6.1.1.bb b/meta-oe/recipes-multimedia/libdvdread/libdvdread_6.1.2.bb
similarity index 71%
rename from meta-oe/recipes-multimedia/libdvdread/libdvdread_6.1.1.bb
rename to meta-oe/recipes-multimedia/libdvdread/libdvdread_6.1.2.bb
index 65f5b6adf4..ed7443dfd4 100644
--- a/meta-oe/recipes-multimedia/libdvdread/libdvdread_6.1.1.bb
+++ b/meta-oe/recipes-multimedia/libdvdread/libdvdread_6.1.2.bb
@@ -4,8 +4,8 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=64e753fa7d1ca31632bc383da3b57c27"
 
 SRC_URI = "http://download.videolan.org/pub/videolan/libdvdread/${PV}/libdvdread-${PV}.tar.bz2"
-SRC_URI[md5sum] = "09c7423568fb679279fd2a2bc6b10b6e"
-SRC_URI[sha256sum] = "3e357309a17c5be3731385b9eabda6b7e3fa010f46022a06f104553bf8e21796"
+SRC_URI[md5sum] = "034581479968405ed415c34a50d00224"
+SRC_URI[sha256sum] = "cc190f553758ced7571859e301f802cb4821f164d02bfacfd320c14a4e0da763"
 
 inherit autotools lib_package binconfig pkgconfig
 
-- 
2.25.1

