Return-Path: <ovidiu.panait@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A588C433FE
	for <webhook@archiver.kernel.org>; Fri, 21 Oct 2022 10:26:07 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web09.8449.1666347965054492860
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 Oct 2022 03:26:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=NhLoPr7G;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7293bbc95f=ovidiu.panait@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 29L7wc5M017052
	for <openembedded-devel@lists.openembedded.org>; Fri, 21 Oct 2022 10:26:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=YQDPBMpURemDPKQuwK4ERC1lKwDiTTbSSCP2FQfWB+o=;
 b=NhLoPr7GL0kxY0piFc2z6Hf4H/VXWGIPhH+Suk+r7iBdOOyPrzdWsSjeRjV/TmrmE+Uc
 ANsoghFP/CBFQgEcQsa772JUb5Y28+5f4rem5Q0nZFDbfxcIPbCGXHuH3NGjQkdH+HVQ
 4VQJ54brp54pvppYENVIsr7vO2Soy7BFbRxqb0lvttrsD0BNLnpW04qyLoZ2YZ7wSzlF
 objwBGsOXcDijygF0XKi57mwbDGAoy7zUzXhzF6v0PEBGa72wNOraIGS0qowQkRUtgPj
 oAli2xjTU35iFKiHWH9X3FmD7juHcuZex/vZ05sORXpXvyDYvBZ+01k/U3REQzY5Gj/z eg== 
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2174.outbound.protection.outlook.com [104.47.59.174])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kavussbkk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 21 Oct 2022 10:26:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ii91W9GELyncS/XaWZBwF5hhaqzrcpP+HyAzDEysbb38Xkip9q+AjR+H9fgU96xXbBrVNKNnrrpx096/fzTRMmUZsv+SLryDr1bKVCWpv4fM5AhAclC1CUQAA126BoN3RKrR5lthXXsSoptGTXrue+jibjBsk4KUGm+c9EEieNnPFHUkuHNVKrXFT4m1NyFUiy7cndlymEqNJ7ZrGTu35eiAit73jl9u7ZHDnogONRQ1Rvv1QMn0RZB8PWjbfcdCVAU51asKPuiz1+O99Iuq81FxOpO5sZ2jnnvkXYxz1KAKT7FuN5PntAUagwf1fFPcdV6/G6yUhWqhyC/hOkHn9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YQDPBMpURemDPKQuwK4ERC1lKwDiTTbSSCP2FQfWB+o=;
 b=Y19B3+s+bQmwo23sskhiZnd3k47TqOnjgQRRYOVfAw0O7XBBjyLnn1k6TaLmvmhx8nK0G9PFZsTrr6C264DfoXaFpIVvzfSwjx7EXY3kw2cj1JtbXez5k0SIs5g7+8veARzaEf9sTP78TyTtLnuJl4eaeTzZO3CkC1nF0RMxGLdDDVE/zYsojXEnhOF3gCZRDwIN4T+81DGSmUpb2gtya1ROubGBf72mMcmLQtoa+f5zYtbr++1Ts5EWEqPmYKWZQd7kcANqS5wz7cPmxA1O1tsHk58jLP45KJqsjiTH0Alw60yJh9RaFJeOYeU1P7CmTcAPvNnTkS15jAuC7mMzdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5327.namprd11.prod.outlook.com (2603:10b6:5:392::22)
 by DM4PR11MB6189.namprd11.prod.outlook.com (2603:10b6:8:ae::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.21; Fri, 21 Oct
 2022 10:26:00 +0000
Received: from DM4PR11MB5327.namprd11.prod.outlook.com
 ([fe80::a8e1:fa27:6954:d5cc]) by DM4PR11MB5327.namprd11.prod.outlook.com
 ([fe80::a8e1:fa27:6954:d5cc%7]) with mapi id 15.20.5746.021; Fri, 21 Oct 2022
 10:26:00 +0000
From: Ovidiu Panait <ovidiu.panait@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH v3] syzkaller: add recipe and selftest for syzkaller fuzzing
Date: Fri, 21 Oct 2022 13:25:36 +0300
Message-Id: <20221021102536.3266758-1-ovidiu.panait@windriver.com>
X-Mailer: git-send-email 2.38.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BE0P281CA0036.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:14::23) To DM4PR11MB5327.namprd11.prod.outlook.com
 (2603:10b6:5:392::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5327:EE_|DM4PR11MB6189:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c7b3a84-ee09-4d21-ad13-08dab34ea657
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	KFJpF6SQ+DR/zKe7YrlsdmD++KeTbXZJoIfkDwezrwVRnjoWQjLzCCSK03xMl4kyXCzvvQtkyOUoQt5zbrSHiVs0tKtuD4jq3b+bZjAYC9WvJOtdxK1uzC62RAO3cz/vCJvUPQnjNV1M+SkI/2OL8Oa2Dt9LfIa0W4PKg43fANETj8/gzLmtFA/97WFIUoCUsbI4RwYKnZua9zOzCzbyKVZ+Ro1y8ylcoIaXZGVQCRyp5zJqz0fyBtpKmYHG0XA2bsEvQBGgQqL85SG1T3N8NyXrFyYI8weu1dRqUXQIpuStxcoz6STu6rGdlhj/iQ5OnOBP377LP2hmGxtVZNxWVCMq36EI+3Ufgj5RC+Egy1pdIcWBZBBcwOmza52w064BaYf/dCWCc3U0BwD3ooo5pdGGYSW/ERXShl86FoX3kM/LWHk397EWTSNEQ8m5HCjRsQc+hOqDUaXUNOylia6GHX+pCmnCYjlD6SPtEdNHFgohxFHsJdZ4qbUQWkYX6qX7/BIBSOEpT5vyVQXZmvZrNjeRAnkax/phyjP5QG98CFLVIyeRd7CoKckurHkr6nNHsOJxvFXFvlEPUrp6jIPa9gRGUy9lFv6DqIAgl/pSKeuXWf2GDP2b3iETgTZZClUUB4XGGcxv4hSuXYJiRUOrsd2C1nG7NtMmPpVacaeDFXK6zxKoJvLBXBda0P/yoio9nMwzk/3e7YyQphhK09DVobfJmEcBhJbGfYjzkset/j12CVbOWkq3dXcjKaSE4+Kg3JHGJrtFlctv4ZZ6INChiPgHRUMHzyzX1xtik6HL3VS34GuV8HG3FsUL50glPwM/HMLasyi3/1V+WYFhWQHLsvrpZh7j8afln/359ghef7c=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5327.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(6019001)(4636009)(376002)(39850400004)(396003)(366004)(346002)(136003)(279900001)(451199015)(36756003)(2906002)(5660300002)(8936002)(44832011)(41300700001)(66476007)(66946007)(66556008)(8676002)(30864003)(6916009)(316002)(26005)(6512007)(83380400001)(6506007)(186003)(1076003)(2616005)(38350700002)(38100700002)(6486002)(86362001)(52116002)(966005)(478600001)(6666004)(344275003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?KO3VSiyKKNA5QkaIWxIToQR9AaFClyudPs+1JAXbP074PwD28GARjJ1e/eGG?=
 =?us-ascii?Q?v8TuUigHh7dGrMtP6+nHr5GhT5PNccKHS6Q9epS9QyyffUMbb4u9w99rb4dD?=
 =?us-ascii?Q?Klfq81VKl92GiSofei+IiA0eAUNOWIfAmJHvbnhNvZPvd/IgOMqYLfERhD4/?=
 =?us-ascii?Q?t2oXcVp3gPMiKMo/TT8XQIKwIDhxis8tRCAqRHoAYf3ruc6/YFLncXS9LuSa?=
 =?us-ascii?Q?9QZ6bIua6Ws8HLQ8zoShOmnWBZ1xovml9DvpvlT0/bLj9A/md3KyEI7onpqY?=
 =?us-ascii?Q?9t2gDmx9vTFox0V5JjxiEST4399FV6FT6NM2LfYbtpcOAydUD9IlLCT64hBo?=
 =?us-ascii?Q?3WVuN3fO+9L6L5vSmfc2FxCCnPFot44HhOvx1l5ihVwFuAnJGTWh6sBPhCHm?=
 =?us-ascii?Q?1unXZapSoFQ8zr6WYUTk22+afOWlTWojfWPM40YrEC5YFqU3gzpqDcg7bgwI?=
 =?us-ascii?Q?WcvP98s4snBgnVtdZM87szNspZ+OWRuRJBYc4U015FUFs1puZm5ocW8FnkTM?=
 =?us-ascii?Q?tWtmlY57wWu1wejdEXmUfT2OFJ9tPMRJsna73CUYWeg941G7M1kP9vKxy2VO?=
 =?us-ascii?Q?cSSBom/UWe2garwSkO41lMDO2CDFhFHXN8wuvRIbp5jZqrcwr4OzdmwRBtyq?=
 =?us-ascii?Q?oGtaVeAFZpuDz1WSKB/3Rg77p+r1COJbUzW15RmRK3Si8riTZRKE//lyWhDW?=
 =?us-ascii?Q?3wQS1iN/JmhACZkhSSfnM0wPmyfp0JEHNV7BbYKCxqUDjyZqP26DTwsUocMd?=
 =?us-ascii?Q?r/ozUMS9FY3WuUnec8XELboxVHCFFSbrEiLuvNUhqF8xzpa8HxuMogneZnGN?=
 =?us-ascii?Q?0PfYsnvYAbZhDSzzIOlwvZU3ACxbFeNfUNw2wSR7DDf4PQJ9/K/TLjsaFyBd?=
 =?us-ascii?Q?tE6fr4uFc0v0215XbtQsz5IUpbhH3ty1J+xCnks4S0naxkT3BswV3JUAb8hv?=
 =?us-ascii?Q?TAGL5HuHlfprGo5v86Xgz+hchtExT2grWmsopQzztZfZpLgx8tfmwQCIUJ96?=
 =?us-ascii?Q?W/jOhXfJIrr6UcJ6e5gcs+5gpDPnC7fyJCPelKnF0iNxzlwQvIuWfJjnKCaE?=
 =?us-ascii?Q?w+5H5K+JeoixWsJyOlZnw7ux02mU+a6ehixvtbqEoXlMbDR1F0oAxDC1HNjX?=
 =?us-ascii?Q?8f6wOWYTyfG0OPLOW+lwkQCkc4j1qBbz7Wjv6QDJ7daVN3FoZClCOVBNr0PI?=
 =?us-ascii?Q?xnnq10gUY5Fx0MimFMCdtGekykBfiNNrypz4GAQjOp3xd236ysLAPqej8+rb?=
 =?us-ascii?Q?C5Sg3qNExOuwbGQL+yg7zBU5RvC48Ig9W2Lcx18lBjy1h1YKjd3hgskfhqrO?=
 =?us-ascii?Q?i2v7BfLHilj3euJAbqgUYYSdF7N0DfpRz22gR2sr/qSWqSDh+2u3CgOVRAbi?=
 =?us-ascii?Q?/XT7Sau74W+FWIFYIwr9/iO3t4Sxd3b7ZBBrJiMG3nb4X1wy09tZRZjbF2rF?=
 =?us-ascii?Q?WKPj5dVICHyRsULDjm+edG7lLK7aVPD4F1QQ4kPsT+0Ka1r59aPYnyDx3yV6?=
 =?us-ascii?Q?j+/hn3hPiVTCCKcwQSzmqQHPOGZAO3r5MpDPx5tnKK9uWkSVvSRLUsJ9Utn7?=
 =?us-ascii?Q?TpMCDMc5InBsxV4BhyafMg2BkXZEgoLUXslU8zTxmKpfuG4xxNkbuD96smk+?=
 =?us-ascii?Q?DA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c7b3a84-ee09-4d21-ad13-08dab34ea657
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5327.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2022 10:26:00.8602
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YwiG6nZqznI8tGfy9SxyOEupdR7B7x3VPePyjwufex6gawYNCSR4z60oB6DSf6Piq07lP9XGnKjJ04uYdJOCqNRI/aqEMJWx4B1YGTZWF8Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6189
X-Proofpoint-GUID: CnzsuzhOyG3X7C_OuvPZU93VpcWIR0G3
X-Proofpoint-ORIG-GUID: CnzsuzhOyG3X7C_OuvPZU93VpcWIR0G3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-21_04,2022-10-21_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 adultscore=0 mlxlogscore=999
 suspectscore=0 spamscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 mlxscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210210060
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 21 Oct 2022 10:26:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99251

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
v3 updates:
- fix build with clang

 meta-oe/lib/oeqa/selftest/cases/syzkaller.py  | 124 ++++++++++++++++++
 ...ets.go-allow-users-to-override-hardc.patch |  67 ++++++++++
 .../recipes-test/syzkaller/syzkaller_git.bb   |  73 +++++++++++
 3 files changed, 264 insertions(+)
 create mode 100644 meta-oe/lib/oeqa/selftest/cases/syzkaller.py
 create mode 100644 meta-oe/recipes-test/syzkaller/syzkaller/0001-sys-targets-targets.go-allow-users-to-override-hardc.patch
 create mode 100644 meta-oe/recipes-test/syzkaller/syzkaller_git.bb

diff --git a/meta-oe/lib/oeqa/selftest/cases/syzkaller.py b/meta-oe/lib/oeqa/selftest/cases/syzkaller.py
new file mode 100644
index 000000000..64fc864bf
--- /dev/null
+++ b/meta-oe/lib/oeqa/selftest/cases/syzkaller.py
@@ -0,0 +1,124 @@
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
+IMAGE_INSTALL:append = " syzkaller"
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
index 000000000..f7c751f80
--- /dev/null
+++ b/meta-oe/recipes-test/syzkaller/syzkaller_git.bb
@@ -0,0 +1,73 @@
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
+SRCREV = "67cb024cd1a3c95e311263a5c95e957f9abfd8ca"
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
+    oe_runmake HOSTGO="${GO}" host
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
+    oe_runmake GO="${GO}" CC="${CXX}" CFLAGS="${CXXFLAGS} ${LDFLAGS}" REV=${SRCREV} target
+}
+
+do_install:class-native() {
+    SYZ_BINS_NATIVE="syz-manager syz-runtest syz-repro syz-mutate syz-prog2c \
+                     syz-db syz-upgrade"
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
+    SYZ_BINS_TARGET="syz-fuzzer syz-execprog syz-stress syz-executor"
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
2.38.1


