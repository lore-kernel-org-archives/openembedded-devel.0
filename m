Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 271F4C3601E
	for <webhook@archiver.kernel.org>; Thu, 10 Apr 2025 04:31:58 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.26690.1744259513190749934
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Apr 2025 21:31:53 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=61957cd107=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53A2eWpD008530
	for <openembedded-devel@lists.openembedded.org>; Thu, 10 Apr 2025 04:31:52 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2173.outbound.protection.outlook.com [104.47.58.173])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45tug8pce7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 10 Apr 2025 04:31:51 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Abh69SJdEIzvjsLqgxqWY7DWtqiQebwtc8PClYpJERv+3zeqafafeLHeBX4bzkiO/KSr84xdAT6ohDaSk1fGsNN4oah7Nputzq4LjeUBvnEPjTf6Qa38u+sBuhJNNnjPwrTfYbwonoKpZFryYJd49awK1lRApoEFWt4Hc8Ch6X9Iq0TYSjwklkPW7EtJE+UagjN/kYNt03atBwQvERhac3cAvMZWsse2zoOAhXYiz4mHnj3Dt3eaYqlt2QemDsdSJDmWHZbuhg8WEfslNTi+EIDV6BqyQxk0HTfB5I3y1yEFIPmFzsf0qGpaTYWYm8hBPgA6+RZtIZoIG0fF9CqzPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5YUQNNn1u91cysW5vXfNKj8czSnQVfSg7RsY7VAjMHU=;
 b=FB/iAjSS39oDXDOU6tPKUGFfvldZowENbQEoBcz9xvXRCnsU3Khm7JSBa6RUh8N3pqTsAL15dWFZulmSD0Uf8qkQdCE27G2LMkNi9UNKT79VIricoppwpn5XemihMugqA3vdvLfOBmMMcRScmhJ1th4psd49aIHvVpf9k54u0oruC6ixB2a8OAIF0bNuxJngu4VP8D4F4udPWT1B3SSge7E+LX/rRK/+LpmIckQBq3BsUbkS8GSbf1+z0UI8zym0gKu9sgxYilStNmUkdkju0KgREiFJt/kOjFrmIF61YZ7GDph3mAddQ/P1KIja4azfWgmK7zTKrlr0IPDVau/65A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by LV8PR11MB8724.namprd11.prod.outlook.com (2603:10b6:408:1fd::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.35; Thu, 10 Apr
 2025 04:31:48 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%4]) with mapi id 15.20.8606.029; Thu, 10 Apr 2025
 04:31:48 +0000
From: Qi.Chen@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][PATCH V2 1/2] recipes: adapt to qemu.bbclass refactoring
Date: Wed,  9 Apr 2025 21:31:38 -0700
Message-ID: <20250410043139.1132665-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0350.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::25) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|LV8PR11MB8724:EE_
X-MS-Office365-Filtering-Correlation-Id: 294d9cfd-fdf3-4806-dd1e-08dd77e89b92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ACGYTg1tUQfLfF7eOGHmnZVhCoxYAsEf0WFKeeny8yDBKvwrXfXo2S2xGioi?=
 =?us-ascii?Q?aWitrjuVQNHl21WpH1DwzCs5p4EWs9xKHd7WEqWmFfuISw25HTKgXiUn7vOy?=
 =?us-ascii?Q?8HfWxhNCCekKsS0VHjpEUXf8v/5kvGto4kUk+GiH1nNNg+JvS5Bh8ENSfVo7?=
 =?us-ascii?Q?Hs0e2zsLJ3lb3kD6SPMg766y/uThedCmR5jZuDXsa0KgblCjzmIGa50msHcZ?=
 =?us-ascii?Q?tsXpPa+zgxLXMQD9Z21KYzfP6TPNlmsAcRzes7WXV8BPJVcFuhW7P4N4Rxmt?=
 =?us-ascii?Q?Yd0nvXWaVNi5ziH5GiFINq4Tr2T5USMRxatHu7bBFda+M4jjzREnUxqCldzL?=
 =?us-ascii?Q?a/WG6eyJdF6ky9nFDUfo79TLg1gnFgcQPEXCNaXSCYTh6dmGAr8YlPxaR0iB?=
 =?us-ascii?Q?zBebA9pVNqNfI1l3fVTW7v5LfYMuwjUaWNF4x5ZjpEEr5EttTx5YvUFi1knG?=
 =?us-ascii?Q?iwvN1KdbutEnHLoay+3J4sfHoJiy0Ki+sNLR0HFXPA8BeLkGKrAqVQS+zQjN?=
 =?us-ascii?Q?erlz1USPhazTB4NazQ7QbicCTWEVsFypJJ55Ak8SF77dN8N6wIe81l5K1fN6?=
 =?us-ascii?Q?7LIFKKrrj6Yu0lhMSR/r57y9uq1Zkx+mBPVLWW58ph66mgsJl1j3oOVPWtuB?=
 =?us-ascii?Q?EVKpDdartYGSvEZEQumaHn5u+NUI37ZSPEi6LB7RSic2GYG4h9CE9PP82WJv?=
 =?us-ascii?Q?plPYR2xpAAmHEzCYuWKoxAh+B0/vxNHJGbRmNoVz/1jfeCIfRzv5rOBgIyjy?=
 =?us-ascii?Q?Gc71u3QAx7J9Cz2ri0Byh3ydIa63NfH+Sg4+BkegwVqHPVboMVurLPOpQSSR?=
 =?us-ascii?Q?FOBuiQ/XWBgRLQuVleKjmMuFBYvyxXDNNxHV1fZYsIXm4FNaLGg7a72wLwac?=
 =?us-ascii?Q?Wg40oJbprCRWVhJJaB/4N/+WMuYt8sVQZlPINRGdqsI7Fu/yEx1jT0VMVSVd?=
 =?us-ascii?Q?9ZNO30rOTSXRIGgkdxTzh507GucuZbBv9qHSM3l7cwXN4YUjWgnIO/WvEpPc?=
 =?us-ascii?Q?tqDviQCfowsQv4ujF/4epo7Ltqnycii8/gnYlBmAfdii3cQLnv3QW4hQHJ2K?=
 =?us-ascii?Q?c17Wf5bFp+ERPdgNHemvNffHghjRGO9rkWyf3n7r31DwLDyuYpr7qX8Rvl2G?=
 =?us-ascii?Q?7759IahVfXuUI+UXRTBcpt2WxLboEPXKVsxccG9okOVKr9PHQVAkMp6LtW/R?=
 =?us-ascii?Q?ZLwFgq71hmcthP182IDzINssFrGOoqLakBKW9bkC3Zm7m/NPSzgpoKcvRxkV?=
 =?us-ascii?Q?PSP96urlaNE5K0zzGMEg8Xz70qCzA8XTjacnfTdgqu4x/Xqv6/q/Haeb5cu5?=
 =?us-ascii?Q?8GaT6UhjBVVZDXhJCK+LubRpaKLkwkshn6JU/2cWoQRefftEofWDuT3qgaQ0?=
 =?us-ascii?Q?COajo0m8mK3hwTHPH6dogB66ZfMZyIEJhF1mtoqiktQiS4ALqQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?LQcEOBdbFJfm+SDtdtrJ2GWFaHO5mvlW8GwaNZXSee+kvCp6xA4nSaBQ03pD?=
 =?us-ascii?Q?FIyBMTCw5MuKJ079wI0WDiDJtz0Cs/rAWoAW41+rRMVEBs55ONlkU8uCxVau?=
 =?us-ascii?Q?bt0qEUuFRYDc70AgvkYumLOnBkuk5QwiNFKtblioiqbdgTetXsJM8bkRT0wl?=
 =?us-ascii?Q?mvro/N+tevujb9qSgqF1cvARCxL4MPACQAkUYtI0Y2uOf/KImqB8BMDkgsE1?=
 =?us-ascii?Q?/UBlRv3ahTzFK9E/fS0Qmz7CqeCi0tsfwaHw3Huk5Fwtk+rzbhuOzjX0Yvb7?=
 =?us-ascii?Q?F3K/x12Kk0uybds97fukxWiAe+IRO41vVufjpDlHKstQRcWNt3qXnNzRLk2x?=
 =?us-ascii?Q?1h2sRAIIOTEWUQZpOwMs+AZfb+jj2S7IptcSX+WLMpmvmXEelHE4LQ20h0bg?=
 =?us-ascii?Q?jkh9HAxCYGq1RHDf1Bd+LtLHe4lCvy3bdiqr46LoSuGeheeTOH6sg2lb2L22?=
 =?us-ascii?Q?tS6ymkHLt0HJNwv24oV0daosvaMJo+xeKLMMYBmmfj3OqY3xY27HdOURoslG?=
 =?us-ascii?Q?WzU0xI2/8eTfc2C1WclzpWdr7DCsNI4fk6htpEUTFtBa9gqJH6HbIDd3gZgB?=
 =?us-ascii?Q?ibY6ICzLS1iLeeNSgh8cCWFE453I8gxRSPblzh7CENUGNuDeZD/tH3Hz7uFN?=
 =?us-ascii?Q?t6dxpLebfq1MacYfkEjmpseL6Yo3d8xgQ1pYgWkWbGB4q/6qDy2WCWcjB3rr?=
 =?us-ascii?Q?7u/vpUrDErqY2afXMvyfTt4KL2v6UAJ/8yEnouI8N5NxlRh97RlzX6anHVYB?=
 =?us-ascii?Q?RQuRosh1mBKGpQucw6G1M/AbGi4A8RXh6hMtkbr7OfEu2PGcg+4jpgKcC0Ry?=
 =?us-ascii?Q?M2azJmU7YlTWH0dX3eymMYVjujCoi4+O6umokPHtxWtdvKQjj5apqSrejRj0?=
 =?us-ascii?Q?jRw4Uw7wP3Po0/ExG4M9583PN7PB3FqymKJ9O+0oOMdkTMRq6SD786ZaqGFy?=
 =?us-ascii?Q?GXEjlK+NEAEK+HewOpGBqpcz6YOO6OCTO2A6tl8Ehsjj+RZ2O++JwwZVzV0a?=
 =?us-ascii?Q?6XlpIYCMQnxCVU0afsM60Trtrfcilv6HFJlxcYR6v4LYoCDHetdinEhgLqTe?=
 =?us-ascii?Q?wzByWQllZVH0nf8W9YUHby/qmvT2L/nLeLsxeRqXH6IlxbUeJBUWfl7kmYUU?=
 =?us-ascii?Q?YgcXfONoHyxPnhs+U55pjacowHfoDqdO2djWLeWuUEFLnM65Qgheq9UQhTsG?=
 =?us-ascii?Q?d/fthzhNej2hUU10YefM2z/AZAmnyliMq9oePRcYqIOMqEibnz5fiIugLthS?=
 =?us-ascii?Q?S2w1f5MNMtBsZlELQ7B+z4DzuWuo0DvD5idcmuw5BFNLon6tM8uwFnaFGsVz?=
 =?us-ascii?Q?DD+daVoD7EkBTYSiFtFgCjhjf+NOuVf/prDn7T63VYEM7dYxPCTGLSypJtGV?=
 =?us-ascii?Q?NQy3G2UCPNjkA1DeGCRn8U4jqytdOWNmgoK47uKHD/JyKrpWU2OygtaOQcpy?=
 =?us-ascii?Q?XEFWHnFWJf3NcFzSrqUuAOoG1OliVp3xl0IW8wXf6B6pewU1IhO0CdeLSKuj?=
 =?us-ascii?Q?NzsWqK52sJbtEAX9B7bbiRt1u2g+6hoZTdyxhMNjedzyFgEA6XQXo4HABvT6?=
 =?us-ascii?Q?ysDjDsDk1FRepTgtcHoUXmiEsKR+5t/jWL+fDT7sKp46a9EXDE48tEgZoR1z?=
 =?us-ascii?Q?jQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 294d9cfd-fdf3-4806-dd1e-08dd77e89b92
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 04:31:48.3676
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nLWS4nZAdAqlk/Ja+9kgPzFuUKk3WRLyCa+cHgS/ofYA8RMy4csAWaui6l6PI0C7IAAN8dPP7a2uestio8S4cg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8724
X-Proofpoint-GUID: dlxJQ1Zu26xCQBIy6fDUywKg5FIjUBJe
X-Authority-Analysis: v=2.4 cv=YJefyQGx c=1 sm=1 tr=0 ts=67f749b7 cx=c_pps a=19K1aDEwnJ0RahI1emVHDw==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=XR8D0OoHHMoA:10
 a=NEAV23lmAAAA:8 a=p0WdMEafAAAA:8 a=OGsvooznAAAA:8 a=t7CeM3EgAAAA:8 a=Vx67Z-VKHrIevtutq1IA:9 a=B5HV4OX4S3AA:10 a=Ro9wbLpunPwA:10 a=_MKx33s3DjsVgJzmPKfz:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: dlxJQ1Zu26xCQBIy6fDUywKg5FIjUBJe
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_06,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 bulkscore=0 mlxlogscore=999 adultscore=0 lowpriorityscore=0
 mlxscore=0 clxscore=1015 impostorscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2504100032
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Apr 2025 04:31:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116754

From: Chen Qi <Qi.Chen@windriver.com>

Avoid inheriting qemu.bbclass and use oe.qemu.xxx instead.

Also, the unneeded 'qemu-native' dep is removed from PACKAGE_WRITE_DEPS.
The package creating process does not need qemu-native.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta-oe/classes/check-version-mismatch.bbclass       |  4 +---
 meta-oe/recipes-devtools/mpich/mpich_4.3.0.bb        |  4 ++--
 meta-oe/recipes-devtools/nodejs/nodejs_22.14.0.bb    |  6 +++---
 meta-oe/recipes-extended/icewm/icewm_3.7.3.bb        |  4 ++--
 meta-oe/recipes-graphics/graphviz/graphviz_12.2.1.bb |  6 ++----
 meta-oe/recipes-support/espeak/espeak_1.48.04.bb     |  4 ++--
 meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb        |  4 ++--
 meta-oe/recipes-support/uim/uim_1.9.0.bb             | 11 +++++------
 meta-oe/recipes-support/unixodbc/unixodbc_2.3.12.bb  |  4 ++--
 9 files changed, 21 insertions(+), 26 deletions(-)

diff --git a/meta-oe/classes/check-version-mismatch.bbclass b/meta-oe/classes/check-version-mismatch.bbclass
index 7b46151b03..dc6eeab4e7 100644
--- a/meta-oe/classes/check-version-mismatch.bbclass
+++ b/meta-oe/classes/check-version-mismatch.bbclass
@@ -1,12 +1,10 @@
-inherit qemu
-
 ENABLE_VERSION_MISMATCH_CHECK ?= "${@'1' if bb.utils.contains('MACHINE_FEATURES', 'qemu-usermode', True, False, d) else '0'}"
 DEBUG_VERSION_MISMATCH_CHECK ?= "1"
 CHECK_VERSION_PV ?= ""
 
 DEPENDS:append:class-target = "${@' qemu-native' if bb.utils.to_boolean(d.getVar('ENABLE_VERSION_MISMATCH_CHECK')) else ''}"
 
-QEMU_EXEC ?= "${@qemu_wrapper_cmdline(d, '${STAGING_DIR_HOST}', ['${STAGING_DIR_HOST}${libdir}','${STAGING_DIR_HOST}${base_libdir}', '${PKGD}${libdir}', '${PKGD}${base_libdir}'])}"
+QEMU_EXEC ?= "${@oe.qemu.qemu_wrapper_cmdline(d, '${STAGING_DIR_HOST}', ['${STAGING_DIR_HOST}${libdir}','${STAGING_DIR_HOST}${base_libdir}', '${PKGD}${libdir}', '${PKGD}${base_libdir}'])}"
 
 python do_package_check_version_mismatch() {
     import re
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


