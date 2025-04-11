Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51F2EC369A6
	for <webhook@archiver.kernel.org>; Fri, 11 Apr 2025 01:08:47 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web11.14651.1744333723575612716
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Apr 2025 18:08:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@qualcomm.com header.s=qcppdkim1 header.b=m3p1ZkMX;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53AG11qc013861
	for <openembedded-devel@lists.openembedded.org>; Fri, 11 Apr 2025 01:08:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	51A3kYFRYZKR925Jx18hPIj+2L10mcpx2w6mYdjkbaQ=; b=m3p1ZkMXVZrLPG8I
	EZI/dPBn5umeJ2yqqpGjeossOZbX4whxnDRWzbrMWRNtYblQwBpzJbYVquPHAZMe
	5BTP9nJ4nw6LFfkoyG/6ZuB7VWFvpcuEIcmbLZXokxT8gnGDADtFAZUg0RNUUJWi
	SoVnX050gcFFbi30ry3QwAe/pqCwLXGhyd5JEi5lLDKoNcGeCW10vP31FEfgwR3g
	UaAFDy9g5PU3CXsjS629IYLSY6uxkvqH0OuZHn/98fHvxgFkN+b9ycAKT8MHZyYQ
	PQByOz1NX646xTzjyghiYsu4wFPVwyJiXkLyfM+9Ix64ZqHbeH0HPDdnGuARLfMK
	yuxzEA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twbegswu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 11 Apr 2025 01:08:42 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6ed16cc6e39so22663836d6.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 10 Apr 2025 18:08:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744333721; x=1744938521;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=51A3kYFRYZKR925Jx18hPIj+2L10mcpx2w6mYdjkbaQ=;
        b=v87XkBKRKP04ogU/ReJh8TrgEGvRWGWx4pp0qWAFzQsR6YQk1OMYljgUstPn6gA31I
         VpTCK6pl+3P4j3g5n2PWi/dT99Bd3ciDlgMi1+CWwDsOLzVFi/pJwniR9KxtFYUYXrjt
         Tr3uFaD1mBKVI2uOieY2evr8YxlDQrUTBmpWOdwxwsUpNqVGzeui5lLOar4GdH7zrkWw
         IkgPCJVTH9rmBmHMu0M6tmAYH70VT10GCxAG6AEXtdb1B9OhYSvhecjFfQnGBpmmdjPE
         aMyZsh+WjxAJ/KLTMsOjFwtlw28IT3jKrbEOcRhBnkKXLIZGzvFF7W+EjSePHYDwpHaF
         zlHA==
X-Gm-Message-State: AOJu0YxcWn2kDB4fttzm2DJitdL30fxmkUyVqqJsvHTrSEE2pBG6MQex
	k6+w1t6Dc03ilufbX4QVMrxbO731FAog0DP4CJSibRoYJe2Qfphomj9eNs7+Rg3XWJ2uPJj2MdL
	Hd+2zpJAfmjvf3aqHeuUqGOYNvjxUfa7T2bXVn8B8uuNiXQw1iVIJ4fm5CV/+KQVlmLmQ0VYZa8
	ys30Qj
X-Gm-Gg: ASbGncsJ553POT2jqjGzSbuJdlgKhlJbhT6nfFnDF3lrAbaZQUugVofzF773uKGFlUa
	uhEXRHJzHe6JDDWGPhSta7DGLAgsXDBjuDE2f5fIqpsVRbPsUX9F2MmsuA6NeCta72wwEvSbtMJ
	FXEmkihwxd82n9loaFQhR3JwWa13XiiTtmR2vmj9qg2TmTRg0koI8zQcJTrst0XQPfliUa+h9g4
	elCoz8VYPzPM6+735+7Xx5sqG20+Egs77bHqEDpmbkL2yEev++HweUYSNvY7H7U+FK9HC8wjYYk
	xU6vEmqIATgVRcB2zg5Iq/GCBVvpjoRATyo0idzVSo4TSkXwiF/qsTAVElc4Ateuq23/0/B50N0
	=
X-Received: by 2002:a05:6214:b62:b0:6e8:86d3:be73 with SMTP id 6a1803df08f44-6f23f14fd7bmr12323176d6.37.1744333721501;
        Thu, 10 Apr 2025 18:08:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGTv/ShbuwTmO/M0Z4ySLMX1OEB4hURw/BSXPImqpRTBmup2gMmqMdtzxLNcbkNSfqW28lRIg==
X-Received: by 2002:a05:6214:b62:b0:6e8:86d3:be73 with SMTP id 6a1803df08f44-6f23f14fd7bmr12323006d6.37.1744333721177;
        Thu, 10 Apr 2025 18:08:41 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f46623c2bsm6539331fa.111.2025.04.10.18.08.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 18:08:40 -0700 (PDT)
Date: Fri, 11 Apr 2025 04:08:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] [meta-oe][PATCH v2 1/5] opencl-headers: upgrade to
 2024.10.24
Message-ID: <sud4ol6zbubhjvcqnkpiej26a5qgw5wr6vu7cv475ejvtd4o6v@ochwhargyqkd>
References: <20250408102058.2769630-1-dmitry.baryshkov@oss.qualcomm.com>
 <vcqsx7hy5jlmcwwpq5vbydou6k2yehxjxv7nsnqm2iartl7kn7@tshogi7vdy5b>
 <CAMKF1so7xdVHgWo6sPZ+GwZgrAL-c+a2Ws0LO4saYT3a6c09+A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAMKF1so7xdVHgWo6sPZ+GwZgrAL-c+a2Ws0LO4saYT3a6c09+A@mail.gmail.com>
X-Proofpoint-GUID: GvsY3yG4AbrHnzcemD2UKeoinpiC9Dbv
X-Authority-Analysis: v=2.4 cv=T7OMT+KQ c=1 sm=1 tr=0 ts=67f86b9a cx=c_pps a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=Q4-j1AaZAAAA:8 a=EUspDBNiAAAA:8 a=Oh0VQQrMb95tE7VEhDEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-ORIG-GUID: GvsY3yG4AbrHnzcemD2UKeoinpiC9Dbv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-10_07,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=999 lowpriorityscore=0 adultscore=0 phishscore=0 bulkscore=0
 mlxscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504110007
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0031df01.pphosted.com id 53AG11qc013861
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 11 Apr 2025 01:08:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116787

On Thu, Apr 10, 2025 at 05:35:38PM -0700, Khem Raj wrote:
> On Thu, Apr 10, 2025 at 3:05=E2=80=AFPM Dmitry Baryshkov via
> lists.openembedded.org
> <dmitry.baryshkov=3Doss.qualcomm.com@lists.openembedded.org> wrote:
> >
> > On Tue, Apr 08, 2025 at 01:20:54PM +0300, Dmitry Baryshkov wrote:
> > > Upgrade OpenCL-Headers to the latest release. Upgrade opencl-clhpp =
with
> > > the same commit so that they stay in sync, otherwise projects using
> > > clhpp might fail to build.
> > >
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > > ---
> > >  .../{opencl-clhpp_2024.05.08.bb =3D> opencl-clhpp_2024.10.24.bb}  =
| 2 +-
> > >  ...pencl-headers_2024.05.08.bb =3D> opencl-headers_2024.10.24.bb} =
| 2 +-
> > >  2 files changed, 2 insertions(+), 2 deletions(-)
> > >  rename meta-oe/recipes-core/opencl/{opencl-clhpp_2024.05.08.bb =3D=
> opencl-clhpp_2024.10.24.bb} (91%)
> > >  rename meta-oe/recipes-core/opencl/{opencl-headers_2024.05.08.bb =3D=
> opencl-headers_2024.10.24.bb} (89%)
> >
> > Khem, gracious ping for v2.
>=20
> Thanks, it will be in master-next tonight, I was holding up some
> patches for clearing up walnascar

Ack, thanks. Sorry for the noise then.


--=20
With best wishes
Dmitry

