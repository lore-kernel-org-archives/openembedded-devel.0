Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FAFAC624D5
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 01:26:26 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2768.1788312383174556310
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Sep 2026 18:26:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=U6GMSdL7;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=dnyfAU2p;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681KTUFX4098037
	for <openembedded-devel@lists.openembedded.org>; Wed, 2 Sep 2026 01:26:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=xLr5X4MeX/l
	wEHZDQQfAoO6IUYC2zAjinY5VRJcMVbQ=; b=U6GMSdL7bjPOOt+q9QQicB+TceS
	K12Gz7MxgcJzKqE9hiakPxB6ZW6zZPaOsiQyCoaH4pYX3turY3Zgbi8WEacmxRpH
	ElLO4foM2jayN+arHCnTdUd11Rw0dkk1AAAUDGboBnzT+S16Qt7R1NDc2RwISFMo
	dWHnK1002adUukTrtOLDcpTwipNIxWagqQRPIFoINauxKxMfZmQ3F/jxn7H+CYTg
	j1MKnJCK/9au4ldZ4PtObxyPgpHUTXeVebzmmucWcqYUEZIn0RZC4uO2JEaPoeBF
	u9wyUi8dtis8hX5x53FDwj/kwuF7uytA3+/ZEPBvs84tObSEtS4KehuAVOA==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdynt2vgw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 02 Sep 2026 01:26:21 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-9806535f8ffso612743241.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 01 Sep 2026 18:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788312381; x=1788917181; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xLr5X4MeX/lwEHZDQQfAoO6IUYC2zAjinY5VRJcMVbQ=;
        b=dnyfAU2pG5ZHMILVvYxizDo2whaRbtPtahbiiQBXjfx5gDXS89DZIoFEJ0XGF7Curw
         BtrysvsSvpHINEn/8TVJ028e15ksTP01vWNFHB0tTslPUjTOsF0n7Fr+kE/pMBssLAmA
         MBVC+WQMX2b0+U9B6lifReS2F1cxD+62IB2VYgZoAqWIlwLG30378QlCFZuyinuYlt78
         X4H+926qAMYycY9/9c6Avlm1ftec404pg8h7ZAxSV0lp7IKwnYq2oYxVQsQNSE6ZeJ0w
         JZtxRw+7MwsjaTfZGLUzne2sw4oJ7kT0R8j6oU1/HBt6smaF4qlK0Kj39MuNWbTlzNOc
         FuPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788312381; x=1788917181;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xLr5X4MeX/lwEHZDQQfAoO6IUYC2zAjinY5VRJcMVbQ=;
        b=WpsXH2IrEJILxloUPCy4QdqfJIuQkayX7B37gOHzJSnThSUzjMMKiRjnO5r9mOiYpH
         fBZHwTqA4Aij4JbA3giyW9k4yYXR866+mxDndgeuX7WyJPILwkpHPUgeDEh3jtJEekdI
         FuZX7trKQlhm3J/rwACir1+oNSg8kylpWSNWPA/rUF0/SkKiovXe3tTiYKHtklk+douX
         fFSFateFTDOwPvgqYwyCla0M/A6teSItqq/SaVEYHjzvwSJxdouk1HU5hmo1OWe09pUT
         QDUFbJOuK9gJEceKA24MufxhFsiOPfuVse2Tdc0ZKGXQ0DKY5Nqa5zz9yGkuCM9gUoEL
         lBcA==
X-Gm-Message-State: AFuF++lHddUnYaAaTyXxWqOKyFzXfdfdVSBOhVftTeTwzTvkmnQVZJjH
	VyilmiPL+KCA41/elcGxrsyZVayxReVF6abk9tzHyZ/NP641ZKEKX+PuHeVoFvfKB6K+jclvS0l
	IFs49o5m9wl9WLZgv/mBvMat/uEbY1vmbOgnFhM0GPeBa2t/Xcw2RhiQN+n95CDbDJiUK/US30l
	BmVf8SkA2sEI3F8aq+
X-Gm-Gg: AYBFou1vw1r6M6SXfeqmMkmhAt0ul4p/ZP2WXe6X3kRH+q+GL2OAG7ayt90MxcswAe/
	oKe21iY4l/lhX6eempog2glDFGeV+Nr5LvAcJUwjnocS9baQzaY5Bk5zvkA4OFqeHhcg222OxNe
	t7Jrhi1Ved9Pmf2h5gP5LVkb9zQB5b1by8bFs1DarvvGLZbQg16k0/Fw36guC852mUEdCByYRG/
	lLqJEGPZj2oH9E4UcCDIiVOqjVKyTKNYYHuTTh1rhfexEt2OGyipQgj+V+tujpyzJ1NhYenNE68
	qhvPret854gLY5A2S/ngj4uNE/GUUXWwubjg9TKHheuukg62zlbnaAFjqcLtfb39yVS+9slOJxF
	vbh3XPVLoFVkz0V7/XUl0PrTFNJ/c3i3HSRj0zpxwZrdcZEAbgU4y3pNL2XLOOXntT1y4Epe4Sl
	QCc6J93aTKyJX0
X-Received: by 2002:a05:6102:40c5:10b0:778:6695:2f71 with SMTP id ada2fe7eead31-78a02a49248mr2185436137.15.1788312380944;
        Tue, 01 Sep 2026 18:26:20 -0700 (PDT)
X-Received: by 2002:a05:6102:40c5:10b0:778:6695:2f71 with SMTP id ada2fe7eead31-78a02a49248mr2185427137.15.1788312380489;
        Tue, 01 Sep 2026 18:26:20 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b606ba5cd4sm213269e87.64.2026.09.01.18.26.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 18:26:18 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Vaibhav Jindal <vaibjind@qti.qualcomm.com>
Subject: [meta-oe][PATCH 2/2] Revert "hackbench: add Linux scheduler benchmark recipe"
Date: Wed,  2 Sep 2026 04:26:11 +0300
Message-ID: <20260902012611.448874-2-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260902012611.448874-1-dmitry.baryshkov@oss.qualcomm.com>
References: <20260902012611.448874-1-dmitry.baryshkov@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDAxMCBTYWx0ZWRfX9dUzQYsIMb5x
 z1BPLvnkTbg8xOOfyGpMp+5nhTE0G2/eR+KdTYAj1LKJm7U0P/8LU7fr8zu2iG27jQCu7WL4edM
 417edFtZi+MxdzWn4qcHIo46AJGoIkoDxu4anvZxoj11YvQCgTGKEywY7boWd6miBbuBFFUPa6l
 X9ysOuuQaekZ2CRKNrkBWjrRLx0JYaPKzxzQqKeexKBYBb0C/BIdraQXRKnSl3pJlKAGF0xDAWH
 pFBFo37KKIVgBb6wVGsu7egbu3GwvjDvNuyz2Qgzdwx0lFLmQL1hC6VPFY2Bbt7jhMR5Qs0beuk
 L7eXWKN9xsSgZVH4HkJ2Zgezsy1hmCGBJyRUzJQFL5Ddpx2+mzDSC8dVXu5w2DtF4oxStpbo8XQ
 20DAFWDAphvr14xdhSvoYeUjD0Oj3zt9JI9g2TBeyIhjJKqsIMY9YFAoprpER6muj/oGAcM16f/
 Ivykt9Rz2jS1SmVOVPw==
X-Proofpoint-ORIG-GUID: X6dtC8yXHX_7Dqn6aISjCaqT7WWfNBsX
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDAxMCBTYWx0ZWRfX6PLP9Y7ReOMA
 89W9jUtD+RFJ2nBFk+S3FzrhFGYeL8qrMDRB3hEZEa7unnR/zDcEN3SS1ju1a/pwvmvuB+/01No
 eslJSywTi3vy+o8uE5P/JEE9I86+gJ0=
X-Authority-Analysis: v=2.4 cv=LfkMLDfi c=1 sm=1 tr=0 ts=6a977b3d cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=Hyp2LvsmweIz2Mws-E4A:9 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-GUID: X6dtC8yXHX_7Dqn6aISjCaqT7WWfNBsX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_06,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020010
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Sep 2026 01:26:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129629

hackbench is a part of the rt-tests suite which has the recipe in
OE-Core since prehistoric times. Revert the commit 1e0d296bda4f
("hackbench: add Linux scheduler benchmark recipe") which duplicated a
part of OE-Core recipe.

Cc: Vaibhav Jindal <vaibjind@qti.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../hackbench/hackbench_git.bb                | 26 -------------------
 .../packagegroups/packagegroup-meta-oe.bb     |  1 -
 2 files changed, 27 deletions(-)
 delete mode 100644 meta-oe/recipes-benchmark/hackbench/hackbench_git.bb

diff --git a/meta-oe/recipes-benchmark/hackbench/hackbench_git.bb b/meta-oe/recipes-benchmark/hackbench/hackbench_git.bb
deleted file mode 100644
index 71ef486aff41..000000000000
--- a/meta-oe/recipes-benchmark/hackbench/hackbench_git.bb
+++ /dev/null
@@ -1,26 +0,0 @@
-SUMMARY = "Linux kernel scheduler benchmark"
-DESCRIPTION = "Hackbench is a benchmark for measuring Linux kernel scheduler performance. It creates groups of processes or threads that communicate via pipes or sockets and measures the time taken to complete the communication."
-HOMEPAGE = "https://git.kernel.org/pub/scm/utils/rt-tests/rt-tests.git"
-LICENSE = "GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
-
-SRC_URI = "git://git.kernel.org/pub/scm/utils/rt-tests/rt-tests.git;protocol=https;branch=main"
-SRCREV = "d232f528fd131b7d840e79a3756d1dbdaa9b1b60"
-
-UPSTREAM_CHECK_COMMITS = "1"
-
-DEPENDS = "numactl"
-
-# Filter out unsupported compiler flags
-CFLAGS:remove = "-fcanon-prefix-map"
-
-do_configure[noexec] = "1"
-
-do_compile() {
-    oe_runmake NUMA=1 CC="${CC}" CFLAGS="${CFLAGS}" LDFLAGS="${LDFLAGS}" hackbench
-}
-
-do_install() {
-    install -d ${D}${bindir}
-    install -m 0755 ${B}/hackbench ${D}${bindir}/hackbench
-}
diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index 0320021d6550..084d5a201f0c 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -58,7 +58,6 @@ RDEPENDS:packagegroup-meta-oe-benchmarks = "\
     dhrystone \
     fio \
     ${@bb.utils.contains("DISTRO_FEATURES", "x11 wayland opengl", "glmark2", "", d)} \
-    hackbench \
     iozone3 \
     iperf2 \
     iperf3 \
-- 
2.47.3


