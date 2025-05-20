Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1111C3DA6D
	for <webhook@archiver.kernel.org>; Tue, 20 May 2025 16:08:03 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web10.24862.1747757279382352088
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 May 2025 09:07:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=VRhYiaRv;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54KDrYxR025215
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 May 2025 16:07:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ruyYrUSGzF5ZQcRWT+geapQXcSQhD0LKmJVxXUqgsnc=; b=VRhYiaRvofqq4DCq
	4hFcAbC8xNkMolq3cLF0eu/vFbqfQ/mPSD9b3QfIgzjGB5jetUY0SdKKl9czO1M7
	80YziJblU5/M2WYbvPyZYzbxLkgUK01PBiwCXdCOVoQmVRzgCxQU2IF1rM7s15zX
	awjIyIeBnbLKR0ltm7SjXEP07199XzdFiEY41NPObrN8nQXbG3mTA7IUrjGiKslB
	JPf8tKexWS8B3soxt/kYIhrAQW/IAoCVdvAqBhPqeuskqxPDJcQLvAnDL37ZlZFs
	VNGepAR2nNyxnvmZsLmq5Wi90kLeSVMGKiK+ZYjxATuN2nvKTjDAzgn+q3ld5S9H
	joDmcQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjm4r5t9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 May 2025 16:07:58 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-231d7f590ffso32018615ad.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 20 May 2025 09:07:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747757277; x=1748362077;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ruyYrUSGzF5ZQcRWT+geapQXcSQhD0LKmJVxXUqgsnc=;
        b=seMMbBqfMQXimga+srXdR/6YEAO7Ceuc0YnSwJQ2uEgXjW6k99oc/4EG4PF605K4NL
         u88UIG8tmyuE2xeoTZwIPMPm3XW2V7xzCB8+4fxR3MGltUQvEC8WfnW8SWAUxSpwyxRl
         dZ9xem8oFFRESh28Az/CaDTGcd/UJmcacEaF8s38y65/F+uTmukU6RG7/L58ayJ3MaE8
         J2L8zeKx0E2WoJOaRQQVnVuO2+NbTiQzPJusimANkGNDJ7/FyytKnt8JE9pBgxXGWn4O
         zHZxhQVyMkJZY0iNzWPpgt77u07XTt7PJKEI8k/WuwmSFEPy6Rm956/hxIsIvUhY0wcm
         kR0Q==
X-Gm-Message-State: AOJu0YyBwhZK0OyUYs3UzuChF6oP9GGDctLQCy7q6KmuBpAYjy+kQaqL
	6tCcZNR3W26eka5mAlJ66DF1AC/v9cpOXWXN+VmgDQ4tsCg4ZbrA7JGO5CcxWCHojSKY6TiApFi
	s5cYPjQRYdbSkgfiG8oT2oJDxCyerqgTVtW6vytQmpfnC7cb6j6ZycamogS/PzAi2PDPRRmWXWg
	nwB+9LfwTFLfXO/opcuI/nw2iiTbwg3xTMD0iBx20pZobRZgAznyVZ6v7miHk=
X-Gm-Gg: ASbGncuGgk/c76d7WRAYt0B+E81UyWp3/30enl8XpxPkMqHi5obtWzwqeWUmSlXiIxC
	WzsQVHC4e65gdEa4IhgNZ3LEOXCMTYk/T3a1+qDew+7O3f5V+SJOQgqQBdxTFnmCGyb6r8w==
X-Received: by 2002:a17:902:ecd2:b0:224:2384:5b40 with SMTP id d9443c01a7336-231de31b3dbmr271000065ad.24.1747757276847;
        Tue, 20 May 2025 09:07:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEwH4yC+xcIsU878plR/eGf0FVLI9BE+oeVSQb2SLYGO+Mj+xTPYk4lh2f5xU0NF4MyYUOGAvCp1YbZEQaaxFU=
X-Received: by 2002:a17:902:ecd2:b0:224:2384:5b40 with SMTP id
 d9443c01a7336-231de31b3dbmr270999675ad.24.1747757276377; Tue, 20 May 2025
 09:07:56 -0700 (PDT)
MIME-Version: 1.0
References: <20250520160418.814173-1-dmitry.baryshkov@oss.qualcomm.com> <CAMKF1sqy1pMCvotLvX=KbCKbjJ=WRVhRR56zBhfDoOokNXiz4Q@mail.gmail.com>
In-Reply-To: <CAMKF1sqy1pMCvotLvX=KbCKbjJ=WRVhRR56zBhfDoOokNXiz4Q@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 20 May 2025 19:07:45 +0300
X-Gm-Features: AX0GCFuoGarZZu1oBCm3HrUQTesbakH28uytuM-M1j5hnj9mG5l1CujZuAKG7PU
Message-ID: <CAO9ioeWXnyshnpE+HjMSRhf69JLp-KZnQrB_SgAUDEsGqvJpbw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] libglvnd: provide virtual packages
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: lwB54anoCJ_YmEw89WmHu80NpTri9tMb
X-Authority-Analysis: v=2.4 cv=C4bpyRP+ c=1 sm=1 tr=0 ts=682ca8de cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10
 a=pGLkceISAAAA:8 a=Q4-j1AaZAAAA:8 a=EUspDBNiAAAA:8 a=TSrQqJOe40id6pqLfewA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-GUID: lwB54anoCJ_YmEw89WmHu80NpTri9tMb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDEzMiBTYWx0ZWRfX1d1cxQQ9TORM
 PPkeBCoLw3EoqvkxvM0HxEMlEjTHnWNBsF5uNL9OUluAwuKGm4Twhw7g9VET4lYEfs1WFCO295g
 GgSJO2rYTCEL/ArIuAn6SZS5HYfZvRztFZYd6/jYOGKSkNaQcj+hF9mR2k0eCnsY6HWtTU9S6bn
 BYTFnuatudOxIq0uFZd4NiBe4DPbV+HI2jvKmsN8YS2ibSNzj+KMnR6E/Mzu/XEqZqmhzfbRXWh
 nHQjIIGxQdYt9Q2TDtzAH/8KYAz1XVdwtZG9XylFIr75EWLQbI0cqfwWgmYdp3JT3BQHKO6fK7r
 PDtGxke50vwiBUp9AzJEaoYkCL+E7e2LPLjM0tNiCjQLKfb6M/7Q8SFhp8sr1VYJOS1N0/dwTe5
 ilyV8F801woADrRy0HkIcqORkk8p2iVKru0k1B3/C8FqL/okLUuGSwBiy5RwOsDb9Bed76v1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_06,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0 adultscore=0
 mlxlogscore=999 spamscore=0 lowpriorityscore=0 phishscore=0 mlxscore=0
 bulkscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505200132
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 May 2025 16:08:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117517

On Tue, 20 May 2025 at 19:06, Khem Raj <raj.khem@gmail.com> wrote:
>
> On Tue, May 20, 2025 at 9:04=E2=80=AFAM Dmitry Baryshkov via
> lists.openembedded.org
> <dmitry.baryshkov=3Doss.qualcomm.com@lists.openembedded.org> wrote:
> >
> > Add corresponding PROVIDES in order to let libglvnd declare that it
> > provides corresponding libraries.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >  meta-oe/recipes-graphics/libglvnd/libglvnd_1.7.0.bb | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >
> > diff --git a/meta-oe/recipes-graphics/libglvnd/libglvnd_1.7.0.bb b/meta=
-oe/recipes-graphics/libglvnd/libglvnd_1.7.0.bb
> > index 4094aa4fc613..53f422aff1d2 100644
> > --- a/meta-oe/recipes-graphics/libglvnd/libglvnd_1.7.0.bb
> > +++ b/meta-oe/recipes-graphics/libglvnd/libglvnd_1.7.0.bb
> > @@ -28,3 +28,10 @@ PACKAGECONFIG[gles1] =3D "-Dgles1=3Dtrue,-Dgles1=3Df=
alse,"
> >  PACKAGECONFIG[gles2] =3D "-Dgles2=3Dtrue,-Dgles2=3Dfalse,"
> >
> >  BBCLASSEXTEND =3D "native nativesdk"
> > +
> > +PROVIDES =3D " \
> > +    ${@bb.utils.contains('PACKAGECONFIG', 'glx', 'virtual/libgl virtua=
l/glx', '', d)} \
> > +    ${@bb.utils.contains('PACKAGECONFIG', 'gles1', 'virtual/libgles1',=
 '', d)} \
> > +    ${@bb.utils.contains('PACKAGECONFIG', 'gles2', 'virtual/libgles2 v=
irtual/libgles3', '', d)} \
> > +    ${@bb.utils.contains('PACKAGECONFIG', 'egl', 'virtual/egl', '', d)=
} \
> > +"
>
> Is there a corresponding changes/documentation update required to
> reflect it in Core for selection

I'm working in it and will post separately, as it concerns OE-Core.


--=20
With best wishes
Dmitry

