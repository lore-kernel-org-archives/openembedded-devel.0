Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88C68C63797
	for <webhook@archiver.kernel.org>; Thu, 12 Jan 2023 02:25:04 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.44999.1673490298964182031
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Jan 2023 18:24:59 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=V6zkafAd;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=037638941c=randy.macleod@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30C2Crtp017545
	for <openembedded-devel@lists.openembedded.org>; Wed, 11 Jan 2023 18:24:58 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=message-id : date
 : subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=srr+74yg37qf2vlagVaSpbcSfXZs5TZ9tHlKJvsXHK0=;
 b=V6zkafAdaTeu3kXK9OIDGG0BPG+WBMXMpKDFPuUMvfmx6GzFIrggJWV9H3WTWBhvidfP
 EVHncMzS1bk6N5AN3j+xnEfMNGkQFVs3TelE8zKrJ3nXcC0sk+Nqixti8sezH7BRk2Gh
 OhestOlwA9YQWOH3D/WbIB/bNUpUduVsFxNRRNM9HE9ON1EjgChMNLVo/uCIgLRdXP0Q
 bWJGOqjf6VNSL2K4RR3PnHr18CWi8jYl5TzKrnTqpru5dC22RKT80xE2QM1rlcORLgQe
 Do1Ue0kK6vn1u49IJ/kdZ4firYYWQNXRL4qJXRWb5HzZjIhcet/2jrGDPidcZqbGOyHr YA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3n1k5tgyu2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 11 Jan 2023 18:24:58 -0800
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 30C2Ow6F008038
	for <openembedded-devel@lists.openembedded.org>; Wed, 11 Jan 2023 18:24:58 -0800
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2102.outbound.protection.outlook.com [104.47.55.102])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3n1k5tgyu0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Jan 2023 18:24:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ds/uKC2ywdr0okoZbBcz3dkvdp4BCbbefh0iBBEsljwTqplZ468tPL2FizVZtWNmxUBbeJxXDqazmlblDcnrGvK0HKj/bwO/lR8Eulu/0QNjsfD57Xape4g7z5CwohyRTYfbMtm7/mMA7o2JOaQ7hdM7LQ7I6IcAOxp/+6NL60nbyySLbO9qzbDXkNdiiXUTD3PIyT8CJUwg/icEmgCg6+BDzxtIHDHEnM2cCPN9qNq3hU6H8L4OJfh565xioXKCiwng3uttdp0ECoVuqAYbxqLOAemP1fT1/out/eNxDbL4/QElNyT5HxXRkMMJG7OBRLCQbJuH0JPC7zZzsjkLwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=srr+74yg37qf2vlagVaSpbcSfXZs5TZ9tHlKJvsXHK0=;
 b=Nz68eQQFmN3/SJARQRK/0IWnq/izrWkvnOXbfFo6/XV1AcNg8w2QCsKznH1Ar8d0fsf4BakVOXPqVCS36UDsvdWoHv+wN4Ng4GxhMfaU4ZLVEIhpssCtrXWF682o+j8ZwiWxtdCjCezJwYYMizo+Dul3DnWCgLknck9R6a0NeKJUd73+Xn/bX1bMSOxLPvfFKuMCory9BAbMTxLPD2xayOiDnsyQRQaUHZEIMNhZu/55+IVL7w7srtt3P+vOraUAr3sl7yJMa1DP1h5mISAX+KPWGphGSOMEg8XQdWPjesdURKufZxtQObN3tWY67n0moiqY0ZAvmUkX/G1S7JuytA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by CY8PR11MB6868.namprd11.prod.outlook.com (2603:10b6:930:5c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Thu, 12 Jan
 2023 02:24:55 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::e794:335f:5e0f:8d36]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::e794:335f:5e0f:8d36%6]) with mapi id 15.20.5986.018; Thu, 12 Jan 2023
 02:24:55 +0000
Message-ID: <39bd49a5-910a-6f48-0bb9-d59424b2bb46@windriver.com>
Date: Wed, 11 Jan 2023 21:24:52 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [oe] gRPC
Content-Language: en-CA
To: raj.khem@gmail.com, Steve Sakoman <steve@sakoman.com>,
        "Valek, Andrej" <andrej.valek@siemens.com>,
        Armin Kuster <akuster808@gmail.com>
Cc: "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
References: <7b00f80d33fc4d77eafcddb8ba46b992d713df25.camel@siemens.com>
 <CAOSpxdapG_z_H0DrcRc=N6AczcPykLLBd+zfHbLCqTFGvOC0Lw@mail.gmail.com>
 <CAMKF1so06NJLbWAY-XnCQSNoksGOHZ=3XhT+Mbqzz7tJ6FdA_Q@mail.gmail.com>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <CAMKF1so06NJLbWAY-XnCQSNoksGOHZ=3XhT+Mbqzz7tJ6FdA_Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SJ0PR13CA0147.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::32) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB3994:EE_|CY8PR11MB6868:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c02c371-4e41-43b4-8342-08daf44431a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	DEzneUUH16OhF4L8u2R9Fg+gnYjTSadSmrLgmFOdxBeTwNOZELgXve97/lyMGa+MahOUGLC9iRNfkgNZiDdfoZm529pLpIrwl2YO7qNZpPSrrvt5sFyFLZLD320L37lGrLNLXed69+td4inGpqwfxOZBPuu4L6Os6cxFqD95a6m4h5cmdOl9WRmY3j9l+fEKn4IfYmp5qSiRV/mLoCtCOEs6jzhF0wHRBxixG+Ie/SaHvqULUlGlmS13VSvQHdAyt3z0lde0vgv70YIf1aHBR1wwWqDuwGkZLJM1hM3Vm6NiYpdryNgInFzYGsvrTNor4AOXpgF3vhSVL3wvGTx/1cE415IQrM7zsMiTj8wbjULyLQ1pKqQwy5H15+cl8dIMK03RqEviziBfdsjEejR1CLcZ1yEKPPM4a56b4v7jGK+e0Rt2BAR/DUkn2Yun/mtJtsq+SNI/o0hlnTWjto0PG9kb3u10IrWmgO+I5km4RKidG1ERzDERD5IiSLIAiOssbEUGYYRKqa4CEPk2/4Z96AM1lneQ194vpXPmmskua/VVTwAAp4jnFNHmC8TTwbV5tCLcc7E6YWtfzxaayaszI86F27+anEQWhDnMffTaOisGyKRfKfvhME9bhCEw6RdsMabUzHqtmR8ppbPyvPIwhZxhRM7LFwzfB91lOBuReEWtsGY9a3dR5XCfJ3j49IEHls977ZXIw8NuWz6+DN/ql8AWxDETcXDf+vxKZBF/xDBprc21/L/njzRxPWApGA8HkKg8GyKzWv/QyEK/s69I1g==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(346002)(376002)(366004)(39850400004)(396003)(451199015)(41300700001)(4326008)(110136005)(2616005)(83380400001)(8676002)(36756003)(66946007)(66476007)(66556008)(316002)(86362001)(31696002)(8936002)(5660300002)(38100700002)(2906002)(31686004)(6506007)(53546011)(6486002)(966005)(6512007)(478600001)(6666004)(186003)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZGZqQVhuZ1VSUWxWMmpyTjIxcFdaK1J6eTRwTEZjRmxrSkk4YzBVRHhXR21P?=
 =?utf-8?B?Q0FPWG84NmtOUzdPNTloUHBnVnVtQi9PZjlGczh3Q1Z6ZkROQndOdHgxMXVH?=
 =?utf-8?B?OWpYczlJNVA4R0NqTTFQM0U1S2s0aXhjYXVaei9vUm4wUWNZc2JWcFhiMXkv?=
 =?utf-8?B?cEtONDJlWkRvV2piVzY4MUdoeHQzcnNzcjNkNUVPS3JxRFcrRXFWTFhiWVpq?=
 =?utf-8?B?UDFORHB3RGhtbVJVeWdINTFNUlEyYzkxNlZ4eExjS3JUd0hjMGo2WktMUnNJ?=
 =?utf-8?B?WFEyTHg5ZnpGdWN0SmphM01OQk42aURMNGVrTDZTQzBydXhOUEtaOTNZc0xp?=
 =?utf-8?B?WGJrcFZHMWxheWJuMEthWGxVQm5PQWRXUzhyNHZkUzZ6TlR5aC9GbWlpK2w4?=
 =?utf-8?B?SEtJODhkTGxhMStrREFjdGRMZzJSM21JWHRNcTBnUHdVeEsrUTV6bXUzVTlx?=
 =?utf-8?B?NC9FMVhieXhRNG9aTmlWTkpObmFlQjNUUVZjQ0F4SHRWNkd1T2R0STBycjJ1?=
 =?utf-8?B?ZGNRSzZhcjFaYjQzbytNQTRxR20zOXhHTWlYY0NCVUZLZWxsZlNQaEFZSW00?=
 =?utf-8?B?bTFIcmgvQlpUK0RwUGZucXFSR0t3WEZLYVpDVS81aTNZaTlmWC9oS2gwSDU2?=
 =?utf-8?B?UElFdm1ORmNIZFFnaGs4alZPdC80MVRZTVYya2xadS9zU3orcG9qeEZOMTY5?=
 =?utf-8?B?dm5jRXRUaVc5c0xYY0loQXlzdjd1RW9rcWZVbS9qcmhGUE1LTm9RVWR0SDh4?=
 =?utf-8?B?N1ZVVWhiT29vdk96Skh4T2s2QWZFQ0JhcUJzMGZCVFpEL2xSd0hXeitPY1Fw?=
 =?utf-8?B?OGNIUzhhNHFuQXloQ240Z0Ivd2c4T1A2ZzRmMVRXa04rR3dheDNUQnBoWCtL?=
 =?utf-8?B?NVAzQS9pMGxFTXg1allVajl6bFB2bVFDRTUvWlh2TldsMDkwWVVxcE1SRVB0?=
 =?utf-8?B?SXJPOHl4blR3dXNrK2QvaHZsaCt2NC9mSy9UN1l2enAza2R5cUI3OGRhMmhI?=
 =?utf-8?B?WFFrU2lLbnBDVm5keXFZdFBEUXZoUURlK0RuTUxFUzEvZ2NsdHRuazcyeS9O?=
 =?utf-8?B?WmFSWm1SUUZyQ292NktBbnMvV1JZWHowWndZa1FhQjBVQm11OEpXNGk0SGdD?=
 =?utf-8?B?VTIrenhJbzdkd0hQTDBvOGowMy8xQjBkOUsydU5OcGpaRExqSFlMbkNqTnZ4?=
 =?utf-8?B?NmpzS2xFM3NEdGFVajNFTUVqWE43dFJtckxuSFZpVC95Z1QwSm9sUis4WHJP?=
 =?utf-8?B?QUQremdMaGtLelhpNE1sVW1hNTZ5Y1QzUFlxVVZQTE1Lang5SFpna0liSkJX?=
 =?utf-8?B?Rit0RzljcVY5TjBWemdGVDNBQ201V0c0amR5NHpMZHNNNVVZT0ZqSk4vQWtV?=
 =?utf-8?B?M1RiSC9vb2lqMURoSjhSc1dRS1VHcnp0V21vSGFRalN4VGtDZXNrRGcxUG5z?=
 =?utf-8?B?Z0xTUXdOenZFRFYvckd5dmUreUE4TkQ4TlhkZHpSU0ZvbWFVVU5BNDdvWjVq?=
 =?utf-8?B?S250d2dPekxNUUJNa21CZnYvTVlyM05GNlJtcEg5WDl6blJ4c3l5NDhWSmdj?=
 =?utf-8?B?MURzWldISUJnbGtXdXB3THlaOGl3ZldzVitjSzVLdWd6ZjhkQTN6OTljVzZY?=
 =?utf-8?B?TjhSYVZMNU5aSGY2NGtsUjY4N0VqMForSUhhbkxad3NiMWhKemQ0MTVSVFA3?=
 =?utf-8?B?UUtQQS9CZkVBNnF4K1o3TUg4RHJWRDZxcTF2c1JGZUYyS0xxRTVMVU9TdEg3?=
 =?utf-8?B?MWFjWHNUWm5ST2FIQzRrUXVZV2d1YXExQ3EycEt4ZTdaU3NXcGdMb09mekl5?=
 =?utf-8?B?b211R1FaUWNPRm5EazZRVDN0YTdUY2FuQlViSnVWK2JJOG1FNEZRck9ybzE0?=
 =?utf-8?B?RzhuM1ByYkFtc1NaLzM3eFJZNllSU2lxQ2FGRjVzK3IwdVE0WDRJNDRQc3pz?=
 =?utf-8?B?RmxSOGJJZXZucFhSUUxkOWlzb1N4SHFLaDlVRGEzd3RsMUR0eGVhM3RBd0tG?=
 =?utf-8?B?OFV3TkdZb1YvMHVwM3RUdUhUVHhUeFNhNTlwdEtjY0hXNFJZdUZ4azNWZENP?=
 =?utf-8?B?WCtZWFdBUmw4bjMzZ2t4bkI2b1J6TzBBbGVsUy9mNDdEWjFBRUNXeUI1OW5W?=
 =?utf-8?B?Q3VVeVdUYVhVcmdpakwxMHhCOWQzMmdXZXkza0Y0bVJ5U1h5czFkTlNLeWp5?=
 =?utf-8?B?SGc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c02c371-4e41-43b4-8342-08daf44431a4
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2023 02:24:55.5571
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DISADrzYkJQwYfkkaFf8LL9fXnNpLbjF/bCJZwgXn0jcftTDVtCzM6mnZ85KnIYL5hP8bT/QbRyy2FNRGN/++kEislVwiJ7eVUIH7jR+meI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6868
X-Proofpoint-GUID: GgKglpgImH8xM3VP7TcEXTwip06LtgjN
X-Proofpoint-ORIG-GUID: otmGwTZsilY_sMfi4HUCKmDZG6cDUIwR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-11_10,2023-01-11_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 mlxscore=0 clxscore=1011 adultscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 bulkscore=0 mlxlogscore=999 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301120014
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 30C2Crtp017545
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 Jan 2023 02:25:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100559

On 2023-01-11 13:27, Khem Raj via lists.openembedded.org wrote:
> On Wed, Jan 11, 2023 at 10:07 AM Steve Sakoman <steve@sakoman.com> wrot=
e:
>>
>> Hi Andrej,
>>
>> I'm the maintainer for openembedded-core, and gRPC is in
>> meta-openmebedded. So this isn't my call to make.
>>
>> However we typically only take version bumps if they are security/bug
>> fix only releases.  So if this is the case, you can submit a patch.
>> But please be sure to include either release notes or change log so
>> the meta-openembedded maintainer can verify that it is suitable for a
>> stable release.
>=20
> Thanks Steve, policy is same for all OE layers. I will wait for Armin
> ( Release Maintainer for meta-openembedded )
> take the final call.


I vote for no update based on a quickish look.

Armin,

To save you some review, see the data below that indicates that there's
an appartly stable release maintenance scheme and
1.50.x is > 1200 commits ahead and *likely* breaks ABI.

Andrei,

Is your CVE covered by any fixes on the stable release?
If not, best to get it merged upstream in addition to backporting
the fix as a patch in meta-oe.

../Randy


$ git clone https://github.com/grpc/grpc.git
$ cd gprc

$ git log --oneline v1.45.2..v1.50.1 | wc -l
1259

$ git diff v1.45.2..v1.50.1 |  diffstat | tail -1
  3763 files changed, 198007 insertions(+), 213762 deletions(-)

$ git checkout v1.45.x
...

# oh, I forgot to show the stable branches:
$ git branch -a | rg v1.[45][0-9]
* v1.45.x
   remotes/origin/v1.40.x
   remotes/origin/v1.41.x
   remotes/origin/v1.42.x
   remotes/origin/v1.43.x
   remotes/origin/v1.44.x
   remotes/origin/v1.45.x
   remotes/origin/v1.46.x
   remotes/origin/v1.47.x
   remotes/origin/v1.48.x
   remotes/origin/v1.49.x
   remotes/origin/v1.50.x
   remotes/origin/v1.51.x


# What's not included in our 1.45.2?
$=C2=A0git log --oneline v1.45.2...
4af1fe173d (HEAD -> v1.45.x, origin/v1.45.x) xDS interop: resume=20
circuit_breaking test (#32038) (#32056)
60863b633e [CPP] xDS interop GCE framework: pin grpcio-tools to use=20
protobuf 3.x (#31214) (#31221)
0a1c8d3c5c xDS interop GCE framework: pin grpcio-tools to use protobuf=20
3.x (#31191) (#31201)
129dd25c33 xDS interop: buildscripts: fix run_test return status=20
(#30768) (#30879)
fed6c04c69 xDS interop: enable pod log collection in the buildscripts=20
(#30735) (#30860)
d19a439577 xDS interop: Python LB tests build and use the python server=20
(#30637) (#30658)
3e930a5784 xDS interop: add missing image tagging to the buildscripts=20
(#30520) (#30532)
12df388e8b xds interop: choose correct cluster in=20
grpc_xds_k8s_lb_python.sh (#30309) (#30332)
ea0f9b29f7 xds-k8s jobs: standardize TESTING_VERSION (#30027) (#30050)
14afb3a3ea Disable layering check for Objective-C (#29375)


# When were those commits made?
$ git log v1.45.2... | rg Date:
Date:   Tue Jan 10 13:35:42 2023
Date:   Mon Oct 3 15:23:06 2022
Date:   Mon Oct 3 13:35:02 2022
Date:   Thu Sep 8 16:57:24 2022
Date:   Tue Sep 6 20:47:18 2022
Date:   Fri Aug 19 17:22:21 2022
Date:   Mon Aug 8 21:33:59 2022
Date:   Tue Jul 19 17:31:09 2022
Date:   Fri Jun 17 18:37:56 2022
Date:   Tue Apr 19 14:45:30 2022


so it looks like there's a stable branching strategy.



