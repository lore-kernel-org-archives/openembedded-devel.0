Received: from IND01-MA1-obe.outbound.protection.outlook.com (IND01-MA1-obe.outbound.protection.outlook.com [40.107.138.44])
 by mx.groups.io with SMTP id smtpd.web09.8349.1614238181501868332
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Feb 2021 23:29:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=IX/NrMT9;
 spf=pass (domain: kpit.com, ip: 40.107.138.44, mailfrom: rahul.taya@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bCbVpPfJ1aHj36MvRHNxvas7am4ur6+DY7jJklxTHQA7do7kyekVYQVgRPViwxzzZY5gU9CCsCHJW8XR0rLZ5qwZNwt/jewbhGk4OYHLuHWR2vrV7ry0BKT8AzptvhUxhwqk++bMkjuOnlSgVGrXwI4vBvOcxKOS/UqIFkDNYMhdydS3FBlqaToPiuiAreogS/tvqXudbGagCTKNR5/RTowWOV3+Lm3bdOcICddmjLKMLFb9eXzNh1v1JdbhPmtqUwALqjAgs/CgQv6wkSwrc3fpl1MvlP4tQykD2LXxVjnke9N0uD+cRW0gMo+xJKcQYZygVeQyn18xCl+W1tAZPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gXKZsS7D1oCnaQlstSvcywrVgm2fI1gIypT1YzQYI00=;
 b=Y+mlRvGq5XI5/Q57w8T2vUQRwFrH3Sg6+LHRgV1x5fd5UmNuhb7EsHjE1/lHaUPBQU+xTMsuEN3egX/c5W9wIuaqhJoqpRjpgN+8GDInXsbdcR9EZcS9dngtzZUYutM+e5QFRItRzyTe+gUCqxqMtWpJlolxIvbnw/IdbZMrRFOPJ9RerPflDC6tvEjcWMU3R3ybnTCvxEF2Y4lUfViRiB6TRTnadAg8WWtrkdFx4K3mQLmUsccLHrIW9bK/U5G1uI9WxI03zZyEnjZDYAbXJ5HRBVSZh4lt13lZGs4WuU8N123ue5bqY8IoHKyrBCtnlAUwYp6/rD6G3KHUIaWCFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gXKZsS7D1oCnaQlstSvcywrVgm2fI1gIypT1YzQYI00=;
 b=IX/NrMT96JHJbDykzK0LBjdwqLeO9wad0yUgM2QVNC+7e2YhkX5R1kZdvLmI9Cpim9jQS0Yv9HlW1kkLkj+JqB6wFCeCo/N4D33gJkM5N1A3f5Ir4gKFJEBTjwSpDVd3wkWTRR1hqcX2IX5HkOceuKne5ey8bn1pEG8LPCWqmps=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=kpit.com;
Received: from BMXPR01MB3431.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:58::18)
 by BMXPR01MB4920.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b01::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3868.28; Thu, 25 Feb 2021 07:29:29 +0000
Received: from BMXPR01MB3431.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::5c87:1000:2e85:9ab7]) by BMXPR01MB3431.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::5c87:1000:2e85:9ab7%7]) with mapi id 15.20.3890.019; Thu, 25 Feb 2021
 07:29:29 +0000
From: "Rahul Taya" <Rahul.Taya@kpit.com>
To: openembedded-devel@lists.openembedded.org,
	raj.khem@gmail.com
Cc: nisha.parrakat@kpit.com,
	harpritkaur.bhandari@kpit.com,
	Rahul Taya <Rahul.Taya@kpit.com>
Subject: [meta-python2][dunfell][PATCH] python: Add fix for CVE-2019-20907
Date: Thu, 25 Feb 2021 12:59:08 +0530
Message-Id: <20210225072908.9874-1-Rahul.Taya@kpit.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [122.169.11.218]
X-ClientProxiedBy: PN1PR0101CA0051.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c00:d::13) To BMXPR01MB3431.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:58::18)
Return-Path: Rahul.Taya@kpit.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (122.169.11.218) by PN1PR0101CA0051.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c00:d::13) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19 via Frontend Transport; Thu, 25 Feb 2021 07:29:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: fbf09c97-fa89-4818-7e19-08d8d95f1574
X-MS-TrafficTypeDiagnostic: BMXPR01MB4920:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BMXPR01MB4920B21BDF171E8E4B376474F29E9@BMXPR01MB4920.INDPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:1850;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	GCJyTATUwWwDllhR6Sd8yqDzsoU7klEj8HVOZNDETXin4cF/N3W8BQ5Cn5vPutILYCfuOOuY18vR4CHjelaoYHPi6YY8aEji2P+QM230tg95qZ5G2PQt1nFR5iwapLml2xt4lS/TvwxgOysaLgE/Qh9Q5jxD1k2H0hUiOSSP83GMN5U2f6hgNtv8GPB/2KgEOMhND9SFsJI5ADeTXaNpFx3NkFl7uagZwMAX43ykiyWyH5Qk9cPb4U2VBGKY0kP+qaCU0CIBrUwi/+/SuIm9mNg904Acx9OMBDgZ6N26nQdRCOBCVDigqSEX+VCBM8A3GY7pvAVY37kK0OUb2hUwqKJYdzVQHKQP6DIBRefcqfFuzBxPJsfxolW8gZWVlg3OMjeIpWY+XUMTkQ3eUSfHY/bs2uTCNyGUXM+vS3IGUmJeTe/cuXyvgLtED6WAlRRnvvFS96+Elc81ESG5SpVReZWg/OFre8M4zJooJngPeL9QwWQhGySyCovNiH5FMsTAwcdEOjgw7FAVeC3qWw4swxwva5HkNvud3y5gJq9d5H9bzvO/JIgJAYsDd7faWsE9breZG1j5fWnTxZl78EfHPVXAz22ev0Ix3HzmwOTffeDgapNak0/Khd9AhMrKEE9DR8yb8+hq3N81FtGLi8c2J0qVtUHCpjKQhkreKehkoWM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BMXPR01MB3431.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(136003)(39850400004)(366004)(346002)(376002)(396003)(6666004)(4326008)(6486002)(107886003)(66574015)(2906002)(316002)(6512007)(1076003)(36756003)(83380400001)(478600001)(66556008)(2616005)(66476007)(6506007)(66946007)(52116002)(966005)(8676002)(956004)(8936002)(86362001)(69590400012)(16526019)(5660300002)(186003)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?ewamopjJsBNfJyrvonxbNnzhDXE02uTsepUauHzIxvgH2O38ZDZ6R3BYDVar?=
 =?us-ascii?Q?qKDPB5tDx9byv3aQnhscoQLn352QxM/bnFMBhHoXpx5iSGGWdRHHbNnLPir3?=
 =?us-ascii?Q?x9hQzJz9m+qFfL58/abWRjCGHcfA2cLQHKtyFhXQAh9TO6vTpBtDeQD4QpjC?=
 =?us-ascii?Q?9P7D6zQtt3951vtadRL9eySr/ViR6ayBf4v3R6eP/b9OvMPI0GeKGh7KAmav?=
 =?us-ascii?Q?nrSysISBFrN8DFBd3g0ZwUdUoOVJBIi0d72HmCyUq6O7y1TfY4yvi0uuIhzj?=
 =?us-ascii?Q?zYAfsyhmeaQJOHRAv7YXyosPF21EVghFG3VndQisy2TAHlws3+TIz9zT7yFF?=
 =?us-ascii?Q?Of8M6UE6AVkKlyr/tvrdzK4MNArLXsGCa3d9pCU2V1pINgRyisFqc6Y0zcDb?=
 =?us-ascii?Q?uIEKRyGnL/csxx/Ru8eeCvEttc53EemhM0WhOS1iJKzyPtbP91xMPcWEPvH2?=
 =?us-ascii?Q?LncA4FJ6a92C+I7YJDlQ/2mi+x2bfybHyCt9C2Opt/nOmJ2d/MpLD48OexYt?=
 =?us-ascii?Q?zt43pTOOYW+JvdB99euxUScVSvVgtUJbkQHJVf8OOcvwe1Ya0z2pC6cbfN+E?=
 =?us-ascii?Q?rW0wegJv7cZYB1MeyeCNcgeQxOYHYeNucKU0pZj9poVVm4c8UQPlG+Ic2PZ6?=
 =?us-ascii?Q?b5sficHv1TWAYqCwtvhaSjYOKMR7GUoFhDRONwdWia/yrh9TEYBGeQMQw0dD?=
 =?us-ascii?Q?0/eCYKoHHhTIaOA9i+jkblseE5Ig0YOd0iYLPVyOrhHD3X5jhF54IyRro4kK?=
 =?us-ascii?Q?vWVgiyMstqVFjJOIkvAm6vx/aS4xNHlmSB+Xs7NNcEFh6yj9q78JpDoYNpVt?=
 =?us-ascii?Q?LDAEjqVVXS7FJJdsO+BGt8veTCEW8oe/QqPR/+ynn13zzORTPFoYhZvHMoYR?=
 =?us-ascii?Q?plOE2fqrP/jUaP+briwu8KfH5S+hOYwcE86jFdaZA94afGtq3lXGfdEywGJH?=
 =?us-ascii?Q?ZNnb54+QIcpRM2C0jpM+PBbpy57rtA9r/A9mGbxwHXgfX618kBg4YUxpF4rV?=
 =?us-ascii?Q?cKOhd+QGddsKOBHFGjOlczEsDjsmwqkUoHdsjDMp2U0XUy39hyv5qrVuA0mF?=
 =?us-ascii?Q?tFa49sgQ7OatECHtlBxLO4hvJuJT11LFj6eerdAZXoGYoWk7f+4ow5w/PQ7o?=
 =?us-ascii?Q?J6TuK/77hUifAHg1zNMijdXE1Asj5bvbVvH+UpHaR0JJycrzziJ/INac5ZXu?=
 =?us-ascii?Q?0AI8xnECOr2XeURah7IXVnKmDNnautcKBXE95FfGc4uJSlm7Lal60cIHNSv0?=
 =?us-ascii?Q?AWekNNV7K0b6H0IYwXiX2iD+Gmbo7YIvZD+Q7vLceOI98EZjLBt44pW2IROQ?=
 =?us-ascii?Q?jgRRVSMxwfopx42tYLP+Pspp?=
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbf09c97-fa89-4818-7e19-08d8d95f1574
X-MS-Exchange-CrossTenant-AuthSource: BMXPR01MB3431.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2021 07:29:28.1759
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nux2Vo0QYjaHkqasgTL2DilW8kAsuynXczowNT4r1Gj5Rv/oseyuSDCMcoxX+6Q+8yqg2fpaDtwKnDM86P/Kjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BMXPR01MB4920
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

For python and python-native added patch to fix
CVE-2019-20907

Signed-off-by: Rahul Taya <Rahul.Taya@kpit.com>
---
 recipes-devtools/python/python.inc            |  1 +
 .../python/python/CVE-2019-20907.patch        | 57 +++++++++++++++++++
 2 files changed, 58 insertions(+)
 create mode 100644 recipes-devtools/python/python/CVE-2019-20907.patch

diff --git a/recipes-devtools/python/python.inc b/recipes-devtools/python/p=
ython.inc
index a4ba0c5..4bf30ee 100644
--- a/recipes-devtools/python/python.inc
+++ b/recipes-devtools/python/python.inc
@@ -8,6 +8,7 @@ INC_PR =3D "r1"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D203a6dbc802ee896020a47161e75964=
2"

 SRC_URI =3D "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
+           file://CVE-2019-20907.patch \
            "

 SRC_URI[sha256sum] =3D "b62c0e7937551d0cc02b8fd5cb0f544f9405bafc9a54d3808e=
d4594812edef43"
diff --git a/recipes-devtools/python/python/CVE-2019-20907.patch b/recipes-=
devtools/python/python/CVE-2019-20907.patch
new file mode 100644
index 0000000..0555c0f
--- /dev/null
+++ b/recipes-devtools/python/python/CVE-2019-20907.patch
@@ -0,0 +1,57 @@
+From f5481db4bebf9d53b79f29f960f4188af8ccdfde Mon Sep 17 00:00:00 2001
+From: Rishi <rishi_devan@mail.com>
+Date: Wed, 15 Jul 2020 13:51:00 +0200
+Subject: [PATCH] bpo-39017: Avoid infinite loop in the tarfile module
+ (GH-21454)
+
+Avoid infinite loop when reading specially crafted TAR files using the tar=
file module
+(CVE-2019-20907).
+
+Signed-off-by: Rahul Taya <Rahul.Taya@kpit.com>
+---
+ Lib/tarfile.py                                    |   2 ++
+ Lib/test/test_tarfile.py                          |   7 +++++++
+ 2 files changed, 9 insertions(+)
+
+Upstream-Status: Backport[https://github.com/xzy3/cpython/commit/f5481db4b=
ebf9d53b79f29f960f4188af8ccdfde.patch]
+CVE: CVE-2019-20907
+Link: https://github.com/xzy3/cpython/commit/f5481db4bebf9d53b79f29f960f41=
88af8ccdfde.patch
+Comment: Second hunk refreshed and from the original patch skipped changes=
 for files
+Lib/test/recursion.tar and Misc/NEWS.d/next/Library/2020-07-12-22-16-58.bp=
o-39017.x3Cg-9.rst
+as these files are not present in our source code.
+Affected-version: Affects Master,Gatesgarth and Dunfell as version is
+same i.e: v2.7.18
+
+diff --git a/Lib/tarfile.py b/Lib/tarfile.py
+index e2b60532f693d..6769066cabd6f 100755
+--- a/Lib/tarfile.py
++++ b/Lib/tarfile.py
+@@ -1249,6 +1249,8 @@ def _proc_pax(self, tarfile):
+
+             length, keyword =3D match.groups()
+             length =3D int(length)
++            if length =3D=3D 0:
++                raise InvalidHeaderError("invalid header")
+             value =3D buf[match.end(2) + 1:match.start(1) + length - 1]
+
+             # Normally, we could just use "utf-8" as the encoding and "st=
rict"
+
+
+diff --git a/Lib/test/test_tarfile.py b/Lib/test/test_tarfile.py
+index 89bd738..c61d02b 100644
+--- a/Lib/test/test_tarfile.py
++++ b/Lib/test/test_tarfile.py
+@@ -321,6 +321,13 @@ class CommonReadTest(ReadTest):
+                 with self.assertRaisesRegexp(tarfile.ReadError, "unexpect=
ed end of data"):
+                     tar.extractfile(t).read()
+
++    def test_length_zero_header(self):
++        # bpo-39017 (CVE-2019-20907): reading a zero-length header should=
 fail
++        # with an exception
++        with self.assertRaisesRegex(tarfile.ReadError, "file could not be=
 opened successfully"):
++            with tarfile.open(support.findfile('recursion.tar')) as tar:
++                pass
++
+
+ class MiscReadTest(CommonReadTest):
+     taropen =3D tarfile.TarFile.taropen
--
2.17.1

This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print, retain copy, disseminate, distribute, o=
r use this message or any part thereof. If you receive this message in erro=
r, please notify the sender immediately and delete all copies of this messa=
ge. KPIT Technologies Ltd. does not accept any liability for virus infected=
 mails.
