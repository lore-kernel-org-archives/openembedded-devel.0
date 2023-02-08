Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B8EDC636CC
	for <webhook@archiver.kernel.org>; Wed,  8 Feb 2023 10:58:36 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.57])
 by mx.groups.io with SMTP id smtpd.web11.5727.1675853403428702403
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Feb 2023 02:50:03 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@spinetix.com header.s=selector2 header.b=osih5TLQ;
 spf=pass (domain: spinetix.com, ip: 40.107.20.57, mailfrom: valeria.petrov@spinetix.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f5NCG5fKpy3eqF/I9ATJIYBhsioL4y+anNmIRQZAtIYgvu5/fG1bHcbzcsIkJNrXjR8PtRncTVRLX7EGkxwY7vqdhIheiwK3mfIvdafOqlMRxfPPhXpF2oNFZi5ceztstumLnORBGWA0lxAKjkKvtOO5qDbcnyjrpf3TRK/59G7UCZjFmoBNzbodSLdGakRql1ZfTQU4y4BhZb3q4Sq8ISIsjKsn7PiPip6487FtvibFDqpAS3SSddfVWIma5QCIv9oIOKOGEqwjIoLd1ZovKfqf0OFXqp66SMEu/xICrFQWsxGp3+tDLWbqQFW2cdrSV63k1SsWi0XMBelu+77jWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YLSoNhOyFphOtuM6F6MROO8PAyPaRRXU0tdJlo3lXyk=;
 b=aSWPlkGjrPKhoES7+cVzESgEzh3ydtSAWxlyMaI61Vz7ZahivzzMzDyiwCpq6O3Vt1RPu67OuBhIc/XN4nt1r23I5GxQBVUw2VKy6olDg3xSfq/a1qNbjotSj2AZk2rLZ+WL93QZoziQMFFshrKtcjkgTt0VKZM2F3Xnr6MAbfqV8f3DAEGYsvRlXKpWTs8vS9d0tKdLk/skft3ir6HqIkMdmLVSdbl7Ij0EV0i0w0J25a94wU4G2kD1J2gmvJowuS6yZ4zKViEPtvwPHam4+azFag+WO17uw4MaBZIObSxX33bqV5KD/d2Upp12NJUfN/Qx0BsKa/GAY+gWw5pHlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=spinetix.com; dmarc=pass action=none header.from=spinetix.com;
 dkim=pass header.d=spinetix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=spinetix.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YLSoNhOyFphOtuM6F6MROO8PAyPaRRXU0tdJlo3lXyk=;
 b=osih5TLQ9rKex44KU5tkreBlA6OvRRls7mpS5pEUVxrXVkoa7rnyQZne/18MSI2k4G51EXzePsqOE0qNb3wC6+PbHStnP6Kzyzmx/UF5jPzQr1TNjm3RBXN2zDHnk2jGzrJEKFGDEQfO2VS0xZT9efqjmeMQd/K6Rn7lrbvomDg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=spinetix.com;
Received: from ZR0P278MB0379.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:30::12)
 by ZR0P278MB0011.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:18::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.17; Wed, 8 Feb
 2023 10:49:59 +0000
Received: from ZR0P278MB0379.CHEP278.PROD.OUTLOOK.COM
 ([fe80::3a4b:440a:5f47:ed17]) by ZR0P278MB0379.CHEP278.PROD.OUTLOOK.COM
 ([fe80::3a4b:440a:5f47:ed17%8]) with mapi id 15.20.6086.017; Wed, 8 Feb 2023
 10:49:59 +0000
From: "Valeria Petrov" <valeria.petrov@spinetix.com>
To: openembedded-devel@lists.openembedded.org
CC: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][dunfell][PATCH] apache2: upgrade 2.4.54 -> 2.4.55
Date: Wed,  8 Feb 2023 11:49:26 +0100
Message-ID: <20230208104926.26497-1-valeria.petrov@spinetix.com>
X-Mailer: git-send-email 2.25.1
X-ClientProxiedBy: ZR2P278CA0023.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:46::18) To ZR0P278MB0379.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:30::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZR0P278MB0379:EE_|ZR0P278MB0011:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c44ff87-831b-4c0f-efac-08db09c23992
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	fo3ROb5KXA9lSzV7Wtrhp1zLGIazA9cbG4MEit0hmHKsobllrDhMR6nWxJS+lkVk+T6dfFE8R5uhMKK6OWU5jh1h6+gp/8OfIS4VUccbXeDS4SKqXVJvotcWy48qTvGyT4pggX7+lJi6PpCDOab0ukPpSqCfsJxQkJxPdlCOX2Wo1u8Z7nCR/VgQPZtZfik3rW9XbcsbpSAsd34sCWLYSv+CbAdNUL9G0eXG7ybQEQxsYFHG+lKtb/D9IsOvEi4vVKgBXTFNqRiUHCaaWUdvJDYztbntlFP99eNB1a9wOQm9PsBUGh4vEKH+FLkmPfcILahm9XfDQRi+WRcAr++Y9GarfV04bImOJuIoYmg8sKABFEMAm/0K7E8vImC4k/I2ow8dzFAecSwCn1D1SPF4pz++T8yVCIZ1aRbG7ddePup9DFL3jxC0Cf5y9Js/G6AsoWEcnI+9vOnFlLBuU5cBFglOqYkcs2CO0yE17Kxchw8z7uxedsL4DgR/rv7TmsYFOOLksr5z3wycjpQhJL9u+VuA08vT6IJ+xRU5Hxv1oUEUu+tTx+Ur/+ZCbDYGPQ3KpcxYJw2Db8tv1LAZJzlaYb1jVTLtS06KQYMq49z3erMFfdmFkd5RjE0xIQQ0lc2nqx0qSNF84ahBPqWpbd2NBSsFkPuJC9KdJCsPZLXQeuQiXpQy7Bq25b37H+S56oqlGS/7q8wpnjURb2+mET9CUmBdz9AHUOSImZp65AfhobA=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZR0P278MB0379.CHEP278.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(136003)(39830400003)(346002)(366004)(376002)(451199018)(66476007)(6916009)(4326008)(66946007)(8676002)(38100700002)(38350700002)(316002)(66556008)(83380400001)(54906003)(86362001)(5660300002)(966005)(6486002)(478600001)(6506007)(1076003)(26005)(6512007)(44832011)(186003)(36756003)(6666004)(2906002)(41300700001)(8936002)(2616005)(52116002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ttVq8AV5sz4k1TX9wd1U0vzLJyIW4jhk6XOeXtTlxsQEk/IkZpsAmdvzDIee?=
 =?us-ascii?Q?6TMiK11P3+ODGqzY0059AYVsJSDSZLE6Lhz1Ho/+qaR8tyCjrwqEIARy64sV?=
 =?us-ascii?Q?xGAYwbcFET0Gz0be1UkBFkSQN/pxPPW3WgsAvvk5NbGJtTrwck1RGW1+XtMV?=
 =?us-ascii?Q?TAG1o4USbjecz9kJ9MIjg+rd9vpr2WSg7lEPuO95wBXUwa9UOD96Ob98HXbB?=
 =?us-ascii?Q?U3tuIUKqnZYEqVm+ov2XH3nEqw+6Ds5pUjBE7c+2kNzJ/28eJ5NQVyiD0oaT?=
 =?us-ascii?Q?3Vpp+lLAnTzgiIp1z70kSOsUWxmWePQqeKLCCa9J4bdKZDBGlpTUsjkjcmjE?=
 =?us-ascii?Q?ZEDTb063EZFwn3D1GLn9pCjmKbeRjU5e4tdpsKvUHz0eLGOMqA9CgIjNpiMm?=
 =?us-ascii?Q?IPBTXKlcfYX0cATGQIFYcg0WdVHph5zTscNGvj+AeAYIMn+iLLTz4wEl/rK5?=
 =?us-ascii?Q?fKyLCgOLT2b6g62Dk5KhN1MRtGhL17AMJiDL9aQ6zVmMv4Q8ZrCLCcX51ZuH?=
 =?us-ascii?Q?XMNnyZV5t1rf8NHud5HV85aC+VrISBJWPczKIFc4NS+uLRxjEg9FX4NqAGeO?=
 =?us-ascii?Q?oTiMyoDQ4lKBh3xeIi7A9rHmuvqNkIjKCOypFTs5CqDZnLPdlz2L5XDgeI7Z?=
 =?us-ascii?Q?pX9SlzU78UYpPjSMF8i6aA6DflWLITIbVNCE3DJ5vWVLGN7EUJWD3Pa3M5ZC?=
 =?us-ascii?Q?X675vcGDSfUgB9W0af/EFE0HTUoydoL6NO80KPRPlYJpvqjfLUl/S+hkC35A?=
 =?us-ascii?Q?Z3IDAdhOwA5MdyvYOe/7QqdhrNykS5tpOVv9Latqk3jqp45he4WrWtgcksdm?=
 =?us-ascii?Q?Nh7fKpXKwwQbAFAZnNtBFdxerIDHH2PYggt70jAppHH82PXX42uHbezTLIBH?=
 =?us-ascii?Q?fmEAE0tTv6e9j0UoMkfOqoGql/9OCxcpWR2tetGKiMC5IjKIPslwK6qvtYHv?=
 =?us-ascii?Q?ChKjMiV8T6P9QEYcqrZ5pNbcskg61PDzOoeCBWj+hulABTLObjQX8V/jFVo2?=
 =?us-ascii?Q?7bxnH4nKpJJ2bxepgeZqqaA61bRHAyg192THB7cyFCnj3DAEN/GiIeSKxLEc?=
 =?us-ascii?Q?sLjL6WiKBBh727C2hZ4JDZglxTzeMS0F0ZrbHBL0b+/fzf8OVEuWUE47dvej?=
 =?us-ascii?Q?LFcu3XyKr9VFgMeCHePo0xbzY4hd90uID+eKKKMVuwfW/RQcF822Ms9sVLfC?=
 =?us-ascii?Q?DZJ73viYoYzM3khG+UOm7CSFoeTsMFuAFFl8fVjbcww9QRBNS3x+y2Ew9sWY?=
 =?us-ascii?Q?UMN1Y/ikoMJpmpzPiikWlLDi/qvv/Ki72ic1cG3okF96b5NrTg18XRdhoD0E?=
 =?us-ascii?Q?/O7tutZAMHL20tVjCKmIkUBSefRdfJOBFuaPlzRtf2mndJa6qCh8uN2Rx5I4?=
 =?us-ascii?Q?LdHBjCLSiMNf//a+5nPUcPRwOZyXRi7enepCVxcW0+LWgMb2G4oP14hZ4LCZ?=
 =?us-ascii?Q?rhPJzPGRKutPLojlCXdwl/Lax7S4EMbrKwmGSUq1i1BOMjqSoTyywGwlAPut?=
 =?us-ascii?Q?/9MR2K4jjvvKBD2ip1rWuSaZCAePPv23DRSu9AqzC1ywgftS4zX7jP0cvL6g?=
 =?us-ascii?Q?H8jCyBCobQDb4DwkHNvxIzaNAdjbKIKsfr2hWT9UjFxaeTgshkTbDDxWetMR?=
 =?us-ascii?Q?PA=3D=3D?=
X-OriginatorOrg: spinetix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c44ff87-831b-4c0f-efac-08db09c23992
X-MS-Exchange-CrossTenant-AuthSource: ZR0P278MB0379.CHEP278.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2023 10:49:59.8557
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5f4034fa-ed2d-4840-a93f-acb1e9633b93
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rrGYSCPplptepBqzGQzXxVwJnaKl36k4F6VCc6c3BnfpAfu/A1zZJXPJwB9Z+ktArU8OhdlitbrI+47qVwNreiAiX3Hk7XmFSHm+YnfJ8Ts=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR0P278MB0011
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Feb 2023 10:58:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100993

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
https://downloads.apache.org/httpd/CHANGES_2.4.55

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../apache2/{apache2_2.4.54.bb =3D> apache2_2.4.55.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.54.bb =3D> apache=
2_2.4.55.bb} (99%)

diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.54.bb b/meta-=
webserver/recipes-httpd/apache2/apache2_2.4.55.bb
similarity index 99%
rename from meta-webserver/recipes-httpd/apache2/apache2_2.4.54.bb
rename to meta-webserver/recipes-httpd/apache2/apache2_2.4.55.bb
index 2fdf926292..0ad97a5391 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.54.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.55.bb
@@ -26,7 +26,7 @@ SRC_URI:append:class-target =3D " \
            "
=20
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dbddeddfac80b2c9a882241d008bb41c=
3"
-SRC_URI[sha256sum] =3D "eb397feeefccaf254f8d45de3768d9d68e8e73851c49afd5b7=
176d1ecf80c340"
+SRC_URI[sha256sum] =3D "11d6ba19e36c0b93ca62e47e6ffc2d2f2884942694bce0f23f=
39c71bdc5f69ac"
=20
 S =3D "${WORKDIR}/httpd-${PV}"
=20
--=20
2.25.1


