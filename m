Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D38B0C433F5
	for <webhook@archiver.kernel.org>; Thu, 24 Feb 2022 19:03:48 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web08.711.1645729428034959464
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Feb 2022 11:03:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=J9GmC3bq;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=90546d8fae=randy.macleod@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 21OITIdm002241
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Feb 2022 11:03:47 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=message-id : date
 : subject : from : to : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=Pu3yBVyk4OvsiQPbs1k28B2hyYU/5Anl47rPoPDYuRo=;
 b=J9GmC3bqBU9CeUZNSakaKgE4ddTy2MA/3NcFPDJbwQBxi2kbVnNkS8KcsvdhE8F9U7Dx
 MAmbCpF0+FXG4CDoci7PthUhYschhIWHvd/uDdfF8oK6KRPJDGFVLcYWplIWB6DMV53P
 EzwDpCsDRubNjXtZDeYdjjqKnyCQ/qA49LzFAWMMeiO7mAP5S6v/P2/7azQ9uyL9J+VQ
 WQR+pdMbEN8r41t6UYMeNsHCD4rT4uWY9muwt6pekfBPw0eZ2z5I7yzkuurn2KA665gM
 RFurJNiNkCgBN9L9Yxo7h7ZKQUP9505aEY83d4O9lGTV+iNUBs80XH2V9aTmXAPctYY1 BQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ee5v10k07-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Feb 2022 11:03:47 -0800
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 21OJ3lsN016547
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Feb 2022 11:03:47 -0800
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2104.outbound.protection.outlook.com [104.47.58.104])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ee5v10k06-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Feb 2022 11:03:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FQI2/Z05uYRJV0t3x3NZSfK+Ky+iuAPfkhb6h+tNtUusqJ48DUyV1aVTWwILugnwmBBiw1YVNvq7n3rqsAxsjihCIPRN5pzQUy7ttEn3drrSparfM1tL/Ra0N0FgkiQw4J7eNAdntqTHTBS4rTaaeugbPfbCGpQIMuQAYYVWpjflhvaYUhoSlunP1JcgIMTQTSDPzZ5Gs5bTvIXh19DsBU72gSQ4NaC+dXbomR4RRKkQrlyFaRM9kcESjzKRMvosUU1hAiKhFhehlOGgcA3a520jZnDQiu2WclhUS4ML9p+AcN8BHuC8gidX4aVrMbhray0xltF50iUrY6lImpAGhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pu3yBVyk4OvsiQPbs1k28B2hyYU/5Anl47rPoPDYuRo=;
 b=FvlvM+R9wr5oFyV0kcaQG+37iU2Be5ZbQSeQ+MntnGi/Gt9zbuOIj/gIXfgAxQsu+boaJxWhoK2ngGlBirHjHre17IwwxArorBBQbXr8UcKetHfg0mWhXz83fNWtnymbwn+I2tY29/d3eEfe9iFuDPyHTSbgW/4nTl8rXXGpw19B5MoJyKLlGpns/nMjnlZ6gMGTJd8pxwxPb1+AaLBwiBqCSUQp42cAlVUuHx3IAXwCu/vftNlWkdSCH5N+uasDBhyU/2uR1ZeTFpc1WNopY2bxMny1qfir68xpRMspW/4aEoBJSFSeMR6cPGwDIw+ueujSdn1CB6S2ymESUgQspg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by SA2PR11MB5147.namprd11.prod.outlook.com (2603:10b6:806:118::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.24; Thu, 24 Feb
 2022 19:03:44 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::fca9:1fa9:6fdd:9dee]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::fca9:1fa9:6fdd:9dee%5]) with mapi id 15.20.4995.027; Thu, 24 Feb 2022
 19:03:44 +0000
Message-ID: <cc12865c-8e98-a956-e68f-f51b52040618@windriver.com>
Date: Thu, 24 Feb 2022 14:03:40 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [oe] Please provide YP bugzilla comments when encountering bugs.
 -- IGNORE this one, see next.
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
To: Yocto discussion list <yocto@yoctoproject.org>,
        "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
References: <16D6CD740869462D.9371@lists.openembedded.org>
In-Reply-To: <16D6CD740869462D.9371@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0176.namprd03.prod.outlook.com
 (2603:10b6:a03:338::31) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 044b17aa-f6fb-45e9-fd8a-08d9f7c860bd
X-MS-TrafficTypeDiagnostic: SA2PR11MB5147:EE_
X-Microsoft-Antispam-PRVS: 
	<SA2PR11MB5147DCBF8F5619BE78527432F83D9@SA2PR11MB5147.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	JmrDREEtb2+MWI5AuaqBGdFvoeIxWDIkmyyFszsvYCpV7/60oaTtd9DlFlR0BebVKCqH2s7rcpe5J880GqUQv9TAzodAwCsB6y6b2t9aljxNf2+SYjr5TKP4N00lD4cHsnxYRlfvIrR38wfES2z07i295UKnK3mE2pLO8qRS5ygWqIWPl7ce/YH/JA3zFFefrSKL5KEehQyXcKepIPdRHP8sxtDfVe9gM/AUZaXnbPBwHuW/oDseoaT1PFf0nSj8dlGFIZ6Ub5KmxvWCzm615NkMK92f0CMt/EeeUqEkH2Wi6I0cK8RochXJa51L642PqOxwDkWu4oRmMi0MEa9RbdqazTQXfSoRc+xxdfPaCwKs41EWGyLKZYah0qk+UNU7BW2IngFxvTuNn8XduAXtrpcSTSQ3YHs5pGgDlVUPNqUc5Q8MyS5GudMyFuOHzSgbwwlNO41Nie2Q2omyhisuSfGZ9GKfRdII9W0RCAdFBgIRkWr+RRUQT4M6RNINHQHXpYxIMTVOhDoNJNHnq9fJaJ2ixdiP+U1+D0KJ0On1yd64+eUsJUER6vCfFO0WcT+Rcm7PSp87XkWhv2B1BbRnO020ayru75fXkpVeuGg+0f7PP4XqQ/ORCazUS2uvqNnPOVzFqHRaGi0a7hPixXoaw0I/pexm30xYWYaiKHmMSN54HGi1rVmuylc0clD6eC+ohqCSaLwRmpoRZi+Y6SxD0WVFve/dqlS/Ij7ugdtXzXcZZo4MMy3h/8CEgi9an7Cou46bZBB/KP9rKBICdkZ+AjP5+2rb4LsCIXpvke5hgwsi+bPlPCwD28ZGbaZQnoPkKGdd4PtOodN6G2nD8n1PPWllxIMVs5Hswjy52TfEXmUy/lOpUs8ZdaNN7VT1SOxOo/jtmeV5LJdzEjnyPOVnew==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(2616005)(36756003)(8676002)(83380400001)(26005)(6512007)(8936002)(186003)(31696002)(38100700002)(38350700002)(31686004)(5660300002)(2906002)(508600001)(53546011)(52116002)(66476007)(966005)(66556008)(66946007)(6486002)(86362001)(316002)(6506007)(110136005)(6666004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ejdyeG1FaWJKQ28yNEVOWXhyMnR5Q3krMmpxSFBROXBYMnVYc25vbE9TVGE2?=
 =?utf-8?B?SHdWNSsxOFdOcFUzT0d1WmRBOVIraHJ2QllVSmJ3Y2lLZURiL3FyUG5LTEtV?=
 =?utf-8?B?RTNyaS8ycy9SMjhkYUE5bmw3RHZvTVpDZVp6K1pwbXRFQlpWTDlVSlU4U3pi?=
 =?utf-8?B?cW5mdXp3WnJlNjR4Tm91V3kwSU43SWZodUtuUG4vTk1BTVJKOXNkMEFuVTg5?=
 =?utf-8?B?bVdjQW01aHB2M1h4NElFbVA1K2Y4RG9ua0o3WnppSkZaTkMwVlRmV1ZpaS9z?=
 =?utf-8?B?anA5bFgyYytYZnRoMzd1TXRSZGRidkRFMXF3N2ZjbTZGVWRwT0QzT2hnUWlB?=
 =?utf-8?B?ZTRQd2lLbEFDVlVSQ0g5dTlqaisxOHpEM3dNNHdaemJOYktpYnRyOHY4amEx?=
 =?utf-8?B?UXErdFZxZnEvZyt5QloraXpUamN6aWNqdnBEdTZIOG9LMnFHYzJwK2hVRTV5?=
 =?utf-8?B?RWRDb2I1N2pYY0tJdFVFMCtBZ0xXOUdwVFNhQnRZbzZzWDFDUDJoSlZUZW5k?=
 =?utf-8?B?eGFWbTV3ZXBZT3NjcWZCZWJ3MWVxTDlQdjUyRlRzYk1ReHEwMWc5dC8zUWla?=
 =?utf-8?B?aVpzd3RvL04zUEFoQ0pKSG9iVkUrNzBtOGlHekRUbUFFNUJrQTBmbFpLZVI5?=
 =?utf-8?B?SGszQlY3bG1Md1VlTmpWa1ZGUm1YQ3V2N1ZJd1EwRjR5eUxQRzFTOXNtRzJG?=
 =?utf-8?B?bE05OXFDajJMS2Q3bU51Q09MdHdJcWVxd1kvMHlkSG5ia3FwMTVuSVA4TUdE?=
 =?utf-8?B?RmJ4cDVqTjY3clJ2cVdWNnEzQmtpVUNtTzlzM3AyLzNXb3A0bUR4M2tkc0Jk?=
 =?utf-8?B?UzhJZDV5WEJrQnFaVGYrdmdiaGc4cEoxdURhUDFZQ3cvb2J0ZHJ0NDErTXN5?=
 =?utf-8?B?SWhhTWtUYTlTMjZlNUc4N1g4UWY3QUo5RnNVOVNiZ2pudU5xT3p6Wm5Xdkh5?=
 =?utf-8?B?cnlnbk1hTnJ6Wm5XYTFlR3NuSEZINCsyRllwTUI3UzNiSE8vbEdCWk5zcFFu?=
 =?utf-8?B?b3ZDdlVtdjZCS0JjNklSUmN3NDFsUGFmOWI0QXZGVkVpUUhETUpUbUJIZjNI?=
 =?utf-8?B?VzBhQzl0cTBGVS9VM0gvVUFmd21lUTJwTGIzdXI3Q0RVbHBaL1lzb2dVTjNs?=
 =?utf-8?B?RVNuN0JPUTN2SlNMUjVoYktwUDJCYUlOdTFuZGtSc0c0cXdHblQ4SVpXa1l6?=
 =?utf-8?B?Q2ZVUnF6ejNvQU5uSjYxSTJuSDJHVU5WMTlzZ09MVmE1NVhHZDlsYklxVDV5?=
 =?utf-8?B?OTQ4UXNsbEJPNG9CSktPTzFMa21xbFZraGM3OWpnQ2tLUWltaHVRbjFtSFhD?=
 =?utf-8?B?azNMNUhHTUpGa3ZWbnp1a1Z1MTFHRHJOTmU4VGkwTEtQOVRwbVlDMEdzSUFM?=
 =?utf-8?B?akJ3NmxGNmFKa0E1MGkrdXJTRDdvb1dQWlpCVFZub2ZuYlU4Z1lhenhzSld5?=
 =?utf-8?B?bU55YTR0dnA4azlNRjl4a3R1dkR4ZGdzeDhCMFdVTTNKdWphQTF3WXd2RURY?=
 =?utf-8?B?U2dBeDVkOVUreVFlYTZmT2QwcmpnMW1SRE9OdDFmcC9vTnlnRUlhY0YzVGdB?=
 =?utf-8?B?NWc5ZUZtVXZQRXVsTnVvb1hEMXhnc0NqR2lVeVdqYWpqb3lhUTZtYlNMRlpU?=
 =?utf-8?B?Q3M4WDRzTERUQjRGVjZNTnlvaFhYUkd0OUsvNGo1cWJFWGwycHArQjFtOW5p?=
 =?utf-8?B?cUhlTXM5TWhQZVBCOFZiNzVxMkRPVEVCWmo0K1NxRnNaTzJLQzFUQ3FqVHJJ?=
 =?utf-8?B?ejhsaGdibVI1alZMTytBclkxZUFGdCtkb2xqcis0elFpTFFjNytOYmVKdi82?=
 =?utf-8?B?V1E0Sm9TRzdTbEs4NjFJaCtUM1BoZnJ2OElib0duS05EM1RsandtOWhKZWlh?=
 =?utf-8?B?cnBQY25wUlJWTzc3NlhOUEVZZldYa3ZjeCtmQzZ1TzhWSzhTR3JiUHA2NlEy?=
 =?utf-8?B?TGtnbXF0UWtJWFVxRVFFOHN2WnVmNTlMNjBRakdDa3RnYjZ2ZjVXSS9YVWd6?=
 =?utf-8?B?TzBFM0Qwc2hZRm5nS0JqNkVYN0g0WllrZE9md1A5clNSZXgrWk5GYm5abFpR?=
 =?utf-8?B?Mmp5YVRHdTJQY0l3ejUyMzBzeUxMY0xuenVTd3U3b1dzV3lHWHFaZWVtbnp6?=
 =?utf-8?B?ZDZBSFZQWWNtMTZCWURtOG1HOC94bVFOSVBub2NFWHROZ2g0aHZxdjI5dkZ1?=
 =?utf-8?B?NHNlS1llWlNoNFNPYzJHWjE4NWtqSGpHaTVYdjBES08xZWhBbEZxMHVLQWJX?=
 =?utf-8?Q?DrMS2AARj8Oz1Wu8fP8XMW8clTBfkSycO4B8FlxJh4=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 044b17aa-f6fb-45e9-fd8a-08d9f7c860bd
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2022 19:03:43.9625
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 FwIgFfOihVwh/E5i6Q+2TtTAYvdQ+aMRScTvk8Ilk7ydJiuFcbCtE3tHt9oFULeaPUh624UfmdHSC3G+bjfQMj2143JgvwR2qE14opVY0qE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5147
X-Proofpoint-ORIG-GUID: PnAVpxWtoAlLUSJL-x5Z--tCVnfOGHwe
X-Proofpoint-GUID: EMm48c54gYN1Zk7hcJrA2N4FkoOncrJm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-02-24_04,2022-02-24_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0
 lowpriorityscore=0 spamscore=0 mlxscore=0 clxscore=1015 mlxlogscore=920
 impostorscore=0 priorityscore=1501 bulkscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202240106
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Feb 2022 19:03:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95512

I clicked send but then cancelled.
See the next email from me with this subject.

../Randy


On 2022-02-24 13:50, Randy MacLeod wrote:
> Hello,
> 
> Summary:
> ======
> 
> If you encounter a bug when using a Yocto layer, please check if it's 
> already reported
> in the Yocto Bugzilla. If it's not, open an new bug. If it is, please 
> add a comment
> stating that you are also affected and provide any additional relevant 
> details.
> 
> https://bugzilla.yoctoproject.org/
> 
> Details:
> =====
> 
> Some bugs are only happening occasionally even on the Yocto autobuilder so
> we'd like to encourage people to provide input so that people working on 
> the
> bug or prioritizing bugs can make more informed decisions.
> 
> For example, this bug:
> 
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=14726AB-INT-NET: fetch 
> failure in fetch.Fetch.test_git_mirrors
> 
> involves a fetch error for dbus-wait
> 
> 
> -- 
> # Randy MacLeod
> # Wind River Linux
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#95510): https://lists.openembedded.org/g/openembedded-devel/message/95510
> Mute This Topic: https://lists.openembedded.org/mt/89371980/3616765
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [randy.macleod@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
# Randy MacLeod
# Wind River Linux


