Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37693.1792998517473136135
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Oct 2026 00:08:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=fCo5aixa;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=ESN+qPMw;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4aSWD1708641
	for <openembedded-devel@lists.openembedded.org>; Mon, 26 Oct 2026 07:08:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jNMIQm7sU5F0q46LIfU0f6zM/YK2dNhmlKSf2X2poHs=; b=fCo5aixaDQmfooCD
	YBu1rHEUGmr4MiOEdpidbGrUIUP5FnFsSvB+A2pJmhuHQWkuZvbgJEfUvwVvc00t
	JuRAF3w4cACKE+84xL40wMhkVu0iGo/0R2NLJnQxzQFXqwm9yOJAeolsVXvpIicT
	x18Hi+6dq/Xt400kf3vuYebV7jAd9QX0mJjbfzf6jB6oOZMOBmaCm3eIHDSWaC8P
	1QDIO/FNRMON+vMQ0ZCvcTwSZWuLre4Pf/x8q4G3KkaICCP3vSVKakxYMvLRHSvl
	UrAgdgnBLmCJ8gOLlsuEIAkx/cC0cxDIsSAzqL50VOYaQMbu/cSj9VpRAj1bjydi
	88cdiQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hhsjd99a0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 26 Oct 2026 07:08:36 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-537548d4bc0so71159511cf.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 26 Oct 2026 00:08:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792998515; cv=none;
        d=google.com; s=arc-20260327;
        b=qG7UeVIVvRUqpepIC9yLfGHK/lBr4izA0VKcCaqew7sQXFEKOxNh3zpH6PGK5DI9aV
         DyjGQmS8pivhXGkWE4Phifr6MtSeDANgTB5FK0WklH5CMMJDT2mNX7jHEiBAKa8yPYJR
         nvQANZWkFLC2wkfg6aMIkrFnWu1ypASGT+e/z9nh3aEvNYXmxh6+hYtCQ7bZCdypUCtv
         NTQcs3gKZz1HaBJOANuOW146jycv6I/oOjg2wojoL+uKpMj4RNOA6H83fFHhELknrTmI
         SeKsJLb8WHFWu13sxnk5wHnpUm2D6cC73nCnWIVmSblH/JrJOdHY8qoaL6Cqw/re9ISI
         cTag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jNMIQm7sU5F0q46LIfU0f6zM/YK2dNhmlKSf2X2poHs=;
        fh=zDV/DJKlvtgdBhH596m+CAdizR6eZ4xdrOYuUQ4WjP4=;
        b=QDcSVhh4hg3huU2cnxqnwkT0RZGewtlv20UjCW05sCN3Zjcz6GLR+RUia5cSUPC+eV
         sw68yEGD+Lgw7yKmzVitXjJnNz8powUsoOP89nEFgRYY9UjYhhGBFCq239bAchuaB303
         ugUPeWIPccsBduHvoIkE1fR0P0I7Rei2YyBwJvzORnrje/doGPgTM3yR4JqirzTkfZ+z
         pv372jXCpeOJpSQhf3domjEemxbsorAHmukuxFA0P3Uq8EuvZFAaKDGRyxpBgWsYv2Dp
         8ffVsk5wrgfLoYmgphOyMrajTH2l0SCxJ7yM+iEedOwKXWZer24Lk4gDLDJdKlSoC7be
         s7Lw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792998515; x=1793603315; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jNMIQm7sU5F0q46LIfU0f6zM/YK2dNhmlKSf2X2poHs=;
        b=ESN+qPMw1v0Tat8UFh5Omf44FuxA8rjO1ZmQJvZNSQxhMseUhmnN6209U5ItKnn0Gk
         A2ExVSdg4KQqJ5LB8sAmIJsSAb4+PUEI77GXHepETHVzQxr3kMpBOmDx/Ofy6N0iPpGH
         W8hYhCQ6aorffD4VElc7QleM6mLSqsMTjNUgkkcJKRe4yLbQg8XvQohzjV02Un3ruao7
         7qxHNPybWr3ZSlSVpk7Nxd5W0gSHxgQHzs2UUMk2KqJIJe+LVswfdV51H4NVR050mQ7C
         tI1IEspseLTrdiZbN5Qjb1uHDdx/PgSUIfBM9SlMbmCsDGniud4/YQEYxbj+akumwQTD
         SEXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792998515; x=1793603315;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jNMIQm7sU5F0q46LIfU0f6zM/YK2dNhmlKSf2X2poHs=;
        b=1h6E2vxNTMtvOhIjqRNVeFy/G+bAuAVRbkO3qxhppBGVor/rrk5XehSW7xM8H1H8C3
         yvCK+jW/D9QfQFV30mJGdDGZ/njcZrIPRutMm3SnAX6obRnYXpSA374TP1zfV5b5Jqpy
         z/7UkxqKUG0m71mi7sOElZSRYCuRQpuEt3qPxBb++i3o7oG+1uLtaFK8a6DptbcwVXEW
         jWorJBxclalJhrb8BgvD2zqXAcd7+LmLs9pWRefM046m8iMebNbFM6KHIlBTNteBnfW+
         gL3Yc+0AoLz0JV5z78QV9XhTC9Jvmp1wOz2mEnJ1mAgc6v23Am2jZKCZQOtmIXmew/hP
         2qyg==
X-Gm-Message-State: AFq9FYK3G9c5+G3AbMa48EQMen8JlxowG1iVactscIQJLS+oPoc5Cfc/
	fF5CgNrh7KURAOKKeTdpMhitMHjCHGT188oI2ilFWo0SQ6KHZ4JVCsLfmdkGn45+9hgtEFr5zo8
	MU49kvX0sMO/9Vb2YeW2oZIjSJgmwbkrk7Mcx75e3vku1FfTNFGIQQRA4ukjNOtzUhFaoyIK0gg
	H4+5TOtjC5W2P0AExzrmcbbkEOsCGIHZRLhu3V4Phs1jsax+v1hSPp6NDdoDY=
X-Gm-Gg: AYBFou1fkZ/F7+Ij7F7mJY/fsBL9AQtyYrDcwSljdiv29q3XPRhVyFyRSn1W0qUaEWA
	CBCF5GoP2cEv2RwfrwWe+FZdKgm0JOXnITYBEz5WorkCfL9VnM0ZJbMhkGLyiRYRKHL29kpSCMS
	4VxsOSDzxLeWdE7xqjwv7tNhK0nVerEKn8zRw4uk1BnOc5wZmdFU6bHAc=
X-Received: by 2002:a05:6214:21c4:b0:91c:1257:f9c9 with SMTP id 6a1803df08f44-91c48cf040cmr88149186d6.2.1792998515413;
        Mon, 26 Oct 2026 00:08:35 -0700 (PDT)
X-Received: by 2002:a05:6214:21c4:b0:91c:1257:f9c9 with SMTP id
 6a1803df08f44-91c48cf040cmr88149056d6.2.1792998514804; Mon, 26 Oct 2026
 00:08:34 -0700 (PDT)
MIME-Version: 1.0
References: <20261022131446.189859-1-schonm@gmail.com>
In-Reply-To: <20261022131446.189859-1-schonm@gmail.com>
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 15:08:23 +0800
X-Gm-Features: AclHuK8bou5yFNeka5kLZ-NYaL52Bm7bVVqgkWcFj1EQ2yrxs19RmXj_c1MR-WQ
Message-ID: <CA+s=J=z55uaS0q_ZaAhMmf4ZF9tC=LLtcFiFY0KLrSRimYRQjQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][scarthgap][PATCH] brotli: upgrade 1.1.0 -> 1.1.1
To: schonm@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: KzcWKPejvxwSBQwGvf_T2K97-i2Ed8Qe
X-Proofpoint-GUID: KzcWKPejvxwSBQwGvf_T2K97-i2Ed8Qe
X-Authority-Analysis: v=2.4 cv=a4elZkSF c=1 sm=1 tr=0 ts=6adefc74 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=nZOtpAppAAAA:20 a=NEAV23lmAAAA:8 a=Q4-j1AaZAAAA:8
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=P-KuzlQgkbbaG2xVNscA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAyOCBTYWx0ZWRfX950jPffNGq2l
 vLzBe7ANBU2n4sdwpBMrX9PoUHIGTMdXGvlp0m8rke+stB4wxI5fTt/LlfSuDw7e1sSAPX9IT67
 ipthTxnSIy+HKkGlhI649mi4V3ak3y4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAyOCBTYWx0ZWRfXwi1CXirNWEoS
 RnyJnQ0nos9PVCw6EBuDMOhNGHrJ/ZvxMw6kZ9o+Jq22U9Ack/yn7PyBR3h4D8RNhPbhzTh0HcB
 zJBVyu4tq7jrlKduI9V4xhKRT6iLf6ThMW3Nr6OG4kDrNZrZpEUZulNn2O7IRszHG03w9n/X/c+
 iskj6YI+9ckWhxG2THcUL5+F+kczYdAKiLKGQ/elBrc5fI0pLvFG2FI/Qk0CcxeftIdkfp0RMhL
 qJSNu52CEMsL3JG4YZ5W7vCiW+J9twyHEsWUtxX7j2msB5VFQIQi1l5D5/mi6kAk4ik7XHx3fti
 trsYI1pl8OXMpRUg4dFp5DxY6wZG7fvwfudYsGO3avMDFQw9y37zpjDIU9PFU1j1OMoRX07HTlv
 q5zjmGndL3qpeL1L2NaCM9/E408Fif+dVHbTGRvwisl2imYcG0njpDlORmcjKxKz/t14/RXDJEy
 hvZ9GDIrX/qsz4Sitcw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260028
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 26 Oct 2026 07:08:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131421

On Thu, Oct 22, 2026 at 9:15=E2=80=AFPM J. S. via lists.openembedded.org
<schonm=3Dgmail.com@lists.openembedded.org> wrote:
>
> This is a security release
>
> CVE-2026-111497: out-of-bounds write permits remote code execution
>
> Changelog: https://github.com/google/brotli/releases/tag/v1.1.1
>
> Signed-off-by: Jason Schonberg <schonm@gmail.com>
> ---
>  .../brotli/{brotli_1.1.0.bb =3D> brotli_1.1.1.bb}               | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-oe/recipes-extended/brotli/{brotli_1.1.0.bb =3D> brotli_1.1.=
1.bb} (79%)
>
> diff --git a/meta-oe/recipes-extended/brotli/brotli_1.1.0.bb b/meta-oe/re=
cipes-extended/brotli/brotli_1.1.1.bb
> similarity index 79%
> rename from meta-oe/recipes-extended/brotli/brotli_1.1.0.bb
> rename to meta-oe/recipes-extended/brotli/brotli_1.1.1.bb
> index 32524094c6..432d1a7d4a 100644
> --- a/meta-oe/recipes-extended/brotli/brotli_1.1.0.bb
> +++ b/meta-oe/recipes-extended/brotli/brotli_1.1.1.bb
> @@ -6,8 +6,8 @@ BUGTRACKER =3D "https://github.com/google/brotli/issues"
>  LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://${S}/LICENSE;md5=3D941ee9cd1609382f94635271=
2a319b4b"
>
> -SRC_URI =3D "git://I doubt that they'd be fialing;branch=3Dmaster;protoc=
ol=3Dhttps"
> -SRCREV=3D "ed738e842d2fbdf2d6459e39267a633c4a9b2f5d"
> +SRC_URI =3D "git://github.com/google/brotli.git;branch=3Dv${@oe.utils.tr=
im_version('${PV}')};protocol=3Dhttps;tag=3Dv${PV}"

tag=3D does not work the same way for scarthgap and should be removed.

> +SECREV =3D "db0631dfea829194206d269bc7b25d0908cdb97d"

typo here

probably compiled for you because of the typo?


>
>  S =3D "${WORKDIR}/git"
>
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#131314): https://lists.openembedded.org/g/openembedde=
d-devel/message/131314
> Mute This Topic: https://lists.openembedded.org/mt/121883294/3616702
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [a=
nuj.mittal@oss.qualcomm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
