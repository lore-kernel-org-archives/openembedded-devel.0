Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0701BC433EF
	for <webhook@archiver.kernel.org>; Mon,  7 Mar 2022 11:49:27 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web09.25479.1646653764538662584
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Mar 2022 03:49:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=T9brYnXA;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1646653762; i=@fujitsu.com;
	bh=ULaNMbbMI9M3q+gjzE1qvrnka4PmdQmuQpZhcOZu344=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=T9brYnXAEOZNh0ZYy5+0lgwluTGWc08Slb1WvdpodW1N4TrDFiufNr01CZnIVpVYO
	 u3qjgA7/Juw3Ym8hUUapir1waseuQ9zr2pkAs+USHxnwhev9JMaW+x8ksXzlVCAI0t
	 jr3wbD/hHMEAKoeqFiKTQdWs7KgR+Bm1Pl5d+C6APOu67Aa6Ar26M1NPVpTZnpDChw
	 /5Z9LxUBOSQucVTg7wfGXbapoHu0l/kgxW8aYzt4CvErVuZyFNNafLuK+zPY7nlnPe
	 MSaTQBTPE6sOruTkSPLIsdnTVDTdcn3vhchWS99JqCG2VFZS2h3Ji8M7Ez1bX0Ahci
	 aC0wTJGnscR3g==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrEIsWRWlGSWpSXmKPExsViZ8MRouv0UTX
  J4PE6DYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNaNr92W2gq2cFfc/9rE1MF7l6GLk4hASmMEk
  ceDOc/YuRk4g5zijxORLtiA2m4CaxPRbN1hBbBEBfYmls/cwg9jMAioSL373gNULC/hILDy/n
  w3EZgGK79pxESzOK+Ak8WXWFTBbQkBBYsrD92C9nALOElMvdbNA7HKS6D3YxApRLyhxcuYTFo
  j5EhIHX7xghuhVlJh9uZkFwq6QmDWrjWkCI/8sJC2zkLQsYGRaxWidVJSZnlGSm5iZo2toYKB
  raGiqa2wEZJroJVbpJuqlluqWpxaX6BrpJZYX66UWF+sVV+Ym56To5aWWbGIEBmVKsULGDsbv
  K3/qHWKU5GBSEuVNWaCaJMSXlJ9SmZFYnBFfVJqTWnyIUYaDQ0mC99MboJxgUWp6akVaZg4wQ
  mDSEhw8SiK8xy8BpXmLCxJzizPTIVKnGBWlxHk5PwAlBEASGaV5cG2wqLzEKCslzMvIwMAgxF
  OQWpSbWYIq/4pRnINRSZhXGmQKT2ZeCdz0V0CLmYAWV9kqgSwuSURISTUwhbc9a2X5vGv/SrU
  ravp/WPxnuCXK/Fy/S1Pm6adZ+l2fNWSYPzftnh5ddllLT3QNt+pXmS19/jLemveuuu3fY3vI
  543h7uX21r+mMDb2PXx3SMHnw7fS65Ob7wtFlf0NX7RwMsOllLqS53Y1HOf+3bzIlfB437Ty7
  Jeu2+9wrEvNusxXvv/mbKlnP8rnF07w8dnMuGmO4kvN92krtHdvVPD8/MA4KsjxxJ5CN9nc3q
  X7c9eEXzzltH329r/dp59eX6uw4UXnH86ozsKQ9g+ftlgaztsn6F92LEFNepN2ms5Bs45tn/0
  clvw8IxvR+jGkY+tHtjVTAwUCH7VsXsVy773wqko75TClaYas/d2MlkosxRmJhlrMRcWJAG/R
  ZQdFAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-2.tower-571.messagelabs.com!1646653762!25483!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 27998 invoked from network); 7 Mar 2022 11:49:22 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-2.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 7 Mar 2022 11:49:22 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 227BnF5e004738
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Mon, 7 Mar 2022 11:49:22 GMT
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Mon, 7 Mar 2022 11:49:16 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-scrypt: upgrade 0.8.19 -> 0.8.20
Date: Mon, 7 Mar 2022 19:49:01 +0800
Message-ID: <1646653744-55920-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1646653744-55920-1-git-send-email-wangmy@fujitsu.com>
References: <1646653744-55920-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Mar 2022 11:49:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95841

Changelog:
=========
Fix #8 by adding missing gettimeofday.c to MANIFEST.in

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-scrypt_0.8.19.bb => python3-scrypt_0.8.20.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-scrypt_0.8.19.bb => python3-scrypt_0.8.20.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-scrypt_0.8.19.bb b/meta-python/recipes-devtools/python/python3-scrypt_0.8.20.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-scrypt_0.8.19.bb
rename to meta-python/recipes-devtools/python/python3-scrypt_0.8.20.bb
index f0a9e1615..c38693268 100644
--- a/meta-python/recipes-devtools/python/python3-scrypt_0.8.19.bb
+++ b/meta-python/recipes-devtools/python/python3-scrypt_0.8.20.bb
@@ -5,7 +5,7 @@ HOMEPAGE="https://github.com/holgern/py-scrypt"
 
 SRC_URI += "file://0001-py-scrypt-remove-the-hard-coded-include-paths.patch"
 
-SRC_URI[sha256sum] = "ad143035ae0cf5e97c4b399f4e4686adf442c5f0f06f9f198a0cc6c091335fb7"
+SRC_URI[sha256sum] = "0d226c1c6744fb2e308b391410669b1df5cfe82637ffcb5ed489bf82b2d2eb78"
 
 inherit pypi ptest setuptools3 dos2unix
 
-- 
2.25.1


