Return-Path: <libo.chen.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF913C28B28
	for <webhook@archiver.kernel.org>; Wed, 12 Mar 2025 11:31:18 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.34576.1741779072769712415
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Mar 2025 04:31:12 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=516685422e=libo.chen.cn@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52C9p2Nu013469
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Mar 2025 11:31:12 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45b0emrg5k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Mar 2025 11:31:11 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 52CBVBVb030256;
	Wed, 12 Mar 2025 11:31:11 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2040.outbound.protection.outlook.com [104.47.66.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45b0emrg5j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Mar 2025 11:31:11 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FOGzJarJ2NkMIS6QQnzA2xUlHdeVH5oA2XhMtnPQwo3Tyulb/EWHBhTzZIQAYjMqHXHIn7B9je3AQ8cxB+06bI2BvTqoS0BFxqM64MkzStYEeTc9psiaMCjOthNpOGPk3xVYiw8wK57/iffhydX6O5MSZ6/xI/z/KQyx3nSb3XKW6q/kUDFFg9gkFN74Phh9iXm1oQ8VMwRmc7Pa2wAESGPesoWdVaLV1qYhKeSQeUortGxwyrGj1Ak8FIx52yK4CrseP5sUmcW4hdJeygJ7OIBR7x914mr9sE3My6rAZa7V6NTsvlqxH7SXoOjru/LMbqoQK6ClMgwYDkTX6Zwq0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9j/Liu6jLzq9hAKYsL0mBJ4VGfmd6nUcz8cwbmLVhQc=;
 b=nLbVHBgiHDkol8XbGM6MXhW2Zq1lR0hK2+HTaAMg4krvbVkSneRlEzWxYkfFMNhIYYETjKsS4iwhpZJfmjSFSQiJb8NM3uECGJq9K2J1v3NTiBlkGbu2iuemnm2y8JSc+ZpsiGv0YFX/Ejger61h6F02EMkH4/O3hiyf/0snFwMMmguaUgOm/reWhIEFAjOlsIIebH6HqcbV7iYq70+QWsx210WVFs/CMPtAhNyUUMIOvxQ8gj778FxMbLNJkw9Ty+N910aAM0JnTIiBG+ew5AWFwIFrp6FNqpfuDCVtQ0HGHgsj1ET5Q4VK1Adf4MPTgZ8LYKgba6YMc6MWp1X6fQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BN9PR11MB5354.namprd11.prod.outlook.com (2603:10b6:408:11b::7)
 by SN7PR11MB6972.namprd11.prod.outlook.com (2603:10b6:806:2ac::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.29; Wed, 12 Mar
 2025 11:31:07 +0000
Received: from BN9PR11MB5354.namprd11.prod.outlook.com
 ([fe80::5e9:ab74:5c12:ee2d]) by BN9PR11MB5354.namprd11.prod.outlook.com
 ([fe80::5e9:ab74:5c12:ee2d%5]) with mapi id 15.20.8511.026; Wed, 12 Mar 2025
 11:31:07 +0000
From: "Chen, Libo (CN)" <Libo.Chen.CN@windriver.com>
To: Gyorgy Sarvari <skandigraun@gmail.com>,
        "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] [meta-oe][scarthgap][PATCH] libgpiod: fix gpiod-cxx-test
 failed test case
Thread-Topic: [oe] [meta-oe][scarthgap][PATCH] libgpiod: fix gpiod-cxx-test
 failed test case
Thread-Index: AQHbkizJiLVNRAWKBUau/DtKmD4IxLNt7JKAgAFyt+A=
Date: Wed, 12 Mar 2025 11:31:07 +0000
Message-ID: 
 <BN9PR11MB53541FA81F66FA0966F4FE4FDED02@BN9PR11MB5354.namprd11.prod.outlook.com>
References: <20250311022445.2203047-1-libo.chen.cn@eng.windriver.com>
 <8f52a73f-71a9-4a57-8abf-82ce93aa4b35@gmail.com>
In-Reply-To: <8f52a73f-71a9-4a57-8abf-82ce93aa4b35@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5354:EE_|SN7PR11MB6972:EE_
x-ms-office365-filtering-correlation-id: 2566f08e-c99d-4b20-96b4-08dd615961cf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|10070799003|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?krSHUm+asMH5Wwnv8hryIq5IuqA/8uUSB6Phcdr91yM/9SlwW9UlgGa+mKeP?=
 =?us-ascii?Q?BncpwKJe6jEDC5t3YzoM1UkBFmD7smhfDjIdXdM20lCN7D01BiFYVKNF6isp?=
 =?us-ascii?Q?sMnkXGGK1g3SVGNGBix1t0Ua09L5OJAuBIYqDyEMWin8H4nokydhT7fQG4Qr?=
 =?us-ascii?Q?XtbLn4gQqerL3Lo9yW0QT+aIOEH7EGiiss7kmyTKmcG0kEMUYienYmkai6ld?=
 =?us-ascii?Q?uxozD2usPcgfKEMF8kAI01lAKLqs9sgkaLVpLY3niJd8F5AzLg86wAYNhu/z?=
 =?us-ascii?Q?xOjhmLmhy7miDdoKH2AkrZWuWti1Z4BjOEJMnaypYCDSlv6fy6B341Qt4FrS?=
 =?us-ascii?Q?r0jA5gpgMm6Yb04cFHFie85f7riaBieCbzA29G+UmMGPnD7RAPnPO2hnCtIf?=
 =?us-ascii?Q?hw4ldNxEXykMcgL9HevTjYlLow8x9LveAsdRctWQobnmQXVZ+88Do/K4O6Oz?=
 =?us-ascii?Q?C1Bo1klzqk1rHATEEc9laKpJXCdEpzINusS/p/GmN+bqXtGmAjcsovg4B8vx?=
 =?us-ascii?Q?1fDhYffgGpw4dA6Hdkk5nxClx3vS0c5/3Gz8fn4Xec6JDwVhQZYVurvV4kNR?=
 =?us-ascii?Q?Tth/VvAASn2BiiaMous9iYtPbgxiJsW8nSSrVCQOqo9/vIgw0dUCnE1TAdAY?=
 =?us-ascii?Q?Bp7fKa8fiQ9puKgxsWt7loOPdEiWNh3uqfaZFBr22mGP0Mkbab63vmmAYYTi?=
 =?us-ascii?Q?Lg/sY6ME90FCvHfNLdZ+p5Bnkdugf03UByhNS9eC+cu8IKgXrlkReRInUWBM?=
 =?us-ascii?Q?Yt+j0CHb4uvwH6fIdDQrjmO+MdQRR/21hXQrS2ZIY/Zj31h4sJw77NApu56n?=
 =?us-ascii?Q?sI8MSCf6PVlcHAGz1GO4pIKHCxxvYB5SJe5ukBl3hw+I7Tw3Ebd3YYchQg5E?=
 =?us-ascii?Q?9RedUu5IuSpyoCheHiZDt4Iy+h1iUZc3p5RTrox00Dvo58n2bRbQdFwhlfyi?=
 =?us-ascii?Q?FnXW/DTcmBKuz201suWRxfGXCBI0y+d/eoce/iNjQ1IuZ5HO+V8+isCqmIPZ?=
 =?us-ascii?Q?V/wBXvzirVYTa/x6VGHjVnfssyOyvxVgBrbVdR1vyaLiuau6otfe15OA89Tw?=
 =?us-ascii?Q?esPnXNd+3AfBGrhAQLci4yxfic43KZJQWk/eJTdR3L0CWe+9sofJLW0ORYWx?=
 =?us-ascii?Q?KiIsIYIRsLEneDYxL6m0Rg9yIgR7fXNn00H3Leq/RjyI9m0bS9ndWYlJf1lU?=
 =?us-ascii?Q?J3OuL1/Wg5qojtDbLQFIj42D+N9qYC38+PUJbbu92W76OHxGRklbFKwx6LNx?=
 =?us-ascii?Q?AMoQVwCmHV8iNpucQW3fKt1t+JCwJdeiE9GdTEfWx3a90pNvOcH/iuL4S8lc?=
 =?us-ascii?Q?gvnvScCV6wcEv6XEEbIc+wart/Ec++hWl6+0RzliCg/sfNq90YBvv6G6cFFr?=
 =?us-ascii?Q?IiX3OU1dzE90Ay/4yDvbsl9OvCL++675kxFCENlQQAnJKlGxc8M5jhRiOV+s?=
 =?us-ascii?Q?cBEpEH8mK0cLFCrkryKPzyosaz49RTos?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5354.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?zSC7p01FoC9vPCwp270TalKVTVCyzhxqVPBER4NmZlnvcQ084tt5akm/30G4?=
 =?us-ascii?Q?D1BuBDH3iq/+Sp1tz9Jl6Op6d93QW/I8sPC7D5YIk1t5WW5z8x2FHKWzCdiA?=
 =?us-ascii?Q?DHBY2iMXuyvzr6UO9iXJIDYbaYSdGTSgHgyIfueUOJJfrKFcHv2/MeeN4zef?=
 =?us-ascii?Q?c2rxGSLU3otYu2vX6Zhj7apMYgSiKiUWGrwyzadcqAuvD/JkpLLE2sMxBql6?=
 =?us-ascii?Q?YW0QUyF/hRz9KThdCpDIH8ezAvE6UZp5KKpL8XcZPHSsy4c2Ew8fkaQfCFox?=
 =?us-ascii?Q?reYyM3ag8uqEgayDk/cCZCom1ktGMH9pia9ARitDlMYCfKIP1lOWvc5+S/nX?=
 =?us-ascii?Q?1znMRp++CFcySpEKHy/r31H0PBeyafIM2QkXJmqyE+4xC5pb3F7ckC6YWI/2?=
 =?us-ascii?Q?OfN+tL9/dnORdJn7SGerby3S3+nzcSpzbXV/NTwPn76sySfGMNSjBEl073Z7?=
 =?us-ascii?Q?OqEL7ckhb5uhh4nOd/Dev11IpsOOSHs2PtcREPLSyhjf47RCbL0Qnx4F/MY5?=
 =?us-ascii?Q?QIEE5iwq2YA/r79hWBZwcVo8iwsJXeu3NNGdTBst3RvtQWBl2zjwAFFYBzQZ?=
 =?us-ascii?Q?oE7gRXz9Y8oZtnm///6agSLp96ZZNFbP8+6mr/occBc3dra6qTKSwFABU2aB?=
 =?us-ascii?Q?p1xeroecwQeW+paBPGXKJzCaJPn0ZYF2iSJOpsURoEzJ31uMTVaTwEM8Qrjp?=
 =?us-ascii?Q?yDe9x1YQgSYwuzor5qasChgVfUnCZUagGdGvmFluxSq1FMtA3fgpnobAeykW?=
 =?us-ascii?Q?4Cj5FLDU3se40qoql2OEj62JxUmdsWo/ratzzf9iVrmf6s8v1bkbnC2eb4Cz?=
 =?us-ascii?Q?PLRRBqXXipoYpZY1E3Gf+6jHbKlMbzIxV/ZTYf8cU9JQIO3KwwsnuGyTKPGQ?=
 =?us-ascii?Q?5UJnOpHfqoGbeo2eJXGhF7u2u9GGI1tfwmjqEl2eNQXsA8UTgHm6SYH5siBg?=
 =?us-ascii?Q?zUBB6pB1EjmFJLWfdynFEb6ys/SpY7RktUO8bCYUsEJtFNV9+I67+YAj+Khl?=
 =?us-ascii?Q?0weTOJc0oaG1zcDf8A1JszsR1LEpeqWKk6Trym5ocypJK0DW9XQ8qEklTpXv?=
 =?us-ascii?Q?pA4xKFzzmDsdaFW8MeWi3kB1OExWp+qQTlzgqssx1a0gm1q4fITwXHVjuhvJ?=
 =?us-ascii?Q?yk1Cu8J4DMeLBU/hnx8MXM4ppfvRhB9wx/Gdecqcg4xgbGzBNTS21DIgBFqu?=
 =?us-ascii?Q?N3qVJ5R0Nb+NorJQmRNJNmbnrjAwYzJMNhfGZcqdOTVwXY1PmHGHhTP8tXJN?=
 =?us-ascii?Q?UJh7XR9siwKoT2TJ6tO97YIgv/jzf65xrkvQnKzJFSuEB2YRt3hZqyutwG7Z?=
 =?us-ascii?Q?JDsqXFT9ggYk196n+ASknJOkG51ze5ynjQj7UCkkeVQ4asR4j9lfbVys0mxG?=
 =?us-ascii?Q?DQDnX9TfvaNb8xuRYJDfEwIfb7s6Si2a+GXZ8d0CJpmKuV2rkKtjeq8noLfF?=
 =?us-ascii?Q?SXTMIrfYPnvTFfEakhobBi8Q+dp3ffp3b9NOIrhwhqVqgDavBI9ThtuAd6kb?=
 =?us-ascii?Q?Z/eK08Sn7Zk4qHFQGnmrZjcES2SG6KNBkLrtMNtIyXKZUjDElDYj8wxiqhfQ?=
 =?us-ascii?Q?li3sRCuy3m8w1LG0GpBYPcVzMaMUiG2PJyzIRGkZsGoOa6y8nmFSlFy+N5Sa?=
 =?us-ascii?Q?VkDKc3pm/XgxZWa3jJB+CWLjkom7WfINpE6/vAXe5s/XLwx4yquHUQrqodE4?=
 =?us-ascii?Q?gBhzbg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5354.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2566f08e-c99d-4b20-96b4-08dd615961cf
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Mar 2025 11:31:07.7260
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gRGan97Z7cFpfPgzsWK8eWl1f8dIAi2soguEHLeU/sueVRyamS/SqON3w1bRClY1T5CD7wUE9FjwGfsFebknUyOn0eGx2J8oPCvW0IQPlW8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6972
X-Authority-Analysis: v=2.4 cv=J6Gq7BnS c=1 sm=1 tr=0 ts=67d1707f cx=c_pps a=+kc2f53xTGsvuL7uaCOpcA==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Vs1iUdzkB0EA:10 a=H5OGdu5hBBwA:10 a=pGLkceISAAAA:8 a=t7CeM3EgAAAA:8 a=Q4-j1AaZAAAA:8 a=ktOyJPztaX449sVuNHoA:9 a=CjuIK1q_8ugA:10 a=zgiPjhLxNE0A:10 a=FdTzh2GWekK77mhwV6Dw:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-GUID: _f6KN_PAqW_B5lrrDbRnScllj7pK61y_
X-Proofpoint-ORIG-GUID: J96br6MzASuewg8_DBkJL4FaBI-QGRKL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-12_04,2025-03-11_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 lowpriorityscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 phishscore=0 suspectscore=0 mlxscore=0 mlxlogscore=999
 bulkscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2503120080
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Mar 2025 11:31:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115920

Gyorgy,

Thanks for helping me catch that mistake. I will send V2 version.

Libo

-----Original Message-----
From: Gyorgy Sarvari <skandigraun@gmail.com>=20
Sent: Tuesday, March 11, 2025 9:21 PM
To: Chen, Libo (CN) <Libo.Chen.CN@windriver.com>; openembedded-devel@lists.=
openembedded.org
Subject: Re: [oe] [meta-oe][scarthgap][PATCH] libgpiod: fix gpiod-cxx-test =
failed test case

CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.

On 11.03.25 03:24, libo.chen.cn via lists.openembedded.org wrote:
>  ...ts-set-direction-when-reconfiguring-.patch | 38 +++++++++++++++++++
>  1 file changed, 38 insertions(+)
Did you forget to add the patch to SRC_URI, or am I missing something?

