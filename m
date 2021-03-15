Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.77])
 by mx.groups.io with SMTP id smtpd.web11.339.1615828960351793498
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Mar 2021 10:22:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=jznCrSO4;
 spf=pass (domain: windriver.com, ip: 40.107.93.77, mailfrom: randy.macleod@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EXyyipTCEFQV/Hkl7U5kdklNtu2uUx7uIM6INeed0swIm/4xffxm5jw+cNNUBl3OLX8X7rJhtbtXJnvC/VvJaOGEnx0i7XDrmAP6fyeZ4xZJ3qifccl79UjNoeYSl43qYDLk9wKh4qMO0OZ8JBWG2p3tPs1C1SEwEXcDO+LWnCtf8JPhBz0nXiIREAmIF7i64vegvKTwS5opQeRPltM6i1M46/4lQ8el+29+/a6XD+FVTxiXOb2cjoZqEqWB2TMilLOwAw+Cf0a0HRlwOzZ+olN0Qcak/w4V/5Bme2LAADs2lFFvDbUfTMVZXTje2Kt3xMK3UxvJkYziU6+tp/MdYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x7P+tFWvtlTHjlmqCm22WRIVDxYSDQ/h4IM6/Amu//Q=;
 b=SEGOjpwAlppqWwoN4Lb/fknzPoS4Eq5C0cLN1xzh3V98Y3UWIPUgSI7SXFH33DRyx0Zg1IPwE3iA5wWHKw/nA5YF/KV+o99EIKjPzOVDcZQvyyVDy1xOkPDXC/Tm7s94g0ViXu6cT35/6T3qUNfxcNlhEp84SstH22zj6yHIvd8B24fvdJuG391jr9DakdnHThrhibdPDKMbyorE1O8Es6ewuP/NKG19pdoqVe7rPgSTFPUnXGq2k3sLs91Uu64SnJE4Zw4RQYocLqB240ZQ5GzPYNgxgpawmKkgUdjHcJ9ALpacyVUMtE/9twwjoa3kohbXb5QWuGpSjSWVMeMBiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x7P+tFWvtlTHjlmqCm22WRIVDxYSDQ/h4IM6/Amu//Q=;
 b=jznCrSO4iImEXe8MxYfNpVNLogdqIxBajsQt8a3VAVblOJ2YIoLC+Kd1Y3u3IBj57WrKevKMrLi0ibyGxnmW3K+uuoOEHz3jXlNPPWwIlUyR7A85AMg3k2td6odjVBgfeLzmovJOc32FkCPy1Dxx18vvvuX4G0NLOUQq0CRKNyE=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=windriver.com;
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by DM6PR11MB2986.namprd11.prod.outlook.com (2603:10b6:5:61::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Mon, 15 Mar
 2021 17:22:37 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::f17d:2de1:291f:80a9]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::f17d:2de1:291f:80a9%4]) with mapi id 15.20.3933.032; Mon, 15 Mar 2021
 17:22:37 +0000
Subject: Re: [oe] [meta-oe][PATCH] tclap: upgrade 1.2.2 -> 1.4.0
From: "Randy MacLeod" <randy.macleod@windriver.com>
To: openembedded-devel@lists.openembedded.org
References: <166C8F210A60E2D8.24959@lists.openembedded.org>
Cc: Otavio Salvador <otavio@ossystems.com.br>, lans.zhang2008@gmail.com
Message-ID: <6d8b145a-6c36-71f0-a36a-92021bea2849@windriver.com>
Date: Mon, 15 Mar 2021 13:22:33 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <166C8F210A60E2D8.24959@lists.openembedded.org>
X-Originating-IP: [198.48.226.187]
X-ClientProxiedBy: BY5PR17CA0033.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::46) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
Return-Path: randy.macleod@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.25.44.2] (198.48.226.187) by BY5PR17CA0033.namprd17.prod.outlook.com (2603:10b6:a03:1b8::46) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32 via Frontend Transport; Mon, 15 Mar 2021 17:22:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2a911ea1-77e2-48a6-1a02-08d8e7d6edf0
X-MS-TrafficTypeDiagnostic: DM6PR11MB2986:
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB29865AC54EDCBB18FA107B30F86C9@DM6PR11MB2986.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	NbTywZ+1lPVGEEuw9/xEF7cnoXX8wU2W8uOLgWRvT/VXmJVsYPmtjn4XFQwyW3AuHXn+wYITXi0NavyR15bSMBc0wypKl7kk7aOPjdgTzzMmXO6dnZwBOijR7H0xF5nKH+u8ZaDQamhUGP96LhWeUCSyMzpx7dIFOJQXREQBmH7p6JJl9lsTI17Nvw1OYojJsmjasdpMMfgWHDS+ggS6zWuioWa+8RQvDmz091MGzeGomgnz6Kxxlrd3g3abrGXlVi5tYtchoOKRQakJWBEHrRVyD7jRLZrtrqarUBUqHNcFKQvQv7z4F3x/WFOfcp25bR7goVF6UE/la24Mkq3GVwDTl1xrOclDg924Bdg9K+yyT4XWQzfMS2r49j3Q3Mfc7jLMmlzVdxuOPhuX+Iy8N8gtB0sybMrx6hzxKmzhdPUQ3lAmuXYaWgsJo4CGwIlEbecx6Q4NKj1QlAMbsn3RgcoNscL8dHthbeXBVg7nuHKUwZNKAmxIPBLnAWy0VFEu2RxhnLMY7IomlTJ5HnndL7CdsPQoyIw3DRe+GxL7G43ie377hvDryBel/kEZsSH+6mr4bOFMaa2x3M0IJKZM1U6YqSPmzG+TLNquxe2FatCF4REOsb3CIYOaKKM7uibx1vtVFojz8g3GmmLQB+4vnQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(39850400004)(136003)(376002)(346002)(396003)(66556008)(31686004)(66946007)(2616005)(36756003)(4744005)(6666004)(16526019)(16576012)(5660300002)(6486002)(6916009)(2906002)(26005)(31696002)(316002)(66476007)(52116002)(186003)(956004)(86362001)(8676002)(8936002)(478600001)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?Z0JhZDNEMWxKUUdGUVk0WU5nenI4UEpYY1hRKzBPTWQyOW5XOWRyY0RGZjVi?=
 =?utf-8?B?OUo1NjB1TDJiay9qc2tyY2xJVFpyWVc1ZVpsRGIxRXpYTVdvemV6Zm8yNGc4?=
 =?utf-8?B?bVNaY1NoL3FqaTBkVk54ZkxtYzhkU0dnY3FSYk13VUtMY0RiZkFVK1lUOElh?=
 =?utf-8?B?ZjZyM0xzNnV6aGpnenVIVlNkQ0VSbHJaUnJ2MGMzTjgrcUxQcFQzUlpHR3FT?=
 =?utf-8?B?TUtMdzZ0Z2VMZi9lUDM5ZGdZazAzRTg3WkZUb0RTb045cTRmTi9rVHNnU3Ja?=
 =?utf-8?B?WG5BcmoxeG1XVDdndWM2b01BclY3VWFYOWRwK0xaV1hiYjNmckhPRlg2ZG5K?=
 =?utf-8?B?RVBvaWdLczQxZFF6bi9yWnF4SGswWjQ5Y2QvbTJXR3pUMCtFRUN1ZlArdW5X?=
 =?utf-8?B?VzlnWVJNK0VUbnc0eXRTc0JvMXZSVkVMdWpPQmdnSEdvdnJERmUzeDJnYjVy?=
 =?utf-8?B?dTFnb2Nkd1psczJCWVozSUVIdC8rVDBrcGJCVnhwZ3gxanJaTWlzNmYzcWxi?=
 =?utf-8?B?czlGZ3N5RDBMNmtzakdNemV6emxpdjRPeldPVVJCMmdXblVRbjZWd2JlSHBm?=
 =?utf-8?B?a21pQ0pIa3lvLzJ0R0RHcGFCbGpMdCt6dHB3eGFodU9CWGJHM1dnTUJxbkh6?=
 =?utf-8?B?OXN0d3NyTXhPRjVtRm1EMHR2b3I1cmtSd3BLYmlpSUlDdmVDMEpZUnVmSi9K?=
 =?utf-8?B?NVdWNlUrN3VmK1l4M0MzUW9tdGVhbUgvb0RiN21WYUd0Q0s4VEh2U0lsWDE0?=
 =?utf-8?B?YlFHK1lQTFFHNEhmVlpweVJEYjZNYzFCaFZpUXJIQk5MTVdSY3M3NzdrRXFr?=
 =?utf-8?B?bGNNUUxwSDRvSW9UUG9uQUNrdTdTMHkvUnlNejVkTlM1Y3MxNXVhSmwrNGtt?=
 =?utf-8?B?ZTRuYTloMnd0QTluLytic3VvTEJDcGJPOXpubkpvYVJGSEwzd1E2ZnJQMWxv?=
 =?utf-8?B?NVozVk1oR2JiT1pBSzAwR3EzaVJoQXg5bXVqbjh2SlBOZHYzZG1DbXFGbkVS?=
 =?utf-8?B?bm5RcVJTQ0k1ajU0Q0lyWWZlenpKTmwySENYbWw1MWhvMVpZanEvSnorQyt4?=
 =?utf-8?B?NjBFdi83WFZNY2RxV0xiblVIT0RwYzVQUjFoOVQxT0FYdTAwMU0waEtoTCsx?=
 =?utf-8?B?ZG9XM1FvWlZqeGZLZ2ZWUzhCSjNHUWlrT3d2WS83VjhKNzl6TlZHbzEzSC9Q?=
 =?utf-8?B?NTVjeUxEVlhBZFRKZDJZYVMxRW1QME8reVVsVlQxUDQzZ21ZdGhSRUtzR09w?=
 =?utf-8?B?WEU4OGVhNVVMdTNQNjd3R2YwNDFRaHZnYlFJSzVOaGdLdlVGRUF6UjNCNklO?=
 =?utf-8?B?QmpqcTRxOU5ReGNCUkloTjJhU1JLU09RdGQ4MHB1MTN2UzhvQWFCZS9UdDkr?=
 =?utf-8?B?ejRkNlZIOGlydDRiZ2JIKzl3N3YrRXQ4RkRuWkNza2ZncHlZM2JDQWZLUW9o?=
 =?utf-8?B?akhKV1ZNS25vZGxSK3p5ZXZtUHdOQU9uOWhGL1U0azZmR1E2VnBXVHNFUStO?=
 =?utf-8?B?ZFI4ak9oZ0NSenZyUUt0YjFReFJGZ1hUd05XY3FuMTR4Zk5ZU01FdUJsQUto?=
 =?utf-8?B?eVJsaTRCM2tTNkk4QTFCNExGQ3J5Ti9sdUs4bnpsVUVqTHN3Z0tMUFdMSC9D?=
 =?utf-8?B?M3dLRWR0MlB2cjlkc3FpNmlGbWJBa05MSFQ3Ri9PWXBVZEVuU2NucXdZTGFX?=
 =?utf-8?B?U3ByWWlaQXEwUVBPdnkyUzBKV1JNNTliNXJ4T0hyeUtxc01jNHk0a1cxUHRI?=
 =?utf-8?Q?9bpsY5rlD7UWRBHtRP/PgZneyQphd9RLl4S4w4n?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a911ea1-77e2-48a6-1a02-08d8e7d6edf0
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2021 17:22:37.5787
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AOddRexqOixn9Wsh6JORki3R79nmpYAabfQso27po1UmLUfq1YuX9sjZCojUMMzKJUfKdwxmWq/NlNVwB2FTXI2ePmkKRQR/XVo7v8A+xOM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB2986
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-CA
Content-Transfer-Encoding: 7bit


bitbake of ima-inspect, which depends on tclap, succeeds.

I didn't check on meta-freescale but I've CCed Otavio here.


BUILDALL-QEMU LOG FOR tclap
START TIME: 2021-03-14_17:51:24
HOSTNAME: ala-lpggp3
HOST OS: Ubuntu 18.04.3 LTS
HOST KERNEL: 5.4.0-62-generic
===============
BUILD RESULTS:
[glibc]
PASS: qemuriscv32
PASS: qemuarmv5
PASS: qemumips
PASS: qemux86-64
PASS: qemuarm64
PASS: qemumips64
PASS: qemuarm
PASS: qemuppc
PASS: qemuriscv64
PASS: qemuppc64
PASS: qemux86
[musl]
FAIL: qemuriscv32
PASS: qemuarmv5
PASS: qemumips
PASS: qemux86-64
PASS: qemuarm64
PASS: qemumips64
PASS: qemuarm
PASS: qemuppc
PASS: qemuriscv64
FAIL: qemuppc64
PASS: qemux86
===============
PASSED: 20
FAILED: 2


tclap does have some tests and I may work on wrapping them up in ptest.
-- 
# Randy MacLeod
# Wind River Linux
