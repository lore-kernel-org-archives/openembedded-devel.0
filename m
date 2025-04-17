Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21428C369CC
	for <webhook@archiver.kernel.org>; Thu, 17 Apr 2025 08:05:36 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.3644.1744877133584037215
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Apr 2025 01:05:33 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=62023c0ecd=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53H60XU6002201
	for <openembedded-devel@lists.openembedded.org>; Thu, 17 Apr 2025 08:05:33 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2043.outbound.protection.outlook.com [104.47.58.43])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 461u2ma8hp-5
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 17 Apr 2025 08:05:32 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y/CKzARmDvnYSjTme3Fzt7c5wXqhhyRm+OM+nyL2vwdA+o9sgi8mGFWoQi/Ym2vYhaIvrPPkcOrywRP1Ls/MINfscPAQn9sFJnzcyUxc3p3VAofhBlEU4UndUntNp4BEUoYhYmyWlPPqsRQlPVhvGwsoT9/8YViAR7+IxTXqemUriqmWVUrVGAHGms9TSTIERo2ZOppGk3ItqYgUZDmVd4g8ELEawxUW0QzSvVHgZ/CWJH62RInszdw4n0OOh1ssacacDRJ9bMMLgMA0/D7DW+NIy5/8FT96KAqyxQb1OBilCfkONm6onahZpgbY3mTFwE/Yvc+9B4qzBJA1MC/b3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=METlgxqtjI18o+XRC0wqb+ehrwUrJHXIVHPD/9jvQN4=;
 b=yElYPrGiNvkRii1hy0ks+odA1RHv5Pt23femIkq0LlCjjLjsQKPMOYJGzSlYoQgDxrmOW/Kt4AOjmw0TJ08b9sP43ML0B8Wcb1PK/U82KTEc1yV+3O+Y+wJX3uOt9dOiX+rVTM8L88b3zUpzlKdFq29QMnIxNk3XmxKBQrA6BS20KYHAhaJNb8+EOdXyQ1FjNB4RjpSikeQERy8KTsw3diB23UPOq0CBzvv6bnRUObXxLhFRxUGbz9e7DbjZ6fHxuSnmSSzYnx9E0E8O933mj9drThq3Y5hr/muhrSVIr8Mff8+azIvj1FDs+eEio5SWzkPacs+Nx3SPg/9iSzy8UQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by SA2PR11MB5163.namprd11.prod.outlook.com (2603:10b6:806:113::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.35; Thu, 17 Apr
 2025 08:05:29 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%5]) with mapi id 15.20.8655.021; Thu, 17 Apr 2025
 08:05:29 +0000
From: Qi.Chen@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][PATCH 5/7] check-version-mismatch.bbclass: handle non-elf executables
Date: Thu, 17 Apr 2025 01:05:14 -0700
Message-ID: <20250417080516.3158818-5-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250417080516.3158818-1-Qi.Chen@windriver.com>
References: <20250417080516.3158818-1-Qi.Chen@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH3PEPF000040A4.namprd05.prod.outlook.com
 (2603:10b6:518:1::53) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|SA2PR11MB5163:EE_
X-MS-Office365-Filtering-Correlation-Id: e0a99bd2-94b3-4d8d-c701-08dd7d869e88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ebaSxSjuTJ2lvOAPlA4WFODIzwxLVuA4xU3I9H+SE9BGmUVNw8u9m6PhjzlP?=
 =?us-ascii?Q?jSuHpFq3Hbg3VjHzP1MvvyHbQlwAu+Zl54n2rVTzYfiUfKlfOgIrZbdFfybO?=
 =?us-ascii?Q?Nk5nvcrTpJMBpNLTU4w2aUb/8pyhyTWaPdin93dFMjVCb4SEru1QcWaoQtfv?=
 =?us-ascii?Q?liZa9gP27Jl6FRjZCwuwXQXqDE7P755T1EkMXSUs+PLM38tBhiXLl8EIeLCI?=
 =?us-ascii?Q?PcQFLMDq05reLa5gbBxEDw83WeMw+0ueckDTU6j2fyT1kFXHt2AGlU+PbKoP?=
 =?us-ascii?Q?LeR33oNkEzWIBa74kSTH6QLluJ8Uz+aQr6cpKXh8S+R0CFl7MB/j74wSQcuX?=
 =?us-ascii?Q?qirGJr508ps2+onMGLxdHimGWudQiUvj5jOt8sN4I/9bytLmU+I74WUdYexi?=
 =?us-ascii?Q?UaVQpM39OnSGUkC+i/AdK9aLIgrrFLzOmjOw9CsnCQolO9Wu4uRJjt6OqMQM?=
 =?us-ascii?Q?gs68nAygsgQUeDmTEzJD5rK6baGI6gZDppHGrRPVjGWc6F6cBOmUIlocY8C8?=
 =?us-ascii?Q?v2rp/iJdIQmzNG8+TFFEM6GZA5nm8XTVw+OSynoCuYEBqvhCw4kfcQDIj3rx?=
 =?us-ascii?Q?tm00Joxjgw/g44DJvT8q0G6PNyS5JE901ZRrAG0RI4iREmCfNT+F6UguMFNa?=
 =?us-ascii?Q?FKhUrDJ89Gz4wrDxNm6q6zcNHK6RqK5c4Vwi3wblyngu1Ln9ZYdOl0GDGJO8?=
 =?us-ascii?Q?FiCev8AWtqJgC7JYgu0GAdiXN9brhgEeRItDDpyOpmkQSCiDoKwlkbA7PNRc?=
 =?us-ascii?Q?mIgiQkflB5QLMe67At3l7QEvCK/0cjEZi6WbzRtySe4O5WKagBnkyex6orn9?=
 =?us-ascii?Q?Fvj18cEB3DGYs3oZR1b9x/ohGSljLsH8L1oCfLlAzr3uWCx7Gi7qZ1B2TREg?=
 =?us-ascii?Q?1HAh/w4OCfoJjM3AIkn1TnDK/0xVaxhaNMg1QPn5ALF/FqSDuDuWu4ZXlkRx?=
 =?us-ascii?Q?D7Q87WhpNcpDn/k/zNsOKTkUlvFyBLO1soqzujZja04JiU6TOoT/ByV69tGj?=
 =?us-ascii?Q?M1tNHf/Q4QBLsl4PmPuFcLJls8o9BQg7WTB6gTeZbR/CHivRM5aDeUtk+CTu?=
 =?us-ascii?Q?aSFIuzTiMTeAEIYPe8K/+Dzx/xUeShQ+Z7Q0zTwWCyAy3NWT6ZoCDJBeQanN?=
 =?us-ascii?Q?wweC3EqHuZlB99K3cJMu2TfhxpwB6LfYvQI3X7VSmxA55xFcm50AGKYcFl7G?=
 =?us-ascii?Q?Q/BOSKBHUK4rlx6q+VKTZQfRntzP1lpAoqkIp3hvYmO9fwL6vUbRQfOnYN35?=
 =?us-ascii?Q?1WZd3E/IiUOkuEIFQsouCtKL1QCIr3mwchJeTBspMjL81l5yL9Dt/cijUa24?=
 =?us-ascii?Q?3fnvxYZ+UFSRzWO7Jio3ix3OLd/oTcfdkJPEMF/oo7vJNIqtj+LdGRGiXoGu?=
 =?us-ascii?Q?00x/6K6+KkQEB2PNUb3nSSCklkMNWYfF8LGqp863QfgNpwhk/sa/HhVi7xdN?=
 =?us-ascii?Q?O9Ha9yGgABj+SgNFCdnJemHvaI4j0ZPyzDP/xw1Zc8W5rgA9NQWvwA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?UzScr0GPtTuKilzGNH5bKICZ58ZP3dHVVcvKg/nwsnvn7N8bnjWfgF/L381S?=
 =?us-ascii?Q?LYzZfHvsjYyfn6tOI8o84Az/DB1iC6pChPoUKC+0H1F48yBM690jm6Fkk5uE?=
 =?us-ascii?Q?ZjipesnAEAVsZAsVqPRztufM6Zk1em2QXbgUzNbPO5CtseitDOgjKswVpXVu?=
 =?us-ascii?Q?b3EvtS1IyDCUMgfbwzJVccwoo1fI9fkHI/lLAZY4uA4TGCRS8Ir8VcOwnUNz?=
 =?us-ascii?Q?1PdGBYaCSSL9hrshhj1AQiwQeoYM0Z3sAyvBVVa8fu28+XrV0gu1UOHbJ+Jo?=
 =?us-ascii?Q?jPpVJ8XvyttPDhSZ+6/L5WVNnEx5F5fi1seB0kq31iu301btJSycdqkau9jI?=
 =?us-ascii?Q?vTnD83YIGxxNXLBVHphY7uPic2nnAaVvqM4H1bdqfQNIWnBwzFlM8fFTNck5?=
 =?us-ascii?Q?RO+hJKx9vpXNXT1EOhOXH3uyHx8ZiDyFzctWd/nh9RxotOMyZDLbuoXjrZiE?=
 =?us-ascii?Q?wo9eOD5pLo2ya2eS+m7X/3bqV23D2UouKMINCx2XlSMwogc6C3sdew+K4rZe?=
 =?us-ascii?Q?x9MgYDdIyVrx8XMrrGgQj2+WM6l5qOZI7rouch/MuXa2ATo4HiOsJTxu7Vcr?=
 =?us-ascii?Q?N77Zm5PyKjHSaD+tcKBNTv77umPxOYEjdXnuZpjhEfAhUr96FF7JkSxdX2iL?=
 =?us-ascii?Q?dWP2bIeXIOUlj01Bz9YGBtQahzUeibR9yY2Y8hrcaDTulz9AMm2pvkdXSAII?=
 =?us-ascii?Q?haxtQWX1SFqihUaDfULJ5QODCFS9UD9wx/x9n+PVJEevgOkrNr/+LthFG/AV?=
 =?us-ascii?Q?acwPZ1Jyp7kcSXIBrSAfhTFgu+N51MJg+JK1fJ2asQSi+SMXKlkeP3Qgx9TS?=
 =?us-ascii?Q?GusUu4plfH3+McyJm1AAtlxjNxZAReG8I/Wf9orNcZGzh+K2HiLaxUBl7VC9?=
 =?us-ascii?Q?eHIfotw6LxBujWqWGHDTx6tnogmD5FoJfYsi5jxioqBS5kQZNlrLYqyXGugG?=
 =?us-ascii?Q?Sw0V4upC+lie3yq3YVXR31S7lH3DlkCUA9Yuo1079lRVYQ4Av4+EU2SGSheO?=
 =?us-ascii?Q?fxtyyS73UXkeaQ3mLz+d9f+NdwJsdq7bOMu8zCTTF44sYBDgP0pTJB64caxd?=
 =?us-ascii?Q?yNMusfIQ/7sMDHIGxnkUC3B6rQ1FRkGP7Y7qwnpietyRPwAuZygP6niKIQtI?=
 =?us-ascii?Q?5IoM2Qhurmpro2VCHb/ZURASFYeA5UsmM7DTL5i6jlpEkYGxgsg60qgNZLKK?=
 =?us-ascii?Q?74Kr8ZfXLgyJjkP8pdLcA2IUah3oYDXV5ISWy3HErYnzFDw2E/tGfme6ACAi?=
 =?us-ascii?Q?C2To4ZYB9YIf2mrRuLafW4mYbDL49XXJgCOH4FqeX/UllvUlpTYcQtxWkdh8?=
 =?us-ascii?Q?5u2R0Pq9bOh/hxkTzVrtibbHi1jmnKioKu7CxdJHJPTHB+zEbVxmHO/8YbUk?=
 =?us-ascii?Q?4VUv3S1oik5/a2awIH9aWMkmtd5Q4+Muntwh4hKTE104phFRqe4qHgvH4XyQ?=
 =?us-ascii?Q?O/Lw9l+42Cq43n2axJyQnr4mxI5UxyHLwJwEKZbolZLw7UcyBLh7PGs9cYuL?=
 =?us-ascii?Q?X//LVoGCWc8dL2Tr52auN4p0ZEA0g+HJdmuodGhcN1dqVc6S5O2W9y1NEkVn?=
 =?us-ascii?Q?3nFRO5FASqABZVxhfa7qtY7I4KMAvrTtYy75140RYjyY5Xz5VPQkFM5cYcrI?=
 =?us-ascii?Q?ag=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0a99bd2-94b3-4d8d-c701-08dd7d869e88
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 08:05:29.6257
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7u/r5JKjej3ZMtdnomsLY+8jR3UdOH/1fbq+BQ9l1LwCLfAEugSKgfvWBXwJltuPMcfz+R7QVfnBmz6wtRihcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5163
X-Proofpoint-ORIG-GUID: Dxof-Ts4ZM-AsS889lQq-JA2axePbUhz
X-Proofpoint-GUID: Dxof-Ts4ZM-AsS889lQq-JA2axePbUhz
X-Authority-Analysis: v=2.4 cv=BaLY0qt2 c=1 sm=1 tr=0 ts=6800b64c cx=c_pps a=S2IcI55zTQM2EKrhu3zyRw==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=XR8D0OoHHMoA:10
 a=t7CeM3EgAAAA:8 a=BzAx-Z_h_KezxE8ngv4A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-17_01,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 mlxscore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2504170062
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 17 Apr 2025 08:05:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116924

From: Chen Qi <Qi.Chen@windriver.com>

Using qemu to run non-elf executables such as shell scripts directly
is destined to fail. In such case, we check its interperter and try
out best to run it accordingly.

We'll also need to skip the "/etc" directory as files under it are
configuration files and init scripts. And the init script will
send SIGTERM and SIGKILL to all processes, giving users annoying
behavior.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../classes/check-version-mismatch.bbclass    | 60 +++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/meta-oe/classes/check-version-mismatch.bbclass b/meta-oe/classes/check-version-mismatch.bbclass
index de7a5102d0..da99feaf3f 100644
--- a/meta-oe/classes/check-version-mismatch.bbclass
+++ b/meta-oe/classes/check-version-mismatch.bbclass
@@ -11,6 +11,7 @@ python do_package_check_version_mismatch() {
     import subprocess
     import shutil
     import signal
+    import glob
 
     classes_skip = ["nopackage", "image", "native", "cross", "crosssdk", "cross-canadian"]
     for cs in classes_skip:
@@ -171,6 +172,42 @@ python do_package_check_version_mismatch() {
         else:
             return True
 
+    def is_elf_binary(fexec):
+        fexec_real = os.path.realpath(fexec)
+        elf = oe.qa.ELFFile(fexec_real)
+        try:
+            elf.open()
+            elf.close()
+            return True
+        except:
+            return False
+
+    def get_shebang(fexec):
+        try:
+            with open(fexec, 'r') as f:
+                first_line = f.readline().strip()
+                if first_line.startswith("#!"):
+                    return first_line
+                else:
+                    return None
+        except Exception as e:
+            return None
+
+    def get_interpreter_from_shebang(shebang):
+        if not shebang:
+            return None
+        hosttools_path = d.getVar("TMPDIR") + "/hosttools"
+        if "/sh" in shebang:
+            return hosttools_path + "/sh"
+        elif "/bash" in shebang:
+            return hosttools_path + "/bash"
+        elif "python" in shebang:
+            return hosttools_path + "/python3"
+        elif "perl" in shebang:
+            return hosttools_path + "/perl"
+        else:
+            return None
+
     # helper function to get PKGV, useful for recipes such as perf
     def get_pkgv(pn):
         pkgdestwork = d.getVar("PKGDESTWORK")
@@ -273,6 +310,9 @@ python do_package_check_version_mismatch() {
         return
 
     skipped_directories = [".debug", "ptest", "installed-tests", "tests", "test", "__pycache__", "testcases"]
+    # avoid checking configuration files, they don't give useful version information and some init scripts
+    # will kill all processes
+    skipped_directories.append("etc")
     pkgd_libdir = pkgd + d.getVar("libdir")
     pkgd_base_libdir = pkgd + d.getVar("base_libdir")
     extra_exec_libdirs = []
@@ -310,8 +350,28 @@ python do_package_check_version_mismatch() {
         # first we extend qemu_exec to include library path if needed
         if extra_exec_libdirs:
             qemu_exec += ":" + ":".join(extra_exec_libdirs)
+        orig_qemu_exec = qemu_exec
         for fexec in executables:
+            qemu_exec = orig_qemu_exec
             for version_option in ["--version", "-V", "-v", "--help"]:
+                if not is_elf_binary(fexec):
+                    shebang = get_shebang(fexec)
+                    interpreter = get_interpreter_from_shebang(shebang)
+                    if not interpreter:
+                        bb.debug(1, "file %s is not supported to run" % fexec)
+                    elif interpreter.endswith("perl"):
+                        perl5lib_extra = pkgd + d.getVar("libdir") + "/perl5/site_perl"
+                        for p in glob.glob("%s/usr/share/*" % pkgd):
+                            perl5lib_extra += ":%s" % p
+                        qemu_exec += " -E PERL5LIB=%s:$PERL5LIB %s" % (perl5lib_extra, interpreter)
+                    elif interpreter.endswith("python3"):
+                        pythonpath_extra = glob.glob("%s%s/python3*/site-packages" % (pkgd, d.getVar("libdir")))
+                        if pythonpath_extra:
+                            qemu_exec += " -E PYTHONPATH=%s:$PYTHONPATH %s" % (pythonpath_extra[0], interpreter)
+                    else:
+                        qemu_exec += " %s" % interpreter
+                    # remove the '-E LD_LIBRARY_PATH=xxx'
+                    qemu_exec = re.sub(r"-E\s+LD_LIBRARY_PATH=\S+", "", qemu_exec)
                 version_check_cmd_full = "%s %s %s" % (qemu_exec, fexec, version_option)
                 version_check_cmd = version_check_cmd_full
                 #version_check_cmd = "%s %s" % (os.path.relpath(fexec, pkgd), version_option)
-- 
2.49.0


