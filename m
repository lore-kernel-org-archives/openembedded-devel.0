Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A12ABD3C930
	for <webhook@archiver.kernel.org>; Wed, 10 Dec 2025 16:43:43 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.489.1765385020139320227
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Dec 2025 08:43:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=Y7pEj4LM;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=JLKMOFFL;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BA8e8ta1918679
	for <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 16:43:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=BYVG94WFwMM2j9DEHM/Gnl7CWtN0TF1kXhm
	tpMECE4Q=; b=Y7pEj4LMIJcrmuuZlTSNq+as4UmO8mZKkAnix5r5U1SKXbzJsay
	TLmNIGgQ/cx66/XecP1dSfiASzC3UYteYPHwCYhI5kcZNQwXBmNvjOSFjVtR3xnr
	ssUpnkYRtr7e6kYYo0+87tqsexStJzdbB/YfAXZDymM6cjstH0aOq7aFDxv+H3O7
	z+r1kXEpxsy4ksE6KzUyopIPpv1CZ+iWCscQPqCSmn3QqZEpGOt5NGixoB8g6a7I
	bV95CyUWsXxKDIalxktkO4DWEwIOSZbHyuHAQg7xU2pEYpauEwoi3565OcePxFS2
	pu4nxEUI4HAGEQbwOsAm8xypNXqJu9lciqQ==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ay1xp27tc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 16:43:39 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-55fc6725c86so65283e0c.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 08:43:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765385018; x=1765989818; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BYVG94WFwMM2j9DEHM/Gnl7CWtN0TF1kXhmtpMECE4Q=;
        b=JLKMOFFLnMaJHmsTxvV7raVFzGJ1TuhpO2y8RxsxPcUt/ISIjrXal0DTRCdjYMQ8mf
         b4xzbS/pLilwW69A/ECfU4ZGvE0qYKEFypYzeBPy5tqIUOIHL9SvsnERA6CA7r3cXD31
         JCt3in+T+TutSimjT4iCzdtvM5YUqXlR0ErwzsIqfVp8Q49E8o9lYKykjJF/bz39K7BX
         +9Kw6ONR5w3Sa4mdSU2yWcQzn7Hex49HNlBgo+mYQrbqdYK5kl0Im4o3YrRJ1FYObAGe
         Zg1v+DvjzoNdoS8LId9jXkylhXyIk6ZhCFpQruDhoByjQb5msbg9a/zX4eNTvziA1idB
         MXFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765385018; x=1765989818;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BYVG94WFwMM2j9DEHM/Gnl7CWtN0TF1kXhmtpMECE4Q=;
        b=Oxs3X95cTuXFVn9wpDWVIoLpXXAb0J4tl2p2xgkkn8gEq2ETnvTSRyoYlNScCr2LLR
         r7Ub2P0A2PBvCKaSnDeAgFlcLRKFqFEyAdOudOmi4OJGQDyEnjrSLdIlgNZBO0frYOiJ
         TnrwajhW8CjNhYSfEbgSZC5bVha7Jasd5QxRN2J2k8cAdQocqFq4r4OQg8Lq5ME25wta
         F1buDLmy/J1TfoUTabi1yGpO9tDgFcunfpXFTt9wgOOlqwIPjtvJWGA3IKd3RriBmvI9
         oyIyk/jwWIJDfBlhx6xAOPaGgM8sXYD8Jk1ihcjJ0ygqwuU9sFG/+gvNJKLyA3HmzCuo
         aLeg==
X-Gm-Message-State: AOJu0YyHXYZkuUJplJqI5D+kdKSiZUNs8zNpCX+8y0OyqBQCUspV+zNT
	ZWXAqJ7DUJMLhIRm/S4C/2N9KX0dideIqRz9iIetknkOx9TidcoIhi52CVtzpXyPSCBVGXE5gZf
	ketfqd/g8MHJac5+vESNSKBvxcvITn2GmfJxX3h/KbMwVudQzlNfGhf4q0lA7yoAsafBaXFEpF9
	T80O/4l1COTrN2x8Jf
X-Gm-Gg: AY/fxX5Ju0ypMRoD5NHuBs+CT8iuMmETzz4Txhjz9k9zYwHcYv9vxmXwYjsEPns0ZMR
	068UDXZuQeewP7OWDnTbSd1HAnyH9pGvr9WNJHSN/0FU/DCNteXNBf3sIwKbBbvDU0wPH2k2EvK
	Itf9jSIG0ft7GwnzvYOldR+fXTfjxC7pmFZCKrweHUETRUCecc5mR/AnxQNgznxFsBnsNqC6EN4
	cKu4tjHzQaidIjXoFxKf7NrmY11WQimhXQfzAZE+goN9/61ejPj1mTG2eNHJFExgLIzbgRujJLl
	DEMYV8LQJJtc4RFal73fNnWOTv8XDLCeYhgCvxVgB8wX5WuI65OyjMMiw33rHjG+ikaSCb26cY8
	VIuXti8R2nNe7AAwTCIFN4VViAFE7AgJqf4uo/64pAELb/rBHOQDN4tHOCt5URjHpwBUNHlSGAe
	TnCsM0QhrfaJGqft+ObnLPEKU=
X-Received: by 2002:a05:6122:20a0:b0:559:6b0c:1ca2 with SMTP id 71dfb90a1353d-55fcfc4cacbmr1167458e0c.16.1765385017817;
        Wed, 10 Dec 2025 08:43:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG1OSXnLWPxBhdl7BSni76HYDYuKlX8bHzMzKpAa7Wgrwnz8f07l2nXIo+PynXGBb/GK4Nv8A==
X-Received: by 2002:a05:6122:20a0:b0:559:6b0c:1ca2 with SMTP id 71dfb90a1353d-55fcfc4cacbmr1167449e0c.16.1765385017366;
        Wed, 10 Dec 2025 08:43:37 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37fa9bec20esm16433201fa.23.2025.12.10.08.43.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 08:43:36 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Pulkit Singh Tak <ptak@qti.qualcomm.com>
Subject: [meta-oe][PATCH v2] opencv: fill in missing FastCV gaps
Date: Wed, 10 Dec 2025 18:43:35 +0200
Message-ID: <20251210164335.3567408-1-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEwMDEzNiBTYWx0ZWRfX402+wUGLrzVh
 mGG71gfIXwwOj1k6b8b9Hh2VCC848cFttoNToHgRVRpKrd6Tk6JsNrnAlyNOMyPAXDBpRy1KtLb
 g+ObPeq5IFnaYrwvMl4CEw9sW6jcUExElyPommc+4AJFkfS8UgbHtGQgm1aJtQVxrZSIssIQTEZ
 lM5UBsK9+H93YBMRO0EaQuCKtiP/X+SaN553om1403wSPsEvX1pDBc/lnt0E+D6Z+Jkik7/AzuJ
 3ADweHopy+NkfEYxgEuqQKv3ZZkU7UO5lW/rQV3chVsbU8h9kEA/ZfwxLf3B76gurDUJzN3pZ2J
 wkRiXS/Hwk/cixo4nDE7O80NUPBfLWEUdtG1EUxRLWOTuVXJYZ95ot71OKqXbmrT4OBGTiYHGfQ
 o8zhY42BIRR5JsYsv2u1jYdvJVXXoA==
X-Proofpoint-ORIG-GUID: yNmL7ZQPxzsYNsfx3mN5dbk9KCETCCq4
X-Proofpoint-GUID: yNmL7ZQPxzsYNsfx3mN5dbk9KCETCCq4
X-Authority-Analysis: v=2.4 cv=A/Zh/qWG c=1 sm=1 tr=0 ts=6939a33b cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=Selk-fcwuKjAfKUjrewA:9 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-10_02,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 spamscore=0 malwarescore=0
 bulkscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512100136
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 16:43:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122561

When OpenCV is being built with the "fastcv" packageconfig, several
OpenCV libs are linked against the libfastcv.a. At runtime this lib will
dlopen(libfastcvopt.so.1), providing a fallback to slow algorithms, etc.
However as it is dlopen() rather than dynamic linking, there is no
runtime dependency.

In Yocto, if we enable a feature, we expect that all runtime
dependencies are pulled in. Utilize the qcom-fastcv-binaries recipe
provided by the meta-qcom layer and pull in libfastcvopt1 package as
required.

Cc: Pulkit Singh Tak <ptak@qti.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 meta-oe/recipes-support/opencv/opencv_4.12.0.bb | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/opencv/opencv_4.12.0.bb b/meta-oe/recipes-support/opencv/opencv_4.12.0.bb
index aa11d3da43fd..b8e83cd6be06 100644
--- a/meta-oe/recipes-support/opencv/opencv_4.12.0.bb
+++ b/meta-oe/recipes-support/opencv/opencv_4.12.0.bb
@@ -122,7 +122,7 @@ PACKAGECONFIG[tests] = "-DBUILD_TESTS=ON -DINSTALL_TESTS=ON,-DBUILD_TESTS=OFF,,"
 PACKAGECONFIG[text] = "-DBUILD_opencv_text=ON,-DBUILD_opencv_text=OFF,tesseract,"
 PACKAGECONFIG[tiff] = "-DWITH_TIFF=ON,-DWITH_TIFF=OFF,tiff,"
 PACKAGECONFIG[v4l] = "-DWITH_V4L=ON,-DWITH_V4L=OFF,v4l-utils,"
-PACKAGECONFIG[fastcv] = "-DWITH_FASTCV=ON ,-DWITH_FASTCV=OFF,,"
+PACKAGECONFIG[fastcv] = "-DWITH_FASTCV=ON ,-DWITH_FASTCV=OFF,qcom-fastcv-binaries,"
 
 inherit pkgconfig cmake setuptools3-base python3native
 
@@ -165,6 +165,11 @@ python populate_packages:prepend () {
         if not pkg in blacklist and not pkg in metapkg_rdepends and not pkg.endswith('-dev') and not pkg.endswith('-dbg') and not pkg.endswith('-doc') and not pkg.endswith('-locale') and not pkg.endswith('-staticdev'):
             metapkg_rdepends.append(pkg)
     d.setVar('RDEPENDS:' + metapkg, ' '.join(metapkg_rdepends))
+
+    fastcv_pkgs = ["libopencv-core", "libopencv-fastcv", "libopencv-imgproc"]
+    if bb.utils.contains('PACKAGECONFIG', 'fastcv', True, False, d):
+        for pkg in fastcv_pkgs:
+            d.appendVar('RDEPENDS:' + pkg, " qcom-fastcv-binaries")
 }
 
 PACKAGES_DYNAMIC += "^libopencv-.*"
-- 
2.47.3


