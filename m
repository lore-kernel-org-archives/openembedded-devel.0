Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web09.4137.1628132138663891142
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Aug 2021 19:55:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=JoyBWIxu;
 spf=pass (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=38514ef0f4=mingli.yu@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1752TISn002667
	for <openembedded-devel@lists.openembedded.org>; Thu, 5 Aug 2021 02:55:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 mime-version; s=PPS06212021;
 bh=b93vgPFoDek3Aw+yN6OtOpJoxbOp3+RpG3xPQ3pg2wI=;
 b=JoyBWIxuac/q+FsKHt+79bJD6Q5S8L2zkhFjgeGAdsRDD8TSLIU2PP1SaypO8iY/GK14
 YfGGxvLujqVwcEnAGbT7iBa/dtVsmZff/D6nE2WkIuLAgyKvaRTtwK9pTjJmivv9ySOA
 aC9hQBHgiVTgbttNuGYb4eEO0/7UlSPNosyt+FqSyRepuy6B13U3LnDK5LMZ3peRG3WV
 Uadag8KeiVNJfyZim8LGHPMCDcPCjnfdsNr0CJlWpq0CqAvwHVJ3q/wc0EFdbb7DdPei
 JjnDZRfg2j42Wev/1fICzq6C1gUWrBQtwmbJMOIf7iohRkAq2A4c7GO+SjaIwfMxq0QZ tQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com with ESMTP id 3a7w718dfy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 05 Aug 2021 02:55:37 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1752pKiV009419
	for <openembedded-devel@lists.openembedded.org>; Thu, 5 Aug 2021 02:55:37 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2171.outbound.protection.outlook.com [104.47.57.171])
	by mx0a-0064b401.pphosted.com with ESMTP id 3a7w718dfx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Aug 2021 02:55:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C5OwjFECNuxdUT7YsQN/JgSUQQSa6u6YlOxGwmxXIwNKgnuxBrCZbLmo7i7QCO3VnAq53oOPt5MO5H13rtigtE3jgSXPEk1ccGFkGHhTvAzPAWlpFbZE4gruFDWT4PlqFT2Yg3UsufDgdlREPXTHPpdJgSJg+x20lvwZfg9rV9MqaCL8o2Aq0I7UGdInaSuhxDuzxUwwR4abZ6RsGzkRIRfl8Vz7eWNpkI3cAsjYZdCiI78vMKVaRr0JwjT0MzdPusdwNfeG0QbWcOx+aXM7A87Gg5k/eg5CwQLt4ZaAowi1ejSnMVwthf1JXr6vkyIl/Upwt3JOS00GSReOj9qntQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b93vgPFoDek3Aw+yN6OtOpJoxbOp3+RpG3xPQ3pg2wI=;
 b=VkzNVgfD+u9G4S6UfU32+/FWMD4WbVw7UkCljULWgdyY3tCsOhxNKh9A9YKMgyRLhkZqbKmLmipQLjSgdbhbeKedOe0ktSIFyHNUZb9CrD1PXzYAkQFvXK0y1Ro3tBSXbVZ2KczNS5lxr8jWCkpyvyuHU6pQhNjGXAKTStA0sQRUGk1JiD/DvnOzAM7HL0iNvRtQvC/UhSOUxJWJJru1JrAT44sIdjoQrCBk99QwA9KtsRfo5C8PMi5xJrs9N4gnCPOdZ7ho2P85whgsO8xdVGPBTiiaLiN13jVI8e6K71AWcAfPIVH3UBVETNgGdTkK40Gkz9rOx3UFe0ai6TiPIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 by MW3PR11MB4586.namprd11.prod.outlook.com (2603:10b6:303:5e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.20; Thu, 5 Aug
 2021 02:55:35 +0000
Received: from CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::b9f0:8cd5:8e02:ec8e]) by CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::b9f0:8cd5:8e02:ec8e%4]) with mapi id 15.20.4373.026; Thu, 5 Aug 2021
 02:55:35 +0000
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: Khem Raj <raj.khem@gmail.com>
CC: akuster808 <akuster808@gmail.com>,
        "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-oe][hardknott][PATCH] mariadb: Update SRC_URI
Thread-Topic: [oe] [meta-oe][hardknott][PATCH] mariadb: Update SRC_URI
Thread-Index: 
 AQHXiPLQtgYQe+wE3kGtNuvU8+Y+SqtjX8+AgADSZcaAAALmgIAAAURsgAABqgCAAACIuw==
Date: Thu, 5 Aug 2021 02:55:35 +0000
Message-ID: 
 <CO1PR11MB5009E8D3DD5972E9C93E7A15F1F29@CO1PR11MB5009.namprd11.prod.outlook.com>
References: <16959244EFE5AD42.32573@lists.openembedded.org>
 <7df92ec1-743d-7b45-2bff-807ad3314c13@windriver.com>
 <19a36bf6-c3fb-bd5f-a95b-4c1adb4ec9df@gmail.com>
 <CO1PR11MB500988659DDA01C7B1B713C4F1F29@CO1PR11MB5009.namprd11.prod.outlook.com>
 <CAMKF1sqgy4PmVTbq0_Fk+=yvJgd3L4gK1h=LUX4Oz33V7F=+9Q@mail.gmail.com>
 <CO1PR11MB500946DFBAA512C2B2D597FCF1F29@CO1PR11MB5009.namprd11.prod.outlook.com>,<544feeb0-7c5b-2acf-3b12-0e0fd361fbc3@gmail.com>
In-Reply-To: <544feeb0-7c5b-2acf-3b12-0e0fd361fbc3@gmail.com>
Accept-Language: en-US, en-AS, zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=windriver.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 46587f72-2014-4af2-6344-08d957bc7f7f
x-ms-traffictypediagnostic: MW3PR11MB4586:
x-microsoft-antispam-prvs: 
 <MW3PR11MB4586E2F8FB3B12DF1AC0C05CF1F29@MW3PR11MB4586.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 D6d98ihS6EJnBPrJjL5ZONeiHEwV4BSfiziUrm3tKM2/jslD0nY/4Yks2sGo9OCAvmmFw9ent/sHAGIXwJdrbwFTa0WUaTkyDpz27xNz7mTzJIA4KT4tppscIq4USuZJ/KdUC9FW0XA278lrDZRHiojNKzJGzJ+TBkGIfCXBT+RFEQc4TTQidpvzr0tgSlc3LBQ3OVWa6rNbP1z6M5tD/VKNhY3xtGXsZ5Jtc6JOAsLOrwQ4Vcc3yIVTES3PNm7iihEVUMJcDNuxYhWfKjAqhBJ/dG8x1WVbwURpr4efs3vyUCJFajfOWkvA1pRETm8T6Q3AnMi5G3KsOump7dDfcsyS7a4rtLS6fYcJW9kScJDUqCytWOAbFC/cGiV5WQlQPWvYZMkYhzUqI8Dnciz9l2XuJvSmrHuvA7ZOeftAqmgAbMyoCdNGjua3PXNNAIehu9EIQbsNVbHG30K7syedzHFXass2KbXvzbPDRqfUkunhYjm5ncVsdtdjHejju7d7Z03BVApwAJOtJgE6klvu1Pgc6iIXTWhYqQBlToF7uEhx6Wrne3TzbUm4v4NFldCTZ2HVgvkuF4LI8E02EHKU7I7Oenb4fJPAFuxUjO+Xdp3R9oTuRTVKWIayGPCgt+gab5+LAfKgO5T+fQheRUa0ZZL0h6kfAp7uNqWxqg1BXMR8CGYdsO1LmcrOhYp5LHPlfauPvO2pX7IxBR2BlcAlFJqhjI4aAejzwaXfwKQx2XkYQ/+1C8aKZDhOGcfAYALStQrRlc6r4kPBguZfrkuNEuItVmmMgKD8Qb6yzeSvOVn+habaS8pvzGh5jgW4Sd7g7mRIkWYvWFK2eXIlSfYMfPMcEXGDTV8jCLGBe7tvRCw=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5009.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(39850400004)(396003)(366004)(346002)(83380400001)(5660300002)(66476007)(55016002)(26005)(66556008)(64756008)(66946007)(9686003)(8676002)(166002)(66446008)(4326008)(54906003)(6916009)(186003)(76116006)(91956017)(33656002)(122000001)(316002)(38100700002)(52536014)(7696005)(966005)(8936002)(6506007)(38070700005)(478600001)(2906002)(53546011)(19627405001)(71200400001)(18265965003)(86362001)(15650500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?FBcz3K2K+rBHWe7lCvtElAyVu9ZvmZbJgoltZroJ8IYalH+GAXgpzeGup14Z?=
 =?us-ascii?Q?9+5FkXfpU8aSHprk15vS4UfQGaO2H1m+6qdUKEBbERqikeRbCieOtr65k+Rx?=
 =?us-ascii?Q?RoMQ4qjc9xigrzaHvnBzik57iuT5Yw8auVq/NMbdnnLRQ0yfmYDFhbqJvGuU?=
 =?us-ascii?Q?BJ8r8UfdR1B8rQVhPmIj63qfSJH/63MMV3hQpOXxIuFnL5JniP5ItEbctF3S?=
 =?us-ascii?Q?/5GntFaiUE+vdUx+BS+zRd3I6HA9wu/0Fcw4fzdSzUZB96TNHy2N0ax0A5D0?=
 =?us-ascii?Q?4RgmZIKhr7V0OQo2svTvZAoNMGldhxIudk/w1Kw02+feDaA3RJtp8cR1d/Lf?=
 =?us-ascii?Q?D+BjMXhzvffkwf6hPV/s+JSl4Der0huuuq+vgNnHhfoXZkYzpkIK7jWdv7xJ?=
 =?us-ascii?Q?NN/FhKbh7d+rIylslBBhMAlb11XTc9GsTw8RU93bm8Bnzy00btwZ+Z2E+Xa4?=
 =?us-ascii?Q?WnzjBr0Sz4gJbtM+s5eigpR4b3+76qUzZUYQ6rXlKHDEMIUCCUyB3X1wEqVx?=
 =?us-ascii?Q?ev/SJALJBVHSZnh22LjuApduDsPBZKNMp2HXxxn8DGClOFYiqcmdlV1BgyTd?=
 =?us-ascii?Q?kBXTEqx5nGbaGLZAdwYo61j9BVZQI0uNjjbuASUc9s8+KASMcOyIVPXqwSWw?=
 =?us-ascii?Q?+XzlPfzyweTTa+CY2/z3LNzQT7NWIxnY+6DbLRxoOkPwO65Yug2tMIh6lz87?=
 =?us-ascii?Q?FxYxW3i/pVsB+mRGHAt60DlnI1XJRq0EwvrjNBAv5Wbp0/7Q6Ipu5zVFtVrE?=
 =?us-ascii?Q?hvebBgwEHVuZCP5DU5IB9QfOWUv/E0D57cSYvnxjZvCpL8Xx2l9EHNZVeE3a?=
 =?us-ascii?Q?jPka4gt7Rs+XFYqCx6KpslO1HEimVKrhmK/45Bem3txgo31EeLc/wlLiAcT1?=
 =?us-ascii?Q?KMJzeUEb2Rf1WYZoep2uSyuOmy6WxPzFb3nJqlgwoR2zfwUkRzE/oCPO2pry?=
 =?us-ascii?Q?Fy9m5zperJ7JPuW1+9BiHSoZOn5QhhZ+dl9mvapOSA8ukj7p18z8cP3moMSW?=
 =?us-ascii?Q?Fsmqf2Mrv8txK7lfpBiLCm2/J9WTXupbXpZiYhbmKzk5iRDTiGl/wf/MvZUn?=
 =?us-ascii?Q?jTSQ94kMBjHtYMKZHRz8+z8Ogym2srbtPKsOaskN+KMOQUXiVL32FEO+B6vD?=
 =?us-ascii?Q?inDNs7San1PV+N2Ng5Jnp4tVF8HL6TrzHcOOgozXulN3yR/P7ArGGDp5fW6R?=
 =?us-ascii?Q?J+QXsviops8VfkKtDXWtgygj0WPeA2DtPpXPtRMEaCDg/Co94wkgCzx7kJbI?=
 =?us-ascii?Q?jslFk24Ailk1lmgFT+SEleDxcppwxvg63UD4eL5hzguJTcNsgjomZSPEmI3q?=
 =?us-ascii?Q?dh0=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5009.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46587f72-2014-4af2-6344-08d957bc7f7f
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2021 02:55:35.3432
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: d5c7DGI2zX/7sAfZW4KL0HuE5Cy9E+yLmePOM7ZDFNR0tlxqz6xWFcw4qUAazdhBdv6cl9ugtctNXFWUn6BfWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4586
X-Proofpoint-ORIG-GUID: Kxilldf4j6DWbBvhpayYKzkb_5JcdWVb
X-Proofpoint-GUID: xIzACmL9JKKE4JEWnnUYlS-X62Lys14k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-08-04_08,2021-08-04_03,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 mlxlogscore=999 suspectscore=0 clxscore=1015
 mlxscore=0 malwarescore=0 adultscore=0 priorityscore=1501 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108050015
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_CO1PR11MB5009E8D3DD5972E9C93E7A15F1F29CO1PR11MB5009namp_"

--_000_CO1PR11MB5009E8D3DD5972E9C93E7A15F1F29CO1PR11MB5009namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Yes, https://archive.mariadb.org/${BP}/source/${BP}.tar.gz is just the one =
we want to use in the patch.

Thanks,
________________________________
From: Khem Raj <raj.khem@gmail.com>
Sent: Thursday, August 5, 2021 10:52
To: Yu, Mingli <Mingli.Yu@windriver.com>
Cc: akuster808 <akuster808@gmail.com>; openembedded-devel@lists.openembedd=
ed.org <openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-oe][hardknott][PATCH] mariadb: Update SRC_URI

[Please note: This e-mail is from an EXTERNAL e-mail address]

On 8/4/21 7:48 PM, Yu, Mingli wrote:
> Hi Khem,
>
> The one we want to update is the persistent archive and also send a
> patch to master.
>

Can we point the SRC_URI at
https://archive.mariadb.org/${BP}/source/${BP}.tar.gz ?


> Thanks,
> ------------------------------------------------------------------------
> *From:* Khem Raj <raj.khem@gmail.com>
> *Sent:* Thursday, August 5, 2021 10:42
> *To:* Yu, Mingli <Mingli.Yu@windriver.com>
> *Cc:* akuster808 <akuster808@gmail.com>;
> openembedded-devel@lists.openembedded.org
> <openembedded-devel@lists.openembedded.org>
> *Subject:* Re: [oe] [meta-oe][hardknott][PATCH] mariadb: Update SRC_URI
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> On Wed, Aug 4, 2021 at 7:36 PM Yu, Mingli <mingli.yu@windriver.com> wrot=
e:
>>
>> Hi Armin,
>>
>> Though the do_fetch issue is gone after upgrade mariadb to 10.5.11, but=
 after 10.5.12 comes out, the issue will be there again if we don't upgrade=
 timely.
>>
>> Considering the previous URL only stores the latest tar ball and the up=
dated one stores all the tar balls. It's better use the updated one.
>
> Dont we have some persistent archive location to point to ?
> secondly, we should put the tarballs on oe source mirror for fall back.
>
>>
>> Thanks,
>> ________________________________
>> From: akuster808 <akuster808@gmail.com>
>> Sent: Wednesday, August 4, 2021 21:58
>> To: Yu, Mingli <Mingli.Yu@windriver.com>; openembedded-devel@lists.open=
embedded.org <openembedded-devel@lists.openembedded.org>
>> Subject: Re: [oe] [meta-oe][hardknott][PATCH] mariadb: Update SRC_URI
>>
>> [Please note: This e-mail is from an EXTERNAL e-mail address]
>>
>> On 8/3/21 10:43 PM, Yu, Mingli wrote:
>> > Ping.
>> >
>> > Thanks,
>> >
>> > On 7/27/21 2:32 PM, Yu, Mingli wrote:
>> >> From: Mingli Yu <mingli.yu@windriver.com>
>> >>
>> >> Fixes:
>> >> WARNING: mariadb-10.5.9-r0 do_fetch: Failed to fetch URL
>> >> https://downloads.mariadb.org/interstitial/mariadb-10.5.9/source/mar=
iadb-10.5.9.tar.gz
> <https://downloads.mariadb.org/interstitial/mariadb-10.5.9/source/mariad=
b-10.5.9.tar.gz>,
>> >> attempting MIRRORS if available
>>
>> Mariadb has been updated to 10.5.11. Are you still seeing a d/l issue?
>>
>> -armin
>> >>
>> >> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
>> >> ---
>> >>   meta-oe/recipes-dbs/mysql/mariadb.inc | 2 +-
>> >>   1 file changed, 1 insertion(+), 1 deletion(-)
>> >>
>> >> diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc
>> >> b/meta-oe/recipes-dbs/mysql/mariadb.inc
>> >> index 2974341bf..e8ff41461 100644
>> >> --- a/meta-oe/recipes-dbs/mysql/mariadb.inc
>> >> +++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
>> >> @@ -4,7 +4,7 @@ SECTION =3D "libs"
>> >>   LICENSE =3D "GPLv2"
>> >>   LIC_FILES_CHKSUM =3D
>> >> "file://COPYING;md5=3Db1becf0cfa3366e0f4d854d1d264f311
> <file://COPYING;md5=3Db1becf0cfa3366e0f4d854d1d264f311>"
>> >>   -SRC_URI =3D
>> >> "https://downloads.mariadb.org/interstitial/${BP}/source/${BP}.tar.g=
z \
>> >> +SRC_URI =3D "https://archive.mariadb.org/${BP}/source/${BP}.tar.gz =
\
>> >>              file://my.cnf <file://my.cnf> \
>> >>              file://mysqld.service <file://mysqld.service> \
>> >>              file://install_db.service <file://install_db.service> \
>> >>
>> >>
>> >>
>> >>
>> >>
>>
>>
>>=20
>>

--_000_CO1PR11MB5009E8D3DD5972E9C93E7A15F1F29CO1PR11MB5009namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii=
">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-b=
ottom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0);">
<font size=3D"2"><span style=3D"font-size:11pt">Yes, <a href=3D"https://ar=
chive.mariadb.org/${BP}/source/${BP}.tar.gz" target=3D"_blank" rel=3D"noope=
ner noreferrer" data-auth=3D"NotApplicable" data-linkindex=3D"0">
https://archive.mariadb.org/${BP}/source/${BP}.tar.gz</a></span></font> is=
 just the one we want to use in the patch.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0);">
Thanks,<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" s=
tyle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Khem Raj &lt;raj.khe=
m@gmail.com&gt;<br>
<b>Sent:</b> Thursday, August 5, 2021 10:52<br>
<b>To:</b> Yu, Mingli &lt;Mingli.Yu@windriver.com&gt;<br>
<b>Cc:</b> akuster808 &lt;akuster808@gmail.com&gt;; openembedded-devel@lis=
ts.openembedded.org &lt;openembedded-devel@lists.openembedded.org&gt;<br>
<b>Subject:</b> Re: [oe] [meta-oe][hardknott][PATCH] mariadb: Update SRC_U=
RI</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt=
;">
<div class=3D"PlainText">[Please note: This e-mail is from an EXTERNAL e-m=
ail address]<br>
<br>
On 8/4/21 7:48 PM, Yu, Mingli wrote:<br>
&gt; Hi Khem,<br>
&gt;<br>
&gt; The one we want to update is the persistent archive and also send a<b=
r>
&gt; patch to master.<br>
&gt;<br>
<br>
Can we point the SRC_URI at<br>
<a href=3D"https://archive.mariadb.org/${BP}/source/${BP}.tar.gz">https://=
archive.mariadb.org/${BP}/source/${BP}.tar.gz</a> ?<br>
<br>
<br>
&gt; Thanks,<br>
&gt; ---------------------------------------------------------------------=
---<br>
&gt; *From:* Khem Raj &lt;raj.khem@gmail.com&gt;<br>
&gt; *Sent:* Thursday, August 5, 2021 10:42<br>
&gt; *To:* Yu, Mingli &lt;Mingli.Yu@windriver.com&gt;<br>
&gt; *Cc:* akuster808 &lt;akuster808@gmail.com&gt;;<br>
&gt; openembedded-devel@lists.openembedded.org<br>
&gt; &lt;openembedded-devel@lists.openembedded.org&gt;<br>
&gt; *Subject:* Re: [oe] [meta-oe][hardknott][PATCH] mariadb: Update SRC_U=
RI<br>
&gt; [Please note: This e-mail is from an EXTERNAL e-mail address]<br>
&gt;<br>
&gt; On Wed, Aug 4, 2021 at 7:36 PM Yu, Mingli &lt;mingli.yu@windriver.com=
&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; Hi Armin,<br>
&gt;&gt;<br>
&gt;&gt; Though the do_fetch issue is gone after upgrade mariadb to 10.5.1=
1, but after 10.5.12 comes out, the issue will be there again if we don't u=
pgrade timely.<br>
&gt;&gt;<br>
&gt;&gt; Considering the previous URL only stores the latest tar ball and =
the updated one stores all the tar balls. It's better use the updated one.<=
br>
&gt;<br>
&gt; Dont we have some persistent archive location to point to ?<br>
&gt; secondly, we should put the tarballs on oe source mirror for fall bac=
k.<br>
&gt;<br>
&gt;&gt;<br>
&gt;&gt; Thanks,<br>
&gt;&gt; ________________________________<br>
&gt;&gt; From: akuster808 &lt;akuster808@gmail.com&gt;<br>
&gt;&gt; Sent: Wednesday, August 4, 2021 21:58<br>
&gt;&gt; To: Yu, Mingli &lt;Mingli.Yu@windriver.com&gt;; openembedded-deve=
l@lists.openembedded.org &lt;openembedded-devel@lists.openembedded.org&gt;<=
br>
&gt;&gt; Subject: Re: [oe] [meta-oe][hardknott][PATCH] mariadb: Update SRC=
_URI<br>
&gt;&gt;<br>
&gt;&gt; [Please note: This e-mail is from an EXTERNAL e-mail address]<br>
&gt;&gt;<br>
&gt;&gt; On 8/3/21 10:43 PM, Yu, Mingli wrote:<br>
&gt;&gt; &gt; Ping.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Thanks,<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; On 7/27/21 2:32 PM, Yu, Mingli wrote:<br>
&gt;&gt; &gt;&gt; From: Mingli Yu &lt;mingli.yu@windriver.com&gt;<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; Fixes:<br>
&gt;&gt; &gt;&gt; WARNING: mariadb-10.5.9-r0 do_fetch: Failed to fetch URL=
<br>
&gt;&gt; &gt;&gt; <a href=3D"https://downloads.mariadb.org/interstitial/ma=
riadb-10.5.9/source/mariadb-10.5.9.tar.gz">
https://downloads.mariadb.org/interstitial/mariadb-10.5.9/source/mariadb-1=
0.5.9.tar.gz</a><br>
&gt; &lt;<a href=3D"https://downloads.mariadb.org/interstitial/mariadb-10.=
5.9/source/mariadb-10.5.9.tar.gz">https://downloads.mariadb.org/interstitia=
l/mariadb-10.5.9/source/mariadb-10.5.9.tar.gz</a>&gt;,<br>
&gt;&gt; &gt;&gt; attempting MIRRORS if available<br>
&gt;&gt;<br>
&gt;&gt; Mariadb has been updated to 10.5.11. Are you still seeing a d/l i=
ssue?<br>
&gt;&gt;<br>
&gt;&gt; -armin<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; Signed-off-by: Mingli Yu &lt;mingli.yu@windriver.com&gt;=
<br>
&gt;&gt; &gt;&gt; ---<br>
&gt;&gt; &gt;&gt;&nbsp;&nbsp; meta-oe/recipes-dbs/mysql/mariadb.inc | 2 +-=
<br>
&gt;&gt; &gt;&gt;&nbsp;&nbsp; 1 file changed, 1 insertion(+), 1 deletion(-=
)<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc<br>
&gt;&gt; &gt;&gt; b/meta-oe/recipes-dbs/mysql/mariadb.inc<br>
&gt;&gt; &gt;&gt; index 2974341bf..e8ff41461 100644<br>
&gt;&gt; &gt;&gt; --- a/meta-oe/recipes-dbs/mysql/mariadb.inc<br>
&gt;&gt; &gt;&gt; +++ b/meta-oe/recipes-dbs/mysql/mariadb.inc<br>
&gt;&gt; &gt;&gt; @@ -4,7 +4,7 @@ SECTION =3D &quot;libs&quot;<br>
&gt;&gt; &gt;&gt;&nbsp;&nbsp; LICENSE =3D &quot;GPLv2&quot;<br>
&gt;&gt; &gt;&gt;&nbsp;&nbsp; LIC_FILES_CHKSUM =3D<br>
&gt;&gt; &gt;&gt; &quot;<a href=3D""></a>file://COPYING;md5=3Db1becf0cfa33=
66e0f4d854d1d264f311<br>
&gt; &lt;<a href=3D"file://COPYING;md5=3Db1becf0cfa3366e0f4d854d1d264f311"=
>file://COPYING;md5=3Db1becf0cfa3366e0f4d854d1d264f311</a>&gt;&quot;<br>
&gt;&gt; &gt;&gt;&nbsp;&nbsp; -SRC_URI =3D<br>
&gt;&gt; &gt;&gt; &quot;<a href=3D""></a>https://downloads.mariadb.org/int=
erstitial/${BP}/source/${BP}.tar.gz \<br>
&gt;&gt; &gt;&gt; +SRC_URI =3D &quot;<a href=3D""></a>https://archive.mari=
adb.org/${BP}/source/${BP}.tar.gz \<br>
&gt;&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; <a href=3D"file://my.cnf">file://my.cnf</a> &lt;<a hr=
ef=3D"file://my.cnf">file://my.cnf</a>&gt; \<br>
&gt;&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; <a href=3D"file://mysqld.service">file://mysqld.servi=
ce</a> &lt;<a href=3D"file://mysqld.service">file://mysqld.service</a>&gt; =
\<br>
&gt;&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; <a href=3D"file://install_db.service">file://install_=
db.service</a> &lt;<a href=3D"file://install_db.service">file://install_db.=
service</a>&gt; \<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; <br>
&gt;&gt;<br>
</div>
</span></font></div>
</body>
</html>

--_000_CO1PR11MB5009E8D3DD5972E9C93E7A15F1F29CO1PR11MB5009namp_--
