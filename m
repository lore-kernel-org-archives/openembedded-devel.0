Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C4CAEF0707
	for <webhook@archiver.kernel.org>; Mon,  9 Feb 2026 04:33:04 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.40546.1770611577573562931
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 08 Feb 2026 20:32:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=dpbDONX5;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=IZaGh6wN;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 618CkfsW638276
	for <openembedded-devel@lists.openembedded.org>; Mon, 9 Feb 2026 04:32:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rM11t73PsmQaBgQihi7z9+gzXp8Gu3rC4g4DwUZUruE=; b=dpbDONX57uB6NynU
	5mKXlBQ1mgXFvVbys5TD5KKJf3odlISogGOkgtd9DXbwtgqrAI/k2csf0HCZwhjG
	NKa3HflMrTPNzhcc2YseJtnf9RJOUTRLgGYyDVCZDupTD0wAVLVWFV376muv6HUZ
	RxsGSTC58iAJY4hboRdjGKbKDjl/yhr7X9eG95f8c/Hxfsln6vT0JMQWO1UeJm+w
	hT3Lh1Oy3OxQRdGoNj4UoGjQnwUK/Ig0Nh3y3a7dIx6C4KHPPt0Qr7jwydoeWxza
	4iLZ/fb6wEoorTnllxJe4gIgRQWitz1ngikUeN2dBJGAd026hq8qf7IavL144Fp7
	1H3QuA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c5xj1bkje-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 09 Feb 2026 04:32:56 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5033c6265d2so181783081cf.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 08 Feb 2026 20:32:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770611576; cv=none;
        d=google.com; s=arc-20240605;
        b=b4kIkLMmXfSMIsmcyCwdXe29IPShx4PuGMQTW58vVKh9mXwneC/+MZFSW/VZvos0OP
         gux2NTuir2hPqw5yOfFkHkm2CnJG5rd3THStH4sjDNmWn9igletRRW0pOpEsXqnBborh
         I+agmosFFCXwNIWEL/NEVAEEY8qqol0iSM3xW5QXnwyrmDtoXInRg8o0gpcINcn6aX3O
         qvLvjA1VU7e0ZyByalbf4/2iJh/b/toOom8rtEZ/P9/Zh90tOefZAmM/EPdxhIbJEzRz
         hGybW1hLy1ULoUtTEpfq6IueZvfvxM+SUGRFB+aDaGwV9pciq2ydqsyquorlE3/wdUi/
         vWAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rM11t73PsmQaBgQihi7z9+gzXp8Gu3rC4g4DwUZUruE=;
        fh=bQPCK6q4gchfQqWcSkBzGgXxevMwme30VfhS50J4B3I=;
        b=LS1u5nSIQdp+Gk1nZmu8S9W9A0/kbsDIDe3p2kYoeRB7177fSL5KXWOrrLvNBV6GdC
         q6FLpEPD44IYsymsOmBTuUr3Mgvtgj4oWX/iLUOJJ/fMtno04wy6KSwFsP2ROU73rKQI
         Nt1s49ijqm3KOZfsvN6IWjDsSGvlk99UeNmNxs1s4CvzwhaPrBQg58M3Pyz6P6pYPxKk
         oHFTHOwcKnlxw2pS9QvR9aNNJxkbTYYQIBgfEU9kfHUtRzJyBKUFHrAmF31LJsJ8Qdss
         Y+exMehyld3AKD2SevDRPAqtufTMq4l1wT4POtHb8jLPXln/beScuDrrxmWMbD6z/tC4
         k2vg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770611576; x=1771216376; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rM11t73PsmQaBgQihi7z9+gzXp8Gu3rC4g4DwUZUruE=;
        b=IZaGh6wNvzFRfcwnq4tOHejfEe1EQPeRoaEQQ4kK1dji1T9gVTOgvWwzZFQPaW9TaV
         8Jxp+XMBHYL2GSO4fPXU9xC3nMbqUu1FlbLdoB+RdxsvPl33EKqNpJR6o9hwHZj5qCIU
         urGWu1vV9Qc9/BcpQHd6lrHp2QjN0Unun0mfAujZ8jJO8sznI9uvHry819wtJCV6mf6C
         2S/BLkBDqu6viUya0TkhQYyMwn+YJ2UK6SCHgf4ikMOIkS+1vYYZT9OfaFyOAgo1yQ9D
         KilMwfbNUy0IyPaMSoNVhb47M2K0yx/Bx3gpbdp5KuNg/y1aoNOp5Y+nh/7YrQSP5j+7
         wPsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770611576; x=1771216376;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rM11t73PsmQaBgQihi7z9+gzXp8Gu3rC4g4DwUZUruE=;
        b=qpo+vD2f7dyrpMgYFEDLZfNdaEJhfdYGpqmwM9z3pSW8XkTN2sXhAS+x7q43zR4m+6
         S0hrHdYrBZ9ED600jL1KEYqmcj6NZYlnUfw7l5r4vdW6tM2F+1kE9X2aXDFT3TSjwDFd
         FrL2UB6iO/XutOJCL1EWW3Lgnv54omajXiofLCDKPK/zzTKRmC4m0L0O9GCDBA4iG1jG
         yG4NATW+WQSrFD1F54t7UcnaQmOBHN7F5LAav5QZ+7bP++lLJLYE9EMA9mxg4WMLrbAD
         i1T99S+3FyxZh8WjzT7T0rRgG+C1UctNdzOoTVLlZQAin/KeWUnXC8IE+kDzIuve5URJ
         DEuQ==
X-Gm-Message-State: AOJu0YxezRssEaSo95uLNnir+Zm9hrfzRNbEGkmeMlBnJ1do4bxJzzGI
	YTUcb9ijbGVthGSZX99KPmwUFz48zzRDQeTyDe4+qY0MT1Hdyuw0KNVTGvh5QtCwJVi3tCX74wu
	Oti7P0b2jz6XzYoNRiRaYNMd6ytaR7UuwwWdJHrmO1iUDmhtHaivlGmhtw4OftkmWe4ClDbva7+
	WwZbQlosrAZSZpTErwxqzYfjExB4/7IetA3pDrZGD63ZAVMrJmWBikPxSbWoU=
X-Gm-Gg: AZuq6aJr7G6fAFgGzMCRVO0U0c9N3LX30KW7DM8vVdXeuBsTXmsf4iNeiTiwR8D9lYz
	KenQv6iNT81ZFhVzmedemWcEM41yanfgbBHGEkvYbKPNJkI2i8dXBEcu+2+iY3xvmTScncNeAg5
	+jWJjvDLUJHfT129mn58Bb9eUo4qXjwqCJxVvUDFhDeTOmENfA/UbRX/jRNdy8ON2G
X-Received: by 2002:a05:622a:1183:b0:503:4258:93aa with SMTP id d75a77b69052e-506396148bemr130566351cf.0.1770611575696;
        Sun, 08 Feb 2026 20:32:55 -0800 (PST)
X-Received: by 2002:a05:622a:1183:b0:503:4258:93aa with SMTP id
 d75a77b69052e-506396148bemr130566211cf.0.1770611575296; Sun, 08 Feb 2026
 20:32:55 -0800 (PST)
MIME-Version: 1.0
References: <188D031AC06B5E57.3547823@lists.openembedded.org> <9c9c6b36-6e25-43ac-9a9a-b209ac27ada9@vaisala.com>
In-Reply-To: <9c9c6b36-6e25-43ac-9a9a-b209ac27ada9@vaisala.com>
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Date: Mon, 9 Feb 2026 12:32:44 +0800
X-Gm-Features: AZwV_QhJAcuLGswwnb5catTba6tQ5LPxjE83Lx7D2Duzo30BvO-AQ2741Gdi9wI
Message-ID: <CA+s=J=wVpbARJ0WSJP9tLVfJGyK5p3cBJGB=0BRQGO6FzSHdVg@mail.gmail.com>
Subject: Re: [oe] [meta-python][scarthgap][PATCH] python3-watchdog: Remove
 obsolete dependencies
To: niko.mauno@vaisala.com
Cc: openembedded-devel@lists.openembedded.org, tero.kinnunen@vaisala.com,
        Khem Raj <raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: BUpIKb2ynzQkym8lW1C-AolBLZLRfxFb
X-Proofpoint-ORIG-GUID: BUpIKb2ynzQkym8lW1C-AolBLZLRfxFb
X-Authority-Analysis: v=2.4 cv=F/tat6hN c=1 sm=1 tr=0 ts=69896378 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=Q4-j1AaZAAAA:8 a=Xby-xLWBAAAA:20 a=eWRtdWc1AAAA:8
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=jc0jUgQCze_0G58ONm4A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=fQEa9puXOWAy-YWvlEz7:22
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA5MDAzNSBTYWx0ZWRfXysxk1NVWmr3y
 D44z4ehd8aa4f8GyB72lpm1/p5Kyf/QEvBBzVP/WHhsYJuPygMdLqCiqwqJBwywzgMhoZGaxY1/
 SKg/wqQb9anxWiITQJMkbWTRwhn9XOHfEf2BrDDiHEH4lqUpiu7cZwIYbb9QLddA7vNKCnQ57Be
 7lAELxqd02jehJR8vuc6qwuIb+BwnozRyH9s6u4H+YarqTeMMiMSYcN7LcIcR/CnejiD4NNnptW
 46NU0elCdGqwpRQdGld90EpGq6MwQ6TWacvXI4leIZOU+DsU9V1Q2yaKFUVBkfwT3Dh4bFcD+YR
 d+0t2xmfp+KIEWP3+ULpr+L8Zkx4VUKlLPX6rgRYuCXcHA/PHFuKIfSMvPsssKNKo1UeRbhfVpq
 iGuTW4ZpWf0AOiTSmIX+agzluf7Rsv2xYABNcltIT/1+ZebWDOg/s3B4iTKoDYEkva/gHd4e1WK
 mTooiITGDWgfGOtyy/g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-08_05,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 clxscore=1015 malwarescore=0 priorityscore=1501
 suspectscore=0 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602090035
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 09 Feb 2026 04:33:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124288

On Thu, Feb 5, 2026 at 4:48=E2=80=AFPM Niko Mauno via lists.openembedded.or=
g
<niko.mauno=3Dvaisala.com@lists.openembedded.org> wrote:
>
> What the commit message failed to mention, is that this commit removes th=
e unnecessary runtime dependency to package which has LGPL3.0+ license: htt=
ps://git.openembedded.org/meta-openembedded/tree/meta-python/recipes-devtoo=
ls/python/python3-argh_0.31.2.bb?h=3Dscarthgap#n13 which we believe is a re=
levant fix also for the LTS Scarthgap branch.

Thank you, that helps. Can you please send this for whinlatter branch as we=
ll?

Thanks,

Anuj

> -Niko
>
> On 1/22/26 11:20 AM, Niko Mauno via lists.openembedded.org wrote:
> > From: Tero Kinnunen <tero.kinnunen@vaisala.com>
> >
> > Python watchdog has removed all dependencies except optional `pyyaml`
> > dependency for `watchmedo` utility, like follows [1]:
> >
> > * pathtools dependency was removed in 1.0.0
> > * python-argh dependency removed in 2.1.6
> > * requests was never a dependency
> > * pyyaml only needed for extras (`watchmedo`) and may not be strictly n=
ecessary
> >
> > [1] https://github.com/gorakhargosh/watchdog/blob/master/changelog.rst
> >
> > Signed-off-by: Tero Kinnunen <tero.kinnunen@vaisala.com>
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >   .../recipes-devtools/python/python3-watchdog_4.0.0.bb    | 9 ++------=
-
> >   1 file changed, 2 insertions(+), 7 deletions(-)
> >
> > diff --git a/meta-python/recipes-devtools/python/python3-watchdog_4.0.0=
.bb b/meta-python/recipes-devtools/python/python3-watchdog_4.0.0.bb
> > index 9e36264d62..a272e25bda 100644
> > --- a/meta-python/recipes-devtools/python/python3-watchdog_4.0.0.bb
> > +++ b/meta-python/recipes-devtools/python/python3-watchdog_4.0.0.bb
> > @@ -1,5 +1,4 @@
> >   SUMMARY =3D "Filesystem events monitoring"
> > -DEPENDS =3D "python3-argh"
> >
> >   LICENSE =3D "Apache-2.0"
> >   LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3b83ef96387f14655fc854ddc3=
c6bd57"
> > @@ -8,11 +7,7 @@ SRC_URI[sha256sum] =3D "e3e7065cbdabe6183ab82199d7a4f6=
b3ba0a438c5a512a68559846ccb7
> >
> >   inherit pypi setuptools3
> >
> > -RDEPENDS:${PN} =3D " \
> > -    python3-argh \
> > -    python3-pathtools3 \
> > -    python3-pyyaml \
> > -    python3-requests \
> > -"
> > +PACKAGECONFIG ??=3D "watchmedo"
> > +PACKAGECONFIG[watchmedo] =3D ",,,python3-pyyaml"
> >
> >   BBCLASSEXTEND =3D "native nativesdk"
> >
> >
> >
> >
> >
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#124199): https://lists.openembedded.org/g/openembedde=
d-devel/message/124199
> Mute This Topic: https://lists.openembedded.org/mt/117397268/3616702
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [a=
nuj.mittal@oss.qualcomm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

