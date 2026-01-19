Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDD77C9830C
	for <webhook@archiver.kernel.org>; Mon, 19 Jan 2026 03:01:27 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28224.1768791686363953904
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 18 Jan 2026 19:01:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=XP0SKEfR;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=hSRF0FR8;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60ILPXNr095176
	for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jan 2026 03:01:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mLnWxSXEUlmzNkKnKNxaRiIhrvOhms2g0ApONhLtl44=; b=XP0SKEfRcV5su2Qe
	LZ9uOFGH/29Baz0Tp2gZg2ApY1oiaOD8K6rh7o8x4X/y2qYljvxXHQ9JQ2Rfo86s
	mTsgJ0yJ5EboSq1pkObh+eyN7BpaQ5zCmiScKcCFGUV3ysGnotEeLhELlKVTuOpW
	/7X+67uV/tsC+5OMa3yH0LjspITf8lQwY+S1cvHnTcCZX9zw2Nj8IxqLqdslz96S
	L+LfWQh+eA8GTpwDT+DH1IhxC1nl69hCgQC3vZwIxK+DwL2VCPuTHVYCwNZ06LyF
	LIFtigiiWZtkm1+s+TR0TRp/AdGByvfz2SAegcDsX3n36KU4vjxhwTGyCjXqaMOR
	nh1ouQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4br36dbdeb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jan 2026 03:01:25 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-88a360b8096so92534636d6.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 18 Jan 2026 19:01:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768791685; cv=none;
        d=google.com; s=arc-20240605;
        b=PCSTeYEmWrweHXQvvhgdnNXvuENPjCXjymSjF8EPaT/JFKhPCdhGAhoZsjBJqWt0Eg
         FYM7oQP4Dsekc8TS/oPec7Mj+b4ZltVKrhoQp/RdMLDPysyNQBoi3YAM1yVzOoAzf2gO
         mwKhLwzA50CdbLwgWKtyXwRfBEptuDbxaL2WVLehD3OIm40q6lmMOwVOd09PBiLEcR6+
         Is50CVZwckdF/fyRsYebh9biJcw6275InS4/BOnNc/y34nL+oq+d8AS0iGboUpjyJCTD
         RPyanx4bwot2ifjWRWZpa49LxY7Ky0yLz4aZHnZbKnW4SkiLsUL/6p4M/YEzsGPQALoD
         LARA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mLnWxSXEUlmzNkKnKNxaRiIhrvOhms2g0ApONhLtl44=;
        fh=n0ZnAkKOhGDmrf8RLpwnC7FQ6xmEY5rofL6wXnjsXjs=;
        b=JvQQTGWLMWa/v5Z1j0EMIsw19aFDUDknvaSoViUzbE9KMim46Ql4p9nnKxlqutp9kO
         keX8EpxPNb3xynIEGIRnVf9dOEHrZs3jtIavvsfUC3btF99JPzFch3g5ppAax7mpPyJE
         5bgLSo9/qZ0B2zFVJzP+VG8D3qPY+shSiKuC6iIjOFI3IV5EZ4ynfscHbw1qoWAGBq4c
         L7Qwo+lYBt9WpYtgUQ91vEH86goq0FptNJPfa9+IOxifduBFyRjURatRtYg5Oaab4h99
         AQFrlIxW6urLod48y6nAdQtnfM80bNEqsoPsM0JPA3oj2RJrGNM5Ar6t6pvWshOS49ME
         qGrw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768791685; x=1769396485; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mLnWxSXEUlmzNkKnKNxaRiIhrvOhms2g0ApONhLtl44=;
        b=hSRF0FR8Vr8zgk82qrF94XXXTm7seXDYKpQmJ2EsT9YvhOxjwpGlJ39Ych8RVa6mGA
         CN0Rj0Y9chQ+92IznzhHEEQKmRsel6BoCzctEtFZAUaDqBXLjEv0DNk6Yc+eNQE9/+V1
         tifjisHAb89vnXel7JRH9QHv0HwDnMvLrlagjW+DS2KVqhKvIa3Ar7iCRsPdF+VFCuxl
         MqLbN+Xjsq4S1oUwAqZyzEgzggcP7nHJIVoWWd2ZW0ljMOOubCdsKtSRMtLxt9l1XrZy
         FwA39mJC6ucJEiRaf5L2Zhclse93a1q65dhlUuGQ8rFvu1e87Sn79+VBXPBUr7m3EQmg
         M3bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768791685; x=1769396485;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mLnWxSXEUlmzNkKnKNxaRiIhrvOhms2g0ApONhLtl44=;
        b=WJpq3hfxMw6kNtiTPmJdrLf2zQIxdMwr5n2LFYQFX/+hXlMBP9pbbTj3D1Ow0I7T5K
         eUdD6vwiVOG41hlmanJKzFCpBsc4a+qDe9aMB+Qc7uDr+f29gqYiT7jSVOsMWJwFgIom
         M16HguGPkaBrn9xBhezdDzKCWS1Lz7ea8SKcMavA2swNKkC5nWNU3pADqJ9wxL4Cv7tN
         8HIzWDXkWBQiFCsX5oj+LQlb1ucXjoJ2V909f5e7atzDT3TKflWY8Gaj/PK1D7ARi8n7
         rAc8bJKdddmZOXdELsO8angTlz3Zm92Zh7KHCzCvExYg7izJJLOLfhhWqfkc7KRGTjft
         0WwA==
X-Gm-Message-State: AOJu0YxBOUbYvAhwHiiO5JhMKYg21Of4ea+Gpm03PnAPaX/TEooJATe1
	elXsErNWHcnbo1LV/wlbWSMwXFofkRAzlE6NiyiMPdfVCnlnLSsDrNcp90MFjbbjlKt1OvrcVFh
	Z5rXM3iV/bHV4dBS9T4YctZt+7u3w05mTMrSX3KmTlY7HnqKwkA9ueTbPgoBrQdmk9580WiUE49
	U0oTYcr2X9kpHC7nUkcKLCKE64/ghKaxMJ5Al19HCqkugFRF5BmJ4qPMwQjnU=
X-Gm-Gg: AY/fxX4LXztt5B7HvL+lKx/3Zkpzv/6wQthR58MQi3/E80Y1x5SLlw8RA9H+u4GKv1N
	WifUP+PCLogfrQmGTVz7irCG2yzwDfOIbjWWx0XyjtvsZU4kSyvJEKVLmSgsJCeVfjjdTSM9yGE
	BmT4vgL1MnvZ76RLY8Mra2U0dCLhU4qDLAwNDc73SF+iH4Zq72ZYL/ANfn2uVyCyWo
X-Received: by 2002:a05:6214:2247:b0:87c:28cc:9e69 with SMTP id 6a1803df08f44-8942dd9e313mr139741986d6.55.1768791684773;
        Sun, 18 Jan 2026 19:01:24 -0800 (PST)
X-Received: by 2002:a05:6214:2247:b0:87c:28cc:9e69 with SMTP id
 6a1803df08f44-8942dd9e313mr139741706d6.55.1768791684389; Sun, 18 Jan 2026
 19:01:24 -0800 (PST)
MIME-Version: 1.0
References: <20260114130100.1016416-1-ankur.tyagi85@gmail.com> <20260114130100.1016416-3-ankur.tyagi85@gmail.com>
In-Reply-To: <20260114130100.1016416-3-ankur.tyagi85@gmail.com>
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Date: Mon, 19 Jan 2026 11:01:12 +0800
X-Gm-Features: AZwV_QiNASZ5NA4zK4KQIZM-OAAOzasw43mArre9b8AdQ3ift4oT2GczUsxUVBE
Message-ID: <CA+s=J=zG5ULpadto1sfkVkLZjkuEjhjdKc3WbJ+ayr7StfC7Og@mail.gmail.com>
Subject: Re: [oe][meta-python][scarthgap][PATCH 03/20] python3-aiohttp: patch CVE-2025-53643
To: ankur.tyagi85@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDAyNCBTYWx0ZWRfXyllHa3ui3TQW
 NrPHmpamJrjpt+SoCLxrfccrIg9AQOlc/I6aUL7X614y53i6gpyeN+qXFoV/kZOk5wezrpXinff
 tV07GTrmpzNKYWdRUD6KzkkM366k/iryU2M9MwCV+aHMA/AK4k29XoSs0M88kb5NkoEEZz83IYc
 sAIyvqwf36zskKkdrMnZYxVpw49eCumJN41khHYlxM9MrTmiV6G24Jv1mdVdA0qlXZXiznlqQ/1
 r+Ns4Z+BCyisiCWvZ6JtIQbKyM6RaHtYZ+U4y8DrDnbK+ciB/7UzAPmZNauOg4Z0kHze4bd9gmg
 n+/8f3F5yINECsTgERzJnE3B1WeTazcL8xvcQ6jtCLjegIMSuaitX3ViuDXhqQmNqOtUanCeMmg
 cfQLJtxAir9uRWipCA6uoky30pWOnV6KMmuYX29YXfzddIky2OgOHO+pIbcSQxGENkPYA9ugqqZ
 cYshLe/k5DUb9JU+arg==
X-Proofpoint-GUID: J0JHRVVr1LXNVI35e__T6KZrnfGCFgAc
X-Authority-Analysis: v=2.4 cv=GJ0F0+NK c=1 sm=1 tr=0 ts=696d9e85 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=PYnjg3YJAAAA:8 a=NEAV23lmAAAA:8
 a=Q4-j1AaZAAAA:8 a=pGLkceISAAAA:8 a=0lhnMm1FAAAA:8 a=XBKonLGV6r3db1O94OMA:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=9CHbX8HeWodPCPcMgNm7:22
X-Proofpoint-ORIG-GUID: J0JHRVVr1LXNVI35e__T6KZrnfGCFgAc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-17_03,2026-01-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 phishscore=0 bulkscore=0 adultscore=0 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601190024
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Jan 2026 03:01:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123580

On Wed, Jan 14, 2026 at 9:01=E2=80=AFPM Ankur Tyagi via lists.openembedded.=
org
<ankur.tyagi85=3Dgmail.com@lists.openembedded.org> wrote:
>
> From: Ankur Tyagi <ankur.tyagi85@gmail.com>
>
> Details: https://nvd.nist.gov/vuln/detail/CVE-2025-53643
>
> Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> ---
>  .../python3-aiohttp/CVE-2025-53643.patch      | 189 ++++++++++++++++++
>  .../python/python3-aiohttp_3.9.5.bb           |   4 +-
>  2 files changed, 192 insertions(+), 1 deletion(-)
>  create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/C=
VE-2025-53643.patch
>
> diff --git a/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2025=
-53643.patch b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2025=
-53643.patch
> new file mode 100644
> index 0000000000..99ed1ca395
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2025-53643.=
patch
> @@ -0,0 +1,189 @@
> +From 2b45c0cc5f94a4aab25e80580db73c5da1152030 Mon Sep 17 00:00:00 2001
> +From: Sam Bull <git@sambull.org>
> +Date: Wed, 9 Jul 2025 19:55:22 +0100
> +Subject: [PATCH] Add trailer parsing logic (#11269) (#11287)
> +
> +CVE: CVE-2025-53643
> +Upstream-Status: Backport [https://github.com/aio-libs/aiohttp/commit/e8=
d774f635dc6d1cd3174d0e38891da5de0e2b6a]

Please also include the changes done to the original change .. in this
case, dropped test and changelog ..

Thanks,

Anuj

