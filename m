Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E52B9CA5FF4
	for <webhook@archiver.kernel.org>; Mon, 19 Jan 2026 06:54:18 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.30677.1768805656272087710
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 18 Jan 2026 22:54:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=c82ZK3fW;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=EIw7fASS;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60J1dLUl4133881
	for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jan 2026 06:54:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F5sz0rYpaW1GhtM0cknx2v+BCCUCom4DBplpJIbEsgc=; b=c82ZK3fWQuS3U0y1
	30EDFzPfb3Re4X+fiWeKQqRNXGYKTrIngYT2bYbuDMO3QNRdKr0LDQ1ShcP5i0ae
	LTqkZpnEgV7iI9UIj/SP8ZAQKmvWU7HQygcRKXiSNQjRH93zT1c3g/zPx0R/BZK6
	JNteHIZ7ovVvJP2wlzPUcMNK9A26+hl992VgmFgFrFqZqVbZ8osaXq5ycmNX2GAl
	8OttlaZukc/wV4yC4EKEaY43yBHjvUY8ZANl0b4hQUz1iaC3xGerPEIPOW37vUg4
	6IzYLGXs7Ifk/XWh/GNaiue0eTwGg0z0+B/7c8Cq4X2jDHPJv/lUy8hvDYhWK9AE
	TbrRTQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bsb4yrqc5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jan 2026 06:54:15 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-88a360b8086so100569996d6.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 18 Jan 2026 22:54:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768805654; x=1769410454; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F5sz0rYpaW1GhtM0cknx2v+BCCUCom4DBplpJIbEsgc=;
        b=EIw7fASSSsPd3iOFluQS1G2V65BbICRuQJlvYBIVyVTjyLKnw9IfUfqoCPc9YnbkQ4
         MzjO6SaPo6GOwizChpvl1dCP9LFM9x2kW/3WWAOq0o/zO377ePVOAcIdgA8ROxWshco7
         b2BZvqBJeC9hbqKjLvXn06GZbKdQmKJdHd1xnE+81dG4IESTMW8Kl8w9fiLDl9wqJAFW
         Gh1D0YOVbPj99FAI2ipvkpf6e59J1z+Sdk02z2FcGtBiMFB4o1pkzmA1W4q9udGmxUc/
         h6ZB8jOLsOYGhVsSvhfVTZR4DugPsULhgaT9V3UZZLRxGERkiAJxEBsUkVzof3/uhDEU
         nlPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768805654; x=1769410454;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=F5sz0rYpaW1GhtM0cknx2v+BCCUCom4DBplpJIbEsgc=;
        b=ivyEG+U7tdwnMYxDlqBbNJkvQsXtdQZOqt4ty+D8UgQxr7RytB5cmBzeMfbJKOOT5p
         jG8usLbPmrApGJjQW3byjIx72OZEYGnvT/CvImTnKJCep7u1F8TzMVRf68tIP9r/moLt
         GQJr9+s9zLXzam6m9zwejNUGEQ0IAtcrMseijBrQWD7B96TKlGWCEUXCpcZ9Q7CVMG6R
         SD6IZYhqIwxmQDnWXxi3X02asKFXdRa9TIVdVDBZg9iQe4OMIjqdCchPjoFWHcJ5sRiu
         7bblEb9akS9+81s/9MEHTyegsjli38IXaiioFZSTR3OqfW+xZG0mX8DBeb+G2VdlVBXb
         PrxA==
X-Gm-Message-State: AOJu0YyW8LjmyTDjaepvZul8Hloq7kbiAnBGSYZLMCkTJCizQQtk5vpG
	LffUKWtaiMyFoqACtPNAUuhFa33cyxRZg6Y4ZueGE8QZuckvr3JG1RyDPbLxVePu3n0Mp8ZdFJw
	Fb/GChyJSi1LWX2PHOyfbCyin8nBxO7c/3cjnh+VKXTR1Yu7nQ/G3Hezxupuyzv7T0mV3O/SRsN
	MDN0iFBkkn20dvU3vWnexw4qck0uWmq8Tuh28TjUyoNbC8E1l3R5c1pCYSyJA=
X-Gm-Gg: AY/fxX7Z8KCIRucWD11+C6mqrLmuNSrC/ifTbMOgEtx7Y0b3YeXc2Ad1SoSQLjC8jeU
	KrDmq1iB+AzZEI+iYa2aJcgBBHb0YiN8zOoxWlcus5XYlv6TlrxKchCgBUwLNzAQRVcUOdVFRgr
	J8kjuJSKtkfCH0oc7tmKC4C2rFp8knwZgd+0Qh97RoImFwyV06B7SbKex4KCueHUzB
X-Received: by 2002:a05:6214:f0e:b0:882:8746:b047 with SMTP id 6a1803df08f44-8942dd0630dmr166159366d6.10.1768805654483;
        Sun, 18 Jan 2026 22:54:14 -0800 (PST)
X-Received: by 2002:a05:6214:f0e:b0:882:8746:b047 with SMTP id
 6a1803df08f44-8942dd0630dmr166159216d6.10.1768805654069; Sun, 18 Jan 2026
 22:54:14 -0800 (PST)
MIME-Version: 1.0
References: <20260114130100.1016416-1-ankur.tyagi85@gmail.com>
 <20260114130100.1016416-17-ankur.tyagi85@gmail.com> <CA+s=J=zLE43Ox920AVAeStZTQuJ6nL=Un6HCpb9g0eZiDUG-UQ@mail.gmail.com>
 <CADySD0F8qVgnTOGJxmeCZ77t=k4abqCHGLAxEy=J6TtEcofwEw@mail.gmail.com>
In-Reply-To: <CADySD0F8qVgnTOGJxmeCZ77t=k4abqCHGLAxEy=J6TtEcofwEw@mail.gmail.com>
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Date: Mon, 19 Jan 2026 14:54:03 +0800
X-Gm-Features: AZwV_QgsCvo8rWbU1skgZ-wQd6Pi5qzM5pKZ_kY7sE-5AK59foq0vsDbLpCu7Z8
Message-ID: <CA+s=J=w8ZEt4xdt58=ZF7ZX+JjbU1m7cqG_QSR_VuTiom16i6A@mail.gmail.com>
Subject: Re: [oe][meta-python][scarthgap][PATCH 17/20] python3-virtualenv:
 upgrade 20.25.3 -> 20.25.3
To: Ankur Tyagi <ankur.tyagi85@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=SNhPlevH c=1 sm=1 tr=0 ts=696dd517 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Q4-j1AaZAAAA:8 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=gbvC084i83YhKiymL8oA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDA1NSBTYWx0ZWRfX/ESk6uYapjwp
 +/h6kuGgh+2aw8cnl9CyhpKmzeRSYHAQfPpsUq/+RdQ7SwTLTsMBwv4TPHe3cK76U9ywm497LnY
 /UCA+otldcasmlvfFsVr/4Y+kBfR0zBTVMVOTVPyS5ebd9gkRm3s0pNyWCz5tWBqCchk3msnORj
 XK3KAjJf9t+lPU+BBVAm82Ws/Gm8PT7oQE6IwRIpcvw4YKsRMd+gS27dP7500fsDWhTpJn0OIqA
 Qx91LRkTtMLAfx0ukBqr+07yZLtQB+3aDss49zf7dtcKge0LAHt8e6Z4kiyoPztEw8rchi5LQP6
 zJRh5G6bOOgdlHL0JpZsj3s7LrSQcJGIHiPYXDta3Czw9WNFPTvL8QVHALh6/vPy8aUg6KYOU57
 88n/cpUreSYM70hEeRCvK9Qe2UbBiT/bx9+2y56QOzmAZwjTGmx7zxzOKZKvbHU3uwow3ceqq9G
 zB73N3v8JFhTWyspJ3w==
X-Proofpoint-ORIG-GUID: _Gcyxc3PLhVi7qJ0NT08cpwHHTsSmMTo
X-Proofpoint-GUID: _Gcyxc3PLhVi7qJ0NT08cpwHHTsSmMTo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_01,2026-01-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 bulkscore=0 spamscore=0 adultscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601190055
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Jan 2026 06:54:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123587

On Mon, Jan 19, 2026 at 1:22=E2=80=AFPM Ankur Tyagi <ankur.tyagi85@gmail.co=
m> wrote:
>
> On Mon, Jan 19, 2026 at 4:12=E2=80=AFPM Anuj Mittal
> <anuj.mittal@oss.qualcomm.com> wrote:
> >
> > Commit message says 20.25.3 -> 20.25.3 .. Please send v2. The
> > virtualenv patches in this series after this also fail to apply.
>
> Hi Anuj,
>
> Realized that mistake and v2 is already sent
> https://lists.openembedded.org/g/openembedded-devel/message/123477

Thank you. My mistake for not looking closely. I've taken it now.

