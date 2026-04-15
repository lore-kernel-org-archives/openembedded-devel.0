Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B519AFA0C4A
	for <webhook@archiver.kernel.org>; Wed, 15 Apr 2026 08:27:17 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14004.1776241630930598674
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Apr 2026 01:27:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=Q2nRtxCT;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=h+D5tboJ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63F7tS1J764277
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Apr 2026 08:27:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Yn7csdv/rhrp997hhQLLHaNz7QhQ9ONpeMxdXz/wZRw=; b=Q2nRtxCTaYK4V/1r
	jBdGFz4WULagrj0mFFXb7jEt3++2BcOjWvRYZuT9PIZLxX0jWsGyUVJDMUIhKb03
	FkXna/GsJa1UKojw0qfWawcxXuKuaMUU77ICuciS3QpQnG5IKKqEkiCMXdSNglXF
	2KZ/PtXoDAHUIl56dRYWVD7P+qZ7jYxbN9QMNbBJj64GXIfZdGESgl5cuY4jacM7
	oThW3OVQ21itEHVa+hOwP0jNinKKU4Ed7COHSC0QbBAP0ffvP9I8uoxZc9QnNrla
	NqnxO3ECxBGqGdlai8k5Kw6Sa5lZQhz6YZ0UF6U6IO30PMEE/eqiS0jmpePceggn
	RgKjFQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dj6q7r4pw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Apr 2026 08:27:10 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50d8ed08aa4so129452731cf.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 15 Apr 2026 01:27:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776241629; cv=none;
        d=google.com; s=arc-20240605;
        b=Q9omahpDDg6eMZom8yuVpgf6ytSYHcefrzgfsft544K4+p7qbw7819mKuE2xSK4hwz
         gkZ7SLvsxTXdejHPMR3E6YnuazM8W0OECY7OlazHGPxCv3sNRYkWFYE29ejeTnk4tMzp
         0Os/hLOF9uLQgGXw72J/mY+fMZfil415EyGrvDZWEU42cssT7l2xEa3YlK/qBzkk1Uqr
         aL8dxjVds9ILpPpW7HMWsdKl+o1676YyN4I1CmYZ3mKE1MUNLNsSMMFt1Tguwta6IJ8V
         adP5o77wbcYLH8wYIUx79iUE2V58VXz6BzpE1QrbYvia7OGBgiXrcHad9cW9SQt937Zd
         5IWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Yn7csdv/rhrp997hhQLLHaNz7QhQ9ONpeMxdXz/wZRw=;
        fh=RxT9Z8BnVkq3QbZQ+cmFlZk/yrrLX1SZUt4tNZoBRHg=;
        b=XISh7pZoDcTWqdw4iNadafHnKCxEIhG5qCYZu5kTA+nWLY3H86aXsuW94au/lf2bX4
         2U6FkOGTzOae/lf3mC1ngpT08KCKNXGMww9Zj2usWB1qiBuRdBTWxCLnCAF5idziW3b6
         WZrpxKf+WPSECsk9g0DP40hpNmQQ5RIUpVshkXyqDBlddLH43g0f66cz78+X8Tx608zo
         T8jGQlyHrdN1/wmDy9WxUAqDm9lSDnm6wR399cL0Nxykjar0ZY6va8W9OrV8W6Ockhm2
         0SJNeVMdDvzH09s38w5Irci0TWjJwu7kI5velyHV9v3BSuc1xDO4W1zbjjXLvlnQ7+Lo
         f57Q==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776241629; x=1776846429; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yn7csdv/rhrp997hhQLLHaNz7QhQ9ONpeMxdXz/wZRw=;
        b=h+D5tboJQab2JfLhkNKltw0KR6c6PRhIreiQW8wlaneBzFdYou4j2dxYFQddm9hxss
         zGHtyvm/vfFO4QGt3I4ddQ4B2iexeP1zwP9r2iwqPNXcRntJBvJF1E0ZfZvH5Edl6NCd
         4gUsLOIzTo56sZqRUQCmD/vxwGoD7HzlrdU0efn0zvIi2X0CKk9RBh6MTi5uveHCd+d4
         1ELfjSET7ddOXFuJ9Gez04SZ4wX12kGY3Z3ob9f2sHWFmXQQGe36ZFJoq/ezqZpWcXsS
         2mNEz/dNyNvh30lrxG7174psRMui5LbVVqMhjSZEcxBj0NP6UgleRxkB9nUA2cAL+D4a
         wzjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776241629; x=1776846429;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Yn7csdv/rhrp997hhQLLHaNz7QhQ9ONpeMxdXz/wZRw=;
        b=XRSUFTaw4tzkcCj2qv2YTavyA3KqV0RIaSHMETWYMdQqC2jQtXL1/SrUpwUgE9oV1D
         mDkEvHdqoMVvvrbDsq8/PPouoViLUx0+T+MyIACnH8h7kc5tIt9NXkYvI5TKSFBc9GJu
         h6grWkR2z8399hnJxp0TIz1d5ELU0LnQsDnf3UjjjvXaWaaRJj0Apb42L1dpWScRv6VV
         DtpoWVOW1Midg1Q20GCdD3BPwTAmQhLzxt6Joh/8n1nxXpzHIxCbK0gfvc5QiQKLMy2x
         fYH8vhwZ9ZkGcEJEtq5JfZ0bqAuM1rKXLrUlpWzeCdBQ1yeSzejgbGj4mfv5U6uBCKus
         VmmA==
X-Gm-Message-State: AOJu0YyQtgEFHQXxfRS2909osknopUnEbRmJ83QpgqEu2EUBthIfxRGe
	Z/y4R/0NmT79zHAtAeRC9lGsMRqx2mByGOpEIfcr3UXuDf78Ji73ZDd42ovcdukyyMaAsSqX3aW
	7wvo+NvVd1/QhH8oHxm9onsg2CubMsD9D4nq3LhTD6nbPTldyGLGQk/5TznFI+zzrPGdYSE2vWu
	sh9vKr8QhtqXLn+wqqRws8frHsWZEhPiKXgOW3i4JrJuqlie3dYzIosfZ1GN0=
X-Gm-Gg: AeBDiet06lHW4KWfuuVYFCbPmL8WHFjc95Ki8fbj7Tn/xITtXWcOtW6JwRBoDDEXhS3
	FUum6uwgpNmueqXWtsZ7HVNWLHKja6cV20hoOhFA4WdblV9tAWQBPtQDmQvFHQdS/XFDNcJwQGP
	HefxmnzELNQtFfw80Gjz6yAYMag94VHWHbVYrCN9lCfpvAoEedTGtVQqC74wcPHzrEXQ1k43int
	7Ww
X-Received: by 2002:a05:622a:4110:b0:50d:b1fc:c7d8 with SMTP id d75a77b69052e-50dd5c0cf95mr320875071cf.30.1776241629349;
        Wed, 15 Apr 2026 01:27:09 -0700 (PDT)
X-Received: by 2002:a05:622a:4110:b0:50d:b1fc:c7d8 with SMTP id
 d75a77b69052e-50dd5c0cf95mr320874861cf.30.1776241628826; Wed, 15 Apr 2026
 01:27:08 -0700 (PDT)
MIME-Version: 1.0
References: <20260410070508.1104455-1-jinfeng.wang.cn@windriver.com> <20260410070508.1104455-9-jinfeng.wang.cn@windriver.com>
In-Reply-To: <20260410070508.1104455-9-jinfeng.wang.cn@windriver.com>
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Date: Wed, 15 Apr 2026 16:26:57 +0800
X-Gm-Features: AQROBzC6MX_Ye8KaCNv3qvTbUZmAmDybGP7EbUGgzMudGW778ZmutEINXDJQGvQ
Message-ID: <CA+s=J=ztc7LcbsPH-QsFCSduqQX7Abqt=4Ve2S4s1ZSK4+DQkA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][scarthgap][PATCH v2 08/11] hdf5: fix CVE-2025-2308
To: Jinfeng.Wang.CN@windriver.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=AvHeGu9P c=1 sm=1 tr=0 ts=69df4bde cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=PYnjg3YJAAAA:8 a=NEAV23lmAAAA:8 a=Q4-j1AaZAAAA:8
 a=t7CeM3EgAAAA:8 a=t1751v2a-wO9OLvF9dUA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: BUJ73d5NKLmwhwrvXgx8Uu3DiMIDdZov
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE1MDA3NiBTYWx0ZWRfX2s0SDu3qHD7L
 b5WbAgjXyptad9vHDVU3G8MMCXMhYFa351OY64rtjhw0YjdxUFk2PmXh2g8ygYkn0XlfistHY4T
 R6TBcg6SLQyyNQc8jRyJN9cYoUtBVk5+aIbnLoerqhWNeEkWqmoxJswsGu9kcT4DOqggngG24Am
 cLfPYUr7jDtm1eq0qpaD3494Itm5nw8bvZkRNY2axorK6sfJL1SDe0/Q+g+Ah7ynnI+juDU0akP
 ziItj2Bivw1wCygOsxvUdT5oCEX6PDdSoVoJKd4Y6gl5wD9MQiCHwf4NsYXBHA6EbwRtiz1eG9c
 j+66mKJdnuqEayWHVmRU2bfJuWNv3YA1De8a2iaBK9K95iZ3DWbJsNK6JRDqyRe+KCSwODWxcjG
 l39NHnHc23cdofHGvD3K7sKbRZFENDVcG6u6lf+2XtZ96aDARVrhu2bLa3t8nYnkNFF63otQu8E
 BxYvBrX9Gh+eBT98Maw==
X-Proofpoint-ORIG-GUID: BUJ73d5NKLmwhwrvXgx8Uu3DiMIDdZov
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_04,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 adultscore=0 phishscore=0
 bulkscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604150076
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Apr 2026 08:27:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126350

On Fri, Apr 10, 2026 at 3:05=E2=80=AFPM Wang, Jinfeng (CN) via
lists.openembedded.org
<Jinfeng.Wang.CN=3Dwindriver.com@lists.openembedded.org> wrote:
>
> From: Libo Chen <libo.chen.cn@windriver.com>
>
> According to [1], A vulnerability, which was classified as critical, was
> found in HDF5 1.14.6. This affects the function
> H5Z__scaleoffset_decompress_one_byte of the component Scale-Offset Filter=
.
> The manipulation leads to heap-based buffer overflow. An attack has to be
> approached locally. The exploit has been disclosed to the public and may =
be
> used. The vendor plans to fix this issue in an upcoming release.
>
> Backport patch [2] from upstream to fix CVE-2025-2308
>
> [1] https://nvd.nist.gov/vuln/detail/CVE-2025-2308
> [2] https://github.com/HDFGroup/hdf5/commit/2ce7fdc4cf147d280aa6d49686297=
faacc250e40
>
> Signed-off-by: Libo Chen <libo.chen.cn@windriver.com>
> Signed-off-by: Jinfeng Wang <jinfeng.wang.cn@windriver.com>
> ---
>  .../hdf5/files/CVE-2025-2308.patch            | 2120 +++++++++++++++++
>  meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb |    1 +
>  2 files changed, 2121 insertions(+)
>  create mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2025-2308.patc=
h
>
> diff --git a/meta-oe/recipes-support/hdf5/files/CVE-2025-2308.patch b/met=
a-oe/recipes-support/hdf5/files/CVE-2025-2308.patch
> new file mode 100644
> index 0000000000..13b04bf8a1
> --- /dev/null
> +++ b/meta-oe/recipes-support/hdf5/files/CVE-2025-2308.patch
> @@ -0,0 +1,2120 @@
> +From cbce4c2ecf6f5557605890eec125ecfaa4371131 Mon Sep 17 00:00:00 2001
> +From: Libo Chen <libo.chen.cn@windriver.com>
> +Date: Fri, 30 Jan 2026 16:43:04 +0800
> +Subject: [PATCH] Fix CVE-2025-2308 (#5960)
> +
> +A malformed file can cause the scale-offset filter to have too little in=
put data causing a heap buffer overflow. Additional checks on the maximum b=
uffer length are required during the decompression.
> +
> +This PR fixes CVE-2025-2308.
> +
> +CVE: CVE-2025-2308
> +
> +Upstream-Status: Backport [https://github.com/HDFGroup/hdf5/commit/2ce7f=
dc4cf147d280aa6d49686297faacc250e40]
> +
> +Signed-off-by: Libo Chen <libo.chen.cn@windriver.com>
> +---
> + src/H5Zscaleoffset.c      |  177 ++--
> + src/H5Zscaleoffset.c.orig | 1781 +++++++++++++++++++++++++++++++++++++
> + 2 files changed, 1886 insertions(+), 72 deletions(-)
> + create mode 100644 src/H5Zscaleoffset.c.orig

Can you please fix this patch and resend?

Thanks,

Anuj

