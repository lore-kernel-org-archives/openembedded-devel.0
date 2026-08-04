Return-Path: <rouven.rastetter.ext@karlstorz.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B59AFC55838
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 11:45:01 +0000 (UTC)
Received: from mx08-0040c702.pphosted.com (mx08-0040c702.pphosted.com [185.183.31.154])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14335.1785843892724816392
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 04 Aug 2026 04:44:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@karlstorz.com header.s=S-DKIM-20210427 header.b=DFZTkRM9;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: karlstorz.com, ip: 185.183.31.154, mailfrom: prvs=2676215baf=rouven.rastetter.ext@karlstorz.com)
Received: from pps.filterd (m0267678.ppops.net [127.0.0.1])
	by mx07-0040c702.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6748DphX2981500;
	Tue, 4 Aug 2026 11:44:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=karlstorz.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=S-DKIM-20210427; bh=PkOZA
	WfytpOXbPkG6NPyI/caDIifp75VH0oSEfZdI2M=; b=DFZTkRM9Kty2Dpd5zzoJw
	xllbRXlxm5yt+p1tI+UX2kcmEH7D47FbtsGlT0NJfhU5y4UmbaJF0BGa/oCClRpU
	zFNcw15KQF8rV0ZLVwPto1OSor7BuUt3STwTQJBv6yODzglz0GZwu9GLZD98FOeU
	P368jYIeJ56JiRrIQqw6Up0fYOxx56ZxJp5FB5lrvBuz0exVCca5XxdqSKOqdEVd
	mytF0sWLDbnPDEqrqXhedyRmsgQ8BU7sonpFoNx+3J/Zk6ipxTu/MzErGp4+Znkp
	ad8uxQcGjfiWOzNHxyN+e/p+32uQhrMNzJ5Jw/iseV+bWfLjnPjhIBrIBdEv6EHp
	g==
Received: from tut-ex02-pv.kstg.corp ([62.134.76.232])
	by mx07-0040c702.pphosted.com (PPS) with ESMTPS id 4fu3uvj8k6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Aug 2026 11:44:49 +0000 (GMT)
Received: from TUT-EX02-PV.KSTG.corp (10.0.10.191) by TUT-EX02-PV.KSTG.corp
 (10.0.10.191) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 4 Aug
 2026 13:44:49 +0200
Received: from tutn-jjhfqf4.kstg.corp (10.0.10.41) by
 InternalSMTPRelay.KSTG.corp (10.0.10.191) with Microsoft SMTP Server id
 15.2.2562.45 via Frontend Transport; Tue, 4 Aug 2026 13:44:49 +0200
From: Rouven Rastetter <rouven.rastetter.ext@karlstorz.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Rouven Rastetter <rouven.rastetter.ext@karlstorz.com>,
        Khem Raj
	<raj.khem@gmail.com>
Subject: [meta-oe][PATCH v2] vboxguestdrivers: Provide target kernel version
Date: Tue, 4 Aug 2026 13:44:25 +0200
Message-ID: <20260804114425.120520-1-rouven.rastetter.ext@karlstorz.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDA5MyBTYWx0ZWRfX16wOdWMKQEfs
 6+Lz8dHnRP79SnowRuTkD8Cb6h2KMtY4ydY6jkIhNWCBF37xb8G8dI6WFoP5s0+nlz6ZetoXkkL
 b7DOaOVqaZ8qe172TTt1k7uEtWvY6+7vacgimDAy/foufW7kHlX0
X-Proofpoint-ORIG-GUID: QrE83rVTuTcYLJeMLTK6lZUY7XwNspio
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDA5MyBTYWx0ZWRfX1/Wh1YL2JtWP
 t7Lsxm5+9uUqpHqiqhlwuiNiZDKJ4MUzo9RvUMhTdtoC55KRQudeCUS/5gbqG2Nn/YCul+ir9y2
 Q2Y6OyS9g6G1q9ThNHM1hI8GOQLBSRQSwzVHl9iulKcNbM4fS9mV6FSgZFkFoy7vTLHFk3/Ml8e
 jz7Dn2yhtkY1IQe5XoWfoEFXvgIuV4m8OIllO2PlebAenqkSZIPFlwhap89IoscRSz9m+Cq1A5u
 2GPijX2fWfo5XdT3cnzekOE8IFxfg1lijWDbQVohMAuZhEMwMrM2F+7rtbKV42BUgTOvwRvKNR3
 E9zS46iuckXgIbjuAfOOHx9kU+FvdbFyV8NwN0j4uWGSKy2syHPAP7g4n9PjjPTa1Kv2UU9zaZj
 9kwU1GW75Iy5qIN15Az5HibZSvm7s7bp9F2GKgU141X8lTirJxpAYbRjhHwFD7OHMam+S4uD5IP
 nXys7N1t2M359pO8J8w==
X-Authority-Analysis: v=2.4 cv=bZlbluPB c=1 sm=1 tr=0 ts=6a71d0b1 cx=c_pps
 a=OToaj9FDvIz41JSycRbD4A==:117 a=OToaj9FDvIz41JSycRbD4A==:17
 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=DBWTBMGyQNCzyBkTEoZL:22
 a=-VCclSYHLTda9MBvNMHz:22 a=pGLkceISAAAA:8 a=TJlxxRfH0uqe1ifZU9EA:9
X-Proofpoint-GUID: QrE83rVTuTcYLJeMLTK6lZUY7XwNspio
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_02,2026-08-03_02,2025-10-01_01
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Aug 2026 11:45:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128745

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
 .../recipes-support/vboxguestdrivers/vboxguestdrivers_7.2.14.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.2.14.bb b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.2.14.bb
index 18fda0393d..45f3f22481 100644
--- a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.2.14.bb
+++ b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.2.14.bb
@@ -32,7 +32,7 @@ S:task-patch = "${UNPACKDIR}/${BP}"
 export VBOX_KBUILD_TARGET_ARCH = "${ARCH}"
 export VBOX_KBUILD_TARGET_ARCH:x86-64 = "amd64"
 
-EXTRA_OEMAKE += "KERN_DIR='${WORKDIR}/${KERNEL_VERSION}/build' KBUILD_VERBOSE=1 CC='${CC} ${DEBUG_PREFIX_MAP} -ffile-prefix-map=${STAGING_KERNEL_DIR}=${KERNEL_SRC_PATH} -ffile-prefix-map=${STAGING_KERNEL_BUILDDIR}=${KERNEL_SRC_PATH}'"
+EXTRA_OEMAKE += "KERN_DIR='${WORKDIR}/${KERNEL_VERSION}/build' KERN_MAJ='${@(oe.kernel.get_version_file('${STAGING_KERNEL_BUILDDIR}') or '').split('.')[0]}' KBUILD_VERBOSE=1 CC='${CC} ${DEBUG_PREFIX_MAP} -ffile-prefix-map=${STAGING_KERNEL_DIR}=${KERNEL_SRC_PATH} -ffile-prefix-map=${STAGING_KERNEL_BUILDDIR}=${KERNEL_SRC_PATH}'"
 
 # otherwise 5.2.22 builds just vboxguest
 MAKE_TARGETS = "all"

