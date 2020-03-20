Return-Path: <Qi.Chen@windriver.com>
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
	(mail-mw2nam12on2073.outbound.protection.outlook.com [40.107.244.73])
	by mail.openembedded.org (Postfix) with ESMTP id 0AF596007B
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Mar 2020 06:42:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=Vgp3I+Q9pe9nGvS/kSv/bRyVwzzrG/LK2aHAG367j5HZyXePq/pDGjhGZNKZ1p5WcFWJR/k9/XWyM5rjgPHCYMNh0DfBbQRsaMIxZSvNwd9aC2S9h6HptcHO5RFggDC0JgpPT9lcUPdWsG4G9aWSZuULaFuVTZYEs5jC/RSqCLT/+hlXRR78QGUEZYRK+thPqjsuqhKEmTMa2zrahBBa7eSeRHa8NhJjsllMPkyH69+3bTvxurvcgU9pzYFODdavEHqsinKx2S9P752Jty+KfIX4BFJnXn8AXelkKxM8SID3YZzwEkRH9G3yH4Fkks3y7Ws7sADVWeSguvq8kRVC3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=S5qhCBr68vT2TG5Nd43owKZbkP8PTEtOcAUOvPxe4jc=;
	b=n/VGbEcznEyR7uIPzd2V1FdKVtf27O02kllobQQZzxugKuF8wA/y4wLpTsGxrTWv9hPITLi9DgGecR0rnOvtPZSLo1f2uqZyAxA3VNiQvcMjcvMrmjPz9BGqPfIiB+DgYVrstGs8BsDVYIda6vW7/KC5rl5U9l2BUsJPaLwETfI4LRmTkse+ml8ByutEYTLLFJK810zrjlwJ/j2ys+eI9SAAL9CZqywT+mNxDuIHRxd/h/wvjNwK3acQaRQjAYeYoHkqHnmv2QFp9jQcCHgxN+RVVVfX+0JgyMfntrgMQRgRcJvY2i6IJta8NCiEfBByJX0Cts4bssIEtC3sjl4oFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=windriver.com; dmarc=pass action=none
	header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=windriversystems.onmicrosoft.com;
	s=selector2-windriversystems-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=S5qhCBr68vT2TG5Nd43owKZbkP8PTEtOcAUOvPxe4jc=;
	b=oRRzAZBoXIKS65VEOAZb7TYDPVqxSQTj1t+tAUN90HYxwXjlJtRYQOE58s+QvImVITe+saIMTCjwXI+9F0w558+pvDJYfm2Y11Ir3UJIQbg2z3xP8h7X0BwQF2Z36OnD8A2+9XLkEAGsoaVnziBvR2eybWYVkOEh2aZEBoJl9po=
Received: from DM6PR11MB3498.namprd11.prod.outlook.com (2603:10b6:5:6c::22) by
	DM6PR11MB4009.namprd11.prod.outlook.com (2603:10b6:5:193::14) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2835.20; Fri, 20 Mar 2020 06:42:43 +0000
Received: from DM6PR11MB3498.namprd11.prod.outlook.com
	([fe80::59da:f995:a842:c07c]) by
	DM6PR11MB3498.namprd11.prod.outlook.com
	([fe80::59da:f995:a842:c07c%4]) with mapi id 15.20.2835.017;
	Fri, 20 Mar 2020 06:42:43 +0000
From: "Chen, Qi" <Qi.Chen@windriver.com>
To: =?iso-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@gmail.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [PATCH 1/5] libnma: initial add 1.8.28
Thread-Index: AQHV/WYcLGLkRsJFuU+/DATvaiYalKhQ2PH3gAAxjt4=
Date: Fri, 20 Mar 2020 06:42:43 +0000
Message-ID: <DM6PR11MB3498A7172CD23A5BCE165647EDF50@DM6PR11MB3498.namprd11.prod.outlook.com>
References: <20200318204411.12996-1-schnitzeltony@gmail.com>,
	<DM6PR11MB349890ADEBB154F7AB354EF4EDF50@DM6PR11MB3498.namprd11.prod.outlook.com>
In-Reply-To: <DM6PR11MB349890ADEBB154F7AB354EF4EDF50@DM6PR11MB3498.namprd11.prod.outlook.com>
Accept-Language: en-US, zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Qi.Chen@windriver.com; 
x-originating-ip: [192.103.52.1]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 902b6302-4b22-4549-9191-08d7cc99e4c4
x-ms-traffictypediagnostic: DM6PR11MB4009:
x-microsoft-antispam-prvs: <DM6PR11MB4009DAD8D632EF6CFB6F7DBEEDF50@DM6PR11MB4009.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 03484C0ABF
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(346002)(396003)(376002)(39850400004)(366004)(136003)(199004)(8676002)(81166006)(81156014)(86362001)(9686003)(66574012)(966005)(8936002)(19627405001)(478600001)(71200400001)(2940100002)(33656002)(110136005)(7696005)(316002)(2906002)(26005)(186003)(66476007)(66946007)(66556008)(64756008)(91956017)(66446008)(76116006)(52536014)(6506007)(55016002)(5660300002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR11MB4009;
	H:DM6PR11MB3498.namprd11.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; 
received-spf: None (protection.outlook.com: windriver.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: aBdtMUV3imk73c6CxOTfkflOmIQQP5RzBNia6DrJPe3NMz1hPG7H+hvpfqmyFCFZdA1/f9JJDSX/q4aAd8fCpfgdayViN+cxUgypoDui+JuUuLFBdsAhzE3BU35+ke3XO6tjQ7xEbd/Hac1R8mo0toL9fbLv+j2cTfU6F3+PrO0II30RhbGwqQUVyQbLIU24z0D2pYVzuRbaU8S0QVMEMgDqIcdFppme3tJcv6ae45mRVAnO86z+Ahu/KijVQhfB38QnKrivvra2a83zd1JxsVC0KOGDecoH6JLRwC80aKLjMxP7BE24cgJPgdNMievMYcI+iQkXiCxevG5Y6em+1gmCOMgs9WfgFWuWEgQrqMM8+OlVXXvf/zQefWB/9nH/EtS76USvkf+2swm3LvKCt941r1kAhTlE0XaKA3gvL+bEnC1V2jWim6YNyk4weQikRu1tJ9eIYX45n+a9zkUC5gCYGIUzTWXN9mSwGC//lCCV/NT+08Qxm6b75LGchJVgL1T968upud1FXQRXzVHs0Q==
x-ms-exchange-antispam-messagedata: wz1bFo0BL0OxipRQWSaorVU3ZKko2DrN07Y3lwQ5lOF4n0U/O+LcC6AjC+RxBHXvMoGVXIeT0x112A7NYo9KR43JGT56On9DkgBct1cpR5Azt5504d5bbx9K+bkIYoGiGThWii3e/KMCuwloI++X0A==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 902b6302-4b22-4549-9191-08d7cc99e4c4
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Mar 2020 06:42:43.5395 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: y3eUkx1QEGi8utY/EXc/GiPJZY1YJ7GxubsjkbU/wqCQKrOiu3nK0DuemDso4SF7RK27wqM+m0Z7gV3ho+juSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4009
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [PATCH 1/5] libnma: initial add 1.8.28
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
X-List-Received-Date: Fri, 20 Mar 2020 06:42:44 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Andreas,

There's also another problem. The PACKAGECONFIG item, 'gcr', cannot be disa=
bled, otherwise, we will have do_configure error.

Best Regards,
Chen Qi
________________________________
From: openembedded-devel-bounces@lists.openembedded.org <openembedded-devel=
-bounces@lists.openembedded.org> on behalf of Chen, Qi <Qi.Chen@windriver.c=
om>
Sent: Friday, March 20, 2020 11:45
To: Andreas M=FCller <schnitzeltony@gmail.com>; openembedded-devel@lists.op=
enembedded.org <openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [PATCH 1/5] libnma: initial add 1.8.28

Hi Andreas,

I got the following error.

gcr was skipped: missing required distro feature 'x11' (not in DISTRO_FEATU=
RES)
ERROR: Required build target 'meta-world-pkgdata' has no buildable provider=
s.
Missing or unbuildable dependency chain was: ['meta-world-pkgdata', 'libnma=
', 'gcr']

Could you please take a look at it if convenient?

Best Regards,
Chen Qi
________________________________
From: openembedded-devel-bounces@lists.openembedded.org <openembedded-devel=
-bounces@lists.openembedded.org> on behalf of Andreas M=FCller <schnitzelto=
ny@gmail.com>
Sent: Thursday, March 19, 2020 4:44
To: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.ope=
nembedded.org>
Subject: [oe] [PATCH 1/5] libnma: initial add 1.8.28

With upcoming network-manager-applet 1.16 this library gets mandatory: GNOM=
E
splitted out common code from network-manager-applet to libnma.

Signed-off-by: Andreas M=FCller <schnitzeltony@gmail.com>
---
 .../libnma/libnma_1.8.28.bb                    | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 meta-gnome/recipes-connectivity/libnma/libnma_1.8.28.bb

diff --git a/meta-gnome/recipes-connectivity/libnma/libnma_1.8.28.bb b/meta=
-gnome/recipes-connectivity/libnma/libnma_1.8.28.bb
new file mode 100644
index 000000000..de5ad0863
--- /dev/null
+++ b/meta-gnome/recipes-connectivity/libnma/libnma_1.8.28.bb
@@ -0,0 +1,18 @@
+SUMMARY =3D "NetworkManager GUI library"
+LICENSE =3D "GPLv2"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a426=
3"
+
+DEPENDS =3D "glib-2.0 networkmanager"
+
+GNOMEBASEBUILDCLASS =3D "meson"
+inherit gnomebase gobject-introspection gtk-doc gettext vala
+
+SRC_URI[archive.md5sum] =3D "094c45d7694b153612cbdc3c713edcb5"
+SRC_URI[archive.sha256sum] =3D "4af69552d131a3b2b8b6a2df584044258bf588448d=
cdb4bddfa12a07c134b726"
+
+PACKAGECONFIG ?=3D "gcr iso_codes mobile_broadband_provider_info"
+PACKAGECONFIG[gcr] =3D "-Dgcr=3Dtrue,-Dgcr=3Dfalse,gcr"
+PACKAGECONFIG[iso_codes] =3D "-Diso_codes=3Dtrue,-Diso_codes=3Dfalse,iso-c=
odes,iso-codes"
+PACKAGECONFIG[mobile_broadband_provider_info] =3D "-Dmobile_broadband_prov=
ider_info=3Dtrue,-Dmobile_broadband_provider_info=3Dfalse,mobile-broadband-=
provider-info,mobile-broadband-provider-info"
+
+GTKDOC_MESON_OPTION =3D "gtk_doc"
--
2.21.1

--
_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-devel
--
_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-devel

