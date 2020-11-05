Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.45])
 by mx.groups.io with SMTP id smtpd.web09.5144.1604568641882873600
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Nov 2020 01:30:42 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=hocKpdZb;
 spf=pass (domain: windriver.com, ip: 40.107.223.45, mailfrom: mingli.yu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hvN//khbCBiNOEvmbOF1OmATRKju9SLwJGsJY+vgavo0estTIN1u/BSI91pm376yuoASt+39pTbRXX6fYRLthq2sn3hapxtKEF3tXqYr026oq3rmu42N6dDHWasVgedDz7dAbB1IfIKkl61zEz+dM5uUXxDidmN2GmxbNjAzir3yIO0qbVv7IITG5A97UPaHetZLwReaTxaVku0OJU2k04UXLAsIaerMr4wF6l3iELK8i6VAUkH+75Dt7YehQHSJhMqj/6pNsxUaG59GcCMxi4wmgi7EqO9rzcENJF5Gw+41X24YE6mtHDE+tS3O8xrlpbDvJMWBuQ60y+ddI1SbWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bejiY8iR6hGzcvFr/cMbSArUMBAEtR2wReQ9yGB6nhA=;
 b=PmB1VYGQh8AgLz4QlyFjxLfgFMy9kwicW1Yn/grasPJ9XnpH0jVUDOUh96FsVSlbLZzMJb5IAeiPf0QZSft8YIcoznX6uAvY/4i9RpYStWVNRBA2IEycM/FPCBNXa1oCnSPHhLQKRGBqHzjrhEKTgUVreYYJAO/SctAbzrm7FcDgsuAicUNGTcwIsFGEzZeC5flTbn9PyTO9TjhgHoA2os2vJ/lM5/vBXccFWsatPODU627zGWWBtZNc+z8IOb+j7xVFfOuk4VOp6yxoF9FAI6+h0LsZpwcIpRJ6qs0AHT7mYIagTxsw0c2VbQG25d99HR7vhEGizu1LqG5zEgFjDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bejiY8iR6hGzcvFr/cMbSArUMBAEtR2wReQ9yGB6nhA=;
 b=hocKpdZbyAHnqW1n7wyGTrT3apS56hQWOB9zwGCTJkWEEqJn/Z2HqNQDjVQ0xXu3XDNwOcWELG5fEF8ublwQaeHLR0ERVqFjY/KOaj8BM60ekkQCeefMR3LGj9fcrIr+rhyt2Ccp1wk+JhiaLhzynKFqietS2Poa4NnEjy4G24w=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 by CO1PR11MB4817.namprd11.prod.outlook.com (2603:10b6:303:98::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.19; Thu, 5 Nov
 2020 09:30:41 +0000
Received: from CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::105b:9105:2a38:9e9f]) by CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::105b:9105:2a38:9e9f%7]) with mapi id 15.20.3499.032; Thu, 5 Nov 2020
 09:30:41 +0000
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 2/4] ndpi: add new recipe
Date: Thu,  5 Nov 2020 17:30:13 +0800
Message-ID: <20201105093015.36886-2-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201105093015.36886-1-mingli.yu@windriver.com>
References: <20201105093015.36886-1-mingli.yu@windriver.com>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: YT1PR01CA0132.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::11) To CO1PR11MB5009.namprd11.prod.outlook.com
 (2603:10b6:303:9e::11)
Return-Path: mingli.yu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpg-core2.corp.ad.wrs.com (60.247.85.82) by YT1PR01CA0132.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::11) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21 via Frontend Transport; Thu, 5 Nov 2020 09:30:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 00780f80-bac5-4d28-d073-08d8816d762a
X-MS-TrafficTypeDiagnostic: CO1PR11MB4817:
X-Microsoft-Antispam-PRVS: 
	<CO1PR11MB4817478D5B53C28A7FFC44FFF1EE0@CO1PR11MB4817.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:175;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	liJkr9ia3H9O8vQLZu4v+46K9pQv0qEu3Qa+0XsDXSWWxXyraQ57OHD09fTsoROSOAsIFUcfJpxHtBrVQQL0uo4ykYNuFkwhI5nWmx0K5OrXz+T0s2yONNegGoXQ26jkIQIF6Fm8zGKAVUZZBEokmzyDjDpe/X9sDxyellkdBAYfNQuAYTY/g7YZoKHNAqKF524TzZVK0QeQmrDV+LW8u2SkmD4gbq2nUbVbXGpDAIgWeE8GQikH0bHag+X+Id3V8leRcuhxM4+lVlKbAd9oX6agPopHdLW74CN2rPqCfX4r711JZZD7qhgIHT8hIti9vzi8Nuzm4voPznec7pSz7A==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5009.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(346002)(376002)(39850400004)(136003)(66556008)(5660300002)(66946007)(66476007)(6666004)(186003)(6916009)(52116002)(83380400001)(6506007)(6486002)(86362001)(16526019)(316002)(8936002)(26005)(1076003)(478600001)(8676002)(6512007)(9686003)(956004)(36756003)(2906002)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	OhYfEzrrlJu6MEZCxC4VVumJAbvCXTDEUqemixAkxjGJEAMyUzFlINPe4ldcRkKCqvdLeTavl6y95KKJqc5fQ5Fj6Bblay2/y+29zIlYnMaJC1sKiF0Ec9M9uhQK9i6XzPzne673JKn4olQVjKjkX59oCNViU8LmfVlhE0e5ypQ+JrTU5fI1DorlhdlodDAoq8M3yvsqO/RQ95u0gzM2kIwGwCv7HZxl6EkUXgoEwTDlpphpDPUo30dIKDjZ3VRcOhEEk8HeJGKBwFVuUudk6SnSNIc6EvRyq880G/CPcomf0U5DO+hnGSH7ajbm8rHpKoEGuhR8UMW593AjaA023Qe/0Tgtm2wv8xa3B9ktbTVw7X0mxxs3AdqNB7drCGwOk4beMbdFEo4xu+Z5Ylu1nF47Jh+aN6+GF6o4iqgr9ECJWzgJgERwvie/EB4TsmnWEwV66PgLMMth8JUFPCbeGq1EyzjcRYDY2ercnVTnwyZzCXL4plNQuLA0J9a7ohvG5VTiL0Mhx1Hld1J7H47aT/bCK96/SWWk7yvN2SDLdSWr1lBHNLvxEJ9reQR0L0POfUM4ewUSUPLOWGv04A5g6bfQdvgnJG4hD5Mnd4uAMWy+BmmBt+ZKFH+vaf0j5AGY8XDFPBBXRm3USeY/cXCwbw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00780f80-bac5-4d28-d073-08d8816d762a
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5009.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2020 09:30:41.0624
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aQwiwqlD/gJ6gIzrFf8mu4eyJfeP44O7YD/wzqLgUdf0rs9kvzZHtbsXntmnMEwCl1B93XaIWCr70gs1p3qiiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4817
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

nDPI is an open source LGPLv3 library for deep-packet inspection.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 ...01-autogen.sh-not-generate-configure.patch | 33 +++++++++++++++++++
 .../recipes-support/ntopng/ndpi_3.4.bb        | 26 +++++++++++++++
 2 files changed, 59 insertions(+)
 create mode 100644 meta-networking/recipes-support/ntopng/files/0001-autog=
en.sh-not-generate-configure.patch
 create mode 100644 meta-networking/recipes-support/ntopng/ndpi_3.4.bb

diff --git a/meta-networking/recipes-support/ntopng/files/0001-autogen.sh-n=
ot-generate-configure.patch b/meta-networking/recipes-support/ntopng/files/=
0001-autogen.sh-not-generate-configure.patch
new file mode 100644
index 000000000..ffc6ec1ef
--- /dev/null
+++ b/meta-networking/recipes-support/ntopng/files/0001-autogen.sh-not-gene=
rate-configure.patch
@@ -0,0 +1,33 @@
+From d482bcc8fca90afc95ac3cbe848a3c9d7ad81ddc Mon Sep 17 00:00:00 2001
+From: Mingli Yu <mingli.yu@windriver.com>
+Date: Wed, 4 Nov 2020 23:37:44 -0800
+Subject: [PATCH] autogen.sh: not generate configure
+
+Only use autogen.sh to generate configure.ac.
+
+Upstream-Status: Inappropriate [embedded specific]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ autogen.sh | 8 --------
+ 1 file changed, 8 deletions(-)
+
+diff --git a/autogen.sh b/autogen.sh
+index df734ce9..d7bbf8cb 100755
+--- a/autogen.sh
++++ b/autogen.sh
+@@ -52,11 +52,3 @@ cat configure.seed | sed \
+     -e "s/@NDPI_VERSION_SHORT@/$NDPI_VERSION_SHORT/g" \
+     -e "s/@FUZZY@/$FUZZY/g" \
+     > configure.ac
+-
+-autoreconf -ivf
+-cat configure | sed "s/#define PACKAGE/#define NDPI_PACKAGE/g" | sed "s/#=
define VERSION/#define NDPI_VERSION/g"  > configure.tmp
+-cat configure.tmp > configure
+-
+-chmod +x configure
+-./configure $@
+-
+--=20
+2.17.1
+
diff --git a/meta-networking/recipes-support/ntopng/ndpi_3.4.bb b/meta-netw=
orking/recipes-support/ntopng/ndpi_3.4.bb
new file mode 100644
index 000000000..1e4153779
--- /dev/null
+++ b/meta-networking/recipes-support/ntopng/ndpi_3.4.bb
@@ -0,0 +1,26 @@
+SUMMARY =3D "A library for deep-packet inspection."
+DESCRIPTION =3D "nDPI is an open source LGPLv3 library for deep-packet \
+inspection. Based on OpenDPI it includes ntop extensions"
+
+SECTION =3D "libdevel"
+DEPENDS =3D "libpcap"
+RDEPENDS_${PN} +=3D " libpcap"
+LICENSE =3D "GPLv3"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db52f2d57d10c4f7ee67a7eb9615d5d2=
4"
+
+SRCREV =3D "64929a75e0a7a60d864bd25a9fd97fdf9ac892a2"
+SRC_URI =3D "git://github.com/ntop/nDPI.git;branch=3D3.4-stable \
+           file://0001-autogen.sh-not-generate-configure.patch \
+"
+
+S =3D "${WORKDIR}/git"
+
+inherit autotools-brokensep pkgconfig
+
+do_configure_prepend() {
+    ${S}/autogen.sh
+}
+
+EXTRA_OEMAKE =3D " \
+    libdir=3D${libdir} \
+"
--=20
2.26.2

