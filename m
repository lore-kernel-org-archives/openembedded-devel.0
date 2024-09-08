Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FBCFCD4F4C
	for <webhook@archiver.kernel.org>; Sun,  8 Sep 2024 17:12:27 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.93])
 by mx.groups.io with SMTP id smtpd.web10.34227.1725815542543955204
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 08 Sep 2024 10:12:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=JTguEXDg;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.105.93, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YA6hyozwZ5UTu554gy5idnN0fEDmyVmrYXxMJuTI/FVJjGuWzaLgZhN6dDVB83G346jih6EgaQ6JLmLwDsDZRotPBHEIaCjS9x1v4tSS+/QO95mDxWctg/4ycFUtiiIFOpDsIMphMo0090uTBHhjnMSldQ3iaN0aEIXCHfUYGuVX4W80j9dky07FlbpR2UkCJ9AZMkmhyoaLcW+dhmRqfAe1WeKRvoai9TbOlbCylcMOvFzrcDqHxdeNxNLzWVE0xGvFbhRoirkzfEiyngobz76t4ox4777IhrtYy0E+ABhgDJ2GR886474o3Cc5TkOnIsvdUW2cqYQgkfYsYH1hiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HBsQemifxGJsQBcCkTI98e/yiE+VpMYWJmwf47FHNkA=;
 b=S0wJ26uu+JTSwalL92sC7E7aKAa6JZIxVV810PRRDhLkECo5EmHBMQ5m+8Io8Hx6Z7EuVrACU2Dvn/qFzjk4uaZjFjaZi+Ntoj2A/fxFB2BR7YyVUpf8cTZPImNT6jgGNjRE/qKT514NZGZNZpl5tFh0jgfccFccWk6f/fGM9N/Y8yd2tEf3idDdZcGI515e/3JzCiuGYtoZ+6ftoWLeqGW4az1wQfEBS24OZUF20o7XYJ/ZINAFy9pqjgjEDuM0Y+8ymALN/LpJZl16yuZ9bABENjmTvkVUKtVV+BQRcr9ErxIbcxaqzRJR4zH1hDABrCKPbBe61Z3yL5Ty/S6hhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HBsQemifxGJsQBcCkTI98e/yiE+VpMYWJmwf47FHNkA=;
 b=JTguEXDggcAE/YbVXjsV5gorMYdnaFKyrs3hJTpVIn+K3SIL9k1cFroHNpXgT20tmVJnL66eE8sZ55BqWe9yMdfz7JIbmBctD2nzPfRuuEZ1NZh+j6PDdYjFi8rZiZAUAPI5HwvzaZvqi3VppwjNoCnBGwo7hrlNpe1ZH7ovNjpjz1Fr8t/vIYGDvXB45W/v3Sxb7fwOKN1TqFxTyYwAQrqGZLqjEupl2YFQ373+JBL3KDT6qGLxdIRQCHcMkVEjL+5SRLpgSNAWbWBGDL+8lXDJz1XJ6p9Ngb73NnIUfvSpM9UszVcBcVaVCmIMfPfEJrIFdhGm6URc44+0xs6hng==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by GVXPR06MB8606.eurprd06.prod.outlook.com (2603:10a6:150:111::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.28; Sun, 8 Sep
 2024 17:12:18 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%4]) with mapi id 15.20.7939.022; Sun, 8 Sep 2024
 17:12:18 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-devel@lists.openembedded.org
CC: akuster808@gmail.com,
	Niko Mauno <niko.mauno@vaisala.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][kirkstone][PATCH 01/13] python3-pybind11: Fix LICENSE
Date: Sun,  8 Sep 2024 17:11:29 +0000
Message-ID: <20240908171141.99382-1-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GV3PEPF00002BA4.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:144:1:0:6:0:1b) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|GVXPR06MB8606:EE_
X-MS-Office365-Filtering-Correlation-Id: 9cd91414-7ba9-456b-bd8c-08dcd0296480
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?tEcmpkp9G6lFaMKm/nuuzh0C6XYQs25LXQ9TH9k8DjMhxBEjAGYixzqoQwPF?=
 =?us-ascii?Q?ml6cCU+MHAtVRDRLwr8Dbo2pGUuZFpqGhNPHW3KsdSDuV/F9E2M+as1qxpzg?=
 =?us-ascii?Q?uGSd/Li/xBYs8xLlifMlV4pEOarxT7zv5J8vjqSL1vci02O/wFFQI30dQK5r?=
 =?us-ascii?Q?euaIyJT0rV48spiHFGTVXoHdmn6+6fYEx/IVPLq2r0XoMsVpwKV6jQoKoL55?=
 =?us-ascii?Q?7Xvn05I5lvtBM0PegdYTtqbRvfZZ37+RcrF7gYq+yes96yVwpMPodRe3wywo?=
 =?us-ascii?Q?TprHLo0eYpYGJgGzvfOET+AncPjE/BYR4KSvAMU6H9vxBS3ECHkGEUiAQf44?=
 =?us-ascii?Q?xJsxoN08eK5lm81qavxV9W5TCd17Y0gVg+qpxGQUrET5S2OGFES1uOk9cLiI?=
 =?us-ascii?Q?Qme+udyE6s0T45iw2hwOY1U0IdAtLf+BhfqSZvbtuTQ6FWoZjQYTt1iKI35q?=
 =?us-ascii?Q?I/Am3g2fjh4lwNBHHZLpCTJsSYTzcMD8dO5GxyvyvmEM3AXaKO5YbCt/1r/D?=
 =?us-ascii?Q?5MFDzv5udiVLr5kSYUw5udK69z/u3eROaI8ZNDRy/RJzAsLtf63fgVNnwBgn?=
 =?us-ascii?Q?wlc4pNmoTzgHYaZ6EMLqDi/o941DQH2uYBUHw+TAlptBI4JWJ3GR5SBPTzWH?=
 =?us-ascii?Q?uYDeKB4lsb7wHvVEqhpLM1nJ0iaUd9YYmAf8e3CUh70+nROPOE1HO9sa1mlT?=
 =?us-ascii?Q?izAL45n8iaVpcta/ZI0LlMj6KO2PzwoEOMWF+LEKQqRQaykEKJ15jdovvYxD?=
 =?us-ascii?Q?Mmm/tcry5FWI1Od37rYuyw6mzrsR/84g+6lF76C6pDE7isQuRyZa+GwmxfQJ?=
 =?us-ascii?Q?A9Hz0YRpZL0dWFv5A1PXMTOWSYuwGhw55Xrxn30/40wTVHkMFzOmdOqCOQMn?=
 =?us-ascii?Q?CO11jWjMuJXhIW3IZ3xcYGLO4DYUKzROcrDSx3ilQsiVEy6o5t2Ua6ZbZB9l?=
 =?us-ascii?Q?k5KZ8GntM7e1FB5sDCzQ6glbCWrTxCItJJPe99OnhP0/0Nc5FL3lEPR+ZZJi?=
 =?us-ascii?Q?1+7JXru4SiFHGAMg/dzpybytoHZ2+l5qoi3GSSxIkseq2jQEBiRmGe8lnoce?=
 =?us-ascii?Q?p399+892ZbUG9sttWfXn7O/kiwprrq8Xz/P7us+zq3bq5oDZfgc/X3FCSo7/?=
 =?us-ascii?Q?6dqIqXfDYJYg7cvuteujWwl4VkGgT/Hvawg2U4+GoSFGDm8rdsLsK70IFx/Y?=
 =?us-ascii?Q?HvyaQ+XdlgiJ6AzIBUXn5KCZwIQVBn5NkHcNCnOzaiRC2fncVrR6ttGcKop0?=
 =?us-ascii?Q?yqW9n07UY6+OEOAeUojlTmLcE/ysT5HxKR7Ll4+OydxPzGGbohxaI4YBD1EW?=
 =?us-ascii?Q?uhzfgdge7IB6A2s/NPmF2jWRBR3wGtPeY4LOfOrgP1WCqsejd3Hy+C73FgXs?=
 =?us-ascii?Q?3DdEc8Pe0NKnXkDiOt/DHVWRPeTFgwmdG+wzs9sxEaJeDuUusw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ID64czRhDpgIhKw3jpLOK2MiuVkL8ORoDfVH5heOX8GVXA7nDcivULkIkcsE?=
 =?us-ascii?Q?+ZSIjQB3BpQ6+6wo3Xa5iS5BfoBS4XS+8lcj7X0LSUDdzaVaOSoKgJEIc40T?=
 =?us-ascii?Q?mNCzIUdZw0taOb6jOZa9NOs5XNLl0YXfToLbuVlRSHyN3ZHhuhWjhW7sWvPa?=
 =?us-ascii?Q?cUwIyMy4zxADIhCxVt4WDxHZ4fRUab//A4JBX7FvZV7Kn9ULPdAYQW+8nFOP?=
 =?us-ascii?Q?4Xqk1vZeoRJVQUaTu4S3IfqhneRU1I/U3aXQVOQFRDZuhBWmZVQXFUKNt2yg?=
 =?us-ascii?Q?OlvKZsgc4UthLJtILFdoZLQH/p/OQbEDffh3JAvUZvu4i68FFVO3teJ9ScFM?=
 =?us-ascii?Q?tlZM54mprEEmfYhUxmnnz1SI48Jqy9JrIXquNzVR3v/zZJ4PGmkGGTXIrI1Q?=
 =?us-ascii?Q?8HMnCjNDiUIr8l+ey7JWl8teQHoNOf20UFrRY72k6Ei3VE19bsnuoh481Xfg?=
 =?us-ascii?Q?UQMhuq7oAraVByKnkpGgjXsw/SUmUiDCV+IsEWawNTUW5rBHYnv8dro4p6Bf?=
 =?us-ascii?Q?8Ea9WsQL3CeyqmhrMhupxkKgh8wFwuecuUeYQdqc5Tnmq3W6NOhk1fev6/TW?=
 =?us-ascii?Q?DQqPON1XbDzkQn/lkxhvYA51NpmFqJfcXwI0XeM3BbooZ/g0AHldGUQCqY7z?=
 =?us-ascii?Q?woAty/5BGeGB2MP6Bs6DKSpa8tdjmijqLjPHaC1FOnj38pWuI1yEdMJc8Ew/?=
 =?us-ascii?Q?g+1M4ok9C5UyJotTlMRc13aWt3HjGkBxa1xvReG2RaViFuJaYrraEqmQ83qn?=
 =?us-ascii?Q?YhV9l4IrBL7HwPqVOu/+BMUl8r2vd/2eDlKlvcICdLeH1TU0gPBMWvWOqjrp?=
 =?us-ascii?Q?H6cn19EwAH9J4IS12D3owTt0KtLtDOw9KKulvTjXSEQJgC/lUEO3QtV3F9Bj?=
 =?us-ascii?Q?yiy76u2NlRliwS4uWtt7nRm9eiBqwKOfqYzZfKBhbrCTJKcQ+QHQ00R9ftIP?=
 =?us-ascii?Q?g9BzWmnGuNmvAlj1N7GHrR93zeMLAd86kxKs07K7/2q68suxTgTx7DBd3UeD?=
 =?us-ascii?Q?6yQCwplV0X9+LNRN4cYZWrsN2yRKLBSWSQHGEZAE5ZdN5RGfht/5+GppQXgI?=
 =?us-ascii?Q?+bZXKhrmpM87cpO98O/AVqWe5IXdk9KZZsOtqmhFBWjEZdWug+MQScMlsVxO?=
 =?us-ascii?Q?kl01Xw8dgxz/AgHz+g2PQsRPe70BgHlOfnefJJXtquE9SeV8hvcLdjamiw74?=
 =?us-ascii?Q?3Aqua/xw8jN9CQyXVgQMDT1oUFlOLn1RRkk+pg6GD6dP79wH9CiPvlibGYHv?=
 =?us-ascii?Q?aAy8nJEBB7dUCqxbQKMQQQvuZKYb9WlrgyfWNJzd0kYiSR6fUjcznBKcmU7R?=
 =?us-ascii?Q?J80Xul76Hq88V+AOfHNYFCzbm5/TJLGKRy6pfFALWMZOujT2B8f7jptstHfl?=
 =?us-ascii?Q?e+QEx2tjbRDKvHzdwQzbyU2WkeyAMggrSBBpllvnlRuv8WfeJHVR9Zvu7kFD?=
 =?us-ascii?Q?IpcNazFWEyuF0LdEdrbR53aoUs+aoSCBFXgD7YiuLcPPnEIyfaHJa6eQzPs4?=
 =?us-ascii?Q?AQk3jHSFkm+m5UmfXRVcUbaW85b73mDIZhy5BZU4x7d1+FCcgKvvXcIEPQrw?=
 =?us-ascii?Q?AdrvErCEbKw0vDPzfkgd9N62T5Ry3ME0YXw53iLT/AUZ2UmWAhGiIh4u1u8p?=
 =?us-ascii?Q?NA=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cd91414-7ba9-456b-bd8c-08dcd0296480
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2024 17:12:17.9539
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 12AR4zDAVKyvsvpGZfMljcT2dKV+7LaOQR1RWf4ujXJUintnktWaj9Sehca1jC0hdOa7p5YDgit8ilxhIKHXUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR06MB8606
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 08 Sep 2024 17:12:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112162

The repositorys LICENSE file contains BSD-3-Clause license text, so
update the relevant recipe information field to match.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/recipes-devtools/python/python3-pybind11_2.8.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-pybind11_2.8.1.bb =
b/meta-python/recipes-devtools/python/python3-pybind11_2.8.1.bb
index 4d94e2033..4da693d4b 100644
--- a/meta-python/recipes-devtools/python/python3-pybind11_2.8.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pybind11_2.8.1.bb
@@ -1,6 +1,6 @@
 SUMMARY =3D "Seamless operability between C++11 and Python"
 HOMEPAGE =3D "https://github.com/wjakob/pybind11"
-LICENSE =3D "BSD-2-Clause"
+LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D774f65abd8a7fe3124be2cdf766cd06=
f"
=20
 DEPENDS =3D "boost"
--=20
2.39.2


