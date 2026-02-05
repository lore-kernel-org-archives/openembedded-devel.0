Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1AB9E91288
	for <webhook@archiver.kernel.org>; Thu,  5 Feb 2026 07:24:59 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15570.1770276297666849149
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Feb 2026 23:24:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=SgpuwZWu;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=QszlLcMV;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6153dob33397548
	for <openembedded-devel@lists.openembedded.org>; Thu, 5 Feb 2026 07:24:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6iobZA70me9hZi98nsdaoj/9cRapozLmF2q+AILsIYI=; b=SgpuwZWu7EgJw194
	FP9br6eYEquKtTNW7Pm2ovNee2Yr/GVBpvQK/zCu2ulcdZ/er6zt7m/wm3s1CuLb
	ImIQo6piYpwqpoiteNl957x4a3gcNd7P2Bw+EkxiLyiH+TruBNLTb84B+QTWRC/d
	iW6Nh9IQAdMjDb6B5g0VTf6H+fSuhg02gwTqCgl5p7uHXeOqhhQUUexPyKg2en/T
	B44FWqPBlgfxn510eAqDiiSp3MWPJOTUjXs88Ls3RtEnDA7i83w/94V9/6j4Oi/j
	XPqXdb3pepuPvtzoZ63aCyW/iIunF8FcSraXyMd7vg+w1MhXUfPu5+iFlMuU4hji
	NAUbuA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c43dh3jym-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 05 Feb 2026 07:24:56 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5033c483b74so24949061cf.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 04 Feb 2026 23:24:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770276296; cv=none;
        d=google.com; s=arc-20240605;
        b=cXauWC+bZo7VywNYSB1PvF7zRirQYLGWWaF6s4OgQUqKBntgXOFUr3GVa3DUnW8WnF
         4zdes3ypWIv6vLdPS+oAMy9pqBfQBWkVZcdC4QUskTkUy4TeZVObYFfetjsHLfs0e+Mq
         ofIreEr4Pxw5ITdeBHwS+FL6M+3HxRLSnftFF4QstABKJvPHKIWvzR3yYfL7P4K0XEM4
         bE0EBljJjDH4vfdg/fsoPvMUEd31oU0jnseMGpEotU5iSvPKhVVOeuDLO7pb+vK3EJd3
         WtqQBrRSlMCVFZrdOlueZOibeQGDTVKI/kWS77qMoR/gE+HcCZpeXXSCLEh0W1L8EMkO
         btQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6iobZA70me9hZi98nsdaoj/9cRapozLmF2q+AILsIYI=;
        fh=Kuo8bXixDJVGyAmfEcBaOJAFeJ+zMTQnaCigoQan5Yo=;
        b=ekoSJfyESrGVjghZKbnaD+g4jDlOFW5DVM4g9aL3QPiiZ00a0SgpTvd7pMq9SvAVRr
         dNpHpAiiu/5LWyIg9vJx3RK4j9NdujDLGXF/Dry6cjQ9KW+jDZPyVKW1QdBSmZcerQol
         VdZcloUloMi5J9d8OHdPZit5fJdSwthA0qOzc/NTJhyhRUL1BL7ImBNcTi2VBHsOU0Ok
         NNpTGLEVslU0C3kwKL54z0sTBZJZCyvn1pAqabRjBQrWqVIwUWw9j/RpmIe4ub1mnDQm
         znlrdzg4/IMDJndH0KFnDmQcltedd/XPGr1l3ucT/yWv9QvUtasfmx0t2Nt9ZfocYsBx
         6dWw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770276296; x=1770881096; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6iobZA70me9hZi98nsdaoj/9cRapozLmF2q+AILsIYI=;
        b=QszlLcMVIN2AE4Jjp9emTCqlphHGGE87FOp/wSjpL3JjDSZHSwa/3EBAHrDY6K0T5T
         iT01/JhMoysQYe72nYnK4t+d/9pU/TPu3J00dritv/DcHXd5b4wSkxfi4+0dAyyM5aTk
         f3lAUghEnxEcOMsLi9dFDS5h2jkYsTS6N6Au8SIqPiHm5mQmbkokGMijJb8E+DKr7rDM
         yYpw0FY7nLDeCkfrxm4tK0c9+f3dLaLgYyGQB+EiKz1THeCgunLwdW7WkGElKkTuq6oj
         p3nse073fbijOJoPgv4PLTTTFhNc+uN+7gb/MKgEG/1eMNCE6u9uqqdz07o8awMS7z1L
         BnXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770276296; x=1770881096;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6iobZA70me9hZi98nsdaoj/9cRapozLmF2q+AILsIYI=;
        b=CRu2kUm/1jmrWyCLYqbzFvSpzXhsXMGj/0oaJR0fnwrYHPEBLT3QWz/R6UuaUm/pWn
         HoB5FFtjAWVff6l711IVeM3blG4laRqNWBeyqnRJ+NWeZdhUYT25TG+2aTOHAPwHdYVc
         clZY73TepjL4tKAIcWg4mk3TfXMOlSByUkWG07C59NNbYC23VDzrDqh2BUHjZZWvPSHX
         tM2HWNLQ41mqwqdkI8l/DMK0sd6+Tx1bcWY4I6i0xujdpeyJzWJhjwFEWmJryVLZjzSR
         qhw0WDbKd6Q66Tp2jpAq0rADq4R/i633iS8K2x6UdLKDb7aRQ8eruKFZTK/28/An6uEU
         ad5A==
X-Gm-Message-State: AOJu0Yx1tIPr94rUhmdU+Bmq5gC6UymJzEpQcJbrnr3WJ0j1SkUH5ovQ
	+mPmgwIs1f02deouC0Qc4NxjrqJyLoYynfqKiwcua1p9NySP/q1q870iXBTLxuPd/xZ/jH+Dont
	ru2Xaobmx2vxv1QQma/G2YHTD9AwWUb6vOooF+Xl7K47KlqDV5h/j9rBfXA6cPDpAm8JtNfCoZx
	p6wyCD3jOWtC11EgDHKw8FPwAn+v0Qf5Nzpi4Nsuzk22EpB4NaByfyNPLVpbA=
X-Gm-Gg: AZuq6aIaCNR8eFg+shr1J/CJg5FOLrZS+xElEAoUcVYOYWblAH+bPCAnIDfdjtVIkv+
	M+QNcV7zEJAxcmL5swGHgBWg9iDqsBW94kz4fz2zsZaxkNr3aSGlwDw5t027l1qZbh7ycCwRmzO
	ai5hqdrSn4rK0iQ29tWX/mF4ss3RbEi16Hzo5ZKMBTRjyFUQaSeyPL9XhZL2EnIj9U
X-Received: by 2002:a05:620a:3729:b0:8c6:b45b:9e2e with SMTP id af79cd13be357-8ca2f875cb1mr747340685a.38.1770276295839;
        Wed, 04 Feb 2026 23:24:55 -0800 (PST)
X-Received: by 2002:a05:620a:3729:b0:8c6:b45b:9e2e with SMTP id
 af79cd13be357-8ca2f875cb1mr747339985a.38.1770276295312; Wed, 04 Feb 2026
 23:24:55 -0800 (PST)
MIME-Version: 1.0
References: <20260204145930.2170462-1-adam.duskett@amarulasolutions.com> <20260204145930.2170462-2-adam.duskett@amarulasolutions.com>
In-Reply-To: <20260204145930.2170462-2-adam.duskett@amarulasolutions.com>
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Date: Thu, 5 Feb 2026 15:24:44 +0800
X-Gm-Features: AZwV_Qi4k3HNKvyP87VBUiBBXlo6pq5n3O6747H-0OtGBuS-I57ZGfMeVq8BuzE
Message-ID: <CA+s=J=zp+t85ko34uRqk54aU_EcL2+N758UhTOsjgNY8GKySng@mail.gmail.com>
Subject: Re: [oe] [PATCH v3 2/2] kmscon: bump version to 9.3.1
To: adam.duskett@amarulasolutions.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=bMgb4f+Z c=1 sm=1 tr=0 ts=698445c8 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Q4-j1AaZAAAA:8 a=iP-xVBlJAAAA:8
 a=NEAV23lmAAAA:8 a=0VMK1yC69drmAzAxn4cA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=lHLH-nfn2y1bM_0xSXwp:22
X-Proofpoint-ORIG-GUID: 0jv2LkzrjPJ7wL3V3YWBM2bH1qgKbbYG
X-Proofpoint-GUID: 0jv2LkzrjPJ7wL3V3YWBM2bH1qgKbbYG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA1MDA1MCBTYWx0ZWRfX+wkK6u1TdXaj
 fo32s7B8fKFSzXaWjvEd8ga8Xbp4tFiHrH/1BU7e50wvfxzBxYPlvrSo7tRxLKijcX7zaT4JQ3U
 aAuYc0KkdWyLnHtL1Ue86amFpI+XxKnBgqFNDl2ic9HCaEeH7K7i+n8+pcpg4qYS6cdgkKpx4B4
 0TCZaEmSvpRY502dsuSoPaJvedH6of5k5N9cMG85Byuv6tXp5k1shCOpd6485q6FZOVt3qluF/l
 idjhQlqhaERcmyTBYlJWQJqA2WlS22vN+JJn+oSodTogC3yKnpk3G/bUxJIELZ+8P875igdtIz7
 I9rA4QTrWKqt8ZBMuEewT71Q2D1XogWxFUQHa7qmVFCyg/l46z1j+lZIoXsSvBD++QUOxs9DWzQ
 +H84SssUZY++QEe2YXxO+9cgVJI0mRXXtAJxyOcF+pzsV7g9E3knEvsmkf3aNS3pDdVNZ+iXSfA
 EbnjJnX5gNBbnQiynxw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-05_01,2026-02-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 malwarescore=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602050050
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 05 Feb 2026 07:24:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124197

On Wed, Feb 4, 2026 at 10:59=E2=80=AFPM Adam Duskett via
lists.openembedded.org
<adam.duskett=3Damarulasolutions.com@lists.openembedded.org> wrote:
>
>   - Remove upstreamed patch (commit ID: a1fc510a)
>
>   - backspace_sends_delete is now a runtime option as
>     of commit 0d6d85a8b865cac17529d049ae9a561db782ac59
>
>   - The kmscon.conf file in the source is renamed to kms.conf.example
>     To keep the same behavior as the previous versions, kms.conf.example
>     is moved to ${sysconfdir}/kmscon/kmscon.conf before running sed.
>
>   - The render-engine config option has been removed as of commit
>     59eef2a154f78101195ad8ff08376e2418e773f0.
>
> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
> ---
>  .../kmscon/{kmscon_9.2.1.bb =3D> kmscon_9.3.1.bb}        | 10 +++-------
>  1 file changed, 3 insertions(+), 7 deletions(-)
>  rename meta-oe/recipes-graphics/kmscon/{kmscon_9.2.1.bb =3D> kmscon_9.3.=
1.bb} (85%)
>
> diff --git a/meta-oe/recipes-graphics/kmscon/kmscon_9.2.1.bb b/meta-oe/re=
cipes-graphics/kmscon/kmscon_9.3.1.bb
> similarity index 85%
> rename from meta-oe/recipes-graphics/kmscon/kmscon_9.2.1.bb
> rename to meta-oe/recipes-graphics/kmscon/kmscon_9.3.1.bb
> index 508f24c58e..4e27ba218a 100644
> --- a/meta-oe/recipes-graphics/kmscon/kmscon_9.2.1.bb
> +++ b/meta-oe/recipes-graphics/kmscon/kmscon_9.3.1.bb
> @@ -19,17 +19,13 @@ DEPENDS =3D "\
>      udev \
>  "
>
> -SRC_URI =3D "\
> -    git://github.com/kmscon/kmscon;branch=3Dmain;protocol=3Dhttps \
> -    file://0001-kmscon_conf.c-Fix-llvm-compilation-failure.patch \

This file itself should be removed as well.

Thanks,

Anuj

