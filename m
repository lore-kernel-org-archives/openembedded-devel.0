Return-Path: <kai.kang@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC703C3DA7A
	for <webhook@archiver.kernel.org>; Mon, 26 Dec 2022 01:01:36 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.127813.1672016491496562452
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 25 Dec 2022 17:01:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=U6NiJaq9;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9359e27213=kai.kang@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2BQ11UG3002439
	for <openembedded-devel@lists.openembedded.org>; Mon, 26 Dec 2022 01:01:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=message-id : date
 : subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=48VZtw3/KRK+SdxTy217fsbKjOR/NyCdGNbT5D3F6Ig=;
 b=U6NiJaq9LsQsfk9Hul96+kjJLM07vt6fF9aeIBMxfXK5twWNGZq2K5ODbGxZmMALZo8e
 HrmbJDQbfQjEVIJm1ouQ7GPI1rMmKeMX0wGHI9chDqepj4/5btMpXM9sP0eqkJ8F0yQ0
 K39+yGffQhO/7lRB/t6/7/MLZLEMRvBrbXK+F7M7lqw7ahFbi1UrdsGpMlhQd9PIDEf0
 utwZfjW6hDhIiFF91Ci/Ox/6mVIDpzuxW29owotVZkuaDsHYKTM5RmIwtgWrh/whznzH
 CLp01dPMAQ2aA4jciAhVTHs/yBtMPToA8h+AWd57PXFiX4yZLOHylAcOxqcKLH5pVYRU 8g== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3mnpn30yae-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 26 Dec 2022 01:01:30 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2BQ11TCT002434
	for <openembedded-devel@lists.openembedded.org>; Mon, 26 Dec 2022 01:01:29 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2107.outbound.protection.outlook.com [104.47.58.107])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3mnpn30yad-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Dec 2022 01:01:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g/0SKIiq4qEw5td+A3XQpZ+jacdpw5HZOQEG8X4w4Px2ypFL0zkPgqeylN28CpmTQEwNukYZI6xsRgi1JoqOgAXd2BC2x1VSjvlDs7F1QDz+HPuoQP9oQu+haY/QS/iyY5sz7sg3Nh9cQHxdSo/f+xZR2iDbuFjy7qMG85YQhLJb6ThPe1IEBNBje/oK3O7d+uvA81VvPLPhe//Hi4+BRlmJZ0KXwq/t1fxX+GHISTfFKuodVdRuNi0T95YrO+i0svq0CxQyTvUdL5Na8izJC0x3puMA+5CSuXWW4mQLBpBRzE1Kz62dTSLH2a2O3oZwH4YHjJCQ6z1LAUGLuvDtfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=48VZtw3/KRK+SdxTy217fsbKjOR/NyCdGNbT5D3F6Ig=;
 b=VRAL3s5ndnhP+igOTcLZYWp8bPaUXuadiVPJzsYA8xjK2AOcBrZV1K+i/YUzMBDjWmQgnqaebXuR5LbqGCaDroliIr0yHuV3IlG7I0H7mTCiXpr6obiqfRe1QqriPnOCXgCqjTCmDpStG+LVxd34KXD5P+8joNWaqmcFTBxBHmKsvC4qT06kSalpWVeHiK7X/WPGJudujaoJwfv79xgPC+7+hAGiphIxKSynWARKl5JbuBdZqNFbOUCAN54jig+K4Pk4fmExMv0IJLOTAgDb05mU9+gLRG7A3x4LhNwWSVfqHY6/B2qY+72LHBP3M25Z9PhtB/tUq55NrbRJGXNBOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS7PR11MB6064.namprd11.prod.outlook.com (2603:10b6:8:77::14) by
 BN9PR11MB5483.namprd11.prod.outlook.com (2603:10b6:408:104::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.16; Mon, 26 Dec
 2022 01:01:27 +0000
Received: from DS7PR11MB6064.namprd11.prod.outlook.com
 ([fe80::8397:585:1500:c7f1]) by DS7PR11MB6064.namprd11.prod.outlook.com
 ([fe80::8397:585:1500:c7f1%8]) with mapi id 15.20.5944.014; Mon, 26 Dec 2022
 01:01:27 +0000
Message-ID: <c24b48cb-4c80-c5cc-ac6d-4a911f7ec3b7@windriver.com>
Date: Mon, 26 Dec 2022 09:01:23 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [oe] [meta-xfce][PATCH 00/16] Update core xfce components to
 4.18.0
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>, Kai Kang <kai.kang@eng.windriver.com>
Cc: schnitzeltony@gmail.com, openembedded-devel@lists.openembedded.org
References: <20221224213347.39959-1-kai.kang@windriver.com>
 <CAMKF1srPffhVDHQ4-RfkmK+OhebrLc5Xc232RAVvDmMb5ao-Yw@mail.gmail.com>
From: Kai <kai.kang@windriver.com>
In-Reply-To: <CAMKF1srPffhVDHQ4-RfkmK+OhebrLc5Xc232RAVvDmMb5ao-Yw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0176.namprd03.prod.outlook.com
 (2603:10b6:a03:338::31) To DS7PR11MB6064.namprd11.prod.outlook.com
 (2603:10b6:8:77::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB6064:EE_|BN9PR11MB5483:EE_
X-MS-Office365-Filtering-Correlation-Id: 0617245c-22ac-4426-609f-08dae6dcb7cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	k9xEsWvlQArqHpFy3heSmFNkXoYGHMnbsztyv7DPa8H7Ers6J06iPW2JnquHuvhbiFWnEpOlf07FfNg68JVKi00GCfVXZ2uVqU+AMT6c3x3z3TWVezyY2dekbb0WMYli1P3v9XtwqTxCgo/AT08QCeREJJLyV06JoPTe8Vip9jAyfxe6wK8O4qulCULjdZWvCxPKhTwThyosV8Yd9SB1sdcECQu/Htff8/O6PTL4NdWAPYGapLifVTF2J0mUoDARiUYO80Xt/AVS3WSITQEUKFB3tDnVQt85Gk55GlBNW2p949AqZH8OCOB7TJFHtpyzQS6gADU+2ZaUqn4c0WQXBr5amLO7INuguExgivOmJLQzLxbEwS5N7TJAEFD36vnblNi0fAK4mg4rgPzqZhJM29gXSS1ZjF1LAutqR75vzWDiFj9jNG74lpL1cxqGwHVSosM1Wta+Exf6yGthPmds6EvZqTH6uF53iAUvfZTZ/ele40QzSIVRUcoC583UsDbGzH+GxLGLR9ixl7CT5HNqy84l/oWQdGIoodntHe+/55kRaif7uhsZ/CcdSbJ1eWGJQkqt0BKlxj9vKUf/Ng1QVJI15KKG/nw4RuwW7yBd6tfc7/7JY9Xj641GCE1nMct3tjY9pzUi+QDpeSjQ2clXvdI2QxB6FevuFPaMqpiog23qT2uYF5AdR/DmSMtCIineAK0pcjxBDXIxVjnaJhfJELg4Rba6SWkskJ+IWtOMhJeHJqK3dcZbmB23M7w2REXGbf9PXfBemWr8BE0/SWiX6ppXkGtkQsireKZ2gh+CdXU=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR11MB6064.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(366004)(39840400004)(136003)(346002)(376002)(451199015)(66476007)(66946007)(66556008)(5660300002)(8676002)(66899015)(8936002)(15650500001)(31686004)(41300700001)(316002)(36756003)(6666004)(966005)(4326008)(478600001)(6486002)(110136005)(2906002)(6512007)(6506007)(186003)(26005)(2616005)(31696002)(86362001)(53546011)(83380400001)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WlFQZ3lNbXdPUVZBQjN4N1NiemNqa3JxYzdmOGkrVzZCQVFmOTN5NDNzc1ho?=
 =?utf-8?B?K0ZpNkY2NmVtMEpqb0pBWkp3Nld3anBwMWNhbHhPT2ljay9QRXMzK1hrY0l6?=
 =?utf-8?B?UndFRXRQU3ZjU0h3MVZXeGNaenRQcXJRVHJnMy8zM0RWOWhCZGZQNXp3c3Ju?=
 =?utf-8?B?YjNVclB6cEJsS0R1Y052STZWK3o4Zmg4b3hxTW82UGYvaHFCRXhLcXB2d2RJ?=
 =?utf-8?B?VElnUXQ1ZTJnbkRkWW9IdW1sVXBBYVFRRkNJTmxTVm9EclBSYkZOL29IWGdq?=
 =?utf-8?B?azdhWjBvOVpBdE9vNmkvRW1VamIrM09LUEdZaHFYSVhnRjZ1YmxoTTFUc3Fj?=
 =?utf-8?B?VDc2Z21SSzlXekY4MTUyZEJQRE9PTnpoK2x1b3h4UnVoc3RGL3g4azRCV1ZF?=
 =?utf-8?B?YmpYOXBpV2NtSW1vQ3lBRFl1eURrVEU5SGUzV2JFczYvS0g0cldUV0FGUFlz?=
 =?utf-8?B?eXpKaHYzbXBBeUNWWUlUV1ZDb01hd0tEL0FPeFczOEZlTWZyU3BaYi9SRDB1?=
 =?utf-8?B?UUx1SEhKSi9OaUFmVzZXQXpvenRZNzc2SEdLUkJ1ZDlYWVlDS0Z3cko5ZTZa?=
 =?utf-8?B?RmJpNTJ3Y0NtdXhpVGpVdngvT3JKeFVHc0lkSTZnODlLTmpGblJjU3BvMnBk?=
 =?utf-8?B?T251NVN6cnh4ekIvS3NmNWVMNy85QjFlaTFvS1NYRkVRSnV0N25zVTltUlJh?=
 =?utf-8?B?M1dVMnlZVjlnMkY5MEQwbnY5cEhLR0VFWXRDL2lKZGZpQ2pwSU5FQ01Dcy9Q?=
 =?utf-8?B?TlZUT2MwcUlOU1JYaHZQN056eFY1dEtuaFVhaWlZZEtxeWZ2c3UrWGt6eXp5?=
 =?utf-8?B?c0w2TzduWG91d3N0OElmejgzZU5XWStsWWtQb3M1TVpZK1BNSDRVSDU5M1A4?=
 =?utf-8?B?Z0xabnRvOGRUUGlLNDR1ZUE5Q1U0d0J2a3cvNXNpRTcrWDB6alBOQzNKajhK?=
 =?utf-8?B?aHh1cnFEUzJ6WXg1eWI2SmtaQjZhWmFJdzdDSUlNWjBKS29TcHFteDVtRWN5?=
 =?utf-8?B?Rlg5TUZGNEJwQ1hmTWFWZkdETTRwbWEvVmhyRDhQV0k0eTdmWEJJdHU0SEN3?=
 =?utf-8?B?SnNOMzlDWi9jcGIzZTNXb1dIR28yT25DcDNCU3VYT2RIRnpTVHV2QlpYZFg1?=
 =?utf-8?B?emNSUFU3NHFFWEZuMSs1M2RVSm8rcDlJQXNsdjRKdlhXQ1VQemFCZFYyOVkv?=
 =?utf-8?B?WC85cEdFbHNidlB6V3R4TlVvS2tac3R3TmZVcFJCU09VQ3l4MlBVZldsbklO?=
 =?utf-8?B?SjdJTkJSVUUwa01pZ0cwanBrS21sUDFrSVlPVzBnQmsrdnNRdWN0amxKNHZG?=
 =?utf-8?B?bVVaOHUvRXdlbGFKcUpIQ2JTdFQ2cHY1ZnB4NnFTUWg2UjZUaVNSY0lOZFg2?=
 =?utf-8?B?d1d1VUZXVUVCallkVmI4empkVG1yemMzTEhxS3djaTFFUFU3NHRwU1dlcW5R?=
 =?utf-8?B?a3grNzRnTDcrRHBRWjFjZVBhMm9WS0JPSVoxcWEzNTR1UHAycTFhSjJpdzJE?=
 =?utf-8?B?Umoxa01OS3htYndDQXZCRnBYZXBDT1FDN3NqT1Ivd3NZUGprTnByZE9nLzRz?=
 =?utf-8?B?YTNrdGhVR2FDUXMreGRZODh4UDd3QjRsVXFnRWVKSGNtalJzRHJXQWd0ZHRr?=
 =?utf-8?B?N2VtczZYSUdwajV3WklZa2dxSmFGMVJtY1hTRFZyTmdUKytxd3pzNEpuTnJu?=
 =?utf-8?B?NHlBMCs2R25XSC9JemV5YWNHV0xMRExMQjVVc1dSak1rOXM2Y3RCbDF0WnU2?=
 =?utf-8?B?d0dMOWJnK2R4NEh2aEtFQXZJdVd6ZnZVdmpuWEkyUUd6azFsVkFNZkVpQkRI?=
 =?utf-8?B?QjhBUFpWTzlDbE83akYrK0c5ZDZMQVBjbVRURUZsckxWSnRoMmttRWQ4d0FK?=
 =?utf-8?B?Qk5XclhWQ3JqQVpsZUVSRGpSL3UrNkI5bHc1Myt0ZFJYc2ZCTHB6RkwwN2lM?=
 =?utf-8?B?alNNZFcxUlY2WVJaaWpWRGdUOWpqSE8xWmRoblVtSTBlY2lqZGg3d0N1UGtz?=
 =?utf-8?B?K2tLenJqajFHTTViSldkcCtrMUZXbWhienFKNlk0bzRYRlRib0J2cUNycG5I?=
 =?utf-8?B?RkFFRThhbjJJOEdNcjdNY3VhMUNGbTU3Q2UzbzM1VzUrMFBZZ0xtem9FaWZy?=
 =?utf-8?Q?0Wffy2GrOTSCmJUvUcwueoy46?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0617245c-22ac-4426-609f-08dae6dcb7cc
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB6064.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Dec 2022 01:01:27.8726
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jdQPDBUo8CND+CwoNt5nT/7KTpnu2MuM2y7oiBbFTVfqwPpKhCrRFiRl0hHxBlnINGZcKVcHsewZy8XaVLbUXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5483
X-Proofpoint-ORIG-GUID: lI79gtJMQGC7JOmITuoq8CgqZjRrJgS8
X-Proofpoint-GUID: WGUSQQ2U6vwNPAj4MxouBXqc1QX1qGxX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-25_20,2022-12-23_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 bulkscore=0 mlxscore=0
 impostorscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 mlxlogscore=835 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2212260006
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 26 Dec 2022 01:01:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100231

On 12/26/22 01:56, Khem Raj wrote:
> Thanks for that patches. They fail to build see xfce related recipe
> failures here.
>
> https://errors.yoctoproject.org/Errors/Build/157414/

It seems all are qemumips related. I'll check them.

Kai

>
> On Sat, Dec 24, 2022 at 1:34 PM Kai Kang <kai.kang@eng.windriver.com> wrote:
>> From: Kai Kang <kai.kang@windriver.com>
>>
>>
>> Kai Kang (16):
>>    xfce4-dev-tools: 4.16.0 -> 4.18.0
>>    libxfce4util: 4.16.0 -> 4.18.0
>>    libxfce4ui: 4.16.1 -> 4.18.0
>>    exo: 4.16.4 -> 4.18.0
>>    garcon: 4.16.1 -> 4.18.0
>>    xfce4-panel: 4.16.3 -> 4.18.0
>>    thunar: 4.16.9 -> 4.18.0
>>    thunar-volman: 4.16.0 -> 4.18.0
>>    tumbler: 4.16.0 -> 4.18.0
>>    xfconf: 4.16.0 -> 4.18.0
>>    xfce4-appfinder: 4.16.1 -> 4.18.0
>>    xfce4-power-manager: 4.16.0 -> 4.18.0
>>    xfce4-session: 4.16.0 -> 4.18.0
>>    xfce4-settings: 4.16.5 -> 4.18.0
>>    xfdesktop: 4.16.0 -> 4.18.0
>>    xfwm4: 4.16.1 -> 4.18.0
>>
>>   .../recipes-xfce/exo/exo/configure.patch      | 57 ------------
>>   .../exo/exo/exo-no-tests-0.8.patch            |  9 +-
>>   .../reduce-build-to-exo-csource-only.patch    | 90 -------------------
>>   .../exo/{exo_4.16.4.bb => exo_4.18.0.bb}      |  5 +-
>>   .../{garcon_4.16.1.bb => garcon_4.18.0.bb}    |  2 +-
>>   ...xfce4ui_4.16.1.bb => libxfce4ui_4.18.0.bb} |  6 +-
>>   .../libxfce4util/libxfce4util_4.16.0.bb       |  9 --
>>   .../libxfce4util/libxfce4util_4.18.0.bb       |  9 ++
>>   ...lman_4.16.0.bb => thunar-volman_4.18.0.bb} |  6 +-
>>   .../{thunar_4.16.9.bb => thunar_4.18.0.bb}    |  8 +-
>>   .../{tumbler_4.16.0.bb => tumbler_4.18.0.bb}  |  9 +-
>>   ...er_4.16.1.bb => xfce4-appfinder_4.18.0.bb} |  6 +-
>>   ...ls_4.16.0.bb => xfce4-dev-tools_4.18.0.bb} | 14 +--
>>   ...t-display-desktop-icon-when-no-windo.patch | 15 ++--
>>   ...-panel_4.16.3.bb => xfce4-panel_4.18.0.bb} |  4 +-
>>   ....16.0.bb => xfce4-power-manager_4.18.0.bb} |  2 +-
>>   ...sion_4.16.0.bb => xfce4-session_4.18.0.bb} | 10 +--
>>   ...ngs_4.16.5.bb => xfce4-settings_4.18.0.bb} |  6 +-
>>   .../{xfconf_4.16.0.bb => xfconf_4.18.0.bb}    |  4 +-
>>   ...fdesktop_4.16.0.bb => xfdesktop_4.18.0.bb} |  4 +-
>>   .../{xfwm4_4.16.1.bb => xfwm4_4.18.0.bb}      |  4 +-
>>   21 files changed, 69 insertions(+), 210 deletions(-)
>>   delete mode 100644 meta-xfce/recipes-xfce/exo/exo/configure.patch
>>   delete mode 100644 meta-xfce/recipes-xfce/exo/exo/reduce-build-to-exo-csource-only.patch
>>   rename meta-xfce/recipes-xfce/exo/{exo_4.16.4.bb => exo_4.18.0.bb} (84%)
>>   rename meta-xfce/recipes-xfce/garcon/{garcon_4.16.1.bb => garcon_4.18.0.bb} (89%)
>>   rename meta-xfce/recipes-xfce/libxfce4ui/{libxfce4ui_4.16.1.bb => libxfce4ui_4.18.0.bb} (84%)
>>   delete mode 100644 meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.16.0.bb
>>   create mode 100644 meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.18.0.bb
>>   rename meta-xfce/recipes-xfce/thunar-volman/{thunar-volman_4.16.0.bb => thunar-volman_4.18.0.bb} (63%)
>>   rename meta-xfce/recipes-xfce/thunar/{thunar_4.16.9.bb => thunar_4.18.0.bb} (77%)
>>   rename meta-xfce/recipes-xfce/tumbler/{tumbler_4.16.0.bb => tumbler_4.18.0.bb} (80%)
>>   rename meta-xfce/recipes-xfce/xfce4-appfinder/{xfce4-appfinder_4.16.1.bb => xfce4-appfinder_4.18.0.bb} (54%)
>>   rename meta-xfce/recipes-xfce/xfce4-dev-tools/{xfce4-dev-tools_4.16.0.bb => xfce4-dev-tools_4.18.0.bb} (78%)
>>   rename meta-xfce/recipes-xfce/xfce4-panel/{xfce4-panel_4.16.3.bb => xfce4-panel_4.18.0.bb} (93%)
>>   rename meta-xfce/recipes-xfce/xfce4-power-manager/{xfce4-power-manager_4.16.0.bb => xfce4-power-manager_4.18.0.bb} (93%)
>>   rename meta-xfce/recipes-xfce/xfce4-session/{xfce4-session_4.16.0.bb => xfce4-session_4.18.0.bb} (82%)
>>   rename meta-xfce/recipes-xfce/xfce4-settings/{xfce4-settings_4.16.5.bb => xfce4-settings_4.18.0.bb} (85%)
>>   rename meta-xfce/recipes-xfce/xfconf/{xfconf_4.16.0.bb => xfconf_4.18.0.bb} (85%)
>>   rename meta-xfce/recipes-xfce/xfdesktop/{xfdesktop_4.16.0.bb => xfdesktop_4.18.0.bb} (77%)
>>   rename meta-xfce/recipes-xfce/xfwm4/{xfwm4_4.16.1.bb => xfwm4_4.18.0.bb} (90%)
>>
>> --
>> 2.17.1
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#100209): https://lists.openembedded.org/g/openembedded-devel/message/100209
>> Mute This Topic: https://lists.openembedded.org/mt/95868220/1997914
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>

-- 
Kai Kang
Wind River Linux


