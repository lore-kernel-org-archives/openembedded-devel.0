Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F8EC108E1F3
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 11:32:57 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.119])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8939.1773919966892766602
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Mar 2026 04:32:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=yk311oXP;
 spf=pass (domain: navimatix.de, ip: 40.107.130.119, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UB0hlIvsM0s8EZhQrcDJwrwyok/Kc9SeTJ+Fz9wCu6v0L+d4N6MHgumvAMs/6o/8Im0lQu7nx5z0ve07HC2TGwbCwRIynMjV9EuGkGDz5VvgCrMzf2Lv1tp8rdgo0iceCFdAs49PlFzFC+X2BAmGdLREkH115j6UIj27q8XndAOfSAdzf8B+E7PfvqA4whHprk3f7Nt1mqsAP49uv99fowTeAMdXT1F0lNaUBGlDtzEoT1KshMkEii7oujjLrlXpjYc/Hjjy0JWeTamXF3VZjruEYThhZd3UviPgYLYkYGo+r2PcbPfu3SM53XuPFzNaCUoK7QSuGXscsIwUgf/T8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e52obcTEn6f2netyuR8cqaJFpicu+7WL72ujGUJDyD8=;
 b=XMhkdn33QCi0FMgieMS4c9ShZSzT8IOR2V2vdFwxo4vhDS+ue6rJyEcf9eCyTh4Qq5K30i2zPaat3wWWM4IFP+e/RmstE5X9wwacwITLysocb0eCtt9iyyCCJHB0KV87XLI4GR8qw7xYAa1SHgO/Y6/D5RnLgEmBv9e/15o8sOueSSx2lSIvleUBgAbCQxDWsHAAtVJRvt7q8senQGRyx5T38g8xqTlgEYhO5UG8swnv8lkXU+IYNNhD4Q50y8gOb5EiGWwSZ3MrMvAX54UCuh1VU+OjxABSPZt+DhnJrJGEtTTbyAyKQN3ruPTky8ulFchBE3VDxqWVgOnxSCecfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e52obcTEn6f2netyuR8cqaJFpicu+7WL72ujGUJDyD8=;
 b=yk311oXPgiiJ28pPItg58PHzz+d6flR3qGNdsWCznhgMMO8ikYW0onz+1cNiJAx5iBJDOo+QtPk/7f74rTfudIBlPOsP78epM9dXKUuDlDP5cD0XzvO8DKjPs9gHAJSiP7ndHVUlCQcu0XRpUBa3QvBfZqSABIeTn67vREXorJ0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8) by DU0PR01MB9993.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:322::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Thu, 19 Mar
 2026 11:32:41 +0000
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 ([fe80::d5c3:2dea:3d98:25fd]) by
 GV2PR01MB11835.eurprd01.prod.exchangelabs.com ([fe80::d5c3:2dea:3d98:25fd%3])
 with mapi id 15.20.9723.018; Thu, 19 Mar 2026 11:32:42 +0000
Date: Thu, 19 Mar 2026 12:32:41 +0100
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: openembedded-devel@lists.openembedded.org, joerg.sommer@navimatix.de
CC: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
Subject: [PATCH] spectre-meltdown-checker: Update 0.46 -> git
Message-ID: <83b1207267c548a0fd2225c2f6d66e23f4d2c4e0.1773919960.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.53.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE1P281CA0252.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:8b::6) To GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR01MB11835:EE_|DU0PR01MB9993:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e4c9399-9225-4ae5-c321-08de85ab3bcb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	Fv7EAtWugNTM+lhw4zOdvNRpP7rTNjwW93qy+PF+BStBmzDOcOuYb6ZtAk3LFpXpbXkC9TZUs5YYS04RNsl3SpaURgxKwgX1TOWzPTD47YgqIzaPOPTEhLnt2MYAGM0m+jHCLBckiiIU1GhVN1WTA+welzwbv/BD0HA5XG9tKTPfFs5TIaPHEhKVBNKpdiMXvBUZp7fucNDaToOoeN2uStY6kGRjzLctOKcWpFiGZH98N4pSwTl6WKcr4nvSnA4/njU/Li0JzXTLaMilcA33TsD3jD1eppymXaKmqzsJVYm9mHjvdbOkCe18fFrvOC5xN46ygKVoUBdQhSLe/BEbZPTEaZZKi36fupRY+qcIgPhQB3sZxh31fuGtZQPXyxdMZn6ApPeWwVgmqY48h32WSDpknoDjZ8wqAXxD1QYKH0ZE8prejSCRHK3rHKGCc5CYEgFCysWQfCemvK7P4kY38r5XfUjT5Ca+L1sOwd3XVZMP0l5mvJGVIwmWI6FDR31vDHa436f4DymL1euFpcmoblv4ZhWXNUBRuq7kZ1SudyUbmeDBefhAe1FU0w/z6R71cLxy+vSthnzIGM5Fqc/p/egCltj6BUwYAG1VFyx9Ken2pYCTIGtnLkyQIQfMziFIuJbOC1eZtabFdCCeJD7vWDopsAKqilDn/bTFpIGuL2wqCXf/H5ZH6KTaqG5xWG98qI6nMDdPT73RpOKcNVqSqysDr72QVjZlESRGMKUdXL4=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR01MB11835.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ifM4D6VG1YsVPRu/rh8nr5U2aaO77jRTSKY5LL16wi4ZV3E6mGUoAbzGX1xo?=
 =?us-ascii?Q?KUZmVKttlYKagSNP2FIfpLiaTJXcDXesP6PZ8Po01/5D+VPuo+6fRX/uL+U4?=
 =?us-ascii?Q?mUlPIfBvxNYz84wUtwtngG61WYCCQfXVaP9t7aGO5ExbmKSx+nroTgpAA3RZ?=
 =?us-ascii?Q?yBYXK5+jVUfyASEAiWCAWzNR95sofbU67/QQ9JnHbHHE6xbNx2Efh8bvNmHK?=
 =?us-ascii?Q?T+v6J3qBTzT3/DS2TmvWk06vtrLMXswA6qyDkyj82WJGzKIAyuMfUF1khJZQ?=
 =?us-ascii?Q?LTNB/CloU6wk8AJ+DCpX/6ARIoE5FjRFxswfGMR6KOF91ZI5+3lXN2sYta0P?=
 =?us-ascii?Q?X/LQwBKtoQYjZrCwQoI3ZhI+kwYHr/J13ZKWXelwUC+7QcplrOMiQhOFxUN3?=
 =?us-ascii?Q?jK7tXVtdyui5KNbUi1UmVT0AUGjcN7/Wh4kOYygiBlZ1ybjUJogBJWXQ8hfR?=
 =?us-ascii?Q?nNk2+q6pvEy99uavn4ZlWIYvmQlxe0FWk8l66B0bzBiV0/jt+hwSx4MvPw6Q?=
 =?us-ascii?Q?jYsW89cHAUvtPdRW/Q85MQ1kjHF/NTAXnC7ASnmSGsYhWQUaMp/9Dee4HkB7?=
 =?us-ascii?Q?a6/W9X8TV1bwY8c1jJJY1Ic8C5oz5n/ENJOPexhMKaUUj8rdwch2vk/w/wA5?=
 =?us-ascii?Q?x/drBU++YSi/tIAATm+z54rHDbPdmraGlDNt8JYhtTUvgt8H0as9KDMpZacF?=
 =?us-ascii?Q?8EwZnANd1x8Crh5WSzV5CWEz6QN5VXC79t2GN9s0ZKp71H64LQz+QGsYtieL?=
 =?us-ascii?Q?qCr/WUrzPeEl0C6efHObHmp0wn3Wq3+lttGe1Pv+b63qxhBoiYJvhKa8za6+?=
 =?us-ascii?Q?cD1X+oD/4zqqugQYJah5nUPIfvm8mOXv5OpmJOtWvlXlN/TJDLJ72Nf8TEob?=
 =?us-ascii?Q?tArQvq7RWn7IkZ36S5f+DckET75h7t1BZG64vZu4L/pLM8KuLvxY/jeqOw7H?=
 =?us-ascii?Q?Z0Vyc94stO3b5aM4vD9KbBjUyefSEaYJKqtmzE9cV8+DuxZdYNTk37qaMiL1?=
 =?us-ascii?Q?+9JnaYHul8FpRJ8eIdnoowHYDBKvkeyS0wSlvbMMFy/oJkE7LQuemqN8BkOd?=
 =?us-ascii?Q?7ela3jJZZFdZaDqxTSP3e7KdNXuFVcZLv5bTGRmUeVbCP6qNb7Px45FUdZce?=
 =?us-ascii?Q?1Jur75EjX7digk6GJzzNGHF5vBi4XBpl9d3i0WVWN1HG1Qr4pOrwyljdp09B?=
 =?us-ascii?Q?ZYlmPnvAyQhculBb1UkyVI+nIsNfV3ooBVbx6k5y1tjvL5BHCNi/GVxSmCLg?=
 =?us-ascii?Q?F4Z/GwF5bIuElHcZjs7iW9CtbcU+fVpJxrsATBK4ac7PwPO11fAsbgWz9AYD?=
 =?us-ascii?Q?TNzVsOFmkIZ+Hb11O4yICBjl1pAbz7iXTUNvWJ60Z7VT+UZ/zT3V2fba4b2u?=
 =?us-ascii?Q?NZMnU/dIKfXCl4welRTqL5d+QXaY9lUhfY6txzdw8OjGIXEcFPogbw4rO161?=
 =?us-ascii?Q?HbC+uWV/9/2zTEUyZUx2MwI3PhCZQTxEYZ0ZnGqHCqjkyrHIrWbu/Ef0mWgJ?=
 =?us-ascii?Q?y+eR/qfN9fjkpzI/6jmxXbBca5svz5M8fs49fY7YFcOZlb8KxvUeNz9LQ9iI?=
 =?us-ascii?Q?5gaEOPTk3QFSjSBY+X1qT/BLrvErpOeOdDNqG9TT0B7wjD5azrU9u7TY6k0r?=
 =?us-ascii?Q?cgQE83t81/qQU65EAUIEChz7SLqa76sUPDSac/pncyjMfYIzYL6fV7ThtoOq?=
 =?us-ascii?Q?dtqB5suM0keqZH5gviIsK5Qd3C/ZCY+wNMC41yQbElqGN+H8BEM/EwbqlDGE?=
 =?us-ascii?Q?bJg9tO+pXqzuktpeJWHV3u3esn9Aehs=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e4c9399-9225-4ae5-c321-08de85ab3bcb
X-MS-Exchange-CrossTenant-AuthSource: GV2PR01MB11835.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 11:32:42.3512
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sQ9AvRLlJvtG7zejpnER3qt2c3NK9RAAoLjSjLYQNCPLY/kLCcXyZAi93tpUOSODYMaO2zhYAGH4v+PD1gcjfjEmD1N824VdTNjcER0HG0c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR01MB9993
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 Mar 2026 11:32:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125395

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
 ...eltdown-checker_0.46.bb =3D> spectre-meltdown-checker_git.bb} | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
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
index 48f9a738bb..ee28ae7400 100644
--- a/meta-oe/recipes-security/spectre-meltdown-checker/spectre-meltdown-ch=
ecker_0.46.bb
+++ b/meta-oe/recipes-security/spectre-meltdown-checker/spectre-meltdown-ch=
ecker_git.bb
@@ -9,8 +9,9 @@ LICENSE =3D "GPL-3.0-only"
 LIC_FILES_CHKSUM =3D "file://spectre-meltdown-checker.sh;beginline=3D2;end=
line=3D2;md5=3D3ae5399e70af7be9b93f72568069e2f4"
=20
 SRC_URI =3D "git://github.com/speed47/spectre-meltdown-checker;protocol=3D=
https;branch=3Dmaster"
-SRCREV =3D "b8f8c81d519435c0871b13f02b5c4a72c5bffd5e"
+SRCREV =3D "a20641fbad57f37da6093203484ca28769e5bb64"
=20
+PV =3D "0.46+git"
=20
 # binutils: readelf,objdump might be used for deeper analysis
 # coreutils: dd with iflag=3Dskip_bytes oflag=3Dseek_bytes in some cases
--=20
2.53.0


