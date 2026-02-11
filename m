Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C558E9E301
	for <webhook@archiver.kernel.org>; Wed, 11 Feb 2026 12:39:57 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18130.1770813594933278016
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Feb 2026 04:39:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=U5NYZYBH;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=YlKRER+n;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61B8w1dv3320981
	for <openembedded-devel@lists.openembedded.org>; Wed, 11 Feb 2026 12:39:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zEHleEC4kbVEVQynm0v22FGzB25o9czT5j4TtzIBB4Y=; b=U5NYZYBH5YD6Wom3
	YLuYP+wEwmPRK4mHhem0SEQeb28v1AnoBrn+y2frP3Xh3hYYvozG19EPtJgeikSk
	wAORDJepDdgxlzO2uZMRwGklDUYUTN8Nk8/cUUe6pZaTA5rBP2TmyiNeaWCZVMe+
	jCW7L6J+zo2dnw+FWkRst+gojrF0Um9JcM7sZUoEx0HnM4QZoD0WSthNMq2/o+x+
	O8DK7W47RoQvWKkxr+dHxFMfP9J0xzkIJQ127cgNbX9lwYGSwEfpFVZaz6+OUJzK
	Tc3a2rEbgS8CJzynuTHacvAkutRJJHUp5kBZa3aXcUlY9+BgFM51q8OlNoIn63Kb
	f5ktGQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c8epsj3pk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 11 Feb 2026 12:39:53 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-89471437f64so68829536d6.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 11 Feb 2026 04:39:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770813592; cv=none;
        d=google.com; s=arc-20240605;
        b=CxNJSudhuOW6IsI4TCsupTW/IXXnJ27aOR4RJF9cDG2AGp+n4KQ60SQ6CARX/K+aIr
         1lWoNstXJ+dw2qFZ6tI0yjGr9Z0eFYSAb6cGauE+aFfd1HALNTw7MDtA7Su4sLybeOrC
         0HczPOsf38Q+wfc2B9rX8LQzX5ztI5phoA4UbJ/HCD2Do80CrdWpz+4EvBwj4nz/pe04
         9VQ9shBVhkeXwbLXEpiVBVOCMREbiDpD4EP06jDxl4i+5nrkhLcdGft3S3pqBnKwGNQ8
         /dy9mLGFZMiLzVjvp9NpkYklbP2FD49vzNU0j2RLgg7tM4pilQzfCBVNXozYT05Vq7ox
         w0Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zEHleEC4kbVEVQynm0v22FGzB25o9czT5j4TtzIBB4Y=;
        fh=PqrvWOQDuMW7DBEZMtJk4sUef2SPa7RI/TJA4C6UjCM=;
        b=V0cTqUF5tiwj7nD+0t5UhWChTtKubD8jaUnwjp6kbdl9MIHECAuZen/jwop04mKUfW
         pmvF9EpfrW0/kSReSK5r7vD+WFNHY0nmUPdG7/qozdLN/KpSGRzTWT/qBCVMeGpbxTiC
         PeBm0mOYZIb6EMGxZJbYOWjJqaGZ0iq3MEaY84ImT+Jji9m6u/NPvc7R2o1d2a/J13YS
         r0lQ+DG5B7KYHid/v9WBPYGb9W9YHoo3Kvj0cJPy54V5dFwDMe/QC7QU7SPiWQQZCN3x
         m+nbgWidf+h6TUkqFWZDQqo9DdyCgVLbpUXqhnyNrF+SY5HoWrpfsuTzMAeTDjQXQfPS
         sbRw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770813592; x=1771418392; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zEHleEC4kbVEVQynm0v22FGzB25o9czT5j4TtzIBB4Y=;
        b=YlKRER+nuYst3fsDe/qvvAZh2/E+e3w/zbuh/IYb/Qq5Lwru7uVeq+mKxNZb18RJaR
         haw/q3BkEYx7TcH8fgeWHPf9zYQrEfwPs5Y7r/DTS+25qH7HamPXqFKKxZQ5ge1POnRw
         2JU5qdsETqGd0nVe1hA+V4oRU3VsDaP1ccZnpTeb2yv68JqHYt1cbwHG6oMXFxIwoTvS
         9QsvLzn1KPnQCsAdViWNhZtqFIypsAu52mcLV/yiTXC8qjtv24qe03nziglrAyhQQtlw
         m6fmrP2V4fJtINwN7Gof8CnykSdE4dwdFpwFx3GDd2GSEw5o22MqvklbKslTI7fj0pzT
         Pjbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770813592; x=1771418392;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zEHleEC4kbVEVQynm0v22FGzB25o9czT5j4TtzIBB4Y=;
        b=qq2M6xGgDJdyUrccfwM9sEZ9XCyGzbrQirRg44L5U5fnT0svj+fLVFy9iSMGl139Jz
         i83E1en1+tu1zd+HaSB+hq4JlVa9oNWpS8RnjMngsR06PXm3Jt9eupSCkuMB0+hpaByY
         dcCacaDPCFYwzsGRpX0fxViI4FowMejn7hjxTz7LzjH4Dl7blEaD5g6Zuh36mfstrrLK
         gGwxXKEqGlNiEha2xVh0BLx1gue6MqbeAONta7A0gGRFdyVvPLwwEeK3R4R/VlxWjC1Q
         2Wj4nndgorBgCDrftDyBfayTCEkEV8nQIroXu7w8Zy3CLAcy57TPafIi0BiS9XmGRMQB
         cwNw==
X-Gm-Message-State: AOJu0Yx5DjlC91LtXcdaUpyFnpnMPA/4c3QLe0KILupd3G8ySrNf4ICE
	FjavL1ljyU2V6bRZ+Pq7sQ7zi+/K+GAR/s4nGlZ2fSCy914yA3170Tifows/QsB/r8AwThMlOo5
	Vtmr0taZM3r0K4zwei4bcH6m2TZAuLjfJMkNXPfaFMmL0IT5TWxQWNQaqnnosWz6l9Qv+c2JHM9
	j0RSkSUnQPOCvJ3qGHmMWr43YXTety149f/YzV9HOoYN6m/fhhTR3h4iIDy08=
X-Gm-Gg: AZuq6aKo6CBeM0bUMqfX8BlZYwR01g2bhBnfS1j1hBeaLYhril8aJVF/9umcGbpZU3j
	25xYJFLFv8neHnq3kvmNM6ASGYMeRTgm59gS2/OXnlBvLebypPyDoJZ1aSkjGopUylZBRz8rCFn
	FuEGsf0OLj4N2fVKasXFDS9VL9BRMlWXGn/Asqo9m/wOMvTK0sWQvEoZAzom6JG5HMmA49T6dzR
	TmF
X-Received: by 2002:a05:6214:c2a:b0:88f:d216:6fef with SMTP id 6a1803df08f44-8953cf9e74cmr278258866d6.50.1770813592530;
        Wed, 11 Feb 2026 04:39:52 -0800 (PST)
X-Received: by 2002:a05:6214:c2a:b0:88f:d216:6fef with SMTP id
 6a1803df08f44-8953cf9e74cmr278258436d6.50.1770813592094; Wed, 11 Feb 2026
 04:39:52 -0800 (PST)
MIME-Version: 1.0
References: <20260208145143.20464-1-skandigraun@gmail.com> <20260208145143.20464-6-skandigraun@gmail.com>
In-Reply-To: <20260208145143.20464-6-skandigraun@gmail.com>
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Date: Wed, 11 Feb 2026 20:39:41 +0800
X-Gm-Features: AZwV_QgnQPbY_DYzg0t00vdtpweKr-Ux8re6S4Ua0vBLZ8HI2OfX6udhufREGc4
Message-ID: <CA+s=J=w5QNcRXXSk4uTGdp6m9DAzLXhabbCnLbRJVcsMhSQUzg@mail.gmail.com>
Subject: Re: [oe] [meta-gnome][scarthgap][PATCH 06/10] gnome-commander:
 upgrade 1.16.1 -> 1.16.2
To: skandigraun@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjExMDA5NyBTYWx0ZWRfX8BnRIrE8gtzX
 qrjY5fgU8DOYxP+u22XvOzEHfG2/+V4KDrtN1i+3LR3knKYNghCKTK1hpVBrnh+ggDf8vSzO+Zb
 NywXuJz3ab/zfKahhxwLKHuN+GcW+z1ELJ2w94jgDCSYcbLCguEKo6hBuHjs2TSal6prB36ihXu
 hjh0/1F4yCpp5RUz+N/WhMdhe2uYMI978k6bjHaoqn9nmmjUYl2mwgxqu/KkiRSRlG+BsBFQvk3
 3z3oEA46HBB2Ml1AQDquZGOAqU0drHKJtYPtJHZd7m5B3wQMJ6AStt4PgHYGSupBiJA5NwpWaos
 CS3tg1NLAE6EBmNSzn7TLbHbcH2aGMmjRtIdXkwHgs5Dx8K+47LVgzQxA0gPlEz8fUTGRVqJtAn
 g1TcCsNFirsQcIZB3WUjfkf4q9IIOP0/ginbKMHPrFVKtp6a18w9sBn1OB/3dQDqdSF+iE+ZX8o
 E4XH7QZ8sAnKihIkvLA==
X-Proofpoint-ORIG-GUID: tNg8MPvw_iRrcFh4NfX-kEwJ42LKlGag
X-Proofpoint-GUID: tNg8MPvw_iRrcFh4NfX-kEwJ42LKlGag
X-Authority-Analysis: v=2.4 cv=I/Vohdgg c=1 sm=1 tr=0 ts=698c7899 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=Q4-j1AaZAAAA:8 a=pGLkceISAAAA:8
 a=xqvPdcH6YBqVGUKfD80A:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-11_01,2026-02-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602110097
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 11 Feb 2026 12:39:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124337

On Sun, Feb 8, 2026 at 10:52=E2=80=AFPM Gyorgy Sarvari via
lists.openembedded.org <skandigraun=3Dgmail.com@lists.openembedded.org>
wrote:
>
> Changes:
>  - Fix double g_error_free call in remote_close_callback
>  - Fix build with taglib 2.0
>  - Set project gnu++11 c++ language version explicitely
>
> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> ---
>  .../{gnome-commander_1.16.1.bb =3D> gnome-commander_1.16.2.bb}    | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-gnome/recipes-gnome/gnome-commander/{gnome-commander_1.16.1.=
bb =3D> gnome-commander_1.16.2.bb} (91%)
>
> diff --git a/meta-gnome/recipes-gnome/gnome-commander/gnome-commander_1.1=
6.1.bb b/meta-gnome/recipes-gnome/gnome-commander/gnome-commander_1.16.2.bb
> similarity index 91%
> rename from meta-gnome/recipes-gnome/gnome-commander/gnome-commander_1.16=
.1.bb
> rename to meta-gnome/recipes-gnome/gnome-commander/gnome-commander_1.16.2=
.bb
> index bb36d59e56..3cbeba9ae2 100644
> --- a/meta-gnome/recipes-gnome/gnome-commander/gnome-commander_1.16.1.bb
> +++ b/meta-gnome/recipes-gnome/gnome-commander/gnome-commander_1.16.2.bb
> @@ -17,7 +17,7 @@ GIR_MESON_ENABLE_FLAG =3D 'enabled'
>  GIR_MESON_DISABLE_FLAG =3D 'disabled'
>
>  SRC_URI +=3D "file://0001-Build-fix-needed-with-taglib-2.0.patch"
> -SRC_URI[archive.sha256sum] =3D "3f1d00c4a650fe7902167648286b32c9ca4ef86e=
31a5d8ccca0139f12d10d0b3"
> +SRC_URI[archive.sha256sum] =3D "7cf5d56c77a95d828f25407294312abaae20dc6b=
556ceafd9424dbfe209e5ed3"
>

This seems to be causing a build failure:

patching file src/tags/gnome-cmd-tags-taglib.cc
Hunk #1 FAILED at 150.
1 out of 1 hunk FAILED -- rejects in file src/tags/gnome-cmd-tags-taglib.cc
Patch 0001-Build-fix-needed-with-taglib-2.0.patch does not apply
(enforce with -f)

