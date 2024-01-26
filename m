Return-Path: <Angelo.Ribeiro@criticaltechworks.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09563C47422
	for <webhook@archiver.kernel.org>; Fri, 26 Jan 2024 10:24:51 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.72])
 by mx.groups.io with SMTP id smtpd.web10.12885.1706264681560322796
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Jan 2024 02:24:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@criticaltechworks.com header.s=selector1 header.b=ro2lVYtl;
 spf=pass (domain: criticaltechworks.com, ip: 40.107.8.72, mailfrom: angelo.ribeiro@criticaltechworks.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fqKJaK/A6dkTaRSW4UFu+LxbHxedTNs2uo7oJUkpIAF5F1QgRMUQyjYk1PozfSlf6TiYy7R+daajgzRdK3ZXL6P7H8zzh2tYCIywPcSrhz+wZcgE9PEqjlKEIDi6NBCsh+BkdYD4ezXxNjaa7t00Bz6lQs5/voHnCQhu9yqDX28vxybYXbj6QGrnuua1hSD70O6rweg7A3z/Cv/ISD5iFgZhAYAHLQOAR9TmgimfZqo5FJs1QYE6QIzk47mwhVTe4rlRDd7/Pjbg7r+z42uUgZjUT+P2wOvt7HnobdBfL7D8GP09yrVtNz20Z9cx+86hX+xjEgImuOTfT/lWZN62BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ffJK2x744sEuIKtlEAcYglA0+DsUNvBVWeYTPW9Q1uw=;
 b=nPDrD3Qo4JuhL6PeJZhEN9P47iVMq9vRfmhoit8lBHFhL2ziGxpm2RSl/8+8AXQLAglmUnLzSlDnoZ2WPFLDtgZk9mMkgyJvZxjhQw9cz8yXJePallTL5EOqvAZVFnS+d2s1UoPyGM8tCOPOBnYZ10HJ9TMpppvjz6IkTEWWIrj+b7mdayVZnk2F1c7bqxnEUC5LUaGLf2GzuXD+eWp9yJWejqhC7IJG9K/7BGzpop2vnwRGVP/DipMwq6SXJ732nkT+NNQKHZ/+5wEvJqEfH+fCXaZfUB9eVzFtkHVxRfe0rBBLw+2g9QPwlIkZVyqegsbDTui/EgcLNF5o9LX3Tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=criticaltechworks.com; dmarc=pass action=none
 header.from=criticaltechworks.com; dkim=pass header.d=criticaltechworks.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=criticaltechworks.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ffJK2x744sEuIKtlEAcYglA0+DsUNvBVWeYTPW9Q1uw=;
 b=ro2lVYtlT4U8OB4Ib4HdXi532jiuQJxEWSAR05kgWC1MXTfztjb7aP/2rocoVuzOXgWKjEIleMS3pyencAox54EAIgPzhZ9wsQJbP2B1i9hwuyMDnRNCTL6bQn1CG8AzLOLdDokmT4mSPf/FT/q0+sisoyb84cN8nWVNgxCmC9EUly2PFEL7WceEW+RFByf7dJ3bkyTlLhskliqy6Vzq69dMp7o0/N6XKzia17zo4lEw3OE0vaQ2S7sJY/eY7MaDwZNzK1QSufEVkHB7MrveUhB7GZZaMtURxXqev/TUWooJl8Tag3Oc28B1uQ5YMxDfBgYc8S/BhXBsnvqws1TOCg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=criticaltechworks.com;
Received: from AM9P193MB1651.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:3e0::20)
 by PAXP193MB2364.EURP193.PROD.OUTLOOK.COM (2603:10a6:102:22b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.26; Fri, 26 Jan
 2024 10:24:37 +0000
Received: from AM9P193MB1651.EURP193.PROD.OUTLOOK.COM
 ([fe80::412d:4d7:fa21:8757]) by AM9P193MB1651.EURP193.PROD.OUTLOOK.COM
 ([fe80::412d:4d7:fa21:8757%5]) with mapi id 15.20.7228.022; Fri, 26 Jan 2024
 10:24:37 +0000
From: "Angelo.Ribeiro" <Angelo.Ribeiro@criticaltechworks.com>
To: openembedded-devel@lists.openembedded.org
Cc: "Angelo.Ribeiro" <Angelo.Ribeiro@criticaltechworks.com>
Subject: [meta-filesystems][PATCH] e2tools: Add tool recipe
Date: Fri, 26 Jan 2024 10:24:09 +0000
Message-Id: <20240126102409.215142-2-Angelo.Ribeiro@criticaltechworks.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: PAZP264CA0116.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:1ef::6) To AM9P193MB1651.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:20b:3e0::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9P193MB1651:EE_|PAXP193MB2364:EE_
X-MS-Office365-Filtering-Correlation-Id: 4deab773-244c-4f5e-387e-08dc1e58ff5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Uuv0kozoJaikTZvwq0p0B+gg9BnIXaZoOtZMhbGywOxaF3G+sbIVkVjGSY5U28kJqWfK/ces3mZmLxhKHrbzfUzkQp3hcWgTgtiwsFuTvVWp16JpOkAie3WdvNdInEjfrAruzJ77g/AQVJ9uqVG9cVzEeYRMPn8Hjjthk7ooaBcebdW3w+5gG44YoJAwY4+e708CKOfcAacE3dfpNlNZNi1OgBhbg0zJlV4J5EsLNbpuyGKI6R2hSdJGEK4xB/H8Y/BDAr2M3isdZCgSkKFDkVWnpgO2jhJKL3w5zKtgG/mQEi12UAm3oBaYaNeygCqudJ8LtG5e6zI4XR4lvZDIfUd80v6dECBQuG34xuGmvdKENNVeiMzjQD4JXr7LnWyt12JmuqfOkmepz9A9Oh0OhkpBnuc2WkEcsbJg8oZYcHSWyroH3kBQnVhEITqBFRVyZ03ASbu/ca0SQZkxVdTEsLla37/z9zgZmTJeR38qPChKcJVCTUppT/Va5zdh6tKCCYAkCUIXgxBb+BlTb5ZZPGAFJIM1meKm50Qya+VJFe8rR5kGNNGFFkUjjFRvF+nmzC33CIdA/3m2275CVT2vj3J4XCr+/VnklA7mKJw45ZA=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9P193MB1651.EURP193.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(366004)(396003)(39850400004)(346002)(230922051799003)(1800799012)(64100799003)(186009)(451199024)(2906002)(38100700002)(41300700001)(36756003)(86362001)(66476007)(316002)(6916009)(8936002)(52116002)(6512007)(478600001)(6486002)(5660300002)(6666004)(83380400001)(66946007)(4326008)(26005)(2616005)(107886003)(66556008)(1076003)(8676002)(6506007)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?rDZotuOYLxzS8rD4GPyRfM8+4XOCpJFpw23lVvWw7Hy9glWK46K3OyAu0fYA?=
 =?us-ascii?Q?Mru1GpnstgWzhQ5dYYDqgaqMiqouboCNPsHbovPLdMZVFXrSe4N7ewXq1NhV?=
 =?us-ascii?Q?BxxIgsl5a+bQ3idsOUcLUVQMcoB0KAUFEN0YIsVRydYB7NUQ3S/QBeR8VMe1?=
 =?us-ascii?Q?U7KllCACP4u4nZpEppg2eOeI6gZgj248anPNXFCLltGxn2gZNgW0jrH1vBR8?=
 =?us-ascii?Q?viTjmgkdQH3T4vnxf9JX5GclWE7xOS2d9zpHLf+PwZ7Qktw1O4QIpnAADo2J?=
 =?us-ascii?Q?XVc2MZ60MAwl5tKB/kRfQSXorVEpWppkKBd2f2hJQC8sUoqQD4SFMUf6obxV?=
 =?us-ascii?Q?hxpgwjLHZUO36mYNEw4hHgHofB/96ozuhSxJhywho/CS8018BPk0YXhzb/N4?=
 =?us-ascii?Q?LpdjFRYSTsLOhe1w0PUuqAUChuStvIsWdEtpkRw5uxCHqS26oIqEVhbEb6Qc?=
 =?us-ascii?Q?gtKr+d6Cq0i/aPQh1d8+4YaD9SOaJDUh5TqMV+0XcAyaUEFH6NBfJocXkHIQ?=
 =?us-ascii?Q?Ng9oRt0esVZZIXGOUsSHJoV4gPFCTlLm74DP/QxwyyyTPeJ1aLVQM/LO0vAK?=
 =?us-ascii?Q?76ATsBIyzCgQZ3FAIZMjKn4CN14QREJsUKTg6Ul7WZkLlkViMfMcdw5nLvpp?=
 =?us-ascii?Q?mbzk9sjFQlWTGnBnB57B+w4Lfay3amp+BVReheEVNp6JF4zp1OJmB1i25Bf2?=
 =?us-ascii?Q?kgt8nS8CM+K4n9XUPrHTvBI0zksEsFVLklmhGQdVNiWNICqrhlKSat1+1lSI?=
 =?us-ascii?Q?V07BfvLAJCEWHJjWMg9O1SRO7vRqx56b0oSHaFE1Wf/vMeiRk2f8OE4CI/oK?=
 =?us-ascii?Q?YG6X+tpob0Gg7KIufalRhV1g8OZop0lGKT+OKru+8NBKQG41A0pJF9SDvz83?=
 =?us-ascii?Q?cHrUVr+Gy5SnyLeWxFEu2ZxxO4PcyeMEx3UdZcXqUkM1MOyyFfZmDfMLf9+I?=
 =?us-ascii?Q?9Eoiuagn5NO9btGBjb+TdI1793vF5me95Rgv8KNWAy9/NdrocK7auiLrdX/Z?=
 =?us-ascii?Q?MwPrjszaZf7+HbwnzYC7pGTcMeod9DsVcxkxTQ0gId3i993RHdq+mZj2XhR9?=
 =?us-ascii?Q?DKsOAlQFPXNRx+uQatgZQGkxOPmrqCTaNAnpxgvRba1hVdp/pkVPdQKQt7WS?=
 =?us-ascii?Q?d4fdGwZaHn/SZsV8cyy+ZKSP8+cuYPuk7OmeXYkJb5clEBHBCf2l2TGprJ2y?=
 =?us-ascii?Q?3nk37YtqdbQd9p1I1yxBl+V7xUaal/sPDm/0jl3PV5J5dfU8hUowhErApRPu?=
 =?us-ascii?Q?EsAi0Dms9nOPo5GHqRwcc2KqXUIHW8bJ1d7yYXwqFvKnepxLww2bTcsFEH7g?=
 =?us-ascii?Q?MalGtJJDznnwDWbMiG+3V/dLzNz8Gt8GC3aAN4WL/ByCm+Wjhj1gyLI2bEsA?=
 =?us-ascii?Q?VP8YWaPcxXvRSHm21tR2VT4wpz4h8aMHMRd07qR07Hw6v+EdAZuKjqQtsI+R?=
 =?us-ascii?Q?BBnuY7Q+k3GiEkbXHKz+kjC6MvUW0uapl9KNnqgpVifvxcYTGVwDApZhiDKN?=
 =?us-ascii?Q?KhAkOMgehwyvHWGG3awkfpHcg8vb7JkzdqiWZajP/KNSlGRhM6efbH951TBI?=
 =?us-ascii?Q?sYPE04mUw4AWxWXEzjoJaIoWHSfc7ySFpQTUrzXfsYoh7nk1itkGOPkKNQhc?=
 =?us-ascii?Q?iyCVKH/OhOXXGh74qD46SdM=3D?=
X-OriginatorOrg: criticaltechworks.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4deab773-244c-4f5e-387e-08dc1e58ff5d
X-MS-Exchange-CrossTenant-AuthSource: AM9P193MB1651.EURP193.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2024 10:24:37.1280
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 61f30b8e-4f6b-44fe-9bc2-041e3a9f7346
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sTAjXxnsq6mEdS+t3W1t+76ababWm5J9KTzWDk0GeAzqdVzJ1N2Tb53p47p+gpBO+0cFz3fvjHAM/GQkB2EG2IDhX7WUVGEDc/bmsgyagO4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXP193MB2364
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 26 Jan 2024 10:24:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108460

e2tools is a simple set of GPL'ed utilities to read, write, and manipulate
files in an ext2/ext3 filesystem.
These utilities access a filesystem directly using the ext2fs library.

Signed-off-by: Angelo.Ribeiro <Angelo.Ribeiro@criticaltechworks.com>
---
 .../recipes-utils/e2tools/e2tools_git.bb      | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 meta-filesystems/recipes-utils/e2tools/e2tools_git.bb

diff --git a/meta-filesystems/recipes-utils/e2tools/e2tools_git.bb b/meta-f=
ilesystems/recipes-utils/e2tools/e2tools_git.bb
new file mode 100644
index 000000000..d8492bf8d
--- /dev/null
+++ b/meta-filesystems/recipes-utils/e2tools/e2tools_git.bb
@@ -0,0 +1,25 @@
+SUMMARY =3D "Set of GPL'ed utilities to ext2/ext3 filesystem."
+DESCRIPTION =3D "e2tools is a simple set of GPL'ed utilities to read, writ=
e, \
+and manipulate files in an ext2/ext3 filesystem. These utilities access a =
\
+filesystem directly using the ext2fs library. Can also be used on a Linux =
\
+machine to read/write to disk images or floppies without having to mount \
+them or have root access."
+HOMEPAGE =3D "https://github.com/e2tools/e2tools"
+SECTION =3D "base"
+LICENSE =3D "GPL-2.0-only"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a426=
3"
+
+DEPENDS +=3D "e2fsprogs"
+
+PV =3D "0.1.0+gitr${SRCPV}"
+
+SRC_URI =3D " \
+           git://github.com/e2tools/e2tools;protocol=3Dhttps;branch=3Dmast=
er \
+"
+SRCREV =3D "fd092754a6b65c3a769f74f888668c066f09c36d"
+
+S =3D "${WORKDIR}/git"
+
+inherit autotools pkgconfig
+
+BBCLASSEXTEND =3D "native"
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

