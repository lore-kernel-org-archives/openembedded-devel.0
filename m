Return-Path: <yi.zhao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 800C7C433EF
	for <webhook@archiver.kernel.org>; Thu, 25 Nov 2021 02:45:05 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web09.7319.1637808304496207846
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Nov 2021 18:45:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=DEYO4Qdb;
 spf=pass (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=6963faa46c=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 1AP2fh1H009587
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Nov 2021 02:45:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=Ol61r1Jf30CmzNiM8KdRtWr74DKjbqt2ayMqQIEJHlM=;
 b=DEYO4QdbIGmPEyUyETU7KjFcwTJ6idnPTnVhmP/lN+QdkE//f6EkrlZIITjcFpwRL9l7
 djRk25O2yAcuq5YaWXTcmTx6s5YnIRuq6CMiEA6LrWfQewqlY/he24NkvWYTf4mKNAlY
 V9NDId4AIxS3pc0Rf3gGhpivOtgiSNSm6Syn2mgxJ195on9SZVMSb1c1FM/8BO2DlJGV
 IeNdNWBwaQ/X5+KmivOnKcxl1x7f1DThz/2u6NckDwyTyJAeUFmA5iDt9rA+pHaeN5Fp
 pQG03GZy+rsySwItOHMNWucQaf8Ww1aKYzdyx6Q+5H0ge7ikU7gnR47qDzHyuIvqk+DP jg==
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2177.outbound.protection.outlook.com [104.47.57.177])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3chce58yxf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Nov 2021 02:45:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S3K6pCf6cbu1nBjbnP/2kDID2ZJN36ZSepbgRxKEFtmMk51i21TwNlLv/xUagn2HJALeBW9RtlZq+9Trau/E5lXQZqyG4zoRKdJaXf/nvNx4/KG3z2Q3cutMDSMOW0aJhMOB1q32ZhCKedwJyH7kAIDK0rITKkmIxoUGpu8YxJ75Gg8zBrYPLhB0aLgar79gWx2GREo4wKuurQfajzWtsOQKKRrA8/Ea/eI9F3aDgzXCa0N+M734w7u9seUMd+OCSwwsRsxvdR7A+Rn31Sh3cK3pnmGPRRK7lBe5q2gN+lVjs9h/Nrac/rKRDm3Pp3AUx44eQZkcxGQ0V3K9d9oNtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ol61r1Jf30CmzNiM8KdRtWr74DKjbqt2ayMqQIEJHlM=;
 b=ab8HYeTKGKWeIaICLLUK7oYlxoVe1m5FNjpDmsLK/S2VAFQge+xR78j/Ie1Iwe39MgG+CNKUrQmIY7gytqBtE8w5dr7C7rDroHHXgKbOn5+Z0w25RF8Q6DPbK3VtQgVg5OdX0r5URgcAgWwWoReFbttDDplUGuw4U50Zk4dnhPEwVGC9YTlXczHrRQkhAVA7jcl4LuovS1ozKX1/pz7ePaugxN5NenV1ZWXpwDFdi8fRnyxK8qQaUjJ+FtWcSn1Na/ftkLElPPhK6hKNgAlpy0cW1A/KLbX9hj0bf6eZifWslhJJVmfQfxLrdVEU4hXj2tEyFyw5k20UPTVK0biCmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by CO1PR11MB4803.namprd11.prod.outlook.com (2603:10b6:303:90::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19; Thu, 25 Nov
 2021 02:45:01 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::455e:9cfb:d106:4480]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::455e:9cfb:d106:4480%9]) with mapi id 15.20.4713.022; Thu, 25 Nov 2021
 02:45:01 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 1/7] libtalloc: fix pyext_PATTERN for cross
 compilation
Date: Thu, 25 Nov 2021 10:44:44 +0800
Message-Id: <20211125024450.143364-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HK2PR04CA0062.apcprd04.prod.outlook.com
 (2603:1096:202:14::30) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
Received: from pek-yzhao1-d1.wrs.com (60.247.85.82) by
 HK2PR04CA0062.apcprd04.prod.outlook.com (2603:1096:202:14::30) with Microsoft
 SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.22 via Frontend
 Transport; Thu, 25 Nov 2021 02:45:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 76b8ab9e-39b5-4b49-b651-08d9afbd936f
X-MS-TrafficTypeDiagnostic: CO1PR11MB4803:
X-Microsoft-Antispam-PRVS: 
	<CO1PR11MB4803623D158687C5B80DAAF5F9629@CO1PR11MB4803.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1388;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	3WthVneLOsUzkrcrUo5OFw8ZqmfJ9J7PLu/bPVBZLHKQJovZ8lsxQotGtkAizTFaU7wO2O3nyK4Vllg2+7HT+qiseCs8r4IbnX9V+4MxhyQvKTjwW+BWGQViS7bDrz8wcJCsbpupIghQO2NeuM12Ojv7c24Ud0ygNORrADmVMRSVsebiy5+ehXMxW9l00vas3p3lTWmi5NUPlWfja/nxfvZrT4+V2DJG9Fs3zU8wD6k6MAwYgM0mHoS/IFaT/ClKUhNANlmOPqj+f5lDfeHAw9+gK7AT7xsayqJhWFMCb8ESVarqKnDJ+JplCmOOKepIlGon83IRCaoFF2dBVSFvT27lFoPIU5O0W5jMjUtW4ooOPeJ+Y4gE28wbPqo4Vf8qZw3zunHXZcgiBC5nBGO2ZFfHA0VEPYPVgJjQ0HgPfa7lsUWzAqL8yT7WwGE7QjfehkdCMLRJBmw/NDQntI5xr8qQ21OxY0+THwJnINiYmMd//1y/ysjSrD2WbUo6ljbXOr8Vz6GJSdDkUHIJzzhwsntq8YswBvBHVJw0RHS2FEGlRmriop+b5IEikjxGpMwDUB+8r1TfW4OavcvAvxjcbziPcSA8FHfE2M0/Ikh/d9z2PyXhD1L0X2RHEAg7iXjn1AxIbtargj30ykpQdwkF2MmG9M7mDcYhOj0TRlQC5tIbN9riirk2KZY1i7im96j+cvlkocgSj3u+BJqxHAnLJ4uUyrm5PJW0XUKy6s2YVkIJc2+Dku4D+FLNRCIf7knIp6BXdbuXrZgTCZHnmlQ9PkgkTWSz53Xa+AjX9g6UmMg=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(44832011)(186003)(6916009)(52116002)(26005)(6512007)(2906002)(5660300002)(6666004)(2616005)(956004)(6506007)(508600001)(66946007)(36756003)(1076003)(66556008)(8676002)(86362001)(38350700002)(38100700002)(66476007)(316002)(6486002)(8936002)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?CkN516Ow55cXcT1p1wow4+aOkTJFDTq6bDeHrmmKAk6TbVNMKiXEWNuLkkg3?=
 =?us-ascii?Q?pN9I0MKDKV0g8wz1PBBuOz9dUSBZYsg3upjxZFSFmtBen7I2yfmOQSKvz6yb?=
 =?us-ascii?Q?FV6K14DmshBULImsEuEOwpYXxUhrcfh9R6r9hVddUmxruB8b1f3S5u2SmNa7?=
 =?us-ascii?Q?j1pWiN24sOGFndp2bD4UNdZSgYxcmF7aTlexDv5xUlzBq1oT/yller2DmReK?=
 =?us-ascii?Q?hxQF56kfetou94xGHhxoXkgD1m21jtO870yglgTxsmnJ/1adgNOMAo+gfZjX?=
 =?us-ascii?Q?MkkbADAZ7XHmhce6xYrI6mTT9z4jZb8aGpyCUF0VSXmDRnewHM/hcfPdXqk0?=
 =?us-ascii?Q?nOKWSyn0taRKHwN4A9WhSWhnVYCPm123TaZQGYDRjkqQ+L6GCqU4oTHI+znr?=
 =?us-ascii?Q?ZXt3ZwAq3b7m6WZF4BhcFIH9P1JrcRO3qvfHlDxCjzLfmExyNs6Axrfg0B3r?=
 =?us-ascii?Q?ist+AS+dnjr3p/bk8bLDteRet7V+DjJ7ZAIK7BdEK9ve3W3s7GwHy+FzAjLa?=
 =?us-ascii?Q?04mBKC5bd4onBVDhASNsSs+S6KO//silTaQe55RhXT3zgq8i489qQXkLJ3mc?=
 =?us-ascii?Q?zVTyb3AFWS/Ycg2qxHYNCdnYR+wcwOva7XhBgs9O+DkQSsgwPoAyotJBINKW?=
 =?us-ascii?Q?4YtO3jKV4oQtal/b+pN1XT8WaxJ0te6A6iK7UGFAHHuvFSUaqe8VzWacORkD?=
 =?us-ascii?Q?RNZU93+Lql61yeLHaL4loJkofM6CqhCRQgSQVSE50Ctqs76z0UL4de5iBHVX?=
 =?us-ascii?Q?Mo/+t6JoQ/wnowQoD0ygT1IDY2fYFAHGE5lB1XMw+NsA6mbDKC8YBfqMaUlr?=
 =?us-ascii?Q?e/QKsVEracAc0buxBY65XILve4CQgMZCVC34It9khBSmk89a6TWtYP1nLZwk?=
 =?us-ascii?Q?nHSOa2z5/MuEvNuDxCXYi0PV3ZkT5SaJjo0XHlgwhCUYfXH+x6ZnhVe8cskk?=
 =?us-ascii?Q?29KPYUKJLJcISblHlkl+l2YufFTYAcyaQ7esqth/giadMIdkp9K4ZWFtD5xB?=
 =?us-ascii?Q?GXTiHJP6LYwuLX3vkyboxYbaechk7GFEF3iAu843fHoko9KyndBo9fgR1KUI?=
 =?us-ascii?Q?uCZIEZiNwKAEoOXAMqRe+eZmALuox9H2Im0yN9EdBb0A+iqDkXL//uFlxSRy?=
 =?us-ascii?Q?3+YabIwphF5ndoemD5zmoMVr14LBrGV4sKihGoskRuKmW4mv+ybtd8MZ/aug?=
 =?us-ascii?Q?DjwUQVN1PRYeMXeI10z2oG6fRQttdntvyqwEcqvv24iYg2dO4kZUIR7AlJYn?=
 =?us-ascii?Q?N/BzzymK3NHpttmG+ZcRvXmSLGl/mKmiljRgnJHfa9uLVaVFd5qOV6DaBijQ?=
 =?us-ascii?Q?HYXHzKJGiQbjc25ERMmggAdGERjg0dM+XF4D2OpsU+MuZbz/oZGUrUwBQQf3?=
 =?us-ascii?Q?NzN9kOLkgcryahcGcxH7lvzmC37VAj7Nd3lZhI5dzzHVYtVauxPoEQupdG/K?=
 =?us-ascii?Q?oR4MNt9apxWfKpfAq5m7zNyQObaYbHhjFI4c4Cpzw/3wg6CFVdSUyDSQuLGw?=
 =?us-ascii?Q?G3dfD5YB1H6QwQH6VPdrSBOUkAcH6zzNDWrrLPTl0Yw1UZqiwsEmyqTKPGvU?=
 =?us-ascii?Q?0CgvVVMizC1UzOf1MV1tGhqGKdWn3i8yBF7eL+cE1KhPhMXocXGE1WfcvnCV?=
 =?us-ascii?Q?ccMY2+xfbmnMohSE6sLLLxk=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 76b8ab9e-39b5-4b49-b651-08d9afbd936f
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2021 02:45:00.8629
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 YR9XvldzCGr96/yX9DSqB0aDQd3061/uWuMSD+6ckzO2G/iBAAUmN8ac4pdckJuM2dz41sCXMCVTG7W0KIrDNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4803
X-Proofpoint-GUID: cjMyPGMb4jDe4vWz-FYFcgp6h8Sfou-M
X-Proofpoint-ORIG-GUID: cjMyPGMb4jDe4vWz-FYFcgp6h8Sfou-M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-24_06,2021-11-24_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 phishscore=0 adultscore=0 mlxlogscore=999 clxscore=1011 impostorscore=0
 suspectscore=0 malwarescore=0 spamscore=0 bulkscore=0 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111250012
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 Nov 2021 02:45:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94116

The pyext_PATTERN will add native arch as suffix when cross compiling.
For example, on qemuarm64, it is expanded to:
pyext_PATTERN ='%s.cpython-310-x86_64-linux-gnu.so'
which will result in the incorrect library name.

root@qemuarm64:~# find /usr/lib -name \*talloc\*
/usr/lib/pkgconfig/talloc.pc
/usr/lib/pkgconfig/pytalloc-util.cpython-310-x86_64-linux-gnu.pc
/usr/lib/libpytalloc-util.cpython-310-x86-64-linux-gnu.so.2.3.3
/usr/lib/libtalloc.so.2
/usr/lib/libpytalloc-util.cpython-310-x86-64-linux-gnu.so.2
/usr/lib/libpytalloc-util.cpython-310-x86-64-linux-gnu.so
/usr/lib/libtalloc.so
/usr/lib/libtalloc.so.2.3.3
/usr/lib/python3.10/site-packages/talloc.cpython-310-x86_64-linux-gnu.so

Set pyext_PATTERN to '%s.so' to remove the suffix.
After the patch:
root@qemuarm64:~# find /usr/lib -name \*talloc\*
/usr/lib/pkgconfig/talloc.pc
/usr/lib/pkgconfig/pytalloc-util.pc
/usr/lib/libpytalloc-util.so.2.3.3
/usr/lib/libtalloc.so.2
/usr/lib/libpytalloc-util.so.2
/usr/lib/libpytalloc-util.so
/usr/lib/libtalloc.so
/usr/lib/libtalloc.so.2.3.3
/usr/lib/python3.10/site-packages/talloc.so

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...-pyext_PATTERN-for-cross-compilation.patch | 57 +++++++++++++++++++
 .../libtalloc/libtalloc_2.3.3.bb              |  1 +
 2 files changed, 58 insertions(+)
 create mode 100644 meta-networking/recipes-support/libtalloc/libtalloc/0001-Fix-pyext_PATTERN-for-cross-compilation.patch

diff --git a/meta-networking/recipes-support/libtalloc/libtalloc/0001-Fix-pyext_PATTERN-for-cross-compilation.patch b/meta-networking/recipes-support/libtalloc/libtalloc/0001-Fix-pyext_PATTERN-for-cross-compilation.patch
new file mode 100644
index 000000000..47ee4bb24
--- /dev/null
+++ b/meta-networking/recipes-support/libtalloc/libtalloc/0001-Fix-pyext_PATTERN-for-cross-compilation.patch
@@ -0,0 +1,57 @@
+From b5eaeb7ed4e75012d2715f995e15a13850064f61 Mon Sep 17 00:00:00 2001
+From: Yi Zhao <yi.zhao@windriver.com>
+Date: Wed, 24 Nov 2021 13:33:35 +0800
+Subject: [PATCH] Fix pyext_PATTERN for cross compilation
+
+The pyext_PATTERN will add native arch as suffix when cross compiling.
+For example, on qemuarm64, it is expanded to:
+pyext_PATTERN ='%s.cpython-310-x86_64-linux-gnu.so'
+which will result in the incorrect library name.
+
+root@qemuarm64:~# find /usr/lib -name \*talloc\*
+/usr/lib/pkgconfig/talloc.pc
+/usr/lib/pkgconfig/pytalloc-util.cpython-310-x86_64-linux-gnu.pc
+/usr/lib/libpytalloc-util.cpython-310-x86-64-linux-gnu.so.2.3.3
+/usr/lib/libtalloc.so.2
+/usr/lib/libpytalloc-util.cpython-310-x86-64-linux-gnu.so.2
+/usr/lib/libpytalloc-util.cpython-310-x86-64-linux-gnu.so
+/usr/lib/libtalloc.so
+/usr/lib/libtalloc.so.2.3.3
+/usr/lib/python3.10/site-packages/talloc.cpython-310-x86_64-linux-gnu.so
+
+Set pyext_PATTERN to '%s.so' to remove the suffix.
+After the patch:
+root@qemuarm64:~# find /usr/lib -name \*talloc\*
+/usr/lib/pkgconfig/talloc.pc
+/usr/lib/pkgconfig/pytalloc-util.pc
+/usr/lib/libpytalloc-util.so.2.3.3
+/usr/lib/libtalloc.so.2
+/usr/lib/libpytalloc-util.so.2
+/usr/lib/libpytalloc-util.so
+/usr/lib/libtalloc.so
+/usr/lib/libtalloc.so.2.3.3
+/usr/lib/python3.10/site-packages/talloc.so
+
+Upstream-Status: Inappropriate [embedded specific]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ third_party/waf/waflib/Tools/python.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/third_party/waf/waflib/Tools/python.py b/third_party/waf/waflib/Tools/python.py
+index b1c8dd0..24faa31 100644
+--- a/third_party/waf/waflib/Tools/python.py
++++ b/third_party/waf/waflib/Tools/python.py
+@@ -328,7 +328,7 @@ def check_python_headers(conf, features='pyembed pyext'):
+ 	x = 'MACOSX_DEPLOYMENT_TARGET'
+ 	if dct[x]:
+ 		env[x] = conf.environ[x] = dct[x]
+-	env.pyext_PATTERN = '%s' + dct['SO'] # not a mistake
++	env.pyext_PATTERN = '%s.so'
+ 
+ 
+ 	# Try to get pythonX.Y-config
+-- 
+2.17.1
+
diff --git a/meta-networking/recipes-support/libtalloc/libtalloc_2.3.3.bb b/meta-networking/recipes-support/libtalloc/libtalloc_2.3.3.bb
index e6e2066a5..9b207609f 100644
--- a/meta-networking/recipes-support/libtalloc/libtalloc_2.3.3.bb
+++ b/meta-networking/recipes-support/libtalloc/libtalloc_2.3.3.bb
@@ -9,6 +9,7 @@ LIC_FILES_CHKSUM = "file://talloc.h;beginline=3;endline=27;md5=a301712782cad6dd6
 
 SRC_URI = "https://www.samba.org/ftp/talloc/talloc-${PV}.tar.gz \
            file://options-2.2.0.patch \
+           file://0001-Fix-pyext_PATTERN-for-cross-compilation.patch \
 "
 SRC_URI[sha256sum] = "6be95b2368bd0af1c4cd7a88146eb6ceea18e46c3ffc9330bf6262b40d1d8aaa"
 
-- 
2.25.1


