Return-Path: <peng.zhang1.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B95AF36BA4
	for <webhook@archiver.kernel.org>; Fri, 10 Apr 2026 03:14:31 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.148656.1775790869522116975
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Apr 2026 20:14:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=B7VDorJH;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8560f89f52=peng.zhang1.cn@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63A0El7D1407797
	for <openembedded-devel@lists.openembedded.org>; Fri, 10 Apr 2026 03:14:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=5pAPaBqsHvvZ1G4vgHMk
	jtjWaoOeyy5GACP5zrj0FNM=; b=B7VDorJHORoswRxbmZBVoFR7L56MbrA6MUbR
	UUZ6SB9x4ot1HO5/bzcb9HKW/rUyI0QGLREf0qOGvHU1knWroyxQXhW+OxMsv3VO
	RrDyRmfdrFCao6DnbmTM3N/MAqlP9+uExJ0o4pOl/i0C3abPd3sy2sTCpdKeMysG
	H6LgJh/N7r94b4VoL/a81CJQRGugsGze/8iCk9ai7HN+e7yCiMaUI/rtgDkQtIue
	M4WLSH6lFRWJN2UclqTRAGHX6NlW+b9TFI/PyDuPoDlzGgJpX2+dhd9ZAo9De1FA
	mWF091NWqMs5E9tYjrckkFVuyjb30IJAlAcPHhl452fRMUd/CQ==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013032.outbound.protection.outlook.com [40.93.196.32])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dcmrqn1r2-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 10 Apr 2026 03:14:28 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AUBRv2zLfb/6SlNgZ1560MakP6/YxMoJUTR8FRQH6inXgbRPiH6waUw18c/eAN59h5FiH/CttqvmtxDXt/1YTsCmuv6eEKIDLy/KAoz8FHte+lG8Ae7QUJBHhUJDZ5lIKcNLN1082w0zpeq6TsLDxw2TerxkaJt+k38Jws32WxONLXfJfxaF01Z7tNX0ix0YZIDUfmqhH7ptF1zSzSKcFi1j9/Lue59ezPEZgJdPQ/h8XcmHH5kIgWo4tr5pwwYAx4OOmwt6dyf0i4z3QVZeOjHQ1QDfTzKYpcqz+tz9c7LVJjw8iv/Pe9Z5VccUwXjE2TVKo0ZMcjuSb2wHDAvkdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5pAPaBqsHvvZ1G4vgHMkjtjWaoOeyy5GACP5zrj0FNM=;
 b=SRatouf15GheEmVOuV+sJ0gEIL7shVsQtVJhvmYMB0G8DgcV41WU50n/qMiaj8t6X/NgtLFHlXyZWH/ujYdmgUq7VooZvbhPC7Wvw61ikHU1haNr5YcWCTc2FjQfxpImT64wddhLFZpjrlKygTm6G5RJVgLMSL3gC2CEwvwhm8GZhBhye3rv6yxCQp5uQ3eCSYcnj+h+kftMnYeJfa9eS8hn0705EkMeRxDgDSXfOYU0lIla/CRwQA5f7tqRfzPRPP1hAzHBqmcA+FcisNo7jMcCuvQrI/dIKghTED+r4CKyva8Xq2P8zgV468w1bmy+mnmSpNHnCffUDICN44lv3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8562.namprd11.prod.outlook.com (2603:10b6:610:1b8::13)
 by DS7PR11MB8854.namprd11.prod.outlook.com (2603:10b6:8:256::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.11; Fri, 10 Apr
 2026 03:14:23 +0000
Received: from CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::ea76:e083:b8bf:7484]) by CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::ea76:e083:b8bf:7484%5]) with mapi id 15.20.9769.017; Fri, 10 Apr 2026
 03:14:23 +0000
From: peng.zhang1.cn@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH v2] python3-pytest-codspeed: upgrade 3.0.0 -> 4.3.0
Date: Fri, 10 Apr 2026 11:14:11 +0800
Message-Id: <20260410031411.1608831-1-peng.zhang1.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0121.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::25) To CH3PR11MB8562.namprd11.prod.outlook.com
 (2603:10b6:610:1b8::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8562:EE_|DS7PR11MB8854:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f5e37c2-b0f6-49ae-f68e-08de96af43b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	+I32dkEsfwJGDLKk/Gw8rjUb730GFQcyizT8b6iiuuCj2hSoc0JbX3Di7Z3pjFSxeVkGxw5eADKSsofRVWbaJLOO/KboXFKxtyqVVQRdS71HH0/omTIaoZhud+A/IsCFFrfUkTOB8+0Mi8SENavBaJhoZzWRsjvvP2tkwxNy4rkd3tZHDWMGIDIhoCTwcOM/7VLE1a26CHXCsVHYkeWuQ9CecNPTg8JMMemMRXngPDnAAvWbVbD6P4dO6AhJXlrI8WKAEPpc9XOfk3++hedEcqYEfedsFmrFZkAT0t6fxtUUyg83zVCm87WuI1GNFHKdaO8dUwGoxs/IzJWs8uCx/v3jkoHq5N7UG2Wyh7DD8OOIf8USzYihvAr2Pcgj9Of4F0BAe33+gW1oqH6wKWdeV/FJjfEHH+KcD2+z6nY+/vDcOnNyIKKL2y0Rm/Wy3dpcoibCcgGVReJiSlaeJvHiPSfjp7vb2e4pPy09az3xsW1QiU20B69sVrWnD2NU7Y0A9CKULTz9u8llUpdMV9yQK229bB32UDjwe2qwKdWpwxPc1ei9cnxKgkyl9hmWrFbSL+L5Ddf6CD/n4+0wYhGkxP0dC/uWRwDr40ZPvrH1lT33PfaVi9UsDZhxvBQeBsTH5ZKlPhd7Ldm4nmGREoEmmrJrFuzWNL2AwhNoLbit8uOO0H3d5+oJvSTm2oPvm22ofbHuA/yJ71SHKv4Xvb5Bbpe8oV4EeQ+FwG0gaBVBkoFz/yL7HcpKaVexUhLuENPe
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8562.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?6RbZCJH34fwZUqWAxOVikF8Ku9TnuV+gs0lbKhmyDt17U4JYcOycDDzQUkKK?=
 =?us-ascii?Q?sPiVY/JSvDTnOnTNbueOh7iDVLVxoi0Lj/phrR9mE+RvCqBO0+8PF5OMgDHE?=
 =?us-ascii?Q?scXZXq/DJdtznReJ85jALXmkLDgcYMj5Y6GkT6tBfRRdqFudCqDHUWndqCNy?=
 =?us-ascii?Q?CW4A8KiYAiAsB3+9rHzm43N0VgvGSfnsbiUZyKW4aZKpnkRrel6+BKAK35fo?=
 =?us-ascii?Q?0n84mK/h9YcERiiGtReGUiaufHi1DEyngnquUAwhD7nQKaTuVVcPzGEJiUKF?=
 =?us-ascii?Q?dxJneJOmWuXEOvLyhvavikswMx8HG25ZenB6LCRPj4GT7so5zv9YbYgyU8Zr?=
 =?us-ascii?Q?NjVTD7Km4hdzMYesa561CxQUvh1QE5mXsIyi9LWG/dSSxsmHpNtWWGCHFCdk?=
 =?us-ascii?Q?UyR6AaGDDW2PmLDwsLsF67iNJeBjZcV3F3YQy4xxuCrFkqKsHvQiVc6uajMk?=
 =?us-ascii?Q?ny3oxbk7xX5adlntheflFqNrQNy5uhLxA1ZmxaSh9m97PPNzZ55HIJgDTEkx?=
 =?us-ascii?Q?uFYFP72rXO8YbA4HCq8aPSGTedxrejGrjMD6k16wlcZFjXMLdd6rK/R62Rg9?=
 =?us-ascii?Q?TLtfkNhcOjDRdyDM0s7cYSO963p31wR6j/LtBkl5gOyrEvnTAm47XjaLCUEq?=
 =?us-ascii?Q?WgvnGrc94kWvOTBHVDsT1a1IyrU1bkfauHMAdpCqvpNuI/5l/TpK2Oe/4OO3?=
 =?us-ascii?Q?+8ZzneYpchJ/PbCY6Sea0K53E/k1HpmfJaTyIJAR98Hur67Cg9XzRzOOOTIN?=
 =?us-ascii?Q?uC0ZbrbqwgRhyJX/YVtki6Nr58HUdlrm9uwObi2isU/Hcoczh2lGcqpN4D1L?=
 =?us-ascii?Q?nx74s4WNLfARSRPx1WI24d2IcGgW1oXvNFnm3DxTHwldagldmCIaA25SrNrM?=
 =?us-ascii?Q?+pBnINxVIWaYii/20FbnceGCYoT9TuVTSa84zchZE+hnjyn4u1iN+11HJZh9?=
 =?us-ascii?Q?iNbYSR/FEC+/bKqPrZjmJ0rWDiX09IS5L5xY032jI/eEgx9CvkuB2U/PJ+Ew?=
 =?us-ascii?Q?0NQV3OlJq8eWJqOJvqkk5LBF0vac3Ffe6F7Q7CfFF3xxvPV1EwgaFu9vuPqY?=
 =?us-ascii?Q?z4rg+afXKqXnSFoFNIFR9KIUovOkRCXGqHptF+wefRYi62b2CYaIDIF+Fc/U?=
 =?us-ascii?Q?ZJbIgC/enjI1fgWGHCot/7HArKBObKLhfDa/YksAnDWvGpQAVa8wd17gVa4p?=
 =?us-ascii?Q?UqqK0nqMpojSab4WRmfzIvGX/gDejcNx597di6NGb0v3i5qPqNKdi+V8YwT5?=
 =?us-ascii?Q?GQzIXiL/zp8LbuVOMwkErbzR38dTz2A1xWZQ9pYw5s8JHZBgueW48JCk/4bH?=
 =?us-ascii?Q?HM9QT7V43v1tJeQiUm5jF3cgIUUE/bUzxxfkoKlleynGhKRBKb17ccAIg8oi?=
 =?us-ascii?Q?Tszixhv1hCcZr1GVxEkxjnOpPU+e0v2NhqSu86KaO6VDnjGaiRi+0TerQWxR?=
 =?us-ascii?Q?NqEPmi8siLzIDrdKf9kXMJC1YrLwNNeXQPc3UQJw+yHTHygExRntVRv1lPP5?=
 =?us-ascii?Q?8Z0Yd+njjr977HinPaBsmgKTagpTa9WEo+t9M9xckJ35mk6EgxftmXef9qEg?=
 =?us-ascii?Q?yU6/9Q9MaToC3Ntr74a4MJgpIkLcZa0YwK4EDOA5LUsOy3wlHOdDGm2ZSROt?=
 =?us-ascii?Q?hdupvTw5PcEJd9udzdL89qixlfhGrUuxTK1NKXnzvx6BfSCjHB/xvKZScw46?=
 =?us-ascii?Q?JkSZovEJ9oTL2HMOy3I++XMtZWCQrDSfIzKONllJOgsd5dfhtLIDjrl+bd4l?=
 =?us-ascii?Q?loHt/zhSIkn2YUzXS/vQwD2NcBtuuvw=3D?=
X-Exchange-RoutingPolicyChecked: 
	F05elAF3zWIaM/0JRmXGY9TDVd/PB49eqt91Niuf7VQ5NkYM4zQKnwDqS2AhS+vvS8HBP8YeIgDbSzsLsQ3J/xfyWWMLTK7HaSMFaDcf1Q0nIlqnpr//M8AlimmYnAN8+J2vBf3iKeoNTiBCQaevA58tpXWv0wHzVhGXs3Aqg/3sMUWUnQcfNdzGuoJoPxoLkiSV6VYj9QdsWUowti/pmigKVLmp1Hcg4dyh7AxfjD6i3VBk/awjjn2KdUtmNsHezVTc5MeKRtZEr5AFdjMmJR+4nw2Hew4K7nbGIRnLmLMDxkxBeCv2SBIgvfZpbluZehvYOxLv6Co2Upkyneo2tA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f5e37c2-b0f6-49ae-f68e-08de96af43b0
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8562.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2026 03:14:23.4916
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kkabg+r9RepPCS6Kq9N4wt8ZcYUAkLpZ1vN4fjFiNgm1kMzEkjVgEkcpv+7GEOuBVCoBmSoI1mQPSSGxmbpvEObvp7mWUBiZyO6MwGgbSB0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB8854
X-Authority-Analysis: v=2.4 cv=RPCD2Yi+ c=1 sm=1 tr=0 ts=69d86b14 cx=c_pps
 a=kXeBnfu3JcJF6EwF0J+eVg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=L27hKlPSAAAA:20
 a=yqlMzxAxAAAA:8 a=t7CeM3EgAAAA:8 a=zlXbXU_owulEPEzm5UoA:9
 a=LsaQmJBP5CD7zixGX6Do:22 a=FdTzh2GWekK77mhwV6Dw:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-ORIG-GUID: muvRfp8wTvBetJK50a1TU78R0d5oJZyw
X-Proofpoint-GUID: muvRfp8wTvBetJK50a1TU78R0d5oJZyw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDAyNyBTYWx0ZWRfXwMSHf2iF6AXc
 x/thVOB32iQTEbvkw2UrWfAE+zsNuUZ+ddUBeDPV6kj+iqwbw7FeKGWfQyzxF014XdnPMAiteFw
 5o3gS5mhjbF68VNzRoGrWcQZbI6R6RuWa3oBDFji/3x8JEu9pQ935AOAl3+4dvur2aFkrnm9W41
 s2d+SaisLj/05vWhzq6yOtswY75Hw8FhGdApgthSWSZz8+1uVXCHPin7W85Vcd0ZtgiiM/cYYjH
 Kvhaw6d9bJntBxxehdIeyTWcIMxZBszbkIZ1ltou3ZT2hv3hBod/wIdeNpN4CT6GOJ+h01ideft
 XctcugeWqaTfAJsMPc7rTG2CTtyjLsonWq2NzQWhOIWiIjwz0/+sNk1C6shsdbNQ8ju/eoY7Qdb
 O4jNQTExCqG3PMGizHgEes9qFAgLqQWLToqE8WqUYeYA6Vqg+E5ZMaKUC5WLwVRJ/nNJZUF5Hxs
 kdLKVeDICRLAjtgfsog==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_01,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 adultscore=0 spamscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100027
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Apr 2026 03:14:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126210

From: Zhang Peng <peng.zhang1.cn@windriver.com>

Remove explicit python3-hatchling-native from DEPENDS since it is
automatically added when inheriting python_hatchling.

Add python3-cffi-native to DEPENDS since v4.0.0 introduced
CodSpeedHQ/instrument-hooks which uses cffi FFI bindings at
build time.

Changelog:
https://github.com/CodSpeedHQ/pytest-codspeed/releases/tag/v4.3.0
https://github.com/CodSpeedHQ/pytest-codspeed/releases/tag/v4.2.0
https://github.com/CodSpeedHQ/pytest-codspeed/releases/tag/v4.1.1
https://github.com/CodSpeedHQ/pytest-codspeed/releases/tag/v4.1.0
https://github.com/CodSpeedHQ/pytest-codspeed/releases/tag/v4.0.0
https://github.com/CodSpeedHQ/pytest-codspeed/releases/tag/v3.2.0
https://github.com/CodSpeedHQ/pytest-codspeed/releases/tag/v3.1.2
https://github.com/CodSpeedHQ/pytest-codspeed/releases/tag/v3.1.1
https://github.com/CodSpeedHQ/pytest-codspeed/releases/tag/v3.1.0

Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
---
 ...est-codspeed_3.0.0.bb => python3-pytest-codspeed_4.3.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pytest-codspeed_3.0.0.bb => python3-pytest-codspeed_4.3.0.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-pytest-codspeed_3.0.0.bb b/meta-python/recipes-devtools/python/python3-pytest-codspeed_4.3.0.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-pytest-codspeed_3.0.0.bb
rename to meta-python/recipes-devtools/python/python3-pytest-codspeed_4.3.0.bb
index 0789e9f548..3fc2715102 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-codspeed_3.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-codspeed_4.3.0.bb
@@ -3,8 +3,8 @@ HOMEPAGE = "https://codspeed.io/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2856cbe664e8843cd4fd4c1d1d85c2c3"
 
-DEPENDS = "python3-hatchling-native"
-SRC_URI[sha256sum] = "c5b80100ea32dd44079bb2db298288763eb8fe859eafa1650a8711bd2c32fd06"
+DEPENDS = "python3-cffi-native"
+SRC_URI[sha256sum] = "5230d9d65f39063a313ed1820df775166227ec5c20a1122968f85653d5efee48"
 
 inherit pypi python_hatchling
 
-- 
2.34.1


