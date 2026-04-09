Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0B8EF31E53
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 15:57:47 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.131603.1775739762156058443
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Apr 2026 06:02:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=CIwOZrYl;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=R5q/Xydl;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: bartosz.golaszewski@oss.qualcomm.com)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6396WXEq1924490
	for <openembedded-devel@lists.openembedded.org>; Thu, 9 Apr 2026 12:33:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=fvRgtLO815zDFJgZyDpriC/0v8psjxpEhi8
	H8wqhPEo=; b=CIwOZrYllm37f8dkdBfOsdi4iVvE3KXmNM0b8E+dAlxrIpgR39+
	26NEuY8QewDNZwXTxs2SOAZqZI5WaC02YyYQSE1LEBLVylS+UHsokEGAgTUFprfR
	aaKDb9y20jAroetKMNlvlL+GzLWgOA1ZajQKz+gcaEG04AVrgOw0yiOQm+ZYgUFX
	8j5tjaYMRNBwPlm3si55VvSJ+jJV0DANVwv17tzbIgszyqD+Nze4pHuIGMxoafJE
	1GzZoOLVphez4va1mO3e7wHLs4u+ofSStPLX5tHsDzo6mtpHS8nuLw9IRKU5s09E
	AYrbLEDR4BjjJ5HZCEIVNIcViNsFOuajl/g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ddt28v3pm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 09 Apr 2026 12:32:59 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b4ca7e7c2so18439631cf.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 Apr 2026 05:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775737979; x=1776342779; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fvRgtLO815zDFJgZyDpriC/0v8psjxpEhi8H8wqhPEo=;
        b=R5q/XydlyPShXyOVEH96zaZ39lnFQGEozjvWobUdirAgqNX9CxvtXzFfnECisZEofi
         UCTOOkztJyZKG8im9NbABBu04xhycxnNs6L+fBf0ZNKgih92cQo+bKLXQNfd8tQwXoz4
         /6iujMeDSJ50bBR9sDv9GxFUMSNcegTDVQ/4eznOehOuxSlm6tFeUqR8iKxgMm+tj9k4
         XOlgwLsb2bMzrAS2HZyuRZTbbAO2mT5G3+Xkj+3eHtoU4J9EAumAAKI+7D1rRzYSaUW8
         tbeYeFq7GhSd8Fr+kMuPVh0bnbR2KJMzsmN38QIa9/I62/HFJPJDbkxpR98LYkOkhdg+
         7TIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775737979; x=1776342779;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fvRgtLO815zDFJgZyDpriC/0v8psjxpEhi8H8wqhPEo=;
        b=ZUgmNsUo5To9DM+Ep7FiricXGtIDW5XI68TTEHNWjWrSp9TYIESG8jFtCJztHfA2LL
         6uJ4lzp3ZZW3UnYdLeh6HrUATHZxNxbIV4YDly6TJcXZrwsCw+UGcHq0F3PrsoC2ogJl
         PCJXnfLzR4WxHnqv9kXxagMRKtXpbXxU83AihsjDm2tFYIJNQw9P+j6REr6Fu1BIC430
         pao5qe8B3SEzhgFQxCFm0nY9HFTQ2HZrv+YWmalyduL/qMLeRvgkBcCeLvq+Jitrz/8m
         NcK3KwuxHB1dtbQHdDUp8hXsXJr+0M9mn/iFAXBV/EIQfVNKq/T5p/+WiDRarICI8RgD
         kMbw==
X-Forwarded-Encrypted: i=1; AJvYcCUZwOpuPQD28K+7tpvWvuqhDodgrLjNnITEr1a1zZlLb3VZ+KMPQrxJ7mvFCgMLSa5dq0ZPlllb1uQVM+IdZ7+FbVM=@lists.openembedded.org
X-Gm-Message-State: AOJu0YxfPsaKc4miQ171R8d0mvi0WW3HEvaQ1u4va3W8hd1r7WytVkNo
	iAuK8n81FHER/HiW4qICbCoe2WH13Nv9BMXriRwxsmJKxGbCEuLj+dI2ji1mTD05QXPsxHsmclm
	2KYKv1RFuAZfDghF5T4nJEREVG9gg0Pw5qMD+Rb1t2oCmZtcaFcZv11G4JAG775bMDQep9XUyHn
	vMJEGiEYz7
X-Gm-Gg: AeBDievokvxRZVdagHFo4cWSQKWRWA8fvKVM64mCieEyhZoNwIZus0wRbeNsx8pCoZ4
	lk6WsMtUJIKvBOPQx3euHaNJhbQRLi/57gGCHK6CvCUASupiOYMR8qU8DwdS/HE1Wxj2mpjTG/h
	hFYl/ezB2G72+JFDqBjCFz0kLHz/WTpUyS1846XRCmURseuw0Fm9sD9QKAbvKzAMgN94KOEkJqo
	KCnkbd5JAgBor8o8/8u83JIhO+EvdP8pPoajfzwuhACSPBnCu4sZqv3lmM5YrbDj/xgX8fZZ2vK
	kk6rtGjmdIG4oHmoxwQXs2hg3kSwfijmBGpZbutX21CWs5j0FathXfLm30xCa+G/tj4Z99NbiCz
	v8FJzEgivej44gqNyCENi+NHnIa090H+d82BpUEaa4BwO2eq8Eg==
X-Received: by 2002:a05:622a:22a9:b0:50b:51f7:c660 with SMTP id d75a77b69052e-50d62cc262emr369547211cf.61.1775737978933;
        Thu, 09 Apr 2026 05:32:58 -0700 (PDT)
X-Received: by 2002:a05:622a:22a9:b0:50b:51f7:c660 with SMTP id d75a77b69052e-50d62cc262emr369546581cf.61.1775737978458;
        Thu, 09 Apr 2026 05:32:58 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:2346:762:14f4:8b01])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488cd17bdefsm22347825e9.23.2026.04.09.05.32.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 05:32:57 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Khem Raj <raj.khem@gmail.com>, Bruce Ashfield <bruce.ashfield@gmail.com>,
        openembedded-devel@lists.openembedded.org
Cc: brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [meta-oe][PATCH 1/2] libgpiod: update to v2.2.4
Date: Thu,  9 Apr 2026 14:32:51 +0200
Message-ID: <20260409123253.106920-1-bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: 4MwtETEoLX07M8-4V74i_N8EoaEdZrB1
X-Authority-Analysis: v=2.4 cv=fIIJG5ae c=1 sm=1 tr=0 ts=69d79c7c cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=9BcIsMCYfeZi6iaZHvAA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDExMyBTYWx0ZWRfX1iDy83xOcIDN
 58ae2Ta5dtA1wydHSSXlwCDz0WU9NeDHDcywRr1v2mObiDWLFhFCYyGsOX2vE8h1dHoQtaJzdQc
 hmVT0MXiemY4pFaV34ubjxffJql/nHhxN5ofTDcjCndHpJtPelKhL5g7qrGNtoa3PPxHrser97G
 K4eltj8gZYeOn8x/SsDYQOwn73iq8V4ttl7cDV8OqGH9vadc0h+JOn0nA0r+EZkKw9oiWMRSbzs
 Fwb25NnO0Ftr8xId0Mkkuw7IxTVRoiPhd5Evzi2JS1JddQI7TEFp9//PrvuVepkir3x4zRxXIGJ
 G2neu1JDqnJZDqYaXBTaZzpYx2CLYeU3cD4NBbVEUk/kSvbUKDRzQqF2u45IFwy2JrDyHf7JOeX
 bQE/RbzT0VgZzzwmYAYnC4fX3x9SL7tR8xOjLevq/13I0z7aa7geFUN5grvBDONEClHryqEMfGp
 BEsIF/m03W0IyBT1CeQ==
X-Proofpoint-GUID: 4MwtETEoLX07M8-4V74i_N8EoaEdZrB1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_03,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015 adultscore=0
 bulkscore=0 malwarescore=0 phishscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604090113
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Apr 2026 15:57:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126199

Bug-fix release addressing several issues discovered during an
AI-augmented security audit. The most severe bug was found in the C
extension code of the python bindings - which also get an update - but
there were some memory leaks and integer overflow bugs in the core C
library as well as in tools and DBus daemon.

Full changelog:

Bug fixes:
- fix buffer over-read bugs when translating uAPI structs to library types
- fix variable and argument types where necessary
- sanitize values returned by the kernel to avoid potential buffer overflows
- fix memory leaks in gpio-tools
- add missing return value checks in gpio-tools
- fix period parsing in gpio-tools
- use correct loop counter in error path in gpio-manager

Improvements:
- make tests work with newer coreutils by removing cases checking tools'
  behavior on SIGINT which stopped working due to changes in behavior of the
  timeout tool

Also: drop the patch that's now upstream from the recipe.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 ...tools-tests-remove-SIGINT-test-cases.patch | 83 -------------------
 .../{libgpiod_2.2.3.bb => libgpiod_2.2.4.bb}  |  3 +-
 2 files changed, 1 insertion(+), 85 deletions(-)
 delete mode 100644 meta-oe/recipes-support/libgpiod/libgpiod-2.x/0001-tools-tests-remove-SIGINT-test-cases.patch
 rename meta-oe/recipes-support/libgpiod/{libgpiod_2.2.3.bb => libgpiod_2.2.4.bb} (96%)

diff --git a/meta-oe/recipes-support/libgpiod/libgpiod-2.x/0001-tools-tests-remove-SIGINT-test-cases.patch b/meta-oe/recipes-support/libgpiod/libgpiod-2.x/0001-tools-tests-remove-SIGINT-test-cases.patch
deleted file mode 100644
index 7fe06b9882..0000000000
--- a/meta-oe/recipes-support/libgpiod/libgpiod-2.x/0001-tools-tests-remove-SIGINT-test-cases.patch
+++ /dev/null
@@ -1,83 +0,0 @@
-From 3c38c5f9ab49384039f35408656a88f87619dd03 Mon Sep 17 00:00:00 2001
-From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
-Date: Wed, 18 Mar 2026 14:07:06 +0100
-Subject: [libgpiod][PATCH] tools: tests: remove SIGINT test cases
-
-In coreutils v9.10 (specifically with commit 8c2461933411 ("timeout:
-honor ignored signal dispositions")) the behavior of timeout changed and
-it will no longer propagate SIGINT or SIGQUIT in shell background jobs.
-This breaks the test cases checking the behavior of tools after SIGINT.
-We have to assume that if exit after SIGTERM works, then so does it
-after SIGINT and remove the failing tests.
-
-Upstream-Status: Submitted [https://lore.kernel.org/all/20260318131413.56575-1-bartosz.golaszewski@oss.qualcomm.com/]
-Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
----
- tools/gpio-tools-test.bash | 37 -------------------------------------
- 1 file changed, 37 deletions(-)
-
-diff --git a/tools/gpio-tools-test.bash b/tools/gpio-tools-test.bash
-index 71d6e3d..62f6836 100755
---- a/tools/gpio-tools-test.bash
-+++ b/tools/gpio-tools-test.bash
-@@ -1415,17 +1415,6 @@ test_gpioset_with_lines_strictly_by_name() {
- 	gpiosim_check_value sim0 6 0
- }
- 
--test_gpioset_interactive_after_SIGINT() {
--	gpiosim_chip sim0 num_lines=8 line_name=1:foo
--
--	dut_run gpioset -i foo=1
--
--	dut_kill -SIGINT
--	dut_wait
--
--	status_is 130
--}
--
- test_gpioset_interactive_after_SIGTERM() {
- 	gpiosim_chip sim0 num_lines=8 line_name=1:foo
- 
-@@ -1907,20 +1896,6 @@ test_gpiomon_multiple_lines_across_multiple_chips() {
- 	assert_fail dut_readable
- }
- 
--test_gpiomon_exit_after_SIGINT() {
--	gpiosim_chip sim0 num_lines=8
--
--	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
--
--	dut_run gpiomon --banner --chip "$sim0" 4
--	dut_regex_match "Monitoring line .*"
--
--	dut_kill -SIGINT
--	dut_wait
--
--	status_is 130
--}
--
- test_gpiomon_exit_after_SIGTERM() {
- 	gpiosim_chip sim0 num_lines=8
- 
-@@ -2503,18 +2478,6 @@ test_gpionotify_multiple_lines_across_multiple_chips() {
- 	assert_fail dut_readable
- }
- 
--test_gpionotify_exit_after_SIGINT() {
--	gpiosim_chip sim0 num_lines=8
--
--	dut_run gpionotify --banner --chip "${GPIOSIM_CHIP_NAME[sim0]}" 4
--	dut_regex_match "Watching line .*"
--
--	dut_kill -SIGINT
--	dut_wait
--
--	status_is 130
--}
--
- test_gpionotify_exit_after_SIGTERM() {
- 	gpiosim_chip sim0 num_lines=8
- 
--- 
-2.47.3
-
diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_2.2.3.bb b/meta-oe/recipes-support/libgpiod/libgpiod_2.2.4.bb
similarity index 96%
rename from meta-oe/recipes-support/libgpiod/libgpiod_2.2.3.bb
rename to meta-oe/recipes-support/libgpiod/libgpiod_2.2.4.bb
index 38829a620f..2c8d9f1873 100644
--- a/meta-oe/recipes-support/libgpiod/libgpiod_2.2.3.bb
+++ b/meta-oe/recipes-support/libgpiod/libgpiod_2.2.4.bb
@@ -13,10 +13,9 @@ FILESEXTRAPATHS:prepend := "${THISDIR}/${BPN}-2.x:"
 
 SRC_URI += " \
     file://gpio-manager.init \
-    file://0001-tools-tests-remove-SIGINT-test-cases.patch \
 "
 
-SRC_URI[sha256sum] = "70012b0262e4b90f140431efa841ca89643b02ea6c09f507e23cec664a51b71a"
+SRC_URI[sha256sum] = "13207176b0eb9b3e0f02552d5f49f5a6a449343ce47416158bb484d9d3019592"
 
 # Enable all project features for ptest
 PACKAGECONFIG[tests] = " \
-- 
2.47.3


