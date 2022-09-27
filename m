Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4B32C07E9D
	for <webhook@archiver.kernel.org>; Tue, 27 Sep 2022 08:23:42 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.65])
 by mx.groups.io with SMTP id smtpd.web08.8252.1664267021798223459
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Sep 2022 01:23:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=wdh2XD+V;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.65,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1664267020; i=@fujitsu.com;
	bh=hm3YhvhUCQCfSc7KhjTeUeWhQE2FQs4QjsVceNb4cb0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=wdh2XD+Vdq1tVwo3JOkdBLdagJORDKhkZLG8YKEHp00WyZ20bHAzhXTUAvcIB9FBc
	 gg6yXpopTLxYvx1BhIwoJsDS4ISWcORF/FtXaj8Xzs1oX54GiRhe20QG1DuHCu+QCm
	 6XlSJjMnpIe1Q0LCr+86ELw44GV/tWkIbqGaRAohHKnMDpx6kDqsPB6/MjD5VrEdq6
	 xkwtDzPTWXY/L0GluGKGY7OPEYFGV5AZDiU0SKfdlSFjtua6CYEIp+OC2+7k1vcM0u
	 1InZoSGRaJPUydHphKSpTp3Bg5M17BZ/uKotJer9qxONkwHltf+8tpWDTxZHrzJJ04
	 pPNTOM+gKbufg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrGIsWRWlGSWpSXmKPExsViZ8MxSZd7s1G
  ywfWFBhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bnfy9ZCxZzVEzt387cwLiTvYuRi0NI4Amj
  xIcL3awQznUmiaf/TkM5exglLn8+C1TGycEmoCYx/dYNVhBbREBfYunsPcwgNrOAisSL3z1gN
  cICjhJvJ31mAbFZBFQlji68DBbnBYq3NM4G65UQUJCY8vA9WC+ngJPEmQVzgeo5gJY5SmxYJg
  pRLihxcuYTFojxEhIHX7xghmhVlJh9uZkFwq6QaJx+iAnCVpO4em4T8wRGwVlI2mchaV/AyLS
  K0SqpKDM9oyQ3MTNH19DAQNfQ0FTXVNfIyFQvsUo3US+1VLc8tbhE11AvsbxYL7W4WK+4Mjc5
  J0UvL7VkEyMwiFOKWR/uYFzc91PvEKMkB5OSKK/9IqNkIb6k/JTKjMTijPii0pzU4kOMMhwcS
  hK8TOuBcoJFqempFWmZOcCIgklLcPAoifCuWwKU5i0uSMwtzkyHSJ1i1OWY+bXtALMQS15+Xq
  qUOK/QJqAiAZCijNI8uBGw6L7EKCslzMvIwMAgxFOQWpSbWYIq/4pRnINRSZhXBmQKT2ZeCdy
  mV0BHMAEdYcenD3JESSJCSqqBqenIYQe33oqiht5zvNfV+I2khIUCVBwem1/n11h0sSWtcqnx
  6RVNV869+vVu343nkeukpQIal6/hlFS8t/VSjx4Xl++teXq2s1UuOf4KfyisvOQxn8pZxuhzh
  t56nCuZOX4EXSsMebCjSt3nnKqUpve+iiOMp11eaC0I+fHofnZSlOiSKqH/f3hWnErK5y4t+r
  bH7M35W5MCW462/LMsVU47Pttg/qNILYbpESEGu78eXT/bMa2Bq+97+tz+z28Cp/g4bt5m8vp
  xU2doMGvGN1HFjZ5dKYzHFSMagziZO5evY5e6luOX37NSKpWvZrdu0NaK8hMnHjnxxoUGH45f
  /97t4afYgAkTXY6/CS1QYinOSDTUYi4qTgQAzvu9jmkDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-18.tower-587.messagelabs.com!1664267019!868651!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 31705 invoked from network); 27 Sep 2022 08:23:39 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-18.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 27 Sep 2022 08:23:39 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 6C7B61000C1
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Sep 2022 09:23:39 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121
 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 5FD6F100078
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Sep 2022 09:23:39 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 27 Sep 2022 09:23:37 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH] yelp-xsl: upgrade 42.0 -> 42.1
Date: Tue, 27 Sep 2022 16:23:22 +0800
Message-ID: <1664267003-2293-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1664267003-2293-1-git-send-email-wangmy@fujitsu.com>
References: <1664267003-2293-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Sep 2022 08:23:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98972

Changelog:
=========
* Updated translations:
  bg
  hr
  ka
  sr
  sv

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-gnome/yelp/{yelp-xsl_42.0.bb => yelp-xsl_42.1.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/yelp/{yelp-xsl_42.0.bb => yelp-xsl_42.1.bb} (85%)

diff --git a/meta-gnome/recipes-gnome/yelp/yelp-xsl_42.0.bb b/meta-gnome/recipes-gnome/yelp/yelp-xsl_42.1.bb
similarity index 85%
rename from meta-gnome/recipes-gnome/yelp/yelp-xsl_42.0.bb
rename to meta-gnome/recipes-gnome/yelp/yelp-xsl_42.1.bb
index 54a6aa6163..ba2536443f 100644
--- a/meta-gnome/recipes-gnome/yelp/yelp-xsl_42.0.bb
+++ b/meta-gnome/recipes-gnome/yelp/yelp-xsl_42.1.bb
@@ -10,7 +10,7 @@ inherit gnomebase gettext itstool
 
 DEPENDS += "libxml2"
 
-SRC_URI[archive.sha256sum] = "29b273cc0bd16efb6e983443803f1e9fdc03511e5c4ff6348fd30a604d4dc846"
+SRC_URI[archive.sha256sum] = "238be150b1653080ce139971330fd36d3a26595e0d6a040a2c030bf3d2005bcd"
 
 RDEPENDS:${PN}:append:class-target = " libxml2 itstool"
 
-- 
2.25.1


