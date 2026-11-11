Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.539.1794420745077022772
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Nov 2026 10:12:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=ocStLKP9;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qualcomm.com, ip: 205.220.168.131, mailfrom: kshakir@qualcomm.com)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABF0VZ32594031;
	Wed, 11 Nov 2026 17:28:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=wJB7HfZVuQ7Wo1Xqo8uUC8lorwXyzC8x2wE
	fFmbpgrU=; b=ocStLKP9isUGKIbJHFl1NnMpvhDM6CAMCSj0Z/ecBvWomyFv4U/
	7ZZQFMsDwdykrfhLjFoG/WiKuHAyOK98cU5evRBrpEHcF4u8y5/fGEbbwGY5WkMo
	EEp8QnQWTzYOK5htevy+xeN/C9Yw63FcpA0iFLhNQWQCYz5Vd7eetScUUR84MD7X
	Psf8wTNRNMMK/71JeJXGJN0/f5af44yoK38Ws5LjqT12sfsqmc/BKwHg+mWuuIZ4
	hPxce7z6psPxU/avaKqmSXWYxDPhCTcKIDxOkC1L8QqcDYMiM6B91x5J9JWbaeSk
	qgLLf82fNfohDqUgaW6CPpyF6CVyd9+X7LQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvksmac48-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 11 Nov 2026 17:28:37 +0000 (GMT)
Received: from pps.filterd (nalasppmta04.qualcomm.com [127.0.0.1])
	by NALASPPMTA04.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABHRoi82634087;
	Wed, 11 Nov 2026 17:28:36 GMT
Received: from las-colo41-d19-20.qualcomm.com (las-colo41-d19-20.qualcomm.com [10.37.19.117])
	by NALASPPMTA04.qualcomm.com (PPS) with ESMTPS id 6ABHSaOg2635728
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 11 Nov 2026 17:28:36 +0000 (GMT)
Received: by las-colo41-d19-20.qualcomm.com (Postfix, from userid 2366661)
	id 6570E41144; Wed, 11 Nov 2026 09:28:36 -0800 (PST)
From: Kemal Rasim Sh <kshakir@las-colo41-d19-20.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: bruce.ashfield@gmail.com, Kemal Rasim Sh <kshakir@qti.qualcomm.com>
Subject: [PATCH] docker-moby: preserve gids during docker exec
Date: Wed, 11 Nov 2026 09:28:26 -0800
Message-ID: <20261111172826.1584415-1-kshakir@las-colo41-d19-20.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-GUID: hKJo--ULRTFzHwddIRR8E1qHDdK7oBvf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA2OSBTYWx0ZWRfXw77IMaJygn4i
 0c07RT5A3CHgIuXVRCadYVrzsuQr3L3BABHO9pCVKWi7HwoFvGb09Av2rVA6Yro6zW0VKZlSYu+
 OoyaSpTttz7NPvGild67IyRZ49D42zUxOZyNpSh8CVidPXnYtj5jO783ZJjLEL21djFyxgbAwaZ
 80niEBBdKWe8TweBsjDFFPpM61nRbBxrvjnt6Ls5s9PIq1aWagp5pYvXfF3dWdDfK310XHnB1O1
 J/W//gWZbs2m3SyECKdMPPd7qog3PDAxEUOcBV9C7xz7j2q9hturJasJUvBOsn5v94cY4I43K7L
 fhSy2YxGYXc8yOfHPvM+7NTvJWTzwMfsJfHw0EKAsTuBx391sBSfrlGrNu3mNCUT8Dhi8EJHqLL
 8e4uIsk8vDXo1oKuTMvsCtGcnQxlyTPQ11Pj48RA+sTbW4oMMqGBj//eIuP6gpY/X2c3Lyfl7KC
 tH/ZBXVnfsOArpC/1MA==
X-Proofpoint-ORIG-GUID: hKJo--ULRTFzHwddIRR8E1qHDdK7oBvf
X-Authority-Analysis: v=2.4 cv=O9isLx9W c=1 sm=1 tr=0 ts=6af4a5c5 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8
 a=mDQB2QH0yGYBf_SB5eAA:9 a=3nWjig0DUKXJB_ZfKOX2:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA2OSBTYWx0ZWRfXzVcE2cL2qIQj
 HHGKKTjnVmFQwAIBK28p1nsExVXytKqQy6JN+0grjEDnm69OuFhqj/Mlx//HwoZ36YfSO3SQ21C
 PrDuL4O3F1qquPWBtNCyAnP4eFnRAgY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_04,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1034 lowpriorityscore=0 suspectscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110069
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 11 Nov 2026 18:22:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132134
Content-Type: text/plain; charset="utf-8"

From: Kemal Rasim Sh <kshakir@qti.qualcomm.com>

Processes started with docker exec do not inherit all
supplemental groups assigned to the container when it was
created.

When OCI additionalGids are injected through CDI or other
OCI runtime modifications, the container init process
receives the groups correctly. However, docker exec rebuilds
user credentials and drops the original additionalGids from
the OCI process specification.

As a result, exec'd processes may lose access to devices and
resources granted through supplemental group membership,
leading to inconsistent behavior within the same container.

Preserve and merge the original OCI additionalGids into the
exec process specification so that groups assigned during
container creation remain available to docker exec
processes.

Before:

  docker exec <container> cat /proc/self/status | grep Groups
  Groups: 15 44 1000

After:

  docker exec <container> cat /proc/self/status | grep Groups
  Groups: 15 44 981 987 992 993 999 1000

Signed-off-by: Kemal Rasim Sh <kshakir@qti.qualcomm.com>
---
 recipes-containers/docker/docker-moby_git.bb  |  1 +
 ...preserve-OCI-additionalGids-for-exec.patch | 61 +++++++++++++++++++
 2 files changed, 62 insertions(+)
 create mode 100644 recipes-containers/docker/files/0002-daemon-preserve-OCI-additionalGids-for-exec.patch

diff --git a/recipes-containers/docker/docker-moby_git.bb b/recipes-containers/docker/docker-moby_git.bb
index 271f006e..eafe7a35 100644
--- a/recipes-containers/docker/docker-moby_git.bb
+++ b/recipes-containers/docker/docker-moby_git.bb
@@ -54,6 +54,7 @@ SRC_URI = "\
         file://0001-cli-use-external-GO111MODULE-and-cross-compiler.patch \
         file://0001-dynbinary-use-go-cross-compiler.patch;patchdir=src/import \
         file://0001-check-config-make-CONFIG_MEMCG_SWAP-conditional.patch;patchdir=src/import \
+        file://0002-daemon-preserve-OCI-additionalGids-for-exec.patch;patchdir=src/import \
 	"
 
 DOCKER_COMMIT = "${SRCREV_moby}"
diff --git a/recipes-containers/docker/files/0002-daemon-preserve-OCI-additionalGids-for-exec.patch b/recipes-containers/docker/files/0002-daemon-preserve-OCI-additionalGids-for-exec.patch
new file mode 100644
index 00000000..8c5c5102
--- /dev/null
+++ b/recipes-containers/docker/files/0002-daemon-preserve-OCI-additionalGids-for-exec.patch
@@ -0,0 +1,61 @@
+From 6a21aad6ca4fd964672fbf54dd409650a1e05110 Mon Sep 17 00:00:00 2001
+From: Kemal Rasim Sh <kshakir@qti.qualcomm.com>
+Date: Fri, 30 Oct 2026 09:02:24 +0200
+Subject: [PATCH] daemon: preserve OCI additionalGids for exec processes
+
+docker exec rebuilds user credentials using WithUser() and
+WithAdditionalGIDs(), which causes OCI Process.User.AdditionalGids
+defined during container creation to be lost.
+
+Preserve and merge the container's original AdditionalGids into the
+exec process specification so that supplemental groups injected by CDI
+or other OCI spec modifications remain available to exec sessions.
+
+Fixes a discrepancy where the container init process receives CDI
+additionalGids but processes started through docker exec do not.
+
+Upstream-Status: Submitted [https://github.com/moby/moby/pull/54104]
+
+Signed-off-by: Kemal Rasim Sh <kshakir@qti.qualcomm.com>
+---
+ daemon/exec_linux.go | 20 ++++++++++++++++++++
+ 1 file changed, 20 insertions(+)
+
+diff --git a/daemon/exec_linux.go b/daemon/exec_linux.go
+index 2d2f3d82f0999..014ab2f41c1b9 100644
+--- a/daemon/exec_linux.go
++++ b/daemon/exec_linux.go
+@@ -27,6 +27,11 @@ func getUserFromContainerd(ctx context.Context, containerdCli *containerd.Client
+ 		return specs.User{}, err
+ 	}
+ 
++	// Preserve OCI additional groups from container creation.
++	inheritedGids := append(
++		[]uint32(nil),
++		spec.Process.User.AdditionalGids...,)
++
+ 	opts := []coci.SpecOpts{
+ 		coci.WithUser(ec.User),
+ 		coci.WithAdditionalGIDs(ec.User),
+@@ -38,6 +43,21 @@ func getUserFromContainerd(ctx context.Context, containerdCli *containerd.Client
+ 		}
+ 	}
+ 
++	// Merge inherited OCI groups.
++	existing := map[uint32]struct{}{}
++
++	for _, gid := range spec.Process.User.AdditionalGids {
++		existing[gid] = struct{}{}
++	}
++
++	for _, gid := range inheritedGids {
++		if _, ok := existing[gid]; !ok {
++			spec.Process.User.AdditionalGids = append(
++				spec.Process.User.AdditionalGids,
++				gid,)
++		}
++	}
++
+ 	return spec.Process.User, nil
+ }
+ 
-- 
2.43.0

