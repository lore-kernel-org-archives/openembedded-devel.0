Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EEEFC4332F
	for <webhook@archiver.kernel.org>; Mon, 30 Oct 2023 13:24:32 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.54])
 by mx.groups.io with SMTP id smtpd.web10.148678.1698672263375527131
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Oct 2023 06:24:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=FIDbCvly;
 spf=pass (domain: navimatix.de, ip: 40.107.22.54, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TxEJXLFKFMyJjh04doc+JsViyRWidy18nIzy91c5exQrS7R9wTMfhzxyWsx1hebWXD4JHHN5ZAN4LcnMJurh0/C8q8BKArnx7Ui0ZWA4pvQUpJXBU5IF1SVU78cTm2tVK8UCsFhFNndXQlPQMxSiz7Ty73uLiPyQodxr7Tn10ghiOdvMoX0odb6mw0GPA9grkBrx7oXji9wqLqxpb06miVFRv/td3Wi6Soc7FtRR1yJxJEawQGLv0Xprf0RYtQ+2Yn27zzQPT3WvtOz267pX6qaIn8Gl5bbCWJLD6uTcY+4FSHA3XbuBTcx46d1wcOOAVfFU0BnffsfQwgTO+7UA+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q4sRAMTrp8BaL1TKW6N6vVrM6c1RnrbiqN/2ZnyI/Q8=;
 b=F5Ln7ZCZ6KKY5rkDrBtwKwo3mMfzKml5Jtcvna0YpbyjpBR3B+MBRAD9XiAwcTxgs7LDmTbuY9ITFuzCZOc7PrcvfX7xDb0IwwvtLUi7XCaHXrFejQ2X58GKrYZH9WvNt0IUkpwuGrGb5cvWjFg8fBGLOlmvx4m0K37z2x/nfzEeDXGl+EOdJyzykpSVL9oPha3YtMVe+QxFo1+vqOR1SrLraR+Gbs+dDYuWNwM/MGNP8Y/H4CUsSD+fLEF+ZYFyHT93Bn4mW2BJADe66YOeHxflRNjw+lJG3JC2Xsdw3UaNsFGL50QYLgRwMpCSjVIf55hSi0Gw786/OaIiYtjG9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q4sRAMTrp8BaL1TKW6N6vVrM6c1RnrbiqN/2ZnyI/Q8=;
 b=FIDbCvly80MYts4WOGgo4b3Q+h3a8VxKCnZ7fhxr5QOZfxScR09/KwncREvRA/m0rssS/g/FZxWTEKSBC19lwdounS7nuFbaj95awSM7a+JL8KvQzEJBHauzMJKUQYt+Lj+CFAKL/OCBAtyRzKbBswkzpZ6gKmeyn0pnVQqsXVw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from VI1PR0102MB3136.eurprd01.prod.exchangelabs.com
 (2603:10a6:803:5::26) by PAXPR01MB8582.eurprd01.prod.exchangelabs.com
 (2603:10a6:102:22f::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.23; Mon, 30 Oct
 2023 13:24:19 +0000
Received: from VI1PR0102MB3136.eurprd01.prod.exchangelabs.com
 ([fe80::e2d5:b5c9:16e3:1417]) by
 VI1PR0102MB3136.eurprd01.prod.exchangelabs.com
 ([fe80::e2d5:b5c9:16e3:1417%3]) with mapi id 15.20.6933.028; Mon, 30 Oct 2023
 13:24:18 +0000
Message-ID: <8c74e755-d1b3-404d-9025-25bce4d91c3d@navimatix.de>
Date: Mon, 30 Oct 2023 14:24:16 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] openssl-native.rm_work runs before kernel-module.install ->
 no signature
Content-Language: en-US, de-DE
To: Bruce Ashfield <bruce.ashfield@gmail.com>
CC: Jose Quaresma <quaresma.jose@gmail.com>, Khem Raj <raj.khem@gmail.com>,
 openembedded-devel@lists.openembedded.org
References: <d9ff922b-383a-4cec-b206-84d86987f4f8@navimatix.de>
 <CANPvuRkMCLPXo9FWwU+gDn4=O51=7OGWMj=Z47NGEv6F-8uZTw@mail.gmail.com>
 <CADkTA4N-aH1jf3SAVykTQ+G+t-baWNEOBjH5O56u25QJmmqw5w@mail.gmail.com>
 <CAMKF1srD7oyOwy8-ycm=wqqnpC8fGT858pManMLS6QCWL9tXXA@mail.gmail.com>
 <CANPvuRmrKmZC65RqFkHV2-wTZnMmLwH0f_cQprmB3Boc5w7sNg@mail.gmail.com>
 <c89d8ff8-d3b1-40b7-bf07-3d8928c0fa48@navimatix.de>
 <CADkTA4NK8=9su8PUSiLETUpe725fezrHqacneiKkjDz4iDP6Lw@mail.gmail.com>
 <034542e5-9942-42b1-b57a-49c007d7e058@navimatix.de>
 <CADkTA4MKV9h6ttdFEtKdiQ7jP8LfPbbWk8agqK9g0goExWZNmw@mail.gmail.com>
From: =?UTF-8?Q?J=C3=B6rg_Sommer?= <joerg.sommer@navimatix.de>
In-Reply-To: <CADkTA4MKV9h6ttdFEtKdiQ7jP8LfPbbWk8agqK9g0goExWZNmw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE1P281CA0069.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:26::10) To VI1PR0102MB3136.eurprd01.prod.exchangelabs.com
 (2603:10a6:803:5::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR0102MB3136:EE_|PAXPR01MB8582:EE_
X-MS-Office365-Filtering-Correlation-Id: fe0e02fa-e3d3-41fc-1d35-08dbd94b8537
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	KFWZygH5G5fhS0Lo9hk86YtujHfWwsB2kBcLkrh0XiJuzR5e4FK8QxzKgMo+w0u20rDqH33y2JQEihqDD5qdl7EaVD98xeoBpVgJ5A9i7NBmmbWOem5fHq+My4XpN7GC94nr9vZI6ezq3f1VeKInIK5Z6pLEmlSs5nAfxIXZ4Qown47p2eemtfjYhPC4fNjses35YBtxnzK/9EKR7zcsWN9NOB0ImqqBOMfpqLSN+KBe34fpdwlt1LF5RuVxk++oBaZ7aZ8lJv2My4KC47IXE8O/3YtKbAI0kiiSzQ7BZNhWYdvfjP2r8axLlu+l7TARK3ZaXxCl6+X2ShHPG7ZdsyD8BgxxUBfhS/DTlwkQCF3yKkH23i/2lloa6JfgUdmZupw4G32YX+9+1LBPjhp6Lr5qd2fb//8zCHK/WOUv1ZnczqJp3c9vB4d8k3j7yyfqEvzAuvyaXAhvEa6AfxlaiR6XdO7e3s2gZRTd2UEUq63c4NtqIqLUlK2d7wGIVUGaQYsJkNA6outm2ve4hGovwNGoZStF2awRc3Am67pSDM5DoYJlWE96BmN2/9oIYA2iXrmdXCCR4dxGfbK9rvRXiHtVj30taNaN2l66qVFdutZtqcKnCEynZzzEvsPT7Bxy
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR0102MB3136.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(39840400004)(396003)(366004)(346002)(376002)(230922051799003)(1800799009)(64100799003)(451199024)(186009)(2906002)(31686004)(38100700002)(5660300002)(31696002)(86362001)(2616005)(41300700001)(83380400001)(8676002)(4326008)(26005)(8936002)(6506007)(36756003)(53546011)(54906003)(66476007)(6916009)(6512007)(316002)(66556008)(66946007)(6486002)(478600001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?81uBAnjJAzyi/6JpQM/UpgnVNG7XtSysCq2y40+ubm2BDjKz2D1rPe4CJkTL?=
 =?us-ascii?Q?bCgiwlVhVpnK9J1NZY866vo/V5xL3s4knOT1LSLYXSoVBXVQCNRyFB7JRKOo?=
 =?us-ascii?Q?RyztMqd8MS7u2JTZX831svg809j3+qXeu4M1w5pGDzenfJ3npBeEkBpUY1GH?=
 =?us-ascii?Q?QO75zWHfcZ3l5/+0lluydO9qfpylKLA3g2luo8AUH/O8kvNC7etSuMCKsRHE?=
 =?us-ascii?Q?Yzjbs34hMvx+dSToSjWnxERwzYLTshH6rsXdDmCBQSFJ7uF9H/qYu8sDM2Zq?=
 =?us-ascii?Q?1cSS2mR2FX6oPqmASpffTwCgHbaWTfowJH3Vma+11cIZH6iN9dyKkzqyHT8R?=
 =?us-ascii?Q?w9e/c24FnVb61r99ijz4QS0z9EIHclwBX9iJuKPVywU0La0aKHD4EIpthFTR?=
 =?us-ascii?Q?8pK4gUY9Rgx9tIkmQF5edXE67kHEH6NYN/GKCtTAmUYlF3oyYuvDExJTgnOM?=
 =?us-ascii?Q?HE+rTp7fEoIPgl0ompRe4QVZx9kk6QcMI92gC6BlZuOpDo/zcWzMQo8hN9YQ?=
 =?us-ascii?Q?yuFaPcEccL3SoHbbzly/eQZORmjn348MBCBib+yh2+OFhS/7H3jjKk3Uk1WQ?=
 =?us-ascii?Q?A5m2BWwIY5zAxx5Y2k0jyLC8ocRnKO7h1q5xSUxG0KqOjI2IFJ9kaEQ6y3nR?=
 =?us-ascii?Q?r/4VahJ8MWxI/9rGrjllGS/eZr8BOoaDactq8nWq8rDNnuMXEq9G5qoI1YsW?=
 =?us-ascii?Q?2fWyO3D/9RPMuG/qVD/xOe5mb5nFFNZ0Z0R23c0UFMGDA9n8BPg8Nyw2p7ZD?=
 =?us-ascii?Q?2dpta35iQqYLEKRXeT80njbTk78Sh0TDHGefYMPyxsKHB665CaT5AJnO1xR6?=
 =?us-ascii?Q?OGCM9huqeteDzyMbA6x+lLSdze3HH8Wkj4oM8WKmRVIkoc2W5ppHDHG6qrpb?=
 =?us-ascii?Q?r3BBsxAEcgOZFwktTHK9vjL7PDGnZ5chC0fWQxyJ1+qLx/E8tdfSJ3GwxNX4?=
 =?us-ascii?Q?DrLcymYfwhcHvF3DasdD/n0n9lGM0ylR7ta8cOpBiG2+7kJOFZJ/gBgVuMpE?=
 =?us-ascii?Q?+nEdcBef2ISt4zTsJLonv3bPTZKnQOxdE2fX3B3kz/xncOGmqZq+qR3FEI2+?=
 =?us-ascii?Q?oY0UKa1TLWVgi/zQCDRdFey2nx3F2mDWq3vj1rn48qZ63e8VjM/Bc2SaXvf6?=
 =?us-ascii?Q?o/cIVSQ/4XFND5D85nxdMwETiK+NXLYqCKi5Aglsa1k9xYGTw9macL+sMw4n?=
 =?us-ascii?Q?FPndv9e4tF9jbYxUV0cOvpk14BYXhtU6JamNMpmc9E0TYoLF+aUi9zkak2dd?=
 =?us-ascii?Q?qnoayB+/Yu4X1RoysEwspoqtl1eiFSNUUAXyZQaInRTiR6J6c6XPx9a8gnHe?=
 =?us-ascii?Q?HpdsTnNrV58x65BXK7WWqxPoIKiResQ6e48VSbR39JCIjNtwzkoVO1AykUry?=
 =?us-ascii?Q?XyAylxmgQhkACVoGOWJGj7I+SL6TeCe/dUw/ZtLsNdJLadiB/hJTuEqLZu2r?=
 =?us-ascii?Q?KHzleaWf/TPP16jQZhRbzpml7XnQuYdrwks3y1RHTugiOoSmUt5ySELQwmRb?=
 =?us-ascii?Q?YkA5idFyVDoNrBDLJexqAqRu0IHT58IqF7FcJTX0Q0nU8YCsC+2+la5A5o3u?=
 =?us-ascii?Q?BVqj2nQMQ7etLX7LoYDMkTfloJ6D1BpZ2GpRmBmrJmx96t6pTeIt34gXQTYH?=
 =?us-ascii?Q?qQ=3D=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: fe0e02fa-e3d3-41fc-1d35-08dbd94b8537
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0102MB3136.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2023 13:24:18.7224
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IGYTDciuZw9t/ZPW2z85zqp5gh6BKm6h/Uyt6rBHs2X3FnNQ/5V6adCYEZAsuQb6qHdEA5AvplIrjSVfHJf4zNLQilExlGeL7ofmGwCcn5A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR01MB8582
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 30 Oct 2023 13:24:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105793

On 30.10.23 13:29, Bruce Ashfield wrote:
> On Mon, Oct 30, 2023 at 4:40=E2=80=AFAM J=C3=B6rg Sommer <joerg.sommer@na=
vimatix.de> wrote:
>> On 26.10.23 17:25, Bruce Ashfield wrote:

>>> I ran into issues with some kernel versions, but we may have moved on
>>> far enough that it is no longer an issue.
>>
>> Do you remember what kind of issues these were? Possibly I can check if
>> they still exist.
>=20
> It was kernels older than 5.10 failing to take the r-path changes and
> hence failing when doing the signing step.

This could be solved by setting LD_LIBRARY_PATH. Would this be okay?

```
diff --git i/meta/classes/module.bbclass w/meta/classes/module.bbclass
index a09ec3ed1e..38e1c95216 100644
--- i/meta/classes/module.bbclass
+++ w/meta/classes/module.bbclass
@@ -51,6 +51,7 @@ module_do_install() {
                   INSTALL_FW_PATH=3D"${D}${nonarch_base_libdir}/firmware" =
\
                   CC=3D"${KERNEL_CC}" LD=3D"${KERNEL_LD}" \
                   O=3D${STAGING_KERNEL_BUILDDIR} \
+                  LD_LIBRARY_PATH=3D"/build/tmp/sysroots-components/x86_64=
/openssl-native/usr/lib${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}" \
                   ${MODULES_INSTALL_TARGET}
=20
        if [ ! -e "${B}/${MODULES_MODULE_SYMVERS_LOCATION}/Module.symvers" =
] ; then
```


Kind regards

J=C3=B6rg Sommer
--=20
Navimatix GmbH
Tatzendpromenade 2
D-07745 Jena =20
Gesch=C3=A4ftsf=C3=BChrer: Steffen Sp=C3=A4the, Jan Rommeley
Registergericht: Amtsgericht Jena, HRB 501480


