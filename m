Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60AB2C87FC9
	for <webhook@archiver.kernel.org>; Tue, 29 Jul 2025 16:43:43 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web11.12973.1753807416005212185
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 29 Jul 2025 09:43:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=bM0wcKBY;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56T8aLLo027604
	for <openembedded-devel@lists.openembedded.org>; Tue, 29 Jul 2025 16:43:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=9TOViSCL+1N
	thYTtAzFcSRdB6uFVtJqA9/IAS3xPN68=; b=bM0wcKBYSxiE96ZNkB6QpdsXKH8
	gYdXmPK6nnIYYzwcmHYhTayeb2etAEkQOgv/AB8AboGRn6SV64umuhjeYi/etQ9e
	25nQui12A6C+7G+QPRXAFjzMluImuFZ4iW0nNTcyURGlv8BS6pyfAlnbU1yuzO9n
	Tc6rm361nTunUxAl+s60ZTA6yOmtJuRPjNu6N2QwYjfkhqKqjnyiCUhS9nb5D5ao
	XgWDuOEzc8UsofKR4L5LrnSNSLSqmTejOoWGrjwN9OPaYHQydP83itxZjdY1Q2KU
	xJ9jI/uzM+IgI3M2IU+6PYxmeHsIW3RjTcC9J/Le4GyQbjvwlR7XklSU5hA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4860enx4kp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 29 Jul 2025 16:43:35 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-70741fda996so47212976d6.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 29 Jul 2025 09:43:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753807414; x=1754412214;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9TOViSCL+1NthYTtAzFcSRdB6uFVtJqA9/IAS3xPN68=;
        b=BQLk5sAFfeWTddsWrcWt+QTKiVH6MPEVVQW4nlbmqbVsHPvQHqSoEj6Cw6WUrf0aY2
         PgCteF1XSPUCeTsWNEGHLG6raXUQvtyeb01ZfAB6+aJO4DPs/RvCLfFGo2gZ+Wek9Okr
         Sdtch1MJ7Hpl5AvSZMTDW3/AwKSrMY3aa0HPsUfCMyc4DixY+1AxUBg9qBctLrgjzVps
         hRy386eAU5EPic9mY6qmdi1e2whwolIf8Be0rrlt66JSIiPLr4s9JbJ4zCMW4uaobcmr
         pmcGjhRjhQio5tt/6Fkww7ECPIVH9SfqIBHjXd+MHvK8zW1MHZPJtl60us9xxDX7U/e8
         8xQA==
X-Gm-Message-State: AOJu0Yx9sxlZ2DA3jGGV3bdUcuEaPpvRDOp3FOhqQC0QAzUjdIq93ts4
	p+2j6fuMsuozwU5UeEN5nLm8aOGIRmhlVAEpw7TGTYKzNO1aMZlNOqVWbJjDrpuFkqdisi7L9d5
	tOse/j3ZeUv3Y2aQJgWpp3v91S21LggkaU2wlvlKKk0BCvf9LhI458T1NIWAzp0f8BIQQLVBqfS
	Qfol8qj50WRlNpX1Tm
X-Gm-Gg: ASbGncvNHoHJZrluB8VzO6ZzreLB+FYPiVciN3zE8LLQZ/As3LCUNaTu9UNNNQlrHj3
	ZGC5oDJ0BMp+z3OVcqmV6Dbzl1iVRs2K1B2Ra5H1QftqdySsfggDxeUTmwal+9HqEjin1KlqIEr
	S/7yb4Y5Mn0KK4inMsHaaTZL0dO/tddtpnQdHyW3an9YD0P+RywIyKF/hNbFVqR9GP172gEHHAJ
	Fi8SBM4tBrTCZG5X7ucG8dJW/XXsj7F+T/MjxWWlmZIkc649AP5qsgH3jYAAExb9LKoW0xDpjI1
	MthlPTcoQCQTDcn0yO/zzwOpFzrNm2LKdwTWGPvuTzyBX1SbykM+H7vXggtoEXKSGfGMxLIC6pq
	hey4bNWC9W5fIPZR7v7ysL7gkMvQsyK9SCol1iD4bC6J6+3LCqQN+
X-Received: by 2002:ad4:5c89:0:b0:707:6347:b6c1 with SMTP id 6a1803df08f44-70767197c9cmr147636d6.41.1753807413665;
        Tue, 29 Jul 2025 09:43:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGN60RH/mEnUUosrRAVVHyhleWS0oj+lnmNCyb/SWPyqxOe63CpNWQXUaXqBfub6i62HSl8eg==
X-Received: by 2002:ad4:5c89:0:b0:707:6347:b6c1 with SMTP id 6a1803df08f44-70767197c9cmr147216d6.41.1753807413036;
        Tue, 29 Jul 2025 09:43:33 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b6316db06sm1760917e87.16.2025.07.29.09.43.32
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Jul 2025 09:43:32 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH v2 2/2] opencl-cts: update to release 2025-04-14
Date: Tue, 29 Jul 2025 19:43:30 +0300
Message-Id: <20250729164330.513440-2-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250729164330.513440-1-dmitry.baryshkov@oss.qualcomm.com>
References: <20250729164330.513440-1-dmitry.baryshkov@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 6c3shyJJea2c3AHbXlAG7O5MU68595m3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI5MDEyNyBTYWx0ZWRfX1B1EOhvUrICt
 rScLTqTvYl6THLS6bDOJzchGCyeCfMvArT6pk5XmX95doBs9iHj1NKc78drFFFPdPO4dYlfqWq5
 WegcPqVTNoCUvYiMYnncP5kI+d2OyILcvLfX2J7hqSC875NvL4bZt0/ZZsq1YrmDh1C32Lvb8eT
 JRA6eQ1xj41PUoOqOZ2hByw6acPSMm2JfxRCufANUFAtqVwpCoM5VhYtFtf4nZegfJ3RERSeM1g
 hfndkLBYRy8Nl2kYFTxJV24IYjAgZudwce/M+DSvLZPj0K/yJ1TIrjptCKGQSadMRgNlHwn8YOo
 ZVOObf1ixDPv7WBCyadvBHzTcX//8HmZlDkb/fvcMluf+sU9SmIKSIi8ge2RMyJ/Pa/yoKUKRlY
 fsoHX+06CO+aiSUtwp/9N0g+2N1Y5uqUKmABUrZNvaohBVhvewe+WtYmDfieAiv3jw0sO8UN
X-Authority-Analysis: v=2.4 cv=DIWP4zNb c=1 sm=1 tr=0 ts=6888fa37 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=7CQSdrXTAAAA:8 a=W-_PGu6OO6z8oATam8kA:9
 a=OIgjcC2v60KrkQgK7BGD:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: 6c3shyJJea2c3AHbXlAG7O5MU68595m3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-29_03,2025-07-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 mlxscore=0 mlxlogscore=999
 spamscore=0 impostorscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507290127
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 29 Jul 2025 16:43:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118761

Update OpenCL CTS to the latest release.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 ...1-Always-enable-beta-extensions-2330.patch | 32 -------------------
 ...2025.01.22.bb => opencl-cts_2025.04.14.bb} |  3 +-
 2 files changed, 1 insertion(+), 34 deletions(-)
 delete mode 100644 meta-oe/recipes-core/opencl/files/0001-Always-enable-beta-extensions-2330.patch
 rename meta-oe/recipes-core/opencl/{opencl-cts_2025.01.22.bb => opencl-cts_2025.04.14.bb} (90%)

diff --git a/meta-oe/recipes-core/opencl/files/0001-Always-enable-beta-extensions-2330.patch b/meta-oe/recipes-core/opencl/files/0001-Always-enable-beta-extensions-2330.patch
deleted file mode 100644
index 430f9575c4b3..000000000000
--- a/meta-oe/recipes-core/opencl/files/0001-Always-enable-beta-extensions-2330.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 3a275fe81b6d436194f563e7a3d24f302d14a211 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?K=C3=A9vin=20Petit?= <kpet@free.fr>
-Date: Tue, 11 Mar 2025 18:40:29 +0000
-Subject: [PATCH] Always enable beta extensions (#2330)
-
-`CL_ENABLE_BETA_EXTENSIONS` was just introduced in
-https://github.com/KhronosGroup/OpenCL-Headers/pull/276
-to guard provisional and other experimental extensions. The CTS
-currently assumes
-all definitions are always present.
-
-Signed-off-by: Kevin Petit <kevin.petit@arm.com>
-Upstream-Status: Backport [https://github.com/KhronosGroup/OpenCL-CTS/commit/3a275fe81b6d436194f563e7a3d24f302d14a211]
----
- CMakeLists.txt | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 898f62e97bdc..8a93ea9fb843 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -18,6 +18,7 @@ add_definitions(-DCL_USE_DEPRECATED_OPENCL_1_2_APIS=1)
- add_definitions(-DCL_USE_DEPRECATED_OPENCL_1_1_APIS=1)
- add_definitions(-DCL_USE_DEPRECATED_OPENCL_1_0_APIS=1)
- add_definitions(-DCL_NO_EXTENSION_PROTOTYPES)
-+add_definitions(-DCL_ENABLE_BETA_EXTENSIONS)
- 
- option(USE_CL_EXPERIMENTAL "Use Experimental definitions" OFF)
- if(USE_CL_EXPERIMENTAL)
--- 
-2.47.2
-
diff --git a/meta-oe/recipes-core/opencl/opencl-cts_2025.01.22.bb b/meta-oe/recipes-core/opencl/opencl-cts_2025.04.14.bb
similarity index 90%
rename from meta-oe/recipes-core/opencl/opencl-cts_2025.01.22.bb
rename to meta-oe/recipes-core/opencl/opencl-cts_2025.04.14.bb
index 52c8c59f27e6..9c6a55691fe2 100644
--- a/meta-oe/recipes-core/opencl/opencl-cts_2025.01.22.bb
+++ b/meta-oe/recipes-core/opencl/opencl-cts_2025.04.14.bb
@@ -10,10 +10,9 @@ RDEPENDS:${PN} += "python3-core python3-io"
 
 
 SRC_URI = "git://github.com/KhronosGroup/OpenCL-CTS.git;protocol=https;branch=main;lfs=0 \
-           file://0001-Always-enable-beta-extensions-2330.patch \
 	   file://0001-Ignore-Compiler-Warnings.patch"
 
-SRCREV = "5b3518096ca7b82854daadb2b2fae704fe2d9cb5"
+SRCREV = "e96edaef8b582c2412a2aab4b82f5c88af88617d"
 
 EXTRA_OECMAKE:append = " -DENABLE_WERROR=OFF -DCL_INCLUDE_DIR=${STAGING_INCDIR} -DCL_LIB_DIR=${STAGING_LIBDIR} -DOPENCL_LIBRARIES=OpenCL"
 
-- 
2.39.5


