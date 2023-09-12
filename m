Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03763CA0EC3
	for <webhook@archiver.kernel.org>; Tue, 12 Sep 2023 08:56:26 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.20785.1694508979338801858
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Sep 2023 01:56:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=U1IXjayW;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7619f89624=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 38C7L0qA018116
	for <openembedded-devel@lists.openembedded.org>; Tue, 12 Sep 2023 08:56:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:references:in-reply-to
	:content-type:mime-version; s=PPS06212021; bh=XVPwClw3BUdPQAfopa
	CYtAxTwh5xjro2wkqdP/HpktU=; b=U1IXjayWmdlHUhE0jaQ74oPWiuMiCSWUBE
	7NStostC7yb4cn2pEg7aYY1r5U0ywnNz6S5kPeStYAxm1oMJXxQLsWUlWIeY0NSh
	mXGZKm6zAmeAPwAHZ4cbGvNPqYrkQstBTyYfjVthMdxN1TulqdqvUFfAa4euTymX
	H8NsHU1Kg0OtB5h8BpwlYLF9e++XsXqWk3gz94ia1JtzWhDgYZf3LWlhwOTHzwJm
	VmaBBKMpQMWqkua8SlFmlX1z8jSUxieEaUsHDfaI3OEd3BJNldde4I1RClWXx5Tk
	gHEtdczHNirOAMi/lS+iflSgspj/n9ZAwM5jO+1wr9LpSjDJ10EQ==
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2109.outbound.protection.outlook.com [104.47.70.109])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3t0fp62f4v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 12 Sep 2023 08:56:18 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fvFzBhLiyF9WyRi2nSJqpc0EAAoWIt0fQOyQCL60vaJZ/quWmL/cYyWbSf+X5EhTuHoNfmnUytJMfAm9t2lR93ClDYU4420DDv3vLqEyzt9Wb/md8bK2JyFua3M5i4s3gMQ54XDMmJKis0yo36ntx7W/RuIPapkANzknYgLRNcUzYmaPhftZ8wTlBMU/+hr52uJ99Zy/B7PVHBVMRZoAXWlQU2HzMg1oPruo8g0004WTvlBvOxcG8YbtUPqFgx8JoYzZthuwdmVGH0d3MWQwIKkbHt/VHc3XF7U2pBVZnWbxRivVWXeDWqqd8LV+BMJx73mIk6hq1nxIY2XAuk910Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XVPwClw3BUdPQAfopaCYtAxTwh5xjro2wkqdP/HpktU=;
 b=iCQN/TIlKoRN44XzkMrshA+OHV1o2yCvGrDBzT8NwCOFaRY/jKWk4yLXQDGkEeXqYlS6ad0icAbrm3VLfoOrfGDOwsZ82MP2W9NJRvWC3qhDxEQDxvEvrJ5feTIp8pVjq/1h37w1TdnbcaQboIc492VAmPD2uq66lhXxahse3PetRJA2AYT/1xzyoeuhgoCR9aL66mOHiswTcjl5DOyLmyxckJ407FwdvH7IN/GQgQdnnochr70Bs3CpmAs5EuzOo+3AEgQVrOnDAPje8bB6xrilePZpZYTghL4AQk3eohG/kAiq5KCjV6KuxRimkjfYpOXvWFvCnDuOVETFDHQBPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MW4PR11MB5822.namprd11.prod.outlook.com (2603:10b6:303:185::9)
 by CH0PR11MB8236.namprd11.prod.outlook.com (2603:10b6:610:184::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.38; Tue, 12 Sep
 2023 08:56:14 +0000
Received: from MW4PR11MB5822.namprd11.prod.outlook.com
 ([fe80::bf4d:9c24:f4db:31a]) by MW4PR11MB5822.namprd11.prod.outlook.com
 ([fe80::bf4d:9c24:f4db:31a%4]) with mapi id 15.20.6768.029; Tue, 12 Sep 2023
 08:56:14 +0000
From: "Polampalli, Archana" <Archana.Polampalli@windriver.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
        "Polampalli, Archana"
	<Archana.Polampalli@windriver.com>
Subject: Re: [oe][meta-oe][master][mickledore][PATCH 1/1] python3-appdirs:
 print ptest results in unified format
Thread-Topic: [oe][meta-oe][master][mickledore][PATCH 1/1] python3-appdirs:
 print ptest results in unified format
Thread-Index: AQHZ5VZ2SyIArzPMzEKjaXgdZs8/u7AW4wND
Date: Tue, 12 Sep 2023 08:56:13 +0000
Message-ID: 
 <MW4PR11MB582276B59131CD33D22B5BA884F1A@MW4PR11MB5822.namprd11.prod.outlook.com>
References: <17841AB8666355E4.29005@lists.openembedded.org>
In-Reply-To: <17841AB8666355E4.29005@lists.openembedded.org>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB5822:EE_|CH0PR11MB8236:EE_
x-ms-office365-filtering-correlation-id: cc98d840-a3eb-4704-3d6b-08dbb36e1e4a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 IZSJMDtrJKTw0lq1aV9wKbTdQWZCNvKHanFlCSSloU2O3Usv22QcX+YeXqCxkAwbk9W80tejKaO2CdIyd4ZSvZwxe+5W4i6qcUhE7xp7LbVtAn/+k7PIi0GUNri/xvqmUG2X1dRi5CCLy7gKI7W+AmEA4eNlO+uK68BJYdluWASglp+of+zQydsO1mWJKNr0m96lwpKHUnWgV/15rhPdjYsQe/xDQ90EDbNDS8zAQLWWavORNeEdLaTaVrqhd+8Bsjrf/r0rm76DpBikCghWjgOVwbOJRp8vf6YD5rE3lzniCG4VvF2mvg1PiP243gy8J4UyX1mMyg85bGwPU5dNtMZv72bdkNcuImRVuIriza0Yx4VS2kt5n1phCU0bAtJ4miRXC7hWp8DxKVK+6SoJyPkn9U3m1AAe2BO3JH9D+pomvpFwQZD9uBKZztRXXukBCTtSQ52630wBJbzJAUBfDWsDaBTEybQFnJSKTjLhqqROnSbFKZNEWeiwMKcjFDi2tiQ2U6H+eUbJ3tHC8H3B0Cr7bn2Xp2D7Y1fEnfVbi5D75byPENszsr1SANMdPbJ35/xEv4DUXluK6SMpcRj6s3SD65dVDuu4As6WbpWKm7lkFj18+zBL0kQ/7wIloqZo
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5822.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(376002)(346002)(396003)(39850400004)(136003)(186009)(451199024)(1800799009)(41300700001)(110136005)(76116006)(66446008)(64756008)(66556008)(66946007)(66476007)(91956017)(55016003)(316002)(122000001)(478600001)(38070700005)(38100700002)(2906002)(33656002)(86362001)(52536014)(5660300002)(8676002)(8936002)(26005)(19627405001)(83380400001)(6506007)(7696005)(9686003)(71200400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?jT4ZGOcBdfIlsYxFtXtnJbjdeJ7m4ceqNynKMlg8G9NsVd9HiBczjvm9xqQ5?=
 =?us-ascii?Q?wOnmhofKTFHH9F913QqLf2m/haR7kj4sPu7OfWZuR1FzVCQMubJDFKzIS84H?=
 =?us-ascii?Q?4IPACDghRgMHQvvdmij1GviryEaYQmEMZx84LOLltjRLcPM7vaZtuDVBFaQ7?=
 =?us-ascii?Q?M61z3adKAsPaCEiWRPBIfiqOWSE/4ymDnTNXnuHKtkQ+1JyF5hf3D6f/CkOw?=
 =?us-ascii?Q?eb/ZY7E5d5sPj5vfi3Sc0JsxEE7OYUziIXC5A21iOhzoVGyMFpYi+6E8Vilz?=
 =?us-ascii?Q?a1PoEUTq8UAk9GGEemiPYOLERSzJn9zctgbWMqzsKNn1aqPtPsChnzH9sOeI?=
 =?us-ascii?Q?gcuAFZkWSkKOrcS06LN7bgHsz7lSJWPp4F+G2t5c27XNFAuPlosNlR3alllJ?=
 =?us-ascii?Q?erqhtchJOd98o8VFariE7qplmD9RqGNEqpMcPIN6jiEj8z5gUtUOlAo8hvin?=
 =?us-ascii?Q?aPgAHRKRTqWrae8CdzjAeBsvOlsi46lsPVgXAeH3SjQlswfOXK/w8zqbo+5y?=
 =?us-ascii?Q?EDG8NfWCjQn9ra5wCgGfs1agxArw90bjUFenkdLlieZWIhViojjB0IPYlYbJ?=
 =?us-ascii?Q?iI6DEM2Ru+3rfiFV2KZn7x86ufoFez3d3/Ibjd6k0S60o1VKGsjrv7TqDUto?=
 =?us-ascii?Q?PLhPSewKNuUVVui0l0lWsJFGcjcdpIzVvjez0XU4WYv3ejOatRYwk/cMNh2i?=
 =?us-ascii?Q?6vSZAGKyoNz+eQbBQcodMVxfnLROsV0YEJgzA1XV56FikrBDdkX0kAmG/CYK?=
 =?us-ascii?Q?IRrL3wPw6ByPZir8QCd+PBdObtP2MskkROIWUz+ZKzOIouPfESShUwff6yjc?=
 =?us-ascii?Q?hjP5fIhs7AoyEVkAFojmvl0sHFO55/Z5LYGCI3K7/tIwSbjeQrFeKVWc3hKL?=
 =?us-ascii?Q?mbN3Njp7QLAC3MobkkK9DyqQSJUy5vxT/EpJRmmwrS+ANARI51jDbNbzwiBK?=
 =?us-ascii?Q?ANfRl3SFXJdwK/IvMsvrzFBJrLHvr4XtPo5eTE220aek23n1V8FKiK0ubFAd?=
 =?us-ascii?Q?i7jQJGq5TTATYtIbm1Pz6PzrH6OsG41LgM/YCdpskU9P06UjSXMiUppIyR7r?=
 =?us-ascii?Q?ffnyHMp4NJaSWKJKmXcvCeTbFhEigy2MW2B0EKNmOFAs8xtzwaeSbhj7DV8p?=
 =?us-ascii?Q?tu+HFtnpg00NvgkwLLyZKAp/HknqrioLrsnUGEu0sTKAylaeJlGrHCydn8kw?=
 =?us-ascii?Q?IFxvs5IY0qyJ71Oycwl7FytGm2YyvTbWCKvo8XjIkgc5mhBGBgzXDMc/a7if?=
 =?us-ascii?Q?dfEbhFB/PBn8lcS84WJd5Ulg4xZUmt5H6LMgqkWst3BRokTM/HlRaGhXPaor?=
 =?us-ascii?Q?Jcx5zqU6BC3QIFnppQ44Xy2CqpxhutjaT1jo+tflY2pjTQQ6QzjY14arecaq?=
 =?us-ascii?Q?CkswBy+UqmKP0vjflVd3TvAR/uMQCQUhFrieoKMK/AchYcayE8eRIouo5iAc?=
 =?us-ascii?Q?JHd/QOd9wmMSGuOPScvwzYxwxhikeROH4Tv21sLu0itDI+ZvJnCNZ+ahAiDS?=
 =?us-ascii?Q?DRKfUDn3ekkIQmecPyL/Qb9Pt3dt7Vu/P4HZdxL1YjRB3TtJ7ojnDvipa3yW?=
 =?us-ascii?Q?c+lPfzw9rrtAVhvTR4kOLvChSKW9RKVoBTiYAuzEfBg2uxLckoIr7JlNtKcN?=
 =?us-ascii?Q?zw=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_MW4PR11MB582276B59131CD33D22B5BA884F1AMW4PR11MB5822namp_"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5822.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc98d840-a3eb-4704-3d6b-08dbb36e1e4a
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Sep 2023 08:56:13.8771
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3SfNg0wi7Wrl2dEwfLaUX1rJ1PLTRhFKEQn5HZ32b0TjsX/Ig5vN1vrSHCdIFaj0IKUH8dGWcgzic26dFg2ze4vFIy5jh7ljC+7Ssp6Gr6v9rfdXaWlzLEdTDeszDD6L
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8236
X-Proofpoint-ORIG-GUID: lC5juLvJpAXWwD81s2zAapTMLEaAzw6U
X-Proofpoint-GUID: lC5juLvJpAXWwD81s2zAapTMLEaAzw6U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-12_06,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 mlxlogscore=999 phishscore=0
 suspectscore=0 impostorscore=0 spamscore=0 bulkscore=0 mlxscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2309120075
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 12 Sep 2023 08:56:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104843

--_000_MW4PR11MB582276B59131CD33D22B5BA884F1AMW4PR11MB5822namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Please ignore this patch.

-Archana
________________________________
From: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.o=
penembedded.org> on behalf of Polampalli, Archana via lists.openembedded.or=
g <archana.polampalli=3Dwindriver.com@lists.openembedded.org>
Sent: 12 September 2023 14:22
To: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.ope=
nembedded.org>
Subject: [oe][meta-oe][master][mickledore][PATCH 1/1] python3-appdirs: prin=
t ptest results in unified format

Update run-ptest script to print the output of python3-appdirs ptest result=
s in
unified format

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 meta-python/recipes-devtools/python/python3-appdirs/run-ptest | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-appdirs/run-ptest =
b/meta-python/recipes-devtools/python/python3-appdirs/run-ptest
index 5287f3e03..b63c4de0d 100644
--- a/meta-python/recipes-devtools/python/python3-appdirs/run-ptest
+++ b/meta-python/recipes-devtools/python/python3-appdirs/run-ptest
@@ -1,3 +1,3 @@
 #!/bin/sh

-pytest | sed -e 's/\[100%\]//g' | sed -e 's/\.\.F/: FAIL/g' | sed -e 's/\.=
\.\./: PASS/g'
+pytest -o log_cli=3Dtrue -o log_cli_level=3DINFO | sed -e 's/\[...%\]//g'|=
 sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/=
g'| awk '{if ($NF=3D=3D"PASS" || $NF=3D=3D"FAIL" || $NF=3D=3D"SKIP" || $NF=
=3D=3D"XFAIL" || $NF=3D=3D"XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'=
| awk '{if ($NF=3D=3D"PASS" || $NF=3D=3D"FAIL" || $NF=3D=3D"SKIP" || $NF=3D=
=3D"XFAIL" || $NF=3D=3D"XPASS") {$NF=3D"";print $0}else{print}}'
--
2.40.0


--_000_MW4PR11MB582276B59131CD33D22B5BA884F1AMW4PR11MB5822namp_
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
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Please ignore this patch.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
-Archana</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> openembedded-devel@li=
sts.openembedded.org &lt;openembedded-devel@lists.openembedded.org&gt; on b=
ehalf of Polampalli, Archana via lists.openembedded.org
 &lt;archana.polampalli=3Dwindriver.com@lists.openembedded.org&gt;<br>
<b>Sent:</b> 12 September 2023 14:22<br>
<b>To:</b> openembedded-devel@lists.openembedded.org &lt;openembedded-devel=
@lists.openembedded.org&gt;<br>
<b>Subject:</b> [oe][meta-oe][master][mickledore][PATCH 1/1] python3-appdir=
s: print ptest results in unified format</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Update run-ptest script to print the output of pyt=
hon3-appdirs ptest results in<br>
unified format<br>
<br>
Signed-off-by: Archana Polampalli &lt;archana.polampalli@windriver.com&gt;<=
br>
---<br>
&nbsp;meta-python/recipes-devtools/python/python3-appdirs/run-ptest | 2 +-<=
br>
&nbsp;1 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta-python/recipes-devtools/python/python3-appdirs/run-ptest =
b/meta-python/recipes-devtools/python/python3-appdirs/run-ptest<br>
index 5287f3e03..b63c4de0d 100644<br>
--- a/meta-python/recipes-devtools/python/python3-appdirs/run-ptest<br>
+++ b/meta-python/recipes-devtools/python/python3-appdirs/run-ptest<br>
@@ -1,3 +1,3 @@<br>
&nbsp;#!/bin/sh<br>
&nbsp;<br>
-pytest | sed -e 's/\[100%\]//g' | sed -e 's/\.\.F/: FAIL/g' | sed -e 's/\.=
\.\./: PASS/g'<br>
+pytest -o log_cli=3Dtrue -o log_cli_level=3DINFO | sed -e 's/\[...%\]//g'|=
 sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/=
g'| awk '{if ($NF=3D=3D&quot;PASS&quot; || $NF=3D=3D&quot;FAIL&quot; || $NF=
=3D=3D&quot;SKIP&quot; || $NF=3D=3D&quot;XFAIL&quot; || $NF=3D=3D&quot;XPAS=
S&quot;){printf &quot;%s: %s\n&quot;, $NF,
 $0}else{print}}'| awk '{if ($NF=3D=3D&quot;PASS&quot; || $NF=3D=3D&quot;FA=
IL&quot; || $NF=3D=3D&quot;SKIP&quot; || $NF=3D=3D&quot;XFAIL&quot; || $NF=
=3D=3D&quot;XPASS&quot;) {$NF=3D&quot;&quot;;print $0}else{print}}'<br>
-- <br>
2.40.0<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_MW4PR11MB582276B59131CD33D22B5BA884F1AMW4PR11MB5822namp_--

