Return-Path: <Qi.Chen@windriver.com>
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
	(mail-co1nam11on2056.outbound.protection.outlook.com [40.107.220.56])
	by mail.openembedded.org (Postfix) with ESMTP id 1EF43605A0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Mar 2020 03:45:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=eaVIwYHgbAGVsnJ+mATPFnCSJUsze/xFOvccL/ICZLV+WKZHRYZl1ObCHPotqu3VbiiHRn36aVMnSXH2c3w00FqBXGHZpZw1q9Q2Myi5B7qoSStZFuj3yixDRAqAnAUbaME/HkWduzezXnHsH/AVbcyPEgrG39c5KmgYvpLupGoLqGUeKMbXKKKGvv0hUiRTFi1VS/+zfJQz/BXUD1SaJiwokO7do4jtTxW8GWSLAxtnXn78L8qQa446gJBiFAzYJX8WZUH0gxbIs0vm+AiZfp1eJYKGt/cZj4lQJGRCLpYGWFhC70IGmvbwCAImybaIpLFOAs2vQq3nCoQ3XCJymw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=/XHMVPSMbWrVCUvjOKp4gyOoj4O3A5lNMyEnG85abD8=;
	b=dPXB50/rwjVGlaS1sUOVnB06FXET+n1X0V1KE+2DcEUkIGe1E2UV1UTstUrfnekway84+Kmiin/N6c2wsJv+e9uKojut/bFY79AQSfllZIJifLAtpMby2JGIb11RIfGtnP5e/aVNEF82dQoG6FZfdenzeWTZA9pOpwSxY0mFuEyuHHlJcQ7ZBcx5KCRclhYZDztie6lPRaGeejeFEiWH/PwwKUEj/mM/yluWqmDscXbYHQcVfdEdqKaPjqKCbCUmwdcmnMTJbZiNiDWD2d6iLWz5mKQUoX5MvA5HRe27GfA58n4OUSnAkBq7EgoqX5rqiqaN8fvIHCZlBlB2zasyZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=windriver.com; dmarc=pass action=none
	header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=windriversystems.onmicrosoft.com;
	s=selector2-windriversystems-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=/XHMVPSMbWrVCUvjOKp4gyOoj4O3A5lNMyEnG85abD8=;
	b=mG+Vwfr5o65yCttgPS1z7rfiRk7GZ2o1kUTZyitL1NkN1gU5jn4L+X/zs1/FUX5M7M3L6V33L8lRnHs98NYOB5KaSnkbju0WoXv5Rvyf9IBy24489WmsvSmKQJJZ2kp844QK+AFyoTXVbV6CVNGgIpwWqjuhBQU29XTN9lUq9tk=
Received: from DM6PR11MB3498.namprd11.prod.outlook.com (2603:10b6:5:6c::22) by
	DM6PR11MB3785.namprd11.prod.outlook.com (2603:10b6:5:13f::30) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2814.21; Fri, 20 Mar 2020 03:45:47 +0000
Received: from DM6PR11MB3498.namprd11.prod.outlook.com
	([fe80::59da:f995:a842:c07c]) by
	DM6PR11MB3498.namprd11.prod.outlook.com
	([fe80::59da:f995:a842:c07c%4]) with mapi id 15.20.2835.017;
	Fri, 20 Mar 2020 03:45:47 +0000
From: "Chen, Qi" <Qi.Chen@windriver.com>
To: =?iso-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@gmail.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [PATCH 1/5] libnma: initial add 1.8.28
Thread-Index: AQHV/WYcLGLkRsJFuU+/DATvaiYalKhQ2PH3
Date: Fri, 20 Mar 2020 03:45:47 +0000
Message-ID: <DM6PR11MB349890ADEBB154F7AB354EF4EDF50@DM6PR11MB3498.namprd11.prod.outlook.com>
References: <20200318204411.12996-1-schnitzeltony@gmail.com>
In-Reply-To: <20200318204411.12996-1-schnitzeltony@gmail.com>
Accept-Language: en-US, zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Qi.Chen@windriver.com; 
x-originating-ip: [192.103.52.1]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 25805dd9-44b3-4f4a-16dc-08d7cc812d3e
x-ms-traffictypediagnostic: DM6PR11MB3785:
x-microsoft-antispam-prvs: <DM6PR11MB378586B2E3C71F0B43F2955DEDF50@DM6PR11MB3785.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 03484C0ABF
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(346002)(376002)(396003)(39850400004)(136003)(366004)(199004)(66446008)(55016002)(71200400001)(81156014)(8676002)(19627405001)(33656002)(81166006)(9686003)(110136005)(64756008)(316002)(7696005)(2906002)(66946007)(6506007)(76116006)(66556008)(91956017)(478600001)(5660300002)(186003)(52536014)(86362001)(8936002)(66476007)(26005)(966005);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR11MB3785;
	H:DM6PR11MB3498.namprd11.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; 
received-spf: None (protection.outlook.com: windriver.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: eTZ/RRhLmzMbiv/GQRf0ALaF4abqAKCBqQVLfLUIyR0lWayj+u/ZFw4XuUXGDfdsBJcL+QrGZJ2aCgAJUhGdSLHimnQzsA6HFvLSij2O5UmElCHSsNO7900z9lpbHj+52xev7mq2GEAZSEr3yG1RbSBrCfP4Z9FpHma7UR94huyauvzqKb2fLFZ/U6soMAPkWEeJ5b+7DDQY1x4W9ltllSMabhTzl3hKeddghWYi/MhxTkiV4Yyny/Hy7df3PGrPl1thp/io/ARPUZxY4kAeaPkV+LN6y+5eTed84EW9e2jqAYfJ1bCRMTrFG+lr/yVSft0zQclaIQvS5bKXvezwAGOddbql6Sa7ikc5499aLq9eZqTCcU5ccPgElmcsG4NSqOSAWv3GDZIc6msZ9HIgdDWVimUetXq5iGjGbHE3WM/0sKe+tPEjLA99PyylWXBVmgSbnKluQPGQOGBBLQntjyVPo6I4+//koX8UN7o3pM85aeZgRyNzMbyEB+70FxkSUXZvfY3orLMLBladaw3f2Q==
x-ms-exchange-antispam-messagedata: 0JTQOmPSToifs64OXHaBCH130Lozry9gFYakZ4CkpsgvqLayItycr7KGwV8NowVLAjFap4hdpfpOQRlM4jMyk8dFl8Xzazv0vsJFrn6HLOxtUTOk7OnS43rGNdqakzRwj6IgS0wB2bkvEOuy3q+Dug==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25805dd9-44b3-4f4a-16dc-08d7cc812d3e
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Mar 2020 03:45:47.7066 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LXcmVnlus8XMp2VYC/+mXg31ADsA7W4qrmISKO7TNajzj38YHNfJyQKkB/3HoGGC26HNBRLkZO3PSn8EffJriA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3785
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
X-List-Received-Date: Fri, 20 Mar 2020 03:45:48 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

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

