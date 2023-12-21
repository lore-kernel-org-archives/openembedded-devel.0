Return-Path: <rob.woolley@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9482BC35274
	for <webhook@archiver.kernel.org>; Thu, 21 Dec 2023 15:02:20 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.52589.1703170939499729124
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Dec 2023 07:02:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=DN4p/C97;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0719eb80ae=rob.woolley@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BL9pf6C020641
	for <openembedded-devel@lists.openembedded.org>; Thu, 21 Dec 2023 15:02:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:references:in-reply-to
	:content-type:mime-version; s=PPS06212021; bh=XUlA0dKgW4+HSA0dlG
	RpQtZnAIIMcS/qNbgsN5imreI=; b=DN4p/C97pGieqZGEQDYBHg51YfxSTFWr3M
	qIDcLUhB0mgqVucoT/Y7sT/NvJAQ5/hJme9dYidr+Yo6JAUKYSkLxRXWaYR+/UVb
	tfIugTyKLaIv5+cOSYNQlH2Z5Mp92utUVqenaZn961OmJM5DDNJ9GD+s8PRvnIhZ
	DuvjYTyHWKXuFVf5uiupEl45l5EgGGPFQL56zS3tkCcK8hSq07YKEn+DOBFvsrnI
	bynjQBzzhiVzqbX1ozU2QjpRkXdvSJSPLJeMQrPX/Ts0lFDuCzhdFHs3sW+aIXsC
	FVKyhu3ukN71KHN3Xt2zCWuaWl73CJzniYZcf3UxzHWOvVrfgPjA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3v12v5xqac-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 21 Dec 2023 15:02:17 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.24/8.17.1.24) with ESMTP id 3BLF2Gjb009515;
	Thu, 21 Dec 2023 15:02:16 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3v12v5xqa9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Dec 2023 15:02:16 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mU7OKIpaJ4+bAsdUzDKyhA/890vnUYm13gvULHbwwPMCGL7/BqcY/ZbrQZEUj+naMWXJY6yyu92jgO6kYPRodNfJiMOI/xLkxw5ve90PHlII4mKCEq3TjRHk6A9/WUt8Yr3Mmmvn6PRMplkS7bBJTx3kjSvq85PHO/vDWkvq0vqmgALUbSlSo/AVyU5JWYH+x/jfpsItS9F+xbsaMA3rFHNlCOktrHGDWQu71ArDh+75bMq+EdqinbA27fpt54IjIFDkZrzozKmjUhWDG/PjWC8RDI1huIVWZO2zaNKasBUSNaChrX9XLabU8tZPcIo/yZ+JdQxFv8iCS5ANsxJawQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XUlA0dKgW4+HSA0dlGRpQtZnAIIMcS/qNbgsN5imreI=;
 b=KxziYN4rlICF6FsHP54itGMJNhdKR6aZWrUt/qVZy2looI40v6N+zIV3iWe/d02D1DzsMqRhmwfOtAUvUviHs2GPD5ObClfW/ekvjiuVNCjcxGSMNfyc0jtZHnZ6iv+woTqkxMrdFddD1/GuIKR/gLaGqAYG+E/h8U/PbzI+LFTztabeuySG0awAV0SWLiLRwNTQlTUU1b+Px1dmmVD1stG4/xlFZapnqdbsZ9pzhD/wETdz0ZzZuIRZPwrA3+dRgZucfM/ppJTTBSFWLHFP7tNC/jMP6s+AG+llqQwms6DcLng2ahb3sPRuKf5Nk5/ZakbTZxAqFKSi9azAunRMTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH8PR11MB6684.namprd11.prod.outlook.com (2603:10b6:510:1c7::6)
 by PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.18; Thu, 21 Dec
 2023 15:02:11 +0000
Received: from PH8PR11MB6684.namprd11.prod.outlook.com
 ([fe80::7505:b9c8:b04e:8ecf]) by PH8PR11MB6684.namprd11.prod.outlook.com
 ([fe80::7505:b9c8:b04e:8ecf%5]) with mapi id 15.20.7113.019; Thu, 21 Dec 2023
 15:02:10 +0000
From: "Woolley, Rob" <Rob.Woolley@windriver.com>
To: akuster808 <akuster808@gmail.com>,
        "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
CC: "raj.khem@gmail.com" <raj.khem@gmail.com>,
        "alex.kanavin@gmail.com"
	<alex.kanavin@gmail.com>
Subject: Re: [oe] [kirkstone][PATCH 0/2] Add sipconfig.py support to sip3
Thread-Topic: [oe] [kirkstone][PATCH 0/2] Add sipconfig.py support to sip3
Thread-Index: AQHaKD+vbC5OYw+ybUKWY98hpiQEhrCceEbdgBdzqro=
Date: Thu, 21 Dec 2023 15:02:10 +0000
Message-ID: 
 <PH8PR11MB6684640212C8DBE67ABC1E5BE195A@PH8PR11MB6684.namprd11.prod.outlook.com>
References: <20231202030950.3357721-1-rob.woolley@windriver.com>
 <707795c1-b2e3-4dcb-a47b-f832f80fd100@gmail.com>
 <PH8PR11MB668464C56C2CC13722992F5BE184A@PH8PR11MB6684.namprd11.prod.outlook.com>
In-Reply-To: 
 <PH8PR11MB668464C56C2CC13722992F5BE184A@PH8PR11MB6684.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH8PR11MB6684:EE_|PH7PR11MB6522:EE_
x-ms-office365-filtering-correlation-id: 2203bef9-eb55-466f-b9a4-08dc0235ce7e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 cUF9wMPL3Uu73e/QZhK6WpQ5BD9v1SXwOMr5YH3PAse4dFNmQ+oxoXgMktNprj4VPVwkAS8r0p20MyYY1x+kJMhF1s+maBNl95WKQV8m/tmHrNzbfZXlrPNjaBzmAfev+LIm0cP+Ees+sCKizizVDxG/oNhpfKwbpv2MbFK8nUHahLOADK6HWUSxfqnv4Ba4H7G0+NDgvK0CKXdzeHePo3Dra1XvnuPebGHC9kgcx9KskfgjYbtGmlPdt8O8YQ+KVm9gIf+ukeTE5IGW9Fzmwm6Y5unh7uTUQKJM+lr1BgtIOOjPDxSHJHqsRteTr5iUgIBPpLjQWC7MRb4fNOTgF5FBjkl+i2M/gA1rzX21RnuwTiR6KpYa3fF6y2EtDayRrbeQBzAApkSUGWpfojgtK7GJ1llmGhv9KS1VsZWtLWljuUMs68o4qFiT/skiyPSX8sIgSXEvWBdSo09YIfdtC3eJt3//K5OlRvQaj9ajw11Ift1h0tgoc+yfGNez1j6KvanIDmD1LjQYzxTPFCNpja2uW4CKB8krG9M/BlCdZVzSDXcwuo0QZ8IxLvru5ZqvFBYSbuoOfte4d1UkVFV3pRMyDs0ptC+2N8AIByuyAoAi0UD2Ke6uNQ7oGux56dirO8D/jlUDadWWpsOwehHG/w==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB6684.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(346002)(376002)(39850400004)(136003)(230922051799003)(230273577357003)(230173577357003)(186009)(451199024)(1800799012)(64100799003)(4326008)(54906003)(316002)(66946007)(1015004)(76116006)(64756008)(66476007)(66556008)(66446008)(2906002)(8936002)(8676002)(71200400001)(110136005)(91956017)(966005)(478600001)(55016003)(52536014)(122000001)(38100700002)(9686003)(19627405001)(83380400001)(38070700009)(5660300002)(33656002)(41300700001)(166002)(66899024)(53546011)(6506007)(26005)(7696005)(86362001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?IGp9GSN7xVGilo4qubABYEbrsVrm9gRHsw0lMYxQr5nN8UvhPYjqCbXJDX?=
 =?iso-8859-1?Q?WuS72jQemcCq+c19lAa7VW/Az0wWuVYLeumYDTkSHjZsA8sohhpRk90sDx?=
 =?iso-8859-1?Q?HN39xMesD84tuYATPkOuIdcanIp+46yNJMWoZGvkBGocAioVNfrCEmyJdj?=
 =?iso-8859-1?Q?ACiOoiTxdGaErvG8VRLOukus8JV69agFA2lM9GwZq9uj0LDCXhr/ZqdFDc?=
 =?iso-8859-1?Q?MbRkIOVfJMIhsVT79uZxchXMXSa/7lt18FCfaKR1flfHEo9vNofoOgjzqL?=
 =?iso-8859-1?Q?TscoFVFmxVGlntVRr+ycMf7Rg/iWA1NlR2DsomjVYuoXdV9iiazNJJrojG?=
 =?iso-8859-1?Q?tMeIl/IMNYgGGEEN4yPlzLCqVCu++q7z3hxYC2Ca9T0JslYwxsodcBIxta?=
 =?iso-8859-1?Q?YmothSd1cPB7ECrMvAy2w4rhcxJMmfsUGvoSlvExVVgZ6cm8P67FAAewJH?=
 =?iso-8859-1?Q?LibNkDRqAihs/WkH2xs5S60N6LHgcLDW6F8OvXUlcYU0mMOZYFp8TdD9kO?=
 =?iso-8859-1?Q?92AbawYdyK2Dx+S4A0o3EhV+O4W0ehtt+IVXyLRawxgVcmK0bYMwYCZqAj?=
 =?iso-8859-1?Q?RoKkr5snWh/7qwTKz2WHPlVnC5oggD/i5CRgBUQE009Bm61tWm6yUuhCwm?=
 =?iso-8859-1?Q?2swHaYNdJhG7DWWcn8rvjSlfinNjVak9mRzXC1b10TSaACoYKHWB9gtG8z?=
 =?iso-8859-1?Q?batQpiaEdHjWfxCGQbfZ6Ng30UKSaIX24YBhJnYSZDs8LdNyu0fWOIFxOX?=
 =?iso-8859-1?Q?kaHY7Ftckqs1fxu8uIYMPLhqcu2VNnVOpAArfY/bscEdHI6qX9WTU9OWWr?=
 =?iso-8859-1?Q?+1nXE8HHnf45/MbFGfnzAjYagDHCJhYZyyLuvhfHvz6bJ6JSdikYNTRP43?=
 =?iso-8859-1?Q?NRMNlh/O9wCbBS2R3S3jy4q+Acoq3FV0MJZ+ynJRDsYMkI1LkVliorFPuo?=
 =?iso-8859-1?Q?fpOb72QLXx4urPo010zZwgkaw7uCsiqIUmkymWOvW4eiORmLX8uaG501rD?=
 =?iso-8859-1?Q?p9DeBJhJZlrDN8iMV4E1GIWPF+u9J4VspvOBtens/qxNyEzJdMh08s32Cc?=
 =?iso-8859-1?Q?glUhdOViP3bE6BTlLC+D3zj6D016L9GUl1rl4kAygZzu/vc0aLaG/21nC7?=
 =?iso-8859-1?Q?DipVat6O+kLKWbuBGCj1p2Zl+r0ENp081M7moTeAdW23Uwe7gIAnlYEXuD?=
 =?iso-8859-1?Q?goZSoVREk7twQYSvkI3GR+hfEZSqw1GON13vx83499nM+B/3NXh6/HMFnq?=
 =?iso-8859-1?Q?UL+fEKspsDSoppnF2+TzVbXGTPHMcPpD/qhRfqwvDnwaliCYmVurrH0UNi?=
 =?iso-8859-1?Q?80c54JzOZBUCrJmuLfAyREYPHJfA9q5MTPBlrTYDXpK3uidXHv7Vo31iHS?=
 =?iso-8859-1?Q?UuGwot772TnzdaJg6+7JoLbNhYfeOK6ICQXgWeavCrylV/DoxCem5ln+Fx?=
 =?iso-8859-1?Q?7g0u6ejRfMm08r4iJZFndF8mZ3K5xS1S8dyupYuXtRm4qKTvcGhqGyKEsJ?=
 =?iso-8859-1?Q?3bI4g92y4e9fnUo5sG2OK8TOLm5LnC4OB1pAY090hxC05DzWHb5KtXsvdI?=
 =?iso-8859-1?Q?EcSZZlprXr+xFpFrPFixV4z+jm8ueqBPcA/POV9CyKJ8rx/uXNpE06tFdR?=
 =?iso-8859-1?Q?dZeXSCs7njmhpq82LRqd6a3VYIgiOrM62J?=
Content-Type: multipart/alternative;
	boundary="_000_PH8PR11MB6684640212C8DBE67ABC1E5BE195APH8PR11MB6684namp_"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6684.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2203bef9-eb55-466f-b9a4-08dc0235ce7e
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Dec 2023 15:02:10.0123
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: a2uU4+XE43ji7AHHLqJCey8sbjwwcO51w9RQQ+I+mbf65ZLWfF2utMV5Y7Fa45q76YXaryYg1uym/vGMkzzhcPTLgw35Soza8401mxf/N7A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6522
X-Proofpoint-ORIG-GUID: 6sBpF0w9_py_dulKoEgW1ExvwQ1lBBzq
X-Proofpoint-GUID: qPgRFMrn_vuPUD2fHzjE4KTOqhpz4o3g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 impostorscore=0 phishscore=0 bulkscore=0 suspectscore=0 mlxlogscore=999
 spamscore=0 adultscore=0 lowpriorityscore=0 mlxscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2311290000
 definitions=main-2312210112
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 Dec 2023 15:02:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107714

--_000_PH8PR11MB6684640212C8DBE67ABC1E5BE195APH8PR11MB6684namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Armin,

Is there anything else I can provide?  I'm happy to do any additional testi=
ng if it helps.

Regards,
Rob

________________________________
From: Woolley, Rob <Rob.Woolley@windriver.com>
Sent: Wednesday, December 6, 2023 11:57 AM
To: akuster808 <akuster808@gmail.com>; openembedded-devel@lists.openembedde=
d.org <openembedded-devel@lists.openembedded.org>
Cc: raj.khem@gmail.com <raj.khem@gmail.com>; alex.kanavin@gmail.com <alex.k=
anavin@gmail.com>
Subject: Re: [oe] [kirkstone][PATCH 0/2] Add sipconfig.py support to sip3

Hi Armin,

Thanks for looking at this.  No, I don't think we need it in master.

Riverbank Computing changed python3-pyqt5 to only support SIP v6. (FYI I se=
nt out a separate pull request to meta-qt5 to update python-pyqt5 to 5.15.7=
. This version is the last release to use SIP v4; see https://github.com/me=
ta-qt5/meta-qt5/pull/546/commits/a82daf56e9c783c684da98a2996677bc1d7a439e)

Langdale is the last Yocto release with the sip v4.19.23 recipe before we r=
emoved it and created a new recipe for SIP v6.  Dunfell and Kirkstone are t=
he only supported releases to still use SIP v4.  I did a test build of Dunf=
ell with a copy of the Kirkstone recipes.  The sip3, sip3-native, qtbase, a=
nd python3-pyqt5 tasks all completed successfully.  I am happy to send out =
a Dunfell patch if you would like me to.

Regards,
Rob


From: akuster808 <akuster808@gmail.com>
Sent: Wednesday, December 6, 2023 7:28 AM
To: Woolley, Rob <Rob.Woolley@windriver.com>; openembedded-devel@lists.open=
embedded.org <openembedded-devel@lists.openembedded.org>
Cc: raj.khem@gmail.com <raj.khem@gmail.com>; alex.kanavin@gmail.com <alex.k=
anavin@gmail.com>
Subject: Re: [oe] [kirkstone][PATCH 0/2] Add sipconfig.py support to sip3

CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.

On 12/1/23 10:09 PM, Rob Woolley via lists.openembedded.org wrote:
> Some packages in meta-ros, like qt-gui-cpp, need sipconfig.py to be
> present in python3-sip3.  Changes are required to ensure that the
> sip tools execute successfully and that paths from the host machine
> don't get included in the SIP configuration file.

Do similar changes need to go into Master?

>
> Rob Woolley (2):
>    sip3: Add sipconfig.py
>    sip3: Add py_ssize_t_clean argument
>
>   ...ean-argument-to-the-module-directive.patch | 17679 ++++++++++++++++
>   meta-oe/recipes-devtools/sip/sip3_4.19.23.bb  |    21 +-
>   2 files changed, 17699 insertions(+), 1 deletion(-)
>   create mode 100644 meta-oe/recipes-devtools/sip/sip3/added-the-py_ssize=
_t_clean-argument-to-the-module-directive.patch
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#107194): https://lists.openembedded.org/g/openembedde=
d-devel/message/107194
> Mute This Topic: https://lists.openembedded.org/mt/102930497/3616698
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [a=
kuster808@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

--_000_PH8PR11MB6684640212C8DBE67ABC1E5BE195APH8PR11MB6684namp_
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
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Hi Armin,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Is there anything else I can provide?&nbsp; I'm happy to do any additional =
testing if it helps.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Regards,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Rob</div>
<div id=3D"appendonsend"></div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
<br>
</div>
<hr style=3D"display: inline-block; width: 98%;">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><span style=3D"font-family: Calibri, =
sans-serif; font-size: 11pt; color: rgb(0, 0, 0);"><b>From:</b>&nbsp;Woolle=
y, Rob &lt;Rob.Woolley@windriver.com&gt;<br>
<b>Sent:</b>&nbsp;Wednesday, December 6, 2023 11:57 AM<br>
<b>To:</b>&nbsp;akuster808 &lt;akuster808@gmail.com&gt;; openembedded-devel=
@lists.openembedded.org &lt;openembedded-devel@lists.openembedded.org&gt;<b=
r>
<b>Cc:</b>&nbsp;raj.khem@gmail.com &lt;raj.khem@gmail.com&gt;; alex.kanavin=
@gmail.com &lt;alex.kanavin@gmail.com&gt;<br>
<b>Subject:</b>&nbsp;Re: [oe] [kirkstone][PATCH 0/2] Add sipconfig.py suppo=
rt to sip3</span>
<div>&nbsp;</div>
</div>
<div><span style=3D"font-size: 11pt;">Hi Armin,<br>
<br>
Thanks for looking at this.&nbsp; No, I don't think we need it in master.<b=
r>
<br>
Riverbank Computing changed python3-pyqt5 to only support SIP v6. (FYI I se=
nt out a separate pull request to meta-qt5 to update python-pyqt5 to 5.15.7=
. This version is the last release to use SIP v4; see
<a href=3D"https://github.com/meta-qt5/meta-qt5/pull/546/commits/a82daf56e9=
c783c684da98a2996677bc1d7a439e)" id=3D"OWA435bd3ce-43e2-876e-8829-5e5845ecb=
e2c" class=3D"OWAAutoLink" data-auth=3D"NotApplicable" data-loopstyle=3D"li=
nkonly">
https://github.com/meta-qt5/meta-qt5/pull/546/commits/a82daf56e9c783c684da9=
8a2996677bc1d7a439e)</a><br>
<br>
Langdale is the last Yocto release with the sip v4.19.23 recipe before we r=
emoved it and created a new recipe for SIP v6.&nbsp; Dunfell and Kirkstone =
are the only supported releases to still use SIP v4.&nbsp; I did a test bui=
ld of Dunfell with a copy of the Kirkstone
 recipes.&nbsp; The sip3, sip3-native, qtbase, and python3-pyqt5 tasks all =
completed successfully.&nbsp; I am happy to send out a Dunfell patch if you=
 would like me to.<br>
<br>
Regards,<br>
Rob<br>
<br>
<br>
From:&nbsp;akuster808 &lt;akuster808@gmail.com&gt;<br>
Sent:&nbsp;Wednesday, December 6, 2023 7:28 AM<br>
To:&nbsp;Woolley, Rob &lt;Rob.Woolley@windriver.com&gt;; openembedded-devel=
@lists.openembedded.org &lt;openembedded-devel@lists.openembedded.org&gt;<b=
r>
Cc:&nbsp;raj.khem@gmail.com &lt;raj.khem@gmail.com&gt;; alex.kanavin@gmail.=
com &lt;alex.kanavin@gmail.com&gt;<br>
Subject:&nbsp;Re: [oe] [kirkstone][PATCH 0/2] Add sipconfig.py support to s=
ip3<br>
&nbsp;<br>
CAUTION: This email comes from a non Wind River email account!<br>
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.<br>
<br>
On 12/1/23 10:09 PM, Rob Woolley via lists.openembedded.org wrote:<br>
&gt; Some packages in meta-ros, like qt-gui-cpp, need sipconfig.py to be<br=
>
&gt; present in python3-sip3.&nbsp; Changes are required to ensure that the=
<br>
&gt; sip tools execute successfully and that paths from the host machine<br=
>
&gt; don't get included in the SIP configuration file.<br>
<br>
Do similar changes need to go into Master?<br>
<br>
&gt;<br>
&gt; Rob Woolley (2):<br>
&gt;&nbsp;&nbsp;&nbsp; sip3: Add sipconfig.py<br>
&gt;&nbsp;&nbsp;&nbsp; sip3: Add py_ssize_t_clean argument<br>
&gt;<br>
&gt;&nbsp;&nbsp; ...ean-argument-to-the-module-directive.patch | 17679 ++++=
++++++++++++<br>
&gt;&nbsp;&nbsp; meta-oe/recipes-devtools/sip/sip3_4.19.23.bb&nbsp; |&nbsp;=
&nbsp;&nbsp; 21 +-<br>
&gt;&nbsp;&nbsp; 2 files changed, 17699 insertions(+), 1 deletion(-)<br>
&gt;&nbsp;&nbsp; create mode 100644 meta-oe/recipes-devtools/sip/sip3/added=
-the-py_ssize_t_clean-argument-to-the-module-directive.patch<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#107194): <a href=3D"https://lists.openembedded.org=
/g/openembedded-devel/message/107194" id=3D"OWA515e1740-05ad-152c-6ec4-fc45=
dac4e7e5" class=3D"OWAAutoLink" data-auth=3D"NotApplicable" data-loopstyle=
=3D"linkonly">
https://lists.openembedded.org/g/openembedded-devel/message/107194</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/10293049=
7/3616698" id=3D"OWAc294a011-6ccf-082a-a25d-c828f88da418" class=3D"OWAAutoL=
ink" data-auth=3D"NotApplicable" data-loopstyle=3D"linkonly">
https://lists.openembedded.org/mt/102930497/3616698</a><br>
&gt; Group Owner: openembedded-devel+owner@lists.openembedded.org<br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
devel/unsub" id=3D"OWA94bf9a54-b7e2-64a7-9524-26305fa3e748" class=3D"OWAAut=
oLink" data-auth=3D"NotApplicable" data-loopstyle=3D"linkonly">
https://lists.openembedded.org/g/openembedded-devel/unsub</a>&nbsp;[akuster=
808@gmail.com]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;</span></div>
</body>
</html>

--_000_PH8PR11MB6684640212C8DBE67ABC1E5BE195APH8PR11MB6684namp_--

