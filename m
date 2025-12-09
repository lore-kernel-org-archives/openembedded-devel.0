Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CF51D3B7F8
	for <webhook@archiver.kernel.org>; Tue,  9 Dec 2025 08:57:10 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3345.1765270623274515362
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Dec 2025 00:57:03 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=nX0EyO48;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4438979ad4=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B96mxqB2003186
	for <openembedded-devel@lists.openembedded.org>; Tue, 9 Dec 2025 08:57:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=InkVJ501r
	0HbpaEXWkfU+N96lL7H232J/yOe0H61UyA=; b=nX0EyO48zYqCoJcC3Z0V1QW1i
	JNHurYtt2n0YsIKe49QEB0pPctlj93dk13fcnv7Nf+4srn0IHj7kIcaqfMc4ILrO
	UN+FLnk8DuNAMoDG9Prj0cVhGX3p0epjPFtSvZPEkZAb/Lwi3ihLCTMsywPO06ih
	XT6ekQbWh9Jjx8/QFEQ4uEiiFXnDUr5stmXO1Q8dGpIHYq0LaE/8BkKCVOV8LxRn
	YdRtsy+jfWJa2u7rxI5j3x4BCCGamyt79BPwFZ60Dbl2pJOw00oUSdpGHq/xb18T
	D12qxScLbLPI+u1cD6IySQjojuiFWmDR9F8ekvewgEbWWHN2ulV1ygBTM+LTQ==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012056.outbound.protection.outlook.com [40.107.209.56])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4avb742ruu-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 09 Dec 2025 08:57:01 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OCabyanhuTOn2nO4FnA1UPeklyf76O/3nYwl8YACHzwjD6GzxDl3sGvXX0O9kGnzLAQT8e7xGYlT7BxUN2p5yFAqxVoyKdCf/GGfdSlJ4DzK8+2FDbDifVLkwcf9N8hsaavaxMuIAkNZ3VEg7NgFHlg5Am+zHU/zzJcRzN9oahEuMrnAy0C/OrtenZi8n4Nv8gqL/TIdye5HV4Hvj8pZgGXxLQ7BuDt3oc+Dh/cw73jw22+XtUs/wFoUe2dUcO1qzF3PQDVrINloKJm9dktEc1hS17VNjevH9baPiADZ8bbhW0Z93tU+s8WLSDv/kYxgpdWuuZuIlCMJt+6JLFlawA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=InkVJ501r0HbpaEXWkfU+N96lL7H232J/yOe0H61UyA=;
 b=yM6ECRDbidT1F1rryLKNZO+Sq07HZ3obqPQ3INJ5Kbb4b3aNoRK0hG4U+Qo60P1Vf3fUK0xVh09vX79yEp2Vlbt24Q8Z/wN1owv9W7MY0sLCgosxX4RjNDDbM8eW7aBzj9BCS75SgyR4XFpbY6oUleAuhlyR5GeguTkf1hyfGc+KAi9VsKORXlNLpEaVt0OMtsQotmcL2ktFPAI+7nx654mtkyF2s6qgfK2l+qWi2P+wjq8nlvV4Y1ia1lVhuUedUwfmT4sK72IQLHkSYvGNnXx7dvinxsSrHTWLTZ4UDFJbOl1X18wbS/y+/Tp0Wgnxl9TcOpMPUcD4T18gG1lKHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM8PR11MB5637.namprd11.prod.outlook.com (2603:10b6:8:33::5) by
 DM3PPFCA3BFC2BF.namprd11.prod.outlook.com (2603:10b6:f:fc00::f4c) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Tue, 9 Dec
 2025 08:56:59 +0000
Received: from DM8PR11MB5637.namprd11.prod.outlook.com
 ([fe80::2f29:a2b4:343b:80eb]) by DM8PR11MB5637.namprd11.prod.outlook.com
 ([fe80::2f29:a2b4:343b:80eb%4]) with mapi id 15.20.9388.013; Tue, 9 Dec 2025
 08:56:59 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-devel@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Deepesh.Varatharajan@windriver.com
Subject: [meta-oe][PATCH 1/2] fd-find: Add fd-find recipe
Date: Tue,  9 Dec 2025 00:56:44 -0800
Message-ID: <20251209085645.1437344-1-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: BYAPR05CA0051.namprd05.prod.outlook.com
 (2603:10b6:a03:74::28) To DM8PR11MB5637.namprd11.prod.outlook.com
 (2603:10b6:8:33::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5637:EE_|DM3PPFCA3BFC2BF:EE_
X-MS-Office365-Filtering-Correlation-Id: edbb55de-6dcc-4af9-512b-08de3700e9aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?MWk3a2NYaWZyUS94OVFJSVl2TXM5Z1I2OFlqcnlpaDZseE1VVzdiYTUzRTlr?=
 =?utf-8?B?aWk2Wjc0N1RjTUpjdmczUGQwVHpRb2k1dllLZUg1TUkyeFVuY255cWZ2QUtB?=
 =?utf-8?B?VTl0dXNSVjFDR0c5dnFMWk0yNWJONDBnN09zY1QvU0JpYjJCRUpnMTYzQUw5?=
 =?utf-8?B?VnBpWXhnYXRWYlVWMkFLT2JtSDFzU0xHdlBtb1dIMVpBaHl6SHJtMWd0UE9l?=
 =?utf-8?B?VytyaFVQS2o5T21YeFV3WC9jYkRZdUNVclluWmNvQ1d5YVBXa2lKbUJuUjhH?=
 =?utf-8?B?Z3BrNnpaU29MOUhQRXJqYjdDOFRsVExqTnUyUXUwMTdEQW1rWjRrWWxwL3l6?=
 =?utf-8?B?b1ZuRjBTVEprZ0xrVjUwMFdvVFRlaU1EK0Fwb2FNSURsUXVSTThiVEgrSzg4?=
 =?utf-8?B?ek5yQUdTM0t4ajBmU0xWZUl6cDAvamdHNTJJaXhKWDlMdWJVM1VjU2JrUGd5?=
 =?utf-8?B?b0pZTjQzSVJINzQ5bTluRmRUSThwSVZyRXgwWE02TlE4REE4c2tFOVZhQi9O?=
 =?utf-8?B?NE1HdENJUkhDbTZzd2NjWEdzNUhnM3MycGZlV3MzNkU2SkVtVGdLbFBRekNt?=
 =?utf-8?B?dGoyUUcxSTltcURBQ0xsaG8ycnhDNjVMWXR2N01IOWFoNmNGcU9IUkk5T2tq?=
 =?utf-8?B?RDdFZnBZc2k3NmsyRC9zcjRCWUtjc0cxVlc5VGc0d2wraDVXRStWb0lvMWQv?=
 =?utf-8?B?T3Nhak9zOWxRUTF5OE9ETGp3RDVPaHNnSDVCNTFPaGdFcWt1SjVqZFBzUkFq?=
 =?utf-8?B?L24xdEdWa3p0S1pYV3o2anVBNitGU1o5NnFGL0twVGIyd3JZU29ZMit0Njli?=
 =?utf-8?B?bC9YTVJRTjhSemppdWx3a3EybkFack1PRlFMZVhuV1JFamlyeWRyUFYwRGNJ?=
 =?utf-8?B?TksyZVhVbFhZZmR5NTRETkZrZkdmV0hrS3pseTVJWis0NnBjdkRmQWZSTEl1?=
 =?utf-8?B?dW4xVGpXSk1FL2pncUVVNVFDSUJaNnVOejFvbFFreFN5cG5MME5XK3VZS2FI?=
 =?utf-8?B?U1hMa1NIOUZBVHBUM2RsMnZJeEFiL2VHaU50dlRzNDB1UTMvWWFyZmdjUng2?=
 =?utf-8?B?WlQrN3RsUjdVM1lXSTJ5UmhUTmFsRzc1aDlTY3haRFdFVmVQakZaZXFNcG5k?=
 =?utf-8?B?MHhQNHJ2ajNia1lOTHNzMGk1ai9CWHNaWkRUcnlQZHNtcmt6RkxJMG1CZ2xy?=
 =?utf-8?B?UExadmxSSUdTcnFQa0tnb014WWVIdHpwZnU5ZkYveGl1OHc3UGVqaDhsRGgx?=
 =?utf-8?B?Y3V6SFFyOGhDNDNTRnRKNUM4UVJWbzVCeVg4MDk2TzkyNjV4N1p4L290T3JO?=
 =?utf-8?B?aEE3STNDZjNhVnNrUGhFYWNRUHJZYjErVi8vM1FnTGk3OGhsY0V1UWpBV2Vp?=
 =?utf-8?B?WGVVVWZKeFAxdnZST0xNQm1wTnc1amFWUWRHbUxMWmpKK3o0djJ6WWovYW05?=
 =?utf-8?B?RU1vVXZHN0RiTnBDeFZzeU9nZ2RsaG55bmw3R0pwVXhOTFBlNW1iWm9tQWlR?=
 =?utf-8?B?STBxbGZjalV1Mkt2c1JzbUludmpZdENJZnF3Zmsxc2ZoT0U0L1NpRXBsQk9s?=
 =?utf-8?B?VitEc1o3VDFBYVF6Mm9BMjd6MWVmQUliZ2UyZTM4OVN6ZlpPeWQzbkUyenFv?=
 =?utf-8?B?N3VyenZTRWk1eGEvRjkzTVRNcWhtQXMrTDk2RWRiQ1BNSzVkaEZkZzhucERW?=
 =?utf-8?B?UGdRTGtNWjBLeEZqQzBWb3l1ZEdOc1FWNjBvZjl0VkVyZlRwVldxNHE2TWZF?=
 =?utf-8?B?ODZNZnBWVGVZT0hSM3Y4V2hlVXZvVFZGZFpBZnJ0cm5TbkZNOWlqNURzeEJV?=
 =?utf-8?B?RXVVbkRRcjMzTkpqbG8rZExCbEh4RkF1NnQvbUZNR2dvZ2gyNVFTOTBwMUtJ?=
 =?utf-8?B?R051Y0Jrc1piam1ad242Z0ViZ1kyUXNWL0E5MUptVURQU0F5aE1TUE1BdHVC?=
 =?utf-8?B?bjdxR2xEb0E0Q1M4VWFzMk9PYnlYZVdlL1BMcEl2ci9kbHhiMTZ3MU5OeFZ0?=
 =?utf-8?B?WlpPT2hRU3FaSzUweWQwTkt2akdDcUVNa29FT3dudGJCbUlaMzIyaDVmYU1W?=
 =?utf-8?Q?2Zr+AI?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR11MB5637.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(13003099007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?L3J1Z3dKalpuZW9NU2VDVWR6ZlZlM3dBWndPYXNjaEEwVTdoZmVzTjQ5RkZu?=
 =?utf-8?B?dldGQ2xaeW5JZzFyNXlGNlYxZC91MHhIYVZNZVlXdlFZVkZDMnA1M0lVNkpM?=
 =?utf-8?B?TmkzeTNCTnB5UjIwbE5mQzZYMVZWOWZ6TkdjM0M3RzZkYTBkWTZyWHQ1dmx3?=
 =?utf-8?B?cWZqeEJycjV1a1BuU0oreGZzb01SNERZUTVkWkM2SXZyRThvdFlsbjRaY1d2?=
 =?utf-8?B?RC9MRkZLd2h3WjRHMXUwSk1Ebmp0UitwWnhnNnVyK3FTaTZHOEhtMTdMa3k4?=
 =?utf-8?B?QUhKdW5VRmZvT04wbkFZN0JXaHpkK2FFNnpTVUtuN0x5TzhwQVErNTRBWHR3?=
 =?utf-8?B?dmU2ejlYVExtOWlRZy9qdmlIZHVhaVIwQ24xc0ErUVdNcUY0UWZoTXptd1cy?=
 =?utf-8?B?bHhJSjZLSzJGUEs4VW1xd2gzaURIc0dxZWVmb1pBb2d6cWxGNGpvYXk5OXlK?=
 =?utf-8?B?TWdLM2MzRnJiYU1VazJLLzUzWlpZeWkraWg1Wit4OTlwRkdNN2RPWi9XUktp?=
 =?utf-8?B?Sm9zK1dKakhnTE9RTlhLQjBPa1JkNG4yRUJuQlRTcWxHb0pSa0o5bG1SM005?=
 =?utf-8?B?QWdEN1l0dXlwUmRkME0wc2Q3ZnFxN2RMRElQbjdBS25HVnZLNkZ3d3UxbGti?=
 =?utf-8?B?MTNtQktPakpyUy9MUDhnK3pmRG1ZV1RFWkN4MFFaeEhZSnAwN0dHcDJyN2xP?=
 =?utf-8?B?WUFSVXlWK2R0VWY4Mm5KbnVmQWo4TGNEcUpvTm5LWXdPcEw5NC84eExoazFh?=
 =?utf-8?B?N3JWa3pLWTBLSVlCQWVhQkFTWEN2R0daRVJITU04M0xhMS9mUTVlRExUS2NJ?=
 =?utf-8?B?cWJ6TCs3MWVHY05xemdkUUl6eWNMR1BHOVAvRE9FLzhBRHZETWlLVnB0d0dJ?=
 =?utf-8?B?ZHBvdG81WnF6N1VrdXEwWCtVSHlFOXZIV0tWaUkvMFJJaG85eUpjVUJPK252?=
 =?utf-8?B?UE4rSzhRNmNIM1VxSk9RTmVUQmNMb2tvL3pmZGtoeEdabHJRMjdwVHByMDJy?=
 =?utf-8?B?b0dESHh5cHlCR1dSekxxQkkycERvWHJPRWtFMjNrMGx5aE9lcHVFVUQ1SDQr?=
 =?utf-8?B?RHBZWExlYW9PV0JwRkNUOE9VdGR5REVhREtLWkI3Wm5CeURIOHFLYjREYUhB?=
 =?utf-8?B?TUVJYllhbzJJN3NCUC9VQ1NyVk9waGF3Rk92cTdyMEYzVXJyRklUZmlSTUpr?=
 =?utf-8?B?NUFhL2hJcHhOWEsvbkFLUW9NZHhibC9XcnpxckZyWTZqcGg4b0FyaDJoRERD?=
 =?utf-8?B?SFlxbzcwVlVYTXUzU2ljb2Ywb2RzVVVIM3QwZ0cydVBaZlpvRGlMNGt4cmZB?=
 =?utf-8?B?ZTdvWU9VM0l5VVhlREE0TnJwcEJMZ3d3YTJqQ3BHVUh3MlFhcDF4d2xzQjJD?=
 =?utf-8?B?alZiVFZscUlKd3F5eC9kVVVNZldOQ1hJUVlmdmRiYW5hWm5BV1hHT0Q1WkpW?=
 =?utf-8?B?OW9kMU5BUjl6SlhLT3k4amYwVTNMTERKWnFPbjhjTUNDdURnRnlIOFMwRE5u?=
 =?utf-8?B?ellBVG8wRFdKK2Ivc2ZIbXRNVVlaVHVlZld5bTcvNXYvZ29NUDlyb0RmM1Ri?=
 =?utf-8?B?WmV6bmhtYTZSN1pxc09pL2pwT013anBmdmMzMjhXZEtxWENKdDBsWU03VUd2?=
 =?utf-8?B?OFpLckNpY2lDeGNIOFY3a0tNOElVQTRqdzlLMEFOakxIWFpDalJnK1Z4NXNZ?=
 =?utf-8?B?a1NRTnRPQ1FLRm5RVW9LYlBtWXgxWjF5OWdVaVl3cXkvM0dJLzFKSWJUQkhi?=
 =?utf-8?B?emRsL3AvNW5jRy91UFRtN00yYlc1c0R1bnN1S2NmVzVCOVhZdXVHakZBRmw1?=
 =?utf-8?B?eloxVWtXb2p0aUJGOElNN1NHays2aTkvdU1yS0lNajVHNzJMOEUva2tmUnFG?=
 =?utf-8?B?WXNWeUV4UEMrcGtMKzZORFFLdGFUbFROQXNUYmxmNWI3WEptOGZ0MGNOM2xQ?=
 =?utf-8?B?elRnSlRWc0NiUUJkd2dxeHB4aWJwU1BNa2FIRnBDaTBseUVCRk5sRWsyZVd4?=
 =?utf-8?B?Nk9uTllqbUVjbmtFVE1aaW0xS1V3UlV5Z0hLMDhseFRYN09BeXZKTXR1a1NC?=
 =?utf-8?B?bEpKbVZDSm9hTmhNL1g4ZVZZYXNFWEZqNTZyWU8rSFdXQWE3bGN3bHVjTXg4?=
 =?utf-8?B?bG9kYXdaRjNuazJsUitiVi9TdmdXV2tEbG5lMWhTZWQ0b1lTNTMzWCtYT3N2?=
 =?utf-8?Q?o88qLb0ZxFdPPFsfwBSxLcc=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: edbb55de-6dcc-4af9-512b-08de3700e9aa
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5637.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2025 08:56:59.5246
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x2NJXEEfJNB0p+kEEYSxydR7KbMh07AXw1kTHa9ZbRolcLrc1Ok2li3UaOodfDbU6sr9nIEPgdkXbQ8Jba0+4mzi/FYXYIm/EG8ZO2nPYgBSqL0Tu305M0N+AAhtqEKI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFCA3BFC2BF
X-Proofpoint-GUID: A4ALhFtEtcAcdqlijkD-0kVXHsiqfxDX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA5MDA2MyBTYWx0ZWRfXz4OgLeDVwmbZ
 QEc2BzLwpXUbW+sJf9O5Jsemd5UhUMVgfensbMQALKqnKynE821SrORauzkvJHqb/FbL1nR6v4y
 Od9i6jrgcCrUk4EvKYX8HHQVbz6JhMX/6GKcwrw/ElLsu4S9oVHFMVBynvoZLrLz5VY9ExUB9rI
 YIFypKl2ydVIjlHd0sQyhUx7Pna7HPfaMIZEkiKCmnzkglLTDZrEBGUnv8U1sMSrHbOfPWjDWqb
 IYGIqsXDPnmmCyzXP+Y4Ft/WxQenUqkvHmx26e03WQN5uFNl+pBTlahtG2A+rSJFLGwFYH6b5/S
 L/6D2UVFVHqwDoqPn1QS+s/+KlVD23l5VRZfKUwmQlP4FBUCAUAtEFNr+px8u+pQn9ig9OX34iI
 hCSITBFbRyg5aMAMOhtMbqpe5Za/dQ==
X-Proofpoint-ORIG-GUID: A4ALhFtEtcAcdqlijkD-0kVXHsiqfxDX
X-Authority-Analysis: v=2.4 cv=EpzfbCcA c=1 sm=1 tr=0 ts=6937e45e cx=c_pps
 a=jAY+Yiv4fe/m5iF0AiXt4Q==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=OcE5tU-iAAAA:8 a=t7CeM3EgAAAA:8
 a=m5NE4flbUWFzBmhxUm4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=qwkNQZnGtIHGNKTLT1RO:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_02,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 adultscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512090063
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 5B96mxqB2003186
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Dec 2025 08:57:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122402

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

fd is a simple, fast and user-friendly alternative to 'find' written in r=
ust.
Add recipe for the latest release (10.3.0)

- Ignores hidden and .gitignore files by default
- Supports regular expressions and highlights matches
- Faster and easier to use than traditional 'find'

More information: https://crates.io/crates/fd-find

Upstream Benchmarks:
Tool & Command                 Time (mean =C2=B1 =CF=83)          Range (=
min =E2=80=A6 max)      Speedup vs find
fd -u '[0-9]\.jpg$' ~        854.8 ms =C2=B1  10.0 ms       839.2 ms =E2=80=
=A6 868.9 ms        ~13x faster
find ~ -iname '*[0-9].jpg'   11.226 s =C2=B1  0.104 s       11.119 s =E2=80=
=A6 11.466 s            =E2=80=94

Bechmarks inside qemu (fd built from this recipe):
Tool & Command	                  Real Time	 User Time	 Sys Time	 Speedup =
vs find
fd (fd /path/to/search)	            2.115 s	  2.660 s	  5.083 s          =
=E2=89=882.1=C3=97 faster
find (find /path/to/search)         4.401 s	  1.607 s	  2.788 s	        =E2=
=80=94

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 .../fd-find/fd-find-crates.inc                | 218 ++++++++++++++++++
 .../fd-find/fd-find_10.3.0.bb                 |  28 +++
 2 files changed, 246 insertions(+)
 create mode 100644 meta-oe/recipes-extended/fd-find/fd-find-crates.inc
 create mode 100644 meta-oe/recipes-extended/fd-find/fd-find_10.3.0.bb

diff --git a/meta-oe/recipes-extended/fd-find/fd-find-crates.inc b/meta-o=
e/recipes-extended/fd-find/fd-find-crates.inc
new file mode 100644
index 0000000000..ae70f2182f
--- /dev/null
+++ b/meta-oe/recipes-extended/fd-find/fd-find-crates.inc
@@ -0,0 +1,218 @@
+# Autogenerated with 'bitbake -c update_crates fd-find'
+
+# from Cargo.lock
+SRC_URI +=3D " \
+    crate://crates.io/aho-corasick/1.1.3 \
+    crate://crates.io/anstream/0.6.19 \
+    crate://crates.io/anstyle/1.0.11 \
+    crate://crates.io/anstyle-parse/0.2.7 \
+    crate://crates.io/anstyle-query/1.1.3 \
+    crate://crates.io/anstyle-wincon/3.0.9 \
+    crate://crates.io/anyhow/1.0.98 \
+    crate://crates.io/argmax/0.4.0 \
+    crate://crates.io/bitflags/1.3.2 \
+    crate://crates.io/bitflags/2.9.1 \
+    crate://crates.io/bstr/1.12.0 \
+    crate://crates.io/cc/1.2.29 \
+    crate://crates.io/cfg-if/1.0.1 \
+    crate://crates.io/cfg_aliases/0.2.1 \
+    crate://crates.io/clap/4.5.42 \
+    crate://crates.io/clap_builder/4.5.42 \
+    crate://crates.io/clap_complete/4.5.55 \
+    crate://crates.io/clap_derive/4.5.41 \
+    crate://crates.io/clap_lex/0.7.5 \
+    crate://crates.io/colorchoice/1.0.4 \
+    crate://crates.io/crossbeam-channel/0.5.15 \
+    crate://crates.io/crossbeam-deque/0.8.6 \
+    crate://crates.io/crossbeam-epoch/0.9.18 \
+    crate://crates.io/crossbeam-utils/0.8.21 \
+    crate://crates.io/ctrlc/3.4.7 \
+    crate://crates.io/diff/0.1.13 \
+    crate://crates.io/errno/0.3.13 \
+    crate://crates.io/etcetera/0.10.0 \
+    crate://crates.io/faccess/0.2.4 \
+    crate://crates.io/fastrand/2.3.0 \
+    crate://crates.io/filetime/0.2.25 \
+    crate://crates.io/getrandom/0.3.3 \
+    crate://crates.io/globset/0.4.16 \
+    crate://crates.io/heck/0.5.0 \
+    crate://crates.io/home/0.5.9 \
+    crate://crates.io/ignore/0.4.23 \
+    crate://crates.io/is_terminal_polyfill/1.70.1 \
+    crate://crates.io/jiff/0.2.15 \
+    crate://crates.io/jiff-static/0.2.15 \
+    crate://crates.io/jiff-tzdb/0.1.4 \
+    crate://crates.io/jiff-tzdb-platform/0.1.3 \
+    crate://crates.io/libc/0.2.174 \
+    crate://crates.io/libredox/0.1.4 \
+    crate://crates.io/linux-raw-sys/0.9.4 \
+    crate://crates.io/log/0.4.27 \
+    crate://crates.io/lscolors/0.20.0 \
+    crate://crates.io/memchr/2.7.5 \
+    crate://crates.io/nix/0.30.1 \
+    crate://crates.io/normpath/1.3.0 \
+    crate://crates.io/nu-ansi-term/0.50.1 \
+    crate://crates.io/once_cell/1.21.3 \
+    crate://crates.io/once_cell_polyfill/1.70.1 \
+    crate://crates.io/portable-atomic/1.11.1 \
+    crate://crates.io/portable-atomic-util/0.2.4 \
+    crate://crates.io/proc-macro2/1.0.95 \
+    crate://crates.io/quote/1.0.40 \
+    crate://crates.io/r-efi/5.3.0 \
+    crate://crates.io/redox_syscall/0.5.13 \
+    crate://crates.io/regex/1.11.1 \
+    crate://crates.io/regex-automata/0.4.9 \
+    crate://crates.io/regex-syntax/0.8.5 \
+    crate://crates.io/rustix/1.0.7 \
+    crate://crates.io/same-file/1.0.6 \
+    crate://crates.io/serde/1.0.219 \
+    crate://crates.io/serde_derive/1.0.219 \
+    crate://crates.io/shlex/1.3.0 \
+    crate://crates.io/strsim/0.11.1 \
+    crate://crates.io/syn/2.0.104 \
+    crate://crates.io/tempfile/3.20.0 \
+    crate://crates.io/terminal_size/0.4.2 \
+    crate://crates.io/test-case/3.3.1 \
+    crate://crates.io/test-case-core/3.3.1 \
+    crate://crates.io/test-case-macros/3.3.1 \
+    crate://crates.io/tikv-jemalloc-sys/0.6.0+5.3.0-1-ge13ca993e8ccb9ba9=
847cc330696e02839f328f7 \
+    crate://crates.io/tikv-jemallocator/0.6.0 \
+    crate://crates.io/unicode-ident/1.0.18 \
+    crate://crates.io/utf8parse/0.2.2 \
+    crate://crates.io/version_check/0.9.5 \
+    crate://crates.io/walkdir/2.5.0 \
+    crate://crates.io/wasi/0.14.2+wasi-0.2.4 \
+    crate://crates.io/winapi/0.3.9 \
+    crate://crates.io/winapi-i686-pc-windows-gnu/0.4.0 \
+    crate://crates.io/winapi-util/0.1.9 \
+    crate://crates.io/winapi-x86_64-pc-windows-gnu/0.4.0 \
+    crate://crates.io/windows-sys/0.52.0 \
+    crate://crates.io/windows-sys/0.59.0 \
+    crate://crates.io/windows-sys/0.60.2 \
+    crate://crates.io/windows-targets/0.52.6 \
+    crate://crates.io/windows-targets/0.53.2 \
+    crate://crates.io/windows_aarch64_gnullvm/0.52.6 \
+    crate://crates.io/windows_aarch64_gnullvm/0.53.0 \
+    crate://crates.io/windows_aarch64_msvc/0.52.6 \
+    crate://crates.io/windows_aarch64_msvc/0.53.0 \
+    crate://crates.io/windows_i686_gnu/0.52.6 \
+    crate://crates.io/windows_i686_gnu/0.53.0 \
+    crate://crates.io/windows_i686_gnullvm/0.52.6 \
+    crate://crates.io/windows_i686_gnullvm/0.53.0 \
+    crate://crates.io/windows_i686_msvc/0.52.6 \
+    crate://crates.io/windows_i686_msvc/0.53.0 \
+    crate://crates.io/windows_x86_64_gnu/0.52.6 \
+    crate://crates.io/windows_x86_64_gnu/0.53.0 \
+    crate://crates.io/windows_x86_64_gnullvm/0.52.6 \
+    crate://crates.io/windows_x86_64_gnullvm/0.53.0 \
+    crate://crates.io/windows_x86_64_msvc/0.52.6 \
+    crate://crates.io/windows_x86_64_msvc/0.53.0 \
+    crate://crates.io/wit-bindgen-rt/0.39.0 \
+"
+
+SRC_URI[aho-corasick-1.1.3.sha256sum] =3D "8e60d3430d3a69478ad0993f19238=
d2df97c507009a52b3c10addcd7f6bcb916"
+SRC_URI[anstream-0.6.19.sha256sum] =3D "301af1932e46185686725e0fad2f8f2a=
a7da69dd70bf6ecc44d6b703844a3933"
+SRC_URI[anstyle-1.0.11.sha256sum] =3D "862ed96ca487e809f1c8e5a8447f6ee2c=
f102f846893800b20cebdf541fc6bbd"
+SRC_URI[anstyle-parse-0.2.7.sha256sum] =3D "4e7644824f0aa2c7b9384579234e=
f10eb7efb6a0deb83f9630a49594dd9c15c2"
+SRC_URI[anstyle-query-1.1.3.sha256sum] =3D "6c8bdeb6047d8983be085bab0ba1=
472e6dc604e7041dbf6fcd5e71523014fae9"
+SRC_URI[anstyle-wincon-3.0.9.sha256sum] =3D "403f75924867bb1033c59fbf079=
7484329750cfbe3c4325cd33127941fabc882"
+SRC_URI[anyhow-1.0.98.sha256sum] =3D "e16d2d3311acee920a9eb8d33b8cbc1787=
ce4a264e85f964c2404b969bdcd487"
+SRC_URI[argmax-0.4.0.sha256sum] =3D "0144c58b55af0133ec3963ce5e4d07aad86=
6e3bbcfdcddbf4590dbd7ad6ff557"
+SRC_URI[bitflags-1.3.2.sha256sum] =3D "bef38d45163c2f1dde094a7dfd33ccf59=
5c92905c8f8f4fdc18d06fb1037718a"
+SRC_URI[bitflags-2.9.1.sha256sum] =3D "1b8e56985ec62d17e9c1001dc89c88ecd=
7dc08e47eba5ec7c29c7b5eeecde967"
+SRC_URI[bstr-1.12.0.sha256sum] =3D "234113d19d0d7d613b40e86fb654acf95891=
0802bcceab913a4f9e7cda03b1a4"
+SRC_URI[cc-1.2.29.sha256sum] =3D "5c1599538de2394445747c8cf7935946e3cc27=
e9625f889d979bfb2aaf569362"
+SRC_URI[cfg-if-1.0.1.sha256sum] =3D "9555578bc9e57714c812a1f84e4fc5b4d21=
fcb063490c624de019f7464c91268"
+SRC_URI[cfg_aliases-0.2.1.sha256sum] =3D "613afe47fcd5fac7ccf1db93babcb0=
82c5994d996f20b8b159f2ad1658eb5724"
+SRC_URI[clap-4.5.42.sha256sum] =3D "ed87a9d530bb41a67537289bafcac159cb3e=
e28460e0a4571123d2a778a6a882"
+SRC_URI[clap_builder-4.5.42.sha256sum] =3D "64f4f3f3c77c94aff3c7e9aac9a2=
ca1974a5adf392a8bb751e827d6d127ab966"
+SRC_URI[clap_complete-4.5.55.sha256sum] =3D "a5abde44486daf70c5be8b8f8f1=
b66c49f86236edf6fa2abadb4d961c4c6229a"
+SRC_URI[clap_derive-4.5.41.sha256sum] =3D "ef4f52386a59ca4c860f7393bcf8a=
bd8dfd91ecccc0f774635ff68e92eeef491"
+SRC_URI[clap_lex-0.7.5.sha256sum] =3D "b94f61472cee1439c0b966b47e3aca9ae=
07e45d070759512cd390ea2bebc6675"
+SRC_URI[colorchoice-1.0.4.sha256sum] =3D "b05b61dc5112cbb17e4b6cd61790d9=
845d13888356391624cbe7e41efeac1e75"
+SRC_URI[crossbeam-channel-0.5.15.sha256sum] =3D "82b8f8f868b36967f960679=
0d1903570de9ceaf870a7bf9fbbd3016d636a2cb2"
+SRC_URI[crossbeam-deque-0.8.6.sha256sum] =3D "9dd111b7b7f7d55b72c0a6ae36=
1660ee5853c9af73f70c3c2ef6858b950e2e51"
+SRC_URI[crossbeam-epoch-0.9.18.sha256sum] =3D "5b82ac4a3c2ca9c3460964f02=
0e1402edd5753411d7737aa39c3714ad1b5420e"
+SRC_URI[crossbeam-utils-0.8.21.sha256sum] =3D "d0a5c400df2834b80a4c3327b=
3aad3a4c4cd4de0629063962b03235697506a28"
+SRC_URI[ctrlc-3.4.7.sha256sum] =3D "46f93780a459b7d656ef7f071fe699c4d3d2=
cb201c4b24d085b6ddc505276e73"
+SRC_URI[diff-0.1.13.sha256sum] =3D "56254986775e3233ffa9c4d7d3faaf6d36a2=
c09d30b20687e9f88bc8bafc16c8"
+SRC_URI[errno-0.3.13.sha256sum] =3D "778e2ac28f6c47af28e4907f13ffd1e1ddb=
d400980a9abd7c8df189bf578a5ad"
+SRC_URI[etcetera-0.10.0.sha256sum] =3D "26c7b13d0780cb82722fd59f6f57f925=
e143427e4a75313a6c77243bf5326ae6"
+SRC_URI[faccess-0.2.4.sha256sum] =3D "59ae66425802d6a903e268ae1a08b8c38b=
a143520f227a205edf4e9c7e3e26d5"
+SRC_URI[fastrand-2.3.0.sha256sum] =3D "37909eebbb50d72f9059c3b6d82c0463f=
2ff062c9e95845c43a6c9c0355411be"
+SRC_URI[filetime-0.2.25.sha256sum] =3D "35c0522e981e68cbfa8c3f978441a5f3=
4b30b96e146b33cd3359176b50fe8586"
+SRC_URI[getrandom-0.3.3.sha256sum] =3D "26145e563e54f2cadc477553f1ec5ee6=
50b00862f0a58bcd12cbdc5f0ea2d2f4"
+SRC_URI[globset-0.4.16.sha256sum] =3D "54a1028dfc5f5df5da8a56a73e6c153c9=
a9708ec57232470703592a3f18e49f5"
+SRC_URI[heck-0.5.0.sha256sum] =3D "2304e00983f87ffb38b55b444b5e3b60a884b=
5d30c0fca7d82fe33449bbe55ea"
+SRC_URI[home-0.5.9.sha256sum] =3D "e3d1354bf6b7235cb4a0576c2619fd4ed1818=
3f689b12b006a0ee7329eeff9a5"
+SRC_URI[ignore-0.4.23.sha256sum] =3D "6d89fd380afde86567dfba715db0656739=
89d6253f42b88179abd3eae47bda4b"
+SRC_URI[is_terminal_polyfill-1.70.1.sha256sum] =3D "7943c866cc5cd64cbc25=
b2e01621d07fa8eb2a1a23160ee81ce38704e97b8ecf"
+SRC_URI[jiff-0.2.15.sha256sum] =3D "be1f93b8b1eb69c77f24bbb0afdf66f54b63=
2ee39af40ca21c4365a1d7347e49"
+SRC_URI[jiff-static-0.2.15.sha256sum] =3D "03343451ff899767262ec32146f6d=
559dd759fdadf42ff0e227c7c48f72594b4"
+SRC_URI[jiff-tzdb-0.1.4.sha256sum] =3D "c1283705eb0a21404d2bfd6eef2a7593=
d240bc42a0bdb39db0ad6fa2ec026524"
+SRC_URI[jiff-tzdb-platform-0.1.3.sha256sum] =3D "875a5a69ac2bab1a891711c=
f5eccbec1ce0341ea805560dcd90b7a2e925132e8"
+SRC_URI[libc-0.2.174.sha256sum] =3D "1171693293099992e19cddea4e8b849964e=
9846f4acee11b3948bcc337be8776"
+SRC_URI[libredox-0.1.4.sha256sum] =3D "1580801010e535496706ba011c15f8532=
df6b42297d2e471fec38ceadd8c0638"
+SRC_URI[linux-raw-sys-0.9.4.sha256sum] =3D "cd945864f07fe9f5371a27ad7b52=
a172b4b499999f1d97574c9fa68373937e12"
+SRC_URI[log-0.4.27.sha256sum] =3D "13dc2df351e3202783a1fe0d44375f7295ffb=
4049267b0f3018346dc122a1d94"
+SRC_URI[lscolors-0.20.0.sha256sum] =3D "61183da5de8ba09a58e330d55e5ea796=
539d8443bd00fdeb863eac39724aa4ab"
+SRC_URI[memchr-2.7.5.sha256sum] =3D "32a282da65faaf38286cf3be983213fcf1d=
2e2a58700e808f83f4ea9a4804bc0"
+SRC_URI[nix-0.30.1.sha256sum] =3D "74523f3a35e05aba87a1d978330aef40f67b0=
304ac79c1c00b294c9830543db6"
+SRC_URI[normpath-1.3.0.sha256sum] =3D "c8911957c4b1549ac0dc74e30db9c8b0e=
66ddcd6d7acc33098f4c63a64a6d7ed"
+SRC_URI[nu-ansi-term-0.50.1.sha256sum] =3D "d4a28e057d01f97e61255210fcff=
094d74ed0466038633e95017f5beb68e4399"
+SRC_URI[once_cell-1.21.3.sha256sum] =3D "42f5e15c9953c5e4ccceeb2e7382a71=
6482c34515315f7b03532b8b4e8393d2d"
+SRC_URI[once_cell_polyfill-1.70.1.sha256sum] =3D "a4895175b425cb1f87721b=
59f0f286c2092bd4af812243672510e1ac53e2e0ad"
+SRC_URI[portable-atomic-1.11.1.sha256sum] =3D "f84267b20a16ea918e43c6a88=
433c2d54fa145c92a811b5b047ccbe153674483"
+SRC_URI[portable-atomic-util-0.2.4.sha256sum] =3D "d8a2f0d8d040d7848a709=
caf78912debcc3f33ee4b3cac47d73d1e1069e83507"
+SRC_URI[proc-macro2-1.0.95.sha256sum] =3D "02b3e5e68a3a1a02aad3ec490a980=
07cbc13c37cbe84a3cd7b8e406d76e7f778"
+SRC_URI[quote-1.0.40.sha256sum] =3D "1885c039570dc00dcb4ff087a89e185fd56=
bae234ddc7f056a945bf36467248d"
+SRC_URI[r-efi-5.3.0.sha256sum] =3D "69cdb34c158ceb288df11e18b4bd39de994f=
6657d83847bdffdbd7f346754b0f"
+SRC_URI[redox_syscall-0.5.13.sha256sum] =3D "0d04b7d0ee6b4a0207a0a7adb10=
4d23ecb0b47d6beae7152d0fa34b692b29fd6"
+SRC_URI[regex-1.11.1.sha256sum] =3D "b544ef1b4eac5dc2db33ea63606ae9ffcfa=
c26c1416a2806ae0bf5f56b201191"
+SRC_URI[regex-automata-0.4.9.sha256sum] =3D "809e8dc61f6de73b46c85f4c964=
86310fe304c434cfa43669d7b40f711150908"
+SRC_URI[regex-syntax-0.8.5.sha256sum] =3D "2b15c43186be67a4fd63bee50d030=
3afffcef381492ebe2c5d87f324e1b8815c"
+SRC_URI[rustix-1.0.7.sha256sum] =3D "c71e83d6afe7ff64890ec6b71d6a69bb8a6=
10ab78ce364b3352876bb4c801266"
+SRC_URI[same-file-1.0.6.sha256sum] =3D "93fc1dc3aaa9bfed95e02e6eadabb4ba=
f7e3078b0bd1b4d7b6b0b68378900502"
+SRC_URI[serde-1.0.219.sha256sum] =3D "5f0e2c6ed6606019b4e29e69dbaba95b11=
854410e5347d525002456dbbb786b6"
+SRC_URI[serde_derive-1.0.219.sha256sum] =3D "5b0276cf7f2c73365f7157c8123=
c21cd9a50fbbd844757af28ca1f5925fc2a00"
+SRC_URI[shlex-1.3.0.sha256sum] =3D "0fda2ff0d084019ba4d7c6f371c95d8fd75c=
e3524c3cb8fb653a3023f6323e64"
+SRC_URI[strsim-0.11.1.sha256sum] =3D "7da8b5736845d9f2fcb837ea5d9e262856=
4b3b043a70948a3f0b778838c5fb4f"
+SRC_URI[syn-2.0.104.sha256sum] =3D "17b6f705963418cdb9927482fa304bc562ec=
e2fdd4f616084c50b7023b435a40"
+SRC_URI[tempfile-3.20.0.sha256sum] =3D "e8a64e3985349f2441a1a9ef0b853f86=
9006c3855f2cda6862a94d26ebb9d6a1"
+SRC_URI[terminal_size-0.4.2.sha256sum] =3D "45c6481c4829e4cc63825e62c491=
86a34538b7b2750b73b266581ffb612fb5ed"
+SRC_URI[test-case-3.3.1.sha256sum] =3D "eb2550dd13afcd286853192af8601920=
d959b14c401fcece38071d53bf0768a8"
+SRC_URI[test-case-core-3.3.1.sha256sum] =3D "adcb7fd841cd518e279be3d5a3e=
b0636409487998a4aff22f3de87b81e88384f"
+SRC_URI[test-case-macros-3.3.1.sha256sum] =3D "5c89e72a01ed4c579669add59=
014b9a524d609c0c88c6a585ce37485879f6ffb"
+SRC_URI[tikv-jemalloc-sys-0.6.0+5.3.0-1-ge13ca993e8ccb9ba9847cc330696e02=
839f328f7.sha256sum] =3D "cd3c60906412afa9c2b5b5a48ca6a5abe5736aec9eb48ad=
05037a677e52e4e2d"
+SRC_URI[tikv-jemallocator-0.6.0.sha256sum] =3D "4cec5ff18518d81584f477e9=
bfdf957f5bb0979b0bac3af4ca30b5b3ae2d2865"
+SRC_URI[unicode-ident-1.0.18.sha256sum] =3D "5a5f39404a5da50712a4c1eecf2=
5e90dd62b613502b7e925fd4e4d19b5c96512"
+SRC_URI[utf8parse-0.2.2.sha256sum] =3D "06abde3611657adf66d383f00b093d7f=
aecc7fa57071cce2578660c9f1010821"
+SRC_URI[version_check-0.9.5.sha256sum] =3D "0b928f33d975fc6ad9f86c8f2838=
53ad26bdd5b10b7f1542aa2fa15e2289105a"
+SRC_URI[walkdir-2.5.0.sha256sum] =3D "29790946404f91d9c5d06f9874efddea1d=
c06c5efe94541a7d6863108e3a5e4b"
+SRC_URI[wasi-0.14.2+wasi-0.2.4.sha256sum] =3D "9683f9a5a998d873c0d21fcbe=
3c083009670149a8fab228644b8bd36b2c48cb3"
+SRC_URI[winapi-0.3.9.sha256sum] =3D "5c839a674fcd7a98952e593242ea400abe9=
3992746761e38641405d28b00f419"
+SRC_URI[winapi-i686-pc-windows-gnu-0.4.0.sha256sum] =3D "ac3b87c63620426=
dd9b991e5ce0329eff545bccbbb34f3be09ff6fb6ab51b7b6"
+SRC_URI[winapi-util-0.1.9.sha256sum] =3D "cf221c93e13a30d793f7645a0e7762=
c55d169dbb0a49671918a2319d289b10bb"
+SRC_URI[winapi-x86_64-pc-windows-gnu-0.4.0.sha256sum] =3D "712e227841d05=
7c1ee1cd2fb22fa7e5a5461ae8e48fa2ca79ec42cfc1931183f"
+SRC_URI[windows-sys-0.52.0.sha256sum] =3D "282be5f36a8ce781fad8c8ae18fa3=
f9beff57ec1b52cb3de0789201425d9a33d"
+SRC_URI[windows-sys-0.59.0.sha256sum] =3D "1e38bc4d79ed67fd075bcc251a1c3=
9b32a1776bbe92e5bef1f0bf1f8c531853b"
+SRC_URI[windows-sys-0.60.2.sha256sum] =3D "f2f500e4d28234f72040990ec9d39=
e3a6b950f9f22d3dba18416c35882612bcb"
+SRC_URI[windows-targets-0.52.6.sha256sum] =3D "9b724f72796e036ab90c1021d=
4780d4d3d648aca59e491e6b98e725b84e99973"
+SRC_URI[windows-targets-0.53.2.sha256sum] =3D "c66f69fcc9ce11da9966ddb31=
a40968cad001c5bedeb5c2b82ede4253ab48aef"
+SRC_URI[windows_aarch64_gnullvm-0.52.6.sha256sum] =3D "32a4622180e7a0ec0=
44bb555404c800bc9fd9ec262ec147edd5989ccd0c02cd3"
+SRC_URI[windows_aarch64_gnullvm-0.53.0.sha256sum] =3D "86b8d5f90ddd19cb4=
a147a5fa63ca848db3df085e25fee3cc10b39b6eebae764"
+SRC_URI[windows_aarch64_msvc-0.52.6.sha256sum] =3D "09ec2a7bb152e2252b53=
fa7803150007879548bc709c039df7627cabbd05d469"
+SRC_URI[windows_aarch64_msvc-0.53.0.sha256sum] =3D "c7651a1f62a11b8cbd5e=
0d42526e55f2c99886c77e007179efff86c2b137e66c"
+SRC_URI[windows_i686_gnu-0.52.6.sha256sum] =3D "8e9b5ad5ab802e97eb8e295a=
c6720e509ee4c243f69d781394014ebfe8bbfa0b"
+SRC_URI[windows_i686_gnu-0.53.0.sha256sum] =3D "c1dc67659d35f387f5f6c479=
dc4e28f1d4bb90ddd1a5d3da2e5d97b42d6272c3"
+SRC_URI[windows_i686_gnullvm-0.52.6.sha256sum] =3D "0eee52d38c090b3caa76=
c563b86c3a4bd71ef1a819287c19d586d7334ae8ed66"
+SRC_URI[windows_i686_gnullvm-0.53.0.sha256sum] =3D "9ce6ccbdedbf6d635447=
1319e781c0dfef054c81fbc7cf83f338a4296c0cae11"
+SRC_URI[windows_i686_msvc-0.52.6.sha256sum] =3D "240948bc05c5e7c6dabba28=
bf89d89ffce3e303022809e73deaefe4f6ec56c66"
+SRC_URI[windows_i686_msvc-0.53.0.sha256sum] =3D "581fee95406bb13382d2f65=
cd4a908ca7b1e4c2f1917f143ba16efe98a589b5d"
+SRC_URI[windows_x86_64_gnu-0.52.6.sha256sum] =3D "147a5c80aabfbf0c7d901c=
b5895d1de30ef2907eb21fbbab29ca94c5b08b1a78"
+SRC_URI[windows_x86_64_gnu-0.53.0.sha256sum] =3D "2e55b5ac9ea33f2fc1716d=
1742db15574fd6fc8dadc51caab1c16a3d3b4190ba"
+SRC_URI[windows_x86_64_gnullvm-0.52.6.sha256sum] =3D "24d5b23dc417412679=
681396f2b49f3de8c1473deb516bd34410872eff51ed0d"
+SRC_URI[windows_x86_64_gnullvm-0.53.0.sha256sum] =3D "0a6e035dd0599267ce=
1ee132e51c27dd29437f63325753051e71dd9e42406c57"
+SRC_URI[windows_x86_64_msvc-0.52.6.sha256sum] =3D "589f6da84c646204747d1=
270a2a5661ea66ed1cced2631d546fdfb155959f9ec"
+SRC_URI[windows_x86_64_msvc-0.53.0.sha256sum] =3D "271414315aff87387382e=
c3d271b52d7ae78726f5d44ac98b4f4030c91880486"
+SRC_URI[wit-bindgen-rt-0.39.0.sha256sum] =3D "6f42320e61fe2cfd34354ecb59=
7f86f413484a798ba44a8ca1165c58d42da6c1"
diff --git a/meta-oe/recipes-extended/fd-find/fd-find_10.3.0.bb b/meta-oe=
/recipes-extended/fd-find/fd-find_10.3.0.bb
new file mode 100644
index 0000000000..3df88c88b0
--- /dev/null
+++ b/meta-oe/recipes-extended/fd-find/fd-find_10.3.0.bb
@@ -0,0 +1,28 @@
+SUMMARY =3D "fd is a simple, fast and user-friendly alternative to find.=
"
+HOMEPAGE =3D "https://crates.io/crates/fd-find"
+DESCRIPTION =3D "fd is a program to find entries in your filesystem. It =
\
+               is a simple, fast and user-friendly alternative to find. =
\
+               While it does not aim to support all of find's powerful \
+               functionality, it provides sensible (opinionated) default=
s \
+               for a majority of use cases."
+
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D " \
+    file://LICENSE-MIT;md5=3D96713c739748a44f86272791c89ce344 \
+"
+
+SRC_URI =3D "crate://crates.io/fd-find/${PV};name=3Dfd-find"
+SRC_URI[fd-find.sha256sum] =3D "2fbf004b5bbdefab92e76237e2022c77842cdef5=
d3213fe09fd804e0474785db"
+S =3D "${CARGO_VENDORING_DIRECTORY}/fd-find-${PV}"
+
+inherit cargo cargo-update-recipe-crates
+
+#Upstream fd-find sets strip =3D true in [profile.release], which causes=
 Cargo=20
+#to strip the binary during compilation. This interferes with Yocto=E2=80=
=99s normal=20
+#do_package stripping process.By adding the following flag, we ensure th=
at=20
+#stripping is handled by Yocto as usual:
+CARGO_BUILD_FLAGS +=3D " --config profile.release.strip=3Dfalse"
+
+require ${BPN}-crates.inc
+
+BBCLASSEXTEND =3D "native"
--=20
2.49.0


