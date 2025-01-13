Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AD83C02180
	for <webhook@archiver.kernel.org>; Mon, 13 Jan 2025 19:26:18 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.136])
 by mx.groups.io with SMTP id smtpd.web10.26661.1736796373485263795
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Jan 2025 11:26:14 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=U5NWmpsz;
 spf=pass (domain: navimatix.de, ip: 40.107.21.136, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eMUOpfARykdtJe1Ee12tRqWJ7GaEDGhKWu0uqqC8GshPpOIL1DoBV8bjyTf5Djl+MUlzLUlFZ6n8p18BkTMhxf99/NKQe/rb1aWMGswsV3h0yshgnm1r4cYWa2C7PWBVaeuHnAZGUFaLIjm2dC5jECCVkgKu7MbI++Q8hXuceqKdlTPgBLyalfyT18hwzBz6XH++tKbtyRo0K9Hp+Af+EE+kH6Y44++EU9empFm+k6uD4+GoEEkBIGWpmRow8Irifh443u+MceM5fAQ6cQyur/naTTzfk5qmp0U3Eq8Nsj35u9m5WSkBUqJExEym50TdQUz51/7PVz8JeSaCtqd+WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B9wnKuJHcqOXzXjciUbg+X3PEPfEucKpbQjIF7KOn4s=;
 b=k2mix/GpVyujig4QxsmMoW9vtmQhKCwiIASdKU/iOkcLelnJwPHk+aHFZkxjdMAlXRKJ2VkqZphpQXvNEZsu4DWMlcohLkYChCcDks3S8R0m/m8fvKZYtd3maYY8gTDzb9QWaq3iD67jHWZZMMGMYWanSaKo/eSiDcePOd3fDnnmBMSAW8ImjPrj0y4c9F41HlHcULM/pENAoHSsR/bGwJPQuyZz6FzqzOLjHLO1uV+/aeakmkBo/vlfZ6s2CXr9W8DayaYYMyRe5dCfZHvtKOt21gl+0gfHsHPp11NlDEfcYnNcusQUfaTIqsuy0WGmOIjRmz2Qm5AlEUBfb4ym1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B9wnKuJHcqOXzXjciUbg+X3PEPfEucKpbQjIF7KOn4s=;
 b=U5NWmpszpDVOcQ9zKntWR9swgB5264a7/K2kHE7bGSAxKBQL+KU7etTrtx9QtfjnUvZ4I5JTY+cx6vdcEkgoeA6IJZRIiztlKJmTnidjnv2x/hCiB4QKPz64kmFtzAgnJBd2gTuue3vxHbc9s3938V227fNX8QuBH6iEff/j94o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2d4::5) by DB9PR01MB9149.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:367::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Mon, 13 Jan
 2025 19:26:09 +0000
Received: from DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 ([fe80::d520:1b9e:a30e:69a7]) by DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 ([fe80::d520:1b9e:a30e:69a7%4]) with mapi id 15.20.8335.017; Mon, 13 Jan 2025
 19:26:09 +0000
Date: Mon, 13 Jan 2025 20:26:08 +0100
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: openembedded-devel@lists.openembedded.org, joerg.sommer@navimatix.de
CC: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
Subject: [meta-oe][PATCH v2] spectre-meltdown-checker: New recipe to check
 hardware vulnerability
Message-ID: <2aac6c321ba7fa5f741aebb054053c5be42338df.1736796368.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.47.1
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE1P281CA0210.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:89::11) To DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2d4::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR01MB8293:EE_|DB9PR01MB9149:EE_
X-MS-Office365-Filtering-Correlation-Id: 11db16e7-9144-45ea-429a-08dd3408225d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?MwZZ43GjOascRN2fCcCNGtFUdMr7b/ATl+ZgSprKcNO1hW5g7018e2yxgwzX?=
 =?us-ascii?Q?ofyHLlUqk+QZhNFMb1L8+RolQ6UkltDDmyUbkGXgxaJleypTqEExhgU5shap?=
 =?us-ascii?Q?0TtcGBz4uBU/a9uw+3T+CiRLNsl9yR3SgGzmcCX8MxVcoRa3XZXxNkmlfElU?=
 =?us-ascii?Q?VQ75QVwm//MNcsmXi3DvrQA9bdgBUh45KXOnqMPkWnXsK10MdJ0sSke3/T1S?=
 =?us-ascii?Q?sCIV3HIxo//+WsQjThU+SowXAYM5d85S8/BUONHkh2HW9rNUxk5NxVdsUIoe?=
 =?us-ascii?Q?U73cxS2RAVZzHqjlpYDb0rAwnGqHwlsOcZCwsN1kYDWvAUs5VBYLuFk/b2Dh?=
 =?us-ascii?Q?0DFLkkRhBhYNN4VYFmJ4NbeP6ml76ljlcFTxVArURGnDUkXJe5iV2sre95LG?=
 =?us-ascii?Q?qCE+JIhXooA1ocl17L22c9Mvjnfk1l7B9rXgS1UlQfOOes4XBJJbATD6CxSr?=
 =?us-ascii?Q?jKgfjtzKxl7M2F1KO/n90CtR4Y6xs4DrwpsXkAdnpgYpZXnjDIioNaZg0uvV?=
 =?us-ascii?Q?Zx4fuF5RKJVxqtCrvNRxLnW1ABC96jSm+wXYSB1zrHz9M1mtJfWjVbbXROKz?=
 =?us-ascii?Q?mGvvm5NfHy+eWhjmWFFvWhqIwC7MRzZWk6pQ51Ysx8XMe925i6jSpU1iknUt?=
 =?us-ascii?Q?DYQLmBfLbO/kajjG3oVl4SkXrRENJILlpJ/N7XuBCvZcCJjWN0OfH1hgqT10?=
 =?us-ascii?Q?NP6oe75J4b0O7/wqZx+ZWD+0CnTzYYZKqRgS2Ohr3kUC3m0KZ2tPwL7uzeXJ?=
 =?us-ascii?Q?BzLqmmj0MWbKaipHwI9jZE5fptbdl6oOFCYnzSPL2WbpF/7ddlgqCbsKV0eu?=
 =?us-ascii?Q?1uDP8tA0Opy0HbV2p8Qy3XdX8WGfdyazZXgVk6xDf3opKf2Rl9PzqlbLU7Km?=
 =?us-ascii?Q?ns/8QDsgcm0sFLBwna0BMknPnOVmtkhVjGz3ZMfDnCyeb6C2+pIPTppAoBN7?=
 =?us-ascii?Q?ubmwhM2WcNBcpJMp7x0gHNvqhv1+JmAD3ozwK9O7pra7VYPKl6uSi0CZfsFB?=
 =?us-ascii?Q?i3PEX8uod+Pz1mdXisFGCsxbY/DY+kaGJLz0YO4Vk6IFvomsp5Nk8ejWOGn/?=
 =?us-ascii?Q?NxjwkLdEPMcbeuBoNz0aDeLQ0EFgkdFobj+DSkzwr/X7355q3E1xIdX5IoEh?=
 =?us-ascii?Q?uFfYSOnpVIjOkZ3HkFq+6St3N918JGX+XkJg8LYo5FYpEsDCGA8MALPUocMS?=
 =?us-ascii?Q?OJKtUvvISyGOZbxqZA3DMoF6YdVPQrksYjp/7OnvWlKWvRUFMyP1smp+7GWc?=
 =?us-ascii?Q?NTMun0Fg8txrtQLEybCT+a5tYXtbQz6QdvJmSwV//g3dmnSxKajVt/7FxM58?=
 =?us-ascii?Q?fyBxmNgT/ooBtd2UuCEWMpoh3GYnJjUUvj1XlT2TVSEVT2pPaG4G1S9IFKQq?=
 =?us-ascii?Q?Laf9pLQcgtAIcJk0LUsyKRCvOtBd?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR01MB8293.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?s1d8i8PpzcyeSqD2E3dguF5G6TdJqW8cxtZAIzFu8gYPBJn3J5VAI0zHI82v?=
 =?us-ascii?Q?RtmgTq5gmXLFN9SHcvkf+rmGcQzUu3E57IWSuDVhbNwLjEBgxpkKb1UxXxCf?=
 =?us-ascii?Q?xh3op++20XilVJGkwEHDwWEqKSXaTkfhjOJrCFMvK9rZj2+EtzE5JupHOGg+?=
 =?us-ascii?Q?EEr6jIjhSig2jKFJeBHTa9l1DTHJgCN5WxDNetoOLyTiL5GVArZFisEXuEDP?=
 =?us-ascii?Q?0zOt9lp2UqTv1oqXW1Zr0NDBoqUyc6nIcUx4iGobIn74GrsAhPtKuC9E616R?=
 =?us-ascii?Q?BRiLJKsAKEKUl/DIJLGUtYOn+tulyAWZnxUbpX70pjId4ZNQd7Xek9+O4i0+?=
 =?us-ascii?Q?aKBtwDmvQXMWHmfX6AOyl643hIC4UH/CytjW85xqCMqjogb9t4CsVgr82RQ3?=
 =?us-ascii?Q?a16O38HJ7ERaWMrNlsivZmKMA4kr/EZR3A3BCL+IllddzXv+cxXHpp3LaMMq?=
 =?us-ascii?Q?2PVjiUt5cF4k27NPRuavbzv829Ja3BaJUZMwb9GKCIXEHHJ9Vh/JdtUa67G6?=
 =?us-ascii?Q?3IUfqH1O2cgstezdq4oXwBf2cloHMMMqCAM/CJ0tnH8CEQO/1NfAvRIlr0KF?=
 =?us-ascii?Q?qkYLLHHnWV4DNmM3nEqOavfot/qdciK7fL1kmHjW0k3riLvk/GVM2xH1XaHv?=
 =?us-ascii?Q?nqcfkzaEkVj/uhd6e++860qolyRK8Yuc74NdIJKMvGqCkxBTstWU1LdsKJfo?=
 =?us-ascii?Q?EQNyQf/hvMar53SrzbZwsgjIVjv4ejMk8+Oy4DgExpQ18162/iB3UmS2L8z0?=
 =?us-ascii?Q?2HPoorcyLGRBTffqIR9qzk7yBqbmsSxXVRhWHxMqGTF/s2w6m+2f11ijp7lE?=
 =?us-ascii?Q?D0NaMtI3cKSk21HmcycGp42xrxc7tdNVb7fiAyBLrCOMS2VgQAFkeL7Ktkok?=
 =?us-ascii?Q?hpwgoPamX+Gv4YOoQkeXKUALrUTvqL5etqfkAsLgU2Q9zJ/poHxabqWxyhI4?=
 =?us-ascii?Q?sS9kt5W9oBh5wSeO4Rc20pcZmPkD31XJ1o+gVKE7AJ400bpVStMQK6ZyHI9V?=
 =?us-ascii?Q?FcrtnYL3QChUEOHuu8/Uv8/okuU5RgRJoe9vlRuVYpMnOHumPRpiKe/Jo3SQ?=
 =?us-ascii?Q?yaLvY/rvWKJz+k2fN+iSVr5nvtodRf1ud/Img8Ut8J9PAV08z8OX84qL3SWO?=
 =?us-ascii?Q?6yP9QJNdT8FCVCVATQNQCmggkhVent/f57LvystNvQkjKf3ylKaIQbko6VtH?=
 =?us-ascii?Q?g12fIKJFIlRkIUebfmzc4QHtoX7fIiqtKAE+8kien1LnR2P23/TvKoYHeFMp?=
 =?us-ascii?Q?pgSAb1Ocasv04dnQi09iSpZeUbgGD2Fz7x6dSGFvau3sgZGczOVQATUc+TZG?=
 =?us-ascii?Q?IQhz8SFUebMksSNnFn2p9m3M1KeDQBHfOAOk4XTIMu80jDOX30qpKsUCiCuh?=
 =?us-ascii?Q?8k3f9cP4yQ/TzbxVqJKbtL+14wKOtRiJNvK7PZaICOYsYcS0nmX3k1ZJddx4?=
 =?us-ascii?Q?6UUeOrwMnXCRyl4fW0njjIvECoHpnY3zOKp1cDmrOvrE0Bd4MnFHQktymWZg?=
 =?us-ascii?Q?U8ekIT8StYd15k6lRU4njHQGAI37E0R6/Di77L3rgxURIgiHFBAJKlTmSPBq?=
 =?us-ascii?Q?ptUeo1o7IHppdx8+/qoLZs8MdL2ppu+t/Aw0WO7ED+P6070hZ3XjxgKAL2tR?=
 =?us-ascii?Q?ag=3D=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 11db16e7-9144-45ea-429a-08dd3408225d
X-MS-Exchange-CrossTenant-AuthSource: DU2PR01MB8293.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2025 19:26:09.8063
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eAG2nZB29Jo7wQ6kCo7y2FqFn7Q7dYPqKLvt+FoOhSdW/YV+1QpWn3ZysfDxp58p2mDwoLRJAn9lhHRHdqd2KZLUbqJLgVeQ2LMgbZioy34=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR01MB9149
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Jan 2025 19:26:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114840

From: J=F6rg Sommer <joerg.sommer@navimatix.de>

Signed-off-by: J=F6rg Sommer <joerg.sommer@navimatix.de>
---
 .../spectre-meltdown-checker_0.46.bb          | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 meta-oe/recipes-security/spectre-meltdown-checker/spect=
re-meltdown-checker_0.46.bb

diff --git a/meta-oe/recipes-security/spectre-meltdown-checker/spectre-melt=
down-checker_0.46.bb b/meta-oe/recipes-security/spectre-meltdown-checker/sp=
ectre-meltdown-checker_0.46.bb
new file mode 100644
index 0000000000..19b19419ca
--- /dev/null
+++ b/meta-oe/recipes-security/spectre-meltdown-checker/spectre-meltdown-ch=
ecker_0.46.bb
@@ -0,0 +1,35 @@
+SUMMARY =3D "Hardware vulnerability and mitigation checker"
+DESCRIPTION =3D "\
+    Reptar, Downfall, Zenbleed, ZombieLoad, RIDL, Fallout, Foreshadow, Spe=
ctre, \
+    Meltdown vulnerability/mitigation checker for Linux & BSD \
+"
+HOMEPAGE =3D "https://github.com/speed47/spectre-meltdown-checker"
+BUGTRACKER =3D "https://github.com/speed47/spectre-meltdown-checker/issues=
"
+LICENSE =3D "GPL-3.0-only"
+LIC_FILES_CHKSUM =3D "file://spectre-meltdown-checker.sh;beginline=3D2;end=
line=3D2;md5=3D3ae5399e70af7be9b93f72568069e2f4"
+
+SRC_URI =3D "git://github.com/speed47/spectre-meltdown-checker;protocol=3D=
https;branch=3Dmaster"
+SRCREV =3D "b8f8c81d519435c0871b13f02b5c4a72c5bffd5e"
+
+S =3D "${UNPACKDIR}/git"
+
+# binutils: readelf,objdump might be used for deeper analysis
+# coreutils: dd with iflag=3Dskip_bytes oflag=3Dseek_bytes in some cases
+# kernel-dev: /boot/config is used
+# perl: sometimes used when other tools (dd, rdmsr/wdmsr) are missing
+RRECOMMENDS:${PN} =3D "\
+    binutils \
+    coreutils \
+    kernel-dev \
+    perl \
+"
+
+INHIBIT_DEFAULT_DEPS =3D "1"
+
+inherit allarch
+
+do_compile[noexec] =3D "1"
+
+do_install() {
+    install -m 755 -D ${S}/${PN}.sh ${D}${bindir}/${PN}
+}
--=20
2.47.1


