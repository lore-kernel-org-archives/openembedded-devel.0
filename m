Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72409CA5FFE
	for <webhook@archiver.kernel.org>; Tue,  6 Oct 2026 04:19:55 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.38069.1791260392082444844
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 Oct 2026 21:19:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=cndzr1Qx;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=L3JsIAKc;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6963AHiB2981648
	for <openembedded-devel@lists.openembedded.org>; Tue, 6 Oct 2026 04:19:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eFFvVH5fZEUxL8Gablk2COEGdHphF2LRAAXRfDzX4w8=; b=cndzr1QxI6HQhm7u
	62K+vMcjc7ZtwalL/h/XALteLFWcvKoJudMyAZ7qkaKgrWYR1dPtMRql+/NXfkY5
	GVwyThKJ2/j9bP046sZWHogWG5aYog9Nnxd9EweX0LULNx5rZte9VCh9NzVe02eS
	wRGop7ZbA/hWYghOep5dVSStg30Eus/kcV8zNt+Tue99xtYXAM9GWKqGcAMu0YGC
	rMacbznG8R9pl+dmmDbSFZE8lCMXuPOvRTCNWSKDoVnIGBzeIfuVCztx2l2hb4a9
	JAX9VdwS3VZTNj5RkKYwh19QcMFJ/Pyl89xDOxbA4PDlrTRVRks9s7VsY8vSjb5q
	8DPkoQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4cvnjxbd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 06 Oct 2026 04:19:51 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-53390e79a19so42502481cf.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 05 Oct 2026 21:19:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791260390; cv=none;
        d=google.com; s=arc-20260327;
        b=clIaXw23xZC5R/T5z5qZrOkmddUyLsbjq1pt+VyCiTDzDvgw/G3nWrGFfsHepPSq27
         RbMDhbHKD//r4Y9uL33BqFV9YVkIx4YdU+7b1pcN08j9Ls0YIW2NWBn2WuMmkECwrw6Y
         5cLewXP5K4meYjEsBUcQKnKspbylPl5HzZprEmG36J+TniHlugW33bY9pgGr79azmWn4
         0w3AS8rmhaglPmiVfCNG/t6NtSHahLvWkZZkxkBdVUwmLpK2YZ3cLi4knYrOJStGnIc7
         f/GvI6sr0O9N1HYz5EyHV8Vw4Ct7gXBbDhJ6bnCbHsdR7DNvHLmDkMqNSaXtNBEXbQ8x
         5CEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eFFvVH5fZEUxL8Gablk2COEGdHphF2LRAAXRfDzX4w8=;
        fh=n0ZnAkKOhGDmrf8RLpwnC7FQ6xmEY5rofL6wXnjsXjs=;
        b=ogqDzooJvW0kGXm/6os4kv37pdQZoPvkXgKBdMoHzKP2O67Sp9K+5VDapHAT1oiPeJ
         OKnK5dDvw/ZFn8LfquskWjUBC5VEwTCleepVEmXbSgCKNR8XphYuLljIF2eni0s4G/GP
         tAeQdmVcwovEjTO50K3RTBpi6WC+vLey7WTgZ0Cq6xCVbwk/fcLm+vS5PO9B5Mxwi52d
         2bT7saQqraNLq4cnBaWl9cZH/9i3sidPBTW4hHY1cNWki1eUeApXPV6F1UzJCxnCv6WL
         QuYcGuH94hFovLQYmZI4EsL9tXGHkY1XCbc8b4OPGulO3I0XbleXwzBgDpYFK0xujKZm
         WjMQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791260390; x=1791865190; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eFFvVH5fZEUxL8Gablk2COEGdHphF2LRAAXRfDzX4w8=;
        b=L3JsIAKckSAE+cuuG6FPnbKyus2jCRRV/BHEw7ZLVB8P5SZs+3KeONqI36iSWwTj2k
         Roct0c8LHFUGzBirTyYIqweRaKkQxOEIgOciLI2slCcqOGcM9Gm1ZnAaTN+Os6iJmcXK
         +WjLQo8YXKzf2UyGIxtyy95BNHEr/bm11dIjIi5j28AvkxXZKXldffgFGvYwiqJ3VROu
         7RQ4biXrza/vvRB6OmG5vg1pyjlVSh1c6wuvPYpMSUGoMmxujS9dImkCSreXWfzT4r60
         zZBPAJ1PwchF8PiP3y/n83I1lPFzZGF7ZVQuPnegMCq6uv8F9EsjWyUFVHiRuzWhRYCb
         B96w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791260390; x=1791865190;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eFFvVH5fZEUxL8Gablk2COEGdHphF2LRAAXRfDzX4w8=;
        b=voJGFTS47VKd/xGa/6gZEH6tmWL4MzW/hzVQWDRrC1tv42ZTxgFVuTA0t0P5/5eroG
         xJEHe6GbEL0CT5Uxymfc2L2KQMW8Pwy8d7O8Xf8s57k3pDZCqhqxVa/XeCqHtJztZcw2
         5LEvRGKvrVt0+PDLnozXBaE+GKBEJCIgFFfWV7KROIub9c1KNW9B2O5TA2O/INguj8vg
         ZzI62EFBLk/Rb2TZzMLTIW5lj5Zgcy9x/E0Umk68k7FtU1mVn5wxok+Sek5ZpP5DiHv6
         pSGF9rRqpwLrZe3zDjk73ZOqEYaUOKQ/acimYRFT1xr+J60p/W+zgVLgBIsWiG12sCwT
         BFDQ==
X-Gm-Message-State: AFuF++kIWqm8cv1vzuqsYk1ebUxoEdS8j1pzyOldWwlXClCOG19h6d7v
	wSPOs/0Yitjb2dGBbFbacUyJjszcYoAqcFtAqde98cp1MMukQ4va6zN9DO6hVNldJ1dRAaPMiD6
	21hc9X6Eo7LcuF+WYwP5xDSQGdCqNOGUZtjR1zoAX9q4eOcXIL3DZ8MQ/een633RjIDBV2w3thf
	XsuM277lwiXey7dGC3fwoyYi0tc2pvoN9HCfiwRLPGBaRjAkV6O236eG2KLYo=
X-Gm-Gg: AYBFou07Fn2QNAwcFvuecCM6Cn3M43k764vDQR0KCw8vGLDceS78srjBo7E8UyD+109
	sbYOpXSGq3MTd1q4FronOM7ySl365OvFKPocus/rpFj5/5wXngeQW9S61vndoRrxMUhDWKpDAnS
	fuy77MnPxspoGNnYPEP74EyQFfDASM3C9JW7IVOWZ+tsN+FWCwAlzkkytrlA==
X-Received: by 2002:a05:622a:5818:b0:532:a248:e998 with SMTP id d75a77b69052e-53566d5629fmr1457671cf.34.1791260390082;
        Mon, 05 Oct 2026 21:19:50 -0700 (PDT)
X-Received: by 2002:a05:622a:5818:b0:532:a248:e998 with SMTP id
 d75a77b69052e-53566d5629fmr1457451cf.34.1791260389560; Mon, 05 Oct 2026
 21:19:49 -0700 (PDT)
MIME-Version: 1.0
References: <20260924043315.1663186-1-ankur.tyagi85@gmail.com>
In-Reply-To: <20260924043315.1663186-1-ankur.tyagi85@gmail.com>
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Date: Tue, 6 Oct 2026 12:19:37 +0800
X-Gm-Features: AclHuK8oV9BJQzFo-AlnziHlwv2yXTzfrfBXWFrjr3-cxfUNIaXWBQUxfHk5wmI
Message-ID: <CA+s=J=xkrKm7u-AA6F40JsLHEc+_1B6ahJeb9CEsHzm3+eRn8Q@mail.gmail.com>
Subject: Re: [oe][meta-oe][wrynose][PATCH 1/24] rabbitmq-c: patch CVE-2026-44235
To: ankur.tyagi85@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: H_MVs7s7xmyqMg6dyNz_v3MOtDGA4WMG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDAxNiBTYWx0ZWRfX0ogt/XmAD13r
 bs5adslYljhsBNqFy9HjAXv53Ef2kgVdm8YlyZidHyP65MMNQsN/3OUQ3y2ujnfJ5vLX/2Mu9+z
 fvkyf8jt2g1/3GjAxr13H56/C3enYRrSNRBUs2wdjFEXJ0EuAC7hwcDzErisZqhRflrhDAQ1O7P
 BAnsxMFg28aKmQNTJQL1BWeRJEx7clUOT68o8j2Xb3KTlUWEHzu5Zp4x4qzYpCXVvlvAhNGmUR0
 ZCd5dmQ4zuonUMv6W8ULcQBlfLD3CFZ2VFhfB19leF/SM5DGwkM95hdcd5XArp2B7l+GPK9GTwL
 YtsalQtffJBUXX7V86Y03RBRU0+/BCE95QLYoaCDnfY+YwjX8cYzGY4hWT8Q6GjY7VZ4VCNuugk
 CPPLJ+1d2wAGlcnj3n/n6BDp9EwqI18JpC/Q8CpssJIm/vV8in7q+U6Z5HDxdr1MRaoyHSQtd/J
 YCCCPJS2TsBBeEH64jQ==
X-Proofpoint-GUID: H_MVs7s7xmyqMg6dyNz_v3MOtDGA4WMG
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDAxNiBTYWx0ZWRfXz8tNgMmJV5Su
 RieM+vmbyUr0LIr62AiGPcKJ5pw7a+zDOsTHwjOLK3jrOYa9kVoAWQWwSYrSfM0dR44+tkYTcE7
 v8G2gOS4BKQDUJ4VIEZ/+jmRY5SRZF0=
X-Authority-Analysis: v=2.4 cv=ZYeIpcVA c=1 sm=1 tr=0 ts=6ac476e7 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=PYnjg3YJAAAA:8 a=NEAV23lmAAAA:8 a=Q4-j1AaZAAAA:8
 a=pGLkceISAAAA:8 a=6gl_cCoBAAAA:8 a=EUspDBNiAAAA:8 a=Y-7heA6K3MCU18HlRGcA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=Bor9z-CvbNo2M6AZn8_k:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_01,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 malwarescore=0 bulkscore=0 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 clxscore=1011 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060016
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Oct 2026 04:19:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130629

On Thu, Sep 24, 2026 at 12:33=E2=80=AFPM Ankur Tyagi via
lists.openembedded.org
<ankur.tyagi85=3Dgmail.com@lists.openembedded.org> wrote:
>
> From: Ankur Tyagi <ankur.tyagi85@gmail.com>
>
> Details:
> https://nvd.nist.gov/vuln/detail/cve-2026-44235
>
> Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> ---
>  .../rabbitmq-c/CVE-2026-44235.patch           | 95 +++++++++++++++++++
>  .../rabbitmq-c/rabbitmq-c_0.15.0.bb           |  1 +
>  2 files changed, 96 insertions(+)
>  create mode 100644 meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c/CV=
E-2026-44235.patch
>
> diff --git a/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c/CVE-2026-=
44235.patch b/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c/CVE-2026-4=
4235.patch
> new file mode 100644
> index 0000000000..fcb0e1e1d1
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c/CVE-2026-44235.p=
atch
> @@ -0,0 +1,95 @@
> +From 52f00ef57e55c783c2c436590296d9ff986b65d0 Mon Sep 17 00:00:00 2001
> +From: Claude <noreply@anthropic.com>
> +Date: Tue, 28 Apr 2026 00:30:47 +0000
> +Subject: [PATCH] amqp_connection: reject undersized frames in
> + amqp_handle_input
> +
> +A malicious AMQP server (or active network attacker on an unencrypted
> +connection) can send an AMQP frame whose stated frame body is shorter
> +than the per-frame-type header it claims to carry. amqp_handle_input()
> +then computed encoded.len as
> +
> +  state->target_size - HEADER_SIZE - <fixed_header_bytes> - FOOTER_SIZE
> +
> +with no lower-bound check on target_size. Because encoded.len is a
> +size_t, the subtraction wrapped to a value near SIZE_MAX. The bogus
> +length was passed to amqp_decode_method() / amqp_decode_properties()
> +and through to the table decoder, whose internal bounds checks could
> +no longer constrain the parser. The result was an out-of-bounds read
> +and process crash on the client side, reachable during amqp_login.
> +
> +Validate target_size against the minimum required for each frame type
> +(METHOD: HEADER_SIZE+4+FOOTER_SIZE, HEADER: HEADER_SIZE+12+FOOTER_SIZE,
> +BODY: HEADER_SIZE+FOOTER_SIZE) and return AMQP_STATUS_BAD_AMQP_DATA
> +when the frame is too small, before computing encoded.len.
> +
> +Add the verified PoC bytes as a regression seed for the existing
> +fuzz_server harness.
> +
> +Refs: GHSA-9mmv-r8g3-qp46
> +(cherry picked from commit 1d3afbb056fee5cc9ea05680bf32288715d0d802)
> +
> +CVE: CVE-2026-44235
> +Upstream-Status: Backport [https://github.com/alanxz/rabbitmq-c/commit/1=
d3afbb056fee5cc9ea05680bf32288715d0d802]
> +Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> +---
> + .../input/fuzz_server_ghsa-9mmv-r8g3-qp46.raw | Bin 0 -> 113 bytes

This causes:

ERROR: rabbitmq-c-0.15.0-r0 do_patch: Applying patch
'/srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/recipe=
s-connectivity/rabbitmq-c/rabbitmq-c/CVE-2026-44235.patch'
on target directory
'/srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86-64-v3-poky-li=
nux/rabbitmq-c/0.15.0/sources/rabbitmq-c-0.15.0'
CmdError('quilt --quiltrc
/srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86-64-v3-poky-lin=
ux/rabbitmq-c/0.15.0/recipe-sysroot-native/etc/quiltrc
push', 0, 'stdout: Applying patch CVE-2026-44235.patch
File fuzz/input/fuzz_server_ghsa-9mmv-r8g3-qp46.raw: git binary diffs
are not supported.
patching file librabbitmq/amqp_connection.c
Patch CVE-2026-44235.patch does not apply (enforce with -f)

May be we should drop this hunk instead of working around.

> + librabbitmq/amqp_connection.c                 |  19 ++++++++++++++++++
> + 2 files changed, 19 insertions(+)
> + create mode 100644 fuzz/input/fuzz_server_ghsa-9mmv-r8g3-qp46.raw
> +
> +diff --git a/fuzz/input/fuzz_server_ghsa-9mmv-r8g3-qp46.raw b/fuzz/input=
/fuzz_server_ghsa-9mmv-r8g3-qp46.raw
> +new file mode 100644
> +index 0000000000000000000000000000000000000000..558e9f5bff6b24ad3104b8a3=
038ab5b271257dcc
> +GIT binary patch
> +literal 113
> +zcmZQ%0D&+DE+FItvaHO#6&U^l0azR#5qxj8*#?Ay5=3DJ1KHNeNw(+|W*&5I8WKF0)>
> +L=3DVq{ht2+k({(TL>
> +
> +literal 0
> +HcmV?d00001
> +
> +diff --git a/librabbitmq/amqp_connection.c b/librabbitmq/amqp_connection=
.c
> +index 56ab8a8..4326ef7 100644
> +--- a/librabbitmq/amqp_connection.c
> ++++ b/librabbitmq/amqp_connection.c
> +@@ -320,6 +320,13 @@ int amqp_handle_input(amqp_connection_state_t state=
, amqp_bytes_t received_data,
> +
> +       switch (decoded_frame->frame_type) {
> +         case AMQP_FRAME_METHOD:
> ++          /* A METHOD frame body must contain at least the 4-byte metho=
d id.
> ++           * Reject undersized frames before subtracting from target_si=
ze to
> ++           * avoid an unsigned underflow that would yield a huge encode=
d.len
> ++           * and cause out-of-bounds reads in amqp_decode_method(). */
> ++          if (state->target_size < HEADER_SIZE + 4 + FOOTER_SIZE) {
> ++            return AMQP_STATUS_BAD_AMQP_DATA;
> ++          }
> +           decoded_frame->payload.method.id =3D
> +               amqp_d32(amqp_offset(raw_frame, HEADER_SIZE));
> +           encoded.bytes =3D amqp_offset(raw_frame, HEADER_SIZE + 4);
> +@@ -335,6 +342,15 @@ int amqp_handle_input(amqp_connection_state_t state=
, amqp_bytes_t received_data,
> +           break;
> +
> +         case AMQP_FRAME_HEADER:
> ++          /* A HEADER frame body must contain at least 12 bytes (class_=
id,
> ++           * weight, body_size). Reject undersized frames before subtra=
cting
> ++           * from target_size to avoid an unsigned underflow that would=
 yield
> ++           * a huge encoded.len and cause out-of-bounds reads in
> ++           * amqp_decode_properties() / the table decoder
> ++           * (CVE: GHSA-9mmv-r8g3-qp46). */
> ++          if (state->target_size < HEADER_SIZE + 12 + FOOTER_SIZE) {
> ++            return AMQP_STATUS_BAD_AMQP_DATA;
> ++          }
> +           decoded_frame->payload.properties.class_id =3D
> +               amqp_d16(amqp_offset(raw_frame, HEADER_SIZE));
> +           /* unused 2-byte weight field goes here */
> +@@ -354,6 +370,9 @@ int amqp_handle_input(amqp_connection_state_t state,=
 amqp_bytes_t received_data,
> +           break;
> +
> +         case AMQP_FRAME_BODY:
> ++          if (state->target_size < HEADER_SIZE + FOOTER_SIZE) {
> ++            return AMQP_STATUS_BAD_AMQP_DATA;
> ++          }
> +           decoded_frame->payload.body_fragment.len =3D
> +               state->target_size - HEADER_SIZE - FOOTER_SIZE;
> +           decoded_frame->payload.body_fragment.bytes =3D
> diff --git a/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.15.0.bb=
 b/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.15.0.bb
> index 4fd6302f2c..642e1e443b 100644
> --- a/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.15.0.bb
> +++ b/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.15.0.bb
> @@ -4,6 +4,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D7e12f6e40e662e=
039e2f02b4893011ec"
>  LICENSE =3D "MIT"
>
>  SRC_URI =3D "git://github.com/alanxz/rabbitmq-c.git;branch=3Dmaster;prot=
ocol=3Dhttps \
> +           file://CVE-2026-44235.patch \
>  "
>  SRCREV =3D "84b81cd97a1b5515d3d4b304796680da24c666d8"
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#130249): https://lists.openembedded.org/g/openembedde=
d-devel/message/130249
> Mute This Topic: https://lists.openembedded.org/mt/121405170/3616702
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [a=
nuj.mittal@oss.qualcomm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

