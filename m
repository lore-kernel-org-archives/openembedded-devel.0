Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31C52CD4F3D
	for <webhook@archiver.kernel.org>; Thu, 21 May 2026 04:12:21 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.29300.1779336735542711361
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 May 2026 21:12:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=Vl2D/asK;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=dmB9lvXI;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64KM3YfA118977
	for <openembedded-devel@lists.openembedded.org>; Thu, 21 May 2026 04:12:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4pc6tkIy/OWfkazP/1oCrbTBv9aEb33K0s3EoTcCMHE=; b=Vl2D/asKBfCTo+2w
	iBjTYSdla6kiwmoyMHgU+dkk1TwDbPnrE5ZzeQLAfcVr5aJAMaRfbU8lFwcDToi4
	zGp1r5iccdXe9wiDbthX475NxhfC3tEc9bLhxz90coSv6tP7+bQEauaOji1Rp/3j
	nxE7pYGN/1Tppa1m3cyC9fckuFSAsHHAaPLae6BBiH+/vLSVoS1oseCqwVwmwO4t
	aQX9QjhGMQBzmtUpD2MLc99GKpayg/CP8tgw71slSNYvOv+s2BCUzecyqK0FtY/x
	RDnCX0j2belbtYixI53gXO6tPE2ynm6P3CAdlifN41L1VkbF3UqBUSSRO2uuEpwy
	5mZl+A==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9ee8b13e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 21 May 2026 04:12:14 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8ba9baef44cso79916746d6.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 20 May 2026 21:12:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779336734; cv=none;
        d=google.com; s=arc-20240605;
        b=Lnriv70nPVEISA2pgAWa8GtqHDpEmR6Mbd+vPJltbHWGZqjMej2dnnQ2T/BNqVlaCP
         eerTyeVDxMUbXbtFmdU6kvySHl8SjaKU2lPYe3gmt5IXQuI9jIQGD3h1zJPozMbEWvWF
         UWKENdVvScwivtsscOieg3fQxdhzDVp8Y47c0TzIbk1UoJ6uOWQUhcyny1HJfkqNjLeS
         R9HNXkKAkS49K8JASikYoz7w0SrnKZ79RZXZ8pCBK+EM0tSQPJ5mfesQRiy7Ph+7fH4L
         CvBu9f21a9A1JekYKPIysBoatNJjp+Z+IU+XaZJdS6Y4tukWMepGhbCPVPQSPu4GdGX1
         fs9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4pc6tkIy/OWfkazP/1oCrbTBv9aEb33K0s3EoTcCMHE=;
        fh=5u3v+Jz2hQ+/WkxPVMyCCYG7ecaE1fTJeqNpqiLMBBg=;
        b=BZAko6wcU3z1I50XpijVQWokFxGsdM6iJbVawZHMEwFacFZzBvGOqnbvfJhc+hSzLz
         p2ZgBj2cmfA97ifcUG9ar9aO1eLYP41hTaB06sFDhkPk7TVd6Lf4/1cfmn7GPux1ub/k
         56GHvdvyoYCFHJVr4Q6ADcqXV/WNMvrBgv2a9yVhCOvtRADyRQbNo21Dgr16tX8UWIy8
         PVxnbx3hl082trxOnMUcrTIs6dprUyEnvLKJkoavIUQeptQ/oWowtJlq1l1CUtOcQI8k
         tb0K6ky6LRtkNUMVU9qLLkXPVYdksVmtNwIqQVZ+8yvWj5kvQIDefaqpmhE9sDCXPSE0
         xHaQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779336734; x=1779941534; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4pc6tkIy/OWfkazP/1oCrbTBv9aEb33K0s3EoTcCMHE=;
        b=dmB9lvXIojdCiE1kbwnDB8YzS4o78+v1YrQXbsMqzmqLuY8/lkhow8g6YIpLz7+owl
         dmO0IXg2+7nq3glqQGhsBrV10vj7KCuttUo/11CgSjH7jl1+vdQIKGovd3zByDPsHOdQ
         /ufYZdGAqvQ0AtFN04UwD3VriPgkcTD47416ln0A0fJ2RF5J0eXNhzvqDLjx6l1xkdzj
         WYZyGLrgSTg2wexkm62vVaHSHjIaZugXmdHtV7HqE/2hZT0TBCNeUJFW9J0KYSGw/fgD
         baKdvvrs6mcvJGouSuA/U2pe6LUbcQg34rhC24yzNJI5g+hazi58R6+NsNy/BPM02YO2
         BI8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779336734; x=1779941534;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4pc6tkIy/OWfkazP/1oCrbTBv9aEb33K0s3EoTcCMHE=;
        b=M0c8po5g9mYYzfx34qd4wVSxMv7G5ysCI5tpf5xTRfIyI0J0onuom/isyzevJQCWCw
         0O0cBKiP0ydCke5MW9sMdohulgnH0SJDbhx2p7sLCApYNuWz1HPcVqve3gCdjNVWZPDn
         4c7rrqrd3i19Md99ykUfhkz9q4tiZk2GFeb5s21vJexTUMOCmo3NbNeKI7o7O/66nEIg
         5SQpf0S1mbI0qCq28me35x8eToX7uUec+fdmzXJK60O5g/nILIzFKrzA9tbqoQoiGSH7
         RUfWmQl7A4N8y1SV8GP6sjfKofHg/fINVuKDPn+DhoZ+odW2QxTg978E5az3FDCv4row
         ruYQ==
X-Gm-Message-State: AOJu0Ywvf09hSYUMjmU+0+J2FxF2vVK1GVPB0dYZTxrBUUbaMA3aszHK
	qRLjRhLcllzTYm0ukfmhHJeKvAdryaza5dZCu6u0Qbv7e5Mf/NpqVfqqzbffPQiqOnP0lLeOalw
	zW04XOjymscEwQtdrKmnZBcsq3DVUQOkGELm774I6Aip2Ykx4fW3vRn/DLsM3qrUxZQt3lbTrfG
	0WT7oaz3AKKd1WBt8Ya3tHffy8BZuVeKboBFEVVe+5bpXVMaek9bV0mOnuqT7auY7JpYhBJg==
X-Gm-Gg: Acq92OFQdLvNHi+hxsu7dJ00TfTQTYJHMT/SuIN8CrqSqZjBmq4HDtIge6Wq4stKf5i
	a3hoEdXa31bdOBz3SkWbpOBREBP5Gcv+TLyp2w0eO3z91klXwBRXtlgAHjQ1cxoLULoqwSSK1M6
	4k+rr5QiO0paz38pIIQBJNcr+6NnWUoknX8qA65tZXlpOHKV51tu1qBz+Zn3voTG6kX0aDjM7Qq
	4K4xToJ2IZgzdo=
X-Received: by 2002:a05:6214:2a85:b0:8b2:2474:8f3a with SMTP id 6a1803df08f44-8cc6e371db6mr20504196d6.25.1779336733738;
        Wed, 20 May 2026 21:12:13 -0700 (PDT)
X-Received: by 2002:a05:6214:2a85:b0:8b2:2474:8f3a with SMTP id
 6a1803df08f44-8cc6e371db6mr20503896d6.25.1779336733207; Wed, 20 May 2026
 21:12:13 -0700 (PDT)
MIME-Version: 1.0
References: <20260519-add-backports-zstd-v1-1-b417d7d9c0eb@bootlin.com>
In-Reply-To: <20260519-add-backports-zstd-v1-1-b417d7d9c0eb@bootlin.com>
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Date: Thu, 21 May 2026 12:12:00 +0800
X-Gm-Features: AVHnY4K_AMrNpwxb3A0Yoa6zgCQRcLza0IKY4FBYMqs10X-xtdxdp3BzAMaWCQE
Message-ID: <CA+s=J=z4Dpaak7_X7VaP8SnJVSbNG0i9FMndQoY+uxAKFn8Nbw@mail.gmail.com>
Subject: Re: [oe][meta-python][scarthgap][PATCH] python3-backports-zstd: add recipe
To: jeremie.dautheribes@bootlin.com
Cc: openembedded-devel@lists.openembedded.org, miquel.raynal@bootlin.com,
        thomas.petazzoni@bootlin.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: T7JYCJ8aChq5L8jF2oiiAbwF3WWnxYDL
X-Authority-Analysis: v=2.4 cv=e5k2j6p/ c=1 sm=1 tr=0 ts=6a0e861e cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=Q4-j1AaZAAAA:8 a=NEAV23lmAAAA:8 a=P-IC7800AAAA:8
 a=AHN3VR9gAAAA:8 a=EUspDBNiAAAA:8 a=xWcaT8NIUwj21e4Di14A:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=d3PnA9EDa4IxuAV0gXij:22
 a=KY4itkV-wrzEik3ojJMI:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDAzNyBTYWx0ZWRfX1d4zcrS+c+SC
 HZCuD6NwwWuIudnOqqLYLusac/FXQOy5E7IGB5c7Ng99FqXZi5Y+UA9k0XWR+6KSgLeTJYbocGC
 l/lRuI+oJzlU37eQzEHOj366RUtCxk94niHzujZ40QFBvhXdFSypdNE28eKTrmbIZxZIaY7a2VS
 I+py48NcUQME/KIq+Ha181Q8G6cduTUJsafGlCKxXqabk7LDy+FRulgSLK7wXztexCLOE2byb0+
 p9k0kCc5Q3IdGbZb7lpwgVmVp5UUxhV6YudJkkh8WSjhidNcYwtUI45w8tG/tqwQQMpI80xg14y
 6wFZK5DXbL7s4HaBR+ezDYoYqqnRB6wa9tx06r+Tv2+2z9fAK38+/i//bcCVn0Dp3OMVMhV3OK8
 TR1+u/9RM1bVEiV25DOGJhiPZzc2IE6P57bGD2ma6EomzB+nVyMykohtGTCtS3WQERkH4UaL+0D
 IBVrWlPURzv6UOTWDTA==
X-Proofpoint-GUID: T7JYCJ8aChq5L8jF2oiiAbwF3WWnxYDL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 adultscore=0 suspectscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210037
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 May 2026 04:12:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127128

On Tue, May 19, 2026 at 10:49=E2=80=AFPM J=C3=A9r=C3=A9mie Dautheribes via
lists.openembedded.org
<jeremie.dautheribes=3Dbootlin.com@lists.openembedded.org> wrote:
>
> Signed-off-by: J=C3=A9r=C3=A9mie Dautheribes (Schneider Electric) <jeremi=
e.dautheribes@bootlin.com>
> ---
> Hello,
>
> This patch adds support for the backports-zstd Python module in the
> Scarthgap branch. The recipe was previously part of the master branch but
> was removed [1] because the module was integrated into the Python standar=
d
> library starting from Python 3.14.
>
> However, since Scarthgap uses Python 3.12, I believe it is reasonable to
> include this backport for users on this branch.
>
> [1]: https://git.openembedded.org/meta-openembedded/commit/meta-python?id=
=3Dd2539548d0c0e0a42a54fd35bb0e039e23396725

Please include relevant parts in the commit message so we know why we
added a new recipe in scarthgap.

> ---
>  ...oml-make-license-entries-compatible-with-.patch | 38 ++++++++++++++++=
++++++
>  ...ojects.toml-lower-setuptools-requirements.patch | 31 ++++++++++++++++=
++
>  .../python/python3-backports-zstd_1.5.0.bb         | 21 ++++++++++++
>  3 files changed, 90 insertions(+)
>
> diff --git a/meta-python/recipes-devtools/python/python3-backports-zstd/0=
001-pyproject.toml-make-license-entries-compatible-with-.patch b/meta-pytho=
n/recipes-devtools/python/python3-backports-zstd/0001-pyproject.toml-make-l=
icense-entries-compatible-with-.patch
> new file mode 100644
> index 0000000000..3e20085071
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-backports-zstd/0001-pyp=
roject.toml-make-license-entries-compatible-with-.patch
> @@ -0,0 +1,38 @@
> +From 1114b0d2b60056a3690be1f7629c112cf28ce367 Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?J=3DC3=3DA9r=3DC3=3DA9mie=3D20Dautheribes=3D20=3D28Sch=
neider=3D20Electric?=3D
> + =3D?UTF-8?q?=3D29?=3D <jeremie.dautheribes@bootlin.com>
> +Date: Fri, 15 May 2026 13:39:15 +0000
> +Subject: [PATCH] pyproject.toml: make license entries compatible with
> + setputools v69
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +The pypropject.toml uses license and license-files entries that are only
> +compatible with seuptools >=3D v77, while Yocto Scarthgap only provides
> +setuptools v69.
> +
> +This is the only detected impact, otherwise the do_compile/do_package wo=
rk
> +fine.
> +
> +Upstream-Status: Inappropriate [specific to OE LTS version]
> +Signed-off-by: J=C3=A9r=C3=A9mie Dautheribes (Schneider Electric) <jerem=
ie.dautheribes@bootlin.com>
> +---
> + pyproject.toml | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/pyproject.toml b/pyproject.toml
> +index ec9a1ea..18e6816 100644
> +--- a/pyproject.toml
> ++++ b/pyproject.toml
> +@@ -5,8 +5,8 @@ authors =3D [{ name =3D "Rogdham", email =3D "contact@ro=
gdham.net" }]
> + description =3D "Backport of compression.zstd"
> + readme =3D { file =3D "README.md", content-type =3D "text/markdown" }
> + keywords =3D ["backport", "backports", "pep-784", "zstd"]
> +-license =3D "PSF-2.0"
> +-license-files =3D ["LICENSE.txt", "LICENSE_zstd.txt"]
> ++license =3D { text =3D "PSF-2.0" }
> ++#license-files =3D ["LICENSE.txt"]
> + classifiers =3D [
> +     "Development Status :: 5 - Production/Stable",
> +     "Intended Audience :: Developers",
> diff --git a/meta-python/recipes-devtools/python/python3-backports-zstd/0=
002-pyprojects.toml-lower-setuptools-requirements.patch b/meta-python/recip=
es-devtools/python/python3-backports-zstd/0002-pyprojects.toml-lower-setupt=
ools-requirements.patch
> new file mode 100644
> index 0000000000..7cbeeff61d
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-backports-zstd/0002-pyp=
rojects.toml-lower-setuptools-requirements.patch
> @@ -0,0 +1,31 @@
> +From 2ab6ba1d48a3d0e13382e346ba0a638548a5513e Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?J=3DC3=3DA9r=3DC3=3DA9mie=3D20Dautheribes=3D20=3D28Sch=
neider=3D20Electric?=3D
> + =3D?UTF-8?q?=3D29?=3D <jeremie.dautheribes@bootlin.com>
> +Date: Tue, 19 May 2026 14:06:43 +0000
> +Subject: [PATCH] pyprojects.toml: lower setuptools requirements
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +Scarthgap provides setuptools v69, so adjust the requirement
> +accordingly.
> +
> +Upstream-Status: Inappropriate [specific to OE LTS version]
> +Signed-off-by: J=C3=A9r=C3=A9mie Dautheribes (Schneider Electric) <jerem=
ie.dautheribes@bootlin.com>
> +---
> + pyproject.toml | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/pyproject.toml b/pyproject.toml
> +index 18e6816..b5953e2 100644
> +--- a/pyproject.toml
> ++++ b/pyproject.toml
> +@@ -30,7 +30,7 @@ Source =3D "https://github.com/rogdham/backports.zstd"
> + #
> +
> + [build-system]
> +-requires =3D ["setuptools>=3D80"]
> ++requires =3D ["setuptools>=3D69"]
> + build-backend =3D "setuptools.build_meta"
> +
> + [tool.setuptools.packages.find]
> diff --git a/meta-python/recipes-devtools/python/python3-backports-zstd_1=
.5.0.bb b/meta-python/recipes-devtools/python/python3-backports-zstd_1.5.0.=
bb
> new file mode 100644
> index 0000000000..0c83202b4a
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-backports-zstd_1.5.0.bb
> @@ -0,0 +1,21 @@
> +SUMMARY =3D "Backport of compression.zstd"
> +DESCRIPTION =3D "Backport of PEP-784 'adding Zstandard to the standard l=
ibrary'"
> +HOMEPAGE =3D "https://github.com/Rogdham/backports.zstd/"
> +LICENSE =3D "0BSD & PSF-2.0"
> +LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D224f30639105a6ab845e068c2=
d0903ff \
> +                    file://LICENSE_zstd.txt;md5=3D85fffd6822a26cd7d2a6ee=
b939ada0da \
> +                    file://src/c/pythoncapi-compat/COPYING;md5=3Df74f548=
22fab8814a50330e4e4578b88 \
> +                    file://src/c/zstd/LICENSE;md5=3D0822a32f7acdbe013606=
746641746ee8"
> +
> +inherit pypi python_setuptools_build_meta
> +
> +SRC_URI +=3D " \
> +        file://0001-pyproject.toml-make-license-entries-compatible-with-=
.patch \
> +        file://0002-pyprojects.toml-lower-setuptools-requirements.patch =
\
> +"
> +
> +SRC_URI[sha256sum] =3D "a5e622a82eb183b4fbe18032755ce0a15fa9a82f2adb9b62=
1620b91247aaedb7"
> +
> +PYPI_PACKAGE =3D "backports_zstd"
> +
> +BBCLASSEXTEND =3D "native nativesdk"
>
> ---
> base-commit: ae7dfb12245c7f9b9a353499e2688015bd4e6413
> change-id: 20260519-add-backports-zstd-0ccdda4bc156
>
> Best regards,
> --
> J=C3=A9r=C3=A9mie Dautheribes (Schneider Electric) <jeremie.dautheribes@b=
ootlin.com>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#127103): https://lists.openembedded.org/g/openembedde=
d-devel/message/127103
> Mute This Topic: https://lists.openembedded.org/mt/119391866/3616702
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [a=
nuj.mittal@oss.qualcomm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

