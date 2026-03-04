Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86A1BEB7EAC
	for <webhook@archiver.kernel.org>; Wed,  4 Mar 2026 08:28:42 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13796.1772612912361463928
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Mar 2026 00:28:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=TxCr3LDp;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=Zu1jiCPZ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6245SLfr2274966
	for <openembedded-devel@lists.openembedded.org>; Wed, 4 Mar 2026 08:28:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BSXIOz4KyIjsZ4y2aje7fUGR26brlAUULVHEI3t3HAo=; b=TxCr3LDpH77LMeqC
	DXEJZZJMBcfQWTtMl6wC9Gwg3up4HbLnRw//kiTy6eYaNzr0LDpODTHsLU7tvZkc
	AHwEhrC0+QN3s+OhcixOYIMIMjwGkSOPCNApUbCPXdnTQ24QANqAOlXy7K13yhHz
	m5CCSR12TR2Iz3MwK0Wb0dyT5wIO4xcO+bbXCkYLwX5k7YSqIHs75OpPOLYA3eqW
	GjHEFsnCqCfbGLM58awnc0NhPXwG5ZAhSn2l3uUTNbrrpAlMAaWB9h+kdOjeCJ0B
	c0ivyZwcEID67lkfJJPOjCRglopJbks03OuFFJ6HgKhMFHFoI4DGnFHk8bkwd1m3
	96NSGA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpc4ms1xm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 04 Mar 2026 08:28:31 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-899f1c1e4d6so217028326d6.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 04 Mar 2026 00:28:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772612910; cv=none;
        d=google.com; s=arc-20240605;
        b=g+W6va6MvF3mUCW8KLc9Nx2IKjg7njr104yaxqkOSIWcTSU+KyKodVlAcot94Yy0L0
         +4so66q9y0WGwDddGmldLkMveKrfwA47l5gSO1BQnhUokcBurHuB2z8Vx+f4nKEHsca+
         X0FBYeRtTZ3OIA+yQ+PNA45tvt/j/EhSwz2zukxv7i3U+wjTGF/Hu1nsmcsmmUR5Qjr7
         tin5jdnUjUWofYwsJVC70EAss1omhnTWRo7RM5uj8PLWCYPnqqXCFiPZhI3DsVruJBqf
         BfUu6Y3LXNMM+8PMUwyam2mC3Xy7X5e1ElGej1dZOJPDuaR9Ac0qSzPKMMSGEMCfxKaH
         rFXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BSXIOz4KyIjsZ4y2aje7fUGR26brlAUULVHEI3t3HAo=;
        fh=T4CPLHS+o6DAwGFfKmQ6x8qUYUzzMdir05T+ffiJoHU=;
        b=YeXmjN9mw8U8wNn6vTTOmvE7RIZ83z5II5TPM7LnndeDHkDA5rKztMgQVZ74jcakdk
         QG48BkXAbONP9cwMBqWPGQTR1X3QcflH1D3vpuy/835ggQzQ+P8Y+6lKKGsF0uThKgJe
         39holHokQHrZj8u/xEGfNyV03BZMflLnOADur8n8dHx3IPqvsoT1dXEI84KnU7GuZrOJ
         Go+JROfjAmh6/gTNUEPB3Q0hXONmuFMU9gg5Vj06dACyZdL9xbR1BWyDeFojDqNqwwO9
         qPOcofyfRf8uPqYCi/We0DrJkhDa0oV4Iweek5XX5GaZSI47Ec/OPiVkRtXRaFuz5PV9
         FHEw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772612910; x=1773217710; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BSXIOz4KyIjsZ4y2aje7fUGR26brlAUULVHEI3t3HAo=;
        b=Zu1jiCPZj8o+RSJuAb1+upnv4sosXov9ixamUMj4kAAzCUAq5fAz+ca6g1Yk3aC2Ey
         y9exePeU0wcRhO1lvpFUP476ZA27Olubbj6//8J6D/V0OlWbDphyles2ecsuAwQQ2ddI
         S5pmLPU6Y8SQxq/rsRa2qMxg+iw8n0WCt61rHXh/OV58wAAZ2VAtQ1ZDchw7oTXh7keT
         oT0KnpJaPh8x9vADM19GwS+ru3bLlh4MswpUTqKsWeNEOWC19Tc/fM1zuermDjwSyTsM
         Lvo44UekYMCx6cPTQDOm7pI+clvmIQpE/YxcQzBCbGY+oOsHbiD6eT0jZR6Vh2a/4P8O
         fsVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772612910; x=1773217710;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BSXIOz4KyIjsZ4y2aje7fUGR26brlAUULVHEI3t3HAo=;
        b=RB9o3w/tuKYKduzsh/vNusQUbw5R6/7gr+ZeUuonKcoQJhg2fpsEjRyYI1BUZAhPTS
         CMCKJAKduJ2g+MeTdcY+ockrEL0mwoRKL8ddbphm+aAV99l6hy4olZYP2XtbD8yXHh/h
         dZ1/rABnTKbFg09ny7gnOYNM7Uf3ewuFLkA0kHT+LhZuekBrYQ0yJQhWjDDFQKn1qh2Y
         3wVnp7p21P37QtekNgXzcrPWYKg82WdMW5LM9dOcV/JWfCuDHp97Wvnqp/B5uNc7gS6p
         MaK8ogBWxkn2ffQ05/yYctnJJDqRWrHszYyHLjf3Dk+y7cDUUAWpUo+aRzvuj1Yxj6Cg
         6Wtw==
X-Gm-Message-State: AOJu0YzNQ43kXxVZ71oWtHmFdQjTsa0NflLrn/A2caE8DqBsz8kBuHQJ
	rq/HzKJ+VdevLdCYTxU+CiJPtxbbHw/xjolDjACaM2HMC2bauu3C4n42Qs1Ra7bHZXTE8znSiEy
	OzqpeYkUhKC7Q8QvqvaXz3xw8dQZLeP070QsqEztKENFimvEWJvZ4BeosKuDJ1OXOaVxa9iMQ7M
	N/+iaM35DdGostfi3EFe87/Z6pU71r3WMDBzdrMSny+cb9IGAZhweRif+aeoY=
X-Gm-Gg: ATEYQzzRR0LzSfGjAWICA67eSKungVUap88dwQTWBuNeKLNodmgywpLOSKGVzSFYvAS
	1ydoAtvDMi6nPtNsnCbk7Rs6ke7H6BEW2dUVbX6SLlxhVIg2cfW9gqUBX16VJ8boBpQiHM6TArA
	9ywQOXxWJpJY+UGjtn1D6fXI+EF23JwggQ4Ztx2gkqHRhMCvh6aZLd1JkH72uwyyYM3bm85fl/G
	/Zp
X-Received: by 2002:a05:6214:1d24:b0:899:fc12:f21e with SMTP id 6a1803df08f44-89a19d219f7mr15056536d6.40.1772612910544;
        Wed, 04 Mar 2026 00:28:30 -0800 (PST)
X-Received: by 2002:a05:6214:1d24:b0:899:fc12:f21e with SMTP id
 6a1803df08f44-89a19d219f7mr15056326d6.40.1772612910104; Wed, 04 Mar 2026
 00:28:30 -0800 (PST)
MIME-Version: 1.0
References: <20260304072657.4926-1-gitbeam@proton.me>
In-Reply-To: <20260304072657.4926-1-gitbeam@proton.me>
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Date: Wed, 4 Mar 2026 16:28:19 +0800
X-Gm-Features: AaiRm53bufBBsQW7WlbUmlaOpOT-JY8YKcPY2TFR30C2OT2oi-bNneebZxG2mqU
Message-ID: <CA+s=J=zba2Z8j9uULnJpORuOyR=_VKnUDGGyz59KUD1PzQ+z4w@mail.gmail.com>
Subject: Re: [oe] [meta-oe][scarthgap][PATCH v3] ntpsec: upgrade 1.2.2a -> 1.2.4
To: gitbeam@gmail.com
Cc: openembedded-devel@lists.openembedded.org, G B <gitbeam@proton.me>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: E0CpqzrvFV_eWaNE2z60UT5jXmxal5db
X-Proofpoint-GUID: E0CpqzrvFV_eWaNE2z60UT5jXmxal5db
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDA2NSBTYWx0ZWRfX5BhaZ1n2ht9v
 piACJCppCSx+Wz1qZCUrWlnhHTuaQ97nbWXyTIYqj+CGHcAK2qkBIyFAMRrRKlbcQ7T4209vQHI
 7d4stQk/ImdZwxitM97WqFCRnx9o6kNYAc7hq/mva4tqcdBsTGWYH9eVnNw3mKkcXEz30dRbMdI
 I+E2njs7K5rIPRMBdUtSmoo3q3mp0LB4OWEfFrPSEKXKLbAtqYFYkdmEY9Nl+nZj200KhSYn6Ay
 tPlpuCfo4tOju0mqukeIkW+hmzvDgmEOjLon3ciB49J/k+BA0L25hhpUUxFxoLn0gQJFupBvE18
 AlsB1pOFUUqgRviZ7F0hoDGwUIzC7qIY/kEOQDuklSsmer8vWUDBZs36S1+ZW12VOWrKTBZNOjl
 T+VwoQsEUaxZqYhwh6tceTUZV8ltjxu0xNQxm6pF4X1h0UhbXda50QtAZYT9I5N8guXp6v/rI/p
 h1ql2ZPhCu0V3yChy3Q==
X-Authority-Analysis: v=2.4 cv=C67kCAP+ c=1 sm=1 tr=0 ts=69a7ed2f cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=d2pef_z3AAAA:8 a=Q4-j1AaZAAAA:8 a=EUspDBNiAAAA:8
 a=YCcPCemS0LjaqKJXVqIA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
 a=ngWb_2aWTFnQvLyRU2d5:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_04,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 phishscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603040065
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 04 Mar 2026 08:28:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124842

On Wed, Mar 4, 2026 at 3:55=E2=80=AFPM G B via lists.openembedded.org
<gitbeam=3Dgmail.com@lists.openembedded.org> wrote:
>
> Upgrade to latest upstream release 1.2.4.
>
> Release notes: https://blog.ntpsec.org/2025/04/18/version-1.2.4.html
>

This does not look like a bug fix only release and I think is not
suitable for LTS branch.

> Signed-off-by: G B <gitbeam@proton.me>
> ---
>  .../ntpsec/{ntpsec_1.2.2a.bb =3D> ntpsec_1.2.4.bb}   | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
>  rename meta-networking/recipes-support/ntpsec/{ntpsec_1.2.2a.bb =3D> ntp=
sec_1.2.4.bb} (88%)
>
> diff --git a/meta-networking/recipes-support/ntpsec/ntpsec_1.2.2a.bb b/me=
ta-networking/recipes-support/ntpsec/ntpsec_1.2.4.bb
> similarity index 88%
> rename from meta-networking/recipes-support/ntpsec/ntpsec_1.2.2a.bb
> rename to meta-networking/recipes-support/ntpsec/ntpsec_1.2.4.bb
> index 9ad97e7689..c9a752cdda 100644
> --- a/meta-networking/recipes-support/ntpsec/ntpsec_1.2.2a.bb
> +++ b/meta-networking/recipes-support/ntpsec/ntpsec_1.2.4.bb
> @@ -2,12 +2,12 @@ SUMMARY =3D "The Network Time Protocol suite, refactore=
d"
>  HOMEPAGE =3D "https://www.ntpsec.org/"
>
>  LICENSE =3D "CC-BY-4.0 & BSD-2-Clause & NTP & BSD-3-Clause & MIT"
> -LIC_FILES_CHKSUM =3D "file://LICENSES/BSD-2;md5=3D653830da7b770a32f6f50f=
6107e0b186 \
> -                    file://LICENSES/BSD-3;md5=3D55e9dcf6a625a2dcfcda4ef6=
a647fbfd \
> -                    file://LICENSES/CC-BY-4.0;md5=3D2ab724713fdaf49e4523=
c4503bfd068d \
> -                    file://LICENSES/MIT;md5=3D5a9dfc801af3eb49df2055c9b0=
7918b2 \
> -                    file://LICENSES/NTP;md5=3Dcb56b7747f86157c78ca81f224=
806694"
> -
> +LIC_FILES_CHKSUM =3D "file://LICENSES/BSD-2-Clause.txt;md5=3D653830da7b7=
70a32f6f50f6107e0b186 \
> +                    file://LICENSES/BSD-3-Clause.txt;md5=3D55e9dcf6a625a=
2dcfcda4ef6a647fbfd \
> +                    file://LICENSES/CC-BY-4.0.txt;md5=3D2ab724713fdaf49e=
4523c4503bfd068d \
> +                    file://LICENSES/MIT.txt;md5=3D5a9dfc801af3eb49df2055=
c9b07918b2 \
> +                    file://LICENSES/NTP.txt;md5=3Dcb56b7747f86157c78ca81=
f224806694"
> +
>  DEPENDS +=3D "bison-native \
>              openssl \
>              python3"
> @@ -17,7 +17,7 @@ SRC_URI =3D "https://ftp.ntpsec.org/pub/releases/ntpsec=
-${PV}.tar.gz \
>             file://0001-wscript-Add-BISONFLAGS-support.patch \
>             "
>
> -SRC_URI[sha256sum] =3D "e0ce93af222a0a9860e6f5a51aadba9bb5ca601d80b2aea1=
18a62f0a3226950e"
> +SRC_URI[sha256sum] =3D "443e54a6149d1b0bf08677d17b18fced9028b101fc2ffd2c=
81e0834f87eebc7d"
>
>  UPSTREAM_CHECK_URI =3D "ftp://ftp.ntpsec.org/pub/releases/"
>
> --
> 2.47.3
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#124841): https://lists.openembedded.org/g/openembedde=
d-devel/message/124841
> Mute This Topic: https://lists.openembedded.org/mt/118129078/3616702
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [a=
nuj.mittal@oss.qualcomm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

