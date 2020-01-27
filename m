Return-Path: <laurent.bonnans@here.com>
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
	(mail-eopbgr20095.outbound.protection.outlook.com [40.107.2.95])
	by mail.openembedded.org (Postfix) with ESMTP id 50F4C7FD51
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Jan 2020 11:50:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=hWRR09IDhNmeXBasE3EO8IhGFU7Pjo5bOu6yDOLGhynHDlvB6oQoQup0OQQnjQrzLhJy9+siSUyVLBQJSvc0zJk4L1/SfBQeBT5iBB0LWSBbI39s0DtR3qF3ghnY6YVXgQPpH93z6E+xeza8HibUZKRhH3F79VJa/GuBIvKPsiXyy1xlJQQ8E7Oe7iiCzsxt29w0/j5026w0BCAQvA0kC3nDGpOOgPc6NXnw3CZ8kqX513yUHMeheG4/MZqP49jOL+LtWeIYTZZz5OGMch/OHRtMIryKtXz0eRXmjaVTQznrUHSjxravlH01giVjRirdn04BjP0vg7qND15FFSW1cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=9DBmwFfMmwqIUi/hzgaOg6taHI9lTibyTMyhkspOaGM=;
	b=Cv6Qa2xEh2AJGaH7Up22tC95Kt0s2kIR6Y1JsM/j9zz2YyD+3Njxc5i8bKRdktTkqFuFamVjO+LfjleB3hFV8S18Lb65yhbEiQzYPZOx4sXSLXyG7VXfz8hzkm3lz6t0nCJz01GRIRZ/0aXvGoeoHVkISPWfjuruO4wbgy8O8iLZMN14vHjO+1slgghlayE4BcW8P+dfZJC+YfHCTcjkgq7f/v/cKIq82M6VEo76HurcK2XVLwSEvyWQG0K2HuGXMjS7kkZjW+0/zEqsy8lEQjd4flDzJux222hqrrIf9PPV9L841mVKYRKr42Md9f53YbzMbkpbO6yyklih62vIPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=here.com; dmarc=pass action=none header.from=here.com;
	dkim=pass header.d=here.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=here.com; s=selector2; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=9DBmwFfMmwqIUi/hzgaOg6taHI9lTibyTMyhkspOaGM=;
	b=jXqzJ7Gb4K6Gq5DY1SA5tofhRQAstfG+R02lQK+o+3/l+rNyXnc/ka68NR03S7SMviBBq3Ep7+m432FzYZvT0unKmxzjfl3rhXZz61jjCRUBUPX/BXbeDbRZV3eAVNQBB9twD0rvpXHrkUsnboKHAikUOWMSUuOx7e3L5YBqfMw=
Received: from AM0PR04MB5137.eurprd04.prod.outlook.com (20.177.41.216) by
	AM0PR04MB4883.eurprd04.prod.outlook.com (20.176.215.204) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2665.22; Mon, 27 Jan 2020 11:50:34 +0000
Received: from AM0PR04MB5137.eurprd04.prod.outlook.com
	([fe80::644c:63c5:4705:b6bf]) by
	AM0PR04MB5137.eurprd04.prod.outlook.com
	([fe80::644c:63c5:4705:b6bf%6]) with mapi id 15.20.2665.017;
	Mon, 27 Jan 2020 11:50:33 +0000
From: "Bonnans, Laurent" <laurent.bonnans@here.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-oe][PATCH] pcsc-lite: use python3
Thread-Index: AQHV1Qf7IvC2JUO1qUuyuG9DAKayFQ==
Date: Mon, 27 Jan 2020 11:50:33 +0000
Message-ID: <20200127114920.68921-1-laurent.bonnans@here.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=laurent.bonnans@here.com; 
x-originating-ip: [131.228.216.131]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: e57207a9-20cc-450f-9734-08d7a31f1e11
x-ms-traffictypediagnostic: AM0PR04MB4883:|AM0PR04MB4883:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR04MB488311C5FD6556923811C2BF850B0@AM0PR04MB4883.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:296;
x-forefront-prvs: 02951C14DC
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(366004)(396003)(346002)(376002)(39860400002)(136003)(189003)(199004)(107886003)(5660300002)(2906002)(4326008)(6486002)(478600001)(86362001)(6512007)(71200400001)(6506007)(8676002)(81166006)(1076003)(8936002)(81156014)(2616005)(316002)(66446008)(66946007)(186003)(26005)(36756003)(76116006)(66556008)(66476007)(6916009)(64756008);
	DIR:OUT; SFP:1102; SCL:1; SRVR:AM0PR04MB4883;
	H:AM0PR04MB5137.eurprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: here.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mYIcHlrOtzjraq5W7ykeUQ55IQQ3VPJYQHeHf3VwXrV/1P1U25P2wywKM+MmdUmrLr13otU9rmGzh6PQktYaLEA9WITktPqKyacn016bOkbXGjHrq9Kks23FdxW1fj6K+FN4nYynNSNLwEzLp1oyK9x42UWy5u4Mb11FLmwmw5rOhkbryz4h2VkcKLrpULJpy5qAB/snxNwts/qh1cR2cs0O8kM6CpeC1UqI91xg3gPqgjm3fqHNCEBw96rwD3eKqm4dAg5m6P2HqPd7RdL3729kO2pzoflqMVdTz2mawWfev6Vj0N9lTKfbRSRz6XbmEkD428O+GGiQB72ikdIywF7Dd+xbA2U52/s8zl7LzkRujdpMQ879iqQETIUL5pcTnSXd/q+TW5X8pPSoangQtM0m0vh58P+3lZL5CBiV6OLC1wnzef9czFoH/SJDoXnvhj3vBIuKkikwQ3mu1PhOdH/9fsI/1mAkennu8GrjPY4=
x-ms-exchange-antispam-messagedata: Q5DSmPXMyVGGQzNyMwUJb7noLzc/MIbQ3q4cdbNXTU6yrIJiCoSX7h9eXDDKbVQN7v1h8zUYOD9crfaSJcxHgSVm2zT9c7Lt1t91Vpw8kuINi8zw6BpX2mmSCGaSk/N6oQXFl/M/vWrHNNObCHJHwQ==
MIME-Version: 1.0
X-OriginatorOrg: here.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e57207a9-20cc-450f-9734-08d7a31f1e11
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jan 2020 11:50:33.8608 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 6d4034cd-7225-4f72-b853-91feaea64919
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YGQBWiEO5fOxnFq8z8fNWeTZdUqFLWWB90mcA1E5WW48kjJtLPLGRPPUETrSFWuGd7MWqcPVYkfhM74N8gcVTCxDe7Jjpr/ruMuc/a77Z8k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4883
Subject: [meta-oe][PATCH] pcsc-lite: use python3
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
X-List-Received-Date: Mon, 27 Jan 2020 11:50:34 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Laurent Bonnans <laurent.bonnans@here.com>
---
 .../0001-Run-pcsc-spy-with-python3.patch      | 25 +++++++++++++++++++
 .../pcsc-lite/pcsc-lite_1.8.26.bb             |  5 +++-
 2 files changed, 29 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/pcsc-lite/files/0001-Run-pcsc-s=
py-with-python3.patch

diff --git a/meta-oe/recipes-support/pcsc-lite/files/0001-Run-pcsc-spy-with=
-python3.patch b/meta-oe/recipes-support/pcsc-lite/files/0001-Run-pcsc-spy-=
with-python3.patch
new file mode 100644
index 000000000..1aad88200
--- /dev/null
+++ b/meta-oe/recipes-support/pcsc-lite/files/0001-Run-pcsc-spy-with-python=
3.patch
@@ -0,0 +1,25 @@
+From ec4c2d9c8fe85551d773f50bfa8c899cb5983c03 Mon Sep 17 00:00:00 2001
+From: Laurent Bonnans <laurent.bonnans@here.com>
+Date: Mon, 27 Jan 2020 12:38:20 +0100
+Subject: [PATCH] Run pcsc-spy with python3
+
+Upstream-status: Pending
+
+Signed-off-by: Laurent Bonnans <laurent.bonnans@here.com>
+---
+ src/spy/pcsc-spy | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/spy/pcsc-spy b/src/spy/pcsc-spy
+index 85222c6..bcb52f7 100755
+--- a/src/spy/pcsc-spy
++++ b/src/spy/pcsc-spy
+@@ -1,4 +1,4 @@
+-#! /usr/bin/python
++#!/usr/bin/env python3
+=20
+ """
+ #    Display PC/SC functions arguments
+--=20
+2.24.1
+
diff --git a/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.26.bb b/meta-o=
e/recipes-support/pcsc-lite/pcsc-lite_1.8.26.bb
index 5e6084656..2dd5135e9 100644
--- a/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.26.bb
+++ b/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.26.bb
@@ -13,6 +13,9 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D628c01ba985ecf=
a21677f5ee2d5202f6"
 SRC_URI =3D "https://pcsclite.apdu.fr/files/${BP}.tar.bz2"
 SRC_URI[md5sum] =3D "9d36882998449daceec267c68a21ff0d"
 SRC_URI[sha256sum] =3D "3eb7be7d6ef618c0a444316cf5c1f2f9d7227aedba7a192f38=
9fe3e7c0dfbbd9"
+SRC_URI +=3D " \
+    file://0001-Run-pcsc-spy-with-python3.patch \
+"
=20
 inherit autotools systemd pkgconfig
=20
@@ -50,6 +53,6 @@ RPROVIDES_${PN} +=3D "${PN}-systemd"
 RREPLACES_${PN} +=3D "${PN}-systemd"
 RCONFLICTS_${PN} +=3D "${PN}-systemd"
 SYSTEMD_SERVICE_${PN} =3D "pcscd.socket"
-RDEPENDS_${PN}-spy +=3D"python"
+RDEPENDS_${PN}-spy +=3D"python3"
=20
 BBCLASSEXTEND =3D "native"
--=20
2.24.1

