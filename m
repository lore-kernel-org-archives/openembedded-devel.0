Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53051CD5BC8
	for <webhook@archiver.kernel.org>; Tue, 26 May 2026 09:56:27 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32787.1779785590951092411
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 May 2026 01:53:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=NVbTYJ0f;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=flStbKmk;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: wei.zhang@oss.qualcomm.com)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64Q6MQYh3263573
	for <openembedded-devel@lists.openembedded.org>; Tue, 26 May 2026 08:26:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=ihMDPgMS/WV52fzunN7aZLAgbwnpwF3+u2W
	mpHIPbVw=; b=NVbTYJ0f8IRzST57UP9IMDXUgMVgqFH+vQM0kXWq+atjrwtMx0N
	N7RwmoaIDIAzRDHtDXa9XN3CSsNSDFAkaFPNnQtsn2E3AuE0L1ZCdS0P40MbUMzQ
	BB0HfgJy19ooSE5RojVoytOWBNeL5yZAXoen+xOeoc/Ump9vE+toRFdbvrUNXUFQ
	kOkMpir46QcrAolvgsklKrF7kAfeWpn6lnJB5UGwgfDYh1j78MsrvpBQMjrizHXp
	5ClIP2b6ONRot90Pjtt503z6PkBFibfU8QHgE4oCyJLKB1hJ6JbG+VERm55R071U
	pyDRIw6YRL/QTF9pv6/nxrcPLw4awOxKxrQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecnhs3ejh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 26 May 2026 08:26:46 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3041ab826ddso9075237eec.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 26 May 2026 01:26:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779784005; x=1780388805; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ihMDPgMS/WV52fzunN7aZLAgbwnpwF3+u2WmpHIPbVw=;
        b=flStbKmkRhL2Ok9jBCe035989sAuzYw94fpcbMbVq5KBumKGBbJNyNS+ZOkSFptTEf
         y/KqSCUIGuWNhnW23x5U/yK8ozidJWqJCg2SofBaSXftH5O3c63m95dk8WubbF6FCBRN
         hgSQygJWjbGi9Lay/2HnoOxk2j0PoTBmct81GE9ZvKQGr51shpt4pQpgBNbhNAeiUQlX
         ZxM/eMNSA1urBA/MJ4kSrPrIzcQjzaRRmOGTqdsCw8aZXWO9av4Z9wRzxAZ/pybeiEjU
         RxnSofTX/ukL2qam1idnAxaylYTf3uNf1tChZtf/6y3LezfzfBd2YUW6cQiYAhQpUoAh
         T4VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779784005; x=1780388805;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ihMDPgMS/WV52fzunN7aZLAgbwnpwF3+u2WmpHIPbVw=;
        b=Fv0/c4IGceI2yvoIb3jo2aq1Sv2ggC2AbpMhdZ6WXeGLAij46Pc33ubtNZUHRMjFYp
         osO5uBo5GU9OI9133RUIlC+NK332DnqoxXmqDHjC6MktGxVgJlkJomANEyJvGeoZMzVx
         ZYzAjj3lUKI2ospapXuLSjxKQ+mb7dPMuMPF5O/lXC1vMPIHojYAXjy0dbOpC5KR/7I/
         +7dPohVrp7+0ylyTOrnsnf9JnuB7w4VjWcJFQRmrefw8AOAeCuP16wD2XhmWjUakWmR8
         +gYhK5b1XNgm4VUYcRQZKzEWZFKeDbP9H9OPx8j28vp/9s7CFOxX29XmK6AWSr/gOY4L
         u+3w==
X-Gm-Message-State: AOJu0YyiLlkffNxZVADg5p9MveXuV7ol5y+gdDPl40wPeGqGpTrMqfZo
	t3d9wsvJCXPMRDRD7WhrPuS1jJrUfYoOiL76h9nynbQ/Ut6YojAwvjdaAT0gHxLz7MuHDAc6kHe
	9AoV0/JY4SHhELs1Ai1Hposd0Ilu+ggzyLUMr/x1Iz3akFr/KeyQLIU2LyJS4jpJ65fdChgWRsb
	wPSbFqYQDuctyLr+ak
X-Gm-Gg: Acq92OFBKJaatm3owz7uQizBfzjRh+dUH2IKZPE3sdF4I5RtDGMrbm21oUwAWD+i3Fw
	feMxvAtKk4z9zKStpbcCVmW8XPZqmjsd/p8aQ7I99ANanjsxHJmRWOyNccC1Z0/trntyoyK7Dit
	F91Fj+l7xew1bWvjFKwifB7xVSaX8H+FDAoE12pXf37ujZamZsOx2WC8WHMxCJX6tUD1XklSZqZ
	2b0xzTr2WwMNIsL33C8LJq1frnROyqGQsx3PsQyMaxcZfi6XaCPK0zRjzWBqseKlCTt2K9AmSj2
	09DDhY+1Xza523V8HWEEQsFIOgThsXAztrvPMDrEVNomI2sEVixeQkrjBT/swJG49gGERD3qWso
	33IV9g+9IrytgQcXCqns7SjJInVday5ldu72GTKJMsleIshQf+NO0l/5pTjTps+AG+TdJn0UXHC
	ap9Q==
X-Received: by 2002:a05:7300:23cc:b0:2f7:d419:dee0 with SMTP id 5a478bee46e88-30448f36588mr8857970eec.6.1779784004911;
        Tue, 26 May 2026 01:26:44 -0700 (PDT)
X-Received: by 2002:a05:7300:23cc:b0:2f7:d419:dee0 with SMTP id 5a478bee46e88-30448f36588mr8857957eec.6.1779784004293;
        Tue, 26 May 2026 01:26:44 -0700 (PDT)
Received: from san-w175-na3-01.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30452461cb5sm14301588eec.31.2026.05.26.01.26.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 01:26:43 -0700 (PDT)
From: Wei Zhang <wei.zhang@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: wei.zhang@oss.qualcomm.com
Subject: [meta-oe][PATCH] hostapd: Fix clearing settings for color switch
Date: Tue, 26 May 2026 01:26:29 -0700
Message-ID: <20260526082629.4120984-1-wei.zhang@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Authority-Analysis: v=2.4 cv=Vd3H+lp9 c=1 sm=1 tr=0 ts=6a155946 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=yaAG3qJ-AAAA:8
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=SiN_I-OOOzVvK2OlotEA:9
 a=PxkB5W3o20Ba91AHUih5:22 a=oLVlbjkABFOu4cUI0CGI:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: JYfRICxOjpF1zyqqynyvz5p0MD5eEeAN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDA3MyBTYWx0ZWRfX4VaN6sObzcsj
 NZgIW/6GSiE/S8CdD3b+Oxfyu5ZvlaO1AU6YrkNPftsHLT83rrx5YUk4SMBKXEccL5FtgeXkQQi
 d0iK5AKLQrnmFQzNAify5/s9Ek09n+Lv6u1dQc5KX2erLla6APO9Mz17ANDn8T79mHl1wiYveSi
 7sNhoOOQdwrvLRR1veQbZrKJN+oRyz/iZXSieEWs3rAyBUak8mkEBYqG/B7T+xXqijuUH80XVPc
 S5wUf9vAqn7DFQKdi1sF/67Tfg5cGaMbtCTjvDh1IJ6zq6ikLW71X0t+vQBjQCbjv2rtPNg+sVK
 cvItjr4sm/GRh8354pEdw/kfZGb+ExxReaYYKAmJy2njeFUof92TUnU+LDUUgjfNXkEN3QCrbOY
 Fg+l5ykrRr9/5wj2I9lXOrxCdBa6E/LxN9OrFXzqZ7UkWFs0R7UtzVZ6+n8wEBB76My1DpT0vng
 ytBEJLO+jMsp7sPdZZg==
X-Proofpoint-ORIG-GUID: JYfRICxOjpF1zyqqynyvz5p0MD5eEeAN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-26_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 phishscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260073
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 26 May 2026 09:56:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127203

cca_settings is used without zero initialization, which may
introduce random values and result in invalid nl80211
attributes.

Without this fix, BSS color switch may fail completely and
the feature becomes non-functional. Initialize the structure
before use.

Signed-off-by: Wei Zhang <wei.zhang@oss.qualcomm.com>
---
 ...learing-up-settings-for-color-switch.patch | 34 +++++++++++++++++++
 .../hostapd/hostapd_2.11.bb                   |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/hostapd/hostapd/0002-hostapd-Fix-clearing-up-settings-for-color-switch.patch

diff --git a/meta-oe/recipes-connectivity/hostapd/hostapd/0002-hostapd-Fix-clearing-up-settings-for-color-switch.patch b/meta-oe/recipes-connectivity/hostapd/hostapd/0002-hostapd-Fix-clearing-up-settings-for-color-switch.patch
new file mode 100644
index 0000000000..5d6cce3f14
--- /dev/null
+++ b/meta-oe/recipes-connectivity/hostapd/hostapd/0002-hostapd-Fix-clearing-up-settings-for-color-switch.patch
@@ -0,0 +1,34 @@
+From 161327f91d956771996c96ea1b6e4e1cb8dc074c Mon Sep 17 00:00:00 2001
+From: Stone Zhang <quic_stonez@quicinc.com>
+Date: Mon, 14 Oct 2024 18:47:32 +0800
+Subject: [PATCH] hostapd: Fix clearing up settings for color switch
+
+Settings for color switch (struct cca_settings settings)
+is used without zero clearing, which causes the member
+settings->ubpr->unsol_bcast_probe_resp_intervalettings
+to be a random value. It is againsts the NLA policy of
+NL80211_UNSOL_BCAST_PROBE_RESP_ATTR_INT and causes
+BSS color switch failure.
+
+Fixes: 654d2395dddf ("BSS coloring: Handling of collision events and triggering CCA")
+Signed-off-by: Stone Zhang <quic_stonez@quicinc.com>
+Upstream-Status: Backport [https://w1.fi/cgit/hostap.git/commit/?id=161327f91d956771996c96ea1b6e4e1cb8dc074c]
+---
+ src/ap/hostapd.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/ap/hostapd.c b/src/ap/hostapd.c
+index 5ba2cab2c..90e93b6dc 100644
+--- a/src/ap/hostapd.c
++++ b/src/ap/hostapd.c
+@@ -4768,6 +4768,7 @@ static void hostapd_switch_color_timeout_handler(void *eloop_data,
+ 		struct cca_settings settings;
+ 		int ret;
+ 
++		os_memset(&settings, 0, sizeof(settings));
+ 		hostapd_cleanup_cca_params(bss);
+ 		bss->cca_color = r;
+ 		bss->cca_count = 10;
+-- 
+2.45.2
+
diff --git a/meta-oe/recipes-connectivity/hostapd/hostapd_2.11.bb b/meta-oe/recipes-connectivity/hostapd/hostapd_2.11.bb
index a6f7122847..ce1c145fd7 100644
--- a/meta-oe/recipes-connectivity/hostapd/hostapd_2.11.bb
+++ b/meta-oe/recipes-connectivity/hostapd/hostapd_2.11.bb
@@ -9,6 +9,7 @@ DEPENDS = "libnl openssl"
 SRC_URI = " \
     http://w1.fi/releases/hostapd-${PV}.tar.gz \
     file://0001-Include-base64-for-hostapd-CONFIG_SAE_PK-builds.patch \
+    file://0002-hostapd-Fix-clearing-up-settings-for-color-switch.patch \
     file://defconfig \
     file://init \
     file://hostapd.service \
-- 
2.34.1


