Return-Path: <Rasmus.Villemoes@prevas.se>
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
	(mail-eopbgr10116.outbound.protection.outlook.com [40.107.1.116])
	by mail.openembedded.org (Postfix) with ESMTP id E66D67F34D
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  9 Aug 2019 09:20:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=aAPrfyyO6S5jF/7xPADXNfrv0SP5nP8uJG7VvV/wV3gh/BWiVGfLor1TRY9a/r05gBe2LNpW7YZRzzwg9WHRarSINEqN/un8rY7MdIGsbodOGJPtg7J4/R9CTCChAmT7unZVvJ2jKHKx0tj2hgpf/zRu4v4wn4/EqBBrMC+3f/TDwxBoH0TJAeiLD5zL1HRCifsMGEe0NRBBpBWcMkI8wfYdqP3RTsCwP/jIEFNT4Huv/zLH1ct2ed2lmEiLf4/6L4VDKcv6QawnTliWUm/5TFhZDDnGvboRWEh+okBK9WUsVHZfR6y/ZKIqchgM9gif/8FRLR8msIk7ZbRn4enVuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=bY93T8wddHmr+7K0wLHQDlDOZ2gbt+l2jTFKI92hohM=;
	b=hc2WM+CabdJTKHXKysCpDasdrLyNRMp01REwY5+B8OuqkX4tsD3LBOFmA7KUHk8Q9J0VZ2djbpMfIU5KTCAS1RGDY6ucB6+Q7frHOnojtwmHf5ErbTmtunpSqoJIhZKVwlyl4j5FUX+Cs7tbFOKwDUbYxgeY2zh3UVep1VN6eMtJU+xtVWc+SiXoZ5r4vEYbvmA8j+zjnx9n69H1OTn+OLVLAOQbflJwY9dJmAAvpVSEuaXoAX67/J9YpK9d3ku8LDWMsQ2M5L8QCEAfl0blcXsSQdp87vcwSQEjtye3Pd9AgYQousiPy+9bR6U0jj5Y+6PFS+LqVy8GdoWBZwcwAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=prevas.se; dmarc=pass action=none header.from=prevas.dk; 
	dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.se; s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=bY93T8wddHmr+7K0wLHQDlDOZ2gbt+l2jTFKI92hohM=;
	b=zZOquyRFr3aHPveINGUgEZMujYFoR3m573NibL8UxIiQfjz5MGCABR4XS3rOWLGmY+v094yNc4JqxGADo1i1w3HS6X5dSoEXBVeSJ6jg6H+yfswqNuxe1pXdICWa/0OJSY6Ewbj7yx24L2W83YEc1HEwpLCa/AVl+1UvmfP8800=
Received: from AM0PR10MB3476.EURPRD10.PROD.OUTLOOK.COM (10.186.175.83) by
	AM0PR10MB2180.EURPRD10.PROD.OUTLOOK.COM (20.177.109.91) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2157.16; Fri, 9 Aug 2019 09:20:37 +0000
Received: from AM0PR10MB3476.EURPRD10.PROD.OUTLOOK.COM
	([fe80::9451:861a:85cc:daa0]) by
	AM0PR10MB3476.EURPRD10.PROD.OUTLOOK.COM
	([fe80::9451:861a:85cc:daa0%2]) with mapi id 15.20.2157.020;
	Fri, 9 Aug 2019 09:20:37 +0000
From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-browser][PATCH 2/2] chromium: add patch to fix build of
	native tool make_top_domain_list_for_edit_distance
Thread-Index: AQHVTpO06Gvxq2uL+USccrZeLZEeDw==
Date: Fri, 9 Aug 2019 09:20:36 +0000
Message-ID: <20190809092013.32650-2-rasmus.villemoes@prevas.dk>
References: <20190809092013.32650-1-rasmus.villemoes@prevas.dk>
In-Reply-To: <20190809092013.32650-1-rasmus.villemoes@prevas.dk>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HE1PR09CA0046.eurprd09.prod.outlook.com
	(2603:10a6:7:3c::14) To AM0PR10MB3476.EURPRD10.PROD.OUTLOOK.COM
	(2603:10a6:20b:15e::19)
x-mailer: git-send-email 2.20.1
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Rasmus.Villemoes@prevas.se; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [81.216.59.226]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 596ba78d-bb18-476a-666a-08d71caad6ae
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
	SRVR:AM0PR10MB2180; 
x-ms-traffictypediagnostic: AM0PR10MB2180:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR10MB218068E54815760CBA3C240C8AD60@AM0PR10MB2180.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 01244308DF
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(366004)(39850400004)(136003)(396003)(346002)(376002)(189003)(199004)(186003)(66476007)(66946007)(102836004)(1076003)(14454004)(476003)(5660300002)(66556008)(8936002)(6506007)(8976002)(305945005)(66446008)(386003)(6916009)(76176011)(26005)(25786009)(2906002)(7736002)(66574012)(8676002)(71190400001)(3846002)(64756008)(6116002)(508600001)(71200400001)(81156014)(6486002)(107886003)(36756003)(4326008)(81166006)(316002)(44832011)(6512007)(50226002)(486006)(54906003)(6436002)(2351001)(14444005)(446003)(256004)(42882007)(53936002)(99286004)(66066001)(11346002)(52116002)(5640700003)(2501003)(2616005);
	DIR:OUT; SFP:1102; SCL:1; SRVR:AM0PR10MB2180;
	H:AM0PR10MB3476.EURPRD10.PROD.OUTLOOK.COM; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: prevas.se does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: vOdXDPAyNV97+iulE8pXx6hIeNhnXI0GuOx4Pe8kLkOP6NWIEZ+OgmX2OtawqTVeOLf6x2VzdwG3v30YNDsCg/vZcCFyT0f43GDr5sOzuT0egmkZ7KkTJqMwYFnC1fAFv91haQfdb8UQoZuGkQn77jfU3xpDx3zW7FnDkv65lR9pyB+6cXYhKqDge18FsUfw2fUIzK9cFyoD51f/zsF+G/yfQO6NHwedgmZ3Jfdla5da9iIltWfvm7xFIPog8i31BVxa80Yyaok+CtG4ezu3/vV1oEr9rBzDopPHH2c4/BvjxJKDCRh1aETXArkV8dhSMRCWo9/O8+d3sRvECOqmB7RMJ/uO0FuiEWbKTeFbfJLA18kWtJ8kYz3avtBOK67ra6dStadg8yUrj38qTJTI6vCsUTwAJYIq9+WNtDiHLmQ=
MIME-Version: 1.0
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: 596ba78d-bb18-476a-666a-08d71caad6ae
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Aug 2019 09:20:36.9927 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: x16W0RYZhuTovc9iqpLBnHoKHNblkSVRid/VLyyluR/zoKKrOhixdd5UOPZWZYMfiuB0GEtKK8CMpQVPQK4pE5A326R5dElM0F0+bT71yvw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB2180
X-Mailman-Approved-At: Mon, 19 Aug 2019 08:55:33 +0000
Cc: Maksim Sisov <msisov@igalia.com>,
	Rasmus Villemoes <Rasmus.Villemoes@prevas.se>,
	Raphael Kubo da Costa <raphael.kubo.da.costa@intel.com>,
	Jakob Dyhr Thomsen <jakob.dyhr@prevas.dk>,
	Jonas Suhr Christensen <Jonas.Christensen@prevas.dk>
Subject: [meta-browser][PATCH 2/2] chromium: add patch to fix build of native tool make_top_domain_list_for_edit_distance
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
X-List-Received-Date: Fri, 09 Aug 2019 09:20:37 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Inside the source_set("net_deps"), one finds

  if (!is_nacl) {
    public_deps +=3D [
      "//base/third_party/dynamic_annotations",
      "//third_party/zlib",
    ]

and the recipe explicitly sets enable_nacl=3Dfalse. So one should think
that this was already ok, but without it, the build fails. I don't
really understand the gn config language, but perhaps the above has no
effect because the :net_deps is only pulled into deps.

Signed-off-by: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
---
 recipes-browser/chromium/chromium-gn.inc      |  1 +
 ...-third_party-zlib-to-public-dependen.patch | 29 +++++++++++++++++++
 2 files changed, 30 insertions(+)
 create mode 100644 recipes-browser/chromium/files/net-BUILD.gn-add-third_p=
arty-zlib-to-public-dependen.patch

diff --git a/recipes-browser/chromium/chromium-gn.inc b/recipes-browser/chr=
omium/chromium-gn.inc
index d9735ab..2c8cd20 100644
--- a/recipes-browser/chromium/chromium-gn.inc
+++ b/recipes-browser/chromium/chromium-gn.inc
@@ -14,6 +14,7 @@ SRC_URI +=3D " \
         file://wrapper-extra-flags.patch \
         file://do-not-specify-march-on-arm.patch \
         file://add_internal_define_armv7ve.patch \
+        file://net-BUILD.gn-add-third_party-zlib-to-public-dependen.patch =
\
 "
=20
 SRC_URI_append_libc-musl =3D "\
diff --git a/recipes-browser/chromium/files/net-BUILD.gn-add-third_party-zl=
ib-to-public-dependen.patch b/recipes-browser/chromium/files/net-BUILD.gn-a=
dd-third_party-zlib-to-public-dependen.patch
new file mode 100644
index 0000000..bffd65d
--- /dev/null
+++ b/recipes-browser/chromium/files/net-BUILD.gn-add-third_party-zlib-to-p=
ublic-dependen.patch
@@ -0,0 +1,29 @@
+From 141ffd4e77d1142461cca86065695433acd0914a Mon Sep 17 00:00:00 2001
+From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
+Date: Wed, 7 Aug 2019 13:02:36 +0200
+Subject: [PATCH] net/BUILD.gn: add third_party/zlib to public dependencies
+
+Without this, the build of yocto_native/make_top_domain_list_for_edit_dist=
ance fails
+(libchrome_zlib.so, needed by yocto_native/libnet.so, not found).
+
+Upstream-Status: pending
+
+---
+ net/BUILD.gn | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/net/BUILD.gn b/net/BUILD.gn
+index b3d97f6a0a67..d4f1800c74d4 100644
+--- a/net/BUILD.gn
++++ b/net/BUILD.gn
+@@ -2337,6 +2337,7 @@ source_set("net_public_deps") {
+     "//crypto:platform",
+     "//net/traffic_annotation",
+     "//third_party/boringssl",
++    "//third_party/zlib",
+     "//url",
+   ]
+=20
+--=20
+2.20.1
+
--=20
2.20.1


