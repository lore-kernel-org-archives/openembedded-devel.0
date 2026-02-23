Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EA23E83847
	for <webhook@archiver.kernel.org>; Mon, 23 Feb 2026 01:49:12 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.27074.1771811347003415893
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 Feb 2026 17:49:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=baKdDj45;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=K4eEmqAE;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61MEv2fY1857015
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Feb 2026 01:49:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cMC9augAA1n7nMHdDaofuAEWBRyByvRycHxMjaJMIZk=; b=baKdDj45fYuJ/0DB
	MVRMw4wLdY/s8Zj2hIhBA6AWoKUlwq1tyUuMdKM1kh5ME2kyCMh4ykYWflntw2RL
	JUw+ratXM9aJGKdR9O7+SHLovHEKvv8FQumzfvYbHOBDgot2mlYHujiSKSv0olv7
	ptJvJitQ3yrcJP4J2ZK4eI2SEqdALVXKXHYTvLnJYSP9vJrI7UozaI9PxeRAu80I
	R8PZaUL6WFII/Usg/g8fpuzkW+vAxasbaQXOAXC2BMOhfBXnI5G3fLjCx4zNFDCM
	nLWm0j18h/nG2U8CD6fb5fM7fWcIK4HqolLr5UZd5gu9vvxG1gbVqt1M0U7Wb1JY
	NJjd3A==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5vgu3k0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Feb 2026 01:49:06 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-896fe47cab0so61189156d6.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 22 Feb 2026 17:49:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771811345; cv=none;
        d=google.com; s=arc-20240605;
        b=AWKn23O9sceF7dcVlFsy+41QA0fJQ4cWULPDSkro2C53WvOyQPFkCNSqcbd7akuG57
         2KZFUCjB9HXA/YSUG4iTUHjlpJfDf6tW1hE71Be5qn5d5qiibOOgfI1IpHW6Ys8xwS2Y
         KsVk/nel3obzfLZwIe9bUA9Jz9WrB0QjeP1asXhRK1cbhyUPmsnTxAh58T2GYZTt2XbT
         IsqdAhxiJSs+Tm+IURtWfs32Bf+CwZX316HXX5qeXmpcoW3sdvONH3VdDQ/KEg3uhZ9b
         4FO85G5GPCNszAPON1Cz/tII0k5bBK84mTyQFFQXIOJkPPlbnII5c89vE2xzFdxcWomJ
         8OYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cMC9augAA1n7nMHdDaofuAEWBRyByvRycHxMjaJMIZk=;
        fh=GNsPzXIzUSG4Q1MiOxcUGg2D/jUDUDBQ2b4ruh3zuOI=;
        b=Bcg4s2eeiLjUUpudMezBVE/PyYUQ1xz5IR/+ELjWr4Hdh53oN4tCOyrK+PvpX7uYnY
         GOnP9qOF2EGBv5qS15h+GavG2AMZisjBYNoLe31fLo7+5otQDBw5jK+OJE+pamZpf4Jh
         yhukvf7H3L/dzi58tiPysil2XUKnMDsNglfAQs8Rh1Kzix3uZeUeFDa78YPDJFHusGlf
         LeicKQ3+OJmMZdOIEIm36MK2H6GrPCDCPDGsTNlVRVGyFhgRoEVSyTU3HLl0rrTPnOuj
         8hvC2/7QoqzXMMI/FPm+a+wWZkOYMgbjxOwblRvokqaT0qmcVRMhPoZRDQLLDCKVMGCS
         Jmbw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771811345; x=1772416145; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cMC9augAA1n7nMHdDaofuAEWBRyByvRycHxMjaJMIZk=;
        b=K4eEmqAED0PV/QsiH/CwX36jc2nDb+O7upMw+V/8MGnZxLg+6De30zfjrC5VCDk/o2
         ezY62KEdsPDV0QSc9cPUrD5sH8NCXJMR0IiOxNT1i8vYwQji2dyHedAoCSVFBaULtu5s
         FzKFSBzb6wESnFMIRCqDgyn7f2OgDbHNwgPyipV2hWvF4VFo7dUb0qMX6mDCn+k0jdpx
         50tRM8vT9ZUrkiMllzE5XGVdHsoS9Kt9rvVxPMGl38fRPblRclCx08zMpWo/SDTRp84i
         wcqB68Mqt5ZGIrTsJej9pFDFdkBAq0FuzIIG6WcdTjxqY9Uqxh7M7/Y+vICW0l0Zgl59
         Eq2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771811345; x=1772416145;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cMC9augAA1n7nMHdDaofuAEWBRyByvRycHxMjaJMIZk=;
        b=C/3eCptcXZ2jtZ3NoiTppPt9b+7+V9yBTS2RMX4LvA0Md5aROWaqdVHgv4UZAOjxSm
         6BTYb0+3tRcE7PtzOcsTJ26dVc6TlXiihrn77Bk6a82k7ENVJbK1eEESmjIzb1JTHQAN
         Y9Mrlr1C5KN4IsgQDxahZ9sBQVQz+rLIn7FtYLW6+OxjOydjmxHpY3wIbfcBD+g7q7iw
         gXARuUf8+pMpIEk/CGUPnE3cIyYFc1Fxf/iP5jDRK7lNYqS715sGgGWsiRJeIDJa2cMd
         jE/rtCBexmfQPfm47Ifjf5NpQ0n0SgbPt2LVnFxQSycgC/7Qf52clCsEuCkfRIQ6bUAh
         sZ/A==
X-Forwarded-Encrypted: i=1; AJvYcCXQSGAhbUdWctpwLLC4VUBHc7+m0pcJzbjZ1VARNOOplJ6USsNAFu3rphb25oNjYCfQ0ljlpVckICE+mqmdpIhmKXU=@lists.openembedded.org
X-Gm-Message-State: AOJu0YxxW9Epxmud/bJra5t1UYlYL4bLruDRj6+sjgvg11sxkzYyvgg0
	gxL8YowNZj1Jqk3nS4YPz9UaWOhJqLtC9jj4sMmAeLgdf2ohuUrFY8R2JTA8YD3TqPhh3KKIax8
	vfzVTHcyuF/yDNlrbH2orPv+UovmqFcuZLyDg1qQ6WCSE9+RWPhj8LGPrIcSE/OyOSbdtLVqtK1
	BeLjB3sRYpHe9AZK+OAQwoqr517RMEqLvCl9RTNAdvL8jNVKPgc3TllrLuABo=
X-Gm-Gg: AZuq6aLKybEl/ZM1QVzZwH1lDP6vGLj4+t5m5pqI5wEoZaE4IyCjdLGDeoF4MBRXc/C
	YYvYTCURuny1ynNQA+EUOhK0PtA7wS/GvZmoq46nIDXW0oXpPVj6ASgC/dTzkAgFxt8wmC3CHjr
	tLQ4vPXm7NsWsEwvQlIZYSzB6qTqmY5kR2pxiHfmIKtPYfVoibr5LY4ArOimnLyBc+Cu37cePym
	qcZ
X-Received: by 2002:a05:6214:401e:b0:895:1b71:1276 with SMTP id 6a1803df08f44-89979dacc3bmr107007156d6.67.1771811345345;
        Sun, 22 Feb 2026 17:49:05 -0800 (PST)
X-Received: by 2002:a05:6214:401e:b0:895:1b71:1276 with SMTP id
 6a1803df08f44-89979dacc3bmr107006906d6.67.1771811344863; Sun, 22 Feb 2026
 17:49:04 -0800 (PST)
MIME-Version: 1.0
References: <20260211120025.4190831-1-ankur.tyagi85@gmail.com>
 <20260211120025.4190831-8-ankur.tyagi85@gmail.com> <CA+s=J=zMxXHgnsua6gXT0T6X7ZQPioAH53uu6K=WnkmNtmnhBQ@mail.gmail.com>
 <DGISHQI5DDPV.2BHEPKY23Q3VH@smile.fr> <CADySD0FrCrza-8-Qvv8dWA9rXFkv=OkgNwO-Pof8efCrEWdXgg@mail.gmail.com>
 <cfd43b84-61a3-41ba-8931-42d2ca77c44d@gmail.com> <CADySD0HMEs5e9aQq7fKwtjhSFrc4orJ0r46vWAaDt6Hpk+8kmw@mail.gmail.com>
 <8f30d396-53c0-4aa0-af90-914b9e7eb1aa@gmail.com>
In-Reply-To: <8f30d396-53c0-4aa0-af90-914b9e7eb1aa@gmail.com>
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 09:48:53 +0800
X-Gm-Features: AaiRm527b43yTblVj6rA82ymuFA9HDp9ChAt-kQrXI80SwN90NVwkYzL3YqcV9c
Message-ID: <CA+s=J=xyVZFGpwnBBvO_cvuN2FcAgO2sWJRg7E4L-z_J__Rpuw@mail.gmail.com>
Subject: Re: [oe][meta-oe][whinlatter][PATCH 8/8] tomoyo-tools: update SRC_URI
To: Gyorgy Sarvari <skandigraun@gmail.com>
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
        Yoann Congal <yoann.congal@smile.fr>,
        openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDAxNCBTYWx0ZWRfX0L8rwlvBsIcy
 ZwJu6QtVkbRI7X7zzpD3dYLXqNSa1BsyZ9vZcnsEcml8cUR1AUy0U0IbCvICRL4JrRWDVfao8Ed
 XDwSj+roWKIxOBNqCO665LB5n8oI1hGAmvP2LpVIYZjhO1uMmJHxAqH5r84Lo62B5loPiuKVzGg
 DZvDVoyBWhSRsWaJqzNydQwXywVWWTswCerWHou0dwKsFN+J+4UmwLNs7QKZ3ko3n//FZCFOMqr
 bcFtZ3dDPu/n5zJ0GMGQeTxcQ/83G3ndte03RNFxQoRrTaJhKcb1NbYMvEfKeoFzTfBLsJIJBqG
 Qj1T8bFkdrrFTf/2B7hUA2M2tvqVTXdJbc1SqU3qsnzjidT4v/+CSJnOn8jYozClLvdeSbtzLW7
 /Ep31gKRjKCfqyp2tPIXE9+P67qIFXXKZrbTUIh7//70Bx0q+Azsow/WZbrKhl7WZ4690VX1ejc
 1J4XW67/8ZMUC8GAydQ==
X-Authority-Analysis: v=2.4 cv=W+A1lBWk c=1 sm=1 tr=0 ts=699bb212 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=dnEwNotGAAAA:8 a=pGLkceISAAAA:8 a=Q4-j1AaZAAAA:8
 a=es6xOLSJI57TSsQs9YwA:9 a=QRzjZtwMIBQA:10 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-GUID: XZkUGOD84VhbFBNfqpGWtAsya4BjAgyK
X-Proofpoint-ORIG-GUID: XZkUGOD84VhbFBNfqpGWtAsya4BjAgyK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_01,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 spamscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230014
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Feb 2026 01:49:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124538

On Sat, Feb 21, 2026 at 3:48=E2=80=AFPM Gyorgy Sarvari <skandigraun@gmail.c=
om> wrote:
>
>
>
> On 2/21/26 02:38, Ankur Tyagi wrote:
> > On Fri, Feb 20, 2026 at 7:45=E2=80=AFPM Gyorgy Sarvari <skandigraun@gma=
il.com> wrote:
> >>
> >> On 2/20/26 04:34, Ankur Tyagi via lists.openembedded.org wrote:
> >>> On Thu, Feb 19, 2026 at 9:19=E2=80=AFPM Yoann Congal <yoann.congal@sm=
ile.fr> wrote:
> >>>> On Thu Feb 19, 2026 at 4:04 AM CET, Anuj Mittal via lists.openembedd=
ed.org wrote:
> >>>>> On Wed, Feb 11, 2026 at 8:01=E2=80=AFPM Ankur Tyagi via lists.opene=
mbedded.org
> >>>>> <ankur.tyagi85=3Dgmail.com@lists.openembedded.org> wrote:
> >>>>>> From: Ankur Tyagi <ankur.tyagi85@gmail.com>
> >>>>>>
> >>>>>> The previous one became inaccessible.
> >>>>>>
> >>>>>> Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> >>>>>> ---
> >>>>>>  meta-oe/recipes-security/tomoyo-tools/tomoyo-tools_2.6.1.bb | 3 +=
+-
> >>>>>>  1 file changed, 2 insertions(+), 1 deletion(-)
> >>>>>>
> >>>>>> diff --git a/meta-oe/recipes-security/tomoyo-tools/tomoyo-tools_2.=
6.1.bb b/meta-oe/recipes-security/tomoyo-tools/tomoyo-tools_2.6.1.bb
> >>>>>> index f172168335..a90a33ada4 100644
> >>>>>> --- a/meta-oe/recipes-security/tomoyo-tools/tomoyo-tools_2.6.1.bb
> >>>>>> +++ b/meta-oe/recipes-security/tomoyo-tools/tomoyo-tools_2.6.1.bb
> >>>>>> @@ -5,9 +5,10 @@ being useful purely as a system analysis tool."
> >>>>>>  HOMEPAGE =3D "http://tomoyo.sourceforge.jp/"
> >>>>>>  SECTION =3D "System Environment/Kernel"
> >>>>>>
> >>>>>> -SRC_URI =3D "http://jaist.dl.sourceforge.jp/tomoyo/70710/${BP}-20=
210910.tar.gz"
> >>>>>> +SRC_URI =3D "${SOURCEFORGE_MIRROR}/tomoyo/${BP}.tar.gz"
> >>>>> How do we know it's -20210910?
> >>>> Also, please put add a downloadfilename containing "${PV}". If not, =
it
> >>>> will break the mirroring test at the next upgrade.
> >>>>
> >>>> Thanks!
> >>> Thanks Anuj, Yoann.
> >>>
> >>> Let's drop this patch for now as existing SRC_URI seems to be working=
 again.
> >> Is it working though? When I visit it, it offers me to buy the domain,
> >> and the direct SRC_URI[1] gives me http 403. Is it geo-dependent?
> >>
> > hmm, maybe it is.
> >
> >> That "-20210910" comes from the original filename. IMO the full BPN
> >> should be tomoyo-tools-2.6.1 (this number refers to another software),
> >> and the version is 20210910, but didn't want to start messing with the
> >> versions with such an old recipe.
> >>
> >> [1]:
> >> http://jaist.dl.sourceforge.jp/tomoyo/70710/tomoyo-tools-2.6.1-2021091=
0.tar.gz
> >>
> > I tested with following SRC_URI which addresses all comments
> >
> > SRC_URI =3D "${SOURCEFORGE_MIRROR}/tomoyo/${BPN}-${PV}.tar.gz"
> > PV .=3D "-20210910"
> >
> > If ok then I will send v2.
>
> I'm a bit confused about this too... BP already contains PV, it's
> definition is:
>
> BP =3D "${BPN}-${PV}"
>
> Does this patch really need change?
>

I thought the original patch had BPN instead of BP. I just went back
to check and realized it had *BP* and the date appended originally.
Sorry for the noise. Looks ok.

