Return-Path: <ricardo.salveti@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9824BF9D0FE
	for <webhook@archiver.kernel.org>; Wed, 15 Apr 2026 01:54:14 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9889.1776218045130121325
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Apr 2026 18:54:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=HvIDV9up;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=f5UTjbAM;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: ricardo.salveti@oss.qualcomm.com)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63EHqDu82071432
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Apr 2026 01:54:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=pyjht4v3FQyJAVLaWN9yD4h0Dip4teQMDmD
	VsEl6XKE=; b=HvIDV9upmEWo9QPWLoo1coj6YALElKYoVffFCcf51haDoNo6KBD
	bUtmmVVrzoCIkg9wwE591ciDPSdYg8/v1uV4vbGLm6BaleRsw+UIMKAeVlp04w+A
	IJC3lc7zwKy4QWBM7VA1DxBobIJLKYoPY5B4WIN8tAzbjpvsduDxrM+Ly3lDNt6O
	8AeLMjEhFSCOh5kn0Fz3gkWENlB9VFvEYIDmeJEfnlB4Ver07IGaCf5rpc0gBZtl
	z85ZrLp6lD5uJIsvJN7pNGaQqRXVgDwNcfenm7NqeoYgAT5DDEce7D/ltk/0BKfB
	V+z7stfxsKk9CSnmhvPKdlGb9HocxEJDzbg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dhtc296b0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Apr 2026 01:54:04 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2bdf75bc88fso9442483eec.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 14 Apr 2026 18:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776218044; x=1776822844; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=pyjht4v3FQyJAVLaWN9yD4h0Dip4teQMDmDVsEl6XKE=;
        b=f5UTjbAMBWaQGEG8QCgfwq2ZB5/69t9oa9vp7EB7QhFgg+urJ4ThvvGo2xLGCmBwwn
         zgfINXe9r7ZuWAI4UqUONqQWnnlmO+7pnhWf7J6svnrmDj9HykU8aFGKKT6u6UkC4e3X
         JDzYBrgizlcxkkGY+Ycm1FrCi1HN5g+zu6Tf+RbYWmUeKGqMpgYAnr3nt5e4fIKVLxF8
         99twishV24BPWJi+GssCCL8uWvfoidep53IqRrzI78zHaFjH3steWBgLqMKCminvWpRp
         Sd8V8gFLwP3p86rDcmPuDf2UnBdUVLzlLwv5vobQk5yhI7KjlxvhJaNkY7UMFmVzCMoG
         yJLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776218044; x=1776822844;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pyjht4v3FQyJAVLaWN9yD4h0Dip4teQMDmDVsEl6XKE=;
        b=n1BU72ePn6F1mVITrTI8SbDN7YHIOP0+G3vzYuxnqj6j3u22eVKW8NgKAOrbTeccOt
         M84EMb5XkCTgdvySmnm+HFOz8yK5hmu+SsLytGty+vJgOsgCwO2bvZ8/ndjdrXG3SuL7
         NeyRHROXtflPN/ckPzM/ibIW+yWCqzCbD5U0ii1nP3TjfAqqp08Viv0tkIS/LWQZ5zbn
         TLXvSVM2S8ohksp/WmmzmYg2txTmt1SMwI0NN5Q2tpC9ar/eXWpMi43alykTEZD2mmvk
         bQ/SCc43wtuEDTtZ5p3Gc7EtCGJ0Ee984oTrNX3UtPn6FOq7+p0065/cqYTTS7mhErGH
         /AQg==
X-Gm-Message-State: AOJu0YxYWI0ZsVnpMjpFWhQCAA71LkjgGNQaQ8MdB7kKyfxTUBbNEtDc
	Wv6tuKdv13Dj4RE6g0LPoMRDMlm0r9tnT1xWF5bvg2IEIq3uXy2t7ZKwFAahSzt8WoSXmjwt18U
	kWPKqXBRdHWJDZ5Zwmsu2VrRXcqJs6/98m2h1u+cMt9VFbKx3A6ixTvXBEduN5sKFDqKBTf8abh
	w8aYsnMepwmmFHdo9Q
X-Gm-Gg: AeBDievQavGeGyVtnAmlkx/jyJfxmAa9/JI8Ep7LWg0+DjKjXzhBKURo2aHuxzK5lJl
	NfGhr47mJRTVUdY/gcC2m2yPlahJma3GuYJ3wK9EHRjrGUowjtzMPou9yZZUpBbiHxmgkKOxPim
	mCjrl4Bnx+twNWNMfC6rK/bWCHGUCFs2aDylHexgYo2x1nlrDso1PuMOY0/kR+84D3Z8EvPG566
	aQyRqiaQv/5qKc2ue8tFZH9bY03kltT+cVGOrp+w3w0/cotFO58h7ytI85djN2Gsqzp14B8ZKNn
	ucaLgtlVWXCLT6ZB1e0zjYaC6KJN/w78dlXuzRixg/cO5uxzdGJpVbzTpdgDo+53MJrDBOdfLRU
	BNnKAQg/Lbi1PNPSwz2cVaCwjBuIIew==
X-Received: by 2002:a05:693c:2c85:b0:2d2:cf9b:ee6e with SMTP id 5a478bee46e88-2d5895690b4mr11989395eec.22.1776218043544;
        Tue, 14 Apr 2026 18:54:03 -0700 (PDT)
X-Received: by 2002:a05:693c:2c85:b0:2d2:cf9b:ee6e with SMTP id 5a478bee46e88-2d5895690b4mr11989372eec.22.1776218042755;
        Tue, 14 Apr 2026 18:54:02 -0700 (PDT)
Received: from evatuf ([187.65.214.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2de8eb848b8sm545179eec.16.2026.04.14.18.54.01
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 18:54:02 -0700 (PDT)
From: Ricardo Salveti <ricardo.salveti@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] mosquitto: install default mosquitto.conf for systemd compatibility
Date: Tue, 14 Apr 2026 22:53:38 -0300
Message-ID: <20260415015338.1477469-1-ricardo.salveti@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: v91bpVkNPy1wIC8yYI4nYsiSb_Dymlbb
X-Proofpoint-GUID: v91bpVkNPy1wIC8yYI4nYsiSb_Dymlbb
X-Authority-Analysis: v=2.4 cv=HpNG3UTS c=1 sm=1 tr=0 ts=69deefbc cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=5XGjxTY8yYkUmB1D1iF5Cg==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=9aEU_u5yYVcHRMmgzx0A:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE1MDAxNSBTYWx0ZWRfX2FP61PicWGH7
 GSQc3Z4uj8JTk0KDOl0QYVK96oLA2YucbEaVmIPk5Pdv9jRiYqILrUN0uN9LkYmAdXYYfmqkfX5
 1UoYa5LWX9rjhQVg/YorFsRXQV634mXmK5Nw0hFeGkfhruTYeQ5Rbaa068zWh+piw1c33Zw05mR
 TMZQpKeGtx5ziV8/j6RmrSMjHj01zTTXXc36br49RcC2s5ME1Zqw3TCdx/wD5jHgixLhstSW4EH
 suo1ER0RSDib8OTDwk/MlEbr2887Q0ySc2sCtsXRAmLwwKVmiE7NLV/n5DXKhrSvfAhMNsd8tka
 BaAoYkpwUWLjrE3uaKx9yiP52YipPrUtWtviFXw01CDDHlvDQjelg6jaUMIL/6GhgsOt0C3YenA
 BM3MJHGQV6AFL82uj2A3P4IEfHvIiZCTO3kK4coI1C7/fpTMdAhAjhmCgQgt00cutL2xvOhYco6
 8CJrd2q3zul3+q6rz5w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_04,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0
 bulkscore=0 adultscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604150015
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Apr 2026 01:54:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126340

The upgrade to mosquitto 2.1.2 follows an upstream change where the
default configuration file is only installed as
${sysconfdir}/mosquitto/mosquitto.conf.example.

However, the shipped systemd service explicitly starts mosquitto using
${sysconfdir}/mosquitto/mosquitto.conf. If this file is not present, the
daemon exits immediately and the service fails to start.

Install the default mosquitto.conf alongside the example file, using the
upstream-provided configuration, to match the expectations of the
service unit and ensure the service starts correctly by default, as done
with the 2.0.22 version.

Signed-off-by: Ricardo Salveti <ricardo.salveti@oss.qualcomm.com>
---
 .../recipes-connectivity/mosquitto/mosquitto_2.1.2.bb           | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-connectivity/mosquitto/mosquitto_2.1.2.bb b/meta-networking/recipes-connectivity/mosquitto/mosquitto_2.1.2.bb
index 6a6e554453..8bb6c9009d 100644
--- a/meta-networking/recipes-connectivity/mosquitto/mosquitto_2.1.2.bb
+++ b/meta-networking/recipes-connectivity/mosquitto/mosquitto_2.1.2.bb
@@ -57,6 +57,8 @@ do_install:append() {
         -e 's,@LOCALSTATEDIR@,${localstatedir},g' \
         -e 's,@SYSCONFDIR@,${sysconfdir},g' \
         ${D}${sysconfdir}/init.d/mosquitto
+
+    install -m 0644 ${S}/mosquitto.conf ${D}${sysconfdir}/mosquitto/mosquitto.conf
 }
 
 PACKAGE_BEFORE_PN = "libmosquitto1 libmosquittopp1 ${PN}-clients ${PN}-examples"
-- 
2.53.0


