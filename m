Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.82])
 by mx.groups.io with SMTP id smtpd.web10.6320.1599861976556922936
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 11 Sep 2020 15:06:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=hL50FLKe;
 spf=pass (domain: windriver.com, ip: 40.107.243.82, mailfrom: joe.slater@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KhzXM18kFWR32muvhMze9VQCvCkVvEY77aEc/luNvY95x0WxKoUIFV6vrGSkG16oOMa9zR2r9JSVFYqwyW36YKlwOheVYCG7T7rNogwE4lvnq+my+QM4DObCFW+sGcFScBHdteNhJizZ6BiHy9hNv10+3tHKhIgmsWTNsi5pvAEOqGOCeQLlCz18hV8woKOqzvqFVMw5S/CzvAE4HoB0y28qsxaDqKIySTS5+RY3jtuVxskB7LgZ3UtMbj+pj0wZDfvMNq/wLP7YlAZkTa1Gf6tau0HiZG4IBzN+Y85BLws8wiwr3tmukQuOsxPxcm4GKrOuyfL4S8nawgD4wE5gqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m0sunXJbzCJcZQC3oKl4TphXUf8imMvg2oKb5vV7f0M=;
 b=AnH0TGpgIhYet+S2t3hscLmhAzpuQLbUPMt85x3m9cvmMwVNgJxCkxmDp6lqNXrhaE3PYcqZO8Q21qbv13Q66zo7g2uP4kFVhcIQEs+65OW6TQoaP6sDAizMWqkfu205j18zpTGNezZ8H5OdBPQrxNQf5DiwZpjFKlxTxrsMdJXXy/0MpO0mUa5sQKwvmygdGLP0vcZmoDRQ15w8AcnHHVrB6oo7tAebHKR/t4OaolUdGBfUwtt8IME+8Fyit1r1EbAcrw5yOeXYOHCeygdfhkqR1M29T62SQM8hLKUPrn7HoPsunPtzHf64/5YrNKbp24v8Dm9QtQlg+OK24p3kSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m0sunXJbzCJcZQC3oKl4TphXUf8imMvg2oKb5vV7f0M=;
 b=hL50FLKeNIzp4JcrKNHC5u7YDsoh+r5caVyOmf3oDnAngZ97lK++h9CAlJHU5GkssUMfV3YIkNU+Qy2E1GsCPppfABz7n+vgFEF2ZOeMMh6y5PbwmnDEkgKOia7juwrzMg4UWszU4/RrkIizdXr+wgW8ZfCzXMcEH7XnqXcqSYw=
Received: from BY5PR11MB3992.namprd11.prod.outlook.com (2603:10b6:a03:188::10)
 by BYAPR11MB3317.namprd11.prod.outlook.com (2603:10b6:a03:7b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15; Fri, 11 Sep
 2020 22:06:15 +0000
Received: from BY5PR11MB3992.namprd11.prod.outlook.com
 ([fe80::80ee:21bc:b0aa:d35c]) by BY5PR11MB3992.namprd11.prod.outlook.com
 ([fe80::80ee:21bc:b0aa:d35c%7]) with mapi id 15.20.3370.017; Fri, 11 Sep 2020
 22:06:15 +0000
From: "Joe Slater" <joe.slater@windriver.com>
To: "Slater, Joseph" <joe.slater@windriver.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
CC: "MacLeod, Randy" <Randy.MacLeod@windriver.com>
Subject: Re: [oe] [meta-oe][PATCH 1/1] luajit: advance SRCREV to fix two CVE's
Thread-Topic: [oe] [meta-oe][PATCH 1/1] luajit: advance SRCREV to fix two
 CVE's
Thread-Index: AQHWgfpkseX86deQpUy75Yi94EEpPqlkC00A
Date: Fri, 11 Sep 2020 22:06:15 +0000
Message-ID: 
 <BY5PR11MB39926180521D6CA4F1A98A9D88240@BY5PR11MB3992.namprd11.prod.outlook.com>
References: <16314ABFB8306B25.8972@lists.openembedded.org>
In-Reply-To: <16314ABFB8306B25.8972@lists.openembedded.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: windriver.com; dkim=none (message not signed)
 header.d=none;windriver.com; dmarc=none action=none
 header.from=windriver.com;
x-originating-ip: [24.4.218.114]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 64bb4fbb-caa6-4617-f7f4-08d8569ee6fb
x-ms-traffictypediagnostic: BYAPR11MB3317:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: 
 <BYAPR11MB3317AEF151D6BF7EEEE69F9588240@BYAPR11MB3317.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:163;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 wHIohqFx1owOI7RzYdAhaozBnxBoJ7/EZkCNyc1/8omaaNs3n20Gp3lPdruv23Zc8OPiOi9k+di10ys6XXZ1Fx7gBv16vERnX4j4CcoxrBZZF2VIJCcbQ0i25pO5oy2OUJ+PGrGE7A6OPLfN7wpPc6H2Woby2kLS0NCTO+iX5VBMP8/zO4mvFP5xCcn8bfHk0iLzsvzGWDrwTsWIwPrCA65oiYy9RajS68cLCYoiMNvFhiU3CeX788aUwpzGXZmPL846z5rvgSFYMZHo2b2ulciYTN8wy5V/8o3G478AFOfq7azh3ZytWGHdzUbALzBIqPyISQc/gAYlzrJMFqQLKGAM7dnbxKQOc3lC8ov0opWwUQAXcoVQyFYjHFkaGdx8XYXWnl9BzTh7IgdBelvFGw==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3992.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(346002)(39850400004)(376002)(136003)(7696005)(26005)(83380400001)(33656002)(4326008)(2906002)(5660300002)(53546011)(52536014)(6506007)(9686003)(76116006)(186003)(55016002)(478600001)(110136005)(66556008)(8936002)(86362001)(66446008)(64756008)(107886003)(66946007)(71200400001)(8676002)(316002)(66476007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 eGh10S6x5H17tQpK8qG80VxZCfm/AZo2Jq6vbHCGKzRNQbbITz/0sL5IIbpforYGYDJwgbhe35vVRGXiCjIPKv/p6gHvfW6zNm5ljaz1YaBeusiQJauXl63rIsMDQqc+2+3UNG2ZG+HlZ0tpuEyNJNi2DS7d2DIxnYh0Jrb2yfELz+jA+4ftCuMZ5r2diggFI42K5wYjzMx6ZTmxmVlFdzWm7DYgIwVLRxKZ+N7PGhMEFym2yu8U76GMC7Lhcyfm9yiqqby3N9UAd/gHXiS6MQUlWWWLgLmzaktk4O723UUcLsDT2jOrKPcN9n88S3VZWn1kQoUmFIBQtysVUQS/Ur+V/kE3zNolz2wa8i77Nh/7dRupdKyR0kmIQ7QKd6M1qumAEv4H/5ObCZZcKQ/yfNiSB1zpA+iatlHfpMBSMjw9gkdU6jgqWtX1l4VsGsXnn2PwQJYA95ZD25sn4wgJCQ9KPTp85DfGSkxmCk7cEk+JjuEd8Ge6wW2whJs6lRfll3Qe/cUiLmvIw3sUl8nz2XF8Wll3F4nIY4AV/O5Az076bydz8tAj7w2aPQ6PpWbGqbamAcSkO/r3Bw25aR49PXlxLKek5VJUg6ratidCidGMVd/38jF+WtihAnQAytH2G2qHJrJi08GcTK2LRePCcg==
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3992.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64bb4fbb-caa6-4617-f7f4-08d8569ee6fb
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2020 22:06:15.1400
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /sfXOUUptxOPQlf594iFUMS0dmAHjsdxjy77+l4x7/0NY8TLcVJAQaf7pJk71aIAf3bRAs4f7YaqmkdGiUz6hRSuUFUtdnUtJyuQH9fse/o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3317
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

No comments on this?   I do not see it has been accepted.     Joe

-----Original Message-----
From: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.o=
penembedded.org> On Behalf Of Joe Slater
Sent: Thursday, September 3, 2020 6:58 AM
To: openembedded-devel@lists.openembedded.org
Cc: Slater, Joseph <joe.slater@windriver.com>; MacLeod, Randy <Randy.MacLeo=
d@windriver.com>
Subject: [oe] [meta-oe][PATCH 1/1] luajit: advance SRCREV to fix two CVE's

Fix CVE-2020-15890 and CVE-2020-24372.

Also change PV format because the reference to 2.1.0-beta3 was already far =
behind the SRCREV.  Now, base PV on the branch name and date of SRCREV comm=
it.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 meta-oe/recipes-devtools/luajit/luajit_git.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-devtools/luajit/luajit_git.bb b/meta-oe/recipe=
s-devtools/luajit/luajit_git.bb
index cc9039416..820722195 100644
--- a/meta-oe/recipes-devtools/luajit/luajit_git.bb
+++ b/meta-oe/recipes-devtools/luajit/luajit_git.bb
@@ -3,13 +3,15 @@ LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://COPYRIGHT;md5=3Dd739bb9250a55c124a545b588fd76=
771"
 HOMEPAGE =3D "http://luajit.org"
=20
-PV =3D "2.1.0~beta3"
-SRCREV =3D "0ad60ccbc3768fa8e3e726858adf261950edbc22"
 SRC_URI =3D "git://luajit.org/git/luajit-2.0.git;protocol=3Dhttp;branch=3D=
v2.1 \
            file://0001-Do-not-strip-automatically-this-leaves-the-strippin=
g.patch \
            file://clang.patch \
            "
=20
+# Set PV to the branch and date associated with SRCREV.
+PV =3D "v2.1-200809"
+SRCREV =3D "94d4abcca966df2cc423e821bcacd04898f73117"
+
 S =3D "${WORKDIR}/git"
=20
 inherit pkgconfig binconfig siteinfo
--
2.17.1

