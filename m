Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1434CCA1010
	for <webhook@archiver.kernel.org>; Fri,  5 Sep 2025 05:14:24 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.14292.1757049263389964939
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Sep 2025 22:14:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=FZSiqgp3;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1343fa13d8=yogita.urade@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5854LfMO198814
	for <openembedded-devel@lists.openembedded.org>; Fri, 5 Sep 2025 05:14:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=aZR+Qj6I3wg728MaDcJJ+H
	vEJyj9wq4LD26ftNhy9Wk=; b=FZSiqgp3qLOiAuCTYIobiONo6o5iCZ53oDlUjN
	HkROtenijGTaV+ZszBauy58sOS25IYKZgAEO0V4FWUMHU03YTMXCvgIDB9HrTJVL
	D/i0MbErnK/MsOh+rpRh2FlBBFUImkO2xLgkOTmrUHp11ue1gCW5fqhAs+sTkHq9
	VOCzg46oHDEPVmeCjkbazGqBbuP4CrB899DIzDgss33QvdSDq0/SIT3Q6l3o8yW4
	YEHjW0pk2yzFN1OHO5OMolfRsR717hTS6COwlvmCCltQKOo6cz6RC83zQZly3gaB
	APbPR7NtBj7yDRUGnhKNvYcGeK7rwMwWw4+d4u+MMjFlApCw==
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11on2078.outbound.protection.outlook.com [40.107.223.78])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 48y7p7hbjs-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 05 Sep 2025 05:14:21 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nUuKe7Kjyb++iJ51nSEohmk9/Qxeq3secAPSpr+ENHQKBVM7ObEbUJyRH0OL/trCbsystu1J/Hy+oB5eqJI37ckK0GBCACO18bthoUbiyZ+Vqh4lyMrAHEpY/psF4LiiXxGVt6SdCS6iKjbiKYl4HGlpYCGmajxVccIbzTzSjhcuKZV9+gCcv57BlhzEx1GvjDUqTX57OEBeG1ZvLyoJwiOf2Ss+GaHTvvBmLpjtSuxjVKCUStRcIiLGYeucjNw/AV5qGPnxH+xTorQGQzsalfW1E3ISk6KkBZmNxzqSwhnywmvWp4Pwwt039rysT+fAu8ZQMk9OcWLiPMuDECUrTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aZR+Qj6I3wg728MaDcJJ+HvEJyj9wq4LD26ftNhy9Wk=;
 b=yy49tO0/OKPeGzoefVtjS4zFjit9+t0YhIiaRrxKm5RkUuogITeGQXMy8XjX9gxKMf0oxU/N6pj3ToWpqxZHmJqb1youQpTYlognmh7mbxD4Drsc8Z+V/6cV4SUvkm8pRDEkRw0ecYueZoLzEXB6I8iMGv7HbpNCAe8X/Ivzzl20y3bG+vViaGLbBR2jizNTnkcT+RUdSXfg44OrcICZccCW2FZUN0nXgX/0zKo/5FkvCA4R6gmyqtAyZ+o/eGc2GrW1tkiOGk58/a7/LehM4ouBJsgFxsoRHM9RzPjaM2lq3zmuIkTQjzeDVU2kmnVccnECG+1Zp4Ms48ybqSK5Sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CY8PR11MB7169.namprd11.prod.outlook.com (2603:10b6:930:90::14)
 by IA1PR11MB7869.namprd11.prod.outlook.com (2603:10b6:208:3f6::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.18; Fri, 5 Sep
 2025 05:14:18 +0000
Received: from CY8PR11MB7169.namprd11.prod.outlook.com
 ([fe80::3f03:81e3:3649:d171]) by CY8PR11MB7169.namprd11.prod.outlook.com
 ([fe80::3f03:81e3:3649:d171%5]) with mapi id 15.20.9094.016; Fri, 5 Sep 2025
 05:14:18 +0000
Content-Type: multipart/alternative;
 boundary="------------a1MmM0rRzCTJ8UgdKkannw7E"
Message-ID: <431a3258-1505-47d9-8090-3a0ceb9f42dd@windriver.com>
Date: Fri, 5 Sep 2025 10:39:56 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [oe][meta-oe][kirkstone][PATCH 1/1] poppler: fix CVE-2025-52886
To: Gyorgy Sarvari <skandigraun@gmail.com>,
        openembedded-devel@lists.openembedded.org
References: <20250716144033.1780473-1-yogita.urade@windriver.com>
 <207b1ed3-4675-4196-8ee9-edba87cfb6f2@gmail.com>
 <d835b6fe-2528-44ba-b7c0-f1994b0ebb5e@gmail.com>
Content-Language: en-GB
From: "Urade, Yogita" <yogita.urade@windriver.com>
In-Reply-To: <d835b6fe-2528-44ba-b7c0-f1994b0ebb5e@gmail.com>
X-ClientProxiedBy: MN0PR04CA0026.namprd04.prod.outlook.com
 (2603:10b6:208:52d::17) To CY8PR11MB7169.namprd11.prod.outlook.com
 (2603:10b6:930:90::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7169:EE_|IA1PR11MB7869:EE_
X-MS-Office365-Filtering-Correlation-Id: d50976b1-7aa3-46b0-e0d1-08ddec3b106c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?RDh0eE0yODArcFZPWFBCeC9MMHlZL04zVmlQN0NXQTAzRUI4OG1XM3FzK1N1?=
 =?utf-8?B?Y1BRQWV6cVJaTDBiMUNyRXFzT2Q3UXVzdU5ZNEgrUnEwbFNDdld4bDlCTEc3?=
 =?utf-8?B?ZlViK0FMYmZPVmRZUnVERldPc3UyY2I2SThiVG9qVER2TGJXNkRwM0ZaR1Vo?=
 =?utf-8?B?UTFNU1JZU3lSdExGZ0E3SHFCRVM0M1oyZ3Q3d1JuOFZPNjE4ZEQ3ZXQvNEp6?=
 =?utf-8?B?QWtXZUpvQVJrSm5lS04xVlZGaGE0dFFVMm95YXJwZnNqTVRMVUw3QW9qajly?=
 =?utf-8?B?YktLRjJTYU9HNG9zSGpnTFJxc2JPenozQ2hBSjVlTE52QjZYa1BHSXNsVWdh?=
 =?utf-8?B?amdzSWZVZGVqK29FU3BGMWJwTUh0WTg3a3VxYkFSN1BCRE5iZDVncThla1J6?=
 =?utf-8?B?RVNuREt3R3Jjbyt2Si9NTlVpbUQ3UmNqWTlwWFdwb3F4bFZDWklJWEVHNWV0?=
 =?utf-8?B?eE1BdFVtVE9LYjhQSlgyNXhNMmt6SXNubjhOV215enE3dGQ1SE1zT3YwQnVE?=
 =?utf-8?B?N3JvMjg2N3lJU2tLOEhSVS9SU0o2VEk1VzlGYXJzeFdLZitKMXdpSGFCL2xZ?=
 =?utf-8?B?RnErT0tOdDU3ZFM1SmRXeEk5MTVleUpHd042dUZLTkdvTzEyL0xYeEFhVWc4?=
 =?utf-8?B?RDBqNSs4RVNuR2Q0TEhWdXVpOGpHMng4RnF1NXFaUXBrbTM2ZWIwckRCNUE0?=
 =?utf-8?B?Y2YranozWjRlblZ6VDVhNVlRTnJUcGtJdEtDTWk4M3BTaFVhRkt4V2NEOW40?=
 =?utf-8?B?eFAvSnU0WXh6K05zMEdLbUs1b2pHODAzUzJkWkt4ajRaSUYwYlh0d1R1dVFn?=
 =?utf-8?B?bndPNm11WVRVQXoxN1FIMTVQVDh2QmJvdk9YK2JjY2ZvRTJIbkZlN1NXTFBt?=
 =?utf-8?B?R2lyRlhJckJURmxSTldNbXNucjdWMkZQU0w4ZFZoWEg4NTVuaEU1cTN1aUZK?=
 =?utf-8?B?c1Y5WHQ5VjEwNzdRK2Z1MExLeWo0WkFMOWcwcVZQUURhMDZsaFQ2T08rb08x?=
 =?utf-8?B?RDNUL0NXVHhNejUrVENGOER5SjkwUGVBRE9OcXFvUVRBOEFVSkdjWDhYZ0Zq?=
 =?utf-8?B?cDFHRFFJblZkakpKMytzOGwvOWltclRIUm83aTRyM0FwV1VLVnp6VTJ2UTBn?=
 =?utf-8?B?aHhsZ0tuVWpSbzFaU2crTnVCS242dUlMSk9qLzBlYjRTejBieDQ1OVp6cWhQ?=
 =?utf-8?B?c1d3WVZJWC9YTXdHQlMwcHNQa1ZDKzVOTkg4eUZKc1RQSkh4VThEMTMxcndW?=
 =?utf-8?B?TXlpUnlwOHk3alFjaTdIZEIxcG90dXlQdWRCZ1ZJUCtPSnc1OGVHaVFVVVFH?=
 =?utf-8?B?S1NMSzhSeVJVRUJvNXB4R0xUVUNkK3czUTFINGFHL0dLU1ZlWkFIRWVQMHdM?=
 =?utf-8?B?WUFPZUl2WE94cFc2cHQ1aWo2dGRyM3ZXZjRwSTIyNVNqM3JUdDFEUU5DV243?=
 =?utf-8?B?RDZmSXdmMVQ0ajhUYjFlZXlYZ0lYZ3NmWjJYeW1jek1yTkREcFg3RWFkdXZs?=
 =?utf-8?B?clcrOU5UbVlSbE9iTkFsUU5BZ3RBYzUrOERpUmlSZTJnZlhtbVMzdVNFaDYz?=
 =?utf-8?B?ckRjbGJPZTlsd0VjUVFvU3FlR2NzNkxPbFNvQUlUR3cxYnBwa1JHNjcxbWZ4?=
 =?utf-8?B?MFBybU5aL2d5YlpmMGJBT1NiTUVtVU5MeWp1aUlPcmw0dk9remcwZEx0RVRS?=
 =?utf-8?B?bzhoK01sK0hzRTBScjFPaTN2dG1YTlBidlIveXVUTkhWdHZlK2VNdnl1VUEv?=
 =?utf-8?B?UXVzNU9iaS9WSVlFU2UxeEhJdmcrNkNVakZCQ1F4akszbXFvNEFzRWl2Nlkw?=
 =?utf-8?B?SWQ1a0pIbThZWVlqcDNqMWxINC9NeVpEOU0xMTNqNmt3N0dzdmVRZVY0NmlH?=
 =?utf-8?B?d0hHbHA2NnNJY21sT3FXKy9KN1UxZEJsZ1JTa3NVUGJjS3dyNXlkNXhvWktq?=
 =?utf-8?B?VEtjemNLTTlBcWo1NnVYa0dtS0JzS3pzcG1LeHR0enREL2xFY2hqUTJrSk5q?=
 =?utf-8?B?QkZXOXczQzN3PT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR11MB7169.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?THBrbWd1UzBFeXYzZFhyVTA2WnhjZEdHQ01jdHNuTmJpSjN0US9pYVZRbGtM?=
 =?utf-8?B?bGxhdGJjNXo5R3UyMzYwU3loSXB6a05qK2JsV1ZkRkdWazZxeW8vbnNNVEdZ?=
 =?utf-8?B?NWxiQnMyUm5qa2x3c0RNakFDZGQ3bmQ5YUx4enZNNlpLSklaYVp0RlR4bFhB?=
 =?utf-8?B?NGltQWtkbGFUUERPUE4vOXdpb3N0NVdtZGxialg3QUNHaSt1cnpQN3BobjBu?=
 =?utf-8?B?RC9IY0hBa2NrMUcyd1hHcnA3RlZYMmlEOUhYclZFWWxaVkZsaWQzalFHVlJx?=
 =?utf-8?B?ZVdidG9jVzRaQTFSMDV2NEdEck5kbXRDbEhtUzhmdUV4RE1MTHdsb2x2dFkz?=
 =?utf-8?B?blo0cWpoVDlqb2FzUEkrdXBrOTVzZjQ3ZXFna2dhV2h5a0NyaWw3djAxL1Vj?=
 =?utf-8?B?bWxxa01hc1lYZDBZZW9RL3FEOENvQUJiVDVIRzhTMnpTSjJRMjlSQVNhME56?=
 =?utf-8?B?MWFBbWJ0OXRXSDc4dVRUTitTZjl6UERXUUVNelVxK0Q5bVhwZHdCSmROSlp4?=
 =?utf-8?B?c0lUNWFZTVNyZERVMm1ldGFRdUUyVW1URFFQWE90L09kaU4xSnVFTGd5Ty9C?=
 =?utf-8?B?WmE2NVMrdHc1YmxPYnJxZHpVazZDU1I0UU9nU3B0cTIzZjRCTzU2K3o5ejU1?=
 =?utf-8?B?ejU5bGFJakVvcFp3TTFxTWFsQ29ONWRYR1VFMmliTjFaZ0ErVy9odDR2VWFW?=
 =?utf-8?B?bEdsMEVHbHRVR2xyZzNKUWI5dXZmZlNOSDh5Y1ZzaVlYbEViTnJSKzNFWm9u?=
 =?utf-8?B?a21IL0JPWUJscVhDQVZRSEwyeG0yMGcyY3BNWUwyK1lhY0JZMHYxeTlmakYr?=
 =?utf-8?B?NitqeSswblFpMWRQK0RROHZPM2VwQ1FXVmRoSnFWWFgzOFArNzc3azZnNnRJ?=
 =?utf-8?B?N1lJUGVGc0hGWGcySElzVTNsM3dmTk8yQW5wRmh1dnVYRTlvdkU1T3p3bGh0?=
 =?utf-8?B?UmZhQW5KWmZ6dHg4bER1b29hS3IrUnBwNXVEZzNJMzJ3L1NhbnkxTWsyQU5P?=
 =?utf-8?B?MUtMNnBqcTlQT0RyZm5mRkNGRElFSmNVQnRZcmVScEJXUUMxQ3phNkp1Ulhn?=
 =?utf-8?B?Sm5mUjFWYmNKRjQvYTRGVjVRWkM5NW1sWXh6cktCbEQ2aDlSNzRsaFc3L09w?=
 =?utf-8?B?eEJ2RXRNUXJWL1FXeHJ0VjBabkZpTXc1cnBIZEZ1b2pFcXExanNuSkhZWHFL?=
 =?utf-8?B?S3h2SUFjdkhaMWt5WjVFY0c4angrSCtvcVpyenpxRWxHaGRrenFlWW9Hdisz?=
 =?utf-8?B?WjJyTEZDWHk2QVQxc2d1S21OWnpYM1dTQllMcGt5WTZSL0REZXh3aStUWVhI?=
 =?utf-8?B?R1ZaN2diQzBiNWIwbThVL3pYQjFxQS9WckU5MWZHNWNKb0VneXc5aEh1TlRv?=
 =?utf-8?B?TTdLL21KV1V2Y09sLzAxcGFJa09ZZzVTUGlucHNFQlNRNjNjc3I1VXZidU9T?=
 =?utf-8?B?cyt4WUpvWXA1eWU0c0hYV3JZUWpMWU15VE4zM2V1VnVza0lrMi9FOUhKWGwz?=
 =?utf-8?B?Zno5VFNYUytsdURBNjZZMDFzYjN2eGprWTBpM1d3MVBROG55SUVpdExMbVdJ?=
 =?utf-8?B?TldBcUFxMHJWV1grT1Z6QkZpVXNPQnJXaUFyWVZxYklVZHk4UDl3TmJGK25z?=
 =?utf-8?B?aTBRSmdVdnZRNForVnZMT05kMDJSbjA3OG15bDlXUE1RbFhSUlkzTm5jTzA0?=
 =?utf-8?B?TTZ1R3NMZE1seEVibml0SjBrSnI1SFRkeDBvdW43YXc0T2kyK1A0ZExhME95?=
 =?utf-8?B?OUQ3UEhJNW5EL0tPNHoxckN0b1RjYWVJdVVwNk92MW5IMUlZLy9nOWRIQjZZ?=
 =?utf-8?B?RUhmT3R5R2RuQ2hHV1p3RmpaNkJiVHVEQUFWM1ZncldGYUJta2pGZ200Q3NB?=
 =?utf-8?B?WkJRL1pRTnZPY25kOExjclZiTFFQb20zRmU3cVZLSjIvTjRyd2JoVHZzbVkx?=
 =?utf-8?B?S1EwcU80d3dxZENiZEJ0K3FhNnNiNHlrUjV0ODhjeEVGL1dlNW5uczUrS20w?=
 =?utf-8?B?aUVJNHNFV1hwUGx4M3FneVpkNVhBZEVpb2R4S0NsUVJPWVR2dmxiWi9mLzlt?=
 =?utf-8?B?UGlZZzE1WW5Oa29WUGhGSVVSK2NuTlExRlo2b1MvMStXSEJEWGVMQklINEJq?=
 =?utf-8?B?QUU0VHJCSm1QSEp4YW1ERndPb3E4SHZ1OTlHa0E3QWdjQlNMeEg5N2dVelZL?=
 =?utf-8?B?aVE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d50976b1-7aa3-46b0-e0d1-08ddec3b106c
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7169.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2025 05:14:18.2291
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yDU9Ok6LlfkJGzhEpDvdwe9GtpX563K7xZmy40KZUqusNs3SBHVIYnlFUUe8MbfdLnusOZbruAaQnKh6JhF/o5YvuNkSlT9be0+sjX9GXEI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7869
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA1MDA0OSBTYWx0ZWRfXy4ZbgynCuKl/
 m5u4JCDqB1Z7EwDGMyNnjgIYZgI3HjicHC2ZOwAlzXsIqIQdI04WwyGRCKmGIqGQ+1PHxt+sK7u
 Avw6THjx0bzXeSHhFlGOiYIg6fguD5x+U4BvwY7cfcUyOBre7JpLPRc3ALx+pxHRrOHk8xTdWhx
 VNRxEngLibZtLyTLx5pDBC1PfyKHyjoU8NIBZMPZyoN0T3J+5xhu/tLtR5PZvHE3trYtZONOs2w
 BuCP8o54FoO+7mP6boIKZY9sNNOHT8IO0F2V4YBjZKsVsx6jZn96F7Tcdoawr9lMg2MPeseCXBX
 rIPAla3l9A9Q0asVwx+DVdGq1GPFVhKlgfoUDKzvSI2iQbBp+3ZHMkcqpN/L70=
X-Proofpoint-GUID: -1GXFTiFJGEH2CvU9D9zJi-naid3oexb
X-Proofpoint-ORIG-GUID: ngWh_G_T03N-zKhPD7nVLqkagpO2Ia9X
X-Authority-Analysis: v=2.4 cv=faOty1QF c=1 sm=1 tr=0 ts=68ba71ae cx=c_pps
 a=PsHZ2D2ELw/CC0ItkZK1jQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10 a=ZsoRRFHNP8eskdAcTV4A:9
 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10 a=pGLkceISAAAA:8 a=wvPkM9v7g1_ikmSEda4A:9
 a=wRcRzRxJZu13fHn9:21 a=_W_S_7VecoQA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_01,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0 malwarescore=0
 impostorscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 05 Sep 2025 05:14:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119309

--------------a1MmM0rRzCTJ8UgdKkannw7E
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 05-09-2025 02:28, Gyorgy Sarvari wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> On 9/4/25 19:29, Gyorgy Sarvari wrote:
>> The Scarthgap version of this patch had some typos (in
>> the qt5/src/poppler-annotation.cc file), which were only showing with qt
>> PACKAGECONFIG enabled - it introduced some syntax errors, and fails the
>> compilation. By any chance, have you tried to compile poppler with this
>> patch, while including the meta-qt5 layer also and qt pkg-config
>> enabled? (Asking only because this patch haven't found its way yet into
>> the final repo, so if it needs amendment, it's still in time)
> I just found some time to actually try it - it does fail to compile when
> qt5 package config is enabled. Could you please check the backported
> patch, and submit a new version?
>
Thanks for helping me catch that mistake. I will send V2 version.
--------------a1MmM0rRzCTJ8UgdKkannw7E
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html data-lt-installed="true"><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body style="padding-bottom: 1px;">
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 05-09-2025 02:28, Gyorgy Sarvari
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:d835b6fe-2528-44ba-b7c0-f1994b0ebb5e@gmail.com">
      <pre wrap="" class="moz-quote-pre">CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and know the content is safe.

On 9/4/25 19:29, Gyorgy Sarvari wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">The Scarthgap version of this patch had some typos (in
the qt5/src/poppler-annotation.cc file), which were only showing with qt
PACKAGECONFIG enabled - it introduced some syntax errors, and fails the
compilation. By any chance, have you tried to compile poppler with this
patch, while including the meta-qt5 layer also and qt pkg-config
enabled? (Asking only because this patch haven't found its way yet into
the final repo, so if it needs amendment, it's still in time)
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
I just found some time to actually try it - it does fail to compile when
qt5 package config is enabled. Could you please check the backported
patch, and submit a new version?

</pre>
    </blockquote>
    Thanks for helping me catch that mistake. I will send V2 version.
    <blockquote type="cite" cite="mid:d835b6fe-2528-44ba-b7c0-f1994b0ebb5e@gmail.com">
      <pre wrap="" class="moz-quote-pre">
</pre>
    </blockquote>
  </body>
  <lt-container></lt-container>
</html>

--------------a1MmM0rRzCTJ8UgdKkannw7E--

