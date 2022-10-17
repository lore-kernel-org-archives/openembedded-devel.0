Return-Path: <ovidiu.panait@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB642C433FE
	for <webhook@archiver.kernel.org>; Mon, 17 Oct 2022 17:02:15 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web09.112.1666026132529189622
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Oct 2022 10:02:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=Fqqy1wBu;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=72898ca2c0=ovidiu.panait@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.5) with ESMTP id 29HGvuIp031736
	for <openembedded-devel@lists.openembedded.org>; Mon, 17 Oct 2022 17:02:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=vEqo2v0XQ3cy+V3fOurahbtQBsLWyjfKHvqJeI+mINM=;
 b=Fqqy1wBugCj15u9nVpz60F70cOHfdxZWiwLqaGEL+d81LxPXClX6eiL1FGwkWn5W6ngV
 xHxp/brGAwdE+wmmERgyGhOw0VlXSvo18tKAW8Coj4trb7VvmW5QL9/5cYF5xlqs0CFp
 3V3eth6p9LtAVG2XEV8dSCLT9vHbYo6CRh/e4QQD6u9YCfkXmoRojvrNvHfg3bvCLL7+
 7xPay6mvyztRo2w0lWvKuOx2hVCo8ytbIQJdaxYqaYOeP0qP3IEeoGBW/xi0/5wFsnkS
 Mo4jf7y258EyvkFbaDOhcM1NZw9LJQykEtt1A2m/GqIVnAuaZDtvTqMYr5AwtPI0iIuJ 0g== 
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2174.outbound.protection.outlook.com [104.47.59.174])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3k7j321u01-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 17 Oct 2022 17:02:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hokNXe8T19gkZgGqtyG9T4liFKF8zGcros/oAKx45Atsp1nXIo6SkDKkGglWBXSqj74dbf/qGNXXlWl36uhy0+eGkehvCOJy1+OV1QAsPrs3eOx2BTKTC+pshC+hOwIHDPstPSKfJbyXSHAumnOrSGq/pjDIamdSYAzHg2RbR2ASgrDBUIVibi9zqTexxHPJjecTSjnNeOoiwBEjFB5AAhj4cqkZ/RlP0yOPWgQkBSPvxssRwAVeDDDFjyaiMCjfdeLAA7jA9I3nPLRfkfW32aOa/AGfQ+wTvWpm18GIEdxOznHxU4nbiumKN9xqywjABBs5vZAb/VU+MqgPG2SzwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vEqo2v0XQ3cy+V3fOurahbtQBsLWyjfKHvqJeI+mINM=;
 b=H9Aj2jSgVatXgZ9ezRGZJrPcimMuK+LEGKJvr0zzBWd3ElORojRaaoEOXn3uqfWcP8bUccFb47blyV6M+gGOzzLYQYFf107BVEF7e+4tuykFDHe/jhVYH5V7v2sBaWAdMtfIu2HhtJjMUoTKuRbUqJzUuzrKgyEC7yqjKRV4w03mnGHJNKePKU9uINkkGCzKvTHuhfBZD8MoxDZea90QsVLv53x3RFdfr0GSasCZWTgVzCHw3KttEvQppDJkRjlcdracAj2NYNmVV+HfCqvJ8GQy2wSGeBX4GeiDltpPyEAkVeCEz4IQU0JigsZ/PADUXvySauMzBezgG5tpNBQx+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5327.namprd11.prod.outlook.com (2603:10b6:5:392::22)
 by MW5PR11MB5859.namprd11.prod.outlook.com (2603:10b6:303:19e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.29; Mon, 17 Oct
 2022 17:02:04 +0000
Received: from DM4PR11MB5327.namprd11.prod.outlook.com
 ([fe80::9df7:43d1:af9d:4d3f]) by DM4PR11MB5327.namprd11.prod.outlook.com
 ([fe80::9df7:43d1:af9d:4d3f%7]) with mapi id 15.20.5723.033; Mon, 17 Oct 2022
 17:02:04 +0000
From: Ovidiu Panait <ovidiu.panait@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH v2] syzkaller: add recipe and selftest for syzkaller fuzzing
Date: Mon, 17 Oct 2022 20:00:57 +0300
Message-Id: <20221017170057.1694699-1-ovidiu.panait@windriver.com>
X-Mailer: git-send-email 2.37.3
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR0501CA0013.eurprd05.prod.outlook.com
 (2603:10a6:800:92::23) To DM4PR11MB5327.namprd11.prod.outlook.com
 (2603:10b6:5:392::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5327:EE_|MW5PR11MB5859:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b64ec67-3950-45c2-dfcb-08dab06150c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	RYmYmvXG4iwWHznsC63t6Pgg+7EgP8sJbdRfeQ6EfvBX0wZcC667gZtoZWy71lA9+bq3aQrnTY2hqBhJY9xJqAwSEbSKT6ec5T2XKpNuYhEIg0Rdvq/37mccVXqKdhDrKKejz7u9bmAiFWpAd7gHvkG75gs0V3y66oLp+umWvUTbZLjaEwWF36+POoEb8OLChYPNm5EGHGiMfg/BLNphpYC9TUB26otaadCLbrZeZxOZWa1wa0Ofwsn3LiVWTZXkVKXpPfFs63c/EukBbBbHo/mq/rWowMAhKHvZ7v/sw9cToyIet62X9bygmutuNHNiqeAtcoGRSW7BNmadzacrsP8ZmMAsEXMIxQSd7rgvlHXW1JHU84D4VLbJKnDIOJAFFBM+YyJMdFrTUD1uUbZDz1jkwLkrWB6xLEsaUvX2vvkqMnOghRJVei82KzEF3byHHLRZNPZukwGyWuwFBmngmDIMrXennNlnuqvEFM53Ej5FPxCBBiGzqnYE0u7b1UJ4S7YoVSz51SxKpu5r0bp4hzvuVOgCSDq4E8baG+khhOIgF38Fx93T6LQHdNOd8b9VhKGZJUHFjxem7ZvFqfwOFgPGXhtTrmPGBgB7PvjgR/2OWR0M0+qBgLhVndAI6vBCCkmumkfpFt+jURkUv8VEqty4QlMiDYT3vs67sLLu8FYYvvIV9aAbICZVH6936gJ8P+pLoL1dWeUiOrPF8pXsvRuM+Z9OmQAZ21n7kxFVJJPF+VddgqVJrE9nABR6ouv+uugEVljCmSbwfkp5mp7daBY9/dGQOawpC3eRFQxdk8R631Xv0THypqdATynPG0eU8SI8oJ4CHgkTaLuSqYsqwXgzzltifDOdCoWajjL776k=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5327.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(6019001)(4636009)(396003)(346002)(366004)(376002)(136003)(39850400004)(279900001)(451199015)(36756003)(66476007)(66556008)(6916009)(5660300002)(30864003)(316002)(66946007)(8676002)(38100700002)(38350700002)(86362001)(966005)(6486002)(6666004)(478600001)(26005)(6512007)(52116002)(6506007)(8936002)(2906002)(44832011)(41300700001)(186003)(1076003)(83380400001)(2616005)(344275003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ml2YPw0Q+YrVpxoWqYjGN0sxx58qyASNPejetmo/Y82CnASLeTajLjgCVthR?=
 =?us-ascii?Q?NAyoj8d2vhowLt3zYacFIE61jXlmsKg0Xp5Q8Qu/KsOsgCkpfU71JzG2EAiM?=
 =?us-ascii?Q?t3tfsCHMhNgOwMXaDirLU2/7jkQWdndnOKrnqxdbjcDw+EYTpuh84FkEjrk7?=
 =?us-ascii?Q?PDRZaJ8x9iJXuNIjY0Mz9iL7yqrnFswbp5X5HVk8s1JXtksnZx53rVRXoFJI?=
 =?us-ascii?Q?ypPqodxA1N+3TKDuVp0N91zKQKDPfNuYqPJl/buccbQjS3cqpjqwUQVSSS4X?=
 =?us-ascii?Q?zm6y76+RI0cyugK2mektwgijDxGUVHsyNMgSIbnS0J/HQo2m5NXaz0yob2LA?=
 =?us-ascii?Q?H/hv78R8dH8wPqNRV/iEyYtbu5IxNzcDOEFtOzbN9wucd/WxwiARPhAf+6u4?=
 =?us-ascii?Q?Ja4zN6DWh290CFmA8BV3E1iBP6Pn06pmYeFsByPIT01hrTRgTlcMJq0fYCOn?=
 =?us-ascii?Q?x278xrdph3p6RLCtLF2LjyN/B0c1QoQ/1HUUYgVx0NTZtDDxXBDYN41Aq1yG?=
 =?us-ascii?Q?88eJnZsPi/UXfxnUkehNTH9vVQm+Czw2JintYRnhm7J+PeLCo0mN8+sdGf9l?=
 =?us-ascii?Q?BN/snWEZRSaIAAxWF0OPVuB5H4pukfBkiUQKFimM0DhlxdSngMM1wdWp5/T8?=
 =?us-ascii?Q?LstOKY24naYzbyB1+Ww7QkkLwIM5Ud7QXy4HaKsG8x5pM6AU8CK+nF9Hfhl7?=
 =?us-ascii?Q?rgTNyOAwuTkr3OBEPhicRVOMzxVWKmEg1dlrVDHz3b5kj59DgyCKuGekXUlt?=
 =?us-ascii?Q?Bh4+HgWe++n4aD9ZncJ1IUP/1vtoSv1TIQtT2o2+wn35mpYdyEH5ncJMmQYn?=
 =?us-ascii?Q?35l93ZDsWC9xxRtBkz8Yi9YWLU9aIkIlq490xjLw3tO4wEXUPbpig/Sv1N0H?=
 =?us-ascii?Q?ZdHTP3nWLRQ9jlIquCbRlLd7Xwqx/XhOehe0GjOaYMIpqFQDJm95/3psWNKW?=
 =?us-ascii?Q?7f9UKTLAalTlp/+aTLh+PJ3wUXOa98DN5apZ8ASHBjUi5ZDtp8P9TD8+FgsK?=
 =?us-ascii?Q?BsTaPvc/ZA4lNi6jfnR38N/1ufNUXMVBtdLzqjM9EJCYw75n0Jyagjskmh12?=
 =?us-ascii?Q?MxZAqt98pi+kNkXSXQi8QTF80tmGOU2lJYY5Y0+qG8ZFd2Y0BURhFEPUgurh?=
 =?us-ascii?Q?c7Xp2fN5LAj46lmKyxQ+u1+2s2Qo7WJ1ea4Ok9UPyQO1g7tDfk/V2CitnekO?=
 =?us-ascii?Q?6HJWX5TGLi2cvXFAwq7kzEqfiI5DIwRFQU8PifbN6s9iYfkG7TFRdwnFL/tY?=
 =?us-ascii?Q?qClhgHJVe7QuwDxqcwb0zDJDTEJ9MuOHAZ96si88Ym5Pn5EaFJ+odx+qkvuI?=
 =?us-ascii?Q?8eb4Q8TU7/8aSc1eMHuTBdinf1xNfDP64qH4CdHk/BxK67yRyxOv66L9X7lg?=
 =?us-ascii?Q?dHLUckNHuOrp86r59QPylPWDqqEOYSvkq7wETmrVS1zFmSPqy2/H13UPsQnO?=
 =?us-ascii?Q?NPh6vTJegIEqEksHtLBE8OrkilYreSmKTE3kh0hGdABJWn3IzARlg1hVEK1m?=
 =?us-ascii?Q?R6xX6XKPo8iSdD9yLEd5MiF/Sg6DUSBeB0xUtzsg+xCGsb2OVw8CULmeGAZ+?=
 =?us-ascii?Q?LeQPPzUvnPvm0oJgBGVihp6edxV7Z0eJTt/dxEmePJVDl02Q0EwxvxU8Y0F9?=
 =?us-ascii?Q?mg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b64ec67-3950-45c2-dfcb-08dab06150c2
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5327.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2022 17:02:04.2735
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DvwFznWfJ/RDkByQbD3PiSS1gVPUS1WKZLOobr/gVPLkEoVPAdEeJ/p39qxMynRm6vscS87qEVtf5sWHUzcieLNwGjGFeCdAcXHJeLChgdw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5859
X-Proofpoint-GUID: tQVeC8mIXgMaT1hDWUnG4M9_knsJaka0
X-Proofpoint-ORIG-GUID: tQVeC8mIXgMaT1hDWUnG4M9_knsJaka0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-17_13,2022-10-17_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 clxscore=1015 impostorscore=0 mlxlogscore=999 suspectscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210170099
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 17 Oct 2022 17:02:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99201

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
 meta-oe/lib/oeqa/selftest/cases/syzkaller.py  | 124 ++++++++++++++++++
 ...ets.go-allow-users-to-override-hardc.patch |  67 ++++++++++
 .../recipes-test/syzkaller/syzkaller_git.bb   |  85 ++++++++++++
 3 files changed, 276 insertions(+)
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
index 000000000..ffa472426
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
+    oe_runmake GO="${GO}" CC="${CC}" CFLAGS="${CFLAGS} ${LDFLAGS}" REV=${SRCREV} target
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
2.37.3


