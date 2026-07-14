Return-Path: <jose.quaresma@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEE01C44501
	for <webhook@archiver.kernel.org>; Tue, 14 Jul 2026 16:18:17 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.496.1784045894752019970
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Jul 2026 09:18:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=mcE9XzqA;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=fsUMpaM1;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: jose.quaresma@oss.qualcomm.com)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66EG6lYk1027710
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Jul 2026 16:18:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=LlL/Rqq5bb3DOiNlcI5Rqg7A
	GmZn6Tft2gt2MJ8bgQY=; b=mcE9XzqAqfjs62yd54PcSJquHGhbjZCZ4CQb/ENc
	0JoRDXaYjKsT/2YmrOxEoOYT4jObY/8u3V49ML6/7LNsi1V3PM8PHhQTnlhz7x77
	WLu294WQLci19RoKbdKt1mjjS3pWFTWlX/l3oLzoP1/gDLGK+M2EefDkBM1h/8wC
	xt/IEA9ZwBg1RWwwOdiwMbvEGe2FpM+vUXcG67H3/Pto8I3O1wmnVD+vfTbKkmwc
	G7ptwVJPE4wu5kormLmUHVWu3xjJHRgUrFSMKUZbX/G8QfQ5E1DjpS/coo8j0hUA
	rjpk7pl5LEy/2TL4VJhC5iEzia89ny7dbwGXTS2pDNXoSQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdbr4b837-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Jul 2026 16:18:12 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-904c1d588bbso16671856d6.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 14 Jul 2026 09:18:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784045892; cv=none;
        d=google.com; s=arc-20260327;
        b=HI78XaUPd2RSAiV6XtJMF54a/1EE8aJyV3ptZK34HfrckHm/s/c4yek8mX9jpi6jTc
         Mwiy0Zfz/lxGGtoE+UAsBgGxa6t45cC0dAmBFj9WM1JVfOElvtu1441NKxDqtHvo/V/n
         C0oYsY9syRh/Xq2Jr0IHhTfWRZmWtGdZQZye8A/d8HmimX5qg2yRTNDdYn895ulkIlve
         JsqSOXkWvwcn/ITi53R6hjHmNdEOVqh+5nhMNlvY+TZvcNkVTE4Dy9i0nLIhrIMiANnu
         6CgtBNS2CDi+TT73UqRmykG/zQQDwopDQrDC8q/aHTy0myc7MPxpPpLDf2GfbBPn6FkP
         tD8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=LlL/Rqq5bb3DOiNlcI5Rqg7AGmZn6Tft2gt2MJ8bgQY=;
        fh=LZspYXC3IzyIN8FmVwz229n7pZIWt1HqVNc3WYXGu+o=;
        b=geLmnAoZag4ngg2EFUZmt8zQLmQDeRQR/BWx46NMCRIwVmJmyCloRLOsgYETeKbhJ9
         7qIA7iVYyhUmdY13ODdDPsfjQ+76M2R0TfG5ADRxnqPgAF0NLNh3TiCxN1bE1pzCTvkH
         016pkAbrfPHqMno+E+8cQo2z8uBMT1wZpdv2S47kHofdp0Su0xeBdeRLVfa96ZmgCcJ9
         i2ibNYbeHjpiK5hwv+IjNcDQQwe/KykvemFKwfkdwol5hHio7xC+XTd3/UgiOmaOKNlx
         luRVyo4CMouck7kVunLxLvo3KncbUv+qMzzNpglHNiHKSPM0wjRgNxJ/K9XprkkVMpcl
         0xjg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784045892; x=1784650692; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LlL/Rqq5bb3DOiNlcI5Rqg7AGmZn6Tft2gt2MJ8bgQY=;
        b=fsUMpaM1lci3fMmdPSymGi0lUhasvUTnH8NvXK4cpfxJGtVofRo2Eahd33qwgn2k+B
         swJMRVU+oAfbGnHbwJAOliavEQg8tlvYCjCzsrX3aanu7vp0n88uo3/xwEhnzxepy74x
         QKnF+pSTdhSi8osaEekGGJxfYlUJAnAKSztswqnK93yoedNjT1hhiZIRN+N/JgFNdfJG
         vTdM/q9BK072cqiTliS78y6CXvgmGGlYVMnn7UE434+RqsX8ga4RLcnB3rgitS/nnir3
         +0N1fGcI8aWVToDzJbOcqyzsQRhlbA8kVIXETavQLhAB47Z5cczL6fDSOkeHJQxa6bUX
         qAeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784045892; x=1784650692;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LlL/Rqq5bb3DOiNlcI5Rqg7AGmZn6Tft2gt2MJ8bgQY=;
        b=KxcxPpR0FgBltZXqOSmR14scMm3DupCrxYllDt1JiuLvo3eiIhB59+zMB1IfsZHLev
         n462OpokNEo09MRBFIswb4RlHDRofh+ianrlI00uJQsVgsxXEBNRcz2rojqB2yYyeatS
         pFMuEpk9OLIYrV81mctKQXyyq0tt8eFK++0EL3MX1WmXZDNZssW3ZimQQ3MOUuqBKz4z
         IQW//SopQjvYOlPQ2O9wM7vNMRwngc2ue3EJqRJ5SxlW5XsKP25hMsm2EAIoszapk0Gk
         Wv/DX3N/9ik0gteWW34hlvBzSkzDbeXu9pKSWYqndLj5TP6S4gczQ5cKLS6KYcvZZV2i
         JZzw==
X-Gm-Message-State: AOJu0Yz9dJbDS0lwW6nHc1+q4sJzHrbAwHa5YI4AO5ifmeM0wilYJZqc
	3+kXRKPrSX+HK1LA4e/jFhN04tRzhrvKP/z6y1yffgPYGktKlGqVw7DEOl/25MSq2RVnBRQVO3+
	lPdzMN6JgIUQnRwmofC1NegcWk1bNUdivgZ6zWW4Q7HJkf7Z9tgpCdZj5M+lPDs+BlgvFgsN1b5
	FmdAoV0tpZe6aiPQWH/8cnXArgIDRMvUdd7meUx2pMQqYgX28xEKzamoJbEKU=
X-Gm-Gg: AfdE7ckbwuIMHYZAShJ5zYxBVBXGxKkWmBlHzcpUTJ1ea1PkpeyGXZyiiJ7WTlYjayJ
	bfhWWy/QJL/kPoU390cWxHHFNpfTWjj3LZ43o1xAXUFACCP2RuUo6JocYXjD11n+vpX4mOEcGjX
	4MYDHS3ro8ADBGciF1kDrIKT5wHNrMHwTMhGOoOszXoflG53upktZbOwT7DQayOdXbA1ioxA==
X-Received: by 2002:a05:6214:2f82:b0:8e9:f62b:8f80 with SMTP id 6a1803df08f44-904167e193cmr151813946d6.23.1784045892123;
        Tue, 14 Jul 2026 09:18:12 -0700 (PDT)
X-Received: by 2002:a05:6214:2f82:b0:8e9:f62b:8f80 with SMTP id
 6a1803df08f44-904167e193cmr151813456d6.23.1784045891424; Tue, 14 Jul 2026
 09:18:11 -0700 (PDT)
MIME-Version: 1.0
References: <20260713170853.298499-1-f_l_k@t-online.de>
In-Reply-To: <20260713170853.298499-1-f_l_k@t-online.de>
From: Jose Quaresma <jose.quaresma@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 17:18:00 +0100
X-Gm-Features: AUfX_mxfb8FydAlijtE5ADCMSjbbmXv17-b8ccVDkk6mRQiwzghli7NnP3Rbkhg
Message-ID: <CADWMC-Z7-kP+xYixTDSsFKgZfd4CQS0iyoaBLxefCXTjMcRsqA@mail.gmail.com>
Subject: Re: [oe] [meta-multimedia][PATCH] libcamera: update 0.7.1 -> 0.7.2
To: f_l_k@t-online.de
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000009f26730656948d6c"
X-Proofpoint-GUID: Z5GChlHOnjIyPQMHQwdMtpoy0yHphpwN
X-Proofpoint-ORIG-GUID: Z5GChlHOnjIyPQMHQwdMtpoy0yHphpwN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDE2OSBTYWx0ZWRfX6Rd1EUbQdrXM
 rb4mT6O4UPEAXHqDB7rQ8CwqapSJN8l1/ILDMeISXOh1Zjd8i+TEO317v16c/jue+SlTshaPtx+
 JbzQfUE/LWybDXovnTeFNoJdANFKF6uLs3In3V4TiqgnchdKCmXmL0IEfFAQ5IMFIU/BaxzuqGw
 K3brhzLrSl/Ug/hq69z42GHdDg5QQiH7zPjH8IMEvwLxYwxcV7zDdFnAcVOrK4SfGRQS4DoVnxC
 6Gz/kZ8RydIutIY89X3JHzqk51qm/8Bx/XpCkQeyIXEIE0PesnaTITaSCa1hUFTqS85ApGjrS3F
 /q4AL2Ls3cl37DhHdOh96Tj8kwNH6u1RjDpNWIs052ria+ZFFf9xXz2Z6iuD77PCpdn/RtEOQ/7
 Rla5dDrU5hn3ntCx6j8ahlAGNVgEDDcTTyjl66mxAsopI9Ls89NdIS1Jf0OBUK/VFcRCVmEzli1
 tRjFr/SxFxZftZVqNUg==
X-Authority-Analysis: v=2.4 cv=F5hnsKhN c=1 sm=1 tr=0 ts=6a566145 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=NEAV23lmAAAA:8 a=e5mUnYsNAAAA:8 a=YAyIRdgMAAAA:8 a=Q4-j1AaZAAAA:8
 a=EUspDBNiAAAA:8 a=StMyijsvmifRzhkf8iAA:9 a=QEXdDO2ut3YA:10 a=vmi6oJg5AAAA:8
 a=ygfikJQSAAAA:8 a=q3ErVeX-D648O85rTuUA:9 a=xOu0BO255e6UeOUX:21
 a=lqcHg5cX4UMA:10 a=iYH6xdkBrDN1Jqds4HTS:22 a=Vxmtnl_E_bksehYqCbjh:22
 a=o1rO4XtwZBNj6n05oSJ_:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=ioboX4i089tB3dTPuEcW:22
 a=rfsfOhzgo-V0TFs3tIRs:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDE2OSBTYWx0ZWRfXzSF+Uk3uGN9U
 4mTOCbIuphbZAKbhPjxnp2hrnOJNqc1E9SdgPc45J+e75MevDQBY1UkqxV0hz7YGOLBbnBEwaKw
 giWmnpJKfddVC8jdnf77QnwKMp3LSGU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_04,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 clxscore=1011 adultscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140169
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Jul 2026 16:18:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128166

--0000000000009f26730656948d6c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 13, 2026 at 6:09=E2=80=AFPM Markus Volk via lists.openembedded.=
org
<f_l_k=3Dt-online.de@lists.openembedded.org> wrote:

> Integration Overview:
>
> ABI:
>
> The abi-compliance checker reports 100% *binary* compatibility in this
> release,
> so the SONAME is maintained at 0.7.
>
> Validating ABI compatibility between v0.7.1 and v0.7.2
> Preparing, please wait ...
> Comparing ABIs ...
> Comparing APIs ...
> Creating compatibility report ...
> Binary compatibility: 100%
> Source compatibility: 97.9%
> Total binary compatibility problems: 0, warnings: 2
> Total source compatibility problems: 13, warnings: 2
>
> These source compatibility problems are bisected to 597a5bb97bf9
> ("libcamera:
> bound_method: Use std::apply") and this looks to be a false positive and
> as far
> as I can tell do not actually prevent any external application compiling
> against libcamera.
>
> The following commits in this release relate to either a bug fix or an
> improvement to an existing commit.
>
> bugs:
>  - libcamera: egl: Don't depend on libdrm
>    - Fixes: 7350d6cc5dd1 ("Revert "libcamera: software_isp: gbm: Add a GB=
M
> helper class for GPU surface access"")
>  - libcamera: base: regex: Fix preprocessor check
>    - Link:
> https://github.com/llvm/llvm-project/commit/568c23bbd3303518c5056d7f03444=
dae4fdc8a9c
>  - test: controls: control_info_map: Fix libc++ warning
>    - Link:
> https://github.com/llvm/llvm-project/commit/9a03a30706cca40b93146f379fb5f=
aa75d417af5
>  - ipa: rpi: agc: Clamp digital gain to avoid saturation issues
>    - Fixes: 17f9912cff85 ("ipa: rpi: agc: Calculate digital gain in
> process()")
>  - py: Use smart holder for `Camera` if available
>    - Link: https://github.com/pybind/pybind11/issues/6064
>  - pipeline: rpi: Print old color space before updating
>    - Fixes: 71bbf10a2f79 ("libcamera: rpi: Add some helpers to
> PipelineHandlerBase")
>  - libcamera: framebuffer: Reword documentation about cookie
>    - Closes:
> https://gitlab.freedesktop.org/camera/libcamera/-/work_items/331
>  - ipa: libipa: Handle missing YAML nodes in Interpolator
>    - Closes:
> https://gitlab.freedesktop.org/camera/libcamera/-/work_items/323
>  - software_isp: debayer_egl: Consider border for scaling
>    - Fixes: f520b29fe9e6 ("libcamera: software_isp: debayer_egl: Add an
> eGL Debayer class")
>  - py: examples: simple-continuous-capture: Fix comment
>    - Fixes: d6cfb080604a ("py: examples: Add simple-continuous-capture.py=
")
>
> And the following updates have been made in this release, grouped by
> category:
>
> core:
>  - include: linux: Move mali-c55-config.h header to correct location
>  - utils: update-kernel-headers: Create destination directory
>  - utils: update-kernel-headers: Add drm/drm.h and drm/drm_mode.h
>  - utils: update-kernel-headers: Add linux/media/arm/mali-c55-config.h
>  - include: linux: Update to Linux v7.0
>  - libcamera: egl: Don't depend on libdrm
>  - libcamera: base: Restore defopt
>  - treewide: Use utils::defopt
>  - libcamera: base: signal: Disallow rvalue references
>  - libcamera: base: bound_method: Strip qualifiers in argument pack
>  - libcamera: base: bound_method: Forward when invoking
>  - subprojects: libpisp: Update to v1.5.0
>  - libcamera: base: regex: Fix preprocessor check
>  - libcamera: bound_method: Use std::apply
>  - libcamera: framebuffer: Reword documentation about cookie
>  - libcamera: base: log: Remove log level check for "Fatal" messages
>  - libcamera: base: log: Move abort logic into separate type
>  - libcamera: matrix: Rename data validation function
>  - libcamera: vector: Rename data validation function
>  - libcamera: Drop 'yaml' prefix from ValueNode variables
>  - libcamera: global_configuration: Drop "YAML" from function documentati=
on
>  - libcamera: Replace last mentions of YAML
>  - libcamera: vector: Replace class with typename
>  - libcamera: vector: Swap order of arguments to apply()
>  - libcamera: vector: Support multiple scalar arguments to apply()
>  - libcamera: vector: Add clamp() member function
>  - libcamera: vector: Replace custom lambdas with standard functions
>  - libcamera: v4l2_device: setControls(): Do not return index
>  - libcamera: v4l2_device: 0 is not a generic error index
>  - libcamera: request: Inline `Private::hasPendingBuffers()`
>  - libcamera: request: hasPendingBuffers(): Simplify
>  - libcamera: camera: Add missing `span.h` include
>  - meson: Build virtual pipeline by default
>  - utils: Merge shader header generation scripts
>  - utils: Rename and move shader header generation script
>  - libcamera: egl: Replace pointer and length with span for shader source=
s
>  - libcamera: egl: Add new helper attachTextureToFBO
>  - libcamera: egl: Add createOutputTexture2D
>  - libcamera: egl: Add activateBindTexture
>  - libcamera: egl: Add updateTexture2D
>  - libcamera: converter: converter_dw100: Refactor dewarp param handling
>  - libcamera: converter: converter_dw100: Allow to transform between
> different camera matrices
>  - include: linux: Update to Linux 7.1
>
> softisp:
>  - libcamera: software_isp: #include cleanup
>  - libcamera: software_isp: Normalize statistics sums to 8-bit
>  - libcamera: software_isp: Drop redundant sumShift_ guard in finishFrame
>  - libcamera: software_isp: Use Vector operator>>=3D in finishFrame
>  - debayer_egl: Include stats computation into benchmark
>  - debayer_egl: Sync output buffers after processing stats
>  - egl: Add GL format parameter to eGLImage constructor
>  - egl: Remove some parameters from createTexture2D()
>  - egl: eGLImage: Add flag to remember dmabuf import fails
>  - libcamera: swstats_cpu: Take MappedFrameBuffer in processFrame()
>  - debayer_egl: Implement dmabuf import for input buffers
>  - libcamera: software_isp: debayer_egl: Demote unsupported format log to
> Info
>  - libcamera: software_isp: Support 12-bit CSI2 packed raw bayer formats
>  - software_isp: debayer_egl: Request input buffer alignment of 256 bytes
>  - egl: Log the GL-driver
>  - software_isp: debayer_egl: Consider border for scaling
>  - libcamera: software_isp: Probe EGL availability before creating
> DebayerEGL
>  - libcamera: software_isp: Fix black level application in GPU ISP
>  - libcamera: software_isp: Fix black level handling in CPU ISP
>  - softisp: Split AWB from Combined Matrix
>  - shaders: bayer: Use native matrix multiplication
>  - libcamera: software_isp: Replace open-coded buffer cancellation
>  - libcamera: shaders: Move header generation to shaders directory
>  - libcamera: shaders: Replace C array with std::array
>  - libcamera: software_isp: debayer_egl: Pass eglImage as parameter to
> setShaderVariables
>  - libcamera: software_isp: debayer_egl: Implement input/output frame
> caching mechanism
>
> ipa:
>  - ipa: simple: agc: Replace bang-bang controller with proportional
>  - ipa: libipa: camera_sensor_helper: Add OV2740 black level
>  - ipa: libipa: v4l2_params: Fix code example in doc
>  - ipa: libipa: v4l2_params: Mention ISP in file one-line description
>  - ipa: libipa: v4l2_params: Enforce uint16_t for id_type underlying type
>  - ipa: libipa: v4l2_params: Move non-template code to new base class
>  - libcamera: libipa: Add right-shift operators to Vector
>  - ipa: rpi: agc: Clamp digital gain to avoid saturation issues
>  - ipa: libipa: Handle missing YAML nodes in Interpolator
>  - ipa: rkisp1: ccm: Drop unused parseYaml() function declaration
>  - ipa: rkisp1: cproc: Fix brightness and contrast value handling
>  - libcamera: libipa: camera_sensor: Add Sony IMX678 properties
>  - ipa: rpi: Add cam_helper for Sony IMX678
>  - ipa: rkisp1: awb: Utilise clamp function
>  - ipa: rpi: Improve control over which sensor modes require "debinning"
>  - ipa: libipa: camera_sensor_helper: Add OV01A10
>  - ipa: camera_sensor_helper: Add black levels for OV5693
>  - ipa: libipa: camera_sensor_helper: add ov08x40
>
> apps:
>  - android: Disable build on platforms without mbrtoc16()
>  - apps: common: options: Use character literal instead of string
>  - py: Use smart holder for `Camera` if available
>  - apps: lc-compliance: Reduce test repetition
>  - py: examples: simple-continuous-capture: Fix comment
>  - py: cam: Remove unnecessary check
>  - gstreamer: allocator: get_pool_size(): Fix return value
>  - gstreamer: Use `FrameBuffer` cookie to associate with `GstBuffer`
>
> pipeline:
>  - pipeline: rpi: Simplify delayed controls
>  - pipeline: rpi: Make control lists in requests properly atomic
>  - pipeline: rpi: Fix crash when configuring timeout
>  - pipeline: rpi: Print old color space before updating
>  - libcamera: pipeline: imx8-isi: Use `completeBuffer()` return value
>  - libcamera: pipeline: ipu3: Remove `setRequest()` calls
>  - libcamera: pipeline: mali-c55: Add missing `<queue>` include
>  - libcamera: pipeline: rkisp1: Simplify dewarper configuration
>  - pipeline: virtual: Move libjpeg requirement to libyuv subproject
>  - pipeline: rpi: pisp: Ensure we don't run our SW correction with packed
>  - pipeline: rpi: pisp: Fix colours for NV21 and NV61 pixel formats
>  - pipeline: rpi: pisp: Remove duplicated format entry
>  - controls: rpi: Add ControlListSequence control
>
> test:
>  - test: controls: control_info_map: Fix libc++ warning
>
> documentation:
>  - Documentation: Reorganize the index of the "For Developers" section
>  - Documentation: Move platform support to user documentation
>  - Documentation: architecture: Detail policy on dependencies
>  - Documentation: coding-style: Document rule about indirect includes
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  .../libcamera/{libcamera_0.7.1.bb =3D> libcamera_0.7.2.bb}     | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>  rename meta-multimedia/recipes-multimedia/libcamera/{libcamera_0.7.1.bb
> =3D> libcamera_0.7.2.bb} (97%)
>
> diff --git a/meta-multimedia/recipes-multimedia/libcamera/
> libcamera_0.7.1.bb b/meta-multimedia/recipes-multimedia/libcamera/
> libcamera_0.7.2.bb
> similarity index 97%
> rename from meta-multimedia/recipes-multimedia/libcamera/
> libcamera_0.7.1.bb
> rename to meta-multimedia/recipes-multimedia/libcamera/libcamera_0.7.2.bb
> index 2b351a39be..4b5e735a37 100644
> --- a/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.7.1.bb
> +++ b/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.7.2.bb
> @@ -13,11 +13,11 @@ SRC_URI =3D " \
>          git://
> git.libcamera.org/libcamera/libcamera.git;protocol=3Dhttps;branch=3Dmaste=
r;tag=3Dv${PV}
> <http://git.libcamera.org/libcamera/libcamera.git;protocol=3Dhttps;branch=
=3Dmaster;tag=3Dv$%7BPV%7D>
> \
>  "
>
> -SRCREV =3D "183e37362f57ff3ce7493abf0bc6f1b57b931f55"
> +SRCREV =3D "191e202178f02430b5942397c70d215cdd2056fa"
>
>  PE =3D "1"
>
> -DEPENDS =3D "python3-pyyaml-native python3-jinja2-native python3-ply-nat=
ive
> python3-jinja2-native udev gnutls chrpath-native libevent libyaml"
> +DEPENDS =3D "python3-pyyaml-native python3-jinja2-native python3-ply-nat=
ive
> python3-jinja2-native udev gnutls chrpath-native libevent libyaml libyuv"
>  DEPENDS +=3D "${@bb.utils.contains('DISTRO_FEATURES', 'qt', 'qtbase
> qtbase-native', '', d)}"
>
>  PACKAGES =3D+ "${PN}-compliance ${PN}-gst ${PN}-pycamera"
> @@ -38,7 +38,6 @@ PACKAGECONFIG[raspberrypi] =3D ",,libpisp"
>  PACKAGECONFIG[sdl] =3D
> "-Dcam-output-sdl2=3Denabled,-Dcam-output-sdl2=3Ddisabled,virtual/libsdl2=
"
>  PACKAGECONFIG[unwind] =3D
> "-Dlibunwind=3Denabled,-Dlibunwind=3Ddisabled,libunwind"
>  PACKAGECONFIG[vimc] =3D ",,"
> -PACKAGECONFIG[virtual] =3D ",,libyuv libjpeg-turbo"
>

There is another virtual knob to be dropped below in:

ARM_PIPELINES .=3D "${@bb.utils.contains('PACKAGECONFIG', 'virtual',
',virtual', '', d)}"

Jose


>  ARM_PIPELINES =3D "imx8-isi,mali-c55,simple,uvcvideo"
>  # Raspberry Pi requires the meta-raspberrypi layer
> --
> 2.55.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#128160):
> https://lists.openembedded.org/g/openembedded-devel/message/128160
> Mute This Topic: https://lists.openembedded.org/mt/120253052/10043485
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> jose.quaresma@oss.qualcomm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000009f26730656948d6c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jul 13,=
 2026 at 6:09=E2=80=AFPM Markus Volk via <a href=3D"http://lists.openembedd=
ed.org">lists.openembedded.org</a> &lt;f_l_k=3D<a href=3D"mailto:t-online.d=
e@lists.openembedded.org">t-online.de@lists.openembedded.org</a>&gt; wrote:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Integration Ove=
rview:<br>
<br>
ABI:<br>
<br>
The abi-compliance checker reports 100% *binary* compatibility in this rele=
ase,<br>
so the SONAME is maintained at 0.7.<br>
<br>
Validating ABI compatibility between v0.7.1 and v0.7.2<br>
Preparing, please wait ...<br>
Comparing ABIs ...<br>
Comparing APIs ...<br>
Creating compatibility report ...<br>
Binary compatibility: 100%<br>
Source compatibility: 97.9%<br>
Total binary compatibility problems: 0, warnings: 2<br>
Total source compatibility problems: 13, warnings: 2<br>
<br>
These source compatibility problems are bisected to 597a5bb97bf9 (&quot;lib=
camera:<br>
bound_method: Use std::apply&quot;) and this looks to be a false positive a=
nd as far<br>
as I can tell do not actually prevent any external application compiling<br=
>
against libcamera.<br>
<br>
The following commits in this release relate to either a bug fix or an<br>
improvement to an existing commit.<br>
<br>
bugs:<br>
=C2=A0- libcamera: egl: Don&#39;t depend on libdrm<br>
=C2=A0 =C2=A0- Fixes: 7350d6cc5dd1 (&quot;Revert &quot;libcamera: software_=
isp: gbm: Add a GBM helper class for GPU surface access&quot;&quot;)<br>
=C2=A0- libcamera: base: regex: Fix preprocessor check<br>
=C2=A0 =C2=A0- Link: <a href=3D"https://github.com/llvm/llvm-project/commit=
/568c23bbd3303518c5056d7f03444dae4fdc8a9c" rel=3D"noreferrer" target=3D"_bl=
ank">https://github.com/llvm/llvm-project/commit/568c23bbd3303518c5056d7f03=
444dae4fdc8a9c</a><br>
=C2=A0- test: controls: control_info_map: Fix libc++ warning<br>
=C2=A0 =C2=A0- Link: <a href=3D"https://github.com/llvm/llvm-project/commit=
/9a03a30706cca40b93146f379fb5faa75d417af5" rel=3D"noreferrer" target=3D"_bl=
ank">https://github.com/llvm/llvm-project/commit/9a03a30706cca40b93146f379f=
b5faa75d417af5</a><br>
=C2=A0- ipa: rpi: agc: Clamp digital gain to avoid saturation issues<br>
=C2=A0 =C2=A0- Fixes: 17f9912cff85 (&quot;ipa: rpi: agc: Calculate digital =
gain in process()&quot;)<br>
=C2=A0- py: Use smart holder for `Camera` if available<br>
=C2=A0 =C2=A0- Link: <a href=3D"https://github.com/pybind/pybind11/issues/6=
064" rel=3D"noreferrer" target=3D"_blank">https://github.com/pybind/pybind1=
1/issues/6064</a><br>
=C2=A0- pipeline: rpi: Print old color space before updating<br>
=C2=A0 =C2=A0- Fixes: 71bbf10a2f79 (&quot;libcamera: rpi: Add some helpers =
to PipelineHandlerBase&quot;)<br>
=C2=A0- libcamera: framebuffer: Reword documentation about cookie<br>
=C2=A0 =C2=A0- Closes: <a href=3D"https://gitlab.freedesktop.org/camera/lib=
camera/-/work_items/331" rel=3D"noreferrer" target=3D"_blank">https://gitla=
b.freedesktop.org/camera/libcamera/-/work_items/331</a><br>
=C2=A0- ipa: libipa: Handle missing YAML nodes in Interpolator<br>
=C2=A0 =C2=A0- Closes: <a href=3D"https://gitlab.freedesktop.org/camera/lib=
camera/-/work_items/323" rel=3D"noreferrer" target=3D"_blank">https://gitla=
b.freedesktop.org/camera/libcamera/-/work_items/323</a><br>
=C2=A0- software_isp: debayer_egl: Consider border for scaling<br>
=C2=A0 =C2=A0- Fixes: f520b29fe9e6 (&quot;libcamera: software_isp: debayer_=
egl: Add an eGL Debayer class&quot;)<br>
=C2=A0- py: examples: simple-continuous-capture: Fix comment<br>
=C2=A0 =C2=A0- Fixes: d6cfb080604a (&quot;py: examples: Add simple-continuo=
us-capture.py&quot;)<br>
<br>
And the following updates have been made in this release, grouped by catego=
ry:<br>
<br>
core:<br>
=C2=A0- include: linux: Move mali-c55-config.h header to correct location<b=
r>
=C2=A0- utils: update-kernel-headers: Create destination directory<br>
=C2=A0- utils: update-kernel-headers: Add drm/drm.h and drm/drm_mode.h<br>
=C2=A0- utils: update-kernel-headers: Add linux/media/arm/mali-c55-config.h=
<br>
=C2=A0- include: linux: Update to Linux v7.0<br>
=C2=A0- libcamera: egl: Don&#39;t depend on libdrm<br>
=C2=A0- libcamera: base: Restore defopt<br>
=C2=A0- treewide: Use utils::defopt<br>
=C2=A0- libcamera: base: signal: Disallow rvalue references<br>
=C2=A0- libcamera: base: bound_method: Strip qualifiers in argument pack<br=
>
=C2=A0- libcamera: base: bound_method: Forward when invoking<br>
=C2=A0- subprojects: libpisp: Update to v1.5.0<br>
=C2=A0- libcamera: base: regex: Fix preprocessor check<br>
=C2=A0- libcamera: bound_method: Use std::apply<br>
=C2=A0- libcamera: framebuffer: Reword documentation about cookie<br>
=C2=A0- libcamera: base: log: Remove log level check for &quot;Fatal&quot; =
messages<br>
=C2=A0- libcamera: base: log: Move abort logic into separate type<br>
=C2=A0- libcamera: matrix: Rename data validation function<br>
=C2=A0- libcamera: vector: Rename data validation function<br>
=C2=A0- libcamera: Drop &#39;yaml&#39; prefix from ValueNode variables<br>
=C2=A0- libcamera: global_configuration: Drop &quot;YAML&quot; from functio=
n documentation<br>
=C2=A0- libcamera: Replace last mentions of YAML<br>
=C2=A0- libcamera: vector: Replace class with typename<br>
=C2=A0- libcamera: vector: Swap order of arguments to apply()<br>
=C2=A0- libcamera: vector: Support multiple scalar arguments to apply()<br>
=C2=A0- libcamera: vector: Add clamp() member function<br>
=C2=A0- libcamera: vector: Replace custom lambdas with standard functions<b=
r>
=C2=A0- libcamera: v4l2_device: setControls(): Do not return index<br>
=C2=A0- libcamera: v4l2_device: 0 is not a generic error index<br>
=C2=A0- libcamera: request: Inline `Private::hasPendingBuffers()`<br>
=C2=A0- libcamera: request: hasPendingBuffers(): Simplify<br>
=C2=A0- libcamera: camera: Add missing `span.h` include<br>
=C2=A0- meson: Build virtual pipeline by default<br>
=C2=A0- utils: Merge shader header generation scripts<br>
=C2=A0- utils: Rename and move shader header generation script<br>
=C2=A0- libcamera: egl: Replace pointer and length with span for shader sou=
rces<br>
=C2=A0- libcamera: egl: Add new helper attachTextureToFBO<br>
=C2=A0- libcamera: egl: Add createOutputTexture2D<br>
=C2=A0- libcamera: egl: Add activateBindTexture<br>
=C2=A0- libcamera: egl: Add updateTexture2D<br>
=C2=A0- libcamera: converter: converter_dw100: Refactor dewarp param handli=
ng<br>
=C2=A0- libcamera: converter: converter_dw100: Allow to transform between d=
ifferent camera matrices<br>
=C2=A0- include: linux: Update to Linux 7.1<br>
<br>
softisp:<br>
=C2=A0- libcamera: software_isp: #include cleanup<br>
=C2=A0- libcamera: software_isp: Normalize statistics sums to 8-bit<br>
=C2=A0- libcamera: software_isp: Drop redundant sumShift_ guard in finishFr=
ame<br>
=C2=A0- libcamera: software_isp: Use Vector operator&gt;&gt;=3D in finishFr=
ame<br>
=C2=A0- debayer_egl: Include stats computation into benchmark<br>
=C2=A0- debayer_egl: Sync output buffers after processing stats<br>
=C2=A0- egl: Add GL format parameter to eGLImage constructor<br>
=C2=A0- egl: Remove some parameters from createTexture2D()<br>
=C2=A0- egl: eGLImage: Add flag to remember dmabuf import fails<br>
=C2=A0- libcamera: swstats_cpu: Take MappedFrameBuffer in processFrame()<br=
>
=C2=A0- debayer_egl: Implement dmabuf import for input buffers<br>
=C2=A0- libcamera: software_isp: debayer_egl: Demote unsupported format log=
 to Info<br>
=C2=A0- libcamera: software_isp: Support 12-bit CSI2 packed raw bayer forma=
ts<br>
=C2=A0- software_isp: debayer_egl: Request input buffer alignment of 256 by=
tes<br>
=C2=A0- egl: Log the GL-driver<br>
=C2=A0- software_isp: debayer_egl: Consider border for scaling<br>
=C2=A0- libcamera: software_isp: Probe EGL availability before creating Deb=
ayerEGL<br>
=C2=A0- libcamera: software_isp: Fix black level application in GPU ISP<br>
=C2=A0- libcamera: software_isp: Fix black level handling in CPU ISP<br>
=C2=A0- softisp: Split AWB from Combined Matrix<br>
=C2=A0- shaders: bayer: Use native matrix multiplication<br>
=C2=A0- libcamera: software_isp: Replace open-coded buffer cancellation<br>
=C2=A0- libcamera: shaders: Move header generation to shaders directory<br>
=C2=A0- libcamera: shaders: Replace C array with std::array<br>
=C2=A0- libcamera: software_isp: debayer_egl: Pass eglImage as parameter to=
 setShaderVariables<br>
=C2=A0- libcamera: software_isp: debayer_egl: Implement input/output frame =
caching mechanism<br>
<br>
ipa:<br>
=C2=A0- ipa: simple: agc: Replace bang-bang controller with proportional<br=
>
=C2=A0- ipa: libipa: camera_sensor_helper: Add OV2740 black level<br>
=C2=A0- ipa: libipa: v4l2_params: Fix code example in doc<br>
=C2=A0- ipa: libipa: v4l2_params: Mention ISP in file one-line description<=
br>
=C2=A0- ipa: libipa: v4l2_params: Enforce uint16_t for id_type underlying t=
ype<br>
=C2=A0- ipa: libipa: v4l2_params: Move non-template code to new base class<=
br>
=C2=A0- libcamera: libipa: Add right-shift operators to Vector<br>
=C2=A0- ipa: rpi: agc: Clamp digital gain to avoid saturation issues<br>
=C2=A0- ipa: libipa: Handle missing YAML nodes in Interpolator<br>
=C2=A0- ipa: rkisp1: ccm: Drop unused parseYaml() function declaration<br>
=C2=A0- ipa: rkisp1: cproc: Fix brightness and contrast value handling<br>
=C2=A0- libcamera: libipa: camera_sensor: Add Sony IMX678 properties<br>
=C2=A0- ipa: rpi: Add cam_helper for Sony IMX678<br>
=C2=A0- ipa: rkisp1: awb: Utilise clamp function<br>
=C2=A0- ipa: rpi: Improve control over which sensor modes require &quot;deb=
inning&quot;<br>
=C2=A0- ipa: libipa: camera_sensor_helper: Add OV01A10<br>
=C2=A0- ipa: camera_sensor_helper: Add black levels for OV5693<br>
=C2=A0- ipa: libipa: camera_sensor_helper: add ov08x40<br>
<br>
apps:<br>
=C2=A0- android: Disable build on platforms without mbrtoc16()<br>
=C2=A0- apps: common: options: Use character literal instead of string<br>
=C2=A0- py: Use smart holder for `Camera` if available<br>
=C2=A0- apps: lc-compliance: Reduce test repetition<br>
=C2=A0- py: examples: simple-continuous-capture: Fix comment<br>
=C2=A0- py: cam: Remove unnecessary check<br>
=C2=A0- gstreamer: allocator: get_pool_size(): Fix return value<br>
=C2=A0- gstreamer: Use `FrameBuffer` cookie to associate with `GstBuffer`<b=
r>
<br>
pipeline:<br>
=C2=A0- pipeline: rpi: Simplify delayed controls<br>
=C2=A0- pipeline: rpi: Make control lists in requests properly atomic<br>
=C2=A0- pipeline: rpi: Fix crash when configuring timeout<br>
=C2=A0- pipeline: rpi: Print old color space before updating<br>
=C2=A0- libcamera: pipeline: imx8-isi: Use `completeBuffer()` return value<=
br>
=C2=A0- libcamera: pipeline: ipu3: Remove `setRequest()` calls<br>
=C2=A0- libcamera: pipeline: mali-c55: Add missing `&lt;queue&gt;` include<=
br>
=C2=A0- libcamera: pipeline: rkisp1: Simplify dewarper configuration<br>
=C2=A0- pipeline: virtual: Move libjpeg requirement to libyuv subproject<br=
>
=C2=A0- pipeline: rpi: pisp: Ensure we don&#39;t run our SW correction with=
 packed<br>
=C2=A0- pipeline: rpi: pisp: Fix colours for NV21 and NV61 pixel formats<br=
>
=C2=A0- pipeline: rpi: pisp: Remove duplicated format entry<br>
=C2=A0- controls: rpi: Add ControlListSequence control<br>
<br>
test:<br>
=C2=A0- test: controls: control_info_map: Fix libc++ warning<br>
<br>
documentation:<br>
=C2=A0- Documentation: Reorganize the index of the &quot;For Developers&quo=
t; section<br>
=C2=A0- Documentation: Move platform support to user documentation<br>
=C2=A0- Documentation: architecture: Detail policy on dependencies<br>
=C2=A0- Documentation: coding-style: Document rule about indirect includes<=
br>
<br>
Signed-off-by: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de" target=
=3D"_blank">f_l_k@t-online.de</a>&gt;<br>
---<br>
=C2=A0.../libcamera/{<a href=3D"http://libcamera_0.7.1.bb" rel=3D"noreferre=
r" target=3D"_blank">libcamera_0.7.1.bb</a> =3D&gt; <a href=3D"http://libca=
mera_0.7.2.bb" rel=3D"noreferrer" target=3D"_blank">libcamera_0.7.2.bb</a>}=
=C2=A0 =C2=A0 =C2=A0| 5 ++---<br>
=C2=A01 file changed, 2 insertions(+), 3 deletions(-)<br>
=C2=A0rename meta-multimedia/recipes-multimedia/libcamera/{<a href=3D"http:=
//libcamera_0.7.1.bb" rel=3D"noreferrer" target=3D"_blank">libcamera_0.7.1.=
bb</a> =3D&gt; <a href=3D"http://libcamera_0.7.2.bb" rel=3D"noreferrer" tar=
get=3D"_blank">libcamera_0.7.2.bb</a>} (97%)<br>
<br>
diff --git a/meta-multimedia/recipes-multimedia/libcamera/<a href=3D"http:/=
/libcamera_0.7.1.bb" rel=3D"noreferrer" target=3D"_blank">libcamera_0.7.1.b=
b</a> b/meta-multimedia/recipes-multimedia/libcamera/<a href=3D"http://libc=
amera_0.7.2.bb" rel=3D"noreferrer" target=3D"_blank">libcamera_0.7.2.bb</a>=
<br>
similarity index 97%<br>
rename from meta-multimedia/recipes-multimedia/libcamera/<a href=3D"http://=
libcamera_0.7.1.bb" rel=3D"noreferrer" target=3D"_blank">libcamera_0.7.1.bb=
</a><br>
rename to meta-multimedia/recipes-multimedia/libcamera/<a href=3D"http://li=
bcamera_0.7.2.bb" rel=3D"noreferrer" target=3D"_blank">libcamera_0.7.2.bb</=
a><br>
index 2b351a39be..4b5e735a37 100644<br>
--- a/meta-multimedia/recipes-multimedia/libcamera/<a href=3D"http://libcam=
era_0.7.1.bb" rel=3D"noreferrer" target=3D"_blank">libcamera_0.7.1.bb</a><b=
r>
+++ b/meta-multimedia/recipes-multimedia/libcamera/<a href=3D"http://libcam=
era_0.7.2.bb" rel=3D"noreferrer" target=3D"_blank">libcamera_0.7.2.bb</a><b=
r>
@@ -13,11 +13,11 @@ SRC_URI =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0git://<a href=3D"http://git.libcamera.org=
/libcamera/libcamera.git;protocol=3Dhttps;branch=3Dmaster;tag=3Dv$%7BPV%7D"=
 rel=3D"noreferrer" target=3D"_blank">git.libcamera.org/libcamera/libcamera=
.git;protocol=3Dhttps;branch=3Dmaster;tag=3Dv${PV}</a> \<br>
=C2=A0&quot;<br>
<br>
-SRCREV =3D &quot;183e37362f57ff3ce7493abf0bc6f1b57b931f55&quot;<br>
+SRCREV =3D &quot;191e202178f02430b5942397c70d215cdd2056fa&quot;<br>
<br>
=C2=A0PE =3D &quot;1&quot;<br>
<br>
-DEPENDS =3D &quot;python3-pyyaml-native python3-jinja2-native python3-ply-=
native python3-jinja2-native udev gnutls chrpath-native libevent libyaml&qu=
ot;<br>
+DEPENDS =3D &quot;python3-pyyaml-native python3-jinja2-native python3-ply-=
native python3-jinja2-native udev gnutls chrpath-native libevent libyaml li=
byuv&quot;<br>
=C2=A0DEPENDS +=3D &quot;${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#=
39;qt&#39;, &#39;qtbase qtbase-native&#39;, &#39;&#39;, d)}&quot;<br>
<br>
=C2=A0PACKAGES =3D+ &quot;${PN}-compliance ${PN}-gst ${PN}-pycamera&quot;<b=
r>
@@ -38,7 +38,6 @@ PACKAGECONFIG[raspberrypi] =3D &quot;,,libpisp&quot;<br>
=C2=A0PACKAGECONFIG[sdl] =3D &quot;-Dcam-output-sdl2=3Denabled,-Dcam-output=
-sdl2=3Ddisabled,virtual/libsdl2&quot;<br>
=C2=A0PACKAGECONFIG[unwind] =3D &quot;-Dlibunwind=3Denabled,-Dlibunwind=3Dd=
isabled,libunwind&quot;<br>
=C2=A0PACKAGECONFIG[vimc] =3D &quot;,,&quot;<br>
-PACKAGECONFIG[virtual] =3D &quot;,,libyuv libjpeg-turbo&quot;<br></blockqu=
ote><div><br></div><div><span style=3D"background-color:transparent">There =
is another virtual knob to be dropped=C2=A0</span><span style=3D"background=
-color:transparent">below in:</span></div><div><br>ARM_PIPELINES .=3D &quot=
;${@bb.utils.contains(&#39;PACKAGECONFIG&#39;, &#39;virtual&#39;, &#39;,vir=
tual&#39;, &#39;&#39;, d)}&quot;<br><br></div><div>Jose</div><div><br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
=C2=A0ARM_PIPELINES =3D &quot;imx8-isi,mali-c55,simple,uvcvideo&quot;<br>
=C2=A0# Raspberry Pi requires the meta-raspberrypi layer<br>
-- <br>
2.55.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#128160): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/128160" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/128160</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/120253052/100=
43485" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
mt/120253052/10043485</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:jose.quaresma@oss.qualco=
mm.com" target=3D"_blank">jose.quaresma@oss.qualcomm.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--0000000000009f26730656948d6c--

