Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDA05F327C9
	for <webhook@archiver.kernel.org>; Tue, 21 Apr 2026 08:41:07 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17374.1776760773911471801
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Apr 2026 01:39:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=dW8xn133;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=Yzj7YGlD;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: bartosz.golaszewski@oss.qualcomm.com)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63L6ePaA3574148
	for <openembedded-devel@lists.openembedded.org>; Tue, 21 Apr 2026 08:22:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=xHPUgMgoPBcw4v54LNQiU4BVidoAqCiuIiB
	Q6Y5pMBI=; b=dW8xn13313aZb0HGhXTFejbQA2cR9uBhgTUJXZed05MaIO6oOrZ
	+xRomaRg1XKKcomYo7xbmK6TfTnNpLPVpKLJ121qW0U0BTQevzLuax1rZe/s/Kkd
	46HVvNdniBULbaywWp5AwXJPRKrybTaHhOeCe9+KggVeCOEv0lgH9vCvOtIJIM3Z
	+Zye/q59e/U4FbMhi6gRNws4SC+KuCOe2sOjWH3b3bhwJl+zy+c3UteNUyfSehEs
	453qoyV8tHzAddZnmSlu/lBUIHMfyQAABaLQq6frWTUW+mupQU7c8uVcmeLHcSd3
	xUWwr4DgB3i9MNEKtLTnwF65rviGJCHUs/w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dp465gcsd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 21 Apr 2026 08:22:54 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50d890580e1so15729251cf.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 21 Apr 2026 01:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776759774; x=1777364574; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xHPUgMgoPBcw4v54LNQiU4BVidoAqCiuIiBQ6Y5pMBI=;
        b=Yzj7YGlDuMs525FwtrHQDtggiyhzaVv1FfDwSpdQ0/n4caWU5/ar1FcpUTTSrBWIMa
         1m73EEZ2YKaBkjsN3EXBHmUcQ4qgWXTnNl92/mBbs+WmNTiU1iEAbCL3e31/T+/7MpGm
         eqF7C5/hxbDT59XhEQKI1t53Tb5SQFbGOUPQ1ZX41SwQOxmGr0BluwK+u1FgHHtxBNFY
         cufyGRIfBEFcuwBbR7UsC8Wj1gZt0QDi1sLqNdsKrCmOtFbiT/Sdeq9t0EJAnSmWS78o
         X/Fq6ESL4TyEDq76mU3Y+b1PkbQay7sGOaEtnmQ1UxNES5ntZ8sL2U6JSPkWi/DZwQeO
         NHDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776759774; x=1777364574;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xHPUgMgoPBcw4v54LNQiU4BVidoAqCiuIiBQ6Y5pMBI=;
        b=Q5ah6z5omXJ0wTu4zT+tJ5aHVnv/bRpEOvVSomVaxXAmLBcFiprGEwLtcUI1d2EYe0
         z3TZodHRbX1TdkF3VvbQmkkKQjH+pWvHbZBs7OUMFw8LZ41p2qTcBqILCrstcFp3L5nD
         AXlrJsTawl95CCS+IRSuNboi+tH3yQ8vlswVFLVRSvHtgjHsuz8vba3EFZCSoPxn18nG
         IRGaAQvAIEZ6chLNBUrY3HkvdIrqvCqiKTWodaLNw7wt/4Pt2ZhoIKV3hw+R42mmKjt2
         mUh4TCv8+7uIU7BZLQrNvIzaDIJQWsmKhpjANy8BaPvpe4l7wPTyK6y0j+NdKQrrPqUJ
         Qs2A==
X-Forwarded-Encrypted: i=1; AFNElJ81UU6Aoc9lEDfAV845uZ6xw5L6B4laXdeV4ZmDUDPEl8f9H3SzqWdQ1V51vIWN0A2OI3skgjpY3sXoR4gxSc0nzwI=@lists.openembedded.org
X-Gm-Message-State: AOJu0YyUbIUJZ13es20K6XYABmh91xnIW3BFbBIU0v3xOY6NcU6xQtbK
	EJ3S5MTyvxY4A9dsfAVGwNJQ0tNz3Lv4rKLCEOGvjN/PwuHJlmO0SBQHVz84kERDrCuLb+pUbGG
	D4bqLWCGqDG2Vhqzao/LBqiCd26+UPksCblQaX++3Co1cw4+LyMJAbebjH9ndpfHvxCeALiiSpl
	KegUKOFmUz
X-Gm-Gg: AeBDieude2vuDJzTIdqfu3mTAb/JVd8f+7/1nDNSRvWjiKVdJ9HXp/Qaeo5ZdoC+Kah
	FS3jKh1GkqOG4pHlRJVhXzRkw6gBtqjLJKG5z5PzmFF9sNSh+EzfB48K2js9RsAdm1Wk8jju/48
	+az/+2K/CBzvv6dFEV9pLXhP6mMp24gL3dbSD9agZNdqEHVlUn+/5sCrwgvMLlOVkcRHgHw86Ku
	VOtGiSbJo3ClibQ+rV4JcyY6RjvkB8lYx+lgj7u7Cv+00jeKlendKyRYQvFUc5UP5kL/5P9h4FZ
	bNU/BQfE4XFK3U7yh2SEA+WnE2EdJ3lOE6MeLpdDhAAgigMIDOF7GKNaaUqouMrAldxrj0s7aJe
	AwoHLH2wDVG8RNLH5r1oTm0yyfRE6chWWtXIZHUpVHRlg7ISxyi3OdejPWgPa
X-Received: by 2002:ac8:5f48:0:b0:50d:882e:c5ae with SMTP id d75a77b69052e-50e36ebf6bamr248979501cf.44.1776759773880;
        Tue, 21 Apr 2026 01:22:53 -0700 (PDT)
X-Received: by 2002:ac8:5f48:0:b0:50d:882e:c5ae with SMTP id d75a77b69052e-50e36ebf6bamr248979261cf.44.1776759773331;
        Tue, 21 Apr 2026 01:22:53 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:7375:bced:4215:2361])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fb755938sm144887305e9.3.2026.04.21.01.22.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 01:22:52 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Khem Raj <raj.khem@gmail.com>, Bruce Ashfield <bruce.ashfield@gmail.com>,
        openembedded-devel@lists.openembedded.org
Cc: brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [meta-python][PATCH] python3-pyfuse3: new recipe
Date: Tue, 21 Apr 2026 10:22:47 +0200
Message-ID: <20260421082247.12962-1-bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDA4MCBTYWx0ZWRfX2KGDTbeBYA89
 qdSmkvr/nZYPH/dGM4nuKP3g2po8vQ8rQp8AiFAaT4KceQMM3kJb7aJs88yc9SaT78RylWJPAwb
 r66v2dibkxwoSBqmdte2mvyMpBJ1gls1ojkDVg6MwDuDh0d0VoQtFOLjrlyTs+NxL+djNbHvg5Z
 Y2VAlk9KG9wPAvgR1jrDWS6IQhnKdXoUJIqb8oIIG2N/zptkzGNL29ylHauCRfTXJnp3xDPwYlc
 2om+Ij/5QMS8GNyoozUvy45lKqAyIZj8KudTA5sTQ5cAFCwd2+lb99REi8UgjUQb+xbobELsiTn
 k254ZDEGTrtGoMcdpnsXIymsPspKeRs37VXJuuLTHgaEgm8j5zHDyjEKfWIpHQBe74L2+bgCpwf
 vTzt1PM4S1RW7pgxKLYtj+I3pQeGn9pD8PKLzelX7rBF0XytaRBrU7rTiU7XeneLkkU06x8z3R2
 debhzUQreSz8KmAPqMQ==
X-Proofpoint-ORIG-GUID: jdFZ_bb_wpN_aB5zutB7gnKvLLyu45UU
X-Authority-Analysis: v=2.4 cv=YOSvDxGx c=1 sm=1 tr=0 ts=69e733de cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8 a=qZtxwWahQDo9n0FDmtUA:9
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: jdFZ_bb_wpN_aB5zutB7gnKvLLyu45UU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_01,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0 clxscore=1015
 spamscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604210080
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 21 Apr 2026 08:41:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126528

Add a recipe for pyfuse3 - a python package providing high-level bindings
to libfuse3.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 .../python3-pyfuse3/python3-pyfuse3_3.4.2.bb     | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 meta-filesystems/recipes-support/python3-pyfuse3/python3-pyfuse3_3.4.2.bb

diff --git a/meta-filesystems/recipes-support/python3-pyfuse3/python3-pyfuse3_3.4.2.bb b/meta-filesystems/recipes-support/python3-pyfuse3/python3-pyfuse3_3.4.2.bb
new file mode 100644
index 0000000000..8ef6780788
--- /dev/null
+++ b/meta-filesystems/recipes-support/python3-pyfuse3/python3-pyfuse3_3.4.2.bb
@@ -0,0 +1,16 @@
+SUMMARY = "Python bindings for libfuse3."
+
+LICENSE = "LGPL-2.1-or-later"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=622e3d340933e3857b7561f37a2f412b"
+
+inherit pypi python_setuptools_build_meta python_pep517 cython pkgconfig
+
+SRC_URI[sha256sum] = "0a59031969c4ba51a5ec1b67f3c5c24f641a6a3f8119a86edad56debcb9084d9"
+
+DEPENDS = " \
+    fuse3 \
+    python3-setuptools-native \
+    python3-setuptools-scm-native \
+"
+
+RDEPENDS:${PN} = "python3-trio"
-- 
2.47.3


