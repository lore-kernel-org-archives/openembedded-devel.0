Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6874C369A2
	for <webhook@archiver.kernel.org>; Thu, 10 Apr 2025 04:11:47 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.26468.1744258299540673555
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Apr 2025 21:11:39 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=61957cd107=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53A3e2I3016715
	for <openembedded-devel@lists.openembedded.org>; Thu, 10 Apr 2025 04:11:38 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2048.outbound.protection.outlook.com [104.47.66.48])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45tsr1pdg8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 10 Apr 2025 04:11:38 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G0VV7Qk65hr5/MQclmwWw+a6hZ6httf89l9/6E5ZpLT6OL2VA4WieCaDcEvXNlkyk7moXW8KsdvjrO3gRzeL+iNhlWNDOS00cDEpFS/SCHipT9DjbAiE8a0hKXzeJiE+lIIRsRxxPowsDRkIpAxlDBKC8tV4qW9z5IqhQLhBnZOiJbZlgtAO4UbIJ6xFztT1N/nqMiefTtrtrvWSsX0Awj36gg0BHHXVvZ7drTD8hYStgkndCdid0wUB2SxRugliDKMQlMq/4+Work+AqeNqW0Vpl0bpeaMWJ3S+MXubPW9HD4AIafYXxfaCIlG/6p7CSyro8BRW9IvsTCTVoDGJNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=otmsB7ljc6FTWo/iXZk49uv4b1bx9peC9di/fMHv4tQ=;
 b=SwJRTXenPkQ16ovqKCkeeu2pwGeAiFsVp57cWZg1q/fPzURZfmNVf7MPgSHir57BMGLxV1K0H4AhsAQQ9EduJaMs6q8P/HYnV80iT7e52nFnmNcR5VM4WbXfc4ovKMQQorfgQB4ERzd5oLxeyYP7RDwVwnVgiaVl2eLKW7VH9drUAkSjrvfcSKTfGlNUEIpq1GiZIvu+T9K1KYnEAJmZpcxdaxdrJ3gaaM+A73pyh21Js3Vw8EecZtpmcwhh92jAaUMtwRA9mvmKErzZwRNiDdsA4vEYf/RQ44zRBWQdhoN+atnxS2F08b3nzd0lM/lxloCD0vqbum+jjOjVSlDwsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by CH3PR11MB8185.namprd11.prod.outlook.com (2603:10b6:610:159::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.22; Thu, 10 Apr
 2025 04:11:35 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%4]) with mapi id 15.20.8606.029; Thu, 10 Apr 2025
 04:11:35 +0000
From: Qi.Chen@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][PATCH 1/2] recipes: adapt to qemu.bbclass refactoring
Date: Wed,  9 Apr 2025 21:11:28 -0700
Message-ID: <20250410041129.1486824-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY1P220CA0020.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5c3::7) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|CH3PR11MB8185:EE_
X-MS-Office365-Filtering-Correlation-Id: d8b662ba-deb7-4024-bd3a-08dd77e5c8b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?d02uEtX67juSwxX9ycn80LFrz1PmCko+oTI3nfCMOEvm22f6KLpD+6XL6sZD?=
 =?us-ascii?Q?FwOmqHQszl7F+Dlh+7PcS+0EZt1jtUXSDNOtPWabyHPURHCYNoYijv6+7dNg?=
 =?us-ascii?Q?O78DdVlFNvNR8ZVRNpD9jYTXuFLMF75agOrpcbpBsOVqTjNsqFAVpfVkBnQM?=
 =?us-ascii?Q?C8Jv/iDlv1bBivSB8/BkmEE1K4MYkAX6ZXx3d+wmiZq7oqW9HP0U7Zv95hBR?=
 =?us-ascii?Q?Eb/E2p8g8Dl6qfnmaV92tc+TCfmOVq4tC2LTSFr3BI7Whk0eRaP+wSXqW6Zm?=
 =?us-ascii?Q?QmSqqxDnYiweZLYH+7puVjuexlXlpSob6hnNIHr6OAdtWYUBL2I1bg+Xf7m1?=
 =?us-ascii?Q?MeWWwXjvld4wxBvsCuXgxOWp+w27LKCGBTogfO5TdCSDA9SVWNHM24aQ5tnU?=
 =?us-ascii?Q?IF+oVZ0mfOMrV8sVUe+RE4UuqrYaactTjOn0pTt0HHTZmHQZpmz/+bpvC7UR?=
 =?us-ascii?Q?6WdpDyNiMc7f4J1lM5ZBXF8Kwws5ipozsQmPLR0BZeN3Vxvt96v7+uX7a7BH?=
 =?us-ascii?Q?Zh62GPrBQLSGS9TOPokG15Y2cL8Xuvy0nJYG7dCF9c8g45C3yGA1iOoucPIi?=
 =?us-ascii?Q?WnSb2G9ivTtNXXVPl6GsMLZKUX+uvUFpRxZuEbN23Pe9q7WHm/Q9ItqfcvtJ?=
 =?us-ascii?Q?aYWtC262K+/0c4esHyR9tswYuNo1HKemQcUwCI1UXprW60Wzun7zRE/Lp8jB?=
 =?us-ascii?Q?NeqTO5bMN9knkIYKcHU/PCUiLTIXiUED+Hn1qNy+hRLfsDxeQNH3SJs5WcN/?=
 =?us-ascii?Q?Lv+1VFkevHtWTEEzgkIZrmeftFE2an7E3dR1BMNOr6hBl2bzJGkrAzDEfua9?=
 =?us-ascii?Q?LdnKAWxcd/5ZgpQRR1eMNJAPNjFMC/24yjSeKpK7JYA9pkGBASfOlZzBJVY0?=
 =?us-ascii?Q?SkZKA+4ItZVxrDvF7Y8Io9+ac1jYJCpOm3IT1tipaNLvT1j4YOD/RnhBC35O?=
 =?us-ascii?Q?CehdVr6fej2zONarzw+w6Cgx+HHeA6xfIX6q0CUa9n2QdjSRATl/Ld2A2Jaz?=
 =?us-ascii?Q?P+n5j/bmnayW+jUslDq8FIN8conHDO2+IGZ/fkcg4GNcm0SAx8ZdnrkPpHs+?=
 =?us-ascii?Q?/F1yu17c0OVtEDF/bJyYswsSuoByF4LnkWJOD9RDnvXwmr1b8hQ1TkXqk8Jw?=
 =?us-ascii?Q?85/PVKiYGMUZWIlnNzm7KPj0AbkTxFXqVLPTWxYqzWJsYwlLoznf3o153fZy?=
 =?us-ascii?Q?DtM7l6XgrX55LQFpBx39ekmTDLLAacunaE99HF/TWv5ooa0k9JfZabQE1a5L?=
 =?us-ascii?Q?ys++lrOIX3BGtKPts15fkf7jBm2S+umeBL8WayDVRCQRHIGjbt+UOD4a+wiY?=
 =?us-ascii?Q?cQlZH3bQbH1Vu04HsWMTlG6e/XV2OnDmBYRXC+ZbDv1y/yhS+Rm+31ZCtnWF?=
 =?us-ascii?Q?4mGw2oIWm+/GivDSJQ+FJtM/Cxg/Dn5S9lTY+qaNGr6q2Qzz1w=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?AMNN20kFolX2YyFM8knbtItDljOzEiQKXGzkQKe/nZ8aDClYoMeLsnK7lLst?=
 =?us-ascii?Q?arxYDqs7xyeKQWd2VGINU7GSrQZkMMej+c9b8P5sKA78/RDXMDrbQpdL7fFd?=
 =?us-ascii?Q?tIDJP7puaB0fG6ngICRS8BnLZdHJ/Vwkn7IjgrnPKfHhp52IpILznPKqmIfX?=
 =?us-ascii?Q?7BWl4wXW+ttr6SgJ8SYAnh6aeCJ7kvluNq+qHyF/eNOec7yt03lxKuqjTVVU?=
 =?us-ascii?Q?N5+HKCarUH1jQelrOoyhXXnqSyYJ4Wbbm+6XOQGBo+Gnzhw1urOWFmzqvsGg?=
 =?us-ascii?Q?+Yxzp1t+KoeuoAPHaxxFx43ZDUIUiMx46jQJNgBc5PtR31c3t9FLFy0cFsby?=
 =?us-ascii?Q?9TeBeomMjdnqJQ2NHLynaKmGN4wZmG1jJ1VBvAgsx3Yd70yV2DUKj67oFd6p?=
 =?us-ascii?Q?52qU62Z22C7xnevC9wePb9wMiUx0rBd0BB9Dnarz7wBERcAUTBR1LyDjy9kr?=
 =?us-ascii?Q?icqNaaZ/N4yytkNye+QnFZZ7s9c56/6mQ2OjX79zDr4LG/peAAeX+md3YH/d?=
 =?us-ascii?Q?A0MLeDKaZ6tskbn45sUJMjxb4yosJj82S5LZ/6p9eBrcVOhB8y3zU/wkSZ+J?=
 =?us-ascii?Q?EjYuJ2EjZA3ss5Wrd+y4WIjfrb9zzk4Ki2MHsBzL9CMwZir6uRDHEBGGGlLR?=
 =?us-ascii?Q?0XJPtDyDTBm2a5U+OwlWxpoP1+Ha8S8e3Law5gHvEToLXIUV5EccJYxrzEju?=
 =?us-ascii?Q?YLG1+GnBB9yE/KzGDeegVwy6f5HiVFsNrWGzaALsC+qnvDbNMfcbcdwb4SNS?=
 =?us-ascii?Q?RSdzdY474tUmpD3xsC8DIUoKBiUax3Mai2JOjlCJG85C6K49TCeV6wL6h66m?=
 =?us-ascii?Q?jUsq80L5y/iFt9R0bYHkJrslE0l1vNJ16lASdRq0sam7dY49pNKmJMfvV+RL?=
 =?us-ascii?Q?6ajZEabk9FcUwApvcKXV2Qnasc3uAgoIjVxkQahvZ/vl0xwQ2mC9CMk6Ypjq?=
 =?us-ascii?Q?XOfyXpwMgHFSK0iykJSDrp4YVMIyLsCZ44rrXtZ5V6mA7aLJGDFRK36Nxe8R?=
 =?us-ascii?Q?QknH/1g9HSbwKgGrC2GN2mMRyQN9is2VNud/TnO/nMYdGtWlX9TaEvssjiMp?=
 =?us-ascii?Q?4sKaqHJUvYdg9UsgG1Z6iR8a7zP+4k7DkgP1noxNBqD5kvOzFUWd8Bz6IKZp?=
 =?us-ascii?Q?YecjO8/fG36m0VtpSKbn/jne07JHtT2XzdRVnZmHAcB3hNrzK1ooNmlFCeYk?=
 =?us-ascii?Q?Ve5Zj+KXxVpaQMYmnvQWcly2j8JGJ5RpmS0RfMl38W/htX+9TuORokJTeWEy?=
 =?us-ascii?Q?OsVjf2ERKjnlY674l5YUUVt1TQAePpE3VcTvhl3rbSy1hmzABmzCPsadHftR?=
 =?us-ascii?Q?yj4VDdpCYwqOQyjcgRy3jZzsQJzwu4Fm7NP9WJYbi0zTQxRouk7pb5kaH3gZ?=
 =?us-ascii?Q?3KWxN08rL1nIhNqfm2jk20eXbXNdc57xtygm+sfrCVrDln2Eh4qP10t9UC4I?=
 =?us-ascii?Q?TETZRAljcCgI9B3iWGNAF9PAveJqE3/u8c4cIZohuDp//J1jBZ0JZ7wpOjbS?=
 =?us-ascii?Q?JLgKf3TTdv4KYLGFntrRCai4mqEKoZIednHBaEEWB3SNEcw+2cIggnwQaAoG?=
 =?us-ascii?Q?Q0xqfsHL/P3sJoImPTrB8746gXESOwvL+QLcUnYw37vlhXr4EPIHiTwgyaQG?=
 =?us-ascii?Q?Yg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8b662ba-deb7-4024-bd3a-08dd77e5c8b6
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 04:11:35.6026
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f8AmntgdM7/3w9YxrzfOraKm7rXz26/hw49quK9TSGMYEhz9uakiFc2KL3OOTckSy631DzXDGF1hPktUCVbTEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8185
X-Authority-Analysis: v=2.4 cv=Td6WtQQh c=1 sm=1 tr=0 ts=67f744fa cx=c_pps a=wMNeujlvNozESTkKEiiyVQ==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=XR8D0OoHHMoA:10
 a=NEAV23lmAAAA:8 a=p0WdMEafAAAA:8 a=OGsvooznAAAA:8 a=t7CeM3EgAAAA:8 a=di4TEDuSiV-h7an7GRsA:9 a=B5HV4OX4S3AA:10 a=Ro9wbLpunPwA:10 a=_MKx33s3DjsVgJzmPKfz:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: PknC3g3ZwMgzQlXBy0PCqFNyP0TXhEK0
X-Proofpoint-GUID: PknC3g3ZwMgzQlXBy0PCqFNyP0TXhEK0
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_06,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 mlxscore=0
 mlxlogscore=999 clxscore=1015 lowpriorityscore=0 adultscore=0 bulkscore=0
 impostorscore=0 phishscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2504100030
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Apr 2025 04:11:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116750

From: Chen Qi <Qi.Chen@windriver.com>

Avoid inheriting qemu.bbclass and use oe.qemu.xxx instead.

Also, the unneeded 'qemu-native' dep is removed from PACKAGE_WRITE_DEPS.
The package creating process does not need qemu-native.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta-oe/recipes-devtools/mpich/mpich_4.3.0.bb        |  4 ++--
 meta-oe/recipes-devtools/nodejs/nodejs_22.14.0.bb    |  6 +++---
 meta-oe/recipes-extended/icewm/icewm_3.7.3.bb        |  4 ++--
 meta-oe/recipes-graphics/graphviz/graphviz_12.2.1.bb |  6 ++----
 meta-oe/recipes-support/espeak/espeak_1.48.04.bb     |  4 ++--
 meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb        |  4 ++--
 meta-oe/recipes-support/uim/uim_1.9.0.bb             | 11 +++++------
 meta-oe/recipes-support/unixodbc/unixodbc_2.3.12.bb  |  4 ++--
 8 files changed, 20 insertions(+), 23 deletions(-)

diff --git a/meta-oe/recipes-devtools/mpich/mpich_4.3.0.bb b/meta-oe/recipes-devtools/mpich/mpich_4.3.0.bb
index 6babba3de7..af15ce61a3 100644
--- a/meta-oe/recipes-devtools/mpich/mpich_4.3.0.bb
+++ b/meta-oe/recipes-devtools/mpich/mpich_4.3.0.bb
@@ -28,13 +28,13 @@ PACKAGECONFIG[fortran] = "--with-cross=${WORKDIR}/cross_values.txt --enable-fort
 LDFLAGS:append:x86-64 = " -lgcc"
 LDFLAGS:append:x86 = " -lgcc"
 
-inherit autotools gettext pkgconfig qemu
+inherit autotools gettext pkgconfig
 
 DEPENDS += "qemu-native"
 
 do_configure() {
     if [ "${@bb.utils.contains('PACKAGECONFIG', 'fortran', '1', '', d)}" = "1" ]; then
-        qemu_binary="${@qemu_wrapper_cmdline(d, d.getVar('STAGING_DIR_HOST'), [d.expand('${STAGING_DIR_HOST}${libdir}'),d.expand('${STAGING_DIR_HOST}${base_libdir}')])}"
+        qemu_binary="${@oe.qemu.qemu_wrapper_cmdline(d, d.getVar('STAGING_DIR_HOST'), [d.expand('${STAGING_DIR_HOST}${libdir}'),d.expand('${STAGING_DIR_HOST}${base_libdir}')])}"
         cat > ${WORKDIR}/qemuwrapper << EOF
 #!/bin/sh
 $qemu_binary "\$@"
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_22.14.0.bb b/meta-oe/recipes-devtools/nodejs/nodejs_22.14.0.bb
index dee4c9df4f..a9d98ff453 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_22.14.0.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_22.14.0.bb
@@ -9,7 +9,7 @@ DEPENDS = "openssl openssl-native file-replacement-native python3-packaging-nati
 DEPENDS:append:class-target = " qemu-native"
 DEPENDS:append:class-native = " c-ares-native"
 
-inherit pkgconfig python3native qemu ptest siteinfo
+inherit pkgconfig python3native ptest siteinfo
 
 COMPATIBLE_MACHINE:armv4 = "(!.*armv4).*"
 COMPATIBLE_MACHINE:armv5 = "(!.*armv5).*"
@@ -107,8 +107,8 @@ python do_create_v8_qemu_wrapper () {
     on the host."""
     qemu_libdirs = [d.expand('${STAGING_DIR_HOST}${libdir}'),
                     d.expand('${STAGING_DIR_HOST}${base_libdir}')]
-    qemu_cmd = qemu_wrapper_cmdline(d, d.getVar('STAGING_DIR_HOST'),
-                                    qemu_libdirs)
+    qemu_cmd = oe.qemu.qemu_wrapper_cmdline(d, d.getVar('STAGING_DIR_HOST'),
+                                            qemu_libdirs)
 
     if d.getVar("HOST_AND_TARGET_SAME_WIDTH") == "1":
         qemu_cmd = ""
diff --git a/meta-oe/recipes-extended/icewm/icewm_3.7.3.bb b/meta-oe/recipes-extended/icewm/icewm_3.7.3.bb
index 311abc3702..8c238beb42 100644
--- a/meta-oe/recipes-extended/icewm/icewm_3.7.3.bb
+++ b/meta-oe/recipes-extended/icewm/icewm_3.7.3.bb
@@ -10,7 +10,7 @@ SRC_URI[sha256sum] = "4d845d8af6194fa25b36524467ae9fdcca2faed5c4046515e3bc633ff1
 UPSTREAM_CHECK_URI = "https://github.com/ice-wm/${BPN}/releases"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
 
-inherit autotools pkgconfig gettext perlnative features_check qemu update-alternatives
+inherit autotools pkgconfig gettext perlnative features_check update-alternatives
 REQUIRED_DISTRO_FEATURES = "x11"
 
 EXTRA_OECONF += "--with-libdir=${datadir}/icewm \
@@ -31,7 +31,7 @@ do_compile:prepend:class-target() {
     cd ${B}
     oe_runmake -C src genpref
 
-    qemu_binary="${@qemu_wrapper_cmdline(d, '${STAGING_DIR_TARGET}',['${B}/src/.libs','${STAGING_DIR_TARGET}/${libdir}','${STAGING_DIR_TARGET}/${base_libdir}'])}"
+    qemu_binary="${@oe.qemu.qemu_wrapper_cmdline(d, '${STAGING_DIR_TARGET}',['${B}/src/.libs','${STAGING_DIR_TARGET}/${libdir}','${STAGING_DIR_TARGET}/${base_libdir}'])}"
     cat >qemuwrapper <<EOF
 #!/bin/sh
 ${qemu_binary} src/genpref "\$@"
diff --git a/meta-oe/recipes-graphics/graphviz/graphviz_12.2.1.bb b/meta-oe/recipes-graphics/graphviz/graphviz_12.2.1.bb
index cccbbe75f7..ffa667b522 100644
--- a/meta-oe/recipes-graphics/graphviz/graphviz_12.2.1.bb
+++ b/meta-oe/recipes-graphics/graphviz/graphviz_12.2.1.bb
@@ -16,7 +16,7 @@ DEPENDS = " \
 DEPENDS:append:class-target = " ${BPN}-native"
 DEPENDS:append:class-nativesdk = " ${BPN}-native"
 
-inherit autotools-brokensep pkgconfig gettext qemu
+inherit autotools-brokensep pkgconfig gettext
 
 SRC_URI = "https://gitlab.com/api/v4/projects/4207231/packages/generic/${BPN}-releases/${PV}/${BP}.tar.xz \
            "
@@ -84,7 +84,7 @@ SYSROOT_PREPROCESS_FUNCS:append:class-native = " graphviz_sstate_postinst"
 pkg_postinst:${PN} () {
     if [ -n "$D" ]; then
         if ${@bb.utils.contains('MACHINE_FEATURES', 'qemu-usermode', 'true', 'false', d)}; then
-            ${@qemu_run_binary(d, '$D', '${bindir}/dot')} -c
+            ${@oe.qemu.qemu_run_binary(d, '$D', '${bindir}/dot')} -c
         fi
     else
         dot -c
@@ -96,8 +96,6 @@ pkg_postrm:${PN} () {
     rmdir --ignore-fail-on-non-empty $D${libdir}/graphviz
 }
 
-PACKAGE_WRITE_DEPS += "qemu-native"
-
 PACKAGES =+ "${PN}-python ${PN}-perl ${PN}-demo"
 
 FILES:${PN}-python += "${PYTHON_SITEPACKAGES_DIR}/ ${libdir}/graphviz/python/"
diff --git a/meta-oe/recipes-support/espeak/espeak_1.48.04.bb b/meta-oe/recipes-support/espeak/espeak_1.48.04.bb
index b4812d59d6..363fffbc05 100644
--- a/meta-oe/recipes-support/espeak/espeak_1.48.04.bb
+++ b/meta-oe/recipes-support/espeak/espeak_1.48.04.bb
@@ -13,7 +13,7 @@ SRC_URI[sha256sum] = "bf9a17673adffcc28ff7ea18764f06136547e97bbd9edf2ec612f09b20
 S = "${WORKDIR}/espeak-${PV}-source"
 
 DEPENDS = "portaudio-v19 qemu-helper-native"
-inherit siteinfo qemu
+inherit siteinfo
 
 
 CXXFLAGS += "-DUSE_PORTAUDIO"
@@ -31,7 +31,7 @@ do_compile() {
     oe_runmake
 
     cd "${S}/platforms/big_endian"
-    qemu_binary="${@qemu_wrapper_cmdline(d, '${STAGING_DIR_TARGET}', ['${S}/platforms/big_endian', '${STAGING_DIR_TARGET}${base_libdir}'])}"
+    qemu_binary="${@oe.qemu.qemu_wrapper_cmdline(d, '${STAGING_DIR_TARGET}', ['${S}/platforms/big_endian', '${STAGING_DIR_TARGET}${base_libdir}'])}"
     cat >qemuwrapper <<EOF
 #!/bin/sh
 $qemu_binary "\$@"
diff --git a/meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb b/meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb
index f34e5f183d..4ffc875cec 100644
--- a/meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb
+++ b/meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb
@@ -7,7 +7,7 @@ SECTION = "libs"
 LICENSE = "HDF5"
 LIC_FILES_CHKSUM = "file://COPYING;md5=adebb1ecf1b3b80c13359e18ef67301e"
 
-inherit cmake siteinfo qemu multilib_header multilib_script
+inherit cmake siteinfo multilib_header multilib_script
 
 DEPENDS += "qemu-native zlib"
 
@@ -30,7 +30,7 @@ EXTRA_OECMAKE:prepend:class-target = "-DCMAKE_CROSSCOMPILING_EMULATOR=${WORKDIR}
 gen_emu() {
         # Write out a qemu wrapper that will be used by cmake
         # so that it can run target helper binaries through that.
-        qemu_binary="${@qemu_wrapper_cmdline(d, d.getVar('STAGING_DIR_HOST'), [d.expand('${STAGING_DIR_HOST}${libdir}'),d.expand('${STAGING_DIR_HOST}${base_libdir}')])}"
+        qemu_binary="${@oe.qemu.qemu_wrapper_cmdline(d, d.getVar('STAGING_DIR_HOST'), [d.expand('${STAGING_DIR_HOST}${libdir}'),d.expand('${STAGING_DIR_HOST}${base_libdir}')])}"
         cat > ${WORKDIR}/qemuwrapper << EOF
 #!/bin/sh
 $qemu_binary "\$@"
diff --git a/meta-oe/recipes-support/uim/uim_1.9.0.bb b/meta-oe/recipes-support/uim/uim_1.9.0.bb
index 5ed61fd098..19fa8d3887 100644
--- a/meta-oe/recipes-support/uim/uim_1.9.0.bb
+++ b/meta-oe/recipes-support/uim/uim_1.9.0.bb
@@ -25,7 +25,7 @@ LEAD_SONAME = "libuim.so.1"
 COMPATIBLE_HOST:riscv64 = "null"
 COMPATIBLE_HOST:riscv32 = "null"
 
-inherit features_check autotools pkgconfig gettext qemu gtk-immodules-cache
+inherit features_check autotools pkgconfig gettext gtk-immodules-cache
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
@@ -118,10 +118,9 @@ FILES:uim-skk = "${libdir}/uim/plugin/libuim-skk.* \
     ${datadir}/uim/skk*.scm \
 "
 
-PACKAGE_WRITE_DEPS += "qemu-native"
 pkg_postinst:uim-anthy() {
     if test -n "$D"; then
-        ${@qemu_run_binary(d, '$D', '${bindir}/uim-module-manager')} --register anthy --path $D${datadir}/uim
+        ${@oe.qemu.qemu_run_binary(d, '$D', '${bindir}/uim-module-manager')} --register anthy --path $D${datadir}/uim
     else
 		uim-module-manager --register anthy --path ${datadir}/uim
     fi
@@ -129,7 +128,7 @@ pkg_postinst:uim-anthy() {
 
 pkg_prerm:uim-anthy() {
     if test -n "$D"; then
-        ${@qemu_run_binary(d, '$D', '${bindir}/uim-module-manager')} --path $D${datadir}/uim --unregister anthy
+        ${@oe.qemu.qemu_run_binary(d, '$D', '${bindir}/uim-module-manager')} --path $D${datadir}/uim --unregister anthy
     else
 		uim-module-manager --path ${datadir}/uim --unregister anthy
     fi
@@ -137,7 +136,7 @@ pkg_prerm:uim-anthy() {
 
 pkg_postinst:uim-skk() {
     if test -n "$D"; then
-        ${@qemu_run_binary(d, '$D', '${bindir}/uim-module-manager')} --register skk --path $D${datadir}/uim
+        ${@oe.qemu.qemu_run_binary(d, '$D', '${bindir}/uim-module-manager')} --register skk --path $D${datadir}/uim
     else
 		uim-module-manager --register skk --path ${datadir}/uim
     fi
@@ -145,7 +144,7 @@ pkg_postinst:uim-skk() {
 
 pkg_postrm:uim-skk() {
     if test -n "$D"; then
-        ${@qemu_run_binary(d, '$D', '${bindir}/uim-module-manager')} --path $D${datadir}/uim --unregister skk
+        ${@oe.qemu.qemu_run_binary(d, '$D', '${bindir}/uim-module-manager')} --path $D${datadir}/uim --unregister skk
     else
 		uim-module-manager --path ${datadir}/uim --unregister skk
     fi
diff --git a/meta-oe/recipes-support/unixodbc/unixodbc_2.3.12.bb b/meta-oe/recipes-support/unixodbc/unixodbc_2.3.12.bb
index 0927f5c904..ce02535c95 100644
--- a/meta-oe/recipes-support/unixodbc/unixodbc_2.3.12.bb
+++ b/meta-oe/recipes-support/unixodbc/unixodbc_2.3.12.bb
@@ -18,14 +18,14 @@ SRC_URI[sha256sum] = "f210501445ce21bf607ba51ef8c125e10e22dffdffec377646462df5f0
 UPSTREAM_CHECK_URI = "https://www.unixodbc.org/download.html"
 UPSTREAM_CHECK_REGEX = "unixODBC-(?P<pver>\d+(\.\d+)+)\.tar"
 
-inherit autotools-brokensep multilib_header qemu
+inherit autotools-brokensep multilib_header
 
 S = "${WORKDIR}/unixODBC-${PV}"
 
 EXTRA_OEMAKE += "LIBS=-lltdl"
 EXTRA_OECONF += "--enable-utf8ini"
 DEPENDS:append:class-target = "${@' qemu-native' if bb.utils.contains('MACHINE_FEATURES', 'qemu-usermode', True, False, d) else ''}"
-QEMU_WRAPPER = "${@qemu_wrapper_cmdline(d, '${STAGING_DIR_HOST}', ['${STAGING_DIR_HOST}/${libdir}','${STAGING_DIR_HOST}/${base_libdir}'])}"
+QEMU_WRAPPER = "${@oe.qemu.qemu_wrapper_cmdline(d, '${STAGING_DIR_HOST}', ['${STAGING_DIR_HOST}/${libdir}','${STAGING_DIR_HOST}/${base_libdir}'])}"
 
 do_configure:prepend() {
     # old m4 files will cause libtool version don't match
-- 
2.49.0


