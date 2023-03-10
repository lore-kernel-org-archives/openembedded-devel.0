Return-Path: <changqing.li@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27B13C64EC4
	for <webhook@archiver.kernel.org>; Fri, 10 Mar 2023 01:07:16 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.8404.1678410433693699280
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Mar 2023 17:07:13 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=nMI4nace;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=24331f10aa=changqing.li@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32A0kXO1029337
	for <openembedded-devel@lists.openembedded.org>; Thu, 9 Mar 2023 17:07:13 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=message-id : date
 : subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=12/v6f2ZbAkVZv/is981zTRdiQom+M2x+bzf+opaAq0=;
 b=nMI4naceClcGnulv/jAk+4LrBdgt552356hVA1gx7CMoNzHLJ9mfO3Pf72dPFz6WwnGX
 akMUGUOs7IQUuWsvj1vvoD4XTXlNREGnFheK0JBfOYky+4iNYuBmF7ckKdfj3dopiVhj
 a5Gqfjqd692+sWPULX33A3S0BsQN7YUMTequ+ThHrf+ddXKTCjjMuvX8xro31JGkQUmX
 6OHCzdzd7RM2moGgIfCoKwM40oK/RVv2kb4vPiMgazn+93rxU7u6YYQKrP6+K7KJla56
 k53yWdFEEmyS1JyWQPZeClxhfWEIiHBsWW4W/SZ4K2WoVYWbosKE0ShHCsQnNzWvBR46 YQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3p6fffaanj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 09 Mar 2023 17:07:13 -0800
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32A17Cid004735
	for <openembedded-devel@lists.openembedded.org>; Thu, 9 Mar 2023 17:07:12 -0800
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2046.outbound.protection.outlook.com [104.47.74.46])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3p6fffaanh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Mar 2023 17:07:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LmwWdjl1lTmCFEkBiWEzhzvht4jFCNk7cIb16oR5gi9boW/zlr9H71wwutYw4Fe7MmnpYTcJ+OYtuBNJH6L+E4gUjZjIaUoPLPaEkv6joBOFDaLZA0BVcKNhTYlzLW/pid40OwNuojYlR6157Hz2wQ5U+lHHlzarNNTUv3puLOCv8rmS4YrTD4CRKUVowLNd6yAR+joWHxxg6OjGy0cJw8x4cqTTJvcVOCnyT7aaSsEhIVnbFgU9zhx/eEy7NqaEj/DkRw4+8UtRki/K7aExNIkcTKrYgtkZUtyqIPeCLOBzqz3nUClQgx2XFHw3Smzj9tFtnwTU6PWsimwuijqVgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=12/v6f2ZbAkVZv/is981zTRdiQom+M2x+bzf+opaAq0=;
 b=XiPt7EDmH2QQxU/IxP/ZGJwm4KMRM/PneeaZMHqcTzVltVOEk6SjXEOOUSYFA/UIF3rv5ogUPznUdGPEmjiYYWBsvWNbKyYAPIKak1rTjaUNmKF4PuF023ksbhXEQYzp3VDt/90IvKsRgiGj+/3gCUXShpDg0phi8eThIXd7H+uw9xzxcoVZX1EEmVgkujv4m9FWl/5v43Wj2pc7KARwSJGls39AwTNUus8xwuhK64x8PRiVqpvJzf7aHGhXLAsqdocpo18IQnPHrNzPEQV+Tx3oxM5UskxNYR6foJIQ4mL48V/Unn7hwn0neeYQXFp3u4noP/JIP4MqacPk7BMTEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN6PR11MB2557.namprd11.prod.outlook.com (2603:10b6:805:56::33)
 by SA1PR11MB5873.namprd11.prod.outlook.com (2603:10b6:806:228::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.19; Fri, 10 Mar
 2023 01:07:09 +0000
Received: from SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::524d:df89:5eb3:f545]) by SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::524d:df89:5eb3:f545%7]) with mapi id 15.20.6178.019; Fri, 10 Mar 2023
 01:07:08 +0000
Message-ID: <3987b603-6ce7-77da-82c8-21c754e0e08b@windriver.com>
Date: Fri, 10 Mar 2023 09:07:00 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [oe] [meta-oe][PATCH] sg3-utils: upgrade 1.45 -> 1.47
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>,
        Changqing Li <changqing.li@eng.windriver.com>
Cc: openembedded-devel@lists.openembedded.org
References: <20230309084314.1187137-1-changqing.li@windriver.com>
 <CAMKF1srUNaowx9zqOak2e3DnHu=WSRJBPhP-XZ=0LwM33TV8GA@mail.gmail.com>
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <CAMKF1srUNaowx9zqOak2e3DnHu=WSRJBPhP-XZ=0LwM33TV8GA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: TYWPR01CA0009.jpnprd01.prod.outlook.com
 (2603:1096:400:a9::14) To SN6PR11MB2557.namprd11.prod.outlook.com
 (2603:10b6:805:56::33)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR11MB2557:EE_|SA1PR11MB5873:EE_
X-MS-Office365-Filtering-Correlation-Id: bb18ece1-6083-4d13-0867-08db2103c535
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	zqrZNzkT6b17MbRiRSkpygcjy2okDu1qvOwR/N+tQuU+/9Zd4ldZpeA4oIM2d/GVWV09TUxhmxxOcOQYuv95D5viZCfDpb70E3g/p0qAZVVoyoYhKiGkYJ2Jy6EJPd2qw8KmmAHdH+d3PPYIRBQPj94kL3tG3KwNzymetFZXuM80mkUFSpiNwaBCDk/TvdYPg110fqBL2Bts+PcWHtMPgFxoSk6MUsrz6dx6DMh8MMzwOIQVvqWA3LCr457cMCr/3+sUhK6dObZs8Tk9Edpj5MecYcTiANLWeD73+6WzCtutG+PCqFK2YbaVjKwV/CDZUSAcoNSm3QX3HOY4kz3dOGs4UtZf/Mh+2SLkQInA4DMl/nxf7U/dGFsOWjXAVEIWd3WQC5DBzfdsR5g9QfwL3kpa1MSqGGDg6UvKNOR5PLEuexkk6TlLKjHb7UKtCPvtk7KuK9M9NMDDRZ6/lIToiZQjnogteh8dIPvjxCIixr21vrJPSgiQnFiIqvkZGNl3+TPR86COXRJ33UHnwYEa6HeGAYf5g1nzX3+OtbitvAsPYMW/W/VGuh4ICeX//jVtX+MJnHpOCXh51LNsBmgnCNppVQ7I2mZM2IKYszGg3FrpIXkIhcpTw7C3Zz9QXgpahYr5rNPkmvn11ZUk4wjnhkbbzMg4fXSwEJWr506Z2/HXqaWOmzM8BgIkYYRxhM34ubnIhsl/NDccyfDj2yWxaLfuL5dg9Xc2rSKKFsxK4KgPJmWGqaiYBMLF+HIdX0ajAnUv8fOB1WHSvAQLM0WQwj8pg2eEpBkciyMr9OzcDls=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB2557.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(39850400004)(346002)(136003)(396003)(376002)(451199018)(66899018)(31686004)(38100700002)(36756003)(110136005)(19273905006)(86362001)(31696002)(186003)(26005)(6506007)(478600001)(53546011)(6512007)(83380400001)(6666004)(2616005)(316002)(5660300002)(6486002)(966005)(4326008)(41300700001)(44832011)(8936002)(66476007)(2906002)(66556008)(8676002)(66946007)(45980500001)(43740500002)(563064011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MnFVYVNMbHQ3a2dpaWhpMkdURjVCVjBNRUtjQnhpM3MwMC9vQk1odURxODIr?=
 =?utf-8?B?V0xjVHZBcFhPcnVQdzg5S2swQ1k5TmppZHZ2cVE4MW54ODJvSjlTamltbjlX?=
 =?utf-8?B?NDBKTmZhaE9raS96K0NxR1p5d1pEdHl1MmVVTFZMeHFhOWRwZ3pVYXREd0ho?=
 =?utf-8?B?SXNORmw3azY3UWFGRmZwNmZkRXovZjBYaWVIcEpPUGt5UUR1a2lzaS8wRE45?=
 =?utf-8?B?b2JwRmZ2VUZBYzdCYzVRV2JjVk16RmN0UjdkNHQ3L1ljbE1IOXo2V3FTTHhJ?=
 =?utf-8?B?U0JWWFV4WWgwRUh6cFFGVmNEZkRlTlFxRWRWYmdNREZNQTN2dVNhL0RqZGJk?=
 =?utf-8?B?blhSTC9senc3dngvNG81dlltOXJucG1lTGNwMk9nb291MWZVanFDV3BRRmh3?=
 =?utf-8?B?MzR1ZHh3UFVuSEUxbXRNSERGWFpjbnBvODFxa0hpUm1YLzNiZ0VOa1liMXJL?=
 =?utf-8?B?NXQ0VEpXc0YvRG9QUzdpMlVXdDhkMXJVV1hwYS80VWFSV2drcDVCc0w2RlZr?=
 =?utf-8?B?czAvclN2dEZFOEFEUlhJV1hGOURjQWhjb0ZOa2FpVDBEODNaMHZ4dkUyLzhn?=
 =?utf-8?B?YVBDM3VaZHZZa0lGaGRXcjZ2dWdyWUtBM2lOMjBWclZxVm1vTEZQM2laQURW?=
 =?utf-8?B?UW5FZG5laVpKVmYyVzh6WG5xdndQMXJHR0tBR0NlczMyTWMxZ3BKQ0FpcER2?=
 =?utf-8?B?SFloSklWZ2psbUZEOWhSaFVmMDF0QWhHMVplM0JVaDd4OEE3M0dkUHhjczhG?=
 =?utf-8?B?Q2tBQmFZck9PSlFVdm9vZ1k2WUdiSHVKQ2xhSk5zTzdIQVdIemZMOGRFbW9I?=
 =?utf-8?B?TWNFWnFiUzMyZk9QcGkrSTVKU2tRTUx0WE9lMGpRWll0TWgvQ0xFZFhoZTBr?=
 =?utf-8?B?NU1vRDNOdDEzYktyc2hKVjlsN3pnNnAvK2ZrWHBxcEE5VGNOMTEvVkRMT1o2?=
 =?utf-8?B?UnUzQWlpN1V5OGVEQkZEWm9SaHlMMHdTRXFPVEMyNDdqVHQxbnZndnlNZjZi?=
 =?utf-8?B?YkxBTjJ3MVF6UW9WeGJCdVA5dGxSVUtIbmU4c0VsMnZ5NVRISTNJT3loaUZE?=
 =?utf-8?B?OUsvam52YVVqbExSK2lvbG9CRGVwOGE3MERHYUN0SmZtMWE5YUMrRUhFR0hT?=
 =?utf-8?B?ZWQ4MmcxY2dLNFQrT1hXRU1QTERRVER3MUNySDlnWTdvQi92enBqVDI5SG94?=
 =?utf-8?B?TkJLQkxpbzB5djVQOVVOTzdoS3FBVVJBQVNjM2dLRFdacDFrVnhyZW5wNmFx?=
 =?utf-8?B?MkpVRHhyZGM4YlI5WHp3MTJtZ29SRldNNFdVbnVYK0FLVU8vMmpqVE5HdEF3?=
 =?utf-8?B?R3pLMWU1cnJiWUs5b01jNjFMYXMrUzBUNlBwMjBRaUNkN2ZNYW5XTGxIWThn?=
 =?utf-8?B?dzJqblpDRHk4YUp2d1hpaFRvekFTZldOMUFUbXJ4b2U5S1QydGF5eXlQSE9T?=
 =?utf-8?B?UW9TYW01SmNGRGduMkx5c053SmtsRGJud3FWZ2RlanliVlgvaUdkRjNuaXRq?=
 =?utf-8?B?SGM2NTZSSHI5aHpZVjRsUkEzMnlkTUJRU25OdWhsN0Mra1lOdTBudno1eUdR?=
 =?utf-8?B?dWJYTW9WWXUvRXRTK1JFUXpYeTNqUDQyUTducFBaLytlVE1lQTYvdUNMQ2xG?=
 =?utf-8?B?UmxzdThCMXBsQkdJRUplcEtYcUp6ZGVkb0dnaEkzeTM5K1FyOUVJdU5Wb05a?=
 =?utf-8?B?SXl4YjZrTGFrTENXMDJkS29lVis5Q2drZFBhQUE1b3hnUlp1WVMvak4va2t6?=
 =?utf-8?B?d25FZkdDcGpiMWh6K0w0ZitEd0JKRTFRMy9UMW5kVEg5S25ySU5BWXNlREU1?=
 =?utf-8?B?Q3huZ2d1cDl6L3lvcEhSZ2lWTVdKa0FDc3phc3lFcW5BbGNrTW1BdXpaMmFS?=
 =?utf-8?B?b1FRR2gxL2w2T2haSmg4UW9PT21vT1pFV25Sd2dwcU9sOUNHRkNBQVlEZitK?=
 =?utf-8?B?NGlIcXB5VVZFdnFwNHBIWW1KeUZ5TjJBTGdXMDVrRU93UkRhSVB0aXpRN2J3?=
 =?utf-8?B?R3VKcHNlQjFVeFVRZURLWktFWFUzYkd5RWhSaERrSEJGQ0JLVDNmZnpoNFJH?=
 =?utf-8?B?KzZyNzBhcnpwSDNLSEFXNml5VkhHV3EyOG9OaDlkRkt0QWZYcGl4YjAzZzA5?=
 =?utf-8?B?ZHBEckU4OXJjVDRHVitSYVQzNGJBV2RrMTcrL29CcXppdXZLalZncDhuRHF2?=
 =?utf-8?B?N0E9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb18ece1-6083-4d13-0867-08db2103c535
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2557.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2023 01:07:08.6512
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wg2mFbPBJWlq8Dy8iDwF4i2e2UOquppTpwcKpeJFVzBAnsb/b3YM3WvjawEKAAqGJWr2P6lhlw9BWU0Rj/pcbqPcoWjcayTwIaFXKaRsoW4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5873
X-Proofpoint-GUID: Rh-e6SX44_GXH4Wzu4Gmpez2ium41Z5f
X-Proofpoint-ORIG-GUID: Cn-HuyFZJMlscjqJ-EIqCQmOC9kc-RXL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-09_14,2023-03-09_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 malwarescore=0 mlxlogscore=999 impostorscore=0 suspectscore=0 spamscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2303100004
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 32A0kXO1029337
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Mar 2023 01:07:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101467


On 3/10/23 03:28, Khem Raj wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On Thu, Mar 9, 2023 at 12:43=E2=80=AFAM Changqing Li
> <changqing.li@eng.windriver.com> wrote:
>> From: Changqing Li <changqing.li@windriver.com>
>>
>> Signed-off-by: Changqing Li <changqing.li@windriver.com>
>> ---
>>   .../sg3-utils/{sg3-utils_1.45.bb =3D> sg3-utils_1.47.bb}      | 6 ++=
+---
>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>   rename meta-oe/recipes-support/sg3-utils/{sg3-utils_1.45.bb =3D> sg3=
-utils_1.47.bb} (72%)
>>
>> diff --git a/meta-oe/recipes-support/sg3-utils/sg3-utils_1.45.bb b/met=
a-oe/recipes-support/sg3-utils/sg3-utils_1.47.bb
>> similarity index 72%
>> rename from meta-oe/recipes-support/sg3-utils/sg3-utils_1.45.bb
>> rename to meta-oe/recipes-support/sg3-utils/sg3-utils_1.47.bb
>> index ac12f9561..713c9f27d 100644
>> --- a/meta-oe/recipes-support/sg3-utils/sg3-utils_1.45.bb
>> +++ b/meta-oe/recipes-support/sg3-utils/sg3-utils_1.47.bb
>> @@ -6,7 +6,7 @@ HOMEPAGE =3D "http://sg.danny.cz/sg/sg3_utils.html"
>>   SECTION =3D "console/admin"
>>
>>   LICENSE =3D "GPL-2.0-or-later & BSD-2-Clause"
>> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Df90da7fc52172599dbf082d762=
0f18ca"
>> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Df685699d3ac82f108aa880043f=
a3feb7"
>>
>>   SRC_URI =3D "http://sg.danny.cz/sg/p/sg3_utils-${PV}.tgz \
>>   "
>> @@ -14,8 +14,8 @@ MIRRORS +=3D "http://sg.danny.cz/sg/p https://fossie=
s.org/linux/misc"
>>
>>   UPSTREAM_CHECK_REGEX =3D "sg3_utils-(?P<pver>\d+(\.\d+)+)\.tgz"
>>
>> -SRC_URI[md5sum] =3D "2e71d7cd925dcc48acb24afaaaac7990"
>> -SRC_URI[sha256sum] =3D "0b87c971af52af7cebebcce343eac6bd3d73febb3c72a=
f9ce41a4552f1605a61"
>> +SRC_URI[md5sum] =3D "5c6f6315f36ecf3499e49b1b6dbdc034"
> md5sum can be dropped.

Thanks,=C2=A0 I will send an V2 patch.

//Changqing
>
>> +SRC_URI[sha256sum] =3D "8673c7faca849b6b34764332d2aa91f72db05bff7382b=
b836d0688795199c3e1"
>>
>>   inherit autotools-brokensep
>>
>> --
>> 2.25.1
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#101443): https://lists.openembedded.org/g/openembe=
dded-devel/message/101443
>> Mute This Topic: https://lists.openembedded.org/mt/97492283/1997914
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub=
 [raj.khem@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

