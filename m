Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7779FD1CDCE
	for <webhook@archiver.kernel.org>; Thu,  4 Dec 2025 04:02:32 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.34669.1764820946415114816
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Dec 2025 20:02:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=nlRQeb6A;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=MSWk3ZbH;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B40ODxo4027088
	for <openembedded-devel@lists.openembedded.org>; Thu, 4 Dec 2025 04:02:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	43UkzFJ+q2q+3OpaKDYrpKKA8Csc0h4V+4YO5vR+lZM=; b=nlRQeb6A9l/ZTsq8
	FLYVdCCOylubfBKJwkXSeghQarTg6Yg3vXFBgNtNZ1YKizrsmLU+rizubaIi9jVM
	UPj8WD5DLSyegodvlav+gMKzWflLbaxnROeUk4rRA2tqBNH91OWCneqra5gtQZP4
	mHj5L1WmpTOocU3nencPyoqceVb81WFP4PhMIVAeRawfOEojaaIuVuLBrF0Zm3z/
	km1eIT14TKCRmZ/Yd/M9VDiEkvw6R433tq1RfAzihVfiwVLKuld/jPLLUFTmqi8u
	jpwd45nPm2ZeMb5pNBKI/drCcI4jUhSJ0vBPJEvh++opnDpucYMKh1wzRPM5bYMF
	doaa6w==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4atmmdaj7q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 04 Dec 2025 04:02:25 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8823c1345c0so5433706d6.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 03 Dec 2025 20:02:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764820944; x=1765425744; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=43UkzFJ+q2q+3OpaKDYrpKKA8Csc0h4V+4YO5vR+lZM=;
        b=MSWk3ZbHUF/1XBcNqc8bnp1j2AvVt1iLeX2fXaMezps0ow6nwXgVMhDPzKDBe5S8yY
         MBB16tqcsDkkPsPJA2epWT9b2xUB1dAip32w1JVmA3HjWwfLPZ379JV7H5EdwOFYll+t
         nJzWcWGgRcZ3m81mGuiLeMZI4vg+NWaluhCUvMbyHzoZJc9DYeYumVeJdcvguHU90h+O
         itdxtnqKym+BMhb9FdUusrdkwm84+D2V30aIRCPSbrdRd3XKus7oNrfCA/xHS31I5Baw
         kH3d8ybzUVhnHLvGOYphjLw8trF855bi52iHpN6WidytHaIb+AfsSZSKUGriLZPRwn5Z
         2OFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764820944; x=1765425744;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=43UkzFJ+q2q+3OpaKDYrpKKA8Csc0h4V+4YO5vR+lZM=;
        b=vyBms/MdXetTkF66DNNTXIDWCYxxyLvsXErCcDKSzdpeZKEYLynaBjJUf9H8CBD64e
         j9nwsB2b3tSpesDp/USRi/oJTJ5TW8RcZlZp5KzgsbebvZmahSs3qerDFNXrB+SbNAeU
         2sd362FXN2FoIV6SzwfhtldJZvOywFcOisX5reKgDRJtSLYt8PotJ0fxsclbcEGv0PlK
         WTKzwigBPpo2aZ9jB9CX0deY9Gd18CXW+AKLbSzqQuMWSdX4q1WdK0c7eaAnwHZfIFBG
         d/qiGWXO5S/v46yS9ZhA7NempfvEwMj6mUKEOj99cJ4GPpSCz0T6JouQycd9nV48G5Ss
         VP9Q==
X-Gm-Message-State: AOJu0YypUptBbQzu7RvAkIYWNThRMPvXFT3+25GQQYnJi0W7gbS8ch/m
	MHMfpn9AK9xGlapV4kCcfhDK0On0/fhx8eNnAWHMLClY5qlTN8tsFcnUoWCKUAIkKsq+Z3vIAHi
	ds+bhLFvMTpM5F6AJGlomuLKKFyXTHKZvoaKZSNS6CfyT974XDWZW24mzBVASHWtM7ZDxvzqo8T
	17t+uOZQw6p6pUc9SwtY2+uGXeb3T05ZpK/NCOcajR1wSmRgt+PkczthS39sWKWAnBRvXFbA==
X-Gm-Gg: ASbGncvcyyKsz9vzZlue/cV0epZw3e1RYQidFTpHDbFRNqB6t/IuxZ01BJ8hC+J5low
	25/fnx+aEL7ILgMDkJIOG07pIEDh3M4GtOeqVMQ61hh4ZoX0dl1ruvQhMp980kBVm1Bw7iicCWM
	ngW4/XNEzMhcrBBEQoKF2CQqNBjm0Sf4FHPlZkKu/y3pNa66yodwy+IZyOAGWBoRfoee4=
X-Received: by 2002:a05:6214:528f:b0:880:5851:3c61 with SMTP id 6a1803df08f44-8882471e5ffmr28005466d6.0.1764820944424;
        Wed, 03 Dec 2025 20:02:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEY0l0Q8sr3IkZGqwHo6dXRYx/XUVOhpyS10i/AHoRNm0cYwPDBnLXNgmCO4suhHwn5pI+nq/P7uyFDrJMXRCA=
X-Received: by 2002:a05:6214:528f:b0:880:5851:3c61 with SMTP id
 6a1803df08f44-8882471e5ffmr28005176d6.0.1764820943971; Wed, 03 Dec 2025
 20:02:23 -0800 (PST)
MIME-Version: 1.0
References: <20251203212949.4046524-1-skandigraun@gmail.com> <20251203212949.4046524-7-skandigraun@gmail.com>
In-Reply-To: <20251203212949.4046524-7-skandigraun@gmail.com>
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Date: Thu, 4 Dec 2025 09:32:13 +0530
X-Gm-Features: AWmQ_bk9gNG1UxCtBaUtVA4a7YKj9YeXto3GSxeQ8dMGT6vJbGLaAnVafu-41nM
Message-ID: <CA+s=J=yaHySJQz4O2EmkqD=r_ZsN24keObg9q8c06UHcJadcPQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][scarthgap][PATCH 07/12] xrdp: patch CVE-2022-23482
To: skandigraun@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: RVNlsHUasnXgica9M4xrVCPQtlFNxqLO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA0MDAzMCBTYWx0ZWRfX1XjVkSLx4ORD
 DKprrjtOv18CvKdAXnc+JXnHN5LDRo4CWb9YPMmYUw+gHi2iM6aqvLUPJCadONCGT+3WzyhoLFr
 6eDLVB4UBvOZZgBYXarU5U0lm5dIczZNe8Ah9ekBVogowrFD62Z3h8HITtptGUPeXL62tdYk5Oe
 dYp7sKL4bD2zVE45bS4pvYWfgOX+6JjqpG1j9LxFLFrsdEkoWfeoDdzSlww2agC9m+yb3aAfqHS
 qpizeXydL2ZJEkS5xI1Ht4tWgnoGtrNnNFvfDb2+/AUxorlgsHbFyEMjgwYdrXewnmILvEFsfSt
 QXVzOx4Jbp5gPfm+7B3FcHn7Q/rqLmdFd0F5TZOahQF/5eWEhtdBfl12GoLevp+OaM2PckK6wj5
 plg4rF4m+UkC5FLRuJTsnvwV3leIIw==
X-Proofpoint-ORIG-GUID: RVNlsHUasnXgica9M4xrVCPQtlFNxqLO
X-Authority-Analysis: v=2.4 cv=Ctays34D c=1 sm=1 tr=0 ts=693107d1 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=PYnjg3YJAAAA:8 a=NEAV23lmAAAA:8
 a=Q4-j1AaZAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=BYj4JOyFqgrvn8tvg9YA:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-04_01,2025-12-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512040030
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 04 Dec 2025 04:02:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122298

On Thu, Dec 4, 2025 at 3:00=E2=80=AFAM Gyorgy Sarvari via
lists.openembedded.org <skandigraun=3Dgmail.com@lists.openembedded.org>
wrote:
>
> Details: https://nvd.nist.gov/vuln/detail/CVE-2022-23482
>
> Pick the patch that mentions this vulnerability explicitly.
>
> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> ---
>  .../xrdp/xrdp/CVE-2022-23482.patch            | 69 +++++++++++++++++++
>  meta-oe/recipes-support/xrdp/xrdp_0.9.20.bb   |  1 +
>  2 files changed, 70 insertions(+)
>  create mode 100644 meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23482.patc=
h
>
> diff --git a/meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23482.patch b/met=
a-oe/recipes-support/xrdp/xrdp/CVE-2022-23482.patch
> new file mode 100644
> index 0000000000..5c22701d35
> --- /dev/null
> +++ b/meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23482.patch
> @@ -0,0 +1,69 @@
> +From bb9766c79f24a0238644e273bbcdcb2c9d2df1bf Mon Sep 17 00:00:00 2001
> +From: matt335672 <30179339+matt335672@users.noreply.github.com>
> +Date: Wed, 7 Dec 2022 11:05:46 +0000
> +Subject: [PATCH] CVE-2022-23482
> +
> +Check minimum length of TS_UD_CS_CORE message
> +
> +CVE: CVE-2022-23482
> +Upstream-Status: Backport[https://github.com/neutrinolabs/xrdp/commit/bb=
9766c79f24a0238644e273bbcdcb2c9d2df1bf]

This causes yocto-check-layer to fail for this and other patches in
this series with same issue:

AssertionError: 9 !=3D 0 : Found following patches with malformed or
missing upstream status:
/srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/recipes=
-support/xrdp/xrdp/CVE-2022-23481.patch
/srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/recipes=
-support/xrdp/xrdp/CVE-2022-23483.patch
/srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/recipes=
-support/xrdp/xrdp/CVE-2022-23480-2.patch
/srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/recipes=
-support/xrdp/xrdp/CVE-2022-23468.patch
/srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/recipes=
-support/xrdp/xrdp/CVE-2022-23479.patch
/srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/recipes=
-support/xrdp/xrdp/CVE-2022-23480-1.patch
/srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/recipes=
-support/xrdp/xrdp/CVE-2022-23478.patch
/srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/recipes=
-support/xrdp/xrdp/CVE-2022-23477.patch
/srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/recipes=
-support/xrdp/xrdp/CVE-2022-23482.patch



> +Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> +---
> + libxrdp/xrdp_sec.c | 23 ++++++++++++++++++++++-
> + 1 file changed, 22 insertions(+), 1 deletion(-)
> +
> +diff --git a/libxrdp/xrdp_sec.c b/libxrdp/xrdp_sec.c
> +index 691d4f04f3..084fca6b8d 100644
> +--- a/libxrdp/xrdp_sec.c
> ++++ b/libxrdp/xrdp_sec.c
> +@@ -1946,6 +1946,17 @@ xrdp_sec_send_fastpath(struct xrdp_sec *self, str=
uct stream *s)
> + static int
> + xrdp_sec_process_mcs_data_CS_CORE(struct xrdp_sec *self, struct stream =
*s)
> + {
> ++#define CS_CORE_MIN_LENGTH \
> ++    (\
> ++     4 +            /* Version */ \
> ++     2 + 2 +        /* desktopWidth + desktopHeight */ \
> ++     2 + 2 +        /* colorDepth + SASSequence */ \
> ++     4 +            /* keyboardLayout */ \
> ++     4 + 32 +       /* clientBuild + clientName */ \
> ++     4 + 4 + 4 +    /* keyboardType + keyboardSubType + keyboardFunctio=
nKey */ \
> ++     64 +           /* imeFileName */ \
> ++     0)
> ++
> +     int version;
> +     int colorDepth;
> +     int postBeta2ColorDepth;
> +@@ -1956,7 +1967,12 @@ xrdp_sec_process_mcs_data_CS_CORE(struct xrdp_sec=
 *self, struct stream *s)
> +
> +     UNUSED_VAR(version);
> +
> +-    /* TS_UD_CS_CORE requiered fields */
> ++    /* TS_UD_CS_CORE required fields */
> ++    if (!s_check_rem_and_log(s, CS_CORE_MIN_LENGTH,
> ++                             "Parsing [MS-RDPBCGR] TS_UD_CS_CORE"))
> ++    {
> ++        return 1;
> ++    }
> +     in_uint32_le(s, version);
> +     in_uint16_le(s, self->rdp_layer->client_info.width);
> +     in_uint16_le(s, self->rdp_layer->client_info.height);
> +@@ -1994,6 +2010,10 @@ xrdp_sec_process_mcs_data_CS_CORE(struct xrdp_sec=
 *self, struct stream *s)
> +               clientName);
> +
> +     /* TS_UD_CS_CORE optional fields */
> ++    if (!s_check_rem(s, 2))
> ++    {
> ++        return 0;
> ++    }
> +     in_uint16_le(s, postBeta2ColorDepth);
> +     LOG_DEVEL(LOG_LEVEL_TRACE, "Received [MS-RDPBCGR] TS_UD_CS_CORE "
> +               "<Optional Field> postBeta2ColorDepth %s",
> +@@ -2138,6 +2158,7 @@ xrdp_sec_process_mcs_data_CS_CORE(struct xrdp_sec =
*self, struct stream *s)
> +               "<Optional Field> desktopOrientation (ignored)");
> +
> +     return 0;
> ++#undef CS_CORE_MIN_LENGTH
> + }
> +
> + /**********************************************************************=
*******/
> diff --git a/meta-oe/recipes-support/xrdp/xrdp_0.9.20.bb b/meta-oe/recipe=
s-support/xrdp/xrdp_0.9.20.bb
> index ff14cf8397..29245f3747 100644
> --- a/meta-oe/recipes-support/xrdp/xrdp_0.9.20.bb
> +++ b/meta-oe/recipes-support/xrdp/xrdp_0.9.20.bb
> @@ -23,6 +23,7 @@ SRC_URI =3D "https://github.com/neutrinolabs/${BPN}/rel=
eases/download/v${PV}/${BPN
>             file://CVE-2022-23480-1.patch \
>             file://CVE-2022-23480-2.patch \
>             file://CVE-2022-23481.patch \
> +           file://CVE-2022-23482.patch \
>             "
>
>  SRC_URI[sha256sum] =3D "db693401da95b71b4d4e4c99aeb569a546dbdbde343f6d33=
02b0c47653277abb"
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#122285): https://lists.openembedded.org/g/openembedde=
d-devel/message/122285
> Mute This Topic: https://lists.openembedded.org/mt/116602085/3616702
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [a=
nuj.mittal@oss.qualcomm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

