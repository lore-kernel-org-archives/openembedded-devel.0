Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 355B4C433F5
	for <webhook@archiver.kernel.org>; Tue, 22 Mar 2022 02:24:15 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.5104.1647915854221278080
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Mar 2022 19:24:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com
 header.s=pps06212021 header.b=YRRESgcW;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=0080c482f9=randy.macleod@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 22M2Lltu029922
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Mar 2022 02:24:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=content-type :
 message-id : date : subject : from : to : references : in-reply-to :
 mime-version; s=PPS06212021;
 bh=uPSGG5I8kphxwl4d1ohjJfLbdmEYyzwomHkAbqOmg20=;
 b=YRRESgcWjgIOzQK3Ze5YwywWEibxkjzPARhzYR2KDbL2ytuoI5ymnKIaxPu/ACGzFbuI
 L2uHVkMM9tXokyGADuyfvOmgJwo5yLJ9zL6cuinUdJ/TTxkMqRa8QNzMBMSGP0MzQVcB
 jc/3BEjIjyI44FOObG7vAJia3mgN+SnVE/EyLVI/m3X4OpA7yr2EeMaVPJ7BTiCSo0kq
 W6erZJILifNC8dbyIm3BsKVp3WHMc/ZXQWtRq4EIZe2MqsVIqtfttOBB1fvuJxuiXL3z
 XYmzTsdsEGzCKIgW7tq/a7I1RReAXbeKrp03WVVhc0t/HkmWayZ0PBOk+gFsIRz/pVVY wg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ew657a2ru-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Mar 2022 02:24:13 +0000
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 22M2OCfn003298
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Mar 2022 02:24:12 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam07lp2046.outbound.protection.outlook.com [104.47.56.46])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ew657a2rs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Mar 2022 02:24:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fwCvigUx6GAq4esnAAeTpK/pOOG/N97kPQ5kKec+K8aT8MVEsfk+csbVnkm16VR4R58DMZHfWWgSqPPlNX3HcOhvPrRcxLzW6VODnA2YQJU2JtYlZOVn4QKUn00kMBC+kbHt3KEnPjdVBsxyTK8fvFKd3L+4YQzbXKX4xaiRZ5RK3xiAR34NxWpn1mjfF+5aLlIWN8v8tcExSFjb/bSwwn4TgOMqOhKiZcI44pv8e63arkjQtB5Y9AhFP2caO1ZhyFw5didXjyI4OKiHScf2tF2Fg6KofLUS1Pbplg7pghH+s3NSLbxIpvXkht4HTIaZXztyhgzzOvUO7lGqczcHDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uPSGG5I8kphxwl4d1ohjJfLbdmEYyzwomHkAbqOmg20=;
 b=Kp+aOoodgOonjxVroI+gCssf+rVpnnjwW9XG6cVJ4kJkg2EVYaIN5OOXhh5oF5Tgkb6N1S3jk8Q5bfJWA11mdEb9EOU2Dem8TNXK2TSKp6f10Fo8HlURiiSikSNg00/BXuE47pTRVoC/0dwtOKjzK7qj6/7Fzcd1stiPUu4kZaqCpX052Jo7msxbk1oMkCWeZ2MFXqFIvgjFqIRnd8Vtf/hBEXPlY4zxB1VEkzNLfIT+xzo53KqkkIJHN47/d1xmd193r1R95G+sRJksVHxEf74AznDlC73rZO62XiRW1jIERC0t7142rXnPNSBxZ3oiu/CBqL8OaJmEy3uT4D8/eQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by BN6PR11MB1794.namprd11.prod.outlook.com (2603:10b6:404:104::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.15; Tue, 22 Mar
 2022 02:24:10 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::19c6:8fec:7ecd:a91]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::19c6:8fec:7ecd:a91%5]) with mapi id 15.20.5081.022; Tue, 22 Mar 2022
 02:24:10 +0000
Content-Type: multipart/alternative;
 boundary="------------Ma3tO4slP700hh6e0woGTZhQ"
Message-ID: <b9660d42-19b8-81af-fc0c-06fc5b33cbde@windriver.com>
Date: Mon, 21 Mar 2022 22:24:05 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [oe] [PATCH 1/2] haveged: update from 1.9.14 to 1.9.17 -- drop
 haveged service support. ??
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
To: openembedded-devel@lists.openembedded.org,
        zangrc <zangrc.fnst@cn.fujitsu.com>,
        Armin Kuster <akuster808@gmail.com>,
        "Stanescu, Liviu-Octavian (Liviu)" <Liviu.Stanescu@windriver.com>,
        Stefan Agner <stefan@agner.ch>
References: <16DE929F3EAA76A2.18232@lists.openembedded.org>
In-Reply-To: <16DE929F3EAA76A2.18232@lists.openembedded.org>
X-ClientProxiedBy: SJ0PR05CA0046.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::21) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6ecb0a65-e2cd-4570-d02f-08da0bab0c58
X-MS-TrafficTypeDiagnostic: BN6PR11MB1794:EE_
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB1794FDAAC094FFBD3156CAE9F8179@BN6PR11MB1794.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	CYhKXR4zBoChPlSJPxeYZ8/zb+ib/nLoGndg4ICD7t78WUF59CEm/3UtoyKpPSdIl4grDEhFGnNGRlFSsoyu3ZemzysqOf1UrGlmAPeQxaGFUtFdqDgCdg/1bmsxWf97H5c9Y1qZ+VsQcAVQZNs6kukPQ7InaUFFQQJapS8krTpYTxYhkv4mxePgrEMmOeWPmS4TCKY66x9pZA6h9bC7vdFWqMFuPZKgmtrBIdYNEz7xcuR7kVjOHbCTIvfhUoWXewf3x5rlnJmVpGyU7n6RypqnngDWiWkftwEQySFe244qCc+pQRPEMFYDkd7qP/nK5cKbSXFCgDDijw/wkwbxV8Ney8PIzdEhDm00IgjBZPnsLhWts9HoHCVMENg7rta2QMi2WZ4+fM6DgezPSRULCZGAF5f+vF6388KKK8ItUhkovRgGnsAWtFkTy+dVT6soG5npbBsKnWwcVxQXa6IMGk7g3Yj2fyUPazJnBjCwtxnNU5lKaBc8CJOXhmi9amN05WQILEtom/ltBocVcNpDJvY3Lpj/JGKj+zWO66eVfa9I/gAz5vTm38HLerUOCRWIeP+WFsce36VqmA3cG86vbFYwp44FOzss7RLFAjdMW1zBHK4Q+m0cPJieHqsjgknZvxKT86EG+BkNhewZ7cNdShaUiPZCZ9ixo1jnF513UIgn04YRK8g3QBqXFrBYYMPO8YmPkE//OGVTtKg3DvU48wLufK4ggC6WZ5dshaYIBHZLCUwC7Sbls8bfK61e0I160Tj3GChgt4+BI95DDvYjP4zx41B3/x0uw1+xH8kfTnFYOJpiQyRr+abOBrj2WsY7ccVVrg/XXSiyl5S8WF7OdrH5WGr/Jmka6O+LOCt9cj0+3zwrgbahDh4qmnwPz/XfCkbQoEgOCaMF8cS9dS49fQB0Ld81+NCZdZcYxzp0Hq4Q97mkGJJA7zFQOH89dJLo
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(26005)(966005)(186003)(6486002)(83380400001)(36756003)(53546011)(33964004)(6506007)(52116002)(8936002)(166002)(316002)(2906002)(6512007)(31686004)(2616005)(508600001)(6666004)(5660300002)(19273905006)(110136005)(30864003)(15650500001)(21615005)(31696002)(86362001)(38350700002)(38100700002)(8676002)(66556008)(66476007)(66946007)(562404015)(43740500002)(45980500001)(563064011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Z0xvOTZ6OTU2S0k4OEIyeWtGSXNUTWtwMHBjMHMwdFlaVUNaNi9PaHU0Zk1m?=
 =?utf-8?B?c2FJVVB0R3RiZ01MMHpsUGprY014ZmNDWFEwVkphekFGdmdZQTZwZ21xZjVX?=
 =?utf-8?B?RFI3YmZjOTkzMnVSL1hxVDhSMzFaU2xBMDFlcXFBVS9TNmlHdFhBWVYxQ2lC?=
 =?utf-8?B?ZndkNmxFY3gzRGp3cnRFVlVrdGdrK0FoMStDZnVTREtIWWF3Y2c5TDhxVlBZ?=
 =?utf-8?B?R09GVTdPTkVWTjgyV3NlTm1hdVRoV25Qa0RkSW9peEVYOVlucUU1UWtHL3pK?=
 =?utf-8?B?WmpVNjRKaVhqdmM2eXk0dXoxT0ZWZWd6NEhaK2R2RDZCeWNnRHdJbHRrN0My?=
 =?utf-8?B?elg3VWN4aXZBSHgvUVBReXRNT0xJbTRNTXpKUjVrdEN6Z3hheUtMeEhidXlw?=
 =?utf-8?B?KzRRTFBZUXl0bXV3aTFvYmlzaU5oUFJuTVNkMGQyaGlZcnZrZTQ1R3VwN1V5?=
 =?utf-8?B?ZVZYQWg4NTcwcGkvRjd4bm1XaG10MWJKNHROa2ozK3ZpaHhBZ1Vvb2x5a2RF?=
 =?utf-8?B?blZEcUFMTGNGd1FjR0dBazdNVEgzQ0JaUWRudGF6WFcxREdET3I0MEU1blhu?=
 =?utf-8?B?SkxjY253ZDJzdDV2MTJOOElkRUthK1Q0NkJ2a1FwY0xDMGl6NFVwSjBkZzZx?=
 =?utf-8?B?SjZNSXhaMVhxcW13ZkgvdHFLZXhrMHFRaHM2NHNrMFdtdjhKd05HSXBvSHp0?=
 =?utf-8?B?YWsrcDVXQ2JrM2FRdHRxZ1ZJa2MyckJxcjV5b1ArMkg5ZCtqZ1k1QVkvRkNi?=
 =?utf-8?B?TTRYWndCR0ZWekU3YndTem0yV1BFbndDR0JVbGJyeWZ4YkRaWDZod1UzbExq?=
 =?utf-8?B?SU5TdVRmRldpcnUxWHJmMGNrUkJCSlFnTnBVTzZQQlltcURDYlFLcWRFWFRU?=
 =?utf-8?B?RXkxR0NTVlhBaFZYNEszYUlPcUxaTmkxNmMyUmRZZ2ZFdGtNZGFiZHRmcFVr?=
 =?utf-8?B?OUpYMXVzYjhSODhQUThSUVh2RXNLZTlTK3Y2ckJ3OU1DSUJUdXVFWGZLdTFU?=
 =?utf-8?B?b2FGbmQ1YlJoQzJVTWg0RlFodTNMUWs5OUl4eUphZGp4c2huZUIrQzd4Q2Z1?=
 =?utf-8?B?Y2pMMExXa1FSMHJyOFl5ak9uWUtTMHo1b1VodEpqN1hHWFgwaDFvNEdJalJH?=
 =?utf-8?B?L1Z6NXFzUUU2TjhEL3hZRWdIWlMwWjROM3BuVlRPV2JqbHdDSkFSTytqWGhl?=
 =?utf-8?B?MVNlWTVHZ0x5Q1dnemxkdFNyQXRiTjBuUncxdXZvcUMyUXAzdHBlOHVaL3Ur?=
 =?utf-8?B?eGVJSkQ5VklJSGc0dlRQd3ZSOW83cUp1bjFOcG12SXM1SkJ2eUhuTkd1cWlR?=
 =?utf-8?B?eEFYV3p4cU5rMngwU2ZKQkVTaDB3cWZxYWRNUDZvSzRSNkdoN1J1dG44ZHpz?=
 =?utf-8?B?dTFyL2ptVXpzdG5YSUo2Vk1wRjhUcEhvQ08rMUxMSjQrZFpQWjMxdFdNOGlx?=
 =?utf-8?B?U1l0d2I0dXJvS2g5VlR2R3B5dlo2dTI2V0xLNllmMDN4NGkySlM5UmRMZVk3?=
 =?utf-8?B?QnJKZmszcTBwWnJyWm5KVUxUOC8vdUZWUFFEdkxMWVpWZzVXTkJVTkx3SmRt?=
 =?utf-8?B?UVpZMllsNUJodUd1ZlZETXo0clp0STdlZktYN0lPQnplWVg3cU9IMEIzZGdK?=
 =?utf-8?B?WCtQbmpSNWQ5YUJxUjV3aU0vWTRZbDUrTDVLNzhzMnJheUIzcmJQdlA2RFlW?=
 =?utf-8?B?M3BlcU4zTXdxc05ZcXRpVVhBQUViTDNpWFE2YVphQ0JpSDNsTEw1Z1o5RnpR?=
 =?utf-8?B?UHVTZ0JHSjQ0ZmFNVUlISzhvWUlNVGtkMnE1U29kMzBjQ0VXRmdVT2M5RmpT?=
 =?utf-8?B?Wmd3TnZSeHVYLzIrWWtiNmZJblkvcmZTQnZLQy9DT2RtaVB2ckZmdmtjbStl?=
 =?utf-8?B?M056NlE2QlQ5YkU4OFJ6WkdoSlRleGVsTTNlQXRQcUhncDAxY1ZtU000cFM1?=
 =?utf-8?B?VnJIVTYxeklzTFJiNE92UFh0aWMvRWc2TFIxaFVmRzdLWDVoSHV1M1F6MFc1?=
 =?utf-8?B?eGllcFNhMklBPT0=?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 6ecb0a65-e2cd-4570-d02f-08da0bab0c58
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2022 02:24:10.2369
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 cczvsHGug1mmt/sgcBqrYzZyPNVlDDmU60i43gcNMjuLnDEq/jGHEhrtnHRHxm+POA4k4FRrj9rFPdsbAvDdE4oKB0lVSY/7MZaRjUF/X5U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1794
X-Proofpoint-GUID: iH--XPGRcAO3eYy0TaljccEie6SEV9Q3
X-Proofpoint-ORIG-GUID: WR1PSHtvIAuAmkbtSQzomSPQA-Dr-a90
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-21_10,2022-03-21_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0
 lowpriorityscore=0 clxscore=1011 mlxscore=0 suspectscore=0 spamscore=0
 phishscore=0 impostorscore=0 priorityscore=1501 mlxlogscore=999
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203220010
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Mar 2022 02:24:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96124

--------------Ma3tO4slP700hh6e0woGTZhQ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
 mx0a-0064b401.pphosted.com id 22M2Lltu029922


CCing people who have shown some interest in haveged previously. The=20
haveged upstream has moved the init code into a contrib directory=20
because as stated in the README:https://github.com/jirka-h/haveged

IMPORTANT UPDATE

Starting from Linux kernel v5.6, the HAVEGED inspired algorithm has been=20
included in the Linux kernel (see=C2=A0the LKML article=20
<https://lore.kernel.org/lkml/alpine.DEB.2.21.1909290010500.2636@nanos.te=
c.linutronix.de/T/>=20
and the Linux Kernel commit=20
<https://github.com/torvalds/linux/commit/30c08efec8884fb106b8e57094baa51=
bb4c44e32>).=20
As soon as the=C2=A0CRNG (the Linux cryptographic-strength random number=20
generator) gets ready, |/dev/random| does not block on reads anymore.

I'm happy that these changes made it into the mainline=C2=A0kernel. It's=20
pleasing to see that the main idea behind HAVEGED has sustained time=20
test - it was published already in 2003 here.=20
<https://www.irisa.fr/caps/projects/hipsor/publications/havege-tomacs.pdf=
>=20
I'm also glad that the HAVEGE algorithm is being further explored and=20
examined - see the CPU Jitter Random Number Generator.=20
<https://www.chronox.de/jent.html>

It means that HAVEGED *service* is now less relevant. However, it's=20
still useful in the following situations, when you

  * need randomness early in the boot process, before the CRNG in the
    Linux kernel gets fully initialized.
  * want to deploy an additional entropy source. HAVEGED now inserts
    entropy into the kernel every 60 seconds, regardless of the entropy
    level reported by Linux Kernel. It does not affect the |/dev/random|
    read speed but it diversifies the entropy sources, making the Linux
    Kernel CRNG more robust.
  * you are looking for userspace RNG to generate random numbers. See
    |man -S8 haveged| for examples or try running |haveged -n 0 | pv >
    /dev/null|
  * and last but not least, most Linux installations are still running
    on the older kernel versions.

In any case, I will keep maintaining the HAVEGED project. The userspace=20
application, as well as the haveged library, are not affected in any way=20
by changes in the Linux kernel.

---

If you want the init system support back, please submit a patch.


Also Debain/Ubuntu splits the package into:
 =C2=A0- haveged
 =C2=A0- libhavege2

but the memory savings hardly seem worthwhile so I won't bother:

$ du -sk=20
tmp/work/core2-64-poky-linux/haveged/1.9.17-r0/packages-split/haveged/usr=
/*
104=20
tmp/work/core2-64-poky-linux/haveged/1.9.17-r0/packages-split/haveged/usr=
/lib=20

36=20
tmp/work/core2-64-poky-linux/haveged/1.9.17-r0/packages-split/haveged/usr=
/sbin=20


If you want to split it up, please submit a patch.

--=20
# Randy MacLeod
# Wind River Linux


On 2022-03-21 22:22, Randy MacLeod wrote:
> Remove the daemon support code since this feature is deprecated by merg=
ing
> the ideas from the HAVEGE algorithm into the kernel:
>
>     297bdf1 Update README.md
>     Starting from Linux kernel v5.6, the HAVEGED **service** has become=
 obsolete.
>     The userspace application as well as the haveged library are not af=
fected.
>     ...
>
> Update the HOMEPAGE link to https.
>
> Signed-off-by: Randy MacLeod<Randy.MacLeod@windriver.com>
> ---
>   .../haveged/haveged_1.9.14.bb                 | 47 ------------------=
-
>   .../haveged/haveged_1.9.17.bb                 | 26 ++++++++++
>   2 files changed, 26 insertions(+), 47 deletions(-)
>   delete mode 100644 meta-oe/recipes-extended/haveged/haveged_1.9.14.bb
>   create mode 100644 meta-oe/recipes-extended/haveged/haveged_1.9.17.bb
>
> diff --git a/meta-oe/recipes-extended/haveged/haveged_1.9.14.bb b/meta-=
oe/recipes-extended/haveged/haveged_1.9.14.bb
> deleted file mode 100644
> index 3e4edae9d..000000000
> --- a/meta-oe/recipes-extended/haveged/haveged_1.9.14.bb
> +++ /dev/null
> @@ -1,47 +0,0 @@
> -SUMMARY =3D "haveged - A simple entropy daemon"
> -DESCRIPTION =3D "The haveged project is an attempt to provide an easy-=
to-use, unpredictable random number generator based upon an adaptation of=
 the HAVEGE algorithm. Haveged was created to remedy low-entropy conditio=
ns in the Linux random device that can occur under some workloads, especi=
ally on headless servers."
> -AUTHOR =3D "Gary Wuertz"
> -HOMEPAGE =3D"http://www.issihosts.com/haveged/index.html"
> -LICENSE =3D "GPL-3.0-only"
> -LIC_FILES_CHKSUM=3D"file://COPYING;md5=3Dd32239bcb673463ab874e80d47fae=
504"
> -
> -# v1.9.14
> -SRCREV =3D "4da3080ad4587860e5da73072d6ed54d0052938c"
> -SRC_URI =3D "git://github.com/jirka-h/haveged.git;branch=3Dmaster;prot=
ocol=3Dhttps \
> -"
> -S =3D "${WORKDIR}/git"
> -
> -UPSTREAM_CHECK_URI =3D"https://github.com/jirka-h/haveged/releases"
> -
> -inherit autotools update-rc.d systemd
> -
> -EXTRA_OECONF =3D "\
> -    --enable-nistest=3Dyes \
> -    --enable-olt=3Dyes \
> -    --enable-threads=3Dno \
> -"
> -
> -PACKAGECONFIG ??=3D"${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d=
)}"
> -PACKAGECONFIG[systemd] =3D "--enable-init=3Dservice.fedora --enable-in=
itdir=3D${systemd_system_unitdir}, --enable-init=3Dsysv.redhat, systemd"
> -
> -INITSCRIPT_PACKAGES =3D "${PN}"
> -INITSCRIPT_NAME =3D "haveged"
> -INITSCRIPT_PARAMS:${PN} =3D "defaults 9"
> -
> -SYSTEMD_PACKAGES =3D "${PN}"
> -SYSTEMD_SERVICE:${PN} =3D "haveged.service"
> -
> -do_install:append() {
> -    # The exit status is 143 when the service is stopped
> -    if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'fal=
se', d)}; then
> -        sed -i '/ExecStart/a SuccessExitStatus=3D143' ${D}${systemd_sy=
stem_unitdir}/haveged.service
> -        # Hybrid systemd-sysvinit distros must install the initscript =
manually
> -        if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true',=
 'false', d)}; then
> -            install -d ${D}${INIT_D_DIR}
> -            sed -e "s,@SBINDIR@,${sbindir},g" <${S}/init.d/sysv.redhat=
 >${D}${INIT_D_DIR}/haveged
> -            chmod 755 ${D}${INIT_D_DIR}/haveged
> -        fi
> -    fi
> -}
> -
> -MIPS_INSTRUCTION_SET =3D "mips"
> diff --git a/meta-oe/recipes-extended/haveged/haveged_1.9.17.bb b/meta-=
oe/recipes-extended/haveged/haveged_1.9.17.bb
> new file mode 100644
> index 000000000..25007c777
> --- /dev/null
> +++ b/meta-oe/recipes-extended/haveged/haveged_1.9.17.bb
> @@ -0,0 +1,26 @@
> +SUMMARY =3D "haveged - A simple entropy daemon"
> +DESCRIPTION =3D "The haveged project is an attempt to provide an easy-=
to-use, unpredictable random number generator based upon an adaptation of=
 the HAVEGE algorithm. Haveged was created to remedy low-entropy conditio=
ns in the Linux random device that can occur under some workloads, especi=
ally on headless servers."
> +
> +AUTHOR =3D "Gary Wuertz"
> +HOMEPAGE =3D"https://www.issihosts.com/haveged/index.html"
> +
> +LICENSE =3D "GPL-3.0-only"
> +LIC_FILES_CHKSUM=3D"file://COPYING;md5=3Dd32239bcb673463ab874e80d47fae=
504"
> +
> +# v1.9.17
> +SRCREV =3D "1ff76272aba9803501e6f473dd5083f0e09289ac"
> +SRC_URI =3D "git://github.com/jirka-h/haveged.git;branch=3Dmaster;prot=
ocol=3Dhttps \
> +"
> +S =3D "${WORKDIR}/git"
> +
> +UPSTREAM_CHECK_URI =3D"https://github.com/jirka-h/haveged/releases"
> +
> +inherit autotools
> +
> +EXTRA_OECONF =3D "\
> +    --enable-nistest=3Dyes \
> +    --enable-olt=3Dyes \
> +    --enable-threads=3Dno \
> +"
> +
> +MIPS_INSTRUCTION_SET =3D "mips"
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#96122):https://lists.openembedded.org/g/openembedde=
d-devel/message/96122
> Mute This Topic:https://lists.openembedded.org/mt/89944546/3616765
> Group Owner:openembedded-devel+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-devel/unsub  =
[randy.macleod@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

--=20
# Randy MacLeod
# Wind River Linux

--------------Ma3tO4slP700hh6e0woGTZhQ
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">
      <p><span style="white-space: pre-wrap; display: block; width: 98vw;">CCing people who have shown some interest in haveged previously.

The haveged upstream has moved the init code into a contrib directory because as 
stated in the README:</span><span style="white-space: pre-wrap; display: block; width: 98vw;">   <a class="moz-txt-link-freetext" href="https://github.com/jirka-h/haveged">https://github.com/jirka-h/haveged</a></span></p>
      IMPORTANT UPDATE
      <p dir="auto">Starting from Linux kernel v5.6, the HAVEGED
        inspired algorithm has been included in the Linux kernel
        (see&nbsp;the <a href="https://lore.kernel.org/lkml/alpine.DEB.2.21.1909290010500.2636@nanos.tec.linutronix.de/T/" rel="nofollow">LKML article</a> and the Linux Kernel <a href="https://github.com/torvalds/linux/commit/30c08efec8884fb106b8e57094baa51bb4c44e32">commit</a>).
        As soon as the&nbsp;CRNG (the Linux cryptographic-strength random
        number generator) gets ready,&nbsp;<code>/dev/random</code> does not
        block on reads anymore.</p>
      <p dir="auto">I'm happy that these changes made it into the
        mainline&nbsp;kernel. It's pleasing to see that the main idea behind
        HAVEGED has sustained time test - it was published already in
        2003 <a href="https://www.irisa.fr/caps/projects/hipsor/publications/havege-tomacs.pdf" rel="nofollow">here.</a> I'm also glad that the HAVEGE
        algorithm is being further explored and examined - see the <a href="https://www.chronox.de/jent.html" rel="nofollow">CPU
          Jitter Random Number Generator.</a></p>
      <p dir="auto">It means that HAVEGED <strong>service</strong> is
        now less relevant. However, it's still useful in the following
        situations, when you</p>
      <ul dir="auto">
        <li>need randomness early in the boot process, before the CRNG
          in the Linux kernel gets fully initialized.</li>
        <li>want to deploy an additional entropy source. HAVEGED now
          inserts entropy into the kernel every 60 seconds, regardless
          of the entropy level reported by Linux Kernel. It does not
          affect the <code>/dev/random</code> read speed but it
          diversifies the entropy sources, making the Linux Kernel CRNG
          more robust.</li>
        <li>you are looking for userspace RNG to generate random
          numbers. See&nbsp;<code>man -S8 haveged</code> for examples or try
          running <code>haveged -n 0 | pv &gt; /dev/null</code></li>
        <li>and last but not least, most Linux installations are still
          running on the older kernel versions.</li>
      </ul>
      <p dir="auto">In any case, I will keep maintaining the HAVEGED
        project. The userspace application, as well as the haveged
        library, are not affected in any way by changes in the Linux
        kernel.</p>
      <p dir="auto">---</p>
      If you want the init system support back, please submit a patch.
      <p dir="auto"><br>
      </p>
      <p dir="auto">Also Debain/Ubuntu splits the package into:<br>
        &nbsp;- haveged<br>
        &nbsp;- libhavege2</p>
      <p dir="auto">but the memory savings hardly seem worthwhile so I
        won't bother:</p>
      <p dir="auto">$ du -sk
tmp/work/core2-64-poky-linux/haveged/1.9.17-r0/packages-split/haveged/usr/*
        <br>
        104&nbsp;&nbsp;&nbsp;&nbsp;
tmp/work/core2-64-poky-linux/haveged/1.9.17-r0/packages-split/haveged/usr/lib
        <br>
        36&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
tmp/work/core2-64-poky-linux/haveged/1.9.17-r0/packages-split/haveged/usr/sbin
        <br>
        <br>
      </p>
      <p dir="auto">If you want to split it up, please submit a patch.</p>
      <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux

</pre>
    </div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">On 2022-03-21 22:22, Randy MacLeod
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:16DE929F3EAA76A2.18232@lists.openembedded.org">
      <pre class="moz-quote-pre" wrap="">Remove the daemon support code since this feature is deprecated by merging
the ideas from the HAVEGE algorithm into the kernel:

   297bdf1 Update README.md
   Starting from Linux kernel v5.6, the HAVEGED **service** has become obsolete.
   The userspace application as well as the haveged library are not affected.
   ...

Update the HOMEPAGE link to https.

Signed-off-by: Randy MacLeod <a class="moz-txt-link-rfc2396E" href="mailto:Randy.MacLeod@windriver.com">&lt;Randy.MacLeod@windriver.com&gt;</a>
---
 .../haveged/haveged_1.9.14.bb                 | 47 -------------------
 .../haveged/haveged_1.9.17.bb                 | 26 ++++++++++
 2 files changed, 26 insertions(+), 47 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/haveged/haveged_1.9.14.bb
 create mode 100644 meta-oe/recipes-extended/haveged/haveged_1.9.17.bb

diff --git a/meta-oe/recipes-extended/haveged/haveged_1.9.14.bb b/meta-oe/recipes-extended/haveged/haveged_1.9.14.bb
deleted file mode 100644
index 3e4edae9d..000000000
--- a/meta-oe/recipes-extended/haveged/haveged_1.9.14.bb
+++ /dev/null
@@ -1,47 +0,0 @@
-SUMMARY = &quot;haveged - A simple entropy daemon&quot;
-DESCRIPTION = &quot;The haveged project is an attempt to provide an easy-to-use, unpredictable random number generator based upon an adaptation of the HAVEGE algorithm. Haveged was created to remedy low-entropy conditions in the Linux random device that can occur under some workloads, especially on headless servers.&quot;
-AUTHOR = &quot;Gary Wuertz&quot;
-HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="http://www.issihosts.com/haveged/index.html">&quot;http://www.issihosts.com/haveged/index.html&quot;</a>
-LICENSE = &quot;GPL-3.0-only&quot;
-LIC_FILES_CHKSUM=<a class="moz-txt-link-rfc2396E" href="file://COPYING;md5=d32239bcb673463ab874e80d47fae504">&quot;file://COPYING;md5=d32239bcb673463ab874e80d47fae504&quot;</a>
-
-# v1.9.14
-SRCREV = &quot;4da3080ad4587860e5da73072d6ed54d0052938c&quot;
-SRC_URI = &quot;git://github.com/jirka-h/haveged.git;branch=master;protocol=https \
-&quot;
-S = &quot;${WORKDIR}/git&quot;
-
-UPSTREAM_CHECK_URI = <a class="moz-txt-link-rfc2396E" href="https://github.com/jirka-h/haveged/releases">&quot;https://github.com/jirka-h/haveged/releases&quot;</a>
-
-inherit autotools update-rc.d systemd
-
-EXTRA_OECONF = &quot;\
-    --enable-nistest=yes \
-    --enable-olt=yes \
-    --enable-threads=no \
-&quot;
-
-PACKAGECONFIG ??= <a class="moz-txt-link-rfc2396E" href="mailto:${@bb.utils.filter('DISTRO_FEATURES','systemd',d)}">&quot;${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}&quot;</a>
-PACKAGECONFIG[systemd] = &quot;--enable-init=service.fedora --enable-initdir=${systemd_system_unitdir}, --enable-init=sysv.redhat, systemd&quot;
-
-INITSCRIPT_PACKAGES = &quot;${PN}&quot;
-INITSCRIPT_NAME = &quot;haveged&quot;
-INITSCRIPT_PARAMS:${PN} = &quot;defaults 9&quot;
-
-SYSTEMD_PACKAGES = &quot;${PN}&quot;
-SYSTEMD_SERVICE:${PN} = &quot;haveged.service&quot;
-
-do_install:append() {
-    # The exit status is 143 when the service is stopped
-    if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
-        sed -i '/ExecStart/a SuccessExitStatus=143' ${D}${systemd_system_unitdir}/haveged.service
-        # Hybrid systemd-sysvinit distros must install the initscript manually
-        if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
-            install -d ${D}${INIT_D_DIR}
-            sed -e &quot;s,@SBINDIR@,${sbindir},g&quot; &lt;${S}/init.d/sysv.redhat &gt;${D}${INIT_D_DIR}/haveged
-            chmod 755 ${D}${INIT_D_DIR}/haveged
-        fi
-    fi
-}
-
-MIPS_INSTRUCTION_SET = &quot;mips&quot;
diff --git a/meta-oe/recipes-extended/haveged/haveged_1.9.17.bb b/meta-oe/recipes-extended/haveged/haveged_1.9.17.bb
new file mode 100644
index 000000000..25007c777
--- /dev/null
+++ b/meta-oe/recipes-extended/haveged/haveged_1.9.17.bb
@@ -0,0 +1,26 @@
+SUMMARY = &quot;haveged - A simple entropy daemon&quot;
+DESCRIPTION = &quot;The haveged project is an attempt to provide an easy-to-use, unpredictable random number generator based upon an adaptation of the HAVEGE algorithm. Haveged was created to remedy low-entropy conditions in the Linux random device that can occur under some workloads, especially on headless servers.&quot;
+
+AUTHOR = &quot;Gary Wuertz&quot;
+HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://www.issihosts.com/haveged/index.html">&quot;https://www.issihosts.com/haveged/index.html&quot;</a>
+
+LICENSE = &quot;GPL-3.0-only&quot;
+LIC_FILES_CHKSUM=<a class="moz-txt-link-rfc2396E" href="file://COPYING;md5=d32239bcb673463ab874e80d47fae504">&quot;file://COPYING;md5=d32239bcb673463ab874e80d47fae504&quot;</a>
+
+# v1.9.17
+SRCREV = &quot;1ff76272aba9803501e6f473dd5083f0e09289ac&quot;
+SRC_URI = &quot;git://github.com/jirka-h/haveged.git;branch=master;protocol=https \
+&quot;
+S = &quot;${WORKDIR}/git&quot;
+
+UPSTREAM_CHECK_URI = <a class="moz-txt-link-rfc2396E" href="https://github.com/jirka-h/haveged/releases">&quot;https://github.com/jirka-h/haveged/releases&quot;</a>
+
+inherit autotools
+
+EXTRA_OECONF = &quot;\
+    --enable-nistest=yes \
+    --enable-olt=yes \
+    --enable-threads=no \
+&quot;
+
+MIPS_INSTRUCTION_SET = &quot;mips&quot;
</pre>
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre class="moz-quote-pre" wrap="">-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#96122): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-devel/message/96122">https://lists.openembedded.org/g/openembedded-devel/message/96122</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/89944546/3616765">https://lists.openembedded.org/mt/89944546/3616765</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:randy.macleod@windriver.com">randy.macleod@windriver.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------Ma3tO4slP700hh6e0woGTZhQ--

