Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DA83C433F5
	for <webhook@archiver.kernel.org>; Fri, 22 Oct 2021 02:05:10 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web08.2796.1634868309560106942
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Oct 2021 19:05:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=MD8zulBy;
 spf=pass (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=5929f4c0fc=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19M1vo9Z029614
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Oct 2021 19:05:09 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : references : in-reply-to : content-type :
 mime-version; s=PPS06212021;
 bh=qDxszichZkzb0eIqP4u548bk/YpVCMS2LmXLyAwsWd4=;
 b=MD8zulBy2B8wJcfbdYff7hCRbk7EqdMkwcxJ6rSkOQwQv3kMV0WtgdeIIw9Rc7o+q/cq
 ZnahzeWleIlKhYNh6OzB3G0OALuOM5ctJQqxKfekyudsI0/0c6b8IzEjHIqKtt0pMi7Y
 fj0Fm4LPiEXUy29ftKL3hYnTEh4ZL4SY7YOAeqRasf4SCwpl6fSJAYL5ejsrcmCXZI3n
 j22+dqh9YEGe47nSQ4wSoAOdrNTrS8IXTbVGrmHQLZdGDvjhgudDK+vBAs39CvrhtQio
 C2XZV019VCIma7IJanKG0fYZdakG1ip+0mwcp3FdWFXhTjBgCehL5CVqvEa49PreOkWX Fw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com with ESMTP id 3bu07t0yn7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Oct 2021 19:05:08 -0700
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 19M258WE008766
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Oct 2021 19:05:08 -0700
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2177.outbound.protection.outlook.com [104.47.56.177])
	by mx0a-0064b401.pphosted.com with ESMTP id 3bu07t0yn6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Oct 2021 19:05:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UzCnciwFarlgqTvCMZR3P8zjraklKGmDlxhlNNbueydGiBDzOBhMf5/CCwWHgLok8Vn2ILiZsV+sh3gQ1hZCFFLEEUxsnxAKzZxbRt9e+YfHbUEwelq7ZZG5JjYY5fX5NkTnVTXy8jEpocoQIo+EwrarTj1/pFxjikSGM6l7HOxXEYWGuH6N8ewbkLteHy1tUCO+9Mzfsueo8UsQXVbZjzhucnIa2Sd7QRdSwW1azoqEzJaMx0lsHpDZoYeNcbVdDCaZYl1ZAAgRydBblrCN77xygVmSIJqnBMCdPZMx7ShEz1F4yC9oXK0VITMlKktKyvZr03yxh25qOz9NM+nAJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qDxszichZkzb0eIqP4u548bk/YpVCMS2LmXLyAwsWd4=;
 b=LriqyEnGhmp2dkYqZ6s3yvLy12nwKZ5JoU3+MPVb5pEFabNHMOwylsTstAVGKDYbOzfiKPDnT9LIUjxwyJDHMIkIrvWnIHn5JiRlwQA0g1r2HWiVb2axGSx8ZMBKgp+S2uGRydDpX9JwGYXbsuSeo7235Ao1qr+fvg0N8/mk8be55pOSevt5tWrlgVci8zElp/mJVQo0r49J7t590wzCS4rsVNxm1rlW7Dimof7FbyLn7OB7lRVoIcDBFesPgr1xPcEHm3d5uZkFUyrR8Ul5weznsaUF9Lcoq1tNo/mUjWsKfeZGltBEKwj0yviTnjS2nASaen8GIHjlwpeeBD+mnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by CO6PR11MB5668.namprd11.prod.outlook.com (2603:10b6:5:355::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.17; Fri, 22 Oct
 2021 02:05:05 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::98c4:c603:2360:7b8b]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::98c4:c603:2360:7b8b%7]) with mapi id 15.20.4608.020; Fri, 22 Oct 2021
 02:05:05 +0000
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
Thread-Index: AQHXxdTX1h+NTdyP20KGyGXKoJBCZqvcslEogAGTrHk=
Date: Fri, 22 Oct 2021 02:05:05 +0000
Message-ID: 
 <CO6PR11MB5602FBC27E267729CA21A55AED809@CO6PR11MB5602.namprd11.prod.outlook.com>
References: <20211019045923.51357-1-Qi.Chen@windriver.com>
 <b73a6500-6db3-57ec-2ccb-4616a719d276@gmail.com>
 <4d0ea54a-fb51-982d-2936-027fe91c4d9d@windriver.com>
 <CO6PR11MB56020D2F23E77A747EEAC365EDBF9@CO6PR11MB5602.namprd11.prod.outlook.com>
In-Reply-To: 
 <CO6PR11MB56020D2F23E77A747EEAC365EDBF9@CO6PR11MB5602.namprd11.prod.outlook.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
suggested_attachment_session_id: 9751b610-ddff-9c65-9673-2ca185f68f52
authentication-results: windriver.com; dkim=none (message not signed)
 header.d=none;windriver.com; dmarc=none action=none
 header.from=windriver.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 528f3399-237f-4142-bf5b-08d995005df3
x-ms-traffictypediagnostic: CO6PR11MB5668:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: 
 <CO6PR11MB5668DD2D5370DE5283DEBE2EED809@CO6PR11MB5668.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:304;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 GL5qL7qqdDNBkh5Y0gBUDeEUv8Vqsi9PUDm30IZ4gQDE1hBO9hphEthw2O35/7MMesaqcumGgwKCxxTDbA1OzrCBw+ucIWmzW/IaNUASY8R84xuwcr2qUsJCWh7DTSizcG8x8T9UN+j0LlI+0btWBpuacfgqAMyJNN3YkFFvFLZ6SI93edgyrmLL1qVEP9+Ir0ALVM71EgeM4EFrXJ+TthxOCxP411+oorbKM0pmtahMmevKPZG6zRVWkPoKYKrmtMKVMNVucJgHCphNIB+X+pNPJUxup2OpFK6xI6vDUdgiUyHT3Jtsqahnuoez3OV5XgHVOnHMUnDr1T4ED11IIPx+07+PLX3wHohvj7lrwvMtTnFysfHUMgHBIZIszjDGmtdCh8xnC+xL3ycgoH0UmW8aImDwzdKcK2FQUkL32tbBa8iJaLZyuHb21LyFtm0FaCanHkCXl/pzeITJ/QyYv2apFlvw88v8zzBWvFXntSXrEVW8t6xssjkfZuX0tOFxmnO8BmbzfwtHBkFDD6R5NcqvMXyx76LZjBcGkRc5E/ftcYE9RFQGskusydd/FWV2K1BSFI4Y2vJaAG9hAe4T8ROQjjfjK8cVCqxwGf6oqRjeJJZKJnbk+zRayml+lwS3fugxdJj1IL0psOAV0XO6caGwaLnxmcH2Xeu04uuC2PPsgMmemE4AlJkzZwUaKKlEQGIIK3FfVTZ1UFEM+lVIYZy6J8blCfKVI6V4kYS7EyxlClAYH99aCsIJuQqBhFG2I5eoeDHrcDqidWVWdcJ9rkDgKxY4+7BN5T6ZfzWGGVerUGDFGqinX7MKdvONsCVSKx3tYy/+Gq1eeos0fJrvSAOBxEvw0TveRxprFue3lfc=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(166002)(66946007)(83380400001)(91956017)(76116006)(53546011)(6506007)(122000001)(110136005)(8676002)(508600001)(55016002)(64756008)(8936002)(18265965003)(26005)(186003)(38100700002)(4001150100001)(71200400001)(52536014)(966005)(316002)(66556008)(38070700005)(2906002)(33656002)(66476007)(9686003)(66446008)(7696005)(5660300002)(86362001)(19627405001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?cuK/xEzBB47D6e4rN4Gphd79acZES9j3vTWoPwUBccMmXUdbC8wX/zEp5Qnv?=
 =?us-ascii?Q?Fd6L5BHMa9fIpqveSDA9NHooZx/LKsIUvztgage13KffQ+Ml+K+O+NCimvRw?=
 =?us-ascii?Q?05ZLZugRmNZNdurZuJiT71c5PkBCfyJeOWApxCsADBAWk1EF1cLQAPDu9hLB?=
 =?us-ascii?Q?NCXkKAy1gNd7lMuJ6B1mGYXR/tRnhlUfy/vwXl6lQ/62DpzQ37RKT+vDpSyl?=
 =?us-ascii?Q?F+IcgwyR9AJ4Cl0/v61DPf5WVrZhFeLqKRVJautrbEnAQmnUiD8Go3lzpDvc?=
 =?us-ascii?Q?ccRzmr9rlfHjbG3oUig73D5LVBaLOPG42cc69DUXwIQC6qL60pvMv0uzik3h?=
 =?us-ascii?Q?lqOFNb7zHnlLCp4ENKT93cpe51kwlb2XViAtCt7JslmKpP3CcjJyqKzNCogT?=
 =?us-ascii?Q?nSQzvIpUTHAaJgCq4dJ77AxN1l3mRX51a5v0qQlvUViqgN+IT1IuNARWeD9a?=
 =?us-ascii?Q?ys72qlfbsiyrX2rX94n1QreBdFP5P8TfM6PiaIdBkQMofL7AHURis375PtDp?=
 =?us-ascii?Q?bruh939Bvbnl0nyaKvQEPpDfFsm2qq/4j/uZgW3ItxWZkeStm7WuEz7gsjVF?=
 =?us-ascii?Q?0bGammzZgtzywLya4ga9sNgGLC/Scj8v5hjHWCy+jNvM/IXPmYJgtqpQIDr5?=
 =?us-ascii?Q?EFCXOJpu4VMTDwndnQVTugmewxhYeP/QAvF8N8Pw/rvK478uubpVkoOVhtT4?=
 =?us-ascii?Q?VN7oCItfwgFF5EGVuJXS8AWAmoJUURTeOi+6Lx87CMhitovhbj1hg3t/ggz/?=
 =?us-ascii?Q?5RX4r3fTzP4+TSthUdLuKybPsdRvXvG12CwVMLlXmX0QvTA7B6e6RHiFekr+?=
 =?us-ascii?Q?AdkajarEnMxljVLaRt5s5kWVOBLky1AUAQg1tLH4LSU95aZjGMoc9a+Vkp6z?=
 =?us-ascii?Q?jAFCh3UFTf5l8feBEWvIG3HipZfL70eZwUyxBy6sRedLLWRDoGQ0IWvSPLS8?=
 =?us-ascii?Q?MDhDxMyjX3Cghpy3via6VVBrojOfE0mxn0ho6pNXABkBCQgJZucMKgTx0RiX?=
 =?us-ascii?Q?QOgwMZDFDfX7iuFFT3DF69UC0gUa/xVRLLcd1uarBT6AayYPs86cpaK4oQvY?=
 =?us-ascii?Q?FioQveWWjGhqUJ09NbP0P7jQslFfCPpQjmPUmyZ/QvGYyKaE9MtZ5Q5nqT08?=
 =?us-ascii?Q?0OXY+dIbYvZtexGwH/Xn4aWbRDKuqNvH+EAvd6y5RjDtA52DnAah1UDA/A62?=
 =?us-ascii?Q?kDHA+N41jQtXqDEHhz8utFUiH4zntGRCsd/R+ff3MhFURCqPUEKvOA65gFRF?=
 =?us-ascii?Q?lzYB9xlt7uy2xwbO5qcZkx5m+0sXlf6kambWEUgtlk7qacNgx3ZtkXraKpMe?=
 =?us-ascii?Q?oDA=3D?=
Content-Type: multipart/alternative;
	boundary="_000_CO6PR11MB5602FBC27E267729CA21A55AED809CO6PR11MB5602namp_"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 528f3399-237f-4142-bf5b-08d995005df3
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2021 02:05:05.7384
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qi.chen@windriver.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5668
X-Proofpoint-GUID: Xmr5xVx9XlU9640tocYPP0NPE-bLxO83
X-Proofpoint-ORIG-GUID: IP8-Fq2OWVtR-3atGXYnM8SWfz_NcFzv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-21_07,2021-10-21_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015
 malwarescore=0 bulkscore=0 phishscore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 mlxlogscore=999
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110220010
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 22 Oct 2021 02:05:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93524

--_000_CO6PR11MB5602FBC27E267729CA21A55AED809CO6PR11MB5602namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Armin & Randy,

Could this patch be merged into hardknott?
Or should I send out V2 with detailed change log?

Regards,
Qi
________________________________
From: Chen, Qi <Qi.Chen@windriver.com>
Sent: Thursday, October 21, 2021 10:10
To: MacLeod, Randy <Randy.MacLeod@windriver.com>; Armin Kuster <akuster808@=
gmail.com>; openembedded-devel@lists.openembedded.org <openembedded-devel@l=
ists.openembedded.org>
Subject: Re: [oe][meta-filesystem][hardknott][PATCH] ntfs-3g-ntfsprogs: upg=
rade to 2021.8.22

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


--_000_CO6PR11MB5602FBC27E267729CA21A55AED809CO6PR11MB5602namp_
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
Hi Armin &amp; Randy,</div>
<div><br>
</div>
<div>Could this patch be merged into hardknott?</div>
<div>Or should I send out V2 with detailed change log?</div>
<div><br>
</div>
<div>Regards,</div>
<div>Qi<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Chen, Qi &lt;Qi.Chen@=
windriver.com&gt;<br>
<b>Sent:</b> Thursday, October 21, 2021 10:10<br>
<b>To:</b> MacLeod, Randy &lt;Randy.MacLeod@windriver.com&gt;; Armin Kuster=
 &lt;akuster808@gmail.com&gt;; openembedded-devel@lists.openembedded.org &l=
t;openembedded-devel@lists.openembedded.org&gt;<br>
<b>Subject:</b> Re: [oe][meta-filesystem][hardknott][PATCH] ntfs-3g-ntfspro=
gs: upgrade to 2021.8.22</font>
<div>&nbsp;</div>
</div>
<style type=3D"text/css" style=3D"display:none">
<!--
p
	{margin-top:0;
	margin-bottom:0}
-->
</style>
<div dir=3D"ltr">
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
Hi Randy,</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<ol>
<li><span>It's used by anaconda. I searched OE, and didn't find any other p=
lace.</span></li></ol>
</div>
<ol start=3D"2">
<li style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12pt=
; color:rgb(0,0,0)">
I don't think it's worth the effort to identify and fix them one by one.</l=
i></ol>
<div>Regards,</div>
<div>Qi</div>
<div id=3D"x_appendonsend"></div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"x_divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" =
color=3D"#000000" style=3D"font-size:11pt"><b>From:</b> MacLeod, Randy &lt;=
Randy.MacLeod@windriver.com&gt;<br>
<b>Sent:</b> Thursday, October 21, 2021 1:06<br>
<b>To:</b> Armin Kuster &lt;akuster808@gmail.com&gt;; Chen, Qi &lt;Qi.Chen@=
windriver.com&gt;; openembedded-devel@lists.openembedded.org &lt;openembedd=
ed-devel@lists.openembedded.org&gt;<br>
<b>Subject:</b> Re: [oe][meta-filesystem][hardknott][PATCH] ntfs-3g-ntfspro=
gs: upgrade to 2021.8.22</font>
<div>&nbsp;</div>
</div>
<div class=3D"x_BodyFragment"><font size=3D"2"><span style=3D"font-size:11p=
t">
<div class=3D"x_PlainText">On 2021-10-19 11:09 a.m., Armin Kuster wrote:<br=
>
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
</div>
</body>
</html>

--_000_CO6PR11MB5602FBC27E267729CA21A55AED809CO6PR11MB5602namp_--

