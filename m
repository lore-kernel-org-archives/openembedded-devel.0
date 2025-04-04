Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 001D7C369A6
	for <webhook@archiver.kernel.org>; Fri,  4 Apr 2025 08:18:41 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.122])
 by mx.groups.io with SMTP id smtpd.web10.6510.1743754714572896958
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 04 Apr 2025 01:18:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=1skrmxMK;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.130.122, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UNadndH8fajGeo02WvwmFJNCzT9gOv/gHOr5zR69+W8JmFEl66HrTSmnfXgqPiVAq2Wqjet34HQBHpEzklXP2HeMvcoeqgzUqyTJmktP3YdzkYc9Q1vXP3Y7oCSeQugyJbzp9JrOgbZQEsaHme5t2M1Cls8KcUPzLz7R5zzDtvYWQ5Cm+aRBhKTujUrDpPhs8wWLFDopDMBV3eWfY8637oU7DgJzhLU48Y1SMXOhdOaGFaVG4YxWpnSeQ+0n97/jAkfncRQPfNoCVdVho1JbWKLoP9Vv7xy1mrjzYhzElsKRQx1FRkqR0QZhht6xctXAALCd0b2B/urYZdu3QlVQRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DTXdyl2H4Kre66Nq7w25uZCB3X3wiwlkQPTmeoVhQJc=;
 b=tT6wrJamZK5w/s5V9jpcXYvkKmpmUhv3H71XqGkbxMsJh0x+9pqo39rC7D2snn9x0fZDOizf2BQy9TXH7ZREoMkjro4uOs1x7Df43TmCeSe5alzAmCuD21Ndg6J9iu7pVi50a0ne00Q7b4hFWVqPLIjq5ANgyXTPSMO9c3KNYoApVgTUJL/DOcvaw0ippecZTLj7HuYjcCf+ZKIjQPmDFQVeDqo01qQ52bdyX/Z7Dcz0kGq0Es1q+M+4KsCCzoDTY4y6x2tsjCMPaaeqtn2s3dj0w7aWSgamOEtsC5Ytvzzw/cKBkytTO4/6iiHW/uvzs8w5NcxVuHCurW4X+loO7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DTXdyl2H4Kre66Nq7w25uZCB3X3wiwlkQPTmeoVhQJc=;
 b=1skrmxMK3+KkKgufvwfn7bzGMZ3HpXGtcBvZ2GV4Ym3fWeVIyIli/22mpryLsD0sfxl+oHFT26WwD1dnctRk63vL+Xc7olFnlL203Laa5B7ePHCFqHc96pA4u565F456tgd+dxRee7oi4S/oF7SOmT7g6fN1UxCQPG0lbsGj+HR4+TMpIReiZ+Z8QHaMEjb6DCyPduc4sKP2pFR1TH/fPyHAm4xvFTAfiqpUz1iKKhCON/WJzP7bl45azgIgsHb0fwh21iHTCfCWBMKZT0kyGnaPu5orxm5HcxBqsRF0FkxWHuaMRnZhIJUIatJfVe6gjRMMKiMryP3pDcMzSD9DOw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by PAXPR06MB7471.eurprd06.prod.outlook.com (2603:10a6:102:151::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.41; Fri, 4 Apr
 2025 08:18:32 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%3]) with mapi id 15.20.8534.048; Fri, 4 Apr 2025
 08:18:32 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-devel@lists.openembedded.org
CC: Niko Mauno <niko.mauno@vaisala.com>
Subject: [meta-oe][PATCH v2 7/9] upower: Support using alternative runtime D-Bus
Date: Fri,  4 Apr 2025 08:18:03 +0000
Message-ID: <20250404081805.663425-7-niko.mauno@vaisala.com>
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
X-MS-Office365-Filtering-Correlation-Id: a799db34-ee64-4909-cdbe-08dd735149c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?JVn37JkN95/g8CbNOZL2gj74+XhbVyrjT7fRMB6xQDEhRj7y4fVMqNkxD41M?=
 =?us-ascii?Q?M6APlMLjvA2Kl2AGfRrEiuOBVdySNy/LolvZaQsrZy2dseIMmhjSSQ6Clab+?=
 =?us-ascii?Q?qOZzw9J8E4dnBVsSD8J3FrfpvEHSSMb3Fgh1cjGj0IqJNvWF3f++FtpViXYr?=
 =?us-ascii?Q?k/soKM4qRS6qpU23dwe3GlcuRhzUjTyUy/UiqJcj+U/fM+b6XptWC8aps6BJ?=
 =?us-ascii?Q?4wVH3LtLjwIKiL3F/V8w6WOWU4TFCVycas0nmzFH0T67SHNTwopvhjf+mgNS?=
 =?us-ascii?Q?duVo531e+70SxPCYPS7SwRBz6fizy+MMNPqdxuisWJOvEJ3DMygO9QS1fdFK?=
 =?us-ascii?Q?KE0hHsLITf8jjBMSz14PdueEBVimGHevVcEW0iIEpYjImzlgEmxAnDPc4Ig0?=
 =?us-ascii?Q?Xz64Dch8GyjABO4rkLXFibc6Y/bUwiiRe05ynz0CwgG57GKtYoB9Gb5Opz4B?=
 =?us-ascii?Q?cFegD93meCKdnFWO/QXYCnFi+d6LMGUrjIwJ+CEv7TkanFGGhUN12JVlnSJQ?=
 =?us-ascii?Q?CQcrGTY533azoPyAElWTn0EvRqLkbahnyO9ZOg0ekaJvmBxMMjE8o1c9WRRh?=
 =?us-ascii?Q?3OFH6rOCTzjeQ+Kd2u62x1713PjqMBfBLlcqi4DXdSzoh8x3oCPymBWcgrLw?=
 =?us-ascii?Q?eD1NEri9FXG9dtR4XbzXKYtQcyYRylYYbJLN8DarrjCyRptJ55b15JHfJE8m?=
 =?us-ascii?Q?sHtpYcazbMl59dhI+eCk2hW27UCvHU7SeVzasx3VWBr97mYybsvVi7WsYhBl?=
 =?us-ascii?Q?Vfaf5OikKQwq0PeWk0+K+AX9dlEcBgN+SZL2Ybz1x/HKxUoSfivlj4M9jCQ6?=
 =?us-ascii?Q?A74FuQb/x7MdfMa6tAXgjawkL8e/VFHR9JzZzBYDdbKgAO07bPsS0qKw5ete?=
 =?us-ascii?Q?0wDHygTDImnHVSX2iInk10NOF2Zs66Q474/Yup68e4wTxK99g9FUNE9IK67s?=
 =?us-ascii?Q?MNhwtteLK6Tnd67OAxLBi6qPDrJD4oyGsT4i0kYoR8D3+6/7saKOFTmPztJ2?=
 =?us-ascii?Q?HGSkKP65W2CA7mwjUzhFx/SZiVA083+EiOKIIn4XOrR7SUrZZA3AJ2ZTEBLb?=
 =?us-ascii?Q?vyq8uPMtFIwFce8J1D6baaxZz+Fc5ICTbsdQR5JSnYo15qCQrfQ0A31zIGjW?=
 =?us-ascii?Q?OU73PZTwLGn6c348LeKvZ6iK4la1UxeDU/QuVHbyiibLodA/CExpTv/Znewy?=
 =?us-ascii?Q?RypjNQa8OkgEydQ6AV6p8Z9BkeDkmdZfMJgoHXl7C3wr19w6i9bWLymdX5MX?=
 =?us-ascii?Q?AqOnKx9YuochEyGfMxdv0LEIx4WMk8AZ8174ZKi7uCqFYDiaXiqD8E1wnvCn?=
 =?us-ascii?Q?LSzkxSUsNbXJkNon7jUQBWPijbpO8oH/AVKswJmLWQ5Rp1tYt/4nf7uFnw1u?=
 =?us-ascii?Q?0x6eir8ci/lmMfdiHlG1H3v2EWEUwSdTfV+foxD028XKyNAEj0WpF/WSe26Y?=
 =?us-ascii?Q?LJfU7HWSNOI2sKD0BJayqHH+PPgjzqDk2fEXW5rBSSRW+KbVmO27ow=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?/zsumD3BZ0uWKAt1PHNhhCvWbYiThipUy2X1pOD1xI5wCsAHUgzzkc7XKQRm?=
 =?us-ascii?Q?fFV6wYTWhiivh0JkN9bOjGPPFqXTsvW51Kl5LD9VyKYz97w+6UhkeoYIKPWZ?=
 =?us-ascii?Q?2Mv/C8Fadpms6m4ejaZp5+lSgUBAvNUPK4wsTBo6k4SKt8B0T/PpyN8zxTcT?=
 =?us-ascii?Q?hOncM9GRxMhL3tO8vyB6GoMwsoNMPQiTx8IO1qRINM6laFJewXmfE0csqZ7a?=
 =?us-ascii?Q?Y7+SMHO84POeAbcn21n8o/qpIiEM1WY1gu7/ccURbfldXYH/8psHpsAqZRvn?=
 =?us-ascii?Q?nuwLqM/CHHr4fXA1Pd860HkqaeTJPn+Z2338DMG6gy15aG5w6LsC5exF4u3O?=
 =?us-ascii?Q?b+pDFtJvTbvWg5S/mKK+m795SY1KnaZwX+gi1a1cxPDBa8BeqZQDFKjKVb9z?=
 =?us-ascii?Q?7Lm39XJQ971cOauOCUe8LkGdmcBCWuiurezMjJKkJ04j83JVQVeLtXI7V+kd?=
 =?us-ascii?Q?SVeDENJ7gHSaLyY1qRYok931vlH3NPqmeoVSmHO4QEDYqCfB7XfXINJvMm8v?=
 =?us-ascii?Q?/Z+PWG8cYkP93qjFWJaocJ+Ma699gqEQlffn1Vd0QiYhZJUMJNRPuBRMF3Tr?=
 =?us-ascii?Q?VO49TBQPn3XIItC+Fl06xJzpVJ97P9fQ7dq9QxBtwS06PSL/xLgsOvwSackG?=
 =?us-ascii?Q?P03MN72uzYsKG6CqjChwklCMHtSqlAP3qKxWHsh/N7TVhyIKMYrH0npXGmCm?=
 =?us-ascii?Q?ymVSxDS0xoPzsZMorOVE2i7HkAs93rF1aQFe6u8Yal5dHV+eHdV1A1rBc1ix?=
 =?us-ascii?Q?AoRjXH+wMFjko8e5Llcrff5qsdMjzlQ9R1tqWAE2l2wfZRqMOMCZySbXONwb?=
 =?us-ascii?Q?6JWiOypOxtr9AFTKIeyx7S3tmusWFrxQxOn+nd/9+EirReYByTyvIMaPL4Ci?=
 =?us-ascii?Q?SFMN9iwKiOrtGQJ/SuE1wDO65/0n+N+ds7xKxDJvaHbvLJUZeWd6kcAuoAFi?=
 =?us-ascii?Q?jLjBZrDOOQqwY25oLqgp4//9cr8mO9/HSMKO/2YubO4OFNENUdyiDnT5sOCr?=
 =?us-ascii?Q?VODuCB8igH2zMhsOjvMDM01bK2G53lqs2iY8rwNi7/qAEvl2l14cU+mYrtcN?=
 =?us-ascii?Q?zMChgqz65t/BZ0F0PQObYJLF56MQ5aSbypJiWX26zy3aORZ0V2VTpVOHA2Rq?=
 =?us-ascii?Q?jzj/rPtby5azxi7h84sTPampQ3yxdpoZ6KabeWdb6SXSFJ61xyytGZyBKC9c?=
 =?us-ascii?Q?YhPaaY9VfX//UCkgSNuRX6/982TQNiJc8E95UVwdo3c+8JIKZH8hTiLyAm7E?=
 =?us-ascii?Q?DMcA+NgkVNsZFm6LFaJk3rHfpFnFS02J8UNkrak9OtfmC8VYIw0rvm0dRu+6?=
 =?us-ascii?Q?1p3cM8TOvIU4QHVHkNpofnHf7sC+1Z2DzGEq/gjBWyOQi3s/iuZp6bu/IfpX?=
 =?us-ascii?Q?43U3v0lXY6c7kDASJhtA8LY7Uaqbj4wE7WwVssMlmbQoQQuOcnUr4sOtCpjF?=
 =?us-ascii?Q?EZMm1WiIMwdmm0BfM+VgoJTpVQSDy7Jjvx2QC167LIPDO+xaf6Vdsuz/r5BE?=
 =?us-ascii?Q?W3CwMv7snzwYrfAbnNna9Lmr7xJyTWyjxk0PnRCcJq4MdnzFPrfwtjEWRJaL?=
 =?us-ascii?Q?5pXerrc36KpvtxzmGV+F9xUnQ6pDEvUaT8+Ofix0GSG34k2iv8XVtXTasR0N?=
 =?us-ascii?Q?3g=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a799db34-ee64-4909-cdbe-08dd735149c0
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2025 08:18:32.4953
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GpuZlKi2vzkIqYx0VaR+MKDxo3KkfpmO/S/CLcR1UNiQ8Cgwtv65yqK5GdpVRWbqWoU22D8DOk8mYcZLtfsA1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR06MB7471
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 04 Apr 2025 08:18:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116567

In order to facilitate using e.g. dbus-broker as runtime D-Bus
implementation, change the Freedesktop.org specific D-Bus runtime
dependency declaration to honor oe-core's new VIRTUAL-RUNTIME_dbus
variable.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 meta-oe/recipes-support/upower/upower_1.90.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/upower/upower_1.90.6.bb b/meta-oe/reci=
pes-support/upower/upower_1.90.6.bb
index 6d5fa70162..5bac85c57d 100644
--- a/meta-oe/recipes-support/upower/upower_1.90.6.bb
+++ b/meta-oe/recipes-support/upower/upower_1.90.6.bb
@@ -38,7 +38,7 @@ SYSTEMD_SERVICE:${PN} =3D "upower.service"
 # don't start on boot by default - dbus does that on demand
 SYSTEMD_AUTO_ENABLE =3D "disable"
=20
-RDEPENDS:${PN} +=3D "dbus"
+RDEPENDS:${PN} +=3D "${VIRTUAL-RUNTIME_dbus}"
 RRECOMMENDS:${PN} +=3D "pm-utils"
 FILES:${PN} +=3D " \
     ${datadir}/dbus-1/ \
--=20
2.39.5


