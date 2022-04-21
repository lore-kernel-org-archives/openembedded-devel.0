Return-Path: <pawan.badganchi@kpit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04576C8303D
	for <webhook@archiver.kernel.org>; Thu, 21 Apr 2022 16:46:13 +0000 (UTC)
Received: from IND01-BMX-obe.outbound.protection.outlook.com
 (IND01-BMX-obe.outbound.protection.outlook.com [40.107.239.55])
 by mx.groups.io with SMTP id smtpd.web10.21538.1650548726774776019
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Apr 2022 06:45:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=K2YtBceB;
 spf=pass (domain: kpit.com, ip: 40.107.239.55,
 mailfrom: pawan.badganchi@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ksLVwfs5fIpcvq77Q/szX69lSHiCdavEefMYWgvx8NvAnhhxZiFmcZeoMwNCR0NStYXYXYFoVeWjN2FNTG98NJJu2zTIhijjTKfEXYr3CTTY9pVNFv5KC5Z+ExPDOQIFsblma6MyOHLOObqciH8B0vsnPpOOtSnVvk7N/+rakBy0TKD79QiqsNk/L+GpCPXfNu4JGPm1eA8oPhjbCUeF8zw43Xh0Nia6mpBGmO3W4ij7xkz76xvpcIVZ2JObJK9DqW0u8scBwP3pbHivkh2ndPp8eq1xRA5iUFFod6m0ANNrWd4Gr9frGqEKVIZWTxCrou2aM8V2Y9t0FqiI/VUbCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zRhhiGROj/Qo04v2TTsC0BG4vRm1nD4aG0DrvkEMoHo=;
 b=laOwjPKm4icZsoOyOnVPGn8KlbLlgby0DCUFXL0JRxxWxvw6ge+aaqW9j83Hh3DjMiEk5rQA/SkJOrzUK4C7ZxwgytPjo1EE3jdJCmZZqsV1AqYKw5xm466LykiRL0eBMQZKgawxCDEojnlouVKMPpgQXBKNYyrWGfJboAaE+oVddXkX1QY8y6ufjCQLhZQG63ILvEY+3fdqoC60dooU9YGI2zCFrphtMCwlp2hCgcTZ+G4nYYMRw4IIk72tjBFtzUv7jXK/l+BnCwXfc1am0g78Nu2eI65zeAFZFOtPOUQvRDUr3/LhO3GjjJdgRQ/WA6csdoAyopLe/Lteh2oKmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zRhhiGROj/Qo04v2TTsC0BG4vRm1nD4aG0DrvkEMoHo=;
 b=K2YtBceBEx4bgPeqlaEUZUb4eHmacKhUycELgbisEuj8hgdXicdx/eXZwePABz2dGaEcgXfu0+qRrSG2ZHDDo3UXjEWl7GrywMDOD3SLvXggGLncmZnMV5GLp9BZ22L5aZaQaRTMAN2egcwmBkr7vLNPGia46TDJskGFlthXH80=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kpit.com;
Received: from MA1PR0101MB1462.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:28::11) by BM1PR0101MB1970.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:1c::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.13; Thu, 21 Apr
 2022 13:45:22 +0000
Received: from MA1PR0101MB1462.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::6c6a:548b:35fa:55e4]) by MA1PR0101MB1462.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::6c6a:548b:35fa:55e4%4]) with mapi id 15.20.5186.014; Thu, 21 Apr 2022
 13:45:22 +0000
From: Pawan <pawan.badganchi@kpit.com>
To: openembedded-devel@lists.openembedded.org,
	badganchipv@gmail.com
Cc: akash.hadke@kpit.com,
	Pawan Badganchi <pawan.badganchi@kpit.com>
Subject: [meta-java[dunfell][PATCH] jsch: Whitelist CVE-2016-5725
Date: Thu, 21 Apr 2022 19:15:06 +0530
Message-Id: <20220421134506.7421-1-pawan.badganchi@kpit.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: BM1PR01CA0152.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:68::22) To MA1PR0101MB1462.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:28::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 389e0c17-b7d8-4b47-dbdf-08da239d2e44
X-MS-TrafficTypeDiagnostic: BM1PR0101MB1970:EE_
X-Microsoft-Antispam-PRVS: 
	<BM1PR0101MB19700866CCF1BD07891D83A599F49@BM1PR0101MB1970.INDPRD01.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: quoted-printable
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	4fG9RRwgh3IL7tgX7YEtF0ugPX0wd5/5V1Tu6GrKpUFxi/kjZrtqJrKyXwezFKIeyLF76OOgYNeMjvUx+YT8wleaI/zSCUWYtRQReylvg+Q2AppFE7jtt3gIbmx/+q60T83KpT+RAmMRWZkeOfAyQKgoudtx/GHC1Gc2g9/0Xscj+CKLV1/RqfCL5Sq4vb6LfnIcOZyCjzi1Ez9vQZ2pcuhsMTJSAvG7gchuRYiJTNBFaDC44mkOlABu2pkIxoVEEq4Rs0ekMxISBCaW4oXk4hPxkSLc3AZ5RpHmdb6omAn7r/smERLsb505eziQ8z1ukaRJDmR5G/JfyO8GVJtisuMrw8T9CTx7mzvrKYWT9QL2yxG2bFNClvR8/4lzBxtDV89Bd2XwNx4XrpnV2BYkm2kRd8xrSVpR0z0orxo+XpkNE1w6S8iFFpuTbq6pXWbBIA1g9c2DA8oh+wIMeJdi8fvoQZjxsn/y2WX/fTZkd+a0PFXpsAQOfA1tojPx9zIDEYom9k3lSWsUTfflMf6HvcFThAXIAgw43z1LBnL1U25fBQ81ye/frn/a0ACHypkv+UHHSza/gB75HmveVpQ5VMXLpUnfMJ5/N6lHr7Ug6LyGIQEIkaBp4q/iHCb5CuBjbjvAvvUBwo+KRTpukaGWUMl/hsRHAMINe7+z6hMJAjEOwyQ1epJYw7fvI6mi+xBPc/chSkVKqMBkU/aZeM6uwBEqSkUBVLz6tlVVR0CigfA=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MA1PR0101MB1462.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(4326008)(8676002)(66556008)(66574015)(66476007)(316002)(66946007)(1076003)(6506007)(186003)(86362001)(2616005)(107886003)(38100700002)(8936002)(6666004)(2906002)(52116002)(83380400001)(508600001)(966005)(5660300002)(6512007)(36756003)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Hv1rM4nz15uqNax0vfK0AvcbudcvSGuKujLvpTgONZGFZqUE3kbt0pXxQkV3?=
 =?us-ascii?Q?Nime6tv1teQr803mH0Pvf5b5T5HRKjATFvOpPKHzTGQfRVl7zWyzxaPoAjYJ?=
 =?us-ascii?Q?HBpCjpPhGY0+3z0C5pLRyjiBmd/yajs0NZ3Nh2s5x3yf4U/Zmlw6ApUYnI3v?=
 =?us-ascii?Q?m9qX7+m4Kxgmk3TQDNWjN6Rk+xIHnCsxl/f2EGyvU53RBhw82Nv1+R+uv8gz?=
 =?us-ascii?Q?9AGzb4OXe0unrg2GiMARLeKrWj+THTmxyfPFfGhPes5v+MFF3jak6ySkf1JE?=
 =?us-ascii?Q?tKWHz10+OHyvFupo8zzy0wgbI+f9f+BpnvdCRSUHT0KGveVFNCh/3qRi8t2g?=
 =?us-ascii?Q?4ahPASRbtd9sureS+5V/XzA2InRRTCZEuGJNhok/kPJgKr9WDAfIHFUQByHl?=
 =?us-ascii?Q?V+ainD8nfjrnLyi/3TfrN+4+Xtvbtz3hPYNjJGDNIkUlrRhHGBvDBQqrTBGY?=
 =?us-ascii?Q?Az2XnipoWfCg/ioXer1QXLrn6D9GGtfTI3o514Dv2C23kOoCBzm94eIspHnO?=
 =?us-ascii?Q?7HDl4lFFy3QGPGnPJbyHiOlwe38SiBq4pyMxHZ39DRfBvDglv8u9VwmpgoTC?=
 =?us-ascii?Q?kv5jobCFvlvvbO+4imkik5r3PMZoqEKt8LzrgKDKZsCr63iMoOs9wOVMUhXS?=
 =?us-ascii?Q?8PCpAeSWCa8GSPTQb+x0DM68lBqKX+m4LXhTXu1iRAyJ3f6VpImCE8MeyL3k?=
 =?us-ascii?Q?YAKdnKCcpbYjqYhVZ4wUgPIA33/s653WWfr4ofDGNgBaC3aaATkL0CmVw89i?=
 =?us-ascii?Q?cAGZ4zf5QCeJPy797VysU8kXmBhNlao5AdcGWdzGeAa8R3GbDrMoq4ltvmZ5?=
 =?us-ascii?Q?agEeMLTdYgUY/vOqBsCRKJ+Fh71TfOkQdmq3ZLelBvhwOSiAJ2TiBZL9XhFt?=
 =?us-ascii?Q?wtRVfCrWghD1vpJFa14M6IVmnfqKZYGaslnO1BP9wZGMi1x42nciw+4yej2j?=
 =?us-ascii?Q?UaGjn57D4S5qp+SoqRyQvI/CB6bR98CRfA5ZxmTQuW4Tqg02+bEZwuTa7j1h?=
 =?us-ascii?Q?C6qiUih4yHqkSSl5D5Ii98deSAzt+69FZqshWOVvNK3mkigzNir95HTGlDTe?=
 =?us-ascii?Q?jrkgv7goCkEQzaZhsmq8dAbjJ3PUMBPK0SYg57tP8bn/1dO6QQPe4df+j9gs?=
 =?us-ascii?Q?64GRqEJaNi1BMMPwhEOwYylUkA4zmz3saqemGmxIr1TWAMTo8oBw7mc+ykB4?=
 =?us-ascii?Q?bZu+/nZwbnCubKHedUx4ba7MK3ijsAzlNBYeALaUC4UtQGzm+dxnlcFwzthX?=
 =?us-ascii?Q?UitX5T7xX7SL/u3rdXqCWPaOh7RJhwB4HgoQIyYLtYRcpOFKjYDub+JAYuI+?=
 =?us-ascii?Q?Jkr5QPjF02jkoEalGC8oqMvfwhdOnaYopOnd/1sKDsG/6HGjxcmWSEsR6stn?=
 =?us-ascii?Q?f38Wn3W8oSgyh6pvvoB3VFcuqVa0akNV5K8/jlnd2Gc5TQ6QmuZj2HYh7VsQ?=
 =?us-ascii?Q?imYUKmzAVztf3C1ogw0i3QIgT/C7vvfC5s8bYlCNDhyiMrBuXlJ93Uf42Wkp?=
 =?us-ascii?Q?/LJENLUykNDH6OxN4UVJhOftcd3YwuEGdr2mYMmO4ZPa0LM2debPzMZbsxSp?=
 =?us-ascii?Q?yNGSSlrgNHJXdEcWA+vbo1NSN+lYFaeYVEmaCtIOH7f5Sg2miukYcJeRWijK?=
 =?us-ascii?Q?xrEjI8uKuBZ8wtkMYZmq+BKnqCitWx07PPV+A1lW45gE+ioRzJ91aIx78nsQ?=
 =?us-ascii?Q?gVYGyBXOwPIomWYHRHrlMpy+e3a5dXLy8yAghpHgmrpmLPI72hWR5GLlVdGD?=
 =?us-ascii?Q?pGMYrIq2hMhviqgmciZSnzmpfzn0IHIoReEgV1B0DfVmGlu2/fu0StwykwgW?=
X-MS-Exchange-AntiSpam-MessageData-1: 2u+lNga/aACNHg==
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 389e0c17-b7d8-4b47-dbdf-08da239d2e44
X-MS-Exchange-CrossTenant-AuthSource: 
 MA1PR0101MB1462.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2022 13:45:22.1792
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 xoNsSrjGtGbyfvqES/QZZI0l6IYOdyGH3nbSsyO+VvQHiPoyM1f2LnexVXwCuw9e7tPPVI6C5SXChA4g5+el6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BM1PR0101MB1970
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 Apr 2022 16:46:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96728

From: Pawan Badganchi <pawan.badganchi@kpit.com>

Whitelist the CVE because it only affects windows platforms
Link: https://ubuntu.com/security/CVE-2016-5725

Signed-off-by: Pawan Badganchi<pawan.badganchi@kpit.com>
---
 recipes-core/jcraft/jsch_0.1.40.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/recipes-core/jcraft/jsch_0.1.40.bb b/recipes-core/jcraft/jsch_=
0.1.40.bb
index a0f70d8..1170095 100644
--- a/recipes-core/jcraft/jsch_0.1.40.bb
+++ b/recipes-core/jcraft/jsch_0.1.40.bb
@@ -25,5 +25,8 @@ do_compile() {
 SRC_URI[md5sum] =3D "b59cec19a487e95aed68378976b4b566"
 SRC_URI[sha256sum] =3D "ca9d2ae08fd7a8983fb00d04f0f0c216a985218a5eb364ff9b=
ee73870f28e097"

+# Whitelist the CVE because it only affects Windows platforms
+CVE_CHECK_WHITELIST +=3D "CVE-2016-5725"
+
 BBCLASSEXTEND =3D "native"

--
2.17.1

This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print, retain copy, disseminate, distribute, o=
r use this message or any part thereof. If you receive this message in erro=
r, please notify the sender immediately and delete all copies of this messa=
ge. KPIT Technologies Ltd. does not accept any liability for virus infected=
 mails.

