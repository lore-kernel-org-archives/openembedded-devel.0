Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16024.1794916149657558955
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Nov 2026 03:49:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=TDWiY1Zy;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qualcomm.com, ip: 205.220.180.131, mailfrom: vaibjind@qualcomm.com)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH92fkX844341
	for <openembedded-devel@lists.openembedded.org>; Tue, 17 Nov 2026 11:49:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=lxATV8ocf3LlwJp4rReuju1BdqLSlR/NcIJ
	yuCW/FZM=; b=TDWiY1ZyPH/7HdewUCUzp1djabrfMiuaAY1+3EUfDfA/bmUupeF
	XvrCF2iP+l+0LZDsdY4HrSzTBSkYiqmjGU9Y9jEKoFGIgFQqSLlCnBBi+Yv/VdFX
	cjZgBSAbXibgOhkygOwz68VogyRIyvE2F9Lk05bRP/awg/6H9Ruuiv7dQMG2iNZ0
	1V9tBevUiMRwRllbmYv72P1BlY9ze2BRF/PictIUM2AIZXBvhqat2icmkmHVPkA3
	dtqVFi9KfET1ExD/bMH73J2Qec2n/tVxGuT2DxX1zIUtRZg8kPKW3/ZO0C38ebTo
	U9G5N3AYqynK17GWG6HTRP4d3mdp1HNp+3A==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0c7h2c42-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 17 Nov 2026 11:49:08 +0000 (GMT)
Received: from pps.filterd (apblrppmta02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHBn5gX2678934;
	Tue, 17 Nov 2026 11:49:05 GMT
Received: from hu-devc-hyd-u22-a.qualcomm.com (hu-vaibjind-hyd.qualcomm.com [10.147.244.121])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 6AHBn5qD2678927
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 17 Nov 2026 11:49:05 +0000 (GMT)
Received: by hu-devc-hyd-u22-a.qualcomm.com (Postfix, from userid 4734334)
	id 289D3650; Tue, 17 Nov 2026 17:19:04 +0530 (+0530)
From: Vaibhav Jindal <vaibjind@qti.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: khem.raj@oss.qualcomm.com, Vaibhav Jindal <vaibjind@qti.qualcomm.com>
Subject: [wrynose][PATCH 0/2] tiobench: backport update to 0.4.2+git to wrynose
Date: Tue, 17 Nov 2026 17:19:00 +0530
Message-Id: <20261117114902.577356-1-vaibjind@qti.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-GUID: -90UUkyb3K-AJ0CN-4mC8N9PtMT041pn
X-Proofpoint-ORIG-GUID: -90UUkyb3K-AJ0CN-4mC8N9PtMT041pn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA0NiBTYWx0ZWRfX3GK/TpP9DzYo
 ae+RODqX0kpzCwGjJwnGn/TbxD3A4QGKFcJATGFCxrOYxrSVlfT2YCKlO383gzqC4/3BPYTZrsB
 LwvaSA3ZpXSkjuKTkMX7QxujJY4cnrXX+7P4suTJ70I9Fmq7/RONo70w05dvQ7Kms2KafKA7SEw
 LonDpI4ulNX+HtiYZNHSYuxeJ0XshSEPqmX3JWHRMMEo27fiDjsjGEH0TtNctuNClk6B+CQc8pP
 Rz8HvUNo5QOADpaC+HY5h313kSKfoOCUljUlS9n+D8jeXRpaOJ+ra+1q1Mj6IMFtz/04WlDBcZT
 hlfsBZbTbmT4KM4IdjK5Cwn1K82HC7g/t+bPITF+mQAMDVtlro9qmcM4jZCc35vpuNSxDV5zmGv
 Y2TNu6kkncaZkBAudkFfRifE6FftDCNiAIf75RmLPbakk6EKaPotI2MBKnr61z/gUF50hkpmEVM
 pZO8bv2SmmGqwIG2Yvw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA0NiBTYWx0ZWRfX9fUOuk9CkVb6
 PH49MvfSOgUTnxH3MAGTg2PFNE/QEizijegpsNr7l7/OuT+nP+RNcAk9R0sfGuTXfdfrS0QkRhb
 rIysJfi06IkWIQGtzzgWU5bA1SHQhCY=
X-Authority-Analysis: v=2.4 cv=bobZl0ai c=1 sm=1 tr=0 ts=6afc3f34 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=JFIDq6emCMUAX0txtTgA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 clxscore=1015 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170046
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 17 Nov 2026 11:49:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132583
Content-Type: text/plain; charset="utf-8"

Backport request for the tiobench update from master.
  - 0.3.3 fails on random I/O unless a sequential test ran first. It prints "No such file or directory" and produces no results.
  - 0.4.2+git was validated on the same target (IQ-9075 EVK) with correct output.
  - Upstream fixed read-past-EOF (654eea7) and mmap/consistency checking (9c6be14) after 0.3.3.
  - The update drops 4 downstream patches.
  - It is a single leaf recipe with no dependency changes, so the blast radius is small.
  - The second patch is the musl fix that follows the update on master.
  - Build and runtime tested on wrynose (IQ-9075 EVK).

Khem Raj (1):
  tiobench: Allow large file support with musl

Vaibhav Jindal (1):
  tiobench: update to latest upstream version

 ...rc32-function-to-fix-build-using-GCC.patch | 30 -------
 .../0001-Specify-printf-formats.patch         | 49 ----------
 .../tiobench-0.3.3/avoid-glibc-clashes.patch  | 57 ------------
 .../tiobench-0.3.3/tiobench-makefile.patch    | 49 ----------
 ...1-Allow-large-file-support-with-musl.patch | 90 +++++++++++++++++++
 .../tiobench/tiobench_0.3.3.bb                | 28 ------
 .../tiobench/tiobench_0.4.2+git.bb            | 25 ++++++
 7 files changed, 115 insertions(+), 213 deletions(-)
 delete mode 100644 meta-oe/recipes-benchmark/tiobench/tiobench-0.3.3/0001-Drop-inline-of-crc32-function-to-fix-build-using-GCC.patch
 delete mode 100644 meta-oe/recipes-benchmark/tiobench/tiobench-0.3.3/0001-Specify-printf-formats.patch
 delete mode 100644 meta-oe/recipes-benchmark/tiobench/tiobench-0.3.3/avoid-glibc-clashes.patch
 delete mode 100644 meta-oe/recipes-benchmark/tiobench/tiobench-0.3.3/tiobench-makefile.patch
 create mode 100644 meta-oe/recipes-benchmark/tiobench/tiobench/0001-Allow-large-file-support-with-musl.patch
 delete mode 100644 meta-oe/recipes-benchmark/tiobench/tiobench_0.3.3.bb
 create mode 100644 meta-oe/recipes-benchmark/tiobench/tiobench_0.4.2+git.bb

-- 
2.34.1

