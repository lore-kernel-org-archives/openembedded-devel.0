Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web08.12317.1622901765836591634
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 05 Jun 2021 07:02:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=ecAI6SRC;
 spf=pass (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=179073020c=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 155E0Dm3031099
	for <openembedded-devel@lists.openembedded.org>; Sat, 5 Jun 2021 07:02:45 -0700
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2176.outbound.protection.outlook.com [104.47.55.176])
	by mx0a-0064b401.pphosted.com with ESMTP id 3904j4g67r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sat, 05 Jun 2021 07:02:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cpvjbtQZzJ/k2rHAgWeoFCrX1OX19K6FgSMLNstnZ2meCMj/65vvF5yqtxsXgGuPk7Sf/xsinOhAdSYZ2Fw0e2rsj0HRazWE+rFBM7czoJ1eqS9wlzgAG/TbCuq/sfBQiPmcI/dRNddcIDn4htwlGG8xbLuGuqpAVK1Hs1uQB57h7u/wZ2Wa2wLtPGM3E4ImqSrZgvCjTtpoj/VOIV+JyeTZYFvGbutLKng4Q3uQszgQKCVTblFMhFcT7C+MUNYe/qx7YXBAD0ot6ncMYuhQ5Qi6tud3SEyYFqAhEUy3oFdmv9EeOaDNsMkbgzHJ5xvuta38MVYCI+k/sG+YRkol/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o1uLaBPa3XhwSXDhzYQreb0jF+R647qGtQwaqODg7Lc=;
 b=QzIhAo1BW+mtzfgzO59lzXdi9iywWWC/qeJmsmhwKpWEEQ+ASHM2UQITDu9Lmhi9wgZVqKr9kaeS8cWIoTY1C4OE1StaMdNY1cAO69XcHDvAvW22pOHZfMrXKQ+iAJvOodykB1gxmPiSPDxV+7I4Lp91iZZLhK16FZ13451jYU7xMeXXOjEg4oCvd3RKtZ04Pg8oXVCh2KFBdpvVzVnDGe63btxewL/kPBjVC8vKzCB6nZajuE5cetUz+SUePAy+87srHF1Fn1I7aTpTF1JmDZhOUw9hI1PEJjzwWAAnRXjkN0uANQeevvqFaGnQBkprdO6XtAwnIzh7AgWu7WW/Bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o1uLaBPa3XhwSXDhzYQreb0jF+R647qGtQwaqODg7Lc=;
 b=ecAI6SRC8r7+/bmRoQjOk4Pf4fPY1AnGEYIqb+CtXQENKsvtyuyxmxJk9A/fQHj9h47ofuF7/MjFWwcKMM/uimAEwh4Jks6OUMMV0DEW7f4TW2RG1Po0nslFdOgVn5rXNnmME/IaZri865dlwP6MZoqzDFXdqZzyNP3eLoQ420Q=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by MWHPR11MB1853.namprd11.prod.outlook.com (2603:10b6:300:112::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.22; Sat, 5 Jun
 2021 13:48:29 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::55fe:763e:6961:7bbf]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::55fe:763e:6961:7bbf%4]) with mapi id 15.20.4195.029; Sat, 5 Jun 2021
 13:48:29 +0000
From: "Yi Zhao" <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 1/4] libldb: upgrade 1.5.8 -> 2.3.0
Date: Sat,  5 Jun 2021 21:48:14 +0800
Message-Id: <20210605134817.163302-2-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210605134817.163302-1-yi.zhao@windriver.com>
References: <20210605134817.163302-1-yi.zhao@windriver.com>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: BY5PR04CA0025.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::35) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-yzhao1-d1.wrs.com (60.247.85.82) by BY5PR04CA0025.namprd04.prod.outlook.com (2603:10b6:a03:1d0::35) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.20 via Frontend Transport; Sat, 5 Jun 2021 13:48:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5814ec75-8197-4252-705a-08d928289978
X-MS-TrafficTypeDiagnostic: MWHPR11MB1853:
X-Microsoft-Antispam-PRVS: 
	<MWHPR11MB185335D12D88ACDBB0A09BFEF93A9@MWHPR11MB1853.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:155;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	RCvD3cJGfbIcnFcJtLf5ITVqXF0FqoTco902WsdrO3A6Y88zlBDWhF+cq/NwUMIFBPHmUBdvi0A8yBYr/cPX82CyjQa2NrvXpQ/9tPwqWXcxa1NHCKjbDBohjVOju3a5O1D313xt3fw2yM9EF+b5o5eO9Gqm4Qa3cifUzxdXtC/LQZx7mOgPx5t79fLfMUQBtDJzZHIlUGDAcxtwlFUqjsrDgltk5FkGGeldfqBmNDK42q/qlBdpDSS4Iwae+Tk5M3VQQSJa5HiH8Nz9hEbW3pHFNE+1ds7s3ZoHA+u9CP6rhLh4YmvT/x//XH6ResjcNdfpCUR42MgxM3Rje8t48Kf6rQEka9Y/q4eY1qS6NKgD1t6xPpXYn3pFUkxYDRcShsD+dLiBtUe4+8k/cJulnqeHF5eObJ3tZEvPsQu4gNs+uRG4ZxmUe9tI6nUWIRxGo51wKcOXdVYqB2QWQyhPd/5GYUOpoFNZ8mQHT2bH5SCqA+hmUsfA/9FXobehsjacWsqRblMCf05zF798H9X8TtZJmhVQm05JmXwntvkV2d3NjZtHqJB0Lg+jYy8h2BSXL83F0C5FtDxto/LrGdLkQOP8yBabrLl+cBaB0hYAMIYf7nokx5WdqpMeRPAIAA33OJ1sHkZZyxx6IUlyu0z5UOfFz3W3ijlXSy2GrWDgd62Wk0SnWBYh9HADeIzdLuyYP3hL8ajL0qeDvBJBSeakCqx7BWlezhU4morz4npTjUFIrhKoTk166EI29xIRSO2Vbx/yuHyJy2Et09XkJMWAeQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(136003)(396003)(366004)(39840400004)(186003)(16526019)(6666004)(6486002)(86362001)(8676002)(956004)(6512007)(26005)(83380400001)(2906002)(38350700002)(38100700002)(8936002)(316002)(2616005)(30864003)(5660300002)(1076003)(66556008)(66476007)(44832011)(66946007)(53546011)(6506007)(478600001)(36756003)(52116002)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?/qeebrC2rCZYmwblKmQ+0fbVld8kBKXp7EgMdkj21Ji+gkfheZbIg2VMawFA?=
 =?us-ascii?Q?2gSlBeh2LoLskR+1Wiiu2+bZ5gZLIXkfjssCGXRzf4ngL0n89mTFzB201wQl?=
 =?us-ascii?Q?wngKVQZD2q+c3IxxDOjnBqW7UVXVZyqh7/iP4KuieLP/vjcIpgixfpVsTeEY?=
 =?us-ascii?Q?cw0VH8x1wgSM0OAbToEAsb3LDGvhBWq2o8ikbPL1sO/ivpomqwdbrIJ4QaBg?=
 =?us-ascii?Q?sehbqAN5cG/A13dwsWpqaLdc0Kuf/3fIbJnvhgTNgrFc8fdHRQ8AH7ZCwDtV?=
 =?us-ascii?Q?6L55113O5g7phcEXS+mUEamwS30pvtL0W2bTF0o3ogOIdh6zRI3KZV3+8wGN?=
 =?us-ascii?Q?FQhpwdA36EwloeOgeq1Qkj9PE+PjmYTSsE0vVBepjWSJU36IznWxVEvXwqui?=
 =?us-ascii?Q?UId0LYsDaS9OxVHPtujApMS1R8lXTWIeyS6Ouec4suiDXGe3slvqwRJkdR31?=
 =?us-ascii?Q?yqMOpcGeQBKmJfDuylL8je1k6B/l9gWfojUNH2bvjw1f8vHrnzqqJBcAkxtl?=
 =?us-ascii?Q?/K4JU5kTS9wJDB7J1OhMKfEVr5LqvMl0k+z+f3f2StULRMplo0CIqM7ohkAP?=
 =?us-ascii?Q?0PZjsfLNbuLGifSxXSH3btcQQzWv8dSQcaTD2gnnDbzvdjrUoedHQYXwjhgS?=
 =?us-ascii?Q?Jc+pp+GVk275QsYVruu4aYReJ+lT17SMBl90IVFjZMNAqcV89I4l+9XoUorS?=
 =?us-ascii?Q?MrA39oIaJI1nr50dekS9tgyvFDCjviJRI07I208i2ey7A8IfMvmSyI6yVs9Q?=
 =?us-ascii?Q?fEZhaqaNESFj58TvgreR+ruld2OcXvCe/eZQ383KJn74v/14Deoh0HstQibG?=
 =?us-ascii?Q?EKSMOWcbQ5pPEJcH8aBuJImB7LvsmkgPBfwh8a7yUjfkBgaDHD+mQ/8QPpMW?=
 =?us-ascii?Q?518PxCeNMro57ggHFQQaxUVT1WCMoJistMGmZ08g2cRziv8XxljixEHxwGJR?=
 =?us-ascii?Q?wQyAAPRwHPxuYrXQnrkHEsbyKkLws3+nIngO8P+/Te6JEu0ywQ5cTw8xt7EX?=
 =?us-ascii?Q?YV6SZBXda5Bd5IL61E/W/nFOldyEK37yR7zTvbpKvtIpvrwdHjj7kv1MTJKF?=
 =?us-ascii?Q?yqyJEhpK8iCSFnPKcTqeU4EmykElBCt7UxUeQ9YMndNuCUa/RYYJkloqW8RH?=
 =?us-ascii?Q?uWWUqqvifcE8oxHOIZtL/EzUP0D8fOefqH6P/aaA/q3tpU6XZEp5teIFZiTG?=
 =?us-ascii?Q?88uBv4AGjnIa1Zubln2W5sxZAnD+wSkW9ka17aZ7rJzlPShC3J7NSR/6RmHh?=
 =?us-ascii?Q?LxkNIBcf+47TQ4Wy3M2v3RA/3dZjZ19wxypLpMNhl48IVjsNqJyaRwO+1dxq?=
 =?us-ascii?Q?hlyIoJgpJPdhVcy6XTtIXL9X?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5814ec75-8197-4252-705a-08d928289978
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2021 13:48:29.1133
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FuGQiFmr92OM1ppqBKsiAX3BdaED3CpaQlCY1HmCBz2Ow+2Ahn7CHU7Rp5WEolXMe2iForMmWDrmWDYY2vusMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1853
X-Proofpoint-ORIG-GUID: 6Xi0zerXLMplZsXx4B5cdytpnXdlxOBO
X-Proofpoint-GUID: 6Xi0zerXLMplZsXx4B5cdytpnXdlxOBO
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-06-05_09:2021-06-04,2021-06-05 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 priorityscore=1501 mlxlogscore=999 adultscore=0 impostorscore=0
 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106050101
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Refresh patches:
  do-not-import-target-module-while-cross-compile.patch
  options-1.5.4.patch
  avoid-openldap-unless-wanted.patch
  libldb-fix-musl-libc-conflict-type-error.patch

Drop patches:
  0001-waf-add-support-of-cross_compile.patch
  libldb-fix-musl-libc-unkown-type-error.patch

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...t-target-module-while-cross-compile.patch} | 12 ++--
 ...001-waf-add-support-of-cross_compile.patch | 62 -------------------
 ...-Add-configure-options-for-packages.patch} | 38 ++++++------
 ...> 0003-avoid-openldap-unless-wanted.patch} | 13 +++-
 ...bldb-fix-musl-libc-unkown-type-error.patch | 31 ----------
 .../{libldb_1.5.8.bb => libldb_2.3.0.bb}      | 12 ++--
 6 files changed, 43 insertions(+), 125 deletions(-)
 rename meta-networking/recipes-support/libldb/libldb/{do-not-import-target-module-while-cross-compile.patch => 0001-do-not-import-target-module-while-cross-compile.patch} (90%)
 delete mode 100644 meta-networking/recipes-support/libldb/libldb/0001-waf-add-support-of-cross_compile.patch
 rename meta-networking/recipes-support/libldb/libldb/{options-1.5.4.patch => 0002-ldb-Add-configure-options-for-packages.patch} (90%)
 rename meta-networking/recipes-support/libldb/libldb/{avoid-openldap-unless-wanted.patch => 0003-avoid-openldap-unless-wanted.patch} (68%)
 delete mode 100644 meta-networking/recipes-support/libldb/libldb/libldb-fix-musl-libc-unkown-type-error.patch
 rename meta-networking/recipes-support/libldb/{libldb_1.5.8.bb => libldb_2.3.0.bb} (85%)

diff --git a/meta-networking/recipes-support/libldb/libldb/do-not-import-target-module-while-cross-compile.patch b/meta-networking/recipes-support/libldb/libldb/0001-do-not-import-target-module-while-cross-compile.patch
similarity index 90%
rename from meta-networking/recipes-support/libldb/libldb/do-not-import-target-module-while-cross-compile.patch
rename to meta-networking/recipes-support/libldb/libldb/0001-do-not-import-target-module-while-cross-compile.patch
index 3f2921ed3..74f8d8ad0 100644
--- a/meta-networking/recipes-support/libldb/libldb/do-not-import-target-module-while-cross-compile.patch
+++ b/meta-networking/recipes-support/libldb/libldb/0001-do-not-import-target-module-while-cross-compile.patch
@@ -1,4 +1,4 @@
-From cc0576405803bcae45ee353c4333c449cead9207 Mon Sep 17 00:00:00 2001
+From 00500909ebb0f51dd3b4e90c665f07158e7fe255 Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Tue, 25 Jun 2019 14:25:08 +0800
 Subject: [PATCH] do not import target module while cross compile
@@ -10,12 +10,16 @@ Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
 
 update to version 4.10.5, and switch to python3
 Signed-off-by: Changqing Li <changqing.li@windriver.com>
+
+Upstream-Status: Inappropriate [embedded specific]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
 ---
  buildtools/wafsamba/samba_bundled.py | 27 +++++++++++++++++++--------
- 1 file changed, 18 insertions(+), 8 deletions(-)
+ 1 file changed, 19 insertions(+), 8 deletions(-)
 
 diff --git a/buildtools/wafsamba/samba_bundled.py b/buildtools/wafsamba/samba_bundled.py
-index 60ce7da..5468a36 100644
+index 5f080dd..cdc115e 100644
 --- a/buildtools/wafsamba/samba_bundled.py
 +++ b/buildtools/wafsamba/samba_bundled.py
 @@ -4,6 +4,7 @@ import sys
@@ -63,5 +67,5 @@ index 60ce7da..5468a36 100644
          Logs.error('ERROR: Python module %s of version %s not found, and bundling disabled' % (libname, minversion))
          sys.exit(1)
 -- 
-2.7.4
+2.17.1
 
diff --git a/meta-networking/recipes-support/libldb/libldb/0001-waf-add-support-of-cross_compile.patch b/meta-networking/recipes-support/libldb/libldb/0001-waf-add-support-of-cross_compile.patch
deleted file mode 100644
index 45c5acabb..000000000
--- a/meta-networking/recipes-support/libldb/libldb/0001-waf-add-support-of-cross_compile.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-From 4b8463ff43f8983a706b181c5292491f9f954be1 Mon Sep 17 00:00:00 2001
-From: Changqing Li <changqing.li@windriver.com>
-Date: Fri, 25 Jan 2019 15:00:59 +0800
-Subject: [PATCH] waf: add support of cross_compile
-
-After upgrade, waf build system also upgraded.
-
-on 1.5.19, for cross_compile, subprocess.Popen is set to be
-samba_cross.cross_Popen, which will not execute testprog on
-host, but only read result from cross-answers.txt which is
-passed by option --cross-answer
-
-part of old code:
-    args = Utils.to_list(kw.get('exec_args', []))
-    proc = Utils.pproc.Popen([lastprog] + args, stdout=Utils.pproc.PIPE, stderr=Utils.pproc.PIPE)
-
-but on new version, exec_args is not used and cause do_configure
-failed with Exec format error
-
-fixed by append cross anser related args to cmd
-
-Upstream-Status: Submitted [https://gitlab.com/samba-team/samba/merge_requests/211]
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- third_party/waf/waflib/Tools/c_config.py | 11 ++++++-----
- 1 file changed, 6 insertions(+), 5 deletions(-)
-
-diff --git a/third_party/waf/waflib/Tools/c_config.py b/third_party/waf/waflib/Tools/c_config.py
-index 7608215..767cf33 100644
---- a/third_party/waf/waflib/Tools/c_config.py
-+++ b/third_party/waf/waflib/Tools/c_config.py
-@@ -660,20 +660,21 @@ class test_exec(Task.Task):
- 	"""
- 	color = 'PINK'
- 	def run(self):
-+		args = self.generator.bld.kw.get('exec_args', [])
- 		if getattr(self.generator, 'rpath', None):
- 			if getattr(self.generator, 'define_ret', False):
--				self.generator.bld.retval = self.generator.bld.cmd_and_log([self.inputs[0].abspath()])
--			else:
--				self.generator.bld.retval = self.generator.bld.exec_command([self.inputs[0].abspath()])
-+				self.generator.bld.retval = self.generator.bld.cmd_and_log([self.inputs[0].abspath()] + args)
-+			else: 
-+				self.generator.bld.retval = self.generator.bld.exec_command([self.inputs[0].abspath()] + args)
- 		else:
- 			env = self.env.env or {}
- 			env.update(dict(os.environ))
- 			for var in ('LD_LIBRARY_PATH', 'DYLD_LIBRARY_PATH', 'PATH'):
- 				env[var] = self.inputs[0].parent.abspath() + os.path.pathsep + env.get(var, '')
- 			if getattr(self.generator, 'define_ret', False):
--				self.generator.bld.retval = self.generator.bld.cmd_and_log([self.inputs[0].abspath()], env=env)
-+				self.generator.bld.retval = self.generator.bld.cmd_and_log([self.inputs[0].abspath()] + args, env=env)
- 			else:
--				self.generator.bld.retval = self.generator.bld.exec_command([self.inputs[0].abspath()], env=env)
-+				self.generator.bld.retval = self.generator.bld.exec_command([self.inputs[0].abspath()] + args, env=env)
- 
- @feature('test_exec')
- @after_method('apply_link')
--- 
-2.7.4
-
diff --git a/meta-networking/recipes-support/libldb/libldb/options-1.5.4.patch b/meta-networking/recipes-support/libldb/libldb/0002-ldb-Add-configure-options-for-packages.patch
similarity index 90%
rename from meta-networking/recipes-support/libldb/libldb/options-1.5.4.patch
rename to meta-networking/recipes-support/libldb/libldb/0002-ldb-Add-configure-options-for-packages.patch
index bffd0653b..a55d46bf7 100644
--- a/meta-networking/recipes-support/libldb/libldb/options-1.5.4.patch
+++ b/meta-networking/recipes-support/libldb/libldb/0002-ldb-Add-configure-options-for-packages.patch
@@ -1,4 +1,4 @@
-From 0841c3ed69c388251c1aeae63f2c3813555a54f6 Mon Sep 17 00:00:00 2001
+From 100d16aaa6fe9a28a5ba77b2de2bde81a3fa3dac Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Mon, 1 Jul 2019 16:14:16 +0800
 Subject: [PATCH] ldb: Add configure options for packages
@@ -17,20 +17,22 @@ Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
 
 upgrade to version 1.5.4
 Signed-off-by: Changqing Li <changqing.li@windriver.com>
+
+Rebase to 2.3.0
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
 ---
- lib/replace/wscript | 92 +++++++++++++++++++++++++++++++++++++++++------------
- wscript             |  8 +++++
- 2 files changed, 79 insertions(+), 21 deletions(-)
+ lib/replace/wscript | 90 +++++++++++++++++++++++++++++++++++----------
+ wscript             |  8 ++++
+ 2 files changed, 78 insertions(+), 20 deletions(-)
 
 diff --git a/lib/replace/wscript b/lib/replace/wscript
-index a7fd25d..ad26041 100644
+index 2c856b6..36b696d 100644
 --- a/lib/replace/wscript
 +++ b/lib/replace/wscript
-@@ -24,6 +24,41 @@ def options(opt):
-     opt.BUILTIN_DEFAULT('NONE')
+@@ -25,6 +25,41 @@ def options(opt):
      opt.PRIVATE_EXTENSION_DEFAULT('')
      opt.RECURSE('buildtools/wafsamba')
-+    
+ 
 +    opt.add_option('--with-acl',
 +                   help=("Enable use of acl"),
 +                   action="store_true", dest='enable_acl')
@@ -65,10 +67,11 @@ index a7fd25d..ad26041 100644
 +    opt.add_option('--without-libcap',
 +                   help=("Disable use of libcap"),
 +                   action="store_false", dest='enable_libcap', default=False)
- 
++
  @Utils.run_once
  def configure(conf):
-@@ -34,12 +69,25 @@ def configure(conf):
+     conf.RECURSE('buildtools/wafsamba')
+@@ -35,12 +70,25 @@ def configure(conf):
      conf.DEFINE('HAVE_LIBREPLACE', 1)
      conf.DEFINE('LIBREPLACE_NETWORK_CHECKS', 1)
  
@@ -77,10 +80,9 @@ index a7fd25d..ad26041 100644
 +    conf.CHECK_HEADERS('linux/types.h crypt.h locale.h compat.h')
 +    conf.CHECK_HEADERS('compat.h ctype.h dustat.h')
      conf.CHECK_HEADERS('fcntl.h fnmatch.h glob.h history.h krb5.h langinfo.h')
--    conf.CHECK_HEADERS('libaio.h locale.h ndir.h pwd.h')
+     conf.CHECK_HEADERS('locale.h ndir.h pwd.h')
 -    conf.CHECK_HEADERS('shadow.h sys/acl.h')
 -    conf.CHECK_HEADERS('sys/attributes.h attr/attributes.h sys/capability.h sys/dir.h sys/epoll.h')
-+    conf.CHECK_HEADERS('locale.h ndir.h pwd.h')
 +    conf.CHECK_HEADERS('shadow.h')
 +    conf.CHECK_HEADERS('sys/attributes.h sys/dir.h sys/epoll.h')
 +
@@ -97,9 +99,9 @@ index a7fd25d..ad26041 100644
 +        conf.CHECK_HEADERS('sys/capability.h')
 +
      conf.CHECK_HEADERS('port.h')
-     conf.CHECK_HEADERS('sys/fcntl.h sys/filio.h sys/filsys.h sys/fs/s5param.h sys/fs/vx/quota.h')
+     conf.CHECK_HEADERS('sys/fcntl.h sys/filio.h sys/filsys.h sys/fs/s5param.h')
      conf.CHECK_HEADERS('sys/id.h sys/ioctl.h sys/ipc.h sys/mman.h sys/mode.h sys/ndir.h sys/priv.h')
-@@ -110,8 +158,9 @@ def configure(conf):
+@@ -121,8 +169,9 @@ def configure(conf):
      conf.CHECK_HEADERS('sys/fileio.h sys/filesys.h sys/dustat.h sys/sysmacros.h')
      conf.CHECK_HEADERS('xfs/libxfs.h netgroup.h')
  
@@ -111,7 +113,7 @@ index a7fd25d..ad26041 100644
      conf.CHECK_HEADERS('nss_common.h nsswitch.h ns_api.h')
      conf.CHECK_HEADERS('sys/extattr.h sys/ea.h sys/proplist.h sys/cdefs.h')
      conf.CHECK_HEADERS('utmp.h utmpx.h lastlog.h')
-@@ -380,20 +429,21 @@ def configure(conf):
+@@ -418,20 +467,21 @@ def configure(conf):
  
      strlcpy_in_bsd = False
  
@@ -148,10 +150,10 @@ index a7fd25d..ad26041 100644
      conf.CHECK_CODE('''
                  struct ucred cred;
 diff --git a/wscript b/wscript
-index d3402a7..d4e0ce1 100644
+index bf6129b..722fdf6 100644
 --- a/wscript
 +++ b/wscript
-@@ -38,6 +38,14 @@ def options(opt):
+@@ -39,6 +39,14 @@ def options(opt):
                     help='disable new LMDB backend for LDB',
                     action='store_true', dest='without_ldb_lmdb', default=False)
  
@@ -167,5 +169,5 @@ index d3402a7..d4e0ce1 100644
  def configure(conf):
      conf.RECURSE('lib/tdb')
 -- 
-2.7.4
+2.17.1
 
diff --git a/meta-networking/recipes-support/libldb/libldb/avoid-openldap-unless-wanted.patch b/meta-networking/recipes-support/libldb/libldb/0003-avoid-openldap-unless-wanted.patch
similarity index 68%
rename from meta-networking/recipes-support/libldb/libldb/avoid-openldap-unless-wanted.patch
rename to meta-networking/recipes-support/libldb/libldb/0003-avoid-openldap-unless-wanted.patch
index b30afeee2..dd1246538 100644
--- a/meta-networking/recipes-support/libldb/libldb/avoid-openldap-unless-wanted.patch
+++ b/meta-networking/recipes-support/libldb/libldb/0003-avoid-openldap-unless-wanted.patch
@@ -1,16 +1,20 @@
-From 63570b98ef63c91d8508478fcbe6b89c90c8398f Mon Sep 17 00:00:00 2001
+From 1f24231095a59debcf25d0e3309dc5d1056a7fad Mon Sep 17 00:00:00 2001
 From: Jens Rehsack <rehsack@gmail.com>
 Date: Thu, 19 Nov 2015 20:45:56 +0100
+Subject: [PATCH] avoid openldap unless wanted
 
+Upstream-Status: Inappropriate [embedded specific]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
 ---
  wscript | 4 +---
  1 file changed, 1 insertion(+), 3 deletions(-)
 
 diff --git a/wscript b/wscript
-index e7c05d2..1633593 100644
+index 722fdf6..22700d5 100644
 --- a/wscript
 +++ b/wscript
-@@ -161,9 +161,7 @@ def configure(conf):
+@@ -153,9 +153,7 @@ def configure(conf):
      if conf.env.standalone_ldb:
          conf.CHECK_XSLTPROC_MANPAGES()
  
@@ -21,3 +25,6 @@ index e7c05d2..1633593 100644
  
          # we don't want any libraries or modules to rely on runtime
          # resolution of symbols
+-- 
+2.17.1
+
diff --git a/meta-networking/recipes-support/libldb/libldb/libldb-fix-musl-libc-unkown-type-error.patch b/meta-networking/recipes-support/libldb/libldb/libldb-fix-musl-libc-unkown-type-error.patch
deleted file mode 100644
index c0e7e8907..000000000
--- a/meta-networking/recipes-support/libldb/libldb/libldb-fix-musl-libc-unkown-type-error.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From d90534469c5c43bf2a97e5698a5ddb4b7471f92a Mon Sep 17 00:00:00 2001
-From: Changqing Li <changqing.li@windriver.com>
-Date: Tue, 24 Jul 2018 10:53:16 +0800
-Subject: [PATCH] libldb: fix musl libc unkoown type error
-
-tevent.h:1440:8: error: unknown type name 'pid_t'; did you mean 'div_t'?
-        pid_t *pid,
-         ^~~~~
-         div_t
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- lib/tevent/tevent.h | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/lib/tevent/tevent.h b/lib/tevent/tevent.h
-index aa6fe0d..2572696 100644
---- a/lib/tevent/tevent.h
-+++ b/lib/tevent/tevent.h
-@@ -32,6 +32,8 @@
- #include <talloc.h>
- #include <sys/time.h>
- #include <stdbool.h>
-+#include <sys/stat.h>
-+#include <sys/types.h>
- 
- struct tevent_context;
- struct tevent_ops;
--- 
-2.7.4
-
diff --git a/meta-networking/recipes-support/libldb/libldb_1.5.8.bb b/meta-networking/recipes-support/libldb/libldb_2.3.0.bb
similarity index 85%
rename from meta-networking/recipes-support/libldb/libldb_1.5.8.bb
rename to meta-networking/recipes-support/libldb/libldb_2.3.0.bb
index 199db797a..3731c260b 100644
--- a/meta-networking/recipes-support/libldb/libldb_1.5.8.bb
+++ b/meta-networking/recipes-support/libldb/libldb_2.3.0.bb
@@ -7,11 +7,9 @@ DEPENDS += "libtdb libtalloc libtevent popt"
 RDEPENDS_pyldb += "python3"
 
 SRC_URI = "http://samba.org/ftp/ldb/ldb-${PV}.tar.gz \
-           file://do-not-import-target-module-while-cross-compile.patch \
-           file://libldb-fix-musl-libc-unkown-type-error.patch \
+           file://0001-do-not-import-target-module-while-cross-compile.patch \
+           file://0002-ldb-Add-configure-options-for-packages.patch \
            file://libldb-fix-musl-libc-conflict-type-error.patch \
-           file://0001-waf-add-support-of-cross_compile.patch \
-           file://options-1.5.4.patch \ 
           "
 
 PACKAGECONFIG ??= "\
@@ -27,14 +25,14 @@ PACKAGECONFIG[libcap] = "--with-libcap,--without-libcap,libcap"
 PACKAGECONFIG[valgrind] = "--with-valgrind,--without-valgrind,valgrind"
 PACKAGECONFIG[lmdb] = ",--without-ldb-lmdb,lmdb,"
 
-SRC_URI += "${@bb.utils.contains('PACKAGECONFIG', 'ldap', '', 'file://avoid-openldap-unless-wanted.patch', d)}"
+SRC_URI += "${@bb.utils.contains('PACKAGECONFIG', 'ldap', '', 'file://0003-avoid-openldap-unless-wanted.patch', d)}"
 
 LIC_FILES_CHKSUM = "file://pyldb.h;endline=24;md5=dfbd238cecad76957f7f860fbe9adade \
                     file://man/ldb.3.xml;beginline=261;endline=262;md5=137f9fd61040c1505d1aa1019663fd08 \
                     file://tools/ldbdump.c;endline=19;md5=a7d4fc5d1f75676b49df491575a86a42"
 
-SRC_URI[md5sum] = "d9b4bea8b48cd4c4d0c492e65881164b"
-SRC_URI[sha256sum] = "ddf7f770643e0a0dda60f2818913f883caeed37fa1e8d6eda0dfe9588c1e3a83"
+SRC_URI[md5sum] = "fe4b1f17f77e2ea52b4e1320d927844c"
+SRC_URI[sha256sum] = "a4d308b3d0922ef01f3661a69ebc373e772374defa76cf0979ad21b21f91922d"
 
 inherit waf-samba
 
-- 
2.25.1

