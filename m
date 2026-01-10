Return-Path: <Haixiao.Yan.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23FFED277DA
	for <webhook@archiver.kernel.org>; Sat, 10 Jan 2026 09:53:03 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5979.1768038779167532042
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 10 Jan 2026 01:53:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=RfwSsoyl;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=5470fe3c83=haixiao.yan.cn@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60A9Up6i3833971
	for <openembedded-devel@lists.openembedded.org>; Sat, 10 Jan 2026 09:52:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=c8qsAdQBhTawwOPu4672
	r8t23LMwFt1YY/J35Pi5ePo=; b=RfwSsoylpZCWMFfWyzO8xQ9xS6OGpYtSCXz1
	mUkIAlYqHJed8OCIfeuJutAa13r/9H2d2bo4xOic24apd1YbQx4rVRg4fQOmlADU
	bXrkKMBwF6BvBhSZnvtHMmBd9Z3R2xzgDUJFoV9+YzU4s+4akahmWt3CTwYV01rx
	pZluFvgvIyxfBYFiR5NW7WyOPzOyK2YEE0IzB19+cMuxPa+0MqB/oK6ClTLLcAec
	jJU29oF4lO4PO8hmS+Q3zIbDdfKLShOYWN/Tj/641qMWyC9I4nNPjfsW6bnaAJn7
	I0zGbOfqskYg0FlEMKb+Hfg0RKpcXOmb64wOS9sS8gb0oqPxnw==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010044.outbound.protection.outlook.com [52.101.46.44])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4bkbytg88f-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sat, 10 Jan 2026 09:52:57 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V8Z7Hw3ElhcaJCXnSA2vRipHCRqJ8oUVIMdtOSGKaFnYE4UvDs4ebKQYDAAMMPwvHT8b0UDokjrJ2w47OV/iP7RfJmIwSZIDdfo4QwpXw2zN2d25zepvKvz2KA1GyC4gRlsenCqct5ejk2ZfJ2TB/J/kaW/2uExepHkZFaXIm574rSesYZI7BWtjyodOXzyUbHLk9izVAxkaxzXezZZk60IFcKrVNTKyh4704/YVEKNWqRHnDv29dLb94LkxML69gdjkITrWkjtwOpSfhBE+q/wM3i0tfkGGLeh6nx6BpywUBU2LaacF2R518XE/vAzB/jVB9Yi3burVEwZLmP+zwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c8qsAdQBhTawwOPu4672r8t23LMwFt1YY/J35Pi5ePo=;
 b=ZGw/tT3mnyEAUYyU3MyY720ijdSn37dEaHn9ROZSKJ6xXmM2K5IVcOGaKh4c0veKsKQ67HGZD3GopzuvWiEyIleCY8r9lMF0LIB6DlvBAxtZ6UD9PLZx/I5YR1QqKpAd5ZPK9ieFYpqWQo6k8v0hADBjizIeEUraVN/JEVDZvhePPABbvLprjFHP0kAaPLI3S35ApdT5pC+7o3QS7SZZvrnybegpiiATQ2Sz+KXoFpxMJ4o2oZ/CFwCye/Njgg8NljJSXuID6UhTC0YXtWgTLpjJ7IzPcRJFGS1PbK/wsMK9O6K+XPNDfdaf2k/oxbz0krkb4Opa1dJqk7yPNHWdnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by MN2PR11MB4616.namprd11.prod.outlook.com (2603:10b6:208:26f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Sat, 10 Jan
 2026 09:52:55 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e%4]) with mapi id 15.20.9499.005; Sat, 10 Jan 2026
 09:52:54 +0000
From: haixiao.yan.cn@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][krikstone][PATCH] python3-django: Fix '_lazy_re_compile'
Date: Sat, 10 Jan 2026 17:52:37 +0800
Message-Id: <20260110095237.4040378-1-haixiao.yan.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0065.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31a::6) To CH0PR11MB8189.namprd11.prod.outlook.com
 (2603:10b6:610:18d::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|MN2PR11MB4616:EE_
X-MS-Office365-Filtering-Correlation-Id: 18939534-653d-4eae-0fe9-08de502e05f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014|7142099003;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?VyMVJYdZJKnwrqEyVzm7qBxjiTGpFY2TYg/KhpjXzOmaC8wOCP6XVxe37sd4?=
 =?us-ascii?Q?PPkeMT0XGFageGB90LQ5eWFpa3NyV/hkTwEzh0xJcnx67wb6n6jKzyr3q5EG?=
 =?us-ascii?Q?G3elXzQsYFDpNcxPyvXq+hGQmQ5392ALMOdDcCS7GQBUAcQRm3x/cBR7Sj90?=
 =?us-ascii?Q?XcZ8+NBe2pcVWoGd6ige6HrCPLh6mODpThbtktrA3BQH3dHPaiSVReXhxcaL?=
 =?us-ascii?Q?g6nPkIUsazY5m3cJGQZEU8LhFiO0gzswh3lHSEMkj3qYapbk+zdfkQ02ZrHA?=
 =?us-ascii?Q?iDDWkmpYpanYOZHQL4Tc8poC+lga09GXJMrCt7d9fO6qRi4mb2tihKWIk2Ow?=
 =?us-ascii?Q?FT63NnUhgAjW9qMjRW1mNuq4aklZQvEq8floyszV73KJLHOhkK2PCpqwMh3q?=
 =?us-ascii?Q?ljqPucq7ufkvqiX3ojju1ByfGq03fwlpM5AA0i7arAGsBp4wvTCRxKjHoRWH?=
 =?us-ascii?Q?tp1yAlDCCp0kQlai49WefMWKlgcdEvmWope/9geH2jQdbTb+Q90x4OgpHtjZ?=
 =?us-ascii?Q?rj3bkzKG9q4IJ2VZTipWg4Bin09q3wtXrr6uLirZRNsMk20ttgFTxjcRmvVX?=
 =?us-ascii?Q?xiq0gFxr5jTAiREy0jGvzI0FIVuAKqoNN10rtQo8TrCbAk0g+53+jWiCmLye?=
 =?us-ascii?Q?K4IrjVEqq/9xEoqi30hTOTsMmcow2CMkBhw3Xp+db+UnaIdzZt9W9oNg7biK?=
 =?us-ascii?Q?T8FTUfHNDU0eDdj8tSqa+pl1udgUI/PsZc82s4S2g1i9d5yy9uu00I4/mPCx?=
 =?us-ascii?Q?qIJt6QfoCRlTxl2budSeDytao+Hgvgs0AdnjYLh2Yr0I8zO+JOkCbu2GI5W1?=
 =?us-ascii?Q?Iw4T8fgJcQf//mK2GLSx10c2vyCwRa72cUdCIu8YeaXjUAiSGoNGP//G4ot0?=
 =?us-ascii?Q?qWs1358B1TrfA1+WdzNd8rYN0YUjl2HYAVJkEQUN63pNjKqOyVjWEAAH+RIy?=
 =?us-ascii?Q?mTnpmeAxPiwW6YmGpIUzTdt6qEmINGGosDQ1oJMIMiJxbOD+PeD7NsT7kZ+q?=
 =?us-ascii?Q?8T22N92LzdFmpBhgBvVdS6aoiFqgvuj/lVSm3LAds0MbszX6Gc2K+FjnvHwJ?=
 =?us-ascii?Q?WHOslUvnVV6WdnqELAfwRncvtLKHIv1yi3BHBkjEXjNQtlhfVngx5tYxp6Xg?=
 =?us-ascii?Q?HpAKF7NByoTtwbHs3osWvgZ2XVEjIZoCu5z1mOoPg3D3orNFR14QE4/kHLhF?=
 =?us-ascii?Q?rdL/GYPaTitDHoCQ/iDe3ZMUDO/08fU/QCdQsFn2bE+/CqNTqil73BxK7aE2?=
 =?us-ascii?Q?1P2iJWnxW8AYbsGuOnV+8KuPcH72aeVVRyrnjRPT4fBT+53694ZqKaT8OlXZ?=
 =?us-ascii?Q?LIsDE0XEtq5OCJm3Yt/WY+N53lThdLxwJ+8XPIC+gXW5jcGZiwqW7Uyl7bm1?=
 =?us-ascii?Q?bP3/QoqYvuwXs9D/vBOMsE/kseE+vPDZIvWqPiByTnakUTSSYbTikGMj/0K3?=
 =?us-ascii?Q?SaANIjjlZLZLvVG6lVxIBbIaRUioV+XSfGltac5UltG8Y3aC0WlStgRVqfTC?=
 =?us-ascii?Q?IbVQZlhIB8LMgAySIbrzXR8mYYyZkPIvB17UHU4P9VwfJe3vSBahtb0P4w?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB8200.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014)(7142099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?KAu9/eBg+LM6OFg/YgEszWH3Et0v6to+LKXvT56lAFa/4Hr/v2kERLQY5axV?=
 =?us-ascii?Q?1ctGbfALhDCPBgMbZ1hf8B71wD2vqXQQW4dqoBCguDZz4TyfUsMPYG6Uuy6m?=
 =?us-ascii?Q?xjW+a3i3xb0HQSjXhdz6rPVE9D6ifGjT+Sw9CqE3fgVmipyhYhA9PJCxvNPd?=
 =?us-ascii?Q?G+9NO6e+Lj0VpoPqF6WS9LLcEcPpTFa/O7IEAnDnmcppuwnWS1ECDvmIxWsx?=
 =?us-ascii?Q?dEFw+pJs3IfXMFRdtp0PrnZ3aTbRCE1TJtRXjplKY9+JuH/QCtouyvhNtr0n?=
 =?us-ascii?Q?IlC168EjKM100CqVpQ0p6V/GYHaSIAcU4KbZQPGnF8k9/SUOK6BFLdmU3t9S?=
 =?us-ascii?Q?QjG5H8cB+hARS4eTyqpplPHytuAsBG7VxOB6bpB5A3STkPW5qv4inmTjUYMc?=
 =?us-ascii?Q?U1P5PWPVMWnMQGmExJluN6Mj944RpdgW3tc9UZcneodXINEdH9ubzjWL8Dwx?=
 =?us-ascii?Q?Ia5t1I0TxjQ3rIVtagLN/ddaFn59Mv0Vq67m/z5sUp60eQ8uVzDqcYmWK891?=
 =?us-ascii?Q?FWDGLfheDSBl2B1U61VKi+oOgSnodxoDzers8mY6OUG6/YeQIHloyhuZTj3h?=
 =?us-ascii?Q?i+WKRFAKOhT+Amw6dm+TCvwl0wCvoTIu53EiO+lyfhAFjPifh0gaZXGN/mfu?=
 =?us-ascii?Q?9YzCFnCUpnLUFGCNe/7BhsQ8JuvhuC++aPo0p88ScGthfq88i6rPccxIamD5?=
 =?us-ascii?Q?iinSVfcFPXhVNXNCI17YR+2oWI8W6JXagOXfX5ICpvk7nV0N0uoGIwazutaN?=
 =?us-ascii?Q?wb/rSOyD+q03odCSbUQZhx1HalVPnAvYttaQBEB3ccSwVWwfzWnpCQL5qC6x?=
 =?us-ascii?Q?fOZs8/PtYKI9hhAPeHUvgELo113SEXUxiMeW/ncMfgwn0hW/xfGq6PtQw9y9?=
 =?us-ascii?Q?/9oUDZ9C3+gQoEs/qbfbxkst5PUmylwCgXJ65ogMonPnfckxcTas5ziGfPGf?=
 =?us-ascii?Q?fl6GG8ztAAF2k88S6W2lkOK9IQYOGukQg6EZ25Dwmeyp7vpydmfHDE7xs6FG?=
 =?us-ascii?Q?gsaCXLMbmccwbeRBUkQxHx3wyN/7AMO5tappWGZxs1Td5pJAWZ0xO+ndpAuI?=
 =?us-ascii?Q?7nrY3yjAKiI/2xqfiiNczo5Su4dMBTZDDMmf4Q7Ce35PwHdCcz/ZyO1cOqh6?=
 =?us-ascii?Q?qsf+LkfEA/zdVF8Vdkxt0BsEy7h4dSF7L9lciXWgRnUKJewUCqGP61rrbTyr?=
 =?us-ascii?Q?1GA4PHUlasN5SJIBlsj81cJBhX8fRTalxFMMxNGeg4MbeEYBZJxQwW1DciEs?=
 =?us-ascii?Q?k7EIZqlI4+2Xk/xVvqbVGOABYTyHfQX3cCk1CsBWEvaj6ecPcMIpXs+fP75V?=
 =?us-ascii?Q?fDbZ8JkdNdHSYbi/TLeIMaIj4cFrLl8f5HnzMu6i9W/2NTJsVX/+Sld+h/m3?=
 =?us-ascii?Q?TL4fq8jN3TCe/zv1NYUIDQwBcX9A7frr3T+OO8nr8nIfdERFhjZaKYs6wDUq?=
 =?us-ascii?Q?Bp9TYleqLoUkmH7i+z5ggwY3ATCQ8IevtMXQBEg5QjO/30JbsYbrq1KhoDC7?=
 =?us-ascii?Q?evBFNg4wKnM4Suw7Y715eOqmkJFxKhx8/7lcJxQ8S60I3gwVZRYu9XtpNHS2?=
 =?us-ascii?Q?/v/ybsxppWv+y5V/ZCfnI21KEQC0eHGc/Po5DdkCj3i1I220OyYowY3qYSea?=
 =?us-ascii?Q?GvMNalDIAAUR3v72UiWkxSB0jXioe0BTKPVj0mTeJsWMJcPgDQogGbmzujRj?=
 =?us-ascii?Q?22RNNHIG8OSt6DZo13dQzbHPY6jubPiG8yxmrYDuw6Zx1ptVc20gpE0uaJeL?=
 =?us-ascii?Q?z3mlhzHajStmQCM5jYi51XSJfTqalUg=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18939534-653d-4eae-0fe9-08de502e05f1
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB8189.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2026 09:52:54.4269
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lG9BVRHHvwc4SEPIn0cKjinONAN9yO96ipNJgA5ikIKXFzbHZrohJeWIK9P7DcEbRoorQtvQa8TIYvHW8MbNkgq+2YVR6aO+0MOKk+G8k7M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4616
X-Proofpoint-GUID: Nmm1BlH5MW2Xx2yn8v76t5ubpcc6iUhg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEwMDA4MCBTYWx0ZWRfX5B+UIH2A9234
 jfdsiORpDIXsl7dHLlYhTqnlivZprDqFc3dsrhdiRQfOApGgjGACF+U13p0SeWB6ICFn8DcWkk/
 d+MIePxB8pXhx3XE/cb3wJNEY4BygYJxC6eL9cZn+K1GiArhzJaRyrCa3YZb4NnhvGte0U7zxRk
 ai+bfrAcoAdkXBciQkXqx8iYgqzYSCkSdoVWWRNupoIsfslZg83KS+5foM5TFLw5yDAD7fUHToT
 v//QAnrmZWHRv5Np1vE1teC+/g8Ipdn9okSqr0oIwNLheHZpVtYgLVXpw/bLlocxk9ypH8riGdF
 YJCJXLNB/goxBsv6LE1KVd5AjT0CFHGov7Z6Ka0gwR5qJO1H+4Njr2NzGhkUmxCPfYeZJpEjSY/
 KcYLblmT16t29S/o7VA73VjakRUf3NjdLB7DhqzBkqW8Zr1rRJXjHEXA4mkajRkpxV6UELhWrIu
 egfCQwGrJptsGQlZj9g==
X-Authority-Analysis: v=2.4 cv=b66/I9Gx c=1 sm=1 tr=0 ts=69622179 cx=c_pps
 a=feJg8xcwi6yo0k/5NfVkgw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=JUY6PVayAAAA:8 a=pGLkceISAAAA:8
 a=W8_ZnyXlAAAA:8 a=fxJcL_dCAAAA:8 a=VWcOui0qAAAA:8 a=TFSH6_FRtRJuyxxk8C0A:9
 a=FdTzh2GWekK77mhwV6Dw:22 a=32l4pQc4xq9dSJlKNEIc:22 a=eqgIXyRJRr-I_B2loWo7:22
 a=QrT887owLcKFfbcY6Lji:22
X-Proofpoint-ORIG-GUID: Nmm1BlH5MW2Xx2yn8v76t5ubpcc6iUhg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-10_02,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 suspectscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601100080
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 10 Jan 2026 09:53:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123318

From: Haixiao Yan <haixiao.yan.cn@windriver.com>

- Fix:
  NameError: name '_lazy_re_compile' is not defined
  introduced by CVE-2024-27351.patch and CVE-2025-32873.patch
- Revert the modification for docs/releases/2.2.28.txt

Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
---
 .../python3-django/CVE-2024-27351.patch       | 35 ++++------------
 .../python3-django/CVE-2024-39329.patch       | 27 +++---------
 .../python3-django/CVE-2024-39330.patch       | 40 +++++-------------
 .../python3-django/CVE-2024-56374.patch       | 42 +++++--------------
 .../python3-django/CVE-2025-26699.patch       | 37 +++++-----------
 .../python3-django/CVE-2025-32873.patch       | 33 ++++-----------
 .../python3-django/CVE-2025-57833.patch       | 33 ++++-----------
 7 files changed, 59 insertions(+), 188 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-django/CVE-2024-27351.patch b/meta-python/recipes-devtools/python/python3-django/CVE-2024-27351.patch
index a341897ebe24..e23025e23db3 100644
--- a/meta-python/recipes-devtools/python/python3-django/CVE-2024-27351.patch
+++ b/meta-python/recipes-devtools/python/python3-django/CVE-2024-27351.patch
@@ -1,4 +1,4 @@
-From 072963e4c4d0b3a7a8c5412bc0c7d27d1a9c3521 Mon Sep 17 00:00:00 2001
+From 44257057cb92c55ee3c9f66de76120c523aacbc3 Mon Sep 17 00:00:00 2001
 From: Shai Berger <shai@platonix.com>
 Date: Mon, 19 Feb 2024 13:56:37 +0100
 Subject: [PATCH] Fixed CVE-2024-27351 -- Prevented potential ReDoS in
@@ -14,16 +14,14 @@ https://github.com/django/django/commit/072963e4c4d0b3a7a8c5412bc0c7d27d1a9c3521
 Signed-off-by: Shai Berger <shai@platonix.com>
 Co-Authored-By: Mariusz Felisiak <felisiak.mariusz@gmail.com>
 Signed-off-by: Saravanan <saravanan.kadambathursubramaniyam@windriver.com>
-
-%% original patch: CVE-2024-27351.patch
+Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
 ---
  django/utils/text.py           | 57 ++++++++++++++++++++++++++++++++--
- docs/releases/2.2.28.txt       |  9 ++++++
  tests/utils_tests/test_text.py | 26 ++++++++++++++++
- 3 files changed, 90 insertions(+), 2 deletions(-)
+ 2 files changed, 81 insertions(+), 2 deletions(-)
 
 diff --git a/django/utils/text.py b/django/utils/text.py
-index 06a377b..2c4040e 100644
+index 06a377b894a2..02dd0891686b 100644
 --- a/django/utils/text.py
 +++ b/django/utils/text.py
 @@ -15,8 +15,61 @@ def capfirst(x):
@@ -43,8 +41,8 @@ index 06a377b..2c4040e 100644
 +# text with only open brackets "<<<...". The class below provides the services
 +# and correct answers for the use cases, but in these edge cases does it much
 +# faster.
-+re_notag = _lazy_re_compile(r"([^<>\s]+)", re.S)
-+re_prt = _lazy_re_compile(r"<|([^<>\s]+)", re.S)
++re_notag = re.compile(r"([^<>\s]+)", re.S)
++re_prt = re.compile(r"<|([^<>\s]+)", re.S)
 +
 +
 +class WordsRegex:
@@ -90,25 +88,8 @@ index 06a377b..2c4040e 100644
  re_chars = re.compile(r'<[^>]+?>|(.)', re.S)
  re_tag = re.compile(r'<(/)?(\S+?)(?:(\s*/)|\s.*?)?>', re.S)
  re_newlines = re.compile(r'\r\n|\r')  # Used in normalize_newlines
-diff --git a/docs/releases/2.2.28.txt b/docs/releases/2.2.28.txt
-index c653cb6..7227452 100644
---- a/docs/releases/2.2.28.txt
-+++ b/docs/releases/2.2.28.txt
-@@ -90,3 +90,12 @@ large number of Unicode characters.
- In order to avoid the vulnerability, invalid values longer than
- ``UsernameField.max_length`` are no longer normalized, since they cannot pass
- validation anyway.
-+
-+CVE-2024-27351: Potential regular expression denial-of-service in ``django.utils.text.Truncator.words()``
-+=========================================================================================================
-+
-+``django.utils.text.Truncator.words()`` method (with ``html=True``) and
-+:tfilter:`truncatewords_html` template filter were subject to a potential
-+regular expression denial-of-service attack using a suitably crafted string
-+(follow up to :cve:`2019-14232` and :cve:`2023-43665`).
-+
 diff --git a/tests/utils_tests/test_text.py b/tests/utils_tests/test_text.py
-index cb3063d..7e9f2b3 100644
+index cb3063d460e0..7e9f2b3e96d5 100644
 --- a/tests/utils_tests/test_text.py
 +++ b/tests/utils_tests/test_text.py
 @@ -156,6 +156,32 @@ class TestUtilsText(SimpleTestCase):
@@ -145,5 +126,5 @@ index cb3063d..7e9f2b3 100644
      def test_truncate_words_html_size_limit(self):
          max_len = text.Truncator.MAX_LENGTH_HTML
 -- 
-2.40.0
+2.34.1
 
diff --git a/meta-python/recipes-devtools/python/python3-django/CVE-2024-39329.patch b/meta-python/recipes-devtools/python/python3-django/CVE-2024-39329.patch
index c302c0df186c..67c97f2601da 100644
--- a/meta-python/recipes-devtools/python/python3-django/CVE-2024-39329.patch
+++ b/meta-python/recipes-devtools/python/python3-django/CVE-2024-39329.patch
@@ -1,4 +1,4 @@
-From 156d3186c96e3ec2ca73b8b25dc2ef366e38df14 Mon Sep 17 00:00:00 2001
+From 7d7126caae786521290383d618dea49727d871f9 Mon Sep 17 00:00:00 2001
 From: Michael Manfre <mike@manfre.net>
 Date: Fri, 14 Jun 2024 22:12:58 -0400
 Subject: [PATCH] Fixed CVE-2024-39329 -- Standarized timing of
@@ -15,14 +15,14 @@ https://github.com/django/django/commit/156d3186c96e3ec2ca73b8b25dc2ef366e38df14
 
 Signed-off-by: Michael Manfre <mike@manfre.net>
 Signed-off-by: Saravanan <saravanan.kadambathursubramaniyam@windriver.com>
+Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
 ---
  django/contrib/auth/hashers.py   | 10 ++++++++--
- docs/releases/2.2.28.txt         |  7 +++++++
  tests/auth_tests/test_hashers.py | 32 ++++++++++++++++++++++++++++++++
- 3 files changed, 47 insertions(+), 2 deletions(-)
+ 2 files changed, 40 insertions(+), 2 deletions(-)
 
 diff --git a/django/contrib/auth/hashers.py b/django/contrib/auth/hashers.py
-index 1e8d754..4acb81d 100644
+index 1e8d7547fc35..4acb81d3d0de 100644
 --- a/django/contrib/auth/hashers.py
 +++ b/django/contrib/auth/hashers.py
 @@ -36,14 +36,20 @@ def check_password(password, encoded, setter=None, preferred='default'):
@@ -48,23 +48,8 @@ index 1e8d754..4acb81d 100644
          return False
  
      hasher_changed = hasher.algorithm != preferred.algorithm
-diff --git a/docs/releases/2.2.28.txt b/docs/releases/2.2.28.txt
-index f3fb298..22fa80e 100644
---- a/docs/releases/2.2.28.txt
-+++ b/docs/releases/2.2.28.txt
-@@ -124,3 +124,10 @@ CVE-2025-57833: Potential SQL injection in ``FilteredRelation`` column aliases
- using a suitably crafted dictionary, with dictionary expansion, as the
- ``**kwargs`` passed to :meth:`.QuerySet.annotate` or :meth:`.QuerySet.alias`.
- 
-+CVE-2024-39329: Username enumeration through timing difference for users with unusable passwords
-+================================================================================================
-+
-+The :meth:`~django.contrib.auth.backends.ModelBackend.authenticate()` method
-+allowed remote attackers to enumerate users via a timing attack involving login
-+requests for users with unusable passwords.
-+
 diff --git a/tests/auth_tests/test_hashers.py b/tests/auth_tests/test_hashers.py
-index ee6441b..391b3cc 100644
+index ee6441b237f6..391b3cc9b41b 100644
 --- a/tests/auth_tests/test_hashers.py
 +++ b/tests/auth_tests/test_hashers.py
 @@ -433,6 +433,38 @@ class TestUtilsHashPass(SimpleTestCase):
@@ -107,5 +92,5 @@ index ee6441b..391b3cc 100644
  class BasePasswordHasherTests(SimpleTestCase):
      not_implemented_msg = 'subclasses of BasePasswordHasher must provide %s() method'
 -- 
-2.40.0
+2.34.1
 
diff --git a/meta-python/recipes-devtools/python/python3-django/CVE-2024-39330.patch b/meta-python/recipes-devtools/python/python3-django/CVE-2024-39330.patch
index 759716617a69..bb521be7b0b6 100644
--- a/meta-python/recipes-devtools/python/python3-django/CVE-2024-39330.patch
+++ b/meta-python/recipes-devtools/python/python3-django/CVE-2024-39330.patch
@@ -1,8 +1,8 @@
-From 2b00edc0151a660d1eb86da4059904a0fc4e095e Mon Sep 17 00:00:00 2001
+From 44f8933ad6a969a6b509c31a7e46a2813d049d8f Mon Sep 17 00:00:00 2001
 From: Natalia <124304+nessita@users.noreply.github.com>
 Date: Wed, 20 Mar 2024 13:55:21 -0300
-Subject: [PATCH] Fixed CVE-2024-39330 -- Added extra file name validation in
- Storage's save method.
+Subject: [PATCH] Fixed CVE-2024-39330 -- Added extra file name validation
+ in Storage's save method.
 
 Thanks to Josh Schneier for the report, and to Carlton Gibson and Sarah
 Boyce for the reviews.
@@ -13,17 +13,17 @@ Upstream-Status: Backport
 https://github.com/django/django/commit/2b00edc0151a660d1eb86da4059904a0fc4e095e
 
 Signed-off-by: Saravanan <saravanan.kadambathursubramaniyam@windriver.com>
+Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
 ---
  django/core/files/storage.py    | 11 ++++++
  django/core/files/utils.py      |  7 ++--
- docs/releases/2.2.28.txt        | 12 ++++++
  tests/file_storage/test_base.py | 70 +++++++++++++++++++++++++++++++++
  tests/file_storage/tests.py     |  6 ---
- 5 files changed, 96 insertions(+), 10 deletions(-)
+ 4 files changed, 84 insertions(+), 10 deletions(-)
  create mode 100644 tests/file_storage/test_base.py
 
 diff --git a/django/core/files/storage.py b/django/core/files/storage.py
-index ea5bbc8..8c633ec 100644
+index ea5bbc82d0e2..8c633ec040ed 100644
 --- a/django/core/files/storage.py
 +++ b/django/core/files/storage.py
 @@ -50,7 +50,18 @@ class Storage:
@@ -46,7 +46,7 @@ index ea5bbc8..8c633ec 100644
          # Ensure that the name returned from the storage system is still valid.
          validate_file_name(name, allow_relative_path=True)
 diff --git a/django/core/files/utils.py b/django/core/files/utils.py
-index f28cea1..a1fea44 100644
+index f28cea107758..a1fea44ded67 100644
 --- a/django/core/files/utils.py
 +++ b/django/core/files/utils.py
 @@ -10,10 +10,9 @@ def validate_file_name(name, allow_relative_path=False):
@@ -63,29 +63,9 @@ index f28cea1..a1fea44 100644
          if path.is_absolute() or '..' in path.parts:
              raise SuspiciousFileOperation(
                  "Detected path traversal attempt in '%s'" % name
-diff --git a/docs/releases/2.2.28.txt b/docs/releases/2.2.28.txt
-index 22fa80e..3503f38 100644
---- a/docs/releases/2.2.28.txt
-+++ b/docs/releases/2.2.28.txt
-@@ -131,3 +131,15 @@ The :meth:`~django.contrib.auth.backends.ModelBackend.authenticate()` method
- allowed remote attackers to enumerate users via a timing attack involving login
- requests for users with unusable passwords.
- 
-+CVE-2024-39330: Potential directory-traversal via ``Storage.save()``
-+====================================================================
-+
-+Derived classes of the :class:`~django.core.files.storage.Storage` base class
-+which override :meth:`generate_filename()
-+<django.core.files.storage.Storage.generate_filename()>` without replicating
-+the file path validations existing in the parent class, allowed for potential
-+directory-traversal via certain inputs when calling :meth:`save()
-+<django.core.files.storage.Storage.save()>`.
-+
-+Built-in ``Storage`` sub-classes were not affected by this vulnerability.
-+
 diff --git a/tests/file_storage/test_base.py b/tests/file_storage/test_base.py
 new file mode 100644
-index 0000000..c5338b8
+index 000000000000..c5338b8e668f
 --- /dev/null
 +++ b/tests/file_storage/test_base.py
 @@ -0,0 +1,70 @@
@@ -160,7 +140,7 @@ index 0000000..c5338b8
 +                ):
 +                    s.save("valid-file-name.txt", content="irrelevant")
 diff --git a/tests/file_storage/tests.py b/tests/file_storage/tests.py
-index 4c6f692..0e69264 100644
+index 4c6f6920ed2d..0e692644b7fd 100644
 --- a/tests/file_storage/tests.py
 +++ b/tests/file_storage/tests.py
 @@ -291,12 +291,6 @@ class FileStorageTests(SimpleTestCase):
@@ -177,5 +157,5 @@ index 4c6f692..0e69264 100644
          with TemporaryUploadedFile('test', 'text/plain', 1, 'utf8') as file:
              file.write(b'1')
 -- 
-2.48.1
+2.34.1
 
diff --git a/meta-python/recipes-devtools/python/python3-django/CVE-2024-56374.patch b/meta-python/recipes-devtools/python/python3-django/CVE-2024-56374.patch
index 3b86eacc4195..7cd7c09c72fb 100644
--- a/meta-python/recipes-devtools/python/python3-django/CVE-2024-56374.patch
+++ b/meta-python/recipes-devtools/python/python3-django/CVE-2024-56374.patch
@@ -1,4 +1,4 @@
-From ad866a1ca3e7d60da888d25d27e46a8adb2ed36e Mon Sep 17 00:00:00 2001
+From bd4fcf0ed96b5a74a4143ab4d9e9391f6bf7122c Mon Sep 17 00:00:00 2001
 From: Natalia <124304+nessita@users.noreply.github.com>
 Date: Mon, 6 Jan 2025 15:51:45 -0300
 Subject: [PATCH] Fixed CVE-2024-56374 -- Mitigated potential DoS in IPv6
@@ -15,20 +15,18 @@ https://github.com/django/django/commit/ad866a1ca3e7d60da888d25d27e46a8adb2ed36e
 Signed-off-by: Natalia <124304+nessita@users.noreply.github.com>
 Co-authored-by: Natalia <124304+nessita@users.noreply.github.com>
 Signed-off-by: Saravanan <saravanan.kadambathursubramaniyam@windriver.com>
-
-%% original patch: CVE-2024-56374.patch
+Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
 ---
  django/db/models/fields/__init__.py           |  6 +--
  django/forms/fields.py                        |  7 +++-
  django/utils/ipv6.py                          | 22 ++++++++--
  docs/ref/forms/fields.txt                     | 13 +++++-
- docs/releases/2.2.28.txt                      | 12 ++++++
  .../field_tests/test_genericipaddressfield.py | 35 +++++++++++++++-
  tests/utils_tests/test_ipv6.py                | 40 +++++++++++++++++--
- 7 files changed, 120 insertions(+), 15 deletions(-)
+ 6 files changed, 108 insertions(+), 15 deletions(-)
 
 diff --git a/django/db/models/fields/__init__.py b/django/db/models/fields/__init__.py
-index e2d1846..c77702f 100644
+index e2d1846ad625..c77702fdacae 100644
 --- a/django/db/models/fields/__init__.py
 +++ b/django/db/models/fields/__init__.py
 @@ -26,7 +26,7 @@ from django.utils.dateparse import (
@@ -59,7 +57,7 @@ index e2d1846..c77702f 100644
          return name, path, args, kwargs
  
 diff --git a/django/forms/fields.py b/django/forms/fields.py
-index f939338..b3156b9 100644
+index f9393383ed81..b3156b9877dc 100644
 --- a/django/forms/fields.py
 +++ b/django/forms/fields.py
 @@ -29,7 +29,7 @@ from django.forms.widgets import (
@@ -91,7 +89,7 @@ index f939338..b3156b9 100644
  
  
 diff --git a/django/utils/ipv6.py b/django/utils/ipv6.py
-index ddb8c80..aed7902 100644
+index ddb8c8091d2f..aed7902af919 100644
 --- a/django/utils/ipv6.py
 +++ b/django/utils/ipv6.py
 @@ -3,9 +3,23 @@ import ipaddress
@@ -139,7 +137,7 @@ index ddb8c80..aed7902 100644
          return False
      return True
 diff --git a/docs/ref/forms/fields.txt b/docs/ref/forms/fields.txt
-index 3a888ef..688890a 100644
+index 3a888ef6b752..688890a5fba6 100644
 --- a/docs/ref/forms/fields.txt
 +++ b/docs/ref/forms/fields.txt
 @@ -791,7 +791,7 @@ For each field, we describe the default widget used if you don't specify
@@ -176,28 +174,8 @@ index 3a888ef..688890a 100644
  ``MultipleChoiceField``
  -----------------------
  
-diff --git a/docs/releases/2.2.28.txt b/docs/releases/2.2.28.txt
-index 7096d13..0e092f0 100644
---- a/docs/releases/2.2.28.txt
-+++ b/docs/releases/2.2.28.txt
-@@ -105,3 +105,15 @@ CVE-2025-26699: Potential denial-of-service vulnerability in ``django.utils.text
- The ``wrap()`` and :tfilter:`wordwrap` template filter were subject to a
- potential denial-of-service attack when used with very long strings.
- 
-+CVE-2024-56374: Potential denial-of-service vulnerability in IPv6 validation
-+============================================================================
-+
-+Lack of upper bound limit enforcement in strings passed when performing IPv6
-+validation could lead to a potential denial-of-service attack. The undocumented
-+and private functions ``clean_ipv6_address`` and ``is_valid_ipv6_address`` were
-+vulnerable, as was the  :class:`django.forms.GenericIPAddressField` form field,
-+which has now been updated to define a ``max_length`` of 39 characters.
-+
-+The :class:`django.db.models.GenericIPAddressField` model field was not
-+affected.
-+
 diff --git a/tests/forms_tests/field_tests/test_genericipaddressfield.py b/tests/forms_tests/field_tests/test_genericipaddressfield.py
-index 97a83e3..4c79d78 100644
+index 97a83e38aedd..4c79d7852aa5 100644
 --- a/tests/forms_tests/field_tests/test_genericipaddressfield.py
 +++ b/tests/forms_tests/field_tests/test_genericipaddressfield.py
 @@ -1,5 +1,6 @@
@@ -256,7 +234,7 @@ index 97a83e3..4c79d78 100644
              f.clean('12345:2:3:4')
          with self.assertRaisesMessage(ValidationError, "'This is not a valid IPv6 address.'"):
 diff --git a/tests/utils_tests/test_ipv6.py b/tests/utils_tests/test_ipv6.py
-index 4e434f3..1ac6763 100644
+index 4e434f3c3aa0..1ac6763d9b93 100644
 --- a/tests/utils_tests/test_ipv6.py
 +++ b/tests/utils_tests/test_ipv6.py
 @@ -1,9 +1,17 @@
@@ -311,5 +289,5 @@ index 4e434f3..1ac6763 100644
 +                    )
 +                self.assertIn(value_error_msg % addr, exception_traceback.getvalue())
 -- 
-2.40.0
+2.34.1
 
diff --git a/meta-python/recipes-devtools/python/python3-django/CVE-2025-26699.patch b/meta-python/recipes-devtools/python/python3-django/CVE-2025-26699.patch
index 44e182057abb..3471a855c096 100644
--- a/meta-python/recipes-devtools/python/python3-django/CVE-2025-26699.patch
+++ b/meta-python/recipes-devtools/python/python3-django/CVE-2025-26699.patch
@@ -1,8 +1,8 @@
-From e88f7376fe68dbf4ebaf11fad1513ce700b45860 Mon Sep 17 00:00:00 2001
+From e8ff028d15324bd21b6378b539637d5c5eb3c4f1 Mon Sep 17 00:00:00 2001
 From: Sarah Boyce <42296566+sarahboyce@users.noreply.github.com>
 Date: Tue, 25 Feb 2025 09:40:54 +0100
-Subject: [PATCH] Fixed CVE-2025-26699 -- Mitigated potential DoS in wordwrap
- template filter.
+Subject: [PATCH] Fixed CVE-2025-26699 -- Mitigated potential DoS in
+ wordwrap template filter.
 
 Thanks sw0rd1ight for the report.
 
@@ -15,16 +15,14 @@ https://github.com/django/django/commit/e88f7376fe68dbf4ebaf11fad1513ce700b45860
 
 Signed-off-by: Sarah Boyce <42296566+sarahboyce@users.noreply.github.com>
 Signed-off-by: Saravanan <saravanan.kadambathursubramaniyam@windriver.com>
-
-%% original patch: CVE-2025-26699.patch
+Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
 ---
  django/utils/text.py                          | 28 ++++++++-----------
- docs/releases/2.2.28.txt                      |  6 ++++
- .../filter_tests/test_wordwrap.py             | 12 ++++++++
- 3 files changed, 29 insertions(+), 17 deletions(-)
+ .../filter_tests/test_wordwrap.py             | 11 ++++++++
+ 2 files changed, 22 insertions(+), 17 deletions(-)
 
 diff --git a/django/utils/text.py b/django/utils/text.py
-index 2c4040e..c474d56 100644
+index 02dd0891686b..e104b60c4f6c 100644
 --- a/django/utils/text.py
 +++ b/django/utils/text.py
 @@ -1,5 +1,6 @@
@@ -68,25 +66,11 @@ index 2c4040e..c474d56 100644
  
  
  class Truncator(SimpleLazyObject):
-diff --git a/docs/releases/2.2.28.txt b/docs/releases/2.2.28.txt
-index 7227452..7096d13 100644
---- a/docs/releases/2.2.28.txt
-+++ b/docs/releases/2.2.28.txt
-@@ -99,3 +99,9 @@ CVE-2024-27351: Potential regular expression denial-of-service in ``django.utils
- regular expression denial-of-service attack using a suitably crafted string
- (follow up to :cve:`2019-14232` and :cve:`2023-43665`).
- 
-+CVE-2025-26699: Potential denial-of-service vulnerability in ``django.utils.text.wrap()``
-+=========================================================================================
-+
-+The ``wrap()`` and :tfilter:`wordwrap` template filter were subject to a
-+potential denial-of-service attack when used with very long strings.
-+
 diff --git a/tests/template_tests/filter_tests/test_wordwrap.py b/tests/template_tests/filter_tests/test_wordwrap.py
-index 02f8605..e6f2afb 100644
+index 02f860582ba7..f61842cb19aa 100644
 --- a/tests/template_tests/filter_tests/test_wordwrap.py
 +++ b/tests/template_tests/filter_tests/test_wordwrap.py
-@@ -51,3 +51,15 @@ class FunctionTests(SimpleTestCase):
+@@ -51,3 +51,14 @@ class FunctionTests(SimpleTestCase):
              ), 14),
              'this is a long\nparagraph of\ntext that\nreally needs\nto be wrapped\nI\'m afraid',
          )
@@ -101,7 +85,6 @@ index 02f8605..e6f2afb 100644
 +            "I'm afraid",
 +            wordwrap(long_text, 10),
 +        )
-+
 -- 
-2.40.0
+2.34.1
 
diff --git a/meta-python/recipes-devtools/python/python3-django/CVE-2025-32873.patch b/meta-python/recipes-devtools/python/python3-django/CVE-2025-32873.patch
index 701f9b574604..0d45c179bb72 100644
--- a/meta-python/recipes-devtools/python/python3-django/CVE-2025-32873.patch
+++ b/meta-python/recipes-devtools/python/python3-django/CVE-2025-32873.patch
@@ -1,4 +1,4 @@
-From 9cd8028f3e38dca8e51c1388f474eecbe7d6ca3c Mon Sep 17 00:00:00 2001
+From ceb93eee32c9e9ad7e0fbaed725d6d54b09bf9d0 Mon Sep 17 00:00:00 2001
 From: Marc Deslauriers <marc.deslauriers@ubuntu.com>
 Date: Wed, 30 Apr 2025 10:34:27 -0400
 Subject: [PATCH] Fixed CVE-2025-32873 -- Mitigated potential DoS in
@@ -17,14 +17,14 @@ Upstream-Status: Backport
 https://github.com/django/django/commit/9cd8028f3e38dca8e51c1388f474eecbe7d6ca3c
 
 Signed-off-by: Saravanan <saravanan.kadambathursubramaniyam@windriver.com>
+Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
 ---
  django/utils/html.py           |  6 ++++++
- docs/releases/2.2.28.txt       | 11 +++++++++++
  tests/utils_tests/test_html.py | 15 ++++++++++++++-
- 3 files changed, 31 insertions(+), 1 deletion(-)
+ 2 files changed, 20 insertions(+), 1 deletion(-)
 
 diff --git a/django/utils/html.py b/django/utils/html.py
-index 0d5ffd2..858a517 100644
+index 0d5ffd219baf..6eb8bc3dbf38 100644
 --- a/django/utils/html.py
 +++ b/django/utils/html.py
 @@ -37,6 +37,9 @@ _html_escapes = {
@@ -32,7 +32,7 @@ index 0d5ffd2..858a517 100644
  }
  
 +# HTML tag that opens but has no closing ">" after 1k+ chars.
-+long_open_tag_without_closing_re = _lazy_re_compile(r"<[a-zA-Z][^>]{1000,}")
++long_open_tag_without_closing_re = re.compile(r"<[a-zA-Z][^>]{1000,}")
 +
  
  @keep_lazy(str, SafeText)
@@ -47,27 +47,8 @@ index 0d5ffd2..858a517 100644
      # Note: in typical case this loop executes _strip_once twice (the second
      # execution does not remove any more tags).
      strip_tags_depth = 0
-diff --git a/docs/releases/2.2.28.txt b/docs/releases/2.2.28.txt
-index 3503f38..1676bbd 100644
---- a/docs/releases/2.2.28.txt
-+++ b/docs/releases/2.2.28.txt
-@@ -143,3 +143,14 @@ directory-traversal via certain inputs when calling :meth:`save()
- 
- Built-in ``Storage`` sub-classes were not affected by this vulnerability.
- 
-+CVE-2025-32873: Denial-of-service possibility in ``strip_tags()``
-+=================================================================
-+
-+:func:`~django.utils.html.strip_tags` would be slow to evaluate certain inputs
-+containing large sequences of incomplete HTML tags. This function is used to
-+implement the :tfilter:`striptags` template filter, which was thus also
-+vulnerable.
-+
-+:func:`~django.utils.html.strip_tags` now raises a :exc:`.SuspiciousOperation`
-+exception if it encounters an unusually large number of unclosed opening tags.
-+
 diff --git a/tests/utils_tests/test_html.py b/tests/utils_tests/test_html.py
-index 2f412e1..653deb2 100644
+index 2f412e103343..653deb2087e8 100644
 --- a/tests/utils_tests/test_html.py
 +++ b/tests/utils_tests/test_html.py
 @@ -92,17 +92,30 @@ class TestUtilsHtml(SimpleTestCase):
@@ -103,5 +84,5 @@ index 2f412e1..653deb2 100644
          # Test with more lengthy content (also catching performance regressions)
          for filename in ('strip_tags1.html', 'strip_tags2.txt'):
 -- 
-2.40.0
+2.34.1
 
diff --git a/meta-python/recipes-devtools/python/python3-django/CVE-2025-57833.patch b/meta-python/recipes-devtools/python/python3-django/CVE-2025-57833.patch
index 9d4edb8d7c5b..c17df1b530b1 100644
--- a/meta-python/recipes-devtools/python/python3-django/CVE-2025-57833.patch
+++ b/meta-python/recipes-devtools/python/python3-django/CVE-2025-57833.patch
@@ -1,8 +1,8 @@
-From 31334e6965ad136a5e369993b01721499c5d1a92 Mon Sep 17 00:00:00 2001
+From 6fb375254ac11840ec66cd6d1ffdc4dbd57af190 Mon Sep 17 00:00:00 2001
 From: Jake Howard <git@theorangeone.net>
 Date: Wed, 13 Aug 2025 14:13:42 +0200
-Subject: [PATCH] Fixed CVE-2025-57833 -- Protected FilteredRelation against
- SQL injection in column aliases.
+Subject: [PATCH] Fixed CVE-2025-57833 -- Protected FilteredRelation
+ against SQL injection in column aliases.
 
 Thanks Eyal Gabay (EyalSec) for the report.
 
@@ -15,16 +15,14 @@ https://github.com/django/django/commit/31334e6965ad136a5e369993b01721499c5d1a92
 
 Signed-off-by: Jake Howard <git@theorangeone.net>
 Signed-off-by: Saravanan <saravanan.kadambathursubramaniyam@windriver.com>
-
-%% original patch: CVE-2025-57833.patch
+Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
 ---
  django/db/models/sql/query.py |  1 +
- docs/releases/2.2.28.txt      |  7 +++++++
  tests/annotations/tests.py    | 18 ++++++++++++++++--
- 3 files changed, 24 insertions(+), 2 deletions(-)
+ 2 files changed, 17 insertions(+), 2 deletions(-)
 
 diff --git a/django/db/models/sql/query.py b/django/db/models/sql/query.py
-index 9b054bd..96a6f5f 100644
+index 9b054bd10079..96a6f5fb5c8d 100644
 --- a/django/db/models/sql/query.py
 +++ b/django/db/models/sql/query.py
 @@ -1369,6 +1369,7 @@ class Query:
@@ -35,23 +33,8 @@ index 9b054bd..96a6f5f 100644
          filtered_relation.alias = alias
          lookups = dict(get_children_from_q(filtered_relation.condition))
          for lookup in chain((filtered_relation.relation_name,), lookups):
-diff --git a/docs/releases/2.2.28.txt b/docs/releases/2.2.28.txt
-index 0e092f0..f3fb298 100644
---- a/docs/releases/2.2.28.txt
-+++ b/docs/releases/2.2.28.txt
-@@ -117,3 +117,10 @@ which has now been updated to define a ``max_length`` of 39 characters.
- The :class:`django.db.models.GenericIPAddressField` model field was not
- affected.
- 
-+CVE-2025-57833: Potential SQL injection in ``FilteredRelation`` column aliases
-+==============================================================================
-+
-+:class:`.FilteredRelation` was subject to SQL injection in column aliases,
-+using a suitably crafted dictionary, with dictionary expansion, as the
-+``**kwargs`` passed to :meth:`.QuerySet.annotate` or :meth:`.QuerySet.alias`.
-+
 diff --git a/tests/annotations/tests.py b/tests/annotations/tests.py
-index 27cd7eb..cdffb07 100644
+index 27cd7ebfb826..cdffb0792009 100644
 --- a/tests/annotations/tests.py
 +++ b/tests/annotations/tests.py
 @@ -3,8 +3,8 @@ from decimal import Decimal
@@ -91,5 +74,5 @@ index 27cd7eb..cdffb07 100644
 +                        **{crafted_alias: FilteredRelation("authors")}
 +                    )
 -- 
-2.40.0
+2.34.1
 
-- 
2.34.1


