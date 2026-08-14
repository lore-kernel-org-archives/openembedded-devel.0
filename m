Return-Path: <ricardo.salveti@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 655C4C5CFCF
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 03:01:23 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5375.1786676480060639764
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Aug 2026 20:01:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=kDJUAIgh;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=a2FYWz5k;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: ricardo.salveti@oss.qualcomm.com)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67E1A95o3188227
	for <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 03:01:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=rHKiORMflsvgbyrsvDyc+ss5lq4T/J69ijM
	jF4o8JYM=; b=kDJUAIghRCfYD2wPQv4adUaogEYvJgtLiWy0ZbLLebVJQvWI3/v
	PM6Zik1P5Yh9Usf58au1buELJ76I2/R6NrKug7pimGI2iBLkjrsRqGkuZUECBAxx
	suJRaxV4KI6C61YmhCRih08jQ18HDYx3JljY1lBAe2VrCQ9/sEHQ9s9Q1AbUKyD6
	UHuwEfQinPr4TWkcvoCq5IBa//M8KG7F7v+zOsjA2y5oZUmcOXm4KCkwD6uuHOMN
	oUgnUaT5TdGT/Yuhqil1Lv2M8zNZS4/xqF4zg6tOr9LJOBW5b4Jhfa17BQi9zkrZ
	hDmMYGdPBIwelMRLbckflVZlHEUNNyQlvtQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g1hgy243c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 03:01:18 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38f5ac7354dso640424a91.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 20:01:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786676477; x=1787281277; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rHKiORMflsvgbyrsvDyc+ss5lq4T/J69ijMjF4o8JYM=;
        b=a2FYWz5kLdX/f1fa2+f+RRye6Ow4kTXhuKJFDfHdNZBV5GV2+Hiudxb/BpRvvvs7Eg
         51GRAYKaa1vRYgQu0Fh12Z9BvMMFxbTV/UnHCGeCc8iIOlSiLwDzHTRppFIkCjni1UDf
         qkoxt28/dHgXHwqnCfFyASLKR47nb41iFZS18hg+4NbHK5iHdgKHKo5GFtdoBjrMRD4r
         gEzt6r0OlGuC2pf5aChJoFWUT/OSOmAV6Ho5moAMOkEYcDlpTw2Gmpwj7gHROlWXmBeh
         thuCPI0iKJ/n7eIrMfZznSnARjZtCtRuMKPhi3dzoi78lBVDX5e2AwOVMhKEJEtZtCFv
         HqVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786676478; x=1787281278;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=rHKiORMflsvgbyrsvDyc+ss5lq4T/J69ijMjF4o8JYM=;
        b=BBrwCAKmg5/fVPgH+44g6e2LcxKiIrSZBhCJo49D43SYldJ2K8yVweaUqlJ6WJ1z3m
         bfLHarIwcZDynnZ7BjBANDFdfVPZ2Kl0OjfIAA/nT0f+oMdoPuuUeGMJoJvbIk0AMftt
         JoFEZi22uTP0Tl2OMT/eAq+/U0pmSVAemP4L8VwuMRUdIAOeOA/T5HiYobCR4sIBBSLf
         dI1cL3sN0u/yf9JNLWktKlxCYyKVSF6a1+B/GmAX1RbSmFL7gfGlY0FHWZmXCg/2pbUl
         oi2zLFZw5bTA/yrXNsLz8MGAd+pxhf94U8ZyMlcdY9IBHovKdqQUoCAkTJXw/FNEZBI6
         87FA==
X-Gm-Message-State: AOJu0YxHxR52QpLAc5fkU0XLo4dKMATm2Fed11JvDsvVYrc9tu4pR1hM
	Zk9mabl85rv+DHNaIPd8x7eyrFZ07VzCHhh8RN7Fkwiwla/2URX9PzQTOxJ5rqPGl/FenguI8J7
	vbhYSKTrgZmADvt2ZZtcsPKgp5B4MV93LnJn4lV+YCb+yKuwpzNg9uJnha6G+R3/YuRVsWqL4Hg
	rimqB1RIw0fksRKZH6S1Q=
X-Gm-Gg: AR+sD12RM8itgjqdrVeTLeLAVocOKNmlKQ6pPH4lgsaXl7SGu8iqwoJTLfG5D2MpSl7
	SIx+7agFCcWYOoNmOCEUcnsO2lhj+Vd3zBZ0xFqCWni7ek4yhVgY02hXVF/0A/iv7+k05NuAwQY
	cpPL+5g0Da2+f7/ligfHjJtK/x1O48FF+KL9XRWYc+bMrNjpI4cNeikY57tSPbFJ1R6wiyhs7Ck
	HVldnHgOFmZPpY9b5LqBV3Nn3qihK6Ipl4+rP+OpBPy8ovk7pI4TQ6/0GxZBjx+nEkhZuGwTt7s
	4SlP++lp/weUM/NwDJHzLvuSJHrXjBHSfvnE7RF4RhyrLw0Q6l/c5bQ+NToLA9TOpLdZAoN0YiG
	+CA65I4OtVMH/tck11isgejfQtZ2oAZyQRDUd7/XWROl7SEdt/MIcCvgWOwZvFYp8BWzKXCGGVq
	V3EENONIjCNy2y1+8sV1bxFolSVQmWMnDlbJoWFkk=
X-Received: by 2002:a17:90b:2248:b0:392:c80b:8eff with SMTP id 98e67ed59e1d1-3933b87a743mr2274711a91.11.1786676477282;
        Thu, 13 Aug 2026 20:01:17 -0700 (PDT)
X-Received: by 2002:a17:90b:2248:b0:392:c80b:8eff with SMTP id 98e67ed59e1d1-3933b87a743mr2274607a91.11.1786676476362;
        Thu, 13 Aug 2026 20:01:16 -0700 (PDT)
Received: from ip-172-31-25-255.us-west-2.compute.internal (ec2-35-83-207-173.us-west-2.compute.amazonaws.com. [35.83.207.173])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-394eb7539d3sm567020a91.15.2026.08.13.20.01.15
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 20:01:15 -0700 (PDT)
From: Ricardo Salveti <ricardo.salveti@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH] uboot-sign: list the TEE loadable behind U-Boot
Date: Fri, 14 Aug 2026 03:00:59 +0000
Message-ID: <20260814030059.151158-1-ricardo.salveti@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE0MDAyMyBTYWx0ZWRfX5TZLDS6xdlnM
 CuBd7e2Tvm2GTc+BhsymGznrrUnSYF6SqXrRj70W5P+ZMnkXGyE0RK7bYg68YaWTE0++BsS7fAz
 3Cxou1HCrpk7DyCb8L9/IKfvw4BretXOfJNlh3sduz7aH6bwyO/8idDNjIi3jOg0bKifoZGOZlF
 naRBdrxl3gbHtZ0HsFNCepzPquagLP0AhU5RwQ9ZY2lOZJmR/J0dEDWaAPCiequbxHq1GdiSgjw
 9+7T4IWvxygeANuFZBgqB48NDNFIbEnWJi4PmVo1No+Oq050caypuubDu59fuydsLa+GGi29OMH
 1ZSs8ifk6yLMGpvkDF6QJZb9/jKjX7dZeQfrtsMzDHeoL7LhfGns5vsNMAetg/WGOhmnRfjNWVl
 33NnCbtq1gzmXBbQmW8tYiWB/wrr8xMnxoTnidyhSobjVXR/ha54dNsFEI3nwFJ1P9o/gKNsbig
 VrHlpx0ceWOwanPrIrA==
X-Authority-Analysis: v=2.4 cv=AaSB2XXG c=1 sm=1 tr=0 ts=6a7e84fe cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=P2/bgbqRawb6I1+7fxbs5g==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=VTT31UuMaAZhFUJcaEgA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: xMIqU6JrVEiFXZVplLEj7U-EzpCKAw9o
X-Proofpoint-GUID: xMIqU6JrVEiFXZVplLEj7U-EzpCKAw9o
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE0MDAyMyBTYWx0ZWRfX6/bgdWDiHFrK
 2VZ1H9erR4zwg4R5TuSPf3mYhWpxABiUHwi60UO6g3jrZNypUwzOJS2EXBJVDdPxNJKG89ehRe2
 L+pgeTv45dwdp1DmX78QLee+F9wL/lo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-14_01,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1011 priorityscore=1501 spamscore=0
 impostorscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608140023
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 03:01:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129029

uboot_fitimage_assemble() prepends the TEE image to the "loadables"
property of the configuration, which puts it ahead of U-Boot. That order
is not only cosmetic.

An SPL that hands off to the ARM Trusted Firmware (CONFIG_SPL_ATF)
describes the images it loaded to the next stage through the /fit-images
node of the device tree it passes on, and common/spl/spl_fit.c only
records a loadable there once spl_image->fdt_addr is set. That happens
when it loads an image os_takes_devicetree() accepts, which is U-Boot.
Images listed ahead of U-Boot are therefore loaded but never described,
and spl_invoke_atf() in common/spl/spl_atf.c, which looks up the BL32
entry point by searching /fit-images for an IH_OS_TEE image, finds
nothing. BL31 is then entered without a BL32 entry point and OP-TEE is
never started.

Append the TEE image instead, so that the assembled order becomes "atf",
"uboot", "tee".

This does not regress the configurations that work today:

- Where U-Boot is the image selected as firmware, it is loaded before the
  loop over the loadables runs, so the device tree is already in place and
  every loadable is recorded whatever its position. This is the shape of
  the FIT that arch/arm/dts/imx8mm-u-boot.dtsi describes, with
  firmware = "uboot" and loadables = "atf", "tee".

- Where the ARM Trusted Firmware is the firmware, U-Boot has to come
  first among the loadables, which is what this change produces. The
  binman description in arch/arm/dts/rockchip-u-boot.dtsi already ends up
  in that order: it selects fit,firmware = "atf-1", "u-boot" and generates
  the loadables from its images node, where the U-Boot entry precedes the
  OP-TEE one.

- Nothing else in the SPL depends on the position of the TEE image. An
  arm32 OP-TEE image is recorded by spl_fit_image_record_arm32_optee()
  wherever it appears, and the fallback that takes the entry point from
  the first loadable only applies when the image selected as firmware
  carries none, while every image generated here is emitted with one.

The images in the FIT and their contents are unchanged; only the order in
which they are named in the property differs. Update the order the
selftest expects accordingly.

AI-Generated: Uses Claude Code

Signed-off-by: Ricardo Salveti <ricardo.salveti@oss.qualcomm.com>
---
 meta/classes-recipe/uboot-sign.bbclass   | 5 ++++-
 meta/lib/oeqa/selftest/cases/fitimage.py | 4 ++--
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta/classes-recipe/uboot-sign.bbclass b/meta/classes-recipe/uboot-sign.bbclass
index 33f9abdb79..66d8171c9f 100644
--- a/meta/classes-recipe/uboot-sign.bbclass
+++ b/meta/classes-recipe/uboot-sign.bbclass
@@ -458,7 +458,10 @@ EOF
         };
 EOF
 	if [ "${UBOOT_FIT_TEE}" = "1" ] ; then
-		conf_loadables="\"tee\", ${conf_loadables}"
+		# Listed behind U-Boot: an SPL handing off to the ARM Trusted
+		# Firmware only describes the images it loaded to the next stage
+		# once it has loaded the one it appends the device tree to.
+		conf_loadables="${conf_loadables}, \"tee\""
 		uboot_fitimage_tee
 	fi
 
diff --git a/meta/lib/oeqa/selftest/cases/fitimage.py b/meta/lib/oeqa/selftest/cases/fitimage.py
index 451878aafd..3d8bdc4a74 100644
--- a/meta/lib/oeqa/selftest/cases/fitimage.py
+++ b/meta/lib/oeqa/selftest/cases/fitimage.py
@@ -1798,7 +1798,7 @@ class UBootFitImageTests(FitImageTestCase):
                 'entry = <%s>;' % bb_vars['UBOOT_FIT_TEE_ENTRYPOINT'],
                 'compression = "none";',
             ]
-            loadables.insert(0, "tee")
+            loadables.append("tee")
         if bb_vars['UBOOT_FIT_ARM_TRUSTED_FIRMWARE'] == "1":
             its_field_check += [
                 'description = "ARM Trusted Firmware";',
@@ -1850,7 +1850,7 @@ class UBootFitImageTests(FitImageTestCase):
             }
         }
         if bb_vars['UBOOT_FIT_TEE'] == "1":
-            loadables.insert(0, "tee")
+            loadables.append("tee")
             req_sections['tee'] = {
                 "Type": "Trusted Execution Environment Image",
                 # "Load Address": bb_vars['UBOOT_FIT_TEE_LOADADDRESS'], not printed by mkimage?
-- 
2.43.0


