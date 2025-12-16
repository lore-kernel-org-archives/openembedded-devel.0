Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0AD5D5C0C0
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 01:55:51 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11771.1765850149249274334
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Dec 2025 17:55:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=RWe+a+2E;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=CdLAoWAX;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BFLGaOw2019074
	for <openembedded-devel@lists.openembedded.org>; Tue, 16 Dec 2025 01:55:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wtGA0a9wJ2FLnFu0hBPbAQqVfm2AATwG5rvQY4vjY0c=; b=RWe+a+2E3M3Qm24d
	E52C/Gek1vHYqXxVTnt3lFn5QiYDrfvH5is/ucjh6uPol5ewGbEUPSjeiLz+3f2U
	+K73MKozpDXi6OQ8SID0JK519dozGceDQApzqWZprRfK8xBMRyOERmisASZYHo4Z
	3+58EWYI0JS6JN3CDBZN2nV5/cqnN8g69JXWehAdhymcJN4e037wMSnHs/Jg2LGn
	jZ8SoYG/yVHrBOb4DnEkxNNAA5EWmnMl7ujiu4pQVaz1O6aVAQeFkWk3MQTHqB9K
	SNV73NWhgnWfYI1XBRP8XU824ljtFoqNlxAniUfAxiyH2avRxwPDHKcFyQGb61gI
	f/aSlw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b2nu1hm4c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 16 Dec 2025 01:55:48 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8bb3a245d0cso821323285a.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 15 Dec 2025 17:55:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765850147; x=1766454947; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wtGA0a9wJ2FLnFu0hBPbAQqVfm2AATwG5rvQY4vjY0c=;
        b=CdLAoWAXkYCoI25wvr/67CwRZsYiFaGKHlIx+gISVcPWxevRPaN9k7fnJe0XzxuyUM
         qJvGfXs86fNWeC2DcFPTrgUnQ2eC3DytJKJ64qEmAEwtcNxiyhosdUy1/5GF9EcYXTn1
         Lv9MXnr8vSpzsyvdVxAu+F57j9QFgCxNkNrWeD86tHBTQR3cWTaKhK1vob3tZH8XeGry
         DddwkmOWen7eYperex8lQRX0GK91aA8ZxdAQZ2LyEe7nhj1pcxyTl337x01hz190gZoF
         TXUO7TLWi2//cBASZVaQbJlWhOQo7xVgvXx2iYJZqugPBC7d07UVivjnkzDaWGXGHKsJ
         3FxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765850147; x=1766454947;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wtGA0a9wJ2FLnFu0hBPbAQqVfm2AATwG5rvQY4vjY0c=;
        b=gu8kjqKgHiJUDLWDbgx/d0BW869BNtXPvXLInXb7KA/GMWEO0A2AvJ3rTFnOXugEkf
         Y+Cnu4Dzln90f0311EEvNuxU633q/prKnwbyhPOh8v68cQDxTf88s8JS54+SnGKaFaUV
         KtIMM3XYkgi4GbltPxYQXWift/VhNSgDriy3r5NH7q8PvGhioECKnafhgEOU3yCI71qY
         s3WMrv49wlZ8BKrKp6W4v7I7WTPI2zPFCvjbpdErrnZ11oOWZU4RIn6uHBJJrEGVr+F9
         lS3qIVddXdIokofsQ6Um1W85o8ZajVaU2HfjHe6IaGWZ9uE0ipuDp9EVXtvjaynNbDGU
         mzMg==
X-Forwarded-Encrypted: i=1; AJvYcCVFt0cddwkm+5RxRGZaZmBDI76O91XEq/Y6uqww5UkTqgsMcPSWcdIHieM5TWT05a738vJPy8O01+4A05gHZ5Jrn5c=@lists.openembedded.org
X-Gm-Message-State: AOJu0YxdGcXRo+FlEUbeL1z7S70q+kc2Tgdtrs3GIT0kxUrnlf65oZKI
	8wxmHHbBbWwTMcNV6I2ZuO/15mZP+flju9EGHNOYM7Eke9INp8ZwWO4WnfqjcDPZjAu+x2mVO0H
	VTdAJXugoQsOzPEfEV/AuiHY9QH6dQ7QV8X6k+FUauQAq9ag6eDWEj5ek1DY7hpWK4hVuPF+e53
	iAyLzCxQOUuHsYOHWAk7VZRVautY+jKvUZTWSygP4w8U42WEAvze/fw20NmTU=
X-Gm-Gg: AY/fxX735r0adk4koPkVuiVWXhzOSSuSq8hzmTBCAV6GrT4Q0KFd1YT50gIi0kU3Mjp
	mVyTNun6M9ym+QbSSmo5b/7YgYSMWX12ZQrj5CvXLeMVyY6rZG+SSN6jqgukmk5FmTuLbUUPLB2
	O5X5kqnBUVyZrOlVHEmHfex5iPEIIFq31ZEpzpKuY0sVT6lRAfeiua0K0477o6UCIr
X-Received: by 2002:a05:620a:469f:b0:8b1:59d9:f1f2 with SMTP id af79cd13be357-8bb39faf7b6mr1847407585a.24.1765850147432;
        Mon, 15 Dec 2025 17:55:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGd+TL+EgiYRiaLXmSriH+/I3ywH7u2cqpQ/6iDYNpJOXpS99jJg2lm1L7grbyKgK2krFbjwDjZT8GFVIVXOxs=
X-Received: by 2002:a05:620a:469f:b0:8b1:59d9:f1f2 with SMTP id
 af79cd13be357-8bb39faf7b6mr1847405085a.24.1765850146894; Mon, 15 Dec 2025
 17:55:46 -0800 (PST)
MIME-Version: 1.0
References: <18802E459FACF88F.1129279@lists.openembedded.org>
In-Reply-To: <18802E459FACF88F.1129279@lists.openembedded.org>
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Date: Tue, 16 Dec 2025 09:55:36 +0800
X-Gm-Features: AQt7F2oPk-ihaQi26Zg4Qu8vv2mL0EnoMK6JEcNXQEWbPFcw32GbJxstaTRnRlc
Message-ID: <CA+s=J=w4qe+BRS_J91jehOZCWCNNhsCEVCRQPn0S1v0R9UhNhw@mail.gmail.com>
Subject: Re: [oe] [PATCH 00/10] Scarthgap pull request
To: anuj.mittal@oss.qualcomm.com
Cc: raj.khem@gmail.com, openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: F154fSxx-3L1q9PyIJBshjCv4b5-S2nD
X-Proofpoint-GUID: F154fSxx-3L1q9PyIJBshjCv4b5-S2nD
X-Authority-Analysis: v=2.4 cv=AOuEbwt4 c=1 sm=1 tr=0 ts=6940bc24 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=iGHA9ds3AAAA:8 a=Q4-j1AaZAAAA:8
 a=EUspDBNiAAAA:8 a=N-mNEbiPeM9FzXiCntUA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=nM-MV4yxpKKO9kiQg6Ot:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE2MDAxNCBTYWx0ZWRfX9m3jSzujJuUu
 /CU6Ms0agxv7cDalqu0xRHWhJIt5x6Qb8USApUp7q7R9GSJ9JAzLzpDBj3Ux+aKOSgfgvuyG0Ne
 NHTyPTHUhdf9b5U/2M2rRwncpIG+3hrho8O9P+PlHS5FimzlkbUfh+JFWnoOEF2ZD3E69YZmDtc
 wAcEfOTb4SfMWeV7eXyXTodUuUTyzd30+4q1sA7fD7eVOPhNAWppmL1lYcbqv2QVoq1zV7EnASF
 CQBxjPMPi8LJ8g81TPKfXG8y37JsZ4M88WPiMBNEUlYZeoa1cNKyfTLq2mLpk54DEvjo+PHO8UB
 dUJMxt9he8xF9GhYtoT2sSA8Gft1OqZKFh1BLuIrn5FXikW2KlkgmGinwB8QlpEPm/G+MjovI6e
 Ll2HO5gCtYfe/Bq59Sr4wWuzlfZmjg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-15_05,2025-12-15_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 bulkscore=0 phishscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512160014
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Dec 2025 01:55:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122674

Hi Khem

Can you merge these please if there are no objections?

On Thu, Dec 11, 2025 at 10:05=E2=80=AFPM Anuj Mittal via
lists.openembedded.org
<anuj.mittal=3Doss.qualcomm.com@lists.openembedded.org> wrote:
>
> Please merge these changes in scarthgap.
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/builds/1172
>
> The following changes since commit 7ed4330bcf1ecd4aa34bfbe1fd7079381b62b1=
e7:
>
>   net-snmp: Update Upstream-status in the net-snmp-5.9.4-kernel-6.7.patch=
 (2025-12-05 17:46:29 +0530)
>
> are available in the Git repository at:
>
>   https://git.openembedded.org/meta-openembedded-contrib anujm/scarthgap
>   https://git.openembedded.org/meta-openembedded-contrib/log/?h=3Danujm/s=
carthgap
>
> Ankur Tyagi (3):
>   python3-django: upgrade 5.0.11 -> 5.0.14
>   smarty: update CVE_PRODUCT
>   libavif: patch CVE-2025-48174
>
> Hitendra Prajapati (1):
>   wireshark: fix CVE-2025-13499
>
> Peter Marko (1):
>   nftables: remove python dependency from main package
>
> Sudhir Dumbhare (1):
>   hdf5 1.14.4-3: fix CVE-2025-2912
>
> Valeria Petrov (1):
>   apache2: upgrade 2.4.65 -> 2.4.66
>
> Vijay Anusuri (1):
>   proftpd: Fix CVE-2023-48795
>
> Viswanath Kraleti (1):
>   gflags: switch Git branch from master to main
>
> Wang Mingyu (1):
>   corosync: upgrade 3.1.9 -> 3.1.10
>
>  .../libavif/libavif/CVE-2025-48174_1.patch    |  27 +
>  .../libavif/libavif/CVE-2025-48174_2.patch    |  31 +
>  .../libavif/libavif/CVE-2025-48174_3.patch    |  27 +
>  .../libavif/libavif/CVE-2025-48174_4.patch    |  72 ++
>  .../libavif/libavif_1.0.1.bb                  |   7 +-
>  .../proftpd/files/CVE-2023-48795.patch        | 785 ++++++++++++++++++
>  .../recipes-daemons/proftpd/proftpd_1.3.7f.bb |   1 +
>  .../corosync/corosync/CVE-2025-30472.patch    |  69 --
>  .../{corosync_3.1.9.bb =3D> corosync_3.1.10.bb} |   5 +-
>  .../recipes-filter/nftables/nftables_1.0.9.bb |   2 +
>  .../wireshark/files/CVE-2025-13499.patch      |  45 +
>  .../wireshark/wireshark_4.2.14.bb             |   1 +
>  .../recipes-support/gflags/gflags_2.2.2.bb    |   2 +-
>  ...atch =3D> CVE-2025-2913-CVE-2025-2912.patch} |   3 +-
>  meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb |   2 +-
>  .../recipes-support/smarty/smarty_4.4.1.bb    |   2 +
>  .../python3-django/CVE-2025-26699.patch       | 100 ---
>  ...ngo_5.0.11.bb =3D> python3-django_5.0.14.bb} |   4 +-
>  .../{apache2_2.4.65.bb =3D> apache2_2.4.66.bb}  |   2 +-
>  19 files changed, 1007 insertions(+), 180 deletions(-)
>  create mode 100644 meta-multimedia/recipes-multimedia/libavif/libavif/CV=
E-2025-48174_1.patch
>  create mode 100644 meta-multimedia/recipes-multimedia/libavif/libavif/CV=
E-2025-48174_2.patch
>  create mode 100644 meta-multimedia/recipes-multimedia/libavif/libavif/CV=
E-2025-48174_3.patch
>  create mode 100644 meta-multimedia/recipes-multimedia/libavif/libavif/CV=
E-2025-48174_4.patch
>  create mode 100644 meta-networking/recipes-daemons/proftpd/files/CVE-202=
3-48795.patch
>  delete mode 100644 meta-networking/recipes-extended/corosync/corosync/CV=
E-2025-30472.patch
>  rename meta-networking/recipes-extended/corosync/{corosync_3.1.9.bb =3D>=
 corosync_3.1.10.bb} (94%)
>  create mode 100644 meta-networking/recipes-support/wireshark/files/CVE-2=
025-13499.patch
>  rename meta-oe/recipes-support/hdf5/files/{CVE-2025-2913.patch =3D> CVE-=
2025-2913-CVE-2025-2912.patch} (94%)
>  delete mode 100644 meta-python/recipes-devtools/python/python3-django/CV=
E-2025-26699.patch
>  rename meta-python/recipes-devtools/python/{python3-django_5.0.11.bb =3D=
> python3-django_5.0.14.bb} (65%)
>  rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.65.bb =3D> apac=
he2_2.4.66.bb} (99%)
>
> --
> 2.52.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#122586): https://lists.openembedded.org/g/openembedde=
d-devel/message/122586
> Mute This Topic: https://lists.openembedded.org/mt/116729072/3616702
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [a=
nuj.mittal@oss.qualcomm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

