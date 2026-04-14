Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76388FB518A
	for <webhook@archiver.kernel.org>; Tue, 14 Apr 2026 07:55:52 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13675.1776153343213668307
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Apr 2026 00:55:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=LfcrClqM;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=85647f3f2e=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63E1kV2I3377126
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Apr 2026 07:55:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=DZ580n532f2O5H+n7vDk
	16iOs9F0iE9A3APR8S4t7Rg=; b=LfcrClqM882qrswcg17pMNh9pKJfuTTApTcx
	2v6iICKbfjV/r5bCAZW29H+wF5YYhQGaeaJbV/lzJNdkBv5k9tvtbYa9ZzOiXDXB
	Xou3YT7RofQQo4Nfl+mU8wnOcVHZy9GEnil+9w8r4mm/0y0+Os+NyCg7HHTRVEgv
	EPCzetSwU02TIyFT7VxbC+NUjgka4fnBc6MQ471ZSR1SnTvQy/oBbw5LYYxEC0jh
	8F6535B2ujWDzZ7JE9OFP70SNSB2+YxP1tOExf67KQqttZ9sssxJ0jesW8SbCK6f
	ttxkwBTsog8BT9U55VNaZ4APPcaVYwlrx7b7aD+OrIokSWzrLw==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012066.outbound.protection.outlook.com [40.93.195.66])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dh87a8ejh-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Apr 2026 07:55:42 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ogP8OfsTHWc8R63T/vNP9o16xgbgW9I1wXs95TT1SIkV5H6pHOfolEl5g7GvqlGzqMVHtcZvEblTCgxgMiqFNwc3n9c4xsi9t4PCPHuI6krhjXSZdTcdUUV6qxc4brhGjqZKDTjeKm/vJ3MESMeObMsS026jHLPBwCvwKaQxHTadb/yIQKvPt+NYwRuHjBXM2YRsm4X2jQWX4cR5gS19l/pqJzjCaMlsTzhpgQBRg4/WubbZG9A/p+wfyBNOYe4Mzrx6xpLMaHGH+rDLspsRGgqcIdI8IvcauknMORju65XD+leaZZxqbz86P3UZ63HyT5mq6/pht+YKqR8d0h5tjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DZ580n532f2O5H+n7vDk16iOs9F0iE9A3APR8S4t7Rg=;
 b=bWbK6osh8kXoSbVKF1uDpJsgdf+1XIawIlx3a+T4RyajafmYUWKqeMVdEjMOAwQj2IQAgkwDBMee4sdywbv3pM+1x4meufbLvXIBy2Cf5K4HsXqgUQRaXGDwCn7rBIf9om55ZMxnHU8JF0B6KnouT+ihm09jY7VRkbFYCZZVsPlo13LZCQ1vr5XaJtgAuP5X0ZZHJiv4gxm0wvWg4evFChseWMBfrQHyaAXb1GCQRx/4LwoeZR1gaW8xgrbzEKxdsKWYlsHWFO++SNiXm4SphflzwIjw5WYJ3dI/Hg6fqvsptRqQiwsXcGMgYF58yPIi3osoAdey84TVT/Vf+6EaUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by LVUPR11MB9786.namprd11.prod.outlook.com (2603:10b6:408:39c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Tue, 14 Apr
 2026 07:55:39 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6%5]) with mapi id 15.20.9818.017; Tue, 14 Apr 2026
 07:55:39 +0000
From: Changqing Li <changqing.li@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 1/7] gtkmm4: remove x11 from REQUIRED_DISTRO_FEATURES
Date: Tue, 14 Apr 2026 15:55:15 +0800
Message-Id: <20260414075521.91846-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0092.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c2::9) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|LVUPR11MB9786:EE_
X-MS-Office365-Filtering-Correlation-Id: b4b90805-c9c5-4152-868f-08de99fb381b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	A04ecX4PlChCwVrZ+dBM1WQfGDNMsB0aBXDNFYPOjtFvwrdmH28sSeAFN+H8aj7UgI7oAUD5NvE3/fQDqTn0nM3eNkqBeES8KxTWcAo+UZNWUCTe/Dwb2EZqiLsSFASVRoktyMHJX/2DIP26dII7DLf1fFrf67ZcGREUHVQqra+IrgadDdDX4LvhacQk+IHfrId8AEwo8VuOGxGvjQ08hlNzaPbLF2HD942o79CxTlVWHp7bQ7TXctOLGCruK4gLNNluD7kaZz0d1DMqaRUkTy5GusOzU31wvS7zatiaKBLjf/uG4O2KYYuXWoRJwBr5o0jQ/soTZW+z0BArna4gYWpjC/16jkzX7sg4C3ZN5yG0TXEag6LA6eMdGJU4Hk2p68JL8WPOwYUhrSQ1t9DpMOYGnl6K7AwLuOd4TzfHL0WSQf7A/0reW1oUT5XO828AZrMsAbaprQnA+nt1fPzUGHvTTcWPdYhINSF4g+/DGn+nVKrlyZWrGmBMLyrkbeEhDfoIpPJNSoRTP/zZ/GJ9fqHsrABBEmNs/s9NkBerGGCtYXlhHlr7iQzv/h6DeJvrv1x6Wff827QYhI5HbTPXtiRs97RmK+lPj83PvC2Lh0k9UOHajn8PhAiIJ0jxGUJF+h9wr+Hjce5XQySXSr2C7zYw1PktsXqMoK65V83G7ZeTfkfti1rqlFMI1cJCwTUDzKOigReh1MVrhsmmWiJ4jiUXamXK7n4as7ADihbRqGCLWvVeS6g4lqYerBTCJO44
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?6TeUvV18dW8yqyGEKIdR1Q3/WabUaRv1RBOfb4gUxdBgJIpcVrPyqJKZ9X9D?=
 =?us-ascii?Q?tTNYDw+H5lYSW4mIgtDABCI0MDT8nOq0EqvpiBDicS8U5DYV5Xxj3Fu1GVA9?=
 =?us-ascii?Q?soX4leKgZbNRNeCrm+t0bW/zOv4Bz06CYGJ72itWP4sVgKo7cRw9nWVEm4yq?=
 =?us-ascii?Q?LhQXlCpMsWC7480uXmACztdYz+bbF3SFapeO9xqtXQ2LsD+3kmyYiwT0cvzs?=
 =?us-ascii?Q?SsxCwaPfX1YCcZ5HnVdsS7AvxSYPrLN8+5IfVCwOl+PfOksl9cxwwEKvc1yO?=
 =?us-ascii?Q?qQjQ/VJYnzLtb6ixZPWZLff3GGfJMNv4wyQHx5aBkfN2Z3eeCbrOf98lPxwF?=
 =?us-ascii?Q?e0INJoh0E0A4cWVevJhVr8zo5N1B5wFTTh6HwXNfsSi1bZf6ZRUoDfrff78Q?=
 =?us-ascii?Q?tJDDwJSuklaaVjG7g0w0VTs7jLt/KLJOBRHhWyoAFzom9wv8QtLeCsPuf/jJ?=
 =?us-ascii?Q?K3YjA8FD2ergn6hlZKL81MZXDjCuRbsGtM7FVghwm9izErvy4ZUwksxRJGmr?=
 =?us-ascii?Q?GhkUAY44aXqjBOvujOd3SZxd/2ixngsnvGxhdCd+rd7uDe6r0ukKkrnObgo0?=
 =?us-ascii?Q?kiaBK2lTedaCQPGDoioB86vEzFVaJ7t3C8QwaHvkpiulUJkUgrUoCPHb2OxE?=
 =?us-ascii?Q?Vr8AXusMXNax3I/jAwp2ma6rUi6uAR77Y0ZNiHcz2rvuwRAvsppWyHmJXWNe?=
 =?us-ascii?Q?JotEDRyP1gB6fQY08fRlX1XiyOJhauuOd8Gguu/pAdfXZCiCwA1xi2Ru8LU3?=
 =?us-ascii?Q?I547thafUXGm5EafRsmtZl17innUM19nRun0JGHfALhSVL1qwbOMjOIy1iwZ?=
 =?us-ascii?Q?/VvZj9C8Fa4K5OE5xI04MadKQh+UueLuKRp9c0X0rofOfVvUGZ+qEzMLWUX+?=
 =?us-ascii?Q?bWFENHmiG6hhRzFYX6n7CwhrAXMrsaBXmMYuzWYBByyvd91qp02GEaIgj9mv?=
 =?us-ascii?Q?9XGUYim6HZZMMmHK32M/fX0GSl703LzfQg23Q5QIgy+TEVbpTwM+I83iSjGl?=
 =?us-ascii?Q?hdsmVaCJCXWdgJ+wGxONlnFGapt3SM1AzsRhIrj+ck6B8s6nOm3MBEeRQ/4h?=
 =?us-ascii?Q?E1vHYCKnGOQuEPu6erZDFznoetWSLt1ZT5YRrT7/3q9g/HfW3QUx4HfE7Qe6?=
 =?us-ascii?Q?92SZMr7c5kWUvQ955Jxjte4kh4y9uyWUSfWe5+CVyJm2avAoAiUO07xBKfI3?=
 =?us-ascii?Q?ffqq56Zq9LlJADLlXiETxnHllkLunxu/UEfDZsnG6ruPftfJmYC8IIyGimJq?=
 =?us-ascii?Q?ShcAKJw/na/WESUXPKsx1FK2Xvl5wZzqQz+ESfJZefXj6YjL+h6NrZrzd+gO?=
 =?us-ascii?Q?bG2ZSOVZ4ZfOf0pvmrDYzVsJJwVgqUbAE7u0A8jR7IMr2KnkGj3Pi/sawX9c?=
 =?us-ascii?Q?lr0MJ+dz6UeRx4d8OrNUIaI1e7L90oxKwwu58yZEqMId0e+b7lGvNONZAyDn?=
 =?us-ascii?Q?BD3guib0Mj8tVWXc9xXpYdCMvvOBu9tGMGNeejG7G+FupYW4Xvlusrn5GA5p?=
 =?us-ascii?Q?fuppZHBQIg7sKjG0MsZdCZCGyYkCg89Y6tQVZAk7dZLqw3nM7/rvV6QkelqZ?=
 =?us-ascii?Q?Yjk3mxifho9oOOo+p7doqhAIwoHt3tyGGt1RFND+amBOuNNWOFNjwqEBBtBn?=
 =?us-ascii?Q?gXPhitIZRv35xJWgItP1y5rhOQ/LIMQQT+1GMrMjMbXwQa7qBas4/zpcfZIT?=
 =?us-ascii?Q?18FeVh3pi4nEUxIzn7ezjW+Zr7NZgDV1vDKTaP/UYeCQufs+fed8I4gpHpZ9?=
 =?us-ascii?Q?qr2FyhiexczRVo5mzEQpLoCiXjO2p4M=3D?=
X-Exchange-RoutingPolicyChecked: 
	v8s+kpZHmH4i2Ne1bhtGpFppReY1YiGQvH+zC9ewruccgYRdVgsW7MJou1BwZWsMmip00vZnG9qBiWfS1+319wfYrjYfFaNqQG2ulmdkhpJidm3Iv3kfjvxHWh1O1jccdzQXXJZ8eik9BAnh4CeUINlapsjAx2XirJMCNhxoUDj4yCQM+i7o0e1MMYB6bQ4y9nVpegbgDWcSOkL/TJWzI1Vzv7ufNVZSJs1QVm1Zwo4/GkU2YU5bWoVlO5s0+6iTsrPuCLL07/v9j0wTxqRIBAOa9fP0DJQBIGX9KULlovx1Cm2l4ge15g3Od9Qd35IFkJ63TfJxj+Sko9We5nQVRg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4b90805-c9c5-4152-868f-08de99fb381b
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2026 07:55:39.3649
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BDRCCzn7nOTasP62JbbKDLe6JPPgfplm0SSX/47kJuT5TUwN5W8Kcl6ooiEyz2dVQ9MKVDD2OrRnpQB6AgUnh82/sf5Aj+FyJ9MlMpzfo0U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LVUPR11MB9786
X-Proofpoint-GUID: dTVEvLumQeJg48g4lU3qpF5LTAx5ZQRg
X-Authority-Analysis: v=2.4 cv=Q4jiJY2a c=1 sm=1 tr=0 ts=69ddf2fe cx=c_pps
 a=T5SYj2RWWwK9pVLeGBda9g==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=GHR8O2WEAAAA:20
 a=t7CeM3EgAAAA:8 a=8h_biSVXYdKYdOtk1L4A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: dTVEvLumQeJg48g4lU3qpF5LTAx5ZQRg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDA3MiBTYWx0ZWRfX8RSNRU/oy9vs
 A+XxaVAwriQoG+4knLWbSx6SYkJkyH+7msoj0SmvBtCNOY9Dj9noWyjdxyKr3jdG8u9wXD3udwo
 byc9jArtoAAQ8PRzKppGIJiMJXA+XXOgm2YRDXjtG4VHiVDnv2BBTs1XLlDe1KR8zXSOU6YI+dh
 I9So3uB2Y40/LQdiZsc3YB8eJJnqKu23DPpuEXtvQGJJtZuhKZzWqkZ4piujnEbQAJJZJwSRk+m
 gfxoKbZhHqCo0CDcEXCkCnBHiylXlu68V3MjLqKEsTybsXLpg0Zo3DEYhIT1dAUF1iZgEVHfuJ4
 JK4wSNKN9Rzp9AQYLU8EKvg/1eglqDyQx/L7d/Ff5J22tqVLsV94w2n/lsSqe5VHI8vRdVdBzwK
 Tno+1hAYaUOUGXGZ1GvDknVhWv4S1882JJPqBd9DrIHLF5dhYddyHykZIEr2QMbUWJ5aP5c8gm4
 /GWxmlO5jeEHzNyCLiA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_02,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140072
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Apr 2026 07:55:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126298

We add x11 into REQUIRED_DISTRO_FEATURES because one of the dependency
atkmm requires x11, refer [1], remove atkmm from dependency, and remove
x11 from REQUIRED_DISTRO_FEATURES

[1] https://gitlab.gnome.org/GNOME/gtkmm/-/commit/0fc81d346f50bfc30f6fb78afe6a15331c5a8790

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta-oe/recipes-gnome/gtk+/gtkmm4_4.20.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-gnome/gtk+/gtkmm4_4.20.0.bb b/meta-oe/recipes-gnome/gtk+/gtkmm4_4.20.0.bb
index 0e08bed8a1..e0b91f02a9 100644
--- a/meta-oe/recipes-gnome/gtk+/gtkmm4_4.20.0.bb
+++ b/meta-oe/recipes-gnome/gtk+/gtkmm4_4.20.0.bb
@@ -8,13 +8,13 @@ LIC_FILES_CHKSUM = " \
 	file://COPYING.tools;md5=570a9b3749dd0463a1778803b12a6dce \
 "
 
-DEPENDS = "glib-2.0-native atkmm pangomm-2.48 glibmm gtk4 cairomm-1.16 gdk-pixbuf-native"
+DEPENDS = "glib-2.0-native pangomm-2.48 glibmm gtk4 cairomm-1.16 gdk-pixbuf-native"
 
 GNOMEBN = "gtkmm"
 
 inherit gnomebase features_check
 
-REQUIRED_DISTRO_FEATURES = "opengl x11"
+REQUIRED_DISTRO_FEATURES = "opengl"
 
 SRC_URI[archive.sha256sum] = "daad9bf9b70f90975f91781fc7a656c923a91374261f576c883cd3aebd59c833"
 
-- 
2.34.1


