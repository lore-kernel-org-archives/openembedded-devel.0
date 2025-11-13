Return-Path: <vudupa@qti.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2482CD5BCE
	for <webhook@archiver.kernel.org>; Thu, 13 Nov 2025 11:27:57 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21689.1763033267310662471
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Nov 2025 03:27:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=DWe830b4;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qualcomm.com, ip: 205.220.180.131, mailfrom: vudupa@qualcomm.com)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AD6hpuB3802021
	for <openembedded-devel@lists.openembedded.org>; Thu, 13 Nov 2025 11:27:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=cwojFO/wbtDPgkxWPUFqx33D6pcJCcrj3lQ
	W8u3Jx0g=; b=DWe830b4N2Amp+OhKWEgR4LGkgsJgOWKJhZYhQvWRn1Whip35mn
	jbFkXyIStSTKLohYN49c6xoUnfx+SoqptncQNmyZ54/GH5qCp3Lg5MMdjsrgEkxh
	9wvFq81BpbJ1kWMzLYV32ItZQklza75YC9XuKp472glqluvsHzqbD6Xxo4sFP5IU
	Z/4enHvd88xG2UQ17U/Pn36btf5EtsJFwuN2UinmtQcvqg6rcGD95xVgcLnv4g7Q
	lqQrw6yuc+t1OxVIlXviq8/m8AYoLeqbBqdiYlajt8U4EFRPsMZfcK7LFYocCs2m
	BIC+Le+zauLuY6xveSx7GTQsLb0Oxmp0wig==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adaam8ukr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 13 Nov 2025 11:27:45 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5ADBRgWw003740
	for <openembedded-devel@lists.openembedded.org>; Thu, 13 Nov 2025 11:27:42 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4a9xxmu5u4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 13 Nov 2025 11:27:42 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5ADBRgSd003734
	for <openembedded-devel@lists.openembedded.org>; Thu, 13 Nov 2025 11:27:42 GMT
Received: from hyd-e160-a01-2-03.qualcomm.com (hyd-e160-a01-2-03.qualcomm.com [10.147.154.239])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 5ADBRg7r003731
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Nov 2025 11:27:42 +0000
Received: by hyd-e160-a01-2-03.qualcomm.com (Postfix, from userid 3978420)
	id 244E94DFC; Thu, 13 Nov 2025 16:57:41 +0530 (IST)
From: Vishwas Udupa <vudupa@qti.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: anuj.mittal@oss.qualcomm.com, Vishwas Udupa <vudupa@qti.qualcomm.com>
Subject: [meta-networking][PATCH] chrony: remove buildtime installation of /var/lib/chrony
Date: Thu, 13 Nov 2025 16:57:12 +0530
Message-Id: <20251113112712.709710-1-vudupa@qti.qualcomm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDA4NSBTYWx0ZWRfX3qv/LtxYqBXf
 pLZTKJqjyH+GT9FuS0oYmbHpHn9JytWRhBb4iCDNGpk5sB8WFFEtMvlzI1kO+cBOwXchp02EEsf
 bms6liGp52nYSPiumRVIm44cOdRN5emn3bf7fghEMUbnjh8AUFB8a16uCR+dl00jqAgxZ9Pkbkk
 hy20rqn7kwUufoMZOX0IFyHcaUe2loq3f32FoFtJQ628Rkl2m5okPEyNVvEfNd7JZ47pjgb3nhU
 gCLSH0fCPOokZe/AcjzBhMBdJbgdL94ujQQgPl0cOcHulpAgGAyFJQqzneqMEzAZEv4sMF9eLpH
 l3j/b5pPvhpJV2TW4wY+WE6zmyNRXVJBJ/kQ3VicNm9M+u+Lwhn0dSSb2Ic2HrXUTDVeBm8IJW4
 a3bYMMq8cqCn2/8sEWx01xXf2gi98A==
X-Authority-Analysis: v=2.4 cv=d4f4CBjE c=1 sm=1 tr=0 ts=6915c0b2 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=6J7-mQ5WhKTNBz1J4YkA:9
X-Proofpoint-ORIG-GUID: wgOvEvVTwevWK7vrZbuaW5FNtvkEMi0t
X-Proofpoint-GUID: wgOvEvVTwevWK7vrZbuaW5FNtvkEMi0t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_02,2025-11-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 impostorscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 phishscore=0 suspectscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511130085
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Nov 2025 11:27:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121644

Since commit 3200122d68 (chrony: create /var/lib/chrony by systemd-tmpfiles)
tmpfiles.d mechanism already ensures populating /var/lib/chrony at runtime.
Introduce volatiles mechanism to make sure the directory is created
at runtime for sysvinit as well.
Since /var/lib/chrony is populated at runtime, stop packaging at build time.
this helps to align towards stateless system expectations
or when updates are done via meta-updater.

Signed-off-by: Vishwas Udupa <vudupa@qti.qualcomm.com>
---
 .../recipes-support/chrony/chrony_4.8.bb           | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/meta-networking/recipes-support/chrony/chrony_4.8.bb b/meta-networking/recipes-support/chrony/chrony_4.8.bb
index 826bffc323..f50576c272 100644
--- a/meta-networking/recipes-support/chrony/chrony_4.8.bb
+++ b/meta-networking/recipes-support/chrony/chrony_4.8.bb
@@ -102,9 +102,6 @@ do_install() {
     install -d ${D}${systemd_unitdir}/system
     install -m 0644 ${S}/examples/chronyd.service ${D}${systemd_unitdir}/system/
 
-    # Variable data (for drift and/or rtc file)
-    install -d ${D}${localstatedir}/lib/chrony
-
     # Fix hard-coded paths in config files and init scripts
     sed -i -e 's!/var/!${localstatedir}/!g' -e 's!/etc/!${sysconfdir}/!g' \
            -e 's!/usr/sbin/!${sbindir}/!g' -e 's!/usr/bin/!${bindir}/!g' \
@@ -114,12 +111,17 @@ do_install() {
     sed -i 's!^PATH=.*!PATH=${base_sbindir}:${base_bindir}:${sbindir}:${bindir}!' ${D}${sysconfdir}/init.d/chronyd
     sed -i 's!^EnvironmentFile=.*!EnvironmentFile=-${sysconfdir}/default/chronyd!' ${D}${systemd_unitdir}/system/chronyd.service
 
-    install -d ${D}${sysconfdir}/tmpfiles.d
-    echo "d /var/lib/chrony 0755 root root -" > ${D}${sysconfdir}/tmpfiles.d/chronyd.conf
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
+        install -d ${D}${sysconfdir}/tmpfiles.d
+        echo "d /var/lib/chrony 0755 root root -" > ${D}${sysconfdir}/tmpfiles.d/chronyd.conf
+    else
+        install -d ${D}${sysconfdir}/default/volatiles
+        echo "d root root 0755 /var/lib/chrony none" > "${D}${sysconfdir}/default/volatiles/00_runtime_chrony_dirs"
+    fi
 
 }
 
-FILES:${PN} = "${sbindir}/chronyd ${sysconfdir} ${localstatedir}/lib/chrony ${localstatedir}"
+FILES:${PN} = "${sbindir}/chronyd ${sysconfdir}"
 CONFFILES:${PN} = "${sysconfdir}/chrony.conf"
 INITSCRIPT_NAME = "chronyd"
 INITSCRIPT_PARAMS = "defaults"
-- 
2.25.1


