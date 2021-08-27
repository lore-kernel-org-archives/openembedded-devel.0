Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web08.4300.1630042747581410137
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Aug 2021 22:39:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Zp3ZDX4R;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1630042745; i=@fujitsu.com;
	bh=lglry8XtjXpqJdXHtcCx1ou80G735XFrJjriEvNiOUk=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=Zp3ZDX4RyzvLoBhdWGqMIM7jboUur6BeSETK3JEml4fFYQUohPnuIm2ee5romWp51
	 VC0LoFFDpe4BR0ReKhHDzHSmPkQMjPU3T6GyTKrZp3lCdgQL2nVz2D2Gcw2peKFHBG
	 uXMWFG4bG7u+Sn5iy+S0KdlxRhv5/dUNjBjYUS6aNaD2wydRfW6SqVa47XXnK7ALVF
	 G2a/Prwsu5Xv4HceXvr6QCz7RUJGfj9/pDI67XU63f74invZhc58nG/Z0VgBz9w2Lo
	 E9uCBWXOlcvp/gzCRbTweTWvUlw35N13oMjZbsnmJt52hKXhX+J1K5HtjcCShpXnEF
	 Ee6Hqb6Lrkc2w==
Received: from [100.112.192.29] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-west-1.aws.symcld.net id B0/0A-13722-97A78216; Fri, 27 Aug 2021 05:39:05 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupmkeJIrShJLcpLzFFi42Kxs+GYqltRpZF
  o8PKEjsXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmvGy/yhbwSHOinc7TrE0ML7g6GLk4hASmM0k
  sXP6c6YuRk4g5wSjxKEv4iA2m4CORMeLbhYQW0RAX2Lp7D3MILawQIDE+9UfweIsAqoSC/atA
  7N5BdwlPh29yAhiSwgoSEx5+J4ZIi4ocXLmE7AaZgEJiYMvXjBD1ChKbN95hgXCrpB4ffgS8w
  RGnllIWmYhaVnAyLSK0SKpKDM9oyQ3MTNH19DAQNfQ0EjX0BKIjcz0Eqt0E/VSS3XLU4tLdA3
  1EsuL9Yorc5NzUvTyUks2MQLDKKXgQN0OxgevP+gdYpTkYFIS5d2RrpEoxJeUn1KZkVicEV9U
  mpNafIhRhoNDSYJ3XQVQTrAoNT21Ii0zBxjSMGkJDh4lEd6eSqA0b3FBYm5xZjpE6hSjopQ4r
  z9IQgAkkVGaB9cGi6NLjLJSwryMDAwMQjwFqUW5mSWo8q8YxTkYlYR5w0Cm8GTmlcBNfwW0mA
  locQGfKsjikkSElFQD0/Y/bwT71TJnaTBXbIgqb94j4j0h3KX5aMPCM2LrZENjv/hGeN252/6
  5z6ucW+A0f3cVZ0DM8mebL4cHeZWLq8R+3X+8+EOxq5xIr1R5fOahrAM3Dhxc9rlp/o3D09el
  bHTLF5K3/7Ztjvcxp4ylPVd3bNS4VVr97vnvLQ2/UteWvXVzkpivyxn632Tuh5RjkvsMdv/Us
  hYu2Vz1OnqTU8yNR2HXc6/G//LX0Dty5eHannsmwoKq2pf2XezUKRe+vJr1mHnwUx1ZvbPbeb
  InrvwcxXomI0j9UjNHj3SM6b6ALVPeRUYuFrZx3V/2OoApTtnnRA/TCS1h169VTSfvd9YmNn7
  hMN50dO92eQ5hJZbijERDLeai4kQA6hgbxR4DAAA=
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-8.tower-267.messagelabs.com!1630042744!109062!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 19215 invoked from network); 27 Aug 2021 05:39:04 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-8.tower-267.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 27 Aug 2021 05:39:04 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 17R5cuLR026581
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Fri, 27 Aug 2021 06:39:04 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Fri, 27 Aug 2021 06:38:55 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-aiohttp-jinja2: upgrade 1.4.2 -> 1.5
Date: Fri, 27 Aug 2021 13:38:48 +0800
Message-ID: <1630042728-52954-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 ...n3-aiohttp-jinja2_1.4.2.bb => python3-aiohttp-jinja2_1.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-aiohttp-jinja2_1.4.2.bb => python3-aiohttp-jinja2_1.5.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-aiohttp-jinja2_1.4.2.bb b/meta-python/recipes-devtools/python/python3-aiohttp-jinja2_1.5.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-aiohttp-jinja2_1.4.2.bb
rename to meta-python/recipes-devtools/python/python3-aiohttp-jinja2_1.5.bb
index f97cf12dbf..c86ec092a6 100644
--- a/meta-python/recipes-devtools/python/python3-aiohttp-jinja2_1.4.2.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohttp-jinja2_1.5.bb
@@ -3,7 +3,7 @@ SUMMARY = "jinja2 template renderer for aiohttp.web (http server for asyncio)"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=29dca541e03964615590ca7b50392d97"
 
-SRC_URI[sha256sum] = "9c22a0e48e3b277fc145c67dd8c3b8f609dab36bce9eb337f70dfe716663c9a0"
+SRC_URI[sha256sum] = "7c3ba5eac060b691f4e50534af2d79fca2a75712ebd2b25e6fcb1295859f910b"
 
 inherit pypi setuptools3
 
-- 
2.25.1

