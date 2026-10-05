Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38306CA5FCE
	for <webhook@archiver.kernel.org>; Mon,  5 Oct 2026 09:49:37 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16504.1791193767468582480
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 Oct 2026 02:49:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=msAwjP3M;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=NUAnOyG+;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6958xTef2424667
	for <openembedded-devel@lists.openembedded.org>; Mon, 5 Oct 2026 09:49:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U/HaeJqli8137cPne58XMP/GzPee6eJIQZ4rC3yl93w=; b=msAwjP3MMIlnbyZP
	MhwbtFE6GpcVJx+T34QGJN8MVCFPyFm0aV9RdaEpdRSDJO0pLeRK8g4IlRPztM4M
	JF8EJkSt34vcKh5hQ2WJwZWgkXuAEe61ZAdDdYNz4lwYO55a5dD4N/7I2N2Fw3Hl
	iVryxFxZnJCmRX2ibkhJWGnP/rgWxyqENCLC4xCb5tZDnhpHOeS8EPvw2gHnARhM
	KgjBGHV+6+luZ8Bq1S+Z65Jec+Z5OQmk3fdOPsS459nSNizSQDw4njkhm32EEgHV
	6S8ZYQ7pB1rk367JSQQ+rHyz27ttX7W3lBbkzrQBCfFelESvLJS0xNdkLgj8+B08
	t92fUQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2sr6daqu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 05 Oct 2026 09:49:26 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cb71b1443so267409985a.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 05 Oct 2026 02:49:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791193765; cv=none;
        d=google.com; s=arc-20260327;
        b=O3+4++C/B6bCpylOw0q9nsKwXUMmVaUEWUaD7xnEZy/sTzHXbHQPgenHZDwf3f3dsB
         +F6No5/f3sV6s1KmXaPlcHXq5YXm0+18o+hpCB9kIgxFOY877KXgVNV2abbj89gmaoau
         UpnBFWvBrgUPhzEsWdWLq1mYtcNTrn1I9g29X5PBhLPkua44pH4B+ubWIkMsO2p/xg9+
         oYBY9gQQvsiOKMEt+lV19ItUqMJ+1V4DUAkD/Foq3aleKbxLvO349n+l+hn0lu/ftpI8
         vUB/6/90If8J2SRBxooZ/tLjP/u2EvTPSJ1Al1SqcG3v7ZZURGDumsFILE3jfb5bmF+6
         vkRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=U/HaeJqli8137cPne58XMP/GzPee6eJIQZ4rC3yl93w=;
        fh=n0ZnAkKOhGDmrf8RLpwnC7FQ6xmEY5rofL6wXnjsXjs=;
        b=lT4yLh/PIxghGuS8tInDXZu8xarQQ/XQOUsFnbyRgjfIMNXJRM3EporW4L+ao89D1G
         mx4EOOiKPvw1XPU/Oq/4preKa3nqBbk/sM6hBncT6YeegPdT5gGs1/4UB0sCLmnfI7/a
         TvKkcbXlu5lUPmPF952J0Z/fyDX8Pw+cXYLzssoYKOWf/1OKSNPWv8VuotTLBxplfMlk
         lHb4nuQ/DQzh6iEtZriQxO+/N0Te9OUxEsqSFhci9FQe1nRVIow6tD8W2azVnaw7lRLr
         Os3vjCmIriMWsnJ7+ps3HlbxMFN4CXyFUYn2aKb5Oxg5NJtQ47MQaob1F0MslUSQ8VSy
         mtaA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791193765; x=1791798565; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=U/HaeJqli8137cPne58XMP/GzPee6eJIQZ4rC3yl93w=;
        b=NUAnOyG+xvAbY89cypXvmdsYMV/b1Q0com8KDy/OyKpcoKhS9StAxVuP1tOd7xoQm6
         hWu5248rv0uDO9yyNIdAAfuekARWQhs5JD7UZg+h9gWH0YmEc7ns9o14j0dDAfJNhZee
         FYAWz9+3dJXQfj72Vw+yfVq6MLSOhJseliHUq6JoHnwZ5+1o17Ze0QLGr1f429IJg9OO
         xDiOz2CDC+KByZgyfY2IyrWmvVetiotrYGxssTqFApnTfR/YAVCDR71IR3/ToYYYzb1u
         91eSm0lIzNVnbERKh6iuJ+TCJTlaGb/Zw1268p1IwmgLNyZg+jyhaenJ50KvCc23me4O
         N1lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791193765; x=1791798565;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U/HaeJqli8137cPne58XMP/GzPee6eJIQZ4rC3yl93w=;
        b=BXjJBmaZKQvarmrZueJrQ5HTFb3XbE+LHewOZTrWvsby965Gb76o1XeRT5ZucClz9W
         GJbnMBzg+qk/eGWezPYujdDHjkngbvfQTA5mWKQBq1CUTpW79LapweXYZAD3lDZwx9mU
         xfIpBT7+TU/M0n1ZETo98eApauohSDG08glZ11sF4A9R5eUFwOiZA58irXb5sUkHrkHe
         bJd0GEXIthP8EW4zRTNYVWKdyFktX5RTaGoy7io1rjfigWfK/EsJY/GN2aNJUMp2v0bz
         FylC4G4Ye3BlWRuUuMzsthPBvMppCeOB/52CTIIF2ZVREm57NSnvrAlyJ2/iCfCWLWDF
         OkwQ==
X-Gm-Message-State: AFuF++nDYWBY6M8wWh9WLz/BJmOTA/UCZoeh6UFT0qcSUblLvxN5MNOR
	EaeZkhhiRghn4BzqYpRvGGeGEu2f9o18c+tsy40yOWmgpPVMKUSGmY807AuRL0iGgCz5heiG0l6
	MtAf65slVOreE0y4OGDAhyq7mx6Dw/AjatMaJP70NUVR5C61SKMOV1ncBhPIU2IHYCPmdiC8kEM
	Jj05882CyhsPjZyMsvtgqZFoHZlu/JwSbV2hnAb0mKWfih+8TcQDxTGBRqSuY=
X-Gm-Gg: AYBFou02hBO22cz7wPnUdMj0kyVNfL8RLnUzYtEIG5t9AyCsca0kuYvLCt88tW5DnPh
	IGgK9LUmEXD6Q2MxcQ0/98SMSA5oli5Dbp1H5UghKm68puR3+MFmgtk9bZoHozf/lMRs/OnYxZv
	+h7JNyQ+sHpgs3Xe1KBB4hIK1/lDt1q0GwtVpCiOzIP2spUhfeyubes/dzvQ==
X-Received: by 2002:a05:620a:6f92:10b0:939:6c31:2318 with SMTP id af79cd13be357-93cf17318fdmr1294735985a.34.1791193765351;
        Mon, 05 Oct 2026 02:49:25 -0700 (PDT)
X-Received: by 2002:a05:620a:6f92:10b0:939:6c31:2318 with SMTP id
 af79cd13be357-93cf17318fdmr1294734585a.34.1791193764875; Mon, 05 Oct 2026
 02:49:24 -0700 (PDT)
MIME-Version: 1.0
References: <20260924043315.1663186-1-ankur.tyagi85@gmail.com> <20260924043315.1663186-12-ankur.tyagi85@gmail.com>
In-Reply-To: <20260924043315.1663186-12-ankur.tyagi85@gmail.com>
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Date: Mon, 5 Oct 2026 17:49:13 +0800
X-Gm-Features: AclHuK81cb6GicfxysZKSjwGAw8geBUPcwJuMgkj5Xm2uuyjSoMYfpGRm19o-JY
Message-ID: <CA+s=J=yDWh+q+D0eC10Gu0SWPjEXipA3w9RJScaXoRM4tLhnFQ@mail.gmail.com>
Subject: Re: [oe][meta-networking][wrynose][PATCH 12/24] strongswan: patch CVE-2026-78130
To: ankur.tyagi85@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDAzOCBTYWx0ZWRfXx2Ro70Iao10P
 /ZnckRQGxjNvoMxoViORiUrkA3iZZcr0IeEC9r1B6DSdWZvJrmKxmvupEf+pe78lXpTuJzqLp2G
 1qoWpDPO5bK4A+6R+hAte2jghAfrOJg=
X-Authority-Analysis: v=2.4 cv=NaBzRGD4 c=1 sm=1 tr=0 ts=6ac372a6 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=PYnjg3YJAAAA:8 a=KiMCiSwjAAAA:8 a=NEAV23lmAAAA:8
 a=Q4-j1AaZAAAA:8 a=pGLkceISAAAA:8 a=0Oj1j6z0xgsbfmDPNp4A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=sPCYT0qwnquSfqsKqTDE:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-GUID: 2McihIvQ8-juCj0tbAc-Krj0JyoYewck
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDAzOCBTYWx0ZWRfXyoyayth0q2Kh
 J2cb1PxSei++DRdHTlItgF5DJmS4O+0jAj1bgnJgiuDU8WuCqxPw4/1Rb75Sazah1m8cncIGWPr
 H4QVsGfgdDQyrXhXn/F3Q+FnqRStJVq7UCOK/1UQV24FjKv7rLm2LtqYulGp+9laprEA1XJdL+X
 TzOR4/iTjNMrOeczPB4P5H8/FfD8Piw6WzVexhWWGo6ZvOQhS9Y274GEvY4S+x33qyeuPpcXmL7
 WcXi1skUTV0a3jW9B1HzO8MXN51B0h80In51a2zqZrb1xMR3XvgmTMfXjFXgvs/fKDTV0Li2NbZ
 O/vr9FeLU8rolvvUAVHvql8jJCNWIIOV66FagT2fzIiX4XbcBvwBFZpnfp7RcWIIydr7hPUdjEx
 ZvTl3tw6GryQ/US6QU4Hh4x1BCkdwJUkeZ53Ji+nAxaKfeMLhuQs4/e+00zhn3j5F3WH/wcUzGb
 r5IJiC8Yj3fZ+bXBWjw==
X-Proofpoint-ORIG-GUID: 2McihIvQ8-juCj0tbAc-Krj0JyoYewck
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_01,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 impostorscore=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610050038
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 05 Oct 2026 09:49:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130626

On Thu, Sep 24, 2026 at 12:34=E2=80=AFPM Ankur Tyagi via
lists.openembedded.org
<ankur.tyagi85=3Dgmail.com@lists.openembedded.org> wrote:
>
> From: Ankur Tyagi <ankur.tyagi85@gmail.com>
>
> Use patch[1] provided by strongSwan[2]
>
> Details:
> https://nvd.nist.gov/vuln/detail/cve-2026-78130
>
> [1]https://download.strongswan.org/security/CVE-2026-78130/strongswan-5.1=
.3-6.0.7_x509_ac_issuer_null.patch
> [2]https://www.strongswan.org/blog/2026/09/07/strongswan-vulnerability-(c=
ve-2026-78130).html
>
> Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> ---
>  .../strongswan/CVE-2026-78130.patch           | 49 +++++++++++++++++++
>  .../strongswan/strongswan_6.0.6.bb            |  1 +
>  2 files changed, 50 insertions(+)
>  create mode 100644 meta-networking/recipes-support/strongswan/strongswan=
/CVE-2026-78130.patch
>
> diff --git a/meta-networking/recipes-support/strongswan/strongswan/CVE-20=
26-78130.patch b/meta-networking/recipes-support/strongswan/strongswan/CVE-=
2026-78130.patch
> new file mode 100644
> index 0000000000..36025c8093
> --- /dev/null
> +++ b/meta-networking/recipes-support/strongswan/strongswan/CVE-2026-7813=
0.patch
> @@ -0,0 +1,49 @@
> +From 254d971bbe7479fe5fffc34cd1dd1e349a48e7aa Mon Sep 17 00:00:00 2001
> +From: Tobias Brunner <tobias@strongswan.org>
> +Date: Fri, 19 Jun 2026 11:57:48 +0200
> +Subject: [PATCH] x509: Avoid NULL-pointer dereference if issuerName is m=
issing
> + in attribute certificate
> +
> +If neither authoritiyKeyIdentifier nor issuerName are encoded in an
> +attribute certificate, the validation in `acert_validator.c:verify()`
> +will cause a NULL-pointer dereference via `issued_by()` (the lookup
> +with NULL identity will enumerate all trusted certificates).
> +
> +Fixes: 26930a8c3e42 ("certificate factory can load certs from file")
> +Fixes: CVE-2026-78130
> +
> +CVE: CVE-2026-78130
> +Upstream-Status: Backport [https://github.com/strongiswan/strongswan/com=
mit/bee6ce27761e1f38958be36ebe6688ef963c3d22]

Some of the patches in this series had typo in URL. strongiswan ->
strongswan. I've fixed these locally, so no need to re-send.

Thanks,

Anuj

