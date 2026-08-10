Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2172C5AD55
	for <webhook@archiver.kernel.org>; Mon, 10 Aug 2026 01:48:29 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20865.1786326506142740531
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 09 Aug 2026 18:48:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=RjungmEb;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=jG15SI+j;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 679LCa8a4102320
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Aug 2026 01:48:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Vnre6vCicRuI+z5DOlJSz+jM7ori06T7/99kjUPOXd8=; b=RjungmEbeQFeikvV
	lzuh+4Mx6Yei6p1tNi+c8qYTxGahO7NrflS72ynz1lyNoYMqBi1yaLALRYlcUnFU
	cVpi3NLjvXunG72/wcF/JiuCfDIuM+MnGeXD3asw469qH3DxEVlBXt5iuHqylQbb
	uZibwmWvcZu8Np/AuEULIwD+8kDu5Qsz42ooGi9IftZqgGV3BrYRJl0BJRWeZRJy
	a9MeLojz4CjGPQXWPoHYNnSCGRTZc1EqKuM6BJTEUbAYMsG5zHJILcXqekhZkraz
	JNCCChJzip234IhTSIr3CDJL97J0suECRdv2q46VIbraBdhfEug1E8ohzBje47Gb
	n/of2Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fy18xrd30-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Aug 2026 01:48:24 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-930dda91cbdso231914285a.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 09 Aug 2026 18:48:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786326504; cv=none;
        d=google.com; s=arc-20260327;
        b=BtwdghDYG+sZMJxUJRplcL7RFAz2kqWZKe5myLGFCtE5lbYXfZUh7dP3+tHx5qbZh3
         3r7zgaMIR7x+b5sJrvGapM+wnOl1vFb5rPPlSqfzn2fPrZF8otKpMFq80f8pqzsrSU7j
         pX3g0OVNLk4OpXFk0woEW9hZocJKJtS3Fg+FH5AWIZz+KHWjzKUwNwpRb5f15kNQeEvw
         DldubaNtZaatPaBDD+G1JVTXzKXnlSLYjQ4Fv61RSvU9MRmhCnq4Mv7Dh7eZlj5HMfwe
         FZed00JqdO9i1sFy8bVkq1/d+c+Yu24jZMzaP/VTYS7OR3OV1THduix5HRrQrZNRlgjr
         qkIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Vnre6vCicRuI+z5DOlJSz+jM7ori06T7/99kjUPOXd8=;
        fh=hTQKF0ww1XD85QbMISdo5fvROfZg2DBvG8tQ4WVdGtQ=;
        b=TSbNFlLHnDUEROpaT1ufYMGDATv87wT0XurbvgnWGeSL/mQ0QYiwoVJ0SqZVuzfxH3
         uN/tbFTONbypQdoZaN24mVsmqHeZccrwkWcvGVloJ4D66csL0g5hK2JYWCoGI2m1hok9
         S7V0nI4w07J6/eWR/iP6/gwsnS9UmaWQ5iuCJgyRi2qY/6VR22pCqB70vHdf5rfrv05l
         53DegDmN0frS6YyDNkOci2TDru68VHkIiGjA5a2RY02Q+PeQwK0TD8G13hKurCQa8+c0
         eKwQLPKiouWeQlfIiUh6pS+aiNd7FpC/9opqq9gmrL2hwl9Luh2ERVs9qiujYU1ipEPr
         GoVQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786326504; x=1786931304; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Vnre6vCicRuI+z5DOlJSz+jM7ori06T7/99kjUPOXd8=;
        b=jG15SI+jdrPSRT/aKArWMVUfvJ0KDk/uJAXQxcwUld6eJ9VfnbTrI+B3X1ht92y3BP
         +LIja3XPf2Lrp0d/G+tyP9UwluQUlsDx+UwCj5QEqo6ITHwl6yTmEQ6PUCijyKkuBLov
         R1/zuLRyJ1MdxQFhgGEJGEVCpDMyZOwM5SghIP2Vw6o2fyYIEqIqYSeGgUsqZyac3hCn
         TP9b3swgOjzKqKYBRqizZQEcake02SgnYpkfNnXhSkmnN1uJf3gAbEK9RohBGVa0q38n
         BfG9Q0Dz7i+ECpKozgR08iDw/3VIJB+ucSFISbVgRqoYp1Th+G4DQvIUg6IW9RoQRuI2
         wYew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786326504; x=1786931304;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vnre6vCicRuI+z5DOlJSz+jM7ori06T7/99kjUPOXd8=;
        b=nk2Gok7uG1uoYBJMUP3ATnPJP6Ij8HXnROH8VZ6J/AaCRmqqxlX1h7uw2QRhTKD8Kd
         J//FzgXsULalSbSogvwJtUVpMECvqD/hlzEDaiy+Sz7NOmocbwCOTOgnLNibOpM8OIZg
         w6b5OHYXw6DVagoD25BjaY1gvs3/bsFdtyxmUgvqRfGkkVoKc4LkO5N9+psTGvxaRGiB
         Gj98vXaW9/7YkxRQl7DB0O6+XgmF8kEWSfy1TKtcedyrCOslbgMTnkwMzJ/tl1lPjiyG
         NE87U5gnKQSH79qvGvLYwblKM2Gd+4J2uqOBQzMQCuXApZkNUd2aY2GxbwA75MJjwzyf
         6M2A==
X-Gm-Message-State: AOJu0Yyh+4ZBoEWLSPKQId5Mc76iIJUBPCt4ToYOEPzqMHfWnq7dznpt
	GBt5ZrQdI2NKHrmY3UFabZr/zqxOUmWmKAC6Gj+5A8raBg8TwkF2SkYAL+uXGXsKS0WONZHrtvF
	ZaxxoLA+LGymcDN21AZQ5Cj0Fxyb/5X8JUXqVna8FxkgbVblaa/FoqG9tvgAdep0oPjGUdmtIax
	kOy72/x3KmOeO4oqJDHe6fNgGWfeg+b2yHJwzVw95tfGuhhIWDO5qzCpwA08I=
X-Gm-Gg: AR+sD11/CVvNErHmrPpq7/ULNznlbTw4BqVnAvfFuS04+UouVGyXEceNSHaoaiHSLUS
	V5OFZ9zYBtD12gkNMifYhyeNxbZoF2g76Y7b/yZ+YLQdq8A/kfLvJtID5qFmHkNJJG0cNqOBhVs
	ZUdnla7yXk//N3lSH9CEgGpd4Oh9XCnvhte/pcQJXxX/kou9JBib9ET9Y=
X-Received: by 2002:a05:620a:8bc7:b0:90f:9cde:977e with SMTP id af79cd13be357-93648eb85c9mr3000553585a.0.1786326504001;
        Sun, 09 Aug 2026 18:48:24 -0700 (PDT)
X-Received: by 2002:a05:620a:8bc7:b0:90f:9cde:977e with SMTP id
 af79cd13be357-93648eb85c9mr3000552585a.0.1786326503597; Sun, 09 Aug 2026
 18:48:23 -0700 (PDT)
MIME-Version: 1.0
References: <20260804194003.3158916-1-ankur.tyagi85@gmail.com> <20260804194003.3158916-27-ankur.tyagi85@gmail.com>
In-Reply-To: <20260804194003.3158916-27-ankur.tyagi85@gmail.com>
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Date: Mon, 10 Aug 2026 09:48:11 +0800
X-Gm-Features: AUfX_mwIrjptRYxk3xIGFltMloSPw6jLybpcP2dmsPo2wrP5sJ4BtgKaHlp3L0s
Message-ID: <CA+s=J=xVmVDry8gq5DmkCMXC2swsffZFxtzE5e-6d5yTL-d2BA@mail.gmail.com>
Subject: Re: [oe][meta-multimedia][wrynose][PATCH 27/36] libupnp: upgrade
 1.14.25 -> 1.14.31
To: ankur.tyagi85@gmail.com
Cc: openembedded-devel@lists.openembedded.org,
        Khem Raj <khem.raj@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDAxMyBTYWx0ZWRfX63qpeSwyZ+TM
 5n+MkEAbwNmjrUWhH6CCqOvWiQVqiTjj497mANePtgVhLV7x1Aq91nntPv7iYXMbB/9PXu1Aq/Y
 LZ8VqJj1yCvMbPTSJ7sWe9+vWpmJo3I=
X-Proofpoint-ORIG-GUID: dexXkDUxrm3fyh3rULdbj-QY3hKSQwdg
X-Proofpoint-GUID: dexXkDUxrm3fyh3rULdbj-QY3hKSQwdg
X-Authority-Analysis: v=2.4 cv=bfZbluPB c=1 sm=1 tr=0 ts=6a792de8 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=NEAV23lmAAAA:8 a=FP58Ms26AAAA:8 a=Q4-j1AaZAAAA:8
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=gS4NQT7tubci-JkwkVsA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDAxMyBTYWx0ZWRfXzh19sJ3Qhf1J
 aePdM+nCpgghyb8KUuJVlM+ZLoCRF2U/0D9dx0/OMdxJe3pMbAtuPqDn/MGKP101TSU2vNMs9nr
 ybwVwrOKJ2LW4MXTMu7XzHpMDfXlGfHNCQtDslPJsJ5HjiU/kwPip491Of/n/Xnu2umW814GTHu
 WUkiNzLiETV90b4iWP0YHtnAfI+LetrcaovC2epUFwg1ZY8dQsfGY+dzdN82B2JEp/aqHF5JEW4
 w9xkqHGd2On+Xvxe5VywC+vKhm+5c4sov8imvtLJxBhmNlb6h5Ixej4OmO5+9kjx0jBRwgiSpxN
 GwXCD1ByL6wrhrrJmkW99N6Bxby0RzdnuE0Aju4sPA13nzHo3Hba8+w2Xe/u9BS2Ob38DDyQuue
 OBze0X7ZSc06E1JCxNylBzpBs/NPsWJqijU8UmSBuHDZLcwhAI0+BWNkI/Zoy9dDvsGi8bWignT
 lOPFEA7tiFLUpesORMQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-09_07,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100013
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Aug 2026 01:48:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128873

This causes mpd build to break:

| Run-time dependency libupnp found: YES 1.14.31
|
| ../sources/mpd-0.24.9/src/lib/upnp/meson.build:29:4: ERROR: Problem
encountered: Your libupnp version is known to be broken, see
https://github.com/pupnp/pupnp/issues/528
|
| A full log can be found at
/local/mnt/workspace/wrynose/build/tmp/work/cortexa57-oe-linux/mpd/0.24.9/b=
uild/meson-logs/meson-log.txt
|

On Wed, Aug 5, 2026 at 3:43=E2=80=AFAM Ankur Tyagi via lists.openembedded.o=
rg
<ankur.tyagi85=3Dgmail.com@lists.openembedded.org> wrote:
>
> From: Khem Raj <khem.raj@oss.qualcomm.com>
>
> Upstream changes (ChangeLog):
>  * 1.14.31: fix for CVE-2026-41682.
>  * 1.14.30: revert an inadvertent API change (25d4bd0b).
>  * 1.14.29: CMake builds from the release tarball now work.
>  * 1.14.26-28: SONAME/CMake build fixes and assorted portability fixes
>    (e.g. OmniOS POSIX asctime_r).
>
> Version-only bump (git tag release-1.14.31); recipe unchanged.
>
> Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
> (cherry picked from commit d98bc9596101d3eae2921cd93f1a35b72869edf6)
> Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> ---
>  .../libupnp/{libupnp_1.14.25.bb =3D> libupnp_1.14.31.bb}          | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-multimedia/recipes-connectivity/libupnp/{libupnp_1.14.25.bb =
=3D> libupnp_1.14.31.bb} (94%)
>
> diff --git a/meta-multimedia/recipes-connectivity/libupnp/libupnp_1.14.25=
.bb b/meta-multimedia/recipes-connectivity/libupnp/libupnp_1.14.31.bb
> similarity index 94%
> rename from meta-multimedia/recipes-connectivity/libupnp/libupnp_1.14.25.=
bb
> rename to meta-multimedia/recipes-connectivity/libupnp/libupnp_1.14.31.bb
> index bcecfd3b8e..6ba21971d0 100644
> --- a/meta-multimedia/recipes-connectivity/libupnp/libupnp_1.14.25.bb
> +++ b/meta-multimedia/recipes-connectivity/libupnp/libupnp_1.14.31.bb
> @@ -8,7 +8,7 @@ HOMEPAGE =3D "http://pupnp.sourceforge.net/"
>  LICENSE =3D "BSD-3-Clause"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D394a0f17b97f33426275571e15920=
434"
>
> -SRCREV =3D "da7cf950f22357545061961b7e5610e08690b0cf"
> +SRCREV =3D "79ff958ed1012e60faba84981481f76cea43c7f2"
>  SRC_URI =3D "git://github.com/pupnp/pupnp.git;protocol=3Dhttps;branch=3D=
branch-1.14.x;tag=3Drelease-${PV} \
>            "
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#128774): https://lists.openembedded.org/g/openembedde=
d-devel/message/128774
> Mute This Topic: https://lists.openembedded.org/mt/120599957/3616702
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [a=
nuj.mittal@oss.qualcomm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

