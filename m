Return-Path: <urs.fassler@bbv.ch>
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
	(mail-eopbgr140044.outbound.protection.outlook.com [40.107.14.44])
	by mail.openembedded.org (Postfix) with ESMTP id 343947F4C7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Oct 2019 11:19:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=YTus1lu6TgWpdKCEV1x5BkG6cZa/dgH7kowrdsFNGIqq8AfkaaaH5gqRlEHWrNjoXuPB8qsQEqd5Qq9isTrfgVgUdLxzqD/m6bMZVlgzVMtLAy7A3izI1BqTp2qShgQ6sPobVfLp3uQTr68tBFNKFxi9ZLvmEtWDXkPESr5Q5YGdtEnwQz2f4xLyA2KlubNCSzkFiicHBtG1HW3zyoWvFwVLqgki8qosD8k7yOrHc1/KNvNdX7FaakWHpyUW6FCCoJ2XEzZvPUfM6uuNtKjvCr21mRnjvBwwFlejRm+20fI3qCnsxdNjs+AmSFsG3UvSIkwYvXKmglW0FgDy0AJsYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=BtefNFlFZEjBx3SHxjPUG2sBkWkXhoE0BTTFZU0+uKE=;
	b=gDUZmrQXQXz/iCvvNLnmOqkWqif6z5GUFbMyyYtN1c96bFgZctpf/WuFZitJOcAMJAOPMJARQEs4VEdh53mTO9SGzJfl/NJCHobMd763jB3UVRwjayDMLwupsjYqXkm8adftXh3YEOvrahIhm4G/M4mxL0qbI+J0N34Pxh/exy3fLpSbVYOgsQLNBRUnHSsdf/wq8vqoQJW9ogzTrxnxfPEVR3yimxUUVEDkXHuwhNlamn8WMguqP1WstKlwn8puaCFZNbF6LKBKrlrjHtZ+pyIn+GeNUQXJf6xS4xa+kyxS7Uhrdok+yE4Ipx7pRXMF2mxICxLg1fxc88ocsgRB5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=bbv.ch; dmarc=pass action=none header.from=bbv.ch;
	dkim=pass header.d=bbv.ch; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bbvSoftwareServices.onmicrosoft.com;
	s=selector2-bbvSoftwareServices-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=BtefNFlFZEjBx3SHxjPUG2sBkWkXhoE0BTTFZU0+uKE=;
	b=s8qXe/xk7xPINwMcQwOM0XxEzi4NV6CqXD2srs1m2QjAwqo29prU554DRJ+lMa/izY5htXVskWbNGQWb3LCbP7LC78QncMuT4gktCzrwS4ZLdhAMfqiPutv1Ur5OFB0s9Qe2QkyIsCU+e+ZbN/lgimW8YZ4+xm9krHr3VVP4co8=
Received: from VI1P194MB0253.EURP194.PROD.OUTLOOK.COM (10.175.183.139) by
	VI1P194MB0160.EURP194.PROD.OUTLOOK.COM (10.175.184.21) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2347.21; Thu, 17 Oct 2019 11:19:53 +0000
Received: from VI1P194MB0253.EURP194.PROD.OUTLOOK.COM
	([fe80::1471:2eb9:7551:471a]) by VI1P194MB0253.EURP194.PROD.OUTLOOK.COM
	([fe80::1471:2eb9:7551:471a%5]) with mapi id 15.20.2347.024;
	Thu, 17 Oct 2019 11:19:52 +0000
From: =?iso-8859-1?Q?Urs_F=E4ssler?= <urs.fassler@bbv.ch>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-networking][PATCH v2] open62541: add new recipe
Thread-Index: AQHVhNzLrHroNIWGqUadDzXkXAK2dA==
Date: Thu, 17 Oct 2019 11:19:52 +0000
Message-ID: <20191017111939.1469-1-urs.fassler@bbv.ch>
Accept-Language: de-CH, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.20.1
x-clientproxiedby: PR0P264CA0044.FRAP264.PROD.OUTLOOK.COM
	(2603:10a6:100:1::32) To VI1P194MB0253.EURP194.PROD.OUTLOOK.COM
	(2603:10a6:800:c9::11)
x-originating-ip: [81.6.59.197]
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=urs.fassler@bbv.ch; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dc8daaaa-19eb-469a-735c-08d752f3ee54
x-ms-traffictypediagnostic: VI1P194MB0160:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1P194MB0160DCB9D88B73536E7F7F858F6D0@VI1P194MB0160.EURP194.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:568;
x-forefront-prvs: 01930B2BA8
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(346002)(396003)(136003)(39840400004)(366004)(376002)(189003)(199004)(5640700003)(6512007)(81156014)(2351001)(8676002)(305945005)(1076003)(256004)(66066001)(81166006)(86362001)(8936002)(508600001)(99286004)(6436002)(4326008)(3846002)(25786009)(6306002)(6116002)(6486002)(486006)(2906002)(476003)(5660300002)(2616005)(66556008)(54906003)(316002)(50226002)(66446008)(64756008)(2501003)(71190400001)(6916009)(66946007)(45776006)(66476007)(36756003)(186003)(71200400001)(26005)(7736002)(14454004)(386003)(52116002)(6506007)(102836004);
	DIR:OUT; SFP:1101; SCL:1; SRVR:VI1P194MB0160;
	H:VI1P194MB0253.EURP194.PROD.OUTLOOK.COM; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: bbv.ch does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RBY2HVlFwufBC0nY5cknT7sLgg6W0monPjNEw3AHMaX29x60EwkXoSwf208/nWi0lkd4oBMNZfJlJddXRiBIcCmBGzodEFV/h8Ll835vz++SOJwLGcHjjR78E82FCB9tIoGrQV8aFq+mDe4t/0TYpYA2wCKtPqjPBB66a8Rdr3bsEisdA5JhHNs6rchP5ZW3OaHi7EvQHRMOJc0qlG6bGgvjHQ8m+DRdunAoYXm98mwIQcxK5h/VqViql3H+avS9I32ljzPqyQZIyrBEV10gLoCiWMPPd67DQ52tgsHADPDMuW7+kq+9Cgw7PIfmbvduLnlBXQbuMKfx1m1FreSnlubtGo7Z0hCgT8L9dHAsEST8Bcrnv6YfRILS+bHNexwpaHp263PSvUcgxll8ka3+0ny3wZrkDCLQWCC7Jp6KfQrbEA7OjGPLSrdVLCPc1H/Cxg/VzGQyessPTI8HtwVJew==
MIME-Version: 1.0
X-OriginatorOrg: bbv.ch
X-MS-Exchange-CrossTenant-Network-Message-Id: dc8daaaa-19eb-469a-735c-08d752f3ee54
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Oct 2019 11:19:52.7046 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 279985bd-2077-4d9d-9797-42238cfc06e2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KcsJGYhNQf0aGV+7jt+UAk74xWFXsZOG7Wl9CYqn4zemfXlLgwVaPPIz3J0iIuRJvIWvc34UtfFmEegzErla+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1P194MB0160
Subject: [meta-networking][PATCH v2] open62541: add new recipe
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
X-List-Received-Date: Thu, 17 Oct 2019 11:19:53 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

It provides a open source implementation for OPC UA.
---
 .../files/0001-fix_ignored_return_value.patch | 17 ++++++++++
 .../open62541/open62541_1.0.bb                | 31 +++++++++++++++++++
 2 files changed, 48 insertions(+)
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
index 000000000..b7a4f14b9
--- /dev/null
+++ b/meta-networking/recipes-connectivity/open62541/open62541_1.0.bb
@@ -0,0 +1,31 @@
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
+"
+
+PACKAGECONFIG[sharedlibs] =3D "-DBUILD_SHARED_LIBS=3DON,-DBUILD_SHARED_LIB=
S=3DOFF,,"
+PACKAGECONFIG[encryption] =3D "-DUA_ENABLE_ENCRYPTION=3DON,-DUA_ENABLE_ENC=
RYPTION=3DOFF,mbedtls,"
+PACKAGECONFIG[fullnszero] =3D "-DUA_NAMESPACE_ZERO=3DFULL,-DUA_NAMESPACE_Z=
ERO=3DREDUCED,,"
+
+EXTRA_OECMAKE =3D " \
+	-DCMAKE_BUILD_TYPE=3DRelWithDebInfo \
+"
+
+FILES_${PN}-dev +=3D "${libdir}/cmake/*"
+
+BBCLASSEXTEND =3D "native nativesdk"
+
--=20
2.20.1


