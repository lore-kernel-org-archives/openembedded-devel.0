Return-Path: <peng.zhang1.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24738D44D4D
	for <webhook@archiver.kernel.org>; Wed,  6 Nov 2024 11:03:36 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.43216.1730891007962582474
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Nov 2024 03:03:28 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1040f5e824=peng.zhang1.cn@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A65e1uB006803
	for <openembedded-devel@lists.openembedded.org>; Wed, 6 Nov 2024 11:03:27 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04lp2040.outbound.protection.outlook.com [104.47.73.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42nb28c8y5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 06 Nov 2024 11:03:27 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xVfP9y/yWtio1Kw8ikSAlVMBzhI+YuzgUEU5JNh8F6X9lV30u1KsFDQACZB3EHjEvyi+5b/7vWWqca+lTcMywBs48Eawm+k3eotar60+BuhyQdYaarwjN7Njpnjud3TjCuP1iguK78ALHfKHcCSoC3h1Gcb0FPDOs2gZ7lKLgd0qlApqqDokJNMABtER8Syehu/aHKWDx+IZBbNX/44iB2X27lHQrIc6E/6ye4Vlzsv5Cwb+IA7psZKGEFgd4AOuF5jbHQ3uNoZAN/WePeDE/xVt7TLZtO/XWzr4+iLYRkFIRaG77MKK1Fjou/8BvOpkXa3dC7oETnCLz6xV33DY4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O8zuCYzL7l30Mhhm3T7OfRM6guIFQqirTR3s8RE5AxM=;
 b=p6988QpIbb+94Q4eisZm9iLtGvNDZ8wtjeHTgIx+6ow9Sj/lEd/DWh9mz2Z8yZ0mC1/C09WDTAehDb/gn3S6PA3Zz43vmCR+413qhikR2+0UOwWZrB2uF6fJGvXP1mkLhzGmBRrQJOKMOUyQDKg8vKKqIi4Ip5gv+SmWkMdZO+eWFRRhtc8i8WUTXE6MuydQAqag4Y6dJCr0iybaoPkeuEY/lTP/mWN71FLtlfGCYCsfPlB6o036Zb+OFiF0iFpGdbtbJt9SU8rwVFOnTbu09TBLY0ArRJILS2QD6W7W3PIflcOGKjmH16KXPXwzZjr1qmzbPnd3y2ZkZl2tOKGJ6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8562.namprd11.prod.outlook.com (2603:10b6:610:1b8::13)
 by PH8PR11MB6731.namprd11.prod.outlook.com (2603:10b6:510:1c7::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Wed, 6 Nov
 2024 11:03:22 +0000
Received: from CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::24c6:f8fc:1afe:179f]) by CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::24c6:f8fc:1afe:179f%4]) with mapi id 15.20.8114.028; Wed, 6 Nov 2024
 11:03:21 +0000
From: peng.zhang1.cn@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH v3] parallel: Add recipe for GNU Parallel
Date: Wed,  6 Nov 2024 19:03:11 +0800
Message-Id: <20241106110311.1657900-1-peng.zhang1.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYAPR01CA0171.jpnprd01.prod.outlook.com
 (2603:1096:404:ba::15) To CH3PR11MB8562.namprd11.prod.outlook.com
 (2603:10b6:610:1b8::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8562:EE_|PH8PR11MB6731:EE_
X-MS-Office365-Filtering-Correlation-Id: 213226dc-f771-4e4a-090f-08dcfe52a0a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?gJJhmHU6CPxVi7rUXiu3rQIMLkuVH+8hVGaNyOe957Ao8G5pzVpqzY2yo/9D?=
 =?us-ascii?Q?9myK1EETf4kRo9CJnmVjOPhXrdB16YAiRW1vA9JvpeogGdAMizHfjswRa+JM?=
 =?us-ascii?Q?mckPCDJ0fOpxsrjWaVyXyk22AJVEbcNwiLKIOxH/Y1YXrYufsS8EujCexCCP?=
 =?us-ascii?Q?sC+40InQVkH78PqmzOQmo/SJdQk8/jka92zevtEEEIckUBGaMowrLmiNkoiY?=
 =?us-ascii?Q?FEL7lY1R9kCEalxheYN2CTjivBoGejfVot5xilg9MgGKOgCrrGPsfhXl3JXG?=
 =?us-ascii?Q?48PA6YCuqHDA/Y4SDhY0HV/N+y9huGGRQGD3FkcYvSTnYv0FYerOXbf3JeFV?=
 =?us-ascii?Q?bshcpcNP3CGbPUiv+iRB2xullIr2hxiVzK079rjPWU37swnpOc0uycVEqYFi?=
 =?us-ascii?Q?DbeM0fTCYqhbY8P9GH/egeOKp7lV//API2kvANt+Tslbi0mw2rU3kW7O32ur?=
 =?us-ascii?Q?qdKpIxxeLJ3PXSsPPMopwWIqf6ZQQIWa6IzcGu03+PCiCgoHWqlkRUCthXk0?=
 =?us-ascii?Q?VHlzBPjhkgaC/5Ue1LymnJ0Y/wMF2yKeUumU75alt0K8gdSaUlbtl3DpI4Dx?=
 =?us-ascii?Q?4n8jRFnmvmFi8E5ogU8cHWc9hmHbhKoM+l6pcbPo8g+Rx0QPPW4AkTD2tzCG?=
 =?us-ascii?Q?13T89rhyZ+U6nC9duoinUkWi+PBDaL71+Dze+//FOpNgQju5BSzSVrOBvFfF?=
 =?us-ascii?Q?aV5nYh7uoiqdVNr6E6hEWWHEYyKhdWtpHACVcab03FRzxPErs2/gD273nfJ0?=
 =?us-ascii?Q?vwBCWvajjiVApphNZOXxDZH5bGLJducT7WwneGurxOmOSL6cu6syZWS/4WF1?=
 =?us-ascii?Q?/2R8yYfGghBhCinZ4jLiO9kYBBx2QRieNqly59dotzeNFaa6Wr/Ucxq3N8w8?=
 =?us-ascii?Q?PJl4rZ5P7t089/9wxE60AsKCi9+LkVrpqwS/LK02ATaZxokv1HqizpO5NNEZ?=
 =?us-ascii?Q?v1j1vJdR50ay+XYSjfrjuBGqyzW5vk442FNHyOzh+B8QviXh1EeoaGEE2pnD?=
 =?us-ascii?Q?8keSUw2xMRdJqxR2G6tCRHzUgiPZC8wPyr9SehK8hD4vSe070Xl2lJ04qVnr?=
 =?us-ascii?Q?dU1rKT+adoI7nNVEXlkZRHJbd8G9VDTF2JXYjBmW+90oiWOIndMzK3D29S2k?=
 =?us-ascii?Q?/DFoMaVwvALUv1KqUHLFy9u146zaBkY3WoWS0BIfzkiIRx+vNsLAqkYXyqMw?=
 =?us-ascii?Q?urJHTUfR9sguCfDn0kSmGG7xcKMCbZSRj1rR7eeLsFlIiQEPU5c2D/Kf/Tlz?=
 =?us-ascii?Q?BJltsqmLDppdtI1CTkJTYQ6ZJh0SwugMziV1q42/Pfho43KblwW67ffAg9sC?=
 =?us-ascii?Q?voGGZJ1XkNkvgtl2p53ajtE/8CIr5CHnAUxRNidvcZ2GXcYS3pVZGw5VMMhQ?=
 =?us-ascii?Q?t+iGnLVXCfTRGCsmQkbvB3GoOyuN?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8562.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?1WgEj8K0mOzL3HRMORL8UBlTUmiSncl0SHexYnMM0Q2pKsLFTKEy8CtId/iz?=
 =?us-ascii?Q?KscRC4ZgSTX39jcr/LDdH9VwVbUWspfg4gW+zZu6QQwJi6ufFdvZoMVUcR7a?=
 =?us-ascii?Q?hcA9wXq4jtVYg9H8PZYBQ2QhqcUznwAc+n7odBEOXk5syHpdFG06GVjoBaIk?=
 =?us-ascii?Q?MYLevHXtHQ3orTZRQrv28FmahKlqqQWX40l8L9VbjHf6qaloGfd0ZsN7VAng?=
 =?us-ascii?Q?3+POK+rXeTTva/7ullodG6YVKrnpYUg2ArjJJhjappAxPlxY04XFBGFzsXfB?=
 =?us-ascii?Q?rIOv1BkQoAXw0xTEwQUW1pVOvTKgTDKtMY2zAfDS/PHjO8BQ74vADwyAntbb?=
 =?us-ascii?Q?LYwV/BBCsKmTi1U1qcqo8rFfhVl6mO0jv5w1etJymn8n1cGvMS6DSfYlyDld?=
 =?us-ascii?Q?9GYmnCP4T5qd8cPP1vX55dDVIn5SYv4NWcnG+iwDLm9TUHDUZS5BenYVPegN?=
 =?us-ascii?Q?g3o50juupYl8QA391TJOJjz+QhJ3y4CvUFzF+4T5DiXIgtCrELmpHWlmq8xC?=
 =?us-ascii?Q?YHETv1z0fFHAPtqcd5GCtTFrNMdX+cHWKsFhZ5Jhk+raiWg+mrmrgATZCFjW?=
 =?us-ascii?Q?mGcLV2WqRd7z+vN1fjLtVJqanlmrq8vgRVZNSWDscQfcPB5IyzQX0fIbVENu?=
 =?us-ascii?Q?L7jutmLyWwEf/fKxDbXsOjEKViQZHX57jIFoN5/792tB+SodQL8KEN1BpyRo?=
 =?us-ascii?Q?/IWM7SxMZBF/l9VxJjghvbhHJGu4jidbgyAXDBBQlV0yC35VnsMd2RsKrwCc?=
 =?us-ascii?Q?BGre2jqGzM03zfhrVzOfuQtHPW7lpovyBKylxLCdH+BJQATREtZBSDyRmYdy?=
 =?us-ascii?Q?9XHNegNCIv1TaU/et8wnFjftNVbnsZSRDzA7zv6dcS5RcttQk8BQdlGh59PG?=
 =?us-ascii?Q?ycqyL1QJz5J/LWE9xJRdjqLlh4hoSM/GjWYAeZdf/+QfrdgnS4+pmg6VJfwU?=
 =?us-ascii?Q?vJUX1HIDQJ8dxDrbkzJGbS2bJ9oJhliWmEVDrXt2V8YREFTB2YWn5QDnUfJG?=
 =?us-ascii?Q?U3WgPqax+0TF7i5ggx0zY0++3QRBBC77+MFdA1WJYJsyg59KUQCxENK9ax3x?=
 =?us-ascii?Q?ChyQld7P3p9/qpuf7EyrCUOTWmjaiEBlS/JZoZdYpBKqwJau8l3j+o09JH44?=
 =?us-ascii?Q?VqoG5eAwt/If+wu/u1xOmNfeaaY4H2iDrTX6P3Ed4om0obApq8guT9fNtM7Q?=
 =?us-ascii?Q?TQtYLu+yHzS7wsqYVn0jiNnjKVNXEqXbXlhc3LiHEA0rcxRx0TNqRmJGUufN?=
 =?us-ascii?Q?LSvd3gV+jkVWA/gHO11qGi2Ga2TdZCEYzgbw3Sx71uxlP9N7hlZbkNQu2Mom?=
 =?us-ascii?Q?BXYDg6zCzxpHYPZkhQknFuIYvfk78yJLV3zApVvaQx1+BOjymsD79xxNsbI6?=
 =?us-ascii?Q?EwVhjryFzgG5O6iCKojgmade0THNxVZJt1O7dTzGLB7M4LKxNxW7tK2GuTdj?=
 =?us-ascii?Q?ThpLQf1QzSsw72OkFoFnBe2tQhsJnCmiRkfBQ8by+Y/BVAVWhP+i9t7Q4HsC?=
 =?us-ascii?Q?9n/EBK2lpsk3UskgxqZNyCxBQpjaeQfsH5fehfob789aZVJ/MQ9P6KHY1/vc?=
 =?us-ascii?Q?pshmthBtk4igEdHFg/2Rfx9ddFoffXfpV8ek5CBdCFz2Xt87fhXe0N39bCP+?=
 =?us-ascii?Q?ig=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 213226dc-f771-4e4a-090f-08dcfe52a0a6
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8562.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2024 11:03:21.6802
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9qLDnxPJNDyfIs2yfAaO+eQKEfqr++GxzCo3PNdGaUDpQTcuo21tLOKU9mGxPoCA2tc2sv0HiG1HjRFrzIQdiTTsiDM61kIryMicPJYtNIA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6731
X-Authority-Analysis: v=2.4 cv=CfNa56rl c=1 sm=1 tr=0 ts=672b4cff cx=c_pps a=CmjB6Nkc3E8pi8fe8piFzA==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VlfZXiiP6vEA:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8 a=mDV3o1hIAAAA:8 a=IJXTklQ-Eef5ha3fy0sA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: oSIgIXQdbjq3_17NDoHLr-hE2IFgWXiy
X-Proofpoint-GUID: oSIgIXQdbjq3_17NDoHLr-hE2IFgWXiy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-06_05,2024-11-06_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 mlxlogscore=999
 spamscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 phishscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2411060090
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Nov 2024 11:03:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113739

From: Zhang Peng <peng.zhang1.cn@windriver.com>

This recipe adds the parallel package, a shell tool for executing jobs
in parallel using one or more computers.

Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
---
 .../parallel/parallel_20241022.bb             | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 meta-oe/recipes-extended/parallel/parallel_20241022.bb

diff --git a/meta-oe/recipes-extended/parallel/parallel_20241022.bb b/meta-oe/recipes-extended/parallel/parallel_20241022.bb
new file mode 100644
index 000000000..e3cf0a6a7
--- /dev/null
+++ b/meta-oe/recipes-extended/parallel/parallel_20241022.bb
@@ -0,0 +1,29 @@
+SUMMARY = "GNU Parallel - A shell tool for executing jobs in parallel using one or more computers"
+DESCRIPTION = "GNU Parallel is a command-line tool for executing jobs in parallel on one or more computers. \
+It allows users to run multiple commands simultaneously, making it easier to process large batches of tasks."
+
+HOMEPAGE = "https://www.gnu.org/software/parallel/"
+LICENSE = "CC-BY-SA-4.0 & GFDL-1.3-or-later & GPL-3.0-or-later"
+
+LIC_FILES_CHKSUM = "file://LICENSES/GPL-3.0-or-later.txt;md5=8da5784ab1c72e63ac74971f88658166 \
+    file://LICENSES/CC-BY-SA-4.0.txt;md5=7130783469368ceb248a4f03e89ea4b8\
+    file://LICENSES/GFDL-1.3-or-later.txt;md5=e0771ae6a62dc8a2e50b1d450fea66b7\
+"
+
+SRC_URI = "https://ftp.gnu.org/gnu/parallel/parallel-${PV}.tar.bz2"
+SRC_URI[sha256sum] = "6de22bf1c67f7f316670d21ed1a2a32f1214dfbd3e420939ba937925c0a57a12"
+
+inherit autotools bash-completion
+
+DEPENDS += "perl"
+
+RDEPENDS:${PN} += "perl \
+        perl-module-ipc-open3 \
+        perl-module-getopt-long \
+        perl-module-file-temp \
+        perl-module-filehandle \
+        perl-module-file-glob \
+"
+do_install:append() {
+    rm -rf ${D}${datadir}/zsh
+}
-- 
2.34.1


