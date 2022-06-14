Return-Path: <akash.hadke@kpit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED777C433EF
	for <webhook@archiver.kernel.org>; Tue, 14 Jun 2022 15:08:35 +0000 (UTC)
Received: from IND01-MA1-obe.outbound.protection.outlook.com
 (IND01-MA1-obe.outbound.protection.outlook.com [40.107.138.70])
 by mx.groups.io with SMTP id smtpd.web10.7333.1655219313884481921
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Jun 2022 08:08:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=KnEcO2Hh;
 spf=pass (domain: kpit.com, ip: 40.107.138.70,
 mailfrom: akash.hadke@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OGt4ZaeN9256k6pEcF1BA70meO2l7B1zNqj0ser9Om/sqOYv7P1Hqw6arrE+vjOAUfx9dhPPMze7JnvOeaDYZjb5KZ+dyZ+xJftb+K/U/62igC+FcUi9LJyG/G9Pr6uaCQ3SPEx1FEdeVHTews7x4dMTW5dgp+bekGKO0Nuj6qF5P8eWSDkNByVpDUFVYC4/7QTlcGvD8UtfbxRLvPdNvYwlfJQ2skFgQpkyg7dqaUEVU6VCaKS2jEZxq8ZJ9okWPg4pXDmuBP5dw88mIXU+uaaHP1xeVVaq0kmbzQDtlhfGwyC9IafshoZhZ2BDEvs2maSorp4jEXvZPZ1+IxSdQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/B41EOkIdQ0qWMyUEIfG0Wyu4FojzKsRnM/t6Df4kj0=;
 b=eqQzztTde0iVjpbt9vfNQimY8M3HsmNoXGRECFUTmYarFrRllgjjdnwbxtxA0CbfDUTKYWFi4w/sWj1rThFlcceVRbZQX7mU8eG12Bzo1Fb5TB4or3LUNHIrbwHdZdwzbNMK8/JCpRw90/4DGoyOkcunttVNibTIwg8rGPJ6JAESj5K5seumsnvUKMweU9yCNMZxsm71lNrQ6qTCweb2vX2I6cj0XUNIYSJAGSG7vqTxgMVsc0/I7sfpG24T7nFmieTaqpab5PreMcb0sAOMTaR0AjbSeeaGCTyJ1LZ9Y3N3A3KixuFRvUe/aZJR3xHvyQ8v/QbdalNzZTHj+BfNAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/B41EOkIdQ0qWMyUEIfG0Wyu4FojzKsRnM/t6Df4kj0=;
 b=KnEcO2HhJtaw/l4/PX7K3EmKrbJXNBBkyMIP8nxLDqWm9RZcOiLi74zOSebMACrGopqTU7Z/hdt/IoMm68ujPmTGUjjlnlbGKu6AWXncIBnoW79IdvLyu8rzBj5EQMx3E40+16kdLqn0Yt7mdnB0I3Lptq2GgAR0GMjYeOSuwXQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kpit.com;
Received: from PN3PR01MB6712.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:89::13)
 by BM1PR01MB4690.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b01:a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.12; Tue, 14 Jun
 2022 15:08:26 +0000
Received: from PN3PR01MB6712.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::8119:8287:2cf2:7125]) by PN3PR01MB6712.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::8119:8287:2cf2:7125%7]) with mapi id 15.20.5332.022; Tue, 14 Jun 2022
 15:08:26 +0000
From: Akash Hadke <akash.hadke@kpit.com>
To: openembedded-devel@lists.openembedded.org
Cc: ranjitsinh.rathod@kpit.com,
	Akash Hadke <hadkeakash4@gmail.com>
Subject: [oe][meta-filesystems][dunfell][PATCH] ntfs-3g-ntfsprogs: Set
 CVE_PRODUCT to "tuxera:ntfs-3g"
Date: Tue, 14 Jun 2022 17:07:56 +0200
Message-Id: <20220614150756.19128-1-akash.hadke@kpit.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: AM5PR0402CA0001.eurprd04.prod.outlook.com
 (2603:10a6:203:90::11) To PN3PR01MB6712.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:89::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4b3aabb3-bf6a-4413-7e73-08da4e17baf3
X-MS-TrafficTypeDiagnostic: BM1PR01MB4690:EE_
X-Microsoft-Antispam-PRVS: 
	<BM1PR01MB4690986A746A09CB0249CA9B8EAA9@BM1PR01MB4690.INDPRD01.PROD.OUTLOOK.COM>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	+DoaSCgXx4Y3ah3uW6QWhHtLknuz0ffjaIrLS7V2x5OOQ70rY8EIkEqpDZlm0mNW92zOdfMBHvkdyE/Xrp0btbz0QSJ2mIreyt8lIzVvF6yjwLsUtcs7yHji3HSMhZwEyxz+GCvEc9kQchtf8lC9eFlXyl3dSQD69A1/LDtzRxRE62hc29NHjmlJjhJiy1LUsHLPo2GZEY3RhWxKtyytQ8JEIZ7B/7P+UfrwS+1IQXUJRmlum5ZeDXc8+ZDGAaZlByTDI9axLxG3I6zxOQ1+ywReRrtweYHS1qmFBESRPBW59XhzP9LLas8d/7G0DCJeHl3mIqgHUOYg5TCNjnIDkNY+wkfSVUERgPkpykKGX30bzVsykybQyVYitqaJg/D4pYzMfKzLSezYlrwAAr7tbGKOmYm3+n+pjObQUvQJItv891lpEPQq+k1Gdxxf7ZFcD3DhoSnjppPG7qVxi+jQjVLi1X7rVdLl3PJ38rUElJjHpgy5Qtb1FsVi68QbwSTAG1VUataYQu2/hhEugLpnrvgJHnbdWB0Rt6f6A3Pq0dmOjCFjFF3PzdrXxP2QXO6Eu4u4B2omN4EgPLfXRjLQ49iOH8lCtQIbxgv05CMzFU8RtxPDCrzRjYZMOhz1qGcR2TcIM7D7zMeMDvpxb0Dgsp9Z4ibpuUiEnGcwMzaIPxUILk0KdI42qMLF/fZK2m5L8gw+8AkAdXUAadJqaS0K5Xb0J369IAFpQ/yt1/7QVy9GJMxGd5mdeCBq2sivNXmhRbbtxVrwqkqE3U37R/Ikj8gkwiAPe4zUe0LeFtmbyjk=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3PR01MB6712.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(66946007)(966005)(316002)(6486002)(508600001)(8936002)(52116002)(6512007)(5660300002)(6916009)(36756003)(44832011)(66476007)(2616005)(66556008)(8676002)(4326008)(2906002)(26005)(86362001)(186003)(1076003)(38350700002)(6666004)(38100700002)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?KFScAvXfD5kkLyIZS9UDyGKypZxI5d8CzLgQkGJM+tEbOgA6hInl6D7QqfPa?=
 =?us-ascii?Q?TtNPRfU72HfG43cWHDnVluc7kFJKtrLH2jl61Fq3siQRHUUc+dD6DEIpUipn?=
 =?us-ascii?Q?ri/zF3qe1riI/KdCKSTGVM02HyiwxvW+MANPwIz9iKt3JqMuPwyyPwa3F5fC?=
 =?us-ascii?Q?s3zR3ZmWHXWxRSOZq9g9YWDMXl69m8fDR3bxNYP5D99SELbPCSqY96sDcW5s?=
 =?us-ascii?Q?DFcwE5wgNau6rqf4tooL/n/O87uz3SW5+LpvQNMV+ifliDqjagnhuY0YBn0X?=
 =?us-ascii?Q?MlSrHFpOz7ODCfhIOLJJFDpoLicT52Xlm2BOW9N+/uLzaAhK87e1SCGtzzni?=
 =?us-ascii?Q?vJYoAtnlfL/nULKTVrbt0CWhy2n4rla/lccXSdxGR4h8sQ4jspTD9dU+L5MK?=
 =?us-ascii?Q?wfhzNVa3JWsq/kaQLBdCVWWMTyP+BlX/M8VG+BGuGaNugETf0ffyIiAZWqGx?=
 =?us-ascii?Q?s9rnJD/7do0jQqvjxD+gaFu2k11l9D2V+R3CG7+JRSUqIL9UwupEVVatD6UG?=
 =?us-ascii?Q?yCHGVC82e/C2KGUxbz4oGP9A0lhssJ/axgcHkvN49nG4Fmf2oCPh0bbEvUKs?=
 =?us-ascii?Q?0iaQyCiLpaNY2I3hQ1tJu+2QbW1U8KE3NRCAT9IeqwoDTg3pLqG0TjXjlNmu?=
 =?us-ascii?Q?4gW/veus21JVCH4aFl/VE+ye3gNZmBrpBc6a/t+LwXdK4VBoSUqalw9O8rAi?=
 =?us-ascii?Q?GNa2ZrpDWQnzRvCh3CXMQJNP4Cx1gZ8d5hXAl2T0o6EWgAa+0lc+p0fCT9pc?=
 =?us-ascii?Q?Lnnql+9jp8/sSEl/vye1TNuQmdJgOyX3LW+XMT1ECpWuRZhWf1BuUSED4fHn?=
 =?us-ascii?Q?XPF4C82WwQ62UcWy+yPzQUlxKcRhuDoiFDBOLVCmxq5EOy4dGFj0NZS9fUXh?=
 =?us-ascii?Q?h60qzqRRakWb7G2FjxSlrbimUwZQUHfUVWgbS7zv/DmrunUadOfm6x3mb323?=
 =?us-ascii?Q?4jV+EYOmRW0THZRqu+Zz2epFg3UguOy5GOfdtYKwXaPphcPqksWdgJthvJgX?=
 =?us-ascii?Q?2USkjI3mf+BQWoGGd5d8Kg2525n5Bm9T4NV4jtbrXZakrCesNmdy1iM1Ruue?=
 =?us-ascii?Q?1ZqJdO1VJxvWM6AnAeew+iJ27HCgF0LNAPFYOYyRXp0OCSOBcjXo0dhtBYcB?=
 =?us-ascii?Q?9trUgOazB3nZTHbCPZQgWkbIuTcbYTpaM+ietaRrxIWr7O3I2GQZlse3f31P?=
 =?us-ascii?Q?k5WB1XjRkcWRUR85OnyIRcnn4gYOZxYyscwUgwFGKoFYuY3+2iJFXq9KSodA?=
 =?us-ascii?Q?nUq8Lk0V5RQxA9pMHVCXGMhe/ELVyh9U2f8IlGp/JORvK54L5MfZav2+7tnY?=
 =?us-ascii?Q?uWpQpxSHwmI/Vg9IB7aoW71SHNS6O6nH1w5+fmVl6hBUy2PxMc1YgzmGeXT9?=
 =?us-ascii?Q?rSCx5U9SHR1yGWI5OvRdVi0rrvN5RKCc4nHiAoQDdVlmNuN64XKkfSIwyY1Y?=
 =?us-ascii?Q?wl//QxaXK4gJZ1x2glWgtS2Kx1yGFBcURUyc4rAgIwTNCpQ/F3us83lKOtZA?=
 =?us-ascii?Q?NkYhMdOlkDXkquv4wcgXdp0/wsiS/158fjGN2n/UAzlYztUiJ1etY0jcKXDC?=
 =?us-ascii?Q?/Hs7yUefXV7RDdAwCVYsWIbPCvNc6MlQB2EyLPBIXeN4Se5Cad7iHugC19R2?=
 =?us-ascii?Q?LWAU7BjP78nSHwCfx9uszVSVo1IUL2Fe6kv20t7J7HYs7dNcigbV2yvjSn05?=
 =?us-ascii?Q?UIR9R/AIocOR9fEALm9KSUbI4SGadxOAizZ1dvGTjILb6YCNtjWcOc47FWfx?=
 =?us-ascii?Q?gij+ZMQ+cA=3D=3D?=
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 4b3aabb3-bf6a-4413-7e73-08da4e17baf3
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB6712.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2022 15:08:26.0029
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 3rRrhj9o3n++upnHszaClKnYuQJMZiu2gcf+HJPOUr1wjxgJQbcT/VEpNjUZrIaAvGZasuyH6oVh+AUXFgSOMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BM1PR01MB4690
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Jun 2022 15:08:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97517

Set CVE_PRODUCT to 'tuxera:ntfs-3g' for ntfs-3g-ntfsprogs recipe,
cve-check class is setting default CVE_PRODUCT to 'ntfs-3g-ntfsprogs'
which ignores the ntfs-3g-ntfsprogs CVEs from NVD Database.

Reference:
CVE-2019-9755
Link: https://nvd.nist.gov/vuln/detail/CVE-2019-9755

Signed-off-by: Akash Hadke <akash.hadke@kpit.com>
Signed-off-by: Akash Hadke <hadkeakash4@gmail.com>
---
 .../ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2017.3.23.bb            | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2017.3.23.bb b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2017.3.23.bb
index 6f5cb6cee..c75b0416c 100644
--- a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2017.3.23.bb
+++ b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2017.3.23.bb
@@ -50,3 +50,5 @@ do_install_append() {
 
 # Satisfy the -dev runtime dependency
 ALLOW_EMPTY_${PN} = "1"
+
+CVE_PRODUCT = "tuxera:ntfs-3g"
-- 
2.17.1


