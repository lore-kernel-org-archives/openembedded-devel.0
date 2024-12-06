Return-Path: <libo.chen.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0250BE7716F
	for <webhook@archiver.kernel.org>; Fri,  6 Dec 2024 04:01:08 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.29867.1733457661401302593
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Dec 2024 20:01:01 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=20702e6208=libo.chen.cn@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B5N07U3030653
	for <openembedded-devel@lists.openembedded.org>; Fri, 6 Dec 2024 04:01:00 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2171.outbound.protection.outlook.com [104.47.58.171])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 437sp76w0x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 06 Dec 2024 04:01:00 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IFi/QycMHAdNnrYNlt2OVSDjojkoRKMefgM15eAqPVrY/akM/s8zR4CgjzseQfSNfd1aK97mhYew26g1e9uU8J2QPYC902OjdX/Jss58c6be4WCrWb6x9ClZsEW8tbdX+K1j8jWrQYiZT6nj3BjruB52p6YzrNCrYPpwDdS/iwZ4meN88d7MjHgPfHISb5DD7Jab/42pGHqkYpBSeJii7rgy047ZPCw3Nnk5YM4svv3ZXDjrC7KlQgDpkZZB137M26dDwp/IjxF2o5nBaQ555uwye8Yacz/+E4Ajdj1M7QgRMiWigAv1vr6vSZV3uZb3f8/lp2Sma9uh8elZDWTnfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rzHNXMDQuEth7BrmVfrZHc0QehvKw4v/1NLgfegeWBU=;
 b=KcgJh30TLhJW7PJHJtBo6lDErMBTodzvAXiynj3lg4zBNjx9LOS20axvocysBt7fyLFteRj6cRq1B6TQMFgluarwY6Ky+QKlCMksCAsfNNztBwrfSX5+lqWu9wLYuPGrlAhcfPQrerX5b8/CawHRpoVHtdVQknzjHv7DMyhhMsnP0VV3lXwMAkGlC2lvdvQJA8OPq93ibNVPRuGeJ1Oy/A8TMZ3jF7flKVS4XmFrCQzgq5qgA0qCyJCDRjUo2M6MdepNjXx/ezsY8lzU+XN6o1vnNkN3wRFtL+bAal3KGi+oJQX/hMWTYVb06HeJpcYjHQzgchaQBy3jelgFO++w2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BN9PR11MB5354.namprd11.prod.outlook.com (2603:10b6:408:11b::7)
 by SA1PR11MB8812.namprd11.prod.outlook.com (2603:10b6:806:469::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.14; Fri, 6 Dec
 2024 04:00:56 +0000
Received: from BN9PR11MB5354.namprd11.prod.outlook.com
 ([fe80::5e9:ab74:5c12:ee2d]) by BN9PR11MB5354.namprd11.prod.outlook.com
 ([fe80::5e9:ab74:5c12:ee2d%4]) with mapi id 15.20.8230.010; Fri, 6 Dec 2024
 04:00:55 +0000
From: libo.chen.cn@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH] grpc: Fix CVE-2024-7246
Date: Fri,  6 Dec 2024 12:00:41 +0800
Message-ID: <20241206040041.2109572-1-libo.chen.cn@windriver.com>
X-Mailer: git-send-email 2.44.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCPR01CA0029.jpnprd01.prod.outlook.com
 (2603:1096:405:1::17) To BN9PR11MB5354.namprd11.prod.outlook.com
 (2603:10b6:408:11b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5354:EE_|SA1PR11MB8812:EE_
X-MS-Office365-Filtering-Correlation-Id: 2afad7fe-897e-443c-988e-08dd15aa9576
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?+mtR0O5ba2/L494abQq8ZZqwehZU7Kofv/lmobcg762y2d5jwN7zyOD34UNZ?=
 =?us-ascii?Q?jr70dmfp5rbdGSIH+i3+EbiwJ/T7umUexSxukW16lBIxBQjY7PBomH1i/+ic?=
 =?us-ascii?Q?YJ/z+x1tNeSF4NDCg5X8P5iRdDNqQhxxu74HRrP0h+mTWufXpO5UAE8pOMS7?=
 =?us-ascii?Q?g8FIWdBHVr5kTqeEpDqrzRCt1QtkhScEkhRGV0TLW+DBTT70SJdYi0dmTXIO?=
 =?us-ascii?Q?YKMSHi0b76i4/nLdv4gSromRwcPRd3t0u7uJxU4k8xMI/Oy/wsspd+yWb5i6?=
 =?us-ascii?Q?RPNJRDuG+MfSEXbOsoAXD1kXJwHYSFKMEQjHY5Dqtn32BDI/UJpYTpmMVmhd?=
 =?us-ascii?Q?rqy0mAm+NSioMpTSiGey+9lXGQx4scgOMMZ0/LMkFhXgCaju2mOXiGnU3eLs?=
 =?us-ascii?Q?vHfZARBn5kkBLMmxZvuksHjAOqWlrEtOMW2uVLEC3ousr0dvy8q+kTnOL8Ob?=
 =?us-ascii?Q?aT91nuQWTjQkWrSn94qWMvC2Us7YhYeVCplQ+zO2eMSL0R7U6NANNwzKZuyB?=
 =?us-ascii?Q?Th8zcEYmqC/RxwAla15P6UXl3kcvCGxW+BwAI4lg3aPGaevmJU+hIAQbeWIX?=
 =?us-ascii?Q?ujSnUm9EqYw+lsXm7sbnp1JApzlAAiNotrJgVqZ0jNqem5wYHAAZKstLjL9c?=
 =?us-ascii?Q?mHCI+bpENUO16xCVLH9QhvJXQYz0YQ2QrYx7xZXRDL5ZVVw2lFjN5v5tBBNp?=
 =?us-ascii?Q?FfyUsIwRYEaQ3johekkJHS8dE41uRmwtuLFp826pV3/o4K32rDP1im57ESQP?=
 =?us-ascii?Q?soagUgRx3qQLNs9lXfNhZ0f9qVpdyMwEkfKC1wHhvhlN2Gwss3Idy3zvLUUo?=
 =?us-ascii?Q?w4XjakTK1Zlwjphz1rQBJ2z1ij1ThJL/czftWZyGY8eGzp5XB3200cH/gKoy?=
 =?us-ascii?Q?hdxZFEUu9jbw/44Jwj7qlsNPj0mCnS4+ZBeYUN7BTe2nTpXfUOVqZPXWhsUu?=
 =?us-ascii?Q?shoNmc/NxHiAVeAnZLgpNUlEa1SoyoYqHpJu3g600T/H2/m0sF2AXCFTK9HB?=
 =?us-ascii?Q?Xo/lntyXn2FfiiBAbLODp91C0qW3AtjGN+1RKEEzThN0wQhXSKjUfxSM3E1J?=
 =?us-ascii?Q?cTyUOwsInpKG0CX48AD884xvqgpZ9x3EH0/CP2zWwJzcA9dZPUWRvFZEnAdd?=
 =?us-ascii?Q?OrkIC1LlhAVb1Qwk0EwOf2CKpntI3M80qWbIosMpT3anR+WGpbcZb9FZKvD1?=
 =?us-ascii?Q?Mge8Dd0hViwTlicY3ZTwEVXdgpPbYVY9W//RsbJ1liA0LG2qlEJLzWs1ohM4?=
 =?us-ascii?Q?LG2zzsx0ql37wPAJkjTfHKOBMN2T50xu7/fe4+RO/C6D73/mh9LiZuUXock+?=
 =?us-ascii?Q?cO3lqEvy5aulAn0CQp1mOiLXU6UsGseUuD4TQv+3r2Hn6JK8CrshbTdGi5Yn?=
 =?us-ascii?Q?5hiIXDk4xaQ0VLAgVNbCwK+FZAIv1kh+v8eZiPu/0sNAXWBfmw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5354.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?9eGjHMUSCnuSa5scE6QkcsWXqLFrsO487MlsMDYIZePf8gKoB7mikM1FHkR+?=
 =?us-ascii?Q?TVUYfDQJf3asDTCcAkX84c70DDIrggMeB+wiU1DOwJ/aYvK90WM54BGbFn1m?=
 =?us-ascii?Q?NvVqgY/uyuO4KlH5MB1UjXqMrQOH9cBW/nmPryECf02Eteqhrov4/scie7Oo?=
 =?us-ascii?Q?gF8beBpv3f6i4GEQ7i7LO8FDFYmsbu0B6wEAGG5OYyLWtzDcMjjKvx3bKyGE?=
 =?us-ascii?Q?mzykZIjECylpKUetGYrn79tsnbclNboWKGt2Mb7yYTeV007QR3CjAIqaSSvJ?=
 =?us-ascii?Q?h60JbZIzogR1mwyZhhv/nBl2c9Az3qIrI7itq5pM+A8+c/8HZ+3F+HXW2h5q?=
 =?us-ascii?Q?X45X6hVeYFgJK/wYolTeXwrTMhO0Rg8Fymb/kTedjrNQX0iQtmyqRT2iz5W4?=
 =?us-ascii?Q?BxjNYpGZ+3VEBbwts7sIuheRFAC24/NumwOKr19yzbcijd05DMsR3nkuEdu4?=
 =?us-ascii?Q?ZQ353BP+0FNowrzSo7rjUWLHUI6g7s0yYRfgFTMPeEqkXxA2yF0WAOmI0MNR?=
 =?us-ascii?Q?F9rqy43WWNNSNcF0F7My7s7AQ86lFO6nvYal6GEzXl4S+SsynHmQ2pmCWy4Y?=
 =?us-ascii?Q?qLfjUvQ3zbwzuvcaNfT85DCJKKbYUl028UQzE/aDa78F/YXBjQQPnmRTy6V8?=
 =?us-ascii?Q?rfyXJnU8FXEgwRSAyIhD50okVAwHtNGXMBK/3v/Y1TzlmHZ1z9r9Zeoqw9e1?=
 =?us-ascii?Q?iyLBzBpUXtwyGjggB+jDIlKM7UuK+O8rhrLvOTY4vvVRzZDavBVICuSAPeGm?=
 =?us-ascii?Q?wvblgh+y0/6vLGR7G8sTyPcvZjS1t8O6ZzqQhooA0gcDiiF1UyEtinAkvj9y?=
 =?us-ascii?Q?zdN3hD2vVpGsjdDz1K1o6xhGNmRzlmPKr4bNbn2i0EBxKYYsKnccWR70MKOJ?=
 =?us-ascii?Q?fH8Ixy8vng9ZVVmwUN9gtwZMiR64g94nO0/t30DzYxAxpURD8Wbf/qRB9uCR?=
 =?us-ascii?Q?7QR7IFmAmDlPvqtR4JQdNc5423VW4ZaJ2pi4UhGrK3WZkXUU1ykB4ppadzHV?=
 =?us-ascii?Q?vT/OSLJwQpLR2mJutbig9DbISAOkvSv/0eqSLXrYRxYgCfXCMEEeS4Ftgauu?=
 =?us-ascii?Q?MSnnoJNKKIpQmoOERNJOtnT+vFtlfzsAd4rkaA2BROQ8Wgr585t0OQ8q5lXO?=
 =?us-ascii?Q?Jln2dhCFm7ETzoe53ZOdvz5HrgTaLnhHUAKTp59XS+EAcH3bfEeB6r2/7oT4?=
 =?us-ascii?Q?ozFEb1NxWon68pJikZjL7lK3BBl8Ko0AmAwuir4IflIkvc4MIonf/y5qWxpc?=
 =?us-ascii?Q?WjDmUWU+ghU66gDgGcJcR95cwzcG1tTofrK7TFPI7JmT5I9uScFGpWx6YQmE?=
 =?us-ascii?Q?Hh1vTjEofD7o2dTmiZYguV0/pIFmdchMUPjPY0KTIcxWDUQAAqHPH0nzU1Ur?=
 =?us-ascii?Q?JTmMdS99oG4TagN4qtNSnBBKqc8lVu0WIEIv2Fhupzmw3ZE9zvkqzFcr2AUp?=
 =?us-ascii?Q?+NmfwfXwFYVFOzh6GWEVOoRBPCFq7VfNFLimpJs4jVYHV8syswKN6F7nBsy+?=
 =?us-ascii?Q?ufd4wkjc9dxeuwvP70qxCbJsA3GJP3HgabUVT5B7j1+6t0kgES0Tt9svdxKP?=
 =?us-ascii?Q?wkGJYnuru8EB0v86k2/H8DAhy700YV/M8OkhBf86/uuw9fTXLSljvkET+Olf?=
 =?us-ascii?Q?IA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2afad7fe-897e-443c-988e-08dd15aa9576
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5354.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2024 04:00:55.6589
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j3PWG4oPNDkm8LX9hGtkmCmW0IBB3olFpoB+8cDzp7RhkyCCKVT7eCgN0rZPWMwiWCkxaZvYbQ8AHm8JLv7SMWgHNyglijzRlItyKA7vvgI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8812
X-Authority-Analysis: v=2.4 cv=Qvqk3Uyd c=1 sm=1 tr=0 ts=675276fc cx=c_pps a=b6GhQBMDPEYsGtK7UrBDFg==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=RZcAm9yDv7YA:10 a=bRTqI5nwn0kA:10 a=NEAV23lmAAAA:8
 a=t7CeM3EgAAAA:8 a=1XWaLZrsAAAA:8 a=qxXJRgYASCD2-q0T8OMA:9 a=lqcHg5cX4UMA:10 a=r-HJ9bD__24A:10 a=ImwWUX5h3JJ3gRE9moBe:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: KYTiw0edW4vUZ7gZhpI10Fw_oxXTJN2g
X-Proofpoint-GUID: KYTiw0edW4vUZ7gZhpI10Fw_oxXTJN2g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-06_02,2024-12-05_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 mlxscore=0 phishscore=0 mlxlogscore=999 malwarescore=0
 bulkscore=0 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0
 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2412060027
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 06 Dec 2024 04:01:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114212

From: Libo Chen <libo.chen.cn@windriver.com>

Backport patches [1] to fix CVE-2024-7246.

[1] https://github.com/grpc/grpc/pull/37361/files

Signed-off-by: Libo Chen <libo.chen.cn@windriver.com>
---
 .../grpc/grpc/CVE-2024-7246.patch             | 420 ++++++++++++++++++
 meta-oe/recipes-devtools/grpc/grpc_1.60.1.bb  |   1 +
 2 files changed, 421 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/grpc/grpc/CVE-2024-7246.patch

diff --git a/meta-oe/recipes-devtools/grpc/grpc/CVE-2024-7246.patch b/meta-oe/recipes-devtools/grpc/grpc/CVE-2024-7246.patch
new file mode 100644
index 0000000000..a690b49c67
--- /dev/null
+++ b/meta-oe/recipes-devtools/grpc/grpc/CVE-2024-7246.patch
@@ -0,0 +1,420 @@
+From ac0948e39eb19c3325a576e152709d4cc915a7e4 Mon Sep 17 00:00:00 2001
+From: Craig Tiller <ctiller@google.com>
+Date: Thu, 1 Aug 2024 13:02:27 -0700
+Subject: [PATCH] [v1.60] [chttp2] Fix a bug in hpack error handling (#37361)
+
+PiperOrigin-RevId: 657234128
+PiperOrigin-RevId: 658458047
+
+Craig Tiller <ctiller@google.com>
+
+CVE: CVE-2024-7246
+
+Upstream-Status: Backport
+[https://github.com/grpc/grpc/pull/37361/files]
+
+Signed-off-by: Libo Chen <libo.chen.cn@windriver.com>
+---
+ .../chttp2/transport/hpack_parser.cc          | 63 +++++++------
+ .../transport/chttp2/transport/hpack_parser.h |  2 +
+ .../transport/chttp2/hpack_parser_test.cc     | 89 ++++++++++++++++---
+ .../transport/chttp2/hpack_sync_fuzzer.cc     | 62 +++++++++++++
+ .../transport/chttp2/hpack_sync_fuzzer.proto  |  3 +
+ 5 files changed, 179 insertions(+), 40 deletions(-)
+
+diff --git a/src/core/ext/transport/chttp2/transport/hpack_parser.cc b/src/core/ext/transport/chttp2/transport/hpack_parser.cc
+index 31bf464..f2fe80c 100644
+--- a/src/core/ext/transport/chttp2/transport/hpack_parser.cc
++++ b/src/core/ext/transport/chttp2/transport/hpack_parser.cc
+@@ -91,12 +91,14 @@ constexpr Base64InverseTable kBase64InverseTable;
+ class HPackParser::Input {
+  public:
+   Input(grpc_slice_refcount* current_slice_refcount, const uint8_t* begin,
+-        const uint8_t* end, absl::BitGenRef bitsrc, HpackParseResult& error)
++        const uint8_t* end, absl::BitGenRef bitsrc,
++        HpackParseResult& frame_error, HpackParseResult& field_error)
+       : current_slice_refcount_(current_slice_refcount),
+         begin_(begin),
+         end_(end),
+         frontier_(begin),
+-        error_(error),
++        frame_error_(frame_error),
++        field_error_(field_error),
+         bitsrc_(bitsrc) {}
+ 
+   // If input is backed by a slice, retrieve its refcount. If not, return
+@@ -215,14 +217,18 @@ class HPackParser::Input {
+ 
+   // Check if we saw an EOF
+   bool eof_error() const {
+-    return min_progress_size_ != 0 || error_.connection_error();
++    return min_progress_size_ != 0 || frame_error_.connection_error();
++  }
++
++  // Reset the field error to be ok
++  void ClearFieldError() {
++    if (field_error_.ok()) return;
++    field_error_ = HpackParseResult();
+   }
+ 
+   // Minimum number of bytes to unstuck the current parse
+   size_t min_progress_size() const { return min_progress_size_; }
+ 
+-  bool has_error() const { return !error_.ok(); }
+-
+   // Set the current error - tweaks the error to include a stream id so that
+   // chttp2 does not close the connection.
+   // Intended for errors that are specific to a stream and recoverable.
+@@ -246,10 +252,7 @@ class HPackParser::Input {
+   // read prior to being able to get further in this parse.
+   void UnexpectedEOF(size_t min_progress_size) {
+     GPR_ASSERT(min_progress_size > 0);
+-    if (min_progress_size_ != 0 || error_.connection_error()) {
+-      GPR_DEBUG_ASSERT(eof_error());
+-      return;
+-    }
++    if (eof_error()) return;
+     // Set min progress size, taking into account bytes parsed already but not
+     // consumed.
+     min_progress_size_ = min_progress_size + (begin_ - frontier_);
+@@ -302,13 +305,18 @@ class HPackParser::Input {
+   // Do not use this directly, instead use SetErrorAndContinueParsing or
+   // SetErrorAndStopParsing.
+   void SetError(HpackParseResult error) {
+-    if (!error_.ok() || min_progress_size_ > 0) {
+-      if (error.connection_error() && !error_.connection_error()) {
+-        error_ = std::move(error);  // connection errors dominate
++    SetErrorFor(frame_error_, error);
++    SetErrorFor(field_error_, std::move(error));
++  }
++
++  void SetErrorFor(HpackParseResult& error, HpackParseResult new_error) {
++    if (!error.ok() || min_progress_size_ > 0) {
++      if (new_error.connection_error() && !error.connection_error()) {
++        error = std::move(new_error);  // connection errors dominate
+       }
+       return;
+     }
+-    error_ = std::move(error);
++    error = std::move(new_error);
+   }
+ 
+   // Refcount if we are backed by a slice
+@@ -320,7 +328,8 @@ class HPackParser::Input {
+   // Frontier denotes the first byte past successfully processed input
+   const uint8_t* frontier_;
+   // Current error
+-  HpackParseResult& error_;
++  HpackParseResult& frame_error_;
++  HpackParseResult& field_error_;
+   // If the error was EOF, we flag it here by noting how many more bytes would
+   // be needed to make progress
+   size_t min_progress_size_ = 0;
+@@ -597,6 +606,7 @@ class HPackParser::Parser {
+   bool ParseTop() {
+     GPR_DEBUG_ASSERT(state_.parse_state == ParseState::kTop);
+     auto cur = *input_->Next();
++    input_->ClearFieldError();
+     switch (cur >> 4) {
+         // Literal header not indexed - First byte format: 0000xxxx
+         // Literal header never indexed - First byte format: 0001xxxx
+@@ -702,7 +712,7 @@ class HPackParser::Parser {
+         break;
+     }
+     gpr_log(
+-        GPR_DEBUG, "HTTP:%d:%s:%s: %s%s", log_info_.stream_id, type,
++        GPR_INFO, "HTTP:%d:%s:%s: %s%s", log_info_.stream_id, type,
+         log_info_.is_client ? "CLI" : "SVR", memento.md.DebugString().c_str(),
+         memento.parse_status == nullptr
+             ? ""
+@@ -951,11 +961,10 @@ class HPackParser::Parser {
+                                   state_.string_length)
+             : String::Parse(input_, state_.is_string_huff_compressed,
+                             state_.string_length);
+-    HpackParseResult& status = state_.frame_error;
+     absl::string_view key_string;
+     if (auto* s = absl::get_if<Slice>(&state_.key)) {
+       key_string = s->as_string_view();
+-      if (status.ok()) {
++      if (state_.field_error.ok()) {
+         auto r = ValidateKey(key_string);
+         if (r != ValidateMetadataResult::kOk) {
+           input_->SetErrorAndContinueParsing(
+@@ -965,7 +974,7 @@ class HPackParser::Parser {
+     } else {
+       const auto* memento = absl::get<const HPackTable::Memento*>(state_.key);
+       key_string = memento->md.key();
+-      if (status.ok() && memento->parse_status != nullptr) {
++      if (state_.field_error.ok() && memento->parse_status != nullptr) {
+         input_->SetErrorAndContinueParsing(*memento->parse_status);
+       }
+     }
+@@ -992,16 +1001,16 @@ class HPackParser::Parser {
+         key_string.size() + value.wire_size + hpack_constants::kEntryOverhead;
+     auto md = grpc_metadata_batch::Parse(
+         key_string, std::move(value_slice), state_.add_to_table, transport_size,
+-        [key_string, &status, this](absl::string_view message, const Slice&) {
+-          if (!status.ok()) return;
++        [key_string, this](absl::string_view message, const Slice&) {
++          if (!state_.field_error.ok()) return;
+           input_->SetErrorAndContinueParsing(
+               HpackParseResult::MetadataParseError(key_string));
+           gpr_log(GPR_ERROR, "Error parsing '%s' metadata: %s",
+                   std::string(key_string).c_str(),
+                   std::string(message).c_str());
+         });
+-    HPackTable::Memento memento{std::move(md),
+-                                status.PersistentStreamErrorOrNullptr()};
++    HPackTable::Memento memento{
++        std::move(md), state_.field_error.PersistentStreamErrorOrNullptr()};
+     input_->UpdateFrontier();
+     state_.parse_state = ParseState::kTop;
+     if (state_.add_to_table) {
+@@ -1163,13 +1172,13 @@ grpc_error_handle HPackParser::Parse(
+     std::vector<uint8_t> buffer = std::move(unparsed_bytes_);
+     return ParseInput(
+         Input(nullptr, buffer.data(), buffer.data() + buffer.size(), bitsrc,
+-              state_.frame_error),
++              state_.frame_error, state_.field_error),
+         is_last, call_tracer);
+   }
+-  return ParseInput(
+-      Input(slice.refcount, GRPC_SLICE_START_PTR(slice),
+-            GRPC_SLICE_END_PTR(slice), bitsrc, state_.frame_error),
+-      is_last, call_tracer);
++  return ParseInput(Input(slice.refcount, GRPC_SLICE_START_PTR(slice),
++                          GRPC_SLICE_END_PTR(slice), bitsrc, state_.frame_error,
++                          state_.field_error),
++                    is_last, call_tracer);
+ }
+ 
+ grpc_error_handle HPackParser::ParseInput(
+diff --git a/src/core/ext/transport/chttp2/transport/hpack_parser.h b/src/core/ext/transport/chttp2/transport/hpack_parser.h
+index 3745668..55842e4 100644
+--- a/src/core/ext/transport/chttp2/transport/hpack_parser.h
++++ b/src/core/ext/transport/chttp2/transport/hpack_parser.h
+@@ -236,6 +236,8 @@ class HPackParser {
+     HPackTable hpack_table;
+     // Error so far for this frame (set by class Input)
+     HpackParseResult frame_error;
++    // Error so far for this field (set by class Input)
++    HpackParseResult field_error;
+     // Length of frame so far.
+     uint32_t frame_length = 0;
+     // Length of the string being parsed
+diff --git a/test/core/transport/chttp2/hpack_parser_test.cc b/test/core/transport/chttp2/hpack_parser_test.cc
+index 3772d90..d5b9c6c 100644
+--- a/test/core/transport/chttp2/hpack_parser_test.cc
++++ b/test/core/transport/chttp2/hpack_parser_test.cc
+@@ -440,19 +440,82 @@ INSTANTIATE_TEST_SUITE_P(
+         Test{"Base64LegalEncoding",
+              {},
+              {},
+-             {// Binary metadata: created using:
+-              // tools/codegen/core/gen_header_frame.py
+-              //    --compression inc --no_framing --output hexstr
+-              //    < test/core/transport/chttp2/bad-base64.headers
+-              {"4009612e622e632d62696e1c6c75636b696c7920666f722075732c206974"
+-               "27732074756573646179",
+-               absl::InternalError("Error parsing 'a.b.c-bin' metadata: "
+-                                   "illegal base64 encoding"),
+-               0},
+-              {"be",
+-               absl::InternalError("Error parsing 'a.b.c-bin' metadata: "
+-                                   "illegal base64 encoding"),
+-               0}}},
++             {
++                 // Binary metadata: created using:
++                 // tools/codegen/core/gen_header_frame.py
++                 //    --compression inc --no_framing --output hexstr
++                 //    < test/core/transport/chttp2/bad-base64.headers
++                 {"4009612e622e632d62696e1c6c75636b696c7920666f722075732c206974"
++                  "27732074756573646179",
++                  absl::InternalError("Error parsing 'a.b.c-bin' metadata: "
++                                      "illegal base64 encoding"),
++                  0},
++                 {"be",
++                  absl::InternalError("Error parsing 'a.b.c-bin' metadata: "
++                                      "illegal base64 encoding"),
++                  kEndOfHeaders},
++                 {"82", ":method: GET\n", 0},
++             }},
++        Test{"Base64LegalEncodingWorksAfterFailure",
++             {},
++             {},
++             {
++                 // Binary metadata: created using:
++                 // tools/codegen/core/gen_header_frame.py
++                 //    --compression inc --no_framing --output hexstr
++                 //    < test/core/transport/chttp2/bad-base64.headers
++                 {"4009612e622e632d62696e1c6c75636b696c7920666f722075732c206974"
++                  "27732074756573646179",
++                  absl::InternalError("Error parsing 'a.b.c-bin' metadata: "
++                                      "illegal base64 encoding"),
++                  0},
++                 {"be",
++                  absl::InternalError("Error parsing 'a.b.c-bin' metadata: "
++                                      "illegal base64 encoding"),
++                  0},
++                 {"400e636f6e74656e742d6c656e6774680135",
++                  absl::InternalError("Error parsing 'a.b.c-bin' metadata: "
++                                      "illegal base64 encoding"),
++                  kEndOfHeaders},
++                 {"be", "content-length: 5\n", 0},
++             }},
++        Test{"Base64LegalEncodingWorksAfterFailure2",
++             {},
++             {},
++             {
++                 {// Generated with: tools/codegen/core/gen_header_frame.py
++                  // --compression inc --output hexstr --no_framing <
++                  // test/core/transport/chttp2/MiXeD-CaSe.headers
++                  "400a4d695865442d436153651073686f756c64206e6f74207061727365",
++                  absl::InternalError("Illegal header key: MiXeD-CaSe"), 0},
++                 // Binary metadata: created using:
++                 // tools/codegen/core/gen_header_frame.py
++                 //    --compression inc --no_framing --output hexstr
++                 //    < test/core/transport/chttp2/bad-base64.headers
++                 {"4009612e622e632d62696e1c6c75636b696c7920666f722075732c206974"
++                  "27732074756573646179",
++                  absl::InternalError("Illegal header key: MiXeD-CaSe"), 0},
++                 {"be", absl::InternalError("Illegal header key: MiXeD-CaSe"),
++                  0},
++                 {"400e636f6e74656e742d6c656e6774680135",
++                  absl::InternalError("Illegal header key: MiXeD-CaSe"),
++                  kEndOfHeaders},
++                 {"be", "content-length: 5\n", 0},
++                 {"bf",
++                  absl::InternalError("Error parsing 'a.b.c-bin' metadata: "
++                                      "illegal base64 encoding"),
++                  0},
++                 // Only the first error in each frame is reported, so we should
++                 // still see the same error here...
++                 {"c0",
++                  absl::InternalError("Error parsing 'a.b.c-bin' metadata: "
++                                      "illegal base64 encoding"),
++                  kEndOfHeaders},
++                 // ... but if we look at the next frame we should see the
++                 // stored error
++                 {"c0", absl::InternalError("Illegal header key: MiXeD-CaSe"),
++                  kEndOfHeaders},
++             }},
+         Test{"TeIsTrailers",
+              {},
+              {},
+diff --git a/test/core/transport/chttp2/hpack_sync_fuzzer.cc b/test/core/transport/chttp2/hpack_sync_fuzzer.cc
+index 47e4265..9afa41f 100644
+--- a/test/core/transport/chttp2/hpack_sync_fuzzer.cc
++++ b/test/core/transport/chttp2/hpack_sync_fuzzer.cc
+@@ -85,6 +85,10 @@ void FuzzOneInput(const hpack_sync_fuzzer::Msg& msg) {
+           // Not an interesting case to fuzz
+           continue;
+         }
++        if (msg.check_ab_preservation() &&
++            header.literal_inc_idx().key() == "a") {
++          continue;
++        }
+         if (absl::EndsWith(header.literal_inc_idx().value(), "-bin")) {
+           std::ignore = encoder.EmitLitHdrWithBinaryStringKeyIncIdx(
+               Slice::FromCopiedString(header.literal_inc_idx().key()),
+@@ -96,6 +100,10 @@ void FuzzOneInput(const hpack_sync_fuzzer::Msg& msg) {
+         }
+         break;
+       case hpack_sync_fuzzer::Header::kLiteralNotIdx:
++        if (msg.check_ab_preservation() &&
++            header.literal_not_idx().key() == "a") {
++          continue;
++        }
+         if (absl::EndsWith(header.literal_not_idx().value(), "-bin")) {
+           encoder.EmitLitHdrWithBinaryStringKeyNotIdx(
+               Slice::FromCopiedString(header.literal_not_idx().key()),
+@@ -114,6 +122,10 @@ void FuzzOneInput(const hpack_sync_fuzzer::Msg& msg) {
+         break;
+     }
+   }
++  if (msg.check_ab_preservation()) {
++    std::ignore = encoder.EmitLitHdrWithNonBinaryStringKeyIncIdx(
++        Slice::FromCopiedString("a"), Slice::FromCopiedString("b"));
++  }
+ 
+   // STAGE 2: Decode the buffer (encode_output) into a list of headers
+   HPackParser parser;
+@@ -140,6 +152,21 @@ void FuzzOneInput(const hpack_sync_fuzzer::Msg& msg) {
+     }
+   }
+ 
++  if (seen_errors.empty() && msg.check_ab_preservation()) {
++    std::string backing;
++    auto a_value = read_metadata.GetStringValue("a", &backing);
++    if (!a_value.has_value()) {
++      fprintf(stderr, "Expected 'a' header to be present: %s\n",
++              read_metadata.DebugString().c_str());
++      abort();
++    }
++    if (a_value != "b") {
++      fprintf(stderr, "Expected 'a' header to be 'b', got '%s'\n",
++              std::string(*a_value).c_str());
++      abort();
++    }
++  }
++
+   // STAGE 3: If we reached here we either had a stream error or no error
+   // parsing.
+   // Either way, the hpack tables should be of the same size between client and
+@@ -168,6 +195,41 @@ void FuzzOneInput(const hpack_sync_fuzzer::Msg& msg) {
+     }
+     abort();
+   }
++
++  if (msg.check_ab_preservation()) {
++    SliceBuffer encode_output_2;
++    hpack_encoder_detail::Encoder encoder_2(
++        &compressor, msg.use_true_binary_metadata(), encode_output_2);
++    encoder_2.EmitIndexed(62);
++    GPR_ASSERT(encode_output_2.Count() == 1);
++    grpc_metadata_batch read_metadata_2(arena.get());
++    parser.BeginFrame(
++        &read_metadata_2, 1024, 1024, HPackParser::Boundary::EndOfHeaders,
++        HPackParser::Priority::None,
++        HPackParser::LogInfo{3, HPackParser::LogInfo::kHeaders, false});
++    auto err = parser.Parse(encode_output_2.c_slice_at(0), true,
++                            absl::BitGenRef(proto_bit_src),
++                            /*call_tracer=*/nullptr);
++    if (!err.ok()) {
++      fprintf(stderr, "Error parsing preservation encoded data: %s\n",
++              err.ToString().c_str());
++      abort();
++    }
++    std::string backing;
++    auto a_value = read_metadata_2.GetStringValue("a", &backing);
++    if (!a_value.has_value()) {
++      fprintf(stderr,
++              "Expected 'a' header to be present: %s\nfirst metadata: %s\n",
++              read_metadata_2.DebugString().c_str(),
++              read_metadata.DebugString().c_str());
++      abort();
++    }
++    if (a_value != "b") {
++      fprintf(stderr, "Expected 'a' header to be 'b', got '%s'\n",
++              std::string(*a_value).c_str());
++      abort();
++    }
++  }
+ }
+ 
+ }  // namespace
+diff --git a/test/core/transport/chttp2/hpack_sync_fuzzer.proto b/test/core/transport/chttp2/hpack_sync_fuzzer.proto
+index 72792b6..2c075a6 100644
+--- a/test/core/transport/chttp2/hpack_sync_fuzzer.proto
++++ b/test/core/transport/chttp2/hpack_sync_fuzzer.proto
+@@ -44,4 +44,7 @@ message Msg {
+   repeated Header headers = 2;
+   grpc.testing.FuzzConfigVars config_vars = 3;
+   repeated uint64 random_numbers = 4;
++  // Ensure that a header "a: b" appended to headers with hpack incremental
++  // indexing is correctly added to the hpack table.
++  bool check_ab_preservation = 5;
+ }
+-- 
+2.44.1
+
diff --git a/meta-oe/recipes-devtools/grpc/grpc_1.60.1.bb b/meta-oe/recipes-devtools/grpc/grpc_1.60.1.bb
index 63c696a623..4557fcc908 100644
--- a/meta-oe/recipes-devtools/grpc/grpc_1.60.1.bb
+++ b/meta-oe/recipes-devtools/grpc/grpc_1.60.1.bb
@@ -24,6 +24,7 @@ SRCREV_grpc = "e5ae3b6b44bf3b64d24bfb4b4f82556239b986db"
 BRANCH = "v1.60.x"
 SRC_URI = "gitsm://github.com/grpc/grpc.git;protocol=https;name=grpc;branch=${BRANCH} \
            file://0001-cmake-Link-with-libatomic-on-rv32-rv64.patch \
+           file://CVE-2024-7246.patch \
            "
 # Fixes build with older compilers 4.8 especially on ubuntu 14.04
 CXXFLAGS:append:class-native = " -Wl,--no-as-needed"
-- 
2.44.1


