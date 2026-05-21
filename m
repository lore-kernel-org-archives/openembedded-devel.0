Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 176C1CD5BAB
	for <webhook@archiver.kernel.org>; Thu, 21 May 2026 03:54:31 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.29224.1779335665495699688
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 May 2026 20:54:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=h5jdg/AL;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=UObZS4+0;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L2wjtF2180612
	for <openembedded-devel@lists.openembedded.org>; Thu, 21 May 2026 03:54:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ex5+eTc9v+Vzle1auMNwCLo3e7TpC+QRAS7rGyzWMtA=; b=h5jdg/AL3AtZDQIa
	LlIVuuPpEbPjDXNGjuYyrF2cVZamw44QeeR7RYjB5kVOSh9ZldxtSmA9/O7OpJi7
	M+rOGPa8mPdAfpz1ZIrugX5/E+nSUjVWKriVM3syNzVuEB7ed8EEl74Fzm1HCZg5
	iLJSFE9yrlzoxGliV8Nk8ngC5vS/XM5xsZN4X1cD5a/OZqsCuKyYdxudX3gjUM96
	7PjmvJohiJ0VW3Hr3xItFVK4hwgsjOV4Yzx9UMzc06hdh0PmnBO5OhROmqkKDLCA
	a17UG4Es/hb2AnTIK4165NERCacDTVWxksi4iYC88RhesbggwHEXcT82ttpyVg8p
	QM7WKw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9sr305vg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 21 May 2026 03:54:24 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8aca4660827so102015876d6.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 20 May 2026 20:54:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779335663; cv=none;
        d=google.com; s=arc-20240605;
        b=VHmiqCid5ipqLdq/6pY3NUO/Ba2AlHvZa+Cn7nUT3fe0ruiNqQKe7k9KQcTpNAMfYS
         4mHYvj/BD+NJ+Tc96aa8oKqmQeQaJf2NsA4IKSyPB6T/2zFbzvR4KWyLuZfM0MnypEAd
         b61wo5K6X9KGV/zVMbe0dR+1f/uIKhpbT3ekoSgeIcIjx9wNmG0TZVySegE3dOGtigHn
         4ivj6RFC+MxzRTFQpOkA/Klh6v5dkb52vm8xYmh74weLINgGEvFN+ouaQB4sD302EA53
         EEP7TnNCBxrGV0akd/gVyBmV0TnOpmolVka0zjsWgQmR7LN/tatVqFYLP5mRmIRIslqY
         nzpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ex5+eTc9v+Vzle1auMNwCLo3e7TpC+QRAS7rGyzWMtA=;
        fh=kmONk4jZQ57u9qsxjCS5ShSdLdPrJAOCTIX4hMZMyBg=;
        b=Accp59EREpy2galU+PMHzae/hn8j0+nnmN2g79NMJHWXftEkL0VXSFr2s7JeZGp+9M
         D74eFPqaNuCksyKnaFL/TedBC5vhHxD7gxYY9LXgkEMv7YGtUAlRPSYLIPKKkxyVvav6
         oLD8ODfk1GnJZm8dXdh9Ek0tShcfNu6n//ty2cL1HVQTEeh7+kXKaQKGFZfPRfQ+pvTQ
         8+RizKjO89FvXc368jL9fuYuECdKUgUaweTQW9T/ghUSU6wRbRsEChdFoSNfZB2drQsD
         zaWAYJc+L7gS8YoITGx6DBljkVAbqF14pyPhN9CcwMcK1NK5jwDIjsS/sVg7FMBiiMzw
         GB6Q==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779335663; x=1779940463; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ex5+eTc9v+Vzle1auMNwCLo3e7TpC+QRAS7rGyzWMtA=;
        b=UObZS4+0lpU2vT1qt/FRc/yFZ2f+Cdc90nYu2n5+QnQ1grHnXFTWyofoXM3zFFnYEW
         lTONIicLlWlZKbR/6HH9aZbKcfaOxUX3Y+PRUPj6bvzOQpO4gt9N5P/yY+Gmtew6Jy3y
         Ez/AtmKcSONPXOih2Q6ynw3sK5wTPvi98v7nVkV2eduZuqvlNYJaDwuz60n50k34jbbQ
         3vOc7A7D8BcKMtA/v3LRxWLtci/XT3gYnKYcCHZY5RVOFuX9dHlMZHUP9rL6hh/518Ob
         j0wfoRb4bWKB+OKWLbPZWRtuxICM35GFl/35csRN+MpKSDlo9exNxHGXaa6T7AaFRHWo
         VS3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779335663; x=1779940463;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ex5+eTc9v+Vzle1auMNwCLo3e7TpC+QRAS7rGyzWMtA=;
        b=RDsk6BjFrqkHl5x9UGQTLROprKsdwNbMjVKkRyBnoaNSUJQWCodYKS0gKRcBSyCIAM
         IzZQDFomjltdGm34Eo5spuGlL2v7AGiYC+cmjEAqeF5toZCENfb9JEFGWV14nCOkWaBU
         3s7RRaf8CrA7nwcF/QucOB/pZWVfDdTrI55X/N9Weemn2Z2sZsamtj4pvdanwGdA5Xl3
         9TJLICZ8P7KYefhOeHrdbR4aG8K2hpO1dUsJPQr1SeuAtK1GZWAFDCQkDHy6NhD7kYOB
         9qeYJ2I2Ca0sZyv7eT/VtOxvbRT4U3xTh4VqIh28/W/nfxB9npPzDUWPTMyWpBCBmG/V
         N26w==
X-Gm-Message-State: AOJu0YwFFAmL4YcSDPzDSh+9zMw5SM0PNibc4NqG5YeC1gKHck0JagE7
	SmrrCYlHhCJsXtig35T4MU/umQbEK1GTOE9Yem1yczcRBnKyZ5tyzr4kLnJ8TqVvejvwMztGR7x
	PUCtzBVv/7xcEQSbvd/aiYCGzHclBgRibHHWv01n7XXKeZ/fycO3W8/NgLLCndQI67gECJPeYrN
	wlTGIJ/o0B3QjuMt1TQdaft0/3yAbDrgUIWysfwuVulFBWZVvaGvQNQyXyHLw=
X-Gm-Gg: Acq92OFDpds4m5BEJ7rlUyYnhhZXyfkT8TOhrCOiWCwld1NaBunFGc3afpSL9sFPyj6
	rDCWDoxvlHswT6MSVIBR/rz4NyJe+obFld4X5zEHMN2lT7O2IM3SMoQT9v+1bLQrKIXo2zxQhDc
	QIV+jNkKWUvPO2iopnu6JFx+OMTSe4F1N/vvOXb5zqv3rx9lHoYagh6trKPwZxF6BiUXqZ5u4VA
	cJe
X-Received: by 2002:a05:6214:4589:b0:8ac:b1ad:3a24 with SMTP id 6a1803df08f44-8cc6e369142mr20815436d6.27.1779335663524;
        Wed, 20 May 2026 20:54:23 -0700 (PDT)
X-Received: by 2002:a05:6214:4589:b0:8ac:b1ad:3a24 with SMTP id
 6a1803df08f44-8cc6e369142mr20815316d6.27.1779335663094; Wed, 20 May 2026
 20:54:23 -0700 (PDT)
MIME-Version: 1.0
References: <20260520122908.3151647-1-hsimeliere.opensource@witekio.com>
In-Reply-To: <20260520122908.3151647-1-hsimeliere.opensource@witekio.com>
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Date: Thu, 21 May 2026 11:54:12 +0800
X-Gm-Features: AVHnY4ISESUsD85Hpm5OYGQ_kzeLkwzMb6l8rs8KHly8duHEzeWY9-i1V0HbKRU
Message-ID: <CA+s=J=xWZzXc_1DW69Ni04bRjpvKUvzt6pkoNL5MwzTZLA16aQ@mail.gmail.com>
Subject: Re: [oe][meta-networking][scarthgap][PATCH 1/6] dnsmasq: Fix CVE-2026-2291
To: hsimeliere.opensource@witekio.com
Cc: openembedded-devel@lists.openembedded.org,
        Bruno VERNAY <bruno.vernay@se.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: F3ZMBd1y_XIxcvKhxNj3SITYOsI61ON-
X-Proofpoint-ORIG-GUID: F3ZMBd1y_XIxcvKhxNj3SITYOsI61ON-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDAzNCBTYWx0ZWRfX98XdmWSXMAAo
 puJJWAi/6B7NkLldaJOycMFVBbmVVs4ac30FVWbBaImcLb/IO5/TqeUrPMfihxro17RKl//d73v
 hPRBn2+Rx7ZR6dVe3Vl6Z5gr7c0NEPh9qdrYOXPelldgRrDuSySy4z6f1GaHP35Md5osODFDg0O
 wTO1Al+KDU/FNtBNR4Z77/mlPPJKgZjjg5RXYVL0Jk9iwx8BW1iMzcTp31BxiwRFG6AQhTAI2zu
 eECW7rQWfDiq95l7KYrGvVnQG4wyWTS98UUDFyB+lJMjHxNB2UR9nxOe18whMHoZcOJvhYoLl3A
 fnLu53Wz+OYzp2PE52KRxLCsKPZ21DZzp4vxC32D8G28PSebgwIuhtXq1iyUhhrSn4gEovzU8z8
 a/XUS73K82OcLCOz0NP+JPLALJnj55EISROgPMIR5jJrjvaK97A7gCUA8Z8iha2lw8TALkihaP1
 wMOAVl9zP1MmdpTGYxQ==
X-Authority-Analysis: v=2.4 cv=L+YtheT8 c=1 sm=1 tr=0 ts=6a0e81f0 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=xNf9USuDAAAA:8 a=omqxvBYPAAAA:8 a=Q4-j1AaZAAAA:8
 a=Crg_IfaRAAAA:8 a=UaCSvCwVAAAA:8 a=h6XwZPYzNpx7yumGU1YA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=LHRESdT2jHCYgTnjdhDM:22 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=WKt6puP8o2WZ-s9Jsdj1:22 a=G716TjlRC271eIfUcke4:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210034
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 May 2026 03:54:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127126

On Wed, May 20, 2026 at 8:29=E2=80=AFPM Hugo Simeliere via
lists.openembedded.org
<hsimeliere.opensource=3Dwitekio.com@lists.openembedded.org> wrote:
>
> From: "Hugo SIMELIERE (Schneider Electric)" <hsimeliere.opensource@witeki=
o.com>
>
> Pick patch from [1] dnsmasq 2.90 debian bookworm pacthes.
>
> [1] https://sources.debian.org/src/dnsmasq/2.90-4~deb12u2/debian/patches/=
CVE-2026-2291.patch
>
> Signed-off-by: Hugo SIMELIERE (Schneider Electric) <hsimeliere.opensource=
@witekio.com>
> Reviewed-by: Bruno VERNAY <bruno.vernay@se.com>
> ---
>  .../recipes-support/dnsmasq/dnsmasq_2.90.bb   |  1 +
>  .../dnsmasq/files/CVE-2026-2291.patch         | 41 +++++++++++++++++++
>  2 files changed, 42 insertions(+)
>  create mode 100644 meta-networking/recipes-support/dnsmasq/files/CVE-202=
6-2291.patch
>
> diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.90.bb b/me=
ta-networking/recipes-support/dnsmasq/dnsmasq_2.90.bb
> index 38fa271dc3..3281404e42 100644
> --- a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.90.bb
> +++ b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.90.bb
> @@ -16,6 +16,7 @@ SRC_URI =3D "http://www.thekelleys.org.uk/dnsmasq/${@['=
archive/', ''][float(d.getV
>             file://dnsmasq-resolvconf.service \
>             file://dnsmasq-noresolvconf.service \
>             file://dnsmasq-resolved.conf \
> +           file://CVE-2026-2291.patch \
>  "
>  SRC_URI[sha256sum] =3D "8f6666b542403b5ee7ccce66ea73a4a51cf19dd49392aacc=
d37231a2c51b303b"
>
> diff --git a/meta-networking/recipes-support/dnsmasq/files/CVE-2026-2291.=
patch b/meta-networking/recipes-support/dnsmasq/files/CVE-2026-2291.patch
> new file mode 100644
> index 0000000000..c59fa031f9
> --- /dev/null
> +++ b/meta-networking/recipes-support/dnsmasq/files/CVE-2026-2291.patch
> @@ -0,0 +1,41 @@
> +From c3059821cd52b423592aeffef7935fdf81035a81 Mon Sep 17 00:00:00 2001
> +From: Simon Kelley <simon@thekelleys.org.uk>
> +Date: Fri, 10 Apr 2026 16:29:31 +0100
> +Subject: [PATCH] Fix buffer overflow in struct bigname. CVE-2026-2291
> +
> +All buffers capable of holding a domain name should be
> +at least MAXDNAME*2 + 1 bytes long, where MAXDNAME is the maximum
> +size of a domain name. The accounts for the trailing zero and the
> +fact that some characters are escaped in the internal representation
> +of a domain name in dnsmasq.
> +
> +The declaration of struct bigname get this wrong, with the effect
> +that a remote attacker capable of asking DNS queries or answering DNS
> +queries can cause a large OOB write in the heap.
> +
> +This was first spotted by Andrew S. Fasano.
> +
> +CVE: CVE-2026-2291
> +Upstream-Status: Backport [https://thekelleys.org.uk/gitweb/?p=3Ddnsmasq=
.git;a=3Dcommit;h=3D014e909f787e808bb35daa546d3f8f3663918de2]

For this as well, please add backport notes.

