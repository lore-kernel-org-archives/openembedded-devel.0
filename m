Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5757CD3425
	for <webhook@archiver.kernel.org>; Sat, 31 Aug 2024 23:04:44 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.6225.1725145482518192686
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 31 Aug 2024 16:04:42 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=99738a7452=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47VN1Q5O026819
	for <openembedded-devel@lists.openembedded.org>; Sat, 31 Aug 2024 23:04:41 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2040.outbound.protection.outlook.com [104.47.70.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 41bt598mwv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sat, 31 Aug 2024 23:04:41 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cHPYpTAzrvfBfYQAIsN6B4gOYt56ycEjuSIz8sq5FIHqj561Fe3T50YpXMOVVQWMBdnD1aQVwMHtr7eMR4dNbm+ghEPX3e8CoQbrJt9CdOh4n+1i/j8rZLdXHvDVITDCJmTU+vk9jzQ+U6THRBVMa0gGjafplqM0aR6N98YeYoQRD20iD1EncR9g+s1gqbD+DkCqau8AyHApFjBhhu5jMrOHXGMOOx96WpCgZq4PjBhJEvbab6sJ6pmR+rNYVnUzmUTj8eYIemlv8rrezfLq0q1aPBjlhSXkNRrSL5t9WQqOJBJf7dSijcRKaIapbl204QG7tulUghWn7nP3ThZQ8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=59LYDQaQntfab+a282FQl/AqNtKBiK9wiOeDhglJSSM=;
 b=tm2ylwsEMEMZhUIlxdy1Mw4DXngptoiw8IfFqjYmpa4yxTm5avadFOtMrOaYDFxIb9ttxAZyCkfqDIoB888ldfA8IC6Aq+4sXkfYbWjj0wK7walglrj4pTxwv/346oy3vkgXoWA8K51i5nhYBDlvfEknNxjeQYUmu3eJBuU0evK7M/7Fh86DS5k3gwDKUFuMSqtnJo3Jjjq6yoTwI5Y/x8KauUuQCwAh6E9QcmDtjrhCWKDw2LjK+PZEK5cTX99FXQiLQD44f10yZ8yfY2Qsor92YaWDR+09/KAqDb3l0cxtff3WgcAHUEooSZ4VUjkuteE8G02DPfm655SU72oOjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 DM4PR11MB6095.namprd11.prod.outlook.com (2603:10b6:8:aa::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7918.23; Sat, 31 Aug 2024 23:04:39 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%4]) with mapi id 15.20.7918.020; Sat, 31 Aug 2024
 23:04:39 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] tcpdump: upgrade 4.99.4 -> 4.99.5
Date: Sun,  1 Sep 2024 07:04:29 +0800
Message-Id: <20240831230429.3285535-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR03CA0005.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::18) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|DM4PR11MB6095:EE_
X-MS-Office365-Filtering-Correlation-Id: f493eb00-d639-4dae-bd0b-08dcca114a82
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?fd9PrQCvBWU/blnuA+3ZG1cQiaQRo+R0o++WTGW4gttcMkfOvDNn7spGoF0+?=
 =?us-ascii?Q?Ig5WHzSatWi+fP9bZRHC0rgwphA1hANMsseTaPH+Er+X2rrrKqnoD59F7E35?=
 =?us-ascii?Q?hZ8GbeL6795dSAgajd11qnFJo8JY10tPSeFhLSYqDHzTS7H3OhRov9NvAlur?=
 =?us-ascii?Q?qj+H14lZ94hj23UYP5txLYP4kNQfMC0w1yCXEh1zgusRM7jhQUTxkTA61Js3?=
 =?us-ascii?Q?Chxrb7cDLJOEj7FL5QhQ2u0M9/p83rde9EaoC+adfKYDpbc8Ue4BZyWiODWq?=
 =?us-ascii?Q?GTYTVzx17G7kxuodRRV0XIjB8wZah196q4CCIh6sBb7XbB+CScE6UpnMoXMv?=
 =?us-ascii?Q?SMYz8lltUL222Wa7I1NZIo5zY8vBq4yqoesDcG2irY8gn0mx4ifP6TbuyNkk?=
 =?us-ascii?Q?cJd/fhd0iwVAB+ept2szRIiqWG+4bZ2Gq/KtSSk2VQpsyie1UDlQ5yrRTgmN?=
 =?us-ascii?Q?FenQvYgm7jUp9aa37w+eQ0UKAoS1s2FHcBSC4MnZqxMzYwSyYbsb0UPZR78I?=
 =?us-ascii?Q?EqLrogxXATTe3YFn6nJSykKEzIeA7nVzW/FOwEHuPXph2/MMaRNvZ6tnQwXh?=
 =?us-ascii?Q?k2X5z3OnSY6I5JyjAvT3VuOfv60zFpPjUlPL8AT1cBNAgfLAJVM4DiB0juko?=
 =?us-ascii?Q?bQ3siON48e2lNAfEGx0xFCHj7VZiD09Q9FamJ1rs48qNhuwik/QC1jwKLlG9?=
 =?us-ascii?Q?lxMS+NGAIA/3G+G0kVjg+6Zw9XASyL0iyFz652ID4UzGtQp+9WSjwDOVkzMQ?=
 =?us-ascii?Q?rscljEfFrg5u2GpKYH5AgkI+LEdxiddRFxo/uwEzhnvwGb5mK+1B5VUXaH14?=
 =?us-ascii?Q?bsKyx2HJ5G7RzgMPuHV91I3h8f+cp1v44Gy5xqTYfcL9it+8OYsZlzn8o8UB?=
 =?us-ascii?Q?/Crlhm67xHSP2M9JC+62K1JKax7E6NzYo4N7WEqNNLWzuf6/bL/9kY/rmlY0?=
 =?us-ascii?Q?yY+xWruR86YN0wA3xQWQirTvQ//I0438XoltZLLpCNmsCQRn/D0V9mJn3jN2?=
 =?us-ascii?Q?U2rFd2dfbu/noVbJylHTBUz1ApU+oFVF8MrCn/nxwLBk5Gr007gwg9WwevET?=
 =?us-ascii?Q?fmo7MLuFsmGvui9PubESCboN4esLZtxJsXAHoBxOafnsroTif3/hLt6S57bZ?=
 =?us-ascii?Q?j/rTLZl67i31SM+U7maxDYSPml/DCqGTkDKdYPEtaactolbp7cB9U8yiO2kC?=
 =?us-ascii?Q?ZeV2+2JKvd/g1wt+tcovzYMZ8HTfTBIoq2YqACsslc2FiHFohTTNQTaJk/1p?=
 =?us-ascii?Q?uKBjMV3t3KmaedBD2GmVhzji3f8cbP0MckT+JuW37k6RDGGAgmJVYfVMY8dW?=
 =?us-ascii?Q?Xa9Fp7KINW9wfJ7cmN3id/VoLIYI8BNSDWC81aQAoZ3FHbN7AGNCVqP84jM1?=
 =?us-ascii?Q?6ripdPs=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Hw5Pi4+jmPU0Y9DettJ7gxwzE5wVGGQCOXpnU8WDox+q624HFEaXKG4WEUef?=
 =?us-ascii?Q?5IkXH7AIKcsE6jEw3Pj/X7nnBxza9ElQBMHSqzdm+oSXk+eyWRCBy2tFg4Ga?=
 =?us-ascii?Q?HJBdN550wLukCuS/yRDN9+BwpKqVUkwhmzJ6qwToMbQ6AO3qYeOLUg+EYI6m?=
 =?us-ascii?Q?+5lpz5ZsfILda6RlpElNIzW6CN4zpSKEdvFeId9/bYgKDJ9SUOs4/hOTzGw6?=
 =?us-ascii?Q?oQrtJEGEBe6IWV37ls8Z0LU2g05acUsKT5M1kO6lGcpRN+x4bQwmDWnSfl5r?=
 =?us-ascii?Q?qNx5YgbYKujh1+V7S+jwfuxHB07b9QaAmxjUeBshXADyLt9mBDpQmUsWCUC2?=
 =?us-ascii?Q?VLd+6+8yZNSamuIWutpf8SxsR7WKqN9Fj+C+EkGeTk0ytjJ1R3+kZVUF9K08?=
 =?us-ascii?Q?OKB2eUQ2laYqQ/VJThkIv+iMyBVkehRIhpWLWIIUgGtsdAS7AqHupFkEyAV3?=
 =?us-ascii?Q?gqOCd1aWiSzZcuIp81dQYtgj+SyjkfQ70grODl268lKy2Zm2Fnb+kBbL1486?=
 =?us-ascii?Q?hhl6D568SWT6qaaxTM32AdI9GsUQ3R+B6X2eQqWsSPiNtxBJ/crmKkRz9raZ?=
 =?us-ascii?Q?Nw9VuK7vYnOu2EaXtGNjvvgv2Vu4W8WQAXwZ/ES92e9nLRl9l/y2NwBGktB3?=
 =?us-ascii?Q?UWf6IvgKN7SsZimf0b3cCrohLysLt3jO3NmWhDIQBJIgRkwoEX/FdgpHMW2O?=
 =?us-ascii?Q?jd9dikVNkXncTRfK+tfI19buy6e1YlgZsG5r0hpAu4orkkM8WO2TRGCWZwYi?=
 =?us-ascii?Q?BKtEifen4Iz1kZLRRqWdvtiiomBiTmRiHYL0YByTI1WaZV1q1oC713p881eh?=
 =?us-ascii?Q?qWz/qUthbBm9hE+5PpreU5YIgN1NYf+cm0XEvoleYsYVuOEYqTQkgSN5o8dh?=
 =?us-ascii?Q?KxuAXSt3mCnhjWLwOJkXM86Xo32GxawQbHl3GZZbkKa3ZB1BdZUHJSzev1Fz?=
 =?us-ascii?Q?Cupjjj/erKzkiG65EAnGClQZLdNOE3SR8dtsW17RxnQ4L0vE6acrDMiKAIoK?=
 =?us-ascii?Q?bXSEogpPrxdMXU42AJc3MAWEg/bDlf1J5OKDwT/fRBbhk0vrQMKoxO4JpFhf?=
 =?us-ascii?Q?AY12hVYsVbpVMlF03AJfdiZmttOcKy0E/mrOwhmn3wfhNpQ7+b2FtFAaasS3?=
 =?us-ascii?Q?MDpSUGQQ5VdEZm44jtDE/hX/QdSmJW86PeoSTab/a1O5096bQq4IthMUu5os?=
 =?us-ascii?Q?Slj5W+9pAG3gysapJjk4ypEFtIDU3cRWITk4uZlifCdih3qckfcOmSlxAVts?=
 =?us-ascii?Q?ctVX/EV7rGjANQEqkyqyvS+Eob6F8xv2GJa9SPJiNAZtVXJ0oz1vXIvFflEp?=
 =?us-ascii?Q?Pzvk0IUNmAH3nveU9wjrt9+Rc9tU5spX0HM1h3jWg7JCn83FHnQI0/sz7MBT?=
 =?us-ascii?Q?LBFHs6xVWVI21w7uifVCE5xe6Qd50K11ax1iOzk+dIqWNeCL31maQL1FEoK3?=
 =?us-ascii?Q?u0cAvEsCk9pEbrl1FoVGJp3qQLMQpwq24Rs/DyLYoSsGsrCz5Zw00f53Ff0v?=
 =?us-ascii?Q?JwInTXb7uXbXk2EtbuSbW76NRmM+Yq3JzTr7HVXYzqP5m9LNUAiKTFL9ny13?=
 =?us-ascii?Q?zfMw6osy+6gttRd8k/PLM9mmw+IFeAQcz9U4pkRH?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f493eb00-d639-4dae-bd0b-08dcca114a82
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2024 23:04:39.5878
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ErCsqauWY4x1ff4LGlm0wbiUWrCftQ7fDVAo1H2WGVbnPSKpf2UP7oKnUkATanEZKDQ3/MsCZ51iOLQqA1sOgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6095
X-Proofpoint-ORIG-GUID: zMqy81dU6gWUi-hviFrK2T-Zy9IK1aWP
X-Authority-Analysis: v=2.4 cv=DN/d4DNb c=1 sm=1 tr=0 ts=66d3a189 cx=c_pps a=bqH6H/OQt14Rv/FmpY1ebg==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=yoJbH4e0A30A:10 a=bRTqI5nwn0kA:10 a=RwghQLH8AAAA:8 a=t7CeM3EgAAAA:8 a=mHr6GJ5fAAAA:8
 a=NEAV23lmAAAA:8 a=fk1lIlRQAAAA:8 a=eyHZez5xTxAN2rztOZMA:9 a=n9nybW_iuiH3Rhfh8WpK:22 a=FdTzh2GWekK77mhwV6Dw:22 a=N127T80v9oXcZuUJjtVr:22 a=U75ogvRika4pmaD_UPO0:22
X-Proofpoint-GUID: zMqy81dU6gWUi-hviFrK2T-Zy9IK1aWP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-31_04,2024-08-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 spamscore=0 phishscore=0 adultscore=0 mlxscore=0 impostorscore=0
 lowpriorityscore=0 bulkscore=0 mlxlogscore=999 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2407110000 definitions=main-2408310190
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 31 Aug 2024 23:04:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112066

ChangeLog:
https://git.tcpdump.org/tcpdump/blob/HEAD:/CHANGES

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../tcpdump/tcpdump/CVE-2024-2397.patch       | 129 ------------------
 .../recipes-support/tcpdump/tcpdump/run-ptest |   0
 .../{tcpdump_4.99.4.bb => tcpdump_4.99.5.bb}  |   5 +-
 3 files changed, 2 insertions(+), 132 deletions(-)
 delete mode 100644 meta-networking/recipes-support/tcpdump/tcpdump/CVE-2024-2397.patch
 mode change 100755 => 100644 meta-networking/recipes-support/tcpdump/tcpdump/run-ptest
 rename meta-networking/recipes-support/tcpdump/{tcpdump_4.99.4.bb => tcpdump_4.99.5.bb} (88%)

diff --git a/meta-networking/recipes-support/tcpdump/tcpdump/CVE-2024-2397.patch b/meta-networking/recipes-support/tcpdump/tcpdump/CVE-2024-2397.patch
deleted file mode 100644
index 69348030b..000000000
--- a/meta-networking/recipes-support/tcpdump/tcpdump/CVE-2024-2397.patch
+++ /dev/null
@@ -1,129 +0,0 @@
-From b9811ef5bb1b7d45a90e042f81f3aaf233c8bcb2 Mon Sep 17 00:00:00 2001
-From: Guy Harris <gharris@sonic.net>
-Date: Tue, 12 Mar 2024 00:37:23 -0700
-Subject: [PATCH] ppp: use the buffer stack for the de-escaping buffer.
-
-This both saves the buffer for freeing later and saves the packet
-pointer and snapend to be restored when packet processing is complete,
-even if an exception is thrown with longjmp.
-
-This means that the hex/ASCII printing in pretty_print_packet()
-processes the packet data as captured or read from the savefile, rather
-than as modified by the PPP printer, so that the bounds checking is
-correct.
-
-That fixes CVE-2024-2397, which was caused by an exception being thrown
-by the hex/ASCII printer (which should only happen if those routines are
-called by a packet printer, not if they're called for the -X/-x/-A
-flag), which jumps back to the setjmp() that surrounds the packet
-printer.  Hilarity^Winfinite looping ensues.
-
-Also, restore ndo->ndo_packetp before calling the hex/ASCII printing
-routine, in case nd_pop_all_packet_info() didn't restore it.
-
-Upstream-Status: Backport [https://github.com/the-tcpdump-group/tcpdump/commit/b9811ef5bb1b7d45a90e042f81f3aaf233c8bcb2]
-CVE: CVE-2024-2397
-Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
----
- print-ppp.c | 31 +++++++++++++++++--------------
- print.c     |  8 ++++++--
- 2 files changed, 23 insertions(+), 16 deletions(-)
-
-diff --git a/print-ppp.c b/print-ppp.c
-index aba243d..e5ae064 100644
---- a/print-ppp.c
-+++ b/print-ppp.c
-@@ -42,6 +42,8 @@
- #include <net/if_ppp.h>
- #endif
- 
-+#include <stdlib.h>
-+
- #include "netdissect.h"
- #include "extract.h"
- #include "addrtoname.h"
-@@ -1363,7 +1365,6 @@ ppp_hdlc(netdissect_options *ndo,
- 	u_char *b, *t, c;
- 	const u_char *s;
- 	u_int i, proto;
--	const void *sb, *se;
- 
- 	if (caplen == 0)
- 		return;
-@@ -1371,9 +1372,11 @@ ppp_hdlc(netdissect_options *ndo,
-         if (length == 0)
-                 return;
- 
--	b = (u_char *)nd_malloc(ndo, caplen);
--	if (b == NULL)
--		return;
-+	b = (u_char *)malloc(caplen);
-+	if (b == NULL) {
-+		(*ndo->ndo_error)(ndo, S_ERR_ND_MEM_ALLOC,
-+			"%s: malloc", __func__);
-+	}
- 
- 	/*
- 	 * Unescape all the data into a temporary, private, buffer.
-@@ -1394,13 +1397,15 @@ ppp_hdlc(netdissect_options *ndo,
- 	}
- 
- 	/*
--	 * Change the end pointer, so bounds checks work.
--	 * Change the pointer to packet data to help debugging.
-+	 * Switch to the output buffer for dissection, and save it
-+	 * on the buffer stack so it can be freed; our caller must
-+	 * pop it when done.
- 	 */
--	sb = ndo->ndo_packetp;
--	se = ndo->ndo_snapend;
--	ndo->ndo_packetp = b;
--	ndo->ndo_snapend = t;
-+	if (!nd_push_buffer(ndo, b, b, (u_int)(t - b))) {
-+		free(b);
-+		(*ndo->ndo_error)(ndo, S_ERR_ND_MEM_ALLOC,
-+			"%s: can't push buffer on buffer stack", __func__);
-+	}
- 	length = ND_BYTES_AVAILABLE_AFTER(b);
- 
-         /* now lets guess about the payload codepoint format */
-@@ -1442,13 +1447,11 @@ ppp_hdlc(netdissect_options *ndo,
-         }
- 
- cleanup:
--	ndo->ndo_packetp = sb;
--	ndo->ndo_snapend = se;
-+	nd_pop_packet_info(ndo);
-         return;
- 
- trunc:
--	ndo->ndo_packetp = sb;
--	ndo->ndo_snapend = se;
-+	nd_pop_packet_info(ndo);
- 	nd_print_trunc(ndo);
- }
- 
-diff --git a/print.c b/print.c
-index 9c0ab86..33706b9 100644
---- a/print.c
-+++ b/print.c
-@@ -431,10 +431,14 @@ pretty_print_packet(netdissect_options *ndo, const struct pcap_pkthdr *h,
- 	nd_pop_all_packet_info(ndo);
- 
- 	/*
--	 * Restore the original snapend, as a printer might have
--	 * changed it.
-+	 * Restore the originals snapend and packetp, as a printer
-+	 * might have changed them.
-+	 *
-+	 * XXX - nd_pop_all_packet_info() should have restored the
-+	 * original values, but, just in case....
- 	 */
- 	ndo->ndo_snapend = sp + h->caplen;
-+	ndo->ndo_packetp = sp;
- 	if (ndo->ndo_Xflag) {
- 		/*
- 		 * Print the raw packet data in hex and ASCII.
--- 
-2.25.1
-
diff --git a/meta-networking/recipes-support/tcpdump/tcpdump/run-ptest b/meta-networking/recipes-support/tcpdump/tcpdump/run-ptest
old mode 100755
new mode 100644
diff --git a/meta-networking/recipes-support/tcpdump/tcpdump_4.99.4.bb b/meta-networking/recipes-support/tcpdump/tcpdump_4.99.5.bb
similarity index 88%
rename from meta-networking/recipes-support/tcpdump/tcpdump_4.99.4.bb
rename to meta-networking/recipes-support/tcpdump/tcpdump_4.99.5.bb
index b05b832dd..32b869f24 100644
--- a/meta-networking/recipes-support/tcpdump/tcpdump_4.99.4.bb
+++ b/meta-networking/recipes-support/tcpdump/tcpdump_4.99.5.bb
@@ -21,13 +21,12 @@ RDEPENDS:${PN}-ptest += " make perl \
 "
 
 SRC_URI = " \
-    http://www.tcpdump.org/release/${BP}.tar.gz \
+    http://www.tcpdump.org/release/${BP}.tar.xz \
     file://add-ptest.patch \
     file://run-ptest \
-    file://CVE-2024-2397.patch \
 "
 
-SRC_URI[sha256sum] = "0232231bb2f29d6bf2426e70a08a7e0c63a0d59a9b44863b7f5e2357a6e49fea"
+SRC_URI[sha256sum] = "d76395ab82d659d526291b013eee200201380930793531515abfc6e77b4f2ee5"
 
 UPSTREAM_CHECK_REGEX = "tcpdump-(?P<pver>\d+(\.\d+)+)\.tar"
 
-- 
2.25.1


