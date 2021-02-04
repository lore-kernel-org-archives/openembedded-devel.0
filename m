Received: from IND01-BO1-obe.outbound.protection.outlook.com (IND01-BO1-obe.outbound.protection.outlook.com [40.107.139.87])
 by mx.groups.io with SMTP id smtpd.web10.3937.1612418285276144947
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Feb 2021 21:58:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=rMbyUbaA;
 spf=pass (domain: kpit.com, ip: 40.107.139.87, mailfrom: harpritkaur.bhandari@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZuHagaqPv+GMqm5xQZVtbfR97GiNq/M0l/VSGxuIteMktmSzv7vXGDxsYR4KO46U1CVNmCxoOMVt0GRPdROxaTEcoSDMcHmCWHHtvfODodG7HGGAjPzcOYxAkV3iZeJ5xZJFAJYTnB2clKoeBsutl6cLc/m19ykUS8WR+N0nIoVCLXvdEPFzjN+CLVrs694N1OSqkWgwY+N/pL8sAloxwMeNVZkKA7y6b/tSeETHcCxfBex7xcASjW9OXI9Pie8GISlMCgrbl6WSvP6WvOKZi+ODrih6zl5S/17rzU9ELIz+hMEjldvqrKFFgVeBRzKQvY+ecQYdrtAjsNmLpmfZUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZtEXI0V1Ow/uCZ1Af6sXd7s/29fcLZJR2znySw4U8nc=;
 b=W6j0+0D1pvJLTRMS65HSF/KxZkLtYKcbutAC4PSAHGR8UdGA8gTNM4hvRmRyHHvdW6ruR7TLDNQ4UWAw1nkBqvzcM4rxqCo4f3Lt3+4g/qnKOAODB4Ae0Bj690KT4PiUkVcTEhyGNkHLtyxF5gN7vBAaCFUj5E/xaXG1LGt2lBzsBKqhROPb/RdU3WZ+h7Lb/svB6HyJUxKcVnVcJ1hfcO6RWEGSc2t3svyls+wyAUYAGJNokUXTMqwuCzb84VFoqt9aH52Ir7/xzBIHt1WBLzND7vldz9Kn/QkzelXT4LTOlnIXjdYR6OizTplrLk7Qp00QNZGfCX27YAMVbQIW2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZtEXI0V1Ow/uCZ1Af6sXd7s/29fcLZJR2znySw4U8nc=;
 b=rMbyUbaAEdxbOkvtcPAa9vKKH4aohCCdueF8g+/pfY3rjN3JbwRwSfp5nBPNZcf3RHcIiioiozuue4qi/9VhUarJE2xanROYbntgKOd/CxZj020vq62lR/qZizukft77JcZ5pQEsqPoFM6Pl7Bl9Wh2u0yP1R+/mh7cW4XKtx1I=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=kpit.com;
Received: from PN2PR01MB4410.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:16::13)
 by PN1PR0101MB1903.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c00:13::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.23; Thu, 4 Feb
 2021 05:57:58 +0000
Received: from PN2PR01MB4410.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::9d4e:7536:7e00:3cd1]) by PN2PR01MB4410.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::9d4e:7536:7e00:3cd1%7]) with mapi id 15.20.3825.020; Thu, 4 Feb 2021
 05:57:58 +0000
From: "Harpritkaur Bhandari" <harpritkaur.bhandari@kpit.com>
To: openembedded-devel@lists.openembedded.org,
	raj.khem@gmail.com
Cc: nisha.parrakat@kpit.com,
	aditya.tayade@kpit.com,
	Haiqing Bai <Haiqing.Bai@windriver.com>,
	Armin Kuster <akuster808@gmail.com>
Subject: [meta-oe][dunfell][PATCH v1] python-urllib3/python3-urllib3: fix CVE-2020-7212
Date: Thu,  4 Feb 2021 11:27:43 +0530
Message-Id: <1612418263-7858-1-git-send-email-Harpritkaur.Bhandari@kpit.com>
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [1.186.38.155]
X-ClientProxiedBy: BM1PR01CA0105.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00::21)
 To PN2PR01MB4410.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:16::13)
Return-Path: Harpritkaur.Bhandari@kpit.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (1.186.38.155) by BM1PR01CA0105.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3825.19 via Frontend Transport; Thu, 4 Feb 2021 05:57:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ba496b8b-c65f-4da6-9cfd-08d8c8d1d245
X-MS-TrafficTypeDiagnostic: PN1PR0101MB1903:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<PN1PR0101MB190328B970386049B6F90534EFB39@PN1PR0101MB1903.INDPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:849;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	lcFODm/FqzjwweNodNMgaMPSsmdlfSQ2o5Uxd11OeTKp5Ic9oFkXU31oOCpoMWvGvydOGsTuqhQpki5F5xoZ4nw52erqa+bzoWoVdKgU0r8NO4a9dQHGBAvlR+bvaW5WiKiI+pLG/gZYTS/QiF6sOXX/jgoVlVDwowV6jfOsWvCy78uDUo7+g695rOc3VsrgODFW8TYfjOAJi93WaiImB+HobSIH7JY4YtRtnp6wLQdqKFYSfwzUcp5whXo3flNZN3jpBUGF2lsi1BP7wKd8LXt5xnxy6JNQGu3k9n2nMvBrKRFRH89IqXnQNVcBzuMz14MH6JdWFAismfuhsYp6KXYPQZimU4/WspIKk6FcdzmnP8IJNSoTp38tlLxVFJjycuzUMdeJ6Slm2IYzPknfOT6l7xZjzlvG3MF5E56ydvUFjSbqXG5vCRIqsyQ7HaA3wkWEylEt+WLF/IxPv7V7JVyIgYN4vRWN7dfY1nGS9WVa+VmzdmmhlBvEjcEKWFJuimRX734kFZygw62i5yAZOvjXuMb28aYC2FhohydhXj88r7luUOZzN0Y7O7D85vsg0NCQB8xKfirjY36AJpglRi5bzRmbHbQBDuIBy+xK7Qk=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN2PR01MB4410.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(346002)(396003)(39850400004)(376002)(316002)(54906003)(8936002)(6512007)(478600001)(66574015)(52116002)(55236004)(2906002)(66476007)(66556008)(6486002)(66946007)(86362001)(6666004)(1006002)(36756003)(26005)(5660300002)(69590400011)(16526019)(186003)(83380400001)(8676002)(2616005)(6506007)(956004)(4326008)(36456004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	zw1Ry3guIvzZksXUAu+E0NoBUOp/krKiq49nODCeYOw0ZcF8M9QNbyJLx3R6bv/pz0vwZ6FRXNE3w8dK2jHCgIAH5XV7RM8cDt/EaJ/8fIZYS579HqXouaBuamAE+ryWng6p8BhP3fRKjxBVWMEKDf5sZfIFvItQgY+iZS17bC/+4SFWxiYMBBm+pPdvyhs0bC5w7uCJyFizs4lwgdvW9yaT3jIioCu048NbKT6XefFzsiGl3pQnkcnCoyrJF6tCjQftiNtG+0DPOOb35dx3KINkkaZ1PFgOEJXULN/0kmoyF7O3lvIACeyEDeLjynYGmH/s0r86DZei3BgpcOK7cLVv4usuJCGbAv3t+m4ShQHlrUReLujQiY11payHnOOFc75XIS5aRzeEPsw4jTh+CKSdcpsj53YX96OyJ/zKpV8tIMJfvW4rSAK8E0y5Ecsv4rxgKHdCuslZP8XVbEnFMJTRNMGRyCudkWzoJaJs9mT53lHhJY8xH+ivvcu5ThlcQihAy8/dO7zBl5kNo5NuaGPuFj8Gyeizhmw33wKbF466OFG4FD4R26SH8D1csuF9QUtmEK+zTOLvsnYWfVsA8wNMRiGA2MBBnVZ8MBzqbLrNKUAyk/5dgyrIbpZgIPWHm/b3044m02XyJeEyO5nGUCvjQ85Kxuid4DLS/0lkodEL6bvWG84XSCi2QiQKatqyHzDx/u606zPxs9pFAlaL+r+ehmBhHsDYL5xXE3jqcn1m9p+bjg5U6jdflplZd0wO
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba496b8b-c65f-4da6-9cfd-08d8c8d1d245
X-MS-Exchange-CrossTenant-AuthSource: PN2PR01MB4410.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2021 05:57:57.8564
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +2gpn74mh2tqy2srSYEzI3XPEpK7+XHSclVL7bzenGeVojw8R+ZoqGR52Ctbg6gQgGznYNh737jLXK/xJn8Npg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN1PR0101MB1903
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

From: Haiqing Bai <Haiqing.Bai@windriver.com>

Optimize _encode_invalid_chars for a denial of service (CPU consumption)

CVE: CVE-2020-7212

Signed-off-by: Haiqing Bai <Haiqing.Bai@windriver.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
Signed-off-by: Harpritkaur Bhandari <Harpritkaur.Bhandari@kpit.com>
---
 .../python/python3-urllib3/CVE-2020-7212.patch     | 54 ++++++++++++++++++=
++++
 .../python/python3-urllib3_1.25.7.bb               |  2 +
 2 files changed, 56 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-urllib3/CVE=
-2020-7212.patch

diff --git a/meta-python/recipes-devtools/python/python3-urllib3/CVE-2020-7=
212.patch b/meta-python/recipes-devtools/python/python3-urllib3/CVE-2020-72=
12.patch
new file mode 100644
index 0000000..a2bb0fb
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-urllib3/CVE-2020-7212.pat=
ch
@@ -0,0 +1,54 @@
+From aff951b7a41eb5b958b32c49eaa00da02adc9c2d Mon Sep 17 00:00:00 2001
+From: Quentin Pradet <quentin.pradet@gmail.com>
+Date: Tue, 21 Jan 2020 22:32:56 +0400
+Subject: [PATCH] Optimize _encode_invalid_chars (#1787)
+
+Co-authored-by: Seth Michael Larson <sethmichaellarson@gmail.com>
+
+Upstream-Status: Backport
+[from git://github.com/urllib3/urllib3.git commit:a2697e7c6b]
+Signed-off-by: Haiqing Bai <Haiqing.Bai@windriver.com>
+---
+ src/urllib3/util/url.py | 15 ++++++---------
+ 1 file changed, 6 insertions(+), 9 deletions(-)
+
+diff --git a/src/urllib3/util/url.py b/src/urllib3/util/url.py
+index 9675f74..e353937 100644
+--- a/src/urllib3/util/url.py
++++ b/src/urllib3/util/url.py
+@@ -216,18 +216,15 @@ def _encode_invalid_chars(component, allowed_chars, =
encoding=3D"utf-8"):
+
+     component =3D six.ensure_text(component)
+
++    # Normalize existing percent-encoded bytes.
+     # Try to see if the component we're encoding is already percent-encod=
ed
+     # so we can skip all '%' characters but still encode all others.
+-    percent_encodings =3D PERCENT_RE.findall(component)
+-
+-    # Normalize existing percent-encoded bytes.
+-    for enc in percent_encodings:
+-        if not enc.isupper():
+-            component =3D component.replace(enc, enc.upper())
++    component, percent_encodings =3D PERCENT_RE.subn(
++        lambda match: match.group(0).upper(), component
++    )
+
+     uri_bytes =3D component.encode("utf-8", "surrogatepass")
+-    is_percent_encoded =3D len(percent_encodings) =3D=3D uri_bytes.count(=
b"%")
+-
++    is_percent_encoded =3D percent_encodings =3D=3D uri_bytes.count(b"%")
+     encoded_component =3D bytearray()
+
+     for i in range(0, len(uri_bytes)):
+@@ -237,7 +234,7 @@ def _encode_invalid_chars(component, allowed_chars, en=
coding=3D"utf-8"):
+         if (is_percent_encoded and byte =3D=3D b"%") or (
+             byte_ord < 128 and byte.decode() in allowed_chars
+         ):
+-            encoded_component.extend(byte)
++            encoded_component +=3D byte
+             continue
+         encoded_component.extend(b"%" + (hex(byte_ord)[2:].encode().zfill=
(2).upper()))
+
+--
+2.23.0
+
diff --git a/meta-python/recipes-devtools/python/python3-urllib3_1.25.7.bb =
b/meta-python/recipes-devtools/python/python3-urllib3_1.25.7.bb
index 34c15b6..8d987a1 100644
--- a/meta-python/recipes-devtools/python/python3-urllib3_1.25.7.bb
+++ b/meta-python/recipes-devtools/python/python3-urllib3_1.25.7.bb
@@ -8,6 +8,8 @@ SRC_URI[sha256sum] =3D "f3c5fd51747d450d4dcf6f923c81f78f811=
aab8205fda64b0aba34a4e4

 inherit pypi setuptools3

+SRC_URI +=3D "file://CVE-2020-7212.patch"
+
 RDEPENDS_${PN} +=3D "\
     ${PYTHON_PN}-certifi \
     ${PYTHON_PN}-cryptography \
--
2.7.4

This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print, retain copy, disseminate, distribute, o=
r use this message or any part thereof. If you receive this message in erro=
r, please notify the sender immediately and delete all copies of this messa=
ge. KPIT Technologies Ltd. does not accept any liability for virus infected=
 mails.
