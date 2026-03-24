Return-Path: <peng.zhang1.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B57A2F532FF
	for <webhook@archiver.kernel.org>; Tue, 24 Mar 2026 12:59:56 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19069.1774357192937167317
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Mar 2026 05:59:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=MSlW+Y41;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7543866fef=peng.zhang1.cn@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62O84rpu4051356
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Mar 2026 12:59:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=a+TfgQAeKZFgTUsvpQkMc96YF5kHmRrTR2/9XO0B/nI=; b=MSlW+Y41K0cN
	3H6Z4CdlH8QOcvSg3l5iMVDGhPp93IMD2Fj5N0t8q17eOX6YHje83DVGYWjMBAd7
	oq9drAu2zNyTgOWYNdsmFcdlXUJqO19EQpb/mfLqQSYBKAl/H2yhIrIWrgkT7xsU
	8dKFKg/RDEeLStrtKps86LMP36JWGI7+S5dQYbrDLXAqvtgB9F/JyRtzGE5CzV8t
	5c8BA9I/UjB6vbQ9Fp53DAGpD6hAuugGkF0Fscb8wyIylyjLMRxngl7Ddc9G0qmA
	RxzCbct+Z0vEowcdtkLZFsiDwxFMkooN3ESoFmyU7QCdFFWriO2RWYvSITOuEsmW
	fzod3AnSPQ==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011064.outbound.protection.outlook.com [40.93.194.64])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4d1ja6ubh2-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Mar 2026 12:59:51 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MacY7csIgMWHUM3suJao4jb5WmbQGpTyjEwQLgT8IJuLlc2BWeYYnghKXid0HgsSro5jalK77B1qbjTfSnrx2X19mE3D65YY7kxDV1D32d0/7XYKxwSjKlacql60AdzPbQO4fONqXkJ39pW4tWLq9lXaa2dRA99ImFCtHqg1rDj2DtXzcwgsE2ZdckSyK9TqeQ4zE7y1bLH19C/1mydBZfeebb0Y93+hIUSFVznaf2dGT6b+mSXBFGBfNSqW9YGMrJybvbeisgwGVWdg6DQ/SARfGpCb6eX9dEEiL3mTDRj++lFmRSOnzU7Im/5lQsUXfgYF6rVC8pHnfNfY7b0kPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a+TfgQAeKZFgTUsvpQkMc96YF5kHmRrTR2/9XO0B/nI=;
 b=L24YsjPFkRC+y8cocRGPXvdiFKsdRhMJlBadciSBB2FfNdwM5MDFMIXuvfEYzKeW8rTGBOZzcFr5Nyn/itQCWBXzwq/9HsRUEnKRRWx8XKZdhNdgRj1/5Re4Z7iy9WQh/A74cLzVQFq+7wmnJIeTQxHDy8QX/MuCNV43BDP5Qri17evLP6jA6WwxRYrbUvSRbvIZqAkruBPpKrmkgn5sI8Yx+An067iuIpJvPUJZOwpGBlfr8Gpqu9CO0QVz7IdcJa3oqNvlDQmDKZ4GXpDupzhJvKzV9VVCIjAzAo4ktl91cegoUNHLpb9TwKAgSJj37e7w3bLVyWvvXqaDmozpkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8562.namprd11.prod.outlook.com (2603:10b6:610:1b8::13)
 by CH3PR11MB7297.namprd11.prod.outlook.com (2603:10b6:610:140::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Tue, 24 Mar
 2026 12:59:49 +0000
Received: from CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::ea76:e083:b8bf:7484]) by CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::ea76:e083:b8bf:7484%5]) with mapi id 15.20.9745.007; Tue, 24 Mar 2026
 12:59:49 +0000
From: peng.zhang1.cn@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-xfce][PATCH v2 06/15] xfce4-panel: upgrade 4.20.1 -> 4.21.1
Date: Tue, 24 Mar 2026 20:59:18 +0800
Message-Id: <20260324125927.1070644-7-peng.zhang1.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260324125927.1070644-1-peng.zhang1.cn@windriver.com>
References: <20260324125927.1070644-1-peng.zhang1.cn@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0114.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::18) To CH3PR11MB8562.namprd11.prod.outlook.com
 (2603:10b6:610:1b8::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8562:EE_|CH3PR11MB7297:EE_
X-MS-Office365-Filtering-Correlation-Id: b3fc80f7-f562-4fde-8bd0-08de89a53b6e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	fSs1ewZHXaLPOoGKXD03UlZCkM3SWcrKgMbPIcmfjyEpWgLgWi32oIE1gTGou8vfNStoWzRMH6oNprkQMkyS+SZHMzujyGbOSt7zkreJRfX6W1yEEVdTiIso5hs0twfniia9YCb54tVnxOZHLBwURb+/qotQd15Yjk70xbsD8IEGEfxcNHnMiq+LI/fBX5yQu70sMKLI8nIsua31VT3+eL33fJIJYmUsQrQrZfTweVA5V25hTrU5T/s6YZ17HuD4JMQNU1fcddE9OrQ96cIQRh2412h5X6zRAcVLKmb1xURinSWJCz737VezTBAb8E9alEDU57uK/+Tnonlj7z3I/OGQJiXKkO4YXOTHHElD3F7esMBfJ5bC8pzAEBrkzgYj5zweYJMRZBX2hO4qjz78naldU0G+vLBRur7W6VO2grTq6GeLcG2d/9Ps+YZh0UkI++TQKD6HWXQzrQu98uLN+wg2+XVtAx5Lx7zHqrdHb9adZj9m1Szg3pbONJXzqD4RxBzsKpiWm5iC57j+3L6fgF2qSNbxAyuYDBXhAhkhgPgAdIffmOYG61pw0KO731Ob75VKDDlnNBKmvSLCJky3KTlyZ1NOJBZPR1AnamN6b0AJwgpEG9EYcR92EGjbag1Ycg62omjegpUD/3pTuI2ept29ggdQEZ9glIHjCOKYZIV37grk3iyyeEm8+t3OyRAeG80PGXI2fdqPfvcwERLG6h5vBUcjww3sGkJTVlSfWqH1/dJiwEofTxJmFsYXRTZw
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8562.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?F9eURz4evr3zdFQg0P4KnXiBsJ8qm5uF9T9K7KJxKVbHsfeUX1rEUyX0wCT2?=
 =?us-ascii?Q?iFpnrvhR++M4hwWLqxwVPol4BY1x4IelzeqRvTI5vq9odT9LV1lBwZRGeSOd?=
 =?us-ascii?Q?o12zrDxTOmBvdAoMk89ja4bp65XnLyj/elKxYSkgJtkh9rzGITL0yEN67rBo?=
 =?us-ascii?Q?COwz4sSuVltthay0EbkAu8EqbCEbEmM8eSntgIc0npAf0PZjbuwpghTqqOU3?=
 =?us-ascii?Q?ak31pF/IpQca4exlfg5Uzf6kzYJSzU8zpGIZodRm5pQuIcbbMhGGv1kl8368?=
 =?us-ascii?Q?0oP1YLu1hKhCGa/FNDBOaXo3BqHhs/j8i3WFGWhJQ6j2bzdH+8FPgr8Llyzp?=
 =?us-ascii?Q?tKSOuNrkGILgOETreV8vRpYq3ZKSLNswj34X3rxYhuR+GKRRTX3RtPRzlu/G?=
 =?us-ascii?Q?QPcnpJ4lXXdTxbKdXVgJNQ2SlIDNtbXYx2SyE3zCjHOBuU46qILY8nG2ODCi?=
 =?us-ascii?Q?z8+6tjNTboxDAgV7lmzrGV0g4k94Ha16hszsB6amy+81BfKuzNVwwB1Ga2u0?=
 =?us-ascii?Q?jz5ML48UW4HLV3QaIP3VUbcB8ADbrjaMhKA/S91Vsg4z4TXVooITKF2W6Tnh?=
 =?us-ascii?Q?x5mh7UHYi3h5BkY+PTMfJSoQ24NN9L3COgQ8gvpQmiPMooNqJnw5cuOiAdKV?=
 =?us-ascii?Q?n44+DQ/0T5n1MPL+zqWQtBodLBN88dRZ6quYPitoZH8Q3ZsDwSnk9lv6AGWo?=
 =?us-ascii?Q?R/xxh5dXnO3uSlGapjcdQ+xx4szGUEQW0UKMEePE+4xSmM01YAWmUk+6t34O?=
 =?us-ascii?Q?zqv63NGiruuxdkjFdgV2u1E9IFu5oTADO6s+AJdunUJxr8n5v3UJrTPDDW22?=
 =?us-ascii?Q?hOIbcLeOfFuGOfLCdzXS1BIoYKplfmCeon3Ji+z3HNk41zFewnAcNukLAwto?=
 =?us-ascii?Q?VlBlFepIau7GpLjo2/9XJCayU47W8+9lDVQaYnCJPUPlXP+L/bZndSciyalD?=
 =?us-ascii?Q?dAJsuI4IlqOeQagk2sbyWbLf0N53QA69LOXM0rxg7Q1kw8QpsJ3FMJBR342M?=
 =?us-ascii?Q?GbjUimLVf+0kSRdOzvYtUxg3MQfIa2/LqBl0zRb0tifIS7jWWQGr5AYHke5C?=
 =?us-ascii?Q?EIKvfG+J5TnjE9Ruz0S80qNQI/XjQ79o5BMCHEfDyaly1OnPfqVkNxJFE5XZ?=
 =?us-ascii?Q?VcTrK+rne1DgFaCVfYXI5Y9Py1JCFkGeR+HtrqseXkhlHrleEPKW3a/hyu6J?=
 =?us-ascii?Q?zwNK0QNYkNG6a7essBFMwmJAMfQzV49sEf9dkbdLHYzbryX7RQfjXLal6FHZ?=
 =?us-ascii?Q?nSwekO1CofWC8vrlB8iI+pbE4RgEiCQAewanhh6CxeDMmYsGLyI7WFAEx/Tf?=
 =?us-ascii?Q?uIMO8diwmh/2YAASmVlggF6sJtrXTj95y/WNVyWYlUyDJEjz7HTBXWEa0fm0?=
 =?us-ascii?Q?k1Crhk7Qy4lwupPqltS3ICCxKjNKgiqRq/7aqUrMhZbna/phdXDQcqdG0GY2?=
 =?us-ascii?Q?H9RDxsmhYdoP52pVn8oK3r7WmSpJZ/b2Kc2/kYphgSxcOsCJeeASUvvXe8Oc?=
 =?us-ascii?Q?KO/AB7a/1/4BeRmI2o+VR+RAUwsKZOCLxXScpgvrWHhXZ3S1LrKmKBRlcqs4?=
 =?us-ascii?Q?utspOPdhDRTMtNxH2erS/+QTXP5Cy/QuVOPekA+wyCd6aj+W4oNN98MHvE+A?=
 =?us-ascii?Q?Xdp4bEV9Xp4x6nf6r/cm8c8smlBYAHHPTWGT03TVZdZMiocwqSYJn/FmPwCG?=
 =?us-ascii?Q?MS8LzIuPp80D9zVNicmbsa91YB8aB2zzFjT40RHE7ToqV+rEoLPjfNRrzHmj?=
 =?us-ascii?Q?xEzXh9pEvUeQeqAB94Z/LA7G7R7X1S8=3D?=
X-Exchange-RoutingPolicyChecked: 
	SEb1sFmSJN2k5yHAGrwOVjfFVIkprDeVADR7cH0ITH6qjeQz28X/55xiQs41XrQzEekDl00ZYy8jYVRtBC6aEEhOnQlO9dWrnJOUyqQ9dVxSijce/xzpQwGuYjaXMEm7oHS38aexWQ1d+ovUoYkrha8O2XuEUTwIpor94exGPUpw8Wu+nE0VUzcUZkAndwQ9g01hJVjJEfiRFQo9N87KSSVdGNnNXrvYoWIbuNjXJ1T7Be5xkEcTBc6qB+3avRVL7qnmPlvY5osYrnFbn605+8tKWVQhYj5iL9fqxnv7z0v9Bp3/bnhufXDFzq9HRzIjXyhQDFltLsSCiYiRHoyhnA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3fc80f7-f562-4fde-8bd0-08de89a53b6e
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8562.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 12:59:49.5087
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MMeMZjawtVjhSjMvjtNqOrtRiIrhKSnHZuhfoW26gCo/YDhkqDmphDyjiEZ+CkOMLvUZMTUPF742hIcsuhMk3L56H1fIKL0Gs9gKeW3X6R8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7297
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDEwMyBTYWx0ZWRfXxIWcU/lrlZNL
 n1xus014is38inXlKpPfv7YwIWFQd/3umuUo5Zrrmsp2slZzNskNBP/9HjpBfmgcoAPAPytUu4K
 PjmJWzrAs8z+OLNZbZhe99ErXv9wRpb76CyG0S5uJnwbN+9WonblKJAZsbPz8y3uGlOcdIi/TVs
 qbkUCg+8ssAPyKS2aE7/ieGN0qqZ2BUtvb5iwqAVsIfKJBeGMP7s2h7noH9put05/Qb9PeKMk7U
 j6xzztoVUS4aKqj4DH+v+NY/L/3+5F50V2F/fOXPjPruvymEA8NGXLO3XHllpqq3eRHElbiw07l
 M/j41xjUMJ6Z6yRN/tBI9YeXq1K54pasLotHoGHDSV4J6mZ7rxg/UV6l7yAmlxbSSW1scNPjiXG
 fML/hW5uQW/F/tPlJUFeb4QmMu2zKAwE5lNrzh5Usdkxlm19B20k/4MVQoR+g+DN7IOq6HOsD+M
 vn7XX+nlEomEoDxOysw==
X-Authority-Analysis: v=2.4 cv=Q5vfIo2a c=1 sm=1 tr=0 ts=69c28ac7 cx=c_pps
 a=cAYAfY5XwGGlFG+HVYY7CQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=O24Aq5uEAAAA:8
 a=t7CeM3EgAAAA:8 a=Rj8fB8i0jaicrVXhGCMA:9 a=SYBONWESK5muIIdMMRMZ:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: ws2SD333BIMv3A8QKWaqouQ3rFGXyO1J
X-Proofpoint-GUID: ws2SD333BIMv3A8QKWaqouQ3rFGXyO1J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_03,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 clxscore=1015 phishscore=0
 adultscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603240103
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Mar 2026 12:59:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125565

From: Zhang Peng <peng.zhang1.cn@windriver.com>

Changelog:
https://gitlab.xfce.org/xfce/xfce4-panel/-/tags/xfce4-panel-4.21.1
https://gitlab.xfce.org/xfce/xfce4-panel/-/tags/xfce4-panel-4.21.0
https://gitlab.xfce.org/xfce/xfce4-panel/-/tags/xfce4-panel-4.20.7
https://gitlab.xfce.org/xfce/xfce4-panel/-/tags/xfce4-panel-4.20.6
https://gitlab.xfce.org/xfce/xfce4-panel/-/tags/xfce4-panel-4.20.5
https://gitlab.xfce.org/xfce/xfce4-panel/-/tags/xfce4-panel-4.20.4
https://gitlab.xfce.org/xfce/xfce4-panel/-/tags/xfce4-panel-4.20.3
https://gitlab.xfce.org/xfce/xfce4-panel/-/tags/xfce4-panel-4.20.2

Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
---
 ...splay-full-path-in-generated-headers.patch | 36 +++++++++++++++++++
 ...-panel_4.20.1.bb => xfce4-panel_4.21.1.bb} |  9 +++--
 2 files changed, 43 insertions(+), 2 deletions(-)
 create mode 100644 meta-xfce/recipes-xfce/xfce4-panel/files/0001-build-Do-not-display-full-path-in-generated-headers.patch
 rename meta-xfce/recipes-xfce/xfce4-panel/{xfce4-panel_4.20.1.bb => xfce4-panel_4.21.1.bb} (84%)

diff --git a/meta-xfce/recipes-xfce/xfce4-panel/files/0001-build-Do-not-display-full-path-in-generated-headers.patch b/meta-xfce/recipes-xfce/xfce4-panel/files/0001-build-Do-not-display-full-path-in-generated-headers.patch
new file mode 100644
index 0000000000..34ec80b47e
--- /dev/null
+++ b/meta-xfce/recipes-xfce/xfce4-panel/files/0001-build-Do-not-display-full-path-in-generated-headers.patch
@@ -0,0 +1,36 @@
+From 61f40b65637695abe9d9e2f80ca99d3c076c96e8 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Ga=C3=ABl=20Bonithon?= <gael@xfce.org>
+Date: Mon, 16 Mar 2026 16:31:23 +0100
+Subject: [PATCH] build: Do not display full path in generated headers
+
+Upstream-Status: Backport [https://gitlab.xfce.org/xfce/xfce4-panel/-/commit/61f40b65637695abe9d9e2f80ca99d3c076c96e8]
+
+Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
+---
+ libxfce4panel/meson.build | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/libxfce4panel/meson.build b/libxfce4panel/meson.build
+index 38d8ad198..3fee75d58 100644
+--- a/libxfce4panel/meson.build
++++ b/libxfce4panel/meson.build
+@@ -67,7 +67,7 @@ libpanel_enums += gnome.mkenums(
+   install_dir: libpanel_install_dir,
+   sources: libpanel_headers,
+   fhead: '#if !defined(_LIBXFCE4PANEL_INSIDE_LIBXFCE4PANEL_H) && !defined(LIBXFCE4PANEL_COMPILATION)\n#error "Only <libxfce4panel/libxfce4panel.h> can be included directly, this file may disappear or change contents"\n#endif\n\n#ifndef __LIBXFCE4PANEL_ENUM_TYPES_H__\n#define __LIBXFCE4PANEL_ENUM_TYPES_H__\n#include <glib-object.h>\nG_BEGIN_DECLS\n',
+-  fprod: '/* enumerations from "@filename@" */\n',
++  fprod: '/* enumerations from "@basename@" */\n',
+   vhead: 'GType @enum_name@_get_type (void) G_GNUC_CONST;\n#define XFCE_TYPE_@ENUMSHORT@ (@enum_name@_get_type())\n',
+   ftail: 'G_END_DECLS\n\n#endif /* !__LIBXFCE4PANEL_ENUM_TYPES_H__ */',
+ )
+@@ -76,7 +76,7 @@ libpanel_enums += gnome.mkenums(
+   install_header: false,
+   sources: libpanel_headers,
+   fhead: '#include "libxfce4panel-enums.h"\n#include "libxfce4panel-enum-types.h"\n\n#include "libxfce4panel-visibility.h"',
+-  fprod: '\n/* enumerations from "@filename@" */',
++  fprod: '\n/* enumerations from "@basename@" */',
+   vhead: 'GType\n@enum_name@_get_type (void)\n{\n\tstatic GType type = 0;\n\tif (type == 0) {\n\tstatic const G@Type@Value values[] = {',
+   vprod: '\t{ @VALUENAME@, "@VALUENAME@", "@valuenick@" },',
+   vtail: '\t{ 0, NULL, NULL }\n\t};\n\ttype = g_@type@_register_static ("@EnumName@", values);\n  }\n\treturn type;\n}\n',
+--
+2.34.1
diff --git a/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.20.1.bb b/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.21.1.bb
similarity index 84%
rename from meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.20.1.bb
rename to meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.21.1.bb
index fdfe39014a..b3cf4b2559 100644
--- a/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.20.1.bb
+++ b/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.21.1.bb
@@ -7,6 +7,10 @@ DEPENDS = "garcon exo gtk+3 cairo virtual/libx11 libxfce4windowing libxml2 \
            libwnck3 vala-native \
            "
 
+XFCE_COMPRESS_TYPE = "xz"
+XFCEBASEBUILDCLASS = "meson"
+GTKDOC_MESON_OPTION = "gtk-doc"
+
 inherit xfce gtk-doc gobject-introspection features_check mime-xdg
 
 REQUIRED_DISTRO_FEATURES = "x11"
@@ -14,10 +18,11 @@ REQUIRED_DISTRO_FEATURES = "x11"
 SRC_URI += " \
     file://0001-windowmenu-do-not-display-desktop-icon-when-no-windo.patch \
     file://0002-use-lxdm-to-replace-dm-tool.patch \
+    file://0001-build-Do-not-display-full-path-in-generated-headers.patch \
 "
-SRC_URI[sha256sum] = "5a7c8097527555640ab3d00307505c7c1b7302d11d92874f88842ea969483519"
+SRC_URI[sha256sum] = "c940dae515bef4af08a126011d2fd873ce99e815157ba8cef5332195bb60e51e"
 
-EXTRA_OECONF += "--disable-vala GDBUS_CODEGEN=${STAGING_BINDIR_NATIVE}/gdbus-codegen"
+EXTRA_OEMESON += "-Dvala=disabled"
 
 python populate_packages:prepend() {
     plugin_dir = d.expand('${libdir}/xfce4/panel/plugins/')
-- 
2.34.1


