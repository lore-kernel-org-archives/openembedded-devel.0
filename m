Return-Path: <jhofstee@victronenergy.com>
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
	(mail-eopbgr00132.outbound.protection.outlook.com [40.107.0.132])
	by mail.openembedded.org (Postfix) with ESMTP id C8F787F8DF
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Nov 2019 21:44:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=KUa731b0y6wNqpcjEmo39yzsElnyFSxlv+cNeGfzwle0HrJhjXBOB2fWCg3QBBlo3xKw173eYxA3Y584vnHW4zxo1I9Q4wsOtIFWlpTjSHs7TO5Ng2G2f21zqJ0DAM+9Uamc3omK1hcpvZOR2QQ3uB7b9lasRNMhZ7tssWyIP30idkEyXIJ7+gbPlxBB9as6cA9tUR8s2A3+p46wSFPeMh2EbjQgcnjbbOEh7aOV/P31Pe3/z4ETR6i1xI9j5ouKKr+MIJ7Px1BYPhI2F1v9XYAVwn3zpLdBpulLWywk8usJU0uvwLWBimoiSsG225JrC/QoVFHAtpsM+nhBye7kyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=pGN1LT1KcK8sdKiJf/jbKnFjO9Fsxm/9fV3XC0Pj+sU=;
	b=bim4l5bS+O2y0Giy6UYgjZXlmbff9Uu0+F8CLxXGlqN/FxiErQiWm6FIASsdUeZU3jG7z2Bp1U242Bk2RCNsgJ0pF+LbDrNPK3NUfycNU9EZOoHkc1BJPcTnNBm8KW2+e1GmnMP+dYIayOL4H+weQLjPECewd4L9mkEDBJItCO4RJ5ObHmcnkfZbp8mOEKKzABsSW0MbaX7Vg9WlgWhqfcDzLvudEMXEv8iaw1sF+6HK9IV2mo9ZiaWlLqVc7XSDWxBxJ+MWkcHVC/oKkOdr8v4V1x0jhBCjfi0kRZHhMBWuDqu5gO1d/02KqavVGvr6zllfyucO9JmnsFUZj6gzBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=victronenergy.com; dmarc=pass action=none
	header.from=victronenergy.com; dkim=pass header.d=victronenergy.com;
	arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=victronenergy.com;
	s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=pGN1LT1KcK8sdKiJf/jbKnFjO9Fsxm/9fV3XC0Pj+sU=;
	b=n6Rupcq2d1bwmDMsjvM539lLMdje3pHCMvPy1hym0MCj6CWklGsdPm1IUnR3MhhrmgRlsuZ0TXqvlkQEcaYrSPCBWag4aRDPPW7N/jNLxrv+/QQjQE/QtVeS2QgGD5VbQ7hxzVF10/HlXNvs3WDfDjqyzFFUCQYv0m/2C7KevkI=
Received: from VI1PR0701MB2623.eurprd07.prod.outlook.com (10.173.82.19) by
	VI1PR0701MB2814.eurprd07.prod.outlook.com (10.173.70.8) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2474.9; Sun, 17 Nov 2019 21:44:40 +0000
Received: from VI1PR0701MB2623.eurprd07.prod.outlook.com
	([fe80::dc67:84fb:5210:adb8]) by
	VI1PR0701MB2623.eurprd07.prod.outlook.com
	([fe80::dc67:84fb:5210:adb8%8]) with mapi id 15.20.2474.012;
	Sun, 17 Nov 2019 21:44:40 +0000
From: Jeroen Hofstee <jhofstee@victronenergy.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-qt4][PATCH 1/2] qt4: fix whitespace so it aligns
Thread-Index: AQHVnZA3+orsH16VwU6k/DFE+EqlsQ==
Date: Sun, 17 Nov 2019 21:44:40 +0000
Message-ID: <20191117214427.20073-2-jhofstee@victronenergy.com>
References: <20191117214427.20073-1-jhofstee@victronenergy.com>
In-Reply-To: <20191117214427.20073-1-jhofstee@victronenergy.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2001:1c01:3bc5:4e00:461c:a8ff:fee1:70b5]
x-clientproxiedby: AM0PR02CA0025.eurprd02.prod.outlook.com
	(2603:10a6:208:3e::38) To VI1PR0701MB2623.eurprd07.prod.outlook.com
	(2603:10a6:801:b::19)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=jhofstee@victronenergy.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b10f53a8-0681-414c-c855-08d76ba75987
x-ms-traffictypediagnostic: VI1PR0701MB2814:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR0701MB2814C09EA3396A0ABD3C4832C0720@VI1PR0701MB2814.eurprd07.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2276;
x-forefront-prvs: 02243C58C6
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(346002)(136003)(376002)(396003)(366004)(39840400004)(199004)(189003)(6916009)(6506007)(305945005)(386003)(7736002)(478600001)(99286004)(76176011)(102836004)(36756003)(50226002)(6512007)(52116002)(316002)(2351001)(14454004)(66946007)(66446008)(64756008)(66556008)(66476007)(2501003)(8676002)(81166006)(446003)(11346002)(86362001)(46003)(1076003)(81156014)(6486002)(4326008)(107886003)(256004)(186003)(8936002)(6436002)(486006)(5640700003)(5660300002)(71200400001)(6116002)(71190400001)(6306002)(25786009)(2616005)(2906002)(476003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR0701MB2814;
	H:VI1PR0701MB2623.eurprd07.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: victronenergy.com does not
	designate permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: y4HbHZZIc+u5jqKzyzImDBNsov3rydG9b0UbW62lqT49WQlQPlkiXV0WMW6UZPRyU6wx17WWYEXpg226odw5y1Of9fTWFvKf4luifvXjq/dTSCGt/UrDYbmvD8MsWdr76Y0tYTBKWGiuieHp5BSeyZqERaS1CvMOnaVgOUtcv6WVyjIu53HSkMUUbabuva82N+ycfRbZrBi33+jnlrZgC4jJ4QNJBA+7BziJfNURaB5HSxcaSTa2Wd8zguJklLppPc1VpFfFy4s317W3x3BgGwPQX5zxSP2pDI9DYXT2O91E62S0gB1Vmj6SqiQB7oabxmKYwAGBBcwIZBJF++vKvzJ8zO411BeCYJ3EjSH6zhHePma95zx7mzo9cUgYP7ECZhlQPym0m5O8syFD7ctLYmPdkHl+P8psb6/0nozDGg9pdBdbyBzHyx8KmeRuzFQU
MIME-Version: 1.0
X-OriginatorOrg: victronenergy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b10f53a8-0681-414c-c855-08d76ba75987
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2019 21:44:40.3934 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 60b95f08-3558-4e94-b0f8-d690c498e225
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Hks7P9y0+tutNIKsdtvGBeW3uXbE8n4tRs3FfBgBz2mncXiGkdxV9ApUYDzJ0XJVjOihx0ZTbEVz6jKhTQkSblv0Eoyd67+JVBhcMCfry9U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0701MB2814
Subject: [meta-qt4][PATCH 1/2] qt4: fix whitespace so it aligns
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 17 Nov 2019 21:44:40 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Jeroen Hofstee <jhofstee@victronenergy.com>
---
 recipes-qt4/qt4/qt4-4.8.7.inc  |  4 ++--
 recipes-qt4/qt4/qt4-native.inc | 10 +++++-----
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/recipes-qt4/qt4/qt4-4.8.7.inc b/recipes-qt4/qt4/qt4-4.8.7.inc
index d8b178f..7d9b9b9 100644
--- a/recipes-qt4/qt4/qt4-4.8.7.inc
+++ b/recipes-qt4/qt4/qt4-4.8.7.inc
@@ -27,7 +27,7 @@ SRC_URI =3D "http://download.qt-project.org/official_rele=
ases/qt/4.8/${PV}/qt-ever
            file://0034-Fix-kmap2qmap-build-with-clang.patch \
            file://0035-Add-nios2-support.patch \
            file://0036-qt-everywhere-opensource-src-4.8.7-gcc6.patch \
-	   file://0037-fix-configure-with-icu60.patch \
+           file://0037-fix-configure-with-icu60.patch \
            file://gcc-version.patch \
            file://Fix-QWSLock-invalid-argument-logs.patch \
            file://add_check_for_aarch64_32.patch \
@@ -35,7 +35,7 @@ SRC_URI =3D "http://download.qt-project.org/official_rele=
ases/qt/4.8/${PV}/qt-ever
            file://g++.conf \
            file://linux.conf \
            file://fix-for-mips-n32.patch \
-	   file://qt-everywhere-opensource-src-4.8.6-QTBUG-22829.patch \
+           file://qt-everywhere-opensource-src-4.8.6-QTBUG-22829.patch \
            "
=20
 SRC_URI[md5sum] =3D "d990ee66bf7ab0c785589776f35ba6ad"
diff --git a/recipes-qt4/qt4/qt4-native.inc b/recipes-qt4/qt4/qt4-native.in=
c
index 8a672bd..b813f9e 100644
--- a/recipes-qt4/qt4/qt4-native.inc
+++ b/recipes-qt4/qt4/qt4-native.inc
@@ -15,14 +15,14 @@ SRC_URI =3D "http://download.qt-project.org/official_re=
leases/qt/4.8/${PV}/qt-ever
            file://0001-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-=
u.patch \
            file://0002-qkbdtty_qws-fix-build-with-old-kernel-headers.patch=
 \
            file://0003-webkit2-set-OUTPUT_DIR-value-if-empty.patch \
-	   file://0015-configure-add-nostrip-for-debug-packages.patch  \
+           file://0015-configure-add-nostrip-for-debug-packages.patch  \
            file://0021-configure-make-qt4-native-work-with-long-building-p=
a.patch \
-	   file://0036-qt-everywhere-opensource-src-4.8.7-gcc6.patch \
-	   file://gcc-version.patch \
+           file://0036-qt-everywhere-opensource-src-4.8.7-gcc6.patch \
+           file://gcc-version.patch \
            file://g++.conf \
            file://linux.conf \
-	   file://qt-everywhere-opensource-src-4.8.6-QTBUG-22829.patch \
-	"
+           file://qt-everywhere-opensource-src-4.8.6-QTBUG-22829.patch \
+"
=20
 UPSTREAM_CHECK_URI =3D "http://download.qt.io/official_releases/qt/4.8/"
 UPSTREAM_CHECK_REGEX =3D "(?P<pver>\d+(\.\d+)+)/"
--=20
2.17.1


