Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18A4AE674AC
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 13:05:52 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.78697.1766404396565501400
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Dec 2025 03:53:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=fU5+nOX/;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qualcomm.com, ip: 205.220.180.131, mailfrom: jaihindy@qualcomm.com)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BMB5IYQ1501454
	for <openembedded-devel@lists.openembedded.org>; Mon, 22 Dec 2025 11:15:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=dV2rhRtOKen3UHSD77fhJm/GA+NjhN+e68W
	Rgv16kho=; b=fU5+nOX/rOdBHTuCn9R4Qz6S3g63UI+zr9b5HlsaweBXSZIKSOz
	r06d7sf8rT0yp/5RqNKZeBqsgFmWEOOCDP+AvNiZQhJ5uDwU+KA1swiZ6WNxAffG
	p6R0iSsQN7Rg0n4SPSbom+y4uZjEReApUZD9oyRFMb15dnHIAVNr56f3wWg6BRNr
	PeaizUXjmAJVDfMWsny6lMZ6d3tSNBcRKvAVuVAwY445P1Ygv4ijg7W7jJnzvfZp
	ChtW6aQcfhRM75LC2b5nDTrEKGanRCbJsWQn67uX2vx4QppjucdMZ11EhSdKUlu6
	1ZbuGWS8mthqgUn9Q8wrqXdYIR5SbGhIr+Q==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b74tag0tq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 22 Dec 2025 11:15:31 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5BMBFS0L018579
	for <openembedded-devel@lists.openembedded.org>; Mon, 22 Dec 2025 11:15:28 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4b5mvkx5dm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 22 Dec 2025 11:15:28 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5BMBFSvh018574
	for <openembedded-devel@lists.openembedded.org>; Mon, 22 Dec 2025 11:15:28 GMT
Received: from hu-devc-hyd-u24-a.qualcomm.com (hu-jaihindy-hyd.qualcomm.com [10.213.102.234])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 5BMBFRpU018573
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Dec 2025 11:15:28 +0000
Received: by hu-devc-hyd-u24-a.qualcomm.com (Postfix, from userid 448081)
	id 1142A21CBD; Mon, 22 Dec 2025 16:45:27 +0530 (+0530)
From: Jaihind Yadav <jaihindy@qti.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jaihind Yadav <jaihindy@qti.qualcomm.com>
Subject: [meta-selinux] [PATCH 1/1] systemd: create backlight directory via tmpfiles for SELinux compliance
Date: Mon, 22 Dec 2025 16:45:23 +0530
Message-ID: <20251222111523.2837748-1-jaihindy@qti.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=DPiCIiNb c=1 sm=1 tr=0 ts=69492853 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=iGHA9ds3AAAA:8 a=EUspDBNiAAAA:8
 a=AUzcqfEhTWBODeFfjOAA:9 a=tOIqXpxfQm4A:10 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-GUID: jD0nf6h5EukrBAAEN-Z1c4Mfg6TpEXN7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDEwMiBTYWx0ZWRfX/Q6jXzF2PHiZ
 2yh+jNB+xctuMcpr53cnocrR4dGu9PjJOPNNS6dQm59dHI9RtxWmqQfHoKbQiWpdIhGWusVsVz1
 gY3MuiJfAuaeeRhuKdT9BqWECu2oE4e1+Jy5IUm3k3pWPeFhkx8eMhZJyOF7cdOZ+/vxxn6SNgQ
 N1QpJ5zLPAG1ZQPRvs2Yw5P/G4FZWQKiGGHh/Zp/0L9pcOlzpEGW1M5zE61ncsCUA8cf+x7Xc6p
 FyogVsnc2kVZw8hlDogvVq3CZYxqOjQdVVifg2SZewPZ+WfarcdBpRZUo7y2zM61Qlct7QRJ/T9
 BRB0EZUtPU6YEHFMlNBBnjDYbxZvEF1we9Md/GTCm0TCARVCYM1XruWoS+SsLREwhhX1rnCNd7Q
 diFutGzhqK0nmUmCwR855qADdj1Ayg5yPXFX0cChAvpny+jeLDSH8nz5lkGYG3v75HV3EP8X6mf
 jiMHBzM5GNaldx0rZQA==
X-Proofpoint-ORIG-GUID: jD0nf6h5EukrBAAEN-Z1c4Mfg6TpEXN7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-21_05,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 malwarescore=0 spamscore=0 bulkscore=0
 impostorscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512220102
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 22 Dec 2025 13:05:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122787

Ideally, /var/lib/systemd/backlight should be created and labeled at
runtime, not at build time. The previous approach installed this
directory during image build, which can cause issues with features like
OSTree when SELinux is enabled.

This change ships a tmpfiles configuration to ensure the directory is
created and labeled correctly during first boot, allowing SELinux
relabeling to work as intended.

Reference:
Previous discussion and initial fix:
https://docs.yoctoproject.org/pipermail/yocto/2018-April/040854.html

Signed-off-by: Jaihind Yadav <jaihindy@qti.qualcomm.com>
---
 recipes-core/systemd/systemd_selinux.inc | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/recipes-core/systemd/systemd_selinux.inc b/recipes-core/systemd/systemd_selinux.inc
index 7d466ee..f36519c 100644
--- a/recipes-core/systemd/systemd_selinux.inc
+++ b/recipes-core/systemd/systemd_selinux.inc
@@ -1,7 +1,13 @@
 inherit enable-selinux enable-audit
 
+# Ship tmpfiles config for backlight
+SYSTEMD_TMPFILES += "systemd-backlight.conf"
 do_install:append() {
-	if ${@bb.utils.contains('PACKAGECONFIG', 'backlight', 'true', 'false', d)}; then
-		install -d ${D}${localstatedir}/lib/systemd/backlight
-	fi
+    if ${@bb.utils.contains('PACKAGECONFIG', 'backlight', 'true', 'false', d)}; then
+                install -d ${D}${sysconfdir}/tmpfiles.d
+       cat > ${D}${sysconfdir}/tmpfiles.d/systemd-backlight.conf <<'EOF'
+d /var/lib/systemd/backlight 0755 root root -
+z /var/lib/systemd/backlight - - - -
+EOF
+    fi
 }
-- 
2.43.0


