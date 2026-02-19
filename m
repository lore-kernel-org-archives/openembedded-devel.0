Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0635CE9A02C
	for <webhook@archiver.kernel.org>; Thu, 19 Feb 2026 03:04:42 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6305.1771470278996226591
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Feb 2026 19:04:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=gyrWqS40;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=X1p2ZfUC;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61INlJqt1923765
	for <openembedded-devel@lists.openembedded.org>; Thu, 19 Feb 2026 03:04:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ET8Gcmkm2AFa13R0T+sLsGcrYLFp7T1ienhzcCWng0o=; b=gyrWqS40+GgMAeDL
	pDsQl73yNkxdb4fxdOzxaZnOpwdKP+5gDk81djatgS/nIwbkeBvTy/Rl7POjWW3Q
	dV+Gc/qX3nWguYFYk8Sy9jciRaZrkLEUhGv1GkVxC45IoB9a55zVVpbvUk0Dl7i0
	LQH3wINxRxVu7HUXaWPSVNOySi9CJveZR+aNUt9DB9Hs0u1mUVvu917QmHAgpFtu
	wKxnGgvpWe6Q8nysjniGt0MFg/qmOuIQtWJ+06NMarl62eZYNSicKuRi9Gk+SHFQ
	TKYlrwJ05OdHTkNzUKVRrpsPkdovgf1+C05Lij2jr9magCKWe0adPRak/Txc1Usk
	ljcfpQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cdqdg8apu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 19 Feb 2026 03:04:38 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-89473f5a755so45061696d6.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 18 Feb 2026 19:04:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771470277; cv=none;
        d=google.com; s=arc-20240605;
        b=JQ3pWXQOoYa2bQKxE8fONuu2MuXMN7B9beF9VogJ+WSdbaklTwTDT955DmUTwaKtkt
         mSZ0O3/Ab2lbfBVe0Nhh0G1RzXmQH57GG5vlX+Zg1Vq4f/lBJUwPyinnFOhDCNGlH51B
         xWvuk1b0B4Z19mS/hiT4wvQkxrGklnnh2lj6LXQBMtcaBTMMDttP75fSfk6LtpQoA40T
         hhhKTLML8DE+VeIRh8JIzi6EPW+NbTmDMnMeZjNOEZenFYVVttXzj1/9V7ZYYhGvxfAe
         qkzhHiMNxdwnE4JvGnqRLq4lm2UgmhkrHatEAxys2n6BmjJ0yaX/Pl9xQDaphkM1369D
         7Q/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ET8Gcmkm2AFa13R0T+sLsGcrYLFp7T1ienhzcCWng0o=;
        fh=n0ZnAkKOhGDmrf8RLpwnC7FQ6xmEY5rofL6wXnjsXjs=;
        b=f882vpiHrtcc+9CanB566D88m8ovks5Gbq1o62ZsKVrMHH0q9D+KCtzcklcWLsoAjt
         XieZydKm9Sy0tZFvdPWZr8pM8JL0uyWDeiBjUOkVm2J8Aap3TRBM3e80G02CKiJtkKa7
         NbWOJzJSN+mmYx3SzeAXUM3JyyGCvRZP54VzyIabkUfWyHnyOyIuSLlPLUFvOZy9lEH4
         64W+ceIEVL8/IgrqHtqzHo7GmRNhA86iuOHjae4hSCt6BxpDHSnS0Wj6S6Tn/tqMRzeN
         LEZwVjaiSNTnwy+pwshaMY1dm/jtWuzmwfYkby2GD1B5dHj893PUxu/PDO2TDWu/mlIQ
         0lpw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771470277; x=1772075077; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ET8Gcmkm2AFa13R0T+sLsGcrYLFp7T1ienhzcCWng0o=;
        b=X1p2ZfUCT0KP7eey+9VbLdI+nUyer4iIo66wcoD+eWo8ePYHkpS8peoZ7Hv6HQwkqZ
         IlptNgtdkhDuCsYVMZplbBQQCYD3OH8UBg+FEe9ewrlWczl4qCUxsktxiLexQ0JBl4hJ
         G7Vuu4jnKnXCqaqGVorzAWZ+300lCFTjOeIkFD2tvD+/ok2lWDNoXdWWpzt/CHKO2ucA
         h4a0NN7PmB2R4PdJrZvG9uS2TWcw9IxJveIRF/PN98cLMVPSPVNlRFnLteIFpozkQ1E7
         VBjqPTXpCSvrxnsuuvhq2a5cZnx2ZelUihurTMa1F8LHysVope+aiMnSrvdoKwTSw+GQ
         MdXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771470277; x=1772075077;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ET8Gcmkm2AFa13R0T+sLsGcrYLFp7T1ienhzcCWng0o=;
        b=o3Grg1wx6Zpufj96PfI2zQNTN47S6YSrfdK94g9yWuUeKuxVIBRHatbyD9x/YucqIW
         ZZp019RSS/mnSFqVF8MKcRpULt25Xpph1QjP8oeMMKUA5cISjbvDO9YG1lKafPHkTYpF
         qpy2g3u/x/FO1WONqIzg12vPhTeO+vxEEjS69+3qjQvP1Vr6dUhW/Y/Bq3XC6CVUfM/a
         RUPRpNzvMywKt0sF5C/HoQnJOCQxSRdqXuye16BDCL9kxi261QmfVKJw5tlBHMuxYvry
         Q5n6XDThxncIwbGNFmV+i5n/sInDU0aHmtKTT6CazDJRPuakXnylHYIhjzLlh8VzzQCS
         W0fg==
X-Gm-Message-State: AOJu0YyNgXH5lCgwoXNs+ttPkMEIBHgzIiogk31nWeDgqMIVri7nZ/Um
	igMPiWDsid4ho4mMz3LqnFZAdyx2FCyVukHetdRWjmZ0YM/gaO++dkruTCrP7K+vfzjsxC0J1Ly
	o2oodMlqxVE0LuTFUedL9cogN3a51FcameCdYNJ9hLYPuJjaVqKNGTtLNflgLA0Dnpk/SFVU5Xt
	ZQMrPgv6GZ1H+cbgjKvEcT4kRMFxlC9Wr7ZA7EyRL2bs+l/NXh0ZGEICPAnRQ=
X-Gm-Gg: AZuq6aL8oShMei0YSravN+n0a4J7FW+HGWWuaghA8SJjYO2LPuNe1bdVAx98RtKx8uV
	SFnN0ICzljcY3oOoQSszBnuLcAA6BoH0Jet2b+0srUM+K/optVKscFwT0/abTijWbIIH4UGvE3l
	YoDvND3tuMBmM1F18jsSRzWO8GjY0DcOhE3O1XXfecmRS+Ue0OHxrcu5COcARnTBsi3rNyVsHX2
	QXc
X-Received: by 2002:a05:6214:1c86:b0:894:768a:a8c1 with SMTP id 6a1803df08f44-8973628fdcfmr257637606d6.66.1771470277396;
        Wed, 18 Feb 2026 19:04:37 -0800 (PST)
X-Received: by 2002:a05:6214:1c86:b0:894:768a:a8c1 with SMTP id
 6a1803df08f44-8973628fdcfmr257637296d6.66.1771470276921; Wed, 18 Feb 2026
 19:04:36 -0800 (PST)
MIME-Version: 1.0
References: <20260211120025.4190831-1-ankur.tyagi85@gmail.com> <20260211120025.4190831-8-ankur.tyagi85@gmail.com>
In-Reply-To: <20260211120025.4190831-8-ankur.tyagi85@gmail.com>
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Date: Thu, 19 Feb 2026 11:04:25 +0800
X-Gm-Features: AaiRm52JPn6D_HBTjdEY25bIB-pdTYQAWrTJKm267ISY36Dz-Mw2oSdYbM1mAl0
Message-ID: <CA+s=J=zMxXHgnsua6gXT0T6X7ZQPioAH53uu6K=WnkmNtmnhBQ@mail.gmail.com>
Subject: Re: [oe][meta-oe][whinlatter][PATCH 8/8] tomoyo-tools: update SRC_URI
To: ankur.tyagi85@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: jaamGoysrKFnwiwODX7yGUuBTE7-cyZ9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE5MDAyNiBTYWx0ZWRfXwYEI4QuJ3gnw
 oeD2Tt2D0mhAmuR8j2swNqIp6hyBkvYvNx5h+jneCBQinuGx5Whx86wxZlgPdl+Ecz27irDVyqQ
 sQiKvDybYCBwt5++aEZqPswLKLqwhVUoEn9qdsNmc3qpzsG6yaVOGFPVSuAiJNEURGJv4y7ysd7
 BQ9gsiiE/HnrevfiP73LnVWrJ1+cYuEfof2EpNXe6SoumESjgvTGq6FoyGN0mSGggiYQ7hmJ/Vl
 F2tNxmYv2WlFvYDvuUqCH7wDCbQBAfMp2hiMicSdWy6ZiX7vcOPgEO9qyE5f5KsM/KlDqC/CBuC
 Y/A2CGUQOz0oD5AAN4Nfi97NBJtzxh892CCZCc94kK5Kfi3B5bxkukicG6zBg4MZ7WfdjZQXHy2
 3ZNCQDWRTuXODDlSzZ1Ds2LODWkArqQSQWnV3xMPaqB/LjMqsKGro0c6QOcLupA4i8W9dwgPzS+
 gmsFfzmNz2/248mQ3kQ==
X-Proofpoint-GUID: jaamGoysrKFnwiwODX7yGUuBTE7-cyZ9
X-Authority-Analysis: v=2.4 cv=W/M1lBWk c=1 sm=1 tr=0 ts=69967dc6 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=dnEwNotGAAAA:8 a=Q4-j1AaZAAAA:8 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=2z4Yuufrs0bkGwcmrfUA:9 a=QRzjZtwMIBQA:10 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-19_01,2026-02-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 adultscore=0 malwarescore=0 clxscore=1015
 suspectscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602190026
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 Feb 2026 03:04:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124497

On Wed, Feb 11, 2026 at 8:01=E2=80=AFPM Ankur Tyagi via lists.openembedded.=
org
<ankur.tyagi85=3Dgmail.com@lists.openembedded.org> wrote:
>
> From: Ankur Tyagi <ankur.tyagi85@gmail.com>
>
> The previous one became inaccessible.
>
> Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> ---
>  meta-oe/recipes-security/tomoyo-tools/tomoyo-tools_2.6.1.bb | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-security/tomoyo-tools/tomoyo-tools_2.6.1.bb =
b/meta-oe/recipes-security/tomoyo-tools/tomoyo-tools_2.6.1.bb
> index f172168335..a90a33ada4 100644
> --- a/meta-oe/recipes-security/tomoyo-tools/tomoyo-tools_2.6.1.bb
> +++ b/meta-oe/recipes-security/tomoyo-tools/tomoyo-tools_2.6.1.bb
> @@ -5,9 +5,10 @@ being useful purely as a system analysis tool."
>  HOMEPAGE =3D "http://tomoyo.sourceforge.jp/"
>  SECTION =3D "System Environment/Kernel"
>
> -SRC_URI =3D "http://jaist.dl.sourceforge.jp/tomoyo/70710/${BP}-20210910.=
tar.gz"
> +SRC_URI =3D "${SOURCEFORGE_MIRROR}/tomoyo/${BP}.tar.gz"

How do we know it's -20210910?

>  SRC_URI[sha256sum] =3D "47a12cdb1fe7bbd0b2e3486150fe1e754fa9c869aeefd42f=
d311c4022b78010a"
>
> +PV .=3D "-20210910"
>  S =3D "${UNPACKDIR}/${BPN}"
>
>  LICENSE =3D "GPL-2.0-only"
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#124336): https://lists.openembedded.org/g/openembedde=
d-devel/message/124336
> Mute This Topic: https://lists.openembedded.org/mt/117754895/3616702
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [a=
nuj.mittal@oss.qualcomm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

