Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50667FDEE5A
	for <webhook@archiver.kernel.org>; Fri, 24 Apr 2026 01:45:44 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12391.1776995134659948526
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Apr 2026 18:45:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=Ggj4U7R8;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=K1n3kQBS;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63NJVQU33803986
	for <openembedded-devel@lists.openembedded.org>; Fri, 24 Apr 2026 01:45:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8VXoqdGMeRjXfI2Hnb66nRRx7N1KrVKjfM+I30tzlC4=; b=Ggj4U7R8oOZokmye
	oWfhXNsX3l+gOiiNrEJh+TSDT7k6TKzzoNXYcLpRtLDm9z6AyXVYD9psYB4dXCK/
	usrehZ2IBpU9It0mGG39qlU6v2uVM0eGV55VxD5eXWYdfNbhAHSgBwKOTU6RmFw5
	R8XUprmBaDhvOOdvnvBdKBVbuOKbqUlAvFXkmm/47ZrY9ouNRqpmZq5B0qYZD3Zj
	0DcwtUZ8y89xenwq48N+awEvpQo5jxob4wBcrTgywbOPmGsi/xrAfdDdn2viw6Pr
	9zHFj8qne7/mbaMEsGEAzEk+QXSaUfvm35hCvgSWuERejL99nVf4Rrpk6UcbxehV
	30AHmA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dqkqftvn7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 24 Apr 2026 01:45:34 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8acafc224a8so183591196d6.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 23 Apr 2026 18:45:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776995133; cv=none;
        d=google.com; s=arc-20240605;
        b=BXKQuahSQ1rTc7U/xg/F1T66XJmS/IbjLLMZgnyllLbMDhKFnce8s9GVaZZVdnf+Et
         /XcEHE0LqlkLNQIWP6YtcAguB3Q/7GAJ8AhLm0BLnJf1FJjnGIc4ZrFYw6+U11CsfwYQ
         AteMXiNpilNtT/Cd676uloe/dwy4K3M4ULVt+UH3K3bd9psPTLu717l7TtW3FALuewgY
         4pGijH0olUJ8aLVrIYXjybmsaP9miwMfUiZCZ54FTq8duKGsbV1+qM9mWsUApNe9DMGX
         0a5oaE9oww4WlbK/imNkI6RBojxbiyRJuQIOpIN1d60xuOjvdROAFfZOZraJs3QSRk2D
         mqIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8VXoqdGMeRjXfI2Hnb66nRRx7N1KrVKjfM+I30tzlC4=;
        fh=n0ZnAkKOhGDmrf8RLpwnC7FQ6xmEY5rofL6wXnjsXjs=;
        b=Hwz36mHY4PJICn5Ozv3k01qd5/gDELd+IQ9bNQbPFSDKrtYqAGEUuRtu7SN6dtbtCc
         RU+5QwGnmuJc59/qfw7Q2Okpku4IxmirJLn+Wq+zEQ9rAOu7JeOHnrb16UGC64IULhrB
         JCk9uq+ZI0+bEG26SbJUGc1II6lkjr+Rf9wplkjlTGwyJ/x3zxTGSr7GYz5aByMT7/X6
         laYAhF1eYCoHeoLv9RjrYAFYpuhTaioufdV5CvTkqUef3zO8HqkH48AYm4/y7XayV/EV
         jZvpA7jWhIzAhoht5jAy3FSi4HIFWiYTVR8RYAlDinhUlLDPVAdxpFn+3SDedRujn6B5
         m/jQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776995133; x=1777599933; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8VXoqdGMeRjXfI2Hnb66nRRx7N1KrVKjfM+I30tzlC4=;
        b=K1n3kQBSnAEwrlSQ88lJf9deX1Cxx9jMNwaxkbGn7P2+RQNmob6vaZELAvK3QUlmsK
         CkG0Zb5EuDHy0ouvce4dsPjqRXyBFt8G61I9rLU1WlEfWWDjDilSOAXd2a+kbGNYGvaL
         O4YZR5uHPk9UobJjMTONk5mnIDQFY8OzllpUZ6w/2fSvoUTV9DX9fBYJz39Db/PRSmuP
         yPb9Ly3I1ToLXwGFQpz/1yzxTnM1IwU6JEb9n6jCtjkJ94NliLEVceQ+IaCb5pID5zec
         40S6eHfvp6tIfPwW+ueM5R2RUv1h0/V6jHmM1/PWnPEd1zqWtEv5cwskVz4nQh014ils
         6v6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776995133; x=1777599933;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8VXoqdGMeRjXfI2Hnb66nRRx7N1KrVKjfM+I30tzlC4=;
        b=MYfnd6kahfGn5+nfk1lh1EY4Q43/oLzRQBytFJnUZ+HE6i1lQlZ1tPRoGebzycbpHl
         KoYTbWSnqGhLLWkXYdj3p0EWJwDdcjtBqTTq9vo1xySElVYZtu+fUlPPnTnVqb+s9Gru
         XemVDOuMF8y2XIFjZf5Jpf8K+xnNaZvRPBMY2+79VEnxtlgvG7fNil/mRXN01H2hy3cU
         h3SSdDEeFk9vvJ3deCAP/njnM4AFSVWuZflwKplX0Qu7heCQgtjTdlh10qiOnRMJAGOy
         StTTawJ/s1B3mV8C9wTqYHsEAHW4G3CJ+KheKgrFHhKn1YGNVfcmXSxvHbnWYVgBCE92
         PoNQ==
X-Gm-Message-State: AOJu0YwNIZnd/NUMMs24JpOeveLEVGqVmjdPxZ+4dGrphlwsjumedNzg
	aKARu3ik0UaJaTRRRcos/4JvSpM9uMJK+EkT50/nsmv/AGW0CTQAHUDDvMPhJMxwbuoNy4rZdai
	iztxQlSTjkN1c7yn5aCT+UAeyPvSzGFFbYej5UD/TxF/Wn4bYmIMpY4DeFuefiBZhpCNfim1Ywh
	S+5T2+3lbCraInz9qu3zNsiXDaNr964u3eyZoz+69cYroKqDrBTR+FsmCVams=
X-Gm-Gg: AeBDiet6mAtyYUZ2E6liiFDqIV+GENBvr8aMyIjM0Tnff2oiHBVA6jCvSafhLeIzfMd
	DSwWNVa3fsxa6HzYWcjXa+7MO7SO+LLKxyw5Up8803OySUpUNGXaJJOwP1pDNXTdPqQOoYjho6S
	qKDvHZ+Q1csGbbV4wOO0Ejwqm3/4+z7zC/jSOJ3pFlHuPBhtmpjzqj7nLnIuPCFQodMvL1SXff2
	1zUfwSq50OkDzc=
X-Received: by 2002:ad4:5c81:0:b0:8ae:6587:3d6c with SMTP id 6a1803df08f44-8b0280eaa5fmr489407776d6.28.1776995133032;
        Thu, 23 Apr 2026 18:45:33 -0700 (PDT)
X-Received: by 2002:ad4:5c81:0:b0:8ae:6587:3d6c with SMTP id
 6a1803df08f44-8b0280eaa5fmr489407416d6.28.1776995132537; Thu, 23 Apr 2026
 18:45:32 -0700 (PDT)
MIME-Version: 1.0
References: <20260423124823.1983261-1-ankur.tyagi85@gmail.com>
In-Reply-To: <20260423124823.1983261-1-ankur.tyagi85@gmail.com>
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Date: Fri, 24 Apr 2026 09:45:21 +0800
X-Gm-Features: AQROBzBgE9PU_ZFFJOE02pNa4eSPQsKWktApmFBPYbwu7dUe-IYaVCt-pF338EU
Message-ID: <CA+s=J=xTyGhOKuQjRyAJyzh7UCW4PSntZPimbpN0eCa8K71TOw@mail.gmail.com>
Subject: Re: [oe][meta-oe][whinlatter][PATCH 1/19] jq: Use Git to fetch the code
To: ankur.tyagi85@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: HWVdl8cW-t1eNu15VjAXk2blubPiZzFq
X-Proofpoint-ORIG-GUID: HWVdl8cW-t1eNu15VjAXk2blubPiZzFq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI0MDAxMiBTYWx0ZWRfX4C098HEyZ8m5
 a8dpsEDSjWalf0WKZ9ACzwRsrFOkz94kbbwtJWAPV1+dvKWobcZAVMd9PAt+hB1A9Had3FVYUsM
 vzj7SJ7W7G/ZEDnO1gOZMlgM/0uc7DLqXfZ99BMikBBwgRAPdnhE4V/34jSdLhw4+EhxpNpvMP4
 Y5txYyzJBQPj+QMzy0GCBpvz2nh1U5oM9bnW0j40Mn1GiQC2KfzvrJno4iu7MlktQjJ1BcXUSq6
 sb8YvfhhQ8J++SIgSHDTJhKXrqdC0ktfnxIu2JWQVyAKqO91LFnuXkGqAgt8nuew6E22sys4WAi
 dRaNb6ax3jujwwqaYuIaeF8i1U/Ic+mak2tg87fG6rtlWy0MUwJ+h2RcQtcbYb/08PqcYyYEyAr
 CG16/3pduUO+p5NU6mon7KDQPfPDHAofVmZEfuJQz9Y1xZKT4vbV+KA/TEIn6CT4TZ2kqZJPKLL
 8Kf88gB4bI4rKm8CwzA==
X-Authority-Analysis: v=2.4 cv=ablRWxot c=1 sm=1 tr=0 ts=69eacb3e cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=NEAV23lmAAAA:8 a=Q4-j1AaZAAAA:8 a=3-RhneuVAAAA:8
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=MTB_ncMD_gwpHIa1yzYA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=VLVLkjT_5ZicWzSuYqSo:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604240012
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 Apr 2026 01:45:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126598

Hi Ankur,

Thank you for sending these. I had already picked a lot of these in my
branch for pull request I'd like to send today. I will take the rest
in next and final series for whinlatter.

On Thu, Apr 23, 2026 at 8:48=E2=80=AFPM Ankur Tyagi via lists.openembedded.=
org
<ankur.tyagi85=3Dgmail.com@lists.openembedded.org> wrote:
>
> From: Peter Kjellerstedt <pkj@axis.com>
>
> There is a bug (see https://github.com/jqlang/jq/issues/434), which
> results in an empty version being used if autoreconf is run on the jq
> sources when using a release tar ball. The incorrect assumption is that
> autoreconf is only used when fetching the code using Git.
>
> The empty version results in an incorrect libjq.pc file being created
> where the version is not set, which results in, e.g.,
> `pkgconf --libs 'libjq > 1.6'` failing even if version 1.8.1 of jq is
> actually installed.
>
> Switch to fetching the code using Git to workaround the bug.
>
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
> (cherry picked from commit ed33569f822a3a8d41f82f6980a046d17aca37d5)
> Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> ---
>  ...-with-disable-maintainer-mode-and-so.patch | 44 +++++++++++++++++++
>  meta-oe/recipes-devtools/jq/jq_1.8.1.bb       | 14 +++---
>  2 files changed, 52 insertions(+), 6 deletions(-)
>  create mode 100644 meta-oe/recipes-devtools/jq/jq/0001-Support-building-=
with-disable-maintainer-mode-and-so.patch
>
> diff --git a/meta-oe/recipes-devtools/jq/jq/0001-Support-building-with-di=
sable-maintainer-mode-and-so.patch b/meta-oe/recipes-devtools/jq/jq/0001-Su=
pport-building-with-disable-maintainer-mode-and-so.patch
> new file mode 100644
> index 0000000000..12a64a75ed
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/jq/jq/0001-Support-building-with-disable-m=
aintainer-mode-and-so.patch
> @@ -0,0 +1,44 @@
> +From 27f417f4812e688a59fc5186b7768cec004cd6e5 Mon Sep 17 00:00:00 2001
> +From: Peter Kjellerstedt <peter.kjellerstedt@gmail.com>
> +Date: Wed, 8 Apr 2026 05:58:49 +0200
> +Subject: [PATCH] Support building with --disable-maintainer-mode and sou=
rce !=3D
> + build dir (#3518)
> +
> +If --disable-maintainer-mode is enabled, then the rules for generating
> +parser.[ch] and lexer.[ch] did nothing. This worked fine if the source
> +and build directories are the same as the pre-generated parser.c and
> +lexer.c files would suffice. However, if the build directory is not the
> +same as the source directory, then the rest of the Make rules expect
> +parser.[ch] and lexer.[ch] to have been created in the build directory
> +if their source files (parser.y and lexer.l) are newer than the target
> +files, which can happen in case the source is fetched using Git.
> +
> +Avoid the problem by copying the files to the build directory if needed.
> +
> +Co-authored-by: Peter Kjellerstedt <pkj@axis.com>
> +Upstream-Status: Backport [https://github.com/jqlang/jq/commit/27f417f48=
12e688a59fc5186b7768cec004cd6e5]
> +---
> + Makefile.am | 9 +++++++--
> + 1 file changed, 7 insertions(+), 2 deletions(-)
> +
> +diff --git a/Makefile.am b/Makefile.am
> +index 96d6038..acb9443 100644
> +--- a/Makefile.am
> ++++ b/Makefile.am
> +@@ -41,9 +41,14 @@ src/lexer.h: src/lexer.c
> + else
> + BUILT_SOURCES =3D src/builtin.inc src/config_opts.inc src/version.h
> + .y.c:
> +-      $(AM_V_YACC) echo "NOT building parser.c!"
> ++      $(AM_V_YACC) [ "$(<D)" =3D "$(@D)" ] || cp $(<D)/$(@F) $@
> ++      $(AM_V_YACC) [ "$(<D)" =3D "$(@D)" ] || cp $(<D)/$(*F).h $*.h
> ++      $(AM_V_YACC) touch $@ $*.h
> ++
> + .l.c:
> +-      $(AM_V_LEX) echo "NOT building lexer.c!"
> ++      $(AM_V_LEX) [ "$(<D)" =3D "$(@D)" ] || cp $(<D)/$(@F) $@
> ++      $(AM_V_LEX) [ "$(<D)" =3D "$(@D)" ] || cp $(<D)/$(*F).h $*.h
> ++      $(AM_V_LEX) touch $@ $*.h
> + endif
> +
> + # Tell YACC (Bison) autoconf macros that you want a header file created=
.
> diff --git a/meta-oe/recipes-devtools/jq/jq_1.8.1.bb b/meta-oe/recipes-de=
vtools/jq/jq_1.8.1.bb
> index b9383c76f7..6eaa2de6df 100644
> --- a/meta-oe/recipes-devtools/jq/jq_1.8.1.bb
> +++ b/meta-oe/recipes-devtools/jq/jq_1.8.1.bb
> @@ -8,15 +8,17 @@ SECTION =3D "utils"
>  LICENSE =3D "MIT & BSD-2-Clause"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dcf7fcb0a1def4a7ad62c028f7d0dc=
a47"
>
> -GITHUB_BASE_URI =3D "https://github.com/jqlang/${BPN}/releases/"
> -SRC_URI =3D "${GITHUB_BASE_URI}/download/${BPN}-${PV}/${BPN}-${PV}.tar.g=
z \
> +SRCREV =3D "4467af7068b1bcd7f882defff6e7ea674c5357f4"
> +
> +SRC_URI =3D " \
> +    git://github.com/jqlang/jq.git;protocol=3Dhttps;branch=3Dmaster;tag=
=3Djq-${PV} \
>      file://run-ptest \
> -    "
> -SRC_URI[sha256sum] =3D "2be64e7129cecb11d5906290eba10af694fb9e3e7f9fc208=
a311dc33ca837eb0"
> +    file://0001-Support-building-with-disable-maintainer-mode-and-so.pat=
ch \
> +"
>
> -inherit autotools github-releases ptest
> +inherit autotools ptest
>
> -UPSTREAM_CHECK_REGEX =3D "releases/tag/${BPN}-(?P<pver>\d+(\.\d+)+)"
> +UPSTREAM_CHECK_GITTAGREGEX =3D "${BPN}-(?P<pver>\d+(\.\d+)+)"
>
>  PACKAGECONFIG ?=3D "oniguruma"
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#126577): https://lists.openembedded.org/g/openembedde=
d-devel/message/126577
> Mute This Topic: https://lists.openembedded.org/mt/118970752/3616702
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [a=
nuj.mittal@oss.qualcomm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

