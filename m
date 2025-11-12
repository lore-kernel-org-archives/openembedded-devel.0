Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD022CCFA18
	for <webhook@archiver.kernel.org>; Wed, 12 Nov 2025 02:40:22 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3313.1762915218796818189
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Nov 2025 18:40:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=Zk7P8Iea;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=Gl5RRl4e;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AC2X3iQ2813765
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 02:40:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=SmWxi1EUSpUQk+/tJBIgo424
	oICeJFcz98t+T/UkrL8=; b=Zk7P8IeaeOm23gkV5HE8EUCp/1bv94JrXiDv1c1j
	Us5RIicj+XVbdL0bRO4mki1XvIqlMvVhpV8knprD/aKGW4bocHMNq9wrkG8IuIJO
	jATG4gB6kYs+LaprBklk4rW8AvIsjFLzel0stULCsfzL/FfuJwsUw4EmM8wGBLfR
	rBhxGupd6cwKlgwTE7qhp3hqVuXokrm18nN1lmsHMF2L9r6T4A12VJKvwhTkD2lC
	HD8xbx6IS8kqV5MO35PrdQij2dotq0k02QEKePiK9fEB/XVEN1lMpaDurjJorSWf
	G3ylRM2rKsyWF4yvRhh8taT4GOUrvkBlhnPKHhHsanMdCQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ac855hkwm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 02:40:17 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-88239fa9ec9so8778366d6.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 11 Nov 2025 18:40:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762915217; x=1763520017; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SmWxi1EUSpUQk+/tJBIgo424oICeJFcz98t+T/UkrL8=;
        b=Gl5RRl4ezQOS40TaVMxywEjL5QBXulgAFTnRw/ph3jf6XnL06fGBexMSVh0K77TgZt
         v3TXMOtcyydkMX2poNRmg3NCsrdzh5KJsBSxy8nZehDkMpSr7DPnjEhbZxi2jIc08o9c
         Qja+Z2UbhpjrBx09wy+6xUxpY1Bew4NK9hNM1oDfh+U0efktdtalg+houAEAAnD9qhof
         CLZbWajNLuG9JeZN4SHP1z4ybgrxkS/4aXOtpH1UgfyShOw+pGG9juyEDwULAtRwoD1I
         5c97o0pJIQEbAwFKRAfaa1cr6iIjwYoW8n/PVkjD3UtVDyKPDSDG8sMFPY7P2OeP6g+c
         Nx9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762915217; x=1763520017;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SmWxi1EUSpUQk+/tJBIgo424oICeJFcz98t+T/UkrL8=;
        b=XnIxYbzn31NE4xK+MwGyE81NOXpolSskBWFfco+P2ZyQU9Qk61f4DAt8OQO+rKSQjB
         P4T1K+y7No62XRbYgwzGo0nf3g0plY6B+LuoRv/8DbToZT9EqFKEKLg0vXZV8hCVA1OL
         XxYiSCGGMpGsWZZhpJ1QdBx8a6F2ui1A1WUA4iaQare8HMTEHctbHe7q8Pio677+IBhA
         cSublE8bVMG1XHxotUC5llEepGFGc+3RvpsgeqUjdfFQL515T9hHEF1BmR1ag8By0kF7
         xDBB3ACnSTAxxsPwAMiBsVc+PcP+mqs+PaUcW9pzMkdy6dW99cMyr2eANTnYuGMbOPB4
         xZdg==
X-Gm-Message-State: AOJu0YzXTf8xF4HO9fWxZo2V4R0usUE33cjMU6w4OfYiQ9U5Ce19sIy3
	woT9+eSri/9IPyzRIBcfNp1rktP1iM1bUQkSD3zVMSdlt/jDDfZqStnEoMrpEhsdfhzI9b/ix0J
	XyMN99EuHUkZXE88qa6VgRhPibfuq30E24Np1sEizDZej6GRyTi1vx+cIqazJRa2NVA8/uP7zlv
	NWhwumr1VRxy6+Q1Lw1+3kbdOrRVIpPE9e7iJLH3lG9/4RTSNTN2JL/SWUGP71rs4jlDcdPg==
X-Gm-Gg: ASbGnctgCtUbWzpt6iIOzNZ2SgWC9ixKIGQS9ImNz0SbKJl64cyDinTMCilSjACAWWk
	unybWbANMib1plXPw+BAWyrm8ZFsbHQ7OuCSfAAwEFwC3n2d+MIJ9L9epwkY8H75mvYZl/xRfaq
	YOlYA0inNWqYiXFD2DoxvHJ85lJgmc97tzhF1hMCfujYzihUsFxiIR7g==
X-Received: by 2002:a05:6214:242a:b0:87c:275d:adcd with SMTP id 6a1803df08f44-88271a25168mr26026636d6.41.1762915217027;
        Tue, 11 Nov 2025 18:40:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH7Loyy8ggJIzqFR7lswt8hNN6/aQ38dWjM3oB2pbeyPh3gQYc4W41B+TpCi19q5fa6FCHMlsZkVe3WT68VGn0=
X-Received: by 2002:a05:6214:242a:b0:87c:275d:adcd with SMTP id
 6a1803df08f44-88271a25168mr26026406d6.41.1762915216555; Tue, 11 Nov 2025
 18:40:16 -0800 (PST)
MIME-Version: 1.0
References: <116884.1762145303951599276@lists.openembedded.org>
 <142688.1762248598727477659@lists.openembedded.org> <193319.1762406171835153307@lists.openembedded.org>
 <CA+s=J=y=OWL_KfpjtZcewF5Qsb1gW4-eLAGp+Tw9CQ6mqTHSHQ@mail.gmail.com>
 <193319.1762421956956925614@lists.openembedded.org> <325891.1762767530014567696@lists.openembedded.org>
In-Reply-To: <325891.1762767530014567696@lists.openembedded.org>
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Date: Wed, 12 Nov 2025 10:40:05 +0800
X-Gm-Features: AWmQ_bl9T9ksIIixTjfJHlY5RN2yZGHkhGiSk7f4MOMpDyetgjxPMWn7Np9MiE0
Message-ID: <CA+s=J=zJN1tFLhz3YRRD8ksGrKXvp6NNy1BpRo+owcdk6FejNg@mail.gmail.com>
Subject: Re: [oe] [scarthgap][PATCH v2] imagemagick: adds ptest for
 imagemagick recipe
To: ashishkumar.mishra@bmwtechworks.in
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000004090d406435cafea"
X-Proofpoint-GUID: C6c7apaGMOIR7LvcZJUVqvcDRhAD1SOM
X-Authority-Analysis: v=2.4 cv=DYwaa/tW c=1 sm=1 tr=0 ts=6913f391 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Q4-j1AaZAAAA:8 a=iGHA9ds3AAAA:8
 a=-g3D5ZSjdJY4Yr2n2BQA:9 a=QEXdDO2ut3YA:10 a=v369EXyEZGogF5mWfvoA:9
 a=QZS1M-7yz8_HpkxE:21 a=lqcHg5cX4UMA:10 a=iYH6xdkBrDN1Jqds4HTS:22
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-ORIG-GUID: C6c7apaGMOIR7LvcZJUVqvcDRhAD1SOM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEyMDAxOSBTYWx0ZWRfX9OrWKHNl8sbk
 s5yxL5XWDh0NHjfJWwCKqSTuXgb3xmt7vtvbTyvLBUmRRtFHb5ZOJ1EQ6gRUJBhf/DAKppjgE2V
 9BOtzLyoxYb8vgotEmrs6RjZ0B9ScND+P8OtvNI0ZZ/B7UNuyaOypwjEEw5eQup38Iu4FMrzRoE
 niV6QA30e7v2QwdSGcoglmyxF13Fjg/apHIpMsJDJ13tBMqcUe+OPY/6GjxxwodE0CgPWay+tmY
 AQU5Gmx4sbN2T19fcqVoI/j6Q0J6WauL03pvzghBJZ9VQN/d/SDEvmeTKCiHDzHH9lM2wT8R3s1
 9pXPSY1xGlOuPNXOnrp+Dhpxo9My1bci6zZIIDIuAkq9ltdKEkBVgVQExSvVxWl7oRx7gf7claq
 SazE9n6Q5pTuPBtiOiwn6MRccLobxQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_01,2025-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511120019
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 02:40:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121525

--0000000000004090d406435cafea
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

H Ashish

On Mon, Nov 10, 2025 at 5:38=E2=80=AFPM AshishKumar Mishra via
lists.openembedded.org <ashishkumar.mishra=3D
bmwtechworks.in@lists.openembedded.org> wrote:

> Hi Anuj,
> Can you please consider this patch for scarthgap .
> Have shared the details why master and scarthgap are having difference @
> https://lists.openembedded.org/g/openembedded-devel/message/121362
>

I had replied last time:
https://lists.openembedded.org/g/openembedded-devel/message/121358

Adding ptests doesn't fall under what is generally acceptable for a
stable/LTS branch:
https://wiki.yoctoproject.org/wiki/Stable_Release_and_LTS#Stable/LTS_Patch_=
Acceptance_Policies

Thanks,

Anuj

--0000000000004090d406435cafea
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>H Ashish</div><br><div class=3D"gmail_quote gmail_quo=
te_container"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Nov 10, 2025 at=
 5:38=E2=80=AFPM AshishKumar Mishra via <a href=3D"http://lists.openembedde=
d.org">lists.openembedded.org</a> &lt;ashishkumar.mishra=3D<a href=3D"mailt=
o:bmwtechworks.in@lists.openembedded.org">bmwtechworks.in@lists.openembedde=
d.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex"><div>Hi Anuj,=C2=A0</div>
<div>Can you please consider this patch for scarthgap .=C2=A0</div>
<div>Have shared the details why master and scarthgap are having difference=
 @<a href=3D"https://lists.openembedded.org/g/openembedded-devel/message/12=
1362" target=3D"_blank">https://lists.openembedded.org/g/openembedded-devel=
/message/121362</a>=C2=A0</div></blockquote><div><br></div>I had replied la=
st time: <a href=3D"https://lists.openembedded.org/g/openembedded-devel/mes=
sage/121358">https://lists.openembedded.org/g/openembedded-devel/message/12=
1358</a></div><div class=3D"gmail_quote gmail_quote_container"><br></div><d=
iv class=3D"gmail_quote gmail_quote_container">Adding ptests doesn&#39;t fa=
ll under what is generally acceptable for a stable/LTS branch:=C2=A0<a href=
=3D"https://wiki.yoctoproject.org/wiki/Stable_Release_and_LTS#Stable/LTS_Pa=
tch_Acceptance_Policies">https://wiki.yoctoproject.org/wiki/Stable_Release_=
and_LTS#Stable/LTS_Patch_Acceptance_Policies</a></div><div class=3D"gmail_q=
uote gmail_quote_container"><br></div><div class=3D"gmail_quote gmail_quote=
_container">Thanks,</div><div class=3D"gmail_quote gmail_quote_container"><=
br></div><div class=3D"gmail_quote gmail_quote_container">Anuj</div></div>

--0000000000004090d406435cafea--

