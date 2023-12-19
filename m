Return-Path: <meenali.gupta@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAB2CC41535
	for <webhook@archiver.kernel.org>; Tue, 19 Dec 2023 06:47:07 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.6960.1702968425745926458
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Dec 2023 22:47:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=so0xNBkl;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0717f0ab44=meenali.gupta@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BJ60Rd2031012
	for <openembedded-devel@lists.openembedded.org>; Mon, 18 Dec 2023 22:47:05 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:references:in-reply-to
	:content-type:mime-version; s=PPS06212021; bh=Ht4bW9yDTlU2Fm750e
	UtpwMxq8RK4tP8XTbHepqRW8Y=; b=so0xNBklUFLXbbLIeQZYcTYDA0EX/rAIxY
	9EiE5wW9jg+OnOBsjIbAJmopj0xGLn0+bejdjTyeB2ivyHTVpE/SXaohsE9MPK2x
	WC1MyHXqmNlz7fKGEXdk3krp7/Vr8Bt6+3m0y2LhSxjelTLXLuPW2EnUkX27++F0
	kyhXtgg+/Aq+OLMeN35DuKO11JBiEK9j+m8vApHHlIOM+2Ka6vAhulyu2zBM98t7
	F2HKHntLn0ONk8uRXIP+JcWfMyoWz0JuW0hMzZXEyKYkolaIhzXrD/zksq3wGPbH
	4vILHNsytJT2ns7D21Jj9n+drUtrcuiR+GoJkHSmvWlVKBr8G8Iw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3v1824jp76-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 18 Dec 2023 22:47:05 -0800 (PST)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.24/8.17.1.24) with ESMTP id 3BJ6l4WC020601;
	Mon, 18 Dec 2023 22:47:04 -0800
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3v1824jp75-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Dec 2023 22:47:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kQWUrKACGt6cnYMnCroA9zzrAf9sIBCrYS/tLxh2IP7eDkLmCmXefwfQtoamMoUflkPdx0AUNTkmusZZPgRNsqM+pWHLevvW3oJ6xtvSSTHZ3zqaUiI/XKWx9CiSbIW6wZIofCleEnJJfZjqnNBezpiZDmRc1jjGlESZMRo7nnn3qBLtPgQHWmIX7o1dKAYmr6B8P1xuef3GeyzmDoOHYhv3CEcCW32HTMQnwqlB+c0pLEUvAtaFW++IUxkVOof0gjk8wffuHb9O5L0zBVWiBjoHR3t+fuNsjJqSM+abEWgvA3t80/akwIm/599ZTV/i0HE1L624LuaMKiL7jEmeHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ht4bW9yDTlU2Fm750eUtpwMxq8RK4tP8XTbHepqRW8Y=;
 b=n32JEL7/zkpoBqw5j4eR+TtKXItd+C+rkWpjgwy1mBryNhJcjwZfxsgvc8vEI/H9CM6JgpNCITIBDb2bSin3cey7vmYW+P56sBwgVKkKihP+zNh0arwOB9MhxBiAdgIvEjOjudVZ8MFfBag7ZRl60ZQt96cFnSJvtSp/vEWeWBbAD1vScaZEUQC4flZbFAeC+UbQq+FjlEV6AHckOo81ACny5DGK0+FDtmKDO5hNAGwqb/Lxd7kHMoc3hy80N3ykN0CRBjafwZ+hMfvgerOvj9hatJOIFN62xRMl9bJ909SJxuSlnqsW5h72+vHlJYv4Hd7/3oKUlI3qA4WPYz8rTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BY1PR11MB8005.namprd11.prod.outlook.com (2603:10b6:a03:523::18)
 by SN7PR11MB6827.namprd11.prod.outlook.com (2603:10b6:806:2a2::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.38; Tue, 19 Dec
 2023 06:47:00 +0000
Received: from BY1PR11MB8005.namprd11.prod.outlook.com
 ([fe80::b564:8f4e:84e1:f45f]) by BY1PR11MB8005.namprd11.prod.outlook.com
 ([fe80::b564:8f4e:84e1:f45f%7]) with mapi id 15.20.7091.034; Tue, 19 Dec 2023
 06:47:00 +0000
From: "Gupta, Meenali" <Meenali.Gupta@windriver.com>
To: Khem Raj <raj.khem@gmail.com>,
        "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe][meta-webserver][kirkstone][PATCH 1/1] nginx: upgrade 1.25.2
 -> 1.25.3
Thread-Topic: [oe][meta-webserver][kirkstone][PATCH 1/1] nginx: upgrade 1.25.2
 -> 1.25.3
Thread-Index: AQHaMkRyL3AbXtBE7USzi6kug2i3GrCwKYVH
Date: Tue, 19 Dec 2023 06:46:59 +0000
Message-ID: 
 <BY1PR11MB8005BA3E26317F3F1002A694E597A@BY1PR11MB8005.namprd11.prod.outlook.com>
References: <20231214103812.512113-1-meenali.gupta@windriver.com>
 <170296725288.1627685.15808203001904107897.b4-ty@gmail.com>
In-Reply-To: <170296725288.1627685.15808203001904107897.b4-ty@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY1PR11MB8005:EE_|SN7PR11MB6827:EE_
x-ms-office365-filtering-correlation-id: 4f3c544b-0da7-4efb-49b8-08dc005e4cf7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 m7n/Y/Ne9OVv6MeTzAZpCkBmVs0cd5tgtU2WHmxK9Nnw+xlbXcneNO6rNj5SLOcR6LrP2Y8JY9z5/hjLvHl6PBgIDX8QVR4HWd7E6JDn3k7IzppoYvKVLVeuEg0uAZqsFr2FvGOSWLHJENl9ZHuba4JW8FVEr3hHUz1IdroRHZYPUXcQ6Cyx7JjSVwlUr8f0yG6cTUzG+xD3wmvctYdLYiNmeYUhN2yJXdhOrcHusvLKt+y+NL4guHlOPwgxXkyhMWGozABcNo1FmgmPZjhIBJ/xaGB9PdyAE9D3rA8HbDmIPx4a4c+VNBXEadBAIvHTk8/ogmw5R0Qsjs9cOVMG73pXmfQcLdfarPEPD4xZIHQkjE8Y7pNVPB9+idlutZHo9bt4n3fWW7TboCyZUPJn5gN6T2kUyIPIbNEJ+bgi8u4gybV9YDRew0kmPYSHK+yRPniqGxtZ+PxRnI/hKpl4VcEDtjLaakHqfb9cJebU01PhaYmi1TLole/TKbqT+oE7lkKPAk0TN4M3EUfvjKpxwhRDUaqFvAPtaEIP0Xiz3OOCZVttabLibJeMtFsi0I4zaJ+R9HSZirKBj2JdfJnhrSApq+KOSz8INWEFDfyn9OK3110eWmn8nJZdfKWA/IddF/kpuWDsMEdxmTWpAc7MOg==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY1PR11MB8005.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(346002)(39860400002)(376002)(396003)(230922051799003)(230273577357003)(230173577357003)(186009)(64100799003)(1800799012)(451199024)(71200400001)(26005)(53546011)(6506007)(7696005)(9686003)(83380400001)(5660300002)(2906002)(4744005)(8676002)(8936002)(41300700001)(478600001)(91956017)(110136005)(966005)(76116006)(52536014)(64756008)(66446008)(66476007)(66556008)(66946007)(316002)(38070700009)(166002)(122000001)(38100700002)(33656002)(86362001)(55016003)(19627405001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?lGcJ2NW2RKW7mAAdKVIpAEtiQ+EL6dZDdbtbs5E8iTJFtn5uKMW0JUYPsFdq?=
 =?us-ascii?Q?f8YAIJUzd+w4XOWRh5zfUMgkwS1RI+/nE9BLiYAWwpd87EkdxmWOIU3RWESp?=
 =?us-ascii?Q?NAXa1io+1PeWG9SNHvPc+bPyTHke0ocyaJcWK5MLtoUASbAHLdArUYEWECjl?=
 =?us-ascii?Q?lzgPPw1UxK6nF4Xu6YYGZwNbfp+U1PORDJiqFAtytQsHGa+D56csfj+TtVks?=
 =?us-ascii?Q?asu9nsJV6GvguEm4/hpXKX+WCcC0ECa3pqpDjs6AQ/48Wz+drGLgJzC54JE7?=
 =?us-ascii?Q?vWGOfJ0Z4/RomXykDeK+47w7k61e6Dw1e3qLxSPuHUZC4XLCpb/fMw/DaB48?=
 =?us-ascii?Q?pnJ0LsD7DsDPdotE18JeoD15J+2q7p8r/Z4W6t4IZa/AbZQNcotA6NOAU2F2?=
 =?us-ascii?Q?E8SsCL+J8yM66WuhRRG00AfY6HoIFpgIaAv4j8+wjKlIW2g1NaYZ90GgZhOM?=
 =?us-ascii?Q?IWA0va4XqDalk4ULw0VR4MCN/dz/UuNVxCBPFE7xMfaD6rKslDjRunTk1626?=
 =?us-ascii?Q?adrp1cMpxn04PwUOhq96L1tw8U3PzUPPIEOzW2+nft3zrTtM4Sqthzs+s4yT?=
 =?us-ascii?Q?PPKxH0Azi+a3oAe2Ci+QFz8jgcDVfbVGl3576TBDrLoZxFCpYQqBsjDM7N22?=
 =?us-ascii?Q?zyOzEg+sI1wyNWkvwTYu0BwbExnLoQ+5ew6/70jzuowDtgpTNbxZizOxiR3B?=
 =?us-ascii?Q?ees7h1JJGEEk1Asfm+yNZl6MkqTBADGRqMIORgQC+/03Nn049RM03WA2SQe/?=
 =?us-ascii?Q?1JiBIZHsLepNaSNEkSIHnsCJvhqJEkOru19hfT4q1tTZ7ZeXX0ifjhGROqKr?=
 =?us-ascii?Q?5j9sNp4epDxkLLlD2xSIDp+k+AHMt8yKJp6QcvRakLBMB1rYt/dF12au3pfF?=
 =?us-ascii?Q?EPgpsPUY2lWkdvfY+Uu617oiC4Pb4Y1q/1unxAmmwMANx0QHwb8/ZNrL5t9g?=
 =?us-ascii?Q?3WKYc0IimpCm2LcjMrBWXLdOTvE+t03d3vye2f1dwx31ZGWTgFShLqg5xFnG?=
 =?us-ascii?Q?jlpOd7fA8ZDM6n/D58PtTMPNvNLIiCKsyRmmcmYQflNLYGB72iFpn5kyolgn?=
 =?us-ascii?Q?S8z9ikbRfTo8a1dMRGMDN4k66B2mNV+DW7jxAeFL+20XJIxWZnQ5A8K/esi8?=
 =?us-ascii?Q?q8SxqSw6ezfWl/8tddaeBAfGy574i6saguBkEXcM57yQc9r6mVkETs0gEJ3G?=
 =?us-ascii?Q?xKDQWj1HnyrROr4BwJ7pqX+cA6eqc8OsjkQFGtN7C9tIWthSaOHUc1vbCgj2?=
 =?us-ascii?Q?TY8RsI0wwqDlj9bMjMB4ggXbOCMVUYmSmXLlc5NuyvH5c3/JbuQnJaxMESNc?=
 =?us-ascii?Q?8RX3tEjaw4KxFJWmd0T7iXZfRjsXyFFtJaDJScrVXWjZOu6rYzJMJXRLn3Qz?=
 =?us-ascii?Q?Se5WeoMecso/5xXh62pUpnJyLLw34LYpkl4zGcbWMIX2YQHd3Ifdh0OhaAM/?=
 =?us-ascii?Q?c51K6tZ9CL96/WwvjEuuPOrgkTtZzUPjhNZW8n7xmFfjQr0fl46ue46ORIUf?=
 =?us-ascii?Q?9ZBUn/CDDC2d5YaLk/diNGRrn2xIRa454G+/otpVmlM5q0IEpAZ9UqP1Tp0Z?=
 =?us-ascii?Q?mii1SGAOMggtEdOZduyQ31CSYWcGUZZ5kKlMvlxg?=
Content-Type: multipart/alternative;
	boundary="_000_BY1PR11MB8005BA3E26317F3F1002A694E597ABY1PR11MB8005namp_"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY1PR11MB8005.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f3c544b-0da7-4efb-49b8-08dc005e4cf7
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Dec 2023 06:46:59.7715
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: smhYKj9hmJ1V2lbBP3uA/WNATq+9UTrcK6WgtTszYBIRlbrREznFteB1kyKA6zHcPiKyvYRHAXqPMHnQ4JU5nhHkZqb2TeFyCXwC6ezYy6Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6827
X-Proofpoint-ORIG-GUID: iolNeFEI3O7jQ2bGVpLN1fGbS7DHKVSi
X-Proofpoint-GUID: wOxk9DGtQCBO9SEj867FZr59CwfzdYwX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 phishscore=0
 mlxscore=0 impostorscore=0 mlxlogscore=999 lowpriorityscore=0 bulkscore=0
 adultscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312190048
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Dec 2023 06:47:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107629

--_000_BY1PR11MB8005BA3E26317F3F1002A694E597ABY1PR11MB8005namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Khem raj,


Please ignore this patch.

Regards
Meenali
________________________________
From: Khem Raj <raj.khem@gmail.com>
Sent: 19 December 2023 11:57
To: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.ope=
nembedded.org>; Gupta, Meenali <Meenali.Gupta@windriver.com>
Subject: Re: [oe][meta-webserver][kirkstone][PATCH 1/1] nginx: upgrade 1.25=
.2 -> 1.25.3

CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.

On Thu, 14 Dec 2023 10:38:12 +0000, mgupta1 wrote:
> Changelog:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> https://nginx.org/en/CHANGES
>
> *) Change: improved detection of misbehaving clients when using HTTP/2.
>
> *) Feature: startup speedup when using a large number of locations.
>        Thanks to Yusuke Nojima.
>
> [...]

Applied, thanks!

[1/1] nginx: upgrade 1.25.2 -> 1.25.3
      commit: dc4bef4648ea5ff73230ff2d343f498c93bd333b

Best regards,
--
Khem Raj <raj.khem@gmail.com>


--_000_BY1PR11MB8005BA3E26317F3F1002A694E597ABY1PR11MB8005namp_
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
Hi Khem raj,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Please ignore this patch.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Regards<br>
Meenali</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Khem Raj &lt;raj.khem=
@gmail.com&gt;<br>
<b>Sent:</b> 19 December 2023 11:57<br>
<b>To:</b> openembedded-devel@lists.openembedded.org &lt;openembedded-devel=
@lists.openembedded.org&gt;; Gupta, Meenali &lt;Meenali.Gupta@windriver.com=
&gt;<br>
<b>Subject:</b> Re: [oe][meta-webserver][kirkstone][PATCH 1/1] nginx: upgra=
de 1.25.2 -&gt; 1.25.3</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">CAUTION: This email comes from a non Wind River em=
ail account!<br>
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.<br>
<br>
On Thu, 14 Dec 2023 10:38:12 +0000, mgupta1 wrote:<br>
&gt; Changelog:<br>
&gt; =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; <a href=3D"https://nginx.org/en/CHANGES">https://nginx.org/en/CHANGES<=
/a><br>
&gt;<br>
&gt; *) Change: improved detection of misbehaving clients when using HTTP/2=
.<br>
&gt;<br>
&gt; *) Feature: startup speedup when using a large number of locations.<br=
>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Thanks to Yusuke Nojima.<br>
&gt;<br>
&gt; [...]<br>
<br>
Applied, thanks!<br>
<br>
[1/1] nginx: upgrade 1.25.2 -&gt; 1.25.3<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; commit: dc4bef4648ea5ff73230ff2d343f498c93bd=
333b<br>
<br>
Best regards,<br>
--<br>
Khem Raj &lt;raj.khem@gmail.com&gt;<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_BY1PR11MB8005BA3E26317F3F1002A694E597ABY1PR11MB8005namp_--

