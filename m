Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3792C3601E
	for <webhook@archiver.kernel.org>; Fri,  4 Apr 2025 08:18:41 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.122])
 by mx.groups.io with SMTP id smtpd.web10.6510.1743754714572896958
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 04 Apr 2025 01:18:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=vP/QjAFm;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.130.122, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=da2SFwV19sE2PZq5LIx2Ge4BEaS0O+CU98ZSsG9pm+QjUABTbHSHVdiphljYljqakSDrCfhRlDWnXWejKjzuPdF9zHcPybNaDZKnm38ebsynEvK0ur+iAzDVox37ZevFtS/hKa9ANNa7T/5l60lnlTXL9A6J2ILghImIYgWJfub6mjXods8ox1zGHQXxfAbmNP8ZR+0FdkfC5xajboi47q3zLq/A6JhPwn9+7mGfD0Ty6dtXjBmho3qWUgZHbSPwH+sLoXNnd+er9gJr4JQg/OcOttC+ztTYoivL2/vIpHGh5UbdhnQSQmW2lnkOGbknGrr5nVCu3KQ2FTCE5Baw9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SAAsSKHiz8Gmj9dgHokZVz+9fpGzYjjCvc5Qrlu5sZE=;
 b=pcLe7+GmNBhdCxhZzlLkMsLiPawgOHOu8GrUjQpdz52N29ZLv84s/N+TxaCOCItAuv+KJyWZLFs+j+DXD7qHfjGNKenij3LGk5KRtc3HdmtCnSSDKedf71h1Ts7qVH2KUEE/3z+NaEksPGBK9tMF2e6PuPDecmahPc10v7Ou+pPRZpCa99LNJmSBlG0BNFlfuZlyJL9qTQRzjtdQFwBSpE291xDNeVNZWDs+rXO3NE9AKQNRYbqua3MjZBH3rTVtp8uvKCch6TTVheG/IdjdQ926Y/FN6wkZbUvTU2EFdV7NsgtjXl1rTC5a9SQPjRJHe2wX/tHKFwmvbVQeDx3FeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SAAsSKHiz8Gmj9dgHokZVz+9fpGzYjjCvc5Qrlu5sZE=;
 b=vP/QjAFmo5PpjFb54njsJ0XOtXWpNx10wA7bqIHthv2Wzx7gCTYINcm4amsQO4leASWmW5X89fUWs0m+p1bAZqLHwPFQgHBzW5gXctT3O4LDcODAaFyF4dxH69I02j49QJD4X4+bsuEqDV1OoDDNzMAEfyKty8LNxiV+mku9b7hQ6OeRi/owBEHsxcMT/kEnJxxGHZiDPmZ0AYVbEmoPPIiCxRmTYn42inWeyKI2NECOERHtcuPPdZZTaYwwjzJiqDeOdMluVzNF56r+CTQFVckdiElcN7YxqDeHxyJAtGkADol/xyLD/aAOtqzBYA+PU5cPVcQ+1wAABJAYmuOsKw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by PAXPR06MB7471.eurprd06.prod.outlook.com (2603:10a6:102:151::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.41; Fri, 4 Apr
 2025 08:18:31 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%3]) with mapi id 15.20.8534.048; Fri, 4 Apr 2025
 08:18:31 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-devel@lists.openembedded.org
CC: Niko Mauno <niko.mauno@vaisala.com>
Subject: [meta-oe][PATCH v2 5/9] sdbus-c++: Support using alternative runtime D-Bus
Date: Fri,  4 Apr 2025 08:18:01 +0000
Message-ID: <20250404081805.663425-5-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250404081805.663425-1-niko.mauno@vaisala.com>
References: <20250404081805.663425-1-niko.mauno@vaisala.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GVYP280CA0031.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:f9::9) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|PAXPR06MB7471:EE_
X-MS-Office365-Filtering-Correlation-Id: d31d071e-32a4-43d9-7458-08dd73514946
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?u5G7HHybjYAoLCkvzYICDPMpQk5hi7vPONiTnWL3sZ63mKzfoDL/G5sLAVX1?=
 =?us-ascii?Q?xMmPTtLq/SjDKeDV6a9VWnac4iRdTTfjZL1bfjV09lUKpqENkQl9xt3EnE5v?=
 =?us-ascii?Q?ps1s5PqvQfCemP70Ay7L2mSLIRsaEJQDa5/G58OVAdaVmfrS7SOzfYLOwJWY?=
 =?us-ascii?Q?BaRgEQIVJfxnXb/KQFhyIJ4mC+Qw3vfh7RJDB5eHk74MStYX8IAcAWqe19YZ?=
 =?us-ascii?Q?bJ6X4F55XzLyZky95r2VMxH8xu6NR1hUS+plyFC2bVNTkzXDVD97rVDylAtx?=
 =?us-ascii?Q?T3PjH4ijgxrw/R3zAyngpHQbYKpYtBwZoMCwGZ/o8sGdfGl3BGENPXHyTlio?=
 =?us-ascii?Q?Av60rIziyAHvlAsVb6Q67mU0MmA/jBhhBqd+3yjRtZxkeV4YE9p+ll+WDrtB?=
 =?us-ascii?Q?6pAuTggv2UZ67pA7FFG2+Z7A1lvGNn3pXuWnEtc1mCKUbSCJVgNdo1FWJv6y?=
 =?us-ascii?Q?RuIE3vMM8M9istP2IaAapp4g6XfJ8a5SKB+msjs7Z7hAKkNeADciuTqg6EyR?=
 =?us-ascii?Q?6TtCGmOKxkQCzeNbPCCbm3yEtUnAt6cQ+eVR5V9tsr587+EG7axMKD5tAzAD?=
 =?us-ascii?Q?Wy4FbMorazEoK/3akxx5T+yHd5eeEN4KJrhbQq4TXOFE9ut3ZObHqxbBOeJV?=
 =?us-ascii?Q?xXe89HAQ/eAa8zsglzHkyxW1boYyB9zEw0gUBC67wZfOLzrVd2FP3hLzFs5d?=
 =?us-ascii?Q?7p9WYvV6dIbiSPLnlOh4Rxy6cacHEK28UnTdars18gX7u+sNFcsTESlTIMSB?=
 =?us-ascii?Q?2X/+jvphFMmh7r+NaMnhQjUrpniTK4iEc+N3IuKAP+C5TyTaC9J1v56HoMkz?=
 =?us-ascii?Q?PQULn61pRBnfDmJsZ9m9kMR9lHNs+LTVKy/dbtd6bBwm2BtxKEidbkQ5A7MA?=
 =?us-ascii?Q?sLy8KIeth+uvndAP1FHEbdMKxB2MurxtflsQeYAdoJtWGUrYdAcjmGZeqnqW?=
 =?us-ascii?Q?TPrrh60kHXMQbjFewQfbHn3lb4St6UT01GoBZSeZWjCU3AnIgT55U6PSpNVn?=
 =?us-ascii?Q?fa8GhCABLUpFxYtTYQotROzinGX2QYLnUfmRzgR5286jNuvblG0TJ3TtSVd/?=
 =?us-ascii?Q?e1H3zH2SRg2FzB7V/bW1YJrPUN4Y6+Rug6FSluol3gxsu6FxqhYSfw8xGdyp?=
 =?us-ascii?Q?dhFKHMKGwoK0c+d/VzNIQ80sP1c5CH1JdGQgVglCNc61kaQkVfw+ctBKpWaK?=
 =?us-ascii?Q?Jr53e/sav2oO0MHKjJYgC1KAjwDKulq9VC/6KiBD9YoriFfrswYoZE5Py9wg?=
 =?us-ascii?Q?zUKyYaC1S15rPXsub0J5kw1U7++qegCfk6u1Iv0qK529/8YGnL9s7Xx71Frm?=
 =?us-ascii?Q?rsiskWnCNzOMOFWMAsfjmhtQWRyQNll5Lh+yk5htbAjfk6im6wpr5ZZEG4RF?=
 =?us-ascii?Q?/BYjSs1YegqnNIvkH4CnhLLNE4PVOdb+IPIs2nq3L97lIs+bk0mcQF1F9Fdj?=
 =?us-ascii?Q?7g3MYnrqhAg+t4PWxkuMusn+K01QC2jMLD2n2qYigDKNw7LEta7jWQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?pL1UvyqnHKGKShoL2kH9hjWsK9hHwADKx8l9xQKzOwK0pbAAEYkH/0Ayq/h3?=
 =?us-ascii?Q?l5TpyST5Y2Ro1LlYFqgPLz2WSGyQqF8qHyeyeDM+w3+b29rjqapduuoWDVzQ?=
 =?us-ascii?Q?EJQCHwhIyZPCQBgbY2C/Aq7+meHLD4kytWLs8Y7RivYfN6rpb7g4ssKthjzn?=
 =?us-ascii?Q?gfQAWu7xCsDZh+qJhSexZbaI3K+KfkNwjDGgnmSpJt0uNrNG73/BxJLNi28B?=
 =?us-ascii?Q?XhaKnC2yQI9acUvyvwEbWooY16FOqvm+K4Io1AloGDW+UhP441F+vpxOj2hX?=
 =?us-ascii?Q?5L1qWL6d9P0Du+S8QmvR+eVQiFrGdHwj7+jXYQorEDGg7vFmwoRLNfx7vxUE?=
 =?us-ascii?Q?Pn0KtBEjtzouhgruxDsf3kSoPIJQ7Wc6i2cmIpddd767OROT/4iGjyzKRa1y?=
 =?us-ascii?Q?IPh4RwMJ6UUsnA8z5/8X8UcfOboOT1JxcP3ZBo3FiMbRpUUQ79/g90nllRHM?=
 =?us-ascii?Q?O/k20OVMVmNPXtv68m3yk5YjGvgtWAmYUaCc0i5EzAQNWKWkYlrnqKB14EFf?=
 =?us-ascii?Q?EP/Y/MkFGN3TAneh6j1xzgn/HhAnmM41pZvqYK6w+UbAQKQRLaZa+8BTp0Vn?=
 =?us-ascii?Q?SfOHN0/1HMmRwDodMTmNc1yzIEdvbAaeB5a+78kKPkp3hzeWF2CbDTR/zB2d?=
 =?us-ascii?Q?y34IoCWGIK1ZXukUKXVdH1Exo9vU4MyYZxcUT+wrpu6mx85cLVteBecxXaCZ?=
 =?us-ascii?Q?RgT60xtIaxvIisO8oaiAKwgQ7lMEe8QUA6ReA3droXQN2ulp6UoGiEweqdi/?=
 =?us-ascii?Q?A6Jng50zlpcUmki1Zbmw2u+j7Lg/cAoh3tjdM4rb3bC4F2ncgOQ6Q7UD5E+R?=
 =?us-ascii?Q?n8q1+SuoIarwnlqfv1SjdXkwtXjo5V8lDi1d9WKiheKN05/2ZHTlw1N/IooW?=
 =?us-ascii?Q?AdKWqVNrD9RbxTgvRmdlrH55VoLEQp9znJz31dM/S/T3aYNhdns3xNLp2uZn?=
 =?us-ascii?Q?e3aRnXek3sWRxAHYrVjziPE1fgWfMsSPAv9xl97H6xH0sMopMmxaOBGuY/mZ?=
 =?us-ascii?Q?N4FFa6/81Cf7Tk5c6mxzpsd3ugIghVRHRoE11pb/XB6hautjylzxP8988ExI?=
 =?us-ascii?Q?2QLZf+/658SvG57GCxhXb7xrnbx67QX64pRhyWaRUM8Csp+DdDGBAmW6c1m7?=
 =?us-ascii?Q?pKAA7QicrxAPSFS0wFFgHhEIWVxzPMc5cQ7mYMoH1fCLZN2eYm6aR1+mkND9?=
 =?us-ascii?Q?WAZcZNFaN1uy6N67dMazjFYE4Rc9lCz/Uo5kKZblIP+gz5qJID1mmazcbSJc?=
 =?us-ascii?Q?dTMBCtPGkd9GzzpYpEOAiT39kPZ/nH1RtZhOmx4hWkDL5sQas1S07BwESms/?=
 =?us-ascii?Q?/gUy3H/snzPt1dNk7Gq1ZuwQWkSTct7yLXkpxQvXgiVsYpljC4hixtp35a8m?=
 =?us-ascii?Q?jw5BeYf1wFKM4QbAb8q4KHe8B59PdLbt0oIbbssnOtGurwlv9BXRSn6Wcdvy?=
 =?us-ascii?Q?68LSr15jhZObUITIelVQ683CUERYECjlg+8P27Ht3Aizm3qcAmQWPqRO7se6?=
 =?us-ascii?Q?p5ZRbfud5AQpJ5Z6zetgdOnTGOMJ2DtJVMGUcXoJBlD8czsh6N2NfJ5Qk+c0?=
 =?us-ascii?Q?KPDVa5qb3t41oBqDXeUULA91Y8a9qQE9AIH+Wad91cCHprx9WWuGfF1tIgr/?=
 =?us-ascii?Q?Ug=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d31d071e-32a4-43d9-7458-08dd73514946
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2025 08:18:31.6909
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2tXn1ivmOx5z7yIax2qboFFfDcNZQH1nGG6EPGj6CINPJ6BnNO22lR0GCg75SMdZY6khrCuE+RxGLW/1IVn9Cg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR06MB7471
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 04 Apr 2025 08:18:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116565

In order to facilitate using e.g. dbus-broker as runtime D-Bus
implementation, change the Freedesktop.org specific D-Bus runtime
dependency declaration to honor oe-core's new VIRTUAL-RUNTIME_dbus
variable.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 meta-oe/recipes-core/sdbus-c++/sdbus-c++_2.0.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-core/sdbus-c++/sdbus-c++_2.0.0.bb b/meta-oe/re=
cipes-core/sdbus-c++/sdbus-c++_2.0.0.bb
index 2b6bb1011a..a3e7c9ab54 100644
--- a/meta-oe/recipes-core/sdbus-c++/sdbus-c++_2.0.0.bb
+++ b/meta-oe/recipes-core/sdbus-c++/sdbus-c++_2.0.0.bb
@@ -46,6 +46,6 @@ do_install_ptest() {
 FILES:${PN}-ptest =3D+ "${sysconfdir}/dbus-1/system.d/"
 FILES:${PN}-dev +=3D "${bindir}/sdbus-c++-xml2cpp"
=20
-RDEPENDS:${PN}-ptest +=3D "dbus"
+RDEPENDS:${PN}-ptest +=3D "${VIRTUAL-RUNTIME_dbus}"
 # It adds -isystem which is spurious, no idea where it gets it from
 CCACHE_DISABLE =3D "1"
--=20
2.39.5


