Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B797CA5FF0
	for <webhook@archiver.kernel.org>; Mon,  5 Oct 2026 09:51:07 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16559.1791193858846945921
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 Oct 2026 02:50:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=KaZwBuP/;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=X0/7TKe4;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6958xTLL493707
	for <openembedded-devel@lists.openembedded.org>; Mon, 5 Oct 2026 09:50:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kvmv+jCyR5tTwmprrsAaCRFJF/7ZglrjeDYykGZtp3s=; b=KaZwBuP/Pag03bk+
	He5O5A/ioulkOeD29idXh4xaxBF36KeiofSatZ6Jg656cMl+QzCOCJywd2KptYyt
	tHeDePRRaV/pfh94IrekVZ7KoEI48SGPRoX/2TbZsIA3qC1llUGqmvrTZGNgjBY9
	VzYTDzb2VfzRanUekoxIZoSnosMUzMl5YVkx+fHQIGlYWguI64R+06g9wW6h9dur
	xMoPexweU+sPX4ysKXwf+Ts3nR/OibtDgE9HDx/ewKv8Oued5jWrV0grECrLhKui
	oPMO0WGeYVI1LnrVeCZDOwHzzPt5J1Sojzxcg2DQrU3SAyKnVYVSFGNgYQPJ8mG5
	OEeMLQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h3chfk7bh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 05 Oct 2026 09:50:57 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-917b7dd3f1dso28708296d6.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 05 Oct 2026 02:50:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791193857; cv=none;
        d=google.com; s=arc-20260327;
        b=nO7Yvbu91cAKsd50F54tJ79N4y4uvC8VDiI/T/1BhWAqQwzwiJaF6I0d/9Dyxzb9+x
         uHZitIZq1V8DWNGpYfPg1qMgMLs3D/p1wYGjgIJDZ90S8zURDBHCHv9p5dIe2mWblK+H
         wtOmR6/wIFUS83ALHoFJ1sUC3t1bTH+26o62oN2Y+/bCpTq5dGnKiFVi3pfsXFWVM7r0
         MH5BrwGVfbgO95U48VOWClkv0zZqQPJGSaMKMAjIucrCE7LqdcahFr0v891yUZIoe0L/
         5xrTLDj/4taK63ILjGd5MpTbw+HsloWQr4gDeB4aYyX0yEK1iDmWJ2ErUhEivqhQwtxb
         Fqrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kvmv+jCyR5tTwmprrsAaCRFJF/7ZglrjeDYykGZtp3s=;
        fh=JzcMp8K2qGpNfLcJAudTukck1MSn97ZE8QWIGrbs0Wo=;
        b=HhXb9Tkr/8tkrEmJkwzvAj4sEYqE0IiQR70533ZuuMveeLcmnCszquCqejKx6FzuCF
         C2naW69ktSAiYxEku271oLadG9Vg2soYL6FXgWLNg5tz75gCZTdXXhHjAO4FiwK2jzIo
         vkAvI/VVJ/hT20UzTeaMATM3leg5pFjEVZFrTbg2UZibAKkggPZUPiCF/I9Uky1vREmb
         H3CaMJgUAXsUIt9GKoEyYPMV+KWfIb+akRh9gF8Xn+uBqBVmp48BEaIN0ZG3MUfakzPG
         HODFRV4LujCP9QgogVkR/ySREQrn76kRAxmI3NSWAztPVdtMiccEgXfEcNTut044XmY4
         LlGA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791193857; x=1791798657; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kvmv+jCyR5tTwmprrsAaCRFJF/7ZglrjeDYykGZtp3s=;
        b=X0/7TKe4Q5uOgzdxcxJorigIpUZlYV2/vrz79CILWj1nOONewn8u8JQI5ZEfeZtwdT
         nNf1AGWITLfTxqkdbPPcB3vpoo1UqftrNRQXOOuOpC8vM+I44H5eleHiBl8go8V4nqQc
         4c7FtnQ00zXwLL7g1fD2UiGcMeM3JpCfDuhQeqTi0nRNI5qc6ODdJ6AfwPZ5MBlnSIgq
         rT3DK2+Eo3j4cdizEP/EWA8xaKQnwwHPrIKmztVhIKb7pBDlie8BJQf6mFKAYL+WEM3P
         YYt+/7Fh67OyJCjzhtXqL9JiVIGuhXeYPxOBEs2evhvilkETvEDQ3izulNe2s9+z+98h
         2bPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791193857; x=1791798657;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kvmv+jCyR5tTwmprrsAaCRFJF/7ZglrjeDYykGZtp3s=;
        b=lMRRJ9ZXkRoxCV60gQJiyllCDaNDeCLUWeQAJD+tlsXz7VQUBDSbKtHw0QT3TG2PcY
         Qlch7rgGR5kUc5sKAp7srkJa4VC9R8wgMCRROoDkvWYTP45BntRwXShUxghCmXZiH064
         RZsKF2zeOW5GDCMufbjZanmCu029r9NuPH2ujdBcMqRr0bt9vm3yPRG8Vbo42Oz3GDih
         mY/oOEty0O+wnbsOZGBeRSDjIR9Nu2JigVrqWdo0b50FkWUVhBrDcg+s6u/o+A4V4Yem
         16ghTuTWGCcnLi2sGJmvR/a3YnlTz5MAs3Mjwqu0XRSYQBalGTQh9NaKxe6XUBPnpZfl
         hncg==
X-Gm-Message-State: AFuF++lAGSRrx56qjKXEGra1Wr6hIbiCy3rcqJOhQZfF8A0Duvr90ZYG
	TdohSkTbNWDG0jqfZuI5lixpi/hGGoPUJSVldaGU74L9XPTdBrQ1IxVVzfwfSpKJpM03MSV/Sqe
	BW/vn6gxivSM8i2+exPWjSUIPpXpsB9HKrc7fWAE9Rpk6VYB9JSc0fhsQEferNHRF1kIEHrVsIq
	0IqgEBy1NXUMGysp0Y7wyWs7iZZs7FyBcfT78P5TAqbTrP3RPGkQjvOE86otOOoPrMAp5gzTve
X-Gm-Gg: AYBFou2Y0uBCe3dd5L8lPRADFR3CsyUepqsgIVqa6ANYOkpAGqHZCYACvEFg0HpQpkD
	fT0RDC9LXhcIluY/eh66thR+G01XWSPkG835VmifkIezR9QVW49GlFtCd/5VfFCo3OwhNlpxZxy
	1GOhIce8nOR7lXqhfWTJ8Uo2k7HBcofsUyoCyQwwcnszP26vx0YyfzN3V5KQ==
X-Received: by 2002:a05:6214:410f:b0:917:aeed:9240 with SMTP id 6a1803df08f44-9195d17e93bmr126055136d6.31.1791193856801;
        Mon, 05 Oct 2026 02:50:56 -0700 (PDT)
X-Received: by 2002:a05:6214:410f:b0:917:aeed:9240 with SMTP id
 6a1803df08f44-9195d17e93bmr126054776d6.31.1791193856259; Mon, 05 Oct 2026
 02:50:56 -0700 (PDT)
MIME-Version: 1.0
References: <20261001120417.1280843-1-Abhishek.Bachiphale@windriver.com>
In-Reply-To: <20261001120417.1280843-1-Abhishek.Bachiphale@windriver.com>
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Date: Mon, 5 Oct 2026 17:50:45 +0800
X-Gm-Features: AclHuK92euibiypweIYbCqBgWAyUFiN_LeysaTDhkV9a1FlIv-bKp_EB4O70kgw
Message-ID: <CA+s=J=xswpLhv57E0Ndu533-dBWvm4qVDc9WGfpiarW069-Lxw@mail.gmail.com>
Subject: Re: [oe] [meta-networking][wrynose][PATCH 00/11] strongswan: fix
To: abhishek.bachiphale@windriver.com
Cc: openembedded-devel@lists.openembedded.org, Shiva.Komati@windriver.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: 29v2pNxCOVGacbHA0kpWMqhcaJV2J7n2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDAzOSBTYWx0ZWRfX3EsxNLH696bM
 xG6y8SzgJdY580W1G3IWVl2T9FZ1/8LvVhUnWgZoyHTxhLc9leMeNO9JmjMFqUXGNAdHpR6pEx2
 kgkf7kaFJsEOfyRlx0yViSvdFe+qczY=
X-Authority-Analysis: v=2.4 cv=eZSo7LEH c=1 sm=1 tr=0 ts=6ac37301 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=Q4-j1AaZAAAA:8 a=KiMCiSwjAAAA:8 a=EUspDBNiAAAA:8
 a=LZiVNv6f83Ui8mtJZ0AA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=sPCYT0qwnquSfqsKqTDE:22
X-Proofpoint-GUID: 29v2pNxCOVGacbHA0kpWMqhcaJV2J7n2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDAzOSBTYWx0ZWRfX0Io5aFIgm52s
 QnvlD7bqwXR2EmR4LEuT45lAldbxaCoFXov/6GBMv/F/IqqZu/c9Ah5CSy0YVThR3LheXSIM1KL
 xS3Y1aqPRvJOs/SoSdUFNmYBVFwl/PVEx33SEr6RLkLgyOZGd+ZBzxj8oqcZfqsJCkx16l6wkhM
 mcfnATXGEXRLXIBxjZOaSWfWRsVaRiCR+xDvbPWRi9V4TnFOKlftO9RHOjyNiCi4VEyritbVANf
 A4I2Or+7va6PyLp11QVdpP5NXk0S8oGVeIoqD47FLYXUK4nV4WapDcdi+hZ11+4YVQKjio4LO+J
 3SPJ3SJXKOyuoi6QvWAHdO3eUeReyXRwbuzF3sNnyI/av0WcDcH1CqeYEybNyXB4km+huoIKYlx
 Y5EeTb4uZ13cZJHF4BtjeaKIp27hoIUg1NoGCUN9FmU9wCpDfki3zPqbrxOVZs2i25Sgas8lM91
 nT8eKOX8QLccUlxCiow==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_01,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 malwarescore=0 adultscore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610050039
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 05 Oct 2026 09:51:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130627

On Thu, Oct 1, 2026 at 8:05=E2=80=AFPM Abhishek Bachiphale via
lists.openembedded.org
<abhishek.bachiphale=3Dwindriver.com@lists.openembedded.org> wrote:
>
> This series backports the September 2026 strongSwan security fixes to
> the 6.0.6 recipe in meta-networking. All patches are taken from the offic=
ial
> strongSwan security advisory archive at download.strongswan.org/security/=
,
> version-banded for 6.0.x, and all are fixed upstream in strongSwan
> 6.1.0.
>
> CVE-2026-47895 is already applied on this branch and is not included
> here.
>
>     CVE-2026-78123  openssl plugin PKCS#7 expired pointer dereference
>     CVE-2026-78124  openssl plugin PKCS#7 certificate memory leak
>     CVE-2026-78126  eap-aka NULL deref on AKA-Synchronization-Failure
>     CVE-2026-78127  libcharon IKE message logging memory exhaustion
>     CVE-2026-78129  libstrongswan encrypted PKCS#7 DoS
>     CVE-2026-78130  x509 attribute certificate verification DoS
>     CVE-2026-78131  x509 attribute certificate identity parsing DoS
>     CVE-2026-78132  x509 ietfAttrSyntax ASN.1 parsing DoS
>     CVE-2026-78133  libcharon IKEv2 rekey-collision use-after-free
>     CVE-2026-78134  eap-peap/eap-ttls inner auth propagation / authz bypa=
ss
>     CVE-2026-78135  libcharon early CREATE_CHILD_SA auth bypass
>

These was another series sent before this one for these CVEs. I've
picked those here:

https://git.openembedded.org/meta-openembedded-contrib/log/?h=3Danujm/wryno=
se

Please rebase and resend if anything has been missed.

>
> Abhishek Bachiphale (11):
>   strongswan: fix CVE-2026-78123
>   strongswan: fix CVE-2026-78124
>   strongswan: fix CVE-2026-78126
>   strongswan: fix CVE-2026-78127
>   strongswan: fix CVE-2026-78129
>   strongswan: fix CVE-2026-78130
>   strongswan: fix CVE-2026-78131
>   strongswan: fix CVE-2026-78132
>   strongswan: fix CVE-2026-78133
>   strongswan: fix CVE-2026-78134
>   strongswan: fix CVE-2026-78135
>
>  .../strongswan/CVE-2026-78123.patch           |  53 ++
>  .../strongswan/CVE-2026-78124.patch           |  36 +
>  .../strongswan/CVE-2026-78126.patch           |  39 +
>  .../strongswan/CVE-2026-78127.patch           | 117 +++
>  .../strongswan/CVE-2026-78129.patch           | 157 ++++
>  .../strongswan/CVE-2026-78130.patch           |  51 ++
>  .../strongswan/CVE-2026-78131.patch           |  85 +++
>  .../strongswan/CVE-2026-78132.patch           |  77 ++
>  .../strongswan/CVE-2026-78133.patch           | 622 +++++++++++++++
>  .../strongswan/CVE-2026-78134.patch           | 711 ++++++++++++++++++
>  .../strongswan/CVE-2026-78135.patch           |  74 ++
>  .../strongswan/strongswan_6.0.6.bb            |  13 +-
>  12 files changed, 2034 insertions(+), 1 deletion(-)
>  create mode 100644 meta-networking/recipes-support/strongswan/strongswan=
/CVE-2026-78123.patch
>  create mode 100644 meta-networking/recipes-support/strongswan/strongswan=
/CVE-2026-78124.patch
>  create mode 100644 meta-networking/recipes-support/strongswan/strongswan=
/CVE-2026-78126.patch
>  create mode 100644 meta-networking/recipes-support/strongswan/strongswan=
/CVE-2026-78127.patch
>  create mode 100644 meta-networking/recipes-support/strongswan/strongswan=
/CVE-2026-78129.patch
>  create mode 100644 meta-networking/recipes-support/strongswan/strongswan=
/CVE-2026-78130.patch
>  create mode 100644 meta-networking/recipes-support/strongswan/strongswan=
/CVE-2026-78131.patch
>  create mode 100644 meta-networking/recipes-support/strongswan/strongswan=
/CVE-2026-78132.patch
>  create mode 100644 meta-networking/recipes-support/strongswan/strongswan=
/CVE-2026-78133.patch
>  create mode 100644 meta-networking/recipes-support/strongswan/strongswan=
/CVE-2026-78134.patch
>  create mode 100644 meta-networking/recipes-support/strongswan/strongswan=
/CVE-2026-78135.patch
>
> --
> 2.40.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#130581): https://lists.openembedded.org/g/openembedde=
d-devel/message/130581
> Mute This Topic: https://lists.openembedded.org/mt/121525589/3616702
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [a=
nuj.mittal@oss.qualcomm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

