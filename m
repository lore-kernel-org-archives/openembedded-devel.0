Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C6E9108E1FA
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 12:26:47 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.88])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9895.1773923198243198193
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Mar 2026 05:26:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=GZIrLfcy;
 spf=pass (domain: navimatix.de, ip: 52.101.84.88, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GQsMls0xDgh9KYU3PLay9trfW0e2rA1AItJpikh8gzrCedRt4wzKeKJG9tz5qutE57HaCmc5uOeL3YJemh5Zk4TjU3y340RODcqqGDlY48wDBGAeHg1xpiusG7Xd5Tea1nnCcw9Pt9/LiBNHIBmhAYxnB0HbHNtLWTkeW60+KinfJ2K7Ss8yhjagxpe6lePucdg9iIXJ4PnFjMrOATdF/8Di2dtzj3T6NHZVxsp+iHZh7Wvi1/TcorHcDRcKOIWalhl4PZJFCTBJGu9K6oMiBXbZRTmxUx0hoOgMY70f12LDaFeZfvijJZO2HYPm/c0xBfne5M6M2d7qS+7VT43EYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FD6w75o48cd1TpR5OU1UrMI1USSMYykXYzkumRUiidg=;
 b=rohbXha/nQkAFyMFanqOVkNlsWoWIZKY5N2lVXzMqfIV9yDn8x6Ir887pA7IttFxYdu3veL3w5BEMvq54r+Xrr7j4z+U5FgTCIFRcZMfVBdJA0EO+UDcJ4S1nYIobVnh/Vygqd6htB3teHoVKqg35MlLCdM1EY1ZGKER/RIVlpO4c73LpoaaDs6jqKB4c7RHRBvVBsUq1JdQsjMied6XOiyCR3+g42w3SPmCtQGYj+daugsa0xgOyBW/qs0CL04/jjifRyaJ/mFKyC+3OwvYWhD1bg15YulLc2Cp+7e2ys02wSRBQTvu7QhWxAmJffUDmlrhThmBzyH+UFEN6puYJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FD6w75o48cd1TpR5OU1UrMI1USSMYykXYzkumRUiidg=;
 b=GZIrLfcyXcJZYXFrI9prxOmbppfRCRA1SPWp4DsOmdR3vH9NWG6HV7FWFLQE6xx7t7ZhmWlbXI8zB/u0g6bSFZEnFhSd3Y8xjknUdZmm8afEzEiH3ODD47olLw1MpdU9Lf1EudOKcMgGjSiq2Q35UGeRu6zJDH3q7AySFQij1G0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8) by DB8PR01MB6456.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:144::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Thu, 19 Mar
 2026 12:26:34 +0000
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 ([fe80::d5c3:2dea:3d98:25fd]) by
 GV2PR01MB11835.eurprd01.prod.exchangelabs.com ([fe80::d5c3:2dea:3d98:25fd%3])
 with mapi id 15.20.9723.018; Thu, 19 Mar 2026 12:26:33 +0000
Date: Thu, 19 Mar 2026 13:26:32 +0100
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: openembedded-devel@lists.openembedded.org, joerg.sommer@navimatix.de
CC: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
Subject: [PATCH v2] spectre-meltdown-checker: Update 0.46 -> git
Message-ID: <3064a43d17486c30239b4873d08e93c23bd2b914.1773923191.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.53.0
References: <189E3AD0045FBB01.2964266@lists.openembedded.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <189E3AD0045FBB01.2964266@lists.openembedded.org>
X-ClientProxiedBy: BE1P281CA0053.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:23::10) To GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR01MB11835:EE_|DB8PR01MB6456:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ffb2757-6b4a-4aa5-93e3-08de85b2c1c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|1800799024|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	6NsX3ntMm/tEPI6LJhxgTyE/WR0SK3sayZotfIsmCwOS5kwf1k50JU/A91B4Ji0oZEYWLDue5cqbh6+5dxLZZhpsiMTiPD4GiHlk0m9LPRZWT134lkO06i6v1SSMDnHxNqmVuaNPSQsoI1yGbUcRA1cr29xRrGF1hZf68Fe0Gk5ld0PoDKpZwlYIhqQid4HliEx61cHPA+PW9vJPFDt+7RyrPqTc1GuXGePIfdpKZ0AOzmkWK4Fn9EkPa0cHHIpdeIu4/dJq1U+PE7uMDzegkFtqq+A8JOF/NiInqrAYy0IeVoKqGN67rtrCF36d3o5kSte4+qiuthZBzkxQcR0k5meUcoMWdIpblAttwIo6QcqauOHfUYnU0q3b2gqAcVwE9OBJQA8sNUD2jRyobHE8X7+HKswnbAUz2Fd01zxTpvnsnLYF2ahlh46GcToU80O1KqbqywHafq1/9BRPf0X2t0xiAi7L9YSsT5gzo0W2WBSX2Shtfbe2e5gr+ecYG+joyUQBfAW7FT5cyXB/oYXnj3bq/N0XFn0S+ox0VxBfPyDLLpmAIF5zQLjZGLX4V7LmeuRH2MeabKDWXvrtGC/E+FqEdG/kAl/pv82Xs51wl9Jzp9FhnWZqXlA1ijaUi6bM3R20lbdYQSP3L++pLJcAmAU0PDIEN32dXEQFotG9ZJcx/mRKbhLChs+4UpbQ/JFT
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR01MB11835.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?hjBSibj0C5ubDt/e+HYwS7BtE6tZF1ZUnjzJm0joOlNLBTRzyrfNrCYHPxMR?=
 =?us-ascii?Q?Hm4IP1WLQm8fi6x6+azn3WlaILcHS6EGfIF4s7lWZUquIZaM+cG/7qyD9yYE?=
 =?us-ascii?Q?yW9/AqBvEeC5cRu0wwJJBfj2YCQCvgJptdq0jXc4IagjfRIqhte2A/k6pYjk?=
 =?us-ascii?Q?fr9ASUnwwmH2exVKgAaYmP2YtSZr2lDR3oqZFI6hpQ71/NVUoKyLoNz3vNtM?=
 =?us-ascii?Q?r8Kiha2OZmx6xl8hBlURdm70osYur4+0EwRtWJk7aC1I6TXBliIliXEe8Vt6?=
 =?us-ascii?Q?rPe8WyA8C8UVYSX3cMBwKx68GlgSmo4Yw5n5abDc+iG6zaFtHXrjCxLEwSoj?=
 =?us-ascii?Q?+50gEeLizVVBKgmphDATVGWXoeCWT2+r1s6h/CbHf6xmLnGcxfWUufLcBBjl?=
 =?us-ascii?Q?Vu3dNGwoqh1gk18VUEHO+oiStTHJMOB7OKzBCZiBjw+DpBWDbENsSFbmPsPm?=
 =?us-ascii?Q?h+baSNwpQNXw0MNkP1hkyT/Xc63EFhFuE6RCqPcY1aRE6rdYZx5sTj/+IK7B?=
 =?us-ascii?Q?C0jhkKy6M44n9myZrlY992BrBic0NhL6JYBb29P36Nz04guC5gpEf4Jb1Pxv?=
 =?us-ascii?Q?m3IEQxTZD2Tyt13RiAsDGWMSbCttbYP0Z3TsrB1DgTcuQTPKaKP+42QwRvq2?=
 =?us-ascii?Q?CPv6CB13+1p3HPDUxmw/bPCcS7hHEPfDUpYF/5VWgADYAJLCEnHqwyIvybt9?=
 =?us-ascii?Q?7zOhlkFEQ7DgSR5sYqRqrrGvg8rZ4tF790QLmdcM4v0opn7m8/+lCVUC9lnN?=
 =?us-ascii?Q?RGR6pWUpH0FGJBs/mTQemdhUIPtja9UKnQqwHYoiJ2HMQAUUD4AzxDXhWWur?=
 =?us-ascii?Q?EoykuYzyPkIytMj5w2dR1ea7qzbSMD1iAVSVFIqKKGiY1tBTbeXp5bFULzss?=
 =?us-ascii?Q?xSPtoar0TIGmxb2nqLr6Da4M6PmaroFIfxpMRIuo0woYVZhCUf6Qzs5WVCNG?=
 =?us-ascii?Q?ujpuZQB7zLoRaom/npPtgVrgUAhy4aWIhoaDFdGtKGGsVU5fgTrMR5A+l9Q5?=
 =?us-ascii?Q?NLeJV/DLxYWLVReNIQcMOVrx1TJ6AHAB4rE9ajS9a04qVssMhiHEDFSMW1I6?=
 =?us-ascii?Q?2JifqfVw+AlZY3zAvJuSXmllMNX3lZhCiSy40ailkH3pW+FZrqfDimM8iMFV?=
 =?us-ascii?Q?RtlaSqnJh6q75l3JJ67p8eC6QH+QhLhHDgd58YDFBbNXAO9CYaKggkqaeCui?=
 =?us-ascii?Q?TkHnEOwqKtKDUKMY18EMQJ/RK0a0eHfgh9ozgEMymhHchBTTq15WGmX/v6jf?=
 =?us-ascii?Q?LiEozxtMLmiSLcMfk86Hhl9JmijRhXznsCttvmFWt8ZJyrsVjth6L0wKnyLA?=
 =?us-ascii?Q?/f9PnZF6KqMugt2nWT+xGN5rgw42UTZkhXQiDNHs+VgYy5EfTwK0L28Icbjj?=
 =?us-ascii?Q?WHyMMAQwCYORojMreSLHixTzUzKgt3fjFZ0YvHByUmG5bhSenHk7vAqV+aFI?=
 =?us-ascii?Q?OPT6sRkvhu1Oe+nGWYmqbFKhwjv+ECI2x31uadbcQ8YZTwlZ63yn7mVqFjhu?=
 =?us-ascii?Q?c6yI3hVZ3Y85Ci/HyDacgZ8cJb/V8+uHYPSMEYfw1OWrDKW8OzQdXYLBFyJW?=
 =?us-ascii?Q?fQmdB/D2KmDlMV9mKHUulpuWa26m6BmwVYBoLt2ERDaFZu8tiPGYei5Ihcnp?=
 =?us-ascii?Q?BXaQvMy4HFpT/U7CrfJlN+lDwjFXj8Z2kHjf9mQlCZkI8pyrah7K6OooxxHe?=
 =?us-ascii?Q?FpTLCFxWUI7vsDlDdq8W1B8vIg7VSz917QHwfMSmFppMZemi92rX4oYa+9R7?=
 =?us-ascii?Q?guHoVuQ+kmKMKtHPDFnQrQIFrZSQTLU=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ffb2757-6b4a-4aa5-93e3-08de85b2c1c7
X-MS-Exchange-CrossTenant-AuthSource: GV2PR01MB11835.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 12:26:33.7694
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7XtHtxl6IQbTpKg0EAGdE0A4rWvav4/1jdKSzLceOhW02V0jVTqW58TKCZTuUqryj3QkaMmtJKskyn3nCGOqFHJG8gEf60dYP6sKV46iyow=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR01MB6456
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 Mar 2026 12:26:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125399

From: J=F6rg Sommer <joerg.sommer@navimatix.de>

The git repo gained some bugfixes, esp. for arm32. But there was no release
since mid 2023. So, use the git repo.

a20641f fix: handle non-numeric ARM CPU architecture values
d550ea8 fix: harmless 'dmesg: write error' that could happen on some system=
s
8e33a1d fix: set cpu_* vars to a default value
68b4617 update: fwdb from v345+i20251110+4df2 to v347+i20251110+615b, 2 mic=
rocode changes
9fed5ce update: fwdb from v344+i20250811+1523 to v345+i20251110+4df2, 45 mi=
crocode changes
72bce72 chore: really fix autoupdate workflow to avoid useless PRs
5f18e67 chore: fix autoupdate workflow
a8466b7 fix CVE-2017-5715 reporting when IBRS_FW is enabled
b99be23 update: fwdb from v296+i20240514+988c to v344+i20250811+1523, 128 m=
icrocode changes
ee4cfd0 chore: add autoupdate workflow for fwdb
c2c60e0 chore: fix recent shellcheck warnings
bae43d8 Replace head -1 by head -n1
34c6095 fix: Linux 6.9+ changed some config options names (#490)
e806e4b chore: docker compose v2
388d44e Fix Retpoline detection for Linux 6.9+ (issue #490)
bd0c7c9 fix: typo introduced by #483, fixes #486
d70e4c2 fwdb: update to v296+i20240514+988c
4e29fb5 fix: ucode_platformid_mask is hexa (fixes #485)
0f2edb1 feat: blacklist some more microcodes (fixes #475)
8ac2539 fix: microcode check now supports pf_mask (fixes #482)
97f4d5f feat(reptar): add detection and mitigation of Reptar
9b7b09a fix(inception): continued mitigation detection
c94811e fix(inception): Zen1/2 results based on kernel mitigations
3e67047 feat(inception): README
ecee757 feat(inception): kernel checks + sbpb support detection
fb6933d feat(inception): Zen1/2 IBPB and SMT checks
dc6921a feat(inception): handle sysfs interface
3167762 feat(inception): start supporting AMD inception
44223c5 fix: bsd: kernel version detection
dbe208f enh: downfall: detect kernel mitigation without sysfs
aca4e2a enh: move root warning to the bottom
c1c1ac4 feat(downfall): detection of the kernel mitigation relying on dmesg
ba0daa6 feat: downfall: add kernel soft mitigation support check
227c0aa feat(downfall): add downfall checks
8ba3751 fwdb: update to latest Intel ucode versions
d013c0a doc: add kernel src as additional ucode version source
cbe8ba1 fix: inteldb: cpuid 0x00090660 and 0x000A0680
9c2587b enh: when CPUID can't be read, built it by ourselves
2a5ddc8 feat: add Intel known affected processors DB
2ef6c1c enh: factorize file download func
3c22401 chore: update disclaimer and FAQ

Signed-off-by: J=F6rg Sommer <joerg.sommer@navimatix.de>
---
 ...tdown-checker_0.46.bb =3D> spectre-meltdown-checker_git.bb} | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-security/spectre-meltdown-checker/{spectre-meltdown=
-checker_0.46.bb =3D> spectre-meltdown-checker_git.bb} (94%)

diff --git a/meta-oe/recipes-security/spectre-meltdown-checker/spectre-melt=
down-checker_0.46.bb b/meta-oe/recipes-security/spectre-meltdown-checker/sp=
ectre-meltdown-checker_git.bb
similarity index 94%
rename from meta-oe/recipes-security/spectre-meltdown-checker/spectre-meltd=
own-checker_0.46.bb
rename to meta-oe/recipes-security/spectre-meltdown-checker/spectre-meltdow=
n-checker_git.bb
index 48f9a738bb..e239770584 100644
--- a/meta-oe/recipes-security/spectre-meltdown-checker/spectre-meltdown-ch=
ecker_0.46.bb
+++ b/meta-oe/recipes-security/spectre-meltdown-checker/spectre-meltdown-ch=
ecker_git.bb
@@ -8,9 +8,10 @@ BUGTRACKER =3D "https://github.com/speed47/spectre-meltdow=
n-checker/issues"
 LICENSE =3D "GPL-3.0-only"
 LIC_FILES_CHKSUM =3D "file://spectre-meltdown-checker.sh;beginline=3D2;end=
line=3D2;md5=3D3ae5399e70af7be9b93f72568069e2f4"
=20
-SRC_URI =3D "git://github.com/speed47/spectre-meltdown-checker;protocol=3D=
https;branch=3Dmaster"
-SRCREV =3D "b8f8c81d519435c0871b13f02b5c4a72c5bffd5e"
+PV =3D "0.46+git"
=20
+SRC_URI =3D "git://github.com/speed47/spectre-meltdown-checker;protocol=3D=
https;branch=3Dmaster"
+SRCREV =3D "a20641fbad57f37da6093203484ca28769e5bb64"
=20
 # binutils: readelf,objdump might be used for deeper analysis
 # coreutils: dd with iflag=3Dskip_bytes oflag=3Dseek_bytes in some cases
--=20
2.53.0


