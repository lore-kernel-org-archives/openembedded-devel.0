Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC9EEC43458
	for <webhook@archiver.kernel.org>; Fri,  3 Jul 2026 01:16:44 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.83998.1783041401191101455
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 02 Jul 2026 18:16:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=JK2EYDYy;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=Xihv7p1T;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66319YLS2355972
	for <openembedded-devel@lists.openembedded.org>; Fri, 3 Jul 2026 01:16:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lt56SaX4ito/qrsUlwDXjAtm7W1gaf7z0bHDAmVY3U0=; b=JK2EYDYyB4M2+X6h
	ol7DylPG/3bR0H/bR5xssUwon0PpH7eH8peXZne5LggQB25cTZEs9XTAfrovXvEk
	77LadT2HE32qTabxujTZjevTWVjeoFqDWbALT1wEIt1AV1o1uLMpmm6L/3BmkMD5
	vtDsURhsWhr++FX4bYv1QwmQr9BrechudpFU9GZXQPhOcA2iQpli2NTccP+pWe7G
	PV1vo3K3UtPBe86xyLRR7dlPzJVSrlYVvYImCKd+u7QVFmjQVXTq04f/PbeP9Bkg
	IfeU+NqdsfgYq0AF5PF05pfUU2Ue7I+bZdoIW6mKfHn4Uhgjohj5w886j5Zg/IuU
	+B7eJg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5qfc31ra-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 03 Jul 2026 01:16:40 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8ea75996387so54234446d6.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 02 Jul 2026 18:16:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783041399; cv=none;
        d=google.com; s=arc-20260327;
        b=M43OEgpFJW2E5crphivMsyaJRuIFFXlzMd1bbM3m2PABI2mKkBoXQhnuvlUJVfxRRH
         GBbHo/OAlFeeOJYUyfnL8m83rmBaRYkLdNdhLG05ChKgq6ShpUBSetI1TzuJ8QETKGLp
         zqw1teDn+wY0+1rjVa7PEPNbauJpXfdUVrKsa0rW3Fc6wCxL5nTIxjC1Tx4NDi3lUbj4
         us6MDjPqRfzco5NHuzEmgiEcTc4PrFo+FHlQ/v/IUI5oJR1zQemEmOB2gP4nurfk1wXM
         95RX8+5NvjMhyrBrSvMrfBJICtVYOv7ajz61kkQ4lR5EtBxfwtBL8vSXWmMnHr6b1uLc
         UD+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lt56SaX4ito/qrsUlwDXjAtm7W1gaf7z0bHDAmVY3U0=;
        fh=3mcPwXhT/l6eWXEkkIY+siEB/uHMmqe0KqSWCIPV6GU=;
        b=Ice3H/ZayF7hHUg4UsO8IfqNZHDA/N/YFRXzSZQGH+0X9tnhZdFo3tS7ul+wMTkTcf
         K3/raT++y6YBCy5LgUcpaVldwzsQKeegBPjMX6E4dX7wTjHHyvVRWkYD0KEqPkVqKKuo
         73gw6t2rnzAZIK5RKNiDSCKMVh2hTvSRmBuQn8GQWSFLvJMmUPsgwuCc5OJezMlzvG0s
         PiNdYYoeEtpg3sghNEef/NrdnI4ZPGOz3DOwmKYDtWHrZw3H8c4KHKYn8aDg1pw1rAFX
         ZBNwFtLGJpQdbsTWIyYVEgVxFQiq6GjTnyQnXN5giHmkuZyRJhRND3+8hr8aUJj92mId
         2QGA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783041399; x=1783646199; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lt56SaX4ito/qrsUlwDXjAtm7W1gaf7z0bHDAmVY3U0=;
        b=Xihv7p1T0o1rNNtUfEXNN2zRcXTgOfrag4cChMMtc9pnjw6aUCWHjtmeMKuc+tw+JA
         GuJPPaKhIqbf7vM3LMINfUJwvCenIHbpxdpQZAXmXmLa7rqyS0xx/pAkhaBOT8eNRGKj
         VH74aR1N7m7Ay3lfBeYp0YQkDhDABYr16ZOg9D7r7/pPiEjAqTOcKLyzY/NZSK7hn0jm
         plgDwW6wND/q7EDbGA+OsWBvvxiveVJ0vDdjvSrMvt1E57kIvCAfEG3oTEUS/xICd3WD
         Id3/oBSX55g6gyIDkdR7ooanMZiPWpbfxn5t0CYl+mC+moum2dd8Kco7WGcqXqTbMbik
         NT7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783041399; x=1783646199;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lt56SaX4ito/qrsUlwDXjAtm7W1gaf7z0bHDAmVY3U0=;
        b=aLiuSz8wbxTl1a4FpgumfAPmIU5GpleNrW4pPFiW4q3oat3YRWDDjpWLJ4FDSVh70B
         4Ih8YWfxfr7yiqg12pPXGtuvyyHAztDM2YfoWiaYnCisPfApITBpdSHSO2LuM35pJR60
         mJiJx/HG27OKyxQGlk+rZhxwr1Sl3AHzM/CN/Qmr34yUpqvMYezBRpP5X1zImNLUPTdZ
         L1+WcX6suVl+/7io/LuVPJxpMuOeQBy22vf3KHzbxtT0kzluF/TPGOdTRC9ydbmBJzaM
         ikRTN3h0YH4Giu1gfi/6AInLPviZtXJjGehfL6GCkqMqsn9TBouXKlig2cpCIos93pbA
         8+wA==
X-Gm-Message-State: AOJu0YxhPDrmwbyefHle/ReToZY3JaTWruQWyxaIXOWHaMcwl3Dw5in+
	mmypCD8+Txwtr0ukNQvBSLMjpPu9fHNm6ARapE4ypd0h2VPZ2onRcaTPJgBZIwZ7O3bMN3q9CCA
	otN7SQ4FIu9zcuX7Kr7lHTiCqeb3QoTNDq9zkHWX3QsWjHyn6Y5CJcBLtM7dBHoaZ9cl+9tZq2h
	Q4X32H1XgZi4uwlYEsvj9f6JOc1qln0GIZRsn/ObuEaxWSinxUi/ZYyuVdXuY=
X-Gm-Gg: AfdE7ckd8HhqJgdeTX5knP3e1m0dQWq44rv2qfUTS0UTmjt4vrJlidL/4NCIjGRc7Qi
	CrTZAiiMalbphV/AV72r3CEZTBrpxTGh3ZwjskftZLKuLzp+SCypED8YY6C+C0RzI9ilTO6TOHA
	2oV+dFkFm4sjtPr+pFUgnoroHjL31LwNJA0sh9XIbgA4rWEGtb0w+hvJJwAEecekm8wA==
X-Received: by 2002:a05:6214:ccb:b0:8ee:6442:833 with SMTP id 6a1803df08f44-8f3c93e1135mr112343676d6.43.1783041399102;
        Thu, 02 Jul 2026 18:16:39 -0700 (PDT)
X-Received: by 2002:a05:6214:ccb:b0:8ee:6442:833 with SMTP id
 6a1803df08f44-8f3c93e1135mr112343396d6.43.1783041398728; Thu, 02 Jul 2026
 18:16:38 -0700 (PDT)
MIME-Version: 1.0
References: <20260702161521.84024-4-yunseong.kim@est.tech>
In-Reply-To: <20260702161521.84024-4-yunseong.kim@est.tech>
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Date: Fri, 3 Jul 2026 09:16:27 +0800
X-Gm-Features: AVVi8CdEsoYmgeIi8wzoUq4wVD-cKEAv_vhA5hm4LqQPbeNX7Xz0MNfWWHfs3nQ
Message-ID: <CA+s=J=x=UXDjX=v54irVpP6Ctebm9--stdudLe32cE=S0kFYCQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][scarthgap][PATCH] libyang: upgrade 2.1.148 -> 3.13.6
To: Yunseong Kim <yunseong.kim@est.tech>
Cc: openembedded-devel@lists.openembedded.org, yi.zhao@windriver.com,
        wangmy@fujitsu.com, Martin.Jansa@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: 3d4EaOfo52Kj--yYOoHYsjjmTp1arLhm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDAxMCBTYWx0ZWRfX/iBCm8v1w18q
 Y38V9cWkzhjQmNYPPVv9AqhHhYTetLrl8ttHXipsgiCKqVx4vnWm/VZIKl/oJWuXPovKahdB6oe
 l8sk0qQ4Kp7BKSRlnTwfagxw4Riyi4klTIjiRtNMfqFMJ+8M15Y4HIO9G1Gjae2kOs0sznvNvoB
 JXBHq3KSQ7Z0q6EfBqvNVgNhJxZnyytzWxXRvxkwz7rt7L9Vyksn8SPZzo4bbXF3eOsMS44KNx6
 54enMh0IAJUowpgMAH2IqeKcsfLP+1RYiKv7b9oENYkRfXlY3iWYiQNAOuuj9Waj8EiVEvtkkna
 uOtEQDOiU9qHmM1RrgxGQ2TRuJDAXYaQgW26zMWZ2Tm//URpAZoJgrHsmxSmkj0JK/ZLpwbG4lT
 FQrE1yJZCZHTLRI1ROaHMwwSAZZ716lXLOMo+EQzQpMTRi9C+/DrP7ZLOJbmCUCmss5gjxiqIke
 6Gd2xbA96XRLpKS0low==
X-Authority-Analysis: v=2.4 cv=dvXrzVg4 c=1 sm=1 tr=0 ts=6a470d78 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=cFzWkm7BAAAA:20 a=NEAV23lmAAAA:8 a=Q4-j1AaZAAAA:8
 a=t7CeM3EgAAAA:8 a=EUspDBNiAAAA:8 a=_ZMcuoMV48YJzp1uHBMA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-GUID: 3d4EaOfo52Kj--yYOoHYsjjmTp1arLhm
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDAxMCBTYWx0ZWRfX50G5OhA5Tb11
 mo4xZKbldsDNuSu3eSrH2s+kSgsr4tqsjRDUzv0QgD0+Fkr8XFvqB+N/OaTlJk76UrNh0ICCV0V
 M89CxHo3oCnRhLFQZRC3+WGPuqDvpvA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030010
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Jul 2026 01:16:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128003

On Fri, Jul 3, 2026 at 1:40=E2=80=AFAM Yunseong Kim <yunseong.kim@est.tech>=
 wrote:
>
> Upgrade libyang to align with the version present in the wrynose.
>
> ChangeLog:
> https://github.com/CESNET/libyang/releases/tag/v3.13.6

Why do we need to align the versions? This version also seems to be
backward incompatible and that is not acceptable for stable branch.

Thanks,

Anuj

>
> * Add xxhash dependency.
> * Update multilib header from config.h to ly_config.h.
> * Refresh patch for new version.
>
> Signed-off-by: Yunseong Kim <yunseong.kim@est.tech>
> ---
>  ...-test_context-skip-test-case-test_searchdirs.patch |  9 +++------
>  .../libyang/{libyang_2.1.148.bb =3D> libyang_3.13.6.bb} | 11 +++++++----
>  2 files changed, 10 insertions(+), 10 deletions(-)
>  rename meta-oe/recipes-extended/libyang/{libyang_2.1.148.bb =3D> libyang=
_3.13.6.bb} (86%)
>
> diff --git a/meta-oe/recipes-extended/libyang/libyang/0001-test_context-s=
kip-test-case-test_searchdirs.patch b/meta-oe/recipes-extended/libyang/liby=
ang/0001-test_context-skip-test-case-test_searchdirs.patch
> index 3c6aee9247..70890e2485 100644
> --- a/meta-oe/recipes-extended/libyang/libyang/0001-test_context-skip-tes=
t-case-test_searchdirs.patch
> +++ b/meta-oe/recipes-extended/libyang/libyang/0001-test_context-skip-tes=
t-case-test_searchdirs.patch
> @@ -1,4 +1,4 @@
> -From 5de24e1b39c09adb0c5bf4bb4228bd1bb935542a Mon Sep 17 00:00:00 2001
> +From 24ec37bfe5c4c248dda0e80d6e7ab27afca1d60e Mon Sep 17 00:00:00 2001
>  From: Yi Zhao <yi.zhao@windriver.com>
>  Date: Wed, 22 Mar 2023 16:03:56 +0800
>  Subject: [PATCH] test_context: skip test case test_searchdirs
> @@ -13,10 +13,10 @@ Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
>   1 file changed, 1 deletion(-)
>
>  diff --git a/tests/utests/basic/test_context.c b/tests/utests/basic/test=
_context.c
> -index cfba1d30f..8c3bb7ad6 100644
> +index 116b2ce36..4e96f4e96 100644
>  --- a/tests/utests/basic/test_context.c
>  +++ b/tests/utests/basic/test_context.c
> -@@ -1061,7 +1061,6 @@ int
> +@@ -1110,7 +1110,6 @@ int
>   main(void)
>   {
>       const struct CMUnitTest tests[] =3D {
> @@ -24,6 +24,3 @@ index cfba1d30f..8c3bb7ad6 100644
>           UTEST(test_options),
>           UTEST(test_models),
>           UTEST(test_imports),
> ---
> -2.25.1
> -
> diff --git a/meta-oe/recipes-extended/libyang/libyang_2.1.148.bb b/meta-o=
e/recipes-extended/libyang/libyang_3.13.6.bb
> similarity index 86%
> rename from meta-oe/recipes-extended/libyang/libyang_2.1.148.bb
> rename to meta-oe/recipes-extended/libyang/libyang_3.13.6.bb
> index 0eff3247c6..8ea23990dd 100644
> --- a/meta-oe/recipes-extended/libyang/libyang_2.1.148.bb
> +++ b/meta-oe/recipes-extended/libyang/libyang_3.13.6.bb
> @@ -4,9 +4,9 @@ HOMEPAGE =3D "https://github.com/CESNET/libyang"
>  SECTION =3D "libs"
>  LICENSE =3D "BSD-3-Clause"
>
> -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Df3916d7d8d42a6508d0ea418cfff1=
0ad"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Db69fd3b2815bbf1cef5c97f0eee25=
19a"
>
> -SRCREV =3D "fc4dbd923e044006c93df020590a1e5a8656c09e"
> +SRCREV =3D "c2ddd01b9b810a30d6a7d6749a3bc9adeb7b01fb"
>
>  SRC_URI =3D "git://github.com/CESNET/libyang.git;branch=3Dmaster;protoco=
l=3Dhttps \
>             file://0001-test_context-skip-test-case-test_searchdirs.patch=
 \
> @@ -17,7 +17,10 @@ S =3D "${WORKDIR}/git"
>
>  # Main dependencies
>  inherit cmake pkgconfig lib_package ptest multilib_header
> -DEPENDS =3D "libpcre2"
> +DEPENDS =3D " \
> +    libpcre2 \
> +    xxhash \
> +"
>  DEPENDS +=3D "${@bb.utils.contains('PTEST_ENABLED', '1', 'cmocka', '', d=
)}"
>
>  EXTRA_OECMAKE =3D "-DCMAKE_BUILD_TYPE=3DRelease"
> @@ -31,7 +34,7 @@ do_compile:prepend () {
>  }
>
>  do_install:append () {
> -        oe_multilib_header  libyang/config.h
> +        oe_multilib_header  libyang/ly_config.h
>  }
>
>  do_install_ptest () {
> --
> 2.53.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#128002): https://lists.openembedded.org/g/openembedde=
d-devel/message/128002
> Mute This Topic: https://lists.openembedded.org/mt/120087123/3616702
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [a=
nuj.mittal@oss.qualcomm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

