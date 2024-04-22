Return-Path: <joseph.mills@cnhind.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9901EC4345F
	for <webhook@archiver.kernel.org>; Mon, 22 Apr 2024 13:24:12 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.69])
 by mx.groups.io with SMTP id smtpd.web11.18402.1713792247567170729
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Apr 2024 06:24:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@cnhind.onmicrosoft.com header.s=selector2-cnhind-onmicrosoft-com header.b=FV90IN/u;
 spf=pass (domain: cnh.com, ip: 40.107.22.69, mailfrom: joseph.mills@cnh.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cF+8kcVooD0aafx/rroYK5AsC4aKqP5HTrHCYSHPs4ibf8VwkB22wpg2C2TA1Q0oO3OrrsZvoIYebqTyfBgv1XWsEo3m0PLv5OcQ5EW2dW4hGKWl3QJQ4lGg1wyKQuWqES6KFabgv5zKC87IkuDspRW7GRkJhyvt+T0uzUyVj7NMmhAaOBzlhLDNjHdG/bk0iwVPu5tHIW0Dbr9QdjxLagdtxKPshyWDrGUoUS35klhdDLzujdeDEFr1WgYbCjGToJ0VnkHamVZ2zcfa8FirmzCeU7ZF1AfsBjT86gq4AhrJ7ooFot5A0dS9GvH+fHVBFFDXwYx5zanWgArVUi15aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DQfP9gK8xb3YIBtQunZU2w4t1eoy1FIUi9j8RJaLlw4=;
 b=IlpzMtC2mXIP7AFL75FWMcGbIfutrsSqPowB1UsQoJwDeNMxET1/+4xtgjhFyYMQd0y6Ep+IrQHlF3qZ8CUYSv0AvpHxfFc6HzFxPOOS0KQ+lja/hUrlg/HA+d+6+DC3pSWBZ8MJS3sKizI4PjDFScyTLGN+k5ZqtduZewKPFUx+sw7UgZlD+9mzT2jDLK2SDOajPRvaoe52Jj42A9CVE79zvxMT0w0Y6Ztez9waWyuM+xBxd0qqkyLAOyRJsqlRCBrHY/3v7hAFBdB9RdtsUtgW8qBK3ZNxfvbNMdoReZzO5Ca/l71TxLw0KVeOvBuBtU7M/08tPV4dsHkML+LFrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cnh.com; dmarc=pass action=none header.from=cnhind.com;
 dkim=pass header.d=cnhind.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cnhind.onmicrosoft.com; s=selector2-cnhind-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DQfP9gK8xb3YIBtQunZU2w4t1eoy1FIUi9j8RJaLlw4=;
 b=FV90IN/updl9g/JwG8pHxpzEhHUR2DI8dPAZc6zY5tm3TWeAzGrPSR8QAheA8hxm8Rk2XFdQ8z2QNqxb7IakZTx7jy6Qb1OcItvOWDQ4Q16OPrkOedKzfkFHdTk4R/o8esOsc2zB2PkUGdiFrutX+J8ZI5A7mYUHxNwJ620ZINw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cnhind.com;
Received: from AS1PR08MB7451.eurprd08.prod.outlook.com (2603:10a6:20b:4dd::16)
 by DB8PR08MB5403.eurprd08.prod.outlook.com (2603:10a6:10:116::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.44; Mon, 22 Apr
 2024 13:24:05 +0000
Received: from AS1PR08MB7451.eurprd08.prod.outlook.com
 ([fe80::f02a:a421:d05b:48cf]) by AS1PR08MB7451.eurprd08.prod.outlook.com
 ([fe80::f02a:a421:d05b:48cf%4]) with mapi id 15.20.7472.044; Mon, 22 Apr 2024
 13:24:05 +0000
From: Joseph Mills <joseph.mills@cnhind.com>
To: openembedded-devel@lists.openembedded.org
CC: Joseph Mills <joseph.mills@cnhind.com>
Subject: [PATCH 1/1] [mesa] Update do_install as needed per upstream changes
Date: Mon, 22 Apr 2024 08:23:47 -0500
Message-ID: <20240422132347.3180714-2-joseph.mills@cnhind.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240422132347.3180714-1-joseph.mills@cnhind.com>
References: <20240422132347.3180714-1-joseph.mills@cnhind.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: SA0PR13CA0013.namprd13.prod.outlook.com
 (2603:10b6:806:130::18) To AS1PR08MB7451.eurprd08.prod.outlook.com
 (2603:10a6:20b:4dd::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS1PR08MB7451:EE_|DB8PR08MB5403:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ff6a0a8-cc2a-4854-1fda-08dc62cf7b8a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?abp0Dj+XQFNO64WCaoVlAMErnSFHAHNlwPOY3wY79wef8rUUQ2lMyTKKzVtE?=
 =?us-ascii?Q?tn3AGCIhwbe78UE9aQPT30EZDzpN2Sgm1eotsTf205M/AIy0twZfNLAWJlES?=
 =?us-ascii?Q?03A4ARTy3k7UOjO8N3N2ZQ++KC2umNdvkBFBSC5N2WeTMPdnQ8QK3x4MAD69?=
 =?us-ascii?Q?ZVRwUciEW/aSEb4HVUMqBV1W1kGJZsbsHwQmsosSyKMfq9QOjkQeGNsW1LrW?=
 =?us-ascii?Q?R6+YiVg0bC+zFjcjw+uDbhoE9JpuxG1bjDSUeKW7E4yBAK8Bzty3IdS52vVD?=
 =?us-ascii?Q?v1ZjlQFIzRapxhi/UNvTPLZdESL/o23j39SYdlufCCvzujY9R1QgOp04MOSe?=
 =?us-ascii?Q?/YUIA3cH5g7tIGZ3uQdIwhdxaZj2H2pdmtozplxyywVnbk3yoUCGOuis+aji?=
 =?us-ascii?Q?BR+GmunJDv9I/c4g8TpdZglmII3wPAT9DZcF8TqN6PY+9t9h6pQSuMao/OUi?=
 =?us-ascii?Q?sTAnQbRmRrnH6Opvqwi6ObdLIlVAWYR1qRSeXoGxBwAPUSa8D1lMWahgdEVx?=
 =?us-ascii?Q?9jIPPTFH09SAY4re8hX1ARZPP25PZ/WIpn+gy1/KSrsAROC3gBE6nHD9+wcs?=
 =?us-ascii?Q?BFVpFdo6GvGquPY2y7uL6mlV2y0xXlmAa2e6POiyULx+weVcorPvdFS4RGRH?=
 =?us-ascii?Q?MMNLagvHsEV0fUiW798oEcajJEUBw/EhxkrHrZUPDwDb/dF0WgD+oSWcF0la?=
 =?us-ascii?Q?O11jditXyXS8MICEu6zbQYlm2Lp1BgY0RU/1ofSPe/OjpchccntQPrHw7Fu8?=
 =?us-ascii?Q?qe503Eijao4Slaqj6BxEa3rKTDGILSIS80cONJj+knC/n6ekLf3j+mxX4ML9?=
 =?us-ascii?Q?R0MQM6hliF33QRL/50E5ouHRHhpg25J5nMiVcPL/hcnQGzHSEF+VOgfvXx6c?=
 =?us-ascii?Q?VlHgp+/HzLs0fFq8xRh53NAX/8PaQbEIbU9vv/lPpBCe1QKS4ip5PeyZIbws?=
 =?us-ascii?Q?yqTiAhVHZAFztjXrnzcR3BnBwilOUqQEJAaub8If46ZBcF09q/4QjZ3R7KMo?=
 =?us-ascii?Q?ML3yAw5cehPglM97U1aoh0wE2Rk0RDe7jXOm0W8Y23nD7iyic4cDEABNfFKw?=
 =?us-ascii?Q?zAciJ11G/RATCfVA5dcNHXfFQT0ovGoThYdxziGrxf8RC8o8Lif6cPbdR7bE?=
 =?us-ascii?Q?981pCtW1fY0PiyS2yy1bQsqLiwYK8MZWJyDzXkD/XWVI3GzC1RtC7QYbJNC9?=
 =?us-ascii?Q?eqjQUBuJJD9/Rf1oscT2TMsRKKpr97D8f6GrN4lA7VncyAH6kkIlrC80gYBt?=
 =?us-ascii?Q?lMiSrtzvI03JF8UVprocwAN7H5X91EtzYuyWhKe6SdOKCB7lBYG6AkyhDG68?=
 =?us-ascii?Q?43RISOSjaor3Ww2vLObwiLSwH0502DUj1lFiVzBYDlWhSg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR08MB7451.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(52116005)(376005)(1800799015)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Cz2kc69MSLy/u+PMHWEBFD+1ywtLROozdT8TT9q+irseKuoSyH+RYmt0DDy5?=
 =?us-ascii?Q?PUGa0LSlumRbOsiesbiFXOtstnh9y+vJqOjnK8qoSyM4sNIjxB8MWJXKea+D?=
 =?us-ascii?Q?/Igaj8vSyfRff1fyZFJYQUe95frnsuhi0THQeI+DYD83iBA3FqwehlHTiGlR?=
 =?us-ascii?Q?BDHuJ7U4T/lf7FybWJ0owYmX6oso+84ds68QATHCywW5SN9RXn7NP+dYGdM3?=
 =?us-ascii?Q?p4EWYdm0+Nkv8NwSDDYJRYX05ds7TlHi1V3YAfWaSnxt/RCVBxkLLBJFD/N5?=
 =?us-ascii?Q?2hhANqupmS4bfQTTNiEZs6/LSsIpP3BnGyfPxP7PWH58+nskWXmY8rpX5jxn?=
 =?us-ascii?Q?rwrS+1v6TclMpQBD0w7rKTCSUi6i/5lhJykTbSgMt7XqoPJntm7qExYRk3Yy?=
 =?us-ascii?Q?5v2/C3Pt0AVuIFkK9qyi4P5kqewOazLSpchrhm/uoY5p+3l8SB944JmLpxV5?=
 =?us-ascii?Q?x68cO9kRNzZar2imUPMI6CGaIaxRSxPmUmVQ5CP4uIOTcaX9N5nFwHEJSdf4?=
 =?us-ascii?Q?FzDvlg469fYFru1mSVRVwF3QiCFzcvaEnHSaAlq+qBOJZCS1nDfwSqFBcGDC?=
 =?us-ascii?Q?U7vwK5FEnWnR9Z+cx13ISXpppUB51yMsa0ko/WMV1NdprJhRJCvmN8TCCqzZ?=
 =?us-ascii?Q?fIw2YbPrggOiBQPFBXH7pHG5hO0Mma3T5j9CY548Gu0mXcOePqKUHbQfGBIq?=
 =?us-ascii?Q?L7aM6E8fEM1Oxp2RINx3tB77uLXtw1/SIIMnnXEwBc0LVPUHPfnTl+0/ANMD?=
 =?us-ascii?Q?0WbtL5ijPBbhBxqJzpQwl5KJmccNtUT0Y+xUTdcPcKD4ERulS32i6VIKRHoE?=
 =?us-ascii?Q?SdGu2pyE+ipXd5uQEHMMvNawJALQt/BgNz3xSul1rLM2bpW2/asyeDK8AuEK?=
 =?us-ascii?Q?p8Cow0NPzlsXO2OJa3YLwq+BAbF7ZOrUJ8uZesnrxCdExVhs9P7RQYxJ+dY9?=
 =?us-ascii?Q?nMG9CKABwAc9l4URhjcd6foLZ/oVpD/DzOJunLKxM9o8pNwK5xIn9sFu4G0L?=
 =?us-ascii?Q?C3Wma7bqGs6XFQ5coZZq0lPia6UiV/vft3T42qUQIgS905Yf873e/qthHTkx?=
 =?us-ascii?Q?WMBY4D6AMtbNwwx2lKRsUtDkLa7rlw01cV4jyQAFHiKSIzMPkWL87wnhB1nV?=
 =?us-ascii?Q?1m1QJXXNRyHmF00aEC3SXW3WaFCP/yGBCyNOvkcirD46xdu/nRrri60bZ8ca?=
 =?us-ascii?Q?tnZg6ZFg6mIHc6X7cfxYTC/G3zBUBdjsunDlom4Z3exaYzsekIOZCJUZqTCv?=
 =?us-ascii?Q?l9mnXgMspYxQCQs0lja3j0HnB9VsbVrRVfLeOpGY19akW8pxBtKQ372sYgZP?=
 =?us-ascii?Q?YpKZhicVrLEn4aFKq52831VmlpA081sZoiakbvT7XTaQKyXbUVc4YzDYFym6?=
 =?us-ascii?Q?YyekkjYSQCHjDa0sgSbxAIZ20mcmAXjdTIMI53hyL8iquwklTBdd71BykEYk?=
 =?us-ascii?Q?2ycCfUbTfkT/8+FXcNa7NrwmpLsGW93aIRIlV2d/HQmylGIigKfLzU2p7LEH?=
 =?us-ascii?Q?2J+32e/4puglAINafQrGnFjs4nC/MQrlkJkRUh8bDT/YghDGNg2451wTxzk8?=
 =?us-ascii?Q?si6+30u56Gk4tcVFjydjAOb32vzmMWA2ovqYRtE8PLMC4Lbf6aZZzsbQHfgB?=
 =?us-ascii?Q?sg=3D=3D?=
X-OriginatorOrg: cnhind.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ff6a0a8-cc2a-4854-1fda-08dc62cf7b8a
X-MS-Exchange-CrossTenant-AuthSource: AS1PR08MB7451.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2024 13:24:05.1530
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 79310fb0-d39b-486b-b77b-25f3e0c82a0e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BkRYe3ZUiqzkFaPZB/qo/KVwy4CQJ8D4Yl8Fw0TIeXlcBb6joA3Z3f4Sz/ukN3qjKyUDb1IUyUy1S7BJUV8MDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5403
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 22 Apr 2024 13:24:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110101

Signed-off-by: Joseph Mills <joseph.mills@cnhind.com>

Developer's Certificate of Origin 1.1

By making a contribution to this project, I certify that:

(a) The contribution was created in whole or in part by me and I
    have the right to submit it under the open source license
    indicated in the file; or

(b) The contribution is based upon previous work that, to the best
    of my knowledge, is covered under an appropriate open source
    license and I have the right under that license to submit that
    work with modifications, whether created in whole or in part
    by me, under the same open source license (unless I am
    permitted to submit under a different license), as indicated
    in the file; or

(c) The contribution was provided directly to me by some other
    person who certified (a), (b) or (c) and I have not modified
    it.

(d) I understand and agree that this project and the contribution
    are public and that a record of the contribution (including all
    personal information I submit with it, including my sign-off) is
    maintained indefinitely and may be redistributed consistent with
    this project or the open source license(s) involved.
---
 meta/recipes-graphics/mesa/mesa.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/me=
sa/mesa.inc
index 6e96190084..f4fcf31df0 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -27,12 +27,12 @@ SRC_URI[sha256sum] =3D "94e28a8edad06d8ed2b83eb53f253b9=
eb5aa62c3080f939702e1b3039b
 UPSTREAM_CHECK_GITTAGREGEX =3D "mesa-(?P<pver>\d+(\.\d+)+)"
=20
 #because we cannot rely on the fact that all apps will use pkgconfig,
-#make eglplatform.h independent of MESA_EGL_NO_X11_HEADER
+#make eglplatform.h independent of USE_X11
 do_install:append() {
   # sed can't find EGL/eglplatform.h as it doesn't get installed when glvn=
d enabled.
   # So, check if EGL/eglplatform.h exists before running sed.
   if ${@bb.utils.contains('PACKAGECONFIG', 'egl', 'true', 'false', d)} && =
[ -f ${D}${includedir}/EGL/eglplatform.h ]; then
-      sed -i -e 's/^#elif defined(__unix__) && defined(EGL_NO_X11)$/#elif =
defined(__unix__) \&\& defined(EGL_NO_X11) || ${@bb.utils.contains('PACKAGE=
CONFIG', 'x11', '0', '1', d)}/' ${D}${includedir}/EGL/eglplatform.h
+      sed -i -e 's/^#elif defined(USE_X11)$/#elif ${@bb.utils.contains('PA=
CKAGECONFIG', 'x11', '1', '0', d)}/' ${D}${includedir}/EGL/eglplatform.h
   fi
 }
=20
--=20
2.43.0


