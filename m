Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7421FC3A59D
	for <webhook@archiver.kernel.org>; Mon, 24 Oct 2022 08:09:26 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web12.16950.1666598961204560840
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 24 Oct 2022 01:09:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=HyrS+j5g;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1666598959; i=@fujitsu.com;
	bh=4+R6/O8/GiX5+/ovW6iDPaVWAJcs7b1TYtSylba/NMA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=HyrS+j5gTuystOHPUsyAjwi4/bBWZDNgi5SdWfnyVNxp6IpM13n7OygwzsjH7u4h6
	 ScFYcw/bH+8by06YTdZs1YMuV4qdH3dQ1RQ5S1yCBrVWh2LDVIRDuH2P08Ccge3dG6
	 NqqM3iZOGvQtwn305OcyulHwZ7kVVPP+Zt8C0pLplct/0VBE2AtWqvldbFT1Q4TG2m
	 v4O4WebdI+Uz6rEb6rPRfCpFO9EOcFxk5FbFkEj3Z7OK2XazkyBZa227Fh0DceOAOu
	 bprH4JK38tXHfDY8TW7zur3U5HWl5/QOG9pUNFhRR2aNF1Qlqwn0NHAmpE17XtOwE4
	 qojZRtbJqT3Fw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrFIsWRWlGSWpSXmKPExsViZ8MxSVffIyz
  ZYPIiDouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePRhEdMBQc5K/rmvWVsYHzB0cXIxSEk8IRR
  4v+PBiYI5zqTRPfCp6wQzh5GiZtLTjN3MXJysAlISdy4/58NxBYR0JdYOnsPWJxZQEXixe8ed
  hBbWCBA4sy6eUwgNouAqsTJ22/B4rwCThLXHpxiAbElBBQkpjx8zwwRF5Q4OfMJC8QcCYmDL1
  4wQ9QoSsy+3AxVXyExa1YbE4StJnH13CbmCYz8s5C0z0LSvoCRaRWjaXFqUVlqka65XlJRZnp
  GSW5iZo5eYpVuol5qqW55anGJrpFeYnmxXmpxsV5xZW5yTopeXmrJJkZgMKYUq1rsYFy/7I/e
  IUZJDiYlUV4G8bBkIb6k/JTKjMTijPii0pzU4kOMMhwcShK8i12BcoJFqempFWmZOcDIgElLc
  PAoifBGuAGleYsLEnOLM9MhUqcYdTlmfm07wCzEkpeflyolzlsCUiQAUpRRmgc3AhallxhlpY
  R5GRkYGIR4ClKLcjNLUOVfMYpzMCoJ85aCTOHJzCuB2/QK6AgmoCMurQgCOaIkESEl1cAkuM7
  74XGX35rnjb/0bBJf+GThsoKAgIU/DM/k3ZYSvXFy05IjUVxOj/dsESx6cOvc35/WRrrh37I5
  ZincO69meCbK/swJ7RhH9uLf9acZmA0+njV4pHUlu2bJwZXyQt26Tw8tFvFv6E5pcpjgKHH9T
  vnLM2yx/1WTw99NW7v4bZqwoYnBR/OLVWt178hNnXhpeuhOjZkaU489XOz7Zkv73AQWw+a8sI
  tydq0HzqatOvhT3/lE6PGdkzcqJz3fIDXtjcD8zuDt8X7eS1PUODZ68m2/eo3r9mSZbbM5HGa
  nvXwoXnVwUgVfzoNi5YKqewcDih+/aA9L8t9yfiLzM/fvsin9aWnMnHELykvs301/qcRSnJFo
  qMVcVJwIAFMLzyNNAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-7.tower-565.messagelabs.com!1666598959!217251!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.100.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 5783 invoked from network); 24 Oct 2022 08:09:19 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-7.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 24 Oct 2022 08:09:19 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id D0C8A1000DC
	for <openembedded-devel@lists.openembedded.org>; Mon, 24 Oct 2022 09:09:18 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id C15601000D2
	for <openembedded-devel@lists.openembedded.org>; Mon, 24 Oct 2022 09:09:18 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 24 Oct 2022 09:09:17 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-sqlalchemy: upgrade 1.4.41 -> 1.4.42
Date: Mon, 24 Oct 2022 16:08:57 +0800
Message-ID: <1666598937-30546-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Mon, 24 Oct 2022 08:09:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99293

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-sqlalchemy_1.4.41.bb => python3-sqlalchemy_1.4.42.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-sqlalchemy_1.4.41.bb => python3-sqlalchemy_1.4.42.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.41.bb b/meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.42.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.41.bb
rename to meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.42.bb
index 5b93458792..6999554b81 100644
--- a/meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.41.bb
+++ b/meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.42.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://www.sqlalchemy.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f4001d1ca15b69d096fa1b4fd1bdce79"
 
-SRC_URI[sha256sum] = "0292f70d1797e3c54e862e6f30ae474014648bc9c723e14a2fda730adb0a9791"
+SRC_URI[sha256sum] = "177e41914c476ed1e1b77fd05966ea88c094053e17a85303c4ce007f88eff363"
 
 PYPI_PACKAGE = "SQLAlchemy"
 inherit pypi setuptools3
-- 
2.25.1


