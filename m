Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AB7CD59F6D
	for <webhook@archiver.kernel.org>; Sat, 13 Dec 2025 06:32:38 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1115.1765607549297665299
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Dec 2025 22:32:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=cmJDW5+U;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=44421a18bf=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BD66MAF1573589
	for <openembedded-devel@lists.openembedded.org>; Sat, 13 Dec 2025 06:32:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=Gi9y5VJ7V
	du/6oWZbq/00HnVQUzqeScwhTFi5utAnGY=; b=cmJDW5+Ujsf/4Np8JN/dePb+T
	HU8WW8X/jyotUDq3koULbPDoTIOeHXVOsGxuAOQKqpXRjg7+3kD19abVT7NyHZpH
	gPQIVqhXY3q294irLVFlabbvHb102+Dxb9V5UX5R/Mjla0JNb5rlyiIxqMoE712a
	2dpZKTYPcpKYc+IbXYv4yCvSychSBOiZJfGg4g7blDM89OVovVAxSD0jXFe02qE9
	PWwmzIYbtJrCGgPU6G2QdndDq91oqkCLgfj3AgPWpbckw+8K7/iILOXgNTuNfKHo
	af8a2TDtwn6ZhRiPy7MRiBijFI5PBBBYVDk+3exlSXzWvq0P8MwEQkOzzYZPg==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012054.outbound.protection.outlook.com [40.107.200.54])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4b0y4883yc-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sat, 13 Dec 2025 06:32:27 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jzd2PoOFyglgvBSiuRFaAlZoGu+1Sss3nFrBj2MZTM5d66TRhtIe7d0x96bP8eL2yzMt4dr2I2AAF11bhIRkpU9ryN8YDbKJuE8P0+0CZ88KqMeKO7navkJfz6BLLnW/9qBdOZWYS+WnyAxqj7PEkLs/qJc8L/3XtqfK9Gba8gwFWYh+jwrsj3XS2utzHDUDn8dda3o2GLA8KJokjeJQ6/FvS1xqGt3BUaxo9oufFFBBOydmXo7e6dzalbtBgETD0vnMAJRu3qKYpS6d9fEQNwoSW/vpVxmP6+17d6bzT5HXd6lsQPh4ftJuUC3k5HpKFmoV344qhkH0fb0efX5Gnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gi9y5VJ7Vdu/6oWZbq/00HnVQUzqeScwhTFi5utAnGY=;
 b=SAdon8E9mljjThjvsQB4F6f+TNuSHExqiwx+W1aNLhu2rYiaQsFkb9ibHkdEG1XzMKWvRExlXSXVMorDMozJMmXERyiUTCKR0r4knmqukIgZtc0xV4U74HG2BQV8pAw0yHLPSaOObJN0nvD9X4VeiWdRxoRWdT3SRHxMIsFt/JOO8z7Ci2oKSm+r2+23zdnRK9EN0ckDamOwYBoTv6pNWteIab45IufRF4avwX1TRJ8O3A5so5bj3BQw2z3a/CDj8Xq7a/ICJdSB5SEyN04Tp55GCLifsIj3YFiUP6k1yOga6+UZWrTiDuNMYSBIawZY6iyB8VLFqS7hY9s+JrxL7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by SA1PR11MB6685.namprd11.prod.outlook.com (2603:10b6:806:258::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.10; Sat, 13 Dec
 2025 06:32:25 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%5]) with mapi id 15.20.9412.011; Sat, 13 Dec 2025
 06:32:25 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-devel@lists.openembedded.org
Cc: Deepesh.Varatharajan@windriver.com
Subject: [meta-oe][PATCH v2] ripgrep: limit libstd-rs DEPENDS to class-target
Date: Fri, 12 Dec 2025 22:32:07 -0800
Message-ID: <20251213063207.3865845-1-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR21CA0004.namprd21.prod.outlook.com
 (2603:10b6:a03:114::14) To SJ0PR11MB5648.namprd11.prod.outlook.com
 (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|SA1PR11MB6685:EE_
X-MS-Office365-Filtering-Correlation-Id: 700ea21c-bb2d-47d2-2f34-08de3a11616f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?APvmU8wh+3x+BFeeILWQKO7G03nVmeN2G6p+5cpQF7VZravgu1+q4FX506LC?=
 =?us-ascii?Q?tfjsbH6jCwHAde6OGQLxZP6FsmFt6FrRNuLbJv+t6a+WtzB2c2yzZ/i3JEWn?=
 =?us-ascii?Q?ZhbGlvx/ZrWLu0k/XWp1rGv3Wnxrse9atMmcce7EXDpLQOFKGWC/fe0NbtcK?=
 =?us-ascii?Q?zeWrfKEY+MvV45XyvWfuU5O9NyLNlmNTlsHKaiL9qgpX/wFKbsikfDGrT2Be?=
 =?us-ascii?Q?bV57cZYV5GkNLsqy2DU6cjRD6bKkzgzvru2fZo5v8/cTw5L2Vgh2RauAExu3?=
 =?us-ascii?Q?qaFNiD/ysvKA+XagoPIHJCA3lYif4yFPlpd8G9aZETqgEdzjLuJb/2kra8oO?=
 =?us-ascii?Q?yRWfMlzgxFGjvLHRZ8oGVkvNJCEfPk5AGfu0K5s2xlRrSb5UgvNB6AvnMabg?=
 =?us-ascii?Q?BjYMN/zGZ6U0sXM21z/bzTaY2k4mP7Jrz7scMUqOzIK4NNmJOBkd0pNYmRLA?=
 =?us-ascii?Q?BeVBFKeOSbukMzq17IoyV7j5ILvi9BeUj9JibWnFZ0oGmv+EpxXpXeDvKnjX?=
 =?us-ascii?Q?w4KiLXpF5gyQsuijBr8I7/1qAL1KYHhL+fQMdcmW9N+KJzyX57ZwLDiqofq0?=
 =?us-ascii?Q?vCng7d1jQmSf0YaRs+9ndIUZM/ne23g2glr/4+3UR6HQEFw0oyymNGywCBcD?=
 =?us-ascii?Q?BePO76yHDMmWrk7bf8p/ixOaG0ijRGS+w6YQ82RpSm3BB0qB0h0qDvkurs1m?=
 =?us-ascii?Q?+qNJksDpcKUb63YXrztsSv5hgxoJnOUOFoKYnHnKfipUfe58Gj3daDI03Brj?=
 =?us-ascii?Q?Fg2WkWHYzIo6TKQko5wt8tSYpTEGmo8QwqdXtS299uVVInlWsHfNIGhHO2RM?=
 =?us-ascii?Q?LA7Pj+QBfOwTXx2g3cLroe8PMnlMmwDMRjjWLdP5I1ooJWte7Nmgd04iizC2?=
 =?us-ascii?Q?xlnmLziWYE5w9KvB9CAdGkMUQfij4Eh/VIGJ8YBm7V6Wh6qz7dHYsk2NyFSb?=
 =?us-ascii?Q?rPRxU/d0PY3GyJFTSIqBBw4r+E3s7AwkhEYDeQkJBxGltuBgvaBVRKhUCz8q?=
 =?us-ascii?Q?UsPgwaqSx1IZeds9yY8Qjo/9wf9bDHxL7V98ehb3IeB2g6e8QlU41XwP5A3Y?=
 =?us-ascii?Q?a5yDHT6YxsO1RI30nZgsTCvV4PF6LfEOrRC5Zsf+Ctxnw4se1aysujnE1iNF?=
 =?us-ascii?Q?sjAOR/gNlZjLVuVO+vhXNFM2Se29NaPzx0R6W4dCroj42XukAnfaLH8DZyTF?=
 =?us-ascii?Q?lB4mo9xJShx/ulTMWfxcl/z4kAHg0g675i/fEfrsncAAXS+BtSg6ytdnoptN?=
 =?us-ascii?Q?pyeZpn7e4MW4m6GO1aksHJJZgHFFtdjUB9BFfmu4Q5QGFpIbrImB6SIL1Dva?=
 =?us-ascii?Q?/M1r9cmIFEEkHvI41fBmBK+n4s657hwqM7DCHpArCA5uQCGWxrn7+lLoL/J0?=
 =?us-ascii?Q?E3vPE01X3jG8dBvFLD4sxrnIaaoJydm0o61SdCXEpDsKoGHyLFbKQe3Ndrv6?=
 =?us-ascii?Q?obkwyh1IudTzsVjHSVvrwAd6qKr4fwigzf3arLMuhGFSPG3f0TVQqgQWfxNK?=
 =?us-ascii?Q?CpCt1U0H3/6wmbqXpEpJTPqa7f5jyjGoq3r1?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?lNMFC0wqJvDuHCBb6dSI6YXqCyHXu8oILDoFRz6L/IzdL+MAhKCfsf1i+nGA?=
 =?us-ascii?Q?7uHbGP3JyJYfpQT8IpP/ketoreOYoeEPSReGmAoaX5QgdG/7BkBO0+GojUD0?=
 =?us-ascii?Q?Thq4d5dHR2XvQyMt+ksjrZdrjCAT8XA1e9bBsPBLlzDWuAMHPVnaBPBesd4Q?=
 =?us-ascii?Q?rxAIUDwYwwTiBim6zKQ3lIZZjCgqVZrzMm/WiuODPWK1CywA3QZiuVamqb0K?=
 =?us-ascii?Q?evznzCFpQ4L766yMyegNxrrDqHgshP3fFIMxNiXubrnG335tBBmvgxP1VAFW?=
 =?us-ascii?Q?0GNDfRPRxUQYBs2A4QWVNjHwUcbj9o/2amtfhrhg2Gt7lnFY+Tl24eNAYz+I?=
 =?us-ascii?Q?uM/HTwRASp4xNq7b/EvOCt8rj4WmsKoRozu0m564b2GnxgrtKNEgmMkCD63i?=
 =?us-ascii?Q?y1/HawUoku3UgY4Rs4+msjOok6hDN2/83A21S4HkS/O7VEl+Z13dw4QvMUmY?=
 =?us-ascii?Q?9jENw0xbZq1FFzDuCRxMgeY1Hq2vTlNXXO5J47HY7DiCCFOi6OfVcVeMJXcZ?=
 =?us-ascii?Q?/YzeycDlxaiQS8+l20xTJIuoHkLDLu6qw3cpfuWbpe6QEzIkBRL8dXVrM7CW?=
 =?us-ascii?Q?5Jhzv7+W+SIAOzlxUUoJSPIZC2ub+qWAwgnrIaTHFasE1UZiDbjZ65dZm1qR?=
 =?us-ascii?Q?yGtBJ5EK3amSIv3wQu+X/naMvD5JpXgQds//GkfItfX1IVJgIU12dsU1JRei?=
 =?us-ascii?Q?Y1kj6hIqe0m5jQv7Gs3uqURv4wTJoMYYI9W5wO3wqJ7L8q5Uw+V5tqdWW+xV?=
 =?us-ascii?Q?17o2IX1CXUi+2Y3OrAgsSP/jIDVajmnOvdOkmuxuXqsUzRXE4yUyhy1N3cFO?=
 =?us-ascii?Q?fdh1Da/ksQ8yeHkJq/8doqaiX2ZI5W+tPRKgCba+TFNqHlNVNBfWU92LZtkS?=
 =?us-ascii?Q?q3UPDVGbSOrqDYxb9f+0Yjhw6X6SxSShCbFEiPmyhbld3ZwJ9tbVXSMmIFZT?=
 =?us-ascii?Q?lCJ1lipRN/fi8+2jeEWvwlOIIHq0qbp1l2woCnkNnH69es0ghajiUi6Lbi58?=
 =?us-ascii?Q?n3wDsiku+qzuR4QrxxhA90+UPcV3/o+hKGp9vY1I13RzBcxoM3sdLtaibbOT?=
 =?us-ascii?Q?fBfnchLp8uPrkfxl42jvvTrzlLQrOrD8/Rcjhk1NseZbzUnymarZyFPfbbWW?=
 =?us-ascii?Q?+4OpRn2IffRABIq3FRkb3NRDwDSkssGLGRGjiGGZOPlPvU3TkJ7curSkfX1h?=
 =?us-ascii?Q?lu8DETQCFLtjZ+VicgrzrwRCW+rZZMGbjUPrbBU1CHHTsuXPwsUVHhliRk11?=
 =?us-ascii?Q?ePW2DoEssGYzn21fuuRvziUhtnVxGAQBalUTkajNFnoVd8YeRdVDyA+XrfvK?=
 =?us-ascii?Q?/J0P5QNEGsLxTEVPF6lwqr2kRQh2N9PKFloFHFcg/U8XBczqC0ZsBV8IVF6V?=
 =?us-ascii?Q?7e6BU00rKnsnSpHV7Cecm+hhZUCSm930slBJ0FxCcXQUg+Pn/Mgz1/aWbfjF?=
 =?us-ascii?Q?aalrfg9ugYEYQgsZ+CQbF0E8zIxUWNc5uPbmXfAA1Ct71B3RMWfncXnsdIP1?=
 =?us-ascii?Q?gCO9+iHc1Nva1KR/f21a0QNkXXF5vIddHF4+fSO8zE8vkHJpKWmtycDuhk2S?=
 =?us-ascii?Q?N1yqv03iF7ItBMETjYCATsSOG8thbBivO9U84zgsd6VLUqxE3qNkUTTakEPF?=
 =?us-ascii?Q?S8i/PO7FruqRT3mmcg7Z4ws=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 700ea21c-bb2d-47d2-2f34-08de3a11616f
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2025 06:32:25.8041
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ljE+u4kC72jhI2AtTaQMEqTNzUHGdMtMYTlQYH/63s5sVxhBqR0qhUWE7OnayzDoOme5WZAfeUMcyb1Q+oLpo+3+bORzgfUTTeEHyrNcUEm0ew98AkPp9rnle015mG1a
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6685
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEzMDA1MiBTYWx0ZWRfX7i0XgxWbmcC7
 0nK+qEhSaWcLN5b6gu4TUlSM9U9wsS6Kx5ewWydnAtTTPDV74DJIhtDtl0U5sriqN2IdUtLE6FW
 /bb17fZNI7medgBKhhLH4/DSgroBHINkHbtsZ2kuPlLxQVMmS6BjVmpMcyYhXG6GzoSvgJZZVya
 c16d57Awmxxy7K/ImXKbeeswuz4AuYIxQ8Po7sMyn+I736ow+pt6fiRrG0OJ5oBY8ZaPyQhZWj+
 pEm5WoNQ4Rb8MbeyotfP9w4UHnaOcVglgsR1KBxsEutp6yRPGcyyPU/hltiAIzc3MI3lUdyHxjB
 /EQzSF3Mec2aYgcBDuAFwQaJvkiBt5ZiYb+/POuSpk/x3Vt835bo/JMHhp96YgORTcyNjjBOBa0
 zcwE2z7SNJxR4JhYZsKkzhdJ/cu26A==
X-Proofpoint-GUID: YFq4pH3tZAJ5TQBLdJYuYSYwvoBtCCrF
X-Proofpoint-ORIG-GUID: YFq4pH3tZAJ5TQBLdJYuYSYwvoBtCCrF
X-Authority-Analysis: v=2.4 cv=e5ILiKp/ c=1 sm=1 tr=0 ts=693d087c cx=c_pps
 a=tYoGMRiLV1KbapjTPXDBcg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=WKhaYVCdWR8uvccLi7oA:9 a=zZCYzV9kfG8A:10
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-13_01,2025-12-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512130052
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 13 Dec 2025 06:32:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122633

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

Avoid pulling in a non-existent libstd-rs-native dependency by
restricting libstd-rs to class-target builds.

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 meta-oe/recipes-extended/ripgrep/ripgrep_15.1.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/ripgrep/ripgrep_15.1.0.bb b/meta-oe/recipes-extended/ripgrep/ripgrep_15.1.0.bb
index 7bb6be1cb6..9b323bba12 100644
--- a/meta-oe/recipes-extended/ripgrep/ripgrep_15.1.0.bb
+++ b/meta-oe/recipes-extended/ripgrep/ripgrep_15.1.0.bb
@@ -15,7 +15,7 @@ S = "${CARGO_VENDORING_DIRECTORY}/ripgrep-${PV}"
 
 inherit cargo cargo-update-recipe-crates
 
-DEPENDS += "libstd-rs"
+DEPENDS:append:class-target = " libstd-rs"
 
 require ${BPN}-crates.inc
 
-- 
2.49.0


