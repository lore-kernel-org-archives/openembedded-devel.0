Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1445D6ACD8
	for <webhook@archiver.kernel.org>; Thu, 18 Dec 2025 09:38:33 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.38083.1766050709241936750
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Dec 2025 01:38:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=fy2eLjRQ;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=dU0cXEak;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BI9BVar527636
	for <openembedded-devel@lists.openembedded.org>; Thu, 18 Dec 2025 09:38:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xBSjU25nGUCbR2qYqvwdOHtsC3EU1iXTvUCeyF/H5YI=; b=fy2eLjRQgMFp1Bid
	wHzJyeJJEsz2bcHHzgjzdO+KM0CXzxS997qFj6SR4dAnZrA1BQLTCLN639oTF1eV
	Ie6XZd/nZ9Wh+CHX11N0Q7tCHdEr8C8RdIQQEtTzV3SRR4vaLBtkq6FeN+l3GH1i
	v5mBb2WupfmimkaaEeEZJbPE10oRMsQf4DSzIMePcVA5Tub1GG8t/UDqvtgtLDyi
	YluzzKAhaQzP2qCRG60cDkbMZOovSXJQRnZeUIJsl3r8Cii1Gh0ODSnfIu+/K9zU
	sgn0t1waWb1oy8pbq+OKAk74hWMliUt4qrs75hiDidlbSrwylgrkpXA4iLI2lQfh
	LOvYRg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b43mb21r3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 18 Dec 2025 09:38:28 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-88a3822c06bso10289326d6.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 18 Dec 2025 01:38:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766050707; x=1766655507; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xBSjU25nGUCbR2qYqvwdOHtsC3EU1iXTvUCeyF/H5YI=;
        b=dU0cXEakRLdyyb2d7ItGwv/uVhhWnaRwd4yzzMyt+GOz6DCXiM/J0c0BbdTQ/Z7t4x
         FWMtC06/Mu8w6/WiXsI8mKeLC2xF6DH2s0BhOw50cJtRrjqM9SKhp/AeJEe67K7F6iAo
         6fOiU86EqJEUq9u3qajs2Soe6oCYbLtrECNBB8OekKN1hxAAq/79+uR485IF4Op+rhpz
         ngAmgysVKpZKOxiVkx3n4SZcXM5Qj1mgZqBVeUxuVwN6wOD250U8RvKrhdbu4xQonzIP
         evdTZoT3IFCVD98gVlqzlqkJpG98J2WHuW2k13YFH33Mhol0K2eEkjDpOeRZEVlascrl
         nzig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766050707; x=1766655507;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xBSjU25nGUCbR2qYqvwdOHtsC3EU1iXTvUCeyF/H5YI=;
        b=gsEjjsyzgMS0EUUWSBFOBsOWIegAB/Fxkz1XHjAjCB9KR+y9lERLS1px/SIXLGlIZW
         zSJDIfzRHowpRPHVjL7SAx0NovEtoSvGHWmyfyLEovPw/l0BC7FZ7voIiozr3uPo2p3m
         A0HALBusL3vU8xf/vKfAeW9Zp5TFaGo1rcxjLasHlfYEd9MlQ5pvEV/oT2WH3aGYCtw/
         387xTvo/DjbIbHf/waIa9xA0eitbFJKhO+bSG5S8q0dYyyut26f0/DMkQXOuMWU22abw
         gjJLnk1sL506ZD44iYuwR8WtNOYFvntaLbz3zQx0Qqm8NxFn1dRUdfclMDmTh/Vs1xOc
         Rokw==
X-Gm-Message-State: AOJu0Yzs9TgFAiEjd290TuVWkPzCdkANKufZJzVGo3INdx0tX/fGN2WM
	3jzw8/McgOBdQNyg0wtVxlMJgY5P3m1CAZ7waHcmcLwx9rtOf7aBirzS1vVTcTtO8jmHVF7t9y/
	c1b3TLaz8Ry0mURx4i2rlUQG9BlIUJyjxsbj3fzq1ZkyQRW6+T1lRnYWMlO17lVgUW/UpfXBquw
	poe5RjnjLl4yF6aZUeatz8AyBIQd4Dqr4i6v1c8vylWQZ8mUKzC1jJEi+KvIg=
X-Gm-Gg: AY/fxX6tKtdwT4No6YZayCUnIr2zxPzM1U6d+EIXNyXBlL1hTe0ZRBJDUK2NfC80flm
	9lSQ8Jg1eNYr1GksyxBbE+ULT/HL5s6jAVfuKxXAfT1NkUTuWmQLmltMZAhrpGuRphJcYHBdmPn
	k44UTdJUF73Y3q3LQ7SFwAeFgcbFc+tL70uZQQarnx11Yf4DdmYsWMvO10PX11fyCm
X-Received: by 2002:a05:6214:410:b0:7e3:cc6e:3c89 with SMTP id 6a1803df08f44-8887e142cb6mr348109816d6.56.1766050707571;
        Thu, 18 Dec 2025 01:38:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGvOjAQkomfBC1WTOvU4woO1ktGfPeTEcm5aorTJZB0n9cQBa3WfWoDDOdXbQ/aey2OQlnpUIZmo1imgPtseVU=
X-Received: by 2002:a05:6214:410:b0:7e3:cc6e:3c89 with SMTP id
 6a1803df08f44-8887e142cb6mr348109616d6.56.1766050707139; Thu, 18 Dec 2025
 01:38:27 -0800 (PST)
MIME-Version: 1.0
References: <20251218090346.735-1-wangmy@fujitsu.com> <20251218090346.735-19-wangmy@fujitsu.com>
In-Reply-To: <20251218090346.735-19-wangmy@fujitsu.com>
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Date: Thu, 18 Dec 2025 17:38:14 +0800
X-Gm-Features: AQt7F2pS3YzDIwmG_unJErFLOW2gPMZ3G-OkPEzLcgudtG6iwqlFfAkeIHKu0gE
Message-ID: <CA+s=J=zXeL67LZ3ekKBg4V1FdFvFjK+=ntCvZ0jk2EjpcQaCfA@mail.gmail.com>
Subject: Re: [oe] [meta-oe] [PATCH 19/20] switchtec-user: upgrade 4.2 -> 4.3
To: wangmy@fujitsu.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: RhbNh3fSGVRGgsKkKPdH-fk_lyZb9aMS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDA3OCBTYWx0ZWRfX+5djuwJ46hvc
 dCxTPQoZufGdKeqdHu+IPXcH2VK5JQi63x6Wda9u4iBEJlJIPLeNNNLEK+M/3HfgZYiNqN+k4mh
 3Q1/z60qnTERxy8pjM3qkex+/3s+mPFqaVjabWT8uJ8F9lu/uNHsMHE2gQweoZLPFz4nX/9gABK
 NpYyZ865VlRFOjARiouxUNF20SnxAyZ7bca6RseKnqVItvIXr3DwQfDQ6Wq4kvPccrOoRjumJ3w
 N7OgFLHSf6u1WS1N5rIoaXM9nysLKekPCQQgB4/Olkxdz17qhtHtbvYYiRErnlVrJFvbX4VBHpO
 eM5fVGgYTlOHbS5uCb/gBZwXoBL/QGwSAt2jc2GOQEin9rXDypjX15D+Dcue0/iw/AuwqQu4mBA
 vpwIQBgc3DY+s7fShYRFlyog9096tQ==
X-Authority-Analysis: v=2.4 cv=NPHYOk6g c=1 sm=1 tr=0 ts=6943cb94 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Q4-j1AaZAAAA:8 a=NEAV23lmAAAA:8
 a=Jdo3DzekgPx81UizaAkA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-GUID: RhbNh3fSGVRGgsKkKPdH-fk_lyZb9aMS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_01,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 clxscore=1015
 bulkscore=0 impostorscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512180078
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Dec 2025 09:38:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122756

On Thu, Dec 18, 2025 at 5:04=E2=80=AFPM wangmy via lists.openembedded.org
<wangmy=3Dfujitsu.com@lists.openembedded.org> wrote:
> -SRCREV =3D "e7c351c6c722336b3c79b79cd002c7c2986eefb0"
> -SRC_URI =3D "git://github.com/Microsemi/switchtec-user.git;protocol=3Dht=
tps;branch=3Dmaster"
> +SRC_URI =3D "git://github.com/Microsemi/switchtec-user.git;protocol=3Dht=
tps;branch=3Dmaster;tag=3Dv${PV}"
>  SRC_URI[sha256sum] =3D "a715e46d8498418dbb8a2519318ba0714ee148151d7e4a7f=
a5e27770a2f6888f"
>

This doesn't seem right. How is this working?

