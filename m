Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 049CEFF885A
	for <webhook@archiver.kernel.org>; Wed, 29 Apr 2026 01:27:32 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2535.1777426042216990952
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Apr 2026 18:27:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=CZY3bbjY;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=WHUl1xNN;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63SGtJqw2984834
	for <openembedded-devel@lists.openembedded.org>; Wed, 29 Apr 2026 01:27:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BC38a7b2OSYTf5memE6S9uyeNSVQFmjn7ec/9eo6gc0=; b=CZY3bbjY8zLskeoL
	RvMRYoXvEJJ48rxEL9DWeuIQTiBln4eErU9mZsvdxuoPz77PAVsUnA0H5lGV9xzy
	wlUKu1WstT/bvBs5Co0UNPAMjyDO9NNbs+SgANcb6uY4l09BxNR7C/DL+j3wa57N
	Pw4531l9hhEDwGWT9lf8giS9wpnUD6P4WYAu1cQHizToqhAJ2QYIYzOI5NB+BnpM
	MdWMU3xFLbgeity28mPeqdKzUCOsFRW7gj591EjlXXQ1hCWAoBSz4x5MCa4tIhV0
	wIkU5phvAMCfkZj89XxPhmJI0riFRK0nEJgq+yZDwMVLt8X/U3EGNS+Tfi0+lNTD
	AYxtvg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4du0u1sh97-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 29 Apr 2026 01:27:21 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cd722c1a69so2208921085a.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 28 Apr 2026 18:27:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777426040; cv=none;
        d=google.com; s=arc-20240605;
        b=AOTVFlIZTOYGXPKEQpp4XP+qj9YztXf4+CZxOYpQn5mHJ8EJSmyGz7wRh+NluhBom/
         /GC6Bz98V+b+J/Dk4wS6+4M6rX/Xg7BtdQ4uDuDnP5BIe5fZPamsPhEE+78/pxYvvlie
         6FPr7aHUZlftNmwF3GeTjdC9W4jaDgX/0iQIj/sweuEYIynF04oRNCET4/c3NYsbbHIa
         BV+/tShStNh7DAuJs6KKcdysvfwgygnbwFK+/IMrxFK0gSoqDWT5yhqqD4RnVAOd3GHm
         84hm+bTi485UfgxzbmAlP33okI6KTfhLt5v4SPFBY/vqofJSLZHQI9ZPD9rtLJic70u2
         4LpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BC38a7b2OSYTf5memE6S9uyeNSVQFmjn7ec/9eo6gc0=;
        fh=019Q3h12IzQCx/7qEaDOnNIUWzuv8WL6e4aYLdQbQh8=;
        b=W62uAH8wK0kV66duIP2oBtg1W+B0EJYTnWHwpWS5W3m9nng44x7smyIG1DbTqBRzL/
         gzQPHMUeioTOWTXPBqT4KTV/z5It213Hi5NucxtWYpxzrzail9PQ9pDG5BhI+B1oxsXK
         xZ5Y5l9S5XVpbuugzIwCbrfkZtojLFXyWtgHC+BIQB9Vx/0oK1QdFF26/egQFIV8/ggj
         gOerliHkdCUVd3SX8rO/vk3O0T9b7/x5q/qXBt9t8F1ka23FRTDdgOOUE7YvKPEbGo1j
         pqZv78+X9u0bzsHJ9vGVplJY900EqIZO2CXxsPf6de9OTiXpEszhsSRMEZeDnWk++2Mo
         xdCA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777426040; x=1778030840; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BC38a7b2OSYTf5memE6S9uyeNSVQFmjn7ec/9eo6gc0=;
        b=WHUl1xNNkZYltXmO+qwHGACx/inF0AG6HEVnEaMot0Dz2hg4EQJnBBOSjLAjJS2RMS
         iawTv2X7yb4vcZ0KjqEq76xUkFIkrK46R40zhbMgmBxzwPf3dF8lYUY+/pfu4bWP1kk/
         iu54v7hUNYTsaYA9lim4Bhtd4aMpmAFTQ+aghZrMfv8WfoT2UPz4BJEJyhxWa7BG3ew6
         mJ7bsY7uMU1ilVypA30EgY8t9NmPTrBAEfbseFN4Iw7OSS361jYQmknUTeoIGaI559wJ
         76fEyRGyM2zOzp3CUXGJF+TBuQbSMruuuTmc6BhAqTdigfZbIbCSJGzg6awHmSlQQL0X
         HNLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777426040; x=1778030840;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BC38a7b2OSYTf5memE6S9uyeNSVQFmjn7ec/9eo6gc0=;
        b=tDJ3e035UkX7M/yZ+VhN3ReTugC5N8/yIJ2sk/h/DJD4DDScgX2Ex+GcH014yLJ1WP
         IdFKrfbn3Ko1vZdAy5o8wECHLFzYVKgJFio2G0NCnbBuG6OrvXSlvVJp0hSdTKLK4q2N
         b+gzu3X9ZcZy2n186n6qSLDhCcAcHgpPC8SWSKmijBA3yIAS7Z7HLBkL6ACJUhhOuthu
         b1qjD3NMSFNMLwNBQCi0lJH5USEpvddK1gvgCfe6iL/Hyk+bxre32LLd4iHwCH88dqhb
         HJFfnWcBznK3PkPhMCE4VHf6dGAuQpI9plqOjyAIuu3XZW+Iv1AdIDFLtgM8K5QTihCb
         6GoA==
X-Gm-Message-State: AOJu0YwerB7GOUVLajE7wLeYDEoThfoc8fgFs2Ogl5ODsZjjRjQX8PPM
	3kxXIN0TuysdBM2YhGkjGWwgafq3punyghZeVQSw3alDdIYG+OggKTYEioW/Goy+cR0wlib+yLq
	Wki1uHiqHbPIVwhAId7CaWj6HFCYW+u+81ARBTGRJmlf8HkS4CXFefzQivstOADPaJBNkmQNZU6
	80ZNEIK4UGQ5v75zlIC0zMMbYn98aW8MX8vn3GV05vIpy1VbeIACo1sih01dA=
X-Gm-Gg: AeBDievYmCfNtUvQWB42COMMh1A2OoUKv3pbcg+BAIElumY1MNEEiumNGGHkp8IUsLn
	0FRGrgGZqc1iYvq+SJbatG5+h4ZG9Qhf5AlgNhARP5si4wVG8oJVM2HjFp6cQ4fPb/FBiHbfPag
	PEx1oLwgmhaUxf2pwELlKRI6ZLnYMjf+XGPEFHA4bLNnuR46SPE7Ksr6GhK2paL1RfKYns2GR+f
	hclHCdGL40+dVY=
X-Received: by 2002:a05:620a:3725:b0:8cf:dd93:acb3 with SMTP id af79cd13be357-8f8f6d5355emr335053785a.56.1777426040239;
        Tue, 28 Apr 2026 18:27:20 -0700 (PDT)
X-Received: by 2002:a05:620a:3725:b0:8cf:dd93:acb3 with SMTP id
 af79cd13be357-8f8f6d5355emr335048285a.56.1777426039547; Tue, 28 Apr 2026
 18:27:19 -0700 (PDT)
MIME-Version: 1.0
References: <18A9813C1291FB70.1732988@lists.openembedded.org>
In-Reply-To: <18A9813C1291FB70.1732988@lists.openembedded.org>
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 09:27:29 +0800
X-Gm-Features: AVHnY4IH1He8WuNpqipyTa_PlZNLe3iBEtabq-WENgOc9fTQBXCK3eleDbVTcro
Message-ID: <CA+s=J=wAwzXcQQvDfKeK8yY9DePq4cRF1aALjQFtcyUyW0eOgg@mail.gmail.com>
Subject: Re: [oe] [PATCH 00/75] Whinlatter pull request
To: anuj.mittal@oss.qualcomm.com, Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: kiTEtxYqbjra_EY1XhAYa_RJtCwJu711
X-Proofpoint-ORIG-GUID: kiTEtxYqbjra_EY1XhAYa_RJtCwJu711
X-Authority-Analysis: v=2.4 cv=aPPAb79m c=1 sm=1 tr=0 ts=69f15e79 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=iGHA9ds3AAAA:8 a=Q4-j1AaZAAAA:8 a=EUspDBNiAAAA:8
 a=Uj5NBSYtuwEskyXJb0cA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=nM-MV4yxpKKO9kiQg6Ot:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDAxMSBTYWx0ZWRfX7o+DStTOsacG
 DZYqF2tmEH078xrHQ1knxqIQzD2MVtv77gQGdk3EggAktdLLEq1MIXB0uRjIoyW+SBKDMGmFnA0
 11DoZhHKpqZBD7a3VrWMRnXtUn1UPsJ0d4c2arHwdLNDJPtSD8AvgzCFSrYhfOjwiQbQz0z15wk
 2vVbsrEH70HcwkVhbeDKKMyJXfynKYKf1r/gVp0ABRFKhI3q6Tp67jkrN1xA5cWqowGifr4hqA0
 xnvDd8q85CR9uQmOzL5gHEDlwGyBRrFf3N1Nmh2mdprqYlQhRVfNyzNRJfP1vxVghQKFg4KXV6E
 74P3sGoYgGrMundEaAenD72BIXKkR68w7HPyYIixiGKCyg/aikNsS+km5pusi0ARNl5efdq+man
 2TA4Bd6i3Kcd35Ub1nNE/Tv8QNIjT0j/w6Fnpdod2u1gHQkNpgvRGzMX985nK6GLzKMg7Evt+1l
 n+Uikcf6QCWp7YEBo8g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 priorityscore=1501 adultscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290011
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Apr 2026 01:27:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126658

Gentle ping


On Sat, Apr 25, 2026 at 1:07=E2=80=AFPM Anuj Mittal via lists.openembedded.=
org
<anuj.mittal=3Doss.qualcomm.com@lists.openembedded.org> wrote:
>
> Please merge these changes in whinlatter. Tested on autobuilder and local=
ly.
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/builds/1503
>
> The following changes since commit 8bcdb0cc1dab116253b409e78fb868ced7d839=
7c:
>
>   bluealsa: fix QA issue staticdev (2026-03-26 10:31:48 +0530)
>
> are available in the Git repository at:
>
>   https://git.openembedded.org/meta-openembedded-contrib stable/whinlatte=
r-next
>   https://git.openembedded.org/meta-openembedded-contrib/log/?h=3Dstable/=
whinlatter-next
>
> for you to fetch changes up to bf300f9b6c90c130b2d0e84303153df7c0d68852:
>
>   lshw: Fix binmerge (2026-04-23 10:53:58 +0530)
>
> ----------------------------------------------------------------
>
> Ankur Tyagi (17):
>   nginx: upgrade 1.29.1 -> 1.29.2
>   python3-astroid: upgrade 4.0.2 -> 4.0.4
>   python3-aiofiles: fix HOMEPAGE
>   python3-alembic: add HOMEPAGE
>   python3-apiflash: upgrade 3.0.0 -> 3.0.2
>   gvfs: upgrade 1.58.2 -> 1.58.4
>   libde265: patch CVE-2026-33165
>   wolfssl: patch CVE-2026-0819
>   wolfssl: patch CVE-2026-2646
>   wolfssl: ptach CVE-2026-3229
>   wolfssl: patch CVE-2026-3230
>   wolfssl: patch CVE-2026-3547
>   wolfssl: patch CVE-2026-4159
>   wolfssl: patch CVE-2026-4395
>   zabbix: ignore CVE-2026-23919
>   tigervnc: patch CVE-2026-34352
>   strongswan: patch CVE-2026-25075
>
> Deepak Rathore (3):
>   libssh: Fix CVE-2026-0968
>   libssh: Fix CVE-2026-0967
>   libssh: Fix CVE-2026-0965
>
> Gyorgy Sarvari (32):
>   nginx: upgrade 1.28.2 -> 1.28.3
>   freeipmi: upgrade 1.6.16 -> 1.6.17
>   botan: patch CVE-2026-32877
>   botan: patch CVE-2026-32883
>   botan: patch CVE-2026-32884
>   dovecot: patch CVE-2025-59031
>   dovecot: mark CVE-2026-0394 patched
>   nodejs: ignore fixed CVEs
>   opensc: patch CVE-2025-49010
>   opensc: patch CVE-2025-66037
>   opensc: patch CVE-2025-66038
>   imagemagick: upgrade 7.1.2-17 -> 7.1.2-18
>   giflib: patch CVE-2025-31344
>   botan: patch CVE-2026-34582
>   corosync: patch CVE-2026-35091
>   corosync: patch CVE-2026-35092
>   hiawatha: upgrade 11.7 -> 11.8
>   monkey: upgrade 1.8.4 -> 1.8.7
>   monkey: patch CVEs
>   openjpeg: patch CVE-2026-6192
>   libgphoto2: patch CVE-2026-40333
>   libgphoto2: patch CVE-2026-40334
>   libgphoto2: patch CVE-2026-40335
>   libgphoto2: patch CVE-2026-40336
>   libgphoto2: patch CVE-2026-40338
>   libgphoto2: patch CVE-2026-40339
>   libgphoto2: patch CVE-2026-40340
>   libgphoto2: patch CVE-2026-40341
>   jq: patch CVE-2026-32316
>   jq: patch CVE-2026-33947
>   jq: patch CVE-2026-33948
>   jq: patch CVE-2026-39979
>
> Jason Schonberg (4):
>   Update README.md with branch name.
>   nodejs: upgrade 22.22.0 -> 22.22.1
>   nodejs: upgrade 22.22.1 -> 22.22.2
>   php: upgrade 8.4.19 -> 8.4.20
>
> J=C3=B6rg Sommer (1):
>   lshw: Fix binmerge
>
> Liu Yiding (1):
>   gjs: upgrade 1.84.1 -> 1.84.2
>
> Markus Volk (5):
>   iwd: update 3.10 -> 3.11
>   nautilus: update 49.4 -> 49.5
>   libdvdread: use https for fetching code
>   libdvdcss: use https for fetching code
>   libdvdnav: use https for fetching code
>
> Michal Sieron (1):
>   gnome-bluetooth3: Fix RRECOMMENS typo
>
> Peter Kjellerstedt (1):
>   jq: Use Git to fetch the code
>
> Vijay Anusuri (1):
>   giflib: Fix CVE-2026-23868
>
> Wang Mingyu (7):
>   iwd: upgrade 3.11 -> 3.12
>   openldap: upgrade 2.6.10 -> 2.6.12
>   openldap: upgrade 2.6.12 -> 2.6.13
>   nautilus: upgrade 49.2 -> 49.3
>   nautilus: upgrade 49.3 -> 49.4
>   gvfs: upgrade 1.58.0 -> 1.58.1
>   imagemagick: upgrade 7.1.2-18 -> 7.1.2-19
>
> Zhang Peng (2):
>   gvfs: upgrade 1.58.1 -> 1.58.2
>   libwnck3: upgrade 43.2 -> 43.3
>
>  .../gjs/{gjs_1.84.1.bb =3D> gjs_1.84.2.bb}      |   2 +-
>  .../gnome-bluetooth3_3.34.5.bb                |   2 +-
>  .../gvfs/{gvfs_1.58.0.bb =3D> gvfs_1.58.4.bb}   |   2 +-
>  ...40d59c32d7ebeb94d242436e3144cefc174a.patch |  40 --
>  .../{libwnck3_43.2.bb =3D> libwnck3_43.3.bb}    |   5 +-
>  .../{nautilus_49.2.bb =3D> nautilus_49.5.bb}    |   2 +-
>  .../libde265/libde265/CVE-2026-33165.patch    |  45 +++
>  .../libde265/libde265_1.0.16.bb               |   1 +
>  .../libdvdnav/libdvdnav_6.1.1.bb              |   2 +-
>  .../recipes-multimedia/vlc/libdvdcss_1.4.3.bb |   2 +-
>  .../wolfssl/files/CVE-2026-0819.patch         |  31 ++
>  .../wolfssl/files/CVE-2026-2646-1.patch       |  39 ++
>  .../wolfssl/files/CVE-2026-2646-2.patch       |  51 +++
>  .../wolfssl/files/CVE-2026-3229-1.patch       | 104 +++++
>  .../wolfssl/files/CVE-2026-3229-2.patch       |  42 ++
>  .../wolfssl/files/CVE-2026-3229-3.patch       |  28 ++
>  .../wolfssl/files/CVE-2026-3230.patch         |  69 ++++
>  .../wolfssl/files/CVE-2026-3547.patch         |  30 ++
>  .../wolfssl/files/CVE-2026-4159.patch         |  32 ++
>  .../wolfssl/files/CVE-2026-4395.patch         |  31 ++
>  .../wolfssl/wolfssl_5.8.0.bb                  |  10 +
>  .../corosync/corosync/CVE-2026-35091.patch    |  47 +++
>  .../corosync/corosync/CVE-2026-35092.patch    |  57 +++
>  .../corosync/corosync_3.1.10.bb               |   2 +
>  .../dovecot/dovecot/CVE-2025-59031.patch      | 142 +++++++
>  .../dovecot/dovecot_2.4.1-4.bb                |   2 +
>  .../strongswan/CVE-2026-25075.patch           |  48 +++
>  .../strongswan/strongswan_6.0.3.bb            |   4 +-
>  .../iwd/{iwd_3.10.bb =3D> iwd_3.12.bb}          |   2 +-
>  .../zabbix/zabbix_7.0.19.bb                   |   1 +
>  .../botan/botan/CVE-2026-32877.patch          | 158 ++++++++
>  .../botan/botan/CVE-2026-32883.patch          | 171 +++++++++
>  .../botan/botan/CVE-2026-32884.patch          | 171 +++++++++
>  .../botan/botan/CVE-2026-34582.patch          |  28 ++
>  meta-oe/recipes-crypto/botan/botan_3.10.0.bb  |   7 +-
>  .../giflib/giflib/CVE-2025-31344.patch        |  28 ++
>  .../giflib/giflib/CVE-2026-23868.patch        |  34 ++
>  .../recipes-devtools/giflib/giflib_5.2.2.bb   |   4 +-
>  ...-with-disable-maintainer-mode-and-so.patch |  44 +++
>  .../jq/jq/CVE-2026-32316.patch                |  53 +++
>  .../jq/jq/CVE-2026-33947.patch                | 104 +++++
>  .../jq/jq/CVE-2026-33948.patch                |  49 +++
>  .../jq/jq/CVE-2026-39979.patch                |  31 ++
>  meta-oe/recipes-devtools/jq/jq_1.8.1.bb       |  19 +-
>  meta-oe/recipes-devtools/lshw/lshw_02.20.bb   |   4 +-
>  .../{nodejs_22.22.0.bb =3D> nodejs_22.22.2.bb}  |  13 +-
>  .../php/{php_8.4.19.bb =3D> php_8.4.20.bb}      |   2 +-
>  .../gphoto2/libgphoto2/CVE-2026-40333.patch   | 150 ++++++++
>  .../gphoto2/libgphoto2/CVE-2026-40334.patch   |  37 ++
>  .../gphoto2/libgphoto2/CVE-2026-40335.patch   |  43 +++
>  .../gphoto2/libgphoto2/CVE-2026-40336.patch   |  44 +++
>  .../gphoto2/libgphoto2/CVE-2026-40338.patch   |  34 ++
>  .../gphoto2/libgphoto2/CVE-2026-40339.patch   |  41 ++
>  .../gphoto2/libgphoto2/CVE-2026-40340.patch   |  40 ++
>  .../gphoto2/libgphoto2/CVE-2026-40341.patch   |  69 ++++
>  .../gphoto2/libgphoto2_2.5.33.bb              |  10 +-
>  .../openjpeg/openjpeg/CVE-2026-6192.patch     |  35 ++
>  .../openjpeg/openjpeg_2.5.4.bb                |   1 +
>  .../tigervnc/files/CVE-2026-34352.patch       |  31 ++
>  .../tigervnc/tigervnc_1.15.0.bb               |   1 +
>  .../libdvdread/libdvdread_6.1.3.bb            |   2 +-
>  ...{freeipmi_1.6.16.bb =3D> freeipmi_1.6.17.bb} |   2 +-
>  ...ck_7.1.2-17.bb =3D> imagemagick_7.1.2-19.bb} |   2 +-
>  .../libssh/libssh/CVE-2026-0965.patch         | 286 ++++++++++++++
>  .../libssh/libssh/CVE-2026-0967.patch         | 362 ++++++++++++++++++
>  .../libssh/libssh/CVE-2026-0968_p1.patch      |  64 ++++
>  .../libssh/libssh/CVE-2026-0968_p2.patch      | 132 +++++++
>  .../recipes-support/libssh/libssh_0.11.3.bb   |   4 +
>  ...{openldap_2.6.10.bb =3D> openldap_2.6.13.bb} |   4 +-
>  .../opensc/opensc/CVE-2025-49010.patch        |  71 ++++
>  .../opensc/opensc/CVE-2025-66037.patch        |  34 ++
>  .../opensc/opensc/CVE-2025-66038.patch        |  40 ++
>  .../recipes-support/opensc/opensc_0.26.1.bb   |   6 +-
>  .../python/python3-aiofiles_24.1.0.bb         |   2 +-
>  .../python/python3-alembic_1.17.2.bb          |   1 +
>  ...ask_3.0.0.bb =3D> python3-apiflask_3.0.2.bb} |   2 +-
>  ...roid_4.0.2.bb =3D> python3-astroid_4.0.4.bb} |   2 +-
>  ..._-nonstring-to-remove-unterminated-s.patch |  43 ---
>  ...ute__-nonstring-with-macro-MBEDTLS_A.patch |  42 --
>  ...BEDTLS_ATTRIBUTE_UNTERMINATED_STRING.patch |  33 --
>  .../{hiawatha_11.7.bb =3D> hiawatha_11.8.bb}    |   5 +-
>  ...tp-fix-malformed-request-crash-paths.patch | 160 ++++++++
>  ...eduler-guard-protocol-close-callback.patch |  51 +++
>  ...server-parser-harden-boundary-checks.patch | 108 ++++++
>  .../{monkey_1.8.4.bb =3D> monkey_1.8.7.bb}      |  14 +-
>  .../{nginx_1.28.2.bb =3D> nginx_1.28.3.bb}      |   2 +-
>  .../{nginx_1.29.1.bb =3D> nginx_1.29.2.bb}      |   2 +-
>  meta-xfce/README.md                           |   2 +-
>  88 files changed, 3605 insertions(+), 204 deletions(-)
>  rename meta-gnome/recipes-gnome/gjs/{gjs_1.84.1.bb =3D> gjs_1.84.2.bb} (=
94%)
>  rename meta-gnome/recipes-gnome/gvfs/{gvfs_1.58.0.bb =3D> gvfs_1.58.4.bb=
} (97%)
>  delete mode 100644 meta-gnome/recipes-gnome/libwnck/files/ef0e40d59c32d7=
ebeb94d242436e3144cefc174a.patch
>  rename meta-gnome/recipes-gnome/libwnck/{libwnck3_43.2.bb =3D> libwnck3_=
43.3.bb} (78%)
>  rename meta-gnome/recipes-gnome/nautilus/{nautilus_49.2.bb =3D> nautilus=
_49.5.bb} (93%)
>  create mode 100644 meta-multimedia/recipes-multimedia/libde265/libde265/=
CVE-2026-33165.patch
>  create mode 100644 meta-networking/recipes-connectivity/wolfssl/files/CV=
E-2026-0819.patch
>  create mode 100644 meta-networking/recipes-connectivity/wolfssl/files/CV=
E-2026-2646-1.patch
>  create mode 100644 meta-networking/recipes-connectivity/wolfssl/files/CV=
E-2026-2646-2.patch
>  create mode 100644 meta-networking/recipes-connectivity/wolfssl/files/CV=
E-2026-3229-1.patch
>  create mode 100644 meta-networking/recipes-connectivity/wolfssl/files/CV=
E-2026-3229-2.patch
>  create mode 100644 meta-networking/recipes-connectivity/wolfssl/files/CV=
E-2026-3229-3.patch
>  create mode 100644 meta-networking/recipes-connectivity/wolfssl/files/CV=
E-2026-3230.patch
>  create mode 100644 meta-networking/recipes-connectivity/wolfssl/files/CV=
E-2026-3547.patch
>  create mode 100644 meta-networking/recipes-connectivity/wolfssl/files/CV=
E-2026-4159.patch
>  create mode 100644 meta-networking/recipes-connectivity/wolfssl/files/CV=
E-2026-4395.patch
>  create mode 100644 meta-networking/recipes-extended/corosync/corosync/CV=
E-2026-35091.patch
>  create mode 100644 meta-networking/recipes-extended/corosync/corosync/CV=
E-2026-35092.patch
>  create mode 100644 meta-networking/recipes-support/dovecot/dovecot/CVE-2=
025-59031.patch
>  create mode 100644 meta-networking/recipes-support/strongswan/strongswan=
/CVE-2026-25075.patch
>  rename meta-oe/recipes-connectivity/iwd/{iwd_3.10.bb =3D> iwd_3.12.bb} (=
95%)
>  create mode 100644 meta-oe/recipes-crypto/botan/botan/CVE-2026-32877.pat=
ch
>  create mode 100644 meta-oe/recipes-crypto/botan/botan/CVE-2026-32883.pat=
ch
>  create mode 100644 meta-oe/recipes-crypto/botan/botan/CVE-2026-32884.pat=
ch
>  create mode 100644 meta-oe/recipes-crypto/botan/botan/CVE-2026-34582.pat=
ch
>  create mode 100644 meta-oe/recipes-devtools/giflib/giflib/CVE-2025-31344=
.patch
>  create mode 100644 meta-oe/recipes-devtools/giflib/giflib/CVE-2026-23868=
.patch
>  create mode 100644 meta-oe/recipes-devtools/jq/jq/0001-Support-building-=
with-disable-maintainer-mode-and-so.patch
>  create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2026-32316.patch
>  create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2026-33947.patch
>  create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2026-33948.patch
>  create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2026-39979.patch
>  rename meta-oe/recipes-devtools/nodejs/{nodejs_22.22.0.bb =3D> nodejs_22=
.22.2.bb} (93%)
>  rename meta-oe/recipes-devtools/php/{php_8.4.19.bb =3D> php_8.4.20.bb} (=
99%)
>  create mode 100644 meta-oe/recipes-graphics/gphoto2/libgphoto2/CVE-2026-=
40333.patch
>  create mode 100644 meta-oe/recipes-graphics/gphoto2/libgphoto2/CVE-2026-=
40334.patch
>  create mode 100644 meta-oe/recipes-graphics/gphoto2/libgphoto2/CVE-2026-=
40335.patch
>  create mode 100644 meta-oe/recipes-graphics/gphoto2/libgphoto2/CVE-2026-=
40336.patch
>  create mode 100644 meta-oe/recipes-graphics/gphoto2/libgphoto2/CVE-2026-=
40338.patch
>  create mode 100644 meta-oe/recipes-graphics/gphoto2/libgphoto2/CVE-2026-=
40339.patch
>  create mode 100644 meta-oe/recipes-graphics/gphoto2/libgphoto2/CVE-2026-=
40340.patch
>  create mode 100644 meta-oe/recipes-graphics/gphoto2/libgphoto2/CVE-2026-=
40341.patch
>  create mode 100644 meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2026-6=
192.patch
>  create mode 100644 meta-oe/recipes-graphics/tigervnc/files/CVE-2026-3435=
2.patch
>  rename meta-oe/recipes-support/freeipmi/{freeipmi_1.6.16.bb =3D> freeipm=
i_1.6.17.bb} (93%)
>  rename meta-oe/recipes-support/imagemagick/{imagemagick_7.1.2-17.bb =3D>=
 imagemagick_7.1.2-19.bb} (99%)
>  create mode 100644 meta-oe/recipes-support/libssh/libssh/CVE-2026-0965.p=
atch
>  create mode 100644 meta-oe/recipes-support/libssh/libssh/CVE-2026-0967.p=
atch
>  create mode 100644 meta-oe/recipes-support/libssh/libssh/CVE-2026-0968_p=
1.patch
>  create mode 100644 meta-oe/recipes-support/libssh/libssh/CVE-2026-0968_p=
2.patch
>  rename meta-oe/recipes-support/openldap/{openldap_2.6.10.bb =3D> openlda=
p_2.6.13.bb} (98%)
>  create mode 100644 meta-oe/recipes-support/opensc/opensc/CVE-2025-49010.=
patch
>  create mode 100644 meta-oe/recipes-support/opensc/opensc/CVE-2025-66037.=
patch
>  create mode 100644 meta-oe/recipes-support/opensc/opensc/CVE-2025-66038.=
patch
>  rename meta-python/recipes-devtools/python/{python3-apiflask_3.0.0.bb =
=3D> python3-apiflask_3.0.2.bb} (83%)
>  rename meta-python/recipes-devtools/python/{python3-astroid_4.0.2.bb =3D=
> python3-astroid_4.0.4.bb} (90%)
>  delete mode 100644 meta-webserver/recipes-httpd/hiawatha/files/0001-Add-=
__attribute__-nonstring-to-remove-unterminated-s.patch
>  delete mode 100644 meta-webserver/recipes-httpd/hiawatha/files/0002-Repl=
ace-__attribute__-nonstring-with-macro-MBEDTLS_A.patch
>  delete mode 100644 meta-webserver/recipes-httpd/hiawatha/files/define-MB=
EDTLS_ATTRIBUTE_UNTERMINATED_STRING.patch
>  rename meta-webserver/recipes-httpd/hiawatha/{hiawatha_11.7.bb =3D> hiaw=
atha_11.8.bb} (90%)
>  create mode 100644 meta-webserver/recipes-httpd/monkey/files/0001-server=
-http-fix-malformed-request-crash-paths.patch
>  create mode 100644 meta-webserver/recipes-httpd/monkey/files/0002-server=
-scheduler-guard-protocol-close-callback.patch
>  create mode 100644 meta-webserver/recipes-httpd/monkey/files/0003-server=
-parser-harden-boundary-checks.patch
>  rename meta-webserver/recipes-httpd/monkey/{monkey_1.8.4.bb =3D> monkey_=
1.8.7.bb} (86%)
>  rename meta-webserver/recipes-httpd/nginx/{nginx_1.28.2.bb =3D> nginx_1.=
28.3.bb} (66%)
>  rename meta-webserver/recipes-httpd/nginx/{nginx_1.29.1.bb =3D> nginx_1.=
29.2.bb} (77%)
>
> --
> 2.53.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#126611): https://lists.openembedded.org/g/openembedde=
d-devel/message/126611
> Mute This Topic: https://lists.openembedded.org/mt/118999495/3616702
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [a=
nuj.mittal@oss.qualcomm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

