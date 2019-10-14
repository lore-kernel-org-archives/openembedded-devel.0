Return-Path: <urs.fassler@bbv.ch>
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-eopbgr150041.outbound.protection.outlook.com [40.107.15.41])
	by mail.openembedded.org (Postfix) with ESMTP id 4E1296BD08
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Oct 2019 12:26:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=ia0s4TxOuHGMWa+dp6paDRa0q3r2Zxow0OtruaBxyluohY7LgWNeslsIXJmt0yXvKGaOgkILhNhQugFy8dWVrDuDg2dQC0e4sCGKQ7LcFtG7T3APQQi3qtUuSADHTAR4jS/q+mdSbBgEZb1xb0p06GUvAEiQ6A0yREe491WkkKqajeZRpwdhKzNokFO6KyKW1aOXq3MPc23IlDFLzcCZaCGqNevN+iVcB5Hy1ppdtu92gdTcFLg9gTRJLveG1kL5MXiLjMeSi/KSML4NsJibiX22T8EPgebkFKd8K7dApCEFT4Rry7PLwjkwaoTW0S4TPQvRXSJbKnGhX6bbScN6Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=jbRhQq76j/NWjAjUrSb/h+LCf55ilZOeleDD4V4o/e8=;
	b=EJ9sLL/vgLfdOo2Ad3KaBE4RwjNLClBvTTGoZusIvoL7mHqxmRomDPLzz/1Zr67GcqihigOu86O5Q7ZaWmq2GZ8I9VAlXyqRX8ImPH982P4RQqMm7ItV6bLhzLROz/87/kSZBHGizMLmGP3kqEwmsYYuuEgb1aJcK6brpgudVyxB0rgRZwoM7mnxB/Jr9GUJiWeGwOMlj+gnNjD6v8J1B6qNCmmW1/u5kLPisq5nT/j32HFM/advjJj7xNoxGF5gcMM20YxUbg9ofXdxqcI1pnVYxUvUi4PPMGNm1YOKY+EZm2M/G77snNoutG0it3ADX5cKNqKxZVPXMZjGvMNbeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=bbv.ch; dmarc=pass action=none header.from=bbv.ch;
	dkim=pass header.d=bbv.ch; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bbvSoftwareServices.onmicrosoft.com;
	s=selector2-bbvSoftwareServices-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=jbRhQq76j/NWjAjUrSb/h+LCf55ilZOeleDD4V4o/e8=;
	b=GOeL9hBwgoVaF2jBxKp430p0cFSfJXVdqahzOwM3eqxscAgBH5U82+PEuKcWxf059mZ10lty4KExqCzn+LvfPhiEdf9P6RYG//aiJyRzhWGXWPjMjyiS5PuMwE/q+sNtVG+tQHe3p91k8rFVi3+8wjI5KeIZGY2A/G2Bh/bpV9w=
Received: from VI1P194MB0253.EURP194.PROD.OUTLOOK.COM (10.175.183.139) by
	VI1P194MB0062.EURP194.PROD.OUTLOOK.COM (10.175.182.21) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2347.21; Mon, 14 Oct 2019 12:26:17 +0000
Received: from VI1P194MB0253.EURP194.PROD.OUTLOOK.COM
	([fe80::1471:2eb9:7551:471a]) by VI1P194MB0253.EURP194.PROD.OUTLOOK.COM
	([fe80::1471:2eb9:7551:471a%5]) with mapi id 15.20.2347.023;
	Mon, 14 Oct 2019 12:26:17 +0000
From: =?iso-8859-1?Q?Urs_F=E4ssler?= <urs.fassler@bbv.ch>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-networking][PATCH] open62541: add new recipe
Thread-Index: AQHVgoqTeuwmntgfhE2jsZ79e+QPPg==
Date: Mon, 14 Oct 2019 12:26:17 +0000
Message-ID: <20191014122601.18745-1-urs.fassler@bbv.ch>
Accept-Language: de-CH, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.20.1
x-clientproxiedby: PR0P264CA0178.FRAP264.PROD.OUTLOOK.COM
	(2603:10a6:100:1c::22) To VI1P194MB0253.EURP194.PROD.OUTLOOK.COM
	(2603:10a6:800:c9::11)
x-originating-ip: [213.160.33.170]
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=urs.fassler@bbv.ch; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e85b5916-94e9-49a9-d1b8-08d750a1b63b
x-ms-traffictypediagnostic: VI1P194MB0062:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1P194MB0062F16609B1B356E9C5ECA58F900@VI1P194MB0062.EURP194.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:568;
x-forefront-prvs: 01901B3451
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(376002)(396003)(136003)(39840400004)(346002)(366004)(189003)(199004)(6306002)(2351001)(6916009)(486006)(2616005)(7736002)(2906002)(6116002)(476003)(3846002)(305945005)(5640700003)(6436002)(256004)(6486002)(6512007)(4326008)(36756003)(66946007)(66476007)(66556008)(64756008)(66446008)(1076003)(8936002)(50226002)(5660300002)(8676002)(81156014)(81166006)(186003)(99286004)(71190400001)(52116002)(45776006)(25786009)(26005)(86362001)(508600001)(316002)(14454004)(66066001)(102836004)(386003)(54906003)(2501003)(71200400001)(6506007);
	DIR:OUT; SFP:1101; SCL:1; SRVR:VI1P194MB0062;
	H:VI1P194MB0253.EURP194.PROD.OUTLOOK.COM; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: bbv.ch does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: EoyLB8Fg5VRpn/Q9cfD7SJE/bLNcukHMAClz7dkJH0m+3tH+mBbuH/hJl/VQWrJFM2/df6xqqIlHygYzxpQQN7/wvThwGsDnzrO0+eOMyoW4mCSRdoSBY798kNC5tWHVom/QsGQYnBfvS9Tz5cDkfWnwCQXce0I7bRiqajhPlOP3I5eEQtk+tjpsQyTTBDVm1IYkRSMAh8bg4lcz8VGUA3Gk67XxIHn5A88K3SepV5ncKh6TJm+dI6waeNhRVU7MQZDwpc+/4YHDCrZOngu9bPz6ds0+pFTt8EBETro2RRaxeH3EdnyqJpvT/A81+Mwr0LqWTGWg188jvVQ/DVFRXhjS0bev7a10FuzIsCEgEawBeubycb+9gpTDZxxg+4vs20nHHjiQ07hH9Ay+ltUccDt8F+Xb+jnan5Yv02I4Lqc8uOhRNanuKHMIGVUNC7fpVFshVvxK6yfNq3+MFQfjEg==
MIME-Version: 1.0
X-OriginatorOrg: bbv.ch
X-MS-Exchange-CrossTenant-Network-Message-Id: e85b5916-94e9-49a9-d1b8-08d750a1b63b
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2019 12:26:17.5643 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 279985bd-2077-4d9d-9797-42238cfc06e2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QcS6iIiVP66oB5Hag5Qqh2qp1dLucAA4ojKWYaenVSbCZm9z0leHXGGLPQRIJlNngr2jzlTnwEireQxNsevWrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1P194MB0062
Cc: "denys@ti.com" <denys@ti.com>
Subject: [meta-networking][PATCH] open62541: add new recipe
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
X-List-Received-Date: Mon, 14 Oct 2019 12:26:18 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

It provides a open source implementation for OPC UA.
---
 .../files/0001-fix_ignored_return_value.patch | 17 ++++++++++
 .../open62541/open62541_1.0.bb                | 32 +++++++++++++++++++
 2 files changed, 49 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/open62541/files/00=
01-fix_ignored_return_value.patch
 create mode 100644 meta-networking/recipes-connectivity/open62541/open6254=
1_1.0.bb

diff --git a/meta-networking/recipes-connectivity/open62541/files/0001-fix_=
ignored_return_value.patch b/meta-networking/recipes-connectivity/open62541=
/files/0001-fix_ignored_return_value.patch
new file mode 100644
index 000000000..3a8377ec5
--- /dev/null
+++ b/meta-networking/recipes-connectivity/open62541/files/0001-fix_ignored=
_return_value.patch
@@ -0,0 +1,17 @@
+diff --git a/plugins/ua_pki_default.c b/plugins/ua_pki_default.c
+index 79331bc9..b20ad95c 100644
+--- a/plugins/ua_pki_default.c
++++ b/plugins/ua_pki_default.c
+@@ -89,7 +89,11 @@ fileNamesFromFolder(const UA_String *folder, size_t *pa=
thsSize, UA_String **path
+
+     struct dirent *ent;
+     char buf2[PATH_MAX + 1];
+-    realpath(buf, buf2);
++    char *res =3D realpath(buf, buf2);
++    if(res =3D=3D NULL) {
++        closedir(dir);
++        return UA_STATUSCODE_BADINTERNALERROR;
++    }
+     size_t pathlen =3D strlen(buf2);
+     *pathsSize =3D 0;
+     while((ent =3D readdir (dir)) !=3D NULL && *pathsSize < 256) {
diff --git a/meta-networking/recipes-connectivity/open62541/open62541_1.0.b=
b b/meta-networking/recipes-connectivity/open62541/open62541_1.0.bb
new file mode 100644
index 000000000..c34e70660
--- /dev/null
+++ b/meta-networking/recipes-connectivity/open62541/open62541_1.0.bb
@@ -0,0 +1,32 @@
+HOMEPAGE =3D "http://open62541.org/"
+SUMMARY =3D "Open source implementation of OPC UA - library"
+LICENSE =3D "MPL-2.0"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D815ca599c9df247a0c7f619bab123da=
d"
+
+SRCREV =3D "ce5209d78d3821504d31b3bbdb03f53d6e3f93a7"
+SRC_URI =3D " \
+	gitsm://github.com/open62541/open62541.git \
+	file://0001-fix_ignored_return_value.patch \
+"
+
+S =3D "${WORKDIR}/git"
+
+inherit cmake python3native
+
+DEPENDS +=3D " \
+	python3-six-native \
+	mbedtls \
+"
+
+EXTRA_OECMAKE =3D " \
+	-DCMAKE_BUILD_TYPE=3DDebug \
+	-DBUILD_SHARED_LIBS=3DON \
+	-DUA_NAMESPACE_ZERO=3DREDUCED \
+	-DUA_ENABLE_ENCRYPTION=3DON \
+	-DUA_BUILD_EXAMPLES=3DOFF \
+"
+
+FILES_${PN}-dev +=3D "${libdir}/cmake/*"
+
+BBCLASSEXTEND =3D "native nativesdk"
+
--=20
2.20.1


