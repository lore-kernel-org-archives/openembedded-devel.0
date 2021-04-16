Received: from NAM12-MW2-obe.outbound.protection.outlook.com (NAM12-MW2-obe.outbound.protection.outlook.com [40.107.244.41])
 by mx.groups.io with SMTP id smtpd.web09.10848.1618587755990885590
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Apr 2021 08:42:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=N1BGFtej;
 spf=pass (domain: windriver.com, ip: 40.107.244.41, mailfrom: yifan.yu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QbOTMKeOhdCRfgSFEi06IiJSHTo3JvpqZA/pTU53XigliS0pQklqIcUkMGR1kLf0vfx02csPErHWW2+olwN9eqzFMy6rubTYXPRss8R8uCu/flPAOrSe8HOQ/M/d3zkW7Bj5imPU1SorX370jmNph3ZNZwdXb4OUNXbgCtXDWNrtnmLk9Vsrccqg0ODWWalr9EXZt8Qm1ilVzwUe1gFdP4aZlliEk9OPNbpyDFs9EVX5tMgTUusOgNg0rRdas+4HXKrwPRigOi7VqiQsNKCAvjq30hTRp+ucNFQp1BbaBwwnltyPRNEEkcHHXKmaK71tZgvPtuI12bJmhN/VTU5/Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V+KRZyT/LUnjRMGjR/XQCKj/bI5LZsycV3ipAVJuecQ=;
 b=W5gecxqKGk6CEO02Q8UQmQLiJ4wQbzUWur8lAHvRW8zpEtuu0eaOz7n9yCSzpH489bKm1TIeueSAOuAKPuHDrgC6qcSjv6/QFPYftLAPWW+h3BF3fXG62ytlsekeiE4icwxWK7z9ND+MX4EgAMc8cekVCzSqFCMwaGhqNFxYqsmPPgbiU8A+o7XVN/o8GrDus6dWvT8V6KfQBBt+lnREME98dlD3C2GRS8xN9rTgb0FTxqphfHEe3sf/tXaBFHkJdiPfxr2bcVNSpgkX7QORSTt4hPNqaj1WNweFV/f1WwPg7aH11PngVMLEadDKXoXk75sBC9E7B/mM6L0WW7Cgvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V+KRZyT/LUnjRMGjR/XQCKj/bI5LZsycV3ipAVJuecQ=;
 b=N1BGFtejUNnZnIHG5leqK7BH6YTGiA364vz5PCcbo7Onj1kWI8sdMOLCo4YLdfnaQ1lwT29p+FFuEHmXWzKz9sRu53NxP2q57xH/BtuQ1g7vpG1FN8hzGqSwVELnbZ0l/+1nKOVcFFS31GDiQICcPoHO0JUdYveuPOH+mnqfFjs=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SA0PR11MB4719.namprd11.prod.outlook.com (2603:10b6:806:95::17)
 by SA2PR11MB5147.namprd11.prod.outlook.com (2603:10b6:806:118::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.19; Fri, 16 Apr
 2021 15:42:34 +0000
Received: from SA0PR11MB4719.namprd11.prod.outlook.com
 ([fe80::24e6:c5dd:a024:807f]) by SA0PR11MB4719.namprd11.prod.outlook.com
 ([fe80::24e6:c5dd:a024:807f%9]) with mapi id 15.20.4042.019; Fri, 16 Apr 2021
 15:42:34 +0000
Subject: Re: [oe] [meta-oe][PATCH 1/2] syslog-ng: upgrade 3.24.1 -> 3.31.2
From: "Yi Fan Yu" <yifan.yu@windriver.com>
To: openembedded-devel@lists.openembedded.org
References: <167660B107DD8DBF.31742@lists.openembedded.org>
Message-ID: <f90b1c0a-1a63-6b65-64d3-cb17e8b80204@windriver.com>
Date: Fri, 16 Apr 2021 11:42:30 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <167660B107DD8DBF.31742@lists.openembedded.org>
X-Originating-IP: [135.0.247.71]
X-ClientProxiedBy: BY5PR03CA0019.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::29) To SA0PR11MB4719.namprd11.prod.outlook.com
 (2603:10b6:806:95::17)
Return-Path: yifan.yu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.42] (135.0.247.71) by BY5PR03CA0019.namprd03.prod.outlook.com (2603:10b6:a03:1e0::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16 via Frontend Transport; Fri, 16 Apr 2021 15:42:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 81f0be78-ddaa-4673-7b80-08d900ee40c5
X-MS-TrafficTypeDiagnostic: SA2PR11MB5147:
X-Microsoft-Antispam-PRVS: 
	<SA2PR11MB5147AC77391EE0997BC0D34E804C9@SA2PR11MB5147.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:36;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	zCo5s7wM+aeivaO6HYC155MNCRp97OQpd2Z63u1OjnLL4y2/tJpOyHuetiUW4f6lYfMdIMUnju7QaWDWLfe12+khHL9sGiW2cO9PNrR4SUDYCYY/t63UWJ3wxtmR+CLPA4QXGVVZ+s675AKlKTWtr1ugxkhipWysQI2IIqDBNtcCuk0QrdebLPxL0NoNo2lka90WoI1eRUxN8YC3dWpwSSQY9dTeQh3prrpz2v6WOlObTDIKZaN6GRssuRMvJ8BkkvP0nR6f9O2YHocb0QSKDuOU/qAqLx/DxdyWDPO4ndpdP8lLBPbzTerNHiBJzSBGBaZqYWZNUi7k9EyDvwZAFhU5uu30KqzWMn/nTLAOdJTcEzELguLq9SfFFZqhnPbTo5+h0ByAGKQjjLWGW5lpfb5V0W/XDDn3961jRUUQLUd+8JfBwTrZTTqHpekotThF9JZ5mdt/uElfMAe614E1+fqWnt3Bm6uHK38DEqeIRUtYOmR/CBvnKB3KjLxCtTq+k150+UJgE/ZiJ5bMqfh5jkqfuG7l+LCEFnLnNoao96rYqkKugfS5NB8DiiQrz0NP59U6CoDupD7TCIoM07wIO9xE77Hh6J85Z9nps0UI5D6jNtcetYPRbWFAKVPbVNfA71HwPHKdLpDvaEs6U47aSG4y+mcHiCWHONAxvvu0Gi6zqfooJbo7eBjiVtVLU4mg9PWn4yD7rS6hs2O/t4A/mS+cZIXls3OV/9dztJLhi3TqYvfwcVCXwuE3Y2JW448JUj9ozLcgLbROA0DDZQ9x36BHna/BoVzZcXWomzWmq7M=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR11MB4719.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(39850400004)(136003)(366004)(396003)(66556008)(8676002)(38350700002)(38100700002)(2906002)(16526019)(31686004)(36756003)(5660300002)(86362001)(31696002)(8936002)(52116002)(66476007)(66946007)(478600001)(2616005)(53546011)(6916009)(316002)(26005)(186003)(6486002)(16576012)(83380400001)(966005)(956004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?RFZjRDhJaG1EN09qYVA5TUlwTGlTaitWVHduU2NhRmtaY1YydjVORTBUZDJL?=
 =?utf-8?B?cWlqYjFBQnVVNzdydDRYUHF1eEJYUm1JWi9mQmdSeWhiZGVsZURVbXVjZGpW?=
 =?utf-8?B?MXp4M09ZTFJIc1hQR0NCcGptQ1FtTnZ2ZmZwdkNNMHpwT2s4azFyQ1JsOGVE?=
 =?utf-8?B?MzBTTWh6Zk5acDZibEt1L0d4VHdncDFCVWt2UDY4NnoyakU2d0pydGR6NCtW?=
 =?utf-8?B?cVN0YXV6c2hQUy9UUVVKeDRtOTRDbG90Yk5rZUFMV1UyZTg2STNpZzBaUVVN?=
 =?utf-8?B?d1FFYmQ4a21DcXFJZHZpUkgwR1Z5Yk5CRGl4UUxXeW8zQlhQZWo5V0ZyQlk5?=
 =?utf-8?B?TTY0b25rY3RHZ09rUDh4M0dndndzMGZTU3h6R1ordHlOR2xqT3BhSWNCR0VO?=
 =?utf-8?B?ejRLT1VnNUZjeGVmRU9sbjVuQkRCZ3hRbjBGZW91WWovdVF5dkZUYWJLZzhW?=
 =?utf-8?B?ZEZPLzNkcDZsK1RXRlY4bTdYSUVIS3Y0RGNuYXRBNzNkM0pnQ05wN1IvRXds?=
 =?utf-8?B?M0o3RjNTNlNSclBRTm14eSt4VWtSdkJyQnpLV1NpaHptWTlXM0xpeDR2dFFL?=
 =?utf-8?B?TW5Gcm9LVGVtOEkrb3RWa3d4cHp4UVJja3IyUG4yODRTR0h2OXA2aXdNeHpv?=
 =?utf-8?B?UXFwTy90bDFYeDErVStIRXVFWnlMNG9ubjhINDNhSkJrMWd6dlBUejdmRDB0?=
 =?utf-8?B?dTZTQ1lsZTlJOEpYRDNKUWt6ekhaN044SGxGRlIwcDRtNk9hMjVVbUl4NWNq?=
 =?utf-8?B?M254cVpjdlRwcVFsSHRPRVA1Mi9qSnpYWGtrYU1GL25ROUp5aXNTL1QrOUk2?=
 =?utf-8?B?aFZUU2MySWhwZ2krRmEvWHRQQUpidEoyR0VHMUJWa3FST0tObnlqTmZPeHlX?=
 =?utf-8?B?WEJSaXIwSWR6VG1oNUVZZ2VubWIrbXFSNk55Z0dINVJnUU5kM2FPS0Qxci9o?=
 =?utf-8?B?bDE3alp3TGgrcThmd3dBNEplN3lRMDNSZVlpYzlwbXFadGcrdWtwREVscmdJ?=
 =?utf-8?B?clRDcGo3NDhqbWhUWCtkcE1aelhBV0VZTnJRZ0tHR1BiWVdNcUtvR0FPSUM0?=
 =?utf-8?B?V01Da1hNSEhuSVdZdGxBM242Wlk2WHhzUm5zRkh5Z3ZLMzNQUmFIRFl3bnY1?=
 =?utf-8?B?VjZJUzZsNERVSENpZ1FwRVQ2RXJUby9xd2Vac0E2TmxTR29GM0t6NFFDZzdt?=
 =?utf-8?B?bzBVMmE0R25YNVRyeTFyUGs0WFlzV09ZZ1BXOVFUekR1MDRQOHV5TUJQWS8x?=
 =?utf-8?B?RkFuN0pHaUtmYWlmNmdhZG5KdTYvZExrQ20zMVpDRzBJQ3JqdHIvNnMyRnlo?=
 =?utf-8?B?V2JCcUZPR2tQcWhCZithYWlVL2EyK3R0QnBXbnpJckd1L0h0dmt4bnBwS0Fz?=
 =?utf-8?B?RWJzSU5zUTZPeWhuYVROUm1XMGhpOGJzWWxZb2ZWZmlBMkt2U0ZNLzFnKzdk?=
 =?utf-8?B?RklMY3JLTElvUTVYanc4NjdBNGpkNEx5bFgzbHIxNklRSnpjZDQ0K2NybkNk?=
 =?utf-8?B?TVZHMjJaU1RWUzdsU1c4cGJQRk1IU0NvVVhzTlh2VmtuUjlUMFdQMVc4ZWdr?=
 =?utf-8?B?ajFkOGsyWDhHMWljM1RUNDZKMXhodHY4cHNzU0hVOGF1VFhnVjF5aGZHdFdP?=
 =?utf-8?B?clNWRlFSLytubUduM0xHd1BISmJxZlNLS05ZbGV0blIwL01zcUQ4WGVxWVJz?=
 =?utf-8?B?QmlLME0vdkVZbEQvdW5jYk5WT3AwK1ZqZ21yVEtMWTBtWFNQYjdaaHc1NTRk?=
 =?utf-8?Q?f4TK/MJbBw6rJZsIGRQ65BDnH16v3mmr/os7XTS?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81f0be78-ddaa-4673-7b80-08d900ee40c5
X-MS-Exchange-CrossTenant-AuthSource: SA0PR11MB4719.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2021 15:42:33.9910
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CjLZ4z+pz0wKLZk44Rrzh/AYXktG7RKUejXJNkF4cnDF5grHbebBDt5dYX/s+X94yuFrbDegNDAqBntMu3XN8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5147
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 4/16/21 11:36 AM, Yi Fan Yu wrote:
> License-Update:
> Reword and clarify which subdir is LGPLv.1 and GPLv2.
> 
> Patch-Removal:
> * 0001-syslog-ng-fix-segment-fault-during-service-start.patch
> https://github.com/buytenh/ivykis/commit/a5e9caddbdb4d9d85133a440edec6aa7c1f018ac
> 
> Submit pending patches upstream.
> 
> Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>

all failures i think are related to gcc.
this was on master-next

BUILDALL-QEMU LOG FOR syslog-ng
START TIME: 2021-04-16_09:34:42
HOSTNAME: yow-lpggp3
HOST OS: Ubuntu 18.04.5 LTS
HOST KERNEL: 5.4.0-65-generic
===============
BUILD RESULTS:
[glibc]
PASS: qemumips
PASS: qemumips64
PASS: qemuppc
PASS: qemuriscv64
PASS: qemux86-64
PASS: qemux86
PASS: qemuarm
PASS: qemuarm64
PASS: qemuarmv5
PASS: qemuppc64
FAIL: qemuriscv32
[musl]
FAIL: qemumips
FAIL: qemumips64
PASS: qemuppc
PASS: qemuriscv64
PASS: qemux86-64
PASS: qemux86
PASS: qemuarm
PASS: qemuarm64
PASS: qemuarmv5
FAIL: qemuppc64
FAIL: qemuriscv32
===============
PASSED: 17
FAILED: 5
~
~


