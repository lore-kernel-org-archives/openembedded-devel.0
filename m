Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92AB9C4332F
	for <webhook@archiver.kernel.org>; Wed, 21 Dec 2022 15:32:54 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.21441.1671636766502171125
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Dec 2022 07:32:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=GYQBqgKI;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9354e08228=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2BLDrMgM012660
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 Dec 2022 07:32:45 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 mime-version; s=PPS06212021;
 bh=LZwFu3R9RXd+80GGMCSV1+AHy+GyN2Col7ByYN+WkXU=;
 b=GYQBqgKIwWhM0Edd3PKMdBf0+oWJqAS55dkPtY3f8blWDJeex8Gg4sOFnK4a7k7HKYe5
 tsfyh+rJ1b9fgLz6XkP0Fv504XJnP7013WNaRd0z7bGMpfbzDCeUY2LYt3BCs5lOflNT
 8F82CNknjBoXZjAovP5Tt+qbsGrcT/CXOPSJyPJnm9uQQk5andTiQ0v5nbzv+C3Mw6C/
 MpGgZgwKHmxuY3tEmJEGIRM0v/Zf4eVGFI5r3Jbsgpi/hD3Wh52Q5Xwi7q/P8rs7qqSu
 S4773FrnYd4Y7CIOpPIhwulmpt02som+bZnxuXRniO+rNDgCn5yvcn1AdjiM3kByX+tX vw== 
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2105.outbound.protection.outlook.com [104.47.58.105])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3mhe5qb1j5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 Dec 2022 07:32:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Av9g0j761fKl7lc5Wmd4tTRQa7FYqHtXnqWJd3nsxbBQkhkrQP7VhsY0Xq433opQqUzbJ7aK3Uml+wpmaNLQa5QLzkt1iYMm45MgchA1nxYcTCvsNnEJZ5eCB0xR1pDXDDIOQ/y/iiDiRmif1FbP/MHbwfvbZKEqhSkHE3WqaQwuwfl9I/2MwkmytCAsiGXn3pBtl/6N1A6PrhnzK/ZiVjYW3sFG5iYvOHSYpGN3nWpaCdOsqYr0BVZTna7D5a7Gpx8Ckj9ZY2xKFldiNdyMxDk22xOjTlsEfO8elF3gq3loMBFKkobVg84JHaOHhtHwpbnmnfSmJoOiK39ENQYb7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LZwFu3R9RXd+80GGMCSV1+AHy+GyN2Col7ByYN+WkXU=;
 b=ZTwvEnxTbqpzaclteAAg50gIGpjpQ9IAavOJ1w/0hDcrX1Nu+2STQv5erMLepen0hCA4tQUDCAD50KE8Jc86kZIXzPux3rqZJBCHzlH3lUlzSHcczD/oE+gi2p+VBLtFoHLF94q+Mq0s99mqVlvPOOU0B1N9yJIb/yEEvcuJw6x9dUfh9imoO3E/cPTjQ94ZHcSYzriHSMRqE/RL15uo7B7FlqdifSzrZ1W4ckYj9sR7ap/RM9vZx7hHzWD7y00gvNBf2hAr6vlbQ23QSYKowJgADD+wJ+GefAYcTHQsTSDA/v9S1Icx36ItwkdA2syHFkAehey/BnS/jHj3nqLhRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MW4PR11MB5822.namprd11.prod.outlook.com (2603:10b6:303:185::9)
 by BL1PR11MB5253.namprd11.prod.outlook.com (2603:10b6:208:310::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Wed, 21 Dec
 2022 15:32:43 +0000
Received: from MW4PR11MB5822.namprd11.prod.outlook.com
 ([fe80::efde:3b28:b807:1f8c]) by MW4PR11MB5822.namprd11.prod.outlook.com
 ([fe80::efde:3b28:b807:1f8c%4]) with mapi id 15.20.5924.016; Wed, 21 Dec 2022
 15:32:42 +0000
From: "Polampalli, Archana" <Archana.Polampalli@windriver.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
CC: "G Pillai, Hari" <Hari.GPillai@windriver.com>
Subject: Re: [oe][meta-oe][kirkstone][PATCH 1/1] xfce4-settings: 4.16.2 ->
 4.16.5
Thread-Topic: [oe][meta-oe][kirkstone][PATCH 1/1] xfce4-settings: 4.16.2 ->
 4.16.5
Thread-Index: AQHZD3VCoXWPONMHqUSM0MpCTq1LEq54hAQn
Date: Wed, 21 Dec 2022 15:32:42 +0000
Message-ID: 
 <MW4PR11MB5822FB712CA3B228C645AD9984EB9@MW4PR11MB5822.namprd11.prod.outlook.com>
References: <20221214043337.2695189-1-archana.polampalli@windriver.com>
In-Reply-To: <20221214043337.2695189-1-archana.polampalli@windriver.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB5822:EE_|BL1PR11MB5253:EE_
x-ms-office365-filtering-correlation-id: d17021fe-2a99-4409-2329-08dae3689a2f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 gyUTn298SfNI9Oi1duZMokGD8mwRkDiVGv2VAGLEbUGcwkvwi11FiloO9MvrbYK8HpX1qaIBucVKCD1/2tuZhzgPTtEPzcYIGAVXAXqGfQl/kBGg8hQEhSoOojva5Fc/FtZHqCYtO6WFHKoFN/WsUyyQeTHZAnqSIpJQQ6JTLwUffjMOYo5x8TZchX8Y9YRasCUctLtBLoYRygngVrpZEAFpqLVuOyFbJhNFY8BHkr6KmLINwZu/fg9GWSUapj8tJ6EeYSUqNlvLnFIfsKJDRbHbCCXizDNmxp0CQTvwb//dyHLQcOxiXGkQUvqUY+wZJQm8ctfNIBXByOcICMEGb2r4ZKmEwimMVsLU8T9WK1tKShe4ccSb1NVhCeRLi9b7dHNyG78WueK6TheEzCHmfmK37/hLAxQTF6z6VHfioTwF+62Vry7Z3ebIMyj3hTADcWRsR99OFuLds6zxsESYI1BDr0Fgn0gZ++g8ZvBL+4pfWPyLK4A9v3hXFeTJTRJdou1yh6R4swYIHLmMfXGTpzCreFK0kGq9bHivz9T5uyFPtAuvB6NC0ar91k5LeZc+ksL6OF9xC/IFoJ2XVcr9IugXFvGgglGYhgrLA1EKjUAOF7yUALUDg8mGdIW9GygNN95Z3bqfLM1cNjC33x97m4VZp/4ELh1nmkfTINg6zuuPXpi1PjEoWv6YZLT2CfiikvUjHEIx3EgYcjWLW6lHvA==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5822.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39850400004)(376002)(136003)(346002)(396003)(366004)(451199015)(53546011)(9686003)(186003)(86362001)(71200400001)(107886003)(7696005)(6506007)(478600001)(19627405001)(2906002)(91956017)(6916009)(316002)(66476007)(64756008)(8936002)(41300700001)(76116006)(66556008)(8676002)(4326008)(66946007)(66446008)(52536014)(83380400001)(5660300002)(38100700002)(33656002)(55016003)(122000001)(38070700005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?rzucGHDDmwcX/LjXTUEkJMesafaheyP+DSbY3nEx6Rzk0IZANNQEyGsY+N?=
 =?iso-8859-1?Q?wThMqcmjrAMfadbZ2hHi9zMDEPKCB0TrGOxwdYeSh+77Ngp0ChpifdFeG/?=
 =?iso-8859-1?Q?MfiAQ7FWSdo114vCOCC39EFl14IkQSyZmP4ursoynyKMfWfamTQO9wuQpJ?=
 =?iso-8859-1?Q?5r06yLtfcz0MAx2epaniRwt+K7OKajOq4gEzv3U2emJTfCbHFOm6MeQkdg?=
 =?iso-8859-1?Q?gavOcRYkcdkcQN8wue/NaRZ0TJ32dD1D7vV+VhFfai8otEbmzQTNKW414d?=
 =?iso-8859-1?Q?rmYW1yn2sFRxeouO0rGLB7dzklhLFLnKJKYjBrvPAYmwK9RI0/t+/0hlGR?=
 =?iso-8859-1?Q?2dQrm/2NgRFtC7vA76qQ4fnq3judhqKB8knD8+coSS8SDNiAtkAywekCCW?=
 =?iso-8859-1?Q?92fDCsR0jFKUF9UTxKED5eIV+QUXdCv69pRcx3zfG6yauxypdq/pkF5wlh?=
 =?iso-8859-1?Q?Hh3IVPZF7Z7cKca3f8khkyMs0TiGyfu7YxTK9Vtwq8c8+9eSRhYW/85Uzv?=
 =?iso-8859-1?Q?kyXns2VIVG9ZoUSODV/COkxNl2tUS7UZInmsetdzEn0NEKiZP3DxF7t+Eg?=
 =?iso-8859-1?Q?9Q9Jq2Rb+PKDmAYpSUZ3HaS2oNKhodoDhZvSlA5gMuxq3SRWXBIDProNhr?=
 =?iso-8859-1?Q?7OCQkk/s2CGXj+Ves8kOo7kVt+A4rO4rtEj8kNL6gzqhNVxfBQBEY5N0h8?=
 =?iso-8859-1?Q?HsBLryxt1MRcOzYIyHoeQM1H0/Jj2QonLTF2/ek2roDcshsmSP7Uc5xmM9?=
 =?iso-8859-1?Q?EjpcOSAqXn863HZEYoLd6tI7rDImM+2DyqG/I1JiriRbaCZOtaXe27gx+t?=
 =?iso-8859-1?Q?czHo/eeuWqo2chVB8qi8UjPhPReuO5IWlalJ5zpwJ17wGKXuxePOBMhpl6?=
 =?iso-8859-1?Q?UwwbQbMz3vH3F6QH7+RYjyKmuegt3p8vJdhKBpIcHM1oSJufVmKIaDAI/G?=
 =?iso-8859-1?Q?815kCCs6QVbVU27smOOAuO1mzgk4OCP6j/qjUuAhMow4ZnOR4+vP45CtU9?=
 =?iso-8859-1?Q?EPbLOuiZ5WSXOfHqoGQVrhxg70p50XWQ8ob1VQmGPiWtZ8NJR/VKnVt6IL?=
 =?iso-8859-1?Q?enVzsg2p3V9/J17SNpfVP2ny/TrMKnKRoOQlVtQ749aRW//EfWONbn8eCJ?=
 =?iso-8859-1?Q?g0pObu73KLIH7ApedfOAuKZNR/3y/iMq93SM86SdSvw45nuVFYsq4Sls2H?=
 =?iso-8859-1?Q?vNBJy0RyHb86FqSsh4AinXSQ7purfAnqyFI8NncO/4pJgAbd1VgM66NIFU?=
 =?iso-8859-1?Q?6cFG2nd+GWnD8LpjWUarYSsT/qfEalnQVuVD4cOki+X5OSMonExE4/ijIR?=
 =?iso-8859-1?Q?M/aD/ROQQ+i0IR0Zc3ep/YqJxRgnKiEf7CVeqQv8pp7uFicuNspvUEhYhk?=
 =?iso-8859-1?Q?Om4gISa/gJ/7FfU0UMxuKTiO+FNdWDw3Idr/DiFlS7TBCGAwtOppAGViNW?=
 =?iso-8859-1?Q?tW4EQFRLdYl6uZAsd0ffZe8pR4gpvRyfYBxkUvB58GZIiPlN4/7um3raAU?=
 =?iso-8859-1?Q?mnGZG3r0pmMw1ijGTukI7iUl0NiaCaCPLY1+aLv2WhQQ2gRcdSLQ2umSk/?=
 =?iso-8859-1?Q?l2FVI3hMK3T/1N7Nb1XShEIhhMLjGknPxRdMQ1KSFhmFc3Nfw8mPmVeCmy?=
 =?iso-8859-1?Q?4E/rv7w1FXcB7LKudmsPwvFi9JPN9VELr8gBnN7QdEbtS0CQ6H4ef7Pk0k?=
 =?iso-8859-1?Q?Ncv2tairCHNzA4ytyMJFvhuYKaIyJlRCwFbZdg2dm4P5zysOYuPx/CWL/I?=
 =?iso-8859-1?Q?i+PQ=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_MW4PR11MB5822FB712CA3B228C645AD9984EB9MW4PR11MB5822namp_"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5822.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d17021fe-2a99-4409-2329-08dae3689a2f
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Dec 2022 15:32:42.8762
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CTM84gRuicnLqB+A4Vdpkh+BswXx7EAGQpTjMViPxrbNr5hqC3hr83QCWU62ozjMSHvgU20Yl5SI7fX7OzlpMui1FzrSNMtvtmK2mLSscB67mTyMqaBic24yCGVawLqS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5253
X-Proofpoint-ORIG-GUID: -JaM6vkA2PPlQzzIbnIC-nzy-O_V7ojp
X-Proofpoint-GUID: -JaM6vkA2PPlQzzIbnIC-nzy-O_V7ojp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-21_08,2022-12-21_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 mlxlogscore=969 phishscore=0 mlxscore=0
 adultscore=0 spamscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2212210129
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 21 Dec 2022 15:32:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100182

--_000_MW4PR11MB5822FB712CA3B228C645AD9984EB9MW4PR11MB5822namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,

Could you please review and accept this patch.

Regards,
Archana
________________________________
From: Archana Polampalli <archana.polampalli@windriver.com>
Sent: Wednesday, December 14, 2022 10:03 AM
To: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.ope=
nembedded.org>
Cc: G Pillai, Hari <Hari.GPillai@windriver.com>; Polampalli, Archana <Archa=
na.Polampalli@windriver.com>
Subject: [oe][meta-oe][kirkstone][PATCH 1/1] xfce4-settings: 4.16.2 -> 4.16=
.5

It fixes CVE-2022-45062 in xfce4-settings 4.16.5.

CVE: CVE-2022-45062

$ git log --oneline xfce4-settings-4.16.2..xfce4-settings-4.16.5 |  grep -v=
 "Update translation"

83ea11cf Updates for release
f1cb5bda mime-settings: Properly quote command parameters
f7707d8b Revert "Escape characters which do not belong into an URI/URL
(Issue #390)"
b532324f Back to development
b9729c85 Updates for release
55e3c5fb Escape characters which do not belong into an URI/URL (Issue #390)
341443f8 Prefer full command when basic command is env (Fixes #358)
8d4106b3 Back to development
024399b1 Updates for release
af601e32 build: Fix intltool lock file problem during make distcheck
0875cfba xfsettingsd: Fix recursive lock in libX11 (Fixes #369)
20d866dc Back to developmen

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../{xfce4-settings_4.16.2.bb =3D> xfce4-settings_4.16.5.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-xfce/recipes-xfce/xfce4-settings/{xfce4-settings_4.16.2.bb =3D=
> xfce4-settings_4.16.5.bb} (93%)

diff --git a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.16.2.bb=
 b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.16.5.bb
similarity index 93%
rename from meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.16.2.bb
rename to meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.16.5.bb
index aa4265f7b..4a4e9f188 100644
--- a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.16.2.bb
+++ b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.16.5.bb
@@ -9,7 +9,7 @@ inherit xfce features_check mime-xdg
 REQUIRED_DISTRO_FEATURES =3D "x11"

 SRC_URI +=3D "file://0001-xsettings.xml-Set-default-themes.patch"
-SRC_URI[sha256sum] =3D "4dd7cb420860535e687f673c0b5c0274e0d2fb67181281d4b8=
5be9197da03d7e"
+SRC_URI[sha256sum] =3D "7a4f74802486d7e77a1c9fa4fda19b13fc8a8dec3e5074f367=
e34fa82b40d28e"

 EXTRA_OECONF +=3D "--enable-maintainer-mode --disable-debug"

--
2.34.1


--_000_MW4PR11MB5822FB712CA3B228C645AD9984EB9MW4PR11MB5822namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof"><span style=3D"font-family: Calibri, Arial, H=
elvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0); background-colo=
r: rgb(255, 255, 255);">Hi,</span></div>
<div class=3D"elementToProof"><span style=3D"font-family: Calibri, Arial, H=
elvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0); background-colo=
r: rgb(255, 255, 255);"><br>
</span></div>
<div class=3D"elementToProof"><span style=3D"font-family: Calibri, Arial, H=
elvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0); background-colo=
r: rgb(255, 255, 255);">Could you please review and accept this patch.</spa=
n></div>
<div class=3D"elementToProof"><span style=3D"font-family: Calibri, Arial, H=
elvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0); background-colo=
r: rgb(255, 255, 255);"><br>
</span></div>
<div class=3D"elementToProof"><span style=3D"font-family: Calibri, Arial, H=
elvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0); background-colo=
r: rgb(255, 255, 255);">Regards,</span></div>
<div class=3D"elementToProof"><span style=3D"font-family: Calibri, Arial, H=
elvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0); background-colo=
r: rgb(255, 255, 255);">Archana</span></div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Archana Polampalli &l=
t;archana.polampalli@windriver.com&gt;<br>
<b>Sent:</b> Wednesday, December 14, 2022 10:03 AM<br>
<b>To:</b> openembedded-devel@lists.openembedded.org &lt;openembedded-devel=
@lists.openembedded.org&gt;<br>
<b>Cc:</b> G Pillai, Hari &lt;Hari.GPillai@windriver.com&gt;; Polampalli, A=
rchana &lt;Archana.Polampalli@windriver.com&gt;<br>
<b>Subject:</b> [oe][meta-oe][kirkstone][PATCH 1/1] xfce4-settings: 4.16.2 =
-&gt; 4.16.5</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">It fixes CVE-2022-45062 in xfce4-settings 4.16.5.<=
br>
<br>
CVE: CVE-2022-45062<br>
<br>
$ git log --oneline xfce4-settings-4.16.2..xfce4-settings-4.16.5 |&nbsp; gr=
ep -v &quot;Update translation&quot;<br>
<br>
83ea11cf Updates for release<br>
f1cb5bda mime-settings: Properly quote command parameters<br>
f7707d8b Revert &quot;Escape characters which do not belong into an URI/URL=
<br>
(Issue #390)&quot;<br>
b532324f Back to development<br>
b9729c85 Updates for release<br>
55e3c5fb Escape characters which do not belong into an URI/URL (Issue #390)=
<br>
341443f8 Prefer full command when basic command is env (Fixes #358)<br>
8d4106b3 Back to development<br>
024399b1 Updates for release<br>
af601e32 build: Fix intltool lock file problem during make distcheck<br>
0875cfba xfsettingsd: Fix recursive lock in libX11 (Fixes #369)<br>
20d866dc Back to developmen<br>
<br>
Signed-off-by: Archana Polampalli &lt;archana.polampalli@windriver.com&gt;<=
br>
---<br>
&nbsp;.../{xfce4-settings_4.16.2.bb =3D&gt; xfce4-settings_4.16.5.bb}&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; | 2 +-<br>
&nbsp;1 file changed, 1 insertion(+), 1 deletion(-)<br>
&nbsp;rename meta-xfce/recipes-xfce/xfce4-settings/{xfce4-settings_4.16.2.b=
b =3D&gt; xfce4-settings_4.16.5.bb} (93%)<br>
<br>
diff --git a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.16.2.bb=
 b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.16.5.bb<br>
similarity index 93%<br>
rename from meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.16.2.bb<=
br>
rename to meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.16.5.bb<br=
>
index aa4265f7b..4a4e9f188 100644<br>
--- a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.16.2.bb<br>
+++ b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.16.5.bb<br>
@@ -9,7 +9,7 @@ inherit xfce features_check mime-xdg<br>
&nbsp;REQUIRED_DISTRO_FEATURES =3D &quot;x11&quot;<br>
&nbsp;<br>
&nbsp;SRC_URI +=3D &quot;<a href=3D"file://0001-xsettings.xml-Set-default-t=
hemes.patch">file://0001-xsettings.xml-Set-default-themes.patch</a>&quot;<b=
r>
-SRC_URI[sha256sum] =3D &quot;4dd7cb420860535e687f673c0b5c0274e0d2fb6718128=
1d4b85be9197da03d7e&quot;<br>
+SRC_URI[sha256sum] =3D &quot;7a4f74802486d7e77a1c9fa4fda19b13fc8a8dec3e507=
4f367e34fa82b40d28e&quot;<br>
&nbsp;<br>
&nbsp;EXTRA_OECONF +=3D &quot;--enable-maintainer-mode --disable-debug&quot=
;<br>
&nbsp;<br>
-- <br>
2.34.1<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_MW4PR11MB5822FB712CA3B228C645AD9984EB9MW4PR11MB5822namp_--

