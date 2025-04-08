Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62295C369A1
	for <webhook@archiver.kernel.org>; Tue,  8 Apr 2025 10:22:09 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web10.71843.1744107721663715954
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Apr 2025 03:22:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=WZgd2mMd;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5382GMqu014971
	for <openembedded-devel@lists.openembedded.org>; Tue, 8 Apr 2025 10:22:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AD64w7Wau76dEwWNcvKUnfl0r85Xadeca4bn7CBIlOw=; b=WZgd2mMdoiZcFGQv
	MOec5odITl8gbiEE4vKEEnsDVHkie+R8/4onO8/Q2BBWe9Cr0U53xr9S3HpFWSiS
	KO7XDLkXG356Wba3/6ATjsLeTX6Q8wHUKMFw036PWik2H8Eqs99BoApwHSlfjNeA
	4UFngyttFpfn7INQrb1113d1Lo0t4JGpKnLN9ZTKGW9amgM1LxsJJRibViRdZMOW
	6k+Ym8oB1E0vUfKUpV+UbDZN8PLZF/VfhNc+5Mu10TuKDdaFyyC0iQDFPnVOZV9Y
	UUUVJujNttO7y2KMAkL9v3N1SUwdepsdzhKCChIbNaW6AoqmW1w4c0wr9lb4ZxeU
	dW5Jig==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twbufe2b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 08 Apr 2025 10:22:01 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-227ea16b03dso76768645ad.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 08 Apr 2025 03:22:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744107720; x=1744712520;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AD64w7Wau76dEwWNcvKUnfl0r85Xadeca4bn7CBIlOw=;
        b=rcVyBNZ752+LjqoQR/cSxqiQ6reCrzAJupoqUe8JdUE5DwLWm04MJ+mf91XpCVKHTR
         4XX5z4llGISvWcKr1uNhKEkD7A/Dqji01nMzYY0HZbfk0HYrw21fcQOsiJhYmGCoGXOX
         LLrjU54oSnXjc/Bj8cZfTXdstJIeThHMcGSxjQmCBZLvbfV7M1CjJCv8geQ4DYn7uJwZ
         KAvhAtnPInWDvLcpXsnhgVcIFVdhHHw3JemDdzOSYpkyExH4za/yRJGIuU1fiDuPXmC8
         zL+2OY+BTkT6B5hrmseP2s7d87tB7tV4y5aCyIM26PCKP9cXRQbjV5ILJkJqH4iH5WNc
         B+GA==
X-Gm-Message-State: AOJu0Yzde/dG+IrZVCUIewnLB+0AGAVi5vmAkAOngnNf2PIDLPUdKWxr
	PCsqrZU5/P6LmXazajPHageIf8EjIx6L33ZFSoJrCnYblx/v+/KvZJvWCGsbosUk/pD+9zNXpF/
	xk8aqNSPFqKH3XLZ/hVL/DOux4UUsw5m8tmll99VmMNYrnwj6AlH2FfEgqubpfIV0kTPo3dnOEZ
	p9CcPf1jwY0lkecFaTidoAmX6fE2A6ovbZ1AVrk/ywpWvvo8Tz1CX8/dc=
X-Gm-Gg: ASbGncubt0SgizsrBvHW//jG97Wvw49ArwqZkzU1/DFaMjwe29OvE4pOJmBdJiJ1a/0
	INu129R1XSsv7P2Rkjyc/dpRaXf1WuK6amv5gSzoBUSFgrvfDwu74gvjbYhh+IWdM2mQI5kC+Xi
	doTtwn+DkXwwjYJ/upFbkB/VXmtdmv7g==
X-Received: by 2002:a17:903:2308:b0:224:1234:5a3b with SMTP id d9443c01a7336-22a8a0b4979mr213010055ad.51.1744107720281;
        Tue, 08 Apr 2025 03:22:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGXhmYBMhtx6wO8wsCsqbSS7mv+1QnhWxZr9J9AeW+v36q79YTIam1d1QGEHXgDQuiYCBNld6W15zm5poM8BLI=
X-Received: by 2002:a17:903:2308:b0:224:1234:5a3b with SMTP id
 d9443c01a7336-22a8a0b4979mr213009845ad.51.1744107719929; Tue, 08 Apr 2025
 03:21:59 -0700 (PDT)
MIME-Version: 1.0
References: <20250407095355.3461559-1-dmitry.baryshkov@oss.qualcomm.com> <CAMKF1srrJK5OnKo1t02JdGBs1rzQ=MLZAW_WA7gpCA7G5Cza3g@mail.gmail.com>
In-Reply-To: <CAMKF1srrJK5OnKo1t02JdGBs1rzQ=MLZAW_WA7gpCA7G5Cza3g@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 8 Apr 2025 13:21:48 +0300
X-Gm-Features: ATxdqUH9VaHBEWbYr4W1GOu0u6kizZqZ4luN57LlQ-OLxofzs9nNIcbgKOJWZKc
Message-ID: <CAO9ioeW=GZD_iUHe+AW-CGmk6B6E-du+njYH9ULBQmJ662SCHw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 1/5] opencl-headers: upgrade to 2024.10.24
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: 0XGB_LPC8v4inw1KwjCoJL0hcUDw4Jw3
X-Proofpoint-ORIG-GUID: 0XGB_LPC8v4inw1KwjCoJL0hcUDw4Jw3
X-Authority-Analysis: v=2.4 cv=dbeA3WXe c=1 sm=1 tr=0 ts=67f4f8c9 cx=c_pps a=cmESyDAEBpBGqyK7t0alAg==:117 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=iGHA9ds3AAAA:8 a=Q4-j1AaZAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=NEAV23lmAAAA:8 a=zd4wtZ4tJHjzzGbb5EQA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22 a=nM-MV4yxpKKO9kiQg6Ot:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_03,2025-04-07_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 mlxlogscore=999 phishscore=0 mlxscore=0 spamscore=0
 malwarescore=0 clxscore=1015 adultscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504080074
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 08 Apr 2025 10:22:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116703

On Mon, 7 Apr 2025 at 22:17, Khem Raj <raj.khem@gmail.com> wrote:
>
> this breaks clpeak recipe -
> https://errors.yoctoproject.org/Errors/Details/851680/

It is required to update OpenCL-CLHPP together with OpenCL-Headers,
but I didn't notice that.
I've posted v2 which fixes this issue.

>
> On Mon, Apr 7, 2025 at 2:54=E2=80=AFAM Dmitry Baryshkov via
> lists.openembedded.org
> <dmitry.baryshkov=3Doss.qualcomm.com@lists.openembedded.org> wrote:
> >
> > Upgrade OpenCL-Headers to the latest release.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >  ...pencl-headers_2024.05.08.bb =3D> opencl-headers_2024.10.24.bb} | 2 =
+-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >  rename meta-oe/recipes-core/opencl/{opencl-headers_2024.05.08.bb =3D> =
opencl-headers_2024.10.24.bb} (89%)
> >
> > diff --git a/meta-oe/recipes-core/opencl/opencl-headers_2024.05.08.bb b=
/meta-oe/recipes-core/opencl/opencl-headers_2024.10.24.bb
> > similarity index 89%
> > rename from meta-oe/recipes-core/opencl/opencl-headers_2024.05.08.bb
> > rename to meta-oe/recipes-core/opencl/opencl-headers_2024.10.24.bb
> > index 8663b818e3cb..b47d3f9711a1 100644
> > --- a/meta-oe/recipes-core/opencl/opencl-headers_2024.05.08.bb
> > +++ b/meta-oe/recipes-core/opencl/opencl-headers_2024.10.24.bb
> > @@ -5,7 +5,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3b83ef96387f=
14655fc854ddc3c6bd57"
> >  SECTION =3D "base"
> >
> >  S =3D "${WORKDIR}/git"
> > -SRCREV =3D "8275634cf9ec31b6484c2e6be756237cb583999d"
> > +SRCREV =3D "4ea6df132107e3b4b9407f903204b5522fdffcd6"
> >  SRC_URI =3D "git://github.com/KhronosGroup/OpenCL-Headers.git;branch=
=3Dmain;protocol=3Dhttps"
> >
> >  inherit cmake
> > --
> > 2.39.5
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#116657): https://lists.openembedded.org/g/openembed=
ded-devel/message/116657
> > Mute This Topic: https://lists.openembedded.org/mt/112129617/1997914
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >



--=20
With best wishes
Dmitry

