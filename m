Return-Path: <dan.callaghan@opengear.com>
X-Greylist: delayed 3577 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 31 Jan 2019 15:42:50 UTC
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
	(mail-eopbgr800053.outbound.protection.outlook.com [40.107.80.53])
	by mail.openembedded.org (Postfix) with ESMTP id 97ABD79CBF
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Jan 2019 15:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=opengear.com;
	s=selector1;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=EP0Q0QY6iCqKbwzTykwlAmI+QVLK+hG9gHlIT1HKA4I=;
	b=G41wIU4sL0aeOzieQgrC22aaJycXc1vrMgpfqfFOQQOLcuYH8v7B/bRoDYSdRdJzxv2tnc/YMCKRv/IihMQckcFd2qUkvpnXC1d3bhPxrLsNp0YOSAYTJzRHbmUi8PBRcnbndM8Lxwio0Uf8wB7aka2Q0XUIXR4L1VVCrB+nvcI=
Received: from BYAPR15MB3192.namprd15.prod.outlook.com (20.179.56.94) by
	BYASPR01MB0029.namprd15.prod.outlook.com (20.177.126.202) with
	Microsoft SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1580.17; Wed, 30 Jan 2019 07:22:08 +0000
Received: from BYAPR15MB3192.namprd15.prod.outlook.com
	([fe80::99e0:6b82:2ac:514b]) by BYAPR15MB3192.namprd15.prod.outlook.com
	([fe80::99e0:6b82:2ac:514b%2]) with mapi id 15.20.1580.017;
	Wed, 30 Jan 2019 07:22:08 +0000
From: "Callaghan, Dan" <dan.callaghan@opengear.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-python][PATCH 2/2] python-slip-dbus: add a python3 version
	of the recipe
Thread-Index: AQHUuGyC9s1xmak6AkyT0pQFSeyRKg==
Date: Wed, 30 Jan 2019 07:22:08 +0000
Message-ID: <20190130072152.27331-2-dan.callaghan@opengear.com>
References: <20190130072152.27331-1-dan.callaghan@opengear.com>
In-Reply-To: <20190130072152.27331-1-dan.callaghan@opengear.com>
Accept-Language: en-AU, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: SYBPR01CA0097.ausprd01.prod.outlook.com
	(2603:10c6:10:1::13) To BYAPR15MB3192.namprd15.prod.outlook.com
	(2603:10b6:a03:103::30)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=dan.callaghan@opengear.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-originating-ip: [60.241.24.90]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; BYASPR01MB0029;
	6:exHmpgm4QVoqXBcM/BdblVGerWNMijcZqLvirK5TJuIcefGCLWRoU3XlqiIY5LgUIN1HyftGchG/vcD4E3VwlByk0Wz9c4Jj9NJiOFOq9oFqRHWbuKsKEm0RsOHQlXFI3apBf9xQeaFY+8aAWqBvRGLh6T6ct9+SwXdegy7rvHZ0uIjrO/y8nSH5CtkeewI5jtByTCuSjk6lVHeKiTYkUWk/qN5RGAmdsmrggejApKERD5Nx69XpGGQcGKEzrvwPOQ4vUOhYRSds6oxy3inC2KZs9EjnP0VHrzFBZ1iviW87ydvEFERs/ewamgzCdFCYGH3qPL6F+U2GxLUAqmMf4WH1W1Gu8GdQshI9yYmgNmGoDQR+HAlBWTgsHoRGiRUNpnDN7jyBqg3zlVlQ+oadYKmivdFb/wYgrUimKSLqJOGOuwAI90FcuYs6KKJam+3s0obL8LeCEpDpCzSN4wk3RQ==;
	5:pf74cy6CtSDJ/xhnqRR3EZdj61Az1qoCiuSSTA3b/3+iePpZLjahCvZXo0HgC/nQ5TGS60tYTFW78lYHeBBwesoAKpVap3o3yeTd2X6kRjd20gYfgmo0uQnob497sVGbdlJsXy0ByOFhTF3rewNuzEzVksVLyvzc15jkzriQPTEUC9am+kw2Dk7DiaU+B1l7ObumeSt1cbZuZEDKsfQReQ==;
	7:/uiZbMZ9rBXPPYJBD4KEayJFS/prnCwLWax19kBezURZzu8BkFnsJFODx7PEXB9hQMM+Hn1wS1xlpEHBmFk1haJRwqw0Hv7U7X0+WNOwSsNZUW1JkEt3aLO4wG99E4RLlHjtmFbBVcO+SKUJGRZjmQ==
x-ms-office365-filtering-correlation-id: db5152d6-6c7c-4cf6-8dbb-08d68683a4c7
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605077)(2017052603328)(7153060)(7193020);
	SRVR:BYASPR01MB0029; 
X-MS-TrafficTypeDiagnostic: BYASPR01MB0029:|BYASPR01MB0029:
x-microsoft-antispam-prvs: <BYASPR01MB0029E281FBE75C620EA3CD9296900@BYASPR01MB0029.namprd15.prod.outlook.com>
x-forefront-prvs: 0933E9FD8D
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(376002)(366004)(39840400004)(136003)(346002)(396003)(199004)(189003)(2906002)(86362001)(107886003)(6512007)(6306002)(36756003)(8936002)(256004)(5640700003)(1076003)(26005)(25786009)(6116002)(6486002)(3846002)(71190400001)(71200400001)(53936002)(4326008)(102836004)(6436002)(99286004)(52116002)(186003)(68736007)(97736004)(305945005)(478600001)(76176011)(2501003)(6916009)(14454004)(386003)(81166006)(6506007)(81156014)(106356001)(105586002)(476003)(7736002)(316002)(50226002)(966005)(2351001)(2616005)(11346002)(446003)(486006)(8676002)(66066001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BYASPR01MB0029;
	H:BYAPR15MB3192.namprd15.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: opengear.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: HTqahd42XgtiUPOkm4I78IZnoDc1u/LShDcJRL0Cs0/xJNc1Xg49T4zBg7w/lYKBZR922OOYlojNHM6HBz73JyQJ06PBm6FW4h9de/bgDk4IyPELWvSAMoZxDydbgwwFsf6A9sY56xPVvw9a4OrUFRYn/hk+qW8Fd1ZqK7kNd9qs86t8drCEGJHIW0Pmt2zFhpKvEc9//Z5iGpW1rp0pc4mJlcB2w5sBiUNnhGAiUbSkgNPGfz/OmXObeW7yfS8IqtLw3SWEjU6tLaJ0GOPuCyPHFKuUDBitpZN+bX6dgfcb23YHSm6WqzfE8TOP/V4x2pdazY239LjSnz3a4ibl4LaMpCMKljLsrr+eAtJeGCuA2iQP99vXEUJEH0hLk1oRnQwqfC++MYas3x47uGUQnTEXH3jW/XQWcL24vVfkdIQ=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: db5152d6-6c7c-4cf6-8dbb-08d68683a4c7
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jan 2019 07:22:08.1181 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-id: a6251c26-d21f-4164-a225-1f4eaebf5f9a
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYASPR01MB0029
X-Microsoft-Exchange-Diagnostics: 1; BYASPR01MB0029;
	23:PerKcqNieO2Emb5W9bKXQvu2DXRbq29faYsbYZ+BO3CnTn72sOWc2/xuBt9pIkjSienQ8BL3eFzyi/v/WHt52ngwM55xdt/Z0e3jy0juE3pruoe1w/3OYgYmrJ8EZSSmPQqTNtHpKQ+BXADiE+7oiQ==
X-OriginatorOrg: opengear.com
Subject: [meta-python][PATCH 2/2] python-slip-dbus: add a python3 version of the recipe
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
X-List-Received-Date: Thu, 31 Jan 2019 15:42:50 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Dan Callaghan <dan.callaghan@opengear.com>
---
 .../python/python-slip-dbus.inc               | 29 +++++++++++++++++
 .../python/python-slip-dbus_0.6.5.bb          | 31 +------------------
 .../python/python3-slip-dbus_0.6.5.bb         |  2 ++
 3 files changed, 32 insertions(+), 30 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python-slip-dbus.in=
c
 create mode 100644 meta-python/recipes-devtools/python/python3-slip-dbus_0=
.6.5.bb

diff --git a/meta-python/recipes-devtools/python/python-slip-dbus.inc b/met=
a-python/recipes-devtools/python/python-slip-dbus.inc
new file mode 100644
index 000000000..0933b4559
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-slip-dbus.inc
@@ -0,0 +1,29 @@
+SUMMARY =3D "Convenience functions for dbus services in Python 2.x"
+HOMEPAGE =3D "https://github.com/nphilipp/python-slip"
+DESCRIPTION =3D "\
+The Simple Library for Python 2.x packages contain miscellaneous code for =
\
+convenience, extension and workaround purposes. \
+\
+This package provides slip.dbus.service.Object, which is a dbus.service.Ob=
ject \
+derivative that ends itself after a certain time without being used and/or=
 if \
+there are no clients anymore on the message bus, as well as convenience \
+functions and decorators for integrating a dbus service with PolicyKit."
+
+SECTION =3D "devel/python"
+LICENSE =3D "GPLv2+"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D5574c6965ae5f583e55880e397fbb01=
8"
+SRCNAME =3D "python-slip"
+
+SRC_URI =3D "https://github.com/nphilipp/${SRCNAME}/releases/download/${SR=
CNAME}-${PV}/${SRCNAME}-${PV}.tar.bz2"
+S =3D "${WORKDIR}/${SRCNAME}-${PV}"
+
+SRC_URI[md5sum] =3D "28ae5f93853466c44ec96706ba2a1eb4"
+SRC_URI[sha256sum] =3D "c726c086f0dd93a0ac7a0176f383a12af91b6657b78a301e3f=
5b25d9f8d4d10b"
+
+do_compile_prepend() {
+    sed -e 's/@VERSION@/${PV}/g' setup.py.in > setup.py
+}
+
+# http://errors.yoctoproject.org/Errors/Details/184713/
+# python-native/python: can't open file 'setup.py': [Errno 2] No such file=
 or directory
+CLEANBROKEN =3D "1"
diff --git a/meta-python/recipes-devtools/python/python-slip-dbus_0.6.5.bb =
b/meta-python/recipes-devtools/python/python-slip-dbus_0.6.5.bb
index c2675cbdd..330fa1ba4 100644
--- a/meta-python/recipes-devtools/python/python-slip-dbus_0.6.5.bb
+++ b/meta-python/recipes-devtools/python/python-slip-dbus_0.6.5.bb
@@ -1,31 +1,2 @@
-SUMMARY =3D "Convenience functions for dbus services in Python 2.x"
-HOMEPAGE =3D "https://github.com/nphilipp/python-slip"
-DESCRIPTION =3D "\
-The Simple Library for Python 2.x packages contain miscellaneous code for =
\
-convenience, extension and workaround purposes. \
-\
-This package provides slip.dbus.service.Object, which is a dbus.service.Ob=
ject \
-derivative that ends itself after a certain time without being used and/or=
 if \
-there are no clients anymore on the message bus, as well as convenience \
-functions and decorators for integrating a dbus service with PolicyKit."
-
-SECTION =3D "devel/python"
-LICENSE =3D "GPLv2+"
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D5574c6965ae5f583e55880e397fbb01=
8"
-SRCNAME =3D "python-slip"
-
-SRC_URI =3D "https://github.com/nphilipp/${SRCNAME}/releases/download/${SR=
CNAME}-${PV}/${SRCNAME}-${PV}.tar.bz2"
-S =3D "${WORKDIR}/${SRCNAME}-${PV}"
-
 inherit setuptools
-
-SRC_URI[md5sum] =3D "28ae5f93853466c44ec96706ba2a1eb4"
-SRC_URI[sha256sum] =3D "c726c086f0dd93a0ac7a0176f383a12af91b6657b78a301e3f=
5b25d9f8d4d10b"
-
-do_compile_prepend() {
-    sed -e 's/@VERSION@/${PV}/g' setup.py.in > setup.py
-}
-
-# http://errors.yoctoproject.org/Errors/Details/184713/
-# python-native/python: can't open file 'setup.py': [Errno 2] No such file=
 or directory
-CLEANBROKEN =3D "1"
+require python-slip-dbus.inc
diff --git a/meta-python/recipes-devtools/python/python3-slip-dbus_0.6.5.bb=
 b/meta-python/recipes-devtools/python/python3-slip-dbus_0.6.5.bb
new file mode 100644
index 000000000..2402a7a74
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-slip-dbus_0.6.5.bb
@@ -0,0 +1,2 @@
+inherit setuptools3
+require python-slip-dbus.inc
--=20
2.20.1


