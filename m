Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93308CCA473
	for <webhook@archiver.kernel.org>; Mon, 27 Jun 2022 06:59:46 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web11.38594.1656313180338248491
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 26 Jun 2022 23:59:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=k+fn58+x;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1656313182; i=@fujitsu.com;
	bh=FNcGKwvksuJUac9SfdNG3LqTjzPpOizxFAeWDpdpDPA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=k+fn58+xI6o+QgH/ERvdG2WRkkhE3fPp602PMdPWeGD8nhc4qXpJmCrtEKyqpY7Gk
	 uJZG0E4LibOzftLzt7aELNi7D3Ji78eVfdD61NMrmvwSplxpHbKWAtGQMeTwGZuuUJ
	 DGgImNITrwOQC3UuhF9qnzB0nlu7SzKIhSgCw5t/r96qfze2EnQAPejipB0/t1oTwC
	 Si51zc5dhFwEHFXYG/rf6yngOIWxLC6Ww7meY6sDfSFcN6YhGSZnU1KI5Uu0fqCwtm
	 5SsTU7VMwmevbOpyPIPfG7pfM6oh7v9++iOMLaM0CxvdbmDCFo58OccL4ch1Y/V9tI
	 muZqZST30IjrQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrLIsWRWlGSWpSXmKPExsViZ8ORpBsXujP
  J4O43XouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNaPl8TH2gqXcFRsuv2RqYPzH2cXIxSEk8JBR
  YuaViewQzhUmiQcrvzFDOHsYJU42/wJyODnYBNQkpt+6wQpiiwjoSyydvQcsziygIvHidw87i
  C0sYCnx8m8LI4jNIqAqcfhcJ1g9r4CTxLxvS8HqJQQUJKY8fA9mcwo4S7yY+BSolwNomZPEro
  dGEOWCEidnPmGBGC8hcfDFC6hWRYnZl5tZIOwKiRkztrFB2GoSV89tYp7AKDgLSfssJO0LGJl
  WMdomFWWmZ5TkJmbm6BoaGOgaGppCaEtzvcQq3US91FLdvPyikgxdQ73E8mK91OJiveLK3OSc
  FL281JJNjMBQTilOObqD8di+X3qHGCU5mJREeU+p7UwS4kvKT6nMSCzOiC8qzUktPsQow8GhJ
  MFrFQKUEyxKTU+tSMvMAcYVTFqCg0dJhLfNGyjNW1yQmFucmQ6ROsWoKCXOuzsIKCEAksgozY
  Nrg8XyJUZZKWFeRgYGBiGegtSi3MwSVPlXjOIcjErCvGwg23ky80rgpr8CWswEtNhv4g6QxSW
  JCCmpBqbqVV+u5zaeajl02P3il007rwQK175XbrhZcbvBnPP3R0Ut+dWXPcTerYxb/WFlj6yO
  odaX/zkiqdWG+ZNXsmXNtzgc09pipD5jw/urZ+OnfHLhbVjG/eaDp4dinFv1uxxrS28HEaUDm
  54EVH1ran4bwvxVsvmS49uNFendAo5yJQIvKrc0e6jXpnUc+z5fZsfVwKMzjya6yUU+3VVUlm
  Pw+UoP+277P4fetKTumusQ1SPzv14zbbV0ooTsPKG1+4ucP33p9vH5nHhWqqLp5gZ1oX8mDl0
  yF1fOnV0/y38K24sT2SsXPepwXKBRWP1McqvTIqlv25V+Hllk+HuuU/5VEd3U8NQfhtX59bNd
  epVYijMSDbWYi4oTAZrDVf1gAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-8.tower-732.messagelabs.com!1656313181!150206!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 31981 invoked from network); 27 Jun 2022 06:59:42 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-8.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 27 Jun 2022 06:59:42 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id A54501B2
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Jun 2022 07:59:41 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 9918C1A3
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Jun 2022 07:59:41 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 27 Jun 2022 07:59:40 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] iwd: upgrade 1.27 -> 1.28
Date: Mon, 27 Jun 2022 14:59:19 +0800
Message-ID: <1656313160-23805-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1656313160-23805-1-git-send-email-wangmy@fujitsu.com>
References: <1656313160-23805-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Jun 2022 06:59:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97593

Changelog:
==========
  Fix issue with handling invalid EAPoL frames.
  Fix issue with handling unexpectedly unencrypted EAP frames.
  Fix issue with handling AlwaysRandomizeAddress/AddressOverride.
  Fix issue with handling initial signal level notification.
  Fix issue with handling sorting of scan requests.
  Fix issue with handling frame type check in FT.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-connectivity/iwd/{iwd_1.27.bb => iwd_1.28.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/iwd/{iwd_1.27.bb => iwd_1.28.bb} (94%)

diff --git a/meta-oe/recipes-connectivity/iwd/iwd_1.27.bb b/meta-oe/recipes-connectivity/iwd/iwd_1.28.bb
similarity index 94%
rename from meta-oe/recipes-connectivity/iwd/iwd_1.27.bb
rename to meta-oe/recipes-connectivity/iwd/iwd_1.28.bb
index dc29bc3fd..40f35b15a 100644
--- a/meta-oe/recipes-connectivity/iwd/iwd_1.27.bb
+++ b/meta-oe/recipes-connectivity/iwd/iwd_1.28.bb
@@ -8,7 +8,7 @@ DEPENDS = "ell"
 SRC_URI = "https://www.kernel.org/pub/linux/network/wireless/${BP}.tar.xz \
            file://0001-build-Use-abs_top_srcdir-instead-of-abs_srcdir-for-e.patch \
            "
-SRC_URI[sha256sum] = "013b4a0a79629c20d915954fc3b5d0620ef6e0d6065db3c342f4b3f9111f46ec"
+SRC_URI[sha256sum] = "ee538c720ad15335ece81a52a4b8a11820236df9ed9a5a72a2e64d74c652f0b0"
 
 inherit autotools manpages pkgconfig python3native systemd
 
-- 
2.25.1


