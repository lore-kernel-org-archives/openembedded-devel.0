Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9DAFCD6E49
	for <webhook@archiver.kernel.org>; Fri, 29 May 2026 03:18:20 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2842.1780024692270332902
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 May 2026 20:18:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=oM1iPopO;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=a88LOuff;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64SKkUWX2117586
	for <openembedded-devel@lists.openembedded.org>; Fri, 29 May 2026 03:18:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SjlBAwLVqGEJnNr/8gUX4yvq4KX0v2hu2qoZaGaktw4=; b=oM1iPopO2VELJbe4
	+ulsdLGMQfA2hB1On7tuAvaG3HS+WgHISgt0XD7E10UXWnOGsqZwnASAcR04hdJZ
	7eoKW0cWIENoYaWyfPr2LVMDMDghDKHhjSnqax30KAimGoAc5Kql6gejm7kwWp+m
	aXIysEJdKf/DJNiovOJxSGYU8S61y+E9ckv+iAKoGGBZqcvt0NxPVdbLYnpf2REp
	vM2gd8tIkLzWhZ6DOmKv1KwS6/gpMfDBOiP5DKq7LM7hMcM2UrcRXm8c4njIve3m
	d5l7XK5CqSxhVKcYjc2Sk1ZzfYA00Y4ylq2ZrpUJYUyFbt7NaaWy7SUji845uiFk
	E5xK/Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eeuy59myj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 29 May 2026 03:18:11 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-516879bf1a7so325544861cf.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 28 May 2026 20:18:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780024690; cv=none;
        d=google.com; s=arc-20240605;
        b=Y7ToZ9s7cLBtTpsWLAVSltMnlYfPcu7LTGKyXK9Gjv+sJBvo4fKDE1UpWtzjF75AtD
         dEWt532tsvckevKWAWWqUEo8CwzE+gsLAReVw5OtOr8hZ4dSHR2SPgzwHAE+sCU0l/Vv
         +2IaDaZVomxeAHbT/leDv9+aArqbESPqdJQKUP6n4FX37P1B4WJc2txQv2mhsZzA3k1a
         heHFdzjeVD0BnTs4J7r1iRU9pJSC/yWaUs5TxRXcnj/Ry8oA51sMfcOhTCfYLSDD12wR
         MSnNQ8CBu2JjsBtGriL8CmgZk7NbQjP7A+bMCq3ekHyeFdplRjnyUvZ7y+X4xLbevXF1
         I6Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SjlBAwLVqGEJnNr/8gUX4yvq4KX0v2hu2qoZaGaktw4=;
        fh=Sj0u42d1QUAYPPmf1PefBQmEen3TTV+nfTUSUH13G6k=;
        b=KfKXj08bVDd1GxaU1bAnLmgougvy0aO3fJqTPCjcdGzjf9iWK+SRBzZWVm0QhKGAa7
         8g6qt8XHrD0+WYJg+943UcMX/q0HDtGxo12IzZcec6qfB2Y+uhWOr4N/0S5nURRxsmui
         1MpiAqtsk9IyWvLVqG8fgNmVnJg0ugKfEX5D2vjr4q5K1ndCNdbTMQTbJreuA2ERC4Mc
         recjSO7CcSy1dGQ8MZwHHoGGAvI5slyF4GFp1zUCEFJBhLqDddrEg0vUdTldVfKCsuLF
         MUKXklx0wDkoaz3VcE0vLODUa5Ky/5YI15QZ8oDn08bcYcViiuhzunYZT2qbGDxVQxls
         FtFg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780024690; x=1780629490; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SjlBAwLVqGEJnNr/8gUX4yvq4KX0v2hu2qoZaGaktw4=;
        b=a88LOuffUHiKGZxnuGcOAuOJKpiH24GUwkgVSbVm0WYtRhpPjNDcj11w8CS+s7uqdU
         HCmeZAzmBpAPXQMoS9+xgtEh6YGIEipKsfIX5kq/XZ+EdBy5sykUefPyLM4Jzdqj4VDi
         oCyj9ckpZH/ey4v5rQvTEGZcfe4iX/ydrsHVm/UIb5TUAKUkRuuQ0dlrzuB5gVUlWPqp
         JlB6qjP9eBeySgCT7EVnOvoI4FAD/E4Eoppfz1MWZZNGam1Gvz1xJUWUzCqNjk3Yjqyo
         cIYhC1wmC8yO83K+tlje3OtgtiuZP4u/dUoD7hqbLBJ6LCPXGlpdrDmleNFNszAJnzsZ
         s9Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780024690; x=1780629490;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SjlBAwLVqGEJnNr/8gUX4yvq4KX0v2hu2qoZaGaktw4=;
        b=pgdDwKxvipulTUEx1NMYcSkwhKrAfhvjs5mTFNCfglKRQO4mbPGicA08JBRir7qY6P
         pIgYvkbeUcWTBQ+QolPQKFiWo0TKiIxLwsFYWY6thRBiauCwG/k1ptEsDrv3Zn5p7Mp4
         I/sDV5Uqt8smr8PGR3OFT0ulaw1gvIgpeNHsLHGnIgD/hw/xRie1h/RPg0n1dsZQ/hk6
         HRVJyrhcycucE6SnwDFT3wb1VIQkksYrkHENtWkMgRSVMAZqUti0h0C2juqFb9zBqqR0
         3wtpCjLSbCH8NNj3Ej0KtcQCGh3nR4oROSI7Jb/M3sFIbhx6AVkNMVNdrV0AJIt0PH9e
         QP6A==
X-Forwarded-Encrypted: i=1; AFNElJ+XxHpxvgjOM2BHLm5jESrt+b0DygJjYs8G7+nrM6geVmJs3D2F/GkkfsDZnihV92FElTS8jZxJlAUQeC91UWPtg/s=@lists.openembedded.org
X-Gm-Message-State: AOJu0YwAlyUerNhS5wyjeiYIL4q66ddFxn78mzdt1z1nbxFq8BCxZf7p
	NvmRya6kE/3P4NqpWZwP5/dR/92+/AqxhVIS2njE+w/fjKlMNeQPBDL+XIbCMqOHV7nRnBEzxJ8
	Hg+m4ikdH7ZIieX8PCPmh5y6jxioiky9siyDkjrtTFgByAbm/+7JftbtoPmiFYtCIInRQB6zwD3
	xYTrxLm2KqA4OXWJddXQ9NlsahhWLE/t+uSL3aQcf5mamkrB/Vzml6gJAaJU0=
X-Gm-Gg: Acq92OH49UX1Hdcznm+Edo4ZQxyroGh2HQUOOiq4UuzUXwuPjtO3wtG8QUQXRXKz910
	kKhe1ykonRBHla7WpukZEgviPlW6aMB4cy3shN9Letsg3Se03kCTvgRLHrOZnhkrc8LPU4539y+
	hHaArEENWYXJhEmHjuAo/HQklzAUfBRuzeUwrG/SzZUjoJdrUPEnbUDycfIuaJDprena88Y3ZXl
	SQOdeFrtTXgmHI=
X-Received: by 2002:a05:622a:1b9f:b0:516:9b30:f025 with SMTP id d75a77b69052e-5172dbbc5e5mr13832541cf.15.1780024690592;
        Thu, 28 May 2026 20:18:10 -0700 (PDT)
X-Received: by 2002:a05:622a:1b9f:b0:516:9b30:f025 with SMTP id
 d75a77b69052e-5172dbbc5e5mr13832371cf.15.1780024690183; Thu, 28 May 2026
 20:18:10 -0700 (PDT)
MIME-Version: 1.0
References: <20260526082629.4120984-1-wei.zhang@oss.qualcomm.com>
 <zsxojndeb7cr64qbhg4uf7batcqxlhfwfhas7pvdi7pc4ry65o@qfs5nkzigjsq> <b0633450-767d-45fa-a272-a19715dc554c@oss.qualcomm.com>
In-Reply-To: <b0633450-767d-45fa-a272-a19715dc554c@oss.qualcomm.com>
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Date: Fri, 29 May 2026 11:17:58 +0800
X-Gm-Features: AVHnY4IwlbJu1ExFjPhuEH6aHUweRXEc1M8VERlwXgFsOIG1T-3bbAzMiJ7hmzk
Message-ID: <CA+s=J=w8BRa58iwUT5DOtJZoM699VAD-ZWxsvgG6F_fOBDLqhg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] hostapd: Fix clearing settings for color switch
To: wei.zhang@oss.qualcomm.com
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=SPtykuvH c=1 sm=1 tr=0 ts=6a190573 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=Q4-j1AaZAAAA:8 a=EUspDBNiAAAA:8
 a=DJbHBiEb6d3nTbVyZDIA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-GUID: e2KRFp6hhAC3NKENgkDnMwEqMs0lWgvS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDAzMCBTYWx0ZWRfX9Akr8n1qAWrT
 faAMfnJvs7NkGSNVZekKYqvp2DntKlei1q8NmA7MdaNN7DSdDvQBj26+eOoq2XBtZjZjHnjvQGB
 Wp4aqOIR+iSB3UHknZlQlrEgbpizzaavi0eSe2VMcceDfF6a91SKbp6krAwrVnz9JCfmtIaPkPN
 iRhQp11o5ZwVAMUiQH6pSl0JdWbXUeX69fX7MGS4vzA45nUM61w78mYRgh+gpOc3EgmcJitYgPw
 tokeN1KmieSGfHyuqAj3Xf0hvqD/zG2howJMk4Em1Wi5Dqrn6tNOfIRAsXJ3fYCQzNFB3ltXDW9
 gLhxAaRi47LqFRAS90afJtGXSaPEkOswQRst8pL9FajccEkL2vhIvg3oHodXVpdN9yXYogSQNRb
 mt5eM2lyE+F+W6XbPajEHORNkLAIPCARgIE0T4SfPkTOOU3LGQEzIqDV3unywRvd2hxDr+FmHru
 qdCy25Azjd6ep0M4JQw==
X-Proofpoint-ORIG-GUID: e2KRFp6hhAC3NKENgkDnMwEqMs0lWgvS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 malwarescore=0 clxscore=1015 phishscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2605290030
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 29 May 2026 03:18:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127279

On Wed, May 27, 2026 at 8:54=E2=80=AFPM Wei Zhang (Stone) via
lists.openembedded.org
<wei.zhang=3Doss.qualcomm.com@lists.openembedded.org> wrote:
>
>
> On 5/27/2026 5:46 PM, Dmitry Baryshkov wrote:
> > On Tue, May 26, 2026 at 01:26:29AM -0700, Wei Zhang wrote:
> >> cca_settings is used without zero initialization, which may
> >> introduce random values and result in invalid nl80211
> >> attributes.
> >>
> >> Without this fix, BSS color switch may fail completely and
> >> the feature becomes non-functional. Initialize the structure
> >> before use.
> >>
> >> Signed-off-by: Wei Zhang <wei.zhang@oss.qualcomm.com>
> >> ---
> >>   ...learing-up-settings-for-color-switch.patch | 34 +++++++++++++++++=
++
> >>   .../hostapd/hostapd_2.11.bb                   |  1 +
> >>   2 files changed, 35 insertions(+)
> >>   create mode 100644 meta-oe/recipes-connectivity/hostapd/hostapd/0002=
-hostapd-Fix-clearing-up-settings-for-color-switch.patch
> >>
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> >
> > The patch also needs to be backported to the wrynose branch, I assume.
> > Should it be backported to older LTS branches?
> Yes, this needs to be backported to both wrynose and whinlatter. Both
> use hostapd 2.11, which introduced this regression.

whinlatter is no longer maintained. Please cherry pick once it's
merged in master and send it for wrynose.

Thanks,

Anuj

