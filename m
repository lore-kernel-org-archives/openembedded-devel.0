Return-Path: <viswanath.kraleti@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D986ECD5829
	for <webhook@archiver.kernel.org>; Wed,  7 Jan 2026 10:00:33 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2704.1767780030958065764
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Jan 2026 02:00:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=BgZTiK0S;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=jI6Gq4JQ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: viswanath.kraleti@oss.qualcomm.com)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6079dvEv2593341
	for <openembedded-devel@lists.openembedded.org>; Wed, 7 Jan 2026 10:00:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=YibOxan4VHmIH6iEcd1uQ9fX7L36Luc9zZ/
	ynvEiUWs=; b=BgZTiK0SPaEJMUWeWIv9vO4pbXycoK/YBk/TCuqCZySmpaO6asy
	5lz5RGYSQ4jjKbJucBrWrSlneoJaBUdQ9jJfP8bz2sqYFPCzga3OL0IP4HfSdgha
	FG7xYHzvSggimIQ/V3x2jXQFhmhrQpzbn8rvTuLwT2L9oBQGEXEUOPlmVajJA/rq
	88hHUIQT9y3QTnexcmeGK3B3ykPprL5xMUUUyYue3OqN3qxDoZH5AzQUq2fKa7F7
	TfAIhzyyeqRflLF3Fkrb1GlgnwpFLDwUYZhA9DsudQmBAk3r0HzQJipdxYAfXmG1
	ei9oqz55hXr5mzpqHjXQBdQ8gwWtbGJaFAg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhn2902cw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 07 Jan 2026 10:00:30 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7d24bbb9278so3731991b3a.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 07 Jan 2026 02:00:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767780030; x=1768384830; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YibOxan4VHmIH6iEcd1uQ9fX7L36Luc9zZ/ynvEiUWs=;
        b=jI6Gq4JQD4gAlgl/sNh4iMLieGRPOVFqeR5VZMk7EAyggDk0cSoujaVOXj5sHWsaCv
         iUMoSeMk3v0NsOkN5Tzumms8rjjHqYTxWyBlYdx3pSbTLKmVPE/Q/wESKp0iVhod+GjY
         KdHtHfMti/cqtK7f1Vf1/n9z6SgxxeOmQ32KRNsgtp/VJbD929KtDQAONgAwPXVAjs7q
         awOCxjMfgFeHTHE5vugTMiKJFUFDC4FItWeUM5Lf6fjEVYR6VxC9dHL3KfKo+sjYwv1q
         ARiUIG073Kb/QC6ts/C5r0NkG1xwoHj6MdZH1ubOMk8KPXuaXG4+1+1/BYA8j3adgYuQ
         tNJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767780030; x=1768384830;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YibOxan4VHmIH6iEcd1uQ9fX7L36Luc9zZ/ynvEiUWs=;
        b=XPVJP1YnipzVxwL7N+oRRy+BmNA0uu1nerrzdB6ZZM+MzufhNWlxuN0Yovl1x9NaHW
         OYOV5VbKu6tKFyaD9htzt12Hccxp8ptr8Ohsl8fzg7VXiLK605P+IpUwesutkXWU0y9Q
         Qw7UpUCxBnKzWNSAjc0TTEo92I8p9dxgn12vJ+iS3zOYJIk5i9IanFSpxvOHxqZZ/OWo
         HXZsW8luPsyJAsX1BFk/+ErhQjBM6AINM33BIKw1M8JYaM3957Pf5dVhxedYAUAF7moR
         TZUfb8J0QnuRNEn4LDqA4Fq+VpmqGB3Wkn8YEMaQtRDBFAjnqJwp0gwYNDsFMDPRIDG+
         ysdg==
X-Gm-Message-State: AOJu0YwjxBa6hRscH1Ml27QBd/apBAbclJCM+rwWxsZ9Mq3IIra/GOlw
	F2HMlO4JScjsBLIYokLIAa70kLTy+eLfbyJxp/Fk/rBa+w0qhJ9f/oiD3vK6oMs+iejloeBB893
	yDHYtH3O/QCrslOaI9Odjp2nVOkZSiUZl+7xBxXXBIYILsr8UJXwqehkShfRmMyPVi8UzpAhT2+
	WTWZu/Zx4FV4sLiTao
X-Gm-Gg: AY/fxX5VyyrJsCwWcprElOKh+arCAD/SNd83lvFAKfCM8E8p00Q6fEcCJt4KXJV5gT1
	+uxEzfQlo41lV5FCMngCTVbEMjgc3daGCO0bIKGsT08Mpq5xqZNeCu4IsJ3qQqcfN7T2ge+ZAAz
	3S/S+7vAFKLJx5yGED4zt9FDpnXyXaHQKLMvS2GU1rq/jXYYGcAmgfp/5pIKTa2pvrcA2tGkvV4
	QKUYmt9PIPSCiG9Qp26ooY+UhbAZ/sUi92akhHHLWd/cVQCxV0n6jfGCsZYBILJYtwviHVVO+fA
	Yy1Ba2Ajf8jg9BVGaggHXjS2EuXPnqmWxPaiDc22hkpktkwndHnWKP9/vuV6pVUQ2ZN0nSoFGGG
	p6A0ZV1H0xsPED3ztkkqmij7RPWzmvniSO2J68WpmztByp3pX
X-Received: by 2002:a05:6a00:4216:b0:7ef:1af8:8f2d with SMTP id d2e1a72fcca58-81b7f3f24ecmr2015350b3a.42.1767780029542;
        Wed, 07 Jan 2026 02:00:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHkCcwAzcpsLkooK6oftaQeqsquEGnoly8tqQ7pkstcD27iw9THu67urVQ2g4PKXYIXwfs3wA==
X-Received: by 2002:a05:6a00:4216:b0:7ef:1af8:8f2d with SMTP id d2e1a72fcca58-81b7f3f24ecmr2015198b3a.42.1767780027604;
        Wed, 07 Jan 2026 02:00:27 -0800 (PST)
Received: from hu-vkraleti-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819bb0de1a2sm4504161b3a.23.2026.01.07.02.00.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 02:00:27 -0800 (PST)
From: Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
Subject: [oe][meta-oe][PATCH v2 1/2] libqmi: upgrade 1.34.0 -> 1.38.0
Date: Wed,  7 Jan 2026 15:30:21 +0530
Message-Id: <20260107100022.2646251-1-viswanath.kraleti@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: s8Sgt8rlloKyKQoL6aQHq_OFAsAj21qg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDA4MSBTYWx0ZWRfXynuTe9Xc990O
 5w3LLP8SM0BOmCk5L8RR3S4SCWF/GWtNUIWuuxzRXXfC6AMb48NV0RwCm2c4a4BP2Ns4tBTm6CI
 3oDtm/qP6gs4yuNv1a6ucehMgjPH0wqRw6/NwFdL95sY0HtqfVjWVw46cxxIwJfy5KC4Xk48mpd
 Yi+qtldlFgxzSAH8MGkEQfDgSfrtFh6DDaUPn7MAMZNradDZQlwPUL3x11SFGfjbtdJRhSb+iy/
 Ds51D+EUG0MHKTAnpXzhXfalr235do8Ad4Z7tOLr8xyAFJ9CIiBF7iDAL1rsyQjLXnH8fb51BDN
 dy/8PuyXVeYf8lJb54X+LChNKg/cRyBXKhpL2o6QySo6TROY2VSUHBYLmo/GEYBs2kwEEc6wjMy
 Fek9Ae4S0E5mL8uC0wrHovzZUCerl0op577gz+LusKAjNhb2sxN4w5bpdJ20erriS2p/NxJYopG
 tIMtAgw/pgvAbA8KTyA==
X-Authority-Analysis: v=2.4 cv=P7k3RyAu c=1 sm=1 tr=0 ts=695e2ebe cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=QFtB4FFVfBaHzDooPqsA:9
 a=IoOABgeZipijB_acs4fv:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: s8Sgt8rlloKyKQoL6aQHq_OFAsAj21qg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_03,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601070081
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Jan 2026 10:00:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123196

Changelog:
https://gitlab.freedesktop.org/mobile-broadband/libqmi/-/blob/qmi-1-38/NEWS

Signed-off-by: Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
---
 .../libqmi/{libqmi_1.34.0.bb => libqmi_1.38.0.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-connectivity/libqmi/{libqmi_1.34.0.bb => libqmi_1.38.0.bb} (90%)

diff --git a/meta-oe/recipes-connectivity/libqmi/libqmi_1.34.0.bb b/meta-oe/recipes-connectivity/libqmi/libqmi_1.38.0.bb
similarity index 90%
rename from meta-oe/recipes-connectivity/libqmi/libqmi_1.34.0.bb
rename to meta-oe/recipes-connectivity/libqmi/libqmi_1.38.0.bb
index 8dc7ec3773..bf8c65ec97 100644
--- a/meta-oe/recipes-connectivity/libqmi/libqmi_1.34.0.bb
+++ b/meta-oe/recipes-connectivity/libqmi/libqmi_1.38.0.bb
@@ -12,8 +12,8 @@ DEPENDS = "glib-2.0 glib-2.0-native"
 
 inherit meson pkgconfig bash-completion gobject-introspection upstream-version-is-even
 
-SRCREV = "3f07d6e5b4677558543b3b4484ea88ad92257e92"
-SRC_URI = "git://gitlab.freedesktop.org/mobile-broadband/libqmi.git;protocol=https;branch=qmi-1-34"
+SRCREV = "e3d79ed3f7fdc6a7fa8b374860b1c23a8f172812"
+SRC_URI = "git://gitlab.freedesktop.org/mobile-broadband/libqmi.git;protocol=https;branch=qmi-1-38;tag=${PV}"
 
 
 PACKAGECONFIG ??= "udev mbim"

