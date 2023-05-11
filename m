Return-Path: <narpat.mali@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65FBEC77B7C
	for <webhook@archiver.kernel.org>; Thu, 11 May 2023 16:47:37 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.1688.1683823650989448727
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 May 2023 09:47:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=mJxbamsB;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=44952a835d=narpat.mali@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34BBlFF3026661
	for <openembedded-devel@lists.openembedded.org>; Thu, 11 May 2023 09:47:30 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=message-id : date
 : subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=KxFTK3e039o08jeoewYEZwVmDn/l2PpCKsCrVhmEP5s=;
 b=mJxbamsB5WKCfpLkvcmX6GoPrdzY9LjbC4UbvgQx+Gzn74mGaotM2nvrwjofOnYsjRSh
 BFUQdcRa5Mgkyh2DSfPExD7z2QRuQol6mR7hQv0rmn6QLVa/eryDaJ8HG66SVtoErT5N
 esclTKVnAteiyptefiy0CuuxwbR9KHxi0mKAP727ViwH++qzknbAw5DGDEfEWDSixABg
 KlX7K1bT6mYlORVAyyUpiB7ui3oIXQgQwdSkL27k7qSQakkgbJOqf3bar8s5TFQh0CLK
 ohbuzbiXfCPsoj5r5gXTUCI5tkzFNAtvyuRxM+YaP8SokMIsa2MNC3kVEBrvxRcwvR9c Aw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3qf7uctwrr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 11 May 2023 09:47:30 -0700
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 34BGlU39020880
	for <openembedded-devel@lists.openembedded.org>; Thu, 11 May 2023 09:47:30 -0700
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2171.outbound.protection.outlook.com [104.47.59.171])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3qf7uctwrq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 May 2023 09:47:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vuw373ZMjUBaXOHTh0cY+qmQGNmY+FeGwDmHisrT2SMJ4mGJy/JFSE0Dq3SHwXMKcXiTOnynaIFnZ80foPH6jXSuU+LsmWsxy4EfzIIE8XW/XnuCo5fanVN7u/66ObCREM9OQ0nZra2jfm6IpwWFAZwRmf/6X48NrLFb5c8ERFAlMhkfh5Sfc1KFJ6BCvFW4fHCEtsX6vluppFnBUC+w2c+taFK97sNf0HWyHDDh3sZ3a6U6tfuf9nTeHmQcBJgRGz0zRXRS5bFMfiC0uJB+JzJpza9+q5JcShQhX+AE+89UsW08w3rdmQrHrZSevNnIS/E7vCM2+4cxGbcsQ5/BoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KxFTK3e039o08jeoewYEZwVmDn/l2PpCKsCrVhmEP5s=;
 b=WGcXAm3TUfag2jf8uTU0s6Z9deR0blevL6MjKI3gMsmDASWBgpMrqSjwdDOLm+4iNWBQRwTJZwE9PEkLKZnpGASYUm8AwXF5KJydK+8JA374ucA6idZLlZvpswgSEGk5Q4Xmr8SNVQIflsR2DwdLDt/8IpS+yZl7xRIHfPhChxJoX+04k5WUD64FXkzJFH3KyecdMk5UXi0Cqa4BJIl0EPNrs5FGec/E7iDKTIJEk2rz6PzMkX2Aojx+Yz5aPSMzuYrANIff8h+CjvucEq2tOfUGiAti9mr2j71aWyDIKbKKwhqaUlN4qUdPT1HM10Fp1Rh+IJ63niQJP0rQMA8LkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5550.namprd11.prod.outlook.com (2603:10b6:5:38b::24)
 by PH7PR11MB6796.namprd11.prod.outlook.com (2603:10b6:510:1ba::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.33; Thu, 11 May
 2023 16:47:21 +0000
Received: from DM4PR11MB5550.namprd11.prod.outlook.com
 ([fe80::f8d6:40cf:5516:1786]) by DM4PR11MB5550.namprd11.prod.outlook.com
 ([fe80::f8d6:40cf:5516:1786%3]) with mapi id 15.20.6387.022; Thu, 11 May 2023
 16:47:20 +0000
Message-ID: <71597010-ebe4-bf8e-be18-714f30e0e481@windriver.com>
Date: Thu, 11 May 2023 22:15:26 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [meta-oe][dunfell][PATCH 1/1] nodejs: make 14.18.1 available but
 not default
To: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
Cc: akuster808@gmail.com, max@igalia.com, raphael.kubo.da.costa@intel.com,
        Randy.MacLeod@windriver.com, hari.gpillai@windriver.com
References: <20230510183353.2724978-1-narpat.mali@windriver.com>
 <CAMKF1spkCT=yxDsQPLnMbXTGVTEx0db1OoJC3=3b5n24OL_vvw@mail.gmail.com>
Content-Language: en-US
From: "Mali, Narpat" <narpat.mali@windriver.com>
In-Reply-To: <CAMKF1spkCT=yxDsQPLnMbXTGVTEx0db1OoJC3=3b5n24OL_vvw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: PH8PR15CA0016.namprd15.prod.outlook.com
 (2603:10b6:510:2d2::26) To DM4PR11MB5550.namprd11.prod.outlook.com
 (2603:10b6:5:38b::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5550:EE_|PH7PR11MB6796:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e69608c-58d4-430e-9062-08db523f62b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	nv8d6yuNfDB4FXIYl+5but5k/Z+HonCx1LgTuzpMmJLIqgagg422KyOBtxbIRjRumYfCXoZ5TUvic8X14lTLLnAlwrBCZrQ3Y11d4Rx+BHWP1KJNeI/8smgcj7FM1qMfonZ0liOHXB8/M8A04pMOks4Rj8BfkAZWCo3sYG97uDO8GSNgZXDgdcvn5vc5P1pEB4MARJLYCwW1sqRSInjfEO3jN8zZm4n0wW6TKLbaOk9+DnysBEool2vvQWwDEDC3QmDZZs0HM6eAHzc/6HNN7i6Hj0aH6KO6aL5c9FyBFUEZmKr1PVl42sXfNMsN0lZYDBQmUvx6i9PFVg8Fa7tY1riaZoe8S5bGXFCuwXs2AVQ2ZU9IwbRDKTiYOtyfFf0lOfp4wX/TAuPj/dp7X0z47oZHx+N29jdxBuuydL6Uoz0DoZ3dt+bt/9PjM6trZU8V2AIHGww5CEiJGf9skFOwX1ntiD/yzX+ZPCoEZrPeVK5j00+BdJ7kxbg7B4Y5P5Dbo4TWzBNoTRERElr1K+DkS8iwFIX2oxD44n16GDGqXEB1wo3BIPR1rIvkNwAsYd9WRFfGSw2QZHCinGznG62Riik4IHfoP4q9WwM7AKylOjimiAYkU7zR7UWhw6tguaQacTBB1yu5XnKetjF2XJyouVH6U7CfZPYUodiYEXEar355HBbNHQeUTEUz2kEUIRzhSs5IW3IDX1Zf8csyruzyxQVxO09ogim6yqzq55Vx3T4=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5550.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(39850400004)(376002)(366004)(346002)(451199021)(316002)(53546011)(5660300002)(31696002)(107886003)(41300700001)(38100700002)(4326008)(6506007)(66476007)(26005)(86362001)(66946007)(55236004)(66556008)(6512007)(2906002)(30864003)(8676002)(31686004)(8936002)(186003)(966005)(6486002)(36756003)(478600001)(83380400001)(66574015)(2616005)(131093003)(45980500001)(43740500002)(460985005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?N2w4VzJCekt3eGtodFRZZWRlQnVYUk5MdURpUWRINDc5by9aeU9xdTlTNDV3?=
 =?utf-8?B?SzEwMjJSK3F0SlhNMDhJV2RXb1dTSWUzdjdabXlTem1mY0tHbU95a3cyV3Jv?=
 =?utf-8?B?NUZ6d0U0Q1B6NHJvdCtQamNuVkZCZXFOVEsxMmlPb3IwMWc3Z21zYXNWajI5?=
 =?utf-8?B?RnFTOW5SV2t5NlkxNnl1MENSWXRtK2Q5aUxUcUExVTdFWE5pSkt5Z3pPK0pU?=
 =?utf-8?B?QUIxMnlWVkVrUTMwVmd0cW9ic0RxM3EvMjZBRHBnWCtWTXpFL0YwWmJ5eVVK?=
 =?utf-8?B?dmpocU05QXZKUmdkUndUS2NUL2N3aER0dmxUOHVidDAreWtBWXM0MTEwQlJr?=
 =?utf-8?B?M24wdk5GNmJjOU4vYmN2dzhUL3YxcmJlMjBKd0pPTWFTMTZoeHpDYUtjQ2cx?=
 =?utf-8?B?akRqWnc5S0FjUnpUdzdweFhsRDgza2hTeFU4T3NISGtsWGk5bnVCRGVvd3Iw?=
 =?utf-8?B?aE9NTVVLT0VSVDJlVzFiRE1FS3d3TFhXenpBdU9pUHQ2N2xSbzRpWkNQSFBW?=
 =?utf-8?B?MVU3UFlqaHR5ZlNkMGh1dURsWXZaYStFTVNBV0dFREtXTjFURXIycUJiOEpE?=
 =?utf-8?B?dllJaHo1d1pVb01HajlhV0NwZDUwTnlUeHNZZWVqVll5c3dzNWJKcjgwWXgv?=
 =?utf-8?B?d3JiZE1HRVZJWVpNdlBKMGlYbDVsaEo2S2lPZUxlSVg2MHZINURVWEFGTmxI?=
 =?utf-8?B?elp3MEdlMlFMQWFwUXJsci94ejhMVVh6Rk9hZ0xxb2NCbjRocDN6eVI0bzBW?=
 =?utf-8?B?QUJKSkx5ZnBFdEMySlBUdkRCZmw5Tzd0QituNGg2aUMvWlJNR1gxc21wTzFw?=
 =?utf-8?B?SktJcXB3dE9jRWp4c1lBY2h2UUl3dW94VlkxTlcrd29xMGd6Nlg2ZzBFaUJ3?=
 =?utf-8?B?aGc2U2piUHBmRnpRa1h5Sll3SWpKUE9PdVZFeWNSZisvQ3BnemFWWnhKYkJt?=
 =?utf-8?B?VFZ6dGVYdStlY2xBWWo1M0JYQjN2Z1htOWhvdXFJdHVhenhSaHp2d3kzZDRN?=
 =?utf-8?B?ZkRtUDRsWXo0ck1UYnVVeHQwZUF4Y0RjVy92a2RHR1ZIajhFVkdWQi9zemh5?=
 =?utf-8?B?KzlCRE84elYxd1B6S0kvZGN4bHRRRkpHWVVXczJSR3dpNDNkNEprdmxwYnVS?=
 =?utf-8?B?N0RDcy9aS2REYVVMUXY3NFNiZStLVG96RithK09RZ29jOGI4a1V2eXFkUzV1?=
 =?utf-8?B?OS9kdkQ0dENYVnl4QldlMmhCQUZRc0thYVZsQit4RjZ3NzN3ZjhhSS9BQnc0?=
 =?utf-8?B?eCtNMEpheDdRKzVIZ2JrdEtVWU5uWkQxRmJiK2NlYjRlWE9DbG5nR3luV2pT?=
 =?utf-8?B?cFR5R0ZycDZzc2wwSU95dG9hZFNHOENaZWNYVjhqb2FnSGxlMnNEeWlRbXUw?=
 =?utf-8?B?cFB3MXJlaGVGYU9LMDE5YndjNUZCRS9DampIN2lEems4ZHIvVjh2R2U0M1RV?=
 =?utf-8?B?bW0rQzhYcVRENDFGM3NYNVR0QjhvTFh1K1hEejBab1FHRFRvaW4zZ2lTekRO?=
 =?utf-8?B?dVJ4THdYdE5kQ0s5NEtpdmp1ZXY0dGhuZEZJcFRGM1o5U0EvNmZFYWtHYWRp?=
 =?utf-8?B?TWpzNHZzNDVoeXRlZXR3NU9WckN5RGVFUUVEUXJYdE4xdVMwVktuQVZIWU0r?=
 =?utf-8?B?T2dLNGR3bFAzOUtqbmpzUkhSTWFyNWlPcmlyMEIvaXJ3Z3RlSDhXNTM1bFcz?=
 =?utf-8?B?NDQ4ejUyOU8rUnh2Sm5NQ2dQQnNqNjY4N2VUSEwwMjFGNU1kWXI2d0wxd0dB?=
 =?utf-8?B?NEp2dDJWVXU1TFFuV0gva2F0OXphS2dHdFlpakV0K05ZWjgxNXB5L0kwaE5z?=
 =?utf-8?B?UGhtNmJoSjI4R09adzZPUmlkd2RCdzZyMUhoS3p2TzY5OEFZczdBZDJLUHI3?=
 =?utf-8?B?QUlyRkJRVVQ0aytIZUowa1Nld0hZNmdFVFhYenVwN1dZMEs2MldUcDNDUTht?=
 =?utf-8?B?QWtiMktSWkd2UU9Pbk0yVmE4TTJSaFgwT0hwZ3RFOWUxLy8zcXdoS2xZSURv?=
 =?utf-8?B?MEY0dzd3VkxGL2ZQNmVadWd2REZuQkluTUIyQStiMlVjUnBKTHhmVEV2YmJT?=
 =?utf-8?B?cEdhbzA1ZWZ4NEgxV0RPWWx6QVJCVzZvQ3F4TEpKMkNUdWp5c0EwNzFqK0lu?=
 =?utf-8?B?WE9xek1aWjRUL3JmNEZBNGEzTGtwYWEzQkVMRWF5WXorYlA1dDNVL3ZWN0dV?=
 =?utf-8?B?VUE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e69608c-58d4-430e-9062-08db523f62b6
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5550.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2023 16:47:20.3828
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C1P325rXG0nwE9exEWep0lSGCDZRVSvEn16f75hwFXxMPkCtHws0fTdgkbxQKss1yMH0Gj8Yn4Tr0i5vjVzOcYsVUfgSB1XSJtegpBQQyvg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6796
X-Proofpoint-GUID: UzkKQovjI5wEkiM7wVkFa285TkXMAUz1
X-Proofpoint-ORIG-GUID: KOn11VYO29Y_5Cpt41g4dC9BAN458Mf7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-11_13,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 clxscore=1015 lowpriorityscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 mlxscore=0 mlxlogscore=999 priorityscore=1501 spamscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2304280000
 definitions=main-2305110144
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 34BBlFF3026661
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 11 May 2023 16:47:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102550

Hi All,

Have re-submitted the v2 patch with=C2=A0 "DEFAULT_PREFERENCE" changes.

Best Regards,

Narpat

On 11-05-2023 09:26, Khem Raj wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On Wed, May 10, 2023 at 11:34=E2=80=AFAM nmali <narpat.mali@windriver.c=
om> wrote:
>> From: Narpat Mali <narpat.mali@windriver.com>
>>
>> Chromium 112 needs nodejs-native version 14 or later.
>> Add the nodejs_14.18.1 recipe from kirkstone:
>>     246b20b92 nodejs: Upgrade to 14.18.1
>> but, use PREFERRED_VERSION to make sure that the default version of no=
dejs
>> remains 12.x.
>>
>> 7 patches which were modified between nodejs 12 & nodejs 14 were renam=
ed by
>> adding the suffix "-nodejs14". Note there are some common patches used=
 by
>> nodejs 12 & 14 so, that will require attention during future maintenan=
ce.
>> In addition, there were 3 CVE-2022* patches which applied cleanly to n=
odejs
>> 14 so, they were added to the nodejs 14 recipe. One patch, CVE-llhttp.=
patch
>> conflicted so, it has not been applied in nodejs 14 yet.
>>
>> Nodejs 14 compile for qemux86-64 but, no run-time testing has been per=
formed.
>>
>> For chromium, we would either require users to modify the local.conf f=
ile or
>> we may create a dunfell specific branch in meta-browser.
>> See: https://github.com/OSSystems/meta-browser/pull/709
>>
>> Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
>> Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
>> ---
>>   meta-oe/conf/layer.conf                       |   3 +
>>   ...-gyp-files-for-bundled-deps-nodejs14.patch |  22 ++
>>   ...ja-tests.py-add-py-3.10-fix-nodejs14.patch |  41 ++++
>>   ...use-mminimal-toc-with-clang-nodejs14.patch |  28 +++
>>   .../0002-Using-native-binaries-nodejs14.patch |  62 ++++++
>>   ...oth-binaries-and-use-libdir-nodejs14.patch |  84 ++++++++
>>   .../nodejs/nodejs/libatomic-nodejs14.patch    |  21 ++
>>   .../nodejs/mips-less-memory-nodejs14.patch    |  32 +++
>>   .../recipes-devtools/nodejs/nodejs_14.18.1.bb | 203 ++++++++++++++++=
++
>>   9 files changed, 496 insertions(+)
>>   create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/0001-Disab=
le-running-gyp-files-for-bundled-deps-nodejs14.patch
>>   create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/0001-jinja=
-tests.py-add-py-3.10-fix-nodejs14.patch
>>   create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/0001-ppc64=
-Do-not-use-mminimal-toc-with-clang-nodejs14.patch
>>   create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/0002-Using=
-native-binaries-nodejs14.patch
>>   create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/0003-Insta=
ll-both-binaries-and-use-libdir-nodejs14.patch
>>   create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/libatomic-=
nodejs14.patch
>>   create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/mips-less-=
memory-nodejs14.patch
>>   create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs_14.18.1.bb
>>
>> diff --git a/meta-oe/conf/layer.conf b/meta-oe/conf/layer.conf
>> index adcec8302..ed3f67857 100644
>> --- a/meta-oe/conf/layer.conf
>> +++ b/meta-oe/conf/layer.conf
>> @@ -42,6 +42,9 @@ LICENSE_PATH +=3D "${LAYERDIR}/licenses"
>>
>>   PREFERRED_RPROVIDER_libdevmapper =3D "lvm2"
>>
>> +PREFERRED_VERSION_nodejs ?=3D "12.%"
>> +PREFERRED_VERSION_nodejs-native ?=3D "12.%"
>> +
> I think it might be better to add
>
> DEFAULT_PREFERENCE =3D "-1"
>
> in the 14.x recipe and you can avoid doing above.
>
>>   SIGGEN_EXCLUDERECIPES_ABISAFE +=3D " \
>>     mplayer-common \
>>     fbset-modes \
>> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0001-Disable-runni=
ng-gyp-files-for-bundled-deps-nodejs14.patch b/meta-oe/recipes-devtools/n=
odejs/nodejs/0001-Disable-running-gyp-files-for-bundled-deps-nodejs14.pat=
ch
>> new file mode 100644
>> index 000000000..d6e439ba2
>> --- /dev/null
>> +++ b/meta-oe/recipes-devtools/nodejs/nodejs/0001-Disable-running-gyp-=
files-for-bundled-deps-nodejs14.patch
>> @@ -0,0 +1,22 @@
>> +From 7d94bfe53beeb2d25eb5f2ff6b1d509df7e6ab80 Mon Sep 17 00:00:00 200=
1
>> +From: Zuzana Svetlikova <zsvetlik@redhat.com>
>> +Date: Thu, 27 Apr 2017 14:25:42 +0200
>> +Subject: [PATCH] Disable running gyp on shared deps
>> +
>> +---
>> + Makefile | 2 +-
>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>> +
>> +diff --git a/Makefile b/Makefile
>> +index 93d63110..79caaec2 100644
>> +--- a/Makefile
>> ++++ b/Makefile
>> +@@ -138,7 +138,7 @@ with-code-cache test-code-cache:
>> +       $(warning '$@' target is a noop)
>> +
>> + out/Makefile: config.gypi common.gypi node.gyp \
>> +-      deps/uv/uv.gyp deps/llhttp/llhttp.gyp deps/zlib/zlib.gyp \
>> ++      deps/llhttp/llhttp.gyp \
>> +       tools/v8_gypfiles/toolchain.gypi tools/v8_gypfiles/features.gy=
pi \
>> +       tools/v8_gypfiles/inspector.gypi tools/v8_gypfiles/v8.gyp
>> +       $(PYTHON) tools/gyp_node.py -f make
>> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0001-jinja-tests.p=
y-add-py-3.10-fix-nodejs14.patch b/meta-oe/recipes-devtools/nodejs/nodejs=
/0001-jinja-tests.py-add-py-3.10-fix-nodejs14.patch
>> new file mode 100644
>> index 000000000..b2a2da959
>> --- /dev/null
>> +++ b/meta-oe/recipes-devtools/nodejs/nodejs/0001-jinja-tests.py-add-p=
y-3.10-fix-nodejs14.patch
>> @@ -0,0 +1,41 @@
>> +From e1d838089cd461d9efcf4d29d9f18f65994d2d6b Mon Sep 17 00:00:00 200=
1
>> +From: Alexander Kanavin <alex@linutronix.de>
>> +Date: Sun, 3 Oct 2021 22:48:39 +0200
>> +Subject: [PATCH] jinja/tests.py: add py 3.10 fix
>> +
>> +Upstream-Status: Pending
>> +Signed-off-by: Alexander Kanavin <alex@linutronix.de>
>> +---
>> + deps/v8/third_party/jinja2/tests.py      | 2 +-
>> + tools/inspector_protocol/jinja2/tests.py | 2 +-
>> + 2 files changed, 2 insertions(+), 2 deletions(-)
>> +
>> +diff --git a/deps/v8/third_party/jinja2/tests.py b/deps/v8/third_part=
y/jinja2/tests.py
>> +index 0adc3d4..b14f85f 100644
>> +--- a/deps/v8/third_party/jinja2/tests.py
>> ++++ b/deps/v8/third_party/jinja2/tests.py
>> +@@ -10,7 +10,7 @@
>> + """
>> + import operator
>> + import re
>> +-from collections import Mapping
>> ++from collections.abc import Mapping
>> + from jinja2.runtime import Undefined
>> + from jinja2._compat import text_type, string_types, integer_types
>> + import decimal
>> +diff --git a/tools/inspector_protocol/jinja2/tests.py b/tools/inspect=
or_protocol/jinja2/tests.py
>> +index 0adc3d4..b14f85f 100644
>> +--- a/tools/inspector_protocol/jinja2/tests.py
>> ++++ b/tools/inspector_protocol/jinja2/tests.py
>> +@@ -10,7 +10,7 @@
>> + """
>> + import operator
>> + import re
>> +-from collections import Mapping
>> ++from collections.abc import Mapping
>> + from jinja2.runtime import Undefined
>> + from jinja2._compat import text_type, string_types, integer_types
>> + import decimal
>> +--
>> +2.20.1
>> +
>> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0001-ppc64-Do-not-=
use-mminimal-toc-with-clang-nodejs14.patch b/meta-oe/recipes-devtools/nod=
ejs/nodejs/0001-ppc64-Do-not-use-mminimal-toc-with-clang-nodejs14.patch
>> new file mode 100644
>> index 000000000..00b2e9baa
>> --- /dev/null
>> +++ b/meta-oe/recipes-devtools/nodejs/nodejs/0001-ppc64-Do-not-use-mmi=
nimal-toc-with-clang-nodejs14.patch
>> @@ -0,0 +1,28 @@
>> +From 0976af0f3b328436ea44a74a406f311adb2ab211 Mon Sep 17 00:00:00 200=
1
>> +From: Khem Raj <raj.khem@gmail.com>
>> +Date: Tue, 15 Jun 2021 19:01:31 -0700
>> +Subject: [PATCH] ppc64: Do not use -mminimal-toc with clang
>> +
>> +clang does not support this option
>> +
>> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> +---
>> + common.gypi | 2 +-
>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>> +
>> +diff --git a/common.gypi b/common.gypi
>> +index ee91fb1d..049c8f8c 100644
>> +--- a/common.gypi
>> ++++ b/common.gypi
>> +@@ -413,7 +413,7 @@
>> +             'ldflags': [ '-m32' ],
>> +           }],
>> +           [ 'target_arch=3D=3D"ppc64" and OS!=3D"aix"', {
>> +-            'cflags': [ '-m64', '-mminimal-toc' ],
>> ++            'cflags': [ '-m64' ],
>> +             'ldflags': [ '-m64' ],
>> +           }],
>> +           [ 'target_arch=3D=3D"s390x"', {
>> +--
>> +2.32.0
>> +
>> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0002-Using-native-=
binaries-nodejs14.patch b/meta-oe/recipes-devtools/nodejs/nodejs/0002-Usi=
ng-native-binaries-nodejs14.patch
>> new file mode 100644
>> index 000000000..c6fc2dcd7
>> --- /dev/null
>> +++ b/meta-oe/recipes-devtools/nodejs/nodejs/0002-Using-native-binarie=
s-nodejs14.patch
>> @@ -0,0 +1,62 @@
>> +From 6c3ac20477a4bac643088f24df3c042e627fafa9 Mon Sep 17 00:00:00 200=
1
>> +From: Guillaume Burel <guillaume.burel@stormshield.eu>
>> +Date: Fri, 3 Jan 2020 11:25:54 +0100
>> +Subject: [PATCH] Using native binaries
>> +
>> +---
>> + node.gyp                 |  4 ++--
>> + tools/v8_gypfiles/v8.gyp | 11 ++++-------
>> + 2 files changed, 6 insertions(+), 9 deletions(-)
>> +
>> +--- a/node.gyp
>> ++++ b/node.gyp
>> +@@ -487,6 +487,7 @@
>> +               'action_name': 'run_mkcodecache',
>> +               'process_outputs_as_sources': 1,
>> +               'inputs': [
>> ++                '<(PRODUCT_DIR)/v8-qemu-wrapper.sh',
>> +                 '<(mkcodecache_exec)',
>> +               ],
>> +               'outputs': [
>> +@@ -512,6 +513,7 @@
>> +               'action_name': 'node_mksnapshot',
>> +               'process_outputs_as_sources': 1,
>> +               'inputs': [
>> ++                '<(PRODUCT_DIR)/v8-qemu-wrapper.sh',
>> +                 '<(node_mksnapshot_exec)',
>> +               ],
>> +               'outputs': [
>> +--- a/tools/v8_gypfiles/v8.gyp
>> ++++ b/tools/v8_gypfiles/v8.gyp
>> +@@ -220,6 +220,7 @@
>> +         {
>> +           'action_name': 'run_torque_action',
>> +           'inputs': [  # Order matters.
>> ++            '<(PRODUCT_DIR)/v8-qemu-wrapper.sh',
>> +             '<(PRODUCT_DIR)/<(EXECUTABLE_PREFIX)torque<(EXECUTABLE_S=
UFFIX)',
>> +             '<@(torque_files)',
>> +           ],
>> +@@ -351,6 +352,7 @@
>> +         {
>> +           'action_name': 'generate_bytecode_builtins_list_action',
>> +           'inputs': [
>> ++            '<(PRODUCT_DIR)/v8-qemu-wrapper.sh',
>> +             '<(PRODUCT_DIR)/<(EXECUTABLE_PREFIX)bytecode_builtins_li=
st_generator<(EXECUTABLE_SUFFIX)',
>> +           ],
>> +           'outputs': [
>> +@@ -533,6 +535,7 @@
>> +             ],
>> +           },
>> +           'inputs': [
>> ++            '<(PRODUCT_DIR)/v8-qemu-wrapper.sh',
>> +             '<(mksnapshot_exec)',
>> +           ],
>> +           'outputs': [
>> +@@ -1448,6 +1451,7 @@
>> +         {
>> +           'action_name': 'run_gen-regexp-special-case_action',
>> +           'inputs': [
>> ++            '<(PRODUCT_DIR)/v8-qemu-wrapper.sh',
>> +             '<(PRODUCT_DIR)/<(EXECUTABLE_PREFIX)gen-regexp-special-c=
ase<(EXECUTABLE_SUFFIX)',
>> +           ],
>> +           'outputs': [
>> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0003-Install-both-=
binaries-and-use-libdir-nodejs14.patch b/meta-oe/recipes-devtools/nodejs/=
nodejs/0003-Install-both-binaries-and-use-libdir-nodejs14.patch
>> new file mode 100644
>> index 000000000..622392099
>> --- /dev/null
>> +++ b/meta-oe/recipes-devtools/nodejs/nodejs/0003-Install-both-binarie=
s-and-use-libdir-nodejs14.patch
>> @@ -0,0 +1,84 @@
>> +From 5b22fac923d1ca3e9fefb97f5a171124a88f5e22 Mon Sep 17 00:00:00 200=
1
>> +From: Elliott Sales de Andrade <quantum.analyst@gmail.com>
>> +Date: Tue, 19 Mar 2019 23:22:40 -0400
>> +Subject: [PATCH] Install both binaries and use libdir.
>> +MIME-Version: 1.0
>> +Content-Type: text/plain; charset=3DUTF-8
>> +Content-Transfer-Encoding: 8bit
>> +
>> +This allows us to build with a shared library for other users while
>> +still providing the normal executable.
>> +
>> +Taken from - https://src.fedoraproject.org/rpms/nodejs/raw/rawhide/f/=
0002-Install-both-binaries-and-use-libdir.patch
>> +
>> +Upstream-Status: Pending
>> +
>> +Signed-off-by: Elliott Sales de Andrade <quantum.analyst@gmail.com>
>> +Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
>> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> +---
>> + configure.py     |  7 +++++++
>> + tools/install.py | 21 +++++++++------------
>> + 2 files changed, 16 insertions(+), 12 deletions(-)
>> +
>> +diff --git a/configure.py b/configure.py
>> +index e6f7e4db..6cf5c45d 100755
>> +--- a/configure.py
>> ++++ b/configure.py
>> +@@ -626,6 +626,12 @@ parser.add_option('--shared',
>> +     help=3D'compile shared library for embedding node in another pro=
ject. ' +
>> +          '(This mode is not officially supported for regular applica=
tions)')
>> +
>> ++parser.add_option('--libdir',
>> ++    action=3D'store',
>> ++    dest=3D'libdir',
>> ++    default=3D'lib',
>> ++    help=3D'a directory to install the shared library into')
>> ++
>> + parser.add_option('--without-v8-platform',
>> +     action=3D'store_true',
>> +     dest=3D'without_v8_platform',
>> +@@ -1202,6 +1208,7 @@ def configure_node(o):
>> +   o['variables']['node_no_browser_globals'] =3D b(options.no_browser=
_globals)
>> +
>> +   o['variables']['node_shared'] =3D b(options.shared)
>> ++  o['variables']['libdir'] =3D options.libdir
>> +   node_module_version =3D getmoduleversion.get_version()
>> +
>> +   if options.dest_os =3D=3D 'android':
>> +diff --git a/tools/install.py b/tools/install.py
>> +index 729b416f..9bfc6234 100755
>> +--- a/tools/install.py
>> ++++ b/tools/install.py
>> +@@ -121,22 +121,19 @@ def subdir_files(path, dest, action):
>> +
>> + def files(action):
>> +   is_windows =3D sys.platform =3D=3D 'win32'
>> +-  output_file =3D 'node'
>> +   output_prefix =3D 'out/Release/'
>> ++  output_libprefix =3D output_prefix
>> +
>> +-  if 'false' =3D=3D variables.get('node_shared'):
>> +-    if is_windows:
>> +-      output_file +=3D '.exe'
>> ++  if is_windows:
>> ++    output_bin =3D 'node.exe'
>> ++    output_lib =3D 'node.dll'
>> +   else:
>> +-    if is_windows:
>> +-      output_file +=3D '.dll'
>> +-    else:
>> +-      output_file =3D 'lib' + output_file + '.' + variables.get('shl=
ib_suffix')
>> ++    output_bin =3D 'node'
>> ++    output_lib =3D 'libnode.' + variables.get('shlib_suffix')
>> +
>> +-  if 'false' =3D=3D variables.get('node_shared'):
>> +-    action([output_prefix + output_file], 'bin/' + output_file)
>> +-  else:
>> +-    action([output_prefix + output_file], 'lib/' + output_file)
>> ++  action([output_prefix + output_bin], 'bin/' + output_bin)
>> ++  if 'true' =3D=3D variables.get('node_shared'):
>> ++    action([output_libprefix + output_lib], variables.get('libdir') =
+ '/' + output_lib)
>> +
>> +   if 'true' =3D=3D variables.get('node_use_dtrace'):
>> +     action(['out/Release/node.d'], 'lib/dtrace/node.d')
>> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/libatomic-nodejs14=
.patch b/meta-oe/recipes-devtools/nodejs/nodejs/libatomic-nodejs14.patch
>> new file mode 100644
>> index 000000000..cdf6bc8e2
>> --- /dev/null
>> +++ b/meta-oe/recipes-devtools/nodejs/nodejs/libatomic-nodejs14.patch
>> @@ -0,0 +1,21 @@
>> +Link mksnapshot with libatomic on x86
>> +
>> +Clang-12 on x86 emits atomic builtins
>> +
>> +Fixes
>> +| module-compiler.cc:(.text._ZN2v88internal4wasm12_GLOBAL__N_123Execu=
teCompilationUnitsERKSt10shared_ptrINS2_22BackgroundCompileTokenEEPNS0_8C=
ountersEiNS2_19CompileBaselineOnlyE+0x558): un
>> +defined reference to `__atomic_load'
>> +
>> +Upstream-Status: Pending
>> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> +
>> +--- a/tools/v8_gypfiles/v8.gyp
>> ++++ b/tools/v8_gypfiles/v8.gyp
>> +@@ -1336,6 +1336,7 @@
>> +     {
>> +       'target_name': 'mksnapshot',
>> +       'type': 'executable',
>> ++      'libraries': [ '-latomic' ],
>> +       'dependencies': [
>> +         'v8_base_without_compiler',
>> +         'v8_compiler_for_mksnapshot',
>> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/mips-less-memory-n=
odejs14.patch b/meta-oe/recipes-devtools/nodejs/nodejs/mips-less-memory-n=
odejs14.patch
>> new file mode 100644
>> index 000000000..56e93c50c
>> --- /dev/null
>> +++ b/meta-oe/recipes-devtools/nodejs/nodejs/mips-less-memory-nodejs14=
.patch
>> @@ -0,0 +1,32 @@
>> +Description: mksnapshot uses too much memory on 32-bit mipsel
>> +Author: J=C3=A9r=C3=A9my Lal <kapouer@melix.org>
>> +Last-Update: 2020-06-03
>> +Forwarded: https://bugs.chromium.org/p/v8/issues/detail?id=3D10586
>> +
>> +This ensures that we reserve 500M instead of 2G range for codegen
>> +ensures that qemu-mips can allocate such large ranges
>> +
>> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> +
>> +--- a/deps/v8/src/common/globals.h
>> ++++ b/deps/v8/src/common/globals.h
>> +@@ -224,7 +224,7 @@ constexpr size_t kMinimumCodeRangeSize =3D
>> + constexpr size_t kMinExpectedOSPageSize =3D 64 * KB;  // OS page on =
PPC Linux
>> + #elif V8_TARGET_ARCH_MIPS
>> + constexpr bool kPlatformRequiresCodeRange =3D false;
>> +-constexpr size_t kMaximalCodeRangeSize =3D 2048LL * MB;
>> ++constexpr size_t kMaximalCodeRangeSize =3D 512 * MB;
>> + constexpr size_t kMinimumCodeRangeSize =3D 0 * MB;
>> + constexpr size_t kMinExpectedOSPageSize =3D 4 * KB;  // OS page.
>> + #else
>> +--- a/deps/v8/src/codegen/mips/constants-mips.h
>> ++++ b/deps/v8/src/codegen/mips/constants-mips.h
>> +@@ -140,7 +140,7 @@ const uint32_t kLeastSignificantByteInIn
>> + namespace v8 {
>> + namespace internal {
>> +
>> +-constexpr size_t kMaxPCRelativeCodeRangeInMB =3D 4096;
>> ++constexpr size_t kMaxPCRelativeCodeRangeInMB =3D 1024;
>> +
>> + // -----------------------------------------------------------------=
------------
>> + // Registers and FPURegisters.
>> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_14.18.1.bb b/meta-=
oe/recipes-devtools/nodejs/nodejs_14.18.1.bb
>> new file mode 100644
>> index 000000000..b3b1ae445
>> --- /dev/null
>> +++ b/meta-oe/recipes-devtools/nodejs/nodejs_14.18.1.bb
>> @@ -0,0 +1,203 @@
>> +DESCRIPTION =3D "nodeJS Evented I/O for V8 JavaScript"
>> +HOMEPAGE =3D "http://nodejs.org"
>> +LICENSE =3D "MIT & BSD & Artistic-2.0"
>> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D6768abdfc4dae4fde59d6b4df9=
6930f3"
>> +
>> +DEPENDS =3D "openssl"
>> +DEPENDS:append:class-target =3D " qemu-native"
>> +DEPENDS:append:class-native =3D " c-ares-native"
>> +
>> +inherit pkgconfig python3native qemu
>> +
>> +COMPATIBLE_MACHINE:armv4 =3D "(!.*armv4).*"
>> +COMPATIBLE_MACHINE:armv5 =3D "(!.*armv5).*"
>> +COMPATIBLE_MACHINE:mips64 =3D "(!.*mips64).*"
>> +
>> +COMPATIBLE_HOST:riscv64 =3D "null"
>> +COMPATIBLE_HOST:riscv32 =3D "null"
>> +
>> +SRC_URI =3D "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz \
>> +           file://0001-Disable-running-gyp-files-for-bundled-deps-nod=
ejs14.patch \
>> +           file://0003-Install-both-binaries-and-use-libdir-nodejs14.=
patch \
>> +           file://0004-v8-don-t-override-ARM-CFLAGS.patch \
>> +           file://big-endian.patch \
>> +           file://mips-warnings.patch \
>> +           file://mips-less-memory-nodejs14.patch \
>> +           file://0001-jinja-tests.py-add-py-3.10-fix-nodejs14.patch =
\
>> +           file://CVE-2022-32212.patch \
>> +           file://CVE-2022-35255.patch \
>> +           file://CVE-2022-43548.patch \
>> +           "
>> +SRC_URI:append:class-target =3D " \
>> +           file://0002-Using-native-binaries-nodejs14.patch \
>> +           "
>> +SRC_URI:append:toolchain-clang:x86 =3D " \
>> +           file://libatomic-nodejs14.patch \
>> +           "
>> +SRC_URI:append:toolchain-clang:powerpc64le =3D " \
>> +           file://0001-ppc64-Do-not-use-mminimal-toc-with-clang-nodej=
s14.patch \
>> +           "
>> +SRC_URI[sha256sum] =3D "3fa1d71adddfab2f5e3e41874b4eddbdf92b65cade4a4=
3922fb1e437afcf89ed"
>> +
>> +S =3D "${WORKDIR}/node-v${PV}"
>> +
>> +# v8 errors out if you have set CCACHE
>> +CCACHE =3D ""
>> +
>> +def map_nodejs_arch(a, d):
>> +    import re
>> +
>> +    if   re.match('i.86$', a): return 'ia32'
>> +    elif re.match('x86_64$', a): return 'x64'
>> +    elif re.match('aarch64$', a): return 'arm64'
>> +    elif re.match('(powerpc64|powerpc64le|ppc64le)$', a): return 'ppc=
64'
>> +    elif re.match('powerpc$', a): return 'ppc'
>> +    return a
>> +
>> +ARCHFLAGS:arm =3D "${@bb.utils.contains('TUNE_FEATURES', 'callconvent=
ion-hard', '--with-arm-float-abi=3Dhard', '--with-arm-float-abi=3Dsoftfp'=
, d)} \
>> +                 ${@bb.utils.contains('TUNE_FEATURES', 'neon', '--wit=
h-arm-fpu=3Dneon', \
>> +                    bb.utils.contains('TUNE_FEATURES', 'vfpv3d16', '-=
-with-arm-fpu=3Dvfpv3-d16', \
>> +                    bb.utils.contains('TUNE_FEATURES', 'vfpv3', '--wi=
th-arm-fpu=3Dvfpv3', \
>> +                    '--with-arm-fpu=3Dvfp', d), d), d)}"
>> +GYP_DEFINES:append:mipsel =3D " mips_arch_variant=3D'r1' "
>> +ARCHFLAGS ?=3D ""
>> +
>> +PACKAGECONFIG ??=3D "brotli icu zlib"
>> +
>> +PACKAGECONFIG[ares] =3D "--shared-cares,,c-ares"
>> +PACKAGECONFIG[brotli] =3D "--shared-brotli,,brotli"
>> +PACKAGECONFIG[icu] =3D "--with-intl=3Dsystem-icu,--without-intl,icu"
>> +PACKAGECONFIG[libuv] =3D "--shared-libuv,,libuv"
>> +PACKAGECONFIG[nghttp2] =3D "--shared-nghttp2,,nghttp2"
>> +PACKAGECONFIG[shared] =3D "--shared"
>> +PACKAGECONFIG[zlib] =3D "--shared-zlib,,zlib"
>> +
>> +# We don't want to cross-compile during target compile,
>> +# and we need to use the right flags during host compile,
>> +# too.
>> +EXTRA_OEMAKE =3D "\
>> +    CC.host=3D'${CC}' \
>> +    CFLAGS.host=3D'${CPPFLAGS} ${CFLAGS}' \
>> +    CXX.host=3D'${CXX}' \
>> +    CXXFLAGS.host=3D'${CPPFLAGS} ${CXXFLAGS}' \
>> +    LDFLAGS.host=3D'${LDFLAGS}' \
>> +    AR.host=3D'${AR}' \
>> +    \
>> +    builddir_name=3D./ \
>> +"
>> +
>> +python do_unpack() {
>> +    import shutil
>> +
>> +    bb.build.exec_func('base_do_unpack', d)
>> +
>> +    if 'ares' in d.getVar('PACKAGECONFIG'):
>> +        shutil.rmtree(d.getVar('S') + '/deps/cares', True)
>> +    if 'brotli' in d.getVar('PACKAGECONFIG'):
>> +        shutil.rmtree(d.getVar('S') + '/deps/brotli', True)
>> +    if 'libuv' in d.getVar('PACKAGECONFIG'):
>> +        shutil.rmtree(d.getVar('S') + '/deps/uv', True)
>> +    if 'nghttp2' in d.getVar('PACKAGECONFIG'):
>> +        shutil.rmtree(d.getVar('S') + '/deps/nghttp2', True)
>> +    if 'zlib' in d.getVar('PACKAGECONFIG'):
>> +        shutil.rmtree(d.getVar('S') + '/deps/zlib', True)
>> +}
>> +
>> +# V8's JIT infrastructure requires binaries such as mksnapshot and
>> +# mkpeephole to be run in the host during the build. However, these
>> +# binaries must have the same bit-width as the target (e.g. a x86_64
>> +# host targeting ARMv6 needs to produce a 32-bit binary). Instead of
>> +# depending on a third Yocto toolchain, we just build those binaries
>> +# for the target and run them on the host with QEMU.
>> +python do_create_v8_qemu_wrapper () {
>> +    """Creates a small wrapper that invokes QEMU to run some target V=
8 binaries
>> +    on the host."""
>> +    qemu_libdirs =3D [d.expand('${STAGING_DIR_HOST}${libdir}'),
>> +                    d.expand('${STAGING_DIR_HOST}${base_libdir}')]
>> +    qemu_cmd =3D qemu_wrapper_cmdline(d, d.getVar('STAGING_DIR_HOST',=
 True),
>> +                                    qemu_libdirs)
>> +    wrapper_path =3D d.expand('${B}/v8-qemu-wrapper.sh')
>> +    with open(wrapper_path, 'w') as wrapper_file:
>> +        wrapper_file.write("""#!/bin/sh
>> +
>> +# This file has been generated automatically.
>> +# It invokes QEMU to run binaries built for the target in the host du=
ring the
>> +# build process.
>> +
>> +%s "$@"
>> +""" % qemu_cmd)
>> +    os.chmod(wrapper_path, 0o755)
>> +}
>> +
>> +do_create_v8_qemu_wrapper[dirs] =3D "${B}"
>> +addtask create_v8_qemu_wrapper after do_configure before do_compile
>> +
>> +LDFLAGS:append:x86 =3D " -latomic"
>> +
>> +# Node is way too cool to use proper autotools, so we install two wra=
ppers to forcefully inject proper arch cflags to workaround gypi
>> +do_configure () {
>> +    export LD=3D"${CXX}"
>> +    GYP_DEFINES=3D"${GYP_DEFINES}" export GYP_DEFINES
>> +    # $TARGET_ARCH settings don't match --dest-cpu settings
>> +    python3 configure.py --prefix=3D${prefix} --cross-compiling \
>> +               --without-dtrace \
>> +               --without-etw \
>> +               --dest-cpu=3D"${@map_nodejs_arch(d.getVar('TARGET_ARCH=
'), d)}" \
>> +               --dest-os=3Dlinux \
>> +               --libdir=3D${D}${libdir} \
>> +               ${ARCHFLAGS} \
>> +               ${PACKAGECONFIG_CONFARGS}
>> +}
>> +
>> +do_compile () {
>> +    export LD=3D"${CXX}"
>> +    install -Dm 0755 ${B}/v8-qemu-wrapper.sh ${B}/out/Release/v8-qemu=
-wrapper.sh
>> +    oe_runmake BUILDTYPE=3DRelease
>> +}
>> +
>> +do_install () {
>> +    oe_runmake install DESTDIR=3D${D}
>> +
>> +    # wasn't updated since 2009 and is the only thing requiring pytho=
n2 in runtime
>> +    # ERROR: nodejs-12.14.1-r0 do_package_qa: QA Issue: /usr/lib/node=
_modules/npm/node_modules/node-gyp/gyp/samples/samples contained in packa=
ge nodejs-npm requires /usr/bin/python, but no providers found in RDEPEND=
S:nodejs-npm? [file-rdeps]
>> +    rm -f ${D}${exec_prefix}/lib/node_modules/npm/node_modules/node-g=
yp/gyp/samples/samples
>> +}
>> +
>> +do_install:append:class-native() {
>> +    # use node from PATH instead of absolute path to sysroot
>> +    # node-v0.10.25/tools/install.py is using:
>> +    # shebang =3D os.path.join(node_prefix, 'bin/node')
>> +    # update_shebang(link_path, shebang)
>> +    # and node_prefix can be very long path to bindir in native sysro=
ot and
>> +    # when it exceeds 128 character shebang limit it's stripped to in=
correct path
>> +    # and npm fails to execute like in this case with 133 characters =
show in log.do_install:
>> +    # updating shebang of /home/jenkins/workspace/build-webos-nightly=
/device/qemux86/label/open-webos-builder/BUILD-qemux86/work/x86_64-linux/=
nodejs-native/0.10.15-r0/image/home/jenkins/workspace/build-webos-nightly=
/device/qemux86/label/open-webos-builder/BUILD-qemux86/sysroots/x86_64-li=
nux/usr/bin/npm to /home/jenkins/workspace/build-webos-nightly/device/qem=
ux86/label/open-webos-builder/BUILD-qemux86/sysroots/x86_64-linux/usr/bin=
/node
>> +    # /usr/bin/npm is symlink to /usr/lib/node_modules/npm/bin/npm-cl=
i.js
>> +    # use sed on npm-cli.js because otherwise symlink is replaced wit=
h normal file and
>> +    # npm-cli.js continues to use old shebang
>> +    sed "1s^.*^#\!/usr/bin/env node^g" -i ${D}${exec_prefix}/lib/node=
_modules/npm/bin/npm-cli.js
>> +
>> +    # Install the native binaries to provide it within sysroot for th=
e target compilation
>> +    install -d ${D}${bindir}
>> +    install -m 0755 ${S}/out/Release/torque ${D}${bindir}/torque
>> +    install -m 0755 ${S}/out/Release/bytecode_builtins_list_generator=
 ${D}${bindir}/bytecode_builtins_list_generator
>> +    if ${@bb.utils.contains('PACKAGECONFIG','icu','true','false',d)};=
 then
>> +        install -m 0755 ${S}/out/Release/gen-regexp-special-case ${D}=
${bindir}/gen-regexp-special-case
>> +    fi
>> +    install -m 0755 ${S}/out/Release/mkcodecache ${D}${bindir}/mkcode=
cache
>> +    install -m 0755 ${S}/out/Release/node_mksnapshot ${D}${bindir}/no=
de_mksnapshot
>> +}
>> +
>> +do_install:append:class-target() {
>> +    sed "1s^.*^#\!${bindir}/env node^g" -i ${D}${exec_prefix}/lib/nod=
e_modules/npm/bin/npm-cli.js
>> +}
>> +
>> +PACKAGES =3D+ "${PN}-npm"
>> +FILES:${PN}-npm =3D "${exec_prefix}/lib/node_modules ${bindir}/npm ${=
bindir}/npx"
>> +RDEPENDS:${PN}-npm =3D "bash python3-core python3-shell python3-datet=
ime \
>> +    python3-misc python3-multiprocessing"
>> +
>> +PACKAGES =3D+ "${PN}-systemtap"
>> +FILES:${PN}-systemtap =3D "${datadir}/systemtap"
>> +
>> +BBCLASSEXTEND =3D "native"
>> --
>> 2.40.0
>>

