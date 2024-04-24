Return-Path: <changqing.li@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0C7EC4345F
	for <webhook@archiver.kernel.org>; Wed, 24 Apr 2024 08:10:03 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.11451.1713946195815654233
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Apr 2024 01:09:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=otoE0rW+;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=48443a9d6c=changqing.li@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43O5imgN021014
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 Apr 2024 01:09:55 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=eh33r
	pgXFYD9YR6JHpXTXQaOa03H2PAz9dZKGIwgKQ8=; b=otoE0rW+JW8vmoT8/UCtF
	kOtZPnDPRPXrZ6BxUM3vsUs+momjw7XVD7bNBjdjXUiEKysbcpICeOb5pJat/GO5
	sBnvODAxC+b1uIAiYwnv3CG83lRLHycIMILj4JDwDweHG/wKlW3ix/CmT8EyF3fd
	fSg2Blq+iELyZ/FOF1Bd4KC83X0D4AQykWnqYC+/OPKZQ9pGQ+xgMz5jQt7oc7I5
	dMVWNialGdVAXAX/jnUroELaEg7GrFGa9p85z6b0l0LE59XKxD4KOOj+7O9hz9yZ
	120eBZ4SkVlZe/x8IRE7+eRucd7E9t1IJaQcsUbHNwIL8KmBXNyMR/MtMD9m7si4
	g==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3xm900unp1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 Apr 2024 01:09:55 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.37; Wed, 24 Apr 2024 01:09:54 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.37 via Frontend Transport; Wed, 24 Apr 2024 01:09:53 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [master][scarthgap][meta-filesystems][PATCH] fuse3: remove sysv init script and install fuse kernel module explictly
Date: Wed, 24 Apr 2024 16:09:53 +0800
Message-ID: <20240424080953.2461900-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: AemG084qOKEuuKCGg1VOgMlk9jjoFINJ
X-Proofpoint-ORIG-GUID: AemG084qOKEuuKCGg1VOgMlk9jjoFINJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-24_05,2024-04-23_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 priorityscore=1501
 suspectscore=0 mlxlogscore=999 bulkscore=0 impostorscore=0 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404240035
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Apr 2024 08:10:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110121

From: Changqing Li <changqing.li@windriver.com>

For systemd, there is not a fuse.service since systemd provides
sys-fs-fuse-connections.mount to mount the fuse control filesystem, so
instead, only fuse.conf is added to modules-load.d to load the required
fuse kernel module.

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../recipes-support/fuse/fuse3_3.16.2.bb          | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/meta-filesystems/recipes-support/fuse/fuse3_3.16.2.bb b/meta-filesystems/recipes-support/fuse/fuse3_3.16.2.bb
index 2b0797a6f..8c5c51360 100644
--- a/meta-filesystems/recipes-support/fuse/fuse3_3.16.2.bb
+++ b/meta-filesystems/recipes-support/fuse/fuse3_3.16.2.bb
@@ -28,6 +28,7 @@ inherit meson pkgconfig ptest
 
 SRC_URI += " \
     file://run-ptest \
+    file://fuse.conf \
 "
 
 RDEPENDS:${PN}-ptest += " \
@@ -79,6 +80,20 @@ FILES:fuse3-utils = "${bindir} ${base_sbindir}"
 DEBIAN_NOAUTONAME:fuse3-utils = "1"
 DEBIAN_NOAUTONAME:${PN}-dbg = "1"
 
+SYSTEMD_SERVICE:${PN} = ""
+
 do_install:append() {
     rm -rf ${D}${base_prefix}/dev
+
+    # systemd class remove the sysv_initddir only if systemd_system_unitdir
+    # contains anything, but it's not needed if sysvinit is not in DISTRO_FEATURES
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'false', 'true', d)}; then
+        rm -rf ${D}${sysconfdir}/init.d/
+    fi
+
+    # Install systemd related configuration file
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
+        install -d ${D}${sysconfdir}/modules-load.d
+        install -m 0644 ${WORKDIR}/fuse.conf ${D}${sysconfdir}/modules-load.d
+    fi
 }
-- 
2.25.1


