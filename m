Return-Path: <rob.woolley@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BEE8C4167B
	for <webhook@archiver.kernel.org>; Wed,  6 Dec 2023 16:57:09 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.38149.1701881827946062834
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Dec 2023 08:57:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=slBMhonq;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0704f80c78=rob.woolley@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3B6Aq0FY025854
	for <openembedded-devel@lists.openembedded.org>; Wed, 6 Dec 2023 08:57:07 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:references:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	PPS06212021; bh=GpxSfPkQBizqyfPmzVf10kzxEwNZEqWdRlA3c7oxglw=; b=
	slBMhonqhj/3D712rmHzPpi5YxMINIajUt4NlYxjnWnMW9ivrmEX85w4YV4kHhkx
	gae4tcpmwREd22oJC/nn/0JLHLsphRQ/VUUSGvs4OfaZURBABT9T15/jOb/BV+1E
	bQNk4/WahAnU/jQ/9jsPpxQoIAkQ3GXUy2CsZLr8rKNs/E+sB9phb68EFn8+cMW7
	4uoGf5qwfRR0JvqhXtophnGfSu1Ioy2qSC2pXA23Y3+lUFc96RJ1XJFnN+kpX6OQ
	E2qnD7T/096y6y0EGbLbIbU3hC+tzKdu7FMfhCzLxA0f3nNdz/yOqgY17tMzv6pJ
	lSORnvu8HxndK6nwLXYgjw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3utd2rrrm1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 06 Dec 2023 08:57:07 -0800 (PST)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.24/8.17.1.24) with ESMTP id 3B6Gv7hP016780;
	Wed, 6 Dec 2023 08:57:07 -0800
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2168.outbound.protection.outlook.com [104.47.56.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3utd2rrrm0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 06 Dec 2023 08:57:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hDr8viMzz8MRrTfTNVDpuEQ8I3Ih6Fd8x1BfUYN06IEZpIexw98vDiHN06u66gOdB5ITq9uXjajjBeCWE+DfbEUAzvKWRdvGRSo3RK3GZaq3m5rbYqdOVdbpcSXce3vqVOZEayGZB3TmnafgqaTHJr0cj/jxbbti/3d2i502dx1nIraUuFQG/piAolGAM04LkPrYi8OxKGT2xq6evL5OHyLCR3JHmiovXfCFGEvWZj9uzi8J3T0y5iS75BFkYYdcxtIkSVWxP8CHAwHg+oug5ShRQ3mXfaOAsSz0M455oCPt53gjAghLoqS811BRrbtNS1vQe/sdOaMKGeYunEODtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GpxSfPkQBizqyfPmzVf10kzxEwNZEqWdRlA3c7oxglw=;
 b=c3ynYZbIZrcNY6nS7CfiHSFvywI587eyqaoqCn3SZqKvboL3yDpdbznkSoerr21zEpoD9BNCNtb/Dn/xcQfbDv6faH4wrQwBKq3K+9J/gOwWrzmhJUQh55O97Wsk/ROBq6Va/Cm9NKVfS/7yD9OjbO42RuQFntjbH5bm7fuw2RlEeHicu06FyiDg2gFH2B+d9vAGzH0NJEE21nOBFjYPtviLJcBVcc2rKY3LniDPYmEYFTLFPDTzTTg3H/n6rPmVgJWZbfu4G8vFqxnCZRaUWDZbhGC37HNX1txN5YXHm78Tejtk74WglNU4e/uvb6gDbLrFklQD4ghKuKQjnrUHAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH8PR11MB6684.namprd11.prod.outlook.com (2603:10b6:510:1c7::6)
 by CH3PR11MB7323.namprd11.prod.outlook.com (2603:10b6:610:152::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34; Wed, 6 Dec
 2023 16:57:01 +0000
Received: from PH8PR11MB6684.namprd11.prod.outlook.com
 ([fe80::7505:b9c8:b04e:8ecf]) by PH8PR11MB6684.namprd11.prod.outlook.com
 ([fe80::7505:b9c8:b04e:8ecf%5]) with mapi id 15.20.7046.034; Wed, 6 Dec 2023
 16:57:01 +0000
From: "Woolley, Rob" <Rob.Woolley@windriver.com>
To: akuster808 <akuster808@gmail.com>,
        "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
CC: "raj.khem@gmail.com" <raj.khem@gmail.com>,
        "alex.kanavin@gmail.com"
	<alex.kanavin@gmail.com>
Subject: Re: [oe] [kirkstone][PATCH 0/2] Add sipconfig.py support to sip3
Thread-Topic: [oe] [kirkstone][PATCH 0/2] Add sipconfig.py support to sip3
Thread-Index: AQHaKD+vbC5OYw+ybUKWY98hpiQEhrCceEbd
Date: Wed, 6 Dec 2023 16:57:01 +0000
Message-ID: 
 <PH8PR11MB668464C56C2CC13722992F5BE184A@PH8PR11MB6684.namprd11.prod.outlook.com>
References: <20231202030950.3357721-1-rob.woolley@windriver.com>
 <707795c1-b2e3-4dcb-a47b-f832f80fd100@gmail.com>
In-Reply-To: <707795c1-b2e3-4dcb-a47b-f832f80fd100@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH8PR11MB6684:EE_|CH3PR11MB7323:EE_
x-ms-office365-filtering-correlation-id: 254ca5fd-36ae-4ad8-3a65-08dbf67c5df1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 XMIkI50w61wFf7KDPT45s/Lsx/aVIJ3nQW/m7JBGRFAJtWjiZha730gtONHeihce/vZ/EO/JsiyQYPGvU2llPxlxxl5Fu2E5Rm0tUzkqO0yVgHd5ff1MBolw6UJpIUKsQ6voD4TxYWAkEIAU/wU3N+d0vt3KpxcvHiTM1jBm1xbGBUflQLtNMZtCW9jshYur68FTa3HQtFxDhcY4l7rP7i9cnPb2yJjaJ61nNT7uUdT6iBr37xRRSzfDCg5YTr88ZX7QxqJhGEeXvLvexHMKtKzQW0Gj+jgkROI9o6pD0WlfQO3QzqUINplRrgOgkejmt6Bz7+I15yf0XpO4/opJWT5SDgDSVAs7YvfPsDxlPcCMBUKiDl28O/OpIIp1ma6yv4UWCZRAdmi2FbpLbcoj9S14Q1nIs2xCbjLMW31qN/wmuquC8Ew5gEIG3vKJ0Gn/LjdX6cu9xK4U3qWGIsBZiZcqCjlMysrIhlwIQ12P13lCuv1P1H71U+4eK2XAJibqYlOgKFd2noySWM3z9lyXF68Q30EDNOnJd/Dqk2XKfnGQKIOdDHHE7+bheHknqOv63AdOWoqTFTmxIhqEzXqkMohCXLZWoqZ/S8KsXN8G13G9eeNzjuAxnx//ELgpzEm2Gn+/ScxX4y/+XPoqRSIbqud6dtaphPabCzdY248l5lTsEcoyWJBTRyKbqs6FMc9Z
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB6684.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39850400004)(366004)(376002)(396003)(346002)(136003)(230273577357003)(230173577357003)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(86362001)(966005)(478600001)(7696005)(9686003)(6506007)(53546011)(71200400001)(64756008)(316002)(76116006)(54906003)(66476007)(66946007)(66556008)(8676002)(8936002)(91956017)(110136005)(4326008)(66899024)(66446008)(55016003)(52536014)(38070700009)(122000001)(83380400001)(2906002)(33656002)(5660300002)(38100700002)(26005)(41300700001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?yYNS33it1mainAlYYmdHtHBg0jHmcpC4jsXrN3VUj3h9MNcrNSNKE/ZsbX?=
 =?iso-8859-1?Q?cfgjqf49AMJKWixlD8fUzFp5Y9Dbp90w06dPnUYW32ZAMq3wJsIwaLH+hG?=
 =?iso-8859-1?Q?HkZuHIIIDv8VirSuzYOwXJAFfyQtoaDekeDJuqBSdwaK3JClDUL9P1eY5A?=
 =?iso-8859-1?Q?LGo76xjR8siQtMml2lkzxj105qzgGOJiMotydeHBwjedrlKl1IealQIYfh?=
 =?iso-8859-1?Q?60eW3lssgjkEiTz9gGDPIPRlKOWrbcyrUG+wleL/E9g1Zh/rVyFfY75C/M?=
 =?iso-8859-1?Q?IsJrnu5STrzfJpToU6dM433EskbYHQ83Egrye8SKiLHrrZtw374zItbgGT?=
 =?iso-8859-1?Q?kQuyNfXaARoCDFxCJR+we20xHdD3xzVUkTslZGAl/JSURXlkEhPDqqTNDK?=
 =?iso-8859-1?Q?VNQ4/pwDjlkrEfjVtGocMsZ9s+SeZfVNDJudMzbUpzEuk1YqZSpk2xB8x8?=
 =?iso-8859-1?Q?78RJ24xpGBP6RjxdvRMle3sEo6OrUzzfnN3TCa9v4hE3Is6sIq7H+UsJIX?=
 =?iso-8859-1?Q?Oc0UAfuHD8yIEXO37wW410MvVF9mWSDl4aGnxbAeAEFzehHJcWkqpjCVbo?=
 =?iso-8859-1?Q?QwUis0IRZ9b3SvkRKvWeDa06kVT0XCGoUAyvXaiCyDmzbEYK1aDi129vX0?=
 =?iso-8859-1?Q?MMhXE/vGy3DfxXfYogXga+YOdYSyYQZ0phyIt9esqOyRdKy8dIUBCh5MA7?=
 =?iso-8859-1?Q?WTqplo67AqfssY2vFVx18gYhPZmF0rvV7RhrF01WpyjmqpAmr3wyylAQeT?=
 =?iso-8859-1?Q?qm+8X8PviQU19dsSnoD99GGj35zXv7xcmuqdu6VfZ70l/4qdLx3EpnH3dk?=
 =?iso-8859-1?Q?oBiBrPf6sSW/Wb6w5C8+okLcgccvz2CCxuWzihjS9a9c1EMK4RPnaNCSwg?=
 =?iso-8859-1?Q?n9bkBTzTP2E9FedGlomuzPp/8/qAKPQshFESdnVKw0TLuuJQhXA7Coln3m?=
 =?iso-8859-1?Q?g/KyOkh2DlVHN2r78dMiUXm4WpS18EhaHHi1ZsyYpV90uPLGVHRwrIcu7n?=
 =?iso-8859-1?Q?C5IklqnDTOQH/8Bws5wgdZRiSYg2KIOyGCBQdM2SLN/AfylFf9LeelBIXF?=
 =?iso-8859-1?Q?LGQO03jO6G6dHUfyuTDDZ0r2GEW7f4PIZAcccbikeQ7Zbuyf4YmmQi32T9?=
 =?iso-8859-1?Q?RFdX2BxOUk4VXTcAMm0cFCdOO8pv98JbfwQOjNCPRPHSKEE8hOZGqwwTVz?=
 =?iso-8859-1?Q?0BGObviiJg3T6tbGQWciA+k5Rk18C4N0l5hw9r46cZv+vV/eYb4bkX5Qa5?=
 =?iso-8859-1?Q?hb9eWvrGw0L7I0iSQ61jCrqGroMv/lJ9bciWYP6s1dcX/hGLjd4FNmvIPK?=
 =?iso-8859-1?Q?fAx9GqbFJ2/NRxkfMeONGvCl97FODtpYBfzbyAihKE57nhCrW/HJRcpX1w?=
 =?iso-8859-1?Q?x1e8lAcO12LUqrZs+qi44ic7d3G/E6mynhdPrTcvbHrnqo8DB6x809CSs6?=
 =?iso-8859-1?Q?weey+kMwQ73KihPxfuhHgXsTTLBP/8OVb/ec2hobTR8JgA0EZ04N0Zherf?=
 =?iso-8859-1?Q?PMnEFGL8L8ibtVNJzPd2cQAWLyine1cm2OOvM3N4tRt4iJmfpypAUUh7a9?=
 =?iso-8859-1?Q?xLjwejJ4bmXtWrISvIAyyrhcESiEYySga5uW5hEil4e4q3sgRjYj0q+Cdd?=
 =?iso-8859-1?Q?WoXV53ePmzlqvWmaEfRz674phxBnAvktM0A1NqeV6tASWPo4a2M/rGBg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6684.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 254ca5fd-36ae-4ad8-3a65-08dbf67c5df1
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Dec 2023 16:57:01.4880
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kf9r+vgICCKk9JiU5kKHKF7U90wWy28cg7DowFD4vGjekOb6ZAkfZ1zVpwCH+Osu3hsRZD5NZkv/LruZK8TWJC+e0E2hf7qfSdXHY4ki6sQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7323
X-Proofpoint-GUID: Avg67nbA8RIgjKClEhFDVPOARsfsO-yN
X-Proofpoint-ORIG-GUID: BX4hYlRVmaQfxj3R9cBRGEEvtzTRSj3f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 priorityscore=1501 phishscore=0 spamscore=0 impostorscore=0 clxscore=1015
 lowpriorityscore=0 adultscore=0 suspectscore=0 mlxlogscore=822
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312060138
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Dec 2023 16:57:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107259

Hi Armin,=0A=
=0A=
Thanks for looking at this.=A0 No, I don't think we need it in master.=0A=
=0A=
Riverbank Computing changed python3-pyqt5 to only support SIP v6. (FYI I se=
nt out a separate pull request to meta-qt5 to update python-pyqt5 to 5.15.7=
. This version is the last release to use SIP v4; see=A0https://github.com/=
meta-qt5/meta-qt5/pull/546/commits/a82daf56e9c783c684da98a2996677bc1d7a439e=
)=0A=
=0A=
Langdale is the last Yocto release with the sip v4.19.23 recipe before we r=
emoved it and created a new recipe for SIP v6.=A0 Dunfell and Kirkstone are=
 the only supported releases to still use SIP v4.=A0 I did a test build of =
Dunfell with a copy of the Kirkstone recipes.=A0 The sip3, sip3-native, qtb=
ase, and python3-pyqt5 tasks all completed successfully.  I am happy to sen=
d out a Dunfell patch if you would like me to.=0A=
=0A=
Regards,=0A=
Rob=0A=
=0A=
=0A=
From:=A0akuster808 <akuster808@gmail.com>=0A=
Sent:=A0Wednesday, December 6, 2023 7:28 AM=0A=
To:=A0Woolley, Rob <Rob.Woolley@windriver.com>; openembedded-devel@lists.op=
enembedded.org <openembedded-devel@lists.openembedded.org>=0A=
Cc:=A0raj.khem@gmail.com <raj.khem@gmail.com>; alex.kanavin@gmail.com <alex=
.kanavin@gmail.com>=0A=
Subject:=A0Re: [oe] [kirkstone][PATCH 0/2] Add sipconfig.py support to sip3=
=0A=
=A0=0A=
CAUTION: This email comes from a non Wind River email account!=0A=
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.=0A=
=0A=
On 12/1/23 10:09 PM, Rob Woolley via lists.openembedded.org wrote:=0A=
> Some packages in meta-ros, like qt-gui-cpp, need sipconfig.py to be=0A=
> present in python3-sip3.=A0 Changes are required to ensure that the=0A=
> sip tools execute successfully and that paths from the host machine=0A=
> don't get included in the SIP configuration file.=0A=
=0A=
Do similar changes need to go into Master?=0A=
=0A=
>=0A=
> Rob Woolley (2):=0A=
>=A0=A0=A0 sip3: Add sipconfig.py=0A=
>=A0=A0=A0 sip3: Add py_ssize_t_clean argument=0A=
>=0A=
>=A0=A0 ...ean-argument-to-the-module-directive.patch | 17679 +++++++++++++=
+++=0A=
>=A0=A0 meta-oe/recipes-devtools/sip/sip3_4.19.23.bb=A0 |=A0=A0=A0 21 +-=0A=
>=A0=A0 2 files changed, 17699 insertions(+), 1 deletion(-)=0A=
>=A0=A0 create mode 100644 meta-oe/recipes-devtools/sip/sip3/added-the-py_s=
size_t_clean-argument-to-the-module-directive.patch=0A=
>=0A=
>=0A=
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=0A=
> Links: You receive all messages sent to this group.=0A=
> View/Reply Online (#107194): https://lists.openembedded.org/g/openembedde=
d-devel/message/107194=0A=
> Mute This Topic: https://lists.openembedded.org/mt/102930497/3616698=0A=
> Group Owner: openembedded-devel+owner@lists.openembedded.org=0A=
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub=A0=
[akuster808@gmail.com]=0A=
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=0A=
>=0A=

