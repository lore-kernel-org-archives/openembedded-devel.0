Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8B4DCEDDB5
	for <webhook@archiver.kernel.org>; Thu, 10 Oct 2024 01:41:35 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.33880.1728524483560804771
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Oct 2024 18:41:23 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=00130c5401=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49A0EWoX024568
	for <openembedded-devel@lists.openembedded.org>; Wed, 9 Oct 2024 18:41:23 -0700
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2175.outbound.protection.outlook.com [104.47.55.175])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4234ykvs0n-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 09 Oct 2024 18:41:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yyqdWcuXXnyS6B165P1OJGpmNrsajjEdVyU4nAF+/pZk3rS9ODRB2Av7H+I3wWfBYyxoSqBsEKx8FQ5CCpW7F9NpougyWEHH7ZagFRb+6pAm+8EnVik5Nb1k8iR/DtskB9u+U0OXLHm+izBGq6z0bMbkbeKUTQG9L+G7F2bVnZNiOrrfxpwCUTwFqCywBxRMKh1j7BLFF0M7GSrzVjGXorpEzfxsXye6RC1vHT2zVYd+eYO8T+Nf1zROq/fY9g6YBF8C+/GobuDzIODNxf1/5F0fJCh+hbAUBT7AObS7J036K8Ft09gK56m4hSkNVznNsN3dc3aEI+yZ1thOk3ZLLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s2/rp8g6bXvgGYBs+W5uLaRQ5821tyoDvF9CWbRpwig=;
 b=BLH+WvL8wOW+1LzAwIKaaJ7atuQynPOFlX9ViytX95T6zkqsyF51OJ7DlYuVIwaa8oiJGS3EtnDfiIPH8tgsTLTChVLgZUWcCiNEqfQD2Cra8jTiPtc8kRamg/fb0npYpz6uuQT/wXBG3pru/7BNSz37H2wNI9fNcS6efLYxlClvaFuZS9i7Dq9QVWvs4TwZv5oRZSUXJ0ei/uxMXbogXde86vfM+DhQNtfea3YPEM1UwrKghW/4h2V1NYOZtaoO3cMjG6waJRfDwCwWojUN2xnJcVBoCuXBculCuDC7dgBdNR9MHdCX5HVyfh+2WgI/aFaN/bwyUR+NI0xrq0Jvgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 DS0PR11MB8718.namprd11.prod.outlook.com (2603:10b6:8:1b9::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8048.16; Thu, 10 Oct 2024 01:41:20 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%5]) with mapi id 15.20.8026.020; Thu, 10 Oct 2024
 01:41:19 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 4/4] redis: upgrade 7.2.5 -> 7.2.6
Date: Thu, 10 Oct 2024 09:38:16 +0800
Message-Id: <20241010013816.4084737-4-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241010013816.4084737-1-yi.zhao@windriver.com>
References: <20241010013816.4084737-1-yi.zhao@windriver.com>
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: TYCP286CA0174.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c6::15) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|DS0PR11MB8718:EE_
X-MS-Office365-Filtering-Correlation-Id: d66f78bb-1f73-4ed8-37cf-08dce8cca3b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ODFTZGlDV1A2K2MzRlVuZHRzVEwvQW0zZnVCaXFzZytZVVh5eGRMdW5ydmVQ?=
 =?utf-8?B?bDlkTjkxL0pETU1GRzErd1MyMGt2N0w0TkJsalljTk1oaVF6RUNiY2lyemEw?=
 =?utf-8?B?SFVnZGNDWlZnYS9xU2gzdU9yRHVHQ1UxK1NwY2gzQmNIcEkzY09zb2Q1R2dK?=
 =?utf-8?B?UHRlZFFFSzdIa3Faa0pORVlpb2k1RzZTeklqYStpOXRkOVkzQ3NYeEVuTyt1?=
 =?utf-8?B?Ym4rZ0IwcGxPakhRelJMMU9PeTViUmF2clpZQUw0bERpcUdXc1RoeVhOYjlu?=
 =?utf-8?B?RWRISTlZOFQ5YVZzS0thUGpzd0kvcDE1QmVZeHBTWDhsZ2g3b3EvQ0tuWWFN?=
 =?utf-8?B?c3FMSlBZUGlTbU9zSnpmRVp5dmRoblBHQ3RhYTBZMUlESnJHQUI0U3RjQ2hF?=
 =?utf-8?B?d2hZZXRGUVpnbFVmY0tUY0lpUTVyR3RXTXUzNi9WYTdrQkJUYm9RY0t2M3Mx?=
 =?utf-8?B?WVZ0K0EyOXpFNE1IdEhYZ0VRRGFNV05Wa2ZQOGhuNzVvazkvR1V6OVhnd1Ra?=
 =?utf-8?B?dFBWQ1VYL24reWhHMnZieG5wNVN5L09GM0syT0thc2d3M2crUEhPdUlsbVBs?=
 =?utf-8?B?R2FpUVhML3I0SmI0N211d1QxNVlucUdya0JlcWVBYXVpcjBoTklMbHpoVlkz?=
 =?utf-8?B?SlJ0UCsvZjcwQ0x0elRPTExyRjN6N014dnJhYUJGSjJxU0x1ZFdtYjFrRVNB?=
 =?utf-8?B?SFlQS2RDcG5kUWNndTBLYWJ2dkNxM1VZZjZPaUV5WUswT21aTEUza2lnQVhq?=
 =?utf-8?B?QUNmVVpieGlQMENkUHBPS0pyTm5FaHJEbm5QSTBtNlBnYTRWcW5PZ1VMdlM0?=
 =?utf-8?B?ejRRYjVQSTFXdWJBSUFJNEp1eXZOU0ZaRDdwYXBoUllEaHV5eVVXVFpmK1Rw?=
 =?utf-8?B?dkRuNmUrVG9jL2d1amtydHhvWXc4MEVuSTNxVDdvZXhYdVFjQytFR1h2V0V2?=
 =?utf-8?B?RVBycUJDTnBlQWpBL0pvd1FQVDY5NWtVSEtGaHpJdWZuWDRoSEt1ejRWQk5H?=
 =?utf-8?B?YUlaNlZYT2l2eW83M0FoSW5aT3N1Smc1UUxNSy9VQmIxQzUwUWtUcDVpeDgy?=
 =?utf-8?B?ZU5XUWtEYk1ZdC9sVDVVZjBKMjdrY2MxdTY2QmU3OXpTVURycTduMXVNam9D?=
 =?utf-8?B?b0NjczZuSHg1UXFpR3QySXk2MDRFN0hGbGN4Q29vaEV6ZkU5N0hPa2JtaUpI?=
 =?utf-8?B?SUxFandvS01VeFdCWENUZXB5Y1l6YnZqREcramJVWVRWQjlGb01jSE54YkN0?=
 =?utf-8?B?cGlHOWR6b3h3UUVZUUlJTXZiaHJjWlIxWkNCOWh4ZzJ5c0Q4eWFaaTVLQU50?=
 =?utf-8?B?OTNETklxelRVbmtJVE5yVkM4dnF4ajNsbHVkVUk0QkJHa1JpeFVNbmVnWnFB?=
 =?utf-8?B?b3l5eXJXQUZ4UU1XSDNzNDZoSmpweUFMQlpLam1rUXJ6cjhtdGNsZTZKMGNH?=
 =?utf-8?B?UGlkeVJVZURMQVdUTXh6MEptZnIwd0RCZlpUblB5djRrOEc1dngwOHh2VS94?=
 =?utf-8?B?WHpQYkR3RWpzV3ZJdGZVZjRabkxac3FqMXFBcHJYeWhvYnBRTUFWVGZqaEJK?=
 =?utf-8?B?QnlxT09rNTVpMmhLdFZxaUVuK0RTLzV4RUlycEp0ZUhCVmRSc3NVWFRDblVj?=
 =?utf-8?B?VDk0Vm1iUnhleldqTFdwelN3RmZrMWV2R0FET3pGL0p5ZDU0R2pTaTN3WGhs?=
 =?utf-8?B?eEtIMlJFSE1vRExGR2tVSHVRemEraHN5OEZVRlhVRXpHVnBtOGpVU1JnPT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RjgrSGdjeTRrT3g2R2tDUXhudjlwWGtRVnAyOFRBWlJxaU44Rkhab1UyQ2pC?=
 =?utf-8?B?Tk1Hc3g4MU9QSk5JUy9lalAwSnhzZDI5TjVUQ1pPSFZYVXhNdVR6TEc0a1c3?=
 =?utf-8?B?cnBiVTVpUk90cmN5VXBuejl2d1RDcnNsQTV3aWNXNjJvV0NiY0J5QVpDK0FH?=
 =?utf-8?B?MHRiRGdLdHZHL2p5eGxrL092ck95Sm1jM0tNWEozeFdZS2JML2xXYWdvaTUw?=
 =?utf-8?B?andNRS9Ed3lrNUs1RzZnYU4wa1MxemN0ak1JcmljN1BMWjA0TDRjU00rQ3hF?=
 =?utf-8?B?QzZRNitFdElCTjdiTVIycnVrYnF6ZU0xaEc1dHk5Y2lmSE5DbmR2ckNxQndM?=
 =?utf-8?B?NnRpMVJEYUszMnJQQnBDTGw2OHh6TkZNWVRNTkh2Tm9lcTQwQnAralN1SC9Q?=
 =?utf-8?B?Uy9QWWQycnN2ZHFUYjRDZG9RQUJsWlF5TUtsWGJzU0IzeEkxbklhN0QzMnIx?=
 =?utf-8?B?ZDc1TklpNGdDcC92VGlYQjZSU0lwbklQZkI4b3VkVFVJTjNCNURBa3VCcGI1?=
 =?utf-8?B?UHJwQzEyLzYrWmRNb0JnVEovYVhoRjNZSngwZzY1d1NVU1Q5b1JZUzVGVVEw?=
 =?utf-8?B?TUErK1BpRmNEOGpBZXcwVFV3dVhQVVJOMzQrdHlCaDc5bUtnRkNOR0UxWEc5?=
 =?utf-8?B?N3B0Ump3cnN6ODZicWJGcnVDTXZVRHVvMnp2M3NubTNzY1NXeWVFYllGZFFJ?=
 =?utf-8?B?RVd5Qk8rcGVVMlZXQVB6M3VnL0J2UzFDTmRPR1hKYVlnV29OWUFCVE9vTm1p?=
 =?utf-8?B?RlFld1VxbTdNck5jaDlBTzVrUUc5TDQ5bnFpU1B2RGtmK25kNnp3ZHdhOTFF?=
 =?utf-8?B?aS9URW4xMXJ0cVZxcjJIcTFKOFZRYTRhcEVvSEpDb1JqWnhIMlZNcVR2MzJT?=
 =?utf-8?B?MFNGTDgyWjVvZHh0RkkxdTJkekMrbXlEUnhTZ0JVa3RwYnhEWlBvUzdzVVZz?=
 =?utf-8?B?V1Z3alZFZHFOdEdWU1ZjWlB1bUVWWTg5TzVqVUhPR3JjSlZDbWJkaDk3OUx1?=
 =?utf-8?B?dnBKblJta2dIRzh0Y2J4VFZZZTY2VjROSFZjdEJoUVdONXhSR3Q5bnFWZDdP?=
 =?utf-8?B?ZUw4WVRpbGdKcFQ3NlIrODJ5Z1Blb284ZE1XWVp5WUM4Q1pjcmtzSkZrMTcw?=
 =?utf-8?B?dldVTThQSjJGRXQ2QnZDWGtzQi8zeEJrZWs2L3Q0N2xKSzRoeWFOL0toNWZv?=
 =?utf-8?B?R1E3c2EvYkxMSit6T24zb2djU3JJOU5ONTVDWis5MklkMGcycjUvS0JRSHFi?=
 =?utf-8?B?Z0Y5OVd5cXBiaFRudjJ5YWYvV1VuTUxUU1dvajN4MlkwUzRna0xKQi83RDhu?=
 =?utf-8?B?aEpYNlZnNGtxVlZiZUhnRTlyNmU4U3V1Y2RXSGt5Sm1EQmhtN3kwTkdKMEhC?=
 =?utf-8?B?b1NoRlN5ZHpPa21FckNoQ0RVZUlkWlF0Mmp5RlRSN1JGc0hFdVVxYk01N1lj?=
 =?utf-8?B?SHlKKy92UzJYSUxpRDc0QnA1L0hRZFFGbW0yV2t6UjY5Q1dLVHplMlRoTmV6?=
 =?utf-8?B?REptajJhT2RCK2ZoVzh2Q0xIVysvdWZUL3VlR3JyVWVFT0d6ZTc3SnkwNE1x?=
 =?utf-8?B?ano4V0hqQVZJbzNjTEd3Und5cFBzZ01RQXFRckQ2bEpTNFpYY3VrS3ovOHda?=
 =?utf-8?B?ek5qQ2hIWTd4WXYvWFpZTFVtRlBSMk0yZlZIazhqMDJCSjk4OVBwRk1JcU5i?=
 =?utf-8?B?UzFnY1RTWUhPOGhrUmxBMmdjYUt2RnNQVGlUeERZYlRVRGE0ZHpxc1h5WU5v?=
 =?utf-8?B?dU1OKy83Zk9nbmFTQUJObE5KbU1GR1cwU0I2dlpXdGlZS2NCOG5EcjVQMlBF?=
 =?utf-8?B?S3JxYmRKL243eWVNWCtyRkIycVRURUZ0NmJTYkFkdjJrdmNDYjltZTFXS0ZO?=
 =?utf-8?B?b2NzdzVqaWVPRUIyWGZCSDljTEYzZGUxYzBJQ00rS0Z1dDRJaThzRjBBRGRv?=
 =?utf-8?B?eDFnbXR1dVo0dkx1RmlhZzhFYVp0REwyTEhqUWNTU2ZBZGZURk5hZ2xVR1Fl?=
 =?utf-8?B?dSt2cy82YlpYSTRlNU4zNjlNU0xjbmpOV0pFT0svdS9Ub1lZVW1Uc28xWmw5?=
 =?utf-8?B?SmhNcTFBb0h2WGQyOENDRWYzdXlUL0RTS3FVcFB1eE9EdG0vZHB3SnNNOTd3?=
 =?utf-8?Q?3NnSSTHmGHxVSLoVubCO17oiV?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d66f78bb-1f73-4ed8-37cf-08dce8cca3b4
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2024 01:41:19.9509
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EALoa69WzX9OvEXw6c/Cyl7NNaOKrV8m4T4QqWtGo+0o2InxmzjrCyF4ANTkWIaaoDJrGu37NmtcsjuPHCRQQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8718
X-Authority-Analysis: v=2.4 cv=AKB5nO5v c=1 sm=1 tr=0 ts=670730c3 cx=c_pps a=F+2k2gSOfOtDHduSTNWrfg==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=DAUX931o1VcA:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8 a=1KubnttrAAAA:8
 a=JF9118EUAAAA:8 a=pGLkceISAAAA:8 a=7UKGVgRVAAAA:8 a=szgukyCE4hRqUtCBftgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=FdTzh2GWekK77mhwV6Dw:22 a=H0t3PWKhy-h45uLjrunQ:22 a=xVlTc564ipvMDusKsbsT:22 a=8Ox4Rr8FuIIqx5qz5MW0:22
X-Proofpoint-GUID: xEMxal5H1CC82VgXMq2CsU2fvzmR0TgF
X-Proofpoint-ORIG-GUID: xEMxal5H1CC82VgXMq2CsU2fvzmR0TgF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-09_23,2024-10-09_02,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 mlxlogscore=999 mlxscore=0 bulkscore=0 clxscore=1015 spamscore=0
 adultscore=0 priorityscore=1501 classifier=spam authscore=0 adjust=0
 reason=mlx scancount=1 engine=8.21.0-2409260000
 definitions=main-2410100009
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 49A0EWoX024568
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Oct 2024 01:41:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112753

ChangeLog:

Security fixes
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
* (CVE-2024-31449) Lua library commands may lead to stack overflow and
  potential RCE.
* (CVE-2024-31227) Potential Denial-of-service due to malformed ACL
  selectors.
* (CVE-2024-31228) Potential Denial-of-service due to unbounded pattern
  matching.

Bug fixes
=3D=3D=3D=3D=3D=3D=3D=3D=3D
* Fixed crashes in cluster mode (#13315)

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...001-hiredis-use-default-CC-if-it-is-set.patch} |  7 +++----
 ...kefile-to-use-environment-build-setting.patch} |  6 +++---
 .../0003-hack-to-force-use-of-libc-malloc.patch}  |  7 +++----
 .../0004-src-Do-not-reset-FINAL_LIBS.patch}       |  4 ++--
 ...SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch} |  6 +++---
 .../0006-Define-correct-gregs-for-RISCV32.patch   |  4 ++--
 .../init-redis-server                             |  0
 .../redis/{redis-7.2.5 =3D> redis-7.2.6}/redis.conf |  0
 .../{redis-7.2.5 =3D> redis-7.2.6}/redis.service    |  0
 .../redis/{redis_7.2.5.bb =3D> redis_7.2.6.bb}      | 15 ++++++++-------
 10 files changed, 24 insertions(+), 25 deletions(-)
 rename meta-oe/recipes-extended/redis/{redis-7.2.5/hiredis-use-default-C=
C-if-it-is-set.patch =3D> redis-7.2.6/0001-hiredis-use-default-CC-if-it-i=
s-set.patch} (95%)
 rename meta-oe/recipes-extended/redis/{redis-7.2.5/lua-update-Makefile-t=
o-use-environment-build-setting.patch =3D> redis-7.2.6/0002-lua-update-Ma=
kefile-to-use-environment-build-setting.patch} (97%)
 rename meta-oe/recipes-extended/redis/{redis-7.2.5/oe-use-libc-malloc.pa=
tch =3D> redis-7.2.6/0003-hack-to-force-use-of-libc-malloc.patch} (94%)
 rename meta-oe/recipes-extended/redis/{redis-7.2.5/0001-src-Do-not-reset=
-FINAL_LIBS.patch =3D> redis-7.2.6/0004-src-Do-not-reset-FINAL_LIBS.patch=
} (92%)
 rename meta-oe/recipes-extended/redis/{redis-7.2.5/GNU_SOURCE-7.patch =3D=
> redis-7.2.6/0005-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.pa=
tch} (88%)
 rename meta-oe/recipes-extended/redis/{redis-7.2.5 =3D> redis-7.2.6}/000=
6-Define-correct-gregs-for-RISCV32.patch (97%)
 rename meta-oe/recipes-extended/redis/{redis-7.2.5 =3D> redis-7.2.6}/ini=
t-redis-server (100%)
 mode change 100755 =3D> 100644
 rename meta-oe/recipes-extended/redis/{redis-7.2.5 =3D> redis-7.2.6}/red=
is.conf (100%)
 rename meta-oe/recipes-extended/redis/{redis-7.2.5 =3D> redis-7.2.6}/red=
is.service (100%)
 rename meta-oe/recipes-extended/redis/{redis_7.2.5.bb =3D> redis_7.2.6.b=
b} (83%)

diff --git a/meta-oe/recipes-extended/redis/redis-7.2.5/hiredis-use-defau=
lt-CC-if-it-is-set.patch b/meta-oe/recipes-extended/redis/redis-7.2.6/000=
1-hiredis-use-default-CC-if-it-is-set.patch
similarity index 95%
rename from meta-oe/recipes-extended/redis/redis-7.2.5/hiredis-use-defaul=
t-CC-if-it-is-set.patch
rename to meta-oe/recipes-extended/redis/redis-7.2.6/0001-hiredis-use-def=
ault-CC-if-it-is-set.patch
index 7785acca5..63bf40341 100644
--- a/meta-oe/recipes-extended/redis/redis-7.2.5/hiredis-use-default-CC-i=
f-it-is-set.patch
+++ b/meta-oe/recipes-extended/redis/redis-7.2.6/0001-hiredis-use-default=
-CC-if-it-is-set.patch
@@ -1,4 +1,4 @@
-From 41efa2f0cf08c91ff935bbb2d16ab233df7f5811 Mon Sep 17 00:00:00 2001
+From af4fc632c03b2a68be4206b4896f27fc4bb865ae Mon Sep 17 00:00:00 2001
 From: Venture Research <tech@ventureresearch.com>
 Date: Fri, 8 Feb 2013 17:39:52 -0600
 Subject: [PATCH] hiredis: use default CC if it is set
@@ -9,6 +9,8 @@ Content-Transfer-Encoding: 8bit
 Instead of trying to automagically figure out CC, which breaks with OE
 as CC has spaces in it, just skip it if one was already passed in.
=20
+Upstream-Status: Pending
+
 Signed-off-by: Venture Research <tech@ventureresearch.com>
=20
 Update to work with 4.0.8
@@ -16,10 +18,7 @@ Signed-off-by: Alistair Francis <alistair.francis@wdc.=
com>
=20
 Reworked for 6.0.4
 Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
-
 ---
-Upstream-Status: Pending
-
  deps/hiredis/Makefile | 2 --
  1 file changed, 2 deletions(-)
=20
diff --git a/meta-oe/recipes-extended/redis/redis-7.2.5/lua-update-Makefi=
le-to-use-environment-build-setting.patch b/meta-oe/recipes-extended/redi=
s/redis-7.2.6/0002-lua-update-Makefile-to-use-environment-build-setting.p=
atch
similarity index 97%
rename from meta-oe/recipes-extended/redis/redis-7.2.5/lua-update-Makefil=
e-to-use-environment-build-setting.patch
rename to meta-oe/recipes-extended/redis/redis-7.2.6/0002-lua-update-Make=
file-to-use-environment-build-setting.patch
index 20708eda1..46330f506 100644
--- a/meta-oe/recipes-extended/redis/redis-7.2.5/lua-update-Makefile-to-u=
se-environment-build-setting.patch
+++ b/meta-oe/recipes-extended/redis/redis-7.2.6/0002-lua-update-Makefile=
-to-use-environment-build-setting.patch
@@ -1,4 +1,4 @@
-From aa3d31355f3cc140b1dc2f4fcff8e3c0aa261549 Mon Sep 17 00:00:00 2001
+From 45ae5eb5c3482054073e06ab1a78e0aa9b96447f Mon Sep 17 00:00:00 2001
 From: Venture Research <tech@ventureresearch.com>
 Date: Fri, 8 Feb 2013 20:22:19 -0600
 Subject: [PATCH] lua: update Makefile to use environment build settings
@@ -6,6 +6,8 @@ Subject: [PATCH] lua: update Makefile to use environment =
build settings
 OE-specific parameters, instead of overriding all of these simply use
 the ones that are already passed in. Also configure for only Linux...
=20
+Upstream-Status: Pending
+
 Signed-off-by: Venture Research <tech@ventureresearch.com>
=20
 Updated to work with 3.0.x
@@ -14,8 +16,6 @@ Signed-off-by: Armin Kuster <akust808@gmail.com>
=20
 updated to work wtih 6.2.1
 Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
-
-Upstream-Status: Pending
 ---
  deps/Makefile         |  1 -
  deps/lua/Makefile     |  1 -
diff --git a/meta-oe/recipes-extended/redis/redis-7.2.5/oe-use-libc-mallo=
c.patch b/meta-oe/recipes-extended/redis/redis-7.2.6/0003-hack-to-force-u=
se-of-libc-malloc.patch
similarity index 94%
rename from meta-oe/recipes-extended/redis/redis-7.2.5/oe-use-libc-malloc=
.patch
rename to meta-oe/recipes-extended/redis/redis-7.2.6/0003-hack-to-force-u=
se-of-libc-malloc.patch
index 7b601e02a..1f97f9783 100644
--- a/meta-oe/recipes-extended/redis/redis-7.2.5/oe-use-libc-malloc.patch
+++ b/meta-oe/recipes-extended/redis/redis-7.2.6/0003-hack-to-force-use-o=
f-libc-malloc.patch
@@ -1,4 +1,4 @@
-From 38a5f403b033d03cdac3ff814687d83f61527d8e Mon Sep 17 00:00:00 2001
+From 7a98e3ac480413ce7db3a5edd5dc70458b921b29 Mon Sep 17 00:00:00 2001
 From: Venture Research <tech@ventureresearch.com>
 Date: Wed, 6 Feb 2013 20:51:02 -0600
 Subject: [PATCH] hack to force use of libc malloc
@@ -9,14 +9,13 @@ removed in favor of magic.
 Note that this of course doesn't allow tcmalloc and jemalloc, however
 jemalloc wasn't building correctly.
=20
+Upstream-Status: Pending
+
 Signed-off-by: Venture Research <tech@ventureresearch.com>
=20
 Update to work with 4.0.8
 Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
-
 ---
-Upstream-Status: Pending
-
  src/Makefile | 3 ++-
  1 file changed, 2 insertions(+), 1 deletion(-)
=20
diff --git a/meta-oe/recipes-extended/redis/redis-7.2.5/0001-src-Do-not-r=
eset-FINAL_LIBS.patch b/meta-oe/recipes-extended/redis/redis-7.2.6/0004-s=
rc-Do-not-reset-FINAL_LIBS.patch
similarity index 92%
rename from meta-oe/recipes-extended/redis/redis-7.2.5/0001-src-Do-not-re=
set-FINAL_LIBS.patch
rename to meta-oe/recipes-extended/redis/redis-7.2.6/0004-src-Do-not-rese=
t-FINAL_LIBS.patch
index 01e53e3f2..974cf5169 100644
--- a/meta-oe/recipes-extended/redis/redis-7.2.5/0001-src-Do-not-reset-FI=
NAL_LIBS.patch
+++ b/meta-oe/recipes-extended/redis/redis-7.2.6/0004-src-Do-not-reset-FI=
NAL_LIBS.patch
@@ -1,4 +1,4 @@
-From d9d1f9a501ef7caa80d1e6595218898e9989ec2b Mon Sep 17 00:00:00 2001
+From 50fc46a12f6cf97e7b927d3ea29eecc9ebdea34d Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 10 Sep 2019 20:04:26 -0700
 Subject: [PATCH] src: Do not reset FINAL_LIBS
@@ -9,8 +9,8 @@ environment to get it going
 e.g. -latomic is needed on clang/x86 to provide for 64bit atomics
=20
 Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
=20
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  src/Makefile | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
diff --git a/meta-oe/recipes-extended/redis/redis-7.2.5/GNU_SOURCE-7.patc=
h b/meta-oe/recipes-extended/redis/redis-7.2.6/0005-Define-_GNU_SOURCE-to=
-get-PTHREAD_MUTEX_INITIALIZER.patch
similarity index 88%
rename from meta-oe/recipes-extended/redis/redis-7.2.5/GNU_SOURCE-7.patch
rename to meta-oe/recipes-extended/redis/redis-7.2.6/0005-Define-_GNU_SOU=
RCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch
index 6e07c25c6..8e5f30993 100644
--- a/meta-oe/recipes-extended/redis/redis-7.2.5/GNU_SOURCE-7.patch
+++ b/meta-oe/recipes-extended/redis/redis-7.2.6/0005-Define-_GNU_SOURCE-=
to-get-PTHREAD_MUTEX_INITIALIZER.patch
@@ -1,4 +1,4 @@
-From a22512ac1cbd6de1f5646219722e49752d1f60ac Mon Sep 17 00:00:00 2001
+From acd832d76002a1916b3128ac05bc0296425aea6d Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 21 Dec 2019 12:09:51 -0800
 Subject: [PATCH] Define _GNU_SOURCE to get PTHREAD_MUTEX_INITIALIZER
@@ -9,14 +9,14 @@ Fixes
 |       |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~
=20
 Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
=20
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  src/zmalloc.c | 1 +
  1 file changed, 1 insertion(+)
=20
 diff --git a/src/zmalloc.c b/src/zmalloc.c
-index ba03685..322304f 100644
+index bbfa386..93e07ff 100644
 --- a/src/zmalloc.c
 +++ b/src/zmalloc.c
 @@ -32,6 +32,7 @@
diff --git a/meta-oe/recipes-extended/redis/redis-7.2.5/0006-Define-corre=
ct-gregs-for-RISCV32.patch b/meta-oe/recipes-extended/redis/redis-7.2.6/0=
006-Define-correct-gregs-for-RISCV32.patch
similarity index 97%
rename from meta-oe/recipes-extended/redis/redis-7.2.5/0006-Define-correc=
t-gregs-for-RISCV32.patch
rename to meta-oe/recipes-extended/redis/redis-7.2.6/0006-Define-correct-=
gregs-for-RISCV32.patch
index 93c359526..700904817 100644
--- a/meta-oe/recipes-extended/redis/redis-7.2.5/0006-Define-correct-greg=
s-for-RISCV32.patch
+++ b/meta-oe/recipes-extended/redis/redis-7.2.6/0006-Define-correct-greg=
s-for-RISCV32.patch
@@ -1,14 +1,14 @@
-From 634f62be6c135ece93cb4e44a69ce3cb66f394ca Mon Sep 17 00:00:00 2001
+From dd3ecb07bbf80b986b8f2c656ea11d1346e212f6 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 26 Oct 2020 21:32:22 -0700
 Subject: [PATCH] Define correct gregs for RISCV32
=20
 Upstream-Status: Pending
+
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
=20
 Updated patch for 6.2.8
 Signed-off-by: Changqing Li <changqing.li@windriver.com>
-
 ---
  src/debug.c | 26 ++++++++++++++++++++++++--
  1 file changed, 24 insertions(+), 2 deletions(-)
diff --git a/meta-oe/recipes-extended/redis/redis-7.2.5/init-redis-server=
 b/meta-oe/recipes-extended/redis/redis-7.2.6/init-redis-server
old mode 100755
new mode 100644
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7.2.5/init-redis-server
rename to meta-oe/recipes-extended/redis/redis-7.2.6/init-redis-server
diff --git a/meta-oe/recipes-extended/redis/redis-7.2.5/redis.conf b/meta=
-oe/recipes-extended/redis/redis-7.2.6/redis.conf
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7.2.5/redis.conf
rename to meta-oe/recipes-extended/redis/redis-7.2.6/redis.conf
diff --git a/meta-oe/recipes-extended/redis/redis-7.2.5/redis.service b/m=
eta-oe/recipes-extended/redis/redis-7.2.6/redis.service
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7.2.5/redis.service
rename to meta-oe/recipes-extended/redis/redis-7.2.6/redis.service
diff --git a/meta-oe/recipes-extended/redis/redis_7.2.5.bb b/meta-oe/reci=
pes-extended/redis/redis_7.2.6.bb
similarity index 83%
rename from meta-oe/recipes-extended/redis/redis_7.2.5.bb
rename to meta-oe/recipes-extended/redis/redis_7.2.6.bb
index 930c1cd9a..e831bd85f 100644
--- a/meta-oe/recipes-extended/redis/redis_7.2.5.bb
+++ b/meta-oe/recipes-extended/redis/redis_7.2.6.bb
@@ -10,14 +10,15 @@ SRC_URI =3D "http://download.redis.io/releases/${BP}.=
tar.gz \
            file://redis.conf \
            file://init-redis-server \
            file://redis.service \
-           file://hiredis-use-default-CC-if-it-is-set.patch \
-           file://lua-update-Makefile-to-use-environment-build-setting.p=
atch \
-           file://oe-use-libc-malloc.patch \
-           file://0001-src-Do-not-reset-FINAL_LIBS.patch \
-           file://GNU_SOURCE-7.patch \
+           file://0001-hiredis-use-default-CC-if-it-is-set.patch \
+           file://0002-lua-update-Makefile-to-use-environment-build-sett=
ing.patch \
+           file://0003-hack-to-force-use-of-libc-malloc.patch \
+           file://0004-src-Do-not-reset-FINAL_LIBS.patch \
+           file://0005-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZ=
ER.patch \
            file://0006-Define-correct-gregs-for-RISCV32.patch \
-           "
-SRC_URI[sha256sum] =3D "5981179706f8391f03be91d951acafaeda91af7fac56beff=
b2701963103e423d"
+          "
+
+SRC_URI[sha256sum] =3D "fb10d67a2fe2b4556f6cb840064dd6e6e3175ce8ca035f07=
26990ec2da9f3d0e"
=20
 inherit autotools-brokensep pkgconfig update-rc.d systemd useradd
=20
--=20
2.25.1


