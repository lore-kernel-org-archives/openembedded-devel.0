Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8716CCA488
	for <webhook@archiver.kernel.org>; Fri, 22 Jul 2022 01:35:52 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web09.3214.1658453741747734149
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Jul 2022 18:35:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=iT1ezzqg;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1658453740; i=@fujitsu.com;
	bh=BPDP7XCJ8bRmNe3kWpRjc+UyfpNNUQ5kYRcqVHwJSa4=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=iT1ezzqgjFe6/sB+idWoOw34IDJ39i9PCyOY9CEVYmAiNLm1l/qgBCjW8Z0LSD3W8
	 BR7ipmlVKC2q1PNjt8nu8fZUusjn/JvEafvd9W6AekPnwXKh4X/SrWKKLzprYQ35PF
	 +OLGJJMIohGYUroSeKkhS59+9htQCpySAvXsa7e4Qf2Lu2YlT/1XOUWfTn7f9YilFT
	 8Lrq1bsuwmInhUj3H4xFu1GtFHLGN4azdfbjTZDz0zLzj1qDZ1Ydq9xPOxE0USdb9X
	 9YiDr67J2aY6/dNlljtmq7SNSfAElbu6RoSqDzHHnEhfaskPPFC/1P6jnDuFkOzmBw
	 bIOcNiQ8GXOVg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrIIsWRWlGSWpSXmKPExsViZ8OxWffNv5t
  JBudTLC4eXsrswOhxbuMKxgDGKNbMvKT8igTWjFczTrAW3BWteNm7iLGB8YhQFyMXh5DAA0aJ
  x1Pa2CGcy0wSZ5evY4FwDjBKbHv2mamLkZODTUBX4sWPxSwgtoiAvsTS2XuYQWxhAW+J1/fPs
  HUxcnCwCKhKHP4kAhLmFfCQ+LL6HyuILSGgIDHl4XtmiLigxMmZT8DGMAtISBx88YIZpFVCQF
  Fi9nR5iPIKideHLzFD2GoSV89tYp7AyDcLSfcsJN0LGJlWMVonFWWmZ5TkJmbm6BoaGOgaGpr
  qGlvoGhka6SVW6SbqpZbqlqcWl+gCueXFeqnFxXrFlbnJOSl6eaklmxiBoZdSrHZlB+OeVT/1
  DjFKcjApifLum3QzSYgvKT+lMiOxOCO+qDQntfgQowwHh5IEb8FfoJxgUWp6akVaZg4wDmDSE
  hw8SiK8Fl+A0rzFBYm5xZnpEKlTjLocM7+2HWAWYsnLz0uVEudd8hWoSACkKKM0D24ELCYvMc
  pKCfMyMjAwCPEUpBblZpagyr9iFOdgVBLmlf8NNIUnM68EbtMroCOYgI4wN78BckRJIkJKqoH
  Jt2b1i64912Ujjr9/vi9SUvWrW5Dqu3k/V73/b9PAqff7kNIW08KTJz+3PNkh/CFu6Z8Hxh9l
  XyzKebb9jQvrbLXS1C45ozNPfVwbYsMybGsfPLNwTxVU5TmWuTtBUj1t36mLDVkTef+43TDaq
  L6hedf+l/GbVm2qeLvo1WbWac3CaveX9BtOnHdm77WNkrest132mHPEWezYjhlrV2UyuGrGtN
  6pZLzxfE2A/8INb8XuLuFndZ9woyHyuQ7jhPtuv/K/hv2bu623X4Eh8n1BaNHiD49t58Rcy4l
  jklI11IqfVChucrbaeqN8S4nGwt//5t7l2NlTbfdQ59Cin/yBoVfsVCJLUkv8FmV/dOJlUmIp
  zkg01GIuKk4EAKsk6BREAwAA
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-12.tower-548.messagelabs.com!1658453739!10495!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 18645 invoked from network); 22 Jul 2022 01:35:40 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-12.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 22 Jul 2022 01:35:40 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id B4C4673
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Jul 2022 02:35:39 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id A863C75
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Jul 2022 02:35:39 +0100 (BST)
Received: from CentOS7.g08.fujitsu.local (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Fri, 22 Jul 2022 02:35:38 +0100
From: zhengrq.fnst <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-ecdsa: upgrade 0.17.0 -> 0.18.0
Date: Fri, 22 Jul 2022 09:35:31 +0800
Message-ID: <1658453731-24016-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 22 Jul 2022 01:35:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97927

Changelog:
==========
New features:
------------
    Support for EdDSA (Ed25519, Ed448) signature creation and verification.
    Support for Ed25519 and Ed448 in PKCS#8 and public key files.
    Support for point precomputation for EdDSA.

New API:
------------
    CurveEdTw class to represent the Twisted Edwards curve parameters.
    PointEdwards class to represent points on Twisted Edwards curve and
    provide point arithmetic on it.
    curve_by_name in curves module to get a Curve object by providing curve
    name.

Bug fix:
---------
    Accept private EdDSA keys that include public key in the ASN.1 structure.
    Fix incompatibility with Python 3.3 in handling of memoryviews of empty
    strings.
    Make the VerifyingKey encoded with explicit parameters use the same
    kind of point encoding for public key and curve generator.
    Better handling of malformed curve parameters (as in CVE-2022-0778);
    make python-ecdsa raise MalformedPointError instead of AssertionError.

Doc fix:
-----------
    Publish the documentation on https://ecdsa.readthedocs.io/,
    include explanation of basics of handling of ECC data formats and how to use
    the library for elliptic curve arithmetic.
    Make object names more consistent, make them into hyperlinks on the
    readthedocs documentation.
    Make security note more explicit (Ian Rodney)
    Fix the explicit vs named_curve confusion in VerifyingKey docs.

Maintenance:
------------
    Fix few typos (thanks to Tim Gates and Kian Meng Ang).
    Updated black version; slight changes to formatting
    Include interoperability tests for Ed25519 and Ed448 with OpenSSL.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../python/{python3-ecdsa_0.17.0.bb => python3-ecdsa_0.18.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-ecdsa_0.17.0.bb => python3-ecdsa_0.18.0.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-ecdsa_0.17.0.bb b/meta-python/recipes-devtools/python/python3-ecdsa_0.18.0.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-ecdsa_0.17.0.bb
rename to meta-python/recipes-devtools/python/python3-ecdsa_0.18.0.bb
index 177019ccc2..6a399a96fe 100644
--- a/meta-python/recipes-devtools/python/python3-ecdsa_0.17.0.bb
+++ b/meta-python/recipes-devtools/python/python3-ecdsa_0.18.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=66ffc5e30f76cbb5358fe54b645e5a1d"
 DEPENDS += "python3-pip python3-pbr"
 
 PYPI_PACKAGE = "ecdsa"
-SRC_URI[sha256sum] = "b9f500bb439e4153d0330610f5d26baaf18d17b8ced1bc54410d189385ea68aa"
+SRC_URI[sha256sum] = "190348041559e21b22a1d65cee485282ca11a6f81d503fddb84d5017e9ed1e49"
 
 inherit pypi setuptools3 python3native
 
-- 
2.25.1


