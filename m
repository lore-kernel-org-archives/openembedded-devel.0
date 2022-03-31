Return-Path: <potin.lai@quantatw.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C71AC433F5
	for <webhook@archiver.kernel.org>; Thu, 31 Mar 2022 02:17:08 +0000 (UTC)
Received: from APC01-TYZ-obe.outbound.protection.outlook.com
 (APC01-TYZ-obe.outbound.protection.outlook.com [40.107.117.97])
 by mx.groups.io with SMTP id smtpd.web11.2397.1648693026246624368
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Mar 2022 19:17:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@quantacorp.onmicrosoft.com
 header.s=selector2-quantacorp-onmicrosoft-com header.b=SMcZSnL0;
 spf=pass (domain: quantatw.com, ip: 40.107.117.97,
 mailfrom: potin.lai@quantatw.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IxHyg0LzlhoI//N4NIkqTyDai31bOmLPju6r4neOONhDtt8JBK/CqRYd2GJxjQpXFTQgtP2Bs8RNq4eazOb0SibQHpK4j6mnRiGBvvL3cLE9XO/UgMdRean+uV6tveaq8KHYqZHdnB5CLW9LmzPwmrlALZuTPTgG/mINEUuI6lTAGuHkhmC0Z+JfMRueDCzoQRun2Ai6iGoApsLI65hsUfcRODRBEHZnsnP+V2+esch1oxdn/couisgB/2ZY6q84k+M1IiVTRPp9jwSIZSkiDrB3DWk3Gz1mrsh41eNkuOtvEdHx6zQbJ0KktguQDvEnLQRh+gUHd6L/nkFhfKaBDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a7/pX5DLLzhskLf9doJu5OqLkJjXudLB/DWfUP/qzR0=;
 b=LoWOPelCppb8vNk+35ga39bpxRCxa3C3A2NH9EtcbsFRfLRxKvCwhT/yLb1IOk0xmvY2xDK8UYe8JL6g1/9hbXGJFzlkvCHZN5K6Mi+NC88kvV410l2+7Cn/VHLCqbpqyjqfJ0CTuJWAOnZMPmgavlLZT2m7rYEETevsK8ZoF+Lv0OWkkMZQmk79Cb9STPTWTQ4EbGbPALTA3k8OzsaNzv2tHvCaYtG5VUTAXQHyD0Qlk43lvXFXEpc3z7RFFIQb1AUp6/o7SSX5SHBPVcQrhPGHQNZ3CpuXSssFJ9muhUPF4SnotwYTHld8Pvm85m7oJvyyQdpNWOpwxMsBmAdTiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quantatw.com; dmarc=pass action=none header.from=quantatw.com;
 dkim=pass header.d=quantatw.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quantacorp.onmicrosoft.com; s=selector2-quantacorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a7/pX5DLLzhskLf9doJu5OqLkJjXudLB/DWfUP/qzR0=;
 b=SMcZSnL0JlkwD32YuUvw8ZPlHiO3O4mv/j303l6+BXglAHbgp2iQgWG4k9dhfGpgU+r/tIy8MREA2WemEIdn/SXnSNwepaWbD3igEa9iTUYPrLXwETmYTp8BVjGSNsOU++SyomiDZZBCCRqR1peUko0Tekl1dXeUsPrg9bJZ+V8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quantatw.com;
Received: from HK0PR04MB3282.apcprd04.prod.outlook.com (2603:1096:203:89::17)
 by TY2PR04MB3984.apcprd04.prod.outlook.com (2603:1096:404:8002::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.21; Thu, 31 Mar
 2022 02:17:03 +0000
Received: from HK0PR04MB3282.apcprd04.prod.outlook.com
 ([fe80::7cfe:c9ba:7793:f42]) by HK0PR04MB3282.apcprd04.prod.outlook.com
 ([fe80::7cfe:c9ba:7793:f42%7]) with mapi id 15.20.5102.023; Thu, 31 Mar 2022
 02:17:02 +0000
From: Potin Lai <potin.lai@quantatw.com>
To: openembedded-devel@lists.openembedded.org,
	raj.khem@gmail.com
Cc: patrick@stwcx.xyz,
	Potin Lai <potin.lai@quantatw.com>
Subject: [meta-oe][PATCH v2 3/4] libirecovery: add recipe
Date: Thu, 31 Mar 2022 10:16:47 +0800
Message-Id: <20220331021648.16582-4-potin.lai@quantatw.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220331021648.16582-1-potin.lai@quantatw.com>
References: <20220331021648.16582-1-potin.lai@quantatw.com>
Content-Type: text/plain
X-ClientProxiedBy: HK2PR02CA0150.apcprd02.prod.outlook.com
 (2603:1096:202:16::34) To HK0PR04MB3282.apcprd04.prod.outlook.com
 (2603:1096:203:89::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a07af85f-7383-4c6f-cafe-08da12bc8abc
X-MS-TrafficTypeDiagnostic: TY2PR04MB3984:EE_
X-Microsoft-Antispam-PRVS: 
	<TY2PR04MB3984BE37A8FD3B31110A65508EE19@TY2PR04MB3984.apcprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	8ijzcF5J/xGdAGxUsgpqK2YsimE4I0mzfOHu8RtCX5Ji1e51UBnH/g3zbFB5kTpMIByfKdszJuI9JC/K4unsH7512Ks7/iIJFqUnxPvp90PY/I6tUOVKvMWatrcmSY4wdIVJc/AllTX+os+6apCoYVdVMIUUlu7G4UeZurLifCjkUJD5Zv6xxzfKFNwcEAerFHYwXgEv+0vYbguPcSRrfk+iDtDtL7yFby2Xre/JERHBXFSuqRr+S/PhhHUpefaM/giAffZB6VkskwAJXrdspwP9zTL8USqwGL89EtAotOQFCY4GPOUMLEcNr9e8q4wuGNlXwdo4lADRVSL77107yRdXcXtkbbV5E3QHrHf8xKLV/BEZEE6xtH1tiMdfLjhi3j5RE+RjGoAuj/7E94dggEcKMYkVmExxrrF+s5u3iYO6GDUsd67/lPVsLZ+kbvh+jn8QenaUL+Qt96D/ER62Vks8hjEk6fcJ8lFmtW4CAXETN1WQSTGlb039kQDInqCl7J3D4NvF12iHxT9kSgF4Q1v9MXcjgqlAcswxku83AAc9KwGvQkCyFz7+G3y8J4zBS4881lA2PmgFAH0Cd/8x6fDU/O2SWRhw5QtDeiFd9JmnZJmFzoo+J4R+Jet/zTMgC6J025qKzYhHygnb+grN3Ag48aQUIK1J5/70C/mzuL20clJsttBQel1O2N0q2Uy/WyDDrkyXnELoFwu1JO5AazAnPSiDY5EIebkN6OG3wewE9LyuVyLHvQuiprJ2OibD1IhGZPAqWQNhy8Dd4XrFG8X75nunlfnMNauYMbd1BNQ=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HK0PR04MB3282.apcprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(2906002)(52116002)(316002)(86362001)(6506007)(6666004)(6512007)(38100700002)(66476007)(38350700002)(2616005)(26005)(4326008)(107886003)(1076003)(186003)(8936002)(44832011)(8676002)(66946007)(5660300002)(66556008)(6486002)(508600001)(36756003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?7eJvJeGCBlgwuYZG7Sgelb7OKFrQ/n4dab4zFf6WgRZ/bQPUcI7f3I4n8pDe?=
 =?us-ascii?Q?2fSdbEu3uwsXUthrrqQnhVJnETr69GcvN7Qh/GYF6EULKW19S/777xZkPSGC?=
 =?us-ascii?Q?500iCbeSJJ7xHrm98TIH+RtXSuSFwBil/QpBXFn5vOiSfM0Xft7oCB1RL+7c?=
 =?us-ascii?Q?ZQm3SCu7tmErw8iWj0q9rIqZtM5FD8tvB+8Wae3SIa1SgE1G/ZwlaH8aEtzF?=
 =?us-ascii?Q?nliRl+oWNwsUmL9iYdidxpmecEEcj7mIL9tv6NQ+o+MjN9Gl2UJxJNeVFDJx?=
 =?us-ascii?Q?NtBYab9VjLj8vlT8/ZWHaDE7Qe2csVhrylfVpsLeFoUnr0RTBlIo4VCG7y2h?=
 =?us-ascii?Q?8GyzNvO3ITo96PNhRQVJDo9xO/SeQ86H1mezHjRfHBATpKWUsk5ntEzQ6Zbz?=
 =?us-ascii?Q?l/QT+vWg7nWloifkV2vsoPT9/xsUd/Khpv3Zo8mGtr8d5LwgJMBhjO7jNUMu?=
 =?us-ascii?Q?WK7jFIkrKv4Y8/HL3m5dLCydT16Xc8R0c9sn9Q+5VSz98pQL4thM5zlwM84O?=
 =?us-ascii?Q?K6nQz6YkhXmBnmzHjnHNGW6Bc6YUQbJyMbFlsfxy/C0vxJ5qPdlD47pz1ahQ?=
 =?us-ascii?Q?71kj8mOsduWQDKotSJ2IBbenwZ6qM4MsOYmQEqLirqXd8pahJSxE8yL8byDE?=
 =?us-ascii?Q?4hKq87FYAjx8JamJRUS0LxD8Fi71izV+gnvi5wpydL3Tu2bn2Vj9HtFvZRSe?=
 =?us-ascii?Q?XISnOMZh5CBld5pK9CKpQP+08S6XN5lYFSd9t90XrYta4Oijb2O6ccgCuzPa?=
 =?us-ascii?Q?K/WDis5SDcDeIx+U6vWnJw4nvXvIJmgH/Cs9eCmsT6t1umHSeMxDZ1Bu0BXl?=
 =?us-ascii?Q?IjLfCiskBDy2RVFRbVN+gOaYR7sgKTei8BypBGSwDcm/beUp2uXe4x9TLrSO?=
 =?us-ascii?Q?BP/l6mGW0H/hgnlwhQJR7+gNFOQsPGuw8/NldMzORxIWaypYWc/O/mLVUpjx?=
 =?us-ascii?Q?8zFhfuQhWK1SpTlv3f4dFRfy+R5+tGcj75OaW1IUYfE948RvbKN+GBYuwPOY?=
 =?us-ascii?Q?+0hKNtk8r5z2NNgcfIqObAMz6Ztu9I3mO+7wJffthjZGDybhyx3TPdscTd5T?=
 =?us-ascii?Q?ZiT/VvLFCdl4WFyAMBtMY1hxtxTS4lb5LsGAXWv4jqs/yD/VTjvsH4HB6y1g?=
 =?us-ascii?Q?fYZq271w0L9jLNv6wkUcbx+xUEawvgU+ccia6oZ7Hk3mwAcpd1sxBACzIEya?=
 =?us-ascii?Q?thJM5yJhB0VHOvqPS5xC4ndJeQiH6FsiGCC/7JtrVe077OCcie5iOLQuugVP?=
 =?us-ascii?Q?M1BofKzG2Q9Ok91jpTEJVUgaoDa/upescgGSZQh3FQbTueQkvSyls9i1+Zab?=
 =?us-ascii?Q?cmhs1bxXcrLG/5KmZYzEKEAcUak9YnCneLNRbOOmOjRqBxqI0ik2BBB6TSW3?=
 =?us-ascii?Q?HsSrelN6kR57I2+3lvhIpiELygfWuj53hK3zwXza65G3M1ohYrgLU3axfiwJ?=
 =?us-ascii?Q?Yfas0V1TGRZxU4Fm7HLPXwsHE2Z+ORlaiEoIbmGarKPgQRWLJWPfK88i/JrK?=
 =?us-ascii?Q?KAJOyqe962Hy9PaXKZu9MmaQA87iK10mPqINceXFrPrwoF79xGEVRE8VyxNw?=
 =?us-ascii?Q?MiYWdh6sz/Ju5XfZSnq+WfXJ6of1yXRn2jI6ziLFcx4rm5SuqjbHjPs1knyB?=
 =?us-ascii?Q?dcH7DS9+C7kLM3wGKCDDksTGusx4/mZVSpWq4k9cYN3RDCN7tugpdnixsNTP?=
 =?us-ascii?Q?gAwOJRNTzgoiA9UWtqk0bCIsfNva4IqPbk1AbdbOJrhiT/I/1ZrHi5x/gtth?=
 =?us-ascii?Q?JiQ7HkRhJG3TOoasbIXwfUPl8NVnS30=3D?=
X-OriginatorOrg: quantatw.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 a07af85f-7383-4c6f-cafe-08da12bc8abc
X-MS-Exchange-CrossTenant-AuthSource: HK0PR04MB3282.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2022 02:17:01.9157
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 179b0327-07fc-4973-ac73-8de7313561b2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 XI/psVf4J5Ud5bqiuYrDBbIkRbkIArYt7grzqQE0rbRYExJBGQyQqLBRC3wjUQfc5ePYWonuRLJLuWePCEMt+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR04MB3984
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 31 Mar 2022 02:17:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96278

libirecovery is a cross-platform library which implements communication
to iBoot/iBSS found on Apple's iOS devices via USB.

Signed-off-by: Potin Lai <potin.lai@quantatw.com>
---
 .../libirecovery/libirecovery_git.bb              | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/libirecovery/libirecovery_git.bb

diff --git a/meta-oe/recipes-connectivity/libirecovery/libirecovery_git.bb b/meta-oe/recipes-connectivity/libirecovery/libirecovery_git.bb
new file mode 100644
index 000000000..30c633caf
--- /dev/null
+++ b/meta-oe/recipes-connectivity/libirecovery/libirecovery_git.bb
@@ -0,0 +1,15 @@
+SUMMARY = "The libirecovery library allows communication with iBoot/iBSS of iOS devices via USB"
+LICENSE = "LGPL-2.1"
+LIC_FILES_CHKSUM = "\
+    file://COPYING;md5=23c2a5e0106b99d75238986559bb5fc6 \
+"
+
+HOMEPAGE = "http://www.libimobiledevice.org/"
+
+DEPENDS = "libimobiledevice-glue libusb1"
+
+SRCREV = "e19094594552b7bed60418ffe6f46f455e6bb78f"
+SRC_URI = "git://github.com/libimobiledevice/libirecovery;protocol=https;branch=master"
+
+S = "${WORKDIR}/git"
+inherit autotools pkgconfig
-- 
2.17.1


