Return-Path: <narpat.mali@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1188FC433FE
	for <webhook@archiver.kernel.org>; Tue,  4 Oct 2022 07:15:26 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.7941.1664867717557728682
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 04 Oct 2022 00:15:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=H5KcECKX;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=727624c0c7=narpat.mali@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 2946i5Yj018054
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 4 Oct 2022 00:15:17 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 mime-version; s=PPS06212021;
 bh=TB3iHvjiCsTey/W1mB+mMLPIowSn5CcegEPGD4UVFqM=;
 b=H5KcECKXVXJWid/BGa4D4K3I2yo/CE5dOK7RUQqfQ6cMVtxow0ICyoV2ojwAUWG38bWB
 QWzsJxVKySemKyDGQNCF/84vqUk1GAx2tyRkDNoxne/VHWl9GoEAYHCj85Sc9nnXtp3w
 6Nkfv9SwWkU4qlgd85EJDGP9jI3IBtjwz6D9OLsgIqFxPPeNjInDu6i6Gk4NGXXKKJi8
 iyjP3LEl2K/2cuzI8iea2g8RTePKtD9OR93yIo7GMY3gb3+MoyjsnC9szRJNLeUXMML7
 jQG6xcR9QaSN1N+BJkpDDnGigeQw96/HpRB2RmqJ9Xdecr60R8iPeeLrwNBXVWtfZeTa pA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3jxgu4t7ya-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 04 Oct 2022 00:15:16 -0700
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2947AKxu015737
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 4 Oct 2022 00:15:16 -0700
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2173.outbound.protection.outlook.com [104.47.57.173])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3jxgu4t7y9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Oct 2022 00:15:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RI660mw2xxJhBxi8X/gMdZE6D0HIbQUalBZyLDvCjihGyEN7juoai3LmzeWo9nJoXrn8NDhUrQOFPNPQHPtSowN7bfbTDxdcNzi+MRk5OeNMue4m2eN0DWmWrRF6/oqHESka4L6mzfFiRU6MO2cX7lnzwz+2JmWRLOrRWPFnPfGMKv9W6E+iXykQMjdy4VDLVFw2tfyq6nW7fAWVJ0bCaFAf75JAOdLLTnxxK4ZG9n/n0dvg4Y9ipjP48PmxOy+JcMHkY3ouC13TcRdZzoUOCdaFV/4u60jJsnJJRwFs+zjzXirBlwYkqjTQfY5Gf0mdi5brnuV7uSLUfQwH/aYORA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TB3iHvjiCsTey/W1mB+mMLPIowSn5CcegEPGD4UVFqM=;
 b=NL19pjmVIugRMoOOe5xm5mgdZRqH82V3wQsSGKX6J0Vk45ITAUg9JsuHYgqCxeasN8pbD/FIP/Oev3OYTclOyRmXfnZAFkcCn8BYPPMDNrFlievSA/k/PVyPuyIrS/Um4KMOIzquyxRBe0mPGycLnCc8+oJfmGlwk+OpkiMtW2zs7x940ftps+tlG+gYW2URrYsFY8tqg7nfe/7MZyIjIStCRS6EX8YoSTAA16NlKGe87Netp7eEskMjKbnfHaqfLY5dEoezSn5AvBjbCYlO4nuA4r8lhpSVyYyDM6K+fY4TWnhJrubjfLvJ2ShJCjfi8vFtmas5P3Ws9bIvkQcy0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5550.namprd11.prod.outlook.com (2603:10b6:5:38b::24)
 by DM4PR11MB7328.namprd11.prod.outlook.com (2603:10b6:8:104::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.22; Tue, 4 Oct
 2022 07:15:10 +0000
Received: from DM4PR11MB5550.namprd11.prod.outlook.com
 ([fe80::1427:9330:d44d:2c17]) by DM4PR11MB5550.namprd11.prod.outlook.com
 ([fe80::1427:9330:d44d:2c17%5]) with mapi id 15.20.5676.031; Tue, 4 Oct 2022
 07:15:10 +0000
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
Thread-Index: AQHY18EJk8i6XwdkD0qG/Rq3PlD3Rg==
Date: Tue, 4 Oct 2022 07:15:10 +0000
Message-ID: 
 <DM4PR11MB555011387E9D6D5CE47D6795E45A9@DM4PR11MB5550.namprd11.prod.outlook.com>
References: <20221003062716.3759210-1-narpat.mali@windriver.com>
 <CAMKF1srgHEyVMQUr6VPMjhk5cKN_7CmSacwWpFRkmBuvK6muoA@mail.gmail.com>
 <DM4PR11MB55509038ED491A594997F441E45B9@DM4PR11MB5550.namprd11.prod.outlook.com>
 <CAMKF1spoYEUkoa3W72PG1pkaB31zDYoH0cajaZGkE0hpA-0tKA@mail.gmail.com>
In-Reply-To: 
 <CAMKF1spoYEUkoa3W72PG1pkaB31zDYoH0cajaZGkE0hpA-0tKA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-IN
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5550:EE_|DM4PR11MB7328:EE_
x-ms-office365-filtering-correlation-id: 8308b477-8152-4c98-89ba-08daa5d82c55
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 cLWjwVz8Rz6kvq3ss7ce9cG1m73XYquBZsQkzkPBsChOhlsYjSGSvZ1cbGK7R33Rz0+4sPAVEoZhBou1cty+RjXbfLYseM/Vm7r+39I3yHsJowUoqhGDX08FKUcpplaQOTbLVL/BhwVEDmcQAHgeZBGvc3nyzrUEIz36A1sGvNSuw1+crkW7nExizG8B82tct7Q31RNh8OrZ9rHZNdkRxxcAwpMAiqU7a/Yjmb1nz3JMFUDmYCRVeZubLqvr2wdjeFiGlA8mB0NnhxlN3O0mskY0nI4C+cfvegUmdfGzPrG8wf86FfePVF3I6IHGj40PB1B7fZAYkTDBDWsw1MQvLCtJ1pk3Ug71Q8NcNIcDzlK7JHxp8ICrIgeqPE3JJpvn7nuIhShlpARu7er1OWADvEveQnSyvoYOrocxt8ydYfFiuKNcBtn7nNVJk4zRSXSAcQTvk2LKuWR+6hNxX9r0qJg076niuIN+yIzc6ITuNZizHJVUrCdbp+p9eqOytrTDyP8ckMxwNNB1TOJfjQVTJPYYhmAsrv+fW0gTqPoI0izg1MwvhIEXZ9JmRzTSfHvjnKlu6AY36I/6MIrbjEr5ulscKt7bU4/xtP2GPPYq2bgW1KrZ7T4tnEzNpWkX6jQ1XwNdbukYvvHMgu00MZpCNp03BC/y4ZHwIUw62xWpg87Gj7CxGxcAoP2smtdV4uPxpzA9Lnh56rTM28OmqVNu3mRS8Bb60ZVkRo5LGIbLNMyQVPPG5RE/xlQe9fnWB+gXBoVttxi7NyjkY/WRd2YXRw==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5550.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(136003)(376002)(396003)(366004)(39850400004)(451199015)(6506007)(166002)(53546011)(966005)(7696005)(9686003)(71200400001)(8936002)(66446008)(66476007)(99936003)(8676002)(33656002)(38070700005)(38100700002)(41300700001)(5660300002)(54906003)(64756008)(66556008)(122000001)(4326008)(76116006)(91956017)(86362001)(66899015)(52536014)(478600001)(55016003)(66946007)(316002)(83380400001)(2906002)(6916009)(30864003)(186003)(19627235002)(579004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?Windows-1252?Q?6weo9eSiOlblwPnwvQJTOiseEClA3xDJX9x+z4QlXTjSl9MpOFzZB86Q?=
 =?Windows-1252?Q?pLw/EZx03iEea6VM8MlkEC3unMur/4b1+2yK3KWbr696XH9yR3J0Ja77?=
 =?Windows-1252?Q?h+ifzaVUsI13hFd7HU2TOSI52Zo/e1/DxGVWV9ISyEDQfXNynkeh11I2?=
 =?Windows-1252?Q?hWRca0UUeLQWqDGmCZ+wJkmb8Kw+AJyyODnmVvp/9z8PcjKGF3CYfHnr?=
 =?Windows-1252?Q?tLK7cBdiLZNV5EEH+4g0mJVhTf/iddLrGNO45HFcaVMYZKYOZFLT+wFo?=
 =?Windows-1252?Q?QFqKw9qZPcVH/BEO0eYztePCMDp5uM44gjGuhrWnw6MFqePfpg8k7AWg?=
 =?Windows-1252?Q?MfUg/Gq9fTx9CRx83cb2mZXarTY9XT/osQueKsyhw1Br1dGMsCt/kP1W?=
 =?Windows-1252?Q?De1B90q0TwMxSLdqZWniFJ6g31P1s2w/fIdnP/PRviMPHVFc7iQumzUd?=
 =?Windows-1252?Q?VlJrYYRVtoGXkCsKKonZamiTlSWCj29NwRkupUK+iHsRlVyqsTUt3i0g?=
 =?Windows-1252?Q?t646dUCxBOtr4+9Cuoe6rwCCO0lcepnjZf+hJKjl3UPxoDzKsBT9GW4W?=
 =?Windows-1252?Q?ITW6bUW/z3yjpAo+Wf9tQXOzyGJBa0DJHMLupHlxWx+3JOzBnYLPvvLw?=
 =?Windows-1252?Q?xmEXKqRcv3E7MdX55e1sU+Em0+imgrmJYCtxOh19hpcYtMSsu5jLPA/G?=
 =?Windows-1252?Q?r6nxPYGDmynUqV6JHhv6etHNlwggAjUUiMsbFh5l1rTrCqq6TyJVUAoe?=
 =?Windows-1252?Q?UaetkKUPrm/kPKITd259Ph8EtN9nM4p7nZWab1GgKlqiuOxg1yeNmbJC?=
 =?Windows-1252?Q?W1uTEGWG5W4VRMLiyMPdsdOXIYDYmIajYwZqQK220GBEPJVZu9zEs5nm?=
 =?Windows-1252?Q?glDDqtt2Zf+uSi8f/a1NsdZOq5hk7UA+qaIscPLq43odyyYxW8ERNQED?=
 =?Windows-1252?Q?6/eBBZbyxb4BhrOuv1sofKhwQzLv7K19YK6Y39mwYZjvoZG3Pgvq58y7?=
 =?Windows-1252?Q?furE/67sFS7w5e1QaK55xNY5jZCxJzZ1hbuw/7SivHLNY9IVq1XvMvYT?=
 =?Windows-1252?Q?lea0H69TDCrR+gTfOJmqidmd0O6xCzxFBP49qjCdCLc3o2rtoYocLnha?=
 =?Windows-1252?Q?a7G3xnVSCGEPsmocwEJkFaSXlT8Nqp7tdjDG2p24MPUCZ0/Wn8n94uhX?=
 =?Windows-1252?Q?gLQj+9eE7eHhu9CRDhCf/PuIBU0zZqn0H+xR22BVQQo3zStRCDmdxnnz?=
 =?Windows-1252?Q?nntccr4jgbJtr11gcyoe5qXSHuLa2fP2WAXt7QOb1iqeCaCiD8TXuWLT?=
 =?Windows-1252?Q?agoy8inEb0b7TaHbCbaTGMMrIK45FADVABnW7TwrN1bJzEOQV0LcQn11?=
 =?Windows-1252?Q?sfw/9c8bE4Bnf2tidRNtb+rj2voDslwKFnF/HBL4uuqUvmpDBxLveG20?=
 =?Windows-1252?Q?aOW15lhKIttWwvby4KK5QlC480RAcqxaHm3zxXoXZUTiN9wlvxG7kAmu?=
 =?Windows-1252?Q?yZTL8YdhyIGqo2vfFNeueUOPjNmNz2O8kHLjFWQZV7fZUk9CYeGrRv+w?=
 =?Windows-1252?Q?4YEliBN2SYf5nQ4w1YWaOg1TwMVGBWZs01jlpxYQqcLVMS60CxYwCq4q?=
 =?Windows-1252?Q?lAHlNYzr70Sgl6wC+vUqHl+TUmtlEmUGocV5RZ3yv1k4mpHGHLnxau2D?=
 =?Windows-1252?Q?ee6VJ86zsoY3iimeO+eNqTg3X1Ip68WPd1aeYLR/IYalBsj6YbPDvZPi?=
 =?Windows-1252?Q?QL75+HVWspxzh/KG5Z/H1+OhjaM+wEbQJUs39KH75X3LWxLj9i6BZLZ1?=
 =?Windows-1252?Q?d0PYQcBH9RdcfDP+nGbCDLuqi5k=3D?=
Content-Type: multipart/related;
	boundary="_004_DM4PR11MB555011387E9D6D5CE47D6795E45A9DM4PR11MB5550namp_";
	type="multipart/alternative"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5550.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 8308b477-8152-4c98-89ba-08daa5d82c55
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Oct 2022 07:15:10.1043
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 2AOmCqpDyxEqfUc58MvGI5qK1kcYPkvcr+OFlChyW5ac6YpIkumnftTXE+xwrP4Q6wFDJpsTi0T6CyWxYQ4s9SU3J4FtGqF+JwTUC0X9JYU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7328
X-Proofpoint-GUID: 1lxOkXFBXaNLAImdDOox0yzEaPG0nVw7
X-Proofpoint-ORIG-GUID: Ngk9eBujhCaGkzbBHUzxeOXwIQHGHHeg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-10-04_02,2022-09-29_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 adultscore=0 malwarescore=0 suspectscore=0 mlxscore=0 phishscore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 mlxlogscore=999 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210040046
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Oct 2022 07:15:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/99055

--_004_DM4PR11MB555011387E9D6D5CE47D6795E45A9DM4PR11MB5550namp_
Content-Type: multipart/alternative;
	boundary="_000_DM4PR11MB555011387E9D6D5CE47D6795E45A9DM4PR11MB5550namp_"

--_000_DM4PR11MB555011387E9D6D5CE47D6795E45A9DM4PR11MB5550namp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

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


--_000_DM4PR11MB555011387E9D6D5CE47D6795E45A9DM4PR11MB5550namp_
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
<p class=3D"MsoNormal">Hi Khem Raj,</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Have added the =93[kirkstone]=94 in subject.</p>
<p class=3D"MsoNormal">Do I need to send the patch again ?</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Best Regards,</p>
<p class=3D"MsoNormal">Narpat Mali </p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Sent from <a href=3D"https://go.microsoft.com/fwlink=
/?LinkId=3D550986">
Mail</a> for Windows</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div style=3D"mso-element:para-border-div;border:none;border-top:solid #E1E=
1E1 1.0pt;padding:3.0pt 0cm 0cm 0cm">
<p class=3D"MsoNormal" style=3D"border:none;padding:0cm"><b>From: </b><a hr=
ef=3D"mailto:raj.khem@gmail.com">Khem Raj</a><br>
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
.9.1 -&gt; 5.9.3</p>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div style=3D"border:solid #9C6500 1.0pt;padding:2.0pt 2.0pt 2.0pt 2.0pt">
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto;line-height:12.0pt;background:#FFEB9C">
<span style=3D"font-size:10.0pt;color:red">[Please note: This e-mail is fro=
m an EXTERNAL e-mail address]</span></p>
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
m 0cm 0cm 6.0pt;margin-left:4.8pt;margin-right:0cm">
<div>
<div>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto">Hi Khem Raj,</p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto">&nbsp;</p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto">It is the same commit but, we need this patch commit for =93kirkst=
one=94 branch of meta-openembedded.</p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto">We observed that the =93master=94 branch has =93net-snmp 5.9.3=94 =
version at
<a href=3D"https://urldefense.com/v3/__https:/git.openembedded.org/meta-ope=
nembedded/tree/meta-networking/recipes-protocols/net-snmp__;!!AjveYdw8EvQ!Z=
zYDx7kFVh5e_WREHKtwOKlB0gzWJ5uBreZgWz17XbqSPIpRoCWlAxdMV_d3cedWCD1nDmiLXuSY=
tigk1r7C$" target=3D"_blank">
https://git.openembedded.org/meta-openembedded/tree/meta-networking/recipes=
-protocols/net-snmp</a> and the =93kirkstone=94 branch has =93net-snmp 5.9.=
1=94 at
<a href=3D"https://urldefense.com/v3/__https:/git.openembedded.org/meta-ope=
nembedded/tree/meta-networking/recipes-protocols/net-snmp?h=3Dkirkstone__;!=
!AjveYdw8EvQ!ZzYDx7kFVh5e_WREHKtwOKlB0gzWJ5uBreZgWz17XbqSPIpRoCWlAxdMV_d3ce=
dWCD1nDmiLXuSYtnBwmXJ0$" target=3D"_blank">
https://git.openembedded.org/meta-openembedded/tree/meta-networking/recipes=
-protocols/net-snmp?h=3Dkirkstone</a></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto">&nbsp;</p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto">Since, our product is using =93kirkstone=94 branch of meta-openemb=
edded so, CVE-2022-24805 to CVE-2022-24810 are vulnerable for our product.
</p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto">Could you please let us know, How to get net-snmp upgraded to 5.9.=
3 version in =93kirkstone=94 branch ?</p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto">&nbsp;</p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto">Best Regards,</p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto">Narpat Mali</p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto">&nbsp;</p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto">Sent from
<a href=3D"https://urldefense.com/v3/__https:/go.microsoft.com/fwlink/?Link=
Id=3D550986__;!!AjveYdw8EvQ!ZzYDx7kFVh5e_WREHKtwOKlB0gzWJ5uBreZgWz17XbqSPIp=
RoCWlAxdMV_d3cedWCD1nDmiLXuSYtrYRmqeF$" target=3D"_blank">
Mail</a> for Windows</p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto">&nbsp;</p>
</div>
<p class=3D"MsoNormal"><img border=3D"0" width=3D"457" height=3D"2" style=
=3D"width:4.7569in;height:.0208in" id=3D"Horizontal_x0020_Line_x0020_1" src=
=3D"cid:image002.png@01D8D7EF.1DB55BD0"><o:p></o:p></p>
<div id=3D"m_-932456720383352559divRplyFwdMsg">
<p class=3D"MsoNormal"><b><span style=3D"color:black">From:</span></b><span=
 style=3D"color:black"> Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" =
target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
<b>Sent:</b> Monday, October 3, 2022 12:29:18 PM<br>
<b>To:</b> Mali, Narpat &lt;<a href=3D"mailto:Narpat.Mali@windriver.com" ta=
rget=3D"_blank">Narpat.Mali@windriver.com</a>&gt;<br>
<b>Cc:</b> <a href=3D"mailto:openembedded-devel@lists.openembedded.org" tar=
get=3D"_blank">
openembedded-devel@lists.openembedded.org</a> &lt;<a href=3D"mailto:openemb=
edded-devel@lists.openembedded.org" target=3D"_blank">openembedded-devel@li=
sts.openembedded.org</a>&gt;; Polampalli, Archana &lt;<a href=3D"mailto:Arc=
hana.Polampalli@windriver.com" target=3D"_blank">Archana.Polampalli@windriv=
er.com</a>&gt;;
 Urade, Yogita &lt;<a href=3D"mailto:Yogita.Urade@windriver.com" target=3D"=
_blank">Yogita.Urade@windriver.com</a>&gt;; G Pillai, Hari &lt;<a href=3D"m=
ailto:Hari.GPillai@windriver.com" target=3D"_blank">Hari.GPillai@windriver.=
com</a>&gt;<br>
<b>Subject:</b> Re: [oe] [meta-openembedded][PATCH 1/1] net-snmp: upgrade 5=
.9.1 -&gt; 5.9.3</span>
<o:p></o:p></p>
<div>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
</div>
</div>
<div>
<div>
<p class=3D"MsoNormal">[Please note: This e-mail is from an EXTERNAL e-mail=
 address]<o:p></o:p></p>
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
</div>
</body>
</html>

--_000_DM4PR11MB555011387E9D6D5CE47D6795E45A9DM4PR11MB5550namp_--

--_004_DM4PR11MB555011387E9D6D5CE47D6795E45A9DM4PR11MB5550namp_
Content-Type: image/png; name="117E5983738545F3B03544E8BDEB48CE.png"
Content-Description: 117E5983738545F3B03544E8BDEB48CE.png
Content-Disposition: inline; filename="117E5983738545F3B03544E8BDEB48CE.png";
	size=160; creation-date="Tue, 04 Oct 2022 07:15:09 GMT";
	modification-date="Tue, 04 Oct 2022 07:15:09 GMT"
Content-ID: <image002.png@01D8D7EF.1DB55BD0>
Content-Transfer-Encoding: base64

iVBORw0KGgoAAAANSUhEUgAAAq0AAAADCAYAAAC51TYcAAAAAXNSR0IArs4c6QAAAARnQU1BAACx
jwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAA1SURBVGhD7dYxDQAwDASx8CdVBEUQMKnULQx+
8EnmcHVuDwAAJPvTWpIkSVJga1oBACBXzwNm3TsdoNS1HgAAAABJRU5ErkJggg==

--_004_DM4PR11MB555011387E9D6D5CE47D6795E45A9DM4PR11MB5550namp_--

