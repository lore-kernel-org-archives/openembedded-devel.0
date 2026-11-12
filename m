Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5035.1794449672735105366
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Nov 2026 18:14:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=Jm79IvZ3;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=SU/Z3Maq;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: ricardo.salveti@oss.qualcomm.com)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABMaJsT1622771
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Nov 2026 02:14:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=RVXKwxXDaua
	GxzxjLmFpmItN+1ycFZi1kQdMQ6XWEBY=; b=Jm79IvZ3PvNIaYfRYYTPuy56/eu
	McRw/AJHgTjp1LbXQEMW7n/8KCT8+SI8aBKWIs1KjF5r4FYMo9EPM/Lq8qldSsYz
	Vb+upNyfzByjWYT93F/qbr3+KpHPZ2GO+W+t0Rsh5OwE6mgdxcHUl/XqA6WwRF7y
	M4x06Dl20ctoZwrb3Bbb4h7R6qVYJRaPfL+zPy56nn4/+gbp+hsMQu03D10zAjri
	oElh7CCQH8cAbGlZVXvU9y+OGr49KBdvTBmnoPSdss8V8QGKoV9A4GWjPOkEyLO3
	gSleRWD+nfvL/izri3qb3qSjoaHu1p+vZk9rnQE7ChFQSjxFo16VqaEY3mw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvpjjuj9g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Nov 2026 02:14:31 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3adeba76cadso2574403a91.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 11 Nov 2026 18:14:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794449670; x=1795054470; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RVXKwxXDauaGxzxjLmFpmItN+1ycFZi1kQdMQ6XWEBY=;
        b=SU/Z3Maq5UJfyjCXZj6+eRuXgwFrbP+O3g+efvuVTOBgcdiecTcCb5tha4W1otTkTk
         i7txvf4p++Ai/rO190smOVafqIeKROWqhVRS6fNg+lH8CtM1xWP5uUZChV8snao/iRpp
         FIFbgRGR/EK2VjtPk6I/FQbp3BeM8HU6KoJHkUCBp8cd2yDaJZmVSYNB+iab1HzNNQhv
         YALNLdA62PHUOy1+rqAtP5ExyelVQ4ZnYgDOnLtRy8QRI7ucKMOtXqzAqFgGW+EbQ6b2
         ZnSFcUP2HaOKrRxSz8zCGqOgzG23x1FI5702Pk1VC22ifVNeRtu8GcJ2/m/PF3MlhJ1B
         kD3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794449670; x=1795054470;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RVXKwxXDauaGxzxjLmFpmItN+1ycFZi1kQdMQ6XWEBY=;
        b=KqMjuEisCweYgVLUVXHTuLj9esf0gi//o8j/aZequjRhztkV+k52gWidzwqKJ1TsPU
         tswGArY2gbmtlATcDP77CJfum9g+LYUqohmD8LbG9/xfsW8m83C853rk/jmRhRamNxhg
         Hdo4/BtXUPDtvDWeTGUvwEFTA7yBR0pGNcjhK2AvfroT+VSGi4oNjzLag6flSOzt7H3y
         bv6pbtmrtwvmQcNP0tg6AqQiJAwCzUVLknzFMSdyDdDZBXH1/IJ3wuRrGF0NHjKgYUJY
         Zc+L8hjnUd9al4xDtyEzTIBfER1EaD/zWunfju30dES2oAZ8CjK0qfHXGW0wmuzBJwjx
         jc8g==
X-Gm-Message-State: APuU4Z8H7XRGG/c4GhORXnhq3k7Tr/qjjUgQaEy8YfMLTkHIh0hJL4pk
	FttZxO3vGKD6LqcjIp12xYlyWQjcmMUf6FO7VNVkN6U+bZUQQxjAQae8mDE19xgVLr8oMrYInma
	OEYJ/eoAKl0fMUcKYqIF2fo8QCgezrbbc2/tYFkiIVSvTW0KkrP4bzEbzlZYtz9WbgFLQ/3D1Eh
	3chTsB75eEDoKtBd87
X-Gm-Gg: AYBFou1k6GnOW2QG5fX/1K+lyTGpHR0ssHoEHTvByE4PwKARiETCmFi11ZzCh2nfo3J
	GEppwoXVPuYXYp4drxgD4Np2khJfWaLfxP2o4/0cTk2fRpn9fOcSD0vQMfGLqyQOm3WKBXmwtSC
	FW6T2RSjOvuA+J589ge7VRbNHIJB7EICnGPMPr8lPaM/ycILO6tMzQaCBCdvjgnnmfYbplDpgq8
	kWC7dW/p2Ysfz5RCpgKEZAG5USamDLcfaAOARHAr7F91vvrq7kqiovZECMADWeap6cZ0T5ieNjQ
	ThL+v7Xl6cydyQI4FRCPe+z/+x6/Fe6kNn3ev0lLXffgKvAW9PQmiJShq+NYc9jOWlePVipcoTx
	0j932v0uSLXaww0J5AXt1nPWKgzO+GGKXPvcnjqwZby19t5poRGULd7EwETribxN5rDeEsMg/Pc
	osIbNjCHZ1j0YQlV7vjHFcbFpb5NgqGhsJpNAJMcefqSTXvxQcrt/g9Mo5tkeTIl1y7bBd6sOLW
	U/EEVoJPyKwfNo=
X-Received: by 2002:a17:90b:540b:b0:3ab:17b6:9a93 with SMTP id 98e67ed59e1d1-3b1830081ccmr3856796a91.52.1794449670378;
        Wed, 11 Nov 2026 18:14:30 -0800 (PST)
X-Received: by 2002:a17:90b:540b:b0:3ab:17b6:9a93 with SMTP id 98e67ed59e1d1-3b1830081ccmr3856781a91.52.1794449669878;
        Wed, 11 Nov 2026 18:14:29 -0800 (PST)
Received: from ip-172-31-25-255.us-west-2.compute.internal (ec2-35-83-207-173.us-west-2.compute.amazonaws.com. [35.83.207.173])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b182e3a74asm2969473a91.4.2026.11.11.18.14.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 18:14:29 -0800 (PST)
From: Ricardo Salveti <ricardo.salveti@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH v2] cpupower: split cpufreq-bench into cpupower-bench
Date: Thu, 12 Nov 2026 02:14:19 +0000
Message-ID: <20261112021419.795130-1-ricardo.salveti@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261112014740.789894-1-ricardo.salveti@oss.qualcomm.com>
References: <20261112014740.789894-1-ricardo.salveti@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAwOCBTYWx0ZWRfXxe0hrxP+lo6E
 uqy1JNCMCNeSYI3dHznvGVXPE7+Xv+WEyEWiGqktO7J+P8azjSZsLIgdE0G6b8FH8a//7HZ7/dJ
 n/oGUnBQsIddUMGxanj5N9WzVXbqeW3cmypODVvrDqrd9B3otLi6PVVSq081lNCCxaLjobEh/Pc
 pmtY6gLGmYVE+zlSGMNwhdJdxyzxlpHeFLPT2WYIheiPZXUYCk8c71ngzoPcetzZF5gaw8Fwk9n
 TJv/X8pN/CaRMbp9m0J+DoimyF/SiC4WRh4kyqT6WVXg4tDF+ub+jqE9VGzrLDkh/xYyGCSuUmo
 RWbbqYY1n5bGSnVDht6ymS4fdWsTpRBKIYiDSs1y03ZBJ88UYhWpM4iHTNbF8tCuTdvG6RICMP8
 RILA91adMJ53ir5pVIXkgt29gAvfwzqEiwnLb/o//qZlQTBkAPRA8DrZEEfrCuLs4Rg5z2vrtU7
 T+2lJPcW7ZFk9lWs3Jw==
X-Proofpoint-ORIG-GUID: l4xugg8pihDlHB-e04QbbfC8vy9irAG9
X-Authority-Analysis: v=2.4 cv=FeuiV5+6 c=1 sm=1 tr=0 ts=6af52107 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=P2/bgbqRawb6I1+7fxbs5g==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=C5qg9FS71YztyAyyvFoA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: l4xugg8pihDlHB-e04QbbfC8vy9irAG9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAwOCBTYWx0ZWRfX75i+7CWCL5/F
 2Bfr6R71NzVCjSEyT1ZFTPh10PqFi7cOifRfumTzVphIvS52RMn+pBRqfZmictExynW8M3gLhwZ
 iAC8YR9SxbA7ya34NXdsqHuNMjvqkoE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_06,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120008
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 12 Nov 2026 02:14:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132148
Content-Type: text/plain; charset="utf-8"

The kernel's cpupower Makefile builds cpufreq-bench by default and
installs its cpufreq-bench_plot.sh helper, a bash script, into
${bindir}. That makes the whole cpupower package RDEPEND on bash,
which pulls bash into images that only want the cpupower tool, such
as busybox based initramfs images.

Move cpufreq-bench, its plot script and its configuration file to
cpupower-bench and carry the bash dependency there. Images that use
cpufreq-bench now need to install cpupower-bench, so switch the
benchmarks packagegroup to it.

AI-Generated: Uses Claude Code
Signed-off-by: Ricardo Salveti <ricardo.salveti@oss.qualcomm.com>
---
v2: rebased on master-next (on top of "cpupower: Install systemd unit
    into systemd_system_unitdir").

 meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb | 2 +-
 meta-oe/recipes-kernel/cpupower/cpupower.bb                | 5 +++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index 37c7d8c446..9158b9acf1 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -53,7 +53,7 @@ RDEPENDS:packagegroup-meta-oe = "\
 RDEPENDS:packagegroup-meta-oe-benchmarks = "\
     bonnie++ \
     coremark-pro \
-    cpupower \
+    cpupower-bench \
     dbench \
     dhrystone \
     fio \
diff --git a/meta-oe/recipes-kernel/cpupower/cpupower.bb b/meta-oe/recipes-kernel/cpupower/cpupower.bb
index a8cdf1bf0a..789df415fe 100644
--- a/meta-oe/recipes-kernel/cpupower/cpupower.bb
+++ b/meta-oe/recipes-kernel/cpupower/cpupower.bb
@@ -27,11 +27,12 @@ do_install() {
 }
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
-PACKAGES =+ "${PN}-systemd"
+PACKAGES =+ "${PN}-bench ${PN}-systemd"
 
+FILES:${PN}-bench = "${sbindir}/cpufreq-bench ${bindir}/cpufreq-bench_plot.sh ${sysconfdir}/cpufreq-bench.conf"
 FILES:${PN}-systemd = "${sysconfdir}/cpupower-service.conf ${systemd_system_unitdir}"
 
-RDEPENDS:${PN} = "bash"
+RDEPENDS:${PN}-bench = "bash"
 
 python do_package:prepend() {
     d.setVar('PKGV', d.getVar("KERNEL_VERSION").split("-")[0])
-- 
2.43.0

