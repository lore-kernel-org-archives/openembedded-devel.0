Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web09.5312.1632471595330360503
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 24 Sep 2021 01:19:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=UBlw9O0K;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1632471587; i=@fujitsu.com;
	bh=cv/wBNRBeeSUMIqfajrStBpEqP2K0LAkO/rumSHO3ys=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=UBlw9O0KsARmb0u0+B+sLWK8Lz6ugCePmnJMMR25JnrsuBtmjZ0IEsqbXZWErGsdR
	 ATnOM5XxxRargQt6fc0topIC+Mrsf2A1eeOwujIOLdHYAKuwUOp0PrqT76eiOWQLuI
	 4QknbXAus6Evw2njjTPIiIPgsnTLGGq8pm3ZyBxF/p57dZvhA+rKFiOAZAnG/yO1C/
	 gt29TCowmtDrsY8cRvTFrbvNqXRHF458b/ZMXeVPI+v+goKW0uk/C9HU74Wj2Of3WV
	 s9EB9m5ck87SFVYtJNOEfIhIYYz79M+ZuNdQntQ4Q7cTI+0L9kr1iFkzNNh+V2YHEx
	 JzICCxv9nMzEg==
Received: from [100.112.197.4] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-b.eu-west-1.aws.symcld.net id D1/7D-21482-32A8D416; Fri, 24 Sep 2021 08:19:47 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupmkeJIrShJLcpLzFFi42Kxs+EI0VXs8k0
  06NmrZnHx8FJmB0aPcxtXMAYwRrFm5iXlVySwZrz/95Cl4CBnRdeFS6wNjA84uhg5OYQEZjNJ
  LDlj1sXIBWSfYJQ4deMhG0iCTUBHouNFNwuILSKgL7F09h5mEFtYwF1i3qS3jCA2i4CqRP/bi
  2D1vAJuEgcvTwGrlxBQkJjy8D0zRFxQ4uTMJ2BxZgEJiYMvXjBD1ChKbN95Bqq+QuL14UvMEx
  h5ZiFpmYWkZQEj0ypGi6SizPSMktzEzBxdQwMDXUNDI11DS3NdIxNLvcQq3SS91FLd8tTiEl1
  DvcTyYr3iytzknBS9vNSSTYzAMEopOPpzB+PD1x/0DjFKcjApifLqd/omCvEl5adUZiQWZ8QX
  leakFh9ilOHgUJLgfdEElBMsSk1PrUjLzAGGNExagoNHSYT3dQdQmre4IDG3ODMdInWKUVFKn
  PdbK1BCACSRUZoH1waLo0uMslLCvIwMDAxCPAWpRbmZJajyrxjFORiVhHlPgYznycwrgZv+Cm
  gxE9Di53N9QBaXJCKkpBqYQnYp2stzXJvo8ohhh+6zmr73NzzviBzbsLWtTqns5xyV9QvqD01
  ewWew9XlxkfzkE7WuDLnzA5hEarN3ija8ZFvjMf+eztoD4f17JaXFJ0stq/GfxST56HzclDcL
  Hr6/93nx1s0ySVUL/204GKr5L8k9VSBJTyuHx1lejL1awDVn7mfzsKjZSpM7s+tniWosVX+al
  7GBN7Ng0priFbwPv95aI3Y1LFXe89SNksftvKe0l3K8ijtY6qhvP3O+i2a6OVfp0ffzLfUOnl
  +rOUHY+GLPPoaNZ6ab2KsnJW6fVWc8SX2dxqT63We6uw0zzwYsfrznRXXnxjvTnQ1Cf59YZrN
  A1O6vK8sGxjfbo5/OUGIpzkg01GIuKk4EAORJchIeAwAA
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-5.tower-291.messagelabs.com!1632471585!62987!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 924 invoked from network); 24 Sep 2021 08:19:45 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-5.tower-291.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 24 Sep 2021 08:19:45 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 18O8JjRn001925
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Fri, 24 Sep 2021 09:19:45 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.23; Fri, 24 Sep 2021 09:19:44 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-pyro4: upgrade 4.80 -> 4.81
Date: Sat, 25 Sep 2021 04:19:38 +0800
Message-ID: <1632514778-4485-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 .../{python3-pyro4_4.80.bb => python3-pyro4_4.81.bb}           | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-connectivity/python-pyro4/{python3-pyro4_4.80.bb => python3-pyro4_4.81.bb} (66%)

diff --git a/meta-python/recipes-connectivity/python-pyro4/python3-pyro4_4.80.bb b/meta-python/recipes-connectivity/python-pyro4/python3-pyro4_4.81.bb
similarity index 66%
rename from meta-python/recipes-connectivity/python-pyro4/python3-pyro4_4.80.bb
rename to meta-python/recipes-connectivity/python-pyro4/python3-pyro4_4.81.bb
index ba331eea02..b05ce34f84 100644
--- a/meta-python/recipes-connectivity/python-pyro4/python3-pyro4_4.80.bb
+++ b/meta-python/recipes-connectivity/python-pyro4/python3-pyro4_4.81.bb
@@ -2,8 +2,7 @@ SUMMARY = "Python Remote Objects"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=cd13dafd4eeb0802bb6efea6b4a4bdbc"
 
-SRC_URI[md5sum] = "e31fc077e06de9fc0bb061e357401954"
-SRC_URI[sha256sum] = "46847ca703de3f483fbd0b2d22622f36eff03e6ef7ec7704d4ecaa3964cb2220"
+SRC_URI[sha256sum] = "e130da06478b813173b959f7013d134865e07fbf58cc5f1a2598f99479cdac5f"
 
 PYPI_PACKAGE = "Pyro4"
 
-- 
2.25.1

