Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82367C5321E
	for <webhook@archiver.kernel.org>; Mon, 26 Aug 2024 09:25:40 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.61])
 by mx.groups.io with SMTP id smtpd.web11.48645.1724664329434157468
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Aug 2024 02:25:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=QT6FQxzr;
 spf=pass (domain: siemens.com, ip: 40.107.247.61, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iVlx6raxBn2ekUQQ4LTFUv5CpFrkRDPkQw5VfmCn+1+2BUIeYbn6e3TOWZ1s1/Ou2N+SlmMVvNtnNTTew15UrsN33vjQE+lCYrRxAk5IX0b/2/Shm7PyvqcysWeFlNUgfG3KkAWxxQRcNRb9jpZOOOT+E9/Rm5uCcBmd2HoZHyRZej3OiLuNGXARlyUgVZcGsI+Tx0t4hDtGFRJ84+7G2Ggo0DG56vRdbeYtRzYZnrshx2D/SQ//1g7wtH7vK8ewtOVwkO+ZeaPB8awfD/QFQLvC/LYUjqMDUL3ezNlvzA4e+CG5huFe2mtyGzqwhN7uQGb06ydu6sycfAYG3OEmqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G2j/mdBfusG0qKJh5Bzq8R3xtDs3xVXA5fCT8g0r4aI=;
 b=yyo1cJ8QC7740BXs1YqwSdIiM6KBZUlS21Wpo7zqwxvoLqdMMAnpNNTQSt0GT8DbhHoTvwaoNyW1fwDkohDijy98CD8b8uuQChbZOwChWYrCJTGWv/Spxtd0Vtc3QKgfrsbECjQRlH8NShQlEGdwexkXU3QWtRr3htcXdLHRq3AQc7kF2TsybZXNwMhRuvOfWE7eprXEWaStZRDEbmnWx8/PmplhFg6MX2ZgAHIQodPLFN7AB3LvNq2rvtLe+e67M+QOvi/FuruMrY5OXghOUIX+dSN+qMMbYxLu2IAWqHHKkB1HiZK9ye4FrUUXjWAQ2NAt5FfFDjWtqM5poUpzzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G2j/mdBfusG0qKJh5Bzq8R3xtDs3xVXA5fCT8g0r4aI=;
 b=QT6FQxzrxDG36XGPYDKq5uid8h8ocV4PTEkvOVi5ESDRqC3iEzEzBIuSYJIfzxwtPriKNtAXxds+b4LvEP1BgZZwwPqsP8fZnjyHkqkreuE4jOrklR2fxeZKf0IqkiwWeZpu7GAChjBhrBzkHT/7ck+qRvOTLUKtS6zDanjGWSrvM8rAdYPRKZSMmb24eldOP9JuwAFqCiVB1ZSo9HdAXwhgV4ZdqyZsLAEIgiy16+6RQSkgvFY/HgS7lbda3+n86oKVyiObQXJdLa86DGSsUoWsTdl/595dj2wJGkc5xiYW/5XzJhE8kIddrAQYAYUt/uK++6/OryOcoaPFmyOqIQ==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by DB9PR10MB5977.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:39c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.24; Mon, 26 Aug
 2024 09:25:24 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%6]) with mapi id 15.20.7897.021; Mon, 26 Aug 2024
 09:25:23 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>, Armin Kuster
	<akuster808@gmail.com>
Subject: RE: [meta-oe][kirkstone][scarthgap][PATCH] libndp: Patch
 CVE-2024-5564
Thread-Topic: [meta-oe][kirkstone][scarthgap][PATCH] libndp: Patch
 CVE-2024-5564
Thread-Index: AQHa7zkjFQX3WNhJ20yEVXk7293Sp7I5VJeA
Date: Mon, 26 Aug 2024 09:25:23 +0000
Message-ID: 
 <AS1PR10MB56974283132211A6A50B51BFFD8B2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20240815173155.19658-1-peter.marko@siemens.com>
In-Reply-To: <20240815173155.19658-1-peter.marko@siemens.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=16902ff8-6d59-47d9-8135-6906e68b2b03;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2024-08-26T09:22:48Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|DB9PR10MB5977:EE_
x-ms-office365-filtering-correlation-id: 06d66528-bcb3-4c1f-fa31-08dcc5b10382
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?Z+7RKJo1la6Bq4IkPSTyAIlL5f8eb+i+Nz2A0enBER70eOm+iQ+8vkDvOKRi?=
 =?us-ascii?Q?8t8KAzMw4UiG+JI8BWUDn74fX2gpbtAkFxDbQIo9cjlyEKkdiu8ZuRjtUquP?=
 =?us-ascii?Q?rg+Y5bR3FPLJNZAsu0MRbOJdQU6Y3TkICakWeMjmEaN4lEjYzfximH6YLff0?=
 =?us-ascii?Q?qz8yx5N7WjFYtDghHfC53B9E8fCCFPohGfdHz1CgZ9auohsTb5pTvoEP6MKU?=
 =?us-ascii?Q?WMLiEl3MxguHlzUe07iE077mieSPY7IAgYrRraW2dCfpCtfqGuyTfa9Hwy23?=
 =?us-ascii?Q?1HeavVO0dJhnRSOEM8UqcKksa7MJZx/5egnwiFEXys+w0olRa1Ue/tA/1MZ8?=
 =?us-ascii?Q?Cs7Ctxu6PM6FBKw8kxoxFt+0lsRadQCMIymwkTBa1DoSuXZArJXSG85CTMzR?=
 =?us-ascii?Q?IG47wUjsjjq9H/ziYk12G/sIheCgY8ZmRC1wOKX9QO70ub12xbgACpg2WnMM?=
 =?us-ascii?Q?+webBURTmWRS/DlAnmmoXvWjCd4sEWOBbGhcWigIKIfyDOSneacF70SuPGb0?=
 =?us-ascii?Q?oHcuTOQc9GRg40BzdOYPefB70s6VQ5iEs6J4F1aGKp1W8JX3YEqednpks9J4?=
 =?us-ascii?Q?SD24hRnXGqdyS6s7/HVzdkVX9OgY06Nbq9rpTN76e+ieNY6I32C9ntutSmdL?=
 =?us-ascii?Q?ZKDxVbgA2EErR8xRInUfbyPOltjlGv6QNkWNM6OWjo28h2MBalBA6STELN1+?=
 =?us-ascii?Q?iFYN0yFppdf42oHyoVHpSZWPQo1vsxkO+R+UAXwonIW+uUH38isRBS3rpyEG?=
 =?us-ascii?Q?cVvdNNu0qV2aoGNkRO6ugRoxqvTSLbH4XuFlUZAx5SFfcO/W3Vk3vfpRBFxg?=
 =?us-ascii?Q?4O72P+oOdb120S0ztZXTBrccpA8IlmFtUVWRpGGLO5DQ6TXkPmvZGe5ICCQq?=
 =?us-ascii?Q?URQ99SU+q0CJ32gcJGDV5vjAALk1A9AdXKb/vqQVm1uHV66CzkvXgkD9v9fb?=
 =?us-ascii?Q?M8CiDdiNKdGaByICynP/8tnxEcde1NwNUtgdLT6Si9QO3NjU9OPlAvEcOsCs?=
 =?us-ascii?Q?RZPpgs3T0rz/a1VTzaLD1pKCWctqRSyeYHHGmtugJIDajNgbJ1+iizNW1HOl?=
 =?us-ascii?Q?qE8QM0+ufRxm6xs8GJjSsJvI7rDvBIspPVzIiLQNBMY5uJB7rUgqF/YABHj7?=
 =?us-ascii?Q?EMuRoORW4NdhekjXiyKXMZH/P3p6kUfEtPwt6VH9p3U8CyU4Us+jeC4Yi2zr?=
 =?us-ascii?Q?6TU/KhZEFNY5T7nsC5L1NMNkBSOv0ptj86E9k6jgAqKbIMJ5aQtz7vRfgUcx?=
 =?us-ascii?Q?0R2tAM94iJIqN7MX1sfyGOZbyBstxEa5QcP75gnab8vmzDDSs8FMhMOiFGs4?=
 =?us-ascii?Q?g77CrjqwwQNGhlzz12K4rIlD8Cj7KMDWd3r1HeGLVEIsQR/LFzOJfNUVGnwW?=
 =?us-ascii?Q?dhS84Ko=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?XoDjS4vGucg3aA1cozgwg82XY6uCnJDyHb6iJncGl5Q+XnR3uSQg5Gw9pVRC?=
 =?us-ascii?Q?GA5NJd+zxMHD3ZTBrb+4AVw+wxDvKE+1C0/0Yt4f309FCuP49caAnRfKL+2y?=
 =?us-ascii?Q?aHDTaCHTbVhvnVaJoneNRF/eFhZHnqS7hZLFm2TYMqBHNeEKn3xJP8yb0VzT?=
 =?us-ascii?Q?WPpXzKDSLPmYLaDzpxKrFk41KOBCOww6mkVKSxfW6NtrXwNkzaOGBkhegnwQ?=
 =?us-ascii?Q?NxU0n4YSVJkqqBSRQSSq93/nKibRcKkXSlGqWmyhh52H8YNJhXpEntbIGwdl?=
 =?us-ascii?Q?xhFArPGTLlfj/ZBsF8DW2U3gVtwW1CtUmBV5dyYW7zkh1F8PzOWFTZpSVx3g?=
 =?us-ascii?Q?9bcjMSdU8iZiB9BxCJv0TcbQU+DQs8AVaN3qoP97Nc6fCaB/57vHTxrCpfkh?=
 =?us-ascii?Q?vdfAuNlnfMKV53dpP0ZlGaCyAjT/O0V5RWSrCIFT54ewulRXQ0kNIV33YKNM?=
 =?us-ascii?Q?SFq0MwR9Ei3/dSo0tG1llCrrhffGOGMgWVbUFREPzUmMfQGBcXTAU6q/RC4I?=
 =?us-ascii?Q?s/l4uPtvFjNpoMX/y2CmDMmLpWuvm+q4OpGpt4wBTMd75vPW3zVNX3SiQpKG?=
 =?us-ascii?Q?Ozm8KanLA3Jc3xcfjIiZ5SCydbp+t0zs+c4DVGgQFI/VMepBVgte7VASJoXe?=
 =?us-ascii?Q?ACvadH3QdXJwES7Z7/SFC2QN1Zm1Ujj/SiAl1KGRPvjtzeCTffPLxiIRvNpx?=
 =?us-ascii?Q?rO9J+Nzh/Ac9vOpOWxKw79AQu5XARSPzFkxlCioanLogRlj9OXL97A+54iRp?=
 =?us-ascii?Q?ZOQmh5R9kDeqDUr7zedkogmnc2GTKI5Z03VE9bNVBqyGMPRPQ9PkZi/L/Y5m?=
 =?us-ascii?Q?IO3yybgV1IWPXOpwvsJ945sDoxIYnDLeLfSKL00KHgtjpsqXLetS3DuGGq3f?=
 =?us-ascii?Q?r6HyaXNgfWo42snQFtMO/7Fz1Ggq3onONRMyoLQlC/yZg82EGSSZffo+W6Un?=
 =?us-ascii?Q?TreCP7iIVF++LiwQxODA36XNofhKVvwoB9kXJ98nDNoWOvuurxPNkR8iY2Yj?=
 =?us-ascii?Q?m7F9beveun6AJQ+LS6gMFhDxptzLdudcOZmlQ01kNBBKJVB34r6pX/ybdsmY?=
 =?us-ascii?Q?Iz/ACUBNxsWpzBXSwFO38FRHwCTzNCTxVUDrphjzJFDko2kEHkAxvW7Ga9Rk?=
 =?us-ascii?Q?VndbPGv8n+Kof3yLuTWZHnIiSoQqVuu/3ZHQmuVreIV5Wp2z1WM4O5ycr6bY?=
 =?us-ascii?Q?bSWC7YzPEiJo8PG022/0cO7cppnwoEWA0ef0UcyvCzwPip7mPr69NFQpP7z6?=
 =?us-ascii?Q?kRhQEOqDI3NpukiwItkPOLB3gQbhUBnjEutcz0/awuiaV1RY0fy1DoIBz7dW?=
 =?us-ascii?Q?NYDmoljFfJSzr+6NiAgdkfwgKXNURveZx4ZaRdgxq4y8UKlr9Xd/eMQDNncP?=
 =?us-ascii?Q?rlAcuNsQbx2bDEuPqyhgKd1klwL6Afqbg7D/h5YEBGC27BXph3eXmjhQam+v?=
 =?us-ascii?Q?QhrxV+x/TR3KQGc4o2eYgy1zL0q8uXVz0YLQ5KKz8Pi4fmS8XBOdhoTnKv1l?=
 =?us-ascii?Q?BxPyd4v54MvR16Zth2etUxz8yvrbBz5Qt16Tl5mmb2GaHF1OdJZ87+K0NgLx?=
 =?us-ascii?Q?TebGuRRcKWPtBc4LusQmZ8RVjPRuJXXltyKEaTgX?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 06d66528-bcb3-4c1f-fa31-08dcc5b10382
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2024 09:25:23.8410
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3iCxaVn6vW6svfttLBX0eiD0Gq8HhCkUrwV0LiaAxbet4D7MVGd6Vl3yXCBtFP8ULpviy16q2CDlGOajv015FA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB5977
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 26 Aug 2024 09:25:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111941

Gentle ping for kirkstone branch which took new updates today after a month=
 and this was missed

-----Original Message-----
From: Marko, Peter (ADV D EU SK BFS1) <Peter.Marko@siemens.com>=20
Sent: Thursday, August 15, 2024 19:32
To: openembedded-devel@lists.openembedded.org
Cc: Marko, Peter (ADV D EU SK BFS1) <Peter.Marko@siemens.com>
Subject: [meta-oe][kirkstone][scarthgap][PATCH] libndp: Patch CVE-2024-5564

From: Peter Marko <peter.marko@siemens.com>

Pick https://github.com/jpirko/libndp/commit/05e4ba7b0d126eea4c04387dcf4059=
6059ee24af.patch

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../libndp/libndp/CVE-2024-5564.patch         | 48 +++++++++++++++++++
 .../recipes-connectivity/libndp/libndp_1.8.bb |  1 +
 2 files changed, 49 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/libndp/libndp/CVE-2024-556=
4.patch

diff --git a/meta-oe/recipes-connectivity/libndp/libndp/CVE-2024-5564.patch=
 b/meta-oe/recipes-connectivity/libndp/libndp/CVE-2024-5564.patch
new file mode 100644
index 0000000000..fe7ce41b87
--- /dev/null
+++ b/meta-oe/recipes-connectivity/libndp/libndp/CVE-2024-5564.patch
@@ -0,0 +1,48 @@
+From 05e4ba7b0d126eea4c04387dcf40596059ee24af Mon Sep 17 00:00:00 2001
+From: Hangbin Liu <liuhangbin@gmail.com>
+Date: Wed, 5 Jun 2024 11:57:43 +0800
+Subject: [PATCH] libndp: valid route information option length
+
+RFC 4191 specifies that the Route Information Option Length should be 1, 2=
,
+or 3, depending on the Prefix Length. A malicious node could potentially
+trigger a buffer overflow and crash the tool by sending an IPv6 router
+advertisement message containing the "Route Information" option with a
+"Length" field larger than 3.
+
+To address this, add a check on the length field.
+
+Fixes: 8296a5bf0755 ("add support for Route Information Option (rfc4191)")
+Reported-by: Evgeny Vereshchagin <evverx@gmail.com>
+Suggested-by: Felix Maurer <fmaurer@redhat.com>
+Signed-off-by: Hangbin Liu <liuhangbin@gmail.com>
+Signed-off-by: Jiri Pirko <jiri@nvidia.com>
+
+CVE: CVE-2024-5564
+Upstream-Status: Backport [https://github.com/jpirko/libndp/commit/05e4ba7=
b0d126eea4c04387dcf40596059ee24af]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ libndp/libndp.c | 11 +++++++++++
+ 1 file changed, 11 insertions(+)
+
+diff --git a/libndp/libndp.c b/libndp/libndp.c
+index 6314717..72ec92e 100644
+--- a/libndp/libndp.c
++++ b/libndp/libndp.c
+@@ -1231,6 +1231,17 @@ static bool ndp_msg_opt_route_check_valid(void *opt=
_data)
+ 	 */
+ 	if (((ri->nd_opt_ri_prf_reserved >> 3) & 3) =3D=3D 2)
+ 		return false;
++
++	/* The Length field is 1, 2, or 3 depending on the Prefix Length.
++	 * If Prefix Length is greater than 64, then Length must be 3.
++	 * If Prefix Length is greater than 0, then Length must be 2 or 3.
++	 * If Prefix Length is zero, then Length must be 1, 2, or 3.
++	 */
++	if (ri->nd_opt_ri_len > 3 ||
++	    (ri->nd_opt_ri_prefix_len > 64 && ri->nd_opt_ri_len !=3D 3) ||
++	    (ri->nd_opt_ri_prefix_len > 0 && ri->nd_opt_ri_len =3D=3D 1))
++		return false;
++
+ 	return true;
+ }
+=20
diff --git a/meta-oe/recipes-connectivity/libndp/libndp_1.8.bb b/meta-oe/re=
cipes-connectivity/libndp/libndp_1.8.bb
index 4d4d3e51cd..70d6abec1b 100644
--- a/meta-oe/recipes-connectivity/libndp/libndp_1.8.bb
+++ b/meta-oe/recipes-connectivity/libndp/libndp_1.8.bb
@@ -4,6 +4,7 @@ LICENSE =3D "LGPL-2.1-only"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4fbd65380cdd255951079008b364516=
c"
=20
 SRC_URI =3D "git://github.com/jpirko/libndp;branch=3Dmaster;protocol=3Dhtt=
ps \
+           file://CVE-2024-5564.patch \
            "
 # tag for v1.8
 SRCREV =3D "009ce9cd9b950ffa1f4f94c9436027b936850d0c"
--=20
2.30.2


