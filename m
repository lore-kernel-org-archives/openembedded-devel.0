Return-Path: <dan.callaghan@opengear.com>
X-Greylist: delayed 10804 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 31 Jan 2019 19:45:37 UTC
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
	(mail-eopbgr810088.outbound.protection.outlook.com [40.107.81.88])
	by mail.openembedded.org (Postfix) with ESMTP id 24FAD6B463
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Jan 2019 19:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=opengear.com;
	s=selector1;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=N6gAxP3BqXYpGUA0Fru5OU68KgWy/7ufQF6YeyhhaOA=;
	b=yOfVs9x43fVAk4Kq7llyQ2wLjF8IHSjvagJuY6JoW+qiIRJNEip7n5En5o3rjrxKkiQb6RKEQtlaWoTrdtOUdKmN1/bq6Q3077FwEiyTRPgJmW3LHD/H0KLn9W6n7x/pOUSPWKU/TYyyWP/h2cT9wLnNAiHBM28HrlgqcWV6l+E=
Received: from BYAPR15MB3192.namprd15.prod.outlook.com (20.179.56.94) by
	BYASPR01MB0029.namprd15.prod.outlook.com (20.177.126.202) with
	Microsoft SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1580.17; Wed, 30 Jan 2019 07:22:04 +0000
Received: from BYAPR15MB3192.namprd15.prod.outlook.com
	([fe80::99e0:6b82:2ac:514b]) by BYAPR15MB3192.namprd15.prod.outlook.com
	([fe80::99e0:6b82:2ac:514b%2]) with mapi id 15.20.1580.017;
	Wed, 30 Jan 2019 07:22:04 +0000
From: "Callaghan, Dan" <dan.callaghan@opengear.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-python][PATCH 1/2] python-slip-dbus: update to 0.6.5
Thread-Index: AQHUuGyADpSM2aR9skCJNSNxrBeJlA==
Date: Wed, 30 Jan 2019 07:22:04 +0000
Message-ID: <20190130072152.27331-1-dan.callaghan@opengear.com>
Accept-Language: en-AU, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: SYCPR01CA0021.ausprd01.prod.outlook.com
	(2603:10c6:10:31::33) To BYAPR15MB3192.namprd15.prod.outlook.com
	(2603:10b6:a03:103::30)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=dan.callaghan@opengear.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-originating-ip: [60.241.24.90]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; BYASPR01MB0029;
	6:Ppt5bLo+T9Nc9IZKfz7R5K+z+1VNlXxD5mVzac2zc6YWAdIlweDKO2h9jJu3B9pZ3wbso9PR73sJ8pUkTg/L/JasIEoP7K1RMWhCNYFGbkKXcww/1XTDMzrtzq5SdBNUCEWYYjH+IWajUp9U48elb9c0/VyGgGIFdaZE0nyEhhVF/wXpyNzxk6570UXgSMJaS/4A5uCwgSUIVTGsFxHAjy6foLsfx8iZgk6WwW+3qoSHIvT7tfhYPzq9GERSYpXLjJbkzk2OBBPODV6b+keUC/Bq8ox5T1JE2yik+Rb/pKzmIoS87CV0X5gthQm6uEiRLIYEtc343+UZ8vc8J8fv+OvFarDzvSN37HG/28qJp6q3QkLH05VIBCiOVZK4X+j0yfdJQ2/T7I4kxhmkZZS/QKtoib6pBCOU4+iNydYMiYSti+XTsqmUSPrvM4tRsl6d6CV2S44ImrUdnCh1POz01Q==;
	5:PUBO3tdrJLSR0eAdygRoMme8UWamWANtcQC3zSjDdcIYUL7VaPhGrsWPT6SYlTo03O8QoEIuNf58xGmUbOfUNt5q+HbmM/BuGgE6DCRzPM7bK4Ogss36bH/K6J2HBBr2i1oOHKhw1ePFaTKJnAEGX0zE8llw9UWUQYL7wr9sjQVgzhaojouD71kvcV4srvhtmgIVeC2tn91uwCmzbRKZRQ==;
	7:JEg79IEAZxs+Buw90YGbzLdcGjsO/WknQjJvNenvy+Rhx1gpbfO2QJ197wjVZh8zBz1w4ZUgaPYv7emc2Q2JpzKUTedvjYtH8Xm7DIeezX5mcsHPI9ZLHHi2NH9Z3dSwjtyJr0YB2PmsZM2R90/dXw==
x-ms-office365-filtering-correlation-id: 80a601c3-629a-4dae-f6d5-08d68683a272
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605077)(2017052603328)(7153060)(7193020);
	SRVR:BYASPR01MB0029; 
X-MS-TrafficTypeDiagnostic: BYASPR01MB0029:|BYASPR01MB0029:
x-microsoft-antispam-prvs: <BYASPR01MB00293D09DE4C98E9F0CC13F896900@BYASPR01MB0029.namprd15.prod.outlook.com>
x-forefront-prvs: 0933E9FD8D
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(376002)(366004)(39840400004)(136003)(346002)(396003)(199004)(189003)(2906002)(86362001)(107886003)(6512007)(6306002)(36756003)(8936002)(256004)(5640700003)(1076003)(26005)(25786009)(6116002)(6486002)(3846002)(71190400001)(71200400001)(53936002)(4326008)(102836004)(6436002)(99286004)(52116002)(186003)(68736007)(97736004)(305945005)(478600001)(2501003)(6916009)(14454004)(386003)(81166006)(6506007)(81156014)(106356001)(105586002)(476003)(7736002)(316002)(50226002)(2351001)(2616005)(486006)(8676002)(66066001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BYASPR01MB0029;
	H:BYAPR15MB3192.namprd15.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: opengear.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: nx6BSgS3zzZDSogvs5+/SFKzRnp/h+qZQrdyYK5TMi3wJaPOVEaJ+lrv+G6eaf4FdfjF7tVbq8QEIPO60e3pWYnoPWlD+AczU5d7uEDqlKeZt6OuMLVDC68GOncjujnwpeFaYyozc0uU8OshqSrfpW/ywp5DiqhCT5SPYVW3H4F+ua6F6oTFpWJNGD0/hzXgg6tYsfXN1PdmUbRPCAsq5+uYfVFNz3qO28q3j6yWnfIUMq750C2Vn095QOWLcQ4G17O1QxwaqjuipPof6QTzl8ncIxqKHzJUPDXEriXgOKhluyI/CTEJmRB8MJld9utv/h8rM1EQ2ayB9BMvUL69bqoc8rF10Swk6K3S7LCBfPhcmnCmwAQX2N1R9hVAq1iz/wv8mlJmd6T0Ymi41r6lCBnZCu5nFmBH5ui1hRlbXkA=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 80a601c3-629a-4dae-f6d5-08d68683a272
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jan 2019 07:22:04.2073 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-id: a6251c26-d21f-4164-a225-1f4eaebf5f9a
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYASPR01MB0029
X-Microsoft-Exchange-Diagnostics: 1; BYASPR01MB0029;
	23:fygBSdL0QZd4iDL1pWbdaLOIQSPjSJs+QHco8cTt7UlbblQaTU7CO2VFoOpW7EhlIZXo9qzXIz21aR1ncSmhAUyCjq1DMloNaTTyRZOlTKYsljYwKfABvdQdGO6QitQDc1cA/EN845Yi2Ll+ZJtnZg==
X-OriginatorOrg: opengear.com
Subject: [meta-python][PATCH 1/2] python-slip-dbus: update to 0.6.5
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
X-List-Received-Date: Thu, 31 Jan 2019 19:45:38 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Dan Callaghan <dan.callaghan@opengear.com>
---
 ...{python-slip-dbus_0.6.1.bb =3D> python-slip-dbus_0.6.5.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-slip-dbus_0.6.1.bb =3D>=
 python-slip-dbus_0.6.5.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python-slip-dbus_0.6.1.bb =
b/meta-python/recipes-devtools/python/python-slip-dbus_0.6.5.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python-slip-dbus_0.6.1.bb
rename to meta-python/recipes-devtools/python/python-slip-dbus_0.6.5.bb
index dc587e761..c2675cbdd 100644
--- a/meta-python/recipes-devtools/python/python-slip-dbus_0.6.1.bb
+++ b/meta-python/recipes-devtools/python/python-slip-dbus_0.6.5.bb
@@ -1,5 +1,5 @@
 SUMMARY =3D "Convenience functions for dbus services in Python 2.x"
-HOMEPAGE =3D "http://nphilipp.fedorapeople.org/python-slip/"
+HOMEPAGE =3D "https://github.com/nphilipp/python-slip"
 DESCRIPTION =3D "\
 The Simple Library for Python 2.x packages contain miscellaneous code for =
\
 convenience, extension and workaround purposes. \
@@ -19,8 +19,8 @@ S =3D "${WORKDIR}/${SRCNAME}-${PV}"
=20
 inherit setuptools
=20
-SRC_URI[md5sum] =3D "a6d8ee96245fc21785d4c1c062c85f2f"
-SRC_URI[sha256sum] =3D "bc897f1ab6f5b4989f85548799aaeb84fde67bbba18e40341b=
fe1d7885c2fd9a"
+SRC_URI[md5sum] =3D "28ae5f93853466c44ec96706ba2a1eb4"
+SRC_URI[sha256sum] =3D "c726c086f0dd93a0ac7a0176f383a12af91b6657b78a301e3f=
5b25d9f8d4d10b"
=20
 do_compile_prepend() {
     sed -e 's/@VERSION@/${PV}/g' setup.py.in > setup.py
--=20
2.20.1


