Return-Path: <alex.stewart@ni.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8645C3DA7D
	for <webhook@archiver.kernel.org>; Thu,  5 Jan 2023 21:21:56 +0000 (UTC)
Received: from mx0b-00010702.pphosted.com (mx0b-00010702.pphosted.com [148.163.156.75])
 by mx.groups.io with SMTP id smtpd.web11.1854.1672953709003119024
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Jan 2023 13:21:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ni.com header.s=pps11062020 header.b=cf0IK0Ss;
 spf=pass (domain: ni.com, ip: 148.163.156.75, mailfrom: prvs=03696f000c=alex.stewart@ni.com)
Received: from pps.filterd (m0098781.ppops.net [127.0.0.1])
	by mx0a-00010702.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 305Jnb3M019600;
	Thu, 5 Jan 2023 15:21:48 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ni.com; h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS11062020;
 bh=pNgCSZDNypUUR2Ze+YQ5ksZxl79I1xPB8PNQD2vIPzM=;
 b=cf0IK0SsyQRjq1bAXfN0g/m7+ojiu5njhTC++Vr8diDFskVMpL+A3NNcufWnD/XFK9fC
 K9AahGeUz3uIaoWwSwmUJIIdoMAKV0ZAwWYF96hExSfUop+uCMVJo7VA6Y/hEFXClxGv
 R4q9lQwLd/L/8NShlNRykFnFUzKLc4Kmtnz0RqkBE0LlT5+BdLN8Gh6nd1JK1pJnSc7m
 iiW1vJrTCPRe0jJX3zAoyf9Km8QwyJSHuC6too6kaCF6kSkIvvbvTJogGmq9NDnUpfRq
 PYS/KqXbbGmj6n60kKQoqKJZ5iqJSoYsd0orxr5vfaLR0MobbtK1wW1J4FGLY5WBk1Wz mg== 
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2041.outbound.protection.outlook.com [104.47.66.41])
	by mx0a-00010702.pphosted.com (PPS) with ESMTPS id 3mtj067scr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Jan 2023 15:21:47 -0600
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fwDmOgpVsQpxaw+2sDLIssrN4/0S4Gbguhf3BaWsVDjKQ0JZM2IcWbZitEf/A29rEvD/VVurvvODkK24yCUO6CTVgM61hhJfMAleBGObqyntiNIOjxU0g9gQOY8D1ui6PfTs/1KUkcKlrK9gGc/IFbSBSxcEG87NFZCRgzOBpk/hLnm23cDnIdR+FqOxm/BJfgNJxx0OcHUllKAEr9ENiAeOQ/vE3wWJtl1SVObAA6SQNIGxdOaciXlAD2ftoH0FqUk33IK+s43bVUWkb1nF7xgCKJgJqBtGi1mGirspSfsYN3a0Ij6kt+Kca4FYsQXT3H9YqYL6H3ZMIZo4nBtOzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pNgCSZDNypUUR2Ze+YQ5ksZxl79I1xPB8PNQD2vIPzM=;
 b=CibxQZ4HLdMXwozUDModyGgZbp/y+ZMcIAy8ciT7Q108FUD7zMsRp8zl5ZyQs14lwLvGaAIA85KV6dQjuOCVC9xHqfHkXmUL2EkkwQyxsRZ37eDf3YruO/SxCXWQv43BzGuuniVjyP7xsdVPBOszKaFudSDVykHUeXEz8AWN748dSy1Ht01CX+zWblPome0sFdMwMbS8Brx+29mnZ5Vgj6xLSKTObzHHPmxgA1l1+iB3dgDFT6plhsyGX00BJSoS02oNhARi+IJ9C1pBrBoT7zHGx4qGz4jopMBwnOpmihYwF2V8Myu+8/61y/umg+FdAakHV881lxIHIpAze61zQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ni.com; dmarc=pass action=none header.from=ni.com; dkim=pass
 header.d=ni.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nio365.onmicrosoft.com; s=selector2-nio365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pNgCSZDNypUUR2Ze+YQ5ksZxl79I1xPB8PNQD2vIPzM=;
 b=TIgzP7+d0DFMCXFryZw1S71SSjh5/e2Q7WHGLxy5OqdcX8WeUMgSsjHdAm3eG8YyDqMJcZX7GLMGuv9DsqH0GrCIdq1TQazOL675WhNKM5TaZHHpgf3PSc7d13b6I/EIRxQEEImsiL9+utUBBNgJH2xPqeMdDqzFoVjQiai6bJs=
Received: from SN6PR04MB5151.namprd04.prod.outlook.com (2603:10b6:805:90::25)
 by BN8PR04MB5748.namprd04.prod.outlook.com (2603:10b6:408:a4::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Thu, 5 Jan
 2023 21:21:38 +0000
Received: from SN6PR04MB5151.namprd04.prod.outlook.com
 ([fe80::7297:3404:defc:f77c]) by SN6PR04MB5151.namprd04.prod.outlook.com
 ([fe80::7297:3404:defc:f77c%7]) with mapi id 15.20.5944.019; Thu, 5 Jan 2023
 21:21:38 +0000
From: Alex Stewart <alex.stewart@ni.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alex Stewart <alex.stewart@ni.com>, schnitzeltony@gmail.com
Subject: [oe][meta-gnome][PATCH] gvfs: obviate the ssh-client requirement for gvfs
Date: Thu,  5 Jan 2023 15:21:19 -0600
Message-Id: <20230105212119.2022447-1-alex.stewart@ni.com>
X-Mailer: git-send-email 2.38.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SN7PR04CA0029.namprd04.prod.outlook.com
 (2603:10b6:806:f2::34) To SN6PR04MB5151.namprd04.prod.outlook.com
 (2603:10b6:805:90::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR04MB5151:EE_|BN8PR04MB5748:EE_
X-MS-Office365-Filtering-Correlation-Id: cab58939-e2c7-4ed0-41b8-08daef62d4a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	4WKu1cguT+Yok+fJWpcuPvijeW8sAg9mngpovKnNLZNa5b06PI5dL4tlg7PV0xX1v9ExBQkPcPWAbBXcWTONXJttdFQClv37c6csf4/FS7+3cumMIGyeetzhGaPObYiEJHHuCuuwI5IIzbEx1rMrRNdWdxORzn82eMVjntl7LjUU5wSVrF46CIrKkzMub8BbzNO7jfdZA7rQbNxjesahTAXo67XMV04SWHNxKFU9U1wmkxIIV0OGPFM/zOxWUPWfpBzZSEO6PhckRjQbg14GjIWXKNcE4NjwISyDtWhbgJFnZPMjfVI+R6s/JsABpTl1TAcAndf/NbCjm/gvmFkXJNnnY0diyR2kT25+eWF7Z9+Nm8C6LzSTjPhPLMWT19cNiPSZtookmvIgfoxFdGzd0+SOTHitNUsRPtUou49cbwMEQ3I114S2sBYtDXKPKC00tzvhmKnmYLPuSYZOkgHvHB13Ly5pKgbd488Gngj9FfxY2R7+16AQk14t69TwK6HI/KdbhMSIaiCb6HJU9qvGpi3ckraXnettHZ6GbzlGYM+9EeX2ArnTdYh5JKp6ERFPOZMcgYiAnLv/91iiHoqt/wG5pTnnZeRsrPF4eu5kN/fceKIU3EGNYqDkIgljw/01dosbGk2x4l/3pImOAmtJ5Vg1zGfq0oxqkAN4o+CzM15vIPmtZROzdtL//25v3VPg
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR04MB5151.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(366004)(136003)(376002)(39860400002)(346002)(451199015)(5660300002)(2906002)(44832011)(41300700001)(8676002)(4326008)(8936002)(66946007)(66556008)(316002)(6916009)(66476007)(478600001)(966005)(6486002)(6506007)(83380400001)(1076003)(26005)(6512007)(186003)(6666004)(38100700002)(2616005)(36756003)(86362001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?NlaaBl+zhXy2szk7/yJR0EwphuBrcv9rzo4IwQ+kwhiniXHmL4XuNU4538dE?=
 =?us-ascii?Q?GOGCF7N3xqodKXvbBEm+gmjTs0oZ60BTVJ34Ou34FLgZMFS7Ii2V3KRbfrwh?=
 =?us-ascii?Q?LCqOjER4vxuud5KUG9+e5ySM6eygdODITeNU2QjTG4Ze7OaYqsNt723BLEIs?=
 =?us-ascii?Q?ElwWtyHwDV4ZIrEPHooDjBgyReJX3C5uUCyZjrVc9K9XcVz5PpqMSvN37T4s?=
 =?us-ascii?Q?0Zk1VIym06URIJgTZ6fgFA6q412qd8KmvI+MY7EePmlYa+ElQYN0y8S6v+K+?=
 =?us-ascii?Q?/z/4kkXiJGkVTwX7QYZvemW0sTl39CKcdCIlhroj/6FGoyJrVpqMXSjbf/Kn?=
 =?us-ascii?Q?xVp90j99putjoxlxcqjIxGYpFIA3tI0CBj+J6PXRVH5nxFchNhmnqt7rdVH7?=
 =?us-ascii?Q?2YgVPJdPXfp/ln7CqtyV9nXuMaW+s5Lh1Kbsj5I5hr/meWWjc9G5F17bC30n?=
 =?us-ascii?Q?3ZwILrKOCnPEIFArFqRkqPwOvNtL8TbbH/HP7W5CsHA7rB0yPXR8mi6C9uef?=
 =?us-ascii?Q?6iVciA52Rt1n3jUTJpZKXyEaDzdRLUHU6q6HbUlaIcPqdrCipdIUvPUXh5bz?=
 =?us-ascii?Q?ZfXObIx7ALAZwi04LkQGbtzRF/x9Fz22QT19hkUT/pFQz7jU7kvKJVsxssta?=
 =?us-ascii?Q?fG5l3RS7ur/87+VVb+clIOZh9iQI2BdrrBDjt4W9+XrmIKBzzDPMd80AL9DT?=
 =?us-ascii?Q?93kbGdbXA/vl35I/tAUiUeybcbnNiV7AHM5UMxJxeZP4IRWJPegOydNTEac6?=
 =?us-ascii?Q?ZZrJSso7QaSYaqgRI1aIHycvPz0FsPZMVH3MER3cY/zJt0MOXu+lzpIbkTfc?=
 =?us-ascii?Q?rN3SuWWXtQmTv49yYGyAbX75RFPhyDukxZ2LkIiqraWxXxfmkwfXicg8VC41?=
 =?us-ascii?Q?yaYtjvpk8TbtqAneAINJetL1+hmRfxmXVG1JtfvnebEtx52B9YznvibGfkD4?=
 =?us-ascii?Q?8pyvpetM9n8u3kYulhSbPSEcw0HzXyzWvOa4YUYCN6DJ3edTpJZrJkzzk5JF?=
 =?us-ascii?Q?CTvuqBp5qIzSDrU5GjLcCdzrXhoxbyCoQ8XgoEfKkJ0MWiy7KzR6lUxbffe/?=
 =?us-ascii?Q?G9ScHVBjaGoBSZVXN2LV1FpqyQrXyF/758jms93LP+oUKQMPuiJ3COhE15Te?=
 =?us-ascii?Q?BXKJ+z/dDilslLVjoZJQPlbQaTTDxl2EiA6CZ7Mrc45fod1AQ+uKcmKGomQk?=
 =?us-ascii?Q?OIxQ1tgAS3LQwaJOBl20DmyRdbHekHeOlH1qKYJDpFWt8Q6AI+xB/jhEK92e?=
 =?us-ascii?Q?OFF6N2VKBvaxMrgmfVt+I3LpzC5MJEX4gyApOW6mEe53YaGtP4EhBK75JZb7?=
 =?us-ascii?Q?3Q+9MVNpp1wbpQcT7JK4YhXESrdPffezWYUApbidISGp7CIa3tvvuGb55i5y?=
 =?us-ascii?Q?kIy+JO1zg4O3BkaVFhcYrsfYB1YUcyeOJ99QVep1sg8aRx9V5w/ftMxFdAd5?=
 =?us-ascii?Q?sWjLgGFQPzmAbEd1EPI++Nv/13Pm1D5K21nX7E2ZW5FrY/cFoPUO2XQ+O8X2?=
 =?us-ascii?Q?N5IQKX2woiAzVrjtlg1Ra77KbkTwpuBI9zJ5YMN5PUIptxW3A/BwMwIGvDzC?=
 =?us-ascii?Q?9bNLAOb8bDnXDiOJQTX+draEsIzL7cki/QbRAnEnjRDMMLcnFvp6gOAy8Rte?=
 =?us-ascii?Q?LA=3D=3D?=
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cab58939-e2c7-4ed0-41b8-08daef62d4a8
X-MS-Exchange-CrossTenant-AuthSource: SN6PR04MB5151.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2023 21:21:38.2007
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y2ZxBspzOWI9sstSiqjh4gbxH7lOQX7sOgdcaBg1r6DRmaVvZf2k9iJ1G6qg7/BTaOK+3VyyDEId0WSe4LfUjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR04MB5748
X-Proofpoint-GUID: WTAt_0AoWqwn_2-DdVqixcp3MgHoGvzs
X-Proofpoint-ORIG-GUID: WTAt_0AoWqwn_2-DdVqixcp3MgHoGvzs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-05_12,2023-01-05_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_policy_notspam policy=outbound_policy score=30 malwarescore=0
 suspectscore=0 clxscore=1011 adultscore=0 mlxlogscore=999 impostorscore=0
 mlxscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0 phishscore=0
 spamscore=0 classifier=spam adjust=30 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301050167
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 05 Jan 2023 21:21:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100421

The gvfs project meson configuration attempts to locate and resolve the
path to an ssh-client on the build host, then pass that full-path to the
gvfs sftp-backend as a constant string, to be used at runtime to fork
ssh subprocesses.

As a consequence, if the build machine's ssh client path differs from
the gvfs target's path - as is common for OE/buildroot builds - gvfs can
fail at runtime. Further, build machines cannot configure gvfs without
an ssh client, even though nothing *uses* the client during the build.

The .patch in this commit has been upstreamed with gvfs, and modifies
the configuration to instead pass the string-literal `ssh` to the sftp
backend. With this change, gvfs will instead rely on PATH-expansion to
locate the user's ssh-client at runtime.

This obviates the requirement that the build machine have an ssh-client.

Signed-off-by: Alex Stewart <alex.stewart@ni.com>
---
 ...H-expand-the-sftp-backend-ssh-client.patch | 60 +++++++++++++++++++
 meta-gnome/recipes-gnome/gvfs/gvfs_1.50.2.bb  |  5 +-
 2 files changed, 64 insertions(+), 1 deletion(-)
 create mode 100644 meta-gnome/recipes-gnome/gvfs/gvfs/0001-daemon-PATH-expand-the-sftp-backend-ssh-client.patch

diff --git a/meta-gnome/recipes-gnome/gvfs/gvfs/0001-daemon-PATH-expand-the-sftp-backend-ssh-client.patch b/meta-gnome/recipes-gnome/gvfs/gvfs/0001-daemon-PATH-expand-the-sftp-backend-ssh-client.patch
new file mode 100644
index 0000000000..011858e80c
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gvfs/gvfs/0001-daemon-PATH-expand-the-sftp-backend-ssh-client.patch
@@ -0,0 +1,60 @@
+From 8327383e262e1e7f32750a8a2d3dd708195b0f53 Mon Sep 17 00:00:00 2001
+From: Alex Stewart <alex.stewart@ni.com>
+Date: Wed, 14 Dec 2022 03:05:45 -0600
+Subject: [PATCH] daemon: PATH-expand the sftp backend ssh client
+
+Meson is currently configured to search the gvfs builder's PATH for an
+ssh client, and hardcode its fullpath as the canonical ssh client for
+the gvfs sftp backend.
+
+This setup breaks in cases where the builder has a different ssh client
+from the final runtime root, or where the client's pathes differ.
+Builders using OpenEmbedded or buildroot workspaces are particularly
+affected.
+
+Instead, set SSH_PROGRAM to `ssh` so that it gets PATH-expanded at
+runtime.
+
+Closes: https://gitlab.gnome.org/GNOME/gvfs/-/issues/465
+Signed-off-by: Alex Stewart <alex.stewart@ni.com>
+
+Upstream-Status: Accepted
+* https://gitlab.gnome.org/GNOME/gvfs/-/merge_requests/157
+  * Expect upstream merge in GNOME 44
+
+---
+ daemon/meson.build | 2 +-
+ meson.build        | 4 ----
+ 2 files changed, 1 insertion(+), 5 deletions(-)
+
+diff --git a/daemon/meson.build b/daemon/meson.build
+index e20ada29..72a16890 100644
+--- a/daemon/meson.build
++++ b/daemon/meson.build
+@@ -256,7 +256,7 @@ if enable_sftp
+     '-DDEFAULT_BACKEND_TYPE=sftp',
+     '-DBACKEND_TYPES="sftp", G_VFS_TYPE_BACKEND_SFTP,',
+     '-DMAX_JOB_THREADS=1',
+-    '-DSSH_PROGRAM="@0@"'.format(ssh.full_path()),
++    '-DSSH_PROGRAM="ssh"',
+   ]
+ 
+   programs += {'gvfsd-sftp': {'sources': sources, 'dependencies': deps, 'c_args': cflags}}
+diff --git a/meson.build b/meson.build
+index 7fd67427..a84c0104 100644
+--- a/meson.build
++++ b/meson.build
+@@ -457,10 +457,6 @@ endif
+ 
+ # *** SFTP backend ***
+ enable_sftp = get_option('sftp')
+-if enable_sftp
+-  ssh = find_program('ssh', required: false)
+-  assert(ssh.found(), 'SFTP backend requested but a ssh client is required')
+-endif
+ 
+ # *** Enable development utils ***
+ enable_devel_utils = get_option('devel_utils')
+-- 
+2.38.1
+
diff --git a/meta-gnome/recipes-gnome/gvfs/gvfs_1.50.2.bb b/meta-gnome/recipes-gnome/gvfs/gvfs_1.50.2.bb
index 5bad2153ce..6ea8727539 100644
--- a/meta-gnome/recipes-gnome/gvfs/gvfs_1.50.2.bb
+++ b/meta-gnome/recipes-gnome/gvfs/gvfs_1.50.2.bb
@@ -18,7 +18,10 @@ DEPENDS += "\
 
 RDEPENDS:${PN} += "gsettings-desktop-schemas"
 
-SRC_URI = "https://download.gnome.org/sources/${BPN}/${@gnome_verdir("${PV}")}/${BPN}-${PV}.tar.xz;name=archive"
+SRC_URI = "\
+    https://download.gnome.org/sources/${BPN}/${@gnome_verdir("${PV}")}/${BPN}-${PV}.tar.xz;name=archive \
+    file://0001-daemon-PATH-expand-the-sftp-backend-ssh-client.patch \
+"
 
 SRC_URI[archive.sha256sum] = "03d72b8c15ef438110f0cf457b5655266c8b515d0412b30f4d55cfa0da06ac5e"
 
-- 
2.38.1


