Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47F87E6B26B
	for <webhook@archiver.kernel.org>; Tue, 23 Dec 2025 00:59:50 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.92735.1766451588797418152
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Dec 2025 16:59:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=GFgO5meU;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=C3m1WP2y;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BMFlKRh1358168
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Dec 2025 00:59:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oJygOXSVWJ1ri1K1aRRRfA2g0MAQUR9i7fm3b8sT/zU=; b=GFgO5meUq3GVfwRu
	ZipeGGAjsM+tjh25EQDlgSJonHxMpsOyYt2SgQn9SJFGLGZ9s88D4QEMmmqMEfR+
	fuydNeaZZpN0gh0P0vVNZBZ6gHDarHqmr8ac3S105A+7EX/f9APElPcDZoLGCNg7
	Cjvt4OmOHhjtm6QTCf/Vu8jVS9OGCnAVz5Asvb9G4Xt5ngH8AoTW2B6SXo1w/xgQ
	WN27IZTNWd7kMs755WI7GYugwGv7+eyjOSds4ALN9lD4LJXfi7HXZ9Semh2OZoGy
	ppV8EwLDQnRc/Qbw4OQncgENZ2hyoo1dJsqVis6D8Xuz3BLjWo+Ogx+1MPB8FXhs
	H1PrAg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b78xc15k4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Dec 2025 00:59:47 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ee0c1d1b36so121128451cf.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 22 Dec 2025 16:59:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766451587; x=1767056387; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oJygOXSVWJ1ri1K1aRRRfA2g0MAQUR9i7fm3b8sT/zU=;
        b=C3m1WP2ydaplWPFoEyzAVAXhTTvwgkppgqp2fQaHlct0Giun3TGjSam0XN/EFwdhsE
         zw+WXNrc0jwBFmnOweN4E51lQ4Dbc+ZOqIH61viC9jZ6YuywbNGMd7XWOi4Q+YYwGAl1
         0dEMxWRQlzKbooMdFwRFq9XK7P/ObV1AGMjA/RPbZnqjF2aYX98/aq/KAzFIPdeDtglH
         hNrVbwwCl5NfeaaMN/ddGo71yJiU6Mi774D09RBGgXb/6yQjISyde356AdnnXuFfgLl4
         hTzH4NABeeAGSEMEziJSEzt7ox2WTfsP6jy4HtBs/AwMhF3TtLlwhbO9sxA3nZgCtP9a
         0hTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766451587; x=1767056387;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oJygOXSVWJ1ri1K1aRRRfA2g0MAQUR9i7fm3b8sT/zU=;
        b=IhowtSxb+OLDbld5Io65uyOy5j3QGwga8cYJBgVvEnbTEvVPyL2o0x/kxKM9qWUITF
         Q04LjcRBgtGlAsEuW1bfe5RUuXElwsVU6/t6VIOG/cjmuR4YXgbxjWmjDJw3EdEtqeSH
         ppvTlenhuO3O0kGjCx2pJs7pXjMd17T/d8pKWxVUWn2VlEPkMt0Kaz2plHyTK5BUSigP
         IcDGLlzLYDwPZVwR/0uHl2A2YR1L8kK8EOVQx4L4WNrQ6pAEnlACqW3soh+2ZpUw+XTS
         KrSBTf7ZfB9CIDSfvMoxU2EFDwS4wVN844RK+H8UJda+HAfbWAkfgQPhQho4nw6U/Eyd
         uHSg==
X-Gm-Message-State: AOJu0YzmgRnlXHpy0tBsXLQzGueqeBH578WI8Us4kBaLDHQpA9vIvBWa
	QyAh3rpemLk/g1nBd+5tkmV6kcGi/Izhmzpf86TmWxzPkU1JwGTioKIfxzBkaOj7x4oBDDamoFn
	gk6nXx9Cy9sxAG28jYeBD+AEc36ZxvqzdxM8pYsUSA44w5b/i5nXZCMn/X6K+PnNWxwxk3bzuEa
	gUSUAgY83sc5D0z8D4XGefQEB87071XFTZF8L8F92OKU/h14MTl6MsveY7Qe4=
X-Gm-Gg: AY/fxX4V+UPgwKbSx0gLuWGEAeKW9JnTPoW5atR+0lQj9Nfjd8R6IT4Am1ptjzFgfpU
	egLL5h2uinZfKsYmeFJczSnmHaMIkfZ7j7qlBv3Cp1b7rTlAtKNnyQgWZk4p3PrfczLH6KAs+/b
	DmQZ8d80Pmicd0UYwzTFfvOehe4eSJjBHkc5uXfduK3xmWnBQuY6AHqB7SNtih+/5A
X-Received: by 2002:a05:622a:58c:b0:4ee:1bdb:a547 with SMTP id d75a77b69052e-4f35f3b7549mr242298901cf.14.1766451587013;
        Mon, 22 Dec 2025 16:59:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGX7MLvcuigV7FMEvbZxIfNVttYDdVH9YfSvc+HiPkjaepkX1oo+WELJ8RZXhJ/ZoKdY2cZxePm67750YQ6yzI=
X-Received: by 2002:a05:622a:58c:b0:4ee:1bdb:a547 with SMTP id
 d75a77b69052e-4f35f3b7549mr242298741cf.14.1766451586540; Mon, 22 Dec 2025
 16:59:46 -0800 (PST)
MIME-Version: 1.0
References: <20251222111523.2837748-1-jaihindy@qti.qualcomm.com>
In-Reply-To: <20251222111523.2837748-1-jaihindy@qti.qualcomm.com>
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 08:59:35 +0800
X-Gm-Features: AQt7F2psXoIIVs2iowKnFP3ZGPyIm37D4TjkCgMsey3EJQ4CLlzhZd-SXA2dT-w
Message-ID: <CA+s=J=wz4rcwL-+VgvWG_iYS0yYF7A38khe=4dC5pJisN0DWOw@mail.gmail.com>
Subject: Re: [oe] [meta-selinux] [PATCH 1/1] systemd: create backlight
 directory via tmpfiles for SELinux compliance
To: jaihindy@qti.qualcomm.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: cKpe3yARfoQECZ9AxrL54QHIGbEzveX9
X-Proofpoint-ORIG-GUID: cKpe3yARfoQECZ9AxrL54QHIGbEzveX9
X-Authority-Analysis: v=2.4 cv=cuKWUl4i c=1 sm=1 tr=0 ts=6949e983 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=iGHA9ds3AAAA:8 a=Q4-j1AaZAAAA:8
 a=EUspDBNiAAAA:8 a=MQTdtMKTk69hI9hyBFwA:9 a=QEXdDO2ut3YA:10 a=tOIqXpxfQm4A:10
 a=dawVfQjAaf238kedN5IG:22 a=nM-MV4yxpKKO9kiQg6Ot:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDAwNiBTYWx0ZWRfX1QTUGEvuPlkS
 RkO1hg62cxnEjEpm2CSD3E4THsFlhQFhyEmJL1zXCUcrJHbhQ0e/ucJlQm3vIJdwhhBgZx0vAw8
 Z5R2kacyZzE2nPGLCzVmPGYHXhdKyL2WgTexbYne8sA/Ti9LutjNascAokibSjZ4FmpI+sAOnGe
 FLTHL2aEKUM1RKRZLdJvfUUgANdiDMZN27y6mBM6oTc+toDGWjZNvG1QPAqMyzlzRjQtcmF93ci
 TyPt3F496XNLIOGBZd/Jlf1mgWzxSVP1gzlWolPTZYSkPGJXi/jpUgd0wD9gjHPYcnjnmYufYcC
 Ien+VeNOYV4qE5dRtZcjHQT8vnzr4/RX5mxIOZRZ+2z2BskFwLmnq5evsZt+d1XD8hvKyUz7JrC
 A2ZpnOEFnWwJCmF3PcnGrkikpBg9+//0CRUrqgDUiEhR1jwFojztkwv8CxegVftfq7F/01gQEXo
 CUmQseJKPBRs8sHOcLA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-22_04,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 phishscore=0 clxscore=1015 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230006
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Dec 2025 00:59:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122813

On Mon, Dec 22, 2025 at 9:05=E2=80=AFPM Jaihind Yadav via
lists.openembedded.org
<jaihindy=3Dqti.qualcomm.com@lists.openembedded.org> wrote:
>
> Ideally, /var/lib/systemd/backlight should be created and labeled at
> runtime, not at build time. The previous approach installed this
> directory during image build, which can cause issues with features like
> OSTree when SELinux is enabled.

It seems you are talking about OSTree and relabeling interchangeably.
Is the issue that OSTree doesn't want things to be present in /var?
How is relabeling a problem if it's already present at build time?

>
> This change ships a tmpfiles configuration to ensure the directory is
> created and labeled correctly during first boot, allowing SELinux
> relabeling to work as intended.

It looks like this is what the original code did as well by letting
StateDirectory=3D in the unit create backlight directory before it
switched to creating this at build time in link mentioned below.

Why is this a problem specifically only for backlight?

>
> Reference:
> Previous discussion and initial fix:
> https://docs.yoctoproject.org/pipermail/yocto/2018-April/040854.html
>
> Signed-off-by: Jaihind Yadav <jaihindy@qti.qualcomm.com>
> ---
>  recipes-core/systemd/systemd_selinux.inc | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
>
> diff --git a/recipes-core/systemd/systemd_selinux.inc b/recipes-core/syst=
emd/systemd_selinux.inc
> index 7d466ee..f36519c 100644
> --- a/recipes-core/systemd/systemd_selinux.inc
> +++ b/recipes-core/systemd/systemd_selinux.inc
> @@ -1,7 +1,13 @@
>  inherit enable-selinux enable-audit
>
> +# Ship tmpfiles config for backlight
> +SYSTEMD_TMPFILES +=3D "systemd-backlight.conf"

What is SYSTEMD_TMPFILES?

>  do_install:append() {
> -       if ${@bb.utils.contains('PACKAGECONFIG', 'backlight', 'true', 'fa=
lse', d)}; then
> -               install -d ${D}${localstatedir}/lib/systemd/backlight
> -       fi
> +    if ${@bb.utils.contains('PACKAGECONFIG', 'backlight', 'true', 'false=
', d)}; then
> +                install -d ${D}${sysconfdir}/tmpfiles.d
> +       cat > ${D}${sysconfdir}/tmpfiles.d/systemd-backlight.conf <<'EOF'
> +d /var/lib/systemd/backlight 0755 root root -
> +z /var/lib/systemd/backlight - - - -
> +EOF
> +    fi
>  }
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#122787): https://lists.openembedded.org/g/openembedde=
d-devel/message/122787
> Mute This Topic: https://lists.openembedded.org/mt/116900764/3616702
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [a=
nuj.mittal@oss.qualcomm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

