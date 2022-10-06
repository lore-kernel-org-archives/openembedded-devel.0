Return-Path: <narpat.mali@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D2D2C433FE
	for <webhook@archiver.kernel.org>; Thu,  6 Oct 2022 08:17:47 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.3317.1665044265600448107
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Oct 2022 01:17:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=LigvI2Sb;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=7278aa64a9=narpat.mali@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 29680Vkc004970
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 6 Oct 2022 01:17:45 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 mime-version; s=PPS06212021;
 bh=fpu7skSijfYqDYH8khybG4eeXPKOzNMPJwN7FpORxsA=;
 b=LigvI2SbLxAdJzAE9BP/DgOhhrp1Gd+gdCvbLY7NVTJnLA7jasKVBquQPdI4MKYEc+ro
 GFv5B68ZvggXdGLVZbpEZqbg5dbPZO/i7JdB+B7mCX3PedvlzPREz+bSA45Qhsw7EDbN
 dx23VsWFxagaQ8Bs2gxqHxXkr5CF8Ro5PTKzRJO4+yN5udoLt2XQh+qFe0VSC7fM4eba
 hct6t2tI5oJ95FzEDiEMFd/17WDKws0dPZc/wwTefJuvM1/f56ua+VlvtLNvDtUg/oI3
 arKEnxRkBmbhSaqTn+r9v+mo19l8Y6U7pwPqhGRafP8yRaiaAGzJ0iD96wu+55VTBxg6 5Q==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3k1meh881f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Oct 2022 01:17:44 -0700
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2968HixX012691
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 6 Oct 2022 01:17:44 -0700
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1anam02lp2045.outbound.protection.outlook.com [104.47.57.45])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3k1meh881e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Oct 2022 01:17:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ONmzqB6E7qidiGW3CW1xk9ojvZTrGwV4iHz4FA39wSBsGGp6usrd19csLQxr7rtbATqmY15slIqPCaGMiRDwbMqMKd3M0/z4NvMrupADPz9sa1eIstPh/LqUde/QuBiu57bzApzNDBJTHH70h9b+Y6sAxLKur4pi6P+zLfUn4a/brhWyif38GrH18cKDswJVkgnsUQcmsexfx3/WygCEOF+OHBd0MxgGJzD4i4yo9ipAGBZfTfWDzlZB4l+5BfdXVzlzz+RBbe6mn9L/xLLnQnZRED2kUkMtcYCGRa+/re7Z/Lsd2a1Lh8KBSrTAD7Ugpvcsn4SLMG84ztp+egbARg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fpu7skSijfYqDYH8khybG4eeXPKOzNMPJwN7FpORxsA=;
 b=MZF6mKoHYGsu/EjQPGGAlVXf+OcwrB5O+LaX4+DeVMJSqx3DBtLTlNUeVGeqPXWs3aZIhS6HzIw294p1l+pHs1eUofU/EoHqN8OYHgb/mzZm8gfvaOKTeiVVlCN8U0aXPmqn0wRNDreD6M+q5gEZBpRiGTFNSb0+C4IKloZ2d5R2RO2HbwWckpJ9fNJtjRCkvyPCaceSXwYqI2u00V0NwoFcyKV24+Dj5v/pQeHsaJE31lUifZSWLTjpsLWxwcr6RV2d3ZF/FL2lWYdFyAt+ZDq9e/DrXF/DfswpoU5bxjl/GpGxr68N+Qsr2t59ZwxJSAnKgrSAeQPx70ToyLoKuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BN9PR11MB5545.namprd11.prod.outlook.com (2603:10b6:408:102::19)
 by SA1PR11MB5922.namprd11.prod.outlook.com (2603:10b6:806:239::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.28; Thu, 6 Oct
 2022 08:17:40 +0000
Received: from BN9PR11MB5545.namprd11.prod.outlook.com
 ([fe80::8afc:918d:e3a:203a]) by BN9PR11MB5545.namprd11.prod.outlook.com
 ([fe80::8afc:918d:e3a:203a%4]) with mapi id 15.20.5676.032; Thu, 6 Oct 2022
 08:17:39 +0000
From: "Mali, Narpat" <Narpat.Mali@windriver.com>
To: Khem Raj <raj.khem@gmail.com>
CC: "G Pillai, Hari" <Hari.GPillai@windriver.com>,
        "Polampalli, Archana"
	<Archana.Polampalli@windriver.com>,
        "Urade, Yogita"
	<Yogita.Urade@windriver.com>,
        "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] [kirkstone] [PATCH 1/1] net-snmp: upgrade 5.9.1 -> 5.9.3
Thread-Topic: [oe] [kirkstone] [PATCH 1/1] net-snmp: upgrade 5.9.1 -> 5.9.3
Thread-Index: AQHY18EJk8i6XwdkD0qG/Rq3PlD3Rq4A3Jee
Date: Thu, 6 Oct 2022 08:17:39 +0000
Message-ID: 
 <DM4PR11MB5550556C69874182BEFCB0ACE45C9@DM4PR11MB5550.namprd11.prod.outlook.com>
References: <20221003062716.3759210-1-narpat.mali@windriver.com>
 <CAMKF1srgHEyVMQUr6VPMjhk5cKN_7CmSacwWpFRkmBuvK6muoA@mail.gmail.com>
 <DM4PR11MB55509038ED491A594997F441E45B9@DM4PR11MB5550.namprd11.prod.outlook.com>
 <CAMKF1spoYEUkoa3W72PG1pkaB31zDYoH0cajaZGkE0hpA-0tKA@mail.gmail.com>
 <DM4PR11MB555011387E9D6D5CE47D6795E45A9@DM4PR11MB5550.namprd11.prod.outlook.com>
In-Reply-To: 
 <DM4PR11MB555011387E9D6D5CE47D6795E45A9@DM4PR11MB5550.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-IN
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5545:EE_|SA1PR11MB5922:EE_
x-ms-office365-filtering-correlation-id: f622e71e-22e1-4ea9-6111-08daa7733c1e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 1BwoiES5wnVwVTTE+syjsgxv0ze0K9J+kETVMyMkWhG71gdSRyKHccPLRxM5CkDQcqAmirrqXCWusBsxUhzyWMfSTwcIVlRJg+4Tb70BdBI4fsijipRaseFHFqY61p3+vELZtjMtgkYsXXWuaejIChI/8BfMbAU4bgbZlni+P+xktNjD20fmSFZWd4035PIAA1doM3Z+TXrerWDXcUCI9v/gv2v2Lf2NeopKDUSHO+TtU1kyTAwEbLkW4yvWkMhmx9YukWDCcsX0EtHUkwkNnhLi4/e5BdohSBuJss77YPsnM1OelkyF0DZy+6aO4yoJkKiHL6g6Z/T/45BbcZQL7TZho1lY1LFS8lTv4QCcgD5KBHkGxUsVZBF5OoRt10Motm1sMcc1hP+DJCgXySNb948TdWkiXSFe3eMSyw1udEVXdo2CTostJYf2ZY5YAN1V8WBf3bwHNWdI+O6uqFxoTBRoOnPnYWyEIR4LCIZBz+0ve3tJy6dBD3/o2mbsQoj+OfOVqLKgSHUkgk4GRrGmaZkDETYTp45KAZ3zw8kEhPzCboKI7k2KGdm/FyXNs1RdxMcunK2LWecWKDGqh5O9xSsabFJAuFrRaf1DiEO4JfuVRf9rHG61mJaSi/4h+0o2BK0gQSOplXUdhm2lJ+OO8YZcVP6ESx6nKJpTOeYvVYkjvTDF1Q9sAQKk6jmaSkRgOLHEWC/PQ4jT1yLUn5qRQnH0P9dS6ftuMonGLTJ6znG42EZeL/J5ENtZ2IsjJKByX5Uj0R8B2EEXG6Szz5E0YY8HWCWV6Ve/MWjCwjP4rpYfrjAVhvXT920p5WeViQKKTUTmOfalH3Y0svop+Gf2SQ==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5545.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(376002)(39850400004)(366004)(396003)(346002)(451199015)(64756008)(66446008)(66556008)(8676002)(41300700001)(478600001)(66476007)(91956017)(316002)(6916009)(8936002)(4326008)(52536014)(30864003)(66946007)(76116006)(54906003)(83380400001)(86362001)(6506007)(19627235002)(9686003)(6512007)(33656002)(26005)(5660300002)(53546011)(186003)(71200400001)(2906002)(166002)(38100700002)(66899015)(38070700005)(6486002)(966005)(99936003)(122000001)(579004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?Windows-1252?Q?WgW/1lFWi6IjTsswXYtiwG8T3Lw8aLCtMI+B4v5gnRfubEZcVbH6us2k?=
 =?Windows-1252?Q?nuB1ttYOLlDPWOoDpK/Pa81A8+f241ZkagHQNIm6lFGBvJu62VxxCWQV?=
 =?Windows-1252?Q?T/dqsvexSkTly2x5gsLyLnCPUKNhpfKMh1hdg9udukG7J8lDfdssybXI?=
 =?Windows-1252?Q?k3FZXBUYEgWjgXm3mTjilm7IvRjevwE8XbNs18PSn76sdED/x5FLJOtf?=
 =?Windows-1252?Q?tUIOAXmevw0+Ub+js+icvZiilFKi8xu+XsTuH+TliRk0ZsRFbamgy/gv?=
 =?Windows-1252?Q?gTz9ecYi+s1MxKHfKNvjEuTJ5YmoDPa+JDDKrRc+1sf2D18Rc+BcbU04?=
 =?Windows-1252?Q?ozn5pSbeRylAKk72qMn1ZLn1IQEz7CN83o9K+Ncooy+GtcWPaRS+iZ8f?=
 =?Windows-1252?Q?gaPj6hAyjuz5+4k/6zbgvdwkwQYXxJa8lhzTHIRNdFsZ+kb8TwK+Jcvh?=
 =?Windows-1252?Q?4XYB7rXGpK3l9fuLUf5P190VDdBGwz/3DQdlAhwOiSo70ooNb3FjG2hJ?=
 =?Windows-1252?Q?7q+gXcaHzbNovPf3JiTQyA/ZO/8bYkJLJtIWLASQzi62R2GmxgkKZ2AE?=
 =?Windows-1252?Q?1fohSGDrdmBrHkl6WCYsGm9HZtSj8gLEymrbNzEU1YxIfn8mllFS/nWo?=
 =?Windows-1252?Q?++yXcXi0084PcDeaTl/VlbvjLK7W3Hhe2pIk/5i3fxo5zNOdZRPbQl56?=
 =?Windows-1252?Q?L4vhZMdsXNN46OPmIRe3vp8Rwht5yGy92lfbr4VUaE4lCxXYav4KAgNZ?=
 =?Windows-1252?Q?0t3LRa0GYqaYZzEreP75vfrirSMrDFeSypppxz/FWYtHII+fTaeF7NQo?=
 =?Windows-1252?Q?hjrZTQ8m45vWbuHaRTG2Rak50+udcu49GWimnXTzqbMvEG98fG6x6hxr?=
 =?Windows-1252?Q?dzQOIfG8Vj4QtrvWD4QrMPYzfXnizzp8JhyTrbPlqeXRJOcXJA7bt25T?=
 =?Windows-1252?Q?86dBh+Ko64g92kP1TRpmZFIGhDEVLJsIgk8CUylUdpGdMLSKUSRfy+MV?=
 =?Windows-1252?Q?5XNLK2hDMKNBTvTqCalAwxYNajV7SpYJTRxq1ce/FtB85Vl2FkCf9A/0?=
 =?Windows-1252?Q?C0WgMSbt0tt1qacZUVtfYSqSFBQspZqFVTbNogDgoSRD1r/pVBiOT4Px?=
 =?Windows-1252?Q?jYhr0ysdyVLIr+HGt+rR8AWi6I7BVdVoTfIpHTm1gfGvpOQs7aweCUDf?=
 =?Windows-1252?Q?MS8HWfeLy91o7+bQR/KJXpkLnIwjU6uzTWAPtQy6npsIsk5v0ywsk3eE?=
 =?Windows-1252?Q?igSExlcj4Mh0Ndr/rpRgKhT+KjV97k1NIPxPky5g1V78KemxbDI/lpi+?=
 =?Windows-1252?Q?3kruR3d+gt2eTDokeJ68g1VBGumIc9Ug6YYZI3zanBQ1wBGxzDo3oQbm?=
 =?Windows-1252?Q?YX9j8ELbRcog0B2qsqiln/lmW2ZqllrhTx6Jlb1cGZFqXEDYgRAd/ZRn?=
 =?Windows-1252?Q?RrvSoJE+lLCBAqw5YueTGPOAbE/0kBUpAbfSWQ9/WH0w57XOhTnFcgfm?=
 =?Windows-1252?Q?dSVwN4j3EkNHEvjQnY+igw8McTj6FAGHkffIzB+r0aDfSe5kyxKfyaDr?=
 =?Windows-1252?Q?xpFaTtEquaIHP+g0+8eMPI0SRnDgQxalZONxeabMdcZfpYUXGyTxGOqG?=
 =?Windows-1252?Q?hzKVpWkTZCjKwiUw146iTPTR98GKpnhM3oOqQM1Ts1A4oD+YuToZ/Wkr?=
 =?Windows-1252?Q?vIH467w9vnKeqFqAQwJXXBXGZMqShlf8dED6JeQSkk6chAGgGqeFQhCF?=
 =?Windows-1252?Q?RYpfGG+ft0JhXkKDckU=3D?=
Content-Type: multipart/related;
	boundary="_004_DM4PR11MB5550556C69874182BEFCB0ACE45C9DM4PR11MB5550namp_";
	type="multipart/alternative"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5545.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 f622e71e-22e1-4ea9-6111-08daa7733c1e
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Oct 2022 08:17:39.7735
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 mt7xepxSya1hnMWtckmrrx5fz1Q655IudyaxxPrvpfVSmu8rcwaDF6kSWZXgxH0R9iGrJ8zjECh7ullKblrZfFbQ1Igir6bOmXGB/W2EhaI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5922
X-Proofpoint-GUID: xGJxbQVnqZodYkqXgongrfNoZaswA9IS
X-Proofpoint-ORIG-GUID: RpY_7vXbwhw0GojFMq6VP-DkMQjW-wd6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-10-05_05,2022-10-06_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0
 clxscore=1015 priorityscore=1501 phishscore=0 impostorscore=0 adultscore=0
 suspectscore=0 mlxscore=0 malwarescore=0 lowpriorityscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210060050
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 06 Oct 2022 08:17:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/99077

--_004_DM4PR11MB5550556C69874182BEFCB0ACE45C9DM4PR11MB5550namp_
Content-Type: multipart/alternative;
	boundary="_000_DM4PR11MB5550556C69874182BEFCB0ACE45C9DM4PR11MB5550namp_"

--_000_DM4PR11MB5550556C69874182BEFCB0ACE45C9DM4PR11MB5550namp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Hi Khem Raj,

Please ignore this patch, have sent again fresh patch with =93[kirkstone]=
=94 in subject.

Best Regards,
Narpat Mali

Sent from Mail<https://go.microsoft.com/fwlink/?LinkId=3D550986> for Window=
s

From: Mali, Narpat<mailto:Narpat.Mali@windriver.com>
Sent: 04 October 2022 12:45
To: Khem Raj<mailto:raj.khem@gmail.com>
Cc: G Pillai, Hari<mailto:Hari.GPillai@windriver.com>; Polampalli, Archana<=
mailto:Archana.Polampalli@windriver.com>; Urade, Yogita<mailto:Yogita.Urade=
@windriver.com>; openembedded-devel@lists.openembedded.org<mailto:openembed=
ded-devel@lists.openembedded.org>
Subject: RE: [oe] [kirkstone] [PATCH 1/1] net-snmp: upgrade 5.9.1 -> 5.9.3

Hi Khem Raj,

Have added the =93[kirkstone]=94 in subject.
Do I need to send the patch again ?

Best Regards,
Narpat Mali

Sent from Mail<https://go.microsoft.com/fwlink/?LinkId=3D550986> for Window=
s

From: Khem Raj<mailto:raj.khem@gmail.com>
Sent: 04 October 2022 01:11
To: Mali, Narpat<mailto:Narpat.Mali@windriver.com>
Cc: G Pillai, Hari<mailto:Hari.GPillai@windriver.com>; Polampalli, Archana<=
mailto:Archana.Polampalli@windriver.com>; Urade, Yogita<mailto:Yogita.Urade=
@windriver.com>; openembedded-devel@lists.openembedded.org<mailto:openembed=
ded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-openembedded][PATCH 1/1] net-snmp: upgrade 5.9.1 ->=
 5.9.3

[Please note: This e-mail is from an EXTERNAL e-mail address]
Ok it will be good to add [kirkstone] in subject
So folks know where intend it for

On Mon, Oct 3, 2022 at 10:12 AM Mali, Narpat <Narpat.Mali@windriver.com<mai=
lto:Narpat.Mali@windriver.com>> wrote:
Hi Khem Raj,

It is the same commit but, we need this patch commit for =93kirkstone=94 br=
anch of meta-openembedded.
We observed that the =93master=94 branch has =93net-snmp 5.9.3=94 version a=
t https://git.openembedded.org/meta-openembedded/tree/meta-networking/recip=
es-protocols/net-snmp<https://urldefense.com/v3/__https:/git.openembedded.o=
rg/meta-openembedded/tree/meta-networking/recipes-protocols/net-snmp__;!!Aj=
veYdw8EvQ!ZzYDx7kFVh5e_WREHKtwOKlB0gzWJ5uBreZgWz17XbqSPIpRoCWlAxdMV_d3cedWC=
D1nDmiLXuSYtigk1r7C$> and the =93kirkstone=94 branch has =93net-snmp 5.9.1=
=94 at https://git.openembedded.org/meta-openembedded/tree/meta-networking/=
recipes-protocols/net-snmp?h=3Dkirkstone<https://urldefense.com/v3/__https:=
/git.openembedded.org/meta-openembedded/tree/meta-networking/recipes-protoc=
ols/net-snmp?h=3Dkirkstone__;!!AjveYdw8EvQ!ZzYDx7kFVh5e_WREHKtwOKlB0gzWJ5uB=
reZgWz17XbqSPIpRoCWlAxdMV_d3cedWCD1nDmiLXuSYtnBwmXJ0$>

Since, our product is using =93kirkstone=94 branch of meta-openembedded so,=
 CVE-2022-24805 to CVE-2022-24810 are vulnerable for our product.
Could you please let us know, How to get net-snmp upgraded to 5.9.3 version=
 in =93kirkstone=94 branch ?

Best Regards,
Narpat Mali

Sent from Mail<https://urldefense.com/v3/__https:/go.microsoft.com/fwlink/?=
LinkId=3D550986__;!!AjveYdw8EvQ!ZzYDx7kFVh5e_WREHKtwOKlB0gzWJ5uBreZgWz17Xbq=
SPIpRoCWlAxdMV_d3cedWCD1nDmiLXuSYtrYRmqeF$> for Windows


From: Khem Raj <raj.khem@gmail.com<mailto:raj.khem@gmail.com>>
Sent: Monday, October 3, 2022 12:29:18 PM
To: Mali, Narpat <Narpat.Mali@windriver.com<mailto:Narpat.Mali@windriver.co=
m>>
Cc: openembedded-devel@lists.openembedded.org<mailto:openembedded-devel@lis=
ts.openembedded.org> <openembedded-devel@lists.openembedded.org<mailto:open=
embedded-devel@lists.openembedded.org>>; Polampalli, Archana <Archana.Polam=
palli@windriver.com<mailto:Archana.Polampalli@windriver.com>>; Urade, Yogit=
a <Yogita.Urade@windriver.com<mailto:Yogita.Urade@windriver.com>>; G Pillai=
, Hari <Hari.GPillai@windriver.com<mailto:Hari.GPillai@windriver.com>>
Subject: Re: [oe] [meta-openembedded][PATCH 1/1] net-snmp: upgrade 5.9.1 ->=
 5.9.3

[Please note: This e-mail is from an EXTERNAL e-mail address]


how different is this from
https://git.openembedded.org/meta-openembedded/commit/?id=3Dbf4a826c7de51dc=
dac87f81fa2bd2301629d50db<https://urldefense.com/v3/__https:/git.openembedd=
ed.org/meta-openembedded/commit/?id=3Dbf4a826c7de51dcdac87f81fa2bd2301629d5=
0db__;!!AjveYdw8EvQ!ZzYDx7kFVh5e_WREHKtwOKlB0gzWJ5uBreZgWz17XbqSPIpRoCWlAxd=
MV_d3cedWCD1nDmiLXuSYtpcGLzXP$>

On Sun, Oct 2, 2022 at 11:27 PM Narpat Mali <narpat.mali@windriver.com<mail=
to:narpat.mali@windriver.com>> wrote:
>
> Issue: LIN1022-1131, LIN1022-1132, LIN1022-1133, LIN1022-1134, LIN1022-11=
35
> Issue: LIN1022-1136
>
> Upgrade summary:
> ----------------
> - drop 0002-configure-fix-a-cc-check-issue.patch, as it was replaced with
>   upstream commit https://github.com/net-snmp/net-snmp/commit/dbb49acfa2a=
f<https://urldefense.com/v3/__https:/github.com/net-snmp/net-snmp/commit/db=
b49acfa2af__;!!AjveYdw8EvQ!ZzYDx7kFVh5e_WREHKtwOKlB0gzWJ5uBreZgWz17XbqSPIpR=
oCWlAxdMV_d3cedWCD1nDmiLXuSYtoZJYKse$>
> - drop 0001-snmpd-always-exit-after-displaying-usage.patch backport
> - rebase net-snmp-5.7.2-fix-engineBoots-value-on-SIGHUP.patch manually
> - refresh patches with devtool to get rid of fuzz
>
> Changelog:
> ----------
> *5.9.3*:
> security:
>   - These two CVEs can be exploited by a user with read-only credentials:
>       - CVE-2022-24805 A buffer overflow in the handling of the INDEX of
>         NET-SNMP-VACM-MIB can cause an out-of-bounds memory access.
>       - CVE-2022-24809 A malformed OID in a GET-NEXT to the nsVacmAccessT=
able
>         can cause a NULL pointer dereference.
>   - These CVEs can be exploited by a user with read-write credentials:
>       - CVE-2022-24806 Improper Input Validation when SETing malformed
>         OIDs in master agent and subagent simultaneously
>       - CVE-2022-24807 A malformed OID in a SET request to
>         SNMP-VIEW-BASED-ACM-MIB::vacmAccessTable can cause an
>         out-of-bounds memory access.
>       - CVE-2022-24808 A malformed OID in a SET request to
>         NET-SNMP-AGENT-MIB::nsLogTable can cause a NULL pointer dereferen=
ce
>       - CVE-2022-24810 A malformed OID in a SET to the nsVacmAccessTable
>         can cause a NULL pointer dereference.
>   - To avoid these flaws, use strong SNMPv3 credentials and do not share =
them.
>     If you must use SNMPv1 or SNMPv2c, use a complex community string
>     and enhance the protection by restricting access to a given IP addres=
s
>     range.
>   - Thanks are due to Yu Zhang of VARAS@IIE and Nanyu Zhong of VARAS@IIE =
for
>     reporting the following CVEs that have been fixed in this release, an=
d
>     to Arista Networks for providing fixes.
>
> Windows:
>   - WinExtDLL: Fix multiple compiler warnings
>   - WinExtDLL: Make long strings occupy a single line Make it easier to
>     look up error messages in the source code by making long strings
>     occupy a single source code line.
>   - WinExtDLL: Restore MIB-II support Make winExtDLL work on 64-bit
>     Windows systems") caused snmpd to skip MIB-II on 64-bit systems.
>
> IF-MIB: Update ifTable entries even if the interface name has changed
>     At least on Linux a network interface index may be reused for a
>     network interface with a different name. Hence this patch that
>     enables replacing network interface information even if the network
>     interface name has changed.
>
> unspecified:
>   - Moved transport code into a separate subdirectory in snmplib
>   - Snmplib: remove inline versions of container funcs".
>
> misc:
>   - snmp-create-v3-user: Fix the snmpd.conf path   @datadir@ is
>     expanded in ${datarootdir} so datarootdir must be set before
>     @datadir@ is used.
>
> *5.9.2*:
> skipped due to a last minute library versioning found bug -- use 5.9.3 in=
stead
>
> (master rev: bf4a826c7de51dcdac87f81fa2bd2301629d50db) -- backport
>
> Signed-off-by: Narpat Mali <narpat.mali@windriver.com<mailto:narpat.mali@=
windriver.com>>
> ---
>  ...ath.m4-keep-consistent-between-32bit.patch |  8 ++-
>  .../0001-config_os_headers-Error-Fix.patch    |  4 +-
>  ...1-get_pid_from_inode-Include-limit.h.patch |  6 +-
>  ...d-always-exit-after-displaying-usage.patch | 55 -------------------
>  ....c-Don-t-check-for-return-from-EVP_M.patch |  4 +-
>  .../0002-configure-fix-a-cc-check-issue.patch | 28 ----------
>  ...004-configure-fix-incorrect-variable.patch |  6 +-
>  .../net-snmp/fix-libtool-finish.patch         |  6 +-
>  ....7.2-fix-engineBoots-value-on-SIGHUP.patch | 22 ++++----
>  ...add-knob-whether-nlist.h-are-checked.patch |  4 +-
>  .../net-snmp-fix-for-disable-des.patch        |  4 +-
>  ...ting-add-the-output-format-for-ptest.patch |  2 +-
>  .../reproducibility-have-printcap.patch       |  4 +-
>  .../{net-snmp_5.9.1.bb<https://urldefense.com/v3/__http:/net-snmp_5.9.1.=
bb__;!!AjveYdw8EvQ!ZzYDx7kFVh5e_WREHKtwOKlB0gzWJ5uBreZgWz17XbqSPIpRoCWlAxdM=
V_d3cedWCD1nDmiLXuSYtgJfttSA$> =3D> net-snmp_5.9.3.bb<https://urldefense.co=
m/v3/__http:/net-snmp_5.9.3.bb__;!!AjveYdw8EvQ!ZzYDx7kFVh5e_WREHKtwOKlB0gzW=
J5uBreZgWz17XbqSPIpRoCWlAxdMV_d3cedWCD1nDmiLXuSYtg4FzuZn$>}  |  4 +-
>  14 files changed, 37 insertions(+), 120 deletions(-)
>  delete mode 100644 meta-networking/recipes-protocols/net-snmp/net-snmp/0=
001-snmpd-always-exit-after-displaying-usage.patch
>  delete mode 100644 meta-networking/recipes-protocols/net-snmp/net-snmp/0=
002-configure-fix-a-cc-check-issue.patch
>  rename meta-networking/recipes-protocols/net-snmp/{net-snmp_5.9.1.bb<htt=
ps://urldefense.com/v3/__http:/net-snmp_5.9.1.bb__;!!AjveYdw8EvQ!ZzYDx7kFVh=
5e_WREHKtwOKlB0gzWJ5uBreZgWz17XbqSPIpRoCWlAxdMV_d3cedWCD1nDmiLXuSYtgJfttSA$=
> =3D> net-snmp_5.9.3.bb<https://urldefense.com/v3/__http:/net-snmp_5.9.3.b=
b__;!!AjveYdw8EvQ!ZzYDx7kFVh5e_WREHKtwOKlB0gzWJ5uBreZgWz17XbqSPIpRoCWlAxdMV=
_d3cedWCD1nDmiLXuSYtg4FzuZn$>} (98%)
>
> diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-ac_=
add_search_path.m4-keep-consistent-between-32bit.patch b/meta-networking/re=
cipes-protocols/net-snmp/net-snmp/0001-ac_add_search_path.m4-keep-consisten=
t-between-32bit.patch
> index 4cd729044..ed2ebc6d7 100644
> --- a/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-ac_add_sea=
rch_path.m4-keep-consistent-between-32bit.patch
> +++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-ac_add_sea=
rch_path.m4-keep-consistent-between-32bit.patch
> @@ -1,7 +1,8 @@
> -From 6f8ea2e841ad45eed193310b599d3f3b410ae91d Mon Sep 17 00:00:00 2001
> +From 98c62e24fdd05d7e8bd8149840bad8eb0feb3fb1 Mon Sep 17 00:00:00 2001
>  From: Mingli Yu <mingli.yu@windriver.com<mailto:mingli.yu@windriver.com>=
>
>  Date: Fri, 29 Jan 2021 08:49:15 +0000
> -Subject: [PATCH] ac_add_search_path.m4: keep consistent between 32bit an=
d 64bit
> +Subject: [PATCH] ac_add_search_path.m4: keep consistent between 32bit an=
d
> + 64bit
>
>  With configure option "--with-openssl=3D${STAGING_EXECPREFIXDIR}", it be=
haves
>  differently between 32bit and 64bit system as the openssl lib resides un=
der
> @@ -15,12 +16,13 @@ So add the patch to fix the gap between 32bit and 64b=
it system.
>  Upstream-Status: Inappropriate [configuration specific]
>
>  Signed-off-by: Mingli Yu <mingli.yu@windriver.com<mailto:mingli.yu@windr=
iver.com>>
> +
>  ---
>   m4/ac_add_search_path.m4 | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
>  diff --git a/m4/ac_add_search_path.m4 b/m4/ac_add_search_path.m4
> -index 8e0a819..961f587 100644
> +index 8e0a819..e9585bc 100644
>  --- a/m4/ac_add_search_path.m4
>  +++ b/m4/ac_add_search_path.m4
>  @@ -3,8 +3,8 @@ dnl Add a search path to the LIBS and CPPFLAGS variables
> diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-con=
fig_os_headers-Error-Fix.patch b/meta-networking/recipes-protocols/net-snmp=
/net-snmp/0001-config_os_headers-Error-Fix.patch
> index 05a47f61c..f8a52a63f 100644
> --- a/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-config_os_=
headers-Error-Fix.patch
> +++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-config_os_=
headers-Error-Fix.patch
> @@ -1,4 +1,4 @@
> -From 69d4c517c07f55c505090e48d96ace8cd599fb26 Mon Sep 17 00:00:00 2001
> +From e86d5fd52f19b85da0b7cce660c6e65ec4c0f9bb Mon Sep 17 00:00:00 2001
>  From: Li xin <lixin.fnst@cn.fujitsu.com<mailto:lixin.fnst@cn.fujitsu.com=
>>
>  Date: Fri, 21 Aug 2015 18:23:13 +0900
>  Subject: [PATCH] config_os_headers: Error Fix
> @@ -19,7 +19,7 @@ Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com<mailto=
:lixin.fnst@cn.fujitsu.com>>
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
>  diff --git a/configure.d/config_os_headers b/configure.d/config_os_heade=
rs
> -index f07d512..2363b42 100644
> +index 01c3376..6edd85f 100644
>  --- a/configure.d/config_os_headers
>  +++ b/configure.d/config_os_headers
>  @@ -395,8 +395,8 @@ then
> diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-get=
_pid_from_inode-Include-limit.h.patch b/meta-networking/recipes-protocols/n=
et-snmp/net-snmp/0001-get_pid_from_inode-Include-limit.h.patch
> index 22e591556..a7881a871 100644
> --- a/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-get_pid_fr=
om_inode-Include-limit.h.patch
> +++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-get_pid_fr=
om_inode-Include-limit.h.patch
> @@ -1,4 +1,4 @@
> -From 2bf1bbe1d428ed06d57aa76b03e394b72ff2216d Mon Sep 17 00:00:00 2001
> +From 8097734b27fd146f358a4edd0d1a0d28309bd9a4 Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com<mailto:raj.khem@gmail.com>>
>  Date: Fri, 22 Jul 2016 18:34:39 +0000
>  Subject: [PATCH] get_pid_from_inode: Include limit.h
> @@ -14,7 +14,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com<mailto:raj.=
khem@gmail.com>>
>   1 file changed, 1 insertion(+)
>
>  diff --git a/agent/mibgroup/util_funcs/get_pid_from_inode.c b/agent/mibg=
roup/util_funcs/get_pid_from_inode.c
> -index aee907d..7abaec2 100644
> +index 5788e1d..ea380a6 100644
>  --- a/agent/mibgroup/util_funcs/get_pid_from_inode.c
>  +++ b/agent/mibgroup/util_funcs/get_pid_from_inode.c
>  @@ -6,6 +6,7 @@
> @@ -23,5 +23,5 @@ index aee907d..7abaec2 100644
>   #include <ctype.h>
>  +#include <limits.h>
>   #include <stdio.h>
> - #if HAVE_STDLIB_H
> + #ifdef HAVE_STDLIB_H
>   #include <stdlib.h>
> diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-snm=
pd-always-exit-after-displaying-usage.patch b/meta-networking/recipes-proto=
cols/net-snmp/net-snmp/0001-snmpd-always-exit-after-displaying-usage.patch
> deleted file mode 100644
> index 4fc9e54b4..000000000
> --- a/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-snmpd-alwa=
ys-exit-after-displaying-usage.patch
> +++ /dev/null
> @@ -1,55 +0,0 @@
> -From 94ca941e06bef157bf0e13251f8ca1471daa9393 Mon Sep 17 00:00:00 2001
> -From: Kaarle Ritvanen <kaarle.ritvanen@datakunkku.fi<mailto:kaarle.ritva=
nen@datakunkku.fi>>
> -Date: Fri, 27 Aug 2021 14:21:45 +0300
> -Subject: [PATCH] snmpd: always exit after displaying usage
> -
> -Currently, viewing the help text with -h results in snmpd being started
> -in the background, whereas this does not happen with --help. Similarly,
> -when an error is detected in command line syntax, the help text is
> -displayed but sometimes snmpd gets started anyway, depending on the
> -execution path.
> -
> -This patch makes snmpd consistently terminate whenever the usage
> -function gets called. It also removes the goto statements no longer
> -needed.
> -
> -Upstream-Status: Backport
> -[https://github.com/net-snmp/net-snmp/commit/94ca941e06bef157bf0e13251f8=
ca1471daa9393<https://urldefense.com/v3/__https:/github.com/net-snmp/net-sn=
mp/commit/94ca941e06bef157bf0e13251f8ca1471daa9393__;!!AjveYdw8EvQ!ZzYDx7kF=
Vh5e_WREHKtwOKlB0gzWJ5uBreZgWz17XbqSPIpRoCWlAxdMV_d3cedWCD1nDmiLXuSYtoLiNbM=
Z$>]
> -
> -Signed-off-by: Yi Zhao <yi.zhao@windriver.com<mailto:yi.zhao@windriver.c=
om>>
> ----
> - agent/snmpd.c | 4 ++--
> - 1 file changed, 2 insertions(+), 2 deletions(-)
> -
> -diff --git a/agent/snmpd.c b/agent/snmpd.c
> -index f5aab0af8..90de12d99 100644
> ---- a/agent/snmpd.c
> -+++ b/agent/snmpd.c
> -@@ -289,6 +289,8 @@ usage(char *prog)
> -            "  -S d|i|0-7\t\tuse -Ls <facility> instead\n"
> -            "\n"
> -            );
> -+    SOCK_CLEANUP;
> -+    exit(1);
> - }
> -
> - static void
> -@@ -494,7 +496,6 @@ main(int argc, char *argv[])
> -         case '-':
> -             if (strcasecmp(optarg, "help") =3D=3D 0) {
> -                 usage(argv[0]);
> --                goto out;
> -             }
> -             if (strcasecmp(optarg, "version") =3D=3D 0) {
> -                 version();
> -@@ -783,7 +784,6 @@ main(int argc, char *argv[])
> -             fprintf(stderr, "%s: Illegal argument -X:"
> -                           "AgentX support not compiled in.\n", argv[0])=
;
> -             usage(argv[0]);
> --            goto out;
> - #endif
> -             break;
> -
> ---
> -2.25.1
> -
> diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-snm=
plib-keytools.c-Don-t-check-for-return-from-EVP_M.patch b/meta-networking/r=
ecipes-protocols/net-snmp/net-snmp/0001-snmplib-keytools.c-Don-t-check-for-=
return-from-EVP_M.patch
> index 42352a6b0..af6334f72 100644
> --- a/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-snmplib-ke=
ytools.c-Don-t-check-for-return-from-EVP_M.patch
> +++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-snmplib-ke=
ytools.c-Don-t-check-for-return-from-EVP_M.patch
> @@ -1,4 +1,4 @@
> -From f3ff99736b8cccbba77349b0d10a3cee366a4c87 Mon Sep 17 00:00:00 2001
> +From f4e1acd4f509dd26cf88da872bd5adcf884f4a5f Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com<mailto:raj.khem@gmail.com>>
>  Date: Fri, 18 Sep 2015 00:28:45 -0400
>  Subject: [PATCH] snmplib/keytools.c: Don't check for return from
> @@ -17,7 +17,7 @@ Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.c=
om<mailto:ovidiu.panait@windriver.com>>
>   1 file changed, 1 insertion(+), 4 deletions(-)
>
>  diff --git a/snmplib/keytools.c b/snmplib/keytools.c
> -index 129a7c0..2fc1efc 100644
> +index 14a452a..fb1694b 100644
>  --- a/snmplib/keytools.c
>  +++ b/snmplib/keytools.c
>  @@ -183,10 +183,7 @@ generate_Ku(const oid * hashtype, u_int hashtype_le=
n,
> diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/0002-con=
figure-fix-a-cc-check-issue.patch b/meta-networking/recipes-protocols/net-s=
nmp/net-snmp/0002-configure-fix-a-cc-check-issue.patch
> deleted file mode 100644
> index c973bde72..000000000
> --- a/meta-networking/recipes-protocols/net-snmp/net-snmp/0002-configure-=
fix-a-cc-check-issue.patch
> +++ /dev/null
> @@ -1,28 +0,0 @@
> -From 0a02ac779c51a2b4af3b58cb96967bf3eff80367 Mon Sep 17 00:00:00 2001
> -From: Wenlin Kang <wenlin.kang@windriver.com<mailto:wenlin.kang@windrive=
r.com>>
> -Date: Wed, 24 May 2017 16:45:34 +0800
> -Subject: [PATCH] configure: fix a cc check issue.
> -
> -When has "." in cc value, the expression
> -$myperl -V:cc | $myperl -n -e 'print if (s/^\s*cc=3D.([-=3D\w\s\/]+).;\s=
*/$1/);'
> -can't get corretly the cc's value.
> -
> -Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com<mailto:wenlin.kang=
@windriver.com>>
> -
> ----
> - configure.d/config_project_perl_python | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/configure.d/config_project_perl_python b/configure.d/config=
_project_perl_python
> -index 475c843..22d2ad3 100644
> ---- a/configure.d/config_project_perl_python
> -+++ b/configure.d/config_project_perl_python
> -@@ -87,7 +87,7 @@ if test "x$install_perl" !=3D "xno" ; then
> -     if test "x$enable_perl_cc_checks" !=3D "xno" ; then
> -         AC_MSG_CHECKING([for Perl cc])
> -         changequote(, )
> --        PERLCC=3D`$myperl -V:cc | $myperl -n -e 'print if (s/^\s*cc=3D.=
([-=3D\w\s\/]+).;\s*/$1/);'`
> -+        PERLCC=3D`$myperl -V:cc | $myperl -n -e 'print if (s/^\s*cc=3D.=
([-=3D\.\w\s\/]+).;\s*/$1/);'`
> -         changequote([, ])
> -         if test "x$PERLCC" !=3D "x" ; then
> -             AC_MSG_RESULT([$PERLCC])
> diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/0004-con=
figure-fix-incorrect-variable.patch b/meta-networking/recipes-protocols/net=
-snmp/net-snmp/0004-configure-fix-incorrect-variable.patch
> index bfddc63dd..6e224188a 100644
> --- a/meta-networking/recipes-protocols/net-snmp/net-snmp/0004-configure-=
fix-incorrect-variable.patch
> +++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/0004-configure-=
fix-incorrect-variable.patch
> @@ -1,4 +1,4 @@
> -From 011bdcd07f2a289d0cfc1b411c03c0cc7c42dad1 Mon Sep 17 00:00:00 2001
> +From 6d655ba677563ac9d62d4d8eee59fdb39d486c02 Mon Sep 17 00:00:00 2001
>  From: Wenlin Kang <wenlin.kang@windriver.com<mailto:wenlin.kang@windrive=
r.com>>
>  Date: Wed, 24 May 2017 17:10:20 +0800
>  Subject: [PATCH] configure: fix incorrect variable
> @@ -14,10 +14,10 @@ Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com=
<mailto:wenlin.kang@windriver.com>>
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
>  diff --git a/Makefile.in<https://urldefense.com/v3/__http:/Makefile.in__=
;!!AjveYdw8EvQ!ZzYDx7kFVh5e_WREHKtwOKlB0gzWJ5uBreZgWz17XbqSPIpRoCWlAxdMV_d3=
cedWCD1nDmiLXuSYtsi07kql$> b/Makefile.in<https://urldefense.com/v3/__http:/=
Makefile.in__;!!AjveYdw8EvQ!ZzYDx7kFVh5e_WREHKtwOKlB0gzWJ5uBreZgWz17XbqSPIp=
RoCWlAxdMV_d3cedWCD1nDmiLXuSYtsi07kql$>
> -index 912f6b2..a53d1b2 100644
> +index f1cbbf5..1545be3 100644
>  --- a/Makefile.in<https://urldefense.com/v3/__http:/Makefile.in__;!!Ajve=
Ydw8EvQ!ZzYDx7kFVh5e_WREHKtwOKlB0gzWJ5uBreZgWz17XbqSPIpRoCWlAxdMV_d3cedWCD1=
nDmiLXuSYtsi07kql$>
>  +++ b/Makefile.in<https://urldefense.com/v3/__http:/Makefile.in__;!!Ajve=
Ydw8EvQ!ZzYDx7kFVh5e_WREHKtwOKlB0gzWJ5uBreZgWz17XbqSPIpRoCWlAxdMV_d3cedWCD1=
nDmiLXuSYtsi07kql$>
> -@@ -174,7 +174,7 @@ OTHERCLEANTODOS=3Dperlclean @PYTHONCLEANTARGS@ clean=
features perlcleanfeatures pyt
> +@@ -173,7 +173,7 @@ OTHERCLEANTODOS=3Dperlclean @PYTHONCLEANTARGS@ clean=
features perlcleanfeatures pyt
>   #
>   # override LD_RUN_PATH to avoid dependencies on the build directory
>   perlmodules: perlmakefiles subdirs
> diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/fix-libt=
ool-finish.patch b/meta-networking/recipes-protocols/net-snmp/net-snmp/fix-=
libtool-finish.patch
> index 26dd014ce..409c1e03c 100644
> --- a/meta-networking/recipes-protocols/net-snmp/net-snmp/fix-libtool-fin=
ish.patch
> +++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/fix-libtool-fin=
ish.patch
> @@ -1,4 +1,4 @@
> -From 27444fbf8323679ea0551a3bd5f04c365143d8c0 Mon Sep 17 00:00:00 2001
> +From ab1d77c52e84746e75506a2870783806bc77f396 Mon Sep 17 00:00:00 2001
>  From: "Roy.Li" <rongqing.li@windriver.com<mailto:rongqing.li@windriver.c=
om>>
>  Date: Fri, 16 Jan 2015 14:14:01 +0800
>  Subject: [PATCH] net-snmp: fix "libtool --finish"
> @@ -20,11 +20,11 @@ Signed-off-by: Roy.Li<https://urldefense.com/v3/__htt=
p:/Roy.Li__;!!AjveYdw8EvQ!ZzYDx7kFVh5e_WREHKtwOKlB0gzWJ5uBreZgWz17XbqSPIpRo=
CWlAxdMV_d3cedWCD1nDmiLXuSYttQgWTFr$> <rongqing.li@windriver.com<mailto:ron=
gqing.li@windriver.com>>
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
>  diff --git a/Makefile.top<https://urldefense.com/v3/__http:/Makefile.top=
__;!!AjveYdw8EvQ!ZzYDx7kFVh5e_WREHKtwOKlB0gzWJ5uBreZgWz17XbqSPIpRoCWlAxdMV_=
d3cedWCD1nDmiLXuSYticrioNt$> b/Makefile.top<https://urldefense.com/v3/__htt=
p:/Makefile.top__;!!AjveYdw8EvQ!ZzYDx7kFVh5e_WREHKtwOKlB0gzWJ5uBreZgWz17Xbq=
SPIpRoCWlAxdMV_d3cedWCD1nDmiLXuSYticrioNt$>
> -index 6315401..fc0ee06 100644
> +index a962c54..1ba5607 100644
>  --- a/Makefile.top<https://urldefense.com/v3/__http:/Makefile.top__;!!Aj=
veYdw8EvQ!ZzYDx7kFVh5e_WREHKtwOKlB0gzWJ5uBreZgWz17XbqSPIpRoCWlAxdMV_d3cedWC=
D1nDmiLXuSYticrioNt$>
>  +++ b/Makefile.top<https://urldefense.com/v3/__http:/Makefile.top__;!!Aj=
veYdw8EvQ!ZzYDx7kFVh5e_WREHKtwOKlB0gzWJ5uBreZgWz17XbqSPIpRoCWlAxdMV_d3cedWC=
D1nDmiLXuSYticrioNt$>
>  @@ -89,7 +89,7 @@ LIBREVISION =3D 0
> - LIB_LD_CMD      =3D $(LIBTOOL) --mode=3Dlink $(LINKCC) $(CFLAGS) -rpath=
 $(libdir) -version-info $(LIBCURRENT):$(LIBREVISION):$(LIBAGE) -o
> + LIB_LD_CMD      =3D $(LIBTOOL) --mode=3Dlink $(LINKCC) $(CFLAGS) -rpath=
 $(libdir) -version-info $(LIBCURRENT):$(LIBREVISION):$(LIBAGE) @LD_NO_UNDE=
FINED@ -o
>   LIB_EXTENSION   =3D la
>   LIB_VERSION     =3D
>  -LIB_LDCONFIG_CMD =3D $(LIBTOOL) --mode=3Dfinish $(INSTALL_PREFIX)$(libd=
ir)
> diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp=
-5.7.2-fix-engineBoots-value-on-SIGHUP.patch b/meta-networking/recipes-prot=
ocols/net-snmp/net-snmp/net-snmp-5.7.2-fix-engineBoots-value-on-SIGHUP.patc=
h
> index 022eb958f..87f192e5b 100644
> --- a/meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-5.7.2-=
fix-engineBoots-value-on-SIGHUP.patch
> +++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-5.7.2-=
fix-engineBoots-value-on-SIGHUP.patch
> @@ -1,4 +1,4 @@
> -From 1e3178835217ba89aa355e2b6b88e490f17be16d Mon Sep 17 00:00:00 2001
> +From 5ad4eab43c1ea63ff343bba64d576440e8783e75 Mon Sep 17 00:00:00 2001
>  From: Zheng Ruoqin <zhengrq.fnst@fujitsu.com<mailto:zhengrq.fnst@fujitsu=
.com>>
>  Date: Wed, 9 Jun 2021 15:47:30 +0900
>  Subject: [PATCH] net snmp: fix engineBoots value on SIGHUP
> @@ -7,6 +7,7 @@ Upstream-Status: Pending
>
>  Signed-off-by: Marian Florea <marian.florea@windriver.com<mailto:marian.=
florea@windriver.com>>
>  Signed-off-by: Li Zhou <li.zhou@windriver.com<mailto:li.zhou@windriver.c=
om>>
> +Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com<mailto:ovidiu.=
panait@windriver.com>>
>
>  ---
>   agent/snmpd.c    | 1 +
> @@ -14,19 +15,18 @@ Signed-off-by: Li Zhou <li.zhou@windriver.com<mailto:=
li.zhou@windriver.com>>
>   2 files changed, 3 insertions(+), 2 deletions(-)
>
>  diff --git a/agent/snmpd.c b/agent/snmpd.c
> -index 1af439f..355b510 100644
> +index 90de12d..1ccc4db 100644
>  --- a/agent/snmpd.c
>  +++ b/agent/snmpd.c
> -@@ -1208,6 +1208,7 @@ receive(void)
> -           snmp_log(LOG_INFO, "NET-SNMP version %s restarted\n",
> -                    netsnmp_get_version());
> -             update_config();
> -+          snmp_store(app_name);
> -             send_easy_trap(SNMP_TRAP_ENTERPRISESPECIFIC, 3);
> - #if HAVE_SIGPROCMASK
> -             ret =3D sigprocmask(SIG_UNBLOCK, &set, NULL);
> +     snmp_log(LOG_INFO, "NET-SNMP version %s restarted\n",
> +              netsnmp_get_version());
> +     update_config();
> ++    snmp_store(app_name);
> +     send_easy_trap(SNMP_TRAP_ENTERPRISESPECIFIC, 3);
> + #ifdef HAVE_SIGPROCMASK
> +     ret =3D sigprocmask(SIG_UNBLOCK, &set, NULL);
>  diff --git a/snmplib/snmpv3.c b/snmplib/snmpv3.c
> -index 29c2a0f..ada961c 100644
> +index 7b1746b..4a17e0d 100644
>  --- a/snmplib/snmpv3.c
>  +++ b/snmplib/snmpv3.c
>  @@ -1059,9 +1059,9 @@ init_snmpv3_post_config(int majorid, int minorid, =
void *serverarg,
> diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp=
-add-knob-whether-nlist.h-are-checked.patch b/meta-networking/recipes-proto=
cols/net-snmp/net-snmp/net-snmp-add-knob-whether-nlist.h-are-checked.patch
> index f1ebe2bb6..c5a453abe 100644
> --- a/meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-add-kn=
ob-whether-nlist.h-are-checked.patch
> +++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-add-kn=
ob-whether-nlist.h-are-checked.patch
> @@ -1,4 +1,4 @@
> -From e507dcf8b29c55011f85d88bf05400d4717e4074 Mon Sep 17 00:00:00 2001
> +From ad65b106d3cb3c6e595381be1c45a73c1ef6eb5e Mon Sep 17 00:00:00 2001
>  From: Chong Lu <Chong.Lu@windriver.com<mailto:Chong.Lu@windriver.com>>
>  Date: Thu, 28 May 2020 09:46:34 -0500
>  Subject: [PATCH] net-snmp: add knob whether nlist.h are checked
> @@ -15,7 +15,7 @@ Signed-off-by: Chong Lu <Chong.Lu@windriver.com<mailto:=
Chong.Lu@windriver.com>>
>   1 file changed, 2 insertions(+)
>
>  diff --git a/configure.d/config_os_headers b/configure.d/config_os_heade=
rs
> -index 76ef58a..f07d512 100644
> +index b9c8c31..01c3376 100644
>  --- a/configure.d/config_os_headers
>  +++ b/configure.d/config_os_headers
>  @@ -37,6 +37,7 @@ AC_CHECK_HEADERS([getopt.h   pthread.h  regex.h      ]=
 dnl
> diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp=
-fix-for-disable-des.patch b/meta-networking/recipes-protocols/net-snmp/net=
-snmp/net-snmp-fix-for-disable-des.patch
> index 2941a3609..c382c02d8 100644
> --- a/meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-fix-fo=
r-disable-des.patch
> +++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-fix-fo=
r-disable-des.patch
> @@ -1,4 +1,4 @@
> -From 3ca4335ec1d6b7b384c134fc85d7a9e513c68376 Mon Sep 17 00:00:00 2001
> +From b1b9980853b1083f0c8b9f628f8b4c3a484d4f91 Mon Sep 17 00:00:00 2001
>  From: Jackie Huang <jackie.huang@windriver.com<mailto:jackie.huang@windr=
iver.com>>
>  Date: Thu, 22 Jun 2017 10:25:08 +0800
>  Subject: [PATCH] net-snmp: fix for --disable-des
> @@ -15,7 +15,7 @@ Signed-off-by: Jackie Huang <jackie.huang@windriver.com=
<mailto:jackie.huang@windriver.com>>
>   1 file changed, 2 insertions(+)
>
>  diff --git a/snmplib/scapi.c b/snmplib/scapi.c
> -index 00c9174..c6875e1 100644
> +index 54fdd5c..0f7e931 100644
>  --- a/snmplib/scapi.c
>  +++ b/snmplib/scapi.c
>  @@ -85,7 +85,9 @@ netsnmp_feature_child_of(usm_scapi, usm_support);
> diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp=
-testing-add-the-output-format-for-ptest.patch b/meta-networking/recipes-pr=
otocols/net-snmp/net-snmp/net-snmp-testing-add-the-output-format-for-ptest.=
patch
> index 807983f61..09ca532a7 100644
> --- a/meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-testin=
g-add-the-output-format-for-ptest.patch
> +++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-testin=
g-add-the-output-format-for-ptest.patch
> @@ -1,4 +1,4 @@
> -From 972df16e9599dffddf5d714a4cbf43008c771122 Mon Sep 17 00:00:00 2001
> +From 36a5656db7ea75dd15f35a6c1728937c6e2b901c Mon Sep 17 00:00:00 2001
>  From: Jackie Huang <jackie.huang@windriver.com<mailto:jackie.huang@windr=
iver.com>>
>  Date: Wed, 14 Jan 2015 15:10:06 +0800
>  Subject: [PATCH] testing: add the output format for ptest
> diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/reproduc=
ibility-have-printcap.patch b/meta-networking/recipes-protocols/net-snmp/ne=
t-snmp/reproducibility-have-printcap.patch
> index bf1e7bedf..c0b51c51e 100644
> --- a/meta-networking/recipes-protocols/net-snmp/net-snmp/reproducibility=
-have-printcap.patch
> +++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/reproducibility=
-have-printcap.patch
> @@ -1,4 +1,4 @@
> -From 84e362fe97f50fbad69f083bc2d8fe18f83eb2f7 Mon Sep 17 00:00:00 2001
> +From b923cd38e2503b86aedf66b767fd7f51c9f25645 Mon Sep 17 00:00:00 2001
>  From: "douglas.royds" <douglas.royds@taitradio.com<mailto:douglas.royds@=
taitradio.com>>
>  Date: Wed, 21 Nov 2018 13:52:18 +1300
>  Subject: [PATCH] net-snmp: Reproducibility: Don't check build host for
> @@ -13,7 +13,7 @@ set in the environment to "yes" or "no" as appropriate =
for the target platform.
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
>  diff --git a/configure.d/config_os_misc4 b/configure.d/config_os_misc4
> -index 6f23c8e..8cea75a 100644
> +index b6864d9..07ca922 100644
>  --- a/configure.d/config_os_misc4
>  +++ b/configure.d/config_os_misc4
>  @@ -99,9 +99,9 @@ if test x$LPSTAT_PATH !=3D x; then
> diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.1.bb=
<https://urldefense.com/v3/__http:/net-snmp_5.9.1.bb__;!!AjveYdw8EvQ!ZzYDx7=
kFVh5e_WREHKtwOKlB0gzWJ5uBreZgWz17XbqSPIpRoCWlAxdMV_d3cedWCD1nDmiLXuSYtgJft=
tSA$> b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.3.bb<https:=
//urldefense.com/v3/__http:/net-snmp_5.9.3.bb__;!!AjveYdw8EvQ!ZzYDx7kFVh5e_=
WREHKtwOKlB0gzWJ5uBreZgWz17XbqSPIpRoCWlAxdMV_d3cedWCD1nDmiLXuSYtg4FzuZn$>
> similarity index 98%
> rename from meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.1.bb<=
https://urldefense.com/v3/__http:/net-snmp_5.9.1.bb__;!!AjveYdw8EvQ!ZzYDx7k=
FVh5e_WREHKtwOKlB0gzWJ5uBreZgWz17XbqSPIpRoCWlAxdMV_d3cedWCD1nDmiLXuSYtgJftt=
SA$>
> rename to meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.3.bb<ht=
tps://urldefense.com/v3/__http:/net-snmp_5.9.3.bb__;!!AjveYdw8EvQ!ZzYDx7kFV=
h5e_WREHKtwOKlB0gzWJ5uBreZgWz17XbqSPIpRoCWlAxdMV_d3cedWCD1nDmiLXuSYtg4FzuZn=
$>
> index 30c0ce74c..7af514756 100644
> --- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.1.bb<https:=
//urldefense.com/v3/__http:/net-snmp_5.9.1.bb__;!!AjveYdw8EvQ!ZzYDx7kFVh5e_=
WREHKtwOKlB0gzWJ5uBreZgWz17XbqSPIpRoCWlAxdMV_d3cedWCD1nDmiLXuSYtgJfttSA$>
> +++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.3.bb<https:=
//urldefense.com/v3/__http:/net-snmp_5.9.3.bb__;!!AjveYdw8EvQ!ZzYDx7kFVh5e_=
WREHKtwOKlB0gzWJ5uBreZgWz17XbqSPIpRoCWlAxdMV_d3cedWCD1nDmiLXuSYtg4FzuZn$>
> @@ -21,15 +21,13 @@ SRC_URI =3D "${SOURCEFORGE_MIRROR}/net-snmp/net-snmp-=
${PV}.tar.gz \
>             file://0001-config_os_headers-Error-Fix.patch \
>             file://0001-snmplib-keytools.c-Don-t-check-for-return-from-EV=
P_M.patch \
>             file://0001-get_pid_from_inode-Include-limit.h.patch \
> -           file://0002-configure-fix-a-cc-check-issue.patch \
>             file://0004-configure-fix-incorrect-variable.patch \
>             file://net-snmp-5.7.2-fix-engineBoots-value-on-SIGHUP.patch \
>             file://net-snmp-fix-for-disable-des.patch \
>             file://reproducibility-have-printcap.patch \
>             file://0001-ac_add_search_path.m4-keep-consistent-between-32b=
it.patch \
> -           file://0001-snmpd-always-exit-after-displaying-usage.patch \
>             "
> -SRC_URI[sha256sum] =3D "eb7fd4a44de6cddbffd9a92a85ad1309e5c1054fb9d5a7dd=
93079c8953f48c3f"
> +SRC_URI[sha256sum] =3D "2097f29b7e1bf3f1300b4bae52fa2308d0bb8d5d3998dbe0=
2f9462a413a2ef0a"
>
>  UPSTREAM_CHECK_URI =3D "https://sourceforge.net/projects/net-snmp/files/=
net-snmp/<https://urldefense.com/v3/__https:/sourceforge.net/projects/net-s=
nmp/files/net-snmp/__;!!AjveYdw8EvQ!ZzYDx7kFVh5e_WREHKtwOKlB0gzWJ5uBreZgWz1=
7XbqSPIpRoCWlAxdMV_d3cedWCD1nDmiLXuSYttt45kxq$>"
>  UPSTREAM_CHECK_REGEX =3D "/net-snmp/(?P<pver>\d+(\.\d+)+)/"
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#99037): https://lists.openembedded.org/g/openembedded=
-devel/message/99037<https://urldefense.com/v3/__https:/lists.openembedded.=
org/g/openembedded-devel/message/99037__;!!AjveYdw8EvQ!ZzYDx7kFVh5e_WREHKtw=
OKlB0gzWJ5uBreZgWz17XbqSPIpRoCWlAxdMV_d3cedWCD1nDmiLXuSYtnWSrQ1-$>
> Mute This Topic: https://lists.openembedded.org/mt/94085410/1997914<https=
://urldefense.com/v3/__https:/lists.openembedded.org/mt/94085410/1997914__;=
!!AjveYdw8EvQ!ZzYDx7kFVh5e_WREHKtwOKlB0gzWJ5uBreZgWz17XbqSPIpRoCWlAxdMV_d3c=
edWCD1nDmiLXuSYtnZeynhZ$>
> Group Owner: openembedded-devel+owner@lists.openembedded.org<mailto:opene=
mbedded-devel%2Bowner@lists.openembedded.org>
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub<ht=
tps://urldefense.com/v3/__https:/lists.openembedded.org/g/openembedded-deve=
l/unsub__;!!AjveYdw8EvQ!ZzYDx7kFVh5e_WREHKtwOKlB0gzWJ5uBreZgWz17XbqSPIpRoCW=
lAxdMV_d3cedWCD1nDmiLXuSYttC2KpO6$> [raj.khem@gmail.com<mailto:raj.khem@gma=
il.com>]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>



--_000_DM4PR11MB5550556C69874182BEFCB0ACE45C9DM4PR11MB5550namp_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<!--[if !mso]><style>v\:* {behavior:url(#default#VML);}
o\:* {behavior:url(#default#VML);}
w\:* {behavior:url(#default#VML);}
.shape {behavior:url(#default#VML);}
</style><![endif]--><style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
.MsoChpDefault
	{mso-style-type:export-only;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style>
</head>
<body lang=3D"EN-IN" link=3D"blue" vlink=3D"#954F72" style=3D"word-wrap:bre=
ak-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US">Hi Khem Raj,<o:p></o:p></span><=
/p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Please ignore this patch, have =
sent again fresh patch with
</span>=93[kirkstone]=94 in subject.</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Best Regards,</p>
<p class=3D"MsoNormal">Narpat Mali</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Sent from <a href=3D"https://go.microsoft.com/fwlink=
/?LinkId=3D550986">
Mail</a> for Windows</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div style=3D"mso-element:para-border-div;border:none;border-top:solid #E1E=
1E1 1.0pt;padding:3.0pt 0cm 0cm 0cm">
<p class=3D"MsoNormal" style=3D"border:none;padding:0cm"><b>From: </b><a hr=
ef=3D"mailto:Narpat.Mali@windriver.com">Mali, Narpat</a><br>
<b>Sent: </b>04 October 2022 12:45<br>
<b>To: </b><a href=3D"mailto:raj.khem@gmail.com">Khem Raj</a><br>
<b>Cc: </b><a href=3D"mailto:Hari.GPillai@windriver.com">G Pillai, Hari</a>=
; <a href=3D"mailto:Archana.Polampalli@windriver.com">
Polampalli, Archana</a>; <a href=3D"mailto:Yogita.Urade@windriver.com">Urad=
e, Yogita</a>;
<a href=3D"mailto:openembedded-devel@lists.openembedded.org">openembedded-d=
evel@lists.openembedded.org</a><br>
<b>Subject: </b>RE: [oe] [kirkstone] [PATCH 1/1] net-snmp: upgrade 5.9.1 -&=
gt; 5.9.3</p>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Hi Khem Raj,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Have added the =93[kirkstone]=94 in subject.<o:p></o=
:p></p>
<p class=3D"MsoNormal">Do I need to send the patch again ?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Best Regards,<o:p></o:p></p>
<p class=3D"MsoNormal">Narpat Mali <o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Sent from <a href=3D"https://go.microsoft.com/fwlink=
/?LinkId=3D550986">
Mail</a> for Windows<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0cm =
0cm 0cm">
<p class=3D"MsoNormal"><b>From: </b><a href=3D"mailto:raj.khem@gmail.com">K=
hem Raj</a><br>
<b>Sent: </b>04 October 2022 01:11<br>
<b>To: </b><a href=3D"mailto:Narpat.Mali@windriver.com">Mali, Narpat</a><br=
>
<b>Cc: </b><a href=3D"mailto:Hari.GPillai@windriver.com">G Pillai, Hari</a>=
; <a href=3D"mailto:Archana.Polampalli@windriver.com">
Polampalli, Archana</a>; <a href=3D"mailto:Yogita.Urade@windriver.com">Urad=
e, Yogita</a>;
<a href=3D"mailto:openembedded-devel@lists.openembedded.org">openembedded-d=
evel@lists.openembedded.org</a><br>
<b>Subject: </b>Re: [oe] [meta-openembedded][PATCH 1/1] net-snmp: upgrade 5=
.9.1 -&gt; 5.9.3<o:p></o:p></p>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div style=3D"border:solid #9C6500 1.0pt;padding:2.0pt 2.0pt 2.0pt 2.0pt">
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto;line-height:12.0pt;background:#FFEB9C">
<span style=3D"font-size:10.0pt;color:red">[Please note: This e-mail is fro=
m an EXTERNAL e-mail address]</span><o:p></o:p></p>
</div>
<div>
<div>
<p class=3D"MsoNormal">Ok it will be good to add [kirkstone] in subject<o:p=
></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">So folks know where intend it for&nbsp;<o:p></o:p></=
p>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<div>
<p class=3D"MsoNormal">On Mon, Oct 3, 2022 at 10:12 AM Mali, Narpat &lt;<a =
href=3D"mailto:Narpat.Mali@windriver.com">Narpat.Mali@windriver.com</a>&gt;=
 wrote:<o:p></o:p></p>
</div>
<blockquote style=3D"border:none;border-left:solid #CCCCCC 1.0pt;padding:0c=
m 0cm 0cm 6.0pt;margin-left:4.8pt;margin-top:5.0pt;margin-right:0cm;margin-=
bottom:5.0pt">
<div>
<div>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto;margin-left:9.6pt">
Hi Khem Raj,<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto;margin-left:9.6pt">
&nbsp;<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto;margin-left:9.6pt">
It is the same commit but, we need this patch commit for =93kirkstone=94 br=
anch of meta-openembedded.<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto;margin-left:9.6pt">
We observed that the =93master=94 branch has =93net-snmp 5.9.3=94 version a=
t <a href=3D"https://urldefense.com/v3/__https:/git.openembedded.org/meta-o=
penembedded/tree/meta-networking/recipes-protocols/net-snmp__;!!AjveYdw8EvQ=
!ZzYDx7kFVh5e_WREHKtwOKlB0gzWJ5uBreZgWz17XbqSPIpRoCWlAxdMV_d3cedWCD1nDmiLXu=
SYtigk1r7C$" target=3D"_blank">
https://git.openembedded.org/meta-openembedded/tree/meta-networking/recipes=
-protocols/net-snmp</a> and the =93kirkstone=94 branch has =93net-snmp 5.9.=
1=94 at
<a href=3D"https://urldefense.com/v3/__https:/git.openembedded.org/meta-ope=
nembedded/tree/meta-networking/recipes-protocols/net-snmp?h=3Dkirkstone__;!=
!AjveYdw8EvQ!ZzYDx7kFVh5e_WREHKtwOKlB0gzWJ5uBreZgWz17XbqSPIpRoCWlAxdMV_d3ce=
dWCD1nDmiLXuSYtnBwmXJ0$" target=3D"_blank">
https://git.openembedded.org/meta-openembedded/tree/meta-networking/recipes=
-protocols/net-snmp?h=3Dkirkstone</a><o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto;margin-left:9.6pt">
&nbsp;<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto;margin-left:9.6pt">
Since, our product is using =93kirkstone=94 branch of meta-openembedded so,=
 CVE-2022-24805 to CVE-2022-24810 are vulnerable for our product.
<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto;margin-left:9.6pt">
Could you please let us know, How to get net-snmp upgraded to 5.9.3 version=
 in =93kirkstone=94 branch ?<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto;margin-left:9.6pt">
&nbsp;<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto;margin-left:9.6pt">
Best Regards,<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto;margin-left:9.6pt">
Narpat Mali<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto;margin-left:9.6pt">
&nbsp;<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto;margin-left:9.6pt">
Sent from <a href=3D"https://urldefense.com/v3/__https:/go.microsoft.com/fw=
link/?LinkId=3D550986__;!!AjveYdw8EvQ!ZzYDx7kFVh5e_WREHKtwOKlB0gzWJ5uBreZgW=
z17XbqSPIpRoCWlAxdMV_d3cedWCD1nDmiLXuSYtrYRmqeF$" target=3D"_blank">
Mail</a> for Windows<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto;margin-left:9.6pt">
&nbsp;<o:p></o:p></p>
</div>
<p class=3D"MsoNormal" style=3D"margin-left:9.6pt"><img border=3D"0" width=
=3D"457" height=3D"2" style=3D"width:4.7638in;height:.0208in" id=3D"Horizon=
tal_x0020_Line_x0020_1" src=3D"cid:image001.png@01D8D98A.2BEEE3A0"><o:p></o=
:p></p>
<div id=3D"m_-932456720383352559divRplyFwdMsg">
<p class=3D"MsoNormal" style=3D"margin-left:9.6pt"><b><span style=3D"color:=
black">From:</span></b><span style=3D"color:black"> Khem Raj &lt;</span><a =
href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>=
<span style=3D"color:black">&gt;<br>
<b>Sent:</b> Monday, October 3, 2022 12:29:18 PM<br>
<b>To:</b> Mali, Narpat &lt;</span><a href=3D"mailto:Narpat.Mali@windriver.=
com" target=3D"_blank">Narpat.Mali@windriver.com</a><span style=3D"color:bl=
ack">&gt;<br>
<b>Cc:</b> </span><a href=3D"mailto:openembedded-devel@lists.openembedded.o=
rg" target=3D"_blank">openembedded-devel@lists.openembedded.org</a><span st=
yle=3D"color:black"> &lt;</span><a href=3D"mailto:openembedded-devel@lists.=
openembedded.org" target=3D"_blank">openembedded-devel@lists.openembedded.o=
rg</a><span style=3D"color:black">&gt;;
 Polampalli, Archana &lt;</span><a href=3D"mailto:Archana.Polampalli@windri=
ver.com" target=3D"_blank">Archana.Polampalli@windriver.com</a><span style=
=3D"color:black">&gt;; Urade, Yogita &lt;</span><a href=3D"mailto:Yogita.Ur=
ade@windriver.com" target=3D"_blank">Yogita.Urade@windriver.com</a><span st=
yle=3D"color:black">&gt;;
 G Pillai, Hari &lt;</span><a href=3D"mailto:Hari.GPillai@windriver.com" ta=
rget=3D"_blank">Hari.GPillai@windriver.com</a><span style=3D"color:black">&=
gt;<br>
<b>Subject:</b> Re: [oe] [meta-openembedded][PATCH 1/1] net-snmp: upgrade 5=
.9.1 -&gt; 5.9.3</span>
<o:p></o:p></p>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:9.6pt">&nbsp;<o:p></o:p></p>
</div>
</div>
<div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:9.6pt">[Please note: This e-mai=
l is from an EXTERNAL e-mail address]<o:p></o:p></p>
</div>
</div>
</div>
</blockquote>
</div>
</div>
</div>
<p class=3D"MsoNormal" style=3D"margin-left:4.8pt"><br>
<br>
how different is this from<br>
<a href=3D"https://urldefense.com/v3/__https:/git.openembedded.org/meta-ope=
nembedded/commit/?id=3Dbf4a826c7de51dcdac87f81fa2bd2301629d50db__;!!AjveYdw=
8EvQ!ZzYDx7kFVh5e_WREHKtwOKlB0gzWJ5uBreZgWz17XbqSPIpRoCWlAxdMV_d3cedWCD1nDm=
iLXuSYtpcGLzXP$" target=3D"_blank">https://git.openembedded.org/meta-openem=
bedded/commit/?id=3Dbf4a826c7de51dcdac87f81fa2bd2301629d50db</a><br>
<br>
On Sun, Oct 2, 2022 at 11:27 PM Narpat Mali &lt;<a href=3D"mailto:narpat.ma=
li@windriver.com" target=3D"_blank">narpat.mali@windriver.com</a>&gt; wrote=
:<br>
&gt;<br>
&gt; Issue: LIN1022-1131, LIN1022-1132, LIN1022-1133, LIN1022-1134, LIN1022=
-1135<br>
&gt; Issue: LIN1022-1136<br>
&gt;<br>
&gt; Upgrade summary:<br>
&gt; ----------------<br>
&gt; - drop 0002-configure-fix-a-cc-check-issue.patch, as it was replaced w=
ith<br>
&gt;&nbsp;&nbsp; upstream commit <a href=3D"https://urldefense.com/v3/__htt=
ps:/github.com/net-snmp/net-snmp/commit/dbb49acfa2af__;!!AjveYdw8EvQ!ZzYDx7=
kFVh5e_WREHKtwOKlB0gzWJ5uBreZgWz17XbqSPIpRoCWlAxdMV_d3cedWCD1nDmiLXuSYtoZJY=
Kse$" target=3D"_blank">
https://github.com/net-snmp/net-snmp/commit/dbb49acfa2af</a><br>
&gt; - drop 0001-snmpd-always-exit-after-displaying-usage.patch backport<br=
>
&gt; - rebase net-snmp-5.7.2-fix-engineBoots-value-on-SIGHUP.patch manually=
<br>
&gt; - refresh patches with devtool to get rid of fuzz<br>
&gt;<br>
&gt; Changelog:<br>
&gt; ----------<br>
&gt; *5.9.3*:<br>
&gt; security:<br>
&gt;&nbsp;&nbsp; - These two CVEs can be exploited by a user with read-only=
 credentials:<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - CVE-2022-24805 A buffer overflow=
 in the handling of the INDEX of<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; NET-SNMP-VACM-MIB can =
cause an out-of-bounds memory access.<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - CVE-2022-24809 A malformed OID i=
n a GET-NEXT to the nsVacmAccessTable<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; can cause a NULL point=
er dereference.<br>
&gt;&nbsp;&nbsp; - These CVEs can be exploited by a user with read-write cr=
edentials:<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - CVE-2022-24806 Improper Input Va=
lidation when SETing malformed<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; OIDs in master agent a=
nd subagent simultaneously<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - CVE-2022-24807 A malformed OID i=
n a SET request to<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SNMP-VIEW-BASED-ACM-MI=
B::vacmAccessTable can cause an<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; out-of-bounds memory a=
ccess.<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - CVE-2022-24808 A malformed OID i=
n a SET request to<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; NET-SNMP-AGENT-MIB::ns=
LogTable can cause a NULL pointer dereference<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - CVE-2022-24810 A malformed OID i=
n a SET to the nsVacmAccessTable<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; can cause a NULL point=
er dereference.<br>
&gt;&nbsp;&nbsp; - To avoid these flaws, use strong SNMPv3 credentials and =
do not share them.<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; If you must use SNMPv1 or SNMPv2c, use a compl=
ex community string<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; and enhance the protection by restricting acce=
ss to a given IP address<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; range.<br>
&gt;&nbsp;&nbsp; - Thanks are due to Yu Zhang of VARAS@IIE and Nanyu Zhong =
of VARAS@IIE for<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; reporting the following CVEs that have been fi=
xed in this release, and<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; to Arista Networks for providing fixes.<br>
&gt;<br>
&gt; Windows:<br>
&gt;&nbsp;&nbsp; - WinExtDLL: Fix multiple compiler warnings<br>
&gt;&nbsp;&nbsp; - WinExtDLL: Make long strings occupy a single line Make i=
t easier to<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; look up error messages in the source code by m=
aking long strings<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; occupy a single source code line.<br>
&gt;&nbsp;&nbsp; - WinExtDLL: Restore MIB-II support Make winExtDLL work on=
 64-bit<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; Windows systems&quot;) caused snmpd to skip MI=
B-II on 64-bit systems.<br>
&gt;<br>
&gt; IF-MIB: Update ifTable entries even if the interface name has changed<=
br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; At least on Linux a network interface index ma=
y be reused for a<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; network interface with a different name. Hence=
 this patch that<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; enables replacing network interface informatio=
n even if the network<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; interface name has changed.<br>
&gt;<br>
&gt; unspecified:<br>
&gt;&nbsp;&nbsp; - Moved transport code into a separate subdirectory in snm=
plib<br>
&gt;&nbsp;&nbsp; - Snmplib: remove inline versions of container funcs&quot;=
.<br>
&gt;<br>
&gt; misc:<br>
&gt;&nbsp;&nbsp; - snmp-create-v3-user: Fix the snmpd.conf path&nbsp;&nbsp;=
 @datadir@ is<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; expanded in ${datarootdir} so datarootdir must=
 be set before<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; @datadir@ is used.<br>
&gt;<br>
&gt; *5.9.2*:<br>
&gt; skipped due to a last minute library versioning found bug -- use 5.9.3=
 instead<br>
&gt;<br>
&gt; (master rev: bf4a826c7de51dcdac87f81fa2bd2301629d50db) -- backport<br>
&gt;<br>
&gt; Signed-off-by: Narpat Mali &lt;<a href=3D"mailto:narpat.mali@windriver=
.com" target=3D"_blank">narpat.mali@windriver.com</a>&gt;<br>
&gt; ---<br>
&gt;&nbsp; ...ath.m4-keep-consistent-between-32bit.patch |&nbsp; 8 ++-<br>
&gt;&nbsp; .../0001-config_os_headers-Error-Fix.patch&nbsp;&nbsp;&nbsp; |&n=
bsp; 4 +-<br>
&gt;&nbsp; ...1-get_pid_from_inode-Include-limit.h.patch |&nbsp; 6 +-<br>
&gt;&nbsp; ...d-always-exit-after-displaying-usage.patch | 55 -------------=
------<br>
&gt;&nbsp; ....c-Don-t-check-for-return-from-EVP_M.patch |&nbsp; 4 +-<br>
&gt;&nbsp; .../0002-configure-fix-a-cc-check-issue.patch | 28 ----------<br=
>
&gt;&nbsp; ...004-configure-fix-incorrect-variable.patch |&nbsp; 6 +-<br>
&gt;&nbsp; .../net-snmp/fix-libtool-finish.patch&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; |&nbsp; 6 +-<br>
&gt;&nbsp; ....7.2-fix-engineBoots-value-on-SIGHUP.patch | 22 ++++----<br>
&gt;&nbsp; ...add-knob-whether-nlist.h-are-checked.patch |&nbsp; 4 +-<br>
&gt;&nbsp; .../net-snmp-fix-for-disable-des.patch&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; |&nbsp; 4 +-<br>
&gt;&nbsp; ...ting-add-the-output-format-for-ptest.patch |&nbsp; 2 +-<br>
&gt;&nbsp; .../reproducibility-have-printcap.patch&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; |&nbsp; 4 +-<br>
&gt;&nbsp; .../{<a href=3D"https://urldefense.com/v3/__http:/net-snmp_5.9.1=
.bb__;!!AjveYdw8EvQ!ZzYDx7kFVh5e_WREHKtwOKlB0gzWJ5uBreZgWz17XbqSPIpRoCWlAxd=
MV_d3cedWCD1nDmiLXuSYtgJfttSA$" target=3D"_blank">net-snmp_5.9.1.bb</a> =3D=
&gt;
<a href=3D"https://urldefense.com/v3/__http:/net-snmp_5.9.3.bb__;!!AjveYdw8=
EvQ!ZzYDx7kFVh5e_WREHKtwOKlB0gzWJ5uBreZgWz17XbqSPIpRoCWlAxdMV_d3cedWCD1nDmi=
LXuSYtg4FzuZn$" target=3D"_blank">
net-snmp_5.9.3.bb</a>}&nbsp; |&nbsp; 4 +-<br>
&gt;&nbsp; 14 files changed, 37 insertions(+), 120 deletions(-)<br>
&gt;&nbsp; delete mode 100644 meta-networking/recipes-protocols/net-snmp/ne=
t-snmp/0001-snmpd-always-exit-after-displaying-usage.patch<br>
&gt;&nbsp; delete mode 100644 meta-networking/recipes-protocols/net-snmp/ne=
t-snmp/0002-configure-fix-a-cc-check-issue.patch<br>
&gt;&nbsp; rename meta-networking/recipes-protocols/net-snmp/{<a href=3D"ht=
tps://urldefense.com/v3/__http:/net-snmp_5.9.1.bb__;!!AjveYdw8EvQ!ZzYDx7kFV=
h5e_WREHKtwOKlB0gzWJ5uBreZgWz17XbqSPIpRoCWlAxdMV_d3cedWCD1nDmiLXuSYtgJfttSA=
$" target=3D"_blank">net-snmp_5.9.1.bb</a> =3D&gt;
<a href=3D"https://urldefense.com/v3/__http:/net-snmp_5.9.3.bb__;!!AjveYdw8=
EvQ!ZzYDx7kFVh5e_WREHKtwOKlB0gzWJ5uBreZgWz17XbqSPIpRoCWlAxdMV_d3cedWCD1nDmi=
LXuSYtg4FzuZn$" target=3D"_blank">
net-snmp_5.9.3.bb</a>} (98%)<br>
&gt;<br>
&gt; diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-=
ac_add_search_path.m4-keep-consistent-between-32bit.patch b/meta-networking=
/recipes-protocols/net-snmp/net-snmp/0001-ac_add_search_path.m4-keep-consis=
tent-between-32bit.patch<br>
&gt; index 4cd729044..ed2ebc6d7 100644<br>
&gt; --- a/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-ac_add_=
search_path.m4-keep-consistent-between-32bit.patch<br>
&gt; +++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-ac_add_=
search_path.m4-keep-consistent-between-32bit.patch<br>
&gt; @@ -1,7 +1,8 @@<br>
&gt; -From 6f8ea2e841ad45eed193310b599d3f3b410ae91d Mon Sep 17 00:00:00 200=
1<br>
&gt; +From 98c62e24fdd05d7e8bd8149840bad8eb0feb3fb1 Mon Sep 17 00:00:00 200=
1<br>
&gt;&nbsp; From: Mingli Yu &lt;<a href=3D"mailto:mingli.yu@windriver.com" t=
arget=3D"_blank">mingli.yu@windriver.com</a>&gt;<br>
&gt;&nbsp; Date: Fri, 29 Jan 2021 08:49:15 +0000<br>
&gt; -Subject: [PATCH] ac_add_search_path.m4: keep consistent between 32bit=
 and 64bit<br>
&gt; +Subject: [PATCH] ac_add_search_path.m4: keep consistent between 32bit=
 and<br>
&gt; + 64bit<br>
&gt;<br>
&gt;&nbsp; With configure option &quot;--with-openssl=3D${STAGING_EXECPREFI=
XDIR}&quot;, it behaves<br>
&gt;&nbsp; differently between 32bit and 64bit system as the openssl lib re=
sides under<br>
&gt; @@ -15,12 +16,13 @@ So add the patch to fix the gap between 32bit and =
64bit system.<br>
&gt;&nbsp; Upstream-Status: Inappropriate [configuration specific]<br>
&gt;<br>
&gt;&nbsp; Signed-off-by: Mingli Yu &lt;<a href=3D"mailto:mingli.yu@windriv=
er.com" target=3D"_blank">mingli.yu@windriver.com</a>&gt;<br>
&gt; +<br>
&gt;&nbsp; ---<br>
&gt;&nbsp;&nbsp; m4/ac_add_search_path.m4 | 4 ++--<br>
&gt;&nbsp;&nbsp; 1 file changed, 2 insertions(+), 2 deletions(-)<br>
&gt;<br>
&gt;&nbsp; diff --git a/m4/ac_add_search_path.m4 b/m4/ac_add_search_path.m4=
<br>
&gt; -index 8e0a819..961f587 100644<br>
&gt; +index 8e0a819..e9585bc 100644<br>
&gt;&nbsp; --- a/m4/ac_add_search_path.m4<br>
&gt;&nbsp; +++ b/m4/ac_add_search_path.m4<br>
&gt;&nbsp; @@ -3,8 +3,8 @@ dnl Add a search path to the LIBS and CPPFLAGS v=
ariables<br>
&gt; diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-=
config_os_headers-Error-Fix.patch b/meta-networking/recipes-protocols/net-s=
nmp/net-snmp/0001-config_os_headers-Error-Fix.patch<br>
&gt; index 05a47f61c..f8a52a63f 100644<br>
&gt; --- a/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-config_=
os_headers-Error-Fix.patch<br>
&gt; +++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-config_=
os_headers-Error-Fix.patch<br>
&gt; @@ -1,4 +1,4 @@<br>
&gt; -From 69d4c517c07f55c505090e48d96ace8cd599fb26 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From e86d5fd52f19b85da0b7cce660c6e65ec4c0f9bb Mon Sep 17 00:00:00 200=
1<br>
&gt;&nbsp; From: Li xin &lt;<a href=3D"mailto:lixin.fnst@cn.fujitsu.com" ta=
rget=3D"_blank">lixin.fnst@cn.fujitsu.com</a>&gt;<br>
&gt;&nbsp; Date: Fri, 21 Aug 2015 18:23:13 +0900<br>
&gt;&nbsp; Subject: [PATCH] config_os_headers: Error Fix<br>
&gt; @@ -19,7 +19,7 @@ Signed-off-by: Li Xin &lt;<a href=3D"mailto:lixin.fn=
st@cn.fujitsu.com" target=3D"_blank">lixin.fnst@cn.fujitsu.com</a>&gt;<br>
&gt;&nbsp;&nbsp; 1 file changed, 2 insertions(+), 2 deletions(-)<br>
&gt;<br>
&gt;&nbsp; diff --git a/configure.d/config_os_headers b/configure.d/config_=
os_headers<br>
&gt; -index f07d512..2363b42 100644<br>
&gt; +index 01c3376..6edd85f 100644<br>
&gt;&nbsp; --- a/configure.d/config_os_headers<br>
&gt;&nbsp; +++ b/configure.d/config_os_headers<br>
&gt;&nbsp; @@ -395,8 +395,8 @@ then<br>
&gt; diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-=
get_pid_from_inode-Include-limit.h.patch b/meta-networking/recipes-protocol=
s/net-snmp/net-snmp/0001-get_pid_from_inode-Include-limit.h.patch<br>
&gt; index 22e591556..a7881a871 100644<br>
&gt; --- a/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-get_pid=
_from_inode-Include-limit.h.patch<br>
&gt; +++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-get_pid=
_from_inode-Include-limit.h.patch<br>
&gt; @@ -1,4 +1,4 @@<br>
&gt; -From 2bf1bbe1d428ed06d57aa76b03e394b72ff2216d Mon Sep 17 00:00:00 200=
1<br>
&gt; +From 8097734b27fd146f358a4edd0d1a0d28309bd9a4 Mon Sep 17 00:00:00 200=
1<br>
&gt;&nbsp; From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt;&nbsp; Date: Fri, 22 Jul 2016 18:34:39 +0000<br>
&gt;&nbsp; Subject: [PATCH] get_pid_from_inode: Include limit.h<br>
&gt; @@ -14,7 +14,7 @@ Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.kh=
em@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt;&nbsp;&nbsp; 1 file changed, 1 insertion(+)<br>
&gt;<br>
&gt;&nbsp; diff --git a/agent/mibgroup/util_funcs/get_pid_from_inode.c b/ag=
ent/mibgroup/util_funcs/get_pid_from_inode.c<br>
&gt; -index aee907d..7abaec2 100644<br>
&gt; +index 5788e1d..ea380a6 100644<br>
&gt;&nbsp; --- a/agent/mibgroup/util_funcs/get_pid_from_inode.c<br>
&gt;&nbsp; +++ b/agent/mibgroup/util_funcs/get_pid_from_inode.c<br>
&gt;&nbsp; @@ -6,6 +6,7 @@<br>
&gt; @@ -23,5 +23,5 @@ index aee907d..7abaec2 100644<br>
&gt;&nbsp;&nbsp; #include &lt;ctype.h&gt;<br>
&gt;&nbsp; +#include &lt;limits.h&gt;<br>
&gt;&nbsp;&nbsp; #include &lt;stdio.h&gt;<br>
&gt; - #if HAVE_STDLIB_H<br>
&gt; + #ifdef HAVE_STDLIB_H<br>
&gt;&nbsp;&nbsp; #include &lt;stdlib.h&gt;<br>
&gt; diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-=
snmpd-always-exit-after-displaying-usage.patch b/meta-networking/recipes-pr=
otocols/net-snmp/net-snmp/0001-snmpd-always-exit-after-displaying-usage.pat=
ch<br>
&gt; deleted file mode 100644<br>
&gt; index 4fc9e54b4..000000000<br>
&gt; --- a/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-snmpd-a=
lways-exit-after-displaying-usage.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,55 +0,0 @@<br>
&gt; -From 94ca941e06bef157bf0e13251f8ca1471daa9393 Mon Sep 17 00:00:00 200=
1<br>
&gt; -From: Kaarle Ritvanen &lt;<a href=3D"mailto:kaarle.ritvanen@datakunkk=
u.fi" target=3D"_blank">kaarle.ritvanen@datakunkku.fi</a>&gt;<br>
&gt; -Date: Fri, 27 Aug 2021 14:21:45 +0300<br>
&gt; -Subject: [PATCH] snmpd: always exit after displaying usage<br>
&gt; -<br>
&gt; -Currently, viewing the help text with -h results in snmpd being start=
ed<br>
&gt; -in the background, whereas this does not happen with --help. Similarl=
y,<br>
&gt; -when an error is detected in command line syntax, the help text is<br=
>
&gt; -displayed but sometimes snmpd gets started anyway, depending on the<b=
r>
&gt; -execution path.<br>
&gt; -<br>
&gt; -This patch makes snmpd consistently terminate whenever the usage<br>
&gt; -function gets called. It also removes the goto statements no longer<b=
r>
&gt; -needed.<br>
&gt; -<br>
&gt; -Upstream-Status: Backport<br>
&gt; -[<a href=3D"https://urldefense.com/v3/__https:/github.com/net-snmp/ne=
t-snmp/commit/94ca941e06bef157bf0e13251f8ca1471daa9393__;!!AjveYdw8EvQ!ZzYD=
x7kFVh5e_WREHKtwOKlB0gzWJ5uBreZgWz17XbqSPIpRoCWlAxdMV_d3cedWCD1nDmiLXuSYtoL=
iNbMZ$" target=3D"_blank">https://github.com/net-snmp/net-snmp/commit/94ca9=
41e06bef157bf0e13251f8ca1471daa9393</a>]<br>
&gt; -<br>
&gt; -Signed-off-by: Yi Zhao &lt;<a href=3D"mailto:yi.zhao@windriver.com" t=
arget=3D"_blank">yi.zhao@windriver.com</a>&gt;<br>
&gt; ----<br>
&gt; - agent/snmpd.c | 4 ++--<br>
&gt; - 1 file changed, 2 insertions(+), 2 deletions(-)<br>
&gt; -<br>
&gt; -diff --git a/agent/snmpd.c b/agent/snmpd.c<br>
&gt; -index f5aab0af8..90de12d99 100644<br>
&gt; ---- a/agent/snmpd.c<br>
&gt; -+++ b/agent/snmpd.c<br>
&gt; -@@ -289,6 +289,8 @@ usage(char *prog)<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &q=
uot;&nbsp; -S d|i|0-7\t\tuse -Ls &lt;facility&gt; instead\n&quot;<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &q=
uot;\n&quot;<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; );=
<br>
&gt; -+&nbsp;&nbsp;&nbsp; SOCK_CLEANUP;<br>
&gt; -+&nbsp;&nbsp;&nbsp; exit(1);<br>
&gt; - }<br>
&gt; -<br>
&gt; - static void<br>
&gt; -@@ -494,7 +496,6 @@ main(int argc, char *argv[])<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case '-':<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; if (strcasecmp(optarg, &quot;help&quot;) =3D=3D 0) {<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; usage(argv[0]);<br>
&gt; --&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; goto out;<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; }<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; if (strcasecmp(optarg, &quot;version&quot;) =3D=3D 0) {<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; version();<br>
&gt; -@@ -783,7 +784,6 @@ main(int argc, char *argv[])<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; fprintf(stderr, &quot;%s: Illegal argument -X:&quot;<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; &quot;AgentX support not compiled in.\n&quot;, argv[0]);<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; usage(argv[0]);<br>
&gt; --&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; g=
oto out;<br>
&gt; - #endif<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; break;<br>
&gt; -<br>
&gt; ---<br>
&gt; -2.25.1<br>
&gt; -<br>
&gt; diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-=
snmplib-keytools.c-Don-t-check-for-return-from-EVP_M.patch b/meta-networkin=
g/recipes-protocols/net-snmp/net-snmp/0001-snmplib-keytools.c-Don-t-check-f=
or-return-from-EVP_M.patch<br>
&gt; index 42352a6b0..af6334f72 100644<br>
&gt; --- a/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-snmplib=
-keytools.c-Don-t-check-for-return-from-EVP_M.patch<br>
&gt; +++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-snmplib=
-keytools.c-Don-t-check-for-return-from-EVP_M.patch<br>
&gt; @@ -1,4 +1,4 @@<br>
&gt; -From f3ff99736b8cccbba77349b0d10a3cee366a4c87 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From f4e1acd4f509dd26cf88da872bd5adcf884f4a5f Mon Sep 17 00:00:00 200=
1<br>
&gt;&nbsp; From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt;&nbsp; Date: Fri, 18 Sep 2015 00:28:45 -0400<br>
&gt;&nbsp; Subject: [PATCH] snmplib/keytools.c: Don't check for return from=
<br>
&gt; @@ -17,7 +17,7 @@ Signed-off-by: Ovidiu Panait &lt;<a href=3D"mailto:o=
vidiu.panait@windriver.com" target=3D"_blank">ovidiu.panait@windriver.com</=
a>&gt;<br>
&gt;&nbsp;&nbsp; 1 file changed, 1 insertion(+), 4 deletions(-)<br>
&gt;<br>
&gt;&nbsp; diff --git a/snmplib/keytools.c b/snmplib/keytools.c<br>
&gt; -index 129a7c0..2fc1efc 100644<br>
&gt; +index 14a452a..fb1694b 100644<br>
&gt;&nbsp; --- a/snmplib/keytools.c<br>
&gt;&nbsp; +++ b/snmplib/keytools.c<br>
&gt;&nbsp; @@ -183,10 +183,7 @@ generate_Ku(const oid * hashtype, u_int has=
htype_len,<br>
&gt; diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/0002-=
configure-fix-a-cc-check-issue.patch b/meta-networking/recipes-protocols/ne=
t-snmp/net-snmp/0002-configure-fix-a-cc-check-issue.patch<br>
&gt; deleted file mode 100644<br>
&gt; index c973bde72..000000000<br>
&gt; --- a/meta-networking/recipes-protocols/net-snmp/net-snmp/0002-configu=
re-fix-a-cc-check-issue.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,28 +0,0 @@<br>
&gt; -From 0a02ac779c51a2b4af3b58cb96967bf3eff80367 Mon Sep 17 00:00:00 200=
1<br>
&gt; -From: Wenlin Kang &lt;<a href=3D"mailto:wenlin.kang@windriver.com" ta=
rget=3D"_blank">wenlin.kang@windriver.com</a>&gt;<br>
&gt; -Date: Wed, 24 May 2017 16:45:34 +0800<br>
&gt; -Subject: [PATCH] configure: fix a cc check issue.<br>
&gt; -<br>
&gt; -When has &quot;.&quot; in cc value, the expression<br>
&gt; -$myperl -V:cc | $myperl -n -e 'print if (s/^\s*cc=3D.([-=3D\w\s\/]+).=
;\s*/$1/);'<br>
&gt; -can't get corretly the cc's value.<br>
&gt; -<br>
&gt; -Signed-off-by: Wenlin Kang &lt;<a href=3D"mailto:wenlin.kang@windrive=
r.com" target=3D"_blank">wenlin.kang@windriver.com</a>&gt;<br>
&gt; -<br>
&gt; ----<br>
&gt; - configure.d/config_project_perl_python | 2 +-<br>
&gt; - 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; -<br>
&gt; -diff --git a/configure.d/config_project_perl_python b/configure.d/con=
fig_project_perl_python<br>
&gt; -index 475c843..22d2ad3 100644<br>
&gt; ---- a/configure.d/config_project_perl_python<br>
&gt; -+++ b/configure.d/config_project_perl_python<br>
&gt; -@@ -87,7 +87,7 @@ if test &quot;x$install_perl&quot; !=3D &quot;xno&q=
uot; ; then<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; if test &quot;x$enable_perl_cc_checks&quot; =
!=3D &quot;xno&quot; ; then<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; AC_MSG_CHECKING([for=
 Perl cc])<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; changequote(, )<br>
&gt; --&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; PERLCC=3D`$myperl -V:cc |=
 $myperl -n -e 'print if (s/^\s*cc=3D.([-=3D\w\s\/]+).;\s*/$1/);'`<br>
&gt; -+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; PERLCC=3D`$myperl -V:cc |=
 $myperl -n -e 'print if (s/^\s*cc=3D.([-=3D\.\w\s\/]+).;\s*/$1/);'`<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; changequote([, ])<br=
>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if test &quot;x$PERL=
CC&quot; !=3D &quot;x&quot; ; then<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; AC_MSG_RESULT([$PERLCC])<br>
&gt; diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/0004-=
configure-fix-incorrect-variable.patch b/meta-networking/recipes-protocols/=
net-snmp/net-snmp/0004-configure-fix-incorrect-variable.patch<br>
&gt; index bfddc63dd..6e224188a 100644<br>
&gt; --- a/meta-networking/recipes-protocols/net-snmp/net-snmp/0004-configu=
re-fix-incorrect-variable.patch<br>
&gt; +++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/0004-configu=
re-fix-incorrect-variable.patch<br>
&gt; @@ -1,4 +1,4 @@<br>
&gt; -From 011bdcd07f2a289d0cfc1b411c03c0cc7c42dad1 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From 6d655ba677563ac9d62d4d8eee59fdb39d486c02 Mon Sep 17 00:00:00 200=
1<br>
&gt;&nbsp; From: Wenlin Kang &lt;<a href=3D"mailto:wenlin.kang@windriver.co=
m" target=3D"_blank">wenlin.kang@windriver.com</a>&gt;<br>
&gt;&nbsp; Date: Wed, 24 May 2017 17:10:20 +0800<br>
&gt;&nbsp; Subject: [PATCH] configure: fix incorrect variable<br>
&gt; @@ -14,10 +14,10 @@ Signed-off-by: Wenlin Kang &lt;<a href=3D"mailto:w=
enlin.kang@windriver.com" target=3D"_blank">wenlin.kang@windriver.com</a>&g=
t;<br>
&gt;&nbsp;&nbsp; 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;<br>
&gt;&nbsp; diff --git a/<a href=3D"https://urldefense.com/v3/__http:/Makefi=
le.in__;!!AjveYdw8EvQ!ZzYDx7kFVh5e_WREHKtwOKlB0gzWJ5uBreZgWz17XbqSPIpRoCWlA=
xdMV_d3cedWCD1nDmiLXuSYtsi07kql$">Makefile.in</a> b/<a href=3D"https://urld=
efense.com/v3/__http:/Makefile.in__;!!AjveYdw8EvQ!ZzYDx7kFVh5e_WREHKtwOKlB0=
gzWJ5uBreZgWz17XbqSPIpRoCWlAxdMV_d3cedWCD1nDmiLXuSYtsi07kql$">Makefile.in</=
a><br>
&gt; -index 912f6b2..a53d1b2 100644<br>
&gt; +index f1cbbf5..1545be3 100644<br>
&gt;&nbsp; --- a/<a href=3D"https://urldefense.com/v3/__http:/Makefile.in__=
;!!AjveYdw8EvQ!ZzYDx7kFVh5e_WREHKtwOKlB0gzWJ5uBreZgWz17XbqSPIpRoCWlAxdMV_d3=
cedWCD1nDmiLXuSYtsi07kql$">Makefile.in</a><br>
&gt;&nbsp; +++ b/<a href=3D"https://urldefense.com/v3/__http:/Makefile.in__=
;!!AjveYdw8EvQ!ZzYDx7kFVh5e_WREHKtwOKlB0gzWJ5uBreZgWz17XbqSPIpRoCWlAxdMV_d3=
cedWCD1nDmiLXuSYtsi07kql$">Makefile.in</a><br>
&gt; -@@ -174,7 +174,7 @@ OTHERCLEANTODOS=3Dperlclean @PYTHONCLEANTARGS@ cl=
eanfeatures perlcleanfeatures pyt<br>
&gt; +@@ -173,7 +173,7 @@ OTHERCLEANTODOS=3Dperlclean @PYTHONCLEANTARGS@ cl=
eanfeatures perlcleanfeatures pyt<br>
&gt;&nbsp;&nbsp; #<br>
&gt;&nbsp;&nbsp; # override LD_RUN_PATH to avoid dependencies on the build =
directory<br>
&gt;&nbsp;&nbsp; perlmodules: perlmakefiles subdirs<br>
&gt; diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/fix-l=
ibtool-finish.patch b/meta-networking/recipes-protocols/net-snmp/net-snmp/f=
ix-libtool-finish.patch<br>
&gt; index 26dd014ce..409c1e03c 100644<br>
&gt; --- a/meta-networking/recipes-protocols/net-snmp/net-snmp/fix-libtool-=
finish.patch<br>
&gt; +++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/fix-libtool-=
finish.patch<br>
&gt; @@ -1,4 +1,4 @@<br>
&gt; -From 27444fbf8323679ea0551a3bd5f04c365143d8c0 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From ab1d77c52e84746e75506a2870783806bc77f396 Mon Sep 17 00:00:00 200=
1<br>
&gt;&nbsp; From: &quot;Roy.Li&quot; &lt;<a href=3D"mailto:rongqing.li@windr=
iver.com" target=3D"_blank">rongqing.li@windriver.com</a>&gt;<br>
&gt;&nbsp; Date: Fri, 16 Jan 2015 14:14:01 +0800<br>
&gt;&nbsp; Subject: [PATCH] net-snmp: fix &quot;libtool --finish&quot;<br>
&gt; @@ -20,11 +20,11 @@ Signed-off-by: <a href=3D"https://urldefense.com/v=
3/__http:/Roy.Li__;!!AjveYdw8EvQ!ZzYDx7kFVh5e_WREHKtwOKlB0gzWJ5uBreZgWz17Xb=
qSPIpRoCWlAxdMV_d3cedWCD1nDmiLXuSYttQgWTFr$">
Roy.Li</a> &lt;<a href=3D"mailto:rongqing.li@windriver.com" target=3D"_blan=
k">rongqing.li@windriver.com</a>&gt;<br>
&gt;&nbsp;&nbsp; 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;<br>
&gt;&nbsp; diff --git a/<a href=3D"https://urldefense.com/v3/__http:/Makefi=
le.top__;!!AjveYdw8EvQ!ZzYDx7kFVh5e_WREHKtwOKlB0gzWJ5uBreZgWz17XbqSPIpRoCWl=
AxdMV_d3cedWCD1nDmiLXuSYticrioNt$">Makefile.top</a> b/<a href=3D"https://ur=
ldefense.com/v3/__http:/Makefile.top__;!!AjveYdw8EvQ!ZzYDx7kFVh5e_WREHKtwOK=
lB0gzWJ5uBreZgWz17XbqSPIpRoCWlAxdMV_d3cedWCD1nDmiLXuSYticrioNt$">Makefile.t=
op</a><br>
&gt; -index 6315401..fc0ee06 100644<br>
&gt; +index a962c54..1ba5607 100644<br>
&gt;&nbsp; --- a/<a href=3D"https://urldefense.com/v3/__http:/Makefile.top_=
_;!!AjveYdw8EvQ!ZzYDx7kFVh5e_WREHKtwOKlB0gzWJ5uBreZgWz17XbqSPIpRoCWlAxdMV_d=
3cedWCD1nDmiLXuSYticrioNt$">Makefile.top</a><br>
&gt;&nbsp; +++ b/<a href=3D"https://urldefense.com/v3/__http:/Makefile.top_=
_;!!AjveYdw8EvQ!ZzYDx7kFVh5e_WREHKtwOKlB0gzWJ5uBreZgWz17XbqSPIpRoCWlAxdMV_d=
3cedWCD1nDmiLXuSYticrioNt$">Makefile.top</a><br>
&gt;&nbsp; @@ -89,7 +89,7 @@ LIBREVISION =3D 0<br>
&gt; - LIB_LD_CMD&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D $(LIBTOOL) --mode=3Dlin=
k $(LINKCC) $(CFLAGS) -rpath $(libdir) -version-info $(LIBCURRENT):$(LIBREV=
ISION):$(LIBAGE) -o<br>
&gt; + LIB_LD_CMD&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D $(LIBTOOL) --mode=3Dlin=
k $(LINKCC) $(CFLAGS) -rpath $(libdir) -version-info $(LIBCURRENT):$(LIBREV=
ISION):$(LIBAGE) @LD_NO_UNDEFINED@ -o<br>
&gt;&nbsp;&nbsp; LIB_EXTENSION&nbsp;&nbsp; =3D la<br>
&gt;&nbsp;&nbsp; LIB_VERSION&nbsp;&nbsp;&nbsp;&nbsp; =3D<br>
&gt;&nbsp; -LIB_LDCONFIG_CMD =3D $(LIBTOOL) --mode=3Dfinish $(INSTALL_PREFI=
X)$(libdir)<br>
&gt; diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/net-s=
nmp-5.7.2-fix-engineBoots-value-on-SIGHUP.patch b/meta-networking/recipes-p=
rotocols/net-snmp/net-snmp/net-snmp-5.7.2-fix-engineBoots-value-on-SIGHUP.p=
atch<br>
&gt; index 022eb958f..87f192e5b 100644<br>
&gt; --- a/meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-5.7=
.2-fix-engineBoots-value-on-SIGHUP.patch<br>
&gt; +++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-5.7=
.2-fix-engineBoots-value-on-SIGHUP.patch<br>
&gt; @@ -1,4 +1,4 @@<br>
&gt; -From 1e3178835217ba89aa355e2b6b88e490f17be16d Mon Sep 17 00:00:00 200=
1<br>
&gt; +From 5ad4eab43c1ea63ff343bba64d576440e8783e75 Mon Sep 17 00:00:00 200=
1<br>
&gt;&nbsp; From: Zheng Ruoqin &lt;<a href=3D"mailto:zhengrq.fnst@fujitsu.co=
m" target=3D"_blank">zhengrq.fnst@fujitsu.com</a>&gt;<br>
&gt;&nbsp; Date: Wed, 9 Jun 2021 15:47:30 +0900<br>
&gt;&nbsp; Subject: [PATCH] net snmp: fix engineBoots value on SIGHUP<br>
&gt; @@ -7,6 +7,7 @@ Upstream-Status: Pending<br>
&gt;<br>
&gt;&nbsp; Signed-off-by: Marian Florea &lt;<a href=3D"mailto:marian.florea=
@windriver.com" target=3D"_blank">marian.florea@windriver.com</a>&gt;<br>
&gt;&nbsp; Signed-off-by: Li Zhou &lt;<a href=3D"mailto:li.zhou@windriver.c=
om" target=3D"_blank">li.zhou@windriver.com</a>&gt;<br>
&gt; +Signed-off-by: Ovidiu Panait &lt;<a href=3D"mailto:ovidiu.panait@wind=
river.com" target=3D"_blank">ovidiu.panait@windriver.com</a>&gt;<br>
&gt;<br>
&gt;&nbsp; ---<br>
&gt;&nbsp;&nbsp; agent/snmpd.c&nbsp;&nbsp;&nbsp; | 1 +<br>
&gt; @@ -14,19 +15,18 @@ Signed-off-by: Li Zhou &lt;<a href=3D"mailto:li.zh=
ou@windriver.com" target=3D"_blank">li.zhou@windriver.com</a>&gt;<br>
&gt;&nbsp;&nbsp; 2 files changed, 3 insertions(+), 2 deletions(-)<br>
&gt;<br>
&gt;&nbsp; diff --git a/agent/snmpd.c b/agent/snmpd.c<br>
&gt; -index 1af439f..355b510 100644<br>
&gt; +index 90de12d..1ccc4db 100644<br>
&gt;&nbsp; --- a/agent/snmpd.c<br>
&gt;&nbsp; +++ b/agent/snmpd.c<br>
&gt; -@@ -1208,6 +1208,7 @@ receive(void)<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; snmp_log=
(LOG_INFO, &quot;NET-SNMP version %s restarted\n&quot;,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; netsnmp_get_version());<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; update_config();<br>
&gt; -+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; snmp_store(ap=
p_name);<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; send_easy_trap(SNMP_TRAP_ENTERPRISESPECIFIC, 3);<br>
&gt; - #if HAVE_SIGPROCMASK<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; ret =3D sigprocmask(SIG_UNBLOCK, &amp;set, NULL);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; snmp_log(LOG_INFO, &quot;NET-SNMP version %s=
 restarted\n&quot;,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; netsnmp_get_version());<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; update_config();<br>
&gt; ++&nbsp;&nbsp;&nbsp; snmp_store(app_name);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; send_easy_trap(SNMP_TRAP_ENTERPRISESPECIFIC,=
 3);<br>
&gt; + #ifdef HAVE_SIGPROCMASK<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; ret =3D sigprocmask(SIG_UNBLOCK, &amp;set, N=
ULL);<br>
&gt;&nbsp; diff --git a/snmplib/snmpv3.c b/snmplib/snmpv3.c<br>
&gt; -index 29c2a0f..ada961c 100644<br>
&gt; +index 7b1746b..4a17e0d 100644<br>
&gt;&nbsp; --- a/snmplib/snmpv3.c<br>
&gt;&nbsp; +++ b/snmplib/snmpv3.c<br>
&gt;&nbsp; @@ -1059,9 +1059,9 @@ init_snmpv3_post_config(int majorid, int m=
inorid, void *serverarg,<br>
&gt; diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/net-s=
nmp-add-knob-whether-nlist.h-are-checked.patch b/meta-networking/recipes-pr=
otocols/net-snmp/net-snmp/net-snmp-add-knob-whether-nlist.h-are-checked.pat=
ch<br>
&gt; index f1ebe2bb6..c5a453abe 100644<br>
&gt; --- a/meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-add=
-knob-whether-nlist.h-are-checked.patch<br>
&gt; +++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-add=
-knob-whether-nlist.h-are-checked.patch<br>
&gt; @@ -1,4 +1,4 @@<br>
&gt; -From e507dcf8b29c55011f85d88bf05400d4717e4074 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From ad65b106d3cb3c6e595381be1c45a73c1ef6eb5e Mon Sep 17 00:00:00 200=
1<br>
&gt;&nbsp; From: Chong Lu &lt;<a href=3D"mailto:Chong.Lu@windriver.com" tar=
get=3D"_blank">Chong.Lu@windriver.com</a>&gt;<br>
&gt;&nbsp; Date: Thu, 28 May 2020 09:46:34 -0500<br>
&gt;&nbsp; Subject: [PATCH] net-snmp: add knob whether nlist.h are checked<=
br>
&gt; @@ -15,7 +15,7 @@ Signed-off-by: Chong Lu &lt;<a href=3D"mailto:Chong.=
Lu@windriver.com" target=3D"_blank">Chong.Lu@windriver.com</a>&gt;<br>
&gt;&nbsp;&nbsp; 1 file changed, 2 insertions(+)<br>
&gt;<br>
&gt;&nbsp; diff --git a/configure.d/config_os_headers b/configure.d/config_=
os_headers<br>
&gt; -index 76ef58a..f07d512 100644<br>
&gt; +index b9c8c31..01c3376 100644<br>
&gt;&nbsp; --- a/configure.d/config_os_headers<br>
&gt;&nbsp; +++ b/configure.d/config_os_headers<br>
&gt;&nbsp; @@ -37,6 +37,7 @@ AC_CHECK_HEADERS([getopt.h&nbsp;&nbsp; pthread=
.h&nbsp; regex.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ] dnl<br>
&gt; diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/net-s=
nmp-fix-for-disable-des.patch b/meta-networking/recipes-protocols/net-snmp/=
net-snmp/net-snmp-fix-for-disable-des.patch<br>
&gt; index 2941a3609..c382c02d8 100644<br>
&gt; --- a/meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-fix=
-for-disable-des.patch<br>
&gt; +++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-fix=
-for-disable-des.patch<br>
&gt; @@ -1,4 +1,4 @@<br>
&gt; -From 3ca4335ec1d6b7b384c134fc85d7a9e513c68376 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From b1b9980853b1083f0c8b9f628f8b4c3a484d4f91 Mon Sep 17 00:00:00 200=
1<br>
&gt;&nbsp; From: Jackie Huang &lt;<a href=3D"mailto:jackie.huang@windriver.=
com" target=3D"_blank">jackie.huang@windriver.com</a>&gt;<br>
&gt;&nbsp; Date: Thu, 22 Jun 2017 10:25:08 +0800<br>
&gt;&nbsp; Subject: [PATCH] net-snmp: fix for --disable-des<br>
&gt; @@ -15,7 +15,7 @@ Signed-off-by: Jackie Huang &lt;<a href=3D"mailto:ja=
ckie.huang@windriver.com" target=3D"_blank">jackie.huang@windriver.com</a>&=
gt;<br>
&gt;&nbsp;&nbsp; 1 file changed, 2 insertions(+)<br>
&gt;<br>
&gt;&nbsp; diff --git a/snmplib/scapi.c b/snmplib/scapi.c<br>
&gt; -index 00c9174..c6875e1 100644<br>
&gt; +index 54fdd5c..0f7e931 100644<br>
&gt;&nbsp; --- a/snmplib/scapi.c<br>
&gt;&nbsp; +++ b/snmplib/scapi.c<br>
&gt;&nbsp; @@ -85,7 +85,9 @@ netsnmp_feature_child_of(usm_scapi, usm_suppor=
t);<br>
&gt; diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/net-s=
nmp-testing-add-the-output-format-for-ptest.patch b/meta-networking/recipes=
-protocols/net-snmp/net-snmp/net-snmp-testing-add-the-output-format-for-pte=
st.patch<br>
&gt; index 807983f61..09ca532a7 100644<br>
&gt; --- a/meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-tes=
ting-add-the-output-format-for-ptest.patch<br>
&gt; +++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-tes=
ting-add-the-output-format-for-ptest.patch<br>
&gt; @@ -1,4 +1,4 @@<br>
&gt; -From 972df16e9599dffddf5d714a4cbf43008c771122 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From 36a5656db7ea75dd15f35a6c1728937c6e2b901c Mon Sep 17 00:00:00 200=
1<br>
&gt;&nbsp; From: Jackie Huang &lt;<a href=3D"mailto:jackie.huang@windriver.=
com" target=3D"_blank">jackie.huang@windriver.com</a>&gt;<br>
&gt;&nbsp; Date: Wed, 14 Jan 2015 15:10:06 +0800<br>
&gt;&nbsp; Subject: [PATCH] testing: add the output format for ptest<br>
&gt; diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/repro=
ducibility-have-printcap.patch b/meta-networking/recipes-protocols/net-snmp=
/net-snmp/reproducibility-have-printcap.patch<br>
&gt; index bf1e7bedf..c0b51c51e 100644<br>
&gt; --- a/meta-networking/recipes-protocols/net-snmp/net-snmp/reproducibil=
ity-have-printcap.patch<br>
&gt; +++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/reproducibil=
ity-have-printcap.patch<br>
&gt; @@ -1,4 +1,4 @@<br>
&gt; -From 84e362fe97f50fbad69f083bc2d8fe18f83eb2f7 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From b923cd38e2503b86aedf66b767fd7f51c9f25645 Mon Sep 17 00:00:00 200=
1<br>
&gt;&nbsp; From: &quot;douglas.royds&quot; &lt;<a href=3D"mailto:douglas.ro=
yds@taitradio.com" target=3D"_blank">douglas.royds@taitradio.com</a>&gt;<br=
>
&gt;&nbsp; Date: Wed, 21 Nov 2018 13:52:18 +1300<br>
&gt;&nbsp; Subject: [PATCH] net-snmp: Reproducibility: Don't check build ho=
st for<br>
&gt; @@ -13,7 +13,7 @@ set in the environment to &quot;yes&quot; or &quot;n=
o&quot; as appropriate for the target platform.<br>
&gt;&nbsp;&nbsp; 1 file changed, 2 insertions(+), 2 deletions(-)<br>
&gt;<br>
&gt;&nbsp; diff --git a/configure.d/config_os_misc4 b/configure.d/config_os=
_misc4<br>
&gt; -index 6f23c8e..8cea75a 100644<br>
&gt; +index b6864d9..07ca922 100644<br>
&gt;&nbsp; --- a/configure.d/config_os_misc4<br>
&gt;&nbsp; +++ b/configure.d/config_os_misc4<br>
&gt;&nbsp; @@ -99,9 +99,9 @@ if test x$LPSTAT_PATH !=3D x; then<br>
&gt; diff --git a/meta-networking/recipes-protocols/net-snmp/<a href=3D"htt=
ps://urldefense.com/v3/__http:/net-snmp_5.9.1.bb__;!!AjveYdw8EvQ!ZzYDx7kFVh=
5e_WREHKtwOKlB0gzWJ5uBreZgWz17XbqSPIpRoCWlAxdMV_d3cedWCD1nDmiLXuSYtgJfttSA$=
" target=3D"_blank">net-snmp_5.9.1.bb</a>
 b/meta-networking/recipes-protocols/net-snmp/<a href=3D"https://urldefense=
.com/v3/__http:/net-snmp_5.9.3.bb__;!!AjveYdw8EvQ!ZzYDx7kFVh5e_WREHKtwOKlB0=
gzWJ5uBreZgWz17XbqSPIpRoCWlAxdMV_d3cedWCD1nDmiLXuSYtg4FzuZn$" target=3D"_bl=
ank">net-snmp_5.9.3.bb</a><br>
&gt; similarity index 98%<br>
&gt; rename from meta-networking/recipes-protocols/net-snmp/<a href=3D"http=
s://urldefense.com/v3/__http:/net-snmp_5.9.1.bb__;!!AjveYdw8EvQ!ZzYDx7kFVh5=
e_WREHKtwOKlB0gzWJ5uBreZgWz17XbqSPIpRoCWlAxdMV_d3cedWCD1nDmiLXuSYtgJfttSA$"=
 target=3D"_blank">net-snmp_5.9.1.bb</a><br>
&gt; rename to meta-networking/recipes-protocols/net-snmp/<a href=3D"https:=
//urldefense.com/v3/__http:/net-snmp_5.9.3.bb__;!!AjveYdw8EvQ!ZzYDx7kFVh5e_=
WREHKtwOKlB0gzWJ5uBreZgWz17XbqSPIpRoCWlAxdMV_d3cedWCD1nDmiLXuSYtg4FzuZn$" t=
arget=3D"_blank">net-snmp_5.9.3.bb</a><br>
&gt; index 30c0ce74c..7af514756 100644<br>
&gt; --- a/meta-networking/recipes-protocols/net-snmp/<a href=3D"https://ur=
ldefense.com/v3/__http:/net-snmp_5.9.1.bb__;!!AjveYdw8EvQ!ZzYDx7kFVh5e_WREH=
KtwOKlB0gzWJ5uBreZgWz17XbqSPIpRoCWlAxdMV_d3cedWCD1nDmiLXuSYtgJfttSA$" targe=
t=3D"_blank">net-snmp_5.9.1.bb</a><br>
&gt; +++ b/meta-networking/recipes-protocols/net-snmp/<a href=3D"https://ur=
ldefense.com/v3/__http:/net-snmp_5.9.3.bb__;!!AjveYdw8EvQ!ZzYDx7kFVh5e_WREH=
KtwOKlB0gzWJ5uBreZgWz17XbqSPIpRoCWlAxdMV_d3cedWCD1nDmiLXuSYtg4FzuZn$" targe=
t=3D"_blank">net-snmp_5.9.3.bb</a><br>
&gt; @@ -21,15 +21,13 @@ SRC_URI =3D &quot;${SOURCEFORGE_MIRROR}/net-snmp/n=
et-snmp-${PV}.tar.gz \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; file://0001-config_os_headers-Error-Fix.patch \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; file://0001-snmplib-keytools.c-Don-t-check-for-return-from-EVP_M.patch \<=
br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; file://0001-get_pid_from_inode-Include-limit.h.patch \<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; file://0=
002-configure-fix-a-cc-check-issue.patch \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; file://0004-configure-fix-incorrect-variable.patch \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; file://net-snmp-5.7.2-fix-engineBoots-value-on-SIGHUP.patch \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; file://net-snmp-fix-for-disable-des.patch \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; file://reproducibility-have-printcap.patch \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; file://0001-ac_add_search_path.m4-keep-consistent-between-32bit.patch \<b=
r>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; file://0=
001-snmpd-always-exit-after-displaying-usage.patch \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; &quot;<br>
&gt; -SRC_URI[sha256sum] =3D &quot;eb7fd4a44de6cddbffd9a92a85ad1309e5c1054f=
b9d5a7dd93079c8953f48c3f&quot;<br>
&gt; +SRC_URI[sha256sum] =3D &quot;2097f29b7e1bf3f1300b4bae52fa2308d0bb8d5d=
3998dbe02f9462a413a2ef0a&quot;<br>
&gt;<br>
&gt;&nbsp; UPSTREAM_CHECK_URI =3D &quot;<a href=3D"https://urldefense.com/v=
3/__https:/sourceforge.net/projects/net-snmp/files/net-snmp/__;!!AjveYdw8Ev=
Q!ZzYDx7kFVh5e_WREHKtwOKlB0gzWJ5uBreZgWz17XbqSPIpRoCWlAxdMV_d3cedWCD1nDmiLX=
uSYttt45kxq$" target=3D"_blank">https://sourceforge.net/projects/net-snmp/f=
iles/net-snmp/</a>&quot;<br>
&gt;&nbsp; UPSTREAM_CHECK_REGEX =3D &quot;/net-snmp/(?P&lt;pver&gt;\d+(\.\d=
+)+)/&quot;<br>
&gt; --<br>
&gt; 2.25.1<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#99037): <a href=3D"https://urldefense.com/v3/__htt=
ps:/lists.openembedded.org/g/openembedded-devel/message/99037__;!!AjveYdw8E=
vQ!ZzYDx7kFVh5e_WREHKtwOKlB0gzWJ5uBreZgWz17XbqSPIpRoCWlAxdMV_d3cedWCD1nDmiL=
XuSYtnWSrQ1-$" target=3D"_blank">
https://lists.openembedded.org/g/openembedded-devel/message/99037</a><br>
&gt; Mute This Topic: <a href=3D"https://urldefense.com/v3/__https:/lists.o=
penembedded.org/mt/94085410/1997914__;!!AjveYdw8EvQ!ZzYDx7kFVh5e_WREHKtwOKl=
B0gzWJ5uBreZgWz17XbqSPIpRoCWlAxdMV_d3cedWCD1nDmiLXuSYtnZeynhZ$" target=3D"_=
blank">
https://lists.openembedded.org/mt/94085410/1997914</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openem=
bedded.org" target=3D"_blank">
openembedded-devel+owner@lists.openembedded.org</a><br>
&gt; Unsubscribe: <a href=3D"https://urldefense.com/v3/__https:/lists.opene=
mbedded.org/g/openembedded-devel/unsub__;!!AjveYdw8EvQ!ZzYDx7kFVh5e_WREHKtw=
OKlB0gzWJ5uBreZgWz17XbqSPIpRoCWlAxdMV_d3cedWCD1nDmiLXuSYttC2KpO6$" target=
=3D"_blank">
https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a href=3D"m=
ailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_DM4PR11MB5550556C69874182BEFCB0ACE45C9DM4PR11MB5550namp_--

--_004_DM4PR11MB5550556C69874182BEFCB0ACE45C9DM4PR11MB5550namp_
Content-Type: image/png; name="B53CC402AB9B4A5DA389AE330172DEE2.png"
Content-Description: B53CC402AB9B4A5DA389AE330172DEE2.png
Content-Disposition: inline; filename="B53CC402AB9B4A5DA389AE330172DEE2.png";
	size=160; creation-date="Thu, 06 Oct 2022 08:17:38 GMT";
	modification-date="Thu, 06 Oct 2022 08:17:38 GMT"
Content-ID: <image001.png@01D8D98A.2BEEE3A0>
Content-Transfer-Encoding: base64

iVBORw0KGgoAAAANSUhEUgAAAq4AAAADCAYAAABS4o0fAAAAAXNSR0IArs4c6QAAAARnQU1BAACx
jwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAA1SURBVGhD7dYxDQAwDASx8CdVBEUQMKnULQx+
8EnmcHVuDwAApPvjWpIkSVJoa1wBACBbzwMamkHp6Ys14QAAAABJRU5ErkJggg==

--_004_DM4PR11MB5550556C69874182BEFCB0ACE45C9DM4PR11MB5550namp_--

