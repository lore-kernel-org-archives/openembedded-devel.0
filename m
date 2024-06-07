Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF442C27C53
	for <webhook@archiver.kernel.org>; Fri,  7 Jun 2024 08:50:18 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.37182.1717750213362785797
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 07 Jun 2024 01:50:13 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6888c8ef97=kai.kang@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4574KMfD025310
	for <openembedded-devel@lists.openembedded.org>; Fri, 7 Jun 2024 08:50:12 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3yfruxe7hp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 07 Jun 2024 08:50:12 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4578oBgi021276;
	Fri, 7 Jun 2024 08:50:11 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3yfruxe7hn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Jun 2024 08:50:11 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I5/oVymDoPckxegnKh62b/lS/SgdhDjEeRuAkRHpnPaS5ACJN9AKRgTU1Va/pKmZHu37QmzfEkvTRh/fNMfRhnVe1oesMEK0X5/XN50FawFNvBQJDUK74P+A1gWX6EGtvsuS1/KS56yJPW7QPjl3FRpmbpdaoUBuUyWcq4Yon7S5GgP1sVl749DRnsDulq9UCYRVlb9JTY6LE0CtrcOv+eyqe3blgRdv/ozMX1UR2dEvwMikhaeUGv9IlHDpdpXCjVudcUXgjIhZre0cT8gXq5MAYI6BEj7fY+yDCtpCFNZCyDqtOctSW9JSNIn2EAq4S2KFO42SYYQ7TA1I6zMgEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wuYXM4jY8g7B/gwi0knx1pAVYD/fDRyPgAibkqUZeWA=;
 b=IBfPQuap/MkE4l0BERDvEoNea/1MlMLEN1xkb/zR5nOXb/4m2zbMjPMS+WhcvIzIOj37N5Th3V2CQvVNzhkWofr/H+fQWGKlo1XXyQKNJx+Y6nysgJ72ygAhT9ixCh4EMwAs+MggAdcynK0as8NzTje9UvLrBxkddLtoT6CGDg4HcLb1AVH6U6RVuemPVIPoIjaMjg/5wP9PvbEJYXKJMBvJjpMLUJt6YuWYnsUpqGfCs0kVsCSkpUpGwdht1PzrpABm7omVhb2S1WDlw9n8OG1uTAYnsSI0mTTmxeUs6c4aR5Aceny4nRiu8veSzRvtKTtHrsxMhXzLsrBpZpsyPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN7PR11MB8264.namprd11.prod.outlook.com (2603:10b6:806:26c::17)
 by PH7PR11MB6474.namprd11.prod.outlook.com (2603:10b6:510:1f2::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.22; Fri, 7 Jun
 2024 08:50:09 +0000
Received: from SN7PR11MB8264.namprd11.prod.outlook.com
 ([fe80::e92:66a8:56ff:f569]) by SN7PR11MB8264.namprd11.prod.outlook.com
 ([fe80::e92:66a8:56ff:f569%7]) with mapi id 15.20.7633.033; Fri, 7 Jun 2024
 08:50:09 +0000
Content-Type: multipart/alternative;
 boundary="------------tfMld2n9DrcttPd7s0juyEnb"
Message-ID: <3c74df63-4a33-476c-97e1-26c1bc394f71@windriver.com>
Date: Fri, 7 Jun 2024 16:49:56 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH] usleep: fix compile errors
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
References: <20240606050222.2551532-1-kai.kang@windriver.com>
 <CAMKF1sosZ+7FKSzusqN9VtT0W2Kig1eCua8iSfg506wgprpogw@mail.gmail.com>
Content-Language: en-US
From: Kai <kai.kang@windriver.com>
In-Reply-To: <CAMKF1sosZ+7FKSzusqN9VtT0W2Kig1eCua8iSfg506wgprpogw@mail.gmail.com>
X-ClientProxiedBy: TYCP286CA0129.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b6::17) To SN7PR11MB8264.namprd11.prod.outlook.com
 (2603:10b6:806:26c::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8264:EE_|PH7PR11MB6474:EE_
X-MS-Office365-Filtering-Correlation-Id: 472269d9-fa62-4ea3-99f4-08dc86ced5fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?THpKYUJGbTdiSmpSUmdoMGZOMEJqQWVpZjRMRTVaaDlFN0RSdlUxYUVwbzRt?=
 =?utf-8?B?eWJBMk9wYVZ0bWN2cWNYalBxaFhBbldZbmdxblpMNktHc3JaWjArT1hTcFRn?=
 =?utf-8?B?MU1wNDZON1RyK0V1WXBXanJ3SzdlU0dIa2dOb3k3UkpnVTZpNW5YTWM1MlRN?=
 =?utf-8?B?b0NjSEhGOHFhWXVOVDdZSVpTeXNiTkZPMjh5VTh3YzFWZldkY3ZMTHJYa3l0?=
 =?utf-8?B?RTVmUzJWeUlUSVhUclJSUXdXK1c0djNvNXp4cHozYTBaWnNnek40Umk4SWJa?=
 =?utf-8?B?NUh4Q2xGSTBFS2tWNCs2cFlVWnZhaitSSU1pTWtXVHRVZ1h5TnJ1cWdoZGZ0?=
 =?utf-8?B?Ym5kL0tkUXdwcFU2S3ZKMFM2SDl3L3A4dEd2VGdnbG5MSnJoV25kbnE1cUh2?=
 =?utf-8?B?T3hTMWRQOW9pS0lLOXJOUUdYVDhrK0NKN3h0NldCbEN5b3grcGdnMkd3UWRU?=
 =?utf-8?B?SXlxZDg4bGdIVGx4czJZbFBZaHBLVEVZekoycmd6ZnpnVERPcUVoWk8zaFBY?=
 =?utf-8?B?MDBsQWFxbFB3R0kxUVNUby9ISHM2a25zTDlZRm1jaFk0UjczeWpwdnlPbTVy?=
 =?utf-8?B?U0Zra1lmNGl6Rm1DSVVzbzFEZGNwWlBtSW52T0tCSlJBVEo5Z3pDYVlBUGJz?=
 =?utf-8?B?WDg1b2drd0ZGbVZVQlJXV3N2dFBCQ2xRd3R3Z0xBYWk4WTNITWQwOXpROU5Q?=
 =?utf-8?B?L2JIT0Y0dXQwUzFqd3B2b0pHZC9wNlpncUhaZVlFbHJHcmpaSWdLejh4UkxI?=
 =?utf-8?B?aDJrUFlUY1VCQ1RUcEZ0Y1BIeDl2Q1FWN3hIeUJJSVN3UGtZak0ySjl3RWpR?=
 =?utf-8?B?SXdlbUcxU2pDc1kxUUlHYndLS01uQ3kxT29Xdmo4VldCQjFEVnAySFVkaUFL?=
 =?utf-8?B?WVVLb1hnUTF4eUlWdnNsZU1KYWZ5Vit2MXQ5Z0JoTlcvZkswS2R4ZmdEd0do?=
 =?utf-8?B?WkY1WjBlQlIxaTB0Ky9FMVZFenhYeWdoQThIRHNOL243eHlmaXBOQlplV252?=
 =?utf-8?B?TXRkUUFRR2tRR1h2RkxyaExCMDF4dkhxUGZrSDgxSktQNnRjVnlEcWdUa1Vi?=
 =?utf-8?B?cFpiQWcxY21Ndm5nUE81aExFT001RWhRR052VzJPeitmZXBqUW9BOWM0eVV0?=
 =?utf-8?B?alpaUXJ3NFlycHZ1WmFTblhYem9mbTROV2FaSHdxTFRQaUtmN284Ui9XUEh3?=
 =?utf-8?B?RzEvV3hnUC9sT0EwR2Z6NHlLNDAvR2tSSDRXUW9tLzlPWjFGWXBLY0lmNWtz?=
 =?utf-8?B?YnJWOU5qRjRnemJJUUdhR2x4eFZyUVcrUnB0eThjWEhpMXBQQkc4N1JHUTFI?=
 =?utf-8?B?d2JWbVVMcHBFK1BReURtejJnbHByY0hJSWRNNk5ha1FFM0Y4MlZ5bzRWNmxm?=
 =?utf-8?B?RS82WUxxL0dDMHFsa29UMU1vVHRJNzZPZ09ISXh2enZCUDRZOWMzNXBhbng3?=
 =?utf-8?B?Q085NFZxS0JwY1I5a3NvWG9mNFgyZWFxbksrL3VpT00xWGFGTGJEdlQ1UVI1?=
 =?utf-8?B?aldlcndqTUlLb3h0aVNBTEZIdkFDcXRXRHJ6NjRtak5JU2M0R092SWVWREJO?=
 =?utf-8?B?MENoUHBaRC9id3lzVXdXelEvTmhxTmdqbWZXdHhZMzN2Q1VPa1JLVllaSzJq?=
 =?utf-8?B?RUtXcGlEcExSNlAzRVlJU1IrdFlQc2lDcWVQZXl2OHplbWl5bllzRyt3WkYw?=
 =?utf-8?B?SWZvOHd1TDd5d0VxbEwxbEVIbzFoc0I1bUlzbmR5dzZtSi9WV0FlWC9nPT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB8264.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?akdSTXkyYTNsbmNFT090N1RUR1RnWHhpV2hBUUhTclJldFBMR3lia2F0VE9J?=
 =?utf-8?B?NnJWTkplM1M2Sko1MnBDSEt1SUp4T1E0enVHc25RamEvcGgxTm9WTFRscEw2?=
 =?utf-8?B?UXI5Tkh2enM0QjhMWkl1SVM2SlFhMG11K0NLSTZFQndLaSsyRlUvR2MwQ1Vh?=
 =?utf-8?B?S1dlbGN5WFhoUkZPTWRYR1BjSmhnZUNOV09PWEJzR3c2clZ4S2FGWU91T00v?=
 =?utf-8?B?dmo3djVMT0l5MGx3OGlkUUplRUZtQytJV1NtK2pCOXlPTnZMRWY4QkdXUG5o?=
 =?utf-8?B?VmF3T1FRbW5hQnh2S3lOalQvSU9kVEROOHZmb2FIODJKWVpBNHJlMkN0a3I4?=
 =?utf-8?B?ODdIZTBiTlhZaDFxNWpKZCtwYk1KaEgyOERIanU4SUw4d0Nxc2xhOTVMV29H?=
 =?utf-8?B?REwyRm4yeUdadjY1QVlFMzRhVzNRSWdGTE9UbUxmbEZqelpyUlBkZG10MGpl?=
 =?utf-8?B?WFh1eS91SUNKUUNlZG1aeGNLajhyalVObWVVT2NmTGtHYlU3K1doMHUvRjJp?=
 =?utf-8?B?UGRqdlc3SkxLVjVKMnk1STI1ZUg0VEducDNNMWIrYy9CekFPNng0QWx4TWxw?=
 =?utf-8?B?emVrdnd4blMzOXRwdmxsSUV0bmhnT3VUWkxHbU9SdmVHK0pPTTFLWTlVK0FU?=
 =?utf-8?B?RWs0c1RzZnV1UkIxR1pSUytjc3B5MTMwOXowcHh1d1dTZ2J4SXJQWGpDWG8w?=
 =?utf-8?B?WWhQZTZqVmRoZXI3dGtXbXdKcFlodDBKS2w4dVdkRDJYUjBrOWVGamkvSWdV?=
 =?utf-8?B?WjhLRzd3Z04va1V3TGNXdUlXTGVVU0FxMmdXOEpDWHVPNktycGtucjZyUEpk?=
 =?utf-8?B?TFVrcGdrLzlZYW52TFNzT2FrYjlhOTQ4Qnk0ZXRSZThWUmZvKzVKQ29PTk5l?=
 =?utf-8?B?QmtiZjdYQWZGUGlCNlZuRVh2RDRzdzdjNUExOU01bHJjelhEaUErU3VwOU0r?=
 =?utf-8?B?d2lNbjF2dUhxK1h6ckJLSE9yeE1JbXRDZEUyQXQ4Z2V0QW9tTmxoTWlhdUJW?=
 =?utf-8?B?bWZ3SHRwdnpnNjV5VmE5eGF3TGkzZWtLR3lNMjZ4MnpOODBCajdXVGxoTVdZ?=
 =?utf-8?B?YlI2Z0RiL2FFKzN1NitXRXdMNkp5UXdsRGVESW9LU0hRWmh2MDJjaUFGanM4?=
 =?utf-8?B?c1VuZmUwQTlNbHpzSWp1WmJUY0dsZndYS0FFdWZwdERiR2Raa1BKcW1RblJ5?=
 =?utf-8?B?MlhYdnhaOUc2S1pXckI5enYwNTNxU3lzNHBmMUYzK2s5aHNvTDZTaU1QdUJp?=
 =?utf-8?B?TndvT2pMQ2dWaEFnZTFoT0IvU0JKS0EzUDdDckRLcU44Q2NhWFlzMVltSldF?=
 =?utf-8?B?cmUrTmt2TGtXL21VaDVMUU11d0ZFcUJXWGxObGJFeWl1S1Q0cG9welNKcGk3?=
 =?utf-8?B?ZnVQcEZsU2ZaRGVmVlVaWFZPU0JyclhHdTY5ZXVvOVZLYUhlUG9nSDFVV1Bi?=
 =?utf-8?B?MEdaTHZlOVlmVEp0aXBGY3Z6TVNmK3FOWlQ0NHkvQ3owSGRRUWQxOTJkWlMv?=
 =?utf-8?B?RDY2dUYySEdmbThJKzZjaHU4bmVUa3czUGRqTkdBY2h5MkE3WDk5QWlydFNQ?=
 =?utf-8?B?eElXcDFmSDhQT2lTUU9aUFVuV0t3dzAwVjVJY1QxdERhN0I3WXlqdGMzQWhC?=
 =?utf-8?B?SmVYWml1UjlZTERtdGsvOUpTRmZCYnk3cjdid2VIdVhITnVhdzRsY0hYVzNQ?=
 =?utf-8?B?TDgzOFNYNy9ad0pPc0xHY3p3ODUvK2JVMmFGek9PTFQwd2RnUDJvUHprMGhm?=
 =?utf-8?B?aDZwSHF3OG5wSnY0VGlmMWtvL2toNU5sRVRSSHhFOG5QM1BQeWpyY3E5M1Rm?=
 =?utf-8?B?UG1sL09QVmhhREN3OEZYZEI0RmROVUUramZWaGJEdUhtNWpDVGpNUlQ2ejlP?=
 =?utf-8?B?Z2NtTTZ3MWpVdWFxY0l3WGxuRkxObGdIY2FkTk52aE1LV0hQMGFQSUlJZVNo?=
 =?utf-8?B?WXhtTkVYN3FzY3Npb2ZIbkVRV0oxWjEzdlpqMXJCZTZ5V2R3d1F3am5wR1g1?=
 =?utf-8?B?elZqbE82ZVdLS1N0b2g5blNwS0pwNWJVM2VHbVRPNXZNMkxiU3V2YUVuM3Fi?=
 =?utf-8?B?b3NrYWQ0blcrSVBiOWdFdjBqYzJESDdteHlOVHR6TjhnUWo5eWw1VVI3ZzhW?=
 =?utf-8?Q?tzsBYM8nOiBxVMI2yojFDNmG4?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 472269d9-fa62-4ea3-99f4-08dc86ced5fb
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8264.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2024 08:50:09.3178
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dFH9uJV2bYMNwo+kDVE2uTu7IIUc5XbVqm4zxnl8APglAs6bkrkVR1CgPsIpctKslDFodVkecgNJj3QciXYvBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6474
X-Proofpoint-ORIG-GUID: 18-ZW34r967d80jgjebMJZFVJ6KGjg65
X-Proofpoint-GUID: pFKDHT_aQWedLlT6ZcTklitfuCWsPANb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-07_02,2024-06-06_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 impostorscore=0 mlxlogscore=831 adultscore=0
 bulkscore=0 spamscore=0 mlxscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2405170001 definitions=main-2406070062
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 07 Jun 2024 08:50:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110764

--------------tfMld2n9DrcttPd7s0juyEnb
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 4574KMfD025310

On 6/6/24 13:36, Khem Raj wrote:
> On Wed, Jun 5, 2024 at 10:02=E2=80=AFPM Kai Kang via lists.openembedded=
.org
> <kai.kang=3Dwindriver.com@lists.openembedded.org>  wrote:
>> From: Kai Kang<kai.kang@windriver.com>
>>
>> Update usleep.c to fix following compile error:
>>
>> | usleep.c: In function 'main':
>> | usleep.c:47:43: error: passing argument 3 of 'poptGetContext' from i=
ncompatible pointer type [-Wincompatible-pointer-types]
>> |    47 |   optCon =3D poptGetContext("usleep", argc, argv, options,0)=
;
>> |       |                                           ^~~~
>> |       |                                           |
>> |       |                                           char **
>> | In file included from usleep.c:29:
>> | /path_to/tmp-glibc/work/core2-64-wrs-linux/usleep/1.2/recipe-sysroot=
/usr/include/popt.h:217:41: note: expected 'const char **' but argument i=
s of type 'char **'
>> |   217 |                 int argc, const char ** argv,
>> |       |                           ~~~~~~~~~~~~~~^~~~
>> | usleep.c:68:12: warning: assignment discards 'const' qualifier from =
pointer target type [-Wdiscarded-qualifiers]
>> |    68 |   countStr =3D poptGetArg(optCon);
>> |       |            ^
>>
> What is the upstream status of this patch ?
It just modify the source code usleep.c which residents in meta-oe

and not a separated patch, so not require upstream status.

Regards,
Kai

>
>> Signed-off-by: Kai Kang<kai.kang@windriver.com>
>> ---
>>   meta-oe/recipes-core/usleep/files/usleep.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta-oe/recipes-core/usleep/files/usleep.c b/meta-oe/reci=
pes-core/usleep/files/usleep.c
>> index a5e7d9d715..dfa52ec19a 100644
>> --- a/meta-oe/recipes-core/usleep/files/usleep.c
>> +++ b/meta-oe/recipes-core/usleep/files/usleep.c
>> @@ -34,7 +34,7 @@ int main(int argc, char **argv) {
>>     int showVersion =3D 0;
>>     int showOot =3D 0;
>>     int rc;
>> -  char * countStr =3D NULL;
>> +  const char * countStr =3D NULL;
>>     struct poptOption options[] =3D {
>>               { "version", 'v', POPT_ARG_NONE, &showVersion, 0,
>>                          "Display the version of this program, and exi=
t" },
>> @@ -44,7 +44,7 @@ int main(int argc, char **argv) {
>>               { 0, 0, 0, 0, 0 }
>>           };
>>
>> -  optCon =3D poptGetContext("usleep", argc, argv, options,0);
>> +  optCon =3D poptGetContext("usleep", argc, (const char **)argv, opti=
ons,0);
>>     /*poptReadDefaultConfig(optCon, 1);*/
>>     poptSetOtherOptionHelp(optCon, "[microseconds]");
>>
>> --
>> 2.42.0
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#110707):https://lists.openembedded.org/g/openembed=
ded-devel/message/110707
>> Mute This Topic:https://lists.openembedded.org/mt/106517953/1997914
>> Group Owner:openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe:https://lists.openembedded.org/g/openembedded-devel/unsub =
 [raj.khem@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

--=20
Kai Kang
Wind River Linux

--------------tfMld2n9DrcttPd7s0juyEnb
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 4574KMfD025310

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">On 6/6/24 13:36, Khem Raj wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:CAMKF1sosZ+7FKSzusqN9VtT0W2Kig1=
eCua8iSfg506wgprpogw@mail.gmail.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">On Wed, Jun 5, 2024 at 10:02=
=E2=80=AFPM Kai Kang via lists.openembedded.org
<a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:kai.kang=3Dwindriver.co=
m@lists.openembedded.org">&lt;kai.kang=3Dwindriver.com@lists.openembedded=
.org&gt;</a> wrote:
</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">
From: Kai Kang <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:kai.kang=
@windriver.com">&lt;kai.kang@windriver.com&gt;</a>

Update usleep.c to fix following compile error:

| usleep.c: In function 'main':
| usleep.c:47:43: error: passing argument 3 of 'poptGetContext' from inco=
mpatible pointer type [-Wincompatible-pointer-types]
|    47 |   optCon =3D poptGetContext(&quot;usleep&quot;, argc, argv, opt=
ions,0);
|       |                                           ^~~~
|       |                                           |
|       |                                           char **
| In file included from usleep.c:29:
| /path_to/tmp-glibc/work/core2-64-wrs-linux/usleep/1.2/recipe-sysroot/us=
r/include/popt.h:217:41: note: expected 'const char **' but argument is o=
f type 'char **'
|   217 |                 int argc, const char ** argv,
|       |                           ~~~~~~~~~~~~~~^~~~
| usleep.c:68:12: warning: assignment discards 'const' qualifier from poi=
nter target type [-Wdiscarded-qualifiers]
|    68 |   countStr =3D poptGetArg(optCon);
|       |            ^

</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">
What is the upstream status of this patch ?</pre>
    </blockquote>
    It just modify the source code <span style=3D"white-space: pre-wrap">=
usleep.c which residents in meta-oe
</span>
    <p><span style=3D"white-space: pre-wrap">and not a separated patch, s=
o not require </span><span style=3D"white-space: pre-wrap">upstream statu=
s</span>.</p>
    <p>Regards,<br>
      Kai<br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:CAMKF1sosZ+7FKSzusqN9VtT0W2Kig1=
eCua8iSfg506wgprpogw@mail.gmail.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">

</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">Signed-off-by: Kai Kang <a=
 class=3D"moz-txt-link-rfc2396E" href=3D"mailto:kai.kang@windriver.com">&=
lt;kai.kang@windriver.com&gt;</a>
---
 meta-oe/recipes-core/usleep/files/usleep.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-core/usleep/files/usleep.c b/meta-oe/recipes=
-core/usleep/files/usleep.c
index a5e7d9d715..dfa52ec19a 100644
--- a/meta-oe/recipes-core/usleep/files/usleep.c
+++ b/meta-oe/recipes-core/usleep/files/usleep.c
@@ -34,7 +34,7 @@ int main(int argc, char **argv) {
   int showVersion =3D 0;
   int showOot =3D 0;
   int rc;
-  char * countStr =3D NULL;
+  const char * countStr =3D NULL;
   struct poptOption options[] =3D {
             { &quot;version&quot;, 'v', POPT_ARG_NONE, &amp;showVersion,=
 0,
                        &quot;Display the version of this program, and ex=
it&quot; },
@@ -44,7 +44,7 @@ int main(int argc, char **argv) {
             { 0, 0, 0, 0, 0 }
         };

-  optCon =3D poptGetContext(&quot;usleep&quot;, argc, argv, options,0);
+  optCon =3D poptGetContext(&quot;usleep&quot;, argc, (const char **)arg=
v, options,0);
   /*poptReadDefaultConfig(optCon, 1);*/
   poptSetOtherOptionHelp(optCon, &quot;[microseconds]&quot;);

--
2.42.0


-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#110707): <a class=3D"moz-txt-link-freetext" href=3D"h=
ttps://lists.openembedded.org/g/openembedded-devel/message/110707">https:=
//lists.openembedded.org/g/openembedded-devel/message/110707</a>
Mute This Topic: <a class=3D"moz-txt-link-freetext" href=3D"https://lists=
.openembedded.org/mt/106517953/1997914">https://lists.openembedded.org/mt=
/106517953/1997914</a>
Group Owner: <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:openemb=
edded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.=
openembedded.org</a>
Unsubscribe: <a class=3D"moz-txt-link-freetext" href=3D"https://lists.ope=
nembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/=
g/openembedded-devel/unsub</a> [<a class=3D"moz-txt-link-abbreviated" hre=
f=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</pre>
      </blockquote>
    </blockquote>
    <p><br>
    </p>
    <pre class=3D"moz-signature" cols=3D"72">--=20
Kai Kang
Wind River Linux</pre>
  </body>
</html>

--------------tfMld2n9DrcttPd7s0juyEnb--

