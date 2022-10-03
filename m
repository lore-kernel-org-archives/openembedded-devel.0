Return-Path: <narpat.mali@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08909C433FE
	for <webhook@archiver.kernel.org>; Mon,  3 Oct 2022 17:12:12 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web12.217.1664817122461288435
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Oct 2022 10:12:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=YobxEaTW;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=72757bed5a=narpat.mali@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 293CmLLR010413
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 3 Oct 2022 10:12:02 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 mime-version; s=PPS06212021;
 bh=bdkbILtviiLwlbtz2g5+FCtVvwquMBHlDCMPxK2Sjw0=;
 b=YobxEaTWjsfsPFKtjlFTgFPHjfyhtFLqkFyomFntdghSmdf3YlSBhLfY5IQcJ/qk68tU
 YAnMYQR1YHxagFyoaWo0huqt9sYEXQYRt5CIUekGuoV42PwclBa9d4kYqrOP8wDqqiDO
 48bjyqYsl1VV6KFiBduCupxQseeaQ/KmN/EVmVmOCx8JMJktF+/7o/5w+N9mZ4J6zqu4
 qtSFTyOSX0K88HHIFUCWgNRlQEj0ZvBa6u8tZhhi5qWt3POazJm6dNQCNgkTfyFifmma
 3QX5SEnv5ULFvFb3mTauHHO6gOvXrbgzAmb6VBkuPb5K2OAS9Ief1ybHDhtOop0MbCXc Cg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3jxn2ksmk2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Oct 2022 10:12:01 -0700
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 293HC1sq031147
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 3 Oct 2022 10:12:01 -0700
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2106.outbound.protection.outlook.com [104.47.70.106])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3jxn2ksmk0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Oct 2022 10:12:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JbsaCSGaF/PbCUo++h3UYUTG+FmBdjeGC1K8nbqOj3XMkg0jMG0JK4RvPJk7YtS2krebRLy/4bmDTP/Grvxe1mkN/avN5ihMwY6it//JnoKyIClMcfN+VNeaCwk4IIc0+UeXvWK8sCRHkdSqWzExzj0FaOH3jZd8fteI56+6B9Djt5DpiYVj9R0wCGZz0wqG18NllMdO6fi+0SH+ksJ1rKwB/skeQgtWWx7BTpNcqL2r+y8cXYvwXplzJH2HN5zofSD2dffjQnXsR4iwfLbIB5rKtam7TCcpFhDqFqepZwticc5+6w4XpyfGwMAcPWeRFpP8pLm0rbTuGfuCPLKPJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bdkbILtviiLwlbtz2g5+FCtVvwquMBHlDCMPxK2Sjw0=;
 b=fi3vtaDNh/9JsI6ev3SQ45sDIElKm2ljo+2xmk4IiXsN2HOEAln1GyI/1S8daprc1+Av10m7wFHcQN/VNANUoDC4lQHXbP7vPZWZ/BbfVWxg7qjwQ6y8U/DX5fvNSL7+R5v2A7I6H/lXEyxZ+s/cQ1xAGW49CDwFOlqJIpwqLypTTGU+lSFhZsyvWxQulo3EUvflvq5QT90jNflpcGayaFPP3l8Qc/LMLvlekYRxUzGSia3rkHICnzv5mcwo2G+97DL1OTdseCfRRdK/1ykIlJrWWjpnKWE+cYbxmA6lRaayzAbIhdL0nSiS6tJ/tFkGlZknzSzd4RDjCs5jv7OcVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5550.namprd11.prod.outlook.com (2603:10b6:5:38b::24)
 by BN9PR11MB5275.namprd11.prod.outlook.com (2603:10b6:408:134::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.24; Mon, 3 Oct
 2022 17:11:57 +0000
Received: from DM4PR11MB5550.namprd11.prod.outlook.com
 ([fe80::1427:9330:d44d:2c17]) by DM4PR11MB5550.namprd11.prod.outlook.com
 ([fe80::1427:9330:d44d:2c17%5]) with mapi id 15.20.5676.030; Mon, 3 Oct 2022
 17:11:57 +0000
From: "Mali, Narpat" <Narpat.Mali@windriver.com>
To: Khem Raj <raj.khem@gmail.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
        "Polampalli, Archana"
	<Archana.Polampalli@windriver.com>,
        "Urade, Yogita"
	<Yogita.Urade@windriver.com>,
        "G Pillai, Hari" <Hari.GPillai@windriver.com>
Subject: RE: [oe] [meta-openembedded][PATCH 1/1] net-snmp: upgrade 5.9.1 ->
 5.9.3
Thread-Topic: [oe] [meta-openembedded][PATCH 1/1] net-snmp: upgrade 5.9.1 ->
 5.9.3
Thread-Index: AQHY1vE2wxCNJhaJrUOJmNB2sl2kIK38PW0AgACne1U=
Date: Mon, 3 Oct 2022 17:11:57 +0000
Message-ID: 
 <DM4PR11MB55509038ED491A594997F441E45B9@DM4PR11MB5550.namprd11.prod.outlook.com>
References: <20221003062716.3759210-1-narpat.mali@windriver.com>
 <CAMKF1srgHEyVMQUr6VPMjhk5cKN_7CmSacwWpFRkmBuvK6muoA@mail.gmail.com>
In-Reply-To: 
 <CAMKF1srgHEyVMQUr6VPMjhk5cKN_7CmSacwWpFRkmBuvK6muoA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-IN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5550:EE_|BN9PR11MB5275:EE_
x-ms-office365-filtering-correlation-id: d2e7d24c-a8af-4ddd-85fd-08daa56260ab
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 7+TGAjWYxqopoCyCCssyV+fmCJdXKC/OrsKOa6CYk523fsc6cetWY8Yln6xYHthSNC55TbAhp4GJtPmx5AIsEHRPusrqhuGMwGr5yk6MSTx/kFbnorPvL71ksbyyp3LapP1le5Zk90/KQzPYXpw/SS8XtnXuIkEarb6nw1VW5CI6/IS0W6rmwOxkcqpwpXl4x8mNDXiLw/AL5pAuY5poWh1XBA3EEHUJzwTrHw8bseiRrrHmtuZd6sUnH2LT4jCr/uKXwNyMYE5yukDxpWPY8lt71PFygv3wniheqRAbfS6M9+m7gR2dcUq4XF8qhrNbiGhzmEF4MsCuXhBVfp9TO4wXmAg2YSPlzTIsO8SEUWEEsXfXJGqWylGePhTnU+iBjfj5oEJPwzYpMsYjwHuOgEvlXcoVKTRVmCQLVZjImIdkIMg/IUKnKL7kiVNqwiZyTq3Jf6CLY6FSJVMojdhhi58anGfpiLpWCguqn3xlLlqyCVo6IkDgMBUk2U4d8tHRJuhOxgecbRWj3zX56Y+CpE/N5n9MH3nEvdbPHvYCZxrEvgW08C7tsU+CNLY36DTeFr3zHZd49GvjHtsVsauMaJzVes+D7Zv2Kw280h9a++wBjy/dxFpxDJzjB2pXd073y4q8uEpl7iWN9R2bZOm7E2zlaDMRRVBmbpA0Q9anxjDXCLBGnHzYXDZkk4vqDmQQf9ySTzKH39MXlsfdnJv8sl7YWqwXvMNreKyggNCGwFax4NnL3RsZQ1tFeKKFbmaJY9EmCRPg9ALbAhAg8eM2JWpZES2+fbihsu5/9bSBo7tR7jyZMaol+tZkFQd9fBZF
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5550.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(396003)(39850400004)(136003)(376002)(366004)(451199015)(38100700002)(66899015)(122000001)(9686003)(86362001)(26005)(6506007)(5660300002)(4326008)(8676002)(53546011)(8936002)(107886003)(38070700005)(41300700001)(30864003)(52536014)(55016003)(166002)(2906002)(33656002)(966005)(478600001)(7696005)(316002)(19627235002)(71200400001)(186003)(83380400001)(76116006)(66946007)(66556008)(66476007)(66446008)(64756008)(54906003)(6916009)(91956017);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?qcs3yCGAlns2Gdcjq7iZ6WtCOShwC8WvT5wVeHmy+P7uz0tzTYmwd5CMaFvF?=
 =?us-ascii?Q?paJk6/UeAill+ox1kVrkVruRonPuq00ebnGCFjibcwAcwCTu+QEgrNiouaGO?=
 =?us-ascii?Q?nOtJepBy/3mwqePloZ5ScEoAaJE0tkuvjHZfpA/kq/ipiUzkYhCrDWYV28nb?=
 =?us-ascii?Q?/rBtI00lEKSHOcm+4RelPVIcynRYFAnCYudR66YNwbAW0G4yAkFHWoj5skBB?=
 =?us-ascii?Q?G3b8p5cTcQ8VDj5QwbxBNCmts6sPMLeNuFWWUfSBdJHrA9kDzJQNs1nQcF81?=
 =?us-ascii?Q?qrwovCCdKCIxpxAJ7JTX3hUsqraMB7qtXI8T6ZwNEiXvD9ZKT/bAEw1c1eHI?=
 =?us-ascii?Q?yrat7iEKhkZuEkSFyog61+QP51Pkm7QdF/ej94WAXHBw5jAgeTdklpiWbQYu?=
 =?us-ascii?Q?kcc9vxDeJKysPqlE4UkyJykHdmP3kGjuju6sMfV9OsqD/RdCE+UU7w90Btq9?=
 =?us-ascii?Q?WGIRlGpeKbHQmzpwzcnIOsOaUDYaB6UaiEmVK/pGmPs3sfdqJQAMhwIgOSDj?=
 =?us-ascii?Q?vu2YW3fZWvRDGWiDeZSONhwB8Qo0Gne+scWDMJtGUp/gJzsSeKnxbn3GJbuX?=
 =?us-ascii?Q?+XrGfa7oUg24OP1teY7xeFNOhx3ctOhBDR8R88IA4XvWTa86LYcUE9Tcn/oq?=
 =?us-ascii?Q?UGtnMkC2JpWomytaImlIfUHGh5cgT2p/OqmHTE76VeTB+wa0l9TjQd6Rt6dC?=
 =?us-ascii?Q?Kv/97PvBVp8RDu1Q/wWX7V5MVcdTlNZwb50DpWcWbeVRuuBnfNMqj98dsVwE?=
 =?us-ascii?Q?ELBBBDyHqWFOdrXVy1PFQUSIeMa28UeasPFL8cD/5GOIVzY6EHZMLLqYznky?=
 =?us-ascii?Q?zRi9j2+aI2Ae8WxoBhfVgPObggaleDsBLQSl/RzhZShWu1SleM4Tnm3wFXl/?=
 =?us-ascii?Q?1StKN6whtbBymexrleBaMII8QxUFXqDMHGqEd+0Dwt6p1ipnWt4z3jZA6tNe?=
 =?us-ascii?Q?ThpAiGJabRXPeWabBjuUrzicnHAhn2qkzTh/uz/AFJueNmlKnhJi9hEIEO5O?=
 =?us-ascii?Q?3r47uMy+2EoHgT0FBt6skQeCK/rhc+ELTUz9nGLxwMkq6XHPOSHyNv3gzymZ?=
 =?us-ascii?Q?Dn5NHy4nTd4yTQTScE8Zt4yA6l6tLlReUsD9rzAg5yu6F12DoVSAbcuEuvRS?=
 =?us-ascii?Q?tdrvCu9OsTXeSs7zZeQk53gDqeMFSpVGjfl/hCrG1pSMFe/1Lm1Ig8pgEtvd?=
 =?us-ascii?Q?+UMAQjPeHH5OIyMKUR6UQ5owCl9A+7Fj9X8qfDxU3AkalG/PxfE9RRXCFhCw?=
 =?us-ascii?Q?bermJS/iTe5ar3g8VHelocz5CLv0k3fuyRSG+02vdG0iy8VVcRybUK76Olyx?=
 =?us-ascii?Q?3masxUpBzi5WoQ0loNZNVCSE9c8GyUh1+zeKsCEhY+Q8e+9d9/clwzkcCd4B?=
 =?us-ascii?Q?41sXZaUb+jm/3fFCDRTMIClwPOqfVeaPUlUnzezaqqbq8d4uRppfBCIzqFey?=
 =?us-ascii?Q?VfdASslChL7GX5ftkX1qb/TQQKs5Xsoe1imvzsyb5ECHUBh6iXADJG9yxmxc?=
 =?us-ascii?Q?3p5LupeRXhfWVK/017MDu2cxzUUd+E/TdZk5EHrnhXXkYbtFQ60gSGjPGSZI?=
 =?us-ascii?Q?RNa2dGVe45kWnidCrX1LRd1OlLhMyrvA5krGWXIDPrCEowLvU62r9Iex56a+?=
 =?us-ascii?Q?wtLnrYTXZrrtm0l//H8/iI4=3D?=
Content-Type: multipart/alternative;
	boundary="_000_DM4PR11MB55509038ED491A594997F441E45B9DM4PR11MB5550namp_"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5550.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 d2e7d24c-a8af-4ddd-85fd-08daa56260ab
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Oct 2022 17:11:57.3109
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 Rtm4y38PFibb3mduHEqNdNYwlFObUoHVq16UCFVNKLsKX+2KdFlslBqUhU/6CUvR6AuWc6h0Dj+6SVfIPcAECv+ew38PZSkAQwkGDnmeNDc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5275
X-Proofpoint-ORIG-GUID: 53vDH-ZMoVpabcm7sOobuP4dsYvrps4i
X-Proofpoint-GUID: fJjgc9BRnJnfTJBQ2DQj_odnzVHiVSeQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-10-03_02,2022-09-29_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 suspectscore=0 adultscore=0 priorityscore=1501 bulkscore=0 mlxlogscore=999
 phishscore=0 mlxscore=0 spamscore=0 malwarescore=0 impostorscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210030104
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 03 Oct 2022 17:12:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/99043

--_000_DM4PR11MB55509038ED491A594997F441E45B9DM4PR11MB5550namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Khem Raj,

It is the same commit but, we need this patch commit for "kirkstone" branch=
 of meta-openembedded.
We observed that the "master" branch has "net-snmp 5.9.3" version at https:=
//git.openembedded.org/meta-openembedded/tree/meta-networking/recipes-proto=
cols/net-snmp and the "kirkstone" branch has "net-snmp 5.9.1" at https://gi=
t.openembedded.org/meta-openembedded/tree/meta-networking/recipes-protocols=
/net-snmp?h=3Dkirkstone

Since, our product is using "kirkstone" branch of meta-openembedded so, CVE=
-2022-24805 to CVE-2022-24810 are vulnerable for our product.
Could you please let us know, How to get net-snmp upgraded to 5.9.3 version=
 in "kirkstone" branch ?

Best Regards,
Narpat Mali

Sent from Mail<https://go.microsoft.com/fwlink/?LinkId=3D550986> for Window=
s

________________________________
From: Khem Raj <raj.khem@gmail.com>
Sent: Monday, October 3, 2022 12:29:18 PM
To: Mali, Narpat <Narpat.Mali@windriver.com>
Cc: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.ope=
nembedded.org>; Polampalli, Archana <Archana.Polampalli@windriver.com>; Ura=
de, Yogita <Yogita.Urade@windriver.com>; G Pillai, Hari <Hari.GPillai@windr=
iver.com>
Subject: Re: [oe] [meta-openembedded][PATCH 1/1] net-snmp: upgrade 5.9.1 ->=
 5.9.3

[Please note: This e-mail is from an EXTERNAL e-mail address]

how different is this from
https://git.openembedded.org/meta-openembedded/commit/?id=3Dbf4a826c7de51dc=
dac87f81fa2bd2301629d50db

On Sun, Oct 2, 2022 at 11:27 PM Narpat Mali <narpat.mali@windriver.com> wro=
te:
>
> Issue: LIN1022-1131, LIN1022-1132, LIN1022-1133, LIN1022-1134, LIN1022-11=
35
> Issue: LIN1022-1136
>
> Upgrade summary:
> ----------------
> - drop 0002-configure-fix-a-cc-check-issue.patch, as it was replaced with
>   upstream commit https://github.com/net-snmp/net-snmp/commit/dbb49acfa2a=
f
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
> Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
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
>  .../{net-snmp_5.9.1.bb =3D> net-snmp_5.9.3.bb}  |  4 +-
>  14 files changed, 37 insertions(+), 120 deletions(-)
>  delete mode 100644 meta-networking/recipes-protocols/net-snmp/net-snmp/0=
001-snmpd-always-exit-after-displaying-usage.patch
>  delete mode 100644 meta-networking/recipes-protocols/net-snmp/net-snmp/0=
002-configure-fix-a-cc-check-issue.patch
>  rename meta-networking/recipes-protocols/net-snmp/{net-snmp_5.9.1.bb =3D=
> net-snmp_5.9.3.bb} (98%)
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
>  From: Mingli Yu <mingli.yu@windriver.com>
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
>  Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
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
>  From: Li xin <lixin.fnst@cn.fujitsu.com>
>  Date: Fri, 21 Aug 2015 18:23:13 +0900
>  Subject: [PATCH] config_os_headers: Error Fix
> @@ -19,7 +19,7 @@ Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
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
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Fri, 22 Jul 2016 18:34:39 +0000
>  Subject: [PATCH] get_pid_from_inode: Include limit.h
> @@ -14,7 +14,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
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
> -From: Kaarle Ritvanen <kaarle.ritvanen@datakunkku.fi>
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
ca1471daa9393]
> -
> -Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
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
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Fri, 18 Sep 2015 00:28:45 -0400
>  Subject: [PATCH] snmplib/keytools.c: Don't check for return from
> @@ -17,7 +17,7 @@ Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.c=
om>
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
> -From: Wenlin Kang <wenlin.kang@windriver.com>
> -Date: Wed, 24 May 2017 16:45:34 +0800
> -Subject: [PATCH] configure: fix a cc check issue.
> -
> -When has "." in cc value, the expression
> -$myperl -V:cc | $myperl -n -e 'print if (s/^\s*cc=3D.([-=3D\w\s\/]+).;\s=
*/$1/);'
> -can't get corretly the cc's value.
> -
> -Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
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
>  From: Wenlin Kang <wenlin.kang@windriver.com>
>  Date: Wed, 24 May 2017 17:10:20 +0800
>  Subject: [PATCH] configure: fix incorrect variable
> @@ -14,10 +14,10 @@ Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com=
>
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
>  diff --git a/Makefile.in b/Makefile.in
> -index 912f6b2..a53d1b2 100644
> +index f1cbbf5..1545be3 100644
>  --- a/Makefile.in
>  +++ b/Makefile.in
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
>  From: "Roy.Li" <rongqing.li@windriver.com>
>  Date: Fri, 16 Jan 2015 14:14:01 +0800
>  Subject: [PATCH] net-snmp: fix "libtool --finish"
> @@ -20,11 +20,11 @@ Signed-off-by: Roy.Li <rongqing.li@windriver.com>
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
>  diff --git a/Makefile.top b/Makefile.top
> -index 6315401..fc0ee06 100644
> +index a962c54..1ba5607 100644
>  --- a/Makefile.top
>  +++ b/Makefile.top
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
>  From: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
>  Date: Wed, 9 Jun 2021 15:47:30 +0900
>  Subject: [PATCH] net snmp: fix engineBoots value on SIGHUP
> @@ -7,6 +7,7 @@ Upstream-Status: Pending
>
>  Signed-off-by: Marian Florea <marian.florea@windriver.com>
>  Signed-off-by: Li Zhou <li.zhou@windriver.com>
> +Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
>
>  ---
>   agent/snmpd.c    | 1 +
> @@ -14,19 +15,18 @@ Signed-off-by: Li Zhou <li.zhou@windriver.com>
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
>  From: Chong Lu <Chong.Lu@windriver.com>
>  Date: Thu, 28 May 2020 09:46:34 -0500
>  Subject: [PATCH] net-snmp: add knob whether nlist.h are checked
> @@ -15,7 +15,7 @@ Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
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
>  From: Jackie Huang <jackie.huang@windriver.com>
>  Date: Thu, 22 Jun 2017 10:25:08 +0800
>  Subject: [PATCH] net-snmp: fix for --disable-des
> @@ -15,7 +15,7 @@ Signed-off-by: Jackie Huang <jackie.huang@windriver.com=
>
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
>  From: Jackie Huang <jackie.huang@windriver.com>
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
>  From: "douglas.royds" <douglas.royds@taitradio.com>
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
 b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.3.bb
> similarity index 98%
> rename from meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.1.bb
> rename to meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.3.bb
> index 30c0ce74c..7af514756 100644
> --- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.1.bb
> +++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.3.bb
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
net-snmp/"
>  UPSTREAM_CHECK_REGEX =3D "/net-snmp/(?P<pver>\d+(\.\d+)+)/"
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#99037): https://lists.openembedded.org/g/openembedded=
-devel/message/99037
> Mute This Topic: https://lists.openembedded.org/mt/94085410/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

--_000_DM4PR11MB55509038ED491A594997F441E45B9DM4PR11MB5550namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" xmlns:w=3D"urn:sc=
hemas-microsoft-com:office:word" xmlns:m=3D"http://schemas.microsoft.com/of=
fice/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
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
<p class=3D"MsoNormal">Hi Khem Raj,</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">It is the same commit but, we need this patch commit=
 for &#8220;kirkstone&#8221; branch of meta-openembedded.</p>
<p class=3D"MsoNormal">We observed that the &#8220;master&#8221; branch has=
 &#8220;net-snmp 5.9.3&#8221; version at
<a href=3D"https://git.openembedded.org/meta-openembedded/tree/meta-network=
ing/recipes-protocols/net-snmp">
https://git.openembedded.org/meta-openembedded/tree/meta-networking/recipes=
-protocols/net-snmp</a> and the &#8220;kirkstone&#8221; branch has &#8220;n=
et-snmp 5.9.1&#8221; at
<a href=3D"https://git.openembedded.org/meta-openembedded/tree/meta-network=
ing/recipes-protocols/net-snmp?h=3Dkirkstone">
https://git.openembedded.org/meta-openembedded/tree/meta-networking/recipes=
-protocols/net-snmp?h=3Dkirkstone</a></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Since, our product is using &#8220;kirkstone&#8221; =
branch of meta-openembedded so, CVE-2022-24805 to CVE-2022-24810 are vulner=
able for our product.
<o:p></o:p></p>
<p class=3D"MsoNormal">Could you please let us know, How to get net-snmp up=
graded to 5.9.3 version in &#8220;kirkstone&#8221; branch ?</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Best Regards,</p>
<p class=3D"MsoNormal">Narpat Mali</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Sent from <a href=3D"https://go.microsoft.com/fwlink=
/?LinkId=3D550986">
Mail</a> for Windows</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Khem Raj &lt;raj.khem=
@gmail.com&gt;<br>
<b>Sent:</b> Monday, October 3, 2022 12:29:18 PM<br>
<b>To:</b> Mali, Narpat &lt;Narpat.Mali@windriver.com&gt;<br>
<b>Cc:</b> openembedded-devel@lists.openembedded.org &lt;openembedded-devel=
@lists.openembedded.org&gt;; Polampalli, Archana &lt;Archana.Polampalli@win=
driver.com&gt;; Urade, Yogita &lt;Yogita.Urade@windriver.com&gt;; G Pillai,=
 Hari &lt;Hari.GPillai@windriver.com&gt;<br>
<b>Subject:</b> Re: [oe] [meta-openembedded][PATCH 1/1] net-snmp: upgrade 5=
.9.1 -&gt; 5.9.3</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">[Please note: This e-mail is from an EXTERNAL e-ma=
il address]<br>
<br>
how different is this from<br>
<a href=3D"https://git.openembedded.org/meta-openembedded/commit/?id=3Dbf4a=
826c7de51dcdac87f81fa2bd2301629d50db">https://git.openembedded.org/meta-ope=
nembedded/commit/?id=3Dbf4a826c7de51dcdac87f81fa2bd2301629d50db</a><br>
<br>
On Sun, Oct 2, 2022 at 11:27 PM Narpat Mali &lt;narpat.mali@windriver.com&g=
t; wrote:<br>
&gt;<br>
&gt; Issue: LIN1022-1131, LIN1022-1132, LIN1022-1133, LIN1022-1134, LIN1022=
-1135<br>
&gt; Issue: LIN1022-1136<br>
&gt;<br>
&gt; Upgrade summary:<br>
&gt; ----------------<br>
&gt; - drop 0002-configure-fix-a-cc-check-issue.patch, as it was replaced w=
ith<br>
&gt;&nbsp;&nbsp; upstream commit <a href=3D"https://github.com/net-snmp/net=
-snmp/commit/dbb49acfa2af">
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
&gt; Signed-off-by: Narpat Mali &lt;narpat.mali@windriver.com&gt;<br>
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
&gt;&nbsp; .../{net-snmp_5.9.1.bb =3D&gt; net-snmp_5.9.3.bb}&nbsp; |&nbsp; =
4 +-<br>
&gt;&nbsp; 14 files changed, 37 insertions(+), 120 deletions(-)<br>
&gt;&nbsp; delete mode 100644 meta-networking/recipes-protocols/net-snmp/ne=
t-snmp/0001-snmpd-always-exit-after-displaying-usage.patch<br>
&gt;&nbsp; delete mode 100644 meta-networking/recipes-protocols/net-snmp/ne=
t-snmp/0002-configure-fix-a-cc-check-issue.patch<br>
&gt;&nbsp; rename meta-networking/recipes-protocols/net-snmp/{net-snmp_5.9.=
1.bb =3D&gt; net-snmp_5.9.3.bb} (98%)<br>
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
&gt;&nbsp; From: Mingli Yu &lt;mingli.yu@windriver.com&gt;<br>
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
&gt;&nbsp; Signed-off-by: Mingli Yu &lt;mingli.yu@windriver.com&gt;<br>
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
&gt;&nbsp; From: Li xin &lt;lixin.fnst@cn.fujitsu.com&gt;<br>
&gt;&nbsp; Date: Fri, 21 Aug 2015 18:23:13 +0900<br>
&gt;&nbsp; Subject: [PATCH] config_os_headers: Error Fix<br>
&gt; @@ -19,7 +19,7 @@ Signed-off-by: Li Xin &lt;lixin.fnst@cn.fujitsu.com&=
gt;<br>
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
&gt;&nbsp; From: Khem Raj &lt;raj.khem@gmail.com&gt;<br>
&gt;&nbsp; Date: Fri, 22 Jul 2016 18:34:39 +0000<br>
&gt;&nbsp; Subject: [PATCH] get_pid_from_inode: Include limit.h<br>
&gt; @@ -14,7 +14,7 @@ Signed-off-by: Khem Raj &lt;raj.khem@gmail.com&gt;<b=
r>
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
&gt; -From: Kaarle Ritvanen &lt;kaarle.ritvanen@datakunkku.fi&gt;<br>
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
&gt; -[<a href=3D"https://github.com/net-snmp/net-snmp/commit/94ca941e06bef=
157bf0e13251f8ca1471daa9393">https://github.com/net-snmp/net-snmp/commit/94=
ca941e06bef157bf0e13251f8ca1471daa9393</a>]<br>
&gt; -<br>
&gt; -Signed-off-by: Yi Zhao &lt;yi.zhao@windriver.com&gt;<br>
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
&gt;&nbsp; From: Khem Raj &lt;raj.khem@gmail.com&gt;<br>
&gt;&nbsp; Date: Fri, 18 Sep 2015 00:28:45 -0400<br>
&gt;&nbsp; Subject: [PATCH] snmplib/keytools.c: Don't check for return from=
<br>
&gt; @@ -17,7 +17,7 @@ Signed-off-by: Ovidiu Panait &lt;ovidiu.panait@windr=
iver.com&gt;<br>
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
&gt; -From: Wenlin Kang &lt;wenlin.kang@windriver.com&gt;<br>
&gt; -Date: Wed, 24 May 2017 16:45:34 +0800<br>
&gt; -Subject: [PATCH] configure: fix a cc check issue.<br>
&gt; -<br>
&gt; -When has &quot;.&quot; in cc value, the expression<br>
&gt; -$myperl -V:cc | $myperl -n -e 'print if (s/^\s*cc=3D.([-=3D\w\s\/]+).=
;\s*/$1/);'<br>
&gt; -can't get corretly the cc's value.<br>
&gt; -<br>
&gt; -Signed-off-by: Wenlin Kang &lt;wenlin.kang@windriver.com&gt;<br>
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
&gt;&nbsp; From: Wenlin Kang &lt;wenlin.kang@windriver.com&gt;<br>
&gt;&nbsp; Date: Wed, 24 May 2017 17:10:20 +0800<br>
&gt;&nbsp; Subject: [PATCH] configure: fix incorrect variable<br>
&gt; @@ -14,10 +14,10 @@ Signed-off-by: Wenlin Kang &lt;wenlin.kang@windriv=
er.com&gt;<br>
&gt;&nbsp;&nbsp; 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;<br>
&gt;&nbsp; diff --git a/Makefile.in b/Makefile.in<br>
&gt; -index 912f6b2..a53d1b2 100644<br>
&gt; +index f1cbbf5..1545be3 100644<br>
&gt;&nbsp; --- a/Makefile.in<br>
&gt;&nbsp; +++ b/Makefile.in<br>
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
&gt;&nbsp; From: &quot;Roy.Li&quot; &lt;rongqing.li@windriver.com&gt;<br>
&gt;&nbsp; Date: Fri, 16 Jan 2015 14:14:01 +0800<br>
&gt;&nbsp; Subject: [PATCH] net-snmp: fix &quot;libtool --finish&quot;<br>
&gt; @@ -20,11 +20,11 @@ Signed-off-by: Roy.Li &lt;rongqing.li@windriver.co=
m&gt;<br>
&gt;&nbsp;&nbsp; 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;<br>
&gt;&nbsp; diff --git a/Makefile.top b/Makefile.top<br>
&gt; -index 6315401..fc0ee06 100644<br>
&gt; +index a962c54..1ba5607 100644<br>
&gt;&nbsp; --- a/Makefile.top<br>
&gt;&nbsp; +++ b/Makefile.top<br>
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
&gt;&nbsp; From: Zheng Ruoqin &lt;zhengrq.fnst@fujitsu.com&gt;<br>
&gt;&nbsp; Date: Wed, 9 Jun 2021 15:47:30 +0900<br>
&gt;&nbsp; Subject: [PATCH] net snmp: fix engineBoots value on SIGHUP<br>
&gt; @@ -7,6 +7,7 @@ Upstream-Status: Pending<br>
&gt;<br>
&gt;&nbsp; Signed-off-by: Marian Florea &lt;marian.florea@windriver.com&gt;=
<br>
&gt;&nbsp; Signed-off-by: Li Zhou &lt;li.zhou@windriver.com&gt;<br>
&gt; +Signed-off-by: Ovidiu Panait &lt;ovidiu.panait@windriver.com&gt;<br>
&gt;<br>
&gt;&nbsp; ---<br>
&gt;&nbsp;&nbsp; agent/snmpd.c&nbsp;&nbsp;&nbsp; | 1 +<br>
&gt; @@ -14,19 +15,18 @@ Signed-off-by: Li Zhou &lt;li.zhou@windriver.com&g=
t;<br>
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
&gt;&nbsp; From: Chong Lu &lt;Chong.Lu@windriver.com&gt;<br>
&gt;&nbsp; Date: Thu, 28 May 2020 09:46:34 -0500<br>
&gt;&nbsp; Subject: [PATCH] net-snmp: add knob whether nlist.h are checked<=
br>
&gt; @@ -15,7 +15,7 @@ Signed-off-by: Chong Lu &lt;Chong.Lu@windriver.com&g=
t;<br>
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
&gt;&nbsp; From: Jackie Huang &lt;jackie.huang@windriver.com&gt;<br>
&gt;&nbsp; Date: Thu, 22 Jun 2017 10:25:08 +0800<br>
&gt;&nbsp; Subject: [PATCH] net-snmp: fix for --disable-des<br>
&gt; @@ -15,7 +15,7 @@ Signed-off-by: Jackie Huang &lt;jackie.huang@windriv=
er.com&gt;<br>
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
&gt;&nbsp; From: Jackie Huang &lt;jackie.huang@windriver.com&gt;<br>
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
&gt;&nbsp; From: &quot;douglas.royds&quot; &lt;douglas.royds@taitradio.com&=
gt;<br>
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
&gt; diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.1=
.bb b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.3.bb<br>
&gt; similarity index 98%<br>
&gt; rename from meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.1.=
bb<br>
&gt; rename to meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.3.bb=
<br>
&gt; index 30c0ce74c..7af514756 100644<br>
&gt; --- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.1.bb<br>
&gt; +++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.3.bb<br>
&gt; @@ -21,15 +21,13 @@ SRC_URI =3D &quot;${SOURCEFORGE_MIRROR}/net-snmp/n=
et-snmp-${PV}.tar.gz \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; <a href=3D"file://0001-config_os_headers-Error-Fix.patch">file://0001-con=
fig_os_headers-Error-Fix.patch</a> \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; <a href=3D"file://0001-snmplib-keytools.c-Don-t-check-for-return-from-EVP=
_M.patch">
file://0001-snmplib-keytools.c-Don-t-check-for-return-from-EVP_M.patch</a> =
\<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; <a href=3D"file://0001-get_pid_from_inode-Include-limit.h.patch">file://0=
001-get_pid_from_inode-Include-limit.h.patch</a> \<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://0002-configure-fix-a-cc-check-issue.patch">file://0002-configure=
-fix-a-cc-check-issue.patch</a> \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; <a href=3D"file://0004-configure-fix-incorrect-variable.patch">file://000=
4-configure-fix-incorrect-variable.patch</a> \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; <a href=3D"file://net-snmp-5.7.2-fix-engineBoots-value-on-SIGHUP.patch">
file://net-snmp-5.7.2-fix-engineBoots-value-on-SIGHUP.patch</a> \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; <a href=3D"file://net-snmp-fix-for-disable-des.patch">file://net-snmp-fix=
-for-disable-des.patch</a> \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; <a href=3D"file://reproducibility-have-printcap.patch">file://reproducibi=
lity-have-printcap.patch</a> \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; <a href=3D"file://0001-ac_add_search_path.m4-keep-consistent-between-32bi=
t.patch">
file://0001-ac_add_search_path.m4-keep-consistent-between-32bit.patch</a> \=
<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://0001-snmpd-always-exit-after-displaying-usage.patch">
file://0001-snmpd-always-exit-after-displaying-usage.patch</a> \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; &quot;<br>
&gt; -SRC_URI[sha256sum] =3D &quot;eb7fd4a44de6cddbffd9a92a85ad1309e5c1054f=
b9d5a7dd93079c8953f48c3f&quot;<br>
&gt; +SRC_URI[sha256sum] =3D &quot;2097f29b7e1bf3f1300b4bae52fa2308d0bb8d5d=
3998dbe02f9462a413a2ef0a&quot;<br>
&gt;<br>
&gt;&nbsp; UPSTREAM_CHECK_URI =3D &quot;<a href=3D"https://sourceforge.net/=
projects/net-snmp/files/net-snmp/">https://sourceforge.net/projects/net-snm=
p/files/net-snmp/</a>&quot;<br>
&gt;&nbsp; UPSTREAM_CHECK_REGEX =3D &quot;/net-snmp/(?P&lt;pver&gt;\d+(\.\d=
+)+)/&quot;<br>
&gt; --<br>
&gt; 2.25.1<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#99037): <a href=3D"https://lists.openembedded.org/=
g/openembedded-devel/message/99037">
https://lists.openembedded.org/g/openembedded-devel/message/99037</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/94085410=
/1997914">https://lists.openembedded.org/mt/94085410/1997914</a><br>
&gt; Group Owner: openembedded-devel+owner@lists.openembedded.org<br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
devel/unsub">
https://lists.openembedded.org/g/openembedded-devel/unsub</a> [raj.khem@gma=
il.com]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</div>
</span></font></div>
</body>
</html>

--_000_DM4PR11MB55509038ED491A594997F441E45B9DM4PR11MB5550namp_--

