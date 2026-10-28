Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36594.1793165439668011008
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Oct 2026 22:30:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=KQk4OLNN;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=GhdzIuFI;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69S4PUbx3936122
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Oct 2026 05:30:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uNMFWIiYo7EhcbJA8D8nHSNyUe/JMt4OcpTvVBwPVlQ=; b=KQk4OLNNDrkcz3eQ
	9VyeTyM3XGMvzl8HLjI0UCKKK397Gi6O+azlgFv5+zcL8ojbCZv6eFSoYzGe/9g3
	KWT+Y0jVhv1145gn4JqE3xVPX4OAKP/zaiBrZqKrsmA0O5AmQhqEB/VdCRouwEVZ
	1SSeMEczNc/QXjBxK8hpU/iTHLwnERt2DbrD8hcpn8Sztr9j9gvFOpdGCFxl6qip
	e5tBCkwLRJf7GiOp7Q9ypKFLJm1yOmcKXeMS6L5TrksxePK5f+REkdyh6+InOPFb
	NtI9kblzUiCD1sMZS4qtq75CgPfS7kcFEJ7QFfRYv+n4ra9r6m/BowcYzNIAQEWj
	UJVqcg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk6be0wue-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Oct 2026 05:30:38 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-534f3fe0236so13538511cf.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 22:30:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793165438; cv=none;
        d=google.com; s=arc-20260327;
        b=j6RqD68TByQiAmexJoRpdhOd096g7+2VofxCn39kkOPJlG5i6ZXVMS7umeuD7A5Wym
         0ntwQx4tQmzECaAiraNk5cEnZJMiDhRUJWPZslUxq0z1U3ogPx5taGRYDjq2Hp0z1Vox
         YEz72SXWliLkMbFD23V6QraIdLvRBz/U9Ss7Fpq7uFAsJFEiycykDaLYGbik/AJUe8jT
         1FUF21WXOEPHC5mwMtbwMnuCL5B0NMIf4c13rdWT1MU14/3ElM3IrSJVjFCR2Aro2jw6
         MqAP6qnzLSJpGAUWQYqakM3TkLcOKqORygF+2HgpMFF/G4k3Dpl5UDsxu3dkfMYdK7qa
         Ev2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uNMFWIiYo7EhcbJA8D8nHSNyUe/JMt4OcpTvVBwPVlQ=;
        fh=AWHoIbe33eE4vzLVuZV/wrPg8O6ULXyUtcZ0bWzuLxY=;
        b=qCFnFAZWqM7i7CnVor1QhbIn7zM2uFQk+2dGYf1zDKa5oGXmiXbNhzAg/RSNSSZpvn
         +cKtZ3x7Hx/6VmWe48pdxim9vcx6MoUp9M0immIXvs47h/7QBFhTT8HlSapaE4PSh0Z7
         lKSmbjTzh9y4I8w5FpjBZ1haShcrM4BOzgOX0htWGa2Gw4vnB7vsQX2crZgnFd1KLzxg
         cg+541mHSJNLfJdI1MUE4WhPYZR8I0lcJbAiFzPxBPTc0iIniCXv/oX8CALbB6g7+tFd
         xE5ialhFc9hKyzf/MATX8s2LMFl54ubCZZ+fY4S+PeDe5CDNaT4mbcjWL1jQCO3n6iDu
         miYw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793165438; x=1793770238; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uNMFWIiYo7EhcbJA8D8nHSNyUe/JMt4OcpTvVBwPVlQ=;
        b=GhdzIuFItK3a3iZiQdIPJK5OxPUNBYmEZT+s4LwYPiFUh6InBtPrwfVsNkslOlwyQv
         y9WNU99GZQpoyc9rJisn6gE5OW98hdfJsPXGdMycNVf6i5v//dLrgFdZbAsUC7obZ5os
         ldVoklfCg2GmT14KdHRCNBmW4Djs0dVoQ9Bot+JIrT7r1maKGEL868VT1WmmM1WrVi/M
         FJAY6+zNNIKtrZtL/Mm0lKX27qlL0xY8pL5Pdj2Vdk2MV3Oe5LAf1FzD6JIiMizInyE9
         17uc89rmeXRJAcYzaM2SIqj33DPihp2Po4AqlTUOBfzqHqNtzemHJVbcfadjcfj3oCe8
         oL6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793165438; x=1793770238;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uNMFWIiYo7EhcbJA8D8nHSNyUe/JMt4OcpTvVBwPVlQ=;
        b=VEDJKhSG8YU40NnHzsXweUtwF9ULDqUP+rGo/aEpjEmbkGlr3RJItIyv94lpCVg5Ir
         kfvQQ2CVIIQh00Q7IiCLRf6WerrM+vriPszC+2FOl3NuYBxb1Uy3WN3F6Lvtis0VQVg1
         /1TcHkchxbLY5xJkzQBZkyOmrzAMOsCLsJvyycRfmn4sQvEq1dAfHgWNepb8wJCYgxP3
         u0ymt9xCICLerIV2KkC4ERe9NBGARQ+4ulXS9JL5pfwwb7YN1Cl9Z1e5ulCC7wtvxKdh
         kLP4MyZL4OfFlZxBHyACOkQCRWK8NtBFG6eiUDMOxhcqTwqq51h07wGftlvQAIkh+TIz
         O4EA==
X-Gm-Message-State: AFq9FYKfZCULx4g3Shwb/IWAp7xZnuP1fmhp+e9QceBL8W0KVvcSq0qm
	G6eiQXlujEGedhcmOdhJ18d1pQvL3VHSe4uvUKz6GzibpjJPwfbEVSpmjpk+juwBEdidvCx9JHv
	tL6z5tf/AB4u3NT6vYmXOtgBqpNPYcRYomWttbfBWTBu4MB7CHW9dn24NRKCXBiUVtKzrzNEG+G
	mdcYE2lpnf38oZmVfrFc6BnDsu/TXVN+HsvA4Pu2vFP+WDaCTUCFmzpvwOiKi8lkDc/p2K/X1o
X-Gm-Gg: AYBFou1oO0PcXW6Duyhb/96xlgIPG4sqVmqtaXBUhXMi0w04StofbRxa1VHM63zz+Ww
	66wJlRPgRFBzS0ARd7J2V1Q+zH4R3qkU7PDgb+NId+Y/QO7AsK3elnSAOwfD/wxrIKy4OBnLSxj
	myrW7PqEsZy957aFoM/VU5mNbMAuKWfgt51EFoT2WbghGJO256KnCbXWZPwg==
X-Received: by 2002:a05:622a:1aaa:b0:536:9743:791d with SMTP id d75a77b69052e-53fcbcee726mr24593741cf.44.1793165437530;
        Tue, 27 Oct 2026 22:30:37 -0700 (PDT)
X-Received: by 2002:a05:622a:1aaa:b0:536:9743:791d with SMTP id
 d75a77b69052e-53fcbcee726mr24593371cf.44.1793165436838; Tue, 27 Oct 2026
 22:30:36 -0700 (PDT)
MIME-Version: 1.0
References: <20261009100104.2059406-1-Poornima.Lokesh@windriver.com>
In-Reply-To: <20261009100104.2059406-1-Poornima.Lokesh@windriver.com>
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 13:30:25 +0800
X-Gm-Features: AclHuK8YCP1GKOoWRx9QiVBOOVe3r-cgG3KJZqkF7rWo3UzT9JvCLBNRFjgkjcA
Message-ID: <CA+s=J=y8bZKPuTNfth6=Zo+zBMn25gMvzqbvrEirbdkVQO2NoQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][wrynose][PATCH] rabbitmq-c: fix CVE-2026-61547
To: Poornima.Lokesh@windriver.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: ER8JujwvYMAsoXr1YPQFeenp61dBni2Q
X-Authority-Analysis: v=2.4 cv=HeuB3SE8 c=1 sm=1 tr=0 ts=6ae1887e cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=iGHA9ds3AAAA:8 a=xNf9USuDAAAA:8 a=NEAV23lmAAAA:8
 a=PYnjg3YJAAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=EUspDBNiAAAA:8
 a=mpZb3cvrCWBjO1xzaS0A:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=nM-MV4yxpKKO9kiQg6Ot:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDAyMSBTYWx0ZWRfX2n/SrJIGM1iq
 cBiDaKbJLmGqEwwJr4CyOd8FiYDz3cUTeJWqeSLCAsJ/XXfVOC5HQJrIE7JJ+xf2KOKqc2aY3E9
 07eJ3AdSUig0qGm23/65eW2RZ1jFEyU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDAyMSBTYWx0ZWRfXxUU1Lzjtq0wz
 6bhnwn1OpBNRMRU8DibhV6f8hmfh1DOazyry9yK0S5YpoXCp1+1d30WQQTNeuE88cXtM+9wk931
 XeBAG03CQEwY/9XyLyAldKDglq8JLQy2+xU0ZEGtN1VRjSYbeWldNZLGY2ZmsSNcQRBBrM3W1qs
 /dFW1q8s5mwkLRiC2qaFvMx3pDUpUCgBAyw+FUiUpSNH+0bojrCqWGVOZuiP9j5pRxe1tLTyuIL
 9aUXZl52pmf3U3xDnTrs6cvYzKBVPTueodMEZsnuCa/EcrBC9hxBkSrKyR0qXA6fCPFFrZcHnP0
 YTyAxvd6BZgbUR87jQVxVyeMVvjhkyQh5r88wr6EyoLpJgD2w4tb6mrjBnwT9x0tsSCUj7sS4Vj
 /02VVG09AMwNWmPDMFluojO8IBgtGXmStuK0g1JbynA7dAcGQWeuDa1mospxbHL+shnBOpa/kjT
 3BJRItY+Gg8Q4esnTjw==
X-Proofpoint-GUID: ER8JujwvYMAsoXr1YPQFeenp61dBni2Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610280021
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 28 Oct 2026 05:30:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131615

This does not apply:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/builds/1906

On Fri, Oct 9, 2026 at 6:01=E2=80=AFPM Lokesh, Poornima via
lists.openembedded.org
<Poornima.Lokesh=3Dwindriver.com@lists.openembedded.org> wrote:
>
> A heap buffer overflow exists in rabbitmq-c when the public
> amqp_send_frame() API is used to serialize an oversized AMQP_FRAME_BODY.
> The issue occurs because amqp_frame_to_bytes() copies
> frame.payload.body_fragment.len bytes into the connection outbound
> buffer without validating that the body fragment fits within the
> allocated frame buffer. An application that passes an oversized body
> frame to amqp_send_frame() can trigger a heap out-of-bounds write,
> resulting in process crash and memory corruption.
>
> Reference:
> [https://security-tracker.debian.org/tracker/CVE-2026-61547]
> [https://github.com/alanxz/rabbitmq-c/security/advisories/GHSA-hfjv-vcp3-=
39wh]
>
> Backport the patch to fix CVE-2026-61547
> [https://github.com/alanxz/rabbitmq-c/commit/02d278663f3a93db9fe4fb4e7e34=
dc96b83c107b]
>
> Signed-off-by: Poornima Lokesh <Poornima.Lokesh@windriver.com>
> ---
>  .../rabbitmq-c/CVE-2026-61547.patch           | 128 ++++++++++++++++++
>  .../rabbitmq-c/rabbitmq-c_0.15.0.bb           |   1 +
>  2 files changed, 129 insertions(+)
>  create mode 100644 meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c/CV=
E-2026-61547.patch
>
> diff --git a/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c/CVE-2026-=
61547.patch b/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c/CVE-2026-6=
1547.patch
> new file mode 100644
> index 0000000000..d1e479c308
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c/CVE-2026-61547.p=
atch
> @@ -0,0 +1,128 @@
> +From 413658f73078b91dee9efb442add63cbf3cc8dea Mon Sep 17 00:00:00 2001
> +From: Poornima Lokesh <Poornima.Lokesh@windriver.com>
> +Date: Thu, 8 Oct 2026 09:29:12 +0000
> +Subject: [PATCH] rabbitmq-c: patch CVE-2026-61547
> +
> +Fix heap buffer overflow in amqp_frame_to_bytes for oversized body frame=
s.
> +
> +amqp_send_frame() -> amqp_frame_to_bytes() copied
> +frame.payload.body_fragment.len bytes into the outbound buffer without
> +validating that the body fragment fit within the allocated frame buffer.
> +An application passing an oversized AMQP_FRAME_BODY to the public
> +amqp_send_frame() API could trigger a heap out-of-bounds write.
> +
> +Bound the body fragment to the usable payload size
> +(buffer.len - HEADER_SIZE - FOOTER_SIZE), returning
> +AMQP_STATUS_BAD_AMQP_DATA when it does not fit. Add a regression test.
> +
> +Details:
> +https://nvd.nist.gov/vuln/detail/CVE-2026-61547
> +
> +CVE: CVE-2026-61547
> +
> +Upstream-Status: Backport [https://github.com/alanxz/rabbitmq-c/commit/0=
2d278663f3a93db9fe4fb4e7e34dc96b83c107b]
> +
> +Signed-off-by: Poornima Lokesh <Poornima.Lokesh@windriver.com>
> +---
> + librabbitmq/amqp_connection.c |  8 +++++
> + tests/CMakeLists.txt          |  3 ++
> + tests/test_send_frame.c       | 57 +++++++++++++++++++++++++++++++++++
> + 3 files changed, 68 insertions(+)
> + create mode 100644 tests/test_send_frame.c
> +
> +diff --git a/librabbitmq/amqp_connection.c b/librabbitmq/amqp_connection=
.c
> +index 56ab8a8..8c1e9c0 100644
> +--- a/librabbitmq/amqp_connection.c
> ++++ b/librabbitmq/amqp_connection.c
> +@@ -441,6 +441,14 @@ static int amqp_frame_to_bytes(const amqp_frame_t *=
frame, amqp_bytes_t buffer,
> +     case AMQP_FRAME_BODY: {
> +       const amqp_bytes_t *body =3D &frame->payload.body_fragment;
> +
> ++      /* Ensure the body fragment fits within the outbound buffer, leav=
ing
> ++       * room for the frame header and footer. Without this check an
> ++       * oversized body fragment would overflow the heap-allocated buff=
er. */
> ++      if (buffer.len < HEADER_SIZE + FOOTER_SIZE ||
> ++          body->len > buffer.len - (HEADER_SIZE + FOOTER_SIZE)) {
> ++        return AMQP_STATUS_BAD_AMQP_DATA;
> ++      }
> ++
> +       memcpy(amqp_offset(out_frame, HEADER_SIZE), body->bytes, body->le=
n);
> +
> +       out_frame_len =3D body->len;
> +diff --git a/tests/CMakeLists.txt b/tests/CMakeLists.txt
> +index 8c0aee0..194af0c 100644
> +--- a/tests/CMakeLists.txt
> ++++ b/tests/CMakeLists.txt
> +@@ -41,3 +41,6 @@ add_executable(test_merge_capabilities test_merge_capa=
bilities.c)
> + target_link_libraries(test_merge_capabilities rabbitmq-static)
> + add_test(merge_capabilities test_merge_capabilities)
> +
> ++add_executable(test_send_frame test_send_frame.c)
> ++target_link_libraries(test_send_frame rabbitmq-static)
> ++add_test(send_frame test_send_frame)
> +diff --git a/tests/test_send_frame.c b/tests/test_send_frame.c
> +new file mode 100644
> +index 0000000..4d8e067
> +--- /dev/null
> ++++ b/tests/test_send_frame.c
> +@@ -0,0 +1,57 @@
> ++// Copyright 2007 - 2021, Alan Antonuk and the rabbitmq-c contributors.
> ++// SPDX-License-Identifier: mit
> ++
> ++#include "amqp_private.h"
> ++#include <rabbitmq-c/amqp.h>
> ++#include <rabbitmq-c/framing.h>
> ++
> ++#include <stdio.h>
> ++#include <stdlib.h>
> ++#include <string.h>
> ++
> ++/* Regression test for GHSA-hfjv-vcp3-39wh: passing an oversized
> ++ * AMQP_FRAME_BODY to amqp_send_frame() must not overflow the outbound
> ++ * buffer. It should be rejected with AMQP_STATUS_BAD_AMQP_DATA. */
> ++static void test_oversized_body_frame_rejected(void) {
> ++  amqp_connection_state_t state =3D amqp_new_connection();
> ++  amqp_frame_t frame;
> ++  size_t body_len;
> ++  char *body;
> ++  int res;
> ++
> ++  if (state =3D=3D NULL) {
> ++    fprintf(stderr, "amqp_new_connection failed\n");
> ++    abort();
> ++  }
> ++
> ++  /* The default outbound buffer is AMQP_DEFAULT_FRAME_SIZE bytes; use =
a
> ++   * body fragment that is larger than that buffer can hold. */
> ++  body_len =3D state->outbound_buffer.len + 1024;
> ++  body =3D malloc(body_len);
> ++  if (body =3D=3D NULL) {
> ++    fprintf(stderr, "malloc failed\n");
> ++    abort();
> ++  }
> ++  memset(body, 'A', body_len);
> ++
> ++  memset(&frame, 0, sizeof(frame));
> ++  frame.frame_type =3D AMQP_FRAME_BODY;
> ++  frame.channel =3D 1;
> ++  frame.payload.body_fragment.bytes =3D body;
> ++  frame.payload.body_fragment.len =3D body_len;
> ++
> ++  res =3D amqp_send_frame(state, &frame);
> ++  if (res !=3D AMQP_STATUS_BAD_AMQP_DATA) {
> ++    fprintf(stderr, "expected AMQP_STATUS_BAD_AMQP_DATA (%d), got %d\n"=
,
> ++            AMQP_STATUS_BAD_AMQP_DATA, res);
> ++    abort();
> ++  }
> ++
> ++  free(body);
> ++  amqp_destroy_connection(state);
> ++}
> ++
> ++int main(void) {
> ++  test_oversized_body_frame_rejected();
> ++  return 0;
> ++}
> +--
> +2.35.5
> +
> diff --git a/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.15.0.bb=
 b/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.15.0.bb
> index 4fd6302f2c..b8bc5b57e3 100644
> --- a/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.15.0.bb
> +++ b/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.15.0.bb
> @@ -4,6 +4,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D7e12f6e40e662e=
039e2f02b4893011ec"
>  LICENSE =3D "MIT"
>
>  SRC_URI =3D "git://github.com/alanxz/rabbitmq-c.git;branch=3Dmaster;prot=
ocol=3Dhttps \
> +          file://CVE-2026-61547.patch \
>  "
>  SRCREV =3D "84b81cd97a1b5515d3d4b304796680da24c666d8"
>
> --
> 2.35.5
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#130681): https://lists.openembedded.org/g/openembedde=
d-devel/message/130681
> Mute This Topic: https://lists.openembedded.org/mt/121669319/3616702
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [a=
nuj.mittal@oss.qualcomm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
