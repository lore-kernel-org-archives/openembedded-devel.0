Return-Path: <mingli.yu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD5D5C6FA8B
	for <webhook@archiver.kernel.org>; Thu, 22 Sep 2022 07:47:54 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web08.4635.1663832864517555383
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Sep 2022 00:47:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com
 header.s=pps06212021 header.b=ccdhwamI;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=626430303a=mingli.yu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 28M7QYfH031684
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Sep 2022 07:47:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=message-id : date
 : subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=xcVqTJLKrDEfRkc37Z7LFqdXdxSafENQ34FfYQLd8iw=;
 b=ccdhwamIshkTbz6B6S2cEEt4oo6aks2bP58J+rVTWtJWduIHlhNYwTe3ZfeHBc0qoADh
 5md8/6vumPstHDB7c4wAdx+IS/Z3zZwVJ3sTn7N//9q6cl6os4SUXOk70WlXI1ZWeea0
 1sXlqveTza+nzuAMY/yTBqQDiV0QQVyNRjN1GMxEBEvNEazfMwVrEIoNfEJFJrKc13cK
 /laIypllDi78seIhuT3O7bV5u32/addp82cQuLY9lZCmYejMbeszdnrhaVypPAlmyiwA
 sTTyP+fWh06VAApYQSuiOwiPIUm3lGM7aHlCnJqb4mXmREDxQD8ZHyV+hdaMDjX+d701 aQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3jn57a475e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Sep 2022 07:47:43 +0000
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 28M7lhws007568
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Sep 2022 07:47:43 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam04lp2047.outbound.protection.outlook.com [104.47.74.47])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3jn57a475d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 Sep 2022 07:47:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jty4hyns5HY1wMCig5FEP+oYT6qccqwV7eyJTJrDAaCRiy/4JUmA7GXi0/68S4StnbkhDKGKagwZd/MdBuMDome/yElpAw1F8M/YZN+IqEMIa1GqK7Zv7I2TBIZpOF7NVgI9Wh5JTrvmf+aHR0JJ2/IiOk+udM3FfDbiSk/55GcbUGPX/U47Dy8Hea+jeIWWpd/QvhNv6qWvNvia6vPSyK1b8Nm1W4p5XRYKD9Hvppmbbbgkir2PbW20wmb1xYNq7SZYFdKjfX6g5ny8TH1/LACYuG3//XoaglzQk17j3cYdLyc6s0h4rgGCWIcrDaMDmPzlal9jUf/nhD08oV5l7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xcVqTJLKrDEfRkc37Z7LFqdXdxSafENQ34FfYQLd8iw=;
 b=BX3iCF2v3+LcETqjMa4oQBzAwVYXyJQXixQRAhS4TC1gL6NR3u25/+jlaEaeilhpq1gFbug6JG/hu3ER/Gk1aWYPAMUm4FeStao0ZeCmpwIUE4tLYvcmhyd26uW3Z23j1uthAttramh2dLbM2EWz5Ij2H6bjyZA1ARsaY1toDfB78GrAy5JTbVAhng7344F9erQN8JPdJm5X1zifOSdcTAzvMJcemCt10MiqEavEPNuy05MjkzmGhi7hBUNQeRv99HYtM8zdxrckN8Fky2LzHd5HlsWdI3zZmJMpHgjWoMNL09RmFrhWSeTvRhfv8JpD6Xtc4fWlk76KchJ8O9p0Wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 by CY5PR11MB6318.namprd11.prod.outlook.com (2603:10b6:930:3e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.18; Thu, 22 Sep
 2022 07:47:39 +0000
Received: from CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::1ce8:cf77:de7b:2203]) by CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::1ce8:cf77:de7b:2203%7]) with mapi id 15.20.5654.018; Thu, 22 Sep 2022
 07:47:39 +0000
Message-ID: <a524ac55-d370-24e6-a7f7-9af76acd8de8@windriver.com>
Date: Thu, 22 Sep 2022 15:47:30 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [oe] [meta-oe][PATCH 1/2] mariadb: Use qemu to run cross-compiled
 binaries
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>,
        =?UTF-8?B?Wm9sdMOhbiBCw7ZzesO2cm3DqW55?=
 =?UTF-8?Q?i?= <zboszor@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
References: <20210706065549.187176-1-zboszor@gmail.com>
 <CAMKF1srZS52Vt+YRVi-7WCzYOjBWAJH3Cy8PZCc2B8XgTgO2Xw@mail.gmail.com>
From: "Yu, Mingli" <mingli.yu@windriver.com>
In-Reply-To: 
 <CAMKF1srZS52Vt+YRVi-7WCzYOjBWAJH3Cy8PZCc2B8XgTgO2Xw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SG2PR06CA0226.apcprd06.prod.outlook.com
 (2603:1096:4:68::34) To CO1PR11MB5009.namprd11.prod.outlook.com
 (2603:10b6:303:9e::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5009:EE_|CY5PR11MB6318:EE_
X-MS-Office365-Filtering-Correlation-Id: 025ea983-5128-4513-e49a-08da9c6eb933
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	LsYaiOS3Z0ItgNbxgyYFO2UrlU6Wb3LNsqoK+OLrjDpGYXIdtdWRRDZLomYl34bHWcvgtYPUE2pqduOUYWgaAw09WMNNHViKS10BvvTBVcF8SD17jEhy7H/U4S1cqBvzv3WA5AxLArEHNpLFxWBBFfDAWDabo3agR8gJB7U4UDU8bqiBC5dMvf1Sc0pYXtdnMkoXTTOoHitI289TM1HpP4Bc2t6wwxr32pfsFdjImyGqSVOTX8WV1MJ4kUV3YMk+ZF1bdTVbyoyfoZSJAIMJLiDe0Nex8580dUMmN4whuez0/GBzRUFMBjm9fep/SwLt5qSO7sh49KS/rHDv7z5DaL/sE6CJ1uvfNgkZynBczlYvgo/uSzs0lxcaHtZ1aWre3NTk39rntf9xBFMWkRry/qbHimoZEdfIe5USqAbvDwLplVIO+J7/QpoGR7XIbCD8rU3Tf1dg9gJkg/vno1wbIa1YqL4K9qs2uQkbVpwT4GVuRr/M/HV5mzaQNEkP3d7s7LF1uH7Z2fZOk7VLkXT0qhqMdciENlU5tuPXh6xT4QQSII2avfSIy6QnKD01R9kQLHDw2rF9WKxFTNb0HzECVSZIkz2bepctMXsTjUBYoOxLpa67bNUX3g+vByV5uDP4+CEuN4MM7CO05OoGKDChs7oPVKkxB4YHdsOKopPQRZyQIN+tBhwNh0Xiuguh7pNUP0sGxo8kwTSHLn6T+8rAen5O/SD3Hj9gZ2Ee1lEukSTiBktX15GBaUDR+ahNRL6N55wg5XMrBLByTDmR1AHzwhns9cFj75C4QYHfoxHd0vpPgjvXNKwm8pQ++Zrxnwwo8eOGkypHHvHtoIsdnR7k49QwjzRIZ2SkIRSaQxB75EM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5009.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(136003)(366004)(376002)(396003)(39850400004)(451199015)(2616005)(36756003)(186003)(66574015)(6666004)(6512007)(41300700001)(30864003)(8936002)(26005)(2906002)(53546011)(5660300002)(6506007)(38100700002)(86362001)(83380400001)(31696002)(966005)(6486002)(316002)(478600001)(110136005)(31686004)(4326008)(66946007)(66556008)(8676002)(66476007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?alRrWlkycFBFaytVd1hlV0dLbDVjTXR3QzlpQTh6VFJiRHA5RDRJMGRVMCtl?=
 =?utf-8?B?WVdNYVpDTkVMeE5HZElNUTB6Nk1MUk9oVFdNSmZOYzFwTzdGU2VvWjVpZ2dz?=
 =?utf-8?B?TjRCSzhILzFZajB1NkV4eDdMbEFXRU4zbWVIWnBCa1R2NW1ZUm1ya3BQNXRR?=
 =?utf-8?B?K1BxUTBjUTBEcFQyOHIyQllLRTlYWm4zeDk1MjlWZ1hSTGk1b1dnaHRockRG?=
 =?utf-8?B?ZVdaNWNIV1AzemtjajQ0a2p1R0FCc0czaUlLelR0ZG5ZNDM3QlVYVDFkS0ZZ?=
 =?utf-8?B?SVY4dUhTMDhrWnMzemtIbUFOMm4wTXV3MXhCbGVPNHloV2FyU3ZBMTBDMmtz?=
 =?utf-8?B?eGpkQndSM0VDenJZclRLK2xRZE9TSXpnamVrMHRqU005M2pTWkd5QUJ1Q09z?=
 =?utf-8?B?Q2dwS0dyRmhZMVRpTEtjMjFRdytHcTVRU3VBQ3IwcVpMRC9mQnpoc0twdVVC?=
 =?utf-8?B?NkUrWEhwZktOVHBkL2lxRm5QS3FxeXVRcHczWEpkV2MzRUJMMjFkNjJvYjNG?=
 =?utf-8?B?M3F6UHNTZ1lZd1JMR085bDhNdVlnRWNoRG02TUxXWjgrYlVWcVZ1UEVGbWhE?=
 =?utf-8?B?R3grWUhZcEJ0RVhycDhnaE1FZlhINjFFamVmcXdSdXZ4THFGMnB2LzlJTkl2?=
 =?utf-8?B?ZXBuZ0dhS2U1dTZ4OGk1NitYQlFLcjJ3RHZialdtVEZkeTRPUEdSazduUm91?=
 =?utf-8?B?Wlo0TGpCM01yU0NUREppWlIxT1BTSlBCL1IvbnhFR3VtR1pzV1pkcS9DTjAz?=
 =?utf-8?B?NXVEWG50S2FVeU1YUzZUNE1UYjdQY1ZzeXEwYUhlMHJwOEd3SGh6VVQreVBl?=
 =?utf-8?B?bm4zVDFZbmwzb3FyNDl3MVBiRmI5TW9Dbm94cElkSVNOY0VDNGErRnNjWVVx?=
 =?utf-8?B?K1FVd0pxbE5rdU5ZVHlsR1B3cTRqWGM2cDFuOGsvRTMyWFk3T0JlU2pjWXBO?=
 =?utf-8?B?UG5Xa1ExVGM5Ujd3V0VHTGg5ZDkrK1o1dGRjV0RNQmlCdTJ1anhKM3MweVRP?=
 =?utf-8?B?alo0YktaZ3Ntc0hGVzB0elA3NUkxaDNZNTBkbHZBa1oxZWxGclNySk56cWs5?=
 =?utf-8?B?bWt0aWxQMllSQzlsWjhzVEc1WGF6b2dZWTMwTVdEeXNnN3VSbEVwL2FWZmlx?=
 =?utf-8?B?NHJWcjZpR1FpZnNXM0IwRDE5QTAzTUs0Z1Y2Z0FTMEFVbUVzblZXTHdKd2hq?=
 =?utf-8?B?aHRraHRhTS9zaGxab1phQVloYUUzOGh5anFPaXpOV2FNMkJmNlF0eE00dndE?=
 =?utf-8?B?TlA1TDg2VFl1MElBMC9Pb1JyR3EwQTQxc0kzT0VMaXFQemh5S015SlFYbzB5?=
 =?utf-8?B?ckIzM2F2YU82TFZhSkw0a0J2SkgyS1VmUTA4TmdXbG8yaTJseXkzR1JXQXNr?=
 =?utf-8?B?eWx6bVBXSXorYzdmT2R1NGtNZzM2b0xPQjBGNGJDSUtoY3NZZFNFTUpxRG56?=
 =?utf-8?B?b1VsTFFjMDZ1c01xU2x4ejNtM2xna0Z4aUEydWNSTjhwdkI2aElXSTBna0ZO?=
 =?utf-8?B?cVNqcDRPTTNNWTdIZUhyc0JzOXJlREV1dXd6OUtUUXV6ZktIaWhTbWhCdnRU?=
 =?utf-8?B?Y1dBcVAzSTRnVjVZQjFOV0szRjZlNkJCU1JQMnZlK1ZRaElsYnFyWUZrdDBR?=
 =?utf-8?B?SWZoa0lJb3RhQzUzT1MwQXlnTndadlZpQzN5bkdHTlphMWp2MWE4Y3ZJYkY0?=
 =?utf-8?B?Y3k0S1VpL0M5WXc2MzNvWXFtenlYbjEvbTczekcwQVdWUmx3SE1pUzBybmdQ?=
 =?utf-8?B?aGVYWWhJcDRtb1dtRjhTK2lJckZVdjdRN09zLzNIWEVxWmgvS3FzWHdWZnZI?=
 =?utf-8?B?SUJidGd6aUZ2YlJ6SXJiank3ajVxVkkwRThiMnZEYzk0dGwwaEV1Rk1GN1RF?=
 =?utf-8?B?WmFaNlpSZ3d6NFU4K2Z3RzJxMDlZSzFGbDFJZ0pwZEhiamd4eHlwWmxJQmxF?=
 =?utf-8?B?d2pEb2c3NEdyU0dRQWFvc1lKdEttVkxxdFhGVW05ZndhdGU5alM1TGtkVnpj?=
 =?utf-8?B?SURTSW1SdU1WU1MzUVZySEFkSTlKR0orMzk4MVoxcXVVTWlaZlBDSW93aCsx?=
 =?utf-8?B?MWNEUUYzRVpqMkZlQkV5SjkvK2hrNmpuaGs0TGlpNzNCR1pycmtQeGxhR3RY?=
 =?utf-8?Q?mJ5m5/R0nnRUwZji5Y6zMRfWG?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 025ea983-5128-4513-e49a-08da9c6eb933
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5009.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2022 07:47:39.6523
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 q1TGoYHUf4A84rvLHlehzyOB4UEn/q5pP2aE188Sqicu8Ti/ZbqrB8Btsza2YO77ATDYgY7j+niq59697Y7rKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6318
X-Proofpoint-ORIG-GUID: eVjijz8aGYf-w_Txw8jRPPH9s9_IxiVD
X-Proofpoint-GUID: rh9xHTHfXkYyRBtFLhvIjC6Lu4PPBVZU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-22_04,2022-09-20_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0
 spamscore=0 mlxscore=0 mlxlogscore=999 priorityscore=1501 phishscore=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 clxscore=1011
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2209220051
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
 mx0a-0064b401.pphosted.com id 28M7QYfH031684
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 22 Sep 2022 07:47:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98920

Failed to build for amd64:
| make[2]: Leaving directory=20
'/build/tmp-glibc/work/dbfp5-wrs-linux/mariadb/10.7.4-r0/build'
| qemu: uncaught target signal 4 (Illegal instruction) - core dumped
| [  4%] Built target tpool
| [  8%] Built target skip_all-t
| [  4%] Built target no_plan-t
| [  8%] Built target wsrep-lib
| [  8%] Built target ref10
| [  8%] Built target mariadb_obj
| make  -f libmariadb/libmariadb/CMakeFiles/mariadbclient.dir/build.make=20
libmariadb/libmariadb/CMakeFiles/mariadbclient.dir/depend
| make  -f libmariadb/libmariadb/CMakeFiles/libmariadb.dir/build.make=20
libmariadb/libmariadb/CMakeFiles/libmariadb.dir/depend
| make[2]: Entering directory=20
'/build/tmp-glibc/work/dbfp5-wrs-linux/mariadb/10.7.4-r0/build'
| cd /build/tmp-glibc/work/dbfp5-wrs-linux/mariadb/10.7.4-r0/build &&=20
/build/tmp-glibc/work/dbfp5-wrs-linux/mariadb/10.7.4-r0/recipe-sysroot-na=
tive/usr/bin/cmake=20
-E cmake_depends "Unix Makefiles"=20
/build/tmp-glibc/work/dbfp5-wrs-linux/mariadb/10.7.4-r0/mariadb-10.7.4=20
/build/tmp-glibc/work/dbfp5-wrs-linux/mariadb/10.7.4-r0/mariadb-10.7.4/li=
bmariadb/libmariadb=20
/build/tmp-glibc/work/dbfp5-wrs-linux/mariadb/10.7.4-r0/build=20
/build/tmp-glibc/work/dbfp5-wrs-linux/mariadb/10.7.4-r0/build/libmariadb/=
libmariadb=20
/build/tmp-glibc/work/dbfp5-wrs-linux/mariadb/10.7.4-r0/build/libmariadb/=
libmariadb/CMakeFiles/mariadbclient.dir/DependInfo.cmake=20
--color=3D
| make[2]: Leaving directory=20
'/build/tmp-glibc/work/dbfp5-wrs-linux/mariadb/10.7.4-r0/build'
| make  -f libmariadb/libmariadb/CMakeFiles/mariadbclient.dir/build.make=20
libmariadb/libmariadb/CMakeFiles/mariadbclient.dir/build
| Illegal instruction (core dumped)
| make[2]: *** [sql/CMakeFiles/GenServerSource.dir/build.make:76:=20
sql/lex_hash.h] Error 132
| make[2]: *** Deleting file 'sql/lex_hash.h'
| make[2]: Entering directory=20
'/build/tmp-glibc/work/dbfp5-wrs-linux/mariadb/10.7.4-r0/build'
| [  8%] Linking C static library libmariadbclient.a
| cd=20
/build/tmp-glibc/work/dbfp5-wrs-linux/mariadb/10.7.4-r0/build/libmariadb/=
libmariadb=20
&&=20
/build/tmp-glibc/work/dbfp5-wrs-linux/mariadb/10.7.4-r0/recipe-sysroot-na=
tive/usr/bin/cmake=20
-P CMakeFiles/mariadbclient.dir/cmake_clean_target.cmake
| Illegal instruction (core dumped)
| Illegal instruction (core dumped)
| make[2]: *** [scripts/CMakeFiles/GenFixPrivs.dir/build.make:78:=20
scripts/mysql_fix_privilege_tables_sql.c] Error 132

Thanks,

On 7/6/21 16:37, Khem Raj wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>=20
> On Mon, Jul 5, 2021 at 11:56 PM Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi =
<zboszor@gmail.com> wrote:
>>
>> This way, mariadb does not depend on mariadb-native anymore.
>>
>=20
> how does build time gets impacted ? you can count that native build is
> not needed but still it will be good to know.
> qemu dependency also means that qemu usermode has to be supported for
> this to work, which maybe troublesome on some
> newer or lesser known architectures but perhaps thats a fine compromise=
 perhaps.
>=20
>> Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.c=
om>
>> ---
>>   meta-oe/recipes-dbs/mysql/mariadb.inc         | 27 ++++----
>>   .../mysql/mariadb/cross-compiling.patch       | 25 -------
>>   ...Lists.txt-fix-gen_lex_hash-not-found.patch | 67 -----------------=
--
>>   meta-oe/recipes-dbs/mysql/mariadb_10.5.10.bb  |  4 +-
>>   4 files changed, 15 insertions(+), 108 deletions(-)
>>   delete mode 100644 meta-oe/recipes-dbs/mysql/mariadb/cross-compiling=
.patch
>>   delete mode 100644 meta-oe/recipes-dbs/mysql/mariadb/sql-CMakeLists.=
txt-fix-gen_lex_hash-not-found.patch
>>
>> diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-d=
bs/mysql/mariadb.inc
>> index 18b025070..7b1f537fb 100644
>> --- a/meta-oe/recipes-dbs/mysql/mariadb.inc
>> +++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
>> @@ -12,7 +12,6 @@ SRC_URI =3D "https://downloads.mariadb.org/interstit=
ial/${BP}/source/${BP}.tar.gz
>>              file://mysql-systemd-start \
>>              file://configure.cmake-fix-valgrind.patch \
>>              file://support-files-CMakeLists.txt-fix-do_populate_sysro=
ot.patch \
>> -           file://sql-CMakeLists.txt-fix-gen_lex_hash-not-found.patch=
 \
>>              file://0001-disable-ucontext-on-musl.patch \
>>              file://c11_atomics.patch \
>>              file://clang_version_header_conflict.patch \
>> @@ -21,7 +20,6 @@ SRC_URI =3D "https://downloads.mariadb.org/interstit=
ial/${BP}/source/${BP}.tar.gz
>>              file://0001-innobase-Define-__NR_futex-if-it-does-not-exi=
st.patch \
>>              file://0001-aio_linux-Check-if-syscall-exists-before-usin=
g-it.patch \
>>              file://sys_futex.patch \
>> -           file://cross-compiling.patch \
>>              file://ssize_t.patch \
>>              file://mm_malloc.patch \
>>             "
>> @@ -60,8 +58,6 @@ SYSTEMD_AUTO_ENABLE_${PN}-setupdb ?=3D "enable"
>>   ALLOW_EMPTY_${PN}-setupdb ?=3D "1"
>>   FILES_${PN}-setupdb =3D "${sysconfdir}/init.d/install_db"
>>
>> -EXTRA_OEMAKE =3D "'GEN_LEX_HASH=3D${STAGING_BINDIR_NATIVE}/gen_lex_ha=
sh'"
>> -
>>   PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)=
} setupdb"
>>   PACKAGECONFIG_class-native =3D ""
>>   PACKAGECONFIG[pam] =3D ",-DWITHOUT_AUTH_PAM=3DTRUE,libpam"
>> @@ -95,6 +91,8 @@ EXTRA_OECMAKE =3D "-DWITH_EMBEDDED_SERVER=3DON \
>>                    -DCAT_EXECUTABLE=3D`which cat` \
>>                    -DCMAKE_AR:FILEPATH=3D${AR}"
>>
>> +EXTRA_OECMAKE_prepend_class-target =3D "-DCMAKE_CROSSCOMPILING_EMULAT=
OR=3D${WORKDIR}/qemuwrapper "
>> +
>>   # With Ninja it fails with:
>>   # make: *** No rule to make target `install'.  Stop.
>>   OECMAKE_GENERATOR =3D "Unix Makefiles"
>> @@ -117,12 +115,18 @@ do_generate_toolchain_file_append_class-native (=
) {
>>       sed -i "/set( CMAKE_SYSTEM_PROCESSOR/d" ${WORKDIR}/toolchain.cma=
ke
>>   }
>>
>> -do_compile_prepend_class-target () {
>> -    # These need to be in-tree or make will think they need to be bui=
lt,
>> -    # and since we're cross-compiling that is disabled
>> -    cp ${STAGING_BINDIR_NATIVE}/comp_err ${S}/extra
>> -    cp ${STAGING_BINDIR_NATIVE}/comp_sql ${S}/scripts
>> +do_configure_prepend_class-target () {
>> +       # Write out a qemu wrapper that will be used by cmake
>> +       # so that it can run target helper binaries through that.
>> +       qemu_binary=3D"${@qemu_wrapper_cmdline(d, d.getVar('STAGING_DI=
R_HOST'), [d.expand('${STAGING_DIR_HOST}${libdir}'),d.expand('${STAGING_D=
IR_HOST}${base_libdir}')])}"
>> +       cat > ${WORKDIR}/qemuwrapper << EOF
>> +#!/bin/sh
>> +$qemu_binary "\$@"
>> +EOF
>> +       chmod +x ${WORKDIR}/qemuwrapper
>> +}
>>
>> +do_compile_prepend_class-target () {
>>       if [ "${@bb.utils.contains('PACKAGECONFIG', 'krb5', 'yes', 'no',=
 d)}" =3D "no" ]; then
>>           if ! [ -e ${B}/include/openssl/kssl.h ] ; then
>>               mkdir -p ${B}/include/openssl
>> @@ -132,11 +136,6 @@ do_compile_prepend_class-target () {
>>               echo "#endif" >>${B}/include/openssl/kssl.h
>>           fi
>>       fi
>> -    # workaround to handle out-of-source build from source package
>> -    yacc_files=3D"sql_yacc.hh sql_yacc.cc sql_yacc_ora.hh sql_yacc_or=
a.cc"
>> -    for yacc_file in ${yacc_files}; do
>> -        cp ${S}/sql/${yacc_file} ${B}/sql/${yacc_file}
>> -    done
>>   }
>>
>>   SYSROOT_PREPROCESS_FUNCS +=3D "mariadb_sysroot_preprocess"
>> diff --git a/meta-oe/recipes-dbs/mysql/mariadb/cross-compiling.patch b=
/meta-oe/recipes-dbs/mysql/mariadb/cross-compiling.patch
>> deleted file mode 100644
>> index 0f4815b18..000000000
>> --- a/meta-oe/recipes-dbs/mysql/mariadb/cross-compiling.patch
>> +++ /dev/null
>> @@ -1,25 +0,0 @@
>> -This is not needed for OE builds
>> -
>> -building failed since native does not generate import_executables.cma=
ke
>> -In fact, our building system will export the needed commands
>> -
>> -Upstream-Status: Inappropriate [configuration]
>> -
>> -Signed-off-by: Roy Li <rongqing.li@windriver.com>
>> -Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
>> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> -
>> ---- a/CMakeLists.txt
>> -+++ b/CMakeLists.txt
>> -@@ -392,11 +392,6 @@ CHECK_PCRE()
>> -
>> - CHECK_SYSTEMD()
>> -
>> --IF(CMAKE_CROSSCOMPILING AND NOT DEFINED CMAKE_CROSSCOMPILING_EMULATO=
R)
>> --  SET(IMPORT_EXECUTABLES "IMPORTFILE-NOTFOUND" CACHE FILEPATH "Path =
to import_executables.cmake from a native build")
>> --  INCLUDE(${IMPORT_EXECUTABLES})
>> --ENDIF()
>> --
>> - #
>> - # Setup maintainer mode options. Platform checks are
>> - # not run with the warning options as to not perturb fragile checks
>> diff --git a/meta-oe/recipes-dbs/mysql/mariadb/sql-CMakeLists.txt-fix-=
gen_lex_hash-not-found.patch b/meta-oe/recipes-dbs/mysql/mariadb/sql-CMak=
eLists.txt-fix-gen_lex_hash-not-found.patch
>> deleted file mode 100644
>> index 4cb044339..000000000
>> --- a/meta-oe/recipes-dbs/mysql/mariadb/sql-CMakeLists.txt-fix-gen_lex=
_hash-not-found.patch
>> +++ /dev/null
>> @@ -1,67 +0,0 @@
>> -From cfce1491827e5a581878b5e166bf4d30e6d90e07 Mon Sep 17 00:00:00 200=
1
>> -From: Mingli Yu <mingli.yu@windriver.com>
>> -Date: Thu, 23 Jul 2020 00:08:16 -0700
>> -Subject: [PATCH] sql/CMakeLists.txt: fix gen_lex_hash not found
>> -
>> -Fix the below do_compile issue in cross-compiling env.
>> -| make[2]: *** No rule to make target '/build/tmp/work/aarch64-poky-l=
inux/mariadb/10.3.13-r0/mariadb-10.3.13/sql/gen_lex_hash', needed by 'sql=
/lex_hash.h'.  Stop.
>> -| make[2]: *** No rule to make target '/build/tmp/work/aarch64-poky-l=
inux/mariadb/10.3.13-r0/mariadb-10.3.13/sql/gen_lex_token', needed by 'sq=
l/lex_token.h'.  Stop.
>> -
>> -Upstream-Status: Inappropriate [oe build specific]
>> -
>> -Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
>> ----
>> - sql/CMakeLists.txt | 30 ++++++++++++++++++++----------
>> - 1 file changed, 20 insertions(+), 10 deletions(-)
>> -
>> -diff --git a/sql/CMakeLists.txt b/sql/CMakeLists.txt
>> -index 0dc3caa..616017b 100644
>> ---- a/sql/CMakeLists.txt
>> -+++ b/sql/CMakeLists.txt
>> -@@ -52,11 +52,16 @@ ${CMAKE_BINARY_DIR}/sql
>> - ${CMAKE_SOURCE_DIR}/tpool
>> - )
>> -
>> --ADD_CUSTOM_COMMAND(
>> --  OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/lex_token.h
>> --  COMMAND gen_lex_token > lex_token.h
>> --  DEPENDS gen_lex_token
>> --)
>> -+IF(NOT CMAKE_CROSSCOMPILING)
>> -+  ADD_CUSTOM_COMMAND(
>> -+   OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/lex_token.h
>> -+   COMMAND gen_lex_token > lex_token.h
>> -+   DEPENDS gen_lex_token)
>> -+ELSE()
>> -+  ADD_CUSTOM_COMMAND(
>> -+   OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/lex_token.h
>> -+   COMMAND gen_lex_token > lex_token.h)
>> -+ENDIF()
>> -
>> - ADD_CUSTOM_COMMAND(
>> -   OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/sql_yacc_ora.yy
>> -@@ -345,11 +350,16 @@ IF(NOT CMAKE_CROSSCOMPILING)
>> -   ADD_EXECUTABLE(gen_lex_hash gen_lex_hash.cc)
>> - ENDIF()
>> -
>> --ADD_CUSTOM_COMMAND(
>> --  OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/lex_hash.h
>> --  COMMAND gen_lex_hash > lex_hash.h
>> --  DEPENDS gen_lex_hash
>> --)
>> -+IF(NOT CMAKE_CROSSCOMPILING)
>> -+  ADD_CUSTOM_COMMAND(
>> -+   OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/lex_hash.h
>> -+   COMMAND gen_lex_hash > lex_hash.h
>> -+   DEPENDS gen_lex_hash)
>> -+ELSE()
>> -+  ADD_CUSTOM_COMMAND(
>> -+   OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/lex_hash.h
>> -+   COMMAND gen_lex_hash > lex_hash.h)
>> -+ENDIF()
>> -
>> - MYSQL_ADD_EXECUTABLE(mariadb-tzinfo-to-sql tztime.cc COMPONENT Serve=
r)
>> - SET_TARGET_PROPERTIES(mariadb-tzinfo-to-sql PROPERTIES COMPILE_FLAGS=
 "-DTZINFO2SQL")
>> ---
>> -2.17.1
>> -
>> diff --git a/meta-oe/recipes-dbs/mysql/mariadb_10.5.10.bb b/meta-oe/re=
cipes-dbs/mysql/mariadb_10.5.10.bb
>> index 8ae8241b0..57d7736ea 100644
>> --- a/meta-oe/recipes-dbs/mysql/mariadb_10.5.10.bb
>> +++ b/meta-oe/recipes-dbs/mysql/mariadb_10.5.10.bb
>> @@ -1,8 +1,8 @@
>>   require mariadb.inc
>>
>> -EXTRA_OECMAKE +=3D "-DSTACK_DIRECTION=3D-1"
>> +inherit qemu
>>
>> -DEPENDS +=3D "mariadb-native bison-native boost libpcre2 curl openssl=
 ncurses zlib libaio libedit libevent libxml2"
>> +DEPENDS +=3D "qemu-native bison-native boost libpcre2 curl openssl nc=
urses zlib libaio libedit libevent libxml2"
>>
>>   PROVIDES +=3D "mysql5 libmysqlclient"
>>
>> --
>> 2.31.1
>>
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#92109): https://lists.openembedded.org/g/openembed=
ded-devel/message/92109
>> Mute This Topic: https://lists.openembedded.org/mt/84015256/3618448
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub=
 [mingli.yu@windriver.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

