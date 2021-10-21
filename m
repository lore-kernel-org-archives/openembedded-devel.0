Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0216C433EF
	for <webhook@archiver.kernel.org>; Thu, 21 Oct 2021 02:10:18 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.3872.1634782217793270736
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Oct 2021 19:10:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=V9hGqq1/;
 spf=pass (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=59283c55e4=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19L1FPE4013451
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Oct 2021 19:10:17 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : references : in-reply-to : content-type :
 mime-version; s=PPS06212021;
 bh=skSaAUQyGiSBiSLfub4wm+xj485rz+yW15/qm4BGEuI=;
 b=V9hGqq1//k1tFfgGBf8NGFHh/evLDJ6OCS1AfBUrnpr7gDHUHuaraVBBIqzyHEO51WyM
 80yoOjojqyFHxoB1UqKga4ZGhBO4+BN7r6bQH3Kp3XE5U1CspVTd6C45zm8mv1hzkBuc
 ElrR/mLEjAPkNlAepVYqUKaPyih93Kl2v3GvdH/uL+TXCns6P4RrEHdDxrakbOhN7jWU
 2h9+jd88tdi86ouG8tsbjRSgiVFUi33dXM28g1T2f3VHBIorchnevkcotCFxwcF/ChSw
 r9KNLmkeXL0mDLbrbbngmsESZY63rL8FUf/WPOzzdAq8j8JQZ9GgGH72U4nmkkpIpVo9 Vw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com with ESMTP id 3bt7up9216-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Oct 2021 19:10:16 -0700
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 19L2AG3v009466
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Oct 2021 19:10:16 -0700
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2171.outbound.protection.outlook.com [104.47.55.171])
	by mx0a-0064b401.pphosted.com with ESMTP id 3bt7up9215-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Oct 2021 19:10:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NSfhkriXI5y971eBg2Cdh36RkLUmKA8H9TyE7ZBDftg4/zVvvNStPitDE7LCsMk9Et1VnBQK3rsIUCzEPBi0G4P4SpGA0K3xPUN3IRj1rTqbLa6rEwotrDBWXGLt7562gMQH6uSWeDNouoOR52897b2S8WjJQxPeG22atuRueEVUBUjwKdPfKMq7qssFCcoH8rc6ZIsf2PQv43aVLvBwxOBXzMqdjUcs8k0P9rzcgcrw6qYk9jvEBTVxchrDBHasXgDblWTvxkLs3Ud9zojfxFVkuVxELx3+de+jY1119YQp6cVVs7b8BHsIZfSla4d5bO0G6akFl0Sh7UPA8UQIAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=skSaAUQyGiSBiSLfub4wm+xj485rz+yW15/qm4BGEuI=;
 b=GiC7eofzFUNNQ2UZa3jSzAUCUNLbJobaJVXPCcQ6S667mCRySErEgXFoK8t4pcl8JsCIgxWpa0dxc1GpG2skkTlCgGcHOC3ZaSb/UbRvpZDKz+2OlNLFH6Yj4EMWjiLZwUOPfKwmTLoZ29AUNHCxoYvQOkAussG/CyNCFdJgXxKuqqn9GkNNmLcKhV7bCcpPz5KGj2WYgUa7bwtrXTeXo2rT5n+G2QPbRwNabJ2/5bzEbEkxPNRhP4of07tqMiGcjCAZdUYHGA6nT8XF+5xRtFPYB7kjRJHbfUTpHBITU6hRIQlK1gg8o5zwLVnYLbl27w4yfgBltOsuroy5YwRUFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by CO6PR11MB5617.namprd11.prod.outlook.com (2603:10b6:5:35c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.15; Thu, 21 Oct
 2021 02:10:13 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::98c4:c603:2360:7b8b]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::98c4:c603:2360:7b8b%7]) with mapi id 15.20.4608.018; Thu, 21 Oct 2021
 02:10:13 +0000
From: "Chen, Qi" <Qi.Chen@windriver.com>
To: "MacLeod, Randy" <Randy.MacLeod@windriver.com>,
        Armin Kuster
	<akuster808@gmail.com>,
        "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe][meta-filesystem][hardknott][PATCH] ntfs-3g-ntfsprogs:
 upgrade to 2021.8.22
Thread-Topic: [oe][meta-filesystem][hardknott][PATCH] ntfs-3g-ntfsprogs:
 upgrade to 2021.8.22
Thread-Index: AQHXxdTX1h+NTdyP20KGyGXKoJBCZqvcslEo
Date: Thu, 21 Oct 2021 02:10:13 +0000
Message-ID: 
 <CO6PR11MB56020D2F23E77A747EEAC365EDBF9@CO6PR11MB5602.namprd11.prod.outlook.com>
References: <20211019045923.51357-1-Qi.Chen@windriver.com>
 <b73a6500-6db3-57ec-2ccb-4616a719d276@gmail.com>
 <4d0ea54a-fb51-982d-2936-027fe91c4d9d@windriver.com>
In-Reply-To: <4d0ea54a-fb51-982d-2936-027fe91c4d9d@windriver.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
suggested_attachment_session_id: c461e85a-353a-f432-f1d0-7bbf8b671c1a
authentication-results: windriver.com; dkim=none (message not signed)
 header.d=none;windriver.com; dmarc=none action=none
 header.from=windriver.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 89d681db-135d-44da-8ff3-08d99437eaf0
x-ms-traffictypediagnostic: CO6PR11MB5617:
x-microsoft-antispam-prvs: 
 <CO6PR11MB5617DCD2AC4513475204289EEDBF9@CO6PR11MB5617.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:304;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 YbZb47M3uzd/U/KAhdsF7YWuQj9nWgEpug+tiXlSwPn3w/mqXKO+81KW6GzexIg5KeGMKYs7YFe982jPgEFvq03OFU/aUtFCUjZHCaSpkUIadT8sTWurGil9wneoBiCk6R170cX+tTS+1+fPaFsCtxvO1XLh7FWV09pLfslA5DL06WM8wzV6PiREmzPXTkaQ4RfMq22ZB37pO2E52WhQegIj8kG++e2kWHH20/ZBjyPUvdp9qCKcZ+IKSZkDPJzRBPCC8Q/RqjzKABXrMlJ+/u4rxkvyKfK9dxdjFMeKOlNCRbOj9fUDbrGv70EQG/sYFVuIfy0/Hhe8/PUBGHXX9gqx738MZGMAxvMMSXM/ugNvKoSD6ubQncg50Qnkd6CFRuqz84pdxB2IFJd1o0GNLxQAr7pb0VLDyAK0MzHn7LBwBijQLi+ubZ7oT0uhO5gIPrCb8nQMiYIJ8sucenmmME/xmA6+T6Y3jrs+AIN2xXrixZGwRAyuRj6Uy13o0WQ7P62Npf5POYRw4/b2KaIGWidMZFDBAs94uDfnSq/nbxO0HxNG69WRARnUxqPdVC2KHSGxXcXlvF/HlqbWM8CSYPDWjUuV8Yw4sIkGVbEJjYJHsZIvkesj/7Dt5mrjWSZk7lQ0pI0XNC02DZ5ECeGMwp3nSP8XeM7emCjXeOEo60cEDMSJ20VqoxJY9CYxfcJ5JHfqj4tujoFuxOSjYZuDewf3Q7lvSIozzMIeLXxPipb/2ca4NikBLe8QNCHGXnxIOA0cuJT2wjXEpVyJujdfb38s0YFaSUaNnPXz/ecwpUQhGks3UjodEroxARFMYyutdV1UEGl4tuAwlbfvjyS847aNKH6Jl3o8SGqtdrGBXRHVrpx+xZ2F6fjGBO+fz0dR
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(966005)(52536014)(508600001)(66446008)(186003)(86362001)(9686003)(55016002)(8936002)(38100700002)(19627405001)(5660300002)(83380400001)(166002)(122000001)(33656002)(2906002)(8676002)(4001150100001)(316002)(110136005)(38070700005)(53546011)(66556008)(66946007)(76116006)(66476007)(64756008)(18265965003)(91956017)(7696005)(6506007)(26005)(71200400001)(9126006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?pN8R0HDw5uqD20OywlBsI4pppIp/Mk/rBdxNjIxcX7sNBGOKcdAAkEsir5OH?=
 =?us-ascii?Q?umALLRsXVltKvLcpfWJhsqg7yyBdAILl42jVMJCgK7EOdiUzuT4hK0YoI0ui?=
 =?us-ascii?Q?CvpTl5sHGhVsHeQ+DQ9n75D4WAWyqG5fPCyo/ES0pJe3ttMOxPwnAFRp5uEa?=
 =?us-ascii?Q?I+0HBl8jhFYy7ZcYFuSa4IfAAsmCcndnsKeM4msHed3FC5kaY/ggBzZF89Tf?=
 =?us-ascii?Q?uvYZfSykObp269SU+06Ld1LPQy2P+xV/gXiYt4GOS7E7yrPTJoM4zZSZXA1F?=
 =?us-ascii?Q?62UGwHJHGZ0l9ei7uQb9W1a/K5DvDnGHGax5khXZ/8DORaoVWBIzKt/+n3Lf?=
 =?us-ascii?Q?knn2hnSGrUO6z6wmFt0NPitEdZEuITuEsXjjGY38GjD/6xh/rniynnO5vM/d?=
 =?us-ascii?Q?VrNW97wzlqlEETPrXeN/xdbfVtzWW2VY8C6W4yvDlKQtTP/0d8U98KEtjZ49?=
 =?us-ascii?Q?WVl8cUDm0yBYWPWCVpwzbnz4w/2KWC/6ByC2VK0wMYuuVBiixEvG5D83bIWC?=
 =?us-ascii?Q?BcU6LRF/LUwB+fpAZJuZ4Ev+Z2OxtzKFS4EqoipWMMthtbwGWx2GX35TT8Bx?=
 =?us-ascii?Q?z7WupTPUiLll1HKnWPkyu1dnEBgJefKUKjNVRwPiuy1t3xKLszDV442oirxg?=
 =?us-ascii?Q?wZ6DkR9Utf0X0xf2+zGgYacWN1FTCEuDydCtQABY+nLv+WojaNz/nzPHosGR?=
 =?us-ascii?Q?BKtRmwnyTbIqETIPQF3yFoHy7N82b7tCgMoiaT+dR91AGmLArwvBQ3F+X4vE?=
 =?us-ascii?Q?5ZSJ65Yf6kUEAq6MAYccyuSMEIRlwbLHOHBJCiKfiCrQl2ckMZewr+KUqe4T?=
 =?us-ascii?Q?wOWpnyNTKp017ltB6FJ75cyEd7vVWKIvz84pIE3XFHwWul4j7xC3sKMb8z2l?=
 =?us-ascii?Q?O07OVmr3GFMRXZBLpGUiAvcPJO2HLwwvc9MbbwvfofKKKL5iEy5dERkMjhPg?=
 =?us-ascii?Q?h6EvgDh+DI2NeXh4ghyaJJe9lh65ASnc13TWB0Y07APxwBd8bG+eRnIx7ibp?=
 =?us-ascii?Q?ERRPv0JCIGcRWyxuFsZq7UhkJSEXn8Wnj/l76waUoLY8L/0UM51a+IUwZwoS?=
 =?us-ascii?Q?ZhZqBAAULWS0pUP6oUbeB8CCdRQT17BFOek0r+vT3aOax2RdVsbClpFCCNfE?=
 =?us-ascii?Q?uk51sKCEpTvsrOFqQdNCtbXYOgkQ6VPXjaMChE2Nj37e2MM5YciJG5P7B8N1?=
 =?us-ascii?Q?q2lvFoOkOkbVqLqO3y06SMCltOHVyZID15p5HiKnT/8Tr2PN+fKMaU565w4m?=
 =?us-ascii?Q?EA1KnaHwGcun+YjNP5lFmkCjtNrsJCaRwWEW61OUAT2FAqZxeT7K2Pw1/H0o?=
 =?us-ascii?Q?jBffCBFxpJbVti6KUeKwzBkR4dMvivccRouo6TVOSnUcznMvTnXOO1zh/hte?=
 =?us-ascii?Q?TvuJflGVR1alGoJG44nEpLVrceHsh/SQqYRpEHaPVdrW3fKJUYe8jEc5CQo1?=
 =?us-ascii?Q?0x9oiOkeBRE=3D?=
Content-Type: multipart/alternative;
	boundary="_000_CO6PR11MB56020D2F23E77A747EEAC365EDBF9CO6PR11MB5602namp_"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 89d681db-135d-44da-8ff3-08d99437eaf0
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Oct 2021 02:10:13.3560
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qi.chen@windriver.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5617
X-Proofpoint-GUID: 8pgkmODwcwnrZoQDGWIEDjaPiNiXIgF0
X-Proofpoint-ORIG-GUID: 85jayhSsM1HbUoLjy-8y-hUkQ1RGlwUz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-20_06,2021-10-20_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0
 mlxlogscore=999 priorityscore=1501 phishscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 mlxscore=0 suspectscore=0
 malwarescore=0 clxscore=1011 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2109230001 definitions=main-2110210009
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 Oct 2021 02:10:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93509

--_000_CO6PR11MB56020D2F23E77A747EEAC365EDBF9CO6PR11MB5602namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Randy,


  1.  It's used by anaconda. I searched OE, and didn't find any other place=
.

  1.  I don't think it's worth the effort to identify and fix them one by o=
ne.

Regards,
Qi
________________________________
From: MacLeod, Randy <Randy.MacLeod@windriver.com>
Sent: Thursday, October 21, 2021 1:06
To: Armin Kuster <akuster808@gmail.com>; Chen, Qi <Qi.Chen@windriver.com>; =
openembedded-devel@lists.openembedded.org <openembedded-devel@lists.openemb=
edded.org>
Subject: Re: [oe][meta-filesystem][hardknott][PATCH] ntfs-3g-ntfsprogs: upg=
rade to 2021.8.22

On 2021-10-19 11:09 a.m., Armin Kuster wrote:
>
>
> On 10/18/21 9:59 PM, Chen Qi wrote:
>> This upgrade revolves a bunch of CVEs. See more details in:
>> https://github.com/tuxera/ntfs-3g/security/advisories/GHSA-q759-8j5v-q5j=
p.
> Seems reasonable to me.
>
> -armin

I"m tempted to agree but I don't know enough about how ntfs-36 is
used. I think we need more information and a more detailed commit
log explaining why we think that the uprev is okay.

Qi,
Does it provide a library and header files that developers use?

Debian has a patch that we could make use of:
    https://security-tracker.debian.org/tracker/CVE-2021-35266

$ apt-get source ntfs-3g

$ fd security.patch

ntfs-3g-2017.3.23AR.3/debian/patches/aug2021-security.patch


$ diffstat `fd aug`

  include/ntfs-3g/attrib.h |    1

  include/ntfs-3g/index.h  |    4 +

  include/ntfs-3g/volume.h |    5 ++

  libntfs-3g/acls.c        |    4 +

  libntfs-3g/attrib.c      |  332
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++---=
---

  libntfs-3g/bootsect.c    |    8 +++

  libntfs-3g/compress.c    |   22 +++++++++-

  libntfs-3g/dir.c         |  109
+++++++++++++++++++-------------------------------

  libntfs-3g/index.c       |  183
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++----------=
---------

  libntfs-3g/inode.c       |   24 ++++++-----

  libntfs-3g/lcnalloc.c    |   15 ++++--

  libntfs-3g/mft.c         |   70 +++++++++++++++++++++++++++++++-

  libntfs-3g/volume.c      |   81 ++++++++++++++++++++++++++++---------

  ntfsprogs/ntfscp.c       |    3 -

  ntfsprogs/ntfsfix.c      |   17 ++++++-

  src/lowntfs-3g.c         |  384
+++++++++++++++++++++++++++++++++++++++++----------------------------------=
---------------------------------------------------------------------------=
----------------------------

  src/ntfs-3g.c            |   23 ++++++----

  17 files changed, 818 insertions(+), 467 deletions(-)


compared to the diff of the uprev:

$ git diff 2017.3.23..2021.8.22 | diffstat | tail -1

  69 files changed, 3220 insertions(+), 705 deletions(-)



../Randy

>>
>> These CVEs cannot be reolved one by one. Upgrading the package
>> is the only reasonable way.
>>
>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> ---
>>   ...-ntfsprogs_2017.3.23.bb =3D> ntfs-3g-ntfsprogs_2021.8.22.bb} | 4 ++=
--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>   rename meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/{ntfs-3g=
-ntfsprogs_2017.3.23.bb =3D> ntfs-3g-ntfsprogs_2021.8.22.bb} (92%)
>>
>> diff --git a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs=
-3g-ntfsprogs_2017.3.23.bb b/meta-filesystems/recipes-filesystems/ntfs-3g-n=
tfsprogs/ntfs-3g-ntfsprogs_2021.8.22.bb
>> similarity index 92%
>> rename from meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-=
3g-ntfsprogs_2017.3.23.bb
>> rename to meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g=
-ntfsprogs_2021.8.22.bb
>> index 6f5cb6cee..19b2d6ca2 100644
>> --- a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntf=
sprogs_2017.3.23.bb
>> +++ b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntf=
sprogs_2021.8.22.bb
>> @@ -10,8 +10,8 @@ SRC_URI =3D "http://tuxera.com/opensource/ntfs-3g_ntfs=
progs-${PV}.tgz \
>>              file://0001-libntfs-3g-Makefile.am-fix-install-failed-while=
-host.patch \
>>   "
>>   S =3D "${WORKDIR}/ntfs-3g_ntfsprogs-${PV}"
>> -SRC_URI[md5sum] =3D "d97474ae1954f772c6d2fa386a6f462c"
>> -SRC_URI[sha256sum] =3D "3e5a021d7b761261836dcb305370af299793eedbded731d=
f3d6943802e1262d5"
>> +SRC_URI[md5sum] =3D "90da343e78877d388eb34cefae6799ae"
>> +SRC_URI[sha256sum] =3D "55b883aa05d94b2ec746ef3966cb41e66bed6db99f22ddd=
41d1b8b94bb202efb"
>>
>>   UPSTREAM_CHECK_URI =3D "https://www.tuxera.com/community/open-source-n=
tfs-3g/"
>>   UPSTREAM_CHECK_REGEX =3D "ntfs-3g_ntfsprogs-(?P<pver>\d+(\.\d+)+)\.tgz=
"
>>
>>
>>
>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#93467): https://lists.openembedded.org/g/openembedded=
-devel/message/93467
> Mute This Topic: https://lists.openembedded.org/mt/86433129/3616765
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
andy.macleod@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--
# Randy MacLeod
# Wind River Linux


--_000_CO6PR11MB56020D2F23E77A747EEAC365EDBF9CO6PR11MB5602namp_
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
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Hi Randy,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<ol>
<li><span>It's used by anaconda. I searched OE, and didn't find any other p=
lace.</span></li></ol>
</div>
<ol start=3D"2">
<li style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size:=
 12pt; color: rgb(0, 0, 0);">
I don't think it's worth the effort to identify and fix them one by one.</l=
i></ol>
<div>Regards,</div>
<div>Qi</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> MacLeod, Randy &lt;Ra=
ndy.MacLeod@windriver.com&gt;<br>
<b>Sent:</b> Thursday, October 21, 2021 1:06<br>
<b>To:</b> Armin Kuster &lt;akuster808@gmail.com&gt;; Chen, Qi &lt;Qi.Chen@=
windriver.com&gt;; openembedded-devel@lists.openembedded.org &lt;openembedd=
ed-devel@lists.openembedded.org&gt;<br>
<b>Subject:</b> Re: [oe][meta-filesystem][hardknott][PATCH] ntfs-3g-ntfspro=
gs: upgrade to 2021.8.22</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On 2021-10-19 11:09 a.m., Armin Kuster wrote:<br>
&gt; <br>
&gt; <br>
&gt; On 10/18/21 9:59 PM, Chen Qi wrote:<br>
&gt;&gt; This upgrade revolves a bunch of CVEs. See more details in:<br>
&gt;&gt; <a href=3D"https://github.com/tuxera/ntfs-3g/security/advisories/G=
HSA-q759-8j5v-q5jp">
https://github.com/tuxera/ntfs-3g/security/advisories/GHSA-q759-8j5v-q5jp</=
a>.<br>
&gt; Seems reasonable to me.<br>
&gt; <br>
&gt; -armin<br>
<br>
I&quot;m tempted to agree but I don't know enough about how ntfs-36 is<br>
used. I think we need more information and a more detailed commit<br>
log explaining why we think that the uprev is okay.<br>
<br>
Qi,<br>
Does it provide a library and header files that developers use?<br>
<br>
Debian has a patch that we could make use of:<br>
&nbsp;&nbsp;&nbsp; <a href=3D"https://security-tracker.debian.org/tracker/C=
VE-2021-35266">https://security-tracker.debian.org/tracker/CVE-2021-35266</=
a><br>
<br>
$ apt-get source ntfs-3g<br>
<br>
$ fd security.patch<br>
<br>
ntfs-3g-2017.3.23AR.3/debian/patches/aug2021-security.patch<br>
<br>
<br>
$ diffstat `fd aug`<br>
<br>
&nbsp; include/ntfs-3g/attrib.h |&nbsp;&nbsp;&nbsp; 1<br>
<br>
&nbsp; include/ntfs-3g/index.h&nbsp; |&nbsp;&nbsp;&nbsp; 4 +<br>
<br>
&nbsp; include/ntfs-3g/volume.h |&nbsp;&nbsp;&nbsp; 5 ++<br>
<br>
&nbsp; libntfs-3g/acls.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&=
nbsp;&nbsp; 4 +<br>
<br>
&nbsp; libntfs-3g/attrib.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 332 <br>
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++---=
---<br>
<br>
&nbsp; libntfs-3g/bootsect.c&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp; 8 +++<br=
>
<br>
&nbsp; libntfs-3g/compress.c&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 22 +++++++++-<=
br>
<br>
&nbsp; libntfs-3g/dir.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&n=
bsp; 109 <br>
+++++++++++++++++++-------------------------------<br>
<br>
&nbsp; libntfs-3g/index.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 183 <=
br>
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++----------=
---------<br>
<br>
&nbsp; libntfs-3g/inode.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;=
 24 ++++++-----<br>
<br>
&nbsp; libntfs-3g/lcnalloc.c&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 15 ++++--<br>
<br>
&nbsp; libntfs-3g/mft.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&n=
bsp;&nbsp; 70 +++++++++++++++++++++++++++++++-<br>
<br>
&nbsp; libntfs-3g/volume.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 81 +=
+++++++++++++++++++++++++++---------<br>
<br>
&nbsp; ntfsprogs/ntfscp.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;=
&nbsp; 3 -<br>
<br>
&nbsp; ntfsprogs/ntfsfix.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 17 +=
+++++-<br>
<br>
&nbsp; src/lowntfs-3g.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&n=
bsp; 384 <br>
+++++++++++++++++++++++++++++++++++++++++----------------------------------=
---------------------------------------------------------------------------=
----------------------------<br>
<br>
&nbsp; src/ntfs-3g.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; |&nbsp;&nbsp; 23 ++++++----<br>
<br>
&nbsp; 17 files changed, 818 insertions(+), 467 deletions(-)<br>
<br>
<br>
compared to the diff of the uprev:<br>
<br>
$ git diff 2017.3.23..2021.8.22 | diffstat | tail -1<br>
<br>
&nbsp; 69 files changed, 3220 insertions(+), 705 deletions(-)<br>
<br>
<br>
<br>
../Randy<br>
<br>
&gt;&gt;<br>
&gt;&gt; These CVEs cannot be reolved one by one. Upgrading the package<br>
&gt;&gt; is the only reasonable way.<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Chen Qi &lt;Qi.Chen@windriver.com&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;&nbsp;&nbsp; ...-ntfsprogs_2017.3.23.bb =3D&gt; ntfs-3g-ntfsprogs_2=
021.8.22.bb} | 4 ++--<br>
&gt;&gt;&nbsp;&nbsp; 1 file changed, 2 insertions(+), 2 deletions(-)<br>
&gt;&gt;&nbsp;&nbsp; rename meta-filesystems/recipes-filesystems/ntfs-3g-nt=
fsprogs/{ntfs-3g-ntfsprogs_2017.3.23.bb =3D&gt; ntfs-3g-ntfsprogs_2021.8.22=
.bb} (92%)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprog=
s/ntfs-3g-ntfsprogs_2017.3.23.bb b/meta-filesystems/recipes-filesystems/ntf=
s-3g-ntfsprogs/ntfs-3g-ntfsprogs_2021.8.22.bb<br>
&gt;&gt; similarity index 92%<br>
&gt;&gt; rename from meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs=
/ntfs-3g-ntfsprogs_2017.3.23.bb<br>
&gt;&gt; rename to meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/n=
tfs-3g-ntfsprogs_2021.8.22.bb<br>
&gt;&gt; index 6f5cb6cee..19b2d6ca2 100644<br>
&gt;&gt; --- a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-=
3g-ntfsprogs_2017.3.23.bb<br>
&gt;&gt; +++ b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-=
3g-ntfsprogs_2021.8.22.bb<br>
&gt;&gt; @@ -10,8 +10,8 @@ SRC_URI =3D &quot;<a href=3D""></a>http://tuxera=
.com/opensource/ntfs-3g_ntfsprogs-${PV}.tgz \<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; <a href=3D"file://0001-libntfs-3g-Makefile.am-fix-install-faile=
d-while-host.patch">
file://0001-libntfs-3g-Makefile.am-fix-install-failed-while-host.patch</a> =
\<br>
&gt;&gt;&nbsp;&nbsp; &quot;<br>
&gt;&gt;&nbsp;&nbsp; S =3D &quot;${WORKDIR}/ntfs-3g_ntfsprogs-${PV}&quot;<b=
r>
&gt;&gt; -SRC_URI[md5sum] =3D &quot;d97474ae1954f772c6d2fa386a6f462c&quot;<=
br>
&gt;&gt; -SRC_URI[sha256sum] =3D &quot;3e5a021d7b761261836dcb305370af299793=
eedbded731df3d6943802e1262d5&quot;<br>
&gt;&gt; +SRC_URI[md5sum] =3D &quot;90da343e78877d388eb34cefae6799ae&quot;<=
br>
&gt;&gt; +SRC_URI[sha256sum] =3D &quot;55b883aa05d94b2ec746ef3966cb41e66bed=
6db99f22ddd41d1b8b94bb202efb&quot;<br>
&gt;&gt;&nbsp;&nbsp; <br>
&gt;&gt;&nbsp;&nbsp; UPSTREAM_CHECK_URI =3D &quot;<a href=3D"https://www.tu=
xera.com/community/open-source-ntfs-3g/">https://www.tuxera.com/community/o=
pen-source-ntfs-3g/</a>&quot;<br>
&gt;&gt;&nbsp;&nbsp; UPSTREAM_CHECK_REGEX =3D &quot;ntfs-3g_ntfsprogs-(?P&l=
t;pver&gt;\d+(\.\d+)+)\.tgz&quot;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#93467): <a href=3D"https://lists.openembedded.org/=
g/openembedded-devel/message/93467">
https://lists.openembedded.org/g/openembedded-devel/message/93467</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/86433129=
/3616765">https://lists.openembedded.org/mt/86433129/3616765</a><br>
&gt; Group Owner: openembedded-devel+owner@lists.openembedded.org<br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
devel/unsub">
https://lists.openembedded.org/g/openembedded-devel/unsub</a> [randy.macleo=
d@windriver.com]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; <br>
<br>
<br>
-- <br>
# Randy MacLeod<br>
# Wind River Linux<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_CO6PR11MB56020D2F23E77A747EEAC365EDBF9CO6PR11MB5602namp_--

