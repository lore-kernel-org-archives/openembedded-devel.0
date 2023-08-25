Return-Path: <emkan@prevas.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44BF2C71134
	for <webhook@archiver.kernel.org>; Fri, 25 Aug 2023 08:50:04 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.139])
 by mx.groups.io with SMTP id smtpd.web10.9320.1692953401511744747
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Aug 2023 01:50:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@prevas.dk header.s=selector1 header.b=G+jZxTOK;
 spf=pass (domain: prevas.dk, ip: 40.107.247.139, mailfrom: emil.andersen@prevas.dk)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SmrxNp85TlQQB9QU/EezWq5f/eJqnj2VwRJMzAz3FpbqU7Y83ZRH/LDPVZZI1EVE4+SPrMf8Wfz5OLZHlCHsQBpBkWe/syOBxi2yjvQN5IwutNwU0YGt/Ly5S8HYcwrga+k3DG2Kllc11n4GK4AnqKlrYtREAbDm52fmBJtlJpnl1XyoY6pbvIY8GdLh16PncuRkmRorFsoIW7YC7sTbosXDiCjF64N2iFzFn74vte9fzh9R+hH3OQjVYrfQcohuzvzOND2GxcASMNOi9Tw/HLDbewocfqNYebJu18RTlP/FyTIuibsBDGeOGRrmsQqHLbUD1NTcLZ7PbzUwx0y3PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SkOROkWsyXKtxuSkyuHBcQfzjRwGgaVYNh8a4oiRqRA=;
 b=ZeL+rs2/d2dV8xXiQP714aIseQDh1bc/bckcd0T3PImkLeTQyAeIX4uJ+FxencnK0qCv3zAleyn/h7biE41bq7P7AvsBXyyZZValSaDvxjpjBFR+6UN+28muBTaXx3LxDT57DjS1dXcOSmwcBacCf0mTiVMA58nNmhBppkIsYVFUSKGqx8jFrki90DmAKEdiuj3ueR/W4VP6iMr8v+4V2Y9BCVUOd4EfAvmr8/v3vJSAxQ3H2Gcc6ijppoBuF0uZ4CsJcaevMTGbVkJL2e89+jSSpa9IiGosRxH8pghy/aSaZjZvVjWnq0J5b8yZkJmtySfwjcOJF/kjuahaK1auAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SkOROkWsyXKtxuSkyuHBcQfzjRwGgaVYNh8a4oiRqRA=;
 b=G+jZxTOKaKS2FiOlxcfkaPW2sn7ixevhIJGD7/nZ+F8j1lQNzzskRfsqZMJR2XBGmuj1xNysaBfIyE1gRlAj0pK6jFWytIRBi7ETu32zqVdYwRnYb1VyOXFjHIpkVqW+zeSmXEC8GM53oUxqJAElPWFTK5HkhDpNMFxHGZFBdOM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=prevas.dk;
Received: from PA4PR10MB4576.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:10a::24)
 by DB9PR10MB8286.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:4c6::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.27; Fri, 25 Aug
 2023 08:50:01 +0000
Received: from PA4PR10MB4576.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6def:6be3:e407:5126]) by PA4PR10MB4576.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6def:6be3:e407:5126%7]) with mapi id 15.20.6699.027; Fri, 25 Aug 2023
 08:50:01 +0000
From: Emil Kronborg Andersen <emkan@prevas.dk>
To: openembedded-devel@lists.openembedded.org
CC: Emil Kronborg Andersen <emkan@prevas.dk>
Subject: [meta-oe][PATCH 2/3] lcms: add CVE_PRODUCT
Date: Fri, 25 Aug 2023 10:49:48 +0200
Message-ID: <20230825084949.18322-3-emkan@prevas.dk>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230825084949.18322-1-emkan@prevas.dk>
References: <20230825084949.18322-1-emkan@prevas.dk>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: MM0P280CA0078.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:8::13) To PA4PR10MB4576.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:10a::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR10MB4576:EE_|DB9PR10MB8286:EE_
X-MS-Office365-Filtering-Correlation-Id: d511ffba-eb74-47cd-8a67-08dba54844bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	27x4aSJ8O9OR3qyeZeYA569u4i0hN41X5FlzDW6UtlkucSBTTf8wR3pnQ59VUodLYKywA9DSvS/q8wUXL/HmNbLBPVLcr241Bku+b4E36/skhuCV8GjejClkM6Blbv//0NkBLQSwItIA2DzsU3KY+/rR3suXX4BN8hPLUKHLY5qu0py9UcwChook+Pr6vB3isQ8PQJK3cnYZjUhJoJb9it3eA6x20KWuj+6JuEI/MMxWoebh4Xwej5MRlBaKLAHg6R/IpJ+CcttnZrT5ta5dGt97Cz0Z2EKyZFNoNoE9cm/rLKYRxn/gUvZqammRKbZwvkOX5ObVaqvgdsRvUOGoNuWCoNdtJ3Kniqj2G7LtZ+Lt8+wv2/yaEdpJ46NpzJw+koodcMTJyI7q9H0LE0TeQV4yRxZn2rO+uDoBewQMqYGKzJ+efeFZVVvLlpBNY0gKthflextaC5AXPDpMaNf6w10Cjs5Ecj8yccRaqxqOoX+81NSGtDG+nC5BUITTKNHcTNnwYtWemNiF5qY4tdybESb8YHaqWBXxhPSbIdWcNEue63N/dxl1P8UWczCVZmGlQ82LBK5Utp16QUBmaHE6DfEMyHo/kwRCccia9+7sSJ2xCeut7phypRNDrfxW3kB5
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR10MB4576.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(376002)(346002)(39850400004)(396003)(136003)(366004)(1800799009)(186009)(451199024)(1076003)(2616005)(5660300002)(107886003)(8976002)(4326008)(8676002)(8936002)(36756003)(4744005)(26005)(38350700002)(38100700002)(6666004)(6916009)(66556008)(66946007)(66476007)(6506007)(316002)(478600001)(6512007)(41300700001)(52116002)(2906002)(6486002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ebtRnqa+KD931pARcFJPao6lPrh3wfdFY+0Sz04Pq93tskszh+dV+QuUg+AO?=
 =?us-ascii?Q?ek5msjYetW4dHjCpEOfxoM3TewIZx3LWb3EwpLIEOokDOVXRQj8DnnDl+Eqg?=
 =?us-ascii?Q?Sf2R0QhQYIPrZpO6lqxdjsHWn6qBR5h6BpaGaJdcb73ch341cJPrQ2TF241e?=
 =?us-ascii?Q?6Y1TX9p+CvsLP3uKlOGTr2zJkMVOtQDQXR4hTDgcQF4NBuvea5rXxbqF3B+U?=
 =?us-ascii?Q?vOZi3XLZ/DS2U8ur//e138VhUWovegIyvCXs+pe1CX84a2sq883nYklsrymt?=
 =?us-ascii?Q?cD/0OWqAHit1rWBNXxbgVVsrUQbJWHE8WPjLT+pwy9OBxhJ7hJbHYdt9kf62?=
 =?us-ascii?Q?TX8raMkcXXm6pRq8/rlV0pvrw+H33jZEYWEFgkxMQTAjhHLgimDa5WDrK49v?=
 =?us-ascii?Q?PFHIVa6NvCESGk8RHJ7TS4Fd57/DUwPUvkfq4Cor4qOBOfExGh5k7CJ8Mm4Y?=
 =?us-ascii?Q?zjZgbi+dsfPj1rT5MdV9uinx8XY9zfSEOgtrBf2gDrjqsVjRUklcSp1iK4za?=
 =?us-ascii?Q?movUaoUhXzP3y2nBspQCl3/i8szWfOoQuc6yFws+QRyIsK7sScuJq63AMDpD?=
 =?us-ascii?Q?TkERveby3AyHOia7/jyPcxkYvMf68lm2QlfOJ5ixqCngpPp0OqqJ6KgentGK?=
 =?us-ascii?Q?SwH9djATZzDNOqNZ0ymocVYuZRQiEVSaRMDDD2rwcxSmO93ZFRKbvqTCaAIK?=
 =?us-ascii?Q?0NGpVXFNRmJLGOuhk5OkKG93C89tMzooKAj79jq4ZK3We/1F0dRWzA2erbz9?=
 =?us-ascii?Q?cFJclbmjgXS8EsZM3gC+O734vR1xd3EAP8cwprH15Hx+3KQqZEhDNE+/THBf?=
 =?us-ascii?Q?0B/xkZTqWeucTQ0TN6wMJhVbfRghn5E0BdV/z6g0MyC1J3azrYzB4QfjBeMZ?=
 =?us-ascii?Q?zqyiNY8MOyZHMkVl9MnU2zMwyrlNX0C6atn3IZoLy91qznMfDxL9IUoSs0Zm?=
 =?us-ascii?Q?UB56TFXsJFkd/2OnZRBfx+HxL6rw43v0RDMAtlPd0BO/TCgtU0yi2T7YH3UR?=
 =?us-ascii?Q?c9KQcoTFjuR4kFmXbaoO37E+sN4WhX4z5UN7OXsAvn/dwTlHDEJovUAkm+lE?=
 =?us-ascii?Q?/ygTAjaFuZ42QsvzLCFjCMLDMjsoY7rXDbETp3C6VDrtYyrpv4dDg29RHGND?=
 =?us-ascii?Q?9+TjyyuKsVBpx/W+FcU0LpvRLCMcYp4/9mG9HrDizGsemRCxlexhrNDYrBUZ?=
 =?us-ascii?Q?svO9jaRDe+NrMMFYQxaJDeRhfST42PsZdMcB1WpH7opnoQ5uZKL3uD9SD5u1?=
 =?us-ascii?Q?fTWIyzuPVehyV48b4L6Os3syN70iPNUPzDZHFAbut1nxkGew5sTJtDGjyrlI?=
 =?us-ascii?Q?Iot+/xD40BK3xyN+JgamaUgR84sw/fLFKa/VMqw05rQTw3EeLqxljZRgam1v?=
 =?us-ascii?Q?bMZGgVTSYrtVx/1+fjq3ireETYhYebBonfzP0uUU6LKGcVsc9nebtiUbd8pS?=
 =?us-ascii?Q?N58Pz9Qp4tB4PcvIeyV87OSaF36EjASQTT8RuoG/JAuwpY0yXv1tvu23e9t2?=
 =?us-ascii?Q?ZcZT4qSDUm9iLJUit/MoTYshC2OdIpwmfa+iPml+UNYpjBhh12SEENfIc4iI?=
 =?us-ascii?Q?SDlSxh53EZ1K4+IFQvRb3ovHvOgfQGR9Xk38w6c0r5ZVQKOv1kSK95IppEi4?=
 =?us-ascii?Q?1g=3D=3D?=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: d511ffba-eb74-47cd-8a67-08dba54844bb
X-MS-Exchange-CrossTenant-AuthSource: PA4PR10MB4576.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2023 08:50:01.4002
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jpSrNb3KSAaadd4w/+TcmcMlG09Q/sczYmL5RNX2faeDC0JeH9NjpCCBEKega7zAMFdmHWeWjte9d7cDiY3FTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB8286
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 25 Aug 2023 08:50:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104605

Signed-off-by: Emil Kronborg Andersen <emkan@prevas.dk>
---
 meta-oe/recipes-support/lcms/lcms_2.15.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/lcms/lcms_2.15.bb b/meta-oe/recipes-su=
pport/lcms/lcms_2.15.bb
index 3656e1cfd..6c5766a0e 100644
--- a/meta-oe/recipes-support/lcms/lcms_2.15.bb
+++ b/meta-oe/recipes-support/lcms/lcms_2.15.bb
@@ -13,3 +13,5 @@ BBCLASSEXTEND =3D "native"
 S =3D "${WORKDIR}/lcms2-${PV}"
=20
 inherit autotools
+
+CVE_PRODUCT +=3D "littlecms:little_cms_color_engine"
--=20
2.41.0


