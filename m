Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.78])
 by mx.groups.io with SMTP id smtpd.web08.5147.1604568138772883595
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Nov 2020 01:22:18 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=Ivpo+ZSC;
 spf=pass (domain: windriver.com, ip: 40.107.220.78, mailfrom: mingli.yu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YbJZ8BWf980Rv9Lxg+30QY3fwikbFqbG9y6rSjJdb2QR6GcoP+vnr+s4VQF3XKMAZ0A3LrxK8BSuj3ttNjXJPvKGs3IKkFK5v2asJ4VgqTAu5Quot3A+bWggMt1xKjKyUQlh0luM3E6Sdfm7iISPPuUvKBal2VZLtSgBEjLof/+mMQC0sobyCwpLJ7syBwg2k4f9LYzt+xAxkMOU38G77UaGAxuBnVd6p3Kizcdt7RGJLH8lH1tsOHm+qAiMifsA9JRC3588fOblW0JOAUKoEJYlqFBwHYrM7ueBAGOXKjDOmuRTW8WDtPy/S9zbb9EkXeGOVagacPzX64nqcAANRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bejiY8iR6hGzcvFr/cMbSArUMBAEtR2wReQ9yGB6nhA=;
 b=lEJEcnlknEGcNcrTiY6HjGTHxwjNm8ZoPTuZNGROL+yKBpRgeUzQCxJY/DhEagB0yBEVLO+vDZvC8iGQp6+IFJa4iWn/yYZ1P54zCAkeFBJCiYxjgqehngDpcEKwfzFSGC9lXAA2GyVm5hohAWelNgRkMzrJbVbMIJL/3UhUyM4a8sIn1JD0cPU6rTmgCEH0dTBCu96rwoo2OHLlMUDHmREs1vjiYQvZ/kvhOBz0ZQI4FFhjwn2b443Q7KanYOqjTNg92Nql7Zb0p/WgiSzW+EpSgF1ilJBqd1nKb/383qEbaRCxKB3jj6LKQcJMJygsonxGfATeX8XqCspnMb98NA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bejiY8iR6hGzcvFr/cMbSArUMBAEtR2wReQ9yGB6nhA=;
 b=Ivpo+ZSCnxZblZ0udRNqqp80E5zA+SBJHUYUI968gFODjj8AqT40X4xXdoEWD+BYeW5BqZ4Edw0KlOT8YQ5ad6BYSKRpNvT3C227V7DqYQCTm5FrfOBzsvwoWsjdCpchjjumM9wlsx5V++9WmF4AgUo9lFmOm46DcACnN7ZKRNQ=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 by CO1PR11MB4898.namprd11.prod.outlook.com (2603:10b6:303:92::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21; Thu, 5 Nov
 2020 09:22:16 +0000
Received: from CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::105b:9105:2a38:9e9f]) by CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::105b:9105:2a38:9e9f%7]) with mapi id 15.20.3499.032; Thu, 5 Nov 2020
 09:22:16 +0000
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 2/4] ndpi: add new recipe
Date: Thu,  5 Nov 2020 17:18:23 +0800
Message-ID: <20201105091825.36257-2-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201105091825.36257-1-mingli.yu@windriver.com>
References: <20201105091825.36257-1-mingli.yu@windriver.com>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR0302CA0001.apcprd03.prod.outlook.com
 (2603:1096:202::11) To CO1PR11MB5009.namprd11.prod.outlook.com
 (2603:10b6:303:9e::11)
Return-Path: mingli.yu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpg-core2.corp.ad.wrs.com (60.247.85.82) by HK2PR0302CA0001.apcprd03.prod.outlook.com (2603:1096:202::11) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.13 via Frontend Transport; Thu, 5 Nov 2020 09:22:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5aceb954-55cc-41da-e449-08d8816c49a4
X-MS-TrafficTypeDiagnostic: CO1PR11MB4898:
X-Microsoft-Antispam-PRVS: 
	<CO1PR11MB4898B7C9DEE2ED7FC3B0B528F1EE0@CO1PR11MB4898.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:175;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	vYZSwCwGtOA0Pf+MPMmGMlm7vxiIi0Mvav2TpyNVD57NOJwXcehogTwxh1cyW9SUKYwP/4LR8HG6cPlo01g/6no6nnbEzwz5ggQ1zp5flCHICTw+AevAc/uZWza6j4aTkemkPDqxYCqXYS6NiyIxiS4uH58dXWaOr8BALNtXHPQH65QJmy10yDV0uzobQgikL8qEiER95pr1PRYSSfd46jSBPZhV0kKHO4L4y/ql1MOelQyKcY5R7rDIKJyDmUZBDYq2DGCrCDa5CD5qxyjh46JYKpruHlWcDlBkKXaFD3GHVLlm0hQUAEdJ7YpDxOo3Lhfzi9mzehLwvILrizYsfQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5009.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(396003)(136003)(366004)(39850400004)(9686003)(6512007)(6506007)(1076003)(186003)(16526019)(478600001)(6666004)(52116002)(26005)(86362001)(2616005)(956004)(6916009)(6486002)(2906002)(5660300002)(36756003)(8936002)(316002)(8676002)(66946007)(66476007)(83380400001)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	k5vi7Jq08w6qI2uxB/PuWYmcS/AJbnG7HVWDoJciGYg1CHx9EIXmHpG78oX/6vihZoLUiuEMQRVVGxObC9yObctw3eAvTGLZ3x1iT7RKmG4wJ/hoeGKPlQdN2F/kwwmwGD4IE2Uv1SkeX1YkVdi/QsFb6V9EcbhPFogOifJzGdgp/CdkErTCvIYtkqLPOKjraiS3JaWp/g8N8Xqwz+UJxW4I+rJPpzkTRY2mLMfa5x6vo3vsrqKeKdgHb7Hinl4QMLuhBo/DFMD50q0yphwQquuMIpvGh2zgBdjzcWVfR2vWtBv/geFyQC2k/G0zdIRVBBpWocWUlYc82I+Dtle6qhu28HP3ptloNU8xTBVrwhXpp+IvGzBuNV0eil5A+B57ccA6rlPUt8HilSJYVmFP3hbyKgTXA0wJq9i676/SrzG1xVhPS8ie00trtvGlTnAyFnrTZmt7nriHZT/ko6jSGG2MrMVcSGUjMohlLdyOwR7UkYzoKM3HAvfcucSidJgtSaT7hurv/E3arNa0twdR02RxhxD4Dqt6PPQSweqXy+hjz2HXKsV2XxMfGSJIrSaLr4uqnnntIvfcUilUOU+Loa843b1DUK5vy4jOmUxd8h1FJ4PgWGk7TDDE/eAU2bGd89Ap8w30og7y4/cCAZuKIQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5aceb954-55cc-41da-e449-08d8816c49a4
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5009.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2020 09:22:16.6821
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eXDH9much7iSfIGEvfrlXBunnPVw+/H+EOREu/ipPYWsC4jCHo6oWnSL1PBeAyfLR1WqaWTcOyX7cxMrNTWDMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4898
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

