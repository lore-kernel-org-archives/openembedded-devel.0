Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 639CBC25B76
	for <webhook@archiver.kernel.org>; Wed,  5 Jun 2024 06:31:05 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.8532.1717569058216866131
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 04 Jun 2024 23:30:58 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=68868b7461=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4554H35a019490
	for <openembedded-devel@lists.openembedded.org>; Tue, 4 Jun 2024 23:30:58 -0700
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2169.outbound.protection.outlook.com [104.47.55.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3yg35f3fqs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 04 Jun 2024 23:30:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ENMNx7Rk9PXyp9YU7N3XyPtzFuntaKrDw5mHjNyF0a5pVkJmSiId4G0EJrZwx9CwlVNoXf/jK+Lac8otegt34166xPJbDLgpoZf3SUw2fSRoZKBfTsctf9+o2Fxt5hN0eY1VgkTb9kNxrFO35W/wGXKrr6GquEB5zB9gFm97s7b3cnECOCwDooCPIZVR7a1fraYtsyU2G/Uo6+/b1n2QRPo1tqexEo3Eeln5UUxgXzSuscniJG5CVLcLYZ0dOMbnP8qaoFGGZM78Lv7uQyfAp7UTEFTDqrQYdsqdqmXe6tmqlLK2bEUBO6PEB2hELD032GP0RuB2JqpD5HZAbNdS2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nini1M8QbOLomkKR1aoglT7V5XimZTOv/b8pv9ijArk=;
 b=oP9aPGBmTpSkPlt/kGMnV4HMoF4N0VIVg58IB7yeWhHDl++NS7mng3VY+SuqApXVN5dLxxDA7lEv+iYpH9xZS1JRm4kBFbMXuUhVkQmFKPmKQT1gNDyHhgqGfIrxwfF4IUM9ivFpoJR0Ap1BOqNp2O/14renwr7Fu9VPxqhti8LEvgUD4uIgQMa2rvy1nTdqWJcANAqZICX2nJJKA1GzFQnx2dTVKBEvX0JM35RthabW7EMKiyTzegChPG0to6Vb+YUsAOvL2E/PP975HMd48NqLjbg/7CzQ6CVv+JiG8ANmYIFz4/XtjKLIJVqRWdkpF8rFNRmLqHbg7ZrRhJ0V9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by IA0PR11MB8379.namprd11.prod.outlook.com (2603:10b6:208:488::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.27; Wed, 5 Jun
 2024 06:30:24 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%4]) with mapi id 15.20.7633.021; Wed, 5 Jun 2024
 06:30:23 +0000
From: Qi.Chen@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][PATCH] xscreensaver: remove obsolete append_libtool_sysroot
Date: Tue,  4 Jun 2024 23:30:11 -0700
Message-ID: <20240605063011.1239354-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.45.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0056.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::31) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|IA0PR11MB8379:EE_
X-MS-Office365-Filtering-Correlation-Id: 0dc5cb2e-9fbd-4c0d-7bd3-08dc8528fada
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|366007|1800799015|52116005|376005|38350700005;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?fF2zbXEj0JVBpVvHpwHbudMARbDa8o/RJEkdKEbKvMLjifhNNikL7v4JxOE1?=
 =?us-ascii?Q?tcUl6gVx5OawlOtY3ZbGTTleZmCrLK5O5KX1LKM+pHoLbZBtf5usG2/JIl5g?=
 =?us-ascii?Q?9V+xaWowLmdzey2oGPfYZDtjjDlSpO2kmx1xZjgqvhEcNWbnusDgvl2GU0D5?=
 =?us-ascii?Q?He68YmhpPuQH5kF/wKiBwSf1wZPHzc4XNsP/prrqWJLdZfGfUMVgjm94KNzM?=
 =?us-ascii?Q?haCtTmjcdUgbRxE2eBIkBZYnna68THNFQR3mhGx0G1Gw5EUAXIP//r5mUP4c?=
 =?us-ascii?Q?+aKDX38sNMnQzpv6FVpGZNOX9Db8lKXMqjbb7w7veBIZMdo4ILOVA3NIIzCC?=
 =?us-ascii?Q?DqE3HSbYIIRXiLKTHAyx/+ZHTBg2bGTsjJUaSNOlTRt9Cykz+6Gc1tV6N68V?=
 =?us-ascii?Q?fJcPYYov89UFgL34r0fp0JOL9iAmbcOQUk8PzRu27p8VgVe6E/C84vXvyQPx?=
 =?us-ascii?Q?9hCIzEYtpEeSZY85CGJzhg+tkiTA+zht949fi/Vzuqx3x5kfKihHsRqDOviw?=
 =?us-ascii?Q?WldIowQlznJO18Z2fgz1r4ZKXQZfwDivQ0aIq3fv5TKPsTHo+mHtdKtJj2tF?=
 =?us-ascii?Q?rFBlj7llpaSShPYfsCZ6mPCuc9+44vvQvDF9bSmgGGwjGti8FLu0pg1E5KFK?=
 =?us-ascii?Q?alIwf/m4/TBai9XbrETMvcykwGe422deTHlcldl+G9ov0DkkTaFytHaXHvrU?=
 =?us-ascii?Q?PBXZGTJ9zV6IkBqdLL6/rjWxgSPSPsZ6uYSzmXb5mFL4rmDa/LOZr1jwKop0?=
 =?us-ascii?Q?OJMBdzAk+ta7UelujjI1iPweM4g2STVsGyIY6DZ5a9ft77ppwupVpfdVCw9g?=
 =?us-ascii?Q?2Dyt1LYnNBHik72AFEOlNj5qCveCC6r1EUZXJR+yaF3YN06lqkMv4GkT2HRD?=
 =?us-ascii?Q?nhSPb0IZg43t/ZHv3sTQR9mozESMx4NQ1hr1P3oncBap7xfR6NlOCbl426sD?=
 =?us-ascii?Q?PLdOCIbdZ8amJYAJHB8K7cIK+QOQT7inN8OTzYwNA5ZvNyeuv9sq4CrMhriN?=
 =?us-ascii?Q?0H5Xg1t5F+5XPoMzvtgGWxiAsjritLVvhqP3BHaHLxS2Y6J5I7c72cROBtpe?=
 =?us-ascii?Q?SSb7sQOlkdkNdCHrFk+GvkilFYxx00n2RTvKrnTOAjWxioA+SHeS3mCnMQqQ?=
 =?us-ascii?Q?NLZDpxSABHZjUIgIToqIWQluy9Xae0LVNxrFpQCaIiKF2tQR3kzSWUrxiLB2?=
 =?us-ascii?Q?6pJ9hF3BMZ8YxDx/ZxKJZEv8s+aiPOMdrAgiMNdA1dx4Q4VxgvH843cySAy9?=
 =?us-ascii?Q?j3nD0HFvvsbfX6dlPYIcAECbxWJcA6dE1v1xfJcdt4v9U6+8yesTCHIomU8O?=
 =?us-ascii?Q?F7d5CZwKgDlgszbiHGgIysUIJmmW8wvzzrlmXN7S3aruJDOQQq4YO8WzBsxE?=
 =?us-ascii?Q?BRUJLIA=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(52116005)(376005)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?M2D4TbMrJPrtyd3FB1OE45jozUYRRA0ydcfC84izxucF7chC8xqL9DI1sFum?=
 =?us-ascii?Q?lziR3p9rqXhswdcmQQwk7Z0qESwJl9Pk5ZkSi0RRna19HyvEQUI0O6lnyQFh?=
 =?us-ascii?Q?6Cs/W4IQjTq/6x4mFRcCwprYfP2bzIk5ORJKcrUY5vsXN6NeMJAJE5OQUxOM?=
 =?us-ascii?Q?hv6P6ynr5W0bf9HtlITMfZ0hFHzNP0o7s0/mGjWJiFG0R3pB1u6egtqHQBFz?=
 =?us-ascii?Q?1EaXepHzAHdZHOM0TFp+IoOVT4o2EiQ9kQtQjkUn7KxpquwU7uY71/ZznogY?=
 =?us-ascii?Q?eEi8uWesgU6O3GAi0IVnldmb6jLrV6TnYj0cwmFuUd6ZGS5j0Diro/9NbSRh?=
 =?us-ascii?Q?NHZl2bo4+DGXL1GpJHl2ltMFMRB1S+DT9Us/Bge7QBk1uk1U5tWc0HP/22uK?=
 =?us-ascii?Q?yVwAxc/P/pw3tb3B0t7cDfKtAO2uxhXUZVEB8it90Fi6XEpyict5NXd3ziod?=
 =?us-ascii?Q?cjMlwB7B8UUZj+MXtt3hlDIScJQkC9TMoUyjskJiA2DJGpdLvlGLnXhuDxpa?=
 =?us-ascii?Q?vBKh/TgP3cWR8B8dWuDzEr7E1CVeiUmDrpCCImTdmb9hETnfGxxSYa2LePkX?=
 =?us-ascii?Q?nT0vYf3lL8IGA6Zg+VkZJgnoBFblaFAwOE6lm6v7JLfr1ZsT8uOM2y/aN/tG?=
 =?us-ascii?Q?37yVaQ25xboSjeHSA/H4OOnYm0siC0ciNtzxsglZScgxDn3OXO9yvYgvPWyq?=
 =?us-ascii?Q?K7wfrArD7PPWWejL8+9VbOgHOYUKIty2vLS84TDJIEOwTZLq6l5F6EIKGNQk?=
 =?us-ascii?Q?g12czqI+DsQT8EtCbcdKcp25cKrnppW0wfVKHU2AcQ/++QllP5DtO6DZ2vE2?=
 =?us-ascii?Q?IqB9HS+JROdHnrJPfNwru+AQn0A0N/9OVCgGTEUYhSuDT6+CCHKFTxzP+SPa?=
 =?us-ascii?Q?Ksl60f8ZFeejHTRU4nD1Q/+fR6bEDAZOtd+XQsdDk9CUjdLBjhi5o3nfRm2y?=
 =?us-ascii?Q?Vsw3eCc4Cf1eyG7F3rwhLv+LAlA7xNz2lnhW+zQeN3IpAXDrz90wxGVwfO1k?=
 =?us-ascii?Q?1thCO0OjTOw5aPJeLipreilgivEqXj8uBeNx3dIaAuKBRO3rj/hzGK7mnIhs?=
 =?us-ascii?Q?VI9GVMW9/TiQcRxj1rIgiZi24hBxTkgVPbCM+d6qugAsx+a18EBkcgpWSQv7?=
 =?us-ascii?Q?2gGvWMtKzXr3wtclN9t9ut58/Yd1qs7myylg68PLJQwzyDDGiOKAqCurY+6I?=
 =?us-ascii?Q?ef1EPcbaLdocrn/UOrdgLQBS+uTIzUwiBlBbWC+m9IAAAFpd9Dq5gnMj5YmW?=
 =?us-ascii?Q?hpMHE9f9t6zOFvu9rx84ZalNRjpCEUyvVaSY7pcaOs5qh8d2+HsFittyI9db?=
 =?us-ascii?Q?joOxwFZF/HXLqXcSyDsxjWTnl5U0QVeqggr8Lrj44cLKf1jSsp+ahPEsboj1?=
 =?us-ascii?Q?b0ZPjxWj+fWiFFXrKQZnmldiFKZMaeEvJULbYM0tiezbgkt1bZioRskeduVP?=
 =?us-ascii?Q?Zkm22di1hbNkjTJwbiR9Tq7K81Cnd0xfKVM3Nl8hHZSib9lm4iE9jJeX3z/M?=
 =?us-ascii?Q?+HgwcbFlAqUuH/P+E8kcpwJ3TILeYHkVasKv7J+pPMYE9C5asxAdLvjGJd5v?=
 =?us-ascii?Q?Db+Dz3GxLWqQiXQgmBWtbsO4y+ziyEVdlWtfvRdC?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0dc5cb2e-9fbd-4c0d-7bd3-08dc8528fada
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2024 06:30:23.5613
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ofv6izeA06EVhyIGQ6fVtfnqIPkXDrBU4gpo57qt8EH4r7gFZFYSbhaRPToeK2ue9wpkFVihP0/QnDmsOPgFAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8379
X-Proofpoint-GUID: D-mi87AEJvniZktCBYsBtBT_gLbt1TVx
X-Proofpoint-ORIG-GUID: D-mi87AEJvniZktCBYsBtBT_gLbt1TVx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-04_11,2024-06-05_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=695 priorityscore=1501 adultscore=0 mlxscore=0 phishscore=0
 clxscore=1015 malwarescore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2405170001 definitions=main-2406050047
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 05 Jun 2024 06:31:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110694

From: Chen Qi <Qi.Chen@windriver.com>

Due to recent libtool change in oe-core, append_libtool_sysroot is
no longer defined. Remove reference to it to avoid bitbake parsing
error.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta-oe/recipes-graphics/xscreensaver/xscreensaver_6.04.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/xscreensaver/xscreensaver_6.04.bb b/meta-oe/recipes-graphics/xscreensaver/xscreensaver_6.04.bb
index c06c9e96b..d698efa5e 100644
--- a/meta-oe/recipes-graphics/xscreensaver/xscreensaver_6.04.bb
+++ b/meta-oe/recipes-graphics/xscreensaver/xscreensaver_6.04.bb
@@ -34,7 +34,7 @@ PACKAGECONFIG = "png ${@bb.utils.contains('DISTRO_FEATURES','systemd','systemd',
 PACKAGECONFIG[systemd] = "--with-systemd=yes,--with-systemd=no,systemd"
 PACKAGECONFIG[png] = "--with-png=yes,--with-png=no,libpng"
 
-CONFIGUREOPTS:remove = "--disable-silent-rules --disable-dependency-tracking ${@append_libtool_sysroot(d)}"
+CONFIGUREOPTS:remove = "--disable-silent-rules --disable-dependency-tracking"
 EXTRA_OECONF:remove = "--disable-static"
 
 do_install:append() {
-- 
2.45.1


