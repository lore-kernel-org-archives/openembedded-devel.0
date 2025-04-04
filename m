Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E8A3C369A2
	for <webhook@archiver.kernel.org>; Fri,  4 Apr 2025 10:54:53 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.76])
 by mx.groups.io with SMTP id smtpd.web10.8468.1743764081901910353
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 04 Apr 2025 03:54:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=hHNk+SY7;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.162.76, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s+fWsLDTy7p4Vci70XNklU214STGvRsNmbC43WJMUswuXAvb2dXLo28z56wmwlQHmmselnVexI/ymATTqJ5Z7+y1G8YR1gBvaLTkt37WZr7ZzvKJOOZzRU9NkNfXAh7ejC4VrpisDITjOZJKuwk92ZpbRSB8LzE+RqhXCDAMH+X+VULenKGVpIaGrGC5dQdGmtmJntkOGiotAem1hmjhEbYlrT5RFZ+CQsIEJPgPbUbIUXXGkzfRb9IPrem0+fRbMwVrjwh6lWihrigJFnV6JQn46otk4v7KHAi50q1LsdK8T6hf/x5ED45FyYAPul1ZCypGYFwXpulEEorpwQnkNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fbXd7HV3uIUn9G9r0LtOzGwmf279CfNQPDrGj/2ezoc=;
 b=NTQdPmnFGwbUJf6n7IhnwFXTtVCPBV3zqhAJld4e+UZsm4z7TcpN5xm0UparuIMO1gNJLM3kY0QBbVAsgwZ6HabafZIoPkvQ0VhItHAI5dJFcwXZCRZq+Zi4BevA5CZZLec8ZLmdJZZYZUOlyE+lxRVco/6B01hUS7A1wM96tCemjG2VqX+TVXDOskzyl5i7UXDGUw0Qe9ifjoYn8lffT5LaovCuu0IXD1miy2YEx9ZcWMIQchWsC+fjG7p76wnsB+V3KMrPr9vOXxmbX4BQX94i3dZB4zMwnjAc4PAJjtnPpmrEyx+af10dMUks7+DxRCuYeerTI6sdehehjV5mEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fbXd7HV3uIUn9G9r0LtOzGwmf279CfNQPDrGj/2ezoc=;
 b=hHNk+SY7Qj+DyVwkk9V6PEsoAxbftvsxHEIV3Mu+LC+84D3zqfjp6cHQyTnWfFntRnwU2sNlDhN3REcVHRI+AH6RlrKbhou8NGVQTlMbht7TSHfmHA2OeJsqruAmomM13dMYeiaf+heO/WflwbZoF0SzQuSawV7i11eLQcxnK7heGypCVIeE2VDKikjVgxdHAfqYoWtQ6XNC/fc4GI2UBrHivzchvtlVkU3wrUv11qxjsNY+b46jiBq+4ncrgSXruku7+H/tH2EWV0s4Z3nQwYjUk/taFcYXYMq5jjzzNtUBzcW8aumam1VEL++zNnFJ7OY8+8pe5XqWdEPQG+5Syg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by AS8PR06MB8167.eurprd06.prod.outlook.com (2603:10a6:20b:3c1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.42; Fri, 4 Apr
 2025 10:54:36 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%3]) with mapi id 15.20.8534.048; Fri, 4 Apr 2025
 10:54:36 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-devel@lists.openembedded.org
CC: raj.khem@gmail.com,
	Niko Mauno <niko.mauno@vaisala.com>
Subject: [PATCH v3 09/11] dbus-broker: Declare runtime conflict with dbus
Date: Fri,  4 Apr 2025 10:51:48 +0000
Message-ID: <20250404105150.870898-9-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250404105150.870898-1-niko.mauno@vaisala.com>
References: <20250404105150.870898-1-niko.mauno@vaisala.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AM0PR06CA0133.eurprd06.prod.outlook.com
 (2603:10a6:208:ab::38) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|AS8PR06MB8167:EE_
X-MS-Office365-Filtering-Correlation-Id: 0873ca80-abc1-46dc-afc2-08dd73671703
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?oTLIpNE6Zpquhb91csGoQmKjqUZCKOOEP01EEXPGL6H8haJr6BRLwcGDwHpT?=
 =?us-ascii?Q?kNo9izFsuY7Rm2XU89GQvTBgsE2lUf7MxwCvbN7CgRQxJ37OznI0mJrf+dxT?=
 =?us-ascii?Q?/pKBZfJlLItNtz33KiEr/FdK1nd42EyAtK6fQbOhvqXRySaq45xO3vZGafoW?=
 =?us-ascii?Q?/38mGabfDEn+fW1TagRmdbMONBgJnUDn67URzEMY1lD4USLEXV6fJr62tQfg?=
 =?us-ascii?Q?VJvCIZPxp2gWbNHYLc4tcGU48qb3ycCqNQTShwaeClRgNIMZmVcQXyHSjFwy?=
 =?us-ascii?Q?E/DK/Htfl63ap4lF5fDls1yusG2hhOcdKzmrgzk5qfeuPgQvYz1QbjIEhR5x?=
 =?us-ascii?Q?7S0gek4BKVc/Stjl72/t9KucGg/CVGDEDqtJthARCtmUbwZQPqkmaEBVjFXq?=
 =?us-ascii?Q?XC0Jg/LO4h8cSV6DZuFYOnQsrvR6wYmygDEFqiqbz+YQkEGTUc6ufE+VPCNI?=
 =?us-ascii?Q?nC044e2D8ecBk6OtrCBsm3WZdceQB7JkYSZV8C16q56n6cFFGAHaodgp3ST8?=
 =?us-ascii?Q?C9ASh3OEZqgSHGsfyguVviprvVS23IlfzTiJ7EoXWNf+kVaEciQoNnc1SGOv?=
 =?us-ascii?Q?Ypr0GBURMRaOcfmeUfryMYRgpkdtwQQRpCP92s1fWHjr++GMieVAA/sxx3lp?=
 =?us-ascii?Q?z9sIbVdL9gx2DN04gDLqFyRsnt6meKx1w0dbdTFvbHizEX/WNo809m7+Wmky?=
 =?us-ascii?Q?6uqzgzbcPptr1HDaJezM9sh9JQMsF5I065D0cYFDMeamwkfilnZSwyBqZ/yR?=
 =?us-ascii?Q?qjcYzTgR1HawjsQriKfwRttXWoHk2nV8WqgoegMQuyZrJf8awlkorEGNt6nY?=
 =?us-ascii?Q?8n7UQTM0oa+XxCkpdCnTlPNnV7QRY25V2HcVkwp3eF+u+HGMx8WXq2TmHyJK?=
 =?us-ascii?Q?MHbAKrb78SsKaLXJZmQjnXmW0txu7wfBenENZq7FbX/v8yQ8Ktzl49Uf7Wzp?=
 =?us-ascii?Q?XNbqttrtUxmhUB9uSwQiokutQfu8Y1ZQp+8XRhXFzbGUuGV1kym3D0owp8QE?=
 =?us-ascii?Q?McmXrIDGgzSPnPxEZvQzUwLIZCgToxC3fpM9IOh3S8Oq+ZdKXKeOVl0ALIB1?=
 =?us-ascii?Q?qcpaa0+1nLyRe7BXZJdiamiPzFcvtXe2VxQ9LKmauHmJ9McYqPKZuJ/pLN9n?=
 =?us-ascii?Q?i/eD5uMYvISvWlZQODh3cGwFqZq91tuHL4sKNkc07tzgxUIhJ2rPfgZiXxEb?=
 =?us-ascii?Q?qaljBpm9q9NSvUl7VIWgtevsfxg0lS/Urgb6pSSp70iR5FtITJOT7446yFIF?=
 =?us-ascii?Q?wZKuiCQS1Oh0M0FpXdvVFB5hu4CS4CiNLp6f8W+UTbJ/mBGNo6fXDE6ma/89?=
 =?us-ascii?Q?0Lgfm6l/9uZQnXylcqR1HG4wtMDaAGnPpC/Gs012SZUuAvzzuGecNx2V6QK9?=
 =?us-ascii?Q?Tm224hUCTT3NProx7IUpFIdeyilLr3ajqPIEb0ij5dlxeBgMN1Mv+z8G4gpN?=
 =?us-ascii?Q?h6o6b4AfpnAMQLysPLznEWHQItSidbp7?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?G9QKcXvHMAXCJj5jGt2ZUaQ0yim+m+OytGDjp78UKQ823PxadR1HatpVWy1p?=
 =?us-ascii?Q?pD9ecfeGwM/legnIxu9kd5dkIE5rdgk3CYeSRx1G8Gto4QwzgQ7Fsbmm6R/M?=
 =?us-ascii?Q?/xJIVbwvzYeqN2lU6g4iowKonQb0Mc4hTBF1GfR7di6NtKL2GyUtb3NHrgxt?=
 =?us-ascii?Q?bpjarj5BOLLoT9Ga1hBeszgSxojbz2Wl+jO25idDGqF/QM26W9t+Xd1jWNg8?=
 =?us-ascii?Q?k1bAdRJdimu78OKw7pd//2p3dUMArayYB0oiQWiNqZBjQeCN0v/KkmQi9UtE?=
 =?us-ascii?Q?oDOXZLHqFJSkqOd5J18nxkNOAmg9+OpLF3sWMEiBO6RJXEo07pdaqFiwsxCd?=
 =?us-ascii?Q?1cslKJZ+DHTP5AgYm0/1EG5wyBR6MYGkAhI2Z8zJBcmQHemF/a81MeBN5mTR?=
 =?us-ascii?Q?aORxqQzsJ+/g7PXrSYdINEY4ZLCbUjZHaLYa8DoghPRqG9rgg5yBbabxJ3KR?=
 =?us-ascii?Q?sEbqWEQ+NfKTncoz3VMMU/qgHfwSMDRB3KbfeMrmu1GaM3TNGK7NWwJoxgwW?=
 =?us-ascii?Q?QQejY0fQw+NG/lFyF9BGNPj0GlHU44a30m6sQ6Uz2cfDyMdoc4vgWxQJWSWl?=
 =?us-ascii?Q?Mt5Fkle+twNR0TZdCWloch1PurWqHTJIkSxBstLAE0wGj/5fuTP1QQaa0aMj?=
 =?us-ascii?Q?CFAAQIqUdq3Eq4m91Cl5mWHKIvD7oSiO3KSuhfLr7n1kbe/vf+v4GzDGvBkT?=
 =?us-ascii?Q?+SrSByXzXf9Muex1zXTtIsVoOlIZT4GTBGWmuFgRLtq4IUo01RUcxl/YFH2v?=
 =?us-ascii?Q?SRjZyGH+/UK2VHCEvCsxcQ1/oNrDoMSrNJFeptzHwjYeyPpTaIA9GjfO8IX2?=
 =?us-ascii?Q?vHzahD4WvEDQHgwFtGZqXs2+xFqN0EX1V7PZrtycFleGoFK9pZhdCvW1jaOC?=
 =?us-ascii?Q?CPXldM+zZFDIocafIrpQHyoNxQ0q9gofEoEoNXKpt/XTP2H+kAvrU0tQGhTZ?=
 =?us-ascii?Q?9C3gdqUGCyDwgpV3eRRs18lbdO8eMkb9RIpTSmmM0e34M1OXikYpK1uPbkAh?=
 =?us-ascii?Q?0hspXFaFKAbjEzTdup+aS9l/H7Vz3ri+N4bscK3+3YE1O2blxaobfDaeU7R5?=
 =?us-ascii?Q?CCdGvhJJI03BSoAMKvWI/5UTpjubBxHcU+eQ2zxm/CbR3AMlCaj5su+G6DLB?=
 =?us-ascii?Q?gom1M1Ccgd7bkp+5NXIP+0jWFJLGJjD+oPTEJjo2EIs39HCvbXHt3RLuf7gL?=
 =?us-ascii?Q?mYadQgGXgNvkObXg51wyEtPug4iOdtKrlduuzFbY6s6GibeEhuluExRTiOvj?=
 =?us-ascii?Q?VpuuF7p0Ibz6zShWGbgmk4ZvZZU5lryz40332zhfPSzaVyGDuLM4VLr++v6b?=
 =?us-ascii?Q?m8QK2JZL+aIzz00e9+om1YnO85h+B91EthPAcs81u1rJVS43nMEOvoRL/i1j?=
 =?us-ascii?Q?NC3+5D3o09nOpzsspUqCNLtk3AEDCaAa/wBy7NdMTBMsmmPvdrxya8lfIXN2?=
 =?us-ascii?Q?YNJbORtR0UbO/Dom0yYgqlKwVFBWpwQEU2VciaJztrrfB7HwlK4SQ/Xa34ES?=
 =?us-ascii?Q?NTtoQhO9sZeVZ3DD8graED1WOVibYqG04k+lX8M4wzuSCZTqIt58HRetx2g0?=
 =?us-ascii?Q?vgpvWn10mG9m5CGFoNAVUZy+urT6ydgu9YPhtE2T6JFuQi6mLn5I4iuCLhOU?=
 =?us-ascii?Q?hQ=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0873ca80-abc1-46dc-afc2-08dd73671703
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2025 10:54:36.2973
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cHUIbE0EL+N2KxsjsEfpY1rIc0DQHJp3eYE534iXpTp/Bc9xKD0VtQWqCOWk8c/lwAq9mp3K8yv9IoBRBo4suA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR06MB8167
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 04 Apr 2025 10:54:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116580

The user should now be able to choose the preferred runtime D-Bus
implementation with VIRTUAL-RUNTIME_dbus variable. In order to avoid
situation where both Freedesktop.org's dbus and dbus-broker are pulled
into the same root filesystem, add conflict declaration which will help
to detect the problem already during the Yocto build.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 meta-oe/recipes-core/dbus/dbus-broker_36.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-core/dbus/dbus-broker_36.bb b/meta-oe/recipes-=
core/dbus/dbus-broker_36.bb
index 5b4915f968..8c8f2d2469 100644
--- a/meta-oe/recipes-core/dbus/dbus-broker_36.bb
+++ b/meta-oe/recipes-core/dbus/dbus-broker_36.bb
@@ -30,6 +30,7 @@ do_install:append() {
     ln -s ${systemd_user_unitdir}/dbus-broker.service ${D}${sysconfdir}/sy=
stemd/user/dbus.service
 }
=20
+RCONFLICTS:${PN} =3D "dbus"
 RDEPENDS:${PN} +=3D "dbus-common"
=20
 FILES:${PN} +=3D "${nonarch_libdir}/systemd/catalog"
--=20
2.39.5


