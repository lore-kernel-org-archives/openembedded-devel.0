Return-Path: <rouven.rastetter.ext@karlstorz.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 010D4C55174
	for <webhook@archiver.kernel.org>; Wed,  5 Aug 2026 09:19:18 +0000 (UTC)
Received: from mx07-0040c702.pphosted.com (mx07-0040c702.pphosted.com [205.220.184.135])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36546.1785921546927418395
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 Aug 2026 02:19:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@karlstorz.com header.s=S-DKIM-20210427 header.b=Zx6x8QRB;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: karlstorz.com, ip: 205.220.184.135, mailfrom: prvs=26774a484e=rouven.rastetter.ext@karlstorz.com)
Received: from pps.filterd (m0267679.ppops.net [127.0.0.1])
	by mx07-0040c702.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6758bmfL1443008;
	Wed, 5 Aug 2026 09:19:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=karlstorz.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=S-DKIM-20210427; bh=TY7o2
	DGXBHpEtx806BevG1cYsTXzV03P7mIVBjlaWOg=; b=Zx6x8QRBlFL/h3IbdgLQH
	fvzeebv3dJ+V6vTOc2IKEDEImc+AB/rawkgCJIJ6NeRyGe+uHVTm1CcP9jvoNrcf
	TkOSfV3uMSal3JzLgwN6/zXweyALSZgfjyiSK2iBTKy5wZwtXTEbrP1vl9hz5lGp
	mID/vHGsnb8+ukMf8Vqh0EJNBmxoSzWgeM+igOamPv4nsHkSv1yy0hJk2+Dbuz1o
	cCzjKyUeQOllizdItUZrjNCAUASIFNFqZvoKcaVpHqRtVd2EzJmMwRbZq50FbEUm
	yQurddEm2O2MbFxNakgnazbiVb9UImpNtzL5m/sjwdGagp6CPmTs4YLAxhrIEooy
	g==
Received: from tut-ex01-pv.kstg.corp ([62.134.76.232])
	by mx07-0040c702.pphosted.com (PPS) with ESMTPS id 4fu3v1y8nc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Aug 2026 09:19:04 +0000 (GMT)
Received: from TUT-EX02-PV.KSTG.corp (10.0.10.191) by TUT-EX01-PV.KSTG.corp
 (10.0.10.190) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 5 Aug
 2026 11:19:03 +0200
Received: from tutn-jjhfqf4.kstg.corp (10.0.10.41) by
 InternalSMTPRelay.KSTG.corp (10.0.10.191) with Microsoft SMTP Server id
 15.2.2562.45 via Frontend Transport; Wed, 5 Aug 2026 11:19:03 +0200
From: Rouven Rastetter <rouven.rastetter.ext@karlstorz.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Rouven Rastetter <rouven.rastetter.ext@karlstorz.com>,
        Khem Raj
	<raj.khem@gmail.com>
Subject: [meta-oe][wrynose][PATCH] vboxguestdrivers: Provide target kernel version
Date: Wed, 5 Aug 2026 11:18:41 +0200
Message-ID: <20260805091841.16237-1-rouven.rastetter.ext@karlstorz.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDA3MyBTYWx0ZWRfXwwojL4CU7kL3
 UP9uvQdETXWDlqRWPwNX8CU0dGSFPuy8Mt2O0GokykSdGQN062GWInQZsjX8sE5wuOzdIyIwMxx
 4kh3fo3ew9Q9PLkh71b7OdShpwo1/nBimyOBgZyWf4J/8toaEQC2/61S/d6xRjT2kdD93piLacZ
 tdg9UhngTtn5aumT6+WkJNg3EpEuw5D44fPyt+PPCLdhuZZoVQ/umGOYAI9mQk9AhBxVuTeFWXL
 Hwvm8tNbCrb4kpc21RyTw4FoPfiVhUbJX58QIkThNMXkICFzLtlwMuEMALqGQFSin0ituWUwNoK
 +6p82J5sXR6octzLXPfq1mRBvMdReQ5NFcAY9neX3PZDZS2dvHL0A5rugDIVhuz5h1PpGYBT7aR
 JYP6JjMy+okr91d9D/CdVFa3tmdpOU5GXM3OPTa9B6jkY4ij7qwNChwM9hMT7Tj268YXH8zMLFW
 7zuqLWV7Bgra1HrdtVQ==
X-Proofpoint-ORIG-GUID: XSTLH6jTycQqjuw7Emn44SOFnK3SjyPR
X-Proofpoint-GUID: XSTLH6jTycQqjuw7Emn44SOFnK3SjyPR
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDA3MyBTYWx0ZWRfX5W1IW+t9oXIq
 sv0WJ2tn7wee2PYdDHRN9lZ5+QrR1cUMVdTb0p2sGJM5yoemCar4b5UadOm89lnk6PcblS3ukWo
 zdZMVnY27kNtFNdNn15RMmtACYbWINC9x2jXetwQH1oszkkZxGRs
X-Authority-Analysis: v=2.4 cv=bKwm5v+Z c=1 sm=1 tr=0 ts=6a730008 cx=c_pps
 a=OToaj9FDvIz41JSycRbD4A==:117 a=OToaj9FDvIz41JSycRbD4A==:17
 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=DBWTBMGyQNCzyBkTEoZL:22
 a=Mf5tFF2oQ1p1YQ6vkpes:22 a=pGLkceISAAAA:8 a=TJlxxRfH0uqe1ifZU9EA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_03,2026-08-04_02,2025-10-01_01
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 05 Aug 2026 09:19:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128807

The Makefile uses `KERN_MAJ = $(shell uname -r | cut -d . -f1)` to
determine if the kernel version is <7, which enables building vboxvideo.

Therefore, with a host kernel >=7 and a target kernel <7, vboxvideo is
not built and we get this error in vboxsf:

```
| In file included from ../vboxsf/include/iprt/stdarg.h:59,
|                  from ../vboxsf/include/iprt/types.h:44,
|                  from ../vboxsf/include/iprt/string.h:43,
|                  from mount.vboxsf.c:62:
| ../vboxsf/include/linux/stdarg.h:6:9: warning: 'va_start' redefined
|     6 | #define va_start(v, l)  __builtin_va_start(v, l)
|       |         ^~~~~~~~
| In file included from mount.vboxsf.c:44:
|
/work/oe-upstream/bitbake-builds/poky-master/build/tmp/work/qemux86_64-poky-linux/vboxguestdrivers/7.2.14/recipe-sysroot-native/usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/16.1.0/include/stdarg.h:49:9:
note: this is the location of the previous definition
|    49 | #define va_start(...) __builtin_c23_va_start(__VA_ARGS__)
|       |         ^~~~~~~~
| ../vboxsf/include/linux/stdarg.h:8:9: warning: 'va_arg' redefined
|     8 | #define va_arg(v, T)    __builtin_va_arg(v, T)
|       |         ^~~~~~
|
/work/oe-upstream/bitbake-builds/poky-master/build/tmp/work/qemux86_64-poky-linux/vboxguestdrivers/7.2.14/recipe-sysroot-native/usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/16.1.0/include/stdarg.h:54:9:
note: this is the location of the previous definition
|    54 | #define va_arg(v,l)     __builtin_va_arg(v,l)
|       |         ^~~~~~
| ../vboxsf/include/linux/stdarg.h:9:9: warning: 'va_copy' redefined
|     9 | #define va_copy(d, s)   __builtin_va_copy(d, s)
|       |         ^~~~~~~
|
/work/oe-upstream/bitbake-builds/poky-master/build/tmp/work/qemux86_64-poky-linux/vboxguestdrivers/7.2.14/recipe-sysroot-native/usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/16.1.0/include/stdarg.h:57:9:
note: this is the location of the previous definition
|    57 | #define va_copy(d,s)    __builtin_va_copy(d,s)
|       |         ^~~~~~~
```

If the missmatch is reversed, there is probably a different error.

To fix this we provide the actual target kernel version via the KERN_MAJ
Makefile variable

Note: The kernel version might be empty during parsing (e.g. when using
linux-dummy), therefore `or ''` is needed.

CC: Khem Raj <raj.khem@gmail.com>
---
 .../vboxguestdrivers/vboxguestdrivers_7.2.8.bb                | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.2.8.bb b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.2.8.bb
index 6b6a2f23ff..27f79c24c5 100644
--- a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.2.8.bb
+++ b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.2.8.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://${UNPACKDIR}/${VBOX_NAME}/COPYING;md5=217590d3a513571
 
 DEPENDS = "virtual/kernel"
 
-inherit module kernel-module-split
+inherit linux-kernel-base module kernel-module-split
 
 COMPATIBLE_MACHINE = "(qemux86|qemux86-64|qemuarm64)"
 
@@ -24,7 +24,7 @@ S:task-patch = "${UNPACKDIR}/${BP}"
 export VBOX_KBUILD_TARGET_ARCH = "${ARCH}"
 export VBOX_KBUILD_TARGET_ARCH:x86-64 = "amd64"
 
-EXTRA_OEMAKE += "KERN_DIR='${WORKDIR}/${KERNEL_VERSION}/build' KBUILD_VERBOSE=1 CC='${CC} ${DEBUG_PREFIX_MAP} -ffile-prefix-map=${STAGING_KERNEL_DIR}=${KERNEL_SRC_PATH} -ffile-prefix-map=${STAGING_KERNEL_BUILDDIR}=${KERNEL_SRC_PATH}'"
+EXTRA_OEMAKE += "KERN_DIR='${WORKDIR}/${KERNEL_VERSION}/build' KERN_MAJ='${@(get_kernelversion_file('${STAGING_KERNEL_BUILDDIR}') or '').split('.')[0]}' KBUILD_VERBOSE=1 CC='${CC} ${DEBUG_PREFIX_MAP} -ffile-prefix-map=${STAGING_KERNEL_DIR}=${KERNEL_SRC_PATH} -ffile-prefix-map=${STAGING_KERNEL_BUILDDIR}=${KERNEL_SRC_PATH}'"
 
 # otherwise 5.2.22 builds just vboxguest
 MAKE_TARGETS = "all"

