Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 082D7D79779
	for <webhook@archiver.kernel.org>; Mon,  2 Feb 2026 07:22:26 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.47441.1770016936054882527
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 01 Feb 2026 23:22:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=aRcyUJ/7;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=CHlyrApd;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 611NtX5p1997319
	for <openembedded-devel@lists.openembedded.org>; Mon, 2 Feb 2026 07:22:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sKw8KbV4s+AwbK6kHtAy2X31f9H0kCEO5SprWPXDwGg=; b=aRcyUJ/7BpO/hBzf
	xUBKODcXuozM3237ZrfSf9Omwt1cwhB26Z+LPBHplTte+2wCyEwyEwKAlpFThlAo
	YhQJhIaw4vdvgMQOAeJntwQlc8PnHTXdm1G+jfa2zo/hsNkpP0P2ca4IPneVZA6k
	DwGEoTRuWqy76ZuvmOMFdfY56fydiIm+pLBYkByTIz0+tNVQ4BNQp3XsNJhu9vyI
	yDyysIFEHKIFyl83GbJksb+l8XwA4YAqPXlp8D0uQpzgj3F0tB913y00TgYyDNoc
	WNfCnVk4h04DfthmG+nRIM/a6d5C+xJQo0/N73lfzHd+ZSa0k0G2BalcdlL9KaEs
	KZzD4A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1avnmd2s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 02 Feb 2026 07:22:14 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c71500f274so426151985a.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 01 Feb 2026 23:22:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770016934; cv=none;
        d=google.com; s=arc-20240605;
        b=hyTMYw8YMvUJDLWkjrrWj1iI6IH6G266znKYV0CtWD4i8GTevaUO1ScebqBkIbjDQ+
         lFezMf1yjfehFsT9QBGbqO4Bq8RjLTadkcqUGRXuiPmY+thgFNXlasz0dsj8GDtPl0s4
         QG6K+DyXxzV92aUp+lX0IDR+cMfGaV/OXmBR9gjbOJVFDyvarWEv//liMXgOp6UfmZKn
         3FU0+3bYf+AtEuGzzL53RhOkoWTPuqbZKDWHXKKiQjn8lB7AdVH0TI4hmvNdpNqyqwLC
         csYuUNNgd52zjcLLOj4jtPViX8ovVvTrwfHrZAxLD+fUjZ3Q0KzWJEBHDM8JfyYrRqWQ
         eZLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sKw8KbV4s+AwbK6kHtAy2X31f9H0kCEO5SprWPXDwGg=;
        fh=PqrvWOQDuMW7DBEZMtJk4sUef2SPa7RI/TJA4C6UjCM=;
        b=X1+KaAijIIqWachvYsX0ugDlcgyriQGoYOzVpmcvDF0wBqDTr4KhzOMmhzUs21Oylf
         jjLqXAAYLP0KemRe7AqAJBmalYhcJvLGY+/M6bTm2Lo6edi7FX9r2+M+TcV53f7WLlyO
         sx4z26ptINShkmbEB5j8rw7PhTa7mOtKgx6wb7wJ12yRpXYeOV9/ZmVCb/fLzEthkJ4O
         E7XcXe1jXOtsrRyFvy010FkGkunOZt3oRIGMQrtqgVD0+O8N0py7ctYpO2KTCy/XFpNk
         1VH+rqrOYQCIaKJ7E1M/Nhrti88Hohja8PlKnj+6YuRyeLcjfDN+bNKNDhGFJ1qaYHBf
         Ca0Q==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770016934; x=1770621734; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sKw8KbV4s+AwbK6kHtAy2X31f9H0kCEO5SprWPXDwGg=;
        b=CHlyrApd1CKNtFAFHMfqh+CzeIQtOsclpWcBmpyr8//+q1u7U6xd+x6qK67sIdunSF
         IvAyGUvcnvWpkYeeP3wESr0JA9Aw5U5NzvJSfEomdhEQ8Kija8xP1idc9GsEUsVWxjo6
         XuYUuMlGAoOtBO6xJSa2MNnwkCYhV4aqjJ7eJj3GclP3CGWKeQ3iaSN7jNgSHgwRfcti
         Tw7yurVP4xO8F2JN5ML2twkV2+kgTmcdRpgk2a0/c+L5HMBj+0e7F8AXGzfqPUMQO+hz
         m6pTvgj6eABO/CCzQZkwAxIPUjQqENGERy3osZR2H22jN8LB2tPcxWP/0u2QrlPEaiHZ
         MxhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770016934; x=1770621734;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sKw8KbV4s+AwbK6kHtAy2X31f9H0kCEO5SprWPXDwGg=;
        b=ADkMyrwds5WqHIboJIU3iDOez4najXqSoceHK58hAw0wIkgydOi9eYu9tzIPeXZ2bh
         BLwrSP9SIgWchozVeLn1J1ETZrsYwV/BFJK6hizuHF/BWFmcI0xVuXU+yvEEuIfAOHcF
         OtGhGhmoz73/mew+miGIxaQv6skGhw+Y2GCAQ0vxLYxjjRrdCtfyldC4AYq/Hm+878yN
         ay/tR+Z4aiLdtgIYplnnL2+/Im8dpcavWFaz5+2ypovTcoIqxpeqPz91a+6KiVnjRoW4
         zgV3PnmRfe4qKWqUXKT+mhxQkuaruDyLokkPs1XzjYs/8qjzJoBl8tnriOf2DvAKKLP2
         10mg==
X-Gm-Message-State: AOJu0YyGV93xT6lathmuXlScWqBKlEv9wfrknujnTzuR2sFJE3Xj/0cl
	0MbrFQ2AINEaoFlcCsG05D9cJP+oFuOg5b4udHXedwtCYrYAzIjt3Ovx/KLJIeK5KqVvsKG+dy6
	rRIppVwYiQguWJV3C2ZpoTUoWRbA0qtlb4SaL4FZ+k0HLgvFjoxdMQ1nk4ZtoDcP5awWgDKAAuA
	5ZgQTuTWNoyMST+nATjhdCUT/RYAy1rdhqEaEwu3aoCZBZ5bAeZWGS6zdaacY=
X-Gm-Gg: AZuq6aJej6hADSfWwsUVqOosCSXiWGFdZ55aoXd1uTkODwdg4GMo0B1ZIPQfA8NxpmM
	HQdS/QKmO+QxzRLLqt2g97dxvit2n7w013MwkTjQI624UnxicA5TGagBGDLZF4OK1xbNkAWpslc
	ab+HDsdMWriEUBeSdeb+uf6pao31GBrd4Mj0JKkmHRWfXMM+s3h6a9D0z4qJnpcdae
X-Received: by 2002:a05:620a:7017:b0:8c6:d628:8bac with SMTP id af79cd13be357-8c9eb32d0femr1415503385a.73.1770016934134;
        Sun, 01 Feb 2026 23:22:14 -0800 (PST)
X-Received: by 2002:a05:620a:7017:b0:8c6:d628:8bac with SMTP id
 af79cd13be357-8c9eb32d0femr1415502085a.73.1770016933643; Sun, 01 Feb 2026
 23:22:13 -0800 (PST)
MIME-Version: 1.0
References: <20260201142549.771383-1-skandigraun@gmail.com> <20260201142549.771383-2-skandigraun@gmail.com>
In-Reply-To: <20260201142549.771383-2-skandigraun@gmail.com>
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Date: Mon, 2 Feb 2026 15:22:02 +0800
X-Gm-Features: AZwV_Qh3YEaEOmDZvzWRQvsZHVeZLxdN5LlaZGqYFebrTlP-aexJrwaF9CiyQGU
Message-ID: <CA+s=J=zKVscKbwVFe_vo+y_cwBaFwk931Cu+PgwxuNPozYqaPg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][whinlatter][PATCH 2/2] unicode-ucd: adjust to
 correct checksum values.
To: skandigraun@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: LJXI9LrGt3Z0Ty8KwNUb1IRshOG-qjjp
X-Authority-Analysis: v=2.4 cv=bPMb4f+Z c=1 sm=1 tr=0 ts=698050a6 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=te1EGT4yAAAA:8 a=Q4-j1AaZAAAA:8
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=QzHr1CqUOTRLNm4Rm3kA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=RRElR4r2U1jGY2dU47NL:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-GUID: LJXI9LrGt3Z0Ty8KwNUb1IRshOG-qjjp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDA2MiBTYWx0ZWRfX44gMyP1wYlQi
 nQQBQANXmdhHSjopnbSesRsvIduWWly8dX5gpvW1vZwJKxzou2I98A7bs+YuEWceMyVJjbHbQdG
 Z/a6m2ANDFCyCpGHMvwGOb51NyTnR3HfhXTLHpvqPG6+tV/BWzDY8qdlmug4xRTi9YmRDPodD3e
 uwf/oMVilEupzGjOyEgpOaWanZT+95ft7+D3dxkorW+s1dHulawIENAeSJS6sVU/z5p0tBh0XT/
 P7KolQJZ4w3ITZGFp4rmNKFJ47Dtjd4Zp0lHLl66CuwDp4NtYoOyHAKZEz8vtokingolS8kPohM
 +ypXPK9vq4YCE6/zsLKOI9MZQgZXaN+bqJM8bj375VTdY3Vqv7jldkTXyHVPl/UirfxV1DGpyMv
 WUmjIePiMqLyq4nZak6RJOwBQRhdMLlcj9sPGZ5b9Z3JP21sUS6yeT/YoUPK/I5SNj532WClXUR
 Nbbx057l5jPXQSUUyJw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_02,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 suspectscore=0 bulkscore=0
 phishscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602020062
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 02 Feb 2026 07:22:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124050

On Sun, Feb 1, 2026 at 10:26=E2=80=AFPM Gyorgy Sarvari via
lists.openembedded.org <skandigraun=3Dgmail.com@lists.openembedded.org>
wrote:
>
> From: Tom Geelen <t.f.g.geelen@gmail.com>
>
> The checksums are wrong and thus this fails to build.
>
> Signed-off-by: Tom Geelen <t.f.g.geelen@gmail.com>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> (cherry picked from commit dc5132edf7c7464371122ea9af871406fa66635a)
> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> ---
>  meta-oe/recipes-support/unicode-ucd/unicode-ucd_14.0.0.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta-oe/recipes-support/unicode-ucd/unicode-ucd_14.0.0.bb b/=
meta-oe/recipes-support/unicode-ucd/unicode-ucd_14.0.0.bb
> index 890568d727..7a1b463c5d 100644
> --- a/meta-oe/recipes-support/unicode-ucd/unicode-ucd_14.0.0.bb
> +++ b/meta-oe/recipes-support/unicode-ucd/unicode-ucd_14.0.0.bb
> @@ -1,14 +1,14 @@
>  SUMMARY =3D "Unicode Character Database"
>  HOMEPAGE =3D "https://unicode.org/ucd/"
>  LICENSE =3D "MIT"
> -LIC_FILES_CHKSUM =3D "file://${UNPACKDIR}/ucd-license-v3.txt;md5=3Dea176=
40caddb659394df50e5db6efd69"
> +LIC_FILES_CHKSUM =3D "file://${UNPACKDIR}/ucd-license-v3.txt;md5=3D3049f=
4ad14be1ebf8c80a93d9d32b2d6"

Though the new checksum is correct, it gives a warning in case a
previously downloaded file is already present:

| WARNING: unicode-ucd-14.0.0-r0 do_fetch: Checksum mismatch for local
file /local/mnt/workspace/open/downloads/ucd-license-v3.txt
| Cleaning and trying again.
| WARNING: unicode-ucd-14.0.0-r0 do_fetch: Renaming
/local/mnt/workspace/open/downloads/ucd-license-v3.txt to
/local/mnt/workspace/open/downloads/ucd-license-v3.txt_bad-checksum_abf84f7=
4dea2812799e1dbef7f0581adf7db244881e4febb8684f441568da0ad

Should the file be renamed as well?

>
>  SRC_URI =3D " \
>      https://www.unicode.org/Public/zipped/${PV}/UCD.zip;name=3Ducd;subdi=
r=3Ducd;downloadfilename=3Dunicode-ucd-${PV}.zip \
>      https://www.unicode.org/license.txt;downloadfilename=3Ducd-license-v=
3.txt;name=3Ducd-license \
>  "
>  SRC_URI[ucd.sha256sum] =3D "033a5276b5d7af8844589f8e3482f3977a8385e71d10=
7d375055465178c23600"
> -SRC_URI[ucd-license.sha256sum] =3D "abf84f74dea2812799e1dbef7f0581adf7db=
244881e4febb8684f441568da0ad"
> +SRC_URI[ucd-license.sha256sum] =3D "e7a93b009565cfce55919a381437ac4db883=
e9da2126fa28b91d12732bc53d96"
>
>  inherit allarch
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#124039): https://lists.openembedded.org/g/openembedde=
d-devel/message/124039
> Mute This Topic: https://lists.openembedded.org/mt/117578158/3616702
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [a=
nuj.mittal@oss.qualcomm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

