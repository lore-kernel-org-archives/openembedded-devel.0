Return-Path: <yi.zhao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03434C433EF
	for <webhook@archiver.kernel.org>; Thu,  9 Dec 2021 09:56:30 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web08.9487.1639043787587060765
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Dec 2021 01:56:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=BAVOQvWn;
 spf=pass (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=79772c8811=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 1B99iscS002336
	for <openembedded-devel@lists.openembedded.org>; Thu, 9 Dec 2021 09:56:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=5WROF9V790Ygn7f7j6RZGxTE6cbkDWsaJnX76XOMbqs=;
 b=BAVOQvWntbzPIn5rPRf8DwbNs7kV7QVtSq5bxgjWuD+gyOJypeYZ+xNMfrBumzVnlB89
 JE/zLKzvbIDeVw8Q0LtJk21LN66/VCwhdAK1T0YhB2mllB4g4LFFaNdGEisqeyM4Vn9S
 Wm4e28MAPtOmhzLNU5PHB8pjxLYgvamBTtoio661NPAUs1DUDhKrnmNYyVMXX2QMfyu0
 hSu2yWUWxUSZTGXaAxf++R2LrgxWqTUHeEnnxPVNynY3PLIaHLDP6C3wqSvsaR10NeRL
 d3bPUN/RlDyQHp9trbYUZWG+rUsh0e2BvCpz0uRrPf26twsV/xtgE+kbbHCEa112HuQB yA==
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2103.outbound.protection.outlook.com [104.47.70.103])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ctba61k8u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Dec 2021 09:56:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nHUovTZ2JRAk7cXooyZnmLPB+WK2KDYUrxJMc+8elG4vUTMNoAojXVfcid/MPINpaz28tFZ69RByMDg5aAc37QELe8Xf4/N3Y5cOr3qLB1DTxeqI3hMI3pxwLJzpg5sq78rGGSf8C23Fg3wliCO0GSEDfmjmz9cZzgzZQukuvyYbkSTKJO8ONeDCSzJjLnsXwChGxnG/BWufdGAIidaAF0Wg+D03pLyY41dRRivvALcmJvHR68tqpQ7saYWmaRbmWDMn5GTaPChlpoIE6ei90Zy1FkJo3uYUEKOqaoqD6cVy2FnuAFvJAl/658HPkdyH3DNaQUz/5WO8TxTlaZBufw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5WROF9V790Ygn7f7j6RZGxTE6cbkDWsaJnX76XOMbqs=;
 b=DNqWVgc3UTSQmxcfjWI2FWUHfW6dMjt6pZR8daAyvm9EiKZIG/lE0cJWOyjKTyjxKh0hpEmoRfeg7P8n7DGrjBDkEr2HrOcE1Ts+LPLYviEyHgZ7OGHcBd59l1hEhkU0urs/uWA3L6XyYlKilL+JkVJuqz71oMlIvughfKFX6Gu/oxx04Uvh31l/RW/Aal/M2z+lrn7zjXkNctJNi++Aj9byQO/+dvL52yzWNd3P7FDoMo5KFLW59GH7g1nGNx/U3xEPJ0fjKpiW2pj9wOTNudeAY3z+yxa9387UzCxhNsOUuoD07yeNjE91ncIZnTgaJs9nxDGITyVFukUx6VJgqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by MWHPR11MB1741.namprd11.prod.outlook.com (2603:10b6:300:10d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.11; Thu, 9 Dec
 2021 09:56:24 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::8962:26c6:20fe:eaa4]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::8962:26c6:20fe:eaa4%6]) with mapi id 15.20.4755.022; Thu, 9 Dec 2021
 09:56:24 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] openldap: fix strip issue with new patch
Date: Thu,  9 Dec 2021 17:56:14 +0800
Message-Id: <20211209095614.173901-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HK0PR03CA0116.apcprd03.prod.outlook.com
 (2603:1096:203:b0::32) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
Received: from pek-yzhao1-d1.wrs.com (60.247.85.82) by
 HK0PR03CA0116.apcprd03.prod.outlook.com (2603:1096:203:b0::32) with Microsoft
 SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.21 via Frontend
 Transport; Thu, 9 Dec 2021 09:56:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a541c577-8b2b-4a8a-6b70-08d9bafa292b
X-MS-TrafficTypeDiagnostic: MWHPR11MB1741:EE_
X-Microsoft-Antispam-PRVS: 
	<MWHPR11MB17413C0B92F49E619431D333F9709@MWHPR11MB1741.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	f4B7sybdXTNqvkKhrVaWvBppYtf5oEm8rTLc39y42/+YqfpiZh3RBsGJeeZPXyfclTjKSB/WXxB9iNWQu0aaadhYBmZkQTABDjFqRCtM44NQpfm7ThudmVUt8FXFMf8cdbDxbx05EW9ijeljsNyp6hSqfItfkAWTjUwMGiDW8NhbGGh4XB5/PLISXI9DB/5aO+FYqlWqbfjSOhi1+CQgdmIdqTtZJFC9gNBJwiAuhPwaHWiwCrcReus8Ddu86Q/Upqo6PZb1AY1DUdXtUreUFhsN0RunTNZKOE5oyngVSPM0vdkXJKrSmkycJjDdtvfOeqkpwxm8ARnC0fTrP0EtNAGIPXzCNT7CyntQhZ2YYevH0A4Ou1PQO3N/WdWUx1tmHUIMZb3rhrpwmm22y0C+HImv2Uk5LleVgES36X4HAui9jJVRzAbWw/MNvVmndmeUWNQKoHdWaH9ghWtkcvT/VLJ8VSP5EvY9Elz+nhnLVSqMh/9dKmlG3gJmxKqQ9bs0PJgu7NdvVOvmY5mI/tKI4nsxAz4A3RTQ7j1DbdzFqZ5CYbbv8Be/JJIrn6a3WmPkDuBuqAukjSu5N5yGOXQobc1/ep9xVayxS448XkIFJD7ID78tJSDZbGItWKEKmr86m+u9sBqDr/5pSpquWYtsV11fvGPU5laRRlUK8wlMSQl6fQo5VuQQOOC0BDNL9s9OtTQlN31G+erPURPp1ndJiPV5CIXs7l9XFd8z1+rtAjo9KnxZMmZygIcwe6pHtEzcVS4M0LUyyXsDbPWmlF87ss6LF+PUmy8qRdSP5OTWmDc=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(26005)(44832011)(38100700002)(36756003)(2616005)(6512007)(83380400001)(52116002)(956004)(38350700002)(508600001)(86362001)(66476007)(66556008)(6506007)(66946007)(1076003)(6916009)(5660300002)(316002)(8936002)(2906002)(186003)(8676002)(6666004)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?mcu1kUaKUdpFgqk5cstGtS/FEpKVqOPkuDxXHA4IOa8myBlLNYL9Qdd+TCjj?=
 =?us-ascii?Q?6EGPlVgyUu2+UbbivvHy49qO74+dKorN7ZxAm4WQN8T1qF/ZN5fvY9hVZSQ3?=
 =?us-ascii?Q?2B2aoQKvykEZ3K9vpgegm+FfqvGMuFFn9IPizDuqkU1iKh0JjE0uUn1/4CiJ?=
 =?us-ascii?Q?bXa0/xu/eJO6ukljswJXE2ZxNSJS2zX5kEnzjOuCjY2VfaA3px45AbilcAbX?=
 =?us-ascii?Q?zDbUc3rvmi4yui7RDQxOO6kPnKuMWlqZEvHnBV6XKS6z2X/DTQYDrDiqaULI?=
 =?us-ascii?Q?kEUegqTI7XCzmuyhfucUEmnEUARwpaCBR1flReqYsfm6aV8fejV92hlG+hCB?=
 =?us-ascii?Q?Cx778qZWuCnxA1G4deJuD6mdEc8b+6DdzKwiMmpJ+SyJO6RvA8SRtbW09DXh?=
 =?us-ascii?Q?PTPamMO/FSneXS4mz8I+T7X3YRNAHUuTTZLpTQst7bOxB2EhU7SWCGckrlaI?=
 =?us-ascii?Q?qDPsRfj3y4NfNKNVHraF0QT2gUHnfjRJfrfvFt1NDfi1aP0vpkpXDmZlyQkV?=
 =?us-ascii?Q?s+j4/12kjP8QqLbVjO/Hpyrm5vobs+mV9Kngwti70B88XVGLTs6uNdbfr3+z?=
 =?us-ascii?Q?iBR0wlgvxzx8yzuunm5J5H21sG2b+ufsM5uXzE10ZsZBVDGVLhobppQs0zRK?=
 =?us-ascii?Q?WuoeUJfdKuB90tWL1F6B5ASbW8M41UoM5jODl7gEJrinSjUPmc3qE0c56CtF?=
 =?us-ascii?Q?4Uko+Gbp8oWVcI4qtIe2vTOeLuXU53hj7I3gINuM3gZuybNbLdFU8AVWSwUJ?=
 =?us-ascii?Q?P4gyyO5vmTsU5mMbVEMUwFDmFofMsUBjjbJCphoi/UPVEKD6VrM/mu/TewBD?=
 =?us-ascii?Q?ZA5VhkMiE5/35prxxuV0XO0h42yjQfQUGE7yAqWeXoeo5pE5GgntNdjsJvuO?=
 =?us-ascii?Q?EpbPod1i63SQs07DIjFAGeqjclSs+YHsgFLN7dJUKLTd/ruRGF/+pOcLY/2h?=
 =?us-ascii?Q?3yJEaVdQaEAHTqK9kkaQqP+v7TY/jHirakf9zF68ZoBom+JkqHQSFhEcLPYE?=
 =?us-ascii?Q?9cyxejMAdubGgxUufnluZEFJR1XXVS6883IstF7nsJo1sQTd5stvs9yBlZ/D?=
 =?us-ascii?Q?MpM9ET6ye+qK7SKMyRl8RmQyITOvmB29RHF66ChXofMgCiFRk2MT0SXhzrNF?=
 =?us-ascii?Q?GnIsVI988n9Wdt+UEzPmUXSxUj5kEXzGhCXPRT+JxafPZ/yDs5uuKHkznx3I?=
 =?us-ascii?Q?fgoPa5tWwZdBgoAm74eUc+hk6kVn32004JfTjXOh9fKFGQfJrwfy520qxKn/?=
 =?us-ascii?Q?8WjdlfMr/cJ+cKvTTV4Vm7mpys3xjY4VTUFBtVaE2FfzpTHZxk0rhTcUa/Sy?=
 =?us-ascii?Q?xll11tHx49ZmRWx4aIqUoQLWKZYuNDD/AJp476GQTw32cVw357M1AfNbJGt6?=
 =?us-ascii?Q?6ROeo3pLThL5egTQmRZ0AcZIZbFnqqRzoG5jzzf+aYi0Ti3WlY5gup0Z5J0x?=
 =?us-ascii?Q?FcujvWyeWSd+4nnMu+aS602x59PAq2knyZ1PCv6gBfY5FIFA9V0GGbGxV1Af?=
 =?us-ascii?Q?ybOlB+OGjTHUVC/nhyI0wRhTnXjGVw41pBBZJhY105WajxfUQjJOFbg5UvQM?=
 =?us-ascii?Q?85wjTlT7lm9oAYWZhVPqqP4G/YYq0AjxvXf+Gyg+/qIaopx8GsnYPEX+5Ltk?=
 =?us-ascii?Q?XY+P/eXVYubqEGS7KPt+kkM=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 a541c577-8b2b-4a8a-6b70-08d9bafa292b
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2021 09:56:24.6550
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 O06tz6WRPspG+E8O3mo3GzbhF9tcALyp6RlgwtA8dnoYJmLwUXFbqNm4u3+81lJ7jGfTTUlyJO0udfnBLAZDEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1741
X-Proofpoint-GUID: yb8tm2sylLIryPAjLulfUTVPjOwJLTJF
X-Proofpoint-ORIG-GUID: yb8tm2sylLIryPAjLulfUTVPjOwJLTJF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-09_04,2021-12-08_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 phishscore=0 clxscore=1015 suspectscore=0 mlxlogscore=999 adultscore=85
 lowpriorityscore=0 impostorscore=0 spamscore=0 mlxscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112090053
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Dec 2021 09:56:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94259

The patch install-strip.patch tries to fix the [already-stripped] QA
error with an outdated install-sh script which causes a parallel
installation failure:

  ../../build/shtool mkdir -p TOPDIR/tmp-glibc/work/core2-32-wrs-linux/openldap/2.5.9-r0/image/usr/lib
  STRIPPROG="" ../../i686-wrs-linux-libtool --mode=install ../../contrib/ldapc++/install-sh -c  -m 644 liblber.la TOPDIR/tmp-glibc/work/core2-32-wrs-linux/openldap/2.5.9-r0/image/usr/lib
  mkdir: cannot create directory 'TOPDIR/tmp-glibc/work/core2-32-wrs-linux/openldap/2.5.9-r0/image/usr/lib': File exists

With the new version of openldap, we can fix the strip issue by
unsetting STRIP_OPTS.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../0001-build-top.mk-unset-STRIP_OPTS.patch  | 38 +++++++++++++++++++
 .../openldap/openldap/install-strip.patch     | 17 ---------
 .../openldap/openldap_2.5.9.bb                |  6 +--
 3 files changed, 39 insertions(+), 22 deletions(-)
 create mode 100644 meta-oe/recipes-support/openldap/openldap/0001-build-top.mk-unset-STRIP_OPTS.patch
 delete mode 100644 meta-oe/recipes-support/openldap/openldap/install-strip.patch

diff --git a/meta-oe/recipes-support/openldap/openldap/0001-build-top.mk-unset-STRIP_OPTS.patch b/meta-oe/recipes-support/openldap/openldap/0001-build-top.mk-unset-STRIP_OPTS.patch
new file mode 100644
index 000000000..9d25f2c59
--- /dev/null
+++ b/meta-oe/recipes-support/openldap/openldap/0001-build-top.mk-unset-STRIP_OPTS.patch
@@ -0,0 +1,38 @@
+From 321839cbd1d57f12d3d6695254d2003473d8dd1a Mon Sep 17 00:00:00 2001
+From: Yi Zhao <yi.zhao@windriver.com>
+Date: Wed, 8 Dec 2021 16:58:55 +0800
+Subject: [PATCH] build/top.mk: unset STRIP_OPTS
+
+Unset STRIP_OPTS to disable strip to fix QA errors:
+
+ERROR: openldap-2.5.9-r0 do_package: QA Issue: File
+'/usr/bin/ldapcompare' from openldap was already stripped, this will
+prevent future debugging! [already-stripped]
+
+ERROR: openldap-2.5.9-r0 do_package: QA Issue: File
+'/usr/bin/ldapdelete' from openldap was already stripped, this will
+prevent future debugging! [already-stripped]
+
+Upstream-Status: Inappropriate [embedded specific]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ build/top.mk | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/build/top.mk b/build/top.mk
+index 38ce146..6e9fe1f 100644
+--- a/build/top.mk
++++ b/build/top.mk
+@@ -60,7 +60,7 @@ INSTALL_PROGRAM = $(INSTALL)
+ INSTALL_DATA = $(INSTALL) -m 644
+ INSTALL_SCRIPT = $(INSTALL)
+ 
+-STRIP_OPTS = -s
++STRIP_OPTS =
+ 
+ LINT = lint
+ 5LINT = 5lint
+-- 
+2.17.1
+
diff --git a/meta-oe/recipes-support/openldap/openldap/install-strip.patch b/meta-oe/recipes-support/openldap/openldap/install-strip.patch
deleted file mode 100644
index fb7ad8f59..000000000
--- a/meta-oe/recipes-support/openldap/openldap/install-strip.patch
+++ /dev/null
@@ -1,17 +0,0 @@
-# This patch ensures that the install operations which strip
-# programs and libraries (LTINSTALL) work in a cross build
-# environment.
-
-Upstream-Status: Inappropriate [embedded specific]
-
---- a/build/top.mk
-+++ b/build/top.mk
-@@ -125,7 +125,7 @@ LTCOMPILE_MOD = $(LIBTOOL) $(LTONLY_MOD) --mode=compile \
- LTLINK_MOD = $(LIBTOOL) $(LTONLY_MOD) --mode=link \
- 	$(CC) $(LT_CFLAGS) $(LDFLAGS) $(LTFLAGS_MOD)
- 
--LTINSTALL = $(LIBTOOL) --mode=install $(INSTALL) 
-+LTINSTALL = STRIPPROG="" $(LIBTOOL) --mode=install $(top_srcdir)/contrib/ldapc++/install-sh -c
- LTFINISH = $(LIBTOOL) --mode=finish
- 
- # Misc UNIX commands used in build environment
diff --git a/meta-oe/recipes-support/openldap/openldap_2.5.9.bb b/meta-oe/recipes-support/openldap/openldap_2.5.9.bb
index d95d6912e..c008c7b4b 100644
--- a/meta-oe/recipes-support/openldap/openldap_2.5.9.bb
+++ b/meta-oe/recipes-support/openldap/openldap_2.5.9.bb
@@ -21,6 +21,7 @@ SRC_URI = "http://www.openldap.org/software/download/OpenLDAP/openldap-release/$
     file://slapd.service \
     file://remove-user-host-pwd-from-version.patch \
     file://0001-ldif-filter-fix-parallel-build-failure.patch \
+    file://0001-build-top.mk-unset-STRIP_OPTS.patch \
 "
 
 SRC_URI[md5sum] = "237fc2d881c27f8dd5d9f396e2865c11"
@@ -28,11 +29,6 @@ SRC_URI[sha256sum] = "c08e12f4ca5803d5d9f9948c70ad3491282cda3c17ec8b655dcbcb2364
 
 DEPENDS = "util-linux groff-native"
 
-# The original top.mk used INSTALL, not INSTALL_STRIP_PROGRAM when
-# installing .so and executables, this fails in cross compilation
-# environments
-SRC_URI += "file://install-strip.patch"
-
 inherit autotools-brokensep update-rc.d systemd pkgconfig
 
 # CV SETTINGS
-- 
2.25.1


