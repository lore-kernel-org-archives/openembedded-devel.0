Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FAC0CCFA19
	for <webhook@archiver.kernel.org>; Thu,  6 Nov 2025 05:59:53 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8632.1762408789237941988
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 Nov 2025 21:59:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=GP2nluSx;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=PrwRCS/z;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A5KEs4Y1804584
	for <openembedded-devel@lists.openembedded.org>; Thu, 6 Nov 2025 05:59:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=b5fEGp3rNhnJij8BPvnLVtVG
	AfJeY5VF42RfeI4+33Q=; b=GP2nluSxmIUBsZHCpyRZ4Ed2YQE1MDohofQs7aEz
	6nZ7QfxcCA36L/sw6p75jefuEoFrm/giv85BBjC6O1A91pRvgtQjYdcbENwZEXrz
	nuAMdl0w9pey3OmEc+lOB+LgEpiO3eSYXoLgrRVf9942intK6/S1AGQ4c2e0pxxA
	JbGU1GYWtIeg+PluVuAvF4Xam6HHYE5k25lfhmJHJQ3EbqNXHEIh5Z7KRAXCuD5S
	E+6O8e+WalDaHxiGIVfj35FKVRvhR54C6O3DQH1dN1ejEkaUEix73BeJ0CfFa7YB
	0dZFpHNkOwH5mrhjT+JGVgyBvg2FjfBcXtDb2gDlX+Gfrg==
Received: from mail-yx1-f71.google.com (mail-yx1-f71.google.com [74.125.224.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a8c8s9kxq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 06 Nov 2025 05:59:48 +0000 (GMT)
Received: by mail-yx1-f71.google.com with SMTP id 956f58d0204a3-63e0da26ae3so976840d50.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 05 Nov 2025 21:59:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762408787; x=1763013587; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=b5fEGp3rNhnJij8BPvnLVtVGAfJeY5VF42RfeI4+33Q=;
        b=PrwRCS/zNip6BQCYvcuGw4pRAK+AzOqWnVPmszWVwRtJ9G801QEqGLz9t8vAiL/MJQ
         ApkR9P5wL+/qpVSojfHtYccmPyE5lAu/EP/dNZRMJZpfQnBkN+zfjz1o6GkdJ6BhfKdE
         46P0p2tp6JKRjOkKwrCR7sGBBAazYD2wyFTAbKio6vt78bBH0IeWBvW/AlD5DHVWx224
         j5vb1h5XRZzESPAdZNWK/PDsCtXd8a5ENYQcOSR7GDxvuvNJnOdYa1cuKJndxkiAjtH9
         iliWQ1PB05uJ0auIqLBEGij0COxBoGSfatdlapCaFqFTm2s3dbEU6IJR83DFGT0d1lhJ
         HAng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762408788; x=1763013588;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b5fEGp3rNhnJij8BPvnLVtVGAfJeY5VF42RfeI4+33Q=;
        b=klOpXZ+wcs5j6URRlWkZD+EQNox6KFVx2lnMvrV9d+PSKbe2iP3/OS7oCDxf647mKV
         Fg2j8ISVlPm9s/PbnAsdykKARTHQIypg5T4/lnVtM839foRJYDyyLCgt2K8JTBq/Yd1d
         pWU53BwwysJdDnAN6MEbyiBpp4NebNgazRYvVXO0V4v/ilQnphocLlZ8wp4a33jvIp3R
         QY3+2gwTHDIYC+BVDFJcXNzyy6P6LQPSQnL/JMB+KSQwmmIXSPD8N1eVBQJoew09iXo6
         mz2V7srQESheU+1pC0hbEX8D6w9TmfLmPPO4rkAd02UgjjsAv9FGQtUYTAcXbVs3K6Cj
         wCww==
X-Gm-Message-State: AOJu0Ywt8ivT8IVh6dFQAO5wcK/xJFQ9+M3iuzc4Hz4RkMRIxY28iVen
	yMsdVpiALHhsZokRd2uDpg3l2kEIPPjgKb85DkVbs7uZ/99JRxsvbp4y/tRISBKZZ+7rq8cSCz/
	8vMDCZ7rc1xk3FsSY77gqxS6mR9hxgdFPlKQiYxv1dnWwKc7GHAhcRW7FOFAyPwiYdobC3ld2K6
	MjZK9vmcSXqj5OL8OBRmiRXHJ/sGGjzCdfTv0SdvZ1VueF4JWh77YK5dGT7P4=
X-Gm-Gg: ASbGnctzpOQ+MCnAR9b67MD4gclH+iTh35tvf8CwZTw2cnlDrJlbG1o6B5ZKajpLJwk
	3cQ8eMTNlJkJO3YOIPzI7nYox4d1xi1uaekP9NfH7dBxG9+5UZrrTCy2GJpOQxT+nR5ShjoGoNH
	hH+UQlY31XnDEvjSNb1FoCoSex36bA3UiesqnV6ck=
X-Received: by 2002:a05:690e:1601:b0:63f:ba88:e8ee with SMTP id 956f58d0204a3-63fd34c573fmr4233770d50.21.1762408787482;
        Wed, 05 Nov 2025 21:59:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGTidLTusKoZtIaXFMRTv4wmT0/ox/KvpKBu+kTlSAr3pqOVzNNX3iVOT0AzJlzpTrWAf6d20jK4Rvznrr5iuM=
X-Received: by 2002:a05:690e:1601:b0:63f:ba88:e8ee with SMTP id
 956f58d0204a3-63fd34c573fmr4233757d50.21.1762408786965; Wed, 05 Nov 2025
 21:59:46 -0800 (PST)
MIME-Version: 1.0
References: <116884.1762145303951599276@lists.openembedded.org>
 <142688.1762248598727477659@lists.openembedded.org> <193319.1762406171835153307@lists.openembedded.org>
In-Reply-To: <193319.1762406171835153307@lists.openembedded.org>
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Date: Thu, 6 Nov 2025 13:59:36 +0800
X-Gm-Features: AWmQ_bk7g2OfOeMI_OYKwKVjiPXfKCSnqxoWpeUr8axNvtkJ-g_dmf0gHBlZ3KE
Message-ID: <CA+s=J=y=OWL_KfpjtZcewF5Qsb1gW4-eLAGp+Tw9CQ6mqTHSHQ@mail.gmail.com>
Subject: Re: [oe] [scarthgap][PATCH v2] imagemagick: adds ptest for
 imagemagick recipe
To: ashishkumar.mishra@bmwtechworks.in
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000b268820642e6c5c3"
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA2MDA0NiBTYWx0ZWRfX3laRI+ASQW2Z
 5Fl4/7LqwIoRMSlEo2lbSzYFxOdvgdfXIAh99oIAVQKIyBzeoYtVW543j5xPUFDK49aM2BpbpQ9
 bunnkMk5ofqF4cLU1L/2dmRiXluR4n4qzjuZgbv//Xh+Bpqkfv67N1lZ0HQvCTZq6PiBdUA3jjp
 +Ia+eNZfAml1yyra3hzi4rE4wUCT6h+KBaQVQy17loljTqE2GquHdrOPy0BTkoAcymTCdKCoO5/
 LP5DRi0kX3eICHmZeYwhYXn9qeJiHBTnlq6sN7BefmDxZ9+IKl83IdJAVLWUeKaieQICm6kj/AU
 YBQ+HSobY6cUcmN7vEDGO+fCqfQDILldcPmcDO+oXFvdB+PHtzx/vbaIlHh1tNxTCGM2UKF4Kzi
 nFibECUv9tCCPyBRsq++FaOMEDWl5g==
X-Authority-Analysis: v=2.4 cv=RLu+3oi+ c=1 sm=1 tr=0 ts=690c3954 cx=c_pps
 a=ngMg22mHWrP7m7pwYf9JkA==:117 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Q4-j1AaZAAAA:8 a=fa0CJnGok9JzslSYJJ4A:9
 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10 a=_uebk4rhxJxjTHdXMMMA:9
 a=XXHNUgu5047Pf3Hw:21 a=lqcHg5cX4UMA:10 a=yHXA93iunegOHmWoMUFd:22
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=HhbK4dLum7pmb74im6QT:22
X-Proofpoint-ORIG-GUID: ixBAZvCGeXsCrOWgSP_K8fbSjm9MjVzp
X-Proofpoint-GUID: ixBAZvCGeXsCrOWgSP_K8fbSjm9MjVzp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-06_01,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 priorityscore=1501 clxscore=1011 impostorscore=0
 phishscore=0 adultscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511060046
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 06 Nov 2025 05:59:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121358

--000000000000b268820642e6c5c3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Nov 6, 2025 at 1:16=E2=80=AFPM AshishKumar Mishra via lists.openemb=
edded.org
<ashishkumar.mishra=3Dbmwtechworks.in@lists.openembedded.org> wrote:

> Dear Anuj / Gyorgy Sarvari,
>
> Can you please consider this patch for merge in scarthgap ?
> or if you feel any re-work is required , i can work accordingly
>
>
This isn't merged in master yet so this needs to go there first before a
backport is requested. Adding ptests doesn't fall under what is allowed for
stable/LTS branches. Can you please justify why it is needed for scarthgap?

--000000000000b268820642e6c5c3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi,</div><br><div class=3D"gmail_quote gmail_quote_co=
ntainer"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Nov 6, 2025 at 1:16=
=E2=80=AFPM AshishKumar Mishra via <a href=3D"http://lists.openembedded.org=
">lists.openembedded.org</a> &lt;ashishkumar.mishra=3D<a href=3D"mailto:bmw=
techworks.in@lists.openembedded.org">bmwtechworks.in@lists.openembedded.org=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
<div>Dear Anuj / <span style=3D"color:rgb(51,51,51);font-family:system-ui,R=
oboto,Arial,sans-serif;font-size:16px;font-style:normal;font-variant-ligatu=
res:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;t=
ext-align:start;text-indent:0px;text-transform:none;word-spacing:0px;white-=
space:normal;background-color:rgb(255,255,255);text-decoration-style:initia=
l;text-decoration-color:initial;display:inline;float:none">Gyorgy Sarvari,=
=C2=A0</span></div>
<div>=C2=A0</div>
<div><span style=3D"color:rgb(51,51,51);font-family:system-ui,Roboto,Arial,=
sans-serif;font-size:16px;font-style:normal;font-variant-ligatures:normal;f=
ont-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:st=
art;text-indent:0px;text-transform:none;word-spacing:0px;white-space:normal=
;background-color:rgb(255,255,255);text-decoration-style:initial;text-decor=
ation-color:initial;display:inline;float:none">Can you please consider this=
 patch for merge in scarthgap ?<br>or if you feel any re-work is required ,=
 i can work accordingly=C2=A0</span></div>
<div><span style=3D"color:rgb(51,51,51);font-family:system-ui,Roboto,Arial,=
sans-serif;font-size:16px;font-style:normal;font-variant-ligatures:normal;f=
ont-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:st=
art;text-indent:0px;text-transform:none;word-spacing:0px;white-space:normal=
;background-color:rgb(255,255,255);text-decoration-style:initial;text-decor=
ation-color:initial;display:inline;float:none"><br></span></div></blockquot=
e><div><br></div>This isn&#39;t merged in master yet so this needs to go th=
ere first before a backport is requested. Adding ptests doesn&#39;t fall un=
der what is allowed for stable/LTS branches. Can you please justify why it =
is needed for scarthgap?</div></div>

--000000000000b268820642e6c5c3--

