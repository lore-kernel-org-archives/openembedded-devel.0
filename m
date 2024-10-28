Return-Path: <chanh@os.amperecomputing.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C33C3D13570
	for <webhook@archiver.kernel.org>; Mon, 28 Oct 2024 06:55:28 +0000 (UTC)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.127])
 by mx.groups.io with SMTP id smtpd.web11.45651.1730098518471494070
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Oct 2024 23:55:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@os.amperecomputing.com header.s=selector2 header.b=M/JJ6xTI;
 spf=pass (domain: os.amperecomputing.com, ip: 40.107.94.127, mailfrom: chanh@os.amperecomputing.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P7ldrYrxzIaaB7cWThr9G0uhhmjyFwIoSCSE2Qmj6jcXgJugnaj+MSMxUxTBFPgO0OJBkH1O7x4fVI4tw+zaRqTnuW6GVvY31PEYC1H1gyDNH+cCxqJkVcdesgW0U4nmesLDnjlfMH2Qyq7Rmck9vV2BIRmkyLN9Uh16VrKuuh7AMbQNI0jx6/mufi3eRoQhEElRlyjUtyf29Dr+7AVc/APuta5GS9a3wqjZ1asP2CoPw8+0NgpPMijv+DperJXgZy2XBQTevOqUcPZn7GPVQvbfAep0OYDP15mksaPunWVKnrcxVI9UbF0sqG+NNkVSeBm5z36ncazpRStZ/cY10w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PZCDseJLZrFMG6glCyOkZ/EVF52m4PuZ25HNB1/iHNk=;
 b=ud0Gb2ZXESHyPeB16pwzALKi/r2ps1eiatgvUukgy50/j+h9yw8lVMp4XfnSufc4vJaRfW8WTsNfr6JQo5muo/KNGcjT6A1MbtHKKg5YYYZgNYD0tEc0vSM6cDdTVelQkrOQ7ZiKhmz4/P2Hzf4teIRZ7nPp4kcQ3+tbBOfeOqB0ZN3wZqVXTn+5Qbnaw5gq0Fke910P7P51JqUC/UtzwiySvZbfPo+dJyCJNjVEDO9n9GExTKkTSX7r7qlVplByzibwcII7jMrKV+SpC4AikZ/Txq4gQoezIu2S73vyGssZ3sIDMA7ep3i8vNEnUUkoPLkp51JJRtEDNb5KKM6HdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PZCDseJLZrFMG6glCyOkZ/EVF52m4PuZ25HNB1/iHNk=;
 b=M/JJ6xTI3sxAbP/SZS5gor1dCHrt62NWRDa9tnnuJdHAB3iY0yKNaYuvCtQ8yxHDskUo9FYe35LfEfKvgKgrVCwjDL+3FOL/s3gTii6AOfxgPKQZkaOxF/2mBX2yffiVrg7a4URryo1PrwqJkaOotVkbP8uro07Bl9QZ9ZZB2P0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from BL3PR01MB7057.prod.exchangelabs.com (2603:10b6:208:35c::16) by
 CH3PR01MB8421.prod.exchangelabs.com (2603:10b6:610:1a6::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8114.11; Mon, 28 Oct 2024 06:54:53 +0000
Received: from BL3PR01MB7057.prod.exchangelabs.com
 ([fe80::b69e:5684:ed7c:4d09]) by BL3PR01MB7057.prod.exchangelabs.com
 ([fe80::b69e:5684:ed7c:4d09%5]) with mapi id 15.20.8114.011; Mon, 28 Oct 2024
 06:54:53 +0000
From: Chanh Nguyen <chanh@os.amperecomputing.com>
To: Khem Raj <raj.khem@gmail.com>,
	Jeremy Kerr <jk@codeconstruct.com.au>,
	openembedded-devel@lists.openembedded.org
CC: Phong Vo <phong@os.amperecomputing.com>,
	Thang Nguyen <thang@os.amperecomputing.com>,
	Quan Nguyen <quan@os.amperecomputing.com>,
	Khanh Pham <khpham@amperecomputing.com>,
	Thu Nguyen <tbnguyen@amperecomputing.com>,
	Chanh Nguyen <chanh@os.amperecomputing.com>
Subject: [meta-networking][PATCH] mctp: Fix build errors with clang19 + musl
Date: Mon, 28 Oct 2024 06:54:28 +0000
Message-ID: <20241028065428.106480-1-chanh@os.amperecomputing.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0127.apcprd02.prod.outlook.com
 (2603:1096:4:188::7) To BL3PR01MB7057.prod.exchangelabs.com
 (2603:10b6:208:35c::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR01MB7057:EE_|CH3PR01MB8421:EE_
X-MS-Office365-Filtering-Correlation-Id: 22e95f73-647a-473e-1d55-08dcf71d6c9f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?en8r9OZrfN/qcoYmc66cEM7yjKsdWfw9k/XqrbVrIY/KKMCjZOl1e+pASaer?=
 =?us-ascii?Q?9ogT6gXUHSGKXMlwrBbktqMA3hs0bxHXD/jKTnR91N/jLPtoswWLh6CdzE3r?=
 =?us-ascii?Q?H319Fv6xRqZwUZtSo8Yw1RBpGQR1nCCxkYmms46mouLV4+6vgqv984fymaoQ?=
 =?us-ascii?Q?74nLqXNy27CjPilcxuzN0YE03iCLhlB+tEiMjwbOwIUh/pg2apImOw4HjM6E?=
 =?us-ascii?Q?fggwQgUk9cBhp5HaUCr/h/yk5lBsax3czt7o/66gvR/QKHvOQSeWlun91Q2C?=
 =?us-ascii?Q?tsxx2nQ8XpurDiQd+ezFKCI3KbMN2vg6pR5O4gmNZUWl2YkMeiVIx1HjfWAG?=
 =?us-ascii?Q?sZ3OPJgHSHSmesi53eR4cxOeTFVFxBqIXNls4aaLxRfxTvT2dr34dmPwRXbb?=
 =?us-ascii?Q?QzjllR7lCB5WveByJVSW6WVRZjEe1Ivgn9t1J4Y357j60NcYq1N1tTj8IMsx?=
 =?us-ascii?Q?i5HH/9kO916YMes7I63+DTuqdt4v7IuMu2rKWLFGw3KrgRCbj71/O1Hc0Dnp?=
 =?us-ascii?Q?9RQlyTbZsRtk9IuxYjCIUYsQZXTNi2JbWcBa8VeLyCpZO34C2mrCFa8FTHIR?=
 =?us-ascii?Q?olErZCkzgEDR0Ob3pqXbrZp9YwAVdKRpUEaKI1yCu7adm0t/AupMUnBRwbGu?=
 =?us-ascii?Q?bR5FOSFxegno/F42VGCBVhgB60LhWUTuTZ6bb73RydjOoWAUqi3obI368Cvv?=
 =?us-ascii?Q?aamOLxqVL6svJ/XlHP77i+v10cohvFCUYNQehkYzqJFDPkAyljXUBnkgRQGj?=
 =?us-ascii?Q?v2eJgXc0mSx14+RsgG5PXPfgXrWgMBfPVDkkGQ8eqh1wmR3wlJX6WNjN+CzG?=
 =?us-ascii?Q?GgKDkqdkRLNc4nUlgcFYn3XXJjBxav4RT+Sgz8Jg/JRE45FBq+tNKsiKS8Tr?=
 =?us-ascii?Q?qGYMOvWtZiyRCN9W4zzKzyP3X7O/sdLYFN/igupONxtC6iR3foTuHPGGD+WJ?=
 =?us-ascii?Q?DK+scbhJjOUIenhrFAC40AVl2lS0/x/PtDIyPXxsPzpfM+5MJOfkq++7BhDv?=
 =?us-ascii?Q?734RDLfLdsNqVU961J6LXji5WnBDyzRbStkQ9hn+DsiLUa8j/GmVwziI5w84?=
 =?us-ascii?Q?rFcyFU/RHvA4XjbAHYFlGIxkhy9FTsoUZqyG5ysaFvnw6U4nfh3n8wmVKtQ9?=
 =?us-ascii?Q?yWQtNtgNz/RnAnHV+2TTq2dcMLXn5e64/vu1frMpVSGVhMl1FdmXRNwk1W7W?=
 =?us-ascii?Q?TqVrOIBl4A/ypoxCPzYKJCliKtNMEXCPupaggSzFP4DQ8oGDMklWBfhRaR0g?=
 =?us-ascii?Q?1xmvbKuQeMIY76QOuwAQSNfOewpDEOlcgbjGeX0vu222jvNVvRF5+tm1mZcf?=
 =?us-ascii?Q?UMtdVcPLXwyAAffpSpC4GxGnp+AHQYb7qovYnvpajv/Ckf71H6Uv04tzunNB?=
 =?us-ascii?Q?OBOLjR8=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL3PR01MB7057.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?iW779ayvvylgj071YkAKGFURdyw1VFMqpfo53dZAKDh1i9+llthrTt17lc34?=
 =?us-ascii?Q?yt4/45TQm0rZR0bQ7ZVcWgQ/KF3JReNs9M5XAKC/x7K+xTbWc3GB5oMAA95h?=
 =?us-ascii?Q?uioxvt6f6jwSF5pbeYEb+GZuqjFmXVVw+rRD7b66Ca+EGHfnY6wFrxcBOWNH?=
 =?us-ascii?Q?QREscVghAkDpBOywV3QOOAFoysqvguVD5bfidgcHyzUJM0lZfLETUkuTXArf?=
 =?us-ascii?Q?co5TOpQV09Ap6Ur7wPrHjoE2Poe/NyUqCdixVi4v4XPRhPvGJymAXk1WPGIR?=
 =?us-ascii?Q?+iN20A8yu70ashCerL9T7Bzdk3g7q6o2GW6fy4mmW3+g6m6wZQNer4POBLX6?=
 =?us-ascii?Q?TOvVyL6Tuoz2Mw/RTyzEPAuK1Oz1J2Eak435D253E8R716162WEReiOb0LTa?=
 =?us-ascii?Q?S1gD4cg6708KvNEiJt7/BC0+jo9Va9F+xGvP3DVwaU3pqOTB3nkcFBLKA/CD?=
 =?us-ascii?Q?m/h3t0WljBP6mBE0rYBQRdY2nGdUPJ8f0u+J2gREFDwiUBsLcU/f/ebnJ22/?=
 =?us-ascii?Q?mfgExXsuJpvv7krUBMJJEQ+yJhz41XCDOVk77dJkdifnl5p6vfgMSlE880RC?=
 =?us-ascii?Q?IaT7lePo93IVRsAonPfrZkZ+trhwOHnLoYzMfRpq1BlHJGlOOARP1K5Pki+S?=
 =?us-ascii?Q?c2uj6XaYKq9YKd2rG/SjTqpHACRS7/3hUHzK2hQ8axtE47p+cnbqRjnsFiLH?=
 =?us-ascii?Q?ZbeTkhIGpxg2rocU7a30aRzL1ZqvgjSpGR8VfHEKfIE4mnaxxaSLzr5Vc6gK?=
 =?us-ascii?Q?fUg97ZxpYND8s1d7fjJzV4i9vKdowz6CZdMIEFbJmwh6JHIy7m15WyWzjth4?=
 =?us-ascii?Q?XUoAfrKZVpeQCR5zU4YEia2RhBvNu3Od/M/KhpQLvLc16CzH2KgHG/XZmCmh?=
 =?us-ascii?Q?hkiE9MKKAI6cm+mcUud67udfruZIqE6E61rPe4OGaZIhCmMMp9OGG7fwJ8uV?=
 =?us-ascii?Q?GRV2bdeV6VpME09EimRfontlJb9aFIyBcpLqYAkKePY8i6LS1J9OkrV0TdIT?=
 =?us-ascii?Q?jkEvF/Y4+5F+B7IQR9F9wYNJZH/hFvHEoYUCXlYFlLsfCJyPO1y4uCHzRMNh?=
 =?us-ascii?Q?34BYaN/w1kA2x91USZXFN+5Mvod/NIU/0I8yzhqqQNt6w3S/yacigRuPGOmK?=
 =?us-ascii?Q?0oZIMwIqFkVh271hXAck7TvJBuRF22l3Gtu0rdyOJDNG4BMjv+XzV3ZJEAIF?=
 =?us-ascii?Q?1DSMQhyRSFhkP2UTi0w0IvvP1674xuxuDPpqGJy7iA/Sxc+AROVeCQjiQU+M?=
 =?us-ascii?Q?JXesVGiD7K0dY3rV3jc3ea/xGphpF6tr9ecKfcJYzjx3QfKoKAEVzJzEssmS?=
 =?us-ascii?Q?c5j6VsGpqdPbZ99CONFeEcckolnJ3xIbzRAWddE8cMm/VS5dNoWp6DgbrORa?=
 =?us-ascii?Q?FZRtDY6akif1XO6RqG+H+zSj/f9x6xMw4X3AiDLQaV+cUOZHequxsgFnswD5?=
 =?us-ascii?Q?SUI/kWD9J0M8bxD9ppkFmWf+l+o2Y5o2MzyckQGh+Syw9wBI3sC2MqDhNAxN?=
 =?us-ascii?Q?VSvrFwZtVS2A0EWLS8Y38IE/ewlOhVCHLLhhpEeLea1LpTQrW7XvXqYy0M6d?=
 =?us-ascii?Q?u7F23k9JIF31Wi3heScF2ss/G9EmpEClYzizMuoEgKPFK4Lta8rGXgSjhLOQ?=
 =?us-ascii?Q?RqwqQpg4Zb4GJC1XapBfX8k=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22e95f73-647a-473e-1d55-08dcf71d6c9f
X-MS-Exchange-CrossTenant-AuthSource: BL3PR01MB7057.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2024 06:54:53.2281
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uIZAHOWlAaSy9UuQ0PAt79YL+m+aXVXqBJszLiHUcQJKR+amR/333V9esWcxk3yomfV05F8yCV406S6Mw6VwMP3l1EQxdeakAbbluCloZ8vJSWe/eDinHdpRg/KzyRkk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR01MB8421
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Oct 2024 06:55:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113255

Signed-off-by: Chanh Nguyen <chanh@os.amperecomputing.com>
---
 meta-networking/recipes-support/mctp/mctp_2.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/mctp/mctp_2.0.bb b/meta-networ=
king/recipes-support/mctp/mctp_2.0.bb
index c6aa7c104..24f974774 100644
--- a/meta-networking/recipes-support/mctp/mctp_2.0.bb
+++ b/meta-networking/recipes-support/mctp/mctp_2.0.bb
@@ -5,7 +5,7 @@ LICENSE =3D "GPL-2.0-only"
=20
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D4cc91856b08b094b4f406a29dc61db2=
1"
=20
-SRCREV =3D "f110926b082731b25720b444378ad55d7a9d451d"
+SRCREV =3D "089dc53fa7387cca517cd713061c323ca06fb6dd"
=20
 SRC_URI =3D "git://github.com/CodeConstruct/mctp;branch=3Dmain;protocol=3D=
https"
=20
--=20
2.43.0


