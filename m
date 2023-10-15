Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 133A6CDB487
	for <webhook@archiver.kernel.org>; Sun, 15 Oct 2023 15:06:28 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (EUR02-DB5-obe.outbound.protection.outlook.com [40.107.249.60])
 by mx.groups.io with SMTP id smtpd.web11.90066.1697369032343148425
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Oct 2023 04:23:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@welotec.com header.s=selector1 header.b=lkXVNLtr;
 spf=pass (domain: welotec.com, ip: 40.107.249.60, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J+abobuVqFt2KGI706RNzBYYJ+hha5PTujUj3DPYNAuCfrv0SGat3VXYmD19Y1tbUvt8VxI5Vxh+iJHBVaTJ741xkhV6iG3e2aNu0yV6zNZX78IX8kTDv+jmDUSVEuUM+/WkVhMxH+CgG8oPbbbp8bEF6KwgJXA3nTJnKHu5FnQTKwXUQAQseeEg05fhTUnUIRT+sFhcamKvp2IUX+KT9OyH3vDlAtyjP3TcUvDiLvFzMNhhBi0RmvHVy8qSM6jvXNALHmLXlXfFN8CoUIMuSX6E72Yffl/HsYj+NxPIhnz1Z0MXSQRhlFpFCif/YnRVaVGy70yk9OPYtfsUu+IT4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AONqEpsjzkHLtlO0IyMbeBemSbONL8PFfff+5FD+yYo=;
 b=RxD6cnK5finvLQoIqwQpL7UoKU+C1t5T8mG8lanG/4WvzIPj0Cbj54opFxecA/LYZaGunWeOCKfoMQosXrrCPbkRjJa2waTcfBXTNXgT0jd8inFqJPOD4vc9JvME6TRyNNnylWLKVVI2qE/uPXheTTX1IdlBu4smhey2octfeptgCDTFCR0//4Gyr5tejX8cHubuXyVqHEwQ10cPCuvYOMCgZlBXu5YJlYxBBO6jZkNYk6+Jt30mhEpK54IKA61riCCxbXV58UWj3tw6bwvbNapwfoKn2cvCF7VUzjPv66luksoImFkgYJMlC2HYw+36bICo4Ozm1sI8UyTdLyULaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AONqEpsjzkHLtlO0IyMbeBemSbONL8PFfff+5FD+yYo=;
 b=lkXVNLtrGLa824mmxfGMUiW6iIcTurhiVdcmwQI67jmQRDObEVFERxUxMBHIs2/CFi0XW+jWUAfy772f2y785syTiG1RbAoy/te7x5TmX/Q4Ov39DzbnUBfWW2IEwZCmPGasZH91rwfTpctTdl4rxqRk7hPgHVjNnx0ZLMdy5Z6LB8kX2udHS4gk+x5QHmc4JAZUGOrqLSFVMpL9t0LuA5EQqPQdIbzOPJIhfkdFxxjX4kALBub+4/BsHNrFHImUtO44Erno7UP9r6SgSgrElskR5VfxMKJM2aM7duPuIYDDaPS0OKq6RhKbBqX1wQwDYf681BYiGdOgChd18olgsg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by AM9PR04MB8113.eurprd04.prod.outlook.com (2603:10a6:20b:3b5::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.47; Sun, 15 Oct
 2023 11:23:50 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::3090:4af6:ae14:b9c3]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::3090:4af6:ae14:b9c3%6]) with mapi id 15.20.6886.034; Sun, 15 Oct 2023
 11:23:50 +0000
From: =?UTF-8?B?UGlvdHIgxYFvYmFjeg==?= <p.lobacz@welotec.com>
To: openembedded-devel@lists.openembedded.org
CC: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
Subject: [OE-Core][PATCH v14 05/11] package_ipk.bbclass: add support for ACLs and xattr
Date: Sun, 15 Oct 2023 13:23:30 +0200
Message-ID: <20231015112336.55722-5-p.lobacz@welotec.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231015112336.55722-1-p.lobacz@welotec.com>
References: <20231015112336.55722-1-p.lobacz@welotec.com>
X-ClientProxiedBy: FR3P281CA0100.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::18) To VI1PR04MB5373.eurprd04.prod.outlook.com
 (2603:10a6:803:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5373:EE_|AM9PR04MB8113:EE_
X-MS-Office365-Filtering-Correlation-Id: 531f8f98-331b-450d-5c3b-08dbcd7134db
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	cg5gRmmqPENnLPFaPg8kN0CFUNIw6/jupwIQpqbSBIdNIgalW2YEb9ld0P7T8x9KxMAM4ffRZz3iVUmwvKgtdmuHSkwBcmXCrIXyiMx/Upg8txPvwq/5DgktaJWDv2uqnBOhC924SBw2IvJOlo6BvimgG1HTTyUpVioZJZ7YNNPJ6RUcMB6W52GCKur//hqgqXi+QZFg0RmWZguKxHjSRscAa8dDghuAH8ce7m88HmwcGrJcjetgOkE/8f2u1JL3mIYDzzc2pBkXv5A9fY8mMx/Iq+HqTAbIUiNFHAcBiMr9xoV8goj6ldWsSNnmglCj28m7Q2LZY3BrEIIEsLboZCpnBJjdOlyZQ1AtSZLsiQTGOQT3terNdiN0Og3mZVXK5xOA6+5suV4ToV9aFvWFSBdBMaNflnj891+XD7SAVPSkUIJcngkmHV/JPAonK1wX8EduPcaV3Tnt87CHD+dXuiGf/IFoKPi3cjxhEMoE3uarzVkR7BJfRGKv1eqZSjKUPpA4Fc1y05V0AhK7xloEubn/eTqyWOODcmC6WsYgN1MyCZIy2An6Z3QJhV7TxdWCkJ/owqdRn2QEYOhpIgiIUfKMst0MpMHvbUxVK3URz/c=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(376002)(346002)(396003)(39830400003)(186009)(1800799009)(451199024)(64100799003)(478600001)(966005)(6486002)(66946007)(6916009)(66476007)(66556008)(6666004)(83380400001)(86362001)(38100700002)(316002)(6512007)(66574015)(26005)(1076003)(107886003)(52116002)(6506007)(2616005)(5660300002)(41300700001)(36756003)(8936002)(8676002)(4326008)(38350700005)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?M4QNLSNZzVtqRkEW5JjH15g1FnqUJ4eq0uYerSAY7aFmMITDx5LQYUQCOlA4?=
 =?us-ascii?Q?5ndY8L+iKnx9O4J3SAGgyo8lcKyA5Lfxi6UA5FoFgNdvUR8LgG2y1/CW9ZP+?=
 =?us-ascii?Q?RbAxSpgZdb8jAEXXJUtPIjdUMoLyo26iwluRHzbS+9nU3ttvMuBuMtwDKV+d?=
 =?us-ascii?Q?Du+m/DTkSNSIeHNGRKr22VvohDAc2yZtfQkxTgSyE8d1zZ5u6zUu3McjtRQK?=
 =?us-ascii?Q?hxVvat+abP3RUnYGFOFAGjX2auLfSnwkFpsxzX5I1T3NiHOMoWmx6/JehkdK?=
 =?us-ascii?Q?EeEaumW2PNWxf+YJCoNxIvO9ZLoous5skQ5K0GzjR4BPaTAnOG1kgIqhJJSL?=
 =?us-ascii?Q?0MFoswLeO7+hqak+UVIdWELWVFff4OHtdOmv8PyflYfI8qc1qhWlJtcb7GOx?=
 =?us-ascii?Q?m7rZl6VqcdTWfrJNKrwSQ/JpN13rI8MiuNYQuKJNvu0dlqiWB6mJMzMeLz3g?=
 =?us-ascii?Q?RKxYyzEP/nfrd975KTHb3vREl65vAuDHI3e2rWIROqwKOrsXuKgKdyjZwlti?=
 =?us-ascii?Q?dIe8Ln7viGWEyrUwoeRfMLKog9115Oc2d585rSHrFh+/3MZBttCUxrUgyxbS?=
 =?us-ascii?Q?tdILKg5l0r2dUpmjM+u0Czz7EUBAGip2aa0sIJfpsXy7EQO+xSKivHJS6FUM?=
 =?us-ascii?Q?3WYuinDb4/5l14z/IGQbkE5rWhmzjfkHraMTFFJnkuaJ3+5OmoiAmKTRvtgG?=
 =?us-ascii?Q?Wpyva04Dykmtwre+rd1YNjuHNqj8N8Tlsy4funZmj+oTSt69cVdhOfdDpaou?=
 =?us-ascii?Q?Tcu5F7hxj0V/oCldMe3BqrJ3ArXem5aTv+aMfHHMT8aD56lUpAmfyxTorizc?=
 =?us-ascii?Q?99SVCY4Ur/d71cuMM5ijYZo2zTNvaXO7En+fGc0sXqnbKxY9EjUpcrmu7dzP?=
 =?us-ascii?Q?lDI+T8HbirZ9/owqreKPgvSdf4SmMeh3bmFS5Djz1zQgTIRrJB1PJjM41A7p?=
 =?us-ascii?Q?U+SKvYqlRK041sRgOAvHoHXSDdgPjMGYWj8K3DzsvIZXGyUab5jM4EHouiA1?=
 =?us-ascii?Q?TytMiFHspTiY6WaYGJh2YCbZ2lmbVgY2jeAbz4eZXOqzfF9KaA4GVNUdTYIB?=
 =?us-ascii?Q?C75soaTa3Wk9JSyQciAxfTt0Cq2J6VATSJnhutYtICHlRbx7WgudXimZ+Q+k?=
 =?us-ascii?Q?a/cBWk9Cl+xHVchEd5bbc2K1qeqkprG/fRlg5EHZdTvtEZGE7Je2atdyjoQV?=
 =?us-ascii?Q?GWMPZReJHX+u0gNNnj3k4iMryrVhwhxNO7xVSjehmMDsxutyXc2CVK0Tz3FH?=
 =?us-ascii?Q?iKoAuelxdVu489C283UN5lOGv9We38e0A4QQxmk1wiq/0gXJOn1AcljdW41K?=
 =?us-ascii?Q?DDSzdsjePaUeaCrb/gRYAXKQBoobXIwtQtlUv+zWR1vkJwPhW+Xgbj18AL6z?=
 =?us-ascii?Q?mf9FhKZJVK8bfhk8wBrLnJdhHV3f2kw6RSf621VPyAOEhzpu4fTKWhnvkNj7?=
 =?us-ascii?Q?rfxAsOhdKZfFcqM4zn86+juAM7KbDJHDp0mwKCF0qFqX6PSgRBKeB1DrKPzD?=
 =?us-ascii?Q?wWaMAxw829jbnp9fLSfor0ZwuBEjCMrYbTUycyFDcPrdNWPAh3G+OXV8qP/r?=
 =?us-ascii?Q?ecdUeT6FGWa4tJ3MV14+ZaJ9DRW5AxyN+DRme/HN?=
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 531f8f98-331b-450d-5c3b-08dbcd7134db
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2023 11:23:50.6279
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +TdzH6klPfNukeQHvDmOISWQPFRQAKSYLGdDb4dgy95yhXkACIIqo1KXMCdjhvhNEjGtno+SF0zu90NrAAF84w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8113
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 15 Oct 2023 15:06:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105533

Extend OPKGBUILDCMD variable, with additional parameters, depending
on target distro features, in order to support ACLs and xattr.

With fix pushed to the opkg-devel:
https://groups.google.com/g/opkg-devel/c/dYNHrLjDwg8
opkg-build is able to create tar archives with ACLs and xattr.

Signed-off-by: Piotr =C5=81obacz <p.lobacz@welotec.com>
---
 meta/classes-global/package_ipk.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-global/package_ipk.bbclass b/meta/classes-global/=
package_ipk.bbclass
index b4b7bc9ac2..a0f106e4ad 100644
--- a/meta/classes-global/package_ipk.bbclass
+++ b/meta/classes-global/package_ipk.bbclass
@@ -15,7 +15,7 @@ IPKGCONF_SDK_TARGET =3D "${WORKDIR}/opkg-sdk-target.conf"
 PKGWRITEDIRIPK =3D "${WORKDIR}/deploy-ipks"
=20
 # Program to be used to build opkg packages
-OPKGBUILDCMD ??=3D 'opkg-build -Z xz -a "${XZ_DEFAULTS}"'
+OPKGBUILDCMD ??=3D 'opkg-build -Z xz -a "${XZ_DEFAULTS}" ${@bb.utils.conta=
ins('DISTRO_FEATURES', 'acl', '-A', '', d)} ${@bb.utils.contains('DISTRO_FE=
ATURES', 'xattr', '-X', '', d)}'
=20
 OPKG_ARGS +=3D "--force_postinstall --prefer-arch-to-version"
 OPKG_ARGS +=3D "${@['', '--no-install-recommends'][d.getVar("NO_RECOMMENDA=
TIONS") =3D=3D "1"]}"
--=20
2.42.0


