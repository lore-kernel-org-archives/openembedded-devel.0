Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4ED16CA0EED
	for <webhook@archiver.kernel.org>; Mon, 25 Aug 2025 04:56:26 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.32167.1756097780000081622
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 24 Aug 2025 21:56:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Ubk0Q4cn;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=033242f007=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 57P46Fnl3917535
	for <openembedded-devel@lists.openembedded.org>; Sun, 24 Aug 2025 21:56:19 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=Aj+yEcFZ+oO/eAcmWrSxitwva+Q12uQ8e+pvUkNaeu8=; b=Ubk0Q4cnQZJC
	4REf9MFa2jqe3w5Fe2B8U++M/az5KLTV9069hiVmzmkGf026BuBCR4mGK9CXaxzY
	cAYAapf00JLrKCAzWFyY+gffGB4shhJDSG1E31KxRgyBzryezcfMpDwQt2t/H2H9
	jpAT9AKmj09D19KMA0bMIjpLRKrQ5bJ3K3ONLXUAWzvBjJQ5gDuJJwq19z6Ue2GJ
	m6/ETDqMR2ARGdchNrkBqIRqw22R2DxT5Qqu/GRc8RBP6RcjnwtHqGYD6pvqNqtg
	nY/EDw7ILIl/s9HqnP/QIijrqJcuYGcOfnBIaCcONgvKirI4dJS18qIkf3g8O54X
	3ZBokE+niQ==
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10on2065.outbound.protection.outlook.com [40.107.94.65])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 48q8x21aag-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sun, 24 Aug 2025 21:56:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uJqiOYlPEMSjoFpqLDHAbxUex4AGhoG/ye+zAG61YobSOrvqZndOMjfA1ZSbVZwXraUG6ByezcyU6xpjAh7d4yHaWBinYlRvNg96LZJro0+nwObCC/1Xg8g7NxK1E1/rQPeCZwmOmj8cFKoPjOBqEkWHzdGuzvbz99EWnraUc0DLJnpQWdOCiS6hJ3fd3ZH38nc244ZWL6nISZcEj5PRk5IZrwBra1PoMZqzVScqYYYLq8LpN0pEZRz9aTYTuoGtQwKZzAvLCftwduOTTaFEqs88moKyn3ZQIpcY7lhL3bKQWAi36jKALk+ibafF4a/kzwNU79TM7SCcidgWmcSJmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Aj+yEcFZ+oO/eAcmWrSxitwva+Q12uQ8e+pvUkNaeu8=;
 b=T2p0OKg8KJPWnF6AexgqcVmWKV0+mgFufqDCpOiZvEUnUImFPvAgm9I3OFI7fqJxRYpT8e388ojPTMYAx5mbRBw/xvU9ytUR1K5BGq7/j1FahrrDbqqgM0hIwRoHI+HwIyjH6anFkbMNjXTJIs97alR2eJEJMybNKthh0bpg+nobFvpffBKLRjlvRW6T8IugfEg2s4FaX/s/p4aZRbbUzwz79P3ISEueRdBtuC9grMnvhKfMvACfSvfKMob/9jfsW6S1rQsV2CeXp3YU1cvU/3aXhTDhtlEBDdZ51hQnaU9KRR6QvyaHX0ubPeTQb9JdRrLqGTBBjDGo5STwfAnyKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by IA4PR11MB9442.namprd11.prod.outlook.com (2603:10b6:208:55f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.17; Mon, 25 Aug
 2025 04:56:16 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%6]) with mapi id 15.20.9052.017; Mon, 25 Aug 2025
 04:56:15 +0000
Message-ID: <8295fd7e-8638-45b3-bc11-9ff9b06eb521@windriver.com>
Date: Mon, 25 Aug 2025 12:56:21 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [oe][meta-python][walnascar][PATCH 2/2] python3-protobuf: upgrade
 from 5.29.4 to 5.29.5
To: openembedded-devel@lists.openembedded.org
References: <20250806081346.2626482-1-Qi.Chen@windriver.com>
 <20250806081346.2626482-2-Qi.Chen@windriver.com>
Content-Language: en-US
From: ChenQi <Qi.Chen@windriver.com>
In-Reply-To: <20250806081346.2626482-2-Qi.Chen@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SE2P216CA0200.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c3::17) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|IA4PR11MB9442:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d17fe60-1ab9-4310-6958-08dde393b8ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|4022899009|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ZTY5L0hNbFA4MWJHZGwraS93Zk5mc21YaTQ3SDRGRElRUmRROXQ3VUlHNkxS?=
 =?utf-8?B?azU5dk1BczFBc0JTSE9ydE9kTnhTckFZU0JCQTNnRnRDcTdpZlNJNStPT0tu?=
 =?utf-8?B?Nk4wRGNuSHJEMmpVTjVodkVSMzhZOGN6MkI1c3AxY004NmJoRVgzTWZGdlEy?=
 =?utf-8?B?S3VqaDJiWDFVMGFsbFNNWlpLL243ajdwa1UyU2piUUhwckMwRWxOOXdOS2N6?=
 =?utf-8?B?ZDJSTlJ2TlEvTTMwVmJOY3V2R1p4bjVhTW1ad2sxakF0RlBRd1E2OXdDYmpH?=
 =?utf-8?B?aS9qM1V5Y1kwSXZiWUl1clNQTE1TamlxWm95NlJHUUFoTG9wVEtaRkNnZFh2?=
 =?utf-8?B?dlVaU3ovSWx0RmFya21iT2M2MkIwVmJETy93QjUwSWxsZnZtVUNoVUVldjVx?=
 =?utf-8?B?VlF4SWw0RFp5Q3RTekhPSVhvdEJDdUY1K2xERXNZODQ2WkV6WG1sdVJxZi91?=
 =?utf-8?B?dzFwZkVYbDRjS1g5UlJHUHpqdWtxQVBHNHFNQ2MrNnV1YVBmc0NJaW9CZHJn?=
 =?utf-8?B?b25wZlFMZWZXSVlVM2g5cHJsd1FrZFk5R21WZjBlZzBEZjRzMDJzQzZYVWQr?=
 =?utf-8?B?SVlnTmFYUVhqeU9KUnJqaVYvUjNUT0tqRHJWVWR6Sy9IZnhIbEYwc24wSVhX?=
 =?utf-8?B?K2RjUlFGWEw5TnR5M29jYnQ1aVk4UVhaVnZJdVlmdWlsdXpOc21LeVRiRFVJ?=
 =?utf-8?B?Ly8yUnl6bUs3NFJQVVFqY1RkQ2JBQm9YYTh3OVJaOENVcWtWd2sxM3pKWWdn?=
 =?utf-8?B?bFN5NHFvNG0wL3J5NUdrbUw3a0NtYVJ0Um9WVFBnRThXQWdLNmcwcGpWSmo4?=
 =?utf-8?B?UlBVeFZWb082dkhyMEpKZ1F1RUJiQnBSa0hYbm5yRTl1NzNuRVJzcktGVlFF?=
 =?utf-8?B?YTBhZEVPVXg5MmFIbzhNSERTTnM4aFVCL3YvNG5DRE14NG1LUWNzenpmcCtm?=
 =?utf-8?B?SHVFTkRFb3kwc0h3QWVIblE2QUExakljalhNQnd4bW5KN1BTNDh3S1plS1M2?=
 =?utf-8?B?d2paSGQ2Mi8vSGJUb3NhMVJ4L00wbXJhdjl1Q0d1aGJESlAvL2hXQmhiS3A0?=
 =?utf-8?B?WVVLWVFNMFVaWnF2Z3VNeklSeG1EdnFVbVoySEU5bmhyNmlrSlNhd3BMMy83?=
 =?utf-8?B?Q3ArU0pEUSs3RHUzTE1qV25ja1FQOXBEQjExMjMySkJ6cEpNNTNLbEhiQlEz?=
 =?utf-8?B?Q2dMMjFKL3UrVUI0NTlRcWFuT0tqT2VSTFJ3SHNManRRcnVHTmFwWmpuWXpK?=
 =?utf-8?B?RGpwTHZqbUhodDVCekt6VTBlakhhOW03ZkdnT0NQTHZNU2FxUC9GbTY1M3ZS?=
 =?utf-8?B?SzdaRldqaHh1YXYxMHdlc3pvVEQwNDRzSlhrTUx6dDdHbzZsQnBXNjJoQ1o3?=
 =?utf-8?B?eVFZMGM5NXY4TXNIV09DVVBmTGFlcmJKdlBOQXp0R1hGVkx3VWdSL0IyakdU?=
 =?utf-8?B?K3BNV3JZbnVWc3ZzMDRVenh2QW9LOUYvekhaNTB3S0NWNUk2SDJCMXU1bXoz?=
 =?utf-8?B?TUlnT2dvOU1SS1RjUUU1T3pyZldsck44SFY2QmRUTFU3aHZ0TFVxQ2JNcXZY?=
 =?utf-8?B?UHV2eDRyaHhVN2lxb2xjbE5RMWNWU1FTZW5ScXFVOXlvSE1JVlNWSmZmOStC?=
 =?utf-8?B?dVVabjJ4TndXYXRTbmIxNlZFcThhU0l2aFcybXdmaDVLSnFORnpVbXNod2RQ?=
 =?utf-8?B?YjJLelJraXJrRjhFdGNVSnY4Kzg4TmVOeVhnd0FMYm5uN0Y2YVhGN2xZampp?=
 =?utf-8?B?SXdleDlQWFduWU1TQzRGdzYzTUQ2aEZEdERyQk5HVnBYU0J5MUxWQXF2OWtS?=
 =?utf-8?B?aFEvaHh3UG9nZlRxTGo3SXZtRmhIeFhxc0owMnJEalFaVW1oaVh6ZnY5dWI5?=
 =?utf-8?Q?hySirYuWN3hDw?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?aEhJMlMraVNIandXbjZLeVNROEVabWF2U1NZbGxENVVTWE1OOGJUQjJKNHJz?=
 =?utf-8?B?Y1lrNWIzeEJmZUw0L1l0RjR2WFRIV0dBbS81cGNhMHowWUZPUW5BTmJId3c5?=
 =?utf-8?B?TmZEdDZTNkVtNFJ6ZFFrak5iaXhoWUxhMEJKVk9yN3lhWGJUTFFVSll5WjlH?=
 =?utf-8?B?bDJHZ2cxME9YeW5UQVNiQ0ZUN3BlUGxONXI0M05XUk9UKzBJb21BV3ZWbUo1?=
 =?utf-8?B?ZzU2WkJXb3V1eGRhMTZaRGdKb0Jua0tIblQ0cE51MndUeDBad01ocGE1clE2?=
 =?utf-8?B?SUpZbmNhbUlpVE02VlRWdkkzY2JsblkzVWFOMnBEck9JalFhaTFkT0tOQ1dJ?=
 =?utf-8?B?UFNDQ1hnb2ZDOS9iaisxQXEwR0VhMjZkZVJvUERldDJINzFpcDVvYWwzbWlH?=
 =?utf-8?B?Qy8rVXZSK0t6K1JrNUpIZGtoT3o0a2VkcURFSjhhODFUUmI5cncxMThzR1lL?=
 =?utf-8?B?YUpjOEtya2RDbEtKeHJkWEliUmZ3bE5NalhFUEZiQXRKeFJYOTd6TlFyVy94?=
 =?utf-8?B?dnh5T1hRbTRIaEFpYmN4QzFpOEJ6dGYvQjFnZXdvWFg2MHliRzZYaTJjbHNF?=
 =?utf-8?B?OW1yeWRUb2RDN2NNRDhEYUk1RytaM2o5dDNVOUJWUHVGc21lbXUrL3pwdDhu?=
 =?utf-8?B?Z3lOUWpXSVB5d3hQeFZvbUk2elNLWVg2QnM3Q3VFcHdGVlNtSXdVczFONnNZ?=
 =?utf-8?B?T2ZZZ2RZWXhCYjZhLzVybnVmMUQ0bkpFQVVFYXFYVi9pL29RQWswb1BmaE55?=
 =?utf-8?B?clhVMDNwMWp4OWUxcG9nM0hBK1VTZmZZNFVrSnYwczMzVzRJQk1hU2E2dm5C?=
 =?utf-8?B?aG13M1BUY2dnZVBCWXBXbmpVSWd1anBwdStWcS9Fck1kdXlWNzlvc2FBc0l5?=
 =?utf-8?B?dnlHNkMxRU1JVnJiYldBR0xlSDJGYUdVL2Ywdkc4aG1VbVJIbWt0T0pVcVoz?=
 =?utf-8?B?SThpSWMzNzhza2l1QjVjUzlkRU85V2ZJZ0ViTXhUMXRLOFBNcVFhdHJHY200?=
 =?utf-8?B?VE11Zktka1orTjZFK1ppdGFud2ZZN0hwL2N1dnJPU3FBUXpnVy9RYk9iOWpu?=
 =?utf-8?B?dDZVMGZ3Y2kvWjBxb0FiQ3dwZ0phd3AvbFBDYWdJb3FmNnVBUUl0U05QMkEy?=
 =?utf-8?B?bGllcU93NXZKM25LZEM0MDMwa0wzZkhlZEhyb0dacWZpb1NwZzNZZW5aUUhr?=
 =?utf-8?B?UEw3aXg1ZjBJcnh1cmw2bG83eVdsMEdFSndMNVVWZW9FbHhTZENleXlXN082?=
 =?utf-8?B?SEh4MjZUMXFRdk9tT0pTV2JxTzFST1hGRnIrRHdiSnYyUXVreGJHOGxZbnVQ?=
 =?utf-8?B?cFRaeGowM1o5OEowd3puMEtuRUlZMmpFc0w5L2FBM3VSYzhQYVc5TUgwRy81?=
 =?utf-8?B?WU1Day9zRWhuNFg4TVdMZnl0MEZkUURmL1ZWR0ZTNGtUY2Ywb1RucDdIVEQ1?=
 =?utf-8?B?SzdOV0dWN3Zid1dTc0hWV1BESkE2RlBGbWRGTVBxV0FncHFSaEw5OXlxd1lp?=
 =?utf-8?B?cno1VitwM0RwQkZ4NjJmSGxlNU1RdVo2MUpBdU1yM1dLRStvQ1lZV3luejFG?=
 =?utf-8?B?ZTVTMjVJN2NKL2l5Wmoxd1o0TzhoemowSEMvVmN4S1kwdjM2TjJ0MUMxbTNR?=
 =?utf-8?B?amVzdi9mMzlIWkhGWllRUm45RkJpcTFUU29ZeEk0Z1hsMHJCZ1lmQUltQ0Zx?=
 =?utf-8?B?MS9mU3E5RTVvR01sc0pHN3c5Q3VNYUFWRXE2MmE2ODFTMmg4VE85TUNiOGZW?=
 =?utf-8?B?ekM3Sk9UN2NXL1U1dUdURGpsWFRiWDNXYUEyWUpoWXBnYXdmcy93R0tIN1lk?=
 =?utf-8?B?ZVJnVmdkelJjdnhETTc3c3dybUhBZnJqemRjRUZRN2E0VmZwaEF2aVRlb0x3?=
 =?utf-8?B?d1kycWltc245alR3TmpMaFRVZ01TSXViSkJWMDlXN1Y2MldlbzdZcHlJNmJX?=
 =?utf-8?B?dDUyN1RnNUtyNWdGZFpRbk5IRk5OdE5kczZTTElTSUN1MEZyU3EyLzJYYjhI?=
 =?utf-8?B?ZHByTjd3Q3lpaEVRR3ZXbWkvMExwZWdwaDMrTWUvK0R0cFBiM3Z5Ynh1enJZ?=
 =?utf-8?B?dGlpek5hMFNhODZtbXF6RTd1TEVyYVk5M0wvTkFHNFQyNzRpVklFQW44anJr?=
 =?utf-8?Q?UjaOFqxKa55JPyWDnhZxMj9kV?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d17fe60-1ab9-4310-6958-08dde393b8ce
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2025 04:56:15.9058
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XPkfK2XhoN7/hk0sNA9xyA3srF4oQCi49C1btN1ttrRRNuedbtbCHc7bz29phFIzCnT2/H/T62qpi7i1KMwmfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9442
X-Proofpoint-ORIG-GUID: WMvmChX8Hof3Jcv1XNfr1oMqNCajI2BL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI1MDA0MCBTYWx0ZWRfXyHPe5CK+IczV
 zFARYCE4gBn5X/9WuKM2G2mPDwBPaE/RRHSW4FDTq72vOrnOmYkBXRjCCa91Qou8o0PrFiIAe+R
 yhnigCPE4GxJkvHf88lZBp2PtyTgdwFuLtZAYWGj04LtFzBwXzVdmUhBxe0TSPzZPHkZAT4pwGQ
 McCDGQfd3/HtE2vYeH0+EreVyLT5O5iDQT8AFg3I4CZ1gDYxl08Td2MfVDZliukEAB2Y/GzHZk7
 EOLEMTlIDYgn0mBBRyMSXco6/I7wvxAGhC9gsTlZk7dJgr5VD5P7GF6CoNWuxWt0KcsfLUE5v9y
 fhsukVtirxJeUfV8SuCu4Kq+R/VnEX4JTW0hFjn0f4t9rQQcmhN/oiV5M0Z+Sw=
X-Authority-Analysis: v=2.4 cv=JfW8rVKV c=1 sm=1 tr=0 ts=68abecf3 cx=c_pps
 a=qdv+Q4TnSqLF0nLC9wtOhA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=Q4-j1AaZAAAA:8
 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=6ufmi6qmN3-00upSG0wA:9 a=QEXdDO2ut3YA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: WMvmChX8Hof3Jcv1XNfr1oMqNCajI2BL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_02,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0 malwarescore=0
 adultscore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 25 Aug 2025 04:56:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119089

ping

On 8/6/25 16:13, Chen Qi via lists.openembedded.org wrote:
> From: Chen Qi <Qi.Chen@windriver.com>
>
> protobuf is upgraded from 5.29.4 to 5.29.5. Upgrade python3-protobuf
> to sync.
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>   .../{python3-protobuf_5.29.4.bb => python3-protobuf_5.29.5.bb}  | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>   rename meta-python/recipes-devtools/python/{python3-protobuf_5.29.4.bb => python3-protobuf_5.29.5.bb} (95%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-protobuf_5.29.4.bb b/meta-python/recipes-devtools/python/python3-protobuf_5.29.5.bb
> similarity index 95%
> rename from meta-python/recipes-devtools/python/python3-protobuf_5.29.4.bb
> rename to meta-python/recipes-devtools/python/python3-protobuf_5.29.5.bb
> index d39c5e9790..14ab3237b9 100644
> --- a/meta-python/recipes-devtools/python/python3-protobuf_5.29.4.bb
> +++ b/meta-python/recipes-devtools/python/python3-protobuf_5.29.5.bb
> @@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = " \
>   "
>   
>   inherit pypi setuptools3
> -SRC_URI[sha256sum] = "4f1dfcd7997b31ef8f53ec82781ff434a28bf71d9102ddde14d076adcfc78c99"
> +SRC_URI[sha256sum] = "bc1463bafd4b0929216c35f437a8e28731a2b7fe3d98bb77a600efced5a15c84"
>   
>   CVE_PRODUCT += "google:protobuf protobuf:protobuf google-protobuf protobuf-python"
>   
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#118888): https://lists.openembedded.org/g/openembedded-devel/message/118888
> Mute This Topic: https://lists.openembedded.org/mt/114562671/7304865
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [Qi.Chen@eng.windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


