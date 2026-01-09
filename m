Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3ED3D1A60F
	for <webhook@archiver.kernel.org>; Fri,  9 Jan 2026 12:22:27 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8883.1767961337844658072
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Jan 2026 04:22:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=V7cR4G7e;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=ivbn8bMM;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60961lNW3142583
	for <openembedded-devel@lists.openembedded.org>; Fri, 9 Jan 2026 12:22:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sg+crTIVzuX7pw0uh1oBeM41fozWbeEGMkiV/1ZzrZ0=; b=V7cR4G7eIoT6zVli
	aK0QnWxyieTmyFyGzREeO7fXONuabO4r/uOX/7SGK7h7I7iKskfjFg6qO+12sRvi
	fcBlLt0G5iZ3aFnUC2a35x+UQnavgvK/tMVM1kGRruq6kEIWERzt4XPGygh6EjF4
	hmuReVlbkQi/19LSTr5g8fxbyW9PfV9Yor1lfojU4PJpRhSkrFBsJO2D/CnRjai/
	xrwvnlBbt14dvJevuWoNBPefR98M9Q6PWZIyTUNMkmhfuE7ayzfbkd+Fml1NYJgq
	zbAKKDS0uyhq4+tIxem801KvNeZz9rmgTpcUZ3sqr0cTbYmiQORMSxtEjr/kqf6K
	H6cIvQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjj8j2kyc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 09 Jan 2026 12:22:16 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8823f4666abso103028436d6.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 09 Jan 2026 04:22:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767961336; x=1768566136; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sg+crTIVzuX7pw0uh1oBeM41fozWbeEGMkiV/1ZzrZ0=;
        b=ivbn8bMMjEYbEnrBrSPBId2u8bcIG5wNGRc8r6FTKnP4SMU8DdhqydRNVVSRsV9MfS
         lOn+q8qaAE4IbYGwt/jNxQreAWjglgyWfXLiBiu354T5LU3VXS/MM0VBjZYAr3nJfUmj
         a9AhaeLnCfChgucDL8GBYjDRDwBE5I7FydtmsKIb18KjubyA5qwI7nfEQowu2DMB3/5t
         yuS1zQo5puqKFZrrE19eY5QVjvKzcNJu9eLG6RmQXNAly/0GyiYq3e/bmbfdZOTt1B+E
         lTLhNJ1cLF5lNfvpkeLNCf8bV3DmsEOap3DeZ2h8mgHQpxYN2ymFauT2VtcYMItKLAwX
         E8cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767961336; x=1768566136;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sg+crTIVzuX7pw0uh1oBeM41fozWbeEGMkiV/1ZzrZ0=;
        b=KNwnAIAlQerEKDos+C0yHlsXVO8qCVL+eVT38SdXhyD7oz0e/sPWsd6XFONiWazzaL
         D30gRq7ytqrJW4QApGewxzlSzyW7Hhmwd/dIJvac7mUeBNTJwBu8LaPDT6ZrsKDma9uz
         6rEiuRi/i8EbX5BiiEydSh6dRwn2wGK6REOkuDwSusa4XpwfNX8vmVJ2YCcbBjnBNTxc
         1o+8dE86BCTR3OErmW74vunV/aQjdjfJZS0Lc6530zQEpB8Ix3mzP0Fn6qFsh86BYY0V
         4a/yxaeSoSm0SyWmKSjBqam2AW3U0fh+oNAAAiZNQ35Ts1BX4yhCSwTWjbYLf9uow09W
         /q0g==
X-Forwarded-Encrypted: i=1; AJvYcCXvFtVtg9BxZp3TH/99UnuVvWPzYEPM8hMqkCshhJAdqqLwOtxLw1kR7RnJpPR1URykfJeO441QmNbbJTAmFfKlheA=@lists.openembedded.org
X-Gm-Message-State: AOJu0YypT6tXEl0YKyHCnnuy8LZQIizc5fqHnykfwMSnd9Eub4F+w8dD
	VQdEWfmJ+KvCz/RlJJ1jDIPlmhJgkUya+vUHyc2cgY/akZTFmDe9frcRPMwSx2gsnGxRRQvyjIA
	ryF/rOfpdp/MRbpkMQTSZoNdlwcNt71fskqNO0vMrB6T1cutUzUCzb/id+RO8fkm3hwNJRo/VMV
	3AX8+50H3gYN4QmJXlqNS1XLWaX4VzFhp1+pafqMN0nLv76yFZvlXPgaOMdD8=
X-Gm-Gg: AY/fxX50u4MOX3+lDIlLIW6LEEZ6mWQG4uPvpkbTD+bS4Pxn6I8duRWe4FQA3ExS2c5
	wMO/XiBiArBwpEGpJ7MQ7OmAHiMIVq9svNHouc53l+fXB2kHjMwYnUhydzjwJs1SteSEF3efUEz
	dOk1SHgkOhzcErpevoN8apckLKbml5CFpm1UF7mq1TQf8wmQLVm9a025iOtK349EF8
X-Received: by 2002:a05:6214:23cd:b0:880:477a:9950 with SMTP id 6a1803df08f44-890843160e9mr138306926d6.61.1767961335749;
        Fri, 09 Jan 2026 04:22:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEKXzp7ncNB9pTBQgSdzQht+E2Dca+52ozgCP06i/xMv1BjAAgCNuDTRbM6R6Dae05jpx02Qi8il6OsBFCKYxE=
X-Received: by 2002:a05:6214:23cd:b0:880:477a:9950 with SMTP id
 6a1803df08f44-890843160e9mr138306566d6.61.1767961335366; Fri, 09 Jan 2026
 04:22:15 -0800 (PST)
MIME-Version: 1.0
References: <20260109092843.1924568-1-ankur.tyagi85@gmail.com>
 <20260109092843.1924568-12-ankur.tyagi85@gmail.com> <7fa88f7a-3414-460a-a351-25c951ffddb3@gmail.com>
In-Reply-To: <7fa88f7a-3414-460a-a351-25c951ffddb3@gmail.com>
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Date: Fri, 9 Jan 2026 20:22:03 +0800
X-Gm-Features: AZwV_QgHFiZGALxe6WVYGIp3PBsQjaPDjjs72Ps1LFUeW9bRlw2-_h5KBMb7kOQ
Message-ID: <CA+s=J=xEEB4g4EPjVEqwRqMf3w1EfTwJcHvUhzzwtnLXTvAe1g@mail.gmail.com>
Subject: Re: [oe][meta-networking][scarthgap][PATCH 12/12] unbound: patch CVE-2025-5994
To: skandigraun@gmail.com
Cc: ankur.tyagi85@gmail.com, openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDA5MSBTYWx0ZWRfXyx1GQFI/PiHG
 iqbNSJkHWi8dg2rsOFNxgz9ev8tpcIS7rCwlcSbkH0skVn3IKunpqF2m5cmWGRHhjQE+5azXKeF
 WbEYYuTzdB1eZv/NHhFIt7zXTPy0k5WUYEqYcbxFNM025iUxEzRSlkGfTh8/ZATfBynBfPUfM5E
 nCbGkHF8q9qWLHFInRhhhYG8jWqz4ZoRAca/YS6cBQrIYe4Akig1NAKwMVXi6GQkkDDIp6tmtEl
 ksfvY6VjPIXRcmNlwDD9QY56Y2elG341a9ZKmjTgApsbZfJVPqJN5ilIfeHSF/8oz7DAOkmCfrs
 8c3sEmaV89q+ItOHHN8Kjr/QV5twmQIfp/Z0PvHoBqeiM8XoZK4kww3XyxIZsPQvH4U3dUyiDVJ
 Rt3f3iGZffOHQbc98JkpOUgO/XUrq96lDler51pDGi4zgrT19ZhvcHFyXEpCEU6MWcv8lZ2PS8d
 wao3alwvfXtSNUwz+Zw==
X-Authority-Analysis: v=2.4 cv=JIs2csKb c=1 sm=1 tr=0 ts=6960f2f8 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Q4-j1AaZAAAA:8
 a=LfyobFfSOxCvlWM3D3UA:9 a=QEXdDO2ut3YA:10 a=UzISIztuOb4A:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-GUID: lECFL45QcTJe4JdnG2bzeQEzF-jtS9ZD
X-Proofpoint-ORIG-GUID: lECFL45QcTJe4JdnG2bzeQEzF-jtS9ZD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_03,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601090091
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 09 Jan 2026 12:22:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123298

On Fri, Jan 9, 2026 at 7:42=E2=80=AFPM Gyorgy Sarvari via
lists.openembedded.org <skandigraun=3Dgmail.com@lists.openembedded.org>
wrote:
>
> Looking at this, it has been submitted by another contributor some time
> ago[1], but it seems it wasn't applied. Was this missed accidentally, or
> are there some issues with it?

It was missed. I will check and include it in next testing.

Thanks,

Anuj

