Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0805FCD4F3D
	for <webhook@archiver.kernel.org>; Thu, 21 May 2026 03:40:41 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28913.1779334838935156750
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 May 2026 20:40:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=Iy4HJLMB;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=EsuCGSGp;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L32A9d267056
	for <openembedded-devel@lists.openembedded.org>; Thu, 21 May 2026 03:40:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	grMvCqFEqJWHVu9WgBdLFQpxaNCyVbBD6J3NRURTXQg=; b=Iy4HJLMBKFbvUS51
	4dSl3ishezRPn2Ud9xlruWL6SdmdEc370y/FfBbVKPFi4o+tiJkC2ZkrgeAKCh2E
	QeFjro1WFcMgpgs9JSZ33hZpJRsLtirWdn9xOKE9qg5WD4CbCSqniKdCKnw8aolI
	BmLI6lkpDoUEzwt0JhdxdyaS5PB9BQuIx8+yAgQwL7gSDTrOx0XpB9sv7hlpqXSB
	v87l7loOpxF/inmib6jHz+8lL+mgffnwcB2n+ejyCJZqNY7FFUGFBckBtg9fhgcP
	1GmljNbSRRZYcf8kI2gfvaonNHqCIM9GsRy6uPLNd/J3N6v1r2EMF6SIirdgalxq
	HLSFGQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9amxurhj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 21 May 2026 03:40:37 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8acb0aa51c6so148101166d6.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 20 May 2026 20:40:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779334837; cv=none;
        d=google.com; s=arc-20240605;
        b=CTchLfgB2CwgP1tHEuwmTtPwI7hs9IGFzZDt0PRmmETwfWc8t4yBRWvFCuvHeylemO
         woeejBFQoaAh5T4387FTel0C6bHZ9xepWsOz13Pib3Ojyu+abmadKmY9yKAZ5wK7uM/p
         nvf1SX7tXijRXlagFYIW7lQmq9rAhDSied4WO0SjqEUgQ+gwb81rJ2FdK8mApHEBaA1n
         iLJY5J9BT7wDzFlYHchJ5ZhtIphsqRvTEgd298IgpDggibOYnbwqN4uuGHiye4u2yPKp
         vK/8Ro4PGJuv1eMWQlyL/+Qa8ud4lGvjJ65tOC3Cd7VD3qfyFqRVlfttNJR5Dm3FbHfb
         ZdIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=grMvCqFEqJWHVu9WgBdLFQpxaNCyVbBD6J3NRURTXQg=;
        fh=kmONk4jZQ57u9qsxjCS5ShSdLdPrJAOCTIX4hMZMyBg=;
        b=Kys3HSx2dEUc6cZsEQBhFPBT/8NqEtpyWrRXpf/4ZHzTV8niyT/3T6gMG+D7B/CGTc
         7L+1vhWP22xYtmCeRiY8YCmyxSKSUWTTKfe9+dC+1495AGjGgs6SOqvNA0JB6owwitpr
         qNfaG4hXiMpNR/M05lhHFiWuQYyf8yrLurhMueDlpUSon3Ye0UTqRhIQlKq3hXIYz7YX
         3qrerfV0f2/rN93a+F7lzCKyksUScYbeB/y2n8YgYWmm7JVtPthbEUiWsl4vHXcs+eDu
         Po//IZ0ZHuQ36bBuVplln6S1HNeeuXJlEs3oTOCxES7jTm6Hg2wyofQYoT3DToPDYmI/
         VJ5Q==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779334837; x=1779939637; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=grMvCqFEqJWHVu9WgBdLFQpxaNCyVbBD6J3NRURTXQg=;
        b=EsuCGSGpJjXqA4apixMzRLCW7EuaxVoMi9Wqwk5dKKW8vTck/mzkGzIsJ2ozs/Guy5
         BFGhMMMMagM+tmFHLhdvUXJbp3PV2X7Qk02SgblwNdwOLxm/w9giKlpAwdSlpNPwVFnu
         a0q5jj/I3MzP6/MiEacgA5CCwETiSecGkJNvzZpWnBl5ip0dDNeaJ6qYvx7TOHG8MJsR
         eDTdk0FY+oaPqgcU73nGaCA8/fDrqr5P9lLxCIIXy5lF1WCU8OeN0pxq773MJUfrFwP3
         eNAd/HLeCI7mZcfHaxp0ZzAf39kKc3cnSGJsDFQ3aQfQMYRUZpPBPPRs1KsQ6yVkIVMP
         FQJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779334837; x=1779939637;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=grMvCqFEqJWHVu9WgBdLFQpxaNCyVbBD6J3NRURTXQg=;
        b=kCzfcVCdbg9oXw1hHbFG4h1ln3HbegsB9k9CzrXBHlyMjqedoGCqa+DSHMZUmU/9X8
         dSMdTzpgNqWuJUh3P6mkJ2DSoWn5ojBEbAjbFaCedSV6bsjmbWN9Ozc56gv2/mi4neuq
         BbSMzezEtRnHWMXJi9wB9Qrc02qBvSk17nWnBghq3zNE7k+8bK3aa4w139Ztt/3jk12e
         yNQrb/fhT3W8QUv+YvWK1lebwSnraBvxm8a3JF6bBS7MYeYamhKOUt02nPifnXAr0YP3
         QkU64yR0vIGI+pZ39dBKL5A9uAQEQBGfZx6IEC2S8DC9QC4C3qSBGSGyCaJv9/z5J65Z
         ixug==
X-Gm-Message-State: AOJu0YyJznr6VX0rDGAGghBWbYHngzI6rkm2/uJCpi7CO9QliP3XYTrh
	qsC3RPHP1tC324Lpu+ZVkERCNJFMLA3u6t251eBSN++Dj2w1uqfXRXipx52W6zYrHcOqTpK/rLK
	9EXOwJOyw0p4zE7yNGEtM4R6JtH9OPB4+GmR5KpTxrKnDUffZf5e8H05+GE28PJ0QuU9CAblxl8
	pkR5+d4+ITMcBNwcaCsVFgun+DI7RiSdsJo/OdOmUndpYygycBhNBNet36AbA=
X-Gm-Gg: Acq92OE+FPDGvRD71deGZUq1Nz6iVzAcQAhYW5DwGeUWTAmEDh73jrt0V3W5tJUwTDk
	7Toi1HTxzpKEIgua7e+NNMuFBcaC9PK/SJsZioqkguWWra9Up3xQa0J5F59Xzfl+gWuDmrXRmPW
	ZEnH1EMNMKx0Lqlt834wjMXOPOW4dNrqNTw9ysCeDX5QNbIlFZFRawXTHLwuY29jWIO8sTa24nJ
	AnS
X-Received: by 2002:a05:6214:40d:b0:8b0:33a2:2520 with SMTP id 6a1803df08f44-8cc6e92a0bamr14949066d6.10.1779334835872;
        Wed, 20 May 2026 20:40:35 -0700 (PDT)
X-Received: by 2002:a05:6214:40d:b0:8b0:33a2:2520 with SMTP id
 6a1803df08f44-8cc6e92a0bamr14948836d6.10.1779334835346; Wed, 20 May 2026
 20:40:35 -0700 (PDT)
MIME-Version: 1.0
References: <20260520122908.3151647-1-hsimeliere.opensource@witekio.com> <20260520122908.3151647-2-hsimeliere.opensource@witekio.com>
In-Reply-To: <20260520122908.3151647-2-hsimeliere.opensource@witekio.com>
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Date: Thu, 21 May 2026 11:40:23 +0800
X-Gm-Features: AVHnY4LwYAiHFhISqISqAq9LIPynxc9ete_ISA1gHJBlraKKPxJqjQyK__D189Q
Message-ID: <CA+s=J=xqR-R5cgj6OKc-ZMrEEhR5sF02qz7ZHm_haEFTRTztLA@mail.gmail.com>
Subject: Re: [oe][meta-networking][scarthgap][PATCH 2/6] dnsmasq: Fix CVE-2026-4890
To: hsimeliere.opensource@witekio.com
Cc: openembedded-devel@lists.openembedded.org,
        Bruno VERNAY <bruno.vernay@se.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: n_NXtdQ0ENeAC2UIo9oa71pa0ujYsHCz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDAzMSBTYWx0ZWRfX3Wa9JrBEO1w3
 1E1Z8A9WZGxFoWZ/UOjkqk5cF67GmiYOuviroSxgPQDCR0xh7FWOa9e7Deu1ooSR5CilDUOXj5E
 7Io8LXzGS7z8Bx5A16MRlGPxQzEnmEWNAXSujIPlyK+KLicNHcSjXdYtJDuO2yzWhRY2Ts4/QUa
 J/Bpl5/jJv9pJ7ILva+9ZuqUdso2wkmO//S3MMLGnAZUcz3iwQ1DMKZ4ePHBkejFJcpx/e7neeP
 zpwkresLJduWF+zs1ojvSYnY01HywO2k3NaWcw+sph82sa+EcFUVTD8HOvDvxHAc5L9hqN6WiD5
 XijEViGf/BJWN9sHCxQWLlwU7ylojeWYAaRFnmQNW30lOVlxttJszZQFSsPUqH99hQ1Y9JjmPTs
 Gab5/EetHYzE/k6iSxO5CkiAkzj7RlTSb5jufLrPFdZb+YH4+FAB71qR0ooaqWztv2Y0lBJ9/58
 9qLqh4588Lsx6aMw16Q==
X-Authority-Analysis: v=2.4 cv=TO11jVla c=1 sm=1 tr=0 ts=6a0e7eb5 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=xNf9USuDAAAA:8 a=omqxvBYPAAAA:8 a=Q4-j1AaZAAAA:8
 a=Crg_IfaRAAAA:8 a=UaCSvCwVAAAA:8 a=VBowi81kAAAA:8 a=u02Yx0fmtDw8TWADtJoA:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=LHRESdT2jHCYgTnjdhDM:22
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=WKt6puP8o2WZ-s9Jsdj1:22 a=G716TjlRC271eIfUcke4:22
 a=uoxt2CKr5i4t67rzx1zf:22
X-Proofpoint-ORIG-GUID: n_NXtdQ0ENeAC2UIo9oa71pa0ujYsHCz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605210031
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 May 2026 03:40:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127125

On Wed, May 20, 2026 at 8:30=E2=80=AFPM Hugo Simeliere via
lists.openembedded.org
<hsimeliere.opensource=3Dwitekio.com@lists.openembedded.org> wrote:
>
> From: "Hugo SIMELIERE (Schneider Electric)" <hsimeliere.opensource@witeki=
o.com>
>
> Pick patch from [1] dnsmasq 2.90 debian bookworm pacthes.
>
> [1] https://sources.debian.org/src/dnsmasq/2.90-4~deb12u2/debian/patches/=
CVE-2026-4890.patch
>
> Signed-off-by: Hugo SIMELIERE (Schneider Electric) <hsimeliere.opensource=
@witekio.com>
> Reviewed-by: Bruno VERNAY <bruno.vernay@se.com>
> ---
>  .../recipes-support/dnsmasq/dnsmasq_2.90.bb   |  1 +
>  .../dnsmasq/files/CVE-2026-4890.patch         | 75 +++++++++++++++++++
>  2 files changed, 76 insertions(+)
>  create mode 100644 meta-networking/recipes-support/dnsmasq/files/CVE-202=
6-4890.patch
>
> diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.90.bb b/me=
ta-networking/recipes-support/dnsmasq/dnsmasq_2.90.bb
> index 3281404e42..ecd17fa426 100644
> --- a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.90.bb
> +++ b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.90.bb
> @@ -17,6 +17,7 @@ SRC_URI =3D "http://www.thekelleys.org.uk/dnsmasq/${@['=
archive/', ''][float(d.getV
>             file://dnsmasq-noresolvconf.service \
>             file://dnsmasq-resolved.conf \
>             file://CVE-2026-2291.patch \
> +           file://CVE-2026-4890.patch \
>  "
>  SRC_URI[sha256sum] =3D "8f6666b542403b5ee7ccce66ea73a4a51cf19dd49392aacc=
d37231a2c51b303b"
>
> diff --git a/meta-networking/recipes-support/dnsmasq/files/CVE-2026-4890.=
patch b/meta-networking/recipes-support/dnsmasq/files/CVE-2026-4890.patch
> new file mode 100644
> index 0000000000..0b25239a86
> --- /dev/null
> +++ b/meta-networking/recipes-support/dnsmasq/files/CVE-2026-4890.patch
> @@ -0,0 +1,75 @@
> +From 12e5ee3495842ededf8057758ef8da59745bbf33 Mon Sep 17 00:00:00 2001
> +From: Simon Kelley <simon@thekelleys.org.uk>
> +Date: Fri, 10 Apr 2026 22:16:45 +0100
> +Subject: [PATCH] Fix NSEC bitmap parsing infinite loop. CVE-2026-4890
> +
> +Report from Royce M <royce@xchglabs.com>.
> +
> +Location: dnssec.c:1290-1306, dnssec.c:1450-1463
> +
> +The bitmap window iteration advances by p[1] instead of p[1]+2 (missing =
the 2-byte window header). With bitmap_length=3D0, both rdlen and p are
> +unchanged, causing an infinite loop and dnsmasq stops responding to all =
queries.
> +
> +The same code accesses p[2] after only checking rdlen >=3D 2 without ver=
ifying p[1] >=3D 1, causing OOB reads at 6 locations.
> +
> +Both bugs are reachable before RRSIG validation (confirmed by the source=
 comment at line 2125), so no valid DNSSEC signatures are needed.
> +
> +CVE: CVE-2026-4890
> +Upstream-Status: Backport [https://thekelleys.org.uk/gitweb/?p=3Ddnsmasq=
.git;a=3Dcommit;h=3D7b151eb60609a0139474918222806f9bcfb4fe71]

This doesn't look like a simple backport. Can you please add a note
with changes done and why?

Thanks,

Anuj

