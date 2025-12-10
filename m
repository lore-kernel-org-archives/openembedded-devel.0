Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E65FFD3C91B
	for <webhook@archiver.kernel.org>; Wed, 10 Dec 2025 14:52:03 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17604.1765378315369771019
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Dec 2025 06:51:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=gQMhIjps;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=TT+PkHbR;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BA8e19i1933213
	for <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 14:51:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/M0ezEkzyz48c3U3B5s0fsTu6kBY4c039YltrmAEX/w=; b=gQMhIjpsLsEyB2Cg
	gnxVm8BbCNleDpxRtmAPDLvUByZR3X/KP3vgoPBR2/12cAy5zAKIlkeiPKlK249i
	xApj460UIl4xCWXrJjFm3r8gxhCPRDlamy9kmfbaWiPDzowC/cGG+LFuKih1Dhxs
	cyNOT4iymM8EcU0uWXgZm8hAzuplUdT5cKiuuYkPzPDSC9BB6YdP4fK2BORgvJCP
	71mYHxwWgFwXV3L+4BzxJlNjmbWObsqK+8dAgAkkDFdr0tNu+fovW31/RXBHS3Fo
	0O3vg2jgr1mp9oDPnS4EqlyZjQ8pfnVBYMMPpAjWjYKAsl5QeVOszQ78OOLnjGI1
	ngVdjQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ay505h5wp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 14:51:54 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8823c1345c0so90962746d6.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 06:51:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765378314; x=1765983114; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/M0ezEkzyz48c3U3B5s0fsTu6kBY4c039YltrmAEX/w=;
        b=TT+PkHbREzO2o+Ej+5IoM3EajIFUsbCJZudHLvYKSIjYE5etYEIvgt+Wadi9Hrzm6U
         MJGmMwwFiojaIKbQpFhfyWsYYtE/vrpZvY20CCYbCMNmspYeDmdDaFCXCkK/qkN3TVzo
         gGx6K/1PoaXMhy8IHSY06w+jxtQMVLJgpkAmmIN6Ai4qOlHgQxolAsjQ2gUIzuRL1R0Y
         kt46ewRf4e9dOif86o6lArCBMq/6PhFOGv+nITfQXRr/ejqWreN1OXgAlnA4ZgGwXiBH
         dz9F8aGMa4TAyXzUcSms8Gja9P89H7A54imNusLm8VMwI810xCoVf3It5+RT5rQ7S25F
         rmlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765378314; x=1765983114;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/M0ezEkzyz48c3U3B5s0fsTu6kBY4c039YltrmAEX/w=;
        b=Y2hMM02xofUZ4OPJplKSg5j891esh8djH7QryZIqVQzt/02MSx8GpZouOwngQusOw0
         niJt2YUwtrGuMrUxe+GFb+p1tf0YlIpSzYCRynBR4nrRiZoKXYIylzNM+NBHzx0KHHOr
         feqfpiZFvRAff0X75aIJseaaFPji5JqKF3zFqDks3ujzOCs9oEFzsOq37l2ikk9hBcr6
         LaQUXyBmixd29ghU+oA/dU4cNs0qbtSTll/wShv4ZXmnD/iSnXENezbIaSTdfVq7hz/o
         EU9HJL7UrhvgiLu1a/oo0Cly3/lsSmaHkCj9D8a2Z3YL2u4yTNzC2oAP+18g4wSpnoFD
         YBrg==
X-Gm-Message-State: AOJu0YxL4hRtf5aIysxwSoueyJ/AS++K35yVbbMXhzjfBjIT6yvOCQ+E
	SClNCNfye3bKMthYX1XBSHa/frNAzCPCqgaIExcT40U+Fd9gGeSOlKiwOWlgJx+JO+6zywxox8f
	Ye6KRNdhK9uSurgBqNw8UmrCpdYwlQewhMgnwb7X0qO9gJxr23QmHiMwTWSy8fB/Ch37iafbYIz
	XYOBXnExDNwvTNPwAGlPBOvyNhi+kbAg7rngUBmMDYSddf4kWwvW050m3Tp+Fk8p1j8o73nQ==
X-Gm-Gg: AY/fxX6MtpcPc7GrbvubYeni1yd3qLgnSzBJAZeAT7PTk96X60kQGDFcfiiPCZcvv6T
	S3FsnBdkjlzEe4A2qDighJHFWNTz/k2TG0NtmGE9swxGpKspvt1RsyhiVCHCHA59ztpF3W+9lUd
	CHV79m7XS2x0Y8A5gt3TwtWv84CQ0qt7ywqrOHeDVTmR58eBzYL3kGJGCeY8Xwy2/y
X-Received: by 2002:a05:6214:3d9a:b0:888:224e:cb51 with SMTP id 6a1803df08f44-88863a2a666mr36866726d6.12.1765378313601;
        Wed, 10 Dec 2025 06:51:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEtPSR2s1wYMIjimWMpUP05HU1olhAEGNXDxwuzTngbYYVgzajaR2llCDBfTlNd9kO4GH6nZSOSBkpFN2CKKAM=
X-Received: by 2002:a05:6214:3d9a:b0:888:224e:cb51 with SMTP id
 6a1803df08f44-88863a2a666mr36866346d6.12.1765378313129; Wed, 10 Dec 2025
 06:51:53 -0800 (PST)
MIME-Version: 1.0
References: <20251209095552.690-1-wangmy@fujitsu.com> <20251209095552.690-26-wangmy@fujitsu.com>
In-Reply-To: <20251209095552.690-26-wangmy@fujitsu.com>
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Date: Wed, 10 Dec 2025 22:51:41 +0800
X-Gm-Features: AQt7F2ojeaB47qbVUsd4NMlH0h6U4S03zNsW7A9LXFoBBl5cyg5bwyJjuwThx-Y
Message-ID: <CA+s=J=y32ok6XhDoFxLQTkqW=mTh3YVHjXp3m2m+iQArRjkVfw@mail.gmail.com>
Subject: Re: [oe] [meta-python] [PATCH 26/38] python3-pyais: upgrade 2.13.3 -> 2.14.0
To: wangmy@fujitsu.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: PDmKeEL82mkit3wqLlebljABnJDP3P32
X-Authority-Analysis: v=2.4 cv=Bu2QAIX5 c=1 sm=1 tr=0 ts=6939890a cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Q4-j1AaZAAAA:8 a=omOdbC7AAAAA:8
 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=RdPhzC3jDB9TsqoDATQA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-GUID: PDmKeEL82mkit3wqLlebljABnJDP3P32
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEwMDEyMCBTYWx0ZWRfXyCFpslwlwQBt
 LNIRbluGtWVOgSaa/1mkqxf6z1Q5lrI2RwTloOI7NwFBYvU63zF3oc8uMwQY51fDbwMHhrADyrs
 cogvOqP0YYBagpivYLWEUgEtL4U7B1OzAIU1LDd0ef5VTixVuND3kJ0N6iVRT72qqVaQj/Aeogv
 VjO9bT5Xat5Y/VebiY6pKPFwEfElXdvMeyJsySGGjmG7SOetbsZ0a8fiJY9Ag3HLHxALYzjuT4C
 0HUuLUL34rc3dz7WKRfQFdCJONImb9C1R5VgxuK3VZsshr2dMQ5RkDJ0FHkOVKpnuzz9fLyd1wk
 kt+9rmwNTG7/Qca3x9YY55LNnkfri8oHAfPhNByaXbd/88J8JXyTtHG+zAGR1VCCDEEcLbrtmew
 hTSdfM8FcF+yUMSKK0izF4NQspF+Pg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-10_01,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 phishscore=0 bulkscore=0 impostorscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512100120
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 14:52:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122557

On Tue, Dec 9, 2025 at 5:57=E2=80=AFPM wangmy via lists.openembedded.org
<wangmy=3Dfujitsu.com@lists.openembedded.org> wrote:
>
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> Changelog:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> * Fix: Message Type 24 Part B: Detecting MMSI as auxiliary
> * add support for AIS Message Type 24 Part B auxiliary craft variant
> * auxiliary craft now decode mothership MMSI instead of vessel dimensions
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../python/{python3-pyais_2.13.3.bb =3D> python3-pyais_2.14.0.bb} | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-python/recipes-devtools/python/{python3-pyais_2.13.3.bb =3D>=
 python3-pyais_2.14.0.bb} (93%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pyais_2.13.3.bb =
b/meta-python/recipes-devtools/python/python3-pyais_2.14.0.bb
> similarity index 93%
> rename from meta-python/recipes-devtools/python/python3-pyais_2.13.3.bb
> rename to meta-python/recipes-devtools/python/python3-pyais_2.14.0.bb
> index 4103eb916c..800f460610 100644
> --- a/meta-python/recipes-devtools/python/python3-pyais_2.13.3.bb
> +++ b/meta-python/recipes-devtools/python/python3-pyais_2.14.0.bb
> @@ -5,7 +5,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D79d9e278b76e3e=
5b3358cd70b328173c"
>
>  SRC_URI =3D "git://github.com/M0r13n/pyais;protocol=3Dhttps;branch=3Dmas=
ter"

Please also add ;tag=3Dv${PV} here


>
> -SRCREV =3D "f0b3e06c4f1a532ba75986bdcf999ad776f81908"
> +SRCREV =3D "04c33cdfd156bcfbb6c924f7f889e47e3c2373c6"
>
>  inherit python_setuptools_build_meta ptest-python-pytest
>
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#122430): https://lists.openembedded.org/g/openembedde=
d-devel/message/122430
> Mute This Topic: https://lists.openembedded.org/mt/116691561/3616702
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [a=
nuj.mittal@oss.qualcomm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

