Return-Path: <ovidiu.panait@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87925C6370B
	for <webhook@archiver.kernel.org>; Thu, 14 Apr 2022 16:03:57 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.13456.1649951799563832105
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Apr 2022 08:56:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=fzYZnScV;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=110307959b=ovidiu.panait@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 23EEAXw0004741
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Apr 2022 15:56:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=yJ0IleO9MDEs9iw8zA5GQncK45Dm8/cN5rb+ddShlLE=;
 b=fzYZnScVsvOCpQmFcHUsRBPp23aJw/ryGLTELfdZSOZ5ZYI2nGmgz9bW2JvBta57dtV9
 lYevS3nkfxxzImKnMlP8CgKQKVLp1MZK0eJk5e+hcf1lI+pSPtpyslG0i2hpE55CRkG3
 3TZOZ7LwZZSiqrLJ8EfcIndsyhyXTcAXv5e6pzHIVkXcVF2eevnOl3aTij85/8JpIV06
 hweB3EB4cHS6WCZh5KaAv3erkRnGzPU0+Seldxe0HQEBAmSoHszOar1RjNsRa4avSQO4
 Yig29/5zNrncN81NxcsWcvBpfjHUHBO+gKt70ZhJoMhAChgUai8ZuA04ayXFKQCLbq4Q 5A==
Received: from nam04-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam08lp2046.outbound.protection.outlook.com [104.47.74.46])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3fb6fwc3d5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Apr 2022 15:56:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DrRKZ0sbvfh0vAhiVCCop82kTtia/U4TYpTHctWGrdgfCEj+dbpOs6u4EZp5Py0TVivBwkQMJPIhqksmHVtO/rtEmrSD+o87MbQPWCAcGd7N7KURI1c4siI12mT3RHbBTZ1AObwXLEDvnUNsNRf54Cnjhu3szz6Sd+oUyDA13vOLAJzTb9tEUt1/tfyYN+zskHD1CnTdJ0umhe7970xpFRBzCtBEj1UP6jrItLhGrV4fFoJQnCAtvDzponZ7Rj8Nx0X7szg34wsxyaTu8Hj/rCNKq8Du8xjeEa1xzoM0HPtV8CM6WWYzwBsL/9r7v7+4EonoQ0ekdszF8YBA5if4Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yJ0IleO9MDEs9iw8zA5GQncK45Dm8/cN5rb+ddShlLE=;
 b=KLnxqQwEkzaNaOfchFPHFu+DDsNJ+2Ef3J0DzBqxlbpnfBTNnvGfcRNwSkWQRd34Fx4DGAmdb9gF28ESnslpnL61sdV39bK/qe854e+Nkp913UrYga3StWW9d9MRkGocTzxsJY39WUhh/PaimutplZldc8RBzQkxSdNf3yN713SG8WoPLSYSNzapPYY8/BkuYROQ0/0vAihv1nteYgY+mL3ZQwL0GhlXXjnkr6MarN9iA9pXvfhoBjxS1C1sjrT0ZufAtrE//LHNa5eoT1xBkZ+VjfLR2/Q+kLxybgKGrqxgDFVZf9vw2MKsV+77cBsRhAOEmicSEnbce4JbhEhINQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5327.namprd11.prod.outlook.com (2603:10b6:5:392::22)
 by DM6PR11MB4577.namprd11.prod.outlook.com (2603:10b6:5:2a1::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Thu, 14 Apr
 2022 15:56:35 +0000
Received: from DM4PR11MB5327.namprd11.prod.outlook.com
 ([fe80::c903:4c47:ac8a:992d]) by DM4PR11MB5327.namprd11.prod.outlook.com
 ([fe80::c903:4c47:ac8a:992d%4]) with mapi id 15.20.5164.020; Thu, 14 Apr 2022
 15:56:34 +0000
From: Ovidiu Panait <ovidiu.panait@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] syzkaller: add recipe and selftest for syzkaller
 fuzzer
Date: Thu, 14 Apr 2022 18:56:14 +0300
Message-Id: <20220414155614.841994-1-ovidiu.panait@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VE1PR03CA0011.eurprd03.prod.outlook.com
 (2603:10a6:802:a0::23) To DM4PR11MB5327.namprd11.prod.outlook.com
 (2603:10b6:5:392::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ef70993a-8cdb-4aa4-c01d-08da1e2f59c2
X-MS-TrafficTypeDiagnostic: DM6PR11MB4577:EE_
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB45777265EA8303B4DABCFF7BFEEF9@DM6PR11MB4577.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	nnz4kNDvX6VfenHpyoPXk7Gv3vLiACbxE4RERcLvmRLSr1iP38Zi7IztHKuGovMKy81ym8ezXjOdqRbj3OqDNhQuVE+Mt5IwZi2IG/gk6DTRnIaTPbVvHT7UTGiqF92p2d+u8/pw2mYhpxcYUaEm0cv/qcUAb0HSiIFfmsakleDmqStDdU4sHBBXhSQCyOQ3qgXi57qhezNhB8sym1EY9PD6YoepW9tQwOmFmkLQi/SsBvlclxYNCuNnE3F8g0zf0i1fzmOK/0/Yiz0SG2cJSF5gKFQG5Zw5FPhVODu6yAg01AOw702BVCLQh35cpzghMo8VexW5pfoQgVMkVAFIJ5MwRvdJ1IOmEfEOHdeLQ3v36wmu+MSdFa/Yf3NsyvQ/M+AOcVdLdF2gc4tI4ANLux5k1uBqKb5VmG/H9CE5G71ktCPJ7hPbcDTIwUiySnHI0t41fv8AwiLlhw0VJX8nXcxe58ZUPLC28kW4G5+Sk9zIoAx5ZfVnrVXlCftmFJ+IO7ZNKO9FYJCnkraL/xt0I1u9hWACX54favys6REAk2oQB4I8AXYuK3yBdrXE0Yie02V7J/lYcklJIshHvj3Ws2dngJJQP1gN7rhHpG3XXXdc8biPHAQcbMjrVTTCoSCZuOAD7sBuTqI2ZIfmO9KYkz6hbYesSuxkBUyYlyYSSj8thNTF/izeOwN8Gogl4H6s67PIcQWGuZ4Z5e2WBJxBnAt5ECsZ2PDto9KNoJ6NKdpetCXShgeAyv0uq/zQF4fqCg9bL+NKTWofsuoPqt/zbqAlL4PDw4ZRwDsqi7JrKv9+MssGvd2+Hq1COymaDkePn2vDMdjAMRO+6XVQyFKnpQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5327.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(6019001)(4636009)(366004)(279900001)(38350700002)(38100700002)(26005)(186003)(6512007)(2616005)(1076003)(44832011)(508600001)(30864003)(966005)(8936002)(5660300002)(6506007)(6486002)(6666004)(66476007)(8676002)(66946007)(66556008)(52116002)(316002)(6916009)(83380400001)(2906002)(86362001)(36756003)(344275003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?sW6ImkzZzNOvplhrFt4K/tACUeO5CNnvvUCAJOmMSdeOzyMTIF9GqlS7QZ24?=
 =?us-ascii?Q?Cjwb8dFUCD/MnBA80juUr3ogkaFy4NQqCVuCmc9A4noYJwV3jTqzfTicAARt?=
 =?us-ascii?Q?K4r5qxihvXWImhWTCdgEz4qJmodwjALomPjGAew+fnSZm4Ikiv9inaAX7UHn?=
 =?us-ascii?Q?ku/dU75SUDXQYrMOf/XEekXqvyNr+HZs7J3xEjXeTixaoytBuAvWLCCJCezM?=
 =?us-ascii?Q?QE/oW1SG3yzgIMvKXynUKTsRF+oKNm18RqwT60e0jmAPKlrhsfYFPZHf9zx3?=
 =?us-ascii?Q?s2+xi6kgJn9nICq6LwHEftkNxWELUfknpAqZAMXiw3IlnazAiNtrs4b1zzMg?=
 =?us-ascii?Q?L9S+5kequkByatTJhCLJTsBz7urvumJ/b/i6K2KPvFaj8URgG4BS5U6o2Da7?=
 =?us-ascii?Q?xIYWD4KxLW80D7LP5KxBnXBOmwV0kcGbWu8vJyVqc0wDYRPK1dmr1oawGvcQ?=
 =?us-ascii?Q?siPynQW8YuDyYwZcWm6psOKD/iO+aTq07OIWD7SYCwekicUiLoslbRl89wYJ?=
 =?us-ascii?Q?wBcQTwzeLellDK69SssRf5GZ/3Spb0ZMdmr6g6JcMcs9Zo0ub+eoknPXXLFY?=
 =?us-ascii?Q?ZAsNyO8WMOVndQKkGiG9egSQ3EWaKWCysvia1BWmNgqKveF2o9Xv/ThRaJ/2?=
 =?us-ascii?Q?U0cFXr7fAaEV1BNntfgw45JDKQ29msJZwPTp3z/TO0M+aOFwBsOLTX4J1CvR?=
 =?us-ascii?Q?NkKE3yTi6YBI+C9BYSfb6Oijs2/TT98Dq9XqR7u9pczgtKfjPZOODgNuH6X0?=
 =?us-ascii?Q?82OIzWVwMDYAa9kqc3U6b3bgDKToAg1uydn1szFzuAsA2t3f1b4YfQRKhgeV?=
 =?us-ascii?Q?qlywu7SwtvNuAFdXBC4X9U5onJd7E1zsmulCtcQ6SGJQpGJ7jRekHGBZnAJX?=
 =?us-ascii?Q?S9q4O9A8e98vob9vUtR6ztKHtaIz3XGoyLcLcn3aau97zTjs079hYYqR5aQ+?=
 =?us-ascii?Q?ZYxz3G6rtj2S4W09LU9D7vPCkYB920j9DlAUb+Bk0LCWr+G+v791YT89ycl3?=
 =?us-ascii?Q?HANoHuT5//uWp/I7n1gj90AGLD7nuuU5h1wfB/ki38fbL1q5q8NvF81t5b0i?=
 =?us-ascii?Q?hcaa8by+3OKFerHE70KIRAIefmykdFjHX3ZvHDq5OLf9eRUr9ZjXewZruvom?=
 =?us-ascii?Q?pgPUsNMZd6nFXCCkEF6XzzU+j/uBKrzr3Wf9c8bWsVkzxpsWTzuT4ZYgxBBK?=
 =?us-ascii?Q?Pfy5IiHBpG3rlnOSAggVvS/g1iGz9WVQPAVNwfHICuXzH5K0vpeCbACTGI9o?=
 =?us-ascii?Q?h3WUErfrpr7Bf1aCdXvc5601DUp+o/ZZSECUeRikkVSEuSJUomnUYaeA4ZLL?=
 =?us-ascii?Q?itRbkY1uSVVmc8wSRw8WX5u5fxjF9exj2kJDDdE9khcMM5CNON+ru2NnYPdq?=
 =?us-ascii?Q?KPyv4ewpe+236oivmKf4d0gvwbES9IMYD64m2Ki7/e2EaKZwlboNoLnDqYE8?=
 =?us-ascii?Q?b6f3GAfWNN7iVhXOzd70TzpGIKC//pFGokj5IzO7Y5jqh8SwRnAkin8mZKlY?=
 =?us-ascii?Q?A1MWd/sMPvr1ZEyK64UMuMHuKJc23XdFG8UoQM8oMVa0J1SCYtJaNMrD1J5g?=
 =?us-ascii?Q?sAEdYgrmevbaqZ3+GNJC0c33ToP3HWj/5UZHkb+GreP2CwbyoPN1ulqQWnU9?=
 =?us-ascii?Q?YY3sU23ZS9Z7j2HnG5axDG6fitqM+vmscsKvpVo6oF7qfO7lZjwPtCyDMxyb?=
 =?us-ascii?Q?5KxwK5lkcgk17o69UUzTvk23Wl3X/i/KR04wc3adoRIz4+w5cA0YADThZMtI?=
 =?us-ascii?Q?0xpcdpBun9jKLXODYtY069hW6d4Zmdo=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ef70993a-8cdb-4aa4-c01d-08da1e2f59c2
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5327.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2022 15:56:34.7390
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 jVgikwHiRK7Cf2BYC9ZNWszoAcAl5Y8lZvYWVkBwptR/XVhaxQSc7LAwJmfc1mVCmrYIQlHd9SZUROhzfCgfRNN6c6BYtK7sqDyNiVoFnfw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4577
X-Proofpoint-ORIG-GUID: 6yDc2-aSc0kvAVtelESxrd6y52lBPomq
X-Proofpoint-GUID: 6yDc2-aSc0kvAVtelESxrd6y52lBPomq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-14_04,2022-04-14_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 malwarescore=0 spamscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 mlxscore=0 phishscore=0 clxscore=1011
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204140085
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Apr 2022 16:03:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96653

Syzkaller is a coverage-guided fuzzer that is widely used to find bugs in
the Linux kernel:
https://github.com/google/syzkaller

Add the recipe and a selftest for running the fuzzer in a qemux86-64
kvm environment. The following steps can be used to start the test:
"""
cat >> conf/local.conf <<EOF
SYZ_WORKDIR="<path>"
SYZ_FUZZTIME="30"
SYZ_QEMU_VM_COUNT="2"
SYZ_QEMU_MEM="2048"
SYZ_QEMU_CPUS="2"
EOF

oe-selftest -r syzkaller
...
loading corpus...
serving http on http://127.0.0.1:49605
serving rpc on tcp://[::]:46475
booting test machines...
wait for the connection from test machine...
vm-0: crash: KCSAN: data-race in poll_schedule_timeout.constprop.NUM / pollwake
vm-1: crash: KCSAN: data-race in mutex_spin_on_owner
machine check:
syscalls                : 2227/4223
code coverage           : enabled
comparison tracing      : enabled
extra coverage          : enabled
delay kcov mmap         : mmap returned an invalid pointer
setuid sandbox          : enabled
namespace sandbox       : enabled
Android sandbox         : /sys/fs/selinux/policy does not exist
fault injection         : enabled
leak checking           : enabled
net packet injection    : enabled
net device setup        : enabled
concurrency sanitizer   : enabled
devlink PCI setup       : PCI device 0000:00:10.0 is not available
USB emulation           : enabled
hci packet injection    : enabled
wifi device emulation   : enabled
802.15.4 emulation      : enabled
corpus                  : 0 (deleted 0 broken)
seeds                   : 0/0
VMs 2, executed 1, cover 0, signal 0/0, crashes 2, repro 0
vm-1: crash: KCSAN: data-race in mutex_spin_on_owner
"""

This will fuzz the yocto kernel for 30 minutes using 2 qemu VMs, each VM
getting 2048MB of memory and 2 CPUs.

The path in SYZ_WORKDIR must be an absolute path that is persistent across
oe-selftest runs, so that fuzzing does not start all over again on each
invocation. Syzkaller will save the corpus database in that directory and will
use the database to keep track of the interfaces already fuzzed.

After the test is done, <workdir>/crashes directory will contain the report
files for all the bugs found.

Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
---
 meta-oe/lib/oeqa/selftest/cases/syzkaller.py  | 123 ++++++++++++++++++
 ...ets.go-allow-users-to-override-hardc.patch |  67 ++++++++++
 .../recipes-test/syzkaller/syzkaller_git.bb   |  85 ++++++++++++
 3 files changed, 275 insertions(+)
 create mode 100644 meta-oe/lib/oeqa/selftest/cases/syzkaller.py
 create mode 100644 meta-oe/recipes-test/syzkaller/syzkaller/0001-sys-targets-targets.go-allow-users-to-override-hardc.patch
 create mode 100644 meta-oe/recipes-test/syzkaller/syzkaller_git.bb

diff --git a/meta-oe/lib/oeqa/selftest/cases/syzkaller.py b/meta-oe/lib/oeqa/selftest/cases/syzkaller.py
new file mode 100644
index 000000000..c11cadddb
--- /dev/null
+++ b/meta-oe/lib/oeqa/selftest/cases/syzkaller.py
@@ -0,0 +1,123 @@
+#
+# SPDX-License-Identifier: MIT
+#
+
+from oeqa.selftest.case import OESelftestTestCase
+from oeqa.utils.commands import runCmd, bitbake, get_bb_var, get_bb_vars
+from oeqa.utils.network import get_free_port
+
+class TestSyzkaller(OESelftestTestCase):
+    def setUpSyzkallerConfig(self, os_arch, qemu_postfix):
+        syz_target_sysroot = get_bb_var('PKGD', 'syzkaller')
+        syz_target = os.path.join(syz_target_sysroot, 'usr')
+
+        qemu_native_bin = os.path.join(self.syz_native_sysroot, 'usr/bin/qemu-system-' + qemu_postfix)
+        kernel_cmdline = "ip=dhcp rootfs=/dev/sda dummy_hcd.num=%s" % (self.dummy_hcd_num)
+        kernel_objdir = self.deploy_dir_image
+        port = get_free_port()
+
+        if not os.path.exists(self.syz_workdir):
+            os.mkdir(self.syz_workdir)
+
+        with open(self.syz_cfg, 'w') as f:
+            f.write(
+"""
+{
+	"target": "%s",
+	"http": "127.0.0.1:%s",
+	"workdir": "%s",
+	"kernel_obj": "%s",
+	"kernel_src": "%s",
+	"image": "%s",
+	"syzkaller": "%s",
+	"type": "qemu",
+	"reproduce" : false,
+	"sandbox": "none",
+	"vm": {
+		"count": %s,
+		"kernel": "%s",
+		"cmdline": "%s",
+		"cpu": %s,
+		"mem": %s,
+		"qemu": "%s",
+		"qemu_args": "-device virtio-scsi-pci,id=scsi -device scsi-hd,drive=rootfs -enable-kvm -cpu host,migratable=off",
+		"image_device": "drive index=0,id=rootfs,if=none,media=disk,file="
+	}
+}
+"""
+% (os_arch, port, self.syz_workdir, kernel_objdir, self.kernel_src,
+   self.rootfs, syz_target, self.syz_qemu_vms, self.kernel, kernel_cmdline,
+   self.syz_qemu_cpus, self.syz_qemu_mem, qemu_native_bin))
+
+    def test_syzkallerFuzzingQemux86_64(self):
+        self.image = 'core-image-minimal'
+        self.machine = 'qemux86-64'
+        self.fstype = "ext4"
+
+        self.write_config(
+"""
+MACHINE = "%s"
+IMAGE_FSTYPES = "%s"
+KERNEL_IMAGETYPES += "vmlinux"
+EXTRA_IMAGE_FEATURES += " ssh-server-openssh"
+IMAGE_ROOTFS_EXTRA_SPACE = "512000"
+KERNEL_EXTRA_FEATURES += " \
+    cfg/debug/syzkaller/debug-syzkaller.scc \
+"
+"""
+% (self.machine, self.fstype))
+
+        build_vars = ['TOPDIR', 'DEPLOY_DIR_IMAGE', 'STAGING_KERNEL_DIR']
+        syz_fuzz_vars = ['SYZ_WORKDIR', 'SYZ_FUZZTIME', 'SYZ_QEMU_MEM', 'SYZ_QEMU_CPUS', 'SYZ_QEMU_VM_COUNT']
+        syz_aux_vars = ['SYZ_DUMMY_HCD_NUM']
+
+        needed_vars = build_vars + syz_fuzz_vars + syz_aux_vars
+        bb_vars = get_bb_vars(needed_vars)
+
+        for var in syz_fuzz_vars:
+                if not bb_vars[var]:
+                    self.skipTest(
+"""
+%s variable not set.
+Please configure %s fuzzing parameters to run this test.
+
+Example local.conf config:
+SYZ_WORKDIR="<path>"  # syzkaller workdir location (must be persistent across os-selftest runs)
+SYZ_FUZZTIME="30"     # fuzzing time in minutes
+SYZ_QEMU_VM_COUNT="1" # number of qemu VMs to be used for fuzzing
+SYZ_QEMU_MEM="2048"'  # memory used by each qemu VM
+SYZ_QEMU_CPUS="2"'    # number of cpus used by each qemu VM
+"""
+% (var, ', '.join(syz_fuzz_vars)))
+
+        self.topdir = bb_vars['TOPDIR']
+        self.deploy_dir_image = bb_vars['DEPLOY_DIR_IMAGE']
+        self.kernel_src = bb_vars['STAGING_KERNEL_DIR']
+
+        """
+        SYZ_WORKDIR must be set to an absolute path where syzkaller will store
+        the corpus database, config, runtime and crash data generated during
+        fuzzing. It must be persistent between oe-selftest runs, so the fuzzer
+        does not start over again on each run.
+        """
+        self.syz_workdir = bb_vars['SYZ_WORKDIR']
+        self.syz_fuzztime = int(bb_vars['SYZ_FUZZTIME']) * 60
+        self.syz_qemu_mem = int(bb_vars['SYZ_QEMU_MEM'])
+        self.syz_qemu_cpus = int(bb_vars['SYZ_QEMU_CPUS'])
+        self.syz_qemu_vms = int(bb_vars['SYZ_QEMU_VM_COUNT'])
+        self.dummy_hcd_num = int(bb_vars['SYZ_DUMMY_HCD_NUM'] or 8)
+
+        self.syz_cfg = os.path.join(self.syz_workdir, 'syzkaller.cfg')
+        self.kernel = os.path.join(self.deploy_dir_image, 'bzImage')
+        self.rootfs = os.path.join(self.deploy_dir_image, '%s-%s.%s' % (self.image, self.machine, self.fstype))
+
+        self.syz_native_sysroot = get_bb_var('RECIPE_SYSROOT_NATIVE', 'syzkaller-native')
+
+        self.setUpSyzkallerConfig("linux/amd64", "x86_64")
+
+        bitbake(self.image)
+        bitbake('syzkaller')
+        bitbake('syzkaller-native -c addto_recipe_sysroot')
+
+        cmd = "syz-manager -config %s" % self.syz_cfg
+        runCmd(cmd, native_sysroot = self.syz_native_sysroot, timeout=self.syz_fuzztime, output_log=self.logger, ignore_status=True, shell=True)
diff --git a/meta-oe/recipes-test/syzkaller/syzkaller/0001-sys-targets-targets.go-allow-users-to-override-hardc.patch b/meta-oe/recipes-test/syzkaller/syzkaller/0001-sys-targets-targets.go-allow-users-to-override-hardc.patch
new file mode 100644
index 000000000..d647b8d4a
--- /dev/null
+++ b/meta-oe/recipes-test/syzkaller/syzkaller/0001-sys-targets-targets.go-allow-users-to-override-hardc.patch
@@ -0,0 +1,67 @@
+From aca1030d29f627314d13884ebc7b2c313d718df7 Mon Sep 17 00:00:00 2001
+From: Ovidiu Panait <ovidiu.panait@windriver.com>
+Date: Wed, 13 Apr 2022 17:17:54 +0300
+Subject: [PATCH] sys/targets/targets.go: allow users to override hardcoded
+ cross-compilers
+
+Currently, cross compiler names are hardcoded for each os/arch combo. However,
+toolchain tuples differ, especially when using vendor provided toolchains.
+Allow users to specify the cross compiler for an os/arch combo using
+SYZ_CC_<os>_<arch> environment variables.
+
+Also, remove hardcoded "-march=armv6" flag to fix compilation on arm.
+
+Upstream-Status: Inappropriate [embedded specific]
+
+Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
+---
+ sys/targets/targets.go | 19 +++++++++++--------
+ 1 file changed, 11 insertions(+), 8 deletions(-)
+
+diff --git a/sys/targets/targets.go b/sys/targets/targets.go
+index f3be708f3..19a8bb681 100644
+--- a/sys/targets/targets.go
++++ b/sys/targets/targets.go
+@@ -258,7 +258,6 @@ var List = map[string]map[string]*Target{
+ 			PtrSize:          4,
+ 			PageSize:         4 << 10,
+ 			LittleEndian:     true,
+-			CFlags:           []string{"-D__LINUX_ARM_ARCH__=6", "-march=armv6"},
+ 			Triple:           "arm-linux-gnueabi",
+ 			KernelArch:       "arm",
+ 			KernelHeaderArch: "arm",
+@@ -670,12 +669,16 @@ func initTarget(target *Target, OS, arch string) {
+ 	for i := range target.CFlags {
+ 		target.replaceSourceDir(&target.CFlags[i], sourceDir)
+ 	}
+-	if OS == Linux && arch == runtime.GOARCH {
+-		// Don't use cross-compiler for native compilation, there are cases when this does not work:
+-		// https://github.com/google/syzkaller/pull/619
+-		// https://github.com/google/syzkaller/issues/387
+-		// https://github.com/google/syzkaller/commit/06db3cec94c54e1cf720cdd5db72761514569d56
+-		target.Triple = ""
++	if OS == Linux {
++		if cc := os.Getenv("SYZ_CC_" + OS + "_" + arch); cc != "" {
++			target.CCompiler = cc
++		} else if arch == runtime.GOARCH {
++			// Don't use cross-compiler for native compilation, there are cases when this does not work:
++			// https://github.com/google/syzkaller/pull/619
++			// https://github.com/google/syzkaller/issues/387
++			// https://github.com/google/syzkaller/commit/06db3cec94c54e1cf720cdd5db72761514569d56
++			target.Triple = ""
++		}
+ 	}
+ 	if target.CCompiler == "" {
+ 		target.setCompiler(useClang)
+@@ -803,7 +806,7 @@ func (target *Target) lazyInit() {
+ 	// On CI we want to fail loudly if cross-compilation breaks.
+ 	// Also fail if SOURCEDIR_GOOS is set b/c in that case user probably assumes it will work.
+ 	if (target.OS != runtime.GOOS || !runningOnCI) && os.Getenv("SOURCEDIR_"+strings.ToUpper(target.OS)) == "" {
+-		if _, err := exec.LookPath(target.CCompiler); err != nil {
++		if _, err := exec.LookPath(strings.Fields(target.CCompiler)[0]); err != nil {
+ 			target.BrokenCompiler = fmt.Sprintf("%v is missing (%v)", target.CCompiler, err)
+ 			return
+ 		}
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-test/syzkaller/syzkaller_git.bb b/meta-oe/recipes-test/syzkaller/syzkaller_git.bb
new file mode 100644
index 000000000..240e8f7cd
--- /dev/null
+++ b/meta-oe/recipes-test/syzkaller/syzkaller_git.bb
@@ -0,0 +1,85 @@
+DESCRIPTION = "syzkaller is an unsupervised coverage-guided kernel fuzzer"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://src/${GO_IMPORT}/LICENSE;md5=5335066555b14d832335aa4660d6c376"
+
+inherit go-mod
+
+GO_IMPORT = "github.com/google/syzkaller"
+
+SRC_URI = "git://${GO_IMPORT};protocol=https;destsuffix=${BPN}-${PV}/src/${GO_IMPORT};branch=master \
+           file://0001-sys-targets-targets.go-allow-users-to-override-hardc.patch;patchdir=src/${GO_IMPORT} \
+           "
+SRCREV = "af01ee7dda3c1b644f43230ae466b6dc7ceb97c3"
+
+COMPATIBLE_HOST = "(x86_64|i.86|arm|aarch64).*-linux"
+
+B = "${S}/src/${GO_IMPORT}/bin"
+
+GO_EXTRA_LDFLAGS += ' -X ${GO_IMPORT}/prog.GitRevision=${SRCREV}'
+
+export GOHOSTFLAGS="${GO_LINKSHARED} ${GOBUILDFLAGS}"
+export GOTARGETFLAGS="${GO_LINKSHARED} ${GOBUILDFLAGS}"
+export TARGETOS = '${GOOS}'
+export TARGETARCH = '${GOARCH}'
+export TARGETVMARCH = '${GOARCH}'
+
+CGO_ENABLED = "0"
+
+DEPENDS:class-native += "qemu-system-native"
+
+do_compile:class-native() {
+    export HOSTOS="${GOHOSTOS}"
+    export HOSTARCH="${GOHOSTARCH}"
+
+    oe_runmake host
+}
+
+do_compile:class-target() {
+    export HOSTOS="${GOOS}"
+    export HOSTARCH="${GOARCH}"
+    export SYZ_CC_${TARGETOS}_${TARGETARCH}="${CC}"
+
+    # Unset GOOS and GOARCH so that the correct syz-sysgen binary can be
+    # generated. Fixes:
+    # go install: cannot install cross-compiled binaries when GOBIN is set
+    unset GOOS
+    unset GOARCH
+
+    oe_runmake CC="${CC}" CFLAGS="${CFLAGS} ${LDFLAGS}" REV=${SRCREV} target
+}
+
+do_install:class-native() {
+    SYZ_BINS_NATIVE="\
+        syz-manager \
+        syz-runtest \
+        syz-repro \
+        syz-mutate \
+        syz-prog2c \
+        syz-db \
+        syz-upgrade \
+    "
+
+    install -d ${D}${bindir}
+
+    for i in ${SYZ_BINS_NATIVE}; do
+        install -m 0755 ${B}/${i} ${D}${bindir}
+    done
+}
+
+do_install:class-target() {
+    SYZ_TARGET_DIR="${TARGETOS}_${TARGETARCH}"
+    SYZ_BINS_TARGET=" \
+        syz-fuzzer \
+        syz-execprog \
+        syz-stress \
+        syz-executor \
+    "
+
+    install -d ${D}${bindir}/${SYZ_TARGET_DIR}
+
+    for i in ${SYZ_BINS_TARGET}; do
+        install -m 0755 ${B}/${SYZ_TARGET_DIR}/${i} ${D}${bindir}/${SYZ_TARGET_DIR}
+    done
+}
+
+BBCLASSEXTEND += "native"
-- 
2.25.1


