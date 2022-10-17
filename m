Return-Path: <mingli.yu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B349C433FE
	for <webhook@archiver.kernel.org>; Mon, 17 Oct 2022 05:56:31 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web09.37864.1665986183530831639
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 16 Oct 2022 22:56:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=J9j6kwzv;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7289ae5d0b=mingli.yu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.5) with ESMTP id 29H5dlLg025864
	for <openembedded-devel@lists.openembedded.org>; Mon, 17 Oct 2022 05:56:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=message-id : date
 : subject : from : to : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=RxTq3xz7bbgcXXneJbMXye6jwMnGBk5uC8PS9OBsy70=;
 b=J9j6kwzvN2lWzCAJniS4OH0ib7+OeTxwSOoEZ57bPdQyijqQbPKf1t8yrlPHjviFbXi7
 Dr9L5M0Gfh0KmzvoPLQZRay8v0UD6IlgHxvBfUfVVK7YwYDbxCI2A5B7U9BVeRlVrF3+
 4XvXst1KcC3AboN1L/BEqa3VixcAxjSujfAempwtI2Hhsui+GI6zquWI4C42fi0z3mxQ
 ib9DlwiEMp0WR3RkV2NfvUDNGe3V6+u5ozHKmEf7IKu1qHdP44P6rkUrHCVfZXnnByid
 cfErWVEnz47dXl9uwdtQtK2jMN016Ons40O7EA8rcHdr89auS3KcXSajiUH7H3tkDZBg Mw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3k7ku99baj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 17 Oct 2022 05:56:22 +0000
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29H5uMXt027612
	for <openembedded-devel@lists.openembedded.org>; Mon, 17 Oct 2022 05:56:22 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2045.outbound.protection.outlook.com [104.47.74.45])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3k7ku99bag-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Oct 2022 05:56:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D8LXmi0DzEQ9rjk/K5EUOPImSY9wfmOBkSpl3W9ZzMy5Zp1dm5nfFHVIwPYWybu/NufH1xcONnsvYITGYBUaETiZNgzPSVjCIOnJbh2TaFrcJD6Lgz36QgC8XePplxpm0NGOB7h+UEOYAY4gGP77Wv81BECG6nhYx/Dk0Thd9Quwm46yiLb9740Di3gHRavrPZlQ5th+2z7SL/OnOKZ/BBuTmDIfgUIDVtMiVbn9AxpIZYJ3CQSyAE9PLoU28p72SNFT8vZI35UNNUZ8N9y8BZpY2YxlUKLP3yRSC/kpZpnD3qn4IboDpCFXj5XHMRtEvmozf+BJ79qe8yf/Qm6b0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RxTq3xz7bbgcXXneJbMXye6jwMnGBk5uC8PS9OBsy70=;
 b=Ht9gydfhuMMI0aEu32I8cYYkxnOybsNjGEOsq+ymZg76s2fFAIr4UMzt9pXX0irEsR4orHSkC+DdJIXrPZgPXgMyan15LvL5s2bh6sv+B+qZsnDn0n8zdbDC9HcZ+hXhT8f4rBQuyZ06Ffe4KQaoB4aLPuwyPu8ojSQQVbdgfsdE+JRruJXi1rsAcInqEkbGScZpz71rylQN1Jri325mi7IiT3TEkfi7w+/KJFxBOD8tOqj2KdcaD3j++gaYQaVhlPiroYQU6PTdiq9Q4ilnhg6y+iT5eYTM31Jufjyh7qSQ7LAv+3+MBsIMI6q6a3gjqO9YPFz7lbzBhirw5M0NFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 by SN7PR11MB6725.namprd11.prod.outlook.com (2603:10b6:806:267::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.26; Mon, 17 Oct
 2022 05:56:19 +0000
Received: from CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::df2c:f6f9:cbe9:a56c]) by CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::df2c:f6f9:cbe9:a56c%4]) with mapi id 15.20.5723.033; Mon, 17 Oct 2022
 05:56:19 +0000
Message-ID: <a1962501-4bfe-a547-0af5-caaae7cc4797@windriver.com>
Date: Mon, 17 Oct 2022 13:56:11 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [oe] [meta-oe][kirkstone][PATCH] mariadb: not use qemu to run
 cross-compiled binaries
Content-Language: en-US
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: openembedded-devel@lists.openembedded.org, Ross.Burton@arm.com
References: <647C21FD-1AD1-4955-AB61-C3C5195CC7CF@arm.com>
 <17184F1EA11A10CE.15234@lists.openembedded.org>
In-Reply-To: <17184F1EA11A10CE.15234@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SL2P216CA0186.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:1a::23) To CO1PR11MB5009.namprd11.prod.outlook.com
 (2603:10b6:303:9e::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5009:EE_|SN7PR11MB6725:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b0a044f-a405-4e4a-b4d5-08dab0044fc1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	MYkPo1hSoiogk6TcIRnpIfqswtGfXHB9e8thOkqAuBlvaA+m5y69mzAd88MSHGl+wpckqJYm4BggTi/HgWrlXmwvoj8Er8hYCpoV5ZvXIdm95mwKx68spSOmEaje6NVE4PFjuIF4CnaDRAM6/baYFQy0EaVY4wk4wynzu4NCzGOsbnQX6LcWQ0lJ2/0b2MOLKYGYbPtP/DnsXrqCmBkS0NXJjc4AYC2d91uCZZ3EiBt40uRFEWhlsirpnxTtq5ntlDe8MVnBIkX6dNlqHdX/mL1NZPNdBkwGyEO1eu6+GAys9GMBqEMmiH2uSBdEBeV7QjVLLLNuz/LNIuUosWtEpkJChzoxYztr/YaGjKIed8rAcm0JECXw2OdqBsgOHQ4oD4ZfPlZ7QsUbnRhkEMf4Yvl5ldxelebmElM7RBRr98zpi7vy8qAy4Dpct58+p1a5YFPC+A89aW+/moKeooUFcyFpRSVVWmN1/brYk9tUyHppRMtn/lLtD9wb6M9SwRNT19U//09ySnQudHycgxYueJdtxFnRuUMGGHgyMzjyR+hQKSaS0XZ5ur9ytJnYYFEwG5hTmuTaKdSac5jgI0rYf4u9CsqL+U5Ea32yT/zo7ds93X4pAk0pGRTVI47flLLwo9lYNUrJprKIKu84f0JXoohbWuJu9ULWj+ff01f/LHkQRBTwjFUK5k+yxgbR0B1I24uxPphfcSIKcvefiBIC5HIiWDtoBAqeZLPtYzn8eBVELfd8t2IPtPuahzl1JwYwT7NoCDX1IjOzUHKTGFQBFfPiBoD6MN1POWt9WlQaR9fBXmheij0fNsPCoLFdscgwxmEbS8Z6TJBF3x2N/SOdbdCbOvw8ufrEZ8O8TRC3YCI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5009.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(396003)(366004)(376002)(136003)(39850400004)(451199015)(8676002)(66899015)(66476007)(66556008)(66946007)(8936002)(316002)(31686004)(41300700001)(5660300002)(30864003)(26005)(2906002)(38100700002)(6506007)(53546011)(6666004)(83380400001)(31696002)(6512007)(86362001)(36756003)(966005)(6486002)(478600001)(2616005)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?R0ZlNzh5akR5WjRXK1M1STVSamJFRElkdmd5NVZZVVZyZ1RUc1dZYWlEd1Bz?=
 =?utf-8?B?QU5acnFUeTdITVBYdU50WVZwQkhPUVg1UFZJeHNQaUpwUGsvbFFwRUF6R0Qz?=
 =?utf-8?B?eFVoT0JoMEsxV0FiTGhUejlOSXB1bllKUFJjSC80TG1HRE45Y1BJbTZudEZs?=
 =?utf-8?B?OXZKWVlGWXJRNDlHTy94dWxDUFhlK3BmSHFFNmtFaDhaVHFEMWIwQ0RwLzEw?=
 =?utf-8?B?cDVYZ3pydnZYZkJhUlZXNUJXWkc2VU43MTJQQUdjLzVIU291Y2NBbTFmL2lW?=
 =?utf-8?B?NEtpdlRMMzN2OUNIaTRGRXgxaTRkZTZDa1pOa2pZMHo2TWNHTVZKMjRwSHdY?=
 =?utf-8?B?SjREdDFzZFlDTW1YZENmR0xjOFRpR0prN1RWNW1xaFVXNDVhSTRBblZTTjVl?=
 =?utf-8?B?ZldGY1VjK2YzdXdsZUVDNXNmQmszR1lTLzJWSUxuNU9FbXpqT3BYZ2pDZkRM?=
 =?utf-8?B?aDd1RzNPdE5PVmZRQmRCa0g0MWp6WkYxWktLT2FWc3Nyd3U1RDVwVHlISWR2?=
 =?utf-8?B?NzRRNCtzdU43cnN5anpOTCtpdDVKR0l4d2d3dVp1RWZPYm9ESkJXSmpJQ0sr?=
 =?utf-8?B?MlByQnBsNjBjRzBkbVFweE1tSE9aZzhQdUhnOEFrb0hSZU44aThrRTBZVUVJ?=
 =?utf-8?B?eFF2Ylc2SlBWRks0blJwUTN6SGxKN1dKYi9LQVAyYlZUTnBkajM3amlkZjUv?=
 =?utf-8?B?dXRkMjB3KzErNldxdFpGclZmdnp3a3hvSVhuNGlKZGNxQjdTKzNsbzFpRnhm?=
 =?utf-8?B?ZkpMVklHSU01cjJraUhxTFIzOWhNUWlZcXM1dXAxdzhaUUR1UGxURmJaVERQ?=
 =?utf-8?B?dUlBWVUrNVh0blRKYW9CUWo1U3JkR2QzSEJ6ZE81OENMazRJRko2WmFKR2kx?=
 =?utf-8?B?WmQzajBmMUYwVHppbjI3aDZEV2s2eUIyWW1pWmtmQVpKTXFFVWhGRWhwQ2dG?=
 =?utf-8?B?MDFldE5wTlk2aE4zNXVZVk9YSU1md3FZSmdFVkQydy8zSzFSQS95S2RuMXgy?=
 =?utf-8?B?Z0ZPLytMWUlmTFpiNEFkTFFySVNMNk4rLzhhZ3BiVS8waXMvbDZNWVhkUTFJ?=
 =?utf-8?B?U3BURldkV1VPam5DRXdqUVpRc0pBc0N2WVMrSTBLUnkrUkZuOUFaM0taaDZt?=
 =?utf-8?B?REtXdDk4RXIvYmpza2tZOXBOU2pQTDRkY0NEaFBzS2VsWHc5WGxNWnVSeUl3?=
 =?utf-8?B?WEdEdWhQTk5mYVhUT2FNUUF6VE5CVyszTEtyT05iNWRBODlRdjIxcXZiMFRP?=
 =?utf-8?B?OW91aFhDSEZ2TlVaa0xwRUdKNTN2UVo3L2NsRWQxSE9WbWFRZWk1bGRxQzJ3?=
 =?utf-8?B?ZXFNYkJaUGgvQ1l0MTRLSHgrRFQ3TVhBVC85Sk81cVI5eUxEamlFRlY2OC92?=
 =?utf-8?B?ZFExNUU2YU9JeU43ZDNob0hNbjRwOS8xcmwyTXZ4dFlHZXBIM29xTW9MMEJH?=
 =?utf-8?B?NUV5Nld0dHp1WmNBelV2WmczRDZpRUdlU21GNXJScXVUbzZVZ2YzTUQ2eHdk?=
 =?utf-8?B?OHRoTWVFU1QyVHNOdElzWUx6dG4yUlhaNUlwRlMxbGdCTFZmcDZ2R0Zra1V6?=
 =?utf-8?B?Q3B4UTlYUFhQOWJOcEY0czV5cXQ0UGcrbldRYW5lckVtQ1pjTENEUVV4T3U2?=
 =?utf-8?B?aGJ5S1N2L1d3Wk9pOTJod2ZYeFIwY1N2QUZsODFaamhtMTViL280dVYxbE40?=
 =?utf-8?B?dUhGWXhoSk8wWmZjNnpxMysyZkdWVWpnSy9BSytJbDdud05ndU42RmdWMkor?=
 =?utf-8?B?RllWdXkyaHdhUW5ncHQrVXlIdGNMYTVIakJ0WHVIS0Z6RUk1K2tiWXdpTFJ0?=
 =?utf-8?B?eUQvU3RPSE9YbkluNGJMOHBBTTY2NVdJWXhHaG0zSmlaYVEreXpBL2IyVVEy?=
 =?utf-8?B?ZmQvVkdWb2tWQXh3TkI4U092RDVEN3A4a2dkOTZZYzRkOFRQTWVwdzM4VktW?=
 =?utf-8?B?RFhyNDRFelVjdkluYU51ME03cGYwTGwrdmJwaThnaTRnNHdyNmRiRzFYUmJR?=
 =?utf-8?B?aFJCUnVLMDlUZlJOeTVwbFpEaXU1K2V2ZkszQkczMEJjZXpCemFlN3RvK0dY?=
 =?utf-8?B?ZTMwMEJNUklyZUxpaTJ3K0krT3VZUG9uWmNQeFVUbG1XSXBZZ3R2a0svd0xX?=
 =?utf-8?Q?RpJaNv+BKUnEnuLc9hg4kNQX+?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b0a044f-a405-4e4a-b4d5-08dab0044fc1
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5009.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2022 05:56:19.2205
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1HoZgxa1uuBC5ksapYSsMkg0ExHo7qHgsrgbdWLNvFabFH8xcX+h2TkQdJdKCa3rDmznpS72RVzx4IK6WF2TCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6725
X-Proofpoint-GUID: UenwRsEtMEIeqk567s-4yG08-XS-z8mw
X-Proofpoint-ORIG-GUID: F1hASbj7qQXWWmfQY4eduv-qElfiP-W4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-17_03,2022-10-17_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 mlxlogscore=999 mlxscore=0
 phishscore=0 spamscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2210170036
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 17 Oct 2022 05:56:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99188

Ping.

Thanks,

On 9/26/22 12:37, Yu, Mingli wrote:
> From: Mingli Yu <mingli.yu@windriver.com>
> 
> The build fails when use qemu to run build for amd64 as below:
> 
> | make  -f libmariadb/libmariadb/CMakeFiles/mariadbclient.dir/build.make libmariadb/libmariadb/CMakeFiles/mariadbclient.dir/depend
> | make  -f libmariadb/libmariadb/CMakeFiles/libmariadb.dir/build.make libmariadb/libmariadb/CMakeFiles/libmariadb.dir/depend
> | make[2]: Entering directory '/build/tmp-glibc/work/dbfp5-wrs-linux/mariadb/10.7.4-r0/build'
> | cd /build/tmp-glibc/work/dbfp5-wrs-linux/mariadb/10.7.4-r0/build && /build/tmp-glibc/work/dbfp5-wrs-linux/mariadb/10.7.4-r0/recipe-sysroot-native/usr/bin/cmake -E cmake_depends "Unix Makefiles" /build/tmp-glibc/work/dbfp5-wrs-linux/mariadb/10.7.4-r0/mariadb-10.7.4 /build/tmp-glibc/work/dbfp5-wrs-linux/mariadb/10.7.4-r0/mariadb-10.7.4/libmariadb/libmariadb /build/tmp-glibc/work/dbfp5-wrs-linux/mariadb/10.7.4-r0/build /build/tmp-glibc/work/dbfp5-wrs-linux/mariadb/10.7.4-r0/build/libmariadb/libmariadb /build/tmp-glibc/work/dbfp5-wrs-linux/mariadb/10.7.4-r0/build/libmariadb/libmariadb/CMakeFiles/mariadbclient.dir/DependInfo.cmake --color=
> | make[2]: Leaving directory '/build/tmp-glibc/work/dbfp5-wrs-linux/mariadb/10.7.4-r0/build'
> | make  -f libmariadb/libmariadb/CMakeFiles/mariadbclient.dir/build.make libmariadb/libmariadb/CMakeFiles/mariadbclient.dir/build
> | Illegal instruction (core dumped)
> | make[2]: *** [sql/CMakeFiles/GenServerSource.dir/build.make:76: sql/lex_hash.h] Error 132
> | make[2]: *** Deleting file 'sql/lex_hash.h'
> | make[2]: Entering directory '/build/tmp-glibc/work/dbfp5-wrs-linux/mariadb/10.7.4-r0/build'
> | [  8%] Linking C static library libmariadbclient.a
> | cd /build/tmp-glibc/work/dbfp5-wrs-linux/mariadb/10.7.4-r0/build/libmariadb/libmariadb && /build/tmp-glibc/work/dbfp5-wrs-linux/mariadb/10.7.4-r0/recipe-sysroot-native/usr/bin/cmake -P CMakeFiles/mariadbclient.dir/cmake_clean_target.cmake
> | Illegal instruction (core dumped)
> | Illegal instruction (core dumped)
> | make[2]: *** [scripts/CMakeFiles/GenFixPrivs.dir/build.make:78: scripts/mysql_fix_privilege_tables_sql.c] Error 132
> 
> So don't use qemu to run cross-compiled binaries.
> 
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>   .../mysql/mariadb-native_10.7.4.bb            |  4 +-
>   meta-oe/recipes-dbs/mysql/mariadb.inc         | 20 +++---
>   ...Lists.txt-fix-gen_lex_hash-not-found.patch | 69 +++++++++++++++++++
>   .../mysql/mariadb/cross-compiling.patch       | 34 +++++++++
>   meta-oe/recipes-dbs/mysql/mariadb_10.7.4.bb   |  4 +-
>   5 files changed, 116 insertions(+), 15 deletions(-)
>   create mode 100644 meta-oe/recipes-dbs/mysql/mariadb/0001-sql-CMakeLists.txt-fix-gen_lex_hash-not-found.patch
>   create mode 100644 meta-oe/recipes-dbs/mysql/mariadb/cross-compiling.patch
> 
> diff --git a/meta-oe/recipes-dbs/mysql/mariadb-native_10.7.4.bb b/meta-oe/recipes-dbs/mysql/mariadb-native_10.7.4.bb
> index e38726d3f..17a06349b 100644
> --- a/meta-oe/recipes-dbs/mysql/mariadb-native_10.7.4.bb
> +++ b/meta-oe/recipes-dbs/mysql/mariadb-native_10.7.4.bb
> @@ -2,7 +2,9 @@ require mariadb.inc
>   inherit native
>   
>   PROVIDES += "mysql5-native"
> -DEPENDS = "ncurses-native zlib-native bison-native libpcre2-native"
> +DEPENDS = "ncurses-native zlib-native bison-native libpcre2-native \
> +gnutls-native fmt-native \
> +"
>   
>   RDEPENDS:${PN} = ""
>   PACKAGES = ""
> diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/mysql/mariadb.inc
> index 922373b63..23322cf74 100644
> --- a/meta-oe/recipes-dbs/mysql/mariadb.inc
> +++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
> @@ -20,6 +20,8 @@ SRC_URI = "https://archive.mariadb.org/${BP}/source/${BP}.tar.gz \
>              file://mm_malloc.patch \
>              file://sys_futex.patch \
>              file://mariadb-openssl3.patch \
> +           file://cross-compiling.patch \
> +           file://0001-sql-CMakeLists.txt-fix-gen_lex_hash-not-found.patch \
>             "
>   SRC_URI:append:libc-musl = " file://ppc-remove-glibc-dep.patch"
>   
> @@ -61,6 +63,8 @@ FILES:${PN}-setupdb = "${sysconfdir}/init.d/install_db \
>                          ${bindir}/mysql-systemd-start \
>                          "
>   
> +EXTRA_OEMAKE = "'GEN_LEX_HASH=${STAGING_BINDIR_NATIVE}/gen_lex_hash'"
> +
>   PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)} openssl"
>   PACKAGECONFIG:class-native = ""
>   PACKAGECONFIG[pam] = ",-DWITHOUT_AUTH_PAM=TRUE,libpam"
> @@ -95,9 +99,9 @@ EXTRA_OECMAKE = "-DWITH_EMBEDDED_SERVER=ON \
>                    -DINSTALL_SYSCONFDIR:PATH=${sysconfdir} \
>                    -DMYSQL_DATADIR:PATH=/var/mysql \
>                    -DCAT_EXECUTABLE=`which cat` \
> +                 -DSTACK_DIRECTION=1 \
>                    -DCMAKE_AR:FILEPATH=${AR}"
>   
> -EXTRA_OECMAKE:prepend:class-target = "-DCMAKE_CROSSCOMPILING_EMULATOR=${WORKDIR}/qemuwrapper "
>   
>   # With Ninja it fails with:
>   # make: *** No rule to make target `install'.  Stop.
> @@ -121,18 +125,12 @@ do_generate_toolchain_file:append:class-native () {
>       sed -i "/set( CMAKE_SYSTEM_PROCESSOR/d" ${WORKDIR}/toolchain.cmake
>   }
>   
> -do_configure:prepend:class-target () {
> -	# Write out a qemu wrapper that will be used by cmake
> -	# so that it can run target helper binaries through that.
> -	qemu_binary="${@qemu_wrapper_cmdline(d, d.getVar('STAGING_DIR_HOST'), [d.expand('${STAGING_DIR_HOST}${libdir}'),d.expand('${STAGING_DIR_HOST}${base_libdir}')])}"
> -	cat > ${WORKDIR}/qemuwrapper << EOF
> -#!/bin/sh
> -$qemu_binary "\$@"
> -EOF
> -	chmod +x ${WORKDIR}/qemuwrapper
> -}
>   
>   do_compile:prepend:class-target () {
> +    # These need to be in-tree or make will think they need to be built,
> +    # and since we're cross-compiling that is disabled
> +    cp ${STAGING_BINDIR_NATIVE}/comp_err ${S}/extra
> +    cp ${STAGING_BINDIR_NATIVE}/comp_sql ${S}/scripts
>       if [ "${@bb.utils.contains('PACKAGECONFIG', 'krb5', 'yes', 'no', d)}" = "no" ]; then
>           if ! [ -e ${B}/include/openssl/kssl.h ] ; then
>               mkdir -p ${B}/include/openssl
> diff --git a/meta-oe/recipes-dbs/mysql/mariadb/0001-sql-CMakeLists.txt-fix-gen_lex_hash-not-found.patch b/meta-oe/recipes-dbs/mysql/mariadb/0001-sql-CMakeLists.txt-fix-gen_lex_hash-not-found.patch
> new file mode 100644
> index 000000000..456a2bad6
> --- /dev/null
> +++ b/meta-oe/recipes-dbs/mysql/mariadb/0001-sql-CMakeLists.txt-fix-gen_lex_hash-not-found.patch
> @@ -0,0 +1,69 @@
> +From f92f657973997df30afdb0032c88ad3a14ead46b Mon Sep 17 00:00:00 2001
> +From: Mingli Yu <mingli.yu@windriver.com>
> +Date: Fri, 23 Sep 2022 15:48:21 +0800
> +Subject: [PATCH] sql/CMakeLists.txt: fix gen_lex_hash not found
> +
> +Fix the below do_compile issue in cross-compiling env.
> +| make[2]: *** No rule to make target '/build/tmp/work/aarch64-poky-linux/mariadb/10.3.13-r0/mariadb-10.3.13/sql/gen_lex_hash', needed by 'sql/lex_hash.h'.  Stop.
> +| make[2]: *** No rule to make target '/build/tmp/work/aarch64-poky-linux/mariadb/10.3.13-r0/mariadb-10.3.13/sql/gen_lex_token', needed by 'sql/lex_token.h'.  Stop.
> +
> +Upstream-Status: Inappropriate [oe build specific]
> +
> +Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> +---
> + sql/CMakeLists.txt | 30 ++++++++++++++++++++++--------
> + 1 file changed, 22 insertions(+), 8 deletions(-)
> +
> +diff --git a/sql/CMakeLists.txt b/sql/CMakeLists.txt
> +index 241b482..27a3991 100644
> +--- a/sql/CMakeLists.txt
> ++++ b/sql/CMakeLists.txt
> +@@ -60,11 +60,18 @@ ${CMAKE_BINARY_DIR}/sql
> + ${CMAKE_SOURCE_DIR}/tpool
> + )
> +
> +-ADD_CUSTOM_COMMAND(
> +-  OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/lex_token.h
> +-  COMMAND gen_lex_token > lex_token.h
> +-  DEPENDS gen_lex_token
> ++IF(NOT CMAKE_CROSSCOMPILING)
> ++  ADD_CUSTOM_COMMAND(
> ++    OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/lex_token.h
> ++    COMMAND gen_lex_token > lex_token.h
> ++    DEPENDS gen_lex_token
> ++)
> ++ELSE()
> ++  ADD_CUSTOM_COMMAND(
> ++    OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/lex_token.h
> ++    COMMAND gen_lex_token > lex_token.h
> + )
> ++ENDIF()
> +
> + FIND_PACKAGE(BISON 2.4)
> +
> +@@ -372,11 +379,18 @@ IF(NOT CMAKE_CROSSCOMPILING OR DEFINED CMAKE_CROSSCOMPILING_EMULATOR)
> +   ADD_EXECUTABLE(gen_lex_hash gen_lex_hash.cc)
> + ENDIF()
> +
> +-ADD_CUSTOM_COMMAND(
> +-  OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/lex_hash.h
> +-  COMMAND gen_lex_hash > lex_hash.h
> +-  DEPENDS gen_lex_hash
> ++IF(NOT CMAKE_CROSSCOMPILING)
> ++  ADD_CUSTOM_COMMAND(
> ++    OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/lex_hash.h
> ++    COMMAND gen_lex_hash > lex_hash.h
> ++    DEPENDS gen_lex_hash
> ++)
> ++ELSE()
> ++  ADD_CUSTOM_COMMAND(
> ++    OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/lex_hash.h
> ++    COMMAND gen_lex_hash > lex_hash.h
> + )
> ++ENDIF()
> +
> + MYSQL_ADD_EXECUTABLE(mariadb-tzinfo-to-sql tztime.cc)
> + SET_TARGET_PROPERTIES(mariadb-tzinfo-to-sql PROPERTIES COMPILE_FLAGS "-DTZINFO2SQL")
> +--
> +2.25.1
> +
> diff --git a/meta-oe/recipes-dbs/mysql/mariadb/cross-compiling.patch b/meta-oe/recipes-dbs/mysql/mariadb/cross-compiling.patch
> new file mode 100644
> index 000000000..d0d6e3c73
> --- /dev/null
> +++ b/meta-oe/recipes-dbs/mysql/mariadb/cross-compiling.patch
> @@ -0,0 +1,34 @@
> +From 80be37351d995654f86b838f6b5ed47e8a90261b Mon Sep 17 00:00:00 2001
> +From: Mingli Yu <mingli.yu@windriver.com>
> +Date: Fri, 23 Sep 2022 12:05:17 +0800
> +Subject: [PATCH] CMakeLists.txt: not include import_executables.cmake
> +
> +building failed since native does not generate import_executables.cmake
> +In fact, our building system will export the needed commands.
> +
> +Upstream-Status: Inappropriate [oe specific]
> +
> +Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> +---
> + CMakeLists.txt | 5 -----
> + 1 file changed, 5 deletions(-)
> +
> +diff --git a/CMakeLists.txt b/CMakeLists.txt
> +index f9e2b1b..34924ba 100644
> +--- a/CMakeLists.txt
> ++++ b/CMakeLists.txt
> +@@ -394,11 +394,6 @@ CHECK_LIBFMT()
> + ADD_SUBDIRECTORY(tpool)
> + CHECK_SYSTEMD()
> +
> +-IF(CMAKE_CROSSCOMPILING AND NOT DEFINED CMAKE_CROSSCOMPILING_EMULATOR)
> +-  SET(IMPORT_EXECUTABLES "IMPORTFILE-NOTFOUND" CACHE FILEPATH "Path to import_executables.cmake from a native build")
> +-  INCLUDE(${IMPORT_EXECUTABLES})
> +-ENDIF()
> +-
> + #
> + # Setup maintainer mode options. Platform checks are
> + # not run with the warning options as to not perturb fragile checks
> +--
> +2.25.1
> +
> diff --git a/meta-oe/recipes-dbs/mysql/mariadb_10.7.4.bb b/meta-oe/recipes-dbs/mysql/mariadb_10.7.4.bb
> index c800c4c56..8dba5c858 100644
> --- a/meta-oe/recipes-dbs/mysql/mariadb_10.7.4.bb
> +++ b/meta-oe/recipes-dbs/mysql/mariadb_10.7.4.bb
> @@ -1,8 +1,6 @@
>   require mariadb.inc
>   
> -inherit qemu
> -
> -DEPENDS += "qemu-native bison-native boost libpcre2 curl ncurses \
> +DEPENDS += "mariadb-native bison-native boost libpcre2 curl ncurses \
>               zlib libaio libedit libevent libxml2 gnutls fmt lzo"
>   
>   PROVIDES += "mysql5 libmysqlclient"
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#98949): https://lists.openembedded.org/g/openembedded-devel/message/98949
> Mute This Topic: https://lists.openembedded.org/mt/93920978/3618448
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [mingli.yu@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

