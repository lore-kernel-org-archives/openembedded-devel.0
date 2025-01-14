Return-Path: <peng.zhang1.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8C7EE77188
	for <webhook@archiver.kernel.org>; Tue, 14 Jan 2025 06:12:01 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.38671.1736835119836006249
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Jan 2025 22:12:00 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=310900c87a=peng.zhang1.cn@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50E5JgF9031143
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Jan 2025 06:11:59 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2044.outbound.protection.outlook.com [104.47.66.44])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 443dv12rcn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Jan 2025 06:11:58 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dMeL6kruPhjYmaTQzLkUolPEEsykaWYzr0WHhVKv/AG2g0oOwuwbStCzaOHduCdcMdtbHBRtvWdpbI4ePtzvQLInE8anlOSm6Dwr+wnTGRiCPgMNKp+rMkKQHtjIuBXRLhZo81euHvwlN22Lcy2qLVl/UIuBkzxMd7lHXHwVb5W3E48Xd5pH1tmcWVpzyo9Vxca9dCzoKfezwTAIiD93CpY6RXbCoGPIfwOj51/aJwcPuQEpVgZsPlDDdBw1lOHZGDxUR08LzG/USvt0BCY1dCQj2Ny3Z4MtB0yQIePWocRU/bA7bQP89uZwQffbE2369vPo/rbkU+JGnqEggzhotA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KoivFBXs+1VIdrPMCDsyGQ7aMY3aJ9kSI4h6i3uBC+E=;
 b=Z48Xd+SRcRPtHVcbp5GUkNOoZ/250yrwvoZSZGRPqf6SRm5GgM+DXJq+nEXa+hDqokMxcN5ozvzJG7ql458sMURvS/snDFBBngdJyX2HiZQz9B7xYqM9VUrkBHH8tMFUln67iO/cD9ewbfUKNqPFK+PyMRXHbLmlX12IKd15Tv0TWimrlhRjuFVjtGiPMYk7S7CifXwSx6BqVFmxlQpVawZ6JtQKeHFrLRlsY5ALJQaTHfU2tTmS7VLL4WUNqq5NbylhXEs1tBtrYYQcWxQ2fLWfAxuK81LJVSDxhDt/93iSdzte74nkBqw7QbwaFJ/cmWTbCZ0k2zrWEN0drT2BqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8562.namprd11.prod.outlook.com (2603:10b6:610:1b8::13)
 by MW5PR11MB5786.namprd11.prod.outlook.com (2603:10b6:303:191::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Tue, 14 Jan
 2025 06:11:55 +0000
Received: from CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::24c6:f8fc:1afe:179f]) by CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::24c6:f8fc:1afe:179f%7]) with mapi id 15.20.8335.017; Tue, 14 Jan 2025
 06:11:55 +0000
From: peng.zhang1.cn@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH] openjpeg: Upgrade v2.5.0 to v2.5.3
Date: Tue, 14 Jan 2025 14:11:46 +0800
Message-Id: <20250114061146.3313761-1-peng.zhang1.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: TYCP286CA0198.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:385::13) To CH3PR11MB8562.namprd11.prod.outlook.com
 (2603:10b6:610:1b8::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8562:EE_|MW5PR11MB5786:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e96aeb6-c4a6-4180-1f8a-08dd346258ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?WWpOT3hNTTJKT1huNW1FYWZHTDlSei8zWkVRQTMwVDhjTFlScVVHQk9jd0tq?=
 =?utf-8?B?amh1d2c2ZWJqb3NuWDlmbGJSazhDd0RJamVYeWZHU2d0UFRuelNjdk1pNlNL?=
 =?utf-8?B?MU04dHM0ckQyUHNLYUpNdk9FVllLRFZvZVhablZYR2tXRWc3WjNaTVhabjdh?=
 =?utf-8?B?QkZaelpPOTN4NVBhU1R1NlUzaml1YUZTUmQ5RWREN0dNZStnWUJHcE81anRN?=
 =?utf-8?B?UHlYMERsd0FmZzl1VTh4ZnBaYi93VEFtcWh6cm9tVGF6bTkyMVM4T1ZteTdx?=
 =?utf-8?B?ZEdQT21yTlFiazdsVjIvM3BUZ2JLa3lJUFM0Myt3V0ttN25ZclFISyt5TFUr?=
 =?utf-8?B?OWRTNDFGWi9DRFkvclVVSndzTS9LNjBwSWVKMkVkNlExNFVEV2xPSlNzME5z?=
 =?utf-8?B?UTA4c3duZnNJSEhLNTNqcDJsbkpEZS9MR1NQWTdYa09VVmNHT1BGbjJWN3Q1?=
 =?utf-8?B?Mi95R1dMQXJsajJmUmZPVUtwSnVrM3VXMTZFVHB0UHRMRkFxWFd0WDlZTzlL?=
 =?utf-8?B?eEZLd05sOEFmbHZQTDB0c1JUNCttTndqYnF6akk0bnpSK25LSTB6U3pWdHpB?=
 =?utf-8?B?TVkyY0pxaG0vWGhJK0JiTnJlbkZRUERTY0tDQm5WN0JuSFFTZzh4MnN5ZUtx?=
 =?utf-8?B?dXB0NnpjeWE5NExyNFovZklwbnd0OEsxNWFjMlB1RHAwMGVUUzgxTmZFRE40?=
 =?utf-8?B?U0I3YWhLWjlFUVhDZ01ZTXY2WGJLU29XdGs0cWtUZFZPTTUrK1BBVUVYNVhF?=
 =?utf-8?B?T1V5RGhlWGdNSFpaQzBnQWFjU3NlRFdVMWthOHZpVkordTJuY1JMQ0NaWllU?=
 =?utf-8?B?TUpsYW9xc1lnMGdoTEhsaDluazhXbDl5V05hY25wOFhpZHVNV1VTVlcrRW02?=
 =?utf-8?B?RFRva3FSb2VxdWRaWWQ5M1hUa0JBK0w2a1dNNWVWNnp0bEZtQ2twM1dsOCtC?=
 =?utf-8?B?UEo3dVpZRi8wTjg1QStHTWpUWUNaNzJEQXFoK2xwdkJMWmppMUNaZWw0czJa?=
 =?utf-8?B?d3dQRHBoaG54Rlp5eGJLTGlleW5LWDg5Skw1cG01RFBobHFxTDdQcU95SHNp?=
 =?utf-8?B?YU93cXAzWVNPdTNCKzJSU2N3M09xODJabzZMUmVvQ21nOWIrek9ZS2lkY1pD?=
 =?utf-8?B?RUhiUVZQVFl6aHhJdzdlYW11d3NFWGMzOCtsR1VTSmUwMFEzNVlXSVN6azlT?=
 =?utf-8?B?UVVaWFczdjNsNGFxS1FmT1lTTWRCcEx6bnVwUVQzL29CcDVaVDNMTXhTVkdD?=
 =?utf-8?B?NUNPS2swZzl1TGFIclRKZUpZZWlRT09KeHY2azFoZ1pVN1AxRTZ5QWNaU08r?=
 =?utf-8?B?UUVwRmJ0NVU0aTIxUGl1UGgxcVFhUlFEYmNoSkljeTB2NWYyZlQ3MXlaUC84?=
 =?utf-8?B?R2Eya3h5ajVzaDR5Y2FLMmZ6MGg1emNFSHBlcjZka1VlVS92bVhjSmwzYVZ0?=
 =?utf-8?B?MkFkNkFHbGdZeUpsdHJqVWl5Q0pTWHBSSDV2bEJaenlSY0IvSkt3TExxK28w?=
 =?utf-8?B?RWRJRU1YYzNFQTBxb3U0N2RCbllHYVJjeTdXNTRFWjNoWmIxR2hDN3NQZm5Q?=
 =?utf-8?B?SjJZL3NVdHNiaUErL3ZDNUQyd2JBa004a0tjQmRDN21vSzZvRUVxSnBicXdL?=
 =?utf-8?B?eGdjNXdFUU9zemZMS01hZDFUQUdJRkU1dU9rOXowRVFEUDdjT2ZUYXJFTkVn?=
 =?utf-8?B?Vzkrb1VVbHczU0J0WUY2NjRIUXZZRjBmRTFBRDhDc3NmdnlMQ2pkc0ZZcHVE?=
 =?utf-8?B?bWxxUTI2bGJLb2hZUzZqS2lXVEU4R3NkdTZkMVJ5aCs0bVNXRTQzdjFVNUVm?=
 =?utf-8?B?TVBCRzdERWpaQ0RWZ0dVNmpKSFhmaE41bVk1QzhmQTFLN2lyUmtXWkFNanVR?=
 =?utf-8?B?QzMwZ2lFMWNZYzE2VStYTStRMnZ3SEYzeXNQZE1adFJ3MEE9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8562.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?eWFpU24vSnBkODBmTnh5OWhXWjNzUndNYlVFdkxrVkMzbDdoMU5ENHVmZjdw?=
 =?utf-8?B?czRZeU0rNlhGd1FBNUsvNENPdkZDMXpyK3JyR2w1OUlUNTR6VUZqbU9qRlpU?=
 =?utf-8?B?cG5DU2xIb1p2UC9DMnkvR3VMc3k1dm9yWE55dEVvSndqNFp0NnY0K09Wb1ZY?=
 =?utf-8?B?QXhSUGVnbTVEL0tVMlNraGtrUVhVdHEzYktVTm9MRGptSm92cjBGZ3lCblR0?=
 =?utf-8?B?QmpvYTN2NXQ2OXRyaE1TZFNIdFRlSEtDSmI3M1JrdFBCemlrWlBBcm5Jb3BX?=
 =?utf-8?B?eVRUamYwQm9rU1krVDVtT09YNlZXYXZIeFpNdlZ3VndLV3lDdTF0eHdzdDgz?=
 =?utf-8?B?K21RV2JUckpHNjdRbUZoNDltMG9yeFBFWmY3TWhWS2VXd1VvWGpqOUorOXBL?=
 =?utf-8?B?NkV6ak1Fc3NIZWllOFdjTlJSWjkrM3J2U1B3akhwc2tVdXNqTXZZbGFnV1N3?=
 =?utf-8?B?T00zQS82U08wSUI1N3RVRWVEMlV6bkxTa2VoZUtzaU9abFdiTEtGbUs1MFYv?=
 =?utf-8?B?OFJ2R2JYT2ltSStkWVRDTHRXV2NQRTNOZ3dkVDZRUjNwSlZSaVF2azNBZHUy?=
 =?utf-8?B?Q21DWnhDb1BXbXVGZ1hUT2k2WWhDczlSb1pPWW11czE1bDM3YWZyVHVjQVQ5?=
 =?utf-8?B?amFtdThpaytQYk80S0tzbmxUMkUyeDQwNG1VR3h3VVg4UnBQcW0vUW1pMDdj?=
 =?utf-8?B?eUlmUDY4Ky9VRS9ySU44U0dEbW1xdEFBMEMvTnl0ZS9LRHlPS3lHdE5oYXdz?=
 =?utf-8?B?QjEwT1lZSnhGMUI3TzNPSmFMOFRCSlc4T3BoSDVNcTFaOHUwdTFFeHJycUkx?=
 =?utf-8?B?UHd2TGRHTnJuTGxPZndIMzRpajdxOVh4RUFkUDB1TUV3NGlrcklicDRlazFR?=
 =?utf-8?B?c01qcW9ubzVWTjU5aHVxd2doWHR4bDQ0aVZrUFA1V1R4MG4yOUF2UURGdm1Y?=
 =?utf-8?B?Z1VFVHdsT2Q2ZDdTSEd1VlNiUTRSMHVJQTV6NW8wWTFhSTdVUFhuMm5WWGhz?=
 =?utf-8?B?Vkd3dEp6a00rTjFZWlNld3M5M3lRYU1wS1JZeFJLSkpvZjhmQkw2RG9lSDBQ?=
 =?utf-8?B?K01oMTJsOFVBaHVDdTE4R1l0SWV4VGVsamtNTmw2dk9pcVM4TlFLL3p3aUhv?=
 =?utf-8?B?M0JISjNqL0wyT0JWdWIrVFJYbU5ESFFvVjRSSG1Lc2V2WDVia0tjYVM2dXBv?=
 =?utf-8?B?cVl2YWNEVjlFN2ZjSHo3K1NRdEJmWjhCZjJrcUdIWUt1OGJCWmdqVlhqZEJO?=
 =?utf-8?B?TUViaDBKQkNLZjM3T003RS9rNmEzYlNyRHJJbnk4ZjYwQnJ2WDdXTU1nV2NU?=
 =?utf-8?B?cnJXazRSNWVDM1BPYi9FOGNoYktnRkx1RWhPQ1JlYzZGTXpZaGRYU3NVRXBh?=
 =?utf-8?B?WFlTVzlSZzJPaHM2YUZFWitNYnBHTC8zUHFEVUV3NkUvU2tOd0FWc3RGM3dL?=
 =?utf-8?B?WW4wdW90UGdGa1JlV2JIb3BjVGZqZVlad2h5YUU5YVp1S1hZV2ZXMndWdFNl?=
 =?utf-8?B?S3hPUnVoWTBFVVYycWhMOTRRcEtIdzlDWHovRlIzdEk1RXEyTmJRZWdhL1Bv?=
 =?utf-8?B?dG0zOGRpSkdlWktWamNlT3k5engzUmoyUVkyWXRjT3IzenB4TEM4clgxWC96?=
 =?utf-8?B?NzU1Y0d6WW9TZzNIQ2FJbllQc0VIMnZiZFBndWdoTUZOQXhWbXJ0U1pLT3Ew?=
 =?utf-8?B?cWJRLzJLbE5BUTJnQk50TURFWHI5RXd5NGdrOUpHYzBSVkRoNWhNUVF4OFlJ?=
 =?utf-8?B?M3I0WVhKVktBTlVBUFNUNlZzUjJCWnprYWxVbnkyWHpVNDRrUEF3OVA5N2FZ?=
 =?utf-8?B?enVmd1lvbkxBR296c1MrV2FnT0paSlM4NlBRa1ArT1JOMTZyam1IdDh4TWUy?=
 =?utf-8?B?dVJsSHZwRENMOHgrbU5aYm5uUzNtcjlFeGhleW5Da1krOHFVdHArQXh2RHh6?=
 =?utf-8?B?SnM2M2x1RnJUT0lYaFN5cTViNTh4dkxsdC9QYlUxSlppenMveUFXSHNJLzVn?=
 =?utf-8?B?S1Z1Q1hGUzJsczUyU0hWZ2hQSlVSQ2FDRjFtU29EZ0NDRyszL01ZSHhTbzJ0?=
 =?utf-8?B?WDlZMGh4OHVSSzBiZHBvbEU2WHlEdVZ2UmM0cC9JYlR5am04ek5keVUzTTNu?=
 =?utf-8?B?ajhkNnpYam8yTUliR0lkNjc3VEN0aDFhU3NLL0d3azAzbVRuRW1SaHNrRVpY?=
 =?utf-8?B?b1E9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e96aeb6-c4a6-4180-1f8a-08dd346258ab
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8562.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2025 06:11:55.7677
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +kmGAJraJycFh1/8if9llhy4DNR/sfkmsvDkMu/QSd03pjC6KV72ZUGGIZ81XMC7Cysxo7VqPN4/Ppo16f1HBsrWnUFMRpIy2wPYRtl3btY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5786
X-Proofpoint-GUID: gQgFey498K43dU76eAu3hRb1SnmOKvKo
X-Authority-Analysis: v=2.4 cv=N5zTF39B c=1 sm=1 tr=0 ts=6786002e cx=c_pps a=+tN8zt48bv3aY6W8EltW8A==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VdSt8ZQiCzkA:10 a=bRTqI5nwn0kA:10
 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=JgNNDOm5B9po9tofu2IA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: gQgFey498K43dU76eAu3hRb1SnmOKvKo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-13_10,2025-01-13_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 mlxlogscore=999 clxscore=1015
 suspectscore=0 bulkscore=0 mlxscore=0 phishscore=0 spamscore=0
 impostorscore=0 malwarescore=0 classifier=spam authscore=0 adjust=0
 reason=mlx scancount=1 engine=8.21.0-2411120000
 definitions=main-2501140049
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 50E5JgF9031143
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Jan 2025 06:12:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114845

From: Zhang Peng <peng.zhang1.cn@windriver.com>

This upgrade includes fix for CVE-2024-56826 and CVE-2024-56827.

Changlog:
https://github.com/uclouvain/openjpeg/blob/v2.5.3/NEWS.md

* Refresh  0002-Do-not-ask-cmake-to-export-binaries-they-don-t-make-.patc=
h

Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
---
 ...t-ask-cmake-to-export-binaries-they-don-t-make-.patch} | 8 ++++----
 .../openjpeg/{openjpeg_2.5.0.bb =3D> openjpeg_2.5.3.bb}     | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)
 rename meta-oe/recipes-graphics/openjpeg/openjpeg/{0002-Do-not-ask-cmake=
-to-export-binaries-they-don-t-make-.patch =3D> 0001-Do-not-ask-cmake-to-=
export-binaries-they-don-t-make-.patch} (82%)
 rename meta-oe/recipes-graphics/openjpeg/{openjpeg_2.5.0.bb =3D> openjpe=
g_2.5.3.bb} (82%)

diff --git a/meta-oe/recipes-graphics/openjpeg/openjpeg/0002-Do-not-ask-c=
make-to-export-binaries-they-don-t-make-.patch b/meta-oe/recipes-graphics=
/openjpeg/openjpeg/0001-Do-not-ask-cmake-to-export-binaries-they-don-t-ma=
ke-.patch
similarity index 82%
rename from meta-oe/recipes-graphics/openjpeg/openjpeg/0002-Do-not-ask-cm=
ake-to-export-binaries-they-don-t-make-.patch
rename to meta-oe/recipes-graphics/openjpeg/openjpeg/0001-Do-not-ask-cmak=
e-to-export-binaries-they-don-t-make-.patch
index 0ba13cf88..47e4aebb4 100644
--- a/meta-oe/recipes-graphics/openjpeg/openjpeg/0002-Do-not-ask-cmake-to=
-export-binaries-they-don-t-make-.patch
+++ b/meta-oe/recipes-graphics/openjpeg/openjpeg/0001-Do-not-ask-cmake-to=
-export-binaries-they-don-t-make-.patch
@@ -1,4 +1,4 @@
-From 4681de07e21f17aa28710d3a51fabe7da60463f9 Mon Sep 17 00:00:00 2001
+From 805ce4d40c5aaae12aa73452ff07babe8eb43a62 Mon Sep 17 00:00:00 2001
 From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@gmail.c=
om>
 Date: Fri, 28 Sep 2018 00:38:50 +0200
 Subject: [PATCH] Do not ask cmake to export binaries - they don't make i=
t
@@ -15,7 +15,7 @@ Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail=
.com>
  1 file changed, 1 deletion(-)
=20
 diff --git a/src/bin/jp2/CMakeLists.txt b/src/bin/jp2/CMakeLists.txt
-index 4324c36d..2c11fe02 100644
+index 26156bcb..9eff04aa 100644
 --- a/src/bin/jp2/CMakeLists.txt
 +++ b/src/bin/jp2/CMakeLists.txt
 @@ -66,7 +66,6 @@ foreach(exe opj_decompress opj_compress opj_dump)
@@ -23,9 +23,9 @@ index 4324c36d..2c11fe02 100644
    # Install exe
    install(TARGETS ${exe}
 -    EXPORT OpenJPEGTargets
-     DESTINATION ${OPENJPEG_INSTALL_BIN_DIR} COMPONENT Applications
+     DESTINATION ${CMAKE_INSTALL_BINDIR} COMPONENT Applications
    )
    if(OPJ_USE_DSYMUTIL)
 --=20
-2.14.4
+2.25.1
=20
diff --git a/meta-oe/recipes-graphics/openjpeg/openjpeg_2.5.0.bb b/meta-o=
e/recipes-graphics/openjpeg/openjpeg_2.5.3.bb
similarity index 82%
rename from meta-oe/recipes-graphics/openjpeg/openjpeg_2.5.0.bb
rename to meta-oe/recipes-graphics/openjpeg/openjpeg_2.5.3.bb
index f2d74078e..231bf8457 100644
--- a/meta-oe/recipes-graphics/openjpeg/openjpeg_2.5.0.bb
+++ b/meta-oe/recipes-graphics/openjpeg/openjpeg_2.5.3.bb
@@ -6,9 +6,9 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dc648878b4840d7=
babaade1303e7f108c"
 DEPENDS =3D "libpng tiff lcms zlib"
=20
 SRC_URI =3D "git://github.com/uclouvain/openjpeg.git;branch=3Dmaster;pro=
tocol=3Dhttps \
-           file://0002-Do-not-ask-cmake-to-export-binaries-they-don-t-ma=
ke-.patch \
+           file://0001-Do-not-ask-cmake-to-export-binaries-they-don-t-ma=
ke-.patch \
            "
-SRCREV =3D "a5891555eb49ed7cc26b2901ea680acda136d811"
+SRCREV =3D "210a8a5690d0da66f02d49420d7176a21ef409dc"
 S =3D "${WORKDIR}/git"
=20
 inherit cmake
--=20
2.34.1


