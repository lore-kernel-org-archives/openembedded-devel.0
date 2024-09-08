Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C16F7ECE582
	for <webhook@archiver.kernel.org>; Sun,  8 Sep 2024 15:34:46 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.100])
 by mx.groups.io with SMTP id smtpd.web11.32164.1725809673142184746
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 08 Sep 2024 08:34:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=ja0rxbai;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.104.100, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T7FP5qNgqGolqzB6F+XIgmcLQ2YeH/S08tsLSnCteWcaYEH+wVpD/5LQHDt56p1406bdb0Ycww4tXzqtBA5WbB7quTxW7zKpv9XnQR8ThU7cNX7Sjv2GaX+OfDmi6McE7yVcZ3jwOmbHj892w34BM+gx4N3L8mjLdJ3rp2cVcts89xAbGS75xnCWQOCep1NMm5E0LYUrkhVh3G8w0/VAn9wJsJreobhmgRv8ZBFomBouQFCkqhx4AfUdvL6PLfD/7dqosj77X2ntrtZrrkg30FVKb1kggRKb2AMG2ggKFhhixwC2RtFcTbqplt/9Pi2bF58ehcx8lf/zXUgrImOImQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K0eZ6vxFP/cCGJER0XVbGBuOlA7a1TMRs57aYPpMoPA=;
 b=aefBHY0Yiix+llro7lFI58rbMNKafswE+haCYUTCz1Uewuvdiav/gNb/6bVCO3kxtAgjvFvpoF0DHlWb5CA3M5068Thud0Eb2USUpXrbkKxukHg11rsBYvXveqVwcpsM1dxUInxOMs1FryDl0BhcImmUMS2LPatojpd8SXmVm6GapTDogCJhh5Nd7eejaPTIAqixf7SPQb7XdxYhvRX718ZlY/HQ7dUDTkLPPW0JNRG1sBq1cQGU/VzigrUFN8t0fLYZPJDtBeBSXnqNosDyPpPnTn47befhIef+eBPXCh+8IG/DJmtvX1ZOrJbJNvY8CCNiuKDgDTs6dM9VD2eeJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K0eZ6vxFP/cCGJER0XVbGBuOlA7a1TMRs57aYPpMoPA=;
 b=ja0rxbaiVc04G/tXjbhEZ/4TLQCIuvDMmOpK6SA0vpFiLD3Ae1884vv9ByVKAwbDOHFQjEqNsVXLEPH1pulpxbTEzipeXWYj0YOwtlCNL6SnTJYUQ+tVE8J8Pn8wWCBCie6pKsuxGpSEH7oW2iPsycljMrZn8qREWIFAd+q2eg8/ILnSMbJCq8g7yM/GtfcA0wCt6eR5a7+oXoeZgOBr22DhrBaQPmWx4CclezpxQu8bipd5Id5g1Z1m7HLhH0VMXsw+WCHtU+eEPSAicJuyiHMVww6vlYr5Q38gveXj/wPPfoKTw1LGjtiZKIR0qd7bTvdUrmBDKUMmlej/aOa7Tg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by DBAPR06MB7095.eurprd06.prod.outlook.com (2603:10a6:10:1a2::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.22; Sun, 8 Sep
 2024 15:34:34 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%4]) with mapi id 15.20.7939.022; Sun, 8 Sep 2024
 15:34:34 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-devel@lists.openembedded.org
CC: akuster808@gmail.com,
	Niko Mauno <niko.mauno@vaisala.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][scarthgap][PATCHv4 11/19] python3-colorama: Fix LICENSE
Date: Sun,  8 Sep 2024 15:34:00 +0000
Message-ID: <20240908153408.4114753-11-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240908153408.4114753-1-niko.mauno@vaisala.com>
References: <20240908153408.4114753-1-niko.mauno@vaisala.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GV3P280CA0011.SWEP280.PROD.OUTLOOK.COM (2603:10a6:150:b::7)
 To AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|DBAPR06MB7095:EE_
X-MS-Office365-Filtering-Correlation-Id: e562d776-fc81-48b7-37c1-08dcd01bbd6a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?dwqklxzs5bPCYc7mwWs0tnlM+E3LCFrYJDWMlLe5tq/wSFotRcLHUQWCvSow?=
 =?us-ascii?Q?arStw+URphJVikpIc+kAfqQmdBELYj8XZq6HNHfH2cQBeFYlxriv2RxjUluz?=
 =?us-ascii?Q?yU+fvI4CpHW8h7Z1RNqM74NJU14E68vAVTgK9fYjIfwgde53G/u9ylMq77Q2?=
 =?us-ascii?Q?FL8hVQHUmS7k6wzEaDMqiaYfqr+uXanj8+Oe0hpeYJgSEyIGL1fGenVDxtTd?=
 =?us-ascii?Q?SaBr1OPi2riJWT0xVE2bjkfnVE5T2TwVrmolu7ogNwZJTMM3jjEUVrE31cPm?=
 =?us-ascii?Q?e10us9zAfQrsAnbraX9qfYBl2mNyY7jixWlRvAz5q8cmaGRv7yq+qc/3tvvQ?=
 =?us-ascii?Q?RRRBSOXDR6ATMez0FyglVNjrBURXro00x2YLrryiuOyt6dGHOHh4kxxhMwPW?=
 =?us-ascii?Q?g5gR4l/zU6e3AwNmaYxHgPR9y0iZY8SMRXuYBmZs9QqL8Psgf+Iv12fcfhbn?=
 =?us-ascii?Q?FSXY6OCWUYWG2ihsJZHhemMfhol3iI8T69Z2sF69fo0TB7Tsm2k5Pt9VbDaU?=
 =?us-ascii?Q?EbnS65NNrn+gZ7sP9SAK3GMvMyd6Ar1LrhQDYiB5AhHTtMR/i8Sgul8vVDr6?=
 =?us-ascii?Q?K89+NddbZlzbi1b40l6kA+SLAh+agnAWDku6rZVFrcMfZe+MTW99a+F6mdtp?=
 =?us-ascii?Q?ZbQqwWEYYN7mOE4hx/y4pINH6Jedmy35DBYXr+NOzHaRzZjd8o8sj1QjyBdu?=
 =?us-ascii?Q?WW60udgKww81BHaOwgLamzTupT1RBUIIJ2Fc8mZiY5TvKY1+bSnzZi3kL9d9?=
 =?us-ascii?Q?ekaztPB2+m6Vyxgk+hMkQlgQtk/MxvQGHO18aZ1MWf9iSKD40UDO39bHPj53?=
 =?us-ascii?Q?olXWyTBsH1Wwm+ruavsRc3rckFhCoVrKgtKzURVg6G3q4wvT4n7gXXH9MVw2?=
 =?us-ascii?Q?VduIwyKoEmy99sUn7kWIGnbfr1HiGQD3RyCVxttOxRc3TmOZTIRafiyy5l1u?=
 =?us-ascii?Q?dcSW2+1IfSGkai+nwhX3yIoyHv2okuDL3niGKY7tx7G2kx05YGazqm9r2dI+?=
 =?us-ascii?Q?/6xcrx7MK8XSycFWlK/4svbJEH2NNRM1Ee6HEexEB5Sf96VwejfsE0ZzgJbP?=
 =?us-ascii?Q?Fx9nX39ahOksu573pd+lw7bwqN1bPWQV7QiWj2JwVoveAmNQIIz5xvQfMXTC?=
 =?us-ascii?Q?i8alnVnq3FXia6TZpKER95LewilpBwwxJv1ty6EeYCyFcMib3vpddZ2U4Jte?=
 =?us-ascii?Q?e072eEUE/lPf3xFjTFtb/28JDcBsxyjYWcDpWXGn24u+1CUHskQ+TfU5WXKJ?=
 =?us-ascii?Q?vYf7zMiunqVUuzRU66edv125cQ8Hba5WS5v4sBXWfAewOtvc9FSI2Ir6nb2V?=
 =?us-ascii?Q?R0izAIeF+EAuRV5YDB6Mk5gKH/W4VTZhAyLaWbh6VEH8KOkyzGQkUhfP7iif?=
 =?us-ascii?Q?8KqI98Kzx4eiHr+3brZqCtqT/L8guHml5SBeTFXdcpp7tt8ckg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?8mJlXJx1LfqPq1DW6U+Lp2nUZ0qyIsJqJjeHKBX1SXQBCh2Ev171xWesD8Jv?=
 =?us-ascii?Q?fxQ3mOPA/d5qtzi6+BMuqN2EgYMFfNYeigt3VZ2jcirGzzvdToXR+PX+lf6A?=
 =?us-ascii?Q?OAaGt6JqKvrkmMDKo2aVFijy/n8GB4lVu91QxBSj/t9cyU2FJmEBpiXPzc9P?=
 =?us-ascii?Q?B6HpI61n62uXmWI2eTfIL0AZWAUBdJ/qpYp5niO0vEsLMJLVDkcoBORcPI0M?=
 =?us-ascii?Q?XcLP8cwIAeb4yS3OVxyXQdzrKGfyzQ94jIMQHIMmYHrFosjKxSFj1SNHdpn9?=
 =?us-ascii?Q?CcJmK1+XS7Wdbk1vpSUbirjbufwSgrpnNIqnfeAAsq++eAOdeHaYvX86fLlp?=
 =?us-ascii?Q?ur1zOAdDcUZaaAs0O1eTnelqf8L4pEHlauPw4H+RQiCGAgvDs2UL0ijU6B8R?=
 =?us-ascii?Q?3XRo/yXXHXBTh5eXxAKDp9Xoi55yNz56kuRYg7P6ebCAI+CSe6QmEpu3XI9O?=
 =?us-ascii?Q?uHba9ErT81PB8wRC0yxtld+9QmKoDsyGjJGTtPHtyafu8pO6D54dkCt2550Q?=
 =?us-ascii?Q?H/ScO6beUlFJRcKZA9MzHgLx1JIhLfKz/ANAirBAMFWCLz2qF/eQ9BUqU88P?=
 =?us-ascii?Q?tAyCj+ueJ3faR/tt1WWQ0DCdabR3cbCMBZHtwWmb3EIRls/0NLEWWkFUKxxQ?=
 =?us-ascii?Q?NayQKVlGVrG4+scj2QjIJTFGRRG4AScbulAF41kbXBL+zyH9LqVxakYXLD3B?=
 =?us-ascii?Q?PYxo4UTauTfjtShpr8A+4pcPuRLcZnCEZ81OAxV4XjacauJo+MMLHdCGgHkk?=
 =?us-ascii?Q?rkC1PTAEErOLd7JcaVETRmi994dDrGnZn6mMEzAhPUEWewEeviAZjbqb6OOb?=
 =?us-ascii?Q?UI9em1ERe9fvENakEgJ4BaILz4Wbfo+AZcDHI0fQzkAPv8YZyxeFFaUeb8u/?=
 =?us-ascii?Q?+Ftuy5ydYay4W6oa0TU0YCw1KMJmHS4h/Mm+lbiyng6HY+ZWV469a5uRVk+3?=
 =?us-ascii?Q?b/dVad2ZexNHcqpSzKKzL3Mm7VAvm92OJy1dKBV1KG/Okxytjf8zGiys5HpH?=
 =?us-ascii?Q?fW16oN7GItF7aD3xbAX6VBFhXo/MbQjPj5wyPvCqiRB7bzIOyc2sXNn8I8Mz?=
 =?us-ascii?Q?+TITHRizlnNfDYNAgap167xsNiHrlTXHgWroeDXvr9yujQOE8wm3aI/QVG+d?=
 =?us-ascii?Q?LEA0vTHkGxc73Grq09rKySwI57TKFf5OfKM6dyBBRUfEpxjg8fhID+h+wGoC?=
 =?us-ascii?Q?iFvc2rS7HNqwe11RNSLipOMos96sEPXPNu0S2RRwHfhG1lL05O4944RxKb+c?=
 =?us-ascii?Q?AD2HM4yf1lNYR1m5klTu3GqwvpeJN8CkqXXM/d9zme9mX53CGhpavPwQB4bt?=
 =?us-ascii?Q?/s9PdOIpobiU0fT1/IHG5TrQVcSVIPsG5xXJmDNthwEC1GOKs1W37p0MnYQP?=
 =?us-ascii?Q?SX2q0PwchgEnImvDG33M00PgMvnkJbIqfOlqGnks1jo0M2CKTpcswK9Luu6T?=
 =?us-ascii?Q?sYO30260ZKu97QU0ckJor5uPh/C3bW93mpSoLjR95WFJczGb/vBJJCgfJRn5?=
 =?us-ascii?Q?D4rHPkgcUD/xdco2L3EnIUi7mTU9LFG1kG698uHJxKcaDJdJsSXRYvUjhcMr?=
 =?us-ascii?Q?g3/N8nexlq3egbw/oIr/uc5c78tJJ8q72UCSx7MN9it5tk1NydotdOJYKto8?=
 =?us-ascii?Q?hA=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e562d776-fc81-48b7-37c1-08dcd01bbd6a
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2024 15:34:34.1651
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xC1dFhG3VIDG93PYNqp/LKWwZ/pNPKjt1Ltm9e1LzTuX+A+ttuba2vB8gYTgmZA5iC5r6snU32NQL0xy9ShANQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR06MB7095
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 08 Sep 2024 15:34:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112150

https://github.com/tartley/colorama?tab=3Dreadme-ov-file#license and
https://github.com/tartley/colorama/blob/0.4.6/LICENSE.txt declare
that this project is subject to BSD-3-Clause license.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/recipes-devtools/python/python3-colorama_0.4.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-colorama_0.4.6.bb =
b/meta-python/recipes-devtools/python/python3-colorama_0.4.6.bb
index 0f364c424..387124403 100644
--- a/meta-python/recipes-devtools/python/python3-colorama_0.4.6.bb
+++ b/meta-python/recipes-devtools/python/python3-colorama_0.4.6.bb
@@ -1,6 +1,6 @@
 SUMMARY =3D "Cross-platform colored terminal text."
 HOMEPAGE =3D "https://github.com/tartley/colorama"
-LICENSE =3D "BSD-2-Clause"
+LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3Db4936429a56a652b84c5c01280d=
caa26"
=20
 inherit pypi python_setuptools_build_meta
--=20
2.39.2


