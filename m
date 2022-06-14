Return-Path: <akash.hadke@kpit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8CE6C43334
	for <webhook@archiver.kernel.org>; Tue, 14 Jun 2022 14:49:45 +0000 (UTC)
Received: from IND01-BMX-obe.outbound.protection.outlook.com
 (IND01-BMX-obe.outbound.protection.outlook.com [40.107.239.75])
 by mx.groups.io with SMTP id smtpd.web11.7033.1655218180614469923
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Jun 2022 07:49:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=A+x0n28M;
 spf=pass (domain: kpit.com, ip: 40.107.239.75,
 mailfrom: akash.hadke@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BlH0O8MZkg4fPipxN0nbPXqhGxyR8KrWlCbv/bZRQnHYiXelx2rcgXD93hN+UFNT4/MB6K8q43EqzRL9/0l0A5t4kYhtHDOuR/MVUY3jcQ3oZzQMcEl0kpSv/MQKcSFawL3wG1ZNQfa1VE46xOLggiPlO7hs6HpEwAwrUHq0NhbOETxMH/TT0w7oCBKwBfROT9Ql/joVqQiWjCcZl06f4+NnXpt2373gedJeNHfybIwqNFCM0bIiCvi9rL9EwmYn/hf6cuBRmPfJPli+rHzrr2RiQBAQkQOYdyUC2hUyXFGXraEUHk6aeFDX1mMOmD89vfhaGlFDZvmBc8CzVF6nIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DdNOi0JpfPKO/TrNvK8bw0lD7Xtm82CBjzZx+34eMPQ=;
 b=J0b+JLuP17pWY9yC0Tcb4MjJn+MBLVUzgSTpxSHXUo+KqnYPeWYm74cOcHpHHBWUTu5NtDZMORpFtClsS+DZJI9VAhug6lxa4lXs0/8e5IgHy2uDfIvSwNcd2Yxljd7hYZMax4MuD/kDO/01uwy1OBo6Yg8eQEhquh/iYFijqNHG5Slgj/yB4RV+dvTm1OUAcoQyMr4yvpLC//bWt8tIsrNZUbGxsvTSze3GeKbJRkvwa3XFJuqJzVCgKfyXJC713wKfZYsterjCuSs+egdjJB/BJRkv4xdgnV9o98BDGimR7gIGFnNccUaE3kFdQkzFhU3qVBC01kNvvf63LH/3Rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DdNOi0JpfPKO/TrNvK8bw0lD7Xtm82CBjzZx+34eMPQ=;
 b=A+x0n28MQ9rMOny6vcROAhUW0T5r0grOhjP0o0mH9a6ivHIij1xX4LD66Qz8kPOKqts4eXXy6apeSf0/QvjMzzYuaFdvrcmSl1FWvzpERKGxc5uFlyBNsuw/VckkFObSPNHSZSLDX7WaXYzXi9l9eBx/HazArd7Ns1c7H2jTn0c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kpit.com;
Received: from PN3PR01MB6712.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:89::13)
 by PN3PR01MB6792.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:a7::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.11; Tue, 14 Jun
 2022 14:49:32 +0000
Received: from PN3PR01MB6712.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::8119:8287:2cf2:7125]) by PN3PR01MB6712.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::8119:8287:2cf2:7125%7]) with mapi id 15.20.5332.022; Tue, 14 Jun 2022
 14:49:32 +0000
From: Akash Hadke <akash.hadke@kpit.com>
To: openembedded-devel@lists.openembedded.org
Cc: ranjitsinh.rathod@kpit.com,
	Akash Hadke <hadkeakash4@gmail.com>
Subject: [oe][meta-oe][master][kirkstone][PATCH] iperf: Set CVE_PRODUCT to
 "iperf_project:iperf"
Date: Tue, 14 Jun 2022 16:47:47 +0200
Message-Id: <20220614144747.17514-1-akash.hadke@kpit.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: VI1P18901CA0013.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:801::23) To PN3PR01MB6712.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:89::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 79c7b800-1deb-4d65-98bc-08da4e151761
X-MS-TrafficTypeDiagnostic: PN3PR01MB6792:EE_
X-Microsoft-Antispam-PRVS: 
	<PN3PR01MB6792F48976CD8780222D7E038EAA9@PN3PR01MB6792.INDPRD01.PROD.OUTLOOK.COM>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	1etL0eAgAfub7BBvVHyszSEMljVdeZKkymdSuu64RIRQeoNF1fsJjviY8xAKX1zSSWR8XcmcB5DaU1HN+EdLmRBq11r+GJJv1JzisPzZH49IOuhe94TemieHy5IsLf/wahre8a1X9U5dpA4s5gvSvZMiQdQ63DDTXnojCl3QA2J3s+Ve8XUI45olDDZjrqiSOxC32jbpPiYQ5TC0kBMzyFFrqHL07+lmMp4kjCW4tcn4LLf1n85OyRD67zu9YXrsdMLm9WPC8JX+Krk4RKCcNPgf65iiBgHlfgNKKxajB0U3U6i0EA7Wr5l/N/wJr1pMsJjT/RQb1ouSn3K11nlNxVpqVzPoxocRmpjm3c63T7oBVHMvohPQ/TQcHzHCAqHESD/Xgq69Atikii4YWfYbkmBsLtO5e6gOmuRmHEwKHSMs85L0f1Wcc20DOMdHiPORHtbdolCYLqR0vpO6UPzL/ASWCgJU4+LvJai3H74IDj2veYzthrciW4XOmPVp59VWOql2tFG1ibbm/S+V8YlXEw7lvCsbVb11BLqO6SF5z04yqfUhuNT1m8kNSicz2PpXCEqENxqTNd/wJ+oNRg2m+Zt61DDRYs9sQRXO662vR0ZmTXU79toUUlAY2Gyikg3w4cHD25A33lyBECfkIhje7EAvV35l64NSmATnBbFTLdtZHax2pWCEUkjIteMtGRGt96liWh7sFb3b925D9jFCOqkvndJeIiC9CkP08YZ1IylD+d8N1xgdvw5PP+DDMqnRCHzQGzEMTs+eZJzitQZPrg8GsL5CxUvrjagPqhzjj7w=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3PR01MB6712.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(5660300002)(44832011)(66476007)(6666004)(966005)(2906002)(6506007)(86362001)(38100700002)(66556008)(66946007)(8936002)(8676002)(4326008)(38350700002)(6512007)(26005)(6916009)(316002)(36756003)(508600001)(52116002)(2616005)(186003)(1076003)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Q9fFC3aPtXiEp7IqJaRx+fuK6hIudazon+8yOa+sHcUZ5tkfeqXN+mB8z+uy?=
 =?us-ascii?Q?oudUAW4lT46tbuFzBDTeV1+f4AHVUmM3PoDEAEOY/CC5fP7yHHwtWx9/1bb4?=
 =?us-ascii?Q?Vf0PyOmKrznOGSoOxN4jNvJdB9lsiatbb3ITW7/3j3Z/TuSqD1NJ6nMAFi8w?=
 =?us-ascii?Q?lid05RIWa9q4vgW/n4vR3nJOupbMbPyhT7W1+UmKDZx8BNjsb1dhNpWKYgx/?=
 =?us-ascii?Q?Z5+AWrzreos9p95cpwUzKYTA5RRPyL7c1AV9T5p91KutMk8bSUE0PEbRl7Uz?=
 =?us-ascii?Q?x+Vo5blXSLerxTcdScV5ZcvhCs+zy8QA+4cgizeZy1ncjEUAUYXMYQ+E6W7J?=
 =?us-ascii?Q?6PO0sU0LZJeTgS068JG8yLVagEN1eUHyMrSV7quXJ2qgoARbL7eQFN7JQWcS?=
 =?us-ascii?Q?JhYK6GQ2E36YEkU3WfmXaVk3dnFWCQCbhRPAuoPwf2uCGce1RRAtxMoPU+WA?=
 =?us-ascii?Q?8+VOTl/P99BPWYdFQRJrLAPImYfFTIODMvOwNH/urqn0ZP3n5xrFzVJH8fUl?=
 =?us-ascii?Q?y4kN5c0aluTBgOjLmuj/TbojrGXcfJ0X1fgehkE4/E7bGtuuiq7s3WzzNjD2?=
 =?us-ascii?Q?SvgC0qwoEoq90gSrWF42ATP5pFk+NyfjBrEflo42afpfWsA0TrJuEYoe1zUR?=
 =?us-ascii?Q?FZuh+5cbD/z/EUfwLX9M2hcYjLFDDPp9hnpzcZ+QUyEqTlDq0+DbDhuvN/kn?=
 =?us-ascii?Q?3TOA6DnRC9yKjKROcRpVouUQBVWFHFlv5l/9gRmqJ5Gs8I/FSPKmo7JIMX8U?=
 =?us-ascii?Q?yqs+QEFitNKHZrd0jk4U17Vuq2NRfwaK4j38t/cZyNtCiJwRxICIZmzL6dLL?=
 =?us-ascii?Q?ObKRcxEwyqewvmTVZIVuNKLkG47BIzeVXMrEXXn5kTtAfQwsJRE4HSSbrw2C?=
 =?us-ascii?Q?esQRw7PND9mSMN68bEJ8x//CQ7NtIlm2h1PSO8LjgPLAleK/QCYI6ghN/9Ge?=
 =?us-ascii?Q?WN3BfHzha0opOqUah7Fbp6H6DLuwqRJ9uL6BmfyHuffAVGkYUxRInYe57ckS?=
 =?us-ascii?Q?5N3K3QvoogpuE7B08PYxqlKBf0J5cp2UdKBW7+JzxxEp0g2oKW5e9K+acImn?=
 =?us-ascii?Q?X1RCJvXQgYcvD5S26o23uf/TXhlmGRx6CR0Hy4wiaf6wKTr9ej8bpbpD7Scw?=
 =?us-ascii?Q?OGQMf6GDw0tn3OOvKuQq29HRllTT8GEq+aKT73QE+vaut1m+yTqFyICndKrJ?=
 =?us-ascii?Q?zK5luKmoyEQCjBgh+rg4bxbooJqn7YFrhKSHOp/KzKehZ+n0yrYOPVivRp04?=
 =?us-ascii?Q?dAgfdXVPgxD4lYfIiEbeIIlTYDRZByXWf1a1Wt6G9sMzE9lebpUujXsu0wmp?=
 =?us-ascii?Q?Wmu00ghZvnVQKOHWmAY0lnzuqOrZEGICzLKHsNp5Z4wSit7LRjOb3DbGqTas?=
 =?us-ascii?Q?9HBF3CVuUaKCYSDqs7lWGmmgFQQm08W6Amstro7h0bcbs2BkDrae0W9wD3EL?=
 =?us-ascii?Q?zyRpvZXvc37BULsoCe5t1Jm76voK9tEwo+6mbv2EtYSyMDdJqOYs4lDAeoFj?=
 =?us-ascii?Q?ujBQQKbbEwfs3hpwydP3hW4tG8TyEOi1LrmDs4bGc/33WVO+yFWVHISnUWqo?=
 =?us-ascii?Q?a+9j3ne4wvlmKofIa+ywa0hQkPXk6A5rRKdyc7WDmOfAyH1lec0jJTUlGs3K?=
 =?us-ascii?Q?tLixbgXya9I2ynUiXjlZWTP0hJQT/TGKROM/Lj1hl8+XNeRpygj7wJNyjg2Z?=
 =?us-ascii?Q?TLP/N7C9oy7eK6cvhI/WxeRi58dYRAl8RedQowUYDXTc3ilZX7JJkrTmVWDS?=
 =?us-ascii?Q?X1rTzCmyYw=3D=3D?=
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 79c7b800-1deb-4d65-98bc-08da4e151761
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB6712.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2022 14:49:32.4428
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 83zbHHD7lCVQ3JIG/Zw6atdHfZoeYAIg4CdeN59M27kILy9XT0sURlHFBbSxL8Ci8BwtT8Yk/8Yg8MRC0u78nQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3PR01MB6792
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Jun 2022 14:49:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97514

Set CVE_PRODUCT as 'iperf_project:iperf' for iperf2 and iperf3
recipes, cve-check class is setting default CVE_PRODUCT to
'iperf2' and 'iperf3' respectively which ignores the iperf
CVEs from NVD Database.

Reference:
CVE-2016-4303
Link: https://nvd.nist.gov/vuln/detail/CVE-2016-4303

Signed-off-by: Akash Hadke <akash.hadke@kpit.com>
Signed-off-by: Akash Hadke <hadkeakash4@gmail.com>
---
 meta-oe/recipes-benchmark/iperf2/iperf2_2.0.13.bb | 2 ++
 meta-oe/recipes-benchmark/iperf3/iperf3_3.11.bb   | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/meta-oe/recipes-benchmark/iperf2/iperf2_2.0.13.bb b/meta-oe/recipes-benchmark/iperf2/iperf2_2.0.13.bb
index 4a520e3be..86e5fef53 100644
--- a/meta-oe/recipes-benchmark/iperf2/iperf2_2.0.13.bb
+++ b/meta-oe/recipes-benchmark/iperf2/iperf2_2.0.13.bb
@@ -19,3 +19,5 @@ EXTRA_OECONF = "--exec-prefix=${STAGING_DIR_HOST}${layout_exec_prefix}"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'ipv6', '', d)}"
 PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
+
+CVE_PRODUCT = "iperf_project:iperf"
diff --git a/meta-oe/recipes-benchmark/iperf3/iperf3_3.11.bb b/meta-oe/recipes-benchmark/iperf3/iperf3_3.11.bb
index a6af23aec..2142a8ef1 100644
--- a/meta-oe/recipes-benchmark/iperf3/iperf3_3.11.bb
+++ b/meta-oe/recipes-benchmark/iperf3/iperf3_3.11.bb
@@ -30,3 +30,5 @@ PACKAGECONFIG[lksctp] = "ac_cv_header_netinet_sctp_h=yes,ac_cv_header_netinet_sc
 PACKAGECONFIG[openssl] = "--with-openssl=${RECIPE_SYSROOT}${prefix},--without-openssl,openssl"
 
 CFLAGS += "-D_GNU_SOURCE"
+
+CVE_PRODUCT = "iperf_project:iperf"
-- 
2.17.1


