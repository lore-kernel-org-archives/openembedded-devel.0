Return-Path: <chi.xu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FEBAC4828D
	for <webhook@archiver.kernel.org>; Fri,  2 Feb 2024 02:01:55 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.13824.1706839312880812491
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 01 Feb 2024 18:01:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=QEfY0RpH;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2762f7525d=chi.xu@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4121fcNR005105
	for <openembedded-devel@lists.openembedded.org>; Fri, 2 Feb 2024 02:01:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=WCg97
	BSogIp+FsX/Na1EYvlRdksiyZdgPVlAy/EaaII=; b=QEfY0RpHEkyyY9tS17X8a
	UlsuXLvO04V9rMyFmiFCcj+u6nP/kzHbd6n6nK6sxwtHfRlpaEkQwogxfhmVqFqn
	sAE9bqwL96/lcgKhU5EpC2S1SLvtwnZWFIh53CR6M3KW9Bb6Yq4si1wC3GLOvkzH
	D6G2+2txYd8Ch8nki1t6HHf0/q6oPyA+IMJYu20hgMApojMWiYo1wdROmGuIQCwc
	V6mMR5jT3tI4Ak6mk41IwbZQrPFQaKxj6RHH40P8sMZMkynhWnSBZ5HocmCh91zb
	oOcl7Dp3TsSMbaP0Ch+QLE893YlRP4vCpuuqHYX2ViW0K8Gy4W6Cef8qy7iG2flP
	A==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3w0pvg00fr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 02 Feb 2024 02:01:51 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 1 Feb 2024 18:01:48 -0800
Received: from pek-lpgtest7503.wrs.com (128.224.153.125) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Thu, 1 Feb 2024 18:01:47 -0800
From: "Xu, Chi" <chi.xu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] Update oe selftest case syzkaller.py
Date: Fri, 2 Feb 2024 10:01:49 +0800
Message-ID: <20240202020149.2950813-1-chi.xu@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: AYeszAaO8mgK5ywvVmjPhzJccN9-Txjc
X-Proofpoint-ORIG-GUID: AYeszAaO8mgK5ywvVmjPhzJccN9-Txjc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-01_10,2024-01-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 impostorscore=0 mlxscore=0 malwarescore=0 adultscore=0
 phishscore=0 mlxlogscore=999 suspectscore=0 clxscore=1011
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402020012
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 02 Feb 2024 02:01:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108522

1. Will meet following error when run test again.
[FATAL] bad config syzkaller param: can't find /root/poky/build-st/tmp/work/core2-64-poky-linux/syzkaller/git/package/usr/bin/linux_amd64/syz-fuzzer
This is because oe-selftest will add "SSTATE_DIR" to local.conf,
bitbake will not build syzkaller again, then test case can not
find syz-fuzzer under work dirertory.
Fix this isseu with adding SSTATE_SKIP_CREATION:pn-syzkaller = "1"
to configure file.

2. Image name has been changed from core-image-minimal-qemux86-64.ext4
to core-image-minimal-qemux86-64.rootfs.ext4, so update the defination
of self.rootfs.

Signed-off-by: Xu, Chi <chi.xu@windriver.com>
---
 meta-oe/lib/oeqa/selftest/cases/syzkaller.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/lib/oeqa/selftest/cases/syzkaller.py b/meta-oe/lib/oeqa/selftest/cases/syzkaller.py
index 64fc864bf..2c35ba230 100644
--- a/meta-oe/lib/oeqa/selftest/cases/syzkaller.py
+++ b/meta-oe/lib/oeqa/selftest/cases/syzkaller.py
@@ -65,6 +65,7 @@ KERNEL_EXTRA_FEATURES += " \
     cfg/debug/syzkaller/debug-syzkaller.scc \
 "
 IMAGE_INSTALL:append = " syzkaller"
+SSTATE_SKIP_CREATION:pn-syzkaller = "1"
 """
 % (self.machine, self.fstype))
 
@@ -110,7 +111,7 @@ SYZ_QEMU_CPUS="2"'    # number of cpus used by each qemu VM
 
         self.syz_cfg = os.path.join(self.syz_workdir, 'syzkaller.cfg')
         self.kernel = os.path.join(self.deploy_dir_image, 'bzImage')
-        self.rootfs = os.path.join(self.deploy_dir_image, '%s-%s.%s' % (self.image, self.machine, self.fstype))
+        self.rootfs = os.path.join(self.deploy_dir_image, '%s-%s.rootfs.%s' % (self.image, self.machine, self.fstype))
 
         self.syz_native_sysroot = get_bb_var('RECIPE_SYSROOT_NATIVE', 'syzkaller-native')
 
-- 
2.25.1


