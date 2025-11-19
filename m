Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5B8FCF31BE
	for <webhook@archiver.kernel.org>; Wed, 19 Nov 2025 12:34:56 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5833.1763555689873693442
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Nov 2025 04:34:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=NyPgV0m1;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=kS0ukaUL;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AJB6G541982248
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Nov 2025 12:34:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=GAibSbCibb4
	9gJTGU+iOHZqRrGlEmFijZ1ZfjCrMLmI=; b=NyPgV0m1WBDUwrKwtVz2kHM0Bwv
	jmo54QCYnVa0931wp35I0/f4ossdfTovslKS2FazL7WUBQ65ubfjsyQO3NhZOyj5
	GYoNX3dUOFBAUKeECPzZx4q7W7aW7lq36m5DqJHrY35Z+kqn5EVtD4CxZ7cdLVrk
	XJaSSNwSupcKOSaXyfZncv12mPOFXq8XQRSTCAFHTUdtZETenrLvM6+eosjhG8W+
	W6EBDItaKmkz5tHCCiidd9RYkSae9ZymkkLtGSY6RLTJQDCQyDEobpuq/J/RcfH3
	AJdFKIjKchWUDyNGRVe86qkGzARrDEFsTlMDHSASxvYGhzW/79kq0BLAjEA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ahcqng72j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Nov 2025 12:34:48 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-bc240cdb249so5776506a12.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 19 Nov 2025 04:34:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763555688; x=1764160488; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GAibSbCibb49gJTGU+iOHZqRrGlEmFijZ1ZfjCrMLmI=;
        b=kS0ukaUL1PziZBGoYm8UD5hLAHWXhkFUHUTnyQugqO0ljPH4grl9DLchP89907IEBq
         WuzS2OM2HWUgYpjr72b+UhzmE8AcXDnkveOmoEWRFuui6o6TdQ57d5Xpkg0+yQd5QxD7
         lCoq+Gq+M3970OF7AyBS6qJtwTMMbIslBt41FHfVaLv/qFBzwKTG5nqQNUijhjLl5YMl
         SVX46sz0rQunvUqqJUmgH+trW4kbKW7KGIclsg2NV/3MDApPFiFlZBvmeXg2nst/Bal2
         wheKAR2yjHHA2dxmrGNrJYyt1xp2gKIQQ0nMbTdNBFI4y4HF7SyDzQIhzJE3eytj11iD
         sCIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763555688; x=1764160488;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GAibSbCibb49gJTGU+iOHZqRrGlEmFijZ1ZfjCrMLmI=;
        b=icRNLtNb8GFHfpTXMXuLVF/30uLnTvnAYUeCYrhmP1pjUezv0uiZTg/sAMiqdy9Rwx
         cRNP96e6FTjVvT8+qIKEFvPCIDU0QqFrCpJSuplnaVW9fxFSBFsDrMRMqBxhA70a/IUO
         TNL6KfjRTxjqV2UPmtQwmzGTzLTUhmTaO+vhKT5gBEVwD+30EYBQyPCurRB8v0nG8rBO
         f210FoTGhmOvhr0Z+yG7FQqypbQcC+IsVogkDfGwsf+MoMA9FR3A+ENrYhKtvy6GwalB
         nzPBWQhgiRoAyX8rFqkN3MGbBjWjT3/lYJz+hflXkAJo6ZvbvyGAv4P/kACDKT9+2Gfo
         hDag==
X-Gm-Message-State: AOJu0YxGcAih/NIPC7yjWlV6UNJwPyYQ3TwPIGSnOKOUew8llh+beJnb
	H++IbBdy8YvyFysE8501xuGffOl8ZgVyIm6TaIu1Js+/j0q5tHfqYuAsYp6xxHIbLk7Yp3xIAMq
	wl4/wOu+RV9z90QzK8RHBQEAxsnTy4x8YX8DRbDi5UFBeGiGS4cJArknpeG57FrYADLCSKcadoD
	mPUbdrqh0MhyGy5doNFKs=
X-Gm-Gg: ASbGnctQP1c5C0XfegAXG1xc+1RG9Ur7ydNzF4B3flNSr81MzT7+pxFl7tYInzX8APf
	ysUjhwo09eBB2cP+w+HzeK6r2T7tvRNj1Awid1Vu9NiBW+8Dyv4W33BamCE1Tdn9WSXqiGE+sAo
	lbmvPPcjPTqsaKzuyuJLNsbbE6OzcOCLOjTezd5Ijw4vYyhY0ARVbaq7v4L2lmRvWcH1EOyU6Mc
	jEeUYzj3VCbCgUnrOQrVKF4mNj8l8zi4y2crsDfkEZ4GTOQFCvvey4leW6BDLMTJGiXDvUEYT93
	hmApTTIexU9onq75muViNOACSFRPYHB4zmQtHj3TfssvHi+8lYAcfliB1cbwQxz/adOilRKCjH2
	dDU4HxuovAfSJMi0ElCjIv3jyLaZNX4XtIx6UYzIC
X-Received: by 2002:a17:903:1a2f:b0:295:5da6:6011 with SMTP id d9443c01a7336-2986a6b83e8mr224215995ad.11.1763555687868;
        Wed, 19 Nov 2025 04:34:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFJ+cpMFkgwcDKjpMHw/ySiYxD9gkLyL5GL2DuCuqjU1FkwyePdJdpNwn+/LFNEXoeFyuCzRQ==
X-Received: by 2002:a17:903:1a2f:b0:295:5da6:6011 with SMTP id d9443c01a7336-2986a6b83e8mr224215725ad.11.1763555687318;
        Wed, 19 Nov 2025 04:34:47 -0800 (PST)
Received: from hu-anujmitt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2bf158sm207999915ad.91.2025.11.19.04.34.46
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 04:34:47 -0800 (PST)
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [scarthgap][meta-gnome][PATCH 4/4] grilo: fix buildpaths QA error
Date: Wed, 19 Nov 2025 18:04:37 +0530
Message-ID: <20251119123437.2192091-4-anuj.mittal@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251119123437.2192091-1-anuj.mittal@oss.qualcomm.com>
References: <20251119123437.2192091-1-anuj.mittal@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE5MDEwMCBTYWx0ZWRfX2ApxT71yl1Gh
 2V/5m5W4LK48qamtS0yzPf9xPxAEfVi5PmcusmZfmT37q2m5R5eVgXtPZp3/Osey7OJlLoiEhWb
 aaVaipzWq/5P2Obgwarn4Rl6Ia+F0Hp/OKqQ6fEP53wZqOl2ANgWOCfh5VHzk6nQAexBwSqyl4V
 CCjXkCpKPEr9JGQC5MUCTEB96/6gzD/jbJTJmeFyaSb/i5TtvfieMQm0yyCl1cpoKZIZCoZCqBr
 wHcwttmsoopWodTx7VVY2cia8uWNdcUKPG2SzsdoIQfMsnx7cLqLy9sr+nKLFnuJYQw4xoVKctN
 ue8c1F7zJpkUs6UW2RXMTyxZWc0Rq10Zb3m7S5NG2PEN3NMY79zWaxj/PaGV8HplYn+8TBt8tAq
 tjOz8521JCwEIf/z/AepZnwRoOh09Q==
X-Authority-Analysis: v=2.4 cv=ApfjHe9P c=1 sm=1 tr=0 ts=691db968 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=fPOKaIKhFyeziQ2-OPMA:9
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: xZDjnlL_X2y6qtg0VPUBZ_X2wMf5Um5m
X-Proofpoint-ORIG-GUID: xZDjnlL_X2y6qtg0VPUBZ_X2wMf5Um5m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-19_03,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 spamscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511190100
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Nov 2025 12:34:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121903

From: Yoann Congal <yoann.congal@smile.fr>

grl-type-builtins.* are generated by glib-mkenums which leave full paths
in comment and #include directives. Rewrite those before *-src packaging.
Previous fix did not correct the .c file and did not work in the
"devtool modify" case.

Fix these errors:
  ERROR: grilo-0.3.16-r0 do_package_qa: QA Issue: File /usr/src/debug/grilo/0.3.16/src/grl-type-builtins.c in package grilo-src contains reference to TMPDIR [buildpaths]
  ERROR: grilo-0.3.16-r0 do_package_qa: QA Issue: File /usr/src/debug/grilo/0.3.16/src/grl-type-builtins.h in package grilo-src contains reference to TMPDIR [buildpaths]
  ERROR: grilo-0.3.16-r0 do_package_qa: Fatal QA errors were found, failing task.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit aa88276c26b465039b45281b8c206dd5d7baa58e)
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
---
 meta-gnome/recipes-gnome/grilo/grilo_0.3.16.bb | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/grilo/grilo_0.3.16.bb b/meta-gnome/recipes-gnome/grilo/grilo_0.3.16.bb
index 14e1ca9fe1..b6ac75dd8a 100644
--- a/meta-gnome/recipes-gnome/grilo/grilo_0.3.16.bb
+++ b/meta-gnome/recipes-gnome/grilo/grilo_0.3.16.bb
@@ -26,5 +26,14 @@ PACKAGECONFIG[test-ui] = "-Denable-test-ui=true, -Denable-test-ui=false, gtk+3 l
 EXTRA_OEMESON = "-Denable-grl-pls=false"
 
 do_compile:append() {
-        sed -i -e 's,${B}/../,,' ${B}/src/grl-type-builtins.h
+    # grl-type-builtins.* are generated by glib-mkenums which leave full paths
+    # in comment and #include directives. Rewrite those before *-src packaging.
+
+    # Path can be relative to B or WORKDIR in devtool modify
+    for base in ${B} ${WORKDIR} ; do 
+        relpath="$(realpath --relative-to="$base" "${S}")"
+        sed -i -e "s,$base/$relpath/src/,," \
+            ${B}/src/grl-type-builtins.h \
+            ${B}/src/grl-type-builtins.c
+    done
 }
-- 
2.51.2


