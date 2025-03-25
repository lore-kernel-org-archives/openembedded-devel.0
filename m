Return-Path: <rasmus.villemoes@prevas.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A31DC36008
	for <webhook@archiver.kernel.org>; Tue, 25 Mar 2025 21:02:52 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.55])
 by mx.groups.io with SMTP id smtpd.web10.7195.1742936562845963700
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Mar 2025 14:02:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@prevas.dk header.s=selector1 header.b=APdEeJ+F;
 spf=pass (domain: prevas.dk, ip: 40.107.22.55, mailfrom: rasmus.villemoes@prevas.dk)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r9sm/y7KEn6i7Cas/zQf5DmLc8hBo8UALFSlUqeF9HnNcHKzh9DkoKnYvidjNlykSZIY1Fj3ysmze8gcK7boN5qqQhqXgzMaH8/0GJYauprQlT3nQwrLvkRkSfyQc9W2WhrVQwf0pE3tzp2dQpyZ/3EGEKBeT8z0Sae+TL0uEcyektZVQsbFUY5x951NmKnDJArjLdGxOz2cwh5+wjFlLXz8B9hER0UbVDGeh1H+8n3bHxESWjwPh6NAlNVeYYNQPQl036CiYgIFePahYyQfeu1zDIhUbhfrd8H6VAQ7qEE/dd69OMkdB8wY0/5gtb4XOvXLaX6vji3QYeVN/CBINQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q9ZkuT8qtk2ySGRoIks1bVrxxVCTeaKFU8ZRUQhkemw=;
 b=DZAzJnypHAepRmpz33B+/sIPuCJB4uFCsP88xOk5+57B6O4IFQ9gHNCWX7dg/Nsv8BcvB4Z5UzKe0AHMtTTl3bv4XHep7Z9ZwkgPUUTDB6sO2a+WkNHUMPFHNyH2OguH81DeIZgPvhIWNvr42mxPPpJtfT1PAsy7NnHGkQ3a/HuXU/uonoSDAQBtfcx+/Q9bT5OKi+sG7cwrJFLTrgMAAj4uF6oUSqyFCjsSIGDVU4Cvr/QGr65qb38EbLLBrzXadow0qMpjdSYdnD+FabUBTqAcmhxNdUMzp7Uup8HQaz1D//Jf7uba1LKUkpPRfVwA/C07TkSoqQT7Tzxtk0nZGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q9ZkuT8qtk2ySGRoIks1bVrxxVCTeaKFU8ZRUQhkemw=;
 b=APdEeJ+F92usSSYvar1eAy2iokQNUxZJ35fEAJUU0bcJdGmZf0MfqnbXhEJVBtocmE1Dd6lwJ0NGxtub3bWLpAyu1XfAxnliJk9Po7LuLZFXOiXXrlMRJp6sGr2bsX8+6zlnDxi5O+cd8T+P2YDOLGGR5mmIuf+J6lkp/XrTNpM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=prevas.dk;
Received: from DB7PR10MB2475.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:41::17)
 by PAVPR10MB7090.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:318::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Tue, 25 Mar
 2025 21:02:37 +0000
Received: from DB7PR10MB2475.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::7e2c:5309:f792:ded4]) by DB7PR10MB2475.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::7e2c:5309:f792:ded4%5]) with mapi id 15.20.8534.040; Tue, 25 Mar 2025
 21:02:37 +0000
From: Rasmus Villemoes <ravi@prevas.dk>
To: openembedded-devel@lists.openembedded.org
CC: Khem Raj <raj.khem@gmail.com>,
	Rasmus Villemoes <ravi@prevas.dk>
Subject: [meta-python][PATCH] python3-netaddr: add missing RDEPENDS on python3-pprint
Date: Tue, 25 Mar 2025 22:02:33 +0100
Message-ID: <20250325210233.1083451-1-ravi@prevas.dk>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: MM0P280CA0083.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:8::24) To DB7PR10MB2475.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:41::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR10MB2475:EE_|PAVPR10MB7090:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b5fbc2e-498a-4008-4c55-08dd6be05f67
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?n8aTAp8QchcK8qOihifMnvm0IvRigqY5xzbLSdS+f7KiXDQ/Fa5ocqIXvF1y?=
 =?us-ascii?Q?+wtTpA6lKwmvW5VZK5JgOejai36foA+gCy0/cuDq+mnthUn5CpWpNUP85LCe?=
 =?us-ascii?Q?6WAVXwWX1QGFl02hih/i+AdyFYHLmXzulZZKNSJpYL3spAOMg1YnZNqN4FYx?=
 =?us-ascii?Q?/GkYhQgCKS2/K38qGNrFrU7Kpb9eZDxE/NhiWHEeKbvxmqMIO+eyU25+XKnB?=
 =?us-ascii?Q?X16rvpXN4y+s5jDH8CGPaQKDWoLzOoY7dBCYuUrCM04qNUbIyKqscVhiZ6M6?=
 =?us-ascii?Q?TYnx8FzaybFFyfH2d5EAN9mj5OgB162PNgJ0QaH1jMlpKkBB4jJEcb+CNIB+?=
 =?us-ascii?Q?x5AMizrNw81Bidq35WepfXkTGdBDhOGBqXIW0Qin0qFDxqxMbT8rTqKo/MG0?=
 =?us-ascii?Q?7fgbDdooEL7yuaQXDNOIJ/oaMQthuXgmrgESUTfSZxmzPrHrgMfc2XeASWkD?=
 =?us-ascii?Q?3n2zbL7lOTYt0Pkj9loJLXdMv0MYD9aRLExIW6GyWTQJPSzhbvAFosd0MUNn?=
 =?us-ascii?Q?UdHVwFgtwNCxvJjS8cZj7pvujYN7mgNJWe+sw99SiU2mIR/qsFTkRBAbk9Pm?=
 =?us-ascii?Q?RiA2bT3wPT2q2sfLoly1olyoWxHInF4kEu74rDZ08FXXxEmgbVG7EuD9fYU1?=
 =?us-ascii?Q?JEuQPgJa2DhPhSfdoQXWeBimaJAMJo+1xSYiqgBrpmu31WPgCYwSCMSQvj1B?=
 =?us-ascii?Q?VkvJZ6ccQBIiV4N1Lw2Wulg6pPYYpPj8NYVOH/i3ULCtP9oG5fmRFVe3rURz?=
 =?us-ascii?Q?LfmHF3lj1SHe/BzWJxIYSFue4A7HXnXFW+CzvzjFkEYOuTrsneqhDKiNwtYB?=
 =?us-ascii?Q?Xl5qjFDj5VpJhJHnFtUklKFebFQxbyuJFssENHJnFiwVmZHnuxggovJVivtl?=
 =?us-ascii?Q?so0ZNwLPASs5Zy5m8+tbq+sD9dctMxU4XRTkcCPh/N/+xWhLlZ7jTC20iPvV?=
 =?us-ascii?Q?iT8JSffN7ESguM/rHGWObt46NIJaSQrBLtHJJU0e4R5IZr+2TuaIkPXdIo/V?=
 =?us-ascii?Q?amo1ERfaoc0QInyH1bnHAbMUTx/EvJvQ+p34RMNyQ8yY2yjBHF9tzWjmGOBX?=
 =?us-ascii?Q?Ayb+/6NZIXALFVlzLUBNxCMl6QK7YWgeQMHnLHEE8DVen7qwRESZwcumyfoS?=
 =?us-ascii?Q?qu9qHCgl/tqj9uYt2WO53eB2mLnuSszjroYN+8Yk/4T5w57m0lsaNDbMKacY?=
 =?us-ascii?Q?IOO9hpiB9mBPuua6TCjGcgvjBrynFIjKj1/nCGS6pnAqN4QXDEd0LgUNvSmr?=
 =?us-ascii?Q?dw10BTSSn9/+0H+PqjtBXpkG2L/bnv8FfAsWYg0fkUTvutoMFcbrNrR0cZ2w?=
 =?us-ascii?Q?mCLbHcikCVWRF2gyW1A82CpVuu5zVrfRDVmRyHJRTZpcu72gdEbkIJcGT9/W?=
 =?us-ascii?Q?7Dyu/S8NhWs9FVWmhfB2uHoZ6kQ3f5CGUCwWMAiAV7DohgtFqhn2AZ96N11v?=
 =?us-ascii?Q?Tnxbx0IsvXDZCY/ka5POFfu3jvsSTmvP?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR10MB2475.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?SunpUgNQRf+SmtBlUFJhF8G4ixCk4B7xc0r+syMzgQViBFDV/VclxFbyKv58?=
 =?us-ascii?Q?kEZGYXqrEuPCpY4T0s/gvleszC2LTRNX7Bq6GAtMuxBcIJ7kvofM9/HLtV2C?=
 =?us-ascii?Q?bIfeSI24erRMDICbugTPjk1JMRQOH3frhyik0MFcc6BbeapJgQQgrGKbLA5p?=
 =?us-ascii?Q?YjU6h8+H4NflLzmda3noaCdpAAJyEMmpzaaeXlFZRrZCVYjU+VNDqYghsYRJ?=
 =?us-ascii?Q?UpVJqRGrHpsfD9nBKQF4usfdEuPllN2KiVvkEJZTs3vBWmPHr/ZbVRFNcqZr?=
 =?us-ascii?Q?ll+/2tHhrrS/yz2f7cD9dVtPxff+y7tYf+c5Kx4n9FkCpMpa6/6IwHE1x+bb?=
 =?us-ascii?Q?Nzum/Zy/g65fZRV63+1PldPGKankSvdOZz27NKDdyNuqrJa2EBqWUfRm/Tm7?=
 =?us-ascii?Q?bxeOO/TUKZEzI1fhojyrF0YNh4YOAqI2f67xPXhEQjWsr8yFuZJuYwzKo8OR?=
 =?us-ascii?Q?EL8Snu5veB279WXtbjrll9K7ohMbuhlCanKlLk59CUWQH7znC8+9fFmPOQQW?=
 =?us-ascii?Q?nMWRWPE0DvMIPZUNA8V1zLpGiWBdFu7tYPk/9oHdtnGy5aN51WbvWRSqU4U7?=
 =?us-ascii?Q?4yx6dbgSQuhOT0vD7zs+5kU09M9+Q+SZVCXJDPP8CN/beB7Bjx9iN3rdKYwm?=
 =?us-ascii?Q?EISLPI/YoSyXQev7AIgbQXbAnWy68C85BCSvwH6ujcoD/+8BApLT2cFUgDwj?=
 =?us-ascii?Q?6NdyXdC+0Fs5qeBPF2M6bvwbS2pfxy80PSJNzC3sbZpn4k3ieraQVPUAswMw?=
 =?us-ascii?Q?bWIO+3kiJRQexwvm05qRg+ruzJbN2DrSEJWGCQuFrCKsa64H7otj2wTAp2X2?=
 =?us-ascii?Q?kYOnTd/oDIo0unwPY2pOTLISqt+LfK8DwcU5IEwfrvIev3EmDFlNvD7OuPGN?=
 =?us-ascii?Q?jWg8imsiwStg8g099/Q+AQRzLZ+wTUUz4f39IN0/68kPoxMJD5j/6UPXSYbY?=
 =?us-ascii?Q?SrusTkbTDhkwhbg9CFvdXZhsbSSKLLLWKn9X54xw5p4BvZvnO+EcTy5qczE+?=
 =?us-ascii?Q?HdHQp9unXvn/vkFYPaTGkZFGH+pYkzXovJEIaq2MEAGD5Nn9S8mMdag2l446?=
 =?us-ascii?Q?p4quh1sC2PkXRpTNBtgvnlqbyY0e0lIlpSIipgpA9PXUIRNzT4eCcwKeno/Y?=
 =?us-ascii?Q?ClZaYp2FOc9FzLMgKQ3gBrqK0LcJiPks2X5FKI5DV5o0FhZox3J47ySdM51G?=
 =?us-ascii?Q?kNYTzd2EkIxoxcQiwSXsPc+2fkojF+n9Y1D7zCL480fuvSX/1aylZHYMKCKD?=
 =?us-ascii?Q?4AhXGxtvomIJ+XnnfHQ52B9MYQRwEIqLsua+V1orj01rKjDq7SnjfCDOc8tb?=
 =?us-ascii?Q?5Ev40hjvEjq3ldtAm70plJjyrLHBz9NDyHv5U3ECYhjxc55v6zzq09dFU8C1?=
 =?us-ascii?Q?7ihA57C1MdZth9xCOrhIQXwylqi3rOLX1T7Cr56gOm74n7FmXfbF752eWD7E?=
 =?us-ascii?Q?Dhm0Nfpr+VpPe8nhQG6Qh4RF86T+m1OdPwGUxNpFxD4idvo+bL9SUYXOjNXt?=
 =?us-ascii?Q?23PJffvuqwJknOvFSOa0XZQ4i76lPVKAdQFxha8rwPmDGCGkCFgXdxSytL17?=
 =?us-ascii?Q?e7a949/5sAX5N6MuY1K0TA8RRXQQD61vgbe4O0DPWf6ZSnVAlYD5GJyUG2Rl?=
 =?us-ascii?Q?9w=3D=3D?=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b5fbc2e-498a-4008-4c55-08dd6be05f67
X-MS-Exchange-CrossTenant-AuthSource: DB7PR10MB2475.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2025 21:02:37.5747
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tzOHPpVyieBidkOx2izbF4/WBQgsa+Nv+e5ZLzWmMybyrfjtqDdaD57hSr7H6uUDrsfAeKI5WuzzKlQI6kO1sLUkrIgtrsjqx9IcFpb+L3g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR10MB7090
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Mar 2025 21:02:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116283

From: Rasmus Villemoes <ravi@prevas.dk>

core.py in the netaddr package has

   import pprint as _pprint

and so I hit

    from netaddr import OUI
  File "/usr/lib/python3.12/site-packages/netaddr/__init__.py", line 76, in=
 <module>
    from netaddr.core import (
  File "/usr/lib/python3.12/site-packages/netaddr/core.py", line 9, in <mod=
ule>
    import pprint as _pprint
ModuleNotFoundError: No module named 'pprint'

Add the missing RDEPENDS.

Signed-off-by: Rasmus Villemoes <ravi@prevas.dk>
---
 meta-python/recipes-devtools/python/python3-netaddr_1.3.0.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-netaddr_1.3.0.bb b=
/meta-python/recipes-devtools/python/python3-netaddr_1.3.0.bb
index 8b486d26ff..256b38a135 100644
--- a/meta-python/recipes-devtools/python/python3-netaddr_1.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-netaddr_1.3.0.bb
@@ -6,6 +6,10 @@ SRC_URI[sha256sum] =3D "5c3c3d9895b551b763779ba7db7a03487d=
c1f8e3b385af819af341ae9e
=20
 inherit pypi python_setuptools_build_meta ptest-python-pytest
=20
+RDEPENDS:${PN} +=3D " \
+    python3-pprint \
+"
+
 do_install_ptest:append () {
     install -d ${D}${PTEST_PATH}/tests
     cp -rf ${S}/netaddr/tests/* ${D}${PTEST_PATH}/tests/
--=20
2.49.0


