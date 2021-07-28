Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.1189.1627451215007252859
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Jul 2021 22:46:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=oKN6OXf9;
 spf=pass (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2843c2a32b=mingli.yu@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 16S5WReX026370
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Jul 2021 22:46:54 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=subject : to :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=Qq3Jty0Ome6MO2ADmbrGgBgOcC4KwkzyV6MH9GBUDjU=;
 b=oKN6OXf9viFF9+77uiiSSNPu9g80MxvJZN3wc5PLze7CMksKuqoCZeaON+o4bblrcZYW
 3jhTo/N9Ol3G9QMmTt6aZoMiLBATsSv383UfdCXVlXtpXiqjOePfurLrNeLoB4M4rZE5
 LL3O6rSpbjNwvojZAL5j+kjt4VuqIipXtq8JPlpI/AEZVBPSrihNvrohHGlCEuFH0iL0
 XySapWB0Y+KIH5/bzpje8JFrr233crGRpwHK0GN/6vcag3jYtYWUR+JwZANZfoc2EiJh
 VlY8s8hE+/MGZMl75yk/3RnGiRk+G0YZDKyO5clrmRYhth4Jc8UZehsDcmIYuZ2eQ5hG 2A== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com with ESMTP id 3a314e809y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Jul 2021 22:46:54 -0700
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 16S5kr7h018684
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Jul 2021 22:46:53 -0700
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2175.outbound.protection.outlook.com [104.47.55.175])
	by mx0a-0064b401.pphosted.com with ESMTP id 3a314e809w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 Jul 2021 22:46:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n8zofbI6Jy1sfftUXzX6mV9vcRmR9Aym/NsZHwf+BCGAEs3aT94LvLKvEpHUxXbgB4a6r4KUHW/14iuOqVeNC7hIsUW1o991J/cN0uib80GwVKYTCOEi/PQ9nYKFXDGieImj4TAmvkh6TRUxMiH7rxhOp/yDCP8jcw5/nT3Wiitru0MPI2d05I9iIUyJ19qWT+FjDzW2AMckhYBbBVMAQkwE9QW3ODQrHYu7o7rK7la557XFO3LHzxiMIujsGDHLIlJg+/SShVwo/LyYWT1Guq9Qot6PX80Bljw9CrMMAViZe4uP4AsiLyQELBMMR/EcB9R75F/41vMpHnsJu0qKlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qq3Jty0Ome6MO2ADmbrGgBgOcC4KwkzyV6MH9GBUDjU=;
 b=g2JjczANXV2JkMWsrli7ct57vNN1WpGfekrRFplkEZWGvgkIF+43C2ifrRAE+RG93iNg67shLWTV6qpHPDcVzFpFswPUIOrl4syoizlU1OzbLdfp0YPk5ftZEsn6PFnf0PrAUoVgLAjQ4bzNDa72qgmmfUntYrWTPdndLBGUgl64ZU1M50AjFuuV2iAR3tVlZhjMOBv+eIRR/e1b1WNz5GIX8GJ9CHDi1Uvf9R+V0wZhmfN7gop7zRH5ow9iQX8SEyVtGzAM1hjI8pYlHrsIIyy7Gm3abOvMtCAYy014ykTeIbl0ywl+zrpMIV7qKxreZoWJ9TR1KXI4KmiUdXcBwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 by MWHPR1101MB2191.namprd11.prod.outlook.com (2603:10b6:301:5a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.29; Wed, 28 Jul
 2021 05:46:51 +0000
Received: from CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::b9f0:8cd5:8e02:ec8e]) by CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::b9f0:8cd5:8e02:ec8e%5]) with mapi id 15.20.4352.031; Wed, 28 Jul 2021
 05:46:51 +0000
Subject: Re: [oe] [hardknott][meta-oe][PATCH] mariadb: Upgrade to 10.5.10
To: akuster808 <akuster808@gmail.com>,
        openembedded-devel@lists.openembedded.org
References: <20210727053348.39811-1-mingli.yu@windriver.com>
 <afd4eb85-8fed-5332-e843-8a0662833fb7@gmail.com>
From: "Yu, Mingli" <mingli.yu@windriver.com>
Message-ID: <c9614a91-0cc6-b32a-1199-2cc2699e62bc@windriver.com>
Date: Wed, 28 Jul 2021 13:53:06 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <afd4eb85-8fed-5332-e843-8a0662833fb7@gmail.com>
X-ClientProxiedBy: HKAPR03CA0027.apcprd03.prod.outlook.com
 (2603:1096:203:c9::14) To CO1PR11MB5009.namprd11.prod.outlook.com
 (2603:10b6:303:9e::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.142] (60.247.85.82) by HKAPR03CA0027.apcprd03.prod.outlook.com (2603:1096:203:c9::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.7 via Frontend Transport; Wed, 28 Jul 2021 05:46:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f55b1b3b-7698-4437-af57-08d9518b190d
X-MS-TrafficTypeDiagnostic: MWHPR1101MB2191:
X-Microsoft-Antispam-PRVS: 
	<MWHPR1101MB219155F0A1CAF3A348B87A33F1EA9@MWHPR1101MB2191.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Xet+372i9yzJdT/wYT/7I9cP5y+lWuGXq2iJt+DoSyrMxp2rJvzL+OqbppUS5a/KyJIEhqaQ4KYce8duzHaOYz8m7btz5TuagFR0y0gZNZVtO2+h/5oGcQwJ83+5+FW7jW+Q988JEZ8jWMK3z5iIPIU01L0b9htrGKK1wT5A30IUpf6KocIPa5lPlJ8gwQVQAm6SkS+mOIlwmgJSv1F3sfe34IJJPpGEYDexV7zo9/95j3WPgdOE+LQI6taOA8EoeNNaFmKkRPVHjue3+LfBIABYR8LFPMsP3tyUqirjF6D9n6P0LEmB3W6X4DEk44SF82j6L18R0NeXIh8FRkpslJ+osVln44WsOvAXATTcBIKnnQyR4epGc1l2qzucwmfgbfZVwkawyjlEfeFVC15k9x43nxtshdLO/072KIqdQ4EEllsYNoZOH/6DGwVhHFFdWDNv/ZpBjK+gqLjFVOvQgvI8qY3dkbcPldRy8P9IpWXAC8RF05gu7HflE9ksRHVlEl1jixcB8+caQ+G/UVer/nK65JlU+ZBAUsXe9gYGPyUR/1kQBtVHsn1rTkMTJBVlRVGoWo/39i9lnrABa4ZEIsVUIt7Dya7WOnLyS6TsZ9Laz+HfFnNq1EDe1CHOavgrAWrWXOb3XmuYGVT0OzQpxmqBDX812mClR1RZAP25esyEc3MUHts1I6tMMlmSz1rihHRyXQWCM7PKeWQkIKtr6lH28dv20Fr1A95yiKCfjtUnlFnaYqdMk31ZnqpsEnYVk/kxRIZKyN6rpMFVnEXDeoR8kcI1sNyQZZWtfAOxM3rAyWlO74W46xUePxu/oSGbAn5Ky/iBFU4Dxveui0pGV6jDUslMvKLnbAHR7mUBtmnzWWkE2D8exXX3xEL3fR0UrGqb38nDQCVK/9qHw8ZQlcmiYjjGLBk0lS9HKSAZ0fQ=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5009.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(31696002)(2906002)(508600001)(86362001)(6666004)(38100700002)(6706004)(2616005)(66946007)(26005)(316002)(83380400001)(66476007)(5660300002)(186003)(31686004)(66556008)(53546011)(36756003)(966005)(8676002)(6486002)(956004)(38350700002)(8936002)(52116002)(16576012)(78286007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VldTUTRPSjNTRm5wMWhDZEdSam5tUjBTYXBlSE1neTZ3ZW5LWjZ3UUJCekRo?=
 =?utf-8?B?akNBdC9sNFlhajdkc2ZWZW9JU0psV2xyYzNmMlk0VFFVM1AvY2FSdXVWYm9j?=
 =?utf-8?B?ZS9DRHlaYTRRRDl2bk1xK0dOSmNCSk1DMFU4bmZkbGRWMzlLckpWTUFpSEhw?=
 =?utf-8?B?dmJyU2lQdjZMWWE3YVFWaFVMSGx1RExnUmplcTdDUGRNQ1NYZVFTVk5LVUFK?=
 =?utf-8?B?K1hrMU9hZUFZRWVKU2ZiN3huOVJsQTBrWkpXa0o5bDlmdHNZamx1U0VJUFJx?=
 =?utf-8?B?Rk8yMUhqM0NXUnhxblA5UmxJcDg2VmVwejlCOHl4aGJiclQ1M3JoWGxuWVJN?=
 =?utf-8?B?eE5Rd0NGUVZ3VkVjSnJzVlMxWi9MWjBKN1VvMFVlekJDN0FWUEVvaUVhZDA3?=
 =?utf-8?B?NGRvOGNYMEtlczNTYjZSUDdIWGVFTUFYc1I0M2RMeldkaFZmWi9QOS94WmxZ?=
 =?utf-8?B?VG82cWdvazBMRjczUVR0ZWJZUjZVRXFZT1FFL3NheC9LNGFkRUNMUWRaVC9j?=
 =?utf-8?B?aXNxSGh1dnlxQ2ZtVHVGK2I4OS9Ob1oyVTg4T0JFUHptTEhmNHhKUEp0TThK?=
 =?utf-8?B?SmhleGFFSFN3Qk1SblYrMEQybm1LYnlDNnd0d2FKTzFaQWJRclNGNjIyMllr?=
 =?utf-8?B?VzA1ZjBySkpDYXhucDNxZEhvUXp2RGhMTk9mbjdiWWRCb1MwS05uRkM2VDBl?=
 =?utf-8?B?eTZacGZvZGwyTW1VRHY5MDAralkrN2xMOCtnQUhZNUpKVmpOL3NBS055TStH?=
 =?utf-8?B?dEloTXlZdVdQTkUxYUNDL0tkVHJpSnlxY2R6NHpYZERwL3doVXd3YkVleHBq?=
 =?utf-8?B?emcyKzVDc2pLY0lzVmhDWnlXUHFsM2E3QWNpa0VrWkc0MnhVejBOVkwrUHBx?=
 =?utf-8?B?ZjVnNWxjdXZmUFZjSTB4bVNLcHI4UmwyTVNINzlYbW9meW1ZNnFYWDNrT0Fq?=
 =?utf-8?B?ODNrQjgzcjlLQStmUFpuMGNhVEJNd1dFNlVNbkFBQi9sYzlXUDVQRVBjZ0E4?=
 =?utf-8?B?eDJ6OTk5UFFCUTBmOG4wakpPemo2NzZjT3AyZkFFYnVsSmpXNXE1NjZqbzhh?=
 =?utf-8?B?a0ZDZXhyOFBBT2Yyb3gvbHRRK3Fnbk02cUluRysrSzMrK3NIaXZNZ25uS3l2?=
 =?utf-8?B?RHkxZEVIOFV6MXdwUHEwajd2MkZvSkVvUDhMSXZPejhpWjdpWnJBR21vMVpT?=
 =?utf-8?B?aEJxTmc4ZERFY2hJSWZzUC83YlZUUkhiUURJMEg0eENzY01qaG9ZejBlUFhG?=
 =?utf-8?B?KzNNQlFTWEtUdUNkZ3FXSkhTaEcwdDdXT2pzWk5EQmROWjNwL201UFd0ZmNm?=
 =?utf-8?B?MlRnd0ZPamkvNVZpdCt3NnhpYkpNS0Q4OTFRcDIzUWFsR1RUc2s2V0tpREJJ?=
 =?utf-8?B?UVNKV21ZbytlYTNzaERGUURGbElPZVp6bnVhYjF1eDd0OXd3TDVsZzFjd0kx?=
 =?utf-8?B?SGFzMlZKY2JSTjViNHQzVHdZTmEwUjZQYm8rVXdhUG5QQWVPc0N4czRYZCt4?=
 =?utf-8?B?NklHeFUyVHg0QnBjV055bHo5SzRPNGQxcmE5RFAxTFhFanlZelNrTWJXeTRo?=
 =?utf-8?B?SGFpVkdpMkdYL2pjenRVQnNQTEZsbi9WNjBrc0JiVU9FVXRrWm5kRWpXeUtX?=
 =?utf-8?B?WXRuRzV4UzFXei9vMk82Ry9YVUFqa0pVNHA1YzFWKy9UQnNENTd2QUFwOXdH?=
 =?utf-8?B?QW9rVXlCUExZcyswS0hiWk5kc2VSU1hkaWFwaGxiOFVJUHg4YU8zbWlIak5Z?=
 =?utf-8?Q?CkUDtHY4/tOQpHVPv4jdr/T8LGTIyoe5So3GQZy?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f55b1b3b-7698-4437-af57-08d9518b190d
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5009.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2021 05:46:51.5104
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BtCCXVpZlWXXIM6DELe7uc3LUM0QcAQwM8SwgmA2oCeODtcf+JUaFlBuT1r17JmIx3MShWCvDzkm3wBejHw9Lw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1101MB2191
X-Proofpoint-ORIG-GUID: I_C53U_kERPYTSZZLEcS8r3muhCy9Dvg
X-Proofpoint-GUID: JVRdVB0HhdgkcL93Ly4xlOoLbJz0xA4D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-07-28_05,2021-07-27_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 suspectscore=0
 spamscore=0 phishscore=0 mlxlogscore=999 mlxscore=0 clxscore=1011
 adultscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2107140000 definitions=main-2107280033
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 7/28/21 1:41 PM, akuster808 wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
> 
> On 7/26/21 10:33 PM, Yu, Mingli wrote:
>> From: Khem Raj <raj.khem@gmail.com>
>>
>> Drop fix-a-building-failure.patch because upstream has made is narrower
>> to apply to emulator builds and not just any cross compiling builds
>>
>> Add missing dependency on boost
> 
> Thanks. I backported this a few days ago and is in stable/hardknott-nut

Thanks for your comments, but I didn't find the stable/hardknott-nut 
branch at https://git.openembedded.org/meta-openembedded/refs/heads

Thanks,

> 
> -armin
>>
>> (master rev: 2183f0894110a6913c44bee9a1f4b1cea7639bdc)
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
>> ---
>>   ...ve_10.5.9.bb => mariadb-native_10.5.10.bb} |  0
>>   meta-oe/recipes-dbs/mysql/mariadb.inc         |  4 ++--
>>   ...ng-failure.patch => cross-compiling.patch} | 22 +++++--------------
>>   .../mysql/mariadb/ppc-remove-glibc-dep.patch  |  2 +-
>>   .../{mariadb_10.5.9.bb => mariadb_10.5.10.bb} |  2 +-
>>   5 files changed, 10 insertions(+), 20 deletions(-)
>>   rename meta-oe/recipes-dbs/mysql/{mariadb-native_10.5.9.bb => mariadb-native_10.5.10.bb} (100%)
>>   rename meta-oe/recipes-dbs/mysql/mariadb/{fix-a-building-failure.patch => cross-compiling.patch} (61%)
>>   rename meta-oe/recipes-dbs/mysql/{mariadb_10.5.9.bb => mariadb_10.5.10.bb} (85%)
>>
>> diff --git a/meta-oe/recipes-dbs/mysql/mariadb-native_10.5.9.bb b/meta-oe/recipes-dbs/mysql/mariadb-native_10.5.10.bb
>> similarity index 100%
>> rename from meta-oe/recipes-dbs/mysql/mariadb-native_10.5.9.bb
>> rename to meta-oe/recipes-dbs/mysql/mariadb-native_10.5.10.bb
>> diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/mysql/mariadb.inc
>> index 9833b2885..2974341bf 100644
>> --- a/meta-oe/recipes-dbs/mysql/mariadb.inc
>> +++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
>> @@ -11,7 +11,6 @@ SRC_URI = "https://downloads.mariadb.org/interstitial/${BP}/source/${BP}.tar.gz
>>              file://install_db \
>>              file://mysql-systemd-start \
>>              file://configure.cmake-fix-valgrind.patch \
>> -           file://fix-a-building-failure.patch \
>>              file://support-files-CMakeLists.txt-fix-do_populate_sysroot.patch \
>>              file://sql-CMakeLists.txt-fix-gen_lex_hash-not-found.patch \
>>              file://0001-disable-ucontext-on-musl.patch \
>> @@ -22,10 +21,11 @@ SRC_URI = "https://downloads.mariadb.org/interstitial/${BP}/source/${BP}.tar.gz
>>              file://0001-innobase-Define-__NR_futex-if-it-does-not-exist.patch \
>>              file://0001-aio_linux-Check-if-syscall-exists-before-using-it.patch \
>>              file://sys_futex.patch \
>> +           file://cross-compiling.patch \
>>             "
>>   SRC_URI_append_libc-musl = " file://ppc-remove-glibc-dep.patch"
>>
>> -SRC_URI[sha256sum] = "40ab19aeb8de141fdc188cf2251213c9e7351bee4d0cd29db704fae68d1068cf"
>> +SRC_URI[sha256sum] = "a5ff32f9fcaaf26bf5cba94accc7b246d2d5eb75710d027e40122df6bac0babb"
>>
>>   UPSTREAM_CHECK_URI = "https://github.com/MariaDB/server/releases"
>>
>> diff --git a/meta-oe/recipes-dbs/mysql/mariadb/fix-a-building-failure.patch b/meta-oe/recipes-dbs/mysql/mariadb/cross-compiling.patch
>> similarity index 61%
>> rename from meta-oe/recipes-dbs/mysql/mariadb/fix-a-building-failure.patch
>> rename to meta-oe/recipes-dbs/mysql/mariadb/cross-compiling.patch
>> index 9149ee21f..0f4815b18 100644
>> --- a/meta-oe/recipes-dbs/mysql/mariadb/fix-a-building-failure.patch
>> +++ b/meta-oe/recipes-dbs/mysql/mariadb/cross-compiling.patch
>> @@ -1,28 +1,21 @@
>> -From 1b2b6a61c9f82157cd2e0c3744f6c07e07aeb0bd Mon Sep 17 00:00:00 2001
>> -From: Mingli Yu <mingli.yu@windriver.com>
>> -Date: Mon, 4 Mar 2019 01:11:30 -0800
>> -Subject: [PATCH] fix a building failure
>> -
>> -Upstream-Status: Inappropriate [configuration]
>> +This is not needed for OE builds
>>
>>   building failed since native does not generate import_executables.cmake
>>   In fact, our building system will export the needed commands
>>
>> +Upstream-Status: Inappropriate [configuration]
>> +
>>   Signed-off-by: Roy Li <rongqing.li@windriver.com>
>>   Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
>> ----
>> - CMakeLists.txt | 5 -----
>> - 1 file changed, 5 deletions(-)
>> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>
>> -diff --git a/CMakeLists.txt b/CMakeLists.txt
>> -index fc30750..4f9110e 100644
>>   --- a/CMakeLists.txt
>>   +++ b/CMakeLists.txt
>> -@@ -347,11 +347,6 @@ CHECK_PCRE()
>> +@@ -392,11 +392,6 @@ CHECK_PCRE()
>>
>>    CHECK_SYSTEMD()
>>
>> --IF(CMAKE_CROSSCOMPILING)
>> +-IF(CMAKE_CROSSCOMPILING AND NOT DEFINED CMAKE_CROSSCOMPILING_EMULATOR)
>>   -  SET(IMPORT_EXECUTABLES "IMPORTFILE-NOTFOUND" CACHE FILEPATH "Path to import_executables.cmake from a native build")
>>   -  INCLUDE(${IMPORT_EXECUTABLES})
>>   -ENDIF()
>> @@ -30,6 +23,3 @@ index fc30750..4f9110e 100644
>>    #
>>    # Setup maintainer mode options. Platform checks are
>>    # not run with the warning options as to not perturb fragile checks
>> ---
>> -2.17.1
>> -
>> diff --git a/meta-oe/recipes-dbs/mysql/mariadb/ppc-remove-glibc-dep.patch b/meta-oe/recipes-dbs/mysql/mariadb/ppc-remove-glibc-dep.patch
>> index 1ca86bcca..d082d424b 100644
>> --- a/meta-oe/recipes-dbs/mysql/mariadb/ppc-remove-glibc-dep.patch
>> +++ b/meta-oe/recipes-dbs/mysql/mariadb/ppc-remove-glibc-dep.patch
>> @@ -36,7 +36,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>   +  __builtin_ppc_get_timebase();
>>    #elif defined __GNUC__ && (defined __arm__ || defined __aarch64__)
>>      /* Mainly, prevent the compiler from optimizing away delay loops */
>> -   __asm__ __volatile__ ("":::"memory");
>> +   __asm__ __volatile__ ("isb":::"memory");
>>   --- a/storage/tokudb/PerconaFT/portability/toku_time.h
>>   +++ b/storage/tokudb/PerconaFT/portability/toku_time.h
>>   @@ -124,7 +124,7 @@ static inline tokutime_t toku_time_now(v
>> diff --git a/meta-oe/recipes-dbs/mysql/mariadb_10.5.9.bb b/meta-oe/recipes-dbs/mysql/mariadb_10.5.10.bb
>> similarity index 85%
>> rename from meta-oe/recipes-dbs/mysql/mariadb_10.5.9.bb
>> rename to meta-oe/recipes-dbs/mysql/mariadb_10.5.10.bb
>> index e6743fe97..8ae8241b0 100644
>> --- a/meta-oe/recipes-dbs/mysql/mariadb_10.5.9.bb
>> +++ b/meta-oe/recipes-dbs/mysql/mariadb_10.5.10.bb
>> @@ -2,7 +2,7 @@ require mariadb.inc
>>
>>   EXTRA_OECMAKE += "-DSTACK_DIRECTION=-1"
>>
>> -DEPENDS += "mariadb-native bison-native libpcre2 curl openssl ncurses zlib libaio libedit libevent libxml2"
>> +DEPENDS += "mariadb-native bison-native boost libpcre2 curl openssl ncurses zlib libaio libedit libevent libxml2"
>>
>>   PROVIDES += "mysql5 libmysqlclient"
>>
>>
>> 
>>
> 
