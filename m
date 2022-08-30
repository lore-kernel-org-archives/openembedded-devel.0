Return-Path: <yi.zhao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AF42ECAAA1
	for <webhook@archiver.kernel.org>; Tue, 30 Aug 2022 07:22:43 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web09.8809.1661844159231296555
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Aug 2022 00:22:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=TRfKBHer;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=624124cef8=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 27U6blvx002538
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Aug 2022 00:22:39 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=Oro0hz3rgsM/3yxHIbqcv9CJppliGSuKHtVButg/Ojs=;
 b=TRfKBHer7fxIOcCB4TznQWrZx1oLKWzojEgWOcL09+Amg/s85U4w1HZW5vnTi1EbWLJW
 Litt/J2EwgTc6CqIdOq7/ZeqmH+lLjwIcQoSTzG53gxzcq5BmeL4zO/49O1K6RCDDvxU
 zVk0y8Lv+4RrDV6TfJjwhKznL8TBT9eA4lb/prIrVm1n3fFoyI92WA1+DYryJJBy0hc+
 RauWiOXVIe6aI0svz8lEpBepHaIIxGR8Di7pTYKxfioA0W/SnRVHOgU6mJKZdPbQ4XnQ
 aHHOpYPq229DhS8ya/64RpVncRp7FTaTmWCdmaLsdhfwynprjRvdvlV+sICdhkNw4YV1 kQ==
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2169.outbound.protection.outlook.com [104.47.57.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3j7jska3wu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Aug 2022 00:22:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SS326BK7zghuq+xNaHAcXgb/3dKmb+iuYBwMOmCCTtqJdSTruzHPv4T0ANOBPf5+ZkPlB5Dftzl12YgDK6ufHxNviFppPqD582Kg16UqPVkuWQjaQKi9fgUNSWOVlZbXa1MUWXTbNBnDZpHmMgxpmCsYcOSBwQM8+dENf1b8ZzUpyxYoADeugRiQL+0Rxzyc3gFgpr2+tsjh1V4qOhxot1iCP9a2CIwDahG3OueFtZUbeGeZl9X6GGtCt0wPod4CfULjFIYHWyMfWCdbCIqgaFmf33nho+J8ZOB0Kaqib3K9hSPoG7lyapFiNodklmXC078AA6MWbRCi31Hja5j/3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Oro0hz3rgsM/3yxHIbqcv9CJppliGSuKHtVButg/Ojs=;
 b=Yhl1Oby1Iufssk6ovb+90r8fBN2TtMbMSRkwfO2tgyC6Eky9iyM44LVzNke8/3WUT0Ka17B/N2hBGg5tpDTvJ4hMwHxmQBcVai6NtfB7qKw+egBOrlwa55NIwhkHNU8fD5mcLN/epT45zjAXOmt5KrKlMLoJBNLHgHMnziG45sVAXlaBdVAWaHkOhwwLwT3b+t8K/fFFxcJEerUYZzsknbJHlhtwEzvwKqv1pTqiWU7dN3BjjO9rBhjdH5XAr7O6raGIhkIV6MmXUBcbVCU09TwbTsl1D0x0A0acXIL0nZByZGi0ozWhTfCPJuZj2tRgmIgZ4N5EktGiG9eMmjZjuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SA2PR11MB4875.namprd11.prod.outlook.com (2603:10b6:806:11a::6)
 by PH0PR11MB4981.namprd11.prod.outlook.com (2603:10b6:510:39::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Tue, 30 Aug
 2022 07:22:35 +0000
Received: from SA2PR11MB4875.namprd11.prod.outlook.com
 ([fe80::9475:8d56:9c54:cd99]) by SA2PR11MB4875.namprd11.prod.outlook.com
 ([fe80::9475:8d56:9c54:cd99%3]) with mapi id 15.20.5566.021; Tue, 30 Aug 2022
 07:22:35 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] tcpreplay: fix buildpaths issue
Date: Tue, 30 Aug 2022 15:22:24 +0800
Message-Id: <20220830072224.1584601-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0091.apcprd02.prod.outlook.com
 (2603:1096:4:90::31) To SA2PR11MB4875.namprd11.prod.outlook.com
 (2603:10b6:806:11a::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a49d51a1-c610-4a77-d7d1-08da8a58693d
X-MS-TrafficTypeDiagnostic: PH0PR11MB4981:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	OvsHQr6wASuDveSjs0J9izKFQCUKA/vAqKPFgq692wCOS1QhvEg47ICz198MSvdg5oBlWuEsmHcbYlzR/nYNtnAvqCvwT/LSH2nrs1eiIyrYY2Er7CumQzIkG+Dj9BxxYwy8WjCwSC1v2QDHMrlT7nXTm/2mGun1z1Kjor0PK4JLbobAVxILdrHQM7FfV28oYrIAw59gBcvRDb/Ci7O7o4+VOH8TjonaQ5XbwFFHH6Vf/GnAIDv3fwWLvf0Rt3ksTKr3SilFFwAAzCq8ZPSdEI4L9R9HPlVuhqYLCkCljp5rKKrahRKguQV9j/3n8G6VM7gqS+KXlGMmglkx2Ngq27xR9k55n21Q+jzDfN0tttUYiM8zp8WxpVdYfB3O99NJZYZxp8NSkZBr2dtn2I7+XvrRuE6vm/JaXqlFf7lKZi2QjJYRthQHy29+rUBEg/kDk9gAKtCC/2hbphBkcixsJkNDLyIXw7YBGNPVebFoYyq8Qc7xbkoUjn9JfxtbNB5vEAWen7chRWx0yZKFkeJMVw2UC1Mxqv6kTZIwtmWPdAUXaOaOt1Rc7kHIqFP3Fm4vvTtnZ9wpN88Xfuh9v+iheMxewVi6E/XbaVt1OzyJE3EhDfTfGkW4ZibfHaY0+nBvSrJPciGmGidch21HovoT9NC/u25kZnSeB8VX4RdF853VcibiRbPYqaD0nxBJnhWmapnCwxng5wEW+/9FCB7NIM7zRZihZN75SUz43xUVhZVrMvxCcb0cYQW4M0sjELEbQqu0C+JsSXkFfsBx1QSUFKDkYkUxwrlmgm8d353125c=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA2PR11MB4875.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(136003)(366004)(39850400004)(376002)(396003)(38100700002)(26005)(6512007)(38350700002)(316002)(86362001)(41300700001)(8936002)(44832011)(6666004)(5660300002)(478600001)(8676002)(2906002)(66556008)(66946007)(6486002)(6506007)(52116002)(66476007)(2616005)(1076003)(83380400001)(186003)(6916009)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?6/SPvGmMbcueYHdUgfSxGK+6ViSfi2SQ4yIDNfH3JGT7hdZNmA5L0yJYNmij?=
 =?us-ascii?Q?a4FcD5PBxv+1XVOWQaNk0ZLOQlhjS1kIThGakOAKC2wMLAqQk+XPLjqZ780I?=
 =?us-ascii?Q?U+m/UI+ox55AXI/O6d0klGMTix84Ub1KDT5uXRM37X31z9g+XpMyBEwMCTPo?=
 =?us-ascii?Q?EV3ZDVuz2cA0ZJMMVGPro+Ev7K+dcwwlHVR2RXLkhdQggnNr8tGsDjVTZKuO?=
 =?us-ascii?Q?R3AX9fZc9N701nB01NCPI4/IPznn4D4mIgPQI/BPE7znDuFPLwtEIxtGiTWK?=
 =?us-ascii?Q?zoY7tLySYpt0ggTrCE17Fj9uYD3hpcwrtuFa+BRdHaMtN4TFolB5Li3gYcH/?=
 =?us-ascii?Q?VmvlMOCrmcWLxv8pneL0AVJUuBTBY26nRCRVaZKU78roYbT8LTde0j814auT?=
 =?us-ascii?Q?Kreup8pYzKk/RIh7SodKMfnHINdKMjsnpQGgUiVxdKZBwAqSeZU5N4xdidTy?=
 =?us-ascii?Q?0a3iBPKJvJX0BYml0xGWvokhbZhURjEiigseFwGFerYjv40+g++pTv9zII92?=
 =?us-ascii?Q?YH1w23poN7e8ymnBri8DCpgg2rOI9olPNNzCYns8SJCAiEiorPPmNq79UrqC?=
 =?us-ascii?Q?ep6hDkyQZqxSkYuwj/5SAOcQHCDfHA6qNGdWYXHaDclzehx9vDkGVWywOchq?=
 =?us-ascii?Q?4n67DNOybipYUrf0PaGDyLPkwKrquAC8J/KKuC/UqV5w5iAGQovbawi3J2Se?=
 =?us-ascii?Q?+M0QbG3zIKf6H+l6Z/mo+/u+JiS14HORCfwyjpnZt8y+33TcTk8uGcVt+tuR?=
 =?us-ascii?Q?Zi8ZVScplllR5EPdX8HAwtw66DjYDF4WIF2WEMTrvVvwOxOmoQEWzX40pFPE?=
 =?us-ascii?Q?5elLUrfgAnNnXB4Wkklvh9G3HoUs+j6lBZ+ge04e+/8FSs6/8CdqQicHk223?=
 =?us-ascii?Q?lcqt1/1wV04YKnHtQbZq8U2PEvAQAB3uXzAziQmh3Lt8AfNoMRPt5gV+ACfP?=
 =?us-ascii?Q?2Oacn7eAi5waeiZ+GZmzhZ9DsCNiUDsNPedW17CdhALYX0CHl3mQgxpybpNi?=
 =?us-ascii?Q?VZQA34LS7aleGhpRpGFX9nd/HzAEBviD18zBaC/nqg7wQJvuyLWpQTQzsyGu?=
 =?us-ascii?Q?hxSPvZgXJRPS3nlbwvO4CRynrCKyAtAc58mjajAPq+78NzNQkDdZyHL/K3tV?=
 =?us-ascii?Q?MP6Tf1pI7WpBjKLCEJ++UhOpC4pSJAx/68qzvbxcycy+Y4KouUr/mNSCUo+E?=
 =?us-ascii?Q?azOOBKhQA+/MRLlbf2UlWvc/Z7codwBLheV9fEY0dtjHcGUIcJT7VRn1lqjM?=
 =?us-ascii?Q?z/LaWyscFQozJzVm27Knh5cfkB7Lk/FkC5ZyRJfOikqYnJFuQbhdQ20eJ7JC?=
 =?us-ascii?Q?4pAMR5gkL4L8+0SrhxyRUtRx+GfQxz7MzfyGWHtG813o54YZFC9Y7c0AHPzW?=
 =?us-ascii?Q?1QilPT5vY3CgtownaVsSb3I6A8WFU3/Ww5EwmuKvdTIZOPqGWGjI9wH9cd9V?=
 =?us-ascii?Q?wBmmTjiSQJFKBZag38jFTJWpT9mRWYd7j5NL9ZodDUwYJ4VSqmziyVqzssH7?=
 =?us-ascii?Q?uWaJOtkHDEGq421HrI+eb36zQFeEyR5/MMJtGONEflVkzo+KQOgcMpJNvOCM?=
 =?us-ascii?Q?17GHZcfq2FwvOeWNU/kyXd6DE9CTSCi4uH4igt2f?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 a49d51a1-c610-4a77-d7d1-08da8a58693d
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4875.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2022 07:22:35.5495
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 +cjALsDmgKdX6Z/0tzWLNrT2QmZpwU8mZuzZAOnpnHE06iCwqZO3m+V0w274a9BaAjpjzgY4SdPK77nN8dBZIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4981
X-Proofpoint-GUID: _AscIDsB5p9xhUydykwqQuUW_aYewZyk
X-Proofpoint-ORIG-GUID: _AscIDsB5p9xhUydykwqQuUW_aYewZyk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-30_03,2022-08-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 priorityscore=1501
 malwarescore=0 adultscore=0 suspectscore=0 impostorscore=0 mlxlogscore=999
 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2207270000
 definitions=main-2208300034
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Aug 2022 07:22:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98559

POSIX_SHELL is specified a host tool path as it searches path on build
host using `which` when configure. Set it to a fixed path '/bin/sh'.

Fixes:
QA Issue: File /usr/bin/tcpbridge in package tcpreplay contains reference to TMPDIR
File /usr/bin/tcpliveplay in package tcpreplay contains reference to TMPDIR
File /usr/bin/tcprewrite in package tcpreplay contains reference to TMPDIR
File /usr/bin/tcpcapinfo in package tcpreplay contains reference to TMPDIR
File /usr/bin/tcpreplay in package tcpreplay contains reference to TMPDIR
File /usr/bin/tcpprep in package tcpreplay contains reference to TMPDIR
File /usr/bin/tcpreplay-edit in package tcpreplay contains reference to TMPDIR [buildpaths]
QA Issue: File /usr/src/debug/tcpreplay/4.4.2-r0/src/defines.h in package tcpreplay-src contains reference to TMPDIR [buildpaths]

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...libopts.m4-set-POSIX_SHELL-to-bin-sh.patch | 45 +++++++++++++++++++
 .../tcpreplay/tcpreplay_4.4.2.bb              |  7 ++-
 2 files changed, 51 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-support/tcpreplay/tcpreplay/0001-libopts.m4-set-POSIX_SHELL-to-bin-sh.patch

diff --git a/meta-networking/recipes-support/tcpreplay/tcpreplay/0001-libopts.m4-set-POSIX_SHELL-to-bin-sh.patch b/meta-networking/recipes-support/tcpreplay/tcpreplay/0001-libopts.m4-set-POSIX_SHELL-to-bin-sh.patch
new file mode 100644
index 000000000..448455fff
--- /dev/null
+++ b/meta-networking/recipes-support/tcpreplay/tcpreplay/0001-libopts.m4-set-POSIX_SHELL-to-bin-sh.patch
@@ -0,0 +1,45 @@
+From 769e96b60f631e8c208fd7f72900d0bb17760f88 Mon Sep 17 00:00:00 2001
+From: Yi Zhao <yi.zhao@windriver.com>
+Date: Tue, 30 Aug 2022 09:54:11 +0800
+Subject: [PATCH] libopts.m4: set POSIX_SHELL to /bin/sh
+
+POSIX_SHELL is specified a host tool path as it searches path on build
+host using `which` when configure. Set it to a fixed path '/bin/sh'.
+
+Upstream-Status: Inappropriate [embedded specific]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ m4/libopts.m4 | 16 +---------------
+ 1 file changed, 1 insertion(+), 15 deletions(-)
+
+diff --git a/m4/libopts.m4 b/m4/libopts.m4
+index cfbd477..c8047eb 100644
+--- a/m4/libopts.m4
++++ b/m4/libopts.m4
+@@ -111,21 +111,7 @@ AC_DEFUN([INVOKE_LIBOPTS_MACROS_FIRST],[
+   AC_CHECK_FUNCS([mmap canonicalize_file_name snprintf strdup strchr \
+                  strrchr strsignal fchmod fstat chmod])
+   AC_PROG_SED
+-  [while :
+-  do
+-      POSIX_SHELL=`which bash`
+-      test -x "$POSIX_SHELL" && break
+-      POSIX_SHELL=`which dash`
+-      test -x "$POSIX_SHELL" && break
+-      POSIX_SHELL=/usr/xpg4/bin/sh
+-      test -x "$POSIX_SHELL" && break
+-      POSIX_SHELL=`/bin/sh -c '
+-          exec 2>/dev/null
+-          if ! true ; then exit 1 ; fi
+-          echo /bin/sh'`
+-      test -x "$POSIX_SHELL" && break
+-      ]AC_MSG_ERROR([cannot locate a working POSIX shell])[
+-  done]
++  POSIX_SHELL='/bin/sh'
+   AC_DEFINE_UNQUOTED([POSIX_SHELL], ["${POSIX_SHELL}"],
+            [define to a working POSIX compliant shell])
+   AC_SUBST([POSIX_SHELL])
+-- 
+2.25.1
+
diff --git a/meta-networking/recipes-support/tcpreplay/tcpreplay_4.4.2.bb b/meta-networking/recipes-support/tcpreplay/tcpreplay_4.4.2.bb
index 165a0e735..7d2a6a14d 100644
--- a/meta-networking/recipes-support/tcpreplay/tcpreplay_4.4.2.bb
+++ b/meta-networking/recipes-support/tcpreplay/tcpreplay_4.4.2.bb
@@ -7,7 +7,9 @@ SECTION = "net"
 LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://docs/LICENSE;md5=10f0474a2f0e5dccfca20f69d6598ad8"
 
-SRC_URI = "https://github.com/appneta/tcpreplay/releases/download/v${PV}/tcpreplay-${PV}.tar.gz"
+SRC_URI = "https://github.com/appneta/tcpreplay/releases/download/v${PV}/tcpreplay-${PV}.tar.gz \
+           file://0001-libopts.m4-set-POSIX_SHELL-to-bin-sh.patch \
+          "
 
 SRC_URI[sha256sum] = "5b272cd83b67d6288a234ea15f89ecd93b4fadda65eddc44e7b5fcb2f395b615"
 
@@ -19,3 +21,6 @@ EXTRA_OECONF += "--with-libpcap=${STAGING_DIR_HOST}/usr"
 
 inherit siteinfo autotools-brokensep
 
+do_install:append() {
+    sed -i -e 's:${RECIPE_SYSROOT}::g' ${S}/src/defines.h
+}
-- 
2.25.1


