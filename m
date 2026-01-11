Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CB44D2502F
	for <webhook@archiver.kernel.org>; Sun, 11 Jan 2026 13:40:16 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10336.1768138814597342419
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 11 Jan 2026 05:40:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=OMv/kWK7;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=5471b597aa=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60BDXH2Q3444928
	for <openembedded-devel@lists.openembedded.org>; Sun, 11 Jan 2026 05:40:14 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=lA8u2f7uK62W6E1H5TAc
	PL97ZfPGRKxJkD0cyyob+2Y=; b=OMv/kWK784SQXbyQ1naBtUakQPYdqSUjf010
	5vJGSnDWh3o2r0bnzPINIOcCce5qEdUYjHEHCf/8ocY7KnwGdFvbOAwHM54TnIaD
	THapE6H1aG6vDSThyQj9R5EE2HY2JgQAnFCky9h5d7DMbpjNI28dMrAJW+DM9NLF
	52ee9MvlzpmgjHtaGLIxWLF9Y1A6Wmx31mnw4na3p1L1xM27n+T3PUWltdWOpRgo
	d6GQCdzZVxx4dvc7TycJWrlICCK32olyefIFryYZe8egSUWi+h9/oXj/lowLs0lH
	z4hLkHUMeLKYuTPv2+qZwookrnqaKNsh23h+RSj0wxGtsUUpMw==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012046.outbound.protection.outlook.com [52.101.43.46])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4bkjx0rsk6-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sun, 11 Jan 2026 05:40:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UDnJ0urhA6lYkUDYFj11ypd+7dcEiDF3UKjNDpFJRz/pHJY48j/uq9sCqZLFfa/f70AThGXkkxRSnqXCh+QJ8Z+a5xyKkHsKql4Ia0O00A7e+v55mlta+PBUVV6xD/VPG5YECx4lac8PuE7qCof9UAi6NS0uzkG59YB60KMSgcqHoHg5YN1si4OmLvJEBCwxB9a3byuhJJq1lF9ecgpdq4i8e7L0NWzFdHLVzg69ws+7OaY/k7kET8EO679cDSyZVtCA4JC+0rX0loDLsEoZLPMDWjHso5o3qzvJSZVNzblpeBOHXqLE+6+r8p/0umMgCKxtdh4V64XHcCgLpvrykA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lA8u2f7uK62W6E1H5TAcPL97ZfPGRKxJkD0cyyob+2Y=;
 b=Xm59U0I9QhmRJ8FG4rSavTXs2HqK+FdY6k6Ymb/9+BorLUBkt7dgz5/9GmE8xNeQWhJx+6MlUzK04NzEtG0aOtkNVlFTv78MKOF2qFFNKUrhHidLYFQOQipmb7HvNqOiD6OEW7nUukNhjdA8D+z6ZzyKrLJ9ToZlAxPipqlf8rifBlgEEcIJJshMyIpfGm32khQgxuolyebSVsWwzUfP0Nds1mpgd7hz+dQO1mlsKGIAnYgkE0H/WA0kDcoDiJZk17zhT3AkeEBh9lnWB1zUhaLJoljTdhVPuZBjXNTLsGAJW4K11Y4CnhoGmpmBEZB9QLpRJMlHOlgLLoN5cvej9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 DS0PR11MB6496.namprd11.prod.outlook.com (2603:10b6:8:c0::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.7; Sun, 11 Jan 2026 13:40:11 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::3432:2eb3:d0a5:7831]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::3432:2eb3:d0a5:7831%6]) with mapi id 15.20.9499.005; Sun, 11 Jan 2026
 13:40:11 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH V2] nng: add ptest
Date: Sun, 11 Jan 2026 21:39:56 +0800
Message-Id: <20260111133956.318151-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR06CA0009.apcprd06.prod.outlook.com
 (2603:1096:4:186::17) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|DS0PR11MB6496:EE_
X-MS-Office365-Filtering-Correlation-Id: 4fa02743-6def-44cd-d88a-08de5116f120
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Vrdv7wG2PLKwr+YP/U65ATsyPS1Z7XKhD8Av+Wf2DIGIzOzHyvKJNyGvfVR3?=
 =?us-ascii?Q?4J/80zmiXWPwwuCJTn8QvW14a0hPi13RYy8katRu2guISInDHZ9qLmkLh6Xy?=
 =?us-ascii?Q?ZQ5TjypY8JCVg7ee112pd9fmY0urPRc9/cJYA/PE9RPfjXgx83Sh8i19hFAh?=
 =?us-ascii?Q?fa6Pafyb66+98e3gVRd+1K/0S+NpjlFPmKPcjJc1drcXHNoQeanCJzmjoHDl?=
 =?us-ascii?Q?JLjB1obwVmuqbbcDW00ze3LlB7NIsB/TL2iAI1RfuHG2KQdnx0EgL30q7WnD?=
 =?us-ascii?Q?HpXL77FOvbuAJ2LwNwvzE/wYnVdtu5S3OdgDBsQtBFxmqXMaLau5LVeGhmPd?=
 =?us-ascii?Q?cHDjeWW+qXK2ltnbtNTJAuTPiWbu26sQaFxFJnHpFem1SoWR5tGkBLblt9hT?=
 =?us-ascii?Q?hDqLnkXnqS7vD9CTjFWZymAp9mZELjs7edcFehDkEn+/LvMeaUBYBCt9w0Yq?=
 =?us-ascii?Q?bNhyRgeVyIzaKjAJT/oJk5TcW//4Rdg+Np84lW8OWJ/z624SXCZ/3kAhmZ++?=
 =?us-ascii?Q?cBJnb3U4ozhNr72zVhtknsmkvAbCM2UdTWKHhkekc4IaHFwFKIgtvUNy746s?=
 =?us-ascii?Q?FF5clBxPLyj5CVNVFwovZdlFPEn2dQi4CLqaGe8XgDUEFppfmNZWkqId3dmi?=
 =?us-ascii?Q?9sNJMcWcwlGxj0b42cg0wSdZcb2uZ7+MJ9IH64TAprLTdmWyGfew28/F661t?=
 =?us-ascii?Q?bYw2havGUQeNyBB48UoU6yakmfyC1EGebN91cDHznlDIcfyMVbWr/HIajYMO?=
 =?us-ascii?Q?b/gcEXZ4k57pzTnLhr4JTHLkB9U3KOIjkwK9kbCSI9QsHcamxI+JpTbS2T1l?=
 =?us-ascii?Q?Mgp2XpwV9QfneZstUFpRnVFkaJ1GSx3gH+zKnHJaBXPoDcj+rQegZzbTWITp?=
 =?us-ascii?Q?TootSdegDDSMrLyIgZBQH5Wm0FeMC3qfrFGukBHp/wcSlP6gAsaRp7rvkVkW?=
 =?us-ascii?Q?VfUV6JmxmYltRSkngiw/2xh6xS7s7Dy2GI0taJAviuERlMGLsWmjmtWe9J4f?=
 =?us-ascii?Q?Zd4KwFCYJkBT/fHvHRO9HLiDiz/YWteYjzNmL4IZAPDuk4Mv9Cy99wV99UUt?=
 =?us-ascii?Q?mFxt10xZyaYFyupQykW2s/KNjSzbD3z5pspVGIyINhIYOIcd42xCGvMwL+tV?=
 =?us-ascii?Q?94RcIeIY+CWlqTDQ8Ej08Ne9JxtNRTAvO5hK4O5jo8nwgnTY987CEJcjkjOH?=
 =?us-ascii?Q?sb1G4IS8/Vdf0yChE2pdNATGC0DwCLLh1S2TW8UievANRCL/IjXKaixbZY3A?=
 =?us-ascii?Q?detVzcblSSR5dzixeaXE6b4J2e5ezH3Rh973pCvw9YYQI3w0UV4hAis0Yypx?=
 =?us-ascii?Q?rk1FSSwbM0qkRvUjl92F0bfqcRxLOCltkeQxTbdhjdwbN7V0mf2B52LFGvcP?=
 =?us-ascii?Q?Nsa0bM38yDxiOYL3SvZid2ObAl7LiFXQ/OJyhUh0CxFn8STKT0Nm52CA3amG?=
 =?us-ascii?Q?S1FNZIr/NUJ59NRG4CLGgqOoGhUpCnvG?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?wpTAVEifVK915oMunTofuAJ8voCJ4pPh0evHYn8BqN5jH9d1dAQvwYahszwl?=
 =?us-ascii?Q?UwelgcV9Ilt3zS6FoPOu6BX6YpY+01TJr8KHyD3cvfUpEWti4Ow6q6IHt0/a?=
 =?us-ascii?Q?v91tzHB4weabWRozhVZZ59Lqr243lmOZtY6e+ljJT+7hDIR6+IiD70WZ7A1m?=
 =?us-ascii?Q?6rRxevw07IOG1EHBOCvoDWexNJFchjh/0DF6/Nnjvyg3ZR0ut49zZW/XgvsY?=
 =?us-ascii?Q?M+3UQ4kCBCyNjeMvmo7PM5RWrtAoStUS3ekKdhYpXAUQcT/a/pYXRJ+k+jzf?=
 =?us-ascii?Q?V4iwugZ/dlkQo+XryqTCsPcyqHDh4wuOSVuZYtshvNTRU/R1wdbo+VG7JHsT?=
 =?us-ascii?Q?MKp7QpsccZxkVQc7sdqVZYilMG/oPX64FwUxEnPeP1RWE/8MsyK4fuCRYm6C?=
 =?us-ascii?Q?JVWdqt24MV3cY3npRTlR6JWPXDvZcmlFQzfuPzteVCjAdds0t7zC4wc3En1H?=
 =?us-ascii?Q?igFh/mIIFCLgkM0c+fJoyNiNjQYJ6dQ6P498hNYO7KE63gUKVuQO9BwyNoTk?=
 =?us-ascii?Q?UH2+RUrRkJsI78HUft/8q1W313AbXQEZudUi4T9Ssq+FuVExaBDSu9D9pMBy?=
 =?us-ascii?Q?5y/feyNQQead3H0QXNHWrg5dxYPLcO9SzM4hABmd2Uhoqj0db6r1l5Qew2Mf?=
 =?us-ascii?Q?6wRxVjR18oaRAeA3oR0FsS3sVWShSYDeYq30/dRAVTm17jIRQ56ff/lDZX+Z?=
 =?us-ascii?Q?NetZyRWnQqNZFcBeE1swllY2iJCDPR/lMLa8xy9WyrgizF5Ze0gpiRPMasAe?=
 =?us-ascii?Q?6luN9ztGIAztfpnzQuhVVd3FpZJ1SGjzvgDvkSU+ZBq6MlfOLbRkKO5+jJs3?=
 =?us-ascii?Q?+b1eWoGx7DnjS3TMwTTXfffAONGrporp9Oi16shAic9idKYPhnYLY4RBZ6Or?=
 =?us-ascii?Q?I+MSLBHgdYpneqYEWdW6Q7JfHfhdrQ3vKqm+anabOpI7SQ2j+4+MXuyvg8dH?=
 =?us-ascii?Q?zX7BAxzzkhttPtEk2wML0qceDjqbmzpu4d4UNIN24WSrzwHJzCnpkyX9BhsW?=
 =?us-ascii?Q?ZpncLYCydo5GNBeZUNtrhKtpgtiG0LR9gUZEx4ff33JpZh8QocEThWPny4AZ?=
 =?us-ascii?Q?exVk6yJxSg7I0KSc0PAFtfM8HOi0zZweVMjK8hRbEynaIgisiB2/XAfHziJv?=
 =?us-ascii?Q?nJu+/pMZKSSiyS9mT8O2I7aO4a4dz0fWors4E0HlWM59wHIiNdOym7T+CnT3?=
 =?us-ascii?Q?0CdqVLKv+2KlBGqe0arnKT8f2Mi6FFcqaJ83Jizi7MWX83SCGQhFWnajzmGo?=
 =?us-ascii?Q?9BNcULOcuSjBGwJysUHPQZfL4VW58lQQKkHk9eFcPs5fUEfgiOlsf/Od9jKa?=
 =?us-ascii?Q?tFTKgwxw/cypaCndZLhxzO3rNZ7wuEmho9/GaUcJMwFP3vQtJDFPLP4YB02M?=
 =?us-ascii?Q?kCWPKnt808zFyk03vnnYU94v3hqyS+TQxLb42+iY/Z2lVLvwU9cnlZTIlyXB?=
 =?us-ascii?Q?k4WpD0HEX20Zv4jwfTsz9lOp1aEqEmZ807P48vtsndXzyLqN/ukLZ3p5c+ip?=
 =?us-ascii?Q?q5M4X+XW+J6A1MdQdqWbkJ0dEO9LPP35hOfXqUv49j9YpoZqEK9icpdFrarD?=
 =?us-ascii?Q?AMlYDPZdYV9NTXJFhF1LEXCHe+jfP7jhAjiORps0Ryu0NHLxVewnA8rgWjow?=
 =?us-ascii?Q?1hovUe4e6GoI8CGskmnjFHEQGWdut8xD1h8lNjzRdNL48J1TbZeNd+BG3TWE?=
 =?us-ascii?Q?EBKyDj9xEI/Ri2ZPSAG/FfjTlwM7OyCQvB6wb72HSl4YgBUdU12kPnQYID+d?=
 =?us-ascii?Q?ik+JsMiWxw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fa02743-6def-44cd-d88a-08de5116f120
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2026 13:40:11.1281
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0ANnd43CZ/sBZyU4hjRyPuMqfjJlkMwhN+Bx0AhpA+FaBYF8eSXQGAq43eCfAGK5vrPJ3kBnDmFHVg5RNYolWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6496
X-Proofpoint-GUID: Nmt_j70p1wbjwYqDVvDOnZrDZjb3rAGO
X-Authority-Analysis: v=2.4 cv=e5ULiKp/ c=1 sm=1 tr=0 ts=6963a83e cx=c_pps
 a=2EcEh/UKxA6NVIT+L3iE4w==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=A1X0JdhQAAAA:8 a=t7CeM3EgAAAA:8 a=NEAV23lmAAAA:8 a=NuJRl8EbLo7vl1mHP9UA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTExMDEyNiBTYWx0ZWRfX7eXErKuonoOo
 CvrtnNCA/4YrTYqux6HW3FB4O9eQh2fjzKsoIGo8D1yOWUxJoNZkD5RbiggVs5L/UpoMm6dv+9A
 ELtd67l2Vwi82IUHBkZGfseZwOklzAZO4YFL1iNV4pxnTsmw6HjJfKehwgtfu0onb2CtV9e5mZE
 J6XIImwB821D95FmzkSL2+57JnC6BENdebIc01EcamDb8s7/s+5ucDYouvuoxxs6mGNMv0uBvOO
 09e2BfnM0JhAO/UxWyogcQ3jA0SPochg+GQAfRO4j/f0SBF8Hdy5dOougxl63pJi0pGufo/8LUl
 fl7gXAlReZ0yViDnb2lLPydnsSPFGI2JxDX3+AQ+MJotaYpDMlDIwJAO74j/Nkw6t9OHgQwjrQ8
 9gR/b2VIy6+JXGibbsl1XMzyE0SWnteb+2kty4/jHbHanetBUdVQYLh0kKlTFhwq5kefRR1Hrlf
 fl0gD4ulA+12Q3s4eAg==
X-Proofpoint-ORIG-GUID: Nmt_j70p1wbjwYqDVvDOnZrDZjb3rAGO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-11_05,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 clxscore=1015 bulkscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601110126
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 11 Jan 2026 13:40:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123347

Ptest results on genericx86-64 BSP:

$ run-ptest
PASS: compat_block
PASS: compat_bug777
PASS: compat_bus
PASS: compat_cmsg
PASS: compat_device
PASS: compat_iovec
PASS: compat_msg
PASS: compat_options
PASS: compat_pair
PASS: compat_pipeline
PASS: compat_poll
PASS: compat_reqrep
PASS: compat_reqttl
PASS: compat_shutdown
PASS: compat_survey
PASS: compat_surveyttl
PASS: cplusplus_pair
PASS: device
PASS: files
FAIL: httpclient
PASS: httpserver
PASS: inproc
PASS: ipc
PASS: ipcsupp
PASS: multistress
PASS: nonblock
PASS: options
PASS: pipe
PASS: pollfd
PASS: reqctx
PASS: reqstress
PASS: scalability
PASS: synch
PASS: tcp
PASS: tcp6
PASS: tcpsupp
PASS: tls
PASS: ws
PASS: wss

The httpclient case attempts to retrieve the Content-Length field from
HTTP header of http://example.com/, but because the site uses chunked
transfer encoding, the Content-Length field is not present, leading to
an assertion failure.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../recipes-connectivity/nanomsg/nng/run-ptest   | 16 ++++++++++++++++
 .../recipes-connectivity/nanomsg/nng_1.11.bb     | 16 +++++++++++++---
 2 files changed, 29 insertions(+), 3 deletions(-)
 create mode 100644 meta-networking/recipes-connectivity/nanomsg/nng/run-ptest

diff --git a/meta-networking/recipes-connectivity/nanomsg/nng/run-ptest b/meta-networking/recipes-connectivity/nanomsg/nng/run-ptest
new file mode 100644
index 0000000000..57888a77c9
--- /dev/null
+++ b/meta-networking/recipes-connectivity/nanomsg/nng/run-ptest
@@ -0,0 +1,16 @@
+#!/bin/sh
+
+RET=0
+cd tests
+
+for t in $(ls *); do
+    ./$t > /dev/null
+    if [ $? -eq 0 ]; then
+        echo PASS: $t
+    else
+        echo FAIL: $t
+        RET=1
+    fi
+done
+
+exit $RET
diff --git a/meta-networking/recipes-connectivity/nanomsg/nng_1.11.bb b/meta-networking/recipes-connectivity/nanomsg/nng_1.11.bb
index e59b7f34e2..031827a5c0 100644
--- a/meta-networking/recipes-connectivity/nanomsg/nng_1.11.bb
+++ b/meta-networking/recipes-connectivity/nanomsg/nng_1.11.bb
@@ -5,16 +5,26 @@ SECTION = "libs/networking"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=a41e579bb4326c21c774f8e51e41d8a3"
 
-SRC_URI = "git://github.com/nanomsg/nng.git;branch=stable;protocol=https"
+SRC_URI = "git://github.com/nanomsg/nng.git;branch=stable;protocol=https \
+           file://run-ptest \
+          "
+
 SRCREV = "84aa701f42968bf536141a24e826da66963b571a"
 
-inherit cmake pkgconfig
+inherit cmake pkgconfig ptest
 
-EXTRA_OECMAKE = "-DBUILD_SHARED_LIBS=ON -DNNG_ENABLE_NNGCAT=ON"
+EXTRA_OECMAKE = "-DBUILD_SHARED_LIBS=ON -DNNG_ENABLE_NNGCAT=ON \
+                 ${@bb.utils.contains('PTEST_ENABLED', '1', '-DNNG_TESTS=ON', '', d)} \
+                "
 
 PACKAGECONFIG ??= ""
 
 PACKAGECONFIG[mbedtls] = "-DNNG_ENABLE_TLS=ON,-DNNG_ENABLE_TLS=OFF,mbedtls"
 
+do_install_ptest(){
+    install -d ${D}/${PTEST_PATH}/tests
+    find ${B}/tests -type f -executable -exec install {} ${D}${PTEST_PATH}/tests/ \;
+}
+
 PACKAGES =+ "${PN}-tools"
 FILES:${PN}-tools = "${bindir}/*"
-- 
2.34.1


