Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0254C71153
	for <webhook@archiver.kernel.org>; Mon,  4 Sep 2023 10:20:52 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.44748.1693822851366090953
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Sep 2023 03:20:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=W9Ie909Q;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=761160981e=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3849aMEM031024
	for <openembedded-devel@lists.openembedded.org>; Mon, 4 Sep 2023 03:20:51 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:references:in-reply-to
	:content-type:mime-version; s=PPS06212021; bh=1RDoH7mOYBPGiP64XL
	SloJRPDPb0M0EUdCblAfDskrY=; b=W9Ie909QLi+O0+PCez3nipakYurFjmhzaD
	0HBwRyT5pHxDCvQlcEzCaW4suI+PWsiZFWoXCgM20oQVCSDJJ47Nt5aGGPiphwSF
	EbDFwssuOASt9xVLJRmrP8uLK7lhFDMvyzA6ynw4ufZ4YtemHcfB5WfTsCqs85Wy
	31+xNaPkuDW4xnZvdj24l+DxWmP0GRNzPtfdAcM6Au/mbRuGSvl+6OBp316ssHAd
	J0JybJCLB60SiBIpXZDz5CjOsgJqxLGfGin6gHaB40Pi18D15sbV5xT13JqKh7R4
	bAeMkHOOAVf77GkXtP9SfkC4F+oCpvtYEcLPefd1bqd3jLGxPwpA==
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2043.outbound.protection.outlook.com [104.47.57.43])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3sv0b01dfh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 04 Sep 2023 03:20:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iDjmatYTSzxb75IaBLcNtIxZNGyoSNaXaGhNVHhM+/mg7rB+Q8h54dT2TrLbb2abL5HNIbVbFzPlDkPxpCmxr/Cv3cM14w5/RGUIRqYL6BOQvIzT+TUZI+x0LgN979Kx2TumJAIktbOU+3JHS3nVeYEsFPcV1djm/yrfjjh35j3UFnIknc/Z8QqIVhePcKWqvCFZGUbl79qHRa0aVp6JjsNJuKBZaUWEJv1ewrN72QqaFLlg2JsvEekuGlcyxeh3VMMsZrzNKswkvIgS81LfuvOh5DoBc/ixuqTeeui4wF9EwEzpCDpD1n5f3IgmJrGNp6svbICxFgnHA+AhSUuLpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1RDoH7mOYBPGiP64XLSloJRPDPb0M0EUdCblAfDskrY=;
 b=mhGI2rryjKGgihuF1XwiaQijQzHi90P9dH8kCVF06XQybTR18/Vdj3W3/4lNXBXE7uACNr4iII1AlHaZzTHvBHsN/QAs2xMIzlNf/8eme+tFZgHhOHNPeVcgNmnTePMYdisv0+Umot05um9+uCb5OyecmiC2eWHOcip6iC+39tdFq69529vuG6EzdKxzlySlEDrTW4ZwKYFZZUPTSckVRTNEOTc1dUY57TG3YJGvu5EA144fSwYoPOcrTWhCL2o9aFiLBELmPUi0ATCgVkpmFbGBA/V6U6pzHlLNK9aDZ5+7NjNS8Lg4FaS6JlpcXaQeDHAusz5vDlJNqcAHIOzsxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MW4PR11MB5822.namprd11.prod.outlook.com (2603:10b6:303:185::9)
 by MW5PR11MB5907.namprd11.prod.outlook.com (2603:10b6:303:1a1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.32; Mon, 4 Sep
 2023 10:20:48 +0000
Received: from MW4PR11MB5822.namprd11.prod.outlook.com
 ([fe80::bf4d:9c24:f4db:31a]) by MW4PR11MB5822.namprd11.prod.outlook.com
 ([fe80::bf4d:9c24:f4db:31a%4]) with mapi id 15.20.6745.030; Mon, 4 Sep 2023
 10:20:48 +0000
From: "Polampalli, Archana" <Archana.Polampalli@windriver.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
        "Polampalli, Archana"
	<Archana.Polampalli@windriver.com>
CC: "G Pillai, Hari" <Hari.GPillai@windriver.com>
Subject: Re: [oe][meta-oe][kirkstone][PATCH 1/1] php: upgrade 8.1.16 -> 8.1.22
Thread-Topic: [oe][meta-oe][kirkstone][PATCH 1/1] php: upgrade 8.1.16 ->
 8.1.22
Thread-Index: AQHZ0NZBvQtZi/lXlkqN8Pu3+hrHKLAKkTTp
Date: Mon, 4 Sep 2023 10:20:48 +0000
Message-ID: 
 <MW4PR11MB58220CCBF4E430FA533F66F084E9A@MW4PR11MB5822.namprd11.prod.outlook.com>
References: <177C18A21C391498.12117@lists.openembedded.org>
In-Reply-To: <177C18A21C391498.12117@lists.openembedded.org>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB5822:EE_|MW5PR11MB5907:EE_
x-ms-office365-filtering-correlation-id: 91062a04-5b09-4507-746d-08dbad309bb7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 Z5+DTdlWKTOcVlRnSLk0pLk7vUoJVmO+2+mhsepThNxtnSlVk9AOXtdiAmnnB0CsuaQJGIC5EErtfpLCCYutFHH7yVAD73iHKrJp/Ueciozz03BXdUHkPOhzMUheWbRIvoXG3EcpxX93YNpog+7KAYbkBW6jpWxthNOyoGF6xUJDE8GNqIsVqshaaeyMydQ1orL2/6jbJ/LqPuhiwwk4v+zrkP/Us/yY+1eJepwdyOvMwXHrlKiD5oj6a5X8+V7wruBS78PLeQLs1a4Iera3ZlUwvTF/r84Q8lVTctVpErrQZc6WjnC5tk499/6E4Sn/z7lqomBVOOl6rr9fNPU3sb3FEl0oeH7O5972Gc+E7aaAywTrBXBx1UbPw6CsxGjidXmRPHFLrxakhPRtMtOGRXVCZXscr10XtcCVhaRY158EFwUHbevJ5naTv/bXxBKkFJrs/tf3+IEF32CuvTZGCfFrapgBTlLTZfLwGx1LNp1CYYRz9m2TyDD4kAEjLBpmjpVl5aIN8KlhSlpCCaNoCvG1wP8HbIEna6m9LzpetGxCRTTXiAlercDGEfeOgh4Ru369bc5hav/fzCATpFKIyVwrn4Iq45UivFLyuF7+lCE=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5822.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39850400004)(396003)(136003)(376002)(346002)(366004)(186009)(1800799009)(451199024)(478600001)(71200400001)(966005)(91956017)(110136005)(66556008)(66476007)(76116006)(66946007)(66446008)(26005)(107886003)(64756008)(7696005)(6506007)(9686003)(2906002)(8936002)(4326008)(8676002)(316002)(41300700001)(52536014)(86362001)(5660300002)(33656002)(38100700002)(122000001)(38070700005)(16799955002)(166002)(83380400001)(55016003)(19627405001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?kvUCUBXkScr9KDhDLerr+Bt9rPU3cO9OKLpmd+z7E8gLkrJMK7IQIL2ys4dj?=
 =?us-ascii?Q?cMSyTMnMoGNaOC/ZKIQdGCTlSGtpHZB9pPaFz/CHAcY7flbGvH3AojgI4W2g?=
 =?us-ascii?Q?6i1sW3ETJlQw+EfIBfeQ1ysIwxTNwMLbvDPcmT4z3HgRYyI9I2zb4CJNMDbB?=
 =?us-ascii?Q?VJMHEADa4ATYdy5FZGvenlsZYt5chw4rh+0sax51Aw60pTa0hH4otvuzFt7E?=
 =?us-ascii?Q?2r2oyMPvP5GUQZ9oWgwdL+gP8AEQRZTB5rBBNJc1i5Q3AZauB4f1xL4j4Rel?=
 =?us-ascii?Q?rIR9cDCgQ22LSYn2B32FNvtpQuh3gRc5G4KSmQK4sycaBjt3Vmh/mIqWDQpG?=
 =?us-ascii?Q?vHcx9CMSqju4j8p5nBmZuPOTaRh4ILo0oxP9I65RTI1sA4Yb/I1WuY8WbEG1?=
 =?us-ascii?Q?ApHDXImoFQU/22S+VP9BXiBBrFWs2AjWzBVGQyH2otVcAh1YUYlGUrtALNpW?=
 =?us-ascii?Q?7k3Cs8KuiErRsEQZANwkXazlPOb4k6Gxg8kE+/u1n1uOHE1pqqc0xuH9p60Z?=
 =?us-ascii?Q?0Dknq28JUnCCXhAGRCsiI2Jnkhxk3AV0tU1PbcoF3HFuf48yF5HQ68ZJ665e?=
 =?us-ascii?Q?JUU+xsH9XiGbFKT/iNetL07kn06MwskIvH5fs9CKkaYGy9Lp2KIw9ahhjXv0?=
 =?us-ascii?Q?LPZtGvIlkZNFL4mYPrkZ6UdXd2/6I1COcKRlmzDed7INB1sOZMGhdFg82de2?=
 =?us-ascii?Q?TaXFjVXRcRshyUEISshwxz34TYp5w+uGaUAp2j1raH1L7LDAqhFfQAlkR/8W?=
 =?us-ascii?Q?VFjKxqeJZYcvIN4YZVXnq8JnljEI7CZi/xkPS/WzIuDFK0Z9VAlI2SwWkyj7?=
 =?us-ascii?Q?Hh2r0uleITU2KUNC5Ux8uL6WsgjCkMt2GkjB62mHxO8l56Xg12JvFrUK1TDU?=
 =?us-ascii?Q?eQPczbS9fTtqVfO+jpWiqlMPhNGoqVgsZhe1u6yMWkvx0yudksaggCJ1q+GO?=
 =?us-ascii?Q?n7OuYcy+iomV6E2VkPYQQdRaxGiUGbnh1QSJCSlBx5vobqgqlOoGkP/aIbaf?=
 =?us-ascii?Q?Z550RXC+bGf6G5pWWOTxhxKouPGUbB00UENjVs3/LZP78VKXfakLsbaYOn3X?=
 =?us-ascii?Q?n5864Wedr4pl0mTlzBBOkmHqNzKv5M4RLMbhIpC8q0atbwHJmcSIxL84qIsS?=
 =?us-ascii?Q?hSvvQTNmp/KcRpyZS5XpVt1SSpueg+D178Cj4XXnoB04pB4MU9zleh6iR7Dp?=
 =?us-ascii?Q?O+NOcnhSLU/l4kxIE3l/w4gr3BA+bLr1mUgt1xXUu8r+WgGFYvPqSj1MFLOV?=
 =?us-ascii?Q?Nufr0fqEwyxuuxYlsJON7zmCA95kJahnZtA6VXE2I1gc2jmOPRbTAXMwp8LJ?=
 =?us-ascii?Q?fYfJsePAv26bQW8chLvIl3YVvtTQnwWmRRFjJbqz/vfUD5YxFZGV5Z7Q5LxE?=
 =?us-ascii?Q?0UYUPE5Co6rPtkouikoBs0GJ78odRqB/ptnM/WZfIMcbd/hCTJVVFlQMb785?=
 =?us-ascii?Q?Qf+ydj9qEqDuMUyHK90iogDiQDxtJXehOGozvJ5mUQEcgdMOUsM9d2zLjdYN?=
 =?us-ascii?Q?7gc9JSRsCgmXAzY0zIaaD/MA1jM7OSrrbWqeJYduUHzM8IMt5QuqIfqb2QIy?=
 =?us-ascii?Q?GYglfRIcASksdPHbUOnkkr2ivZWdEHMJA9fKzCCE43AGoIh+q25QKtLx9hKW?=
 =?us-ascii?Q?ww=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_MW4PR11MB58220CCBF4E430FA533F66F084E9AMW4PR11MB5822namp_"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5822.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91062a04-5b09-4507-746d-08dbad309bb7
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2023 10:20:48.4967
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MCfoFfEZCmWAWZwE5HX9EHMosOd3mJ0bgLoLp83TI+hDJtzSA6v6pmiTvg6mTWEwZQTf3m8urScUoTXn/Lz+odSMJJ8+i5RYEYyUVqT7GkPR2ihkyt0vSrciY1vWzYeU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5907
X-Proofpoint-ORIG-GUID: q_iJsHqRJrJhAzCjcBRmAJiLgmdEs5dK
X-Proofpoint-GUID: q_iJsHqRJrJhAzCjcBRmAJiLgmdEs5dK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-04_07,2023-08-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=869
 bulkscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 mlxscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2309040093
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 04 Sep 2023 10:20:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104707

--_000_MW4PR11MB58220CCBF4E430FA533F66F084E9AMW4PR11MB5822namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Reminder!

Regards,
Archana
________________________________
From: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.o=
penembedded.org> on behalf of Polampalli, Archana via lists.openembedded.or=
g <archana.polampalli=3Dwindriver.com@lists.openembedded.org>
Sent: 17 August 2023 12:13
To: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.ope=
nembedded.org>
Cc: G Pillai, Hari <Hari.GPillai@windriver.com>
Subject: [oe][meta-oe][kirkstone][PATCH 1/1] php: upgrade 8.1.16 -> 8.1.22

Upgrade php to 8.1.22

Security fixes:
    CVE-2023-3824
    CVE-2023-3823
    CVE-2023-3247

https://www.php.net/ChangeLog-8.php#8.1.22

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 meta-oe/recipes-devtools/php/{php_8.1.16.bb =3D> php_8.1.22.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/php/{php_8.1.16.bb =3D> php_8.1.22.bb} (99=
%)

diff --git a/meta-oe/recipes-devtools/php/php_8.1.16.bb b/meta-oe/recipes-d=
evtools/php/php_8.1.22.bb
similarity index 99%
rename from meta-oe/recipes-devtools/php/php_8.1.16.bb
rename to meta-oe/recipes-devtools/php/php_8.1.22.bb
index db8a65544..ffa331844 100644
--- a/meta-oe/recipes-devtools/php/php_8.1.16.bb
+++ b/meta-oe/recipes-devtools/php/php_8.1.22.bb
@@ -33,7 +33,7 @@ SRC_URI:append:class-target =3D " \
           "

 S =3D "${WORKDIR}/php-${PV}"
-SRC_URI[sha256sum] =3D "cd9f0ea14d82d9455587a49a0b6c802a7b8d8ff79703f9f48b=
17db010fb633ce"
+SRC_URI[sha256sum] =3D "992354e382c6c618d01ed4be06beea8dec3178b14153df64d3=
c8c48b85e9fbc2"

 CVE_CHECK_IGNORE +=3D "\
     CVE-2007-2728 \
--
2.40.0


--_000_MW4PR11MB58220CCBF4E430FA533F66F084E9AMW4PR11MB5822namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Reminder!</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Regards,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Archana</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> openembedded-devel@li=
sts.openembedded.org &lt;openembedded-devel@lists.openembedded.org&gt; on b=
ehalf of Polampalli, Archana via lists.openembedded.org
 &lt;archana.polampalli=3Dwindriver.com@lists.openembedded.org&gt;<br>
<b>Sent:</b> 17 August 2023 12:13<br>
<b>To:</b> openembedded-devel@lists.openembedded.org &lt;openembedded-devel=
@lists.openembedded.org&gt;<br>
<b>Cc:</b> G Pillai, Hari &lt;Hari.GPillai@windriver.com&gt;<br>
<b>Subject:</b> [oe][meta-oe][kirkstone][PATCH 1/1] php: upgrade 8.1.16 -&g=
t; 8.1.22</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Upgrade php to 8.1.22<br>
<br>
Security fixes:<br>
&nbsp;&nbsp;&nbsp; CVE-2023-3824<br>
&nbsp;&nbsp;&nbsp; CVE-2023-3823<br>
&nbsp;&nbsp;&nbsp; CVE-2023-3247<br>
<br>
<a href=3D"https://www.php.net/ChangeLog-8.php#8.1.22">https://www.php.net/=
ChangeLog-8.php#8.1.22</a><br>
<br>
Signed-off-by: Archana Polampalli &lt;archana.polampalli@windriver.com&gt;<=
br>
---<br>
&nbsp;meta-oe/recipes-devtools/php/{php_8.1.16.bb =3D&gt; php_8.1.22.bb} | =
2 +-<br>
&nbsp;1 file changed, 1 insertion(+), 1 deletion(-)<br>
&nbsp;rename meta-oe/recipes-devtools/php/{php_8.1.16.bb =3D&gt; php_8.1.22=
.bb} (99%)<br>
<br>
diff --git a/meta-oe/recipes-devtools/php/php_8.1.16.bb b/meta-oe/recipes-d=
evtools/php/php_8.1.22.bb<br>
similarity index 99%<br>
rename from meta-oe/recipes-devtools/php/php_8.1.16.bb<br>
rename to meta-oe/recipes-devtools/php/php_8.1.22.bb<br>
index db8a65544..ffa331844 100644<br>
--- a/meta-oe/recipes-devtools/php/php_8.1.16.bb<br>
+++ b/meta-oe/recipes-devtools/php/php_8.1.22.bb<br>
@@ -33,7 +33,7 @@ SRC_URI:append:class-target =3D &quot; \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;<br>
&nbsp;<br>
&nbsp;S =3D &quot;${WORKDIR}/php-${PV}&quot;<br>
-SRC_URI[sha256sum] =3D &quot;cd9f0ea14d82d9455587a49a0b6c802a7b8d8ff79703f=
9f48b17db010fb633ce&quot;<br>
+SRC_URI[sha256sum] =3D &quot;992354e382c6c618d01ed4be06beea8dec3178b14153d=
f64d3c8c48b85e9fbc2&quot;<br>
&nbsp;<br>
&nbsp;CVE_CHECK_IGNORE +=3D &quot;\<br>
&nbsp;&nbsp;&nbsp;&nbsp; CVE-2007-2728 \<br>
-- <br>
2.40.0<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_MW4PR11MB58220CCBF4E430FA533F66F084E9AMW4PR11MB5822namp_--

