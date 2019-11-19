Return-Path: <chanakya.koppolu@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id D1AED7F81C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Nov 2019 19:39:44 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 Nov 2019 11:39:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,219,1571727600"; d="scan'208";a="231656673"
Received: from fmsmsx104.amr.corp.intel.com ([10.18.124.202])
	by fmsmga004.fm.intel.com with ESMTP; 19 Nov 2019 11:39:45 -0800
Received: from fmsmsx120.amr.corp.intel.com (10.18.124.208) by
	fmsmsx104.amr.corp.intel.com (10.18.124.202) with Microsoft SMTP Server
	(TLS) id 14.3.439.0; Tue, 19 Nov 2019 11:39:44 -0800
Received: from FMSEDG002.ED.cps.intel.com (10.1.192.134) by
	fmsmsx120.amr.corp.intel.com (10.18.124.208) with Microsoft SMTP Server
	(TLS) id 14.3.439.0; Tue, 19 Nov 2019 11:39:44 -0800
Received: from NAM03-DM3-obe.outbound.protection.outlook.com (104.47.41.56) by
	edgegateway.intel.com (192.55.55.69) with Microsoft SMTP Server
	(TLS) id 14.3.439.0; Tue, 19 Nov 2019 11:39:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=eO/z1R3pjOGPCRt4nYqk4EIn/8yusz0KjXcEW891CEdXURV6pZzj2iV2Zwn9SieuWJ0QqcjhY9lbEQJLcRuxsxxchIpsT1/7tzop4lI4Ag7KhX3WdkPs9vJ+2jEAPa03swwp4kghBKDgM4+Uan0ch/gWsyPa/QtHdEBXzh1XtD9L3aRU8NpDjet5wN1LFC31tZOCN5dsIl2+P6IDJbXD4tpAJVT8Aevx1GIv8YALDXMXPaxNEtU0CxQhx6iBzk5m0Wad1xDvfq1Edyo7W0tvBItxEqXX8yEQT6f21MmDoVAThZAvFSHiYvOCRgFmNkl9r6N5K1JxZFMhyXaTi4N0yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=OQ6UdKgxfSp/gnFFT3TGYsYDPpdHz8O35RqibvVlkeA=;
	b=XbXVreHB/knmg66X5e2VVV5y8XGwU6odbidOmW+jVX6ZeK8wJaleKlJ3gSsgohEa/oY7SxBeS+FPNQV8JVot/G2lZJGFbfyi1x//RuYizjdsgsklMhoPksuPOa8kfaa0T4sZ+bo9A8cYYjI8ZpufdsUnVqj5P4xBq3aTtH/hibH454hwWTCYH5d6FUR2CQwF5Wb6IJiM2IzBwUNrCgGLPSYNVPBn0ja5MOj8HTS9zgh68smDWqo2mx4CSDANw1ZeF/daqrtjuJ0s7c0lx52xPw9gHltP+Z3kSaUJbdyK2ppFq10nTJ217SyV1+v3Wjd9HO+rYWL4//me8Jof6Y2oTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com; 
	dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
	s=selector2-intel-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=OQ6UdKgxfSp/gnFFT3TGYsYDPpdHz8O35RqibvVlkeA=;
	b=wGL+pdaqOuiNVEeSzdsgOhVEJPG2El1H88iOk9sRHddtKFh/mrlprcmiDw5Gs2HuZuUtjvLzpbRoRslhzOW/kFxrP+5orOr0zAAG5GWgfclIFvAk98MLMTuZheM6URncrSEFsjD9y/dCFbHGyWMMng178E6v6NbVeowEg+qZkbQ=
Received: from CY4PR11MB1416.namprd11.prod.outlook.com (10.173.16.142) by
	CY4PR11MB1237.namprd11.prod.outlook.com (10.169.255.147) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2451.30; Tue, 19 Nov 2019 19:39:42 +0000
Received: from CY4PR11MB1416.namprd11.prod.outlook.com
	([fe80::3517:75de:536:83ae]) by CY4PR11MB1416.namprd11.prod.outlook.com
	([fe80::3517:75de:536:83ae%12]) with mapi id 15.20.2451.029;
	Tue, 19 Nov 2019 19:39:42 +0000
From: "Koppolu, Chanakya" <chanakya.koppolu@intel.com>
To: Fabio Berton <fabio.berton@ossystems.com.br>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-python][PATCH 4/5] python-zipp: Add native and
	nativesdk	to BBCLASSEXTEND
Thread-Index: AQHVmht1nZuE8N7kLk2tPUol3z2ax6eS6wwg
Date: Tue, 19 Nov 2019 19:39:41 +0000
Message-ID: <CY4PR11MB1416A3A2E158375BC214F859854C0@CY4PR11MB1416.namprd11.prod.outlook.com>
References: <20191113120944.10668-1-fabio.berton@ossystems.com.br>
	<20191113120944.10668-4-fabio.berton@ossystems.com.br>
In-Reply-To: <20191113120944.10668-4-fabio.berton@ossystems.com.br>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiOGEyODVmNGYtMTUzZS00MmFmLWIyNTAtYzMxMGY3ZTg5ZjcyIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiZ2Nwc3hzTTBETEFjWXJkRndnRjJXRFBOM0dhV2MwSXJ5VVwvV2hXMGdsMnB6aXl6Nkh5RFdDQ3FhdDh6emFoUW8ifQ==
dlp-version: 11.2.0.6
dlp-product: dlpe-windows
x-ctpclassification: CTP_NT
dlp-reaction: no-action
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=chanakya.koppolu@intel.com; 
x-originating-ip: [134.134.136.212]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: aafaf6f8-49a9-406a-84a3-08d76d283939
x-ms-traffictypediagnostic: CY4PR11MB1237:
x-microsoft-antispam-prvs: <CY4PR11MB1237F8328ADA84F2AA50C52B854C0@CY4PR11MB1237.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 022649CC2C
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(39860400002)(376002)(366004)(136003)(346002)(396003)(189003)(199004)(13464003)(110136005)(66446008)(11346002)(476003)(2906002)(76176011)(74316002)(229853002)(316002)(3846002)(305945005)(6116002)(33656002)(66476007)(8936002)(486006)(76116006)(66556008)(71190400001)(66946007)(14444005)(81166006)(81156014)(256004)(64756008)(71200400001)(52536014)(7696005)(53546011)(9686003)(446003)(7736002)(6506007)(6306002)(66066001)(102836004)(5660300002)(186003)(99286004)(6246003)(14454004)(55016002)(6436002)(25786009)(478600001)(86362001)(966005)(2501003)(26005);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR11MB1237;
	H:CY4PR11MB1416.namprd11.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vfV6vfP+y5C62eOk+gFiR9YegjrXW8ciMkYKbQAodV7sccIbQPxieu4m3Y+zCVgo18J3yyMhRkqvfkJt2DP3KcB491QcPT85KbrKHbfW80ekr+CE+mVYQbEHMSODIEXVEaELJ83S6ies+Nx/ulcUQb7XQkz3Ct8fyrgKE2n+D3JUxDfqSICOeH7WbNHXHsfjzv9IzYWbAqMdnWzlRBtq8vbMlw/HtZfdUL5VHwiyGNKcONrnSNe9d1DVHOV+b796TFAAfvNJ33yOlISNZCfRkGVzAfHggLmQV0srYkXgi+1jYQyFAawDJv1SxBXGP+KAZ9bcVn2RNzUm8nAN+2d0W6QAXOstxAni986AQPgYfw+FdgI9EwvSHDksUyb0GYks/BE1KbM0uvcM/Iy9KQH9nJuyxQq4RufDtSlyJHizIbtle/8QsT4g4ph8P/CdWK2W
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: aafaf6f8-49a9-406a-84a3-08d76d283939
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2019 19:39:41.6467 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Njy1gFJkQ1HRiOsYGeCRrZ+wq/r7yOrmtrgjY9U2Dg6x/DM/QVBiIM5i9LnnKxbIQL5EmtI5K7M23wd8tFAKpdJt4e913IPV6D50R1JVZ3A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB1237
X-OriginatorOrg: intel.com
Subject: Re: [meta-python][PATCH 4/5] python-zipp: Add native and nativesdk	to BBCLASSEXTEND
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
X-List-Received-Date: Tue, 19 Nov 2019 19:39:45 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello,

A recent upgrade to pytest is missing a runtime module called "zipp" which =
is a dependency for importlib-metadata. Here is the log from the image buil=
t using the latest changes from meta-openembedded layer:

root@intel-corei7-64:~# pytest
Traceback (most recent call last):
  File "/usr/bin/pytest", line 6, in <module>
    from pkg_resources import load_entry_point
  File "/usr/lib64/python3.7/site-packages/pkg_resources/__init__.py", line=
 3250, in <module>
    @_call_aside
  File "/usr/lib64/python3.7/site-packages/pkg_resources/__init__.py", line=
 3234, in _call_aside
    f(*args, **kwargs)
  File "/usr/lib64/python3.7/site-packages/pkg_resources/__init__.py", line=
 3263, in _initialize_master_working_set
    working_set =3D WorkingSet._build_master()
  File "/usr/lib64/python3.7/site-packages/pkg_resources/__init__.py", line=
 583, in _build_master
    ws.require(__requires__)
  File "/usr/lib64/python3.7/site-packages/pkg_resources/__init__.py", line=
 900, in require
    needed =3D self.resolve(parse_requirements(requirements))
  File "/usr/lib64/python3.7/site-packages/pkg_resources/__init__.py", line=
 786, in resolve
    raise DistributionNotFound(req, requirers)
pkg_resources.DistributionNotFound: The 'zipp>=3D0.5' distribution was not =
found and is required by importlib-metadata
root@intel-corei7-64:~# pytest --version
Traceback (most recent call last):
  File "/usr/bin/pytest", line 6, in <module>
    from pkg_resources import load_entry_point
  File "/usr/lib64/python3.7/site-packages/pkg_resources/__init__.py", line=
 3250, in <module>
    @_call_aside
  File "/usr/lib64/python3.7/site-packages/pkg_resources/__init__.py", line=
 3234, in _call_aside
    f(*args, **kwargs)
  File "/usr/lib64/python3.7/site-packages/pkg_resources/__init__.py", line=
 3263, in _initialize_master_working_set
    working_set =3D WorkingSet._build_master()
  File "/usr/lib64/python3.7/site-packages/pkg_resources/__init__.py", line=
 583, in _build_master
    ws.require(__requires__)
  File "/usr/lib64/python3.7/site-packages/pkg_resources/__init__.py", line=
 900, in require
    needed =3D self.resolve(parse_requirements(requirements))
  File "/usr/lib64/python3.7/site-packages/pkg_resources/__init__.py", line=
 786, in resolve
    raise DistributionNotFound(req, requirers)
pkg_resources.DistributionNotFound: The 'zipp>=3D0.5' distribution was not =
found and is required by importlib-metadata
root@intel-corei7-64:~# python3 --version
Python 3.7.5

Please test pytest before upgrading for any missing modules.=20

Regards,
Chanakya

-----Original Message-----
From: openembedded-devel-bounces@lists.openembedded.org <openembedded-devel=
-bounces@lists.openembedded.org> On Behalf Of Fabio Berton
Sent: Wednesday, November 13, 2019 4:10 AM
To: openembedded-devel@lists.openembedded.org
Subject: [oe] [meta-python][PATCH 4/5] python-zipp: Add native and nativesd=
k to BBCLASSEXTEND

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
---
 meta-python/recipes-devtools/python/python-zipp.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python-zipp.inc b/meta-pyt=
hon/recipes-devtools/python/python-zipp.inc
index ba18f7216..5f63852ad 100644
--- a/meta-python/recipes-devtools/python/python-zipp.inc
+++ b/meta-python/recipes-devtools/python/python-zipp.inc
@@ -8,3 +8,5 @@ SRC_URI[sha256sum] =3D "3718b1cbcd963c7d4c5511a824081290416=
4b7f381b647143a89d3b98f
=20
 DEPENDS +=3D "${PYTHON_PN}-setuptools-scm-native"
 RDEPENDS_${PN} +=3D "${PYTHON_PN}-more-itertools"
+
+BBCLASSEXTEND =3D "native nativesdk"
--=20
2.20.1

--=20
_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-devel

