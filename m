Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3289C433FE
	for <webhook@archiver.kernel.org>; Mon, 16 May 2022 15:07:11 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.65])
 by mx.groups.io with SMTP id smtpd.web11.30054.1652713621426201203
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 May 2022 08:07:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=hVz4oxgW;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.65,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1652713619; i=@fujitsu.com;
	bh=8NqWucu4SNv34/vlUDgFS5EHT5bG/RQK9U8Wm6ozif8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=hVz4oxgWGyfvu7otxMzHqllRz20TIcqnmgFjYA5nZFT3eSn8UM1VIzncKMOCIdHK0
	 RvP+PwRgty5u+waWIYYr+DLJ5AkBF74mPErMDT9ipGdqDMEZjiDVbNRdEPWalM4lT9
	 S7izPaTFTquDhHmFWIMjBhaAMYyr9qqMGzjTYk1ZeDQsetKUW+8g8MpWyshNL2Jq//
	 zaHbX9Nrpwn5yzlVaAvFxVPcVrk459YTO4RK6iwfxlr3RSE6XJolM6tDhgNtFXL6uN
	 ABps6GNIjuR2fOiUVOwoHfOQd5OrHv/7aOSjig/DBctvYVdXlaR+wuyKosxvtQzNOo
	 uEQn41xBwhhUA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrOIsWRWlGSWpSXmKPExsViZ8ORqDspoyn
  JYNsnQ4uLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWP78m7mgm88FfPv7WFuYDzF3cXIxSEk8IRR
  4sORu0wQzgUmiUkNv1ghnD2MEr/e32LsYuTkYBNQk5h+6wYriC0ioC+xdPYeZhCbWUBF4sXvH
  nYQW1jAU6K/8QBYPQtQfNXyXrB6XgEniUXTfoHVSwgoSEx5+B7M5hRwljh0bydYvRBQze6PU5
  kg6gUlTs58wgIxX0Li4IsXUL2KErMvN7NA2BUSM2ZsY4Ow1SSuntvEPIFRcBaS9llI2hcwMq1
  itEoqykzPKMlNzMzRNTQw0DU0NNU11TUyNdVLrNJN1Est1S1PLS7RNdRLLC/WSy0u1iuuzE3O
  SdHLSy3ZxAgM45Ri1v87GLv7fuodYpTkYFIS5V2T3JQkxJeUn1KZkVicEV9UmpNafIhRhoNDS
  YK3IQ0oJ1iUmp5akZaZA4wpmLQEB4+SCO/xeKA0b3FBYm5xZjpE6hSjLsfdhXv3Mgux5OXnpU
  qJ855MACoSACnKKM2DGwGL70uMslLCvIwMDAxCPAWpRbmZJajyrxjFORiVhHlN04Gm8GTmlcB
  tegV0BBPQESL6jSBHlCQipKQamI76C4tO3Jflsug1R3LEzv2VM2sPSK6tKHyn9mwac4fCnk8O
  J4uvihbZnNpxXGLVw1cMR6bI3GZwTIxyrJlbZJ6SEJoWGSYiYNF97OaxCUtdhKuSPt05+/D4m
  dlZjcznecND3EpPZ12u65x1Zv1bySze6jtLefjYLl21n/up38rtQusrd8tcl42SXM8mHX3K8D
  i0vyhp9qee5MwHy/8yXu49ciG+ziGjdmvId91toerZvWlCMfP2/nuT6XI+Uf/ejmcbc4VPvrj
  1aMfBySmJE0Tel1hdP2n2bepUpz5hy7AZ3hXxFWnJiloRPalBQqZ+K+TfuBZelZae8/LP56xN
  9+4k6R1K+lIVyeD93pZjoRJLcUaioRZzUXEiAP1n8WlqAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-10.tower-587.messagelabs.com!1652713618!181801!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 18578 invoked from network); 16 May 2022 15:06:58 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-10.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 16 May 2022 15:06:58 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 39872100192
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 May 2022 16:06:58 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 1BDAB10018B
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 May 2022 16:06:58 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 16 May 2022 16:06:26 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-webserver] [PATCH] phpmyadmin: upgrade 5.1.3 -> 5.2.0
Date: Fri, 6 May 2022 22:48:30 +0800
Message-ID: <1651848510-13012-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1651848510-13012-1-git-send-email-wangmy@fujitsu.com>
References: <1651848510-13012-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 16 May 2022 15:07:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97128

Changelog:
=========
* Removed support for Microsoft Internet Explorer
* Requires PHP 7.2 or newer
* Requires the openssl PHP extension
* Improved handling of system CA bundle and cacert.pem, falling back to Mozilla CA if needed
* Replace "master/slave" terms with "primary/replica"
* Add "NOT LIKE %...%" operator to Table search
* Add support for the Mroonga engine
* Add support for account locking
* Several fixes and improvements to the SQL parser library

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../phpmyadmin/{phpmyadmin_5.1.3.bb => phpmyadmin_5.2.0.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-webserver/recipes-php/phpmyadmin/{phpmyadmin_5.1.3.bb => phpmyadmin_5.2.0.bb} (94%)

diff --git a/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_5.1.3.bb b/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_5.2.0.bb
similarity index 94%
rename from meta-webserver/recipes-php/phpmyadmin/phpmyadmin_5.1.3.bb
rename to meta-webserver/recipes-php/phpmyadmin/phpmyadmin_5.2.0.bb
index 7ccc05ec3..45de45564 100644
--- a/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_5.1.3.bb
+++ b/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_5.2.0.bb
@@ -11,7 +11,7 @@ SRC_URI = "https://files.phpmyadmin.net/phpMyAdmin/${PV}/phpMyAdmin-${PV}-all-la
            file://apache.conf \
 "
 
-SRC_URI[sha256sum] = "c562feddc0f8ff5e69629113f273a0d024a65fb928c48e89ce614744d478296f"
+SRC_URI[sha256sum] = "66da31ca295f06182ac3f2e6e96057dc824c459baedf4b29de6ed0d3be039230"
 
 UPSTREAM_CHECK_URI = "https://www.phpmyadmin.net/downloads/"
 UPSTREAM_CHECK_REGEX = "phpMyAdmin-(?P<pver>\d+(\.\d+)+)-all-languages.tar.xz"
-- 
2.25.1


