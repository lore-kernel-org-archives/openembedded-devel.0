Return-Path: <ricardo.salveti@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08EF9C5DF66
	for <webhook@archiver.kernel.org>; Mon, 17 Aug 2026 19:50:49 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3563.1786996241187962448
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Aug 2026 12:50:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=QehPm0eU;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=GmDafQPM;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: ricardo.salveti@oss.qualcomm.com)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67HIQja43107910
	for <openembedded-devel@lists.openembedded.org>; Mon, 17 Aug 2026 19:50:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s2yciZpwAXOziu+zICyHgQVL3mwK5+uhTHs2LszwIHg=; b=QehPm0eUxGSDCfg2
	71bJ81DWelrtAQavU/Fj2LWZv3rryGzhKX0y852b2QJs5lia3wo7XXQhFkSr4/pV
	StvhyvLPxzUx/4+NKmkCGm1sxWYRHfnVzf5gHlRr2iBSMiBjX6zcxkSWre8yG/jA
	95hax1fsB7KPPjP6ZwQ1ipo7SqSAKVDzjULiLLxqmbtDQgBGkxcu3nJ/ic9iOoUE
	BRXgmMTgRlIS3OKsSFC6Kjk4gAGlyD/Z9agVr5ZDl9drSHImzbixTUgQnhblSy52
	eqN4KAzd/3/JNswxDVaY7mpRxrTi0hGZMjOnX+6Uhx8e1fSmyagGROfJuxRKEK2B
	jVL43g==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4615grk4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 17 Aug 2026 19:50:40 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ccb6823efcso36848865ad.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 17 Aug 2026 12:50:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786996240; cv=none;
        d=google.com; s=arc-20260327;
        b=FloMydufzimP+j5USl/m+4oHjvUeJSVG1F0EEoSpIcbYNh/Qo2vR7BGQazga5kOs75
         AD2zvOFhTYl1KKC1GYBli3y7yEawrfDdQ2UUaRpoQ8BeYoh0uJy+YgYTp7prOlMV0EQR
         n4E6lYfw2DlL6jS2YRHaWLxrYT2kons3d8iQyYsNYdqIad5kdJ1iRT1PEBOJKyre9gYC
         Y3pTxY7OAkv2cY47cdGyKWABpJMnqe1UlcAXFUQqGPNPgSfJ1XR3pc53EwHEVppeSDbT
         a1Uah6vDRzJNPvtc2n8sjNFfxFfXPU1GtHiK1ZvY3bYh/fpJhClXQAIHmlVO0dZI2ZAy
         uYkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=s2yciZpwAXOziu+zICyHgQVL3mwK5+uhTHs2LszwIHg=;
        fh=kqtH9RvdTS8z4R7bH+N1q4tJTvX5kZFkdgAseXKYH84=;
        b=OtWTWTPlUxrfzsa4DtFN2MVleuLRwmxc4dyZqHVoOd7XBeasO5vIsu0prwIQOmhKcH
         clKfENRv+6d+8v9VwuyCE6WQSW+Ft74UYCK014ccqaIvQ8qyq0DxGmUf4HU8kCm4DRTg
         AKywZQxzG8v72NrQRPvtoXam4C6fBewD8l19kk6/4vSwiea4bTsHZ+Op+I3NHgsRBjpT
         /86JWVq1QognvyK3cxEpKQOmrx1KI1wG3ONqdC6caJh1OVs+7m5EzOTtEEu6yaj/AKgZ
         p3SWRScpD0kxV6tq5MZ+tSMuiHgkHc0cTnBaM9LW/1QRHDA7RcQ9fYRi518OENfnJ1E/
         WPQQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786996240; x=1787601040; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=s2yciZpwAXOziu+zICyHgQVL3mwK5+uhTHs2LszwIHg=;
        b=GmDafQPMf9Eo0v2v3eg0TA0eo/MZFcjiVct5DqQ15+T7rWDroOfd2CikKS3u00uKoc
         xjVrYIhVey/webYunHvIzJU/IfsrVO0+y4aQyMZzvfr5WNF73N889LdiJHHyn4n2Zx7t
         ZlEY+WMjlQz7PhsfNxIsbAfMqMgx/B0XZyVEq3sip6QPmn1N+Bn2dM2WHoYWxPAXnFMh
         kfvPO5w6IfOYCzyOURZPDHB8BgPWwE111sPZeLpYr1ntS0idH+ufyObVKxN3wrBp3wMI
         fLLsyX8uFPoXr+5OS2SoaABsjw+matRuevkjPD72n/fPQZnWe8LgWn818rCyaKiEaqFT
         dZZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786996240; x=1787601040;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s2yciZpwAXOziu+zICyHgQVL3mwK5+uhTHs2LszwIHg=;
        b=I2UkxtEekBI0t/wSammXWuS3KJ8qFljr1UD+vDibSw4oBTIkNeM1Kfs/1fWy4ukoQP
         5gaevTe2abQwcjR4jc3c5jIpll5KxaeE6X5smevAS91wIsUgi/W9txDEldCkIlTm+ojj
         IKjNzVi3FcvyrUkIhPlCkCy90/DaONCfsUPnZarmK7o7CEjp31HkkIpBYhKlnU8DRB7M
         +RAovDd5WIVeJ/J2854Z/jnTiuDLG3vVmZWAeqcTlS1dw5QR+uAH+tIpjDJAPXCHFUmW
         xk981kIip/2xdT8jcMffmLZcNPRHIeI5Sro8IAsKNNkBCyv06//aP85/U5pzZuEPExly
         74sw==
X-Gm-Message-State: AOJu0YxdDpu05qfU424VY9LZDfly6YMG1qnshx0U9Oon64U6xe0AMLSv
	9AWjNAefpVxT9G7HsoGi8MTn6iLz4AP34CukpMBFDBdGa13PiYBe0sZWPxdPlA6fpWUD9/h4gVu
	sTpFGcL39U6Xd1l7Y4HvDHjRZsqzHl3p5l2GrhUGMK/yTld6H1gDTNC/VJdg/K4joZI1NfBFmNP
	w214rSXIU8xp4Uo3MdkdsydOBCOdcFe+xqiKc0aEzvP0HESpiVl+tb7RAgL2U=
X-Gm-Gg: AR+sD13NPFmP3OQhDYMGIOr5uL9Vw32xKiC1hFok+gMXvvE5tmQYvBb/TMjQRiF7zT/
	OYv6Xdsq9ErgEvCMSxbJlMJk19RW7MKVYKYN57lyzudKpuxS0mruspwycf/Hnj4FW/jc0uLdr+l
	zYDCH9LVUdOqe7gcWFAT0cKdFPc6LThIeHiu7P7UGBGudr9HioTlmAh7nrYmE=
X-Received: by 2002:a17:902:f60f:b0:2d3:6fac:d67c with SMTP id d9443c01a7336-2d3b0deafc2mr319023815ad.10.1786996239703;
        Mon, 17 Aug 2026 12:50:39 -0700 (PDT)
X-Received: by 2002:a17:902:f60f:b0:2d3:6fac:d67c with SMTP id
 d9443c01a7336-2d3b0deafc2mr319023265ad.10.1786996239127; Mon, 17 Aug 2026
 12:50:39 -0700 (PDT)
MIME-Version: 1.0
References: <20260816163958.3664646-1-ricardo.salveti@oss.qualcomm.com> <CAMKF1sq_Rbg3gs2E4C+SUexJ3xZkkQ57hJP_NpeUt4wXZY2Ycw@mail.gmail.com>
In-Reply-To: <CAMKF1sq_Rbg3gs2E4C+SUexJ3xZkkQ57hJP_NpeUt4wXZY2Ycw@mail.gmail.com>
From: Ricardo Salveti <ricardo.salveti@oss.qualcomm.com>
Date: Mon, 17 Aug 2026 16:50:01 -0300
X-Gm-Features: AcwNN1WuLRgtaMQytHBlb42FGQEAl1O6DOCNCDvP2YXrHB69xS1PdJFfC4PsaPE
Message-ID: <CAA_5yovr5sZQsNtCR5B1kOAieUndWwzj+54i26ELHiG5CSO-Ng@mail.gmail.com>
Subject: Re: [oe] [PATCH] redis: fix build of the bundled xxHash with -Og
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: OWO7NCrPK6bG7YkICUnIilPoh7wkb7Q7
X-Proofpoint-ORIG-GUID: OWO7NCrPK6bG7YkICUnIilPoh7wkb7Q7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDE1MSBTYWx0ZWRfX1WgZvxcLo8B9
 7h3THl4LJh9CfxWCCDioyg06FGMMTzaAjgZF8S3Hj74lmfutvfXdsM6rVIsJovGCz2toEdIYs3f
 do3asEVMH7qhQ2eOyXoOMyh7nfvhrpKZap4XEeYJk6UdLIPkAeJzDiMhe7kdmPP4rBsRUfFiXyX
 Ks8stg9C1qsNGA+4PF6m4JJXr4bUqftUc/qrXPd9kdBEGk15rMlwsGybGerl0WgBimc0R2IUbX6
 NKhM95YWI6XUOgkwQcA0HnkA5ZvFBxEX42Zrnjfv0KAZh+VDd3AY86zpv1nHv8dWbpQngrljIxM
 5MGGRYYX8P6C/0uMVIeXR/6u2Ym+ajOF2zoVFDNRVPTFQCY1ZtlsnDsqRcFe9NcXUSXWFR2qRYS
 54kXweNEbYPP7ndjaNJAt+LrLeyYhxPVAm/Fbijc7gcuxou21syaXHAoF1IL7C33OJ3C2XogCep
 61bSv22IXs3O1ncYvoA==
X-Authority-Analysis: v=2.4 cv=Ruf16imK c=1 sm=1 tr=0 ts=6a836610 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=pGLkceISAAAA:8 a=Q4-j1AaZAAAA:8
 a=nRHsnifTdjDX-vuUcUAA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDE1MSBTYWx0ZWRfXzhi9YB8gRwnf
 HCH3NJdxtnDu8F75eshoVy+6muHbRV7FoHBTa1uF2zJEcaihQtH3NG4qNyER2JZWHYLDq4WiaYI
 Ce73eSKwLWmgqax2fgBJjJ92Ne6j0l4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_03,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608170151
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 17 Aug 2026 19:50:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129195

On Sun, Aug 16, 2026 at 7:48=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrote=
:
> On Sun, Aug 16, 2026 at 9:40=E2=80=AFAM Ricardo Salveti via lists.openemb=
edded.org <ricardo.salveti=3Doss.qualcomm.com@lists.openembedded.org> wrote=
:
>
> I see that its fixed in xxhash recipe in oe-core
>
> CFLAGS +=3D "${@bb.utils.contains('SELECTED_OPTIMIZATION', '-Og', '-DXXH_=
NO_INLINE_HINTS', '', d)}"

Indeed, I can do a v2 copying over the same line from oe-core.

> I wonder if its better to depend on system xxhash instead of using vendor=
ed
> version. Please explore if that option is possible.

There are a few issues with this since it is not based on the exact
0.8.3 release (it is post release), and it could cause potential
dependency issues in the future. The other issue is that there is no
logic in redis to consume it as an external dependency, so it would be
another patch we would have to carry which will probably not be
accepted upstream.

Technically possible, but it will potentially add more work to
maintain the recipe moving forward (while the CFLAGS line is a
one-liner). What do you think?

Thanks,

Ricardo

