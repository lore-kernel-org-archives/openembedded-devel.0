Return-Path: <Angelo.Ribeiro@criticaltechworks.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBE26C35FFC
	for <webhook@archiver.kernel.org>; Tue, 17 Sep 2024 09:01:47 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.77])
 by mx.groups.io with SMTP id smtpd.web10.16735.1726563698916108460
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Sep 2024 02:01:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@criticaltechworks.com header.s=selector1 header.b=hdoDRyQv;
 spf=pass (domain: criticaltechworks.com, ip: 40.107.22.77, mailfrom: angelo.ribeiro@criticaltechworks.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nTBNSRh5RIJK08l/g+ldSIgFEc9UPL6v/7uMmoXt1aEv24DzYKx/O30nMA+5XnCcs1H+WlOvNmOM+DpF+yBMA1RVlNVvpuqsOGxyukX9C6T8uJc0m9si0rtA0sSULXvcPyY7TAbtFazGmF65tVUfFENRbK6oq11r4x8fVYhO3yr9BMhxkhHQ7+kpSIUnru4FZ5oU3tLw8ONMzD0LlI+jvrvxHgUxWnA7uhpzjA26sYT941bx7NrD3UvYyz85VmRwhkki1rDeN2g5oAU30aaYVLPZCVBUSGI5d+5wYh3OcgysveoQfZbp7NPWGiBRPf4FkZovSkp62eHKYhC0dw9NSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SIB4Ne1cw6oAqESzPQJTO/zp2NQLsyMwoaWtp0M8mds=;
 b=TwH+YeF+HUaC7Qj0rYeZ+Qxt/EMGh/YDoGhwZCYb00W7WnnvEMaS40wSRQuIBkYWoMQPnwCw4AsJebK2gXm/mr9nzxayyUFVd1j9Q7yerloS0xiD9d5f7P+/6Lfu4QCFH4pDEPFUtQ1d1uCQvvbID1fxILS6cj6hWc4SJLXSY5enK/rPDBgJ3I7lxYgY213fJPupWp7uRxvE0Y5bZySaKh6GyRo7XBu28HxCnn67uJHz9cnurc0YxWcWwpe6dC+vNyrNEJwPjaZaiLe2X78xGthmwBwV5ZbJdS5/gxth43LQTKpkSRmj8TolUeCexW2eBSEPg0LyoPp3OZspxkJI5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=criticaltechworks.com; dmarc=pass action=none
 header.from=criticaltechworks.com; dkim=pass header.d=criticaltechworks.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=criticaltechworks.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SIB4Ne1cw6oAqESzPQJTO/zp2NQLsyMwoaWtp0M8mds=;
 b=hdoDRyQvimedkEe3aQK62YF++A0i4LaZAdMtKMUbbjA0WPSC6YAIqUvjmVMUiyA+KEgTuLrYk+oqSPTxv4nngNzT+3ZuSE7YaKVhZwAqIN8LRL+IKXwZKBZc9+9+FWDC3D7UiF8cgtdEqcvAWTDh+y14HA0QKccsr3qnuAzKpcv32FvLg0xbVn7UoHgDiAwbdAlmD1iKEpvi2cUSfLmTMPxKlsxkzF98EGCIx+dnOXABi1nXt7nP264rK88DSBRst2YkWafvk0YBm2kFQwIPdyCv5C4p0lthYGSlbHjjMl1nPVg1BB6NSrTzIGQ8Jjfl7XIFxyUCtxRUJKA/wwVjrQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=criticaltechworks.com;
Received: from AM9P193MB1651.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:3e0::20)
 by AM9P193MB0968.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:1fd::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.23; Tue, 17 Sep
 2024 09:01:32 +0000
Received: from AM9P193MB1651.EURP193.PROD.OUTLOOK.COM
 ([fe80::6030:cbfc:2907:451f]) by AM9P193MB1651.EURP193.PROD.OUTLOOK.COM
 ([fe80::6030:cbfc:2907:451f%4]) with mapi id 15.20.7962.022; Tue, 17 Sep 2024
 09:01:32 +0000
From: "Angelo.Ribeiro" <Angelo.Ribeiro@criticaltechworks.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Kjellerstedt <pkj@axis.com>,
	Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][kirkstone][PATCH] libdevmapper: Inherit nopackages
Date: Tue, 17 Sep 2024 10:01:06 +0100
Message-Id: <20240917090106.6526-1-Angelo.Ribeiro@criticaltechworks.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: PR3P191CA0037.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:102:55::12) To AM9P193MB1651.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:20b:3e0::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9P193MB1651:EE_|AM9P193MB0968:EE_
X-MS-Office365-Filtering-Correlation-Id: 5119c50b-0759-4af0-ce54-08dcd6f752f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Pa2ywQQnb2Lq/tuCvmf8mfjCsMvdBTBA1bYOlM4UJuNJOpJ/rDNhhZMYWXFt?=
 =?us-ascii?Q?rr0QZOab1vP7ENBJGb03g8cWCLA281XVOaufuuWjIDhVsnep2I4Jchf1vSpR?=
 =?us-ascii?Q?9OA2UUTnErEEOJ7sv3N1oXgG8t6viDdZQjQRge4CgJkCkOYXfIc7b9slVaat?=
 =?us-ascii?Q?RMwLWMF/S5STl+sC3l5YB/FGG2/9iHK76wvW6eHYWcOr6ujYsLQIjvenrtaM?=
 =?us-ascii?Q?GL62QSoaaTsPWR6QbcmltEOPsvk5I8CvpYFg/EC+fIrTkD9P5v+cSyDU7oah?=
 =?us-ascii?Q?mLLP0aY0BjXtMEgOsXNbWABvZP30M4OKjBDLG8h9HOYrya9yNeemPGERkVwk?=
 =?us-ascii?Q?lxKigryz5hH+PFUnogaDctHmBVc12uKW/8CM2I5jYnkOgBjyeRJ75AU/1tg+?=
 =?us-ascii?Q?988laKk3nAnnzH6dEN7Q8zbztrxI/Sx492eYrM3LRvUk51h5wEJBeEid4pFn?=
 =?us-ascii?Q?FpvWV6mtoWeAXFz6V0QCMsBdRaYI7U1DDDsmMMsIuP+O4NqdpBes8rDaCnJ7?=
 =?us-ascii?Q?5KYIyFFZqGjbLg2aXJLtR8iSBdXeg9rDsckF6IBhNbOwFqm1SaELG5X1RBK6?=
 =?us-ascii?Q?p74QxhwIvnoO1or7yXizrKdUDHkjFDNRLUu76GlQZUZ1NwmsT86a1e+qp19h?=
 =?us-ascii?Q?0JJWX6r0+Qu6h6QgUVKBd6MTEqPtd+7O8Ln4HkpKf/TtDD9A1QD0d05f2w1e?=
 =?us-ascii?Q?aqabC4k5ZNEcded0mIbjt9ExyO8bvZiURdsMxl/vxsdC9guYpAXfWvTHy4K3?=
 =?us-ascii?Q?EByDImfQl7H438uUnPc1QOJwCL3bCAe7MFolF097FYVqraitoj9XOk0wLLhn?=
 =?us-ascii?Q?y2MI9jCJcBtie/Al4cgad678ICU3bw6PPVIjII4lmp5x+nTeFwyjRRyWF7Rr?=
 =?us-ascii?Q?7D7A3BkUoaJuhShj2Dshr35sEJ7gujYNmQNvwU0vC/xCM9KyZvX95hSmkLYy?=
 =?us-ascii?Q?PyGu257JZzerjurRB1ciLruU4K5+E+/+8aw5WM8FkOOAaga1BbMJH1bgsziv?=
 =?us-ascii?Q?2N9fct4+NotabeUYZA6SP8Onf1vmwX1k/tnohIB8IABVMH1xDL9XjRo+hqX3?=
 =?us-ascii?Q?V0bge8PA6IPdhB9rq342Em65NsvIpEyedKZfZkBgWtnwEOtFniXOxb3TYe41?=
 =?us-ascii?Q?cQWX5bZCU8Nh4cmcjvkh2VP/ZfsbGp22K9V209muNHspsUcNiKuiu+mcXgES?=
 =?us-ascii?Q?hzeLE27ZJ+fT1y+8lATzatzFty4gDdHPBdA23n8qEbPu5rIH9VMytvsg6mMH?=
 =?us-ascii?Q?UMbcr+1Diz/NA5aH46W8KJvgkOYg68DxaMFkFNT3UFyyrRHLuDxQXPFgDkSZ?=
 =?us-ascii?Q?ISxWFTlHDdteeNuXA2JCgGS7SsF/nkdV3z/4sCSWTgxfXVaXHwni4lLatNr/?=
 =?us-ascii?Q?s64U7bkUG6uX9XusgO15URuabHrfS/lesshP/IBMb8xhwvT01g=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9P193MB1651.EURP193.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?3D1DHQNyPq0OnM0dUnMTd4IYsXlfpjHzShFp1wZIf4azm7o2uANT0R529vAf?=
 =?us-ascii?Q?TD5Adrem89Mm8foh1V1vj2QyrZR9BWBGc0b/qVZxM88lBcDu5im28Mi7uf5p?=
 =?us-ascii?Q?yXiW+4QD8DCqZUPBPLgn1BIg6ZKzAHFaBPR1TWfQtMsHAOAIlAHkGSK47w48?=
 =?us-ascii?Q?zc/v7Mc9GrEQgNTJPzICaDF06d2RTtEJCSpDAhXQ5jDQ0JjfX29WR6ux6JLr?=
 =?us-ascii?Q?XuLTutgNA2ytaTokBAih/DhCxF4JpJWKIaz9fcyjlK/bVImADev+ld//F8sv?=
 =?us-ascii?Q?O1ThA4ZA0nvjEghvs46hGCo1u4mx0CSLWceh174BDrF9qq35ppsU/r9//gjW?=
 =?us-ascii?Q?1+c++c9qVztundhPgV2/MbG6t+ssuqQt7CqAZ4n7j/aWZE0IMQhmLAnNpFr0?=
 =?us-ascii?Q?YKv1Cv0PeiDjbzPnx/yiw9YnwzhaEHdK+d0dzohpH4NnNo/5cUfszOPWmsm8?=
 =?us-ascii?Q?1NL6fuux8owlRF7ewnQMd+nrCJE6gKyZJgplNclLMOEMpOP2STHyeIq59ohq?=
 =?us-ascii?Q?JNw5LUh7pX3MfZnYlb3n+QYiq8w2m+O7pDMe/u6MTrKMhAHXo1CLhBUVpUu/?=
 =?us-ascii?Q?QnKivoXjhwJL4IMY42Ch3c/+S6fV15kZMkfsmH6saWAJJd/BqbuxdpUMf8qb?=
 =?us-ascii?Q?vqSTsgyLYFC/Uk17DjMsHNE+c1GcCL42FEx8ACrY27UeybB3ALRPI+ga0sdF?=
 =?us-ascii?Q?f+bRF9jEi5LAFV09aZ1davl7ciCdewnff/hfZLCggxqhYzDDdI2b8x0MfkAR?=
 =?us-ascii?Q?L9GbnodMRTbG9LBWYjsoEWMrVCvITgGUZQzg/X9JGDdotz7Jjcz3udsBPhft?=
 =?us-ascii?Q?Z+h3BRsw286GS2DKLZElLbnq/5TZwz+a51CtWdndx5WYHB3GQFtUX5dOM6EZ?=
 =?us-ascii?Q?pHBf98J4DxN/JNO1+JxwFnaPlPxFrFCHFnDFs+MdZeShCU5soUqn8wW6vRv/?=
 =?us-ascii?Q?j5oIZ4fUoX1nHkhYXlqVbb1jTMjhXQggsUUWnomELyBC+j2k1aZf2r49aAu3?=
 =?us-ascii?Q?Z2rVsCV3FEUZXRPK893BIZKPlkZvM6yAaC92AvNv0eGUVsXzBgJJWUD21fj+?=
 =?us-ascii?Q?iEd4RgvdSUgkjTFliG3mGbxStuKX0Pyj8LPMT89G1icJojTa5ekdVBqJvcWM?=
 =?us-ascii?Q?Rgxl9KvE7o3Y1ut4N51PXXnzEiMf2zV6hOb2q2ZeyFUmsz7hJwnvSutmUTGa?=
 =?us-ascii?Q?AOeuJb25CACG69RZK270qyJ1+TDM89qtPQ95TXH/9SWR6+LyVN432V/tsZY8?=
 =?us-ascii?Q?pqfHUBv9tHpVc6Z4Lu0MHtXdxS4W927uSKw3DIZUEypdqO6hDgQeBjWQauEd?=
 =?us-ascii?Q?M2xAF+L2OyNmd5daqksiAEZj327PMG81VGk7JJQVUMNMP7kE8/iUfWPdB0ua?=
 =?us-ascii?Q?Lt+IlaXjsAyn6uGL6O0tO6g1Jz9hxQKFUaosrUE+j1jdKfb0Yixr/Dza/s/2?=
 =?us-ascii?Q?QB+gAWvbdeEwuehrNuPxU0/q+MG1QY7H42tpe/iJ/xLYCU9K+IUHYFlTFDdf?=
 =?us-ascii?Q?vbvShfINKeeU7pwpV1JNlc1q//nzK4Yt7BcZyGONHJEjS/bKZQ5NAkUP3N3y?=
 =?us-ascii?Q?DaD53t9UgjLTp59VqP9tz6vSBcCWIsTiZgXmbhIfzS0OgacCoIvxc4eL8VrE?=
 =?us-ascii?Q?xCQFmZ5sbMHJG6aVGiy5Zgw=3D?=
X-OriginatorOrg: criticaltechworks.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5119c50b-0759-4af0-ce54-08dcd6f752f7
X-MS-Exchange-CrossTenant-AuthSource: AM9P193MB1651.EURP193.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2024 09:01:32.0337
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 61f30b8e-4f6b-44fe-9bc2-041e3a9f7346
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mJ6NrK5cICAi4hwywWkDDBqPVfo5iQDM8CkvX7wC0C+x6n6RU8Q8+RCyO2pLhTNHLWJ5m2gC8ORYh9Z9KefdSFQLwEJ2YbKpoPLMaM2LH0E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9P193MB0968
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Sep 2024 09:01:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112341

From: Peter Kjellerstedt <pkj@axis.com>

This fixes errors from buildhistory changes where packages-split would
be empty.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 90f96e053ad3eefa7693d9748efdfbfa72d7dcfd)
---
 meta-oe/recipes-support/lvm2/libdevmapper_2.03.11.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/lvm2/libdevmapper_2.03.11.bb b/meta-oe=
/recipes-support/lvm2/libdevmapper_2.03.11.bb
index be558ce1d..3b4439c3a 100644
--- a/meta-oe/recipes-support/lvm2/libdevmapper_2.03.11.bb
+++ b/meta-oe/recipes-support/lvm2/libdevmapper_2.03.11.bb
@@ -5,6 +5,8 @@ require lvm2.inc

 DEPENDS +=3D "autoconf-archive-native"

+inherit nopackages
+
 TARGET_CC_ARCH +=3D "${LDFLAGS}"

 do_install() {
--
2.34.1

The information in this communication may contain confidential or legally p=
rivileged information. It is intended solely for the use of the individual =
or entity it addresses and others authorized to receive it. If you are not =
an intended recipient, you are hereby notified that any disclosure, copying=
, distribution or action in reliance on the contents of this information is=
 strictly prohibited and may be unlawful. If you have received this communi=
cation by error, please notify us immediately by responding to this e-mail =
and then delete it from your system. Critical TechWorks is not liable for t=
he proper and complete transmission of the information in this communicatio=
n nor for any delay in its receipt

This e-mail is environmentally friendly, just like Critical TechWorks, whic=
h lives in a paper-free atmosphere. Therefore, please consider the environm=
ent before printing it!

