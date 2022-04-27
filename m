Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63ECFC433F5
	for <webhook@archiver.kernel.org>; Thu, 28 Apr 2022 06:38:04 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web12.7003.1651127874392551135
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Apr 2022 23:37:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=FVLjXE3X;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1651127872; i=@fujitsu.com;
	bh=sNkH68g51oMhC2/Qo5nhEDWIjA7UXeASXBbMe/JU8yg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=FVLjXE3X4s4ny7zFv2jGrP2vuUnJOaXt29J0D4znExb4BXFQoYhZ2E69+IcTfjlH1
	 5SLk1M3f9kF8DmJ1HvEYD/KebP8L+vtgPbaLpJn83jWhjQPX7+pQHSuPxfIosrfk/n
	 /esbM260grEds3Pz6nHSvOsNCXviSysKpMJhLib9+dO+f9RBsYJt87n6QoH4xga/J1
	 MlJbckMBc2G5Jm+M4+HeZ+UKGcW6Sv+OxAw3IOvPXEPlMEm4tf8+VdFRm9Et6tGktm
	 12r9Pg2zef+uU+MT2n9SD7W1Qy3y92zvposSC1rhj09I1zjfm6evB/0WCETj0vm3nY
	 dJfbu2+vzkGfw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrNIsWRWlGSWpSXmKPExsViZ8MxSdfBLCv
  J4Px2XouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePb+cSCWxwV17d+Y2lg7ODoYuTiEBJ4wiix
  9dEeZgjnApPE9SmNjBDOHkaJHye7gDKcHGwCahLTb91gBbFFBPQlls7eAxZnFlCRePG7hx3EF
  hbwkdh+8iFYnEVAVWJpz2lGEJtXwEni2YYvLCC2hICCxJSH78FqOAWcJX6+mwjWKwRU0zdpEh
  NEvaDEyZlPWCDmS0gcfPGCGaJXUWL25WaoORUSs2a1MUHYahJXz21insAoOAtJ+ywk7QsYmVY
  xWicVZaZnlOQmZuboGhoY6BoamuoaW+gaGpnrJVbpJuqlluqWpxaX6BrpJZYX66UWF+sVV+Ym
  56To5aWWbGIEhnFKsVr9DsYXK3/qHWKU5GBSEuW1Ms1KEuJLyk+pzEgszogvKs1JLT7EKMPBo
  STBm20ClBMsSk1PrUjLzAHGFExagoNHSYRXxhgozVtckJhbnJkOkTrFqCglzrsQZKYASCKjNA
  +uDRbHlxhlpYR5GRkYGIR4ClKLcjNLUOVfMYpzMCoJ80aDTOHJzCuBm/4KaDET0OKVRZkgi0s
  SEVJSDUxlfKYVihaicpvYj1SpO/q8ORjN876zPcNt7YnOrSbv3bpqBfPf2RUddRfcZr7uolzV
  4uAHuwXqp+RsZdhn7mW23kPh6NNePflC9fU3rdiEc5KEXR9/+lEr+fjVyfMnq5tqvxoEel58F
  231VnfKpPeHvpsFrPt08lFFyT2Lb46NynMiik9f0bENLrCa7RLk6iayQrl836U17MeP5JjY5U
  sWXrihWrZeafWS+H3a5zdF7hHi3apoUHbQYW9N+1fWXM/Th1fqv1E5NVvP4IuNauDhw2syxKO
  5eqYeTPqzznKtvVVq517rD40T5utrNc5ZGRd69EKG545P+dmZRxq5l1fGny9eXLP37AHX/6vn
  X1diKc5INNRiLipOBABT++ybXgMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-19.tower-565.messagelabs.com!1651127872!130669!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 24120 invoked from network); 28 Apr 2022 06:37:52 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-19.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 28 Apr 2022 06:37:52 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 9310110044C
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Apr 2022 07:37:51 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 7D9F7100446
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Apr 2022 07:37:51 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 28 Apr 2022 07:37:42 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-websockets: upgrade 10.2 -> 10.3
Date: Thu, 28 Apr 2022 06:53:29 +0800
Message-ID: <1651100009-17477-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1651100009-17477-1-git-send-email-wangmy@fujitsu.com>
References: <1651100009-17477-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 28 Apr 2022 06:38:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96820

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-websockets_10.2.bb => python3-websockets_10.3.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-websockets_10.2.bb => python3-websockets_10.3.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-websockets_10.2.bb b/meta-python/recipes-devtools/python/python3-websockets_10.3.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-websockets_10.2.bb
rename to meta-python/recipes-devtools/python/python3-websockets_10.3.bb
index c8179df5b1..64b96d3ed7 100644
--- a/meta-python/recipes-devtools/python/python3-websockets_10.2.bb
+++ b/meta-python/recipes-devtools/python/python3-websockets_10.3.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=78c2cc91e172ca96d6f8e4a76c739ec6"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "8351c3c86b08156337b0e4ece0e3c5ec3e01fcd14e8950996832a23c99416098"
+SRC_URI[sha256sum] = "fc06cc8073c8e87072138ba1e431300e2d408f054b27047d047b549455066ff4"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.25.1


