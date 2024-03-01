Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F9FBC5478C
	for <webhook@archiver.kernel.org>; Fri,  1 Mar 2024 15:03:25 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.25285.1709305395732808320
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 01 Mar 2024 07:03:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=cZ8nLnfE;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3790b160fd=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4216Mv46032623
	for <openembedded-devel@lists.openembedded.org>; Fri, 1 Mar 2024 07:03:15 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=hup6Auqcim8drlY6s8
	1sCesIP/Hc/J81GJ50CUzbX/k=; b=cZ8nLnfEpzMnIwCLTJTcwAbMoABgmY+LCF
	GDlJ9IAOVt6IicNUcSLFSri3MjHkwcBpXE0wrtW3kb5MqdJpUxUzq81UiUeym0S7
	f2gNSQLvK2S0wFOZhR6WWhgx0ylFkmP+t7qdASQz50lQvMR0/qWURCBIgVLWkKN4
	2TXCNXKc52IJc4i61fEqGazz62QzrJnoWGr5eqVwmZHgUHJ1USUz7wKFljloSiYn
	PCiz+0QGSbYv1WgCZi+4pbTHxmiCs9HK25awF0FdljX+tDN7WTT7YhhATXGJ/hM5
	jaD7zJ/tllbmH+NcqPXLQtRKoV+R+7fidzcYRzra+t2zWXp71EyA==
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wfgumpbkw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 01 Mar 2024 07:03:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GJvRWCmOvgy0LncX8BidApJqa9ZUd67nT40j6bBZuiKfie+Ej0K1U2clvGSffD1P+Kn5JYMJyHn+hboKjVaS/J4lUY2Hw0oAfeFid2418asEsop1pw9+SID32igAZ7aFM7/BjZfZqXDL8atMrlnB2n3LL6mEug3Voah0A4zpMN80OeKc+ouN951I5WlbHk1jXaEZhg9nyootY6DdZQmRy+j0f7m+PBNMZ3JjpM0l26UiabYaZU8fEENr3HBVXtIZ5UwhDOloH7K7GC5iUePRQO4HYvdz5IIOgKLfyfxl7jj2QKm7IW2Bd41Ed1Ej7eWV1gXPkP7opS3rhpW6WrihBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hup6Auqcim8drlY6s81sCesIP/Hc/J81GJ50CUzbX/k=;
 b=TytuXMo8Xefm8Prz0x5fHk0BFXRWcMJ2VJIvWzmMJGJbJqmj6PaxhzIeLNSo9BB6mTzTu0IYIB42f81Md8Oj6NcVHDhLde4F/RXaYKajeSkUn03TaQpyaKirzg3nmrhByPl6gCR8sZ8+zAd/xIUT4Q3Km8qqOM3hp5YwpZnxsmUTE6+Go/csZi4Sd3YEhaSg83xGZ+EEPWi4+vG7CoEWoezUrvftzc1AxkwnRUcmQbfoq+0kKA3+0O3gRrUk5/v/8eajEz9RN7sTtGc6unflr9eVucQZFA4HGvudDhgsObu0WnirH/SUgFPxQdlTslr65PsHFyHS2ifbHaoB1Gafiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7484.namprd11.prod.outlook.com (2603:10b6:8:14c::10)
 by CH0PR11MB5220.namprd11.prod.outlook.com (2603:10b6:610:e3::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.12; Fri, 1 Mar
 2024 15:03:10 +0000
Received: from DS0PR11MB7484.namprd11.prod.outlook.com
 ([fe80::97da:833f:8511:a558]) by DS0PR11MB7484.namprd11.prod.outlook.com
 ([fe80::97da:833f:8511:a558%5]) with mapi id 15.20.7339.024; Fri, 1 Mar 2024
 15:03:10 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] openldap: upgrade 2.5.16 -> 2.6.7
Date: Fri,  1 Mar 2024 23:02:59 +0800
Message-Id: <20240301150259.2338234-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0014.APCP153.PROD.OUTLOOK.COM (2603:1096::24) To
 DS0PR11MB7484.namprd11.prod.outlook.com (2603:10b6:8:14c::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7484:EE_|CH0PR11MB5220:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d4cdf3f-1bab-4ac8-bff2-08dc3a00b5c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ycwD5XwJqOtLN5oF68Qd2WfmIE0+KqdkoIUQai4aQG1yumJnvdzLcAZeZX+6PfcNCHlZ8nuJjtVtgpOfmdsRzOAo4WfjdOBjLUpCzD0iNAT1MpYKCg4EF6868KYwj8URSkIzIDT3HrTxSG1cl5FtaK6fqaZT68fOSpURLP4xBqC6XNWAnPqpwc9kD58Z3MaFN8zVO2Zhs0OjVKo24+X+tofhCu+v1VrFrY1lSukDeffT1LQgRksD4IiQ4InampUu5iB41KCWxJV7zofRmtf5IOHabE5swPB8LFWi2MmnMbPdS+s3zND/y6gIsdFGwXiiNgcr36cApbaZX/prk+J1avwXbODtxXDnZGP39AxpZ+7CI67SSPW3P82t40QupY8BiTzRZfRZJxCixxT9TgjJoKJVPduIdoFcnYawWU3Uhkk9ljuAYUsuc0GNS4X4toEcWBHTSHswjo/FyTrQeF93mOMhGR6L8vIlsKreETS/2KW295luuzoBV9OiG6PuzyK2pOY4PpgTb7zTMVd8XysTYebsnu8rHzFV8VimcXEcOTYQ3GHzB4U+yrinH/lCK4+3hjtMcxl5UGf6QNVZtWma6HvWFvxQPR7oQgDQmSeIpGourRo2IpbDxKZPHbYl+vXN6fqLXJI5oe5Ljw41JJ6C3vBObeoRwLuGd0WKmn6nXTU=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7484.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?nZN3AbMspK+5aIzXyxrroNiLrzjbljR/9T0oyEeY3fk1NBK4I5XxLzaMGFfT?=
 =?us-ascii?Q?i2ozbrPO/26vNtSRdGlRfpZB/2C2kkN1uR2KZqPkoHj+ZD0QrB4qhn+CYjzL?=
 =?us-ascii?Q?hEGm9wyPCZ8kbG+UHPi9RUDyANRlqWIZ3Q5l8PgU19Br78wvaO11rBJjCeXr?=
 =?us-ascii?Q?upmw8elAFYMvl3ls2uvpKbA04+52mb4S78QWQH/IwXl1Xs4OoL0dIC3gOB7I?=
 =?us-ascii?Q?4M0P5OgY0SiXyvynM1qwZOLi1ZCfLsZtXDPIXgDQERTVfB88WtV+x83oXSjm?=
 =?us-ascii?Q?c7sgWAAL3hgtzINOX9pPdhYk0MounuKCmeLen6b4NFdhDXDb2o1I5xjxg2OZ?=
 =?us-ascii?Q?m7M6F3Dv1MYOWzIm7uoDERSFgssLQONvFrIO6pkQ0EkYT7pEjJ/nDk2nG/dm?=
 =?us-ascii?Q?rdGnrgseDTF1jM9pMxFoC9Y16pqD7z8qK4PtIXJbv85RgpunD9pEr7rZnJig?=
 =?us-ascii?Q?1YYmkUCyUqne1t8tz/gYW+kXyAvLv0hjrSZvEwQrqb/RX710b5I29tE8jtvT?=
 =?us-ascii?Q?kiOhmIDw6v5tA03BoLqNpbRbj1Wgn7Qm/fc65SAvgVwZYJ1IfqqR4Hu/s9UK?=
 =?us-ascii?Q?thDgOxm9JseteSgO68cwm6e/sWNGdd2+tlj4TbeVQlbs4XMpttIRvjG3kumC?=
 =?us-ascii?Q?zAx63qmOw95+Eb/072NKqmJx1Tv2PxqShYIlqBhElm09C9W2lpZChPpP0Y18?=
 =?us-ascii?Q?HZjCXCVQjdt1NRyDKhxd7eg3rSTlzLDVo60wzqJn2yg6NlPZQaPBNxl6rZpC?=
 =?us-ascii?Q?77zdp82/JwwECixXR1j6bIV+qA7nPGt+dEYvnYjiiJgj6J5gNwpegjfn1Lg6?=
 =?us-ascii?Q?Tmwa6rhlW5eJ4DPR2rP+ADVJEFkOtAWV//c8QX7EPnos5gf3ymAE2he8J/Mk?=
 =?us-ascii?Q?kgWp5agLBngeaB21XDK4SI7u/1z0588HoU8opQQKH6vo5Z2QzjWAPMEp4NYh?=
 =?us-ascii?Q?KewSO++ectyTLJWkNbYM0QxUhRb0vm0sHjY+Hr8D5Ew9XVuH/ovVKdA+27Xg?=
 =?us-ascii?Q?ufOAdh7QY6trNtnzxAMkapev1wJP/kbuGflxibvx5i81z8svD/7WpNIZz/Xv?=
 =?us-ascii?Q?x+lI6DnF8LCnEE9vxQtmKJDtgRnzUGLDDzdhQ1sSw7ouTWzIjGjz/IsdCzDG?=
 =?us-ascii?Q?N+n2Hy/SruW5ahs1PyCbmUqb4iVvk2/iOsAylQ93j4KCOr8aiZWiDazr3osP?=
 =?us-ascii?Q?H0a+KZMm5MYbxmXwzvyYkNb0Lw6/uDcFXwUCoXYHZDc6PHSeQ+dK+fRmmi36?=
 =?us-ascii?Q?pzB89X2xW7GYHHSNgzyN+ACq81oB2BufuRmMfqStzg/IyZMzv8P3fXeCyNNs?=
 =?us-ascii?Q?tBKV+OOAmAcUzc8GhZt6NkUTl6oAUFS9AD+z3XF+Jr07EkeV/UpGHgFvZHLB?=
 =?us-ascii?Q?ZFbSExBevE97a22cRQPeu9i9E5C+i+2X0dI424QOqpch/IhBN0g+tjZsdAtg?=
 =?us-ascii?Q?i88gZxMF/gs2+daSqWO/4k8F5qWfGVq8Cw2LcFHJ+Et+zOwni0DTIlt0WPyg?=
 =?us-ascii?Q?GnKp4lwJXd/MNRmBTPm4CHmXtJSMIXOeVw03IfAwuRkh2LW53DlK7C+S9A7J?=
 =?us-ascii?Q?DzMdfqqzq+dHDCY7zT8egccM05m0fpyRqnZ36u0g?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d4cdf3f-1bab-4ac8-bff2-08dc3a00b5c4
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7484.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2024 15:03:10.5912
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0s9pK22MSFbfVTviNVZP/FTTCJgUhdz0zH5r3Mi/5k3YDblux0d/RdWROu/F8tIcPm7kCMqSKXNdf4H5K6vbJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5220
X-Proofpoint-ORIG-GUID: G-m9wNA84ErW6E6KluOfRW-OgM2gwBxO
X-Proofpoint-GUID: G-m9wNA84ErW6E6KluOfRW-OgM2gwBxO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-01_14,2024-03-01_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 mlxscore=0 spamscore=0
 adultscore=0 malwarescore=0 bulkscore=0 mlxlogscore=999 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2402120000
 definitions=main-2403010125
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 01 Mar 2024 15:03:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109077

ChangLog:
https://www.openldap.org/software/release/changes.html

* Drop PACKAGECONFIG[ndb] as it has been removed upstream[1][2].

[1] https://bugs.openldap.org/show_bug.cgi?id=9635
[2] https://git.openldap.org/openldap/openldap/-/commit/c6b43dcdc5d5ee60307564a64c276e5ad74af9c2

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../{openldap_2.5.16.bb => openldap_2.6.7.bb}         | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)
 rename meta-oe/recipes-support/openldap/{openldap_2.5.16.bb => openldap_2.6.7.bb} (94%)

diff --git a/meta-oe/recipes-support/openldap/openldap_2.5.16.bb b/meta-oe/recipes-support/openldap/openldap_2.6.7.bb
similarity index 94%
rename from meta-oe/recipes-support/openldap/openldap_2.5.16.bb
rename to meta-oe/recipes-support/openldap/openldap_2.6.7.bb
index 8d13a4ddb..e807fdef1 100644
--- a/meta-oe/recipes-support/openldap/openldap_2.5.16.bb
+++ b/meta-oe/recipes-support/openldap/openldap_2.6.7.bb
@@ -21,7 +21,7 @@ SRC_URI = "http://www.openldap.org/software/download/OpenLDAP/openldap-release/$
     file://0001-build-top.mk-unset-STRIP_OPTS.patch \
 "
 
-SRC_URI[sha256sum] = "546ba591822e8bb0e467d40c4d4a30f89d937c3a507fe83a578f582f6a211327"
+SRC_URI[sha256sum] = "cd775f625c944ed78a3da18a03b03b08eea73c8aabc97b41bb336e9a10954930"
 
 DEPENDS = "util-linux groff-native"
 
@@ -62,7 +62,7 @@ EXTRA_OECONF += "--enable-crypt"
 # The backend must be set by the configuration.  This controls the
 # required database.
 #
-# Backends="asyncmeta dnssrv ldap mdb meta ndb null passwd perl relay sock sql wt"
+# Backends="asyncmeta dnssrv ldap mdb meta null passwd perl relay sock sql wt"
 #
 # Note that multiple backends can be built.  The ldbm backend requires a
 # build-time choice of database API. To use the gdbm (or other) API the 
@@ -85,9 +85,6 @@ PACKAGECONFIG[mdb] = "--enable-mdb=yes,--enable-mdb=no,"
 #--enable-meta         enable metadirectory backend no|yes|mod no
 PACKAGECONFIG[meta] = "--enable-meta=mod,--enable-meta=no,"
 
-#--enable-ndb          enable MySQL NDB Cluster backend no|yes|mod [no]
-PACKAGECONFIG[ndb] = "--enable-ndb=mod,--enable-ndb=no,"
-
 #--enable-null         enable null backend no|yes|mod no
 PACKAGECONFIG[null] = "--enable-null=mod,--enable-null=no,"
 
@@ -122,7 +119,7 @@ PACKAGECONFIG[dyngroup] = "--enable-dyngroup=mod,--enable-dyngroup=no,"
 
 #--enable-proxycache   Proxy Cache overlay no|yes|mod no
 PACKAGECONFIG[proxycache] = "--enable-proxycache=mod,--enable-proxycache=no,"
-FILES:${PN}-overlay-proxycache = "${md}/pcache-*.so.*"
+FILES:${PN}-overlay-proxycache = "${md}/pcache.so.*"
 PACKAGES += "${PN}-overlay-proxycache"
 
 # Append URANDOM_DEVICE='/dev/urandom' to CPPFLAGS:
@@ -215,7 +212,7 @@ INSANE_SKIP:${PN}-backend-passwd     += "dev-so"
 python populate_packages:prepend () {
     backend_dir    = d.expand('${libexecdir}/openldap')
     do_split_packages(d, backend_dir, r'back_([a-z]*)\.so$', 'openldap-backend-%s', 'OpenLDAP %s backend', prepend=True, extra_depends='', allow_links=True)
-    do_split_packages(d, backend_dir, r'back_([a-z]*)\-.*\.so\..*$', 'openldap-backend-%s', 'OpenLDAP %s backend', extra_depends='', allow_links=True)
+    do_split_packages(d, backend_dir, r'back_([a-z]*)\.so\..*$', 'openldap-backend-%s', 'OpenLDAP %s backend', extra_depends='', allow_links=True)
 
     metapkg = "${PN}-backends"
     d.setVar('ALLOW_EMPTY:' + metapkg, "1")
-- 
2.25.1


