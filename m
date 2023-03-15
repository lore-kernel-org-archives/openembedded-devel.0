Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94216C6FD1D
	for <webhook@archiver.kernel.org>; Wed, 15 Mar 2023 14:07:40 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web10.8962.1678889256444537561
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Mar 2023 07:07:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@fujitsu.com header.s=170520fj header.b=lHpqqERt;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1678889254; i=@fujitsu.com;
	bh=4VxYeKk26AwhEQwr9s7tYO7B9wTLVYseM97lJ7VHgcg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	b=lHpqqERtaRCraVnUkXjbDc3kLbx02mwWNw5UnG7pU2xzem0BjOBsVqXSW8+WcJUuE
	 K+p/2Ecq4qUFXtB3IMzvx6eJ4O/ErlT05DX0351OTOIk40oYG27la4WzdtMiCQtytS
	 3rdrQsSnk6MUV7oljQfnfUPi+bU90CiXdiHFNZs4UdqiX7nIjWHu1+y9vedTuso6+p
	 ARkFPcpyvTb0O6JmkZ7EoHkwV1x3QgEto/DOSIa2bYojOsGTFzEHOY/Q6W3/9UAfkf
	 bohoCYbry3gOiPrBggN7HcY7kEJNJcwU9zaPeGudGGUGXfntCYEdw2WCXjnkkR3IIV
	 uQ0/ZCqid391g==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrLIsWRWlGSWpSXmKPExsViZ8OxWVftomC
  KwdTF8hYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bD1TIFE/kqOj9+ZWlgfMjTxcjFISTwkFHi
  Z/N0VgjnMpPE6907mCCcPYwSa27uZOti5ORgE5CSuHH/P5gtIqAvsXT2HmYQm1lAReLF7x52E
  FtYwEfi7r0VLCA2i4CqxMxfjxlBbF4BJ4mLLx6D9UoIKEhMefgeqJeDg1PAWaLhmjVIWAio5P
  LdBnaIckGJkzOfsECM15Ro3f6bHcKWl2jeOpsZYoyixOzLzSwQdoVE4/RDTBC2msTVc5uYJzA
  KzUIyahaSUbOQjFrAyLyK0aw4tagstUjX0FwvqSgzPaMkNzEzRy+xSjdRL7VUtzy1uETXSC+x
  vFgvtbhYr7gyNzknRS8vtWQTIzDUU4qVj+xg3NH3V+8QoyQHk5Io7581AilCfEn5KZUZicUZ8
  UWlOanFhxhlODiUJHj/nRFMERIsSk1PrUjLzAHGHUxagoNHSYQ39TxQmre4IDG3ODMdInWKUV
  FKnPcvSEIAJJFRmgfXBov1S4yyUsK8jAwMDEI8BalFuZklqPKvGMU5GJWEeZeBbOfJzCuBm/4
  KaDET0GLeeQIgi0sSEVJSDUwVtofmTrvk2GMcfGqbbWPGa/4wjgtfEnwZ2aofzprNVF0k+PTf
  tCunuuxYXLd/u8SmdHdi8+cr+29v25+XtfbgAykxc8mgX8svn5TcUL96ymL71TmLnJ/m/lo5e
  9faW+IfSzMOXnT7nKO28fCD169D/SPm/bjI2Hh0+7Tv7+Kuuqvqb/j8xSPgSvm9/J9Fc/QK7y
  3P8k0857mcKU7wD3OufeScAvnts73LEgodH/0yfTHV5PJ+ZpdL119IK8f+nTs5/Ni5arH8wk+
  7Mq3OhwZ2StZOWbLvX4DClQWzAv51uXpfluLT7Ti1z4Lj1porPD57/70JfrF/t+6/8kDxMEOT
  6JSlieu4cmTTj3Y82WrQrMRSnJFoqMVcVJwIANVJDbhwAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-10.tower-565.messagelabs.com!1678889254!116636!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 21509 invoked from network); 15 Mar 2023 14:07:34 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-10.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 15 Mar 2023 14:07:34 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 3E3F8150
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Mar 2023 14:07:34 +0000 (GMT)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 31C967C
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Mar 2023 14:07:34 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Wed, 15 Mar 2023 14:07:32 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-paramiko: upgrade 3.0.0 -> 3.1.0
Date: Wed, 15 Mar 2023 22:07:15 +0800
Message-ID: <1678889238-20738-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1678889238-20738-1-git-send-email-wangmy@fujitsu.com>
References: <1678889238-20738-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Mar 2023 14:07:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101549

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-[Feature] #2173: Accept single tabs as field separators (in addition to single
 spaces) in <paramiko.hostkeys.HostKeyEntry.from_line> for parity with
 OpenSSH=E2=80=99s KnownHosts parser.
-[Feature] #2013: (solving #2009, plus others) Add an explicit channel_timeout
 keyword argument to paramiko.client.SSHClient.connect, allowing users to
 configure the previously-hardcoded default value of 3600 seconds.
-[Support] #2178: Apply codespell to the codebase, which found a lot of very old
 minor spelling mistakes in docstrings. Also modernize many instances of
 *largs vs *args and **kwarg vs **kwargs.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-paramiko_3.0.0.bb =3D> python3-paramiko_3.1.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-paramiko_3.0.0.bb =3D> python3-paramiko_3.1.0.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-paramiko_3.0.0.bb b/meta-python/recipes-devtools/python/python3-paramiko_3.1.0.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-paramiko_3.0.0.bb
rename to meta-python/recipes-devtools/python/python3-paramiko_3.1.0.bb
index 9e79c3668..70cee849a 100644
--- a/meta-python/recipes-devtools/python/python3-paramiko_3.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-paramiko_3.1.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE =3D "https://github.com/paramiko/paramiko/"
 LICENSE =3D "LGPL-2.1-only"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dfd0120fc2e9f841c73ac707a30389af5"
 
-SRC_URI[sha256sum] =3D "fedc9b1dd43bc1d45f67f1ceca10bc336605427a46dcdf8dec6bfea3edf57965"
+SRC_URI[sha256sum] =3D "6950faca6819acd3219d4ae694a23c7a87ee38d084f70c1724b0c0dbb8b75769"
 
 PYPI_PACKAGE =3D "paramiko"
 
-- 
2.34.1


