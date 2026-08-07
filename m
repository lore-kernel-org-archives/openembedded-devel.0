Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A131DC5AC67
	for <webhook@archiver.kernel.org>; Fri,  7 Aug 2026 01:55:29 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34087.1786067719361182313
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Aug 2026 18:55:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=oqJDJ11k;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=X/iFMFIW;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6770GkrN3829279
	for <openembedded-devel@lists.openembedded.org>; Fri, 7 Aug 2026 01:55:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HTiThoYTEKMV9eOIf6xYtNSs8/pog1fwzxdUkLFplxc=; b=oqJDJ11keMq8oFHo
	ZJ9szcirLHkSCs6+8mF4HRVjbwoCcUS8QE+i5dkmAD//XDy7sJNc/YnFiLJp7Z2h
	IFpgBZ40wRFeJCiwJP4I3m2eXDsjPLEj+teFCjM6o1YJH56MkJNhZwpxVTQluFqD
	A0+ZWQQyFTYRKMSHR+EwpOzbmVPr6jV1OK0mOi0iV0REZHUfpdwXZikiGmasYQx5
	Gvo+2NPqy74bWA+HDo8ujFMCk9LAUj3aNVNGZ+pLI3PskK/NUDaN30LZyRFKY6Kl
	Hef2nyMnfIpnLrUWcWV/JMGP8zbARUif/2lVcZzHed7YcHATF2PA70rn+c3Ubf/M
	VWsuIA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvy6gss5k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 07 Aug 2026 01:55:17 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8f113592bf3so53406066d6.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 06 Aug 2026 18:55:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786067717; cv=none;
        d=google.com; s=arc-20260327;
        b=at7bDEjLTFUyZ1zM8tL9aEWLisJe9N1dvGNYPUn0jH5xXgHBoLPnVqk+AD+ifwo7Hy
         Q5HJHMhBkhJrRaGf0vGYPk9gxvPSS/IgGyeNvSje7Z99FrZmOt2Nhqjx1sGpHEQ30Cej
         7xRuJ2iW4EOCinq9o4fCODDfdqY4vSyd2oPwrKkFHj2Fb4OJqYXKEU+2UsnaNAOgQXUs
         n3oIkq0canQG4PG1wYWyL1Tcireq0ixn4RQz34eMJ6nqdXpqNAcNxFLOPJUpa16WwsiP
         5kv4GxUBpIUlWKRGKlf9adxA2J3PjD8V7Bd1csCcNQ1AYRN/eHp7ac7JSpg9NX3ZZr1h
         Zsvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HTiThoYTEKMV9eOIf6xYtNSs8/pog1fwzxdUkLFplxc=;
        fh=crjG6TB3brRy6rqaOYzwvCdW6cFQQ74zBxNhSq0sCSY=;
        b=WQ2LwEye3I5nOGVx9KFjvbbJQcySrg1VnYFcwwZ8L5qswqH2KmHnPeJc1Cht81RhmB
         Tb8y7seEsJ/bx4O0XqwIHEvvZVlgpw+2EhOqLnKGOH8jsfPuptH3BUsmGAeiNq26wV/b
         MdiTzlLNzie36ZrIezlsusMzQd7VuSLLPqxvnxhLgJhr5aYUSHVwGF8d7m6PFvSZyNPq
         5A37PVVJ0+t/z6kfbrmxyBFiezCAsn2bil3dnQ+ywnLgg6Wvn9GRT4RxSj0SQPFv/3f2
         sDvzjECVR9BcDReoboZ3GF7Qe6mzLOejcPRK6x8WqIEGEmku/fztrXQbb+woBbWQn1Tg
         xdIQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786067717; x=1786672517; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HTiThoYTEKMV9eOIf6xYtNSs8/pog1fwzxdUkLFplxc=;
        b=X/iFMFIWrGmybXzIxvRmdgxfxX0tTegI52Z56TI6dgU0dHPbDIzYfywo5aL4d7jVfa
         V2nQ8+scOX2QhAaK/zhA6i6HF4Lp0IMHAN95fg5F2NCdcA4mkhR0X6B4ho6gl5nkEJsD
         S7++Qu3CTbD+Yin4km87hvkNuzvSkK2g0xnFW1Ryk7+gqlgTsljMuJReb05Bg6ZQ8pRW
         nUZ6Tptr4E6i/5Rr4Iwu/n/RH1vk0q6lj+NILvcYFtNbui1uKx8mHfN06gLcOFGXEUgK
         chxGXItoUzvYnpkeCXKxKyQMCL71dPoBbbOSOLXLw8hlIoMJQ1wnq80o/j+oal812871
         MPDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786067717; x=1786672517;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HTiThoYTEKMV9eOIf6xYtNSs8/pog1fwzxdUkLFplxc=;
        b=DUlizqGsa/SXpDBunWdYX0/990WcsR9aLcJbGPeYU8wR3H9nTOe4k6XFXjmn8kofH0
         sCBmPqDzM19U0taADV5t5guMDANQuvMMEU3Z1VDUzyv/AJOAf1Mx6xkQwQ+k8ADPq0kb
         /x2UZxKAX0HAu29F/89KSK1C7R4y06V4kTiwD4pJTFhgcVFWrr7+wPRKkGu5Duz+TjvH
         KpXZib9JAANkNm+otMNvwIusTXZ2J4i/9liVGfsZTVq6zKqxtztmq9JXwvgV6c6eqGQG
         B5AHKOrrVS2grAiDy0CDiaBdiTyf3Pjr/NwKXZfZpT0YYJIf/bpm+2WVXjglKRQCAB+5
         7rjg==
X-Gm-Message-State: AOJu0Yys9l66LkQBGFFdtcFbyTuNkRLSOyDjnH/H2KfI3j/pQjUibYfC
	NF2HITOMsaS3CKXGvKDRAgIANXOh2id/wyRH/6SgGnMiZT73f2tWNXC9p6cNPRfZvbzO/0s4e/w
	Kjl6RVo4kesh93NkAJ8/lVHdJUA0grT9EbbeL/eRFW6N8jQg+I12FGQSoUqVAA3fGkB4ughO/tc
	ojCVKIHTXtrxQRhVQEnk9Cwj/CurusBEk4q2dluG3LQA0TFYUE+9qFdjmhj5o=
X-Gm-Gg: AR+sD10Ax9Bfu3kS9AgOFi7zbl+235Z1Qo4TUXywfBNIMLCIqdAj6MZxsgMiwE2eurB
	ghhU31KrtN02kSEjjVtPhqZ8R2R6FmstxvZq7YpxCewFnlX9btTPevRvCQ4CsOYy2lGzP5MVvsz
	3UU4icgh9SS4ZRFBFftks4fDgnUes94EPfpIt9sQMpiZV8VTOjnOC2QBc=
X-Received: by 2002:a05:6214:3d8c:b0:8f1:2607:ad86 with SMTP id 6a1803df08f44-9089b523523mr74527876d6.4.1786067717245;
        Thu, 06 Aug 2026 18:55:17 -0700 (PDT)
X-Received: by 2002:a05:6214:3d8c:b0:8f1:2607:ad86 with SMTP id
 6a1803df08f44-9089b523523mr74527626d6.4.1786067716820; Thu, 06 Aug 2026
 18:55:16 -0700 (PDT)
MIME-Version: 1.0
References: <20260729073145.25221-1-tugrul.kukul@est.tech>
In-Reply-To: <20260729073145.25221-1-tugrul.kukul@est.tech>
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Date: Fri, 7 Aug 2026 09:55:04 +0800
X-Gm-Features: AUfX_mxpnS_LUwAZEj2vNYOo5PEcVVyrL7PYJ_kbyRPghbTJk2fTQ5nJT7z4_Zk
Message-ID: <CA+s=J=wc0172D=Dan-Be5C-ea57UsTD9j8vxSUG4fQQ72iW0=w@mail.gmail.com>
Subject: Re: [oe] [meta-oe][wrynose][PATCH] jq: fix CVE-2026-39956
To: Tugrul Kukul <tugrul.kukul@est.tech>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=frDsol4f c=1 sm=1 tr=0 ts=6a753b05 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=PYnjg3YJAAAA:8 a=8r2qhXULAAAA:8 a=xNf9USuDAAAA:8
 a=uVn2tjYAAAAA:8 a=NEAV23lmAAAA:8 a=Q4-j1AaZAAAA:8 a=EUspDBNiAAAA:8
 a=6Nz6I46kxrwW5BkyJ6sA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
 a=8gvLZcY7Nlvl4CGD_6nf:22 a=i9ajM16GGMt3q4i3idVD:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-GUID: hGP2zHXepa5FcL5zlCCIx8_W3ZT9I6eM
X-Proofpoint-ORIG-GUID: hGP2zHXepa5FcL5zlCCIx8_W3ZT9I6eM
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDAxMCBTYWx0ZWRfXzK+0DcOKmjzD
 s0eJK2XuZ3Hdm8/vlNAHIi9Zu55OlaOx7Bvf1cSNbnGT7zBgUEBpPf00VVncqQyPT4HO6izqGTa
 LYDb34LVBdWWdidAYjx3eZ4F+vgKMZo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDAxMCBTYWx0ZWRfXy0bqGqaGRKYA
 Dr2Rnx96e5yo/OaStHF/TSgWIHKUS6BELXQCFxMXsXrobW0ElI0bAjroRKVUixCk3vTkzkZpKIl
 ThwLJPtlcUrysDvdb5/MYwYvqJzt421kudKLs7KBsk5Hec2UqPDFG+ui7dFsQtF9jbujMDxSwD+
 zMmLC4yXehfaUadRT3ZuI2R4bCkjBsfC9UPrd8ssRHFG1I2ZkqvgFgoB0GCXbbSY+25yydobOvy
 tIWEFVuANG6idYbgADFBt1SnqrnqktGYfmkE5DDSQ6afdb5kDpLmsOGXhHAEYxv0ujl+jAUTO4i
 VnXgZ2Y9vCpcgZjfdeN7c1n2v/1ZetKk7Z9pR3skz4FOiJMzGTgyi5u2Jb0FtdorDlPyHdEKbwt
 ZqSXxTEigfP9D66BrC7DwpCwQ45M2PmYgZvqbTmY3GfMoJehcUwq9b952RORNe8pQIgDBEqUqJB
 1alzNu2zeWlD5JqVLmA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_01,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 clxscore=1015 suspectscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608070010
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 07 Aug 2026 01:55:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128853

On Wed, Jul 29, 2026 at 3:31=E2=80=AFPM Tugrul Kukul <tugrul.kukul@est.tech=
> wrote:
>
> From: Tugrul Kukul <tugrul.kukul@est.tech>
>
> Backport patch to fix CVE-2026-39956.
>
> References:
>   https://nvd.nist.gov/vuln/detail/CVE-2026-39956
>   https://www.cve.org/CVERecord?id=3DCVE-2026-39956
>   https://security-tracker.debian.org/tracker/CVE-2026-39956
>   https://osv.dev/list?q=3DCVE-2026-39956
>
> Upstream fix:
>   https://github.com/jqlang/jq/commit/fdf8ef0f0810e3d365cdd5160de43db46f5=
7ed03 [nvd]
>
> Tested with ptest:
> Before: PASSED: 7, FAILED: 0, SKIPPED: 0
> After: PASSED: 7, FAILED: 0, SKIPPED: 0
>
> Signed-off-by: Tugrul Kukul <tugrul.kukul@est.tech>
> ---
>  .../jq/jq/CVE-2026-39956.patch                | 50 +++++++++++++++++++
>  meta-oe/recipes-devtools/jq/jq_1.8.1.bb       |  1 +
>  2 files changed, 51 insertions(+)
>  create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2026-39956.patch
>
> diff --git a/meta-oe/recipes-devtools/jq/jq/CVE-2026-39956.patch b/meta-o=
e/recipes-devtools/jq/jq/CVE-2026-39956.patch
> new file mode 100644
> index 0000000000..da41b1168f
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/jq/jq/CVE-2026-39956.patch
> @@ -0,0 +1,50 @@
> +From 8e7a4a3c01da36e0b9509b0e93a005649318e0f7 Mon Sep 17 00:00:00 2001
> +From: tlsbollei <170938166+tlsbollei@users.noreply.github.com>
> +Date: Wed, 8 Apr 2026 21:43:46 +0200
> +Subject: [PATCH] Add runtime type checks to f_string_indexes
> +
> +This fixes CVE-2026-39956.

This is missing CVE: tag and your Signed-off-by. Please send v2.

> +---
> + src/builtin.c | 8 ++++++++
> + tests/jq.test | 9 +++++++++
> + 2 files changed, 17 insertions(+)
> +
> +diff --git a/src/builtin.c b/src/builtin.c
> +index 52fe77c..ac56f9f 100644
> +--- a/src/builtin.c
> ++++ b/src/builtin.c
> +@@ -1286,6 +1286,14 @@ static jv f_string_explode(jq_state *jq, jv a) {
> + }
> +
> + static jv f_string_indexes(jq_state *jq, jv a, jv b) {
> ++  if (jv_get_kind(a) !=3D JV_KIND_STRING) {
> ++    jv_free(b);
> ++    return type_error(a, "cannot be searched, as it is not a string");
> ++  }
> ++  if (jv_get_kind(b) !=3D JV_KIND_STRING) {
> ++    jv_free(a);
> ++    return type_error(b, "is not a string");
> ++  }
> +   return jv_string_indexes(a, b);
> + }
> +
> +diff --git a/tests/jq.test b/tests/jq.test
> +index 4ecf72f..07aa0cf 100644
> +--- a/tests/jq.test
> ++++ b/tests/jq.test
> +@@ -1520,6 +1520,15 @@ split("")
> + "xababababax"
> + [1,7,[1,3,5,7]]
> +
> ++# _strindices is used by indices/1 but is callable
> ++try _strindices("abc") catch .
> ++123
> ++"number (123) cannot be searched, as it is not a string"
> ++
> ++try _strindices(123) catch .
> ++"abc"
> ++"number (123) is not a string"
> ++
> + # trim
> + # \u000b is vertical tab (\v not supported by json)
> + map(trim), map(ltrim), map(rtrim)
> diff --git a/meta-oe/recipes-devtools/jq/jq_1.8.1.bb b/meta-oe/recipes-de=
vtools/jq/jq_1.8.1.bb
> index b213e21c57..5d2a1be398 100644
> --- a/meta-oe/recipes-devtools/jq/jq_1.8.1.bb
> +++ b/meta-oe/recipes-devtools/jq/jq_1.8.1.bb
> @@ -27,6 +27,7 @@ SRC_URI =3D "git://github.com/jqlang/jq.git;protocol=3D=
https;branch=3Dmaster;tag=3Djq-${
>             file://CVE-2026-43895.patch \
>             file://CVE-2026-49839.patch \
>             file://CVE-2026-54679.patch \
> +           file://CVE-2026-39956.patch \
>             "
>
>  inherit autotools ptest
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#128550): https://lists.openembedded.org/g/openembedde=
d-devel/message/128550
> Mute This Topic: https://lists.openembedded.org/mt/120499649/3616702
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [a=
nuj.mittal@oss.qualcomm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

