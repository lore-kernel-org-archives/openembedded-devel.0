Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D27A9C9830C
	for <webhook@archiver.kernel.org>; Mon, 19 Jan 2026 03:04:47 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28277.1768791883100626504
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 18 Jan 2026 19:04:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=HPo9T4IK;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=jmc4Nf5m;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60IK2FGB3910883
	for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jan 2026 03:04:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XD3A/CxaQ0v+RB2/tZD1rqbWoOltcQqiurAYfZeEThw=; b=HPo9T4IKz/PwGxIN
	sK0NUA/5XatEosA1Wmn3gUr+O57d/A/B5Kf12q+WvrE+szMVhzVIP0bZIH3k8WaQ
	LOhuRnW535l6qvIfjHQwwVLf+RU+M3Zrd6XekiEGpomUg920HiO3+QA92kEC0C7Q
	I7me8aed4DJtmdCTb1xNfc6t7a2fETFNX4EDLsUNiB2lliBwDxFeQjxA5BCbdt+9
	Nr2fJCqHR532KP+vdXD2HDF2wtfeUQMMfjFPGvGlV6R7Fywmly3Eg2Bf0mvOj0EZ
	Txb6vpD3jiD4RBEvn5MG5rSNUvTgRe5DpWfQFbUw/aoFW5JyPnnUOp8mD3w4712i
	gLSBTw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4br1cqbkeb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jan 2026 03:04:42 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c52d3be24cso497855385a.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 18 Jan 2026 19:04:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768791881; cv=none;
        d=google.com; s=arc-20240605;
        b=VLiRvYSe4Fl+pUGFY9fgzaG2U0ueHEW6Btd2LT+fTvLDy+leKGwrz1/enzKR77lpR1
         9o7EUsnsW+jXO7AWMmmuttaut7/Fr0/XiOsrPS+OYRWyT2kHsA09DB/U/98bpM3nAS5z
         cs3LN4VrAgjOYVOd53K3IPnj2XjKQrDSllP2xB6pPHp0UoiOry6RTQxtk7cTsga3NRzh
         fsfWjEjRVrpr7VHyML+PmPgLKoa6MxlUG7moT0RMkKd4DUwy4O3pxjfOc1Vp9+gPgj1f
         GjcH0Urj6ngSHuEVqFrGxvUT7nPg28Wi/C7gt+qpxnuLF9PAjq29IWjG33RHjeqjLVqZ
         N4NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XD3A/CxaQ0v+RB2/tZD1rqbWoOltcQqiurAYfZeEThw=;
        fh=n0ZnAkKOhGDmrf8RLpwnC7FQ6xmEY5rofL6wXnjsXjs=;
        b=DbE8kvLOCfwFyJ+WQzKc1Wvryqu6GFXQrhBRWSRCw99RtNeElFD8ypnDXISIYyKGLs
         MqSSVnvMsUhkplqexEp7CgPOsvM13zlZ4djX8yomNa8XDDSxVJXeJH2ywyEGvXzhHLsx
         +aN+KMJ6HgGEx2qeCuKFznhWx35Sl/puj9RHJn9E3LwKfPUeIqdOng11VT3ybwCTnb78
         AUIuJeU658qQ03i5E10fX/4xuN0ar7qN2IaWXYPV8mOMBdr77f+JKzAcXvgTGrCKKBp8
         Wl5rdfQLZL22My1fN3qZ2Q4he43vxmfLxbIihBBTXjtKkEM5Nn0V7Yl+RCBCBaWe9DOQ
         oMEw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768791881; x=1769396681; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XD3A/CxaQ0v+RB2/tZD1rqbWoOltcQqiurAYfZeEThw=;
        b=jmc4Nf5mRu840PJc56+1KqlFCGZYTpn8/DtpgUJH9cYqqaQhLgrsGYwLW+JEu5uxpY
         Ie9RujAQjta1wh6If1BbiYFQnAqahAvqhfAA60CTMIIPRV0K8CPVtr1YW8A9MOwg4X5/
         CZzvUtEw9qnot4C16bcOUeOuSwrEtxWF83SwrpaxT96xpplhaPmneYSSCDJQ6w2EXQwX
         4rE+g8sfuSuRu1PMl1JXRoid4jmGT+HZC+67EbpzuGGWlrcvV2Ku5gimXV2qn2Uv2Al7
         pFTMq7hsBbrv7OcFlm3RhxNCFcZaTYvv/ZKNOOFO26DZmLaIX/5evi0ZXN8RqVwwLnIZ
         1HHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768791881; x=1769396681;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XD3A/CxaQ0v+RB2/tZD1rqbWoOltcQqiurAYfZeEThw=;
        b=U75T2Fk2U40d0LilL/J2D3gTDYmKxNaIdVEurxYoHk7CbLdzWSW6f3oRLZ2XBpMRBj
         l3fsbkxN6Nls3XMsq31qz1U2ua+2FGpb8mnIsZORYiaSbg7Bo2stcU2Q2UJuwLinIAd2
         fyP2mno48eeWMqX0fVNDDL9qzzBW5kB7iDC+9o6MJAVwiU/11keaQeU8JOpLknkjJSSP
         eS6OCqmPX8QsW/Od1i7/MCMMAVx4LMgAswVSZhf9uK97L5qbNCqrQUPcgC5Yuo27cIUg
         dJlYBGMOjH8g76W02oKNq4eu2RiHCE/c132KoeHMeMPDu5Tfu3Tgqy4jBYLbtX86L82a
         2asg==
X-Gm-Message-State: AOJu0Yy3Gdhg3EfuKt2IzQJUV67pv7YYwSf8vLC/TApyJX7S1ML4ebjr
	l+j+zN2raoNHSM/nWjnnn+TI8YLZcIBE5ZXgKKwNv0bqj5wJNkxA6khnMBZM3/mp2SQuic5k8x3
	kh5IFnwD1oZCFJ+FdHEgKPOJie28csIRLgB2CAORzvnghHs3sU1dR31/pCf+6RFhm3kOh0OQGm2
	3vTSXFAkLUrLIBZTyutteR2S2ZxLppl0dvj8cY06scU1DdwsqEcd2hzpbzRjU=
X-Gm-Gg: AY/fxX68FAh+iYX+LgluQ5izt2RBb7Zdn9py15OplipsAi/ICBcAFulY7YpjGkXhBHm
	pETmQ2eCEYO2FhKc8XmIAFiW4/EMCkxdSLoidOIKvfl1xg+qtJbJipGw1IxvKi7bpPspAjryv2l
	K7DVZHjQJ+o9uV0/f2x1zt3OYQkZHhTev1tumyX78Z1wfvCxWCv/dQjuQBHFugLR7f
X-Received: by 2002:a05:620a:2a05:b0:8b9:cf85:40a0 with SMTP id af79cd13be357-8c6a678aa18mr1295333185a.57.1768791881207;
        Sun, 18 Jan 2026 19:04:41 -0800 (PST)
X-Received: by 2002:a05:620a:2a05:b0:8b9:cf85:40a0 with SMTP id
 af79cd13be357-8c6a678aa18mr1295329685a.57.1768791880501; Sun, 18 Jan 2026
 19:04:40 -0800 (PST)
MIME-Version: 1.0
References: <20260114130100.1016416-1-ankur.tyagi85@gmail.com> <20260114130100.1016416-5-ankur.tyagi85@gmail.com>
In-Reply-To: <20260114130100.1016416-5-ankur.tyagi85@gmail.com>
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Date: Mon, 19 Jan 2026 11:04:29 +0800
X-Gm-Features: AZwV_QiMf-nE75VBJUhIlbZDD08zqu-pWhvEI4Ho4GR3wO2m5pkddYFwPMS02lQ
Message-ID: <CA+s=J=zLNB7W3twLv6pK2mHNBm5MHRDRRafoHHL1Hn6a9p8y2Q@mail.gmail.com>
Subject: Re: [oe][meta-python][scarthgap][PATCH 05/20] python3-cbor2: patch CVE-2025-68131
To: ankur.tyagi85@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: Xc_JMHv-hSqz4YdmFVgcYRubd5_A0PDf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDAyNCBTYWx0ZWRfX4cYPogMb6r8S
 n3zwc+02hVnpknkbhWoP+zVRyI0QaJYUV95ShCsCOwVc/vudnJRwjaWXeRR/8B3OboogG9rhOye
 d6TpJ0yeiDv+hq4OlQtE3wR2S93PdWGVg4Q5W3SEDKWo3CMgAWpcNUu/Bx6wGEubjp+xJPJaCL3
 6Nhs87sKBUnwTBSbyaLQ9/Hs03iwfM3CDhvuwsyVLgi2lShs9QV/7H1J0cRg29DCl9E5f1SoJC/
 TEdadm4oj0nM/dqOmNclU3fdEw2bu3is1mcsenwOoFTlxMAKl6TKmkmsVkWieu+tuimPJHSz6cp
 808Z5Ua34HJZUPUUVWpMR9LE/3EYWIKV0zmoEB1Q7kz/pc+pUt0Xne9ZZzkWixhAVUmMDLu7/5E
 j86QMv9bBteo2hrQyEtn/orFrNLZdnCsqWwmN1T/4DXgtQ0EDQA5bptDmvRjiu9ahBcXG8RFz9X
 0JmyLdAy2s0rg7YD5DA==
X-Proofpoint-ORIG-GUID: Xc_JMHv-hSqz4YdmFVgcYRubd5_A0PDf
X-Authority-Analysis: v=2.4 cv=NfbrFmD4 c=1 sm=1 tr=0 ts=696d9f4a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=PYnjg3YJAAAA:8 a=NEAV23lmAAAA:8
 a=Q4-j1AaZAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=EBo9BTRYcxBN6ndD8mcA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-17_03,2026-01-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 adultscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601190024
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Jan 2026 03:04:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123581

Can you please rebase this and send a v2?

On Wed, Jan 14, 2026 at 9:01=E2=80=AFPM Ankur Tyagi via lists.openembedded.=
org
<ankur.tyagi85=3Dgmail.com@lists.openembedded.org> wrote:
>
> From: Ankur Tyagi <ankur.tyagi85@gmail.com>
>
> Backport the patch[1] which fixes this vulnerability as mentioned in the
> comment[2].
> Details: https://nvd.nist.gov/vuln/detail/CVE-2025-68131
>
> [1] https://github.com/agronholm/cbor2/commit/f1d701cd2c411ee40bb1fe383af=
e7f365f35abf0
> [2] https://github.com/agronholm/cbor2/pull/268#issuecomment-3719179000
>
> Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> ---
>  .../python/python3-cbor2/CVE-2025-68131.patch | 514 ++++++++++++++++++
>  .../python/python3-cbor2_5.6.4.bb             |   1 +
>  2 files changed, 515 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python/python3-cbor2/CVE=
-2025-68131.patch
>
> diff --git a/meta-python/recipes-devtools/python/python3-cbor2/CVE-2025-6=
8131.patch b/meta-python/recipes-devtools/python/python3-cbor2/CVE-2025-681=
31.patch
> new file mode 100644
> index 0000000000..dd1131f0d1
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-cbor2/CVE-2025-68131.pa=
tch
> @@ -0,0 +1,514 @@
> +From 7be0ee8272a541e291f13ed67d69b951ae42a9da Mon Sep 17 00:00:00 2001
> +From: Andreas Eriksen <andreer@vespa.ai>
> +Date: Thu, 18 Dec 2025 16:48:26 +0100
> +Subject: [PATCH] Merge commit from fork
> +
> +* track depth of recursive encode/decode, clear shared refs on start
> +
> +* test that shared refs are cleared on start
> +
> +* add fix-shared-state-reset to version history
> +
> +* clear shared state _after_ encode/decode
> +
> +* use PY_SSIZE_T_MAX to clear shareables list
> +
> +* use context manager for python decoder depth tracking
> +
> +* use context manager for python encoder depth tracking
> +
> +CVE: CVE-2025-68131
> +Upstream-Status: Backport [https://github.com/agronholm/cbor2/commit/f1d=
701cd2c411ee40bb1fe383afe7f365f35abf0]
> +Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> +---
> + cbor2/_decoder.py     | 38 ++++++++++++++++++-----
> + cbor2/_encoder.py     | 44 ++++++++++++++++++++++-----
> + source/decoder.c      | 28 ++++++++++++++++-
> + source/decoder.h      |  1 +
> + source/encoder.c      | 23 ++++++++++++--
> + source/encoder.h      |  1 +
> + tests/test_decoder.py | 61 +++++++++++++++++++++++++++++++++++++
> + tests/test_encoder.py | 70 +++++++++++++++++++++++++++++++++++++++++++
> + 8 files changed, 249 insertions(+), 17 deletions(-)
> +
> +diff --git a/cbor2/_decoder.py b/cbor2/_decoder.py
> +index c8f1a8f..4aeadcf 100644
> +--- a/cbor2/_decoder.py
> ++++ b/cbor2/_decoder.py
> +@@ -5,6 +5,7 @@ import struct
> + import sys
> + from codecs import getincrementaldecoder
> + from collections.abc import Callable, Mapping, Sequence
> ++from contextlib import contextmanager
> + from datetime import date, datetime, timedelta, timezone
> + from io import BytesIO
> + from typing import IO, TYPE_CHECKING, Any, TypeVar, cast, overload
> +@@ -59,6 +60,7 @@ class CBORDecoder:
> +         "_immutable",
> +         "_str_errors",
> +         "_stringref_namespace",
> ++        "_decode_depth",
> +     )
> +
> +     _fp: IO[bytes]
> +@@ -100,6 +102,7 @@ class CBORDecoder:
> +         self._shareables: list[object] =3D []
> +         self._stringref_namespace: list[str | bytes] | None =3D None
> +         self._immutable =3D False
> ++        self._decode_depth =3D 0
> +
> +     @property
> +     def immutable(self) -> bool:
> +@@ -225,13 +228,33 @@ class CBORDecoder:
> +             if unshared:
> +                 self._share_index =3D old_index
> +
> ++    @contextmanager
> ++    def _decoding_context(self):
> ++        """
> ++        Context manager for tracking decode depth and clearing shared s=
tate.
> ++
> ++        Shared state is cleared at the end of each top-level decode to =
prevent
> ++        shared references from leaking between independent decode opera=
tions.
> ++        Nested calls (from hooks) must preserve the state.
> ++        """
> ++        self._decode_depth +=3D 1
> ++        try:
> ++            yield
> ++        finally:
> ++            self._decode_depth -=3D 1
> ++            assert self._decode_depth >=3D 0
> ++            if self._decode_depth =3D=3D 0:
> ++                self._shareables.clear()
> ++                self._share_index =3D None
> ++
> +     def decode(self) -> object:
> +         """
> +         Decode the next value from the stream.
> +
> +         :raises CBORDecodeError: if there is any problem decoding the s=
tream
> +         """
> +-        return self._decode()
> ++        with self._decoding_context():
> ++            return self._decode()
> +
> +     def decode_from_bytes(self, buf: bytes) -> object:
> +         """
> +@@ -242,12 +265,13 @@ class CBORDecoder:
> +         object needs to be decoded separately from the rest but while s=
till
> +         taking advantage of the shared value registry.
> +         """
> +-        with BytesIO(buf) as fp:
> +-            old_fp =3D self.fp
> +-            self.fp =3D fp
> +-            retval =3D self._decode()
> +-            self.fp =3D old_fp
> +-            return retval
> ++        with self._decoding_context():
> ++            with BytesIO(buf) as fp:
> ++                old_fp =3D self.fp
> ++                self.fp =3D fp
> ++                retval =3D self._decode()
> ++                self.fp =3D old_fp
> ++                return retval
> +
> +     @overload
> +     def _decode_length(self, subtype: int) -> int: ...
> +diff --git a/cbor2/_encoder.py b/cbor2/_encoder.py
> +index 699c656..a653026 100644
> +--- a/cbor2/_encoder.py
> ++++ b/cbor2/_encoder.py
> +@@ -123,6 +123,7 @@ class CBOREncoder:
> +         "string_referencing",
> +         "string_namespacing",
> +         "_string_references",
> ++        "_encode_depth",
> +     )
> +
> +     _fp: IO[bytes]
> +@@ -183,6 +184,7 @@ class CBOREncoder:
> +             int, tuple[object, int | None]
> +         ] =3D {}  # indexes used for value sharing
> +         self._string_references: dict[str | bytes, int] =3D {}  # index=
es used for string references
> ++        self._encode_depth =3D 0
> +         self._encoders =3D default_encoders.copy()
> +         if canonical:
> +             self._encoders.update(canonical_encoders)
> +@@ -298,6 +300,24 @@ class CBOREncoder:
> +         """
> +         self._fp_write(data)
> +
> ++    @contextmanager
> ++    def _encoding_context(self):
> ++        """
> ++        Context manager for tracking encode depth and clearing shared s=
tate.
> ++
> ++        Shared state is cleared at the end of each top-level encode to =
prevent
> ++        shared references from leaking between independent encode opera=
tions.
> ++        Nested calls (from hooks) must preserve the state.
> ++        """
> ++        self._encode_depth +=3D 1
> ++        try:
> ++            yield
> ++        finally:
> ++            self._encode_depth -=3D 1
> ++            if self._encode_depth =3D=3D 0:
> ++                self._shared_containers.clear()
> ++                self._string_references.clear()
> ++
> +     def encode(self, obj: Any) -> None:
> +         """
> +         Encode the given object using CBOR.
> +@@ -305,6 +325,16 @@ class CBOREncoder:
> +         :param obj:
> +             the object to encode
> +         """
> ++        with self._encoding_context():
> ++            self._encode_value(obj)
> ++
> ++    def _encode_value(self, obj: Any) -> None:
> ++        """
> ++        Internal fast path for encoding - used by built-in encoders.
> ++
> ++        External code should use encode() instead, which properly manag=
es
> ++        shared state between independent encode operations.
> ++        """
> +         obj_type =3D obj.__class__
> +         encoder =3D self._encoders.get(obj_type) or self._find_encoder(=
obj_type) or self._default
> +         if not encoder:
> +@@ -448,14 +478,14 @@ class CBOREncoder:
> +     def encode_array(self, value: Sequence[Any]) -> None:
> +         self.encode_length(4, len(value))
> +         for item in value:
> +-            self.encode(item)
> ++            self._encode_value(item)
> +
> +     @container_encoder
> +     def encode_map(self, value: Mapping[Any, Any]) -> None:
> +         self.encode_length(5, len(value))
> +         for key, val in value.items():
> +-            self.encode(key)
> +-            self.encode(val)
> ++            self._encode_value(key)
> ++            self._encode_value(val)
> +
> +     def encode_sortable_key(self, value: Any) -> tuple[int, bytes]:
> +         """
> +@@ -477,10 +507,10 @@ class CBOREncoder:
> +                 # String referencing requires that the order encoded is
> +                 # the same as the order emitted so string references ar=
e
> +                 # generated after an order is determined
> +-                self.encode(realkey)
> ++                self._encode_value(realkey)
> +             else:
> +                 self._fp_write(sortkey[1])
> +-            self.encode(value)
> ++            self._encode_value(value)
> +
> +     def encode_semantic(self, value: CBORTag) -> None:
> +         # Nested string reference domains are distinct
> +@@ -491,7 +521,7 @@ class CBOREncoder:
> +             self._string_references =3D {}
> +
> +         self.encode_length(6, value.tag)
> +-        self.encode(value.value)
> ++        self._encode_value(value.value)
> +
> +         self.string_referencing =3D old_string_referencing
> +         self._string_references =3D old_string_references
> +@@ -554,7 +584,7 @@ class CBOREncoder:
> +     def encode_stringref(self, value: str | bytes) -> None:
> +         # Semantic tag 25
> +         if not self._stringref(value):
> +-            self.encode(value)
> ++            self._encode_value(value)
> +
> +     def encode_rational(self, value: Fraction) -> None:
> +         # Semantic tag 30
> +diff --git a/source/decoder.c b/source/decoder.c
> +index fd4d70c..033b73f 100644
> +--- a/source/decoder.c
> ++++ b/source/decoder.c
> +@@ -142,6 +142,7 @@ CBORDecoder_new(PyTypeObject *type, PyObject *args, =
PyObject *kwargs)
> +         self->str_errors =3D PyBytes_FromString("strict");
> +         self->immutable =3D false;
> +         self->shared_index =3D -1;
> ++        self->decode_depth =3D 0;
> +     }
> +     return (PyObject *) self;
> + error:
> +@@ -2052,11 +2053,30 @@ decode(CBORDecoderObject *self, DecodeOptions op=
tions)
> + }
> +
> +
> ++// Reset shared state at the end of each top-level decode to prevent
> ++// shared references from leaking between independent decode operations=
.
> ++// Nested calls (from hooks) must preserve the state.
> ++static inline void
> ++clear_shareable_state(CBORDecoderObject *self)
> ++{
> ++    PyList_SetSlice(self->shareables, 0, PY_SSIZE_T_MAX, NULL);
> ++    self->shared_index =3D -1;
> ++}
> ++
> ++
> + // CBORDecoder.decode(self) -> obj
> + PyObject *
> + CBORDecoder_decode(CBORDecoderObject *self)
> + {
> +-    return decode(self, DECODE_NORMAL);
> ++    PyObject *ret;
> ++    self->decode_depth++;
> ++    ret =3D decode(self, DECODE_NORMAL);
> ++    self->decode_depth--;
> ++    assert(self->decode_depth >=3D 0);
> ++    if (self->decode_depth =3D=3D 0) {
> ++        clear_shareable_state(self);
> ++    }
> ++    return ret;
> + }
> +
> +
> +@@ -2069,6 +2089,7 @@ CBORDecoder_decode_from_bytes(CBORDecoderObject *s=
elf, PyObject *data)
> +     if (!_CBOR2_BytesIO && _CBOR2_init_BytesIO() =3D=3D -1)
> +         return NULL;
> +
> ++    self->decode_depth++;
> +     save_read =3D self->read;
> +     buf =3D PyObject_CallFunctionObjArgs(_CBOR2_BytesIO, data, NULL);
> +     if (buf) {
> +@@ -2080,6 +2101,11 @@ CBORDecoder_decode_from_bytes(CBORDecoderObject *=
self, PyObject *data)
> +         Py_DECREF(buf);
> +     }
> +     self->read =3D save_read;
> ++    self->decode_depth--;
> ++    assert(self->decode_depth >=3D 0);
> ++    if (self->decode_depth =3D=3D 0) {
> ++        clear_shareable_state(self);
> ++    }
> +     return ret;
> + }
> +
> +diff --git a/source/decoder.h b/source/decoder.h
> +index 6bb6d52..a2f1bcb 100644
> +--- a/source/decoder.h
> ++++ b/source/decoder.h
> +@@ -13,6 +13,7 @@ typedef struct {
> +     PyObject *str_errors;
> +     bool immutable;
> +     Py_ssize_t shared_index;
> ++    Py_ssize_t decode_depth;
> + } CBORDecoderObject;
> +
> + extern PyTypeObject CBORDecoderType;
> +diff --git a/source/encoder.c b/source/encoder.c
> +index a0670aa..a7738a0 100644
> +--- a/source/encoder.c
> ++++ b/source/encoder.c
> +@@ -113,6 +113,7 @@ CBOREncoder_new(PyTypeObject *type, PyObject *args, =
PyObject *kwargs)
> +         self->shared_handler =3D NULL;
> +         self->string_referencing =3D false;
> +         self->string_namespacing =3D false;
> ++        self->encode_depth =3D 0;
> +     }
> +     return (PyObject *) self;
> + }
> +@@ -2027,17 +2028,35 @@ encode(CBOREncoderObject *self, PyObject *value)
> + }
> +
> +
> ++// Reset shared state at the end of each top-level encode to prevent
> ++// shared references from leaking between independent encode operations=
.
> ++// Nested calls (from hooks or recursive encoding) must preserve the st=
ate.
> ++static inline void
> ++clear_shared_state(CBOREncoderObject *self)
> ++{
> ++    PyDict_Clear(self->shared);
> ++    PyDict_Clear(self->string_references);
> ++}
> ++
> ++
> + // CBOREncoder.encode(self, value)
> + PyObject *
> + CBOREncoder_encode(CBOREncoderObject *self, PyObject *value)
> + {
> +     PyObject *ret;
> +
> +-    // TODO reset shared dict?
> +-    if (Py_EnterRecursiveCall(" in CBOREncoder.encode"))
> ++    self->encode_depth++;
> ++    if (Py_EnterRecursiveCall(" in CBOREncoder.encode")) {
> ++        self->encode_depth--;
> +         return NULL;
> ++    }
> +     ret =3D encode(self, value);
> +     Py_LeaveRecursiveCall();
> ++    self->encode_depth--;
> ++    assert(self->encode_depth >=3D 0);
> ++    if (self->encode_depth =3D=3D 0) {
> ++        clear_shared_state(self);
> ++    }
> +     return ret;
> + }
> +
> +diff --git a/source/encoder.h b/source/encoder.h
> +index 8b2d696..0dcc46d 100644
> +--- a/source/encoder.h
> ++++ b/source/encoder.h
> +@@ -24,6 +24,7 @@ typedef struct {
> +     bool value_sharing;
> +     bool string_referencing;
> +     bool string_namespacing;
> ++    Py_ssize_t encode_depth;
> + } CBOREncoderObject;
> +
> + extern PyTypeObject CBOREncoderType;
> +diff --git a/tests/test_decoder.py b/tests/test_decoder.py
> +index 485c604..253d079 100644
> +--- a/tests/test_decoder.py
> ++++ b/tests/test_decoder.py
> +@@ -961,3 +961,64 @@ def test_oversized_read(impl, payload: bytes, tmp_p=
ath: Path) -> None:
> +         dummy_path.write_bytes(payload)
> +         with dummy_path.open("rb") as f:
> +             impl.load(f)
> ++
> ++class TestDecoderReuse:
> ++    """
> ++    Tests for correct behavior when reusing CBORDecoder instances.
> ++    """
> ++
> ++    def test_decoder_reuse_resets_shared_refs(self, impl):
> ++        """
> ++        Shared references should be scoped to a single decode operation=
,
> ++        not persist across multiple decodes on the same decoder instanc=
e.
> ++        """
> ++        # Message with shareable tag (28)
> ++        msg1 =3D impl.dumps(impl.CBORTag(28, "first_value"))
> ++
> ++        # Message with sharedref tag (29) referencing index 0
> ++        msg2 =3D impl.dumps(impl.CBORTag(29, 0))
> ++
> ++        # Reuse decoder across messages
> ++        decoder =3D impl.CBORDecoder(BytesIO(msg1))
> ++        result1 =3D decoder.decode()
> ++        assert result1 =3D=3D "first_value"
> ++
> ++        # Second decode should fail - sharedref(0) doesn't exist in thi=
s context
> ++        decoder.fp =3D BytesIO(msg2)
> ++        with pytest.raises(impl.CBORDecodeValueError, match=3D"shared r=
eference"):
> ++            decoder.decode()
> ++
> ++    def test_decode_from_bytes_resets_shared_refs(self, impl):
> ++        """
> ++        decode_from_bytes should also reset shared references between c=
alls.
> ++        """
> ++        msg1 =3D impl.dumps(impl.CBORTag(28, "value"))
> ++        msg2 =3D impl.dumps(impl.CBORTag(29, 0))
> ++
> ++        decoder =3D impl.CBORDecoder(BytesIO(b""))
> ++        decoder.decode_from_bytes(msg1)
> ++
> ++        with pytest.raises(impl.CBORDecodeValueError, match=3D"shared r=
eference"):
> ++            decoder.decode_from_bytes(msg2)
> ++
> ++    def test_shared_refs_within_single_decode(self, impl):
> ++        """
> ++        Shared references must work correctly within a single decode op=
eration.
> ++
> ++        Note: This tests non-cyclic sibling references [shareable(x), s=
haredref(0)],
> ++        which is a different pattern from test_cyclic_array/test_cyclic=
_map that
> ++        test self-referencing structures like shareable([sharedref(0)])=
.
> ++        """
> ++        # [shareable("hello"), sharedref(0)] -> ["hello", "hello"]
> ++        data =3D unhexlify(
> ++            "82"  # array(2)
> ++            "d81c"  # tag(28) shareable
> ++            "65"  # text(5)
> ++            "68656c6c6f"  # "hello"
> ++            "d81d"  # tag(29) sharedref
> ++            "00"  # unsigned(0)
> ++        )
> ++
> ++        result =3D impl.loads(data)
> ++        assert result =3D=3D ["hello", "hello"]
> ++        assert result[0] is result[1]  # Same object reference
> +\ No newline at end of file
> +diff --git a/tests/test_encoder.py b/tests/test_encoder.py
> +index f2ef248..3ca6a95 100644
> +--- a/tests/test_encoder.py
> ++++ b/tests/test_encoder.py
> +@@ -654,3 +654,73 @@ def test_invariant_encode_decode(impl, val):
> +     undergoing an encode and decode)
> +     """
> +     assert impl.loads(impl.dumps(val)) =3D=3D val
> ++
> ++
> ++class TestEncoderReuse:
> ++    """
> ++    Tests for correct behavior when reusing CBOREncoder instances.
> ++    """
> ++
> ++    def test_encoder_reuse_resets_shared_containers(self, impl):
> ++        """
> ++        Shared container tracking should be scoped to a single encode o=
peration,
> ++        not persist across multiple encodes on the same encoder instanc=
e.
> ++        """
> ++        fp =3D BytesIO()
> ++        encoder =3D impl.CBOREncoder(fp, value_sharing=3DTrue)
> ++        shared_obj =3D ["hello"]
> ++
> ++        # First encode: object is tracked in shared containers
> ++        encoder.encode([shared_obj, shared_obj])
> ++
> ++        # Second encode on new fp: should produce valid standalone CBOR
> ++        # (not a sharedref pointing to stale first-encode data)
> ++        encoder.fp =3D BytesIO()
> ++        encoder.encode(shared_obj)
> ++        second_output =3D encoder.fp.getvalue()
> ++
> ++        # The second output must be decodable on its own
> ++        result =3D impl.loads(second_output)
> ++        assert result =3D=3D ["hello"]
> ++
> ++    def test_encode_to_bytes_resets_shared_containers(self, impl):
> ++        """
> ++        encode_to_bytes should also reset shared container tracking bet=
ween calls.
> ++        """
> ++        fp =3D BytesIO()
> ++        encoder =3D impl.CBOREncoder(fp, value_sharing=3DTrue)
> ++        shared_obj =3D ["hello"]
> ++
> ++        # First encode
> ++        encoder.encode_to_bytes([shared_obj, shared_obj])
> ++
> ++        # Second encode should produce valid standalone CBOR
> ++        result_bytes =3D encoder.encode_to_bytes(shared_obj)
> ++        result =3D impl.loads(result_bytes)
> ++        assert result =3D=3D ["hello"]
> ++
> ++    def test_encoder_hook_does_not_reset_state(self, impl):
> ++        """
> ++        When a custom encoder hook calls encode(), the shared container
> ++        tracking should be preserved (not reset mid-operation).
> ++        """
> ++
> ++        class Custom:
> ++            def __init__(self, value):
> ++                self.value =3D value
> ++
> ++        def custom_encoder(encoder, obj):
> ++            # Hook encodes the wrapped value
> ++            encoder.encode(obj.value)
> ++
> ++        # Encode a Custom wrapping a list
> ++        data =3D impl.dumps(Custom(["a", "b"]), default=3Dcustom_encode=
r)
> ++
> ++        # Verify the output decodes correctly
> ++        result =3D impl.loads(data)
> ++        assert result =3D=3D ["a", "b"]
> ++
> ++        # Test nested Custom objects - hook should work recursively
> ++        data2 =3D impl.dumps(Custom(Custom(["x"])), default=3Dcustom_en=
coder)
> ++        result2 =3D impl.loads(data2)
> ++        assert result2 =3D=3D ["x"]
> +\ No newline at end of file
> diff --git a/meta-python/recipes-devtools/python/python3-cbor2_5.6.4.bb b=
/meta-python/recipes-devtools/python/python3-cbor2_5.6.4.bb
> index f0c2964f34..0c2a4588ef 100644
> --- a/meta-python/recipes-devtools/python/python3-cbor2_5.6.4.bb
> +++ b/meta-python/recipes-devtools/python/python3-cbor2_5.6.4.bb
> @@ -12,6 +12,7 @@ DEPENDS +=3D "python3-setuptools-scm-native"
>
>  SRC_URI +=3D " \
>          file://run-ptest \
> +        file://CVE-2025-68131.patch \
>  "
>
>  RDEPENDS:${PN}-ptest +=3D " \
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#123458): https://lists.openembedded.org/g/openembedde=
d-devel/message/123458
> Mute This Topic: https://lists.openembedded.org/mt/117260217/3616702
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [a=
nuj.mittal@oss.qualcomm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

