Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C81D4CF31BB
	for <webhook@archiver.kernel.org>; Wed, 19 Nov 2025 12:34:56 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5831.1763555688410517601
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Nov 2025 04:34:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=VyNOeCFr;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=ACwRqBFu;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AJBtXjS1031511
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Nov 2025 12:34:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=qeU9uruF+o1
	lhjJr5uAl3lzSHC0OC8qQNgvlyS5bIOE=; b=VyNOeCFrhM/PxHhyC0eoL9xAFhI
	4CV0j9aKRUBANgN82+OUn9tK+hYOBVbKJcesLKohiBCxscrRH6YplMnXznlWKEEs
	HHVUxZpieGK6eODm73rd3ZaVryEY9bxc+cyum3wU8ZParH6lB6NPESH8/5MDRJgz
	3mSQdtehg0d8hcr1l0CX40l/KFzhnwFmqfKwyiL7e+OnCx3mAxOKQUZvu6O2CZN/
	c9J2COaQH4KqDdgTFiOptXkMQ91ldy9LT6EH3YhTnJma65tojeHEyViP+BgcrHlU
	JnGBN1+75/sVJvyrc4BwyxmvJTBkpoYFPd/PjPe3Qz2my78JYD8q4Ff4jAQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ah7ansam0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Nov 2025 12:34:47 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-297dabf9fd0so88039215ad.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 19 Nov 2025 04:34:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763555686; x=1764160486; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qeU9uruF+o1lhjJr5uAl3lzSHC0OC8qQNgvlyS5bIOE=;
        b=ACwRqBFuv81r+FIUjjKxV6JiPPVVoZ7de34dSpyQmHC8gkEu3ixRskZnF7L5Kjb7Ps
         OXaGE+3oRXNCxUiis+t/1qnfyLd/G/C28BLd9BqTL2MQmk8ZglVVlpjSmkEKm5ZmiqZL
         Ois5W9SHAwyn4/VsHQRHSU3opfpRnZKQWrlQKS9Lpnk0DJPNogfZTcblTGT6ttfdOEhR
         q8Y/7muR4Mtwr6+ldDrto3+3GnJWl6z6q0TfOYl2SEab5XKviWn2FLnD+5vCoUNamgC2
         /PKWfuEGlt7fYMomdPdvePK9PeBlxAnGv30xuHmGlvg07GZtDo9LK0qxwTd/7UVtwkXv
         Se+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763555686; x=1764160486;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qeU9uruF+o1lhjJr5uAl3lzSHC0OC8qQNgvlyS5bIOE=;
        b=kgxo2M/RMv+fNeRl0aUGEPMT8XkbGzyB7DaibyVuJVAMScpBs7qSgD8Xpr76DnMli3
         UaRJGLrIk9TRUEgls+QI5hfplnIFI/FSzvLhB3iu/yFUT5ptQvG6qpPdi5xvuil/jKjX
         aj+WQWGUSXWR8Qdx7GP3z6UZbnmJnFtv6avphyZc68j1BQ/qDqtkDKkFuKam6s3jsAmc
         mv2kxoU1H2OHlWi6eihcyTwh3xXjqVC4ss0z3SZggTErE3Y338BAKsI+Z1/ekvVctaDF
         jygQIVjdzgZn+DopMbmCI7GmnPeYnfOw26wHd+e9EtVSocnkk80SfkzG0tf5MiTC20z5
         pU4A==
X-Gm-Message-State: AOJu0YyiKInyvaQDQeDkN9GE6CfMZijruDzb7SAtnwdVljgEO8yXK0RR
	NfsIYkdXDx3lg3bdBQGU7eC0PsYUKiTsXqmNFCj9TwvdJZ0eFI7mtHW+6kycwEOgK08SxEWp5BW
	rI+52WifyOjllNYED+QloV9uNTMQQaokl3DoFrP4KacK8tjJuJgU56O7ZgUH5iAQ83PimxR0Ehw
	9yJxNNwujlidbRSCv7A6c=
X-Gm-Gg: ASbGnctniKSXM5m1NsaiTx3rSFp2IhvDlqB+We7IjYgVYig0T4diO2tgsTuhnKu5IAK
	p95Ahuk1hDMviH7B5nSQFeMbixXXogPG25OhsJ4ZjLDextF+N5xwyfvXMM8cADGktth7qdEg4QV
	D06HcgXGye0gAeCD+LFOh4lqpJKWv/RTs+IAipUx1jguIoUrR9Uj00YqspOWG/gXw3DTiiy4sR5
	DCHqQHgMjdoVr9AcbRb4eL5xmFA62N93LKgn3O2FmDusWjeaDCRbXI+kI9QeRGVKdt2Lh1wHS/H
	LkehhkAQzp3d29sOxeRdFKuqjjo3XUTDDPZ2Ib5LGEh6mwCM9sUgD1eje4HH63UatpS2TDS/pfp
	oX5bn448CsondbhkPrnLmq0WpIB8OlHYyNBFgHed1
X-Received: by 2002:a17:902:d4cd:b0:299:dd98:fac2 with SMTP id d9443c01a7336-299dd98fe08mr148742915ad.54.1763555686516;
        Wed, 19 Nov 2025 04:34:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHzUxUEYiQ6Q7V1d9roRKnbI235mmfHoZi26zbW51EKWKf8sV9UDUUo+yZrg/0pxjKAk9hjaQ==
X-Received: by 2002:a17:902:d4cd:b0:299:dd98:fac2 with SMTP id d9443c01a7336-299dd98fe08mr148742635ad.54.1763555685908;
        Wed, 19 Nov 2025 04:34:45 -0800 (PST)
Received: from hu-anujmitt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2bf158sm207999915ad.91.2025.11.19.04.34.44
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 04:34:45 -0800 (PST)
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [scarthgap][meta-perl][PATCH 3/4] libhtml-tree-perl: fix QA Issue: TMPDIR [buildpaths]
Date: Wed, 19 Nov 2025 18:04:36 +0530
Message-ID: <20251119123437.2192091-3-anuj.mittal@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251119123437.2192091-1-anuj.mittal@oss.qualcomm.com>
References: <20251119123437.2192091-1-anuj.mittal@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE5MDEwMCBTYWx0ZWRfX0zFKVhjxZnF3
 zRdKvuXDUiGTP7UtmPiJqZFvQgKu3FtA9gxU6uyk8RqaaATG9ijdLB4NbuCZfXxg3NLSOsW40Ou
 T2AXSSAZl/VWcYNkjB4RmTNvLARRdXwOvXE+ojIcXO7pQVNIoN6dwcfmVeOJXHC7L4nsJw6DBjc
 JupQW9RgdXWAEwW13xVxGCxkcoJkyWUMPdeBocPpozWwmHtZ1EVwHYVDaU645jXpOG6Xk/+/H0W
 wrysXXZ5wojzNnDE8skD27K7MzC2jPqtqnZeDVqggklw8oemonBGUGmQGjmmJlnJfh3xH9xpZou
 hm9pr/q/H8xndv3cYYZPt3DjbYGVnwbKboD7CaQZh0ULJpTvJOtsdodKnGnG5MuI6E6xlfXhCl/
 q/kC8dhUncjfrdmi4JsBLoO6xlDssQ==
X-Proofpoint-GUID: 1kN2LkmOaOwY7Q_dti0H5Fsief-V1_Vi
X-Authority-Analysis: v=2.4 cv=a7k9NESF c=1 sm=1 tr=0 ts=691db967 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=hBHHM6O90xYoy2umH1kA:9
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: 1kN2LkmOaOwY7Q_dti0H5Fsief-V1_Vi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-19_03,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 phishscore=0 bulkscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511190100
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Nov 2025 12:34:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121902

From: J. S. <schonm@gmail.com>

Signed-off-by: Jason Schonberg <schonm@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 5f471132db6df673bbc2c9d7e03f3a049401cfa8)
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
---
 meta-perl/recipes-perl/libhtml/libhtml-tree-perl_5.03.bb | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta-perl/recipes-perl/libhtml/libhtml-tree-perl_5.03.bb b/meta-perl/recipes-perl/libhtml/libhtml-tree-perl_5.03.bb
index d2c151bf5c..227fa83fc0 100644
--- a/meta-perl/recipes-perl/libhtml/libhtml-tree-perl_5.03.bb
+++ b/meta-perl/recipes-perl/libhtml/libhtml-tree-perl_5.03.bb
@@ -26,6 +26,13 @@ export PERL_USE_UNSAFE_INC = "1"
 DEPENDS += "libmodule-build-perl-native \
 "
 
+do_install:append() {
+  sed -i \
+    -e 's|${TMPDIR}||g' \
+    `find ${D}/usr/share/doc/perl/html/site/lib/HTML/ -type f` \
+    `find ${D}/usr/lib/perl5 -type f -name .packlist`
+}
+
 RPROVIDES:${PN} = " libhtml-element-perl \
     libhtml-tree-assubs-perl \
     libhtml-tree-perl \
-- 
2.51.2


