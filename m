Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06E59103E191
	for <webhook@archiver.kernel.org>; Wed, 18 Mar 2026 14:52:01 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14165.1773840850947897402
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Mar 2026 06:34:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=RMBgnLfV;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=iTF6s+wI;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: bartosz.golaszewski@oss.qualcomm.com)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62I7wB6O2789337
	for <openembedded-devel@lists.openembedded.org>; Wed, 18 Mar 2026 13:22:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=5kZi/2SuJ8tcHwsXDIMrCfTztp3j62btbFB
	iGbLKXGE=; b=RMBgnLfVYDbho4UTpf0GGVXy/QJnYVJt+oWpcZtmRGOSX7DjRmm
	XNeV3pllUAsMMp6FdlGM5F5/T21LsPM5bCUVmk7FR1sQV100u3uUXwhJlw0cdzLe
	l9K9v62xyAoFTvD0a9SyDPKEUbMcicB0a34gPf9xuzmmv8001A0ti6PrX1yaHltv
	BjkNUMbTqbmnzoQrq+2bStR/rea0Skg/jwzadAkobdV9lciCi19PO3rlRSS98NbR
	ZV1THp7RzJGebrvh5hSWPullv7pcGBLU98vv0QPQz7pRv3SnlYkxo5ON6y7ggnkx
	DwBnlghiV71WADUDEOescosCrmsTUQCWrPQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyj4g2nxe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 18 Mar 2026 13:22:42 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5090cc6a7d2so93425111cf.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 18 Mar 2026 06:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773840161; x=1774444961; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5kZi/2SuJ8tcHwsXDIMrCfTztp3j62btbFBiGbLKXGE=;
        b=iTF6s+wIA/+wKGsBv5+cCr+u76L96PEpl1QKLXBTsiGWX4m1HnNZfSkxc4DC0swD0U
         PnkygeKHzwE77KEj7aJLSmzkrWXlHYQ+yyf4oLxOyJ6egXELA95m7mN9gvYmZmCyfdlP
         pPoDbA6FMsMhQY9bKrEsZLDS+7pz9tIVZ4HCUn5gUKiy4QRTtvEaEjyis/yviUeQCqvu
         GOvWJWujQyS04Kk/MDlQOachNbdtTtsfa94RFk6iqb1aE7UVIs6yKEOoDlkI3MmP5ofC
         bKBP0cLxLcGf/njrbaPTbQSnnUJItaGTWVz2PUQyf1jbapZmF3PNOaByLXMDptHgsn+N
         3y+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773840161; x=1774444961;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5kZi/2SuJ8tcHwsXDIMrCfTztp3j62btbFBiGbLKXGE=;
        b=WgpGQFeJ7Frr/YWbIj0zPTnLseAd/zkBXdJwOlZ+kQzpwCNtSlrbWcBkvx+BrREZEa
         APJZTmK2JS+RJHUhM9AhohCkX4KRFce+aOl/l92+/DNR3i9n58BsTl/lqNfvKD95dyyO
         ZrWXz9W5cV2SsHg+hxsdbYYISDiZG8po0kPZ4iw3P80KsHuSFjL1eVLhoB//niCyToOw
         0Z2pTQYt8/v8dVEiPcgpHOH4Em8ElZjlcjAOF7qjWtous3to2bP/BaTG5WEIz9c/0V3Z
         Vn+Mo8yXjMXyvkR4IOS374z5ugiEirxgVOt0wLYWlRhCe8Yn7VVKwf8pormFszIDQaFQ
         t+rg==
X-Forwarded-Encrypted: i=1; AJvYcCWOp5aqVFfx5YWMpm93kksZAbEuBVw0HNXJunpDdiaXyndVIRInrRJorCwjBNjMe5hPVkzJG1stGn3E6ERM+3FfU2M=@lists.openembedded.org
X-Gm-Message-State: AOJu0YwWr6i25LyJFfXSpFMnzf8lm50kfJYnHwTUcvZfzhLjg9A6GHpE
	dWcDAs2TRB3Ti26A6Ed5mhk0PeVr9+liflyhQBGc1icaARhhr/HKVCCPdJNfYAFfp1cvfjO/GVC
	n1AaqWOkZAlHacHVuH9pbxGrmGb0CSEl+oxG8cjzeqBIHZ/ljZgd+tgNsYlW57QA9NW+ar/IxSF
	rHf4kGLQKS
X-Gm-Gg: ATEYQzxBgVdvieha6Ka/cgWQpel+DfLeh8BGj0TbaZ9BdFI71wHwKKMtNBv2LzhTnFy
	8dm06TzyM9gVNxF5Hj9ldze2qChf3W6Zs7XXMZBxXED47NpM6TFD+9CwfICcXzJfF31qVLTBD4W
	KS4sQ0r9eZWj+aIFqFxT9UMNa2DxdyjG5rGYc/sTePNkZSLEOEmtlPBrKkGuWHM5VJdUpnvMpBI
	6rJCYnEXOzT43KY1CpUENrpeDWwqpPq6Ojuj4zKtWy8xPe2A+w/ECqRAh0LAF+GYE+YjWKg2uHh
	OTI+L0VQ5BnidQPndvQxmegPgzd84V0cSByZVl3UEZ1BcCmGrY/FpZ0BMAEouyIz79/YuyfuxeC
	4kdhFk9OSOoMmVy4QkdECuMpttJ3SwESePyHO+HiRDHRgZVWcrZ8=
X-Received: by 2002:ac8:7658:0:b0:50b:2096:494e with SMTP id d75a77b69052e-50b2096532amr7137121cf.30.1773840161197;
        Wed, 18 Mar 2026 06:22:41 -0700 (PDT)
X-Received: by 2002:ac8:7658:0:b0:50b:2096:494e with SMTP id d75a77b69052e-50b2096532amr7136681cf.30.1773840160553;
        Wed, 18 Mar 2026 06:22:40 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:b8ec:50c4:23a0:2505])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b5189221dsm7710916f8f.23.2026.03.18.06.22.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 06:22:39 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Khem Raj <raj.khem@gmail.com>, Bruce Ashfield <bruce.ashfield@gmail.com>,
        openembedded-devel@lists.openembedded.org
Cc: brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [meta-oe][PATCH] libgpiod: fix gpio-tools tests failure with new coreutils
Date: Wed, 18 Mar 2026 14:22:31 +0100
Message-ID: <20260318132231.57020-1-bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Authority-Analysis: v=2.4 cv=TPhIilla c=1 sm=1 tr=0 ts=69baa722 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=THy5lNviE_Jy-DyZpBUA:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: CdvsZQIam9E4_2XfIOCtEEejtw2DHVbV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDExMyBTYWx0ZWRfX1M/y+/xXds8Q
 clAxQ1r0rGitaq3IkqNyhQMJrHiOW9zPMYLoc9VbTCjwQg4veD6Nm6aJ4MgxhtlKZgV6ML8CMx4
 EA6NJ3YEAdiD5ItcIY4Cs/VJuTDqkqFJLBlvG3HsMBlAVlmDgS54EGWAsIYp8fpua44l65wS6NS
 d4AeG3HbU7W0XmuoqMMdO5LxKupWBt+kg34T4m+85yD4HYo9veO5DqwxxXEuqQUvASnl15rBJds
 9ppH5FqjzjFRqIbYylR2C7WcC2j4+UNs30NxjGq6rvqfKYajsHyMpB7IZPax+iYed69fUFPKD0f
 mxhP8Lt193ftlOmRkcZCd4riwv5YN9r0XEUo9+i74k0/HXABaE9vid/YQ9JxfHq41lEEDRVGyWm
 QtAGaw8Kf4dkov50CgjsfHwKpJ1dGHnkc5XLCqPhgo58zGf7tDglc4guy9bmF4EVN9DCZI/fFYp
 Eyu2oQ63ldAKnH5QIzQ==
X-Proofpoint-GUID: CdvsZQIam9E4_2XfIOCtEEejtw2DHVbV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 spamscore=0 impostorscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603180113
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 18 Mar 2026 14:52:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125360

openembedded-core updated to coreutils v9.10 in which commit
8c2461933411 ("timeout: honor ignored signal dispositions") changed the
behavior of timeout. It will no longer propagate SIGINT to background
shell jobs which breaks test-cases for gpio-tools which verify that they
exit correctly after receiving SIGINT. This backports the patch sent
upstream that removed the offending test-cases as we already have a
similar set of tests for SIGTERM.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 ...tools-tests-remove-SIGINT-test-cases.patch | 83 +++++++++++++++++++
 .../libgpiod/libgpiod_2.2.3.bb                |  5 +-
 2 files changed, 87 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/libgpiod/libgpiod-2.x/0001-tools-tests-remove-SIGINT-test-cases.patch

diff --git a/meta-oe/recipes-support/libgpiod/libgpiod-2.x/0001-tools-tests-remove-SIGINT-test-cases.patch b/meta-oe/recipes-support/libgpiod/libgpiod-2.x/0001-tools-tests-remove-SIGINT-test-cases.patch
new file mode 100644
index 0000000000..7fe06b9882
--- /dev/null
+++ b/meta-oe/recipes-support/libgpiod/libgpiod-2.x/0001-tools-tests-remove-SIGINT-test-cases.patch
@@ -0,0 +1,83 @@
+From 3c38c5f9ab49384039f35408656a88f87619dd03 Mon Sep 17 00:00:00 2001
+From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
+Date: Wed, 18 Mar 2026 14:07:06 +0100
+Subject: [libgpiod][PATCH] tools: tests: remove SIGINT test cases
+
+In coreutils v9.10 (specifically with commit 8c2461933411 ("timeout:
+honor ignored signal dispositions")) the behavior of timeout changed and
+it will no longer propagate SIGINT or SIGQUIT in shell background jobs.
+This breaks the test cases checking the behavior of tools after SIGINT.
+We have to assume that if exit after SIGTERM works, then so does it
+after SIGINT and remove the failing tests.
+
+Upstream-Status: Submitted [https://lore.kernel.org/all/20260318131413.56575-1-bartosz.golaszewski@oss.qualcomm.com/]
+Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
+---
+ tools/gpio-tools-test.bash | 37 -------------------------------------
+ 1 file changed, 37 deletions(-)
+
+diff --git a/tools/gpio-tools-test.bash b/tools/gpio-tools-test.bash
+index 71d6e3d..62f6836 100755
+--- a/tools/gpio-tools-test.bash
++++ b/tools/gpio-tools-test.bash
+@@ -1415,17 +1415,6 @@ test_gpioset_with_lines_strictly_by_name() {
+ 	gpiosim_check_value sim0 6 0
+ }
+ 
+-test_gpioset_interactive_after_SIGINT() {
+-	gpiosim_chip sim0 num_lines=8 line_name=1:foo
+-
+-	dut_run gpioset -i foo=1
+-
+-	dut_kill -SIGINT
+-	dut_wait
+-
+-	status_is 130
+-}
+-
+ test_gpioset_interactive_after_SIGTERM() {
+ 	gpiosim_chip sim0 num_lines=8 line_name=1:foo
+ 
+@@ -1907,20 +1896,6 @@ test_gpiomon_multiple_lines_across_multiple_chips() {
+ 	assert_fail dut_readable
+ }
+ 
+-test_gpiomon_exit_after_SIGINT() {
+-	gpiosim_chip sim0 num_lines=8
+-
+-	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+-
+-	dut_run gpiomon --banner --chip "$sim0" 4
+-	dut_regex_match "Monitoring line .*"
+-
+-	dut_kill -SIGINT
+-	dut_wait
+-
+-	status_is 130
+-}
+-
+ test_gpiomon_exit_after_SIGTERM() {
+ 	gpiosim_chip sim0 num_lines=8
+ 
+@@ -2503,18 +2478,6 @@ test_gpionotify_multiple_lines_across_multiple_chips() {
+ 	assert_fail dut_readable
+ }
+ 
+-test_gpionotify_exit_after_SIGINT() {
+-	gpiosim_chip sim0 num_lines=8
+-
+-	dut_run gpionotify --banner --chip "${GPIOSIM_CHIP_NAME[sim0]}" 4
+-	dut_regex_match "Watching line .*"
+-
+-	dut_kill -SIGINT
+-	dut_wait
+-
+-	status_is 130
+-}
+-
+ test_gpionotify_exit_after_SIGTERM() {
+ 	gpiosim_chip sim0 num_lines=8
+ 
+-- 
+2.47.3
+
diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_2.2.3.bb b/meta-oe/recipes-support/libgpiod/libgpiod_2.2.3.bb
index a23d65bcaa..38829a620f 100644
--- a/meta-oe/recipes-support/libgpiod/libgpiod_2.2.3.bb
+++ b/meta-oe/recipes-support/libgpiod/libgpiod_2.2.3.bb
@@ -11,7 +11,10 @@ LIC_FILES_CHKSUM = " \
 
 FILESEXTRAPATHS:prepend := "${THISDIR}/${BPN}-2.x:"
 
-SRC_URI += "file://gpio-manager.init"
+SRC_URI += " \
+    file://gpio-manager.init \
+    file://0001-tools-tests-remove-SIGINT-test-cases.patch \
+"
 
 SRC_URI[sha256sum] = "70012b0262e4b90f140431efa841ca89643b02ea6c09f507e23cec664a51b71a"
 
-- 
2.47.3


