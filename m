Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE3FEF532CF
	for <webhook@archiver.kernel.org>; Tue, 24 Mar 2026 03:23:14 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12339.1774322585069071427
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Mar 2026 20:23:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=j+/KUFel;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=GDMp6pwc;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NHqra22681731
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Mar 2026 03:23:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aH2yvD/c3/cJr5DgeIxS4qIbAy1J6HFeyqFWafGuNy4=; b=j+/KUFelgeGsAvr/
	Cxul5i8kdFn0Hl0L7BB6uALSYjcMLa84YhapYzqX93Vfbjp9Jsb+Gap+E43AKxOG
	qly1LM2YS85N+4HrK58cZkIbw1CNIbwpzE0IiOhtz04QHJAdW7hkba8NY+3nNuOF
	QMM/P0J6YmMN2Af3WeENsiUiZeXSIsSIqsYtEg+UasjGKMbo6+sE1H1mU0cbMeMG
	5SmHIjem2ZhZH8DE+dqp+x+VyKqwNiy3+k7VqFt/mxYXdxcaj3FtyNNRocrJCiaC
	UAUiAj8IXMuvdNFOVdoth2/lSJQ+xEXje3pbWWJj8N+h1PDdwAREVKXGLVrHYUSw
	QHjCLw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d31p7brts-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Mar 2026 03:23:03 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-89a0258c5e5so11142936d6.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 23 Mar 2026 20:23:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774322583; cv=none;
        d=google.com; s=arc-20240605;
        b=Aa6B0xtCsHnVh0ZpYDeEq6aHe0OYViwcwV5yjM7IwW4udkeGCgOhiIbeI/kfKO8X3O
         weBYZjm30phUadSE6N23CbaQ0pwV6qq+i8BcK3WHxf8Cxym9dQOhusUj620QW4Q7B4hA
         hxJ9uoUDlLpwuwn7gfJ52Jq1vykrg5xVf6X0ZVDcPhr3hhgh23C16SXDR5s1xUo8B8G7
         ppw6hXUpeRlVbchBiGuAFrOV3IWU67poGYyu3SCaimfr0Bo/yzxvj5R7cKTaw387Qd7Z
         /og0yOKy8aK3xJfq8+X5ZkLBnW/fuNOXoVfnSs2D1XXajZ4L0Mg926CYjIp5Tl1zr35F
         u0+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aH2yvD/c3/cJr5DgeIxS4qIbAy1J6HFeyqFWafGuNy4=;
        fh=PqrvWOQDuMW7DBEZMtJk4sUef2SPa7RI/TJA4C6UjCM=;
        b=HbtwLUrjfJwaj/QTIdSsZtIenHdRXBdhXNoisypm+yCZsTg86VLDwA+6BEPDCMbpLm
         +6Rrw24iaX1QPJsifh20M/yzT6KsZI5o7M7yS6z/CHlN7bjqACrLveu504yyAeSXgQqQ
         pjKo6BH/uDIM5jsxfQgg6ZxjH4Af5hso4Cy5gxiYjlGqBIgiE0Iu4K7/MNsWCUVP5AAb
         LbW5pgJzxoWq8A/syeqajkMeb8yUXcolxzyTukV1CrGeK4G7Q1xxylU5wsiWUWM3cHvd
         D1DAboSkXh4b9nNEKBB+OO+Xer6JF96BxmCKd2zgU5w4eWjztQBXaout9G8ShwxKWSzl
         4fUg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774322583; x=1774927383; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aH2yvD/c3/cJr5DgeIxS4qIbAy1J6HFeyqFWafGuNy4=;
        b=GDMp6pwc0valVdgZYFTFIcyBBRgFB9FdywwA80bFEvRCe0aBIk66rd0A50Vi5mb437
         mlTq3lDqzg7TBsuQ3UvEhkY9umCtmE25qaaPY8PxtoRgV9XI/AXokGnDDPwoX7C8/pOH
         d3g+5e6lwZIkrGir9XbbtpAzHSCZR1cg1/q81oFrZqyJdhXGeYUHRJOeT5ywy5MD2QJe
         GxtgfSh3sqFR/dV9F8ZMtfyjdTL+hTBWGqunM68Hsn2c/16ubHkGcZq6esh4WtOM8KrL
         iSbz+6E4Aap5jQPcjV9woZ4HfdAgqJXGZmtNePZJbeHOzGp0o/C2x9zNBlLedWQ8yFuc
         cWTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774322583; x=1774927383;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aH2yvD/c3/cJr5DgeIxS4qIbAy1J6HFeyqFWafGuNy4=;
        b=rwuHO1JV6Jv1OsLxFHszdcoAAGd70JCrG9JSZivs1Qyjofew4gRxtlwWcIRy/9Ki/o
         3CkMJuvwcgeVUtQSLqps4XmBfAcTRpWzu346eHx3RVImzOu6pq+It46CjBQVcP259c3M
         uajNYu7+walCjgpQQRRSVjsjKbkJao6flYcFcOZ9vwgu1kn9uObGF3qRQ9nW+2W+XJZy
         2VZ0q7eqA0ysl375NfZLFzkZbJKADIEFT9B5O7KdWjRQDIaQGWnYp3AJfHtn7p2MeC/g
         M9gUWtB3ek6yKq/OdVlHYyE9I4EJvDI6fprk6JGYXJsVmp001HcUF7CU1p5h9iPtjy/g
         LaKw==
X-Gm-Message-State: AOJu0Yw9o9MGVW8LV6xdJmC677OE4h6gB1/3w5yxyVDZ4cSvzDyHVJyW
	wZulnt+CANRiHgL+5wKmmI1AvRf9xiluq5kyM9gKV8+6SWtTem3rXjNUn/JUrxF6HCFQ7fkExw7
	rYYsTHtd44hCtN70xrdM7p/hMZ2LrPfj6gQlXo0yotRXIFSjL4cJ6yfYL+SX5MVG4bR9WcNumnI
	e6q7RJUYkSq11re8tJV1JizhlGJewq3q38sjZWc47S+6jf7J35HuSV4lpna6o=
X-Gm-Gg: ATEYQzyBm9w5b5sfemX375Ndy7bWObsRbBZ9A4GIMsqpKsKiHRdVsSAQFg66OYjy3DE
	7bMjTqOm7wAvAPkSFp2QquB341K4jDWaofpxupDKC01h10VkYXNoP1Vgswgmb7lx1lHwM78Xc3D
	2+OK78MA02ebg/k7QP7sl/qvz2Sm/0eWIIDPUXfGz83yvInWOX+qzy1Ae06MKR10/wGF3fKrEib
	vnX
X-Received: by 2002:a0c:f101:0:b0:89a:e77:1f7e with SMTP id 6a1803df08f44-89c85a9537cmr184170676d6.35.1774322583163;
        Mon, 23 Mar 2026 20:23:03 -0700 (PDT)
X-Received: by 2002:a0c:f101:0:b0:89a:e77:1f7e with SMTP id
 6a1803df08f44-89c85a9537cmr184170536d6.35.1774322582707; Mon, 23 Mar 2026
 20:23:02 -0700 (PDT)
MIME-Version: 1.0
References: <20260305110713.2893128-1-skandigraun@gmail.com> <20260305110713.2893128-6-skandigraun@gmail.com>
In-Reply-To: <20260305110713.2893128-6-skandigraun@gmail.com>
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 11:22:51 +0800
X-Gm-Features: AQROBzCO_dL5Lju-g64HXXzPOpjJPwvggAcCxNKfBSdK_RNB50-LCCOKB6-_W8I
Message-ID: <CA+s=J=x5dC+BgPFGhnr2nqFt-i9ETEgx0HK4yS3aEXe1gGONAg@mail.gmail.com>
Subject: Re: [oe] [meta-gnome][scarthgap][PATCH 6/7] gimp: ignore CVE-2026-2047
To: skandigraun@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=RMC+3oi+ c=1 sm=1 tr=0 ts=69c20397 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=PYnjg3YJAAAA:8 a=GHR8O2WEAAAA:20 a=Q4-j1AaZAAAA:8
 a=pGLkceISAAAA:8 a=srjQR9jWiSnYOBL334QA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-ORIG-GUID: 6ag0rFv4R6v75ama_Ko6_APyaInjJ8LD
X-Proofpoint-GUID: 6ag0rFv4R6v75ama_Ko6_APyaInjJ8LD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDAyNSBTYWx0ZWRfX6XMFoT8dW4hC
 VOxPCL5dtnwatyBkkR50mviWSVzre8cWn1QvEyLatNJDxpfu5UIJJeLCgddqf3l6Z4PRIsYNkR2
 PwJpoBtKDCimzuqcGqv25y8iosUCfnlZ5WUJD8jH3jBcZAMjL/oX7MVqm1OiMRgvbW/etE38FH5
 kZPd7yVn0AU+LwYiNV/H0GTAUNSOdZ4Iz82tpFHObowDv+LNY15eXHV7eJwginJaDRexHlC0Ozv
 95OHFz4Kzva+FoSDc1DVp3qLeSUw/NjVVnUWHZ6tgENoWMTGPjhCFf2Rr9J/m+y/9TaHdBLBa+O
 GTtxp8LTP4e1tsemgPTs5ofsYoIQ0pLHna2ey9uMB/N9IGWHMhSuZ/8VExWUPucWI5lSbKjaMF7
 tvLJqR3gas7+kODlNl/fwfEd4UOrwsaIy90q3dDJmg2Dkx9EoHEldOZS7BouL9Sz1Y0ADTm3JdE
 d8zkcGSPgEJExCZO1jA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_01,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240025
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Mar 2026 03:23:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125535

On Thu, Mar 5, 2026 at 7:07=E2=80=AFPM Gyorgy Sarvari via
lists.openembedded.org <skandigraun=3Dgmail.com@lists.openembedded.org>
wrote:
>
> Details: https://nvd.nist.gov/vuln/detail/CVE-2026-2047
>
> The vulnerability exists in ICNS importer, which was first introduced in
> version 3.0 [1], and the code is not present in the recipe version.
>
> Due to this, ignore this CVE.
>
> [1]: https://gitlab.gnome.org/GNOME/gimp/-/commit/00232e17875d4676a2c797a=
429db23b1a9815db8
>
> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> ---
>  meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb b/meta-gnome/re=
cipes-gimp/gimp/gimp_2.10.38.bb
> index d38160a864..8b3dd4aa5f 100644
> --- a/meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb
> +++ b/meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb
> @@ -86,3 +86,4 @@ CVE_STATUS[CVE-2007-3741] =3D "not-applicable-platform:=
 This only applies for Mand
>  CVE_STATUS[CVE-2025-48796] =3D "cpe-incorrect: The current version (2.10=
.38) is not affected."
>  CVE_STATUS[CVE-2025-14423] =3D "cpe-incorrect: The vulnerability was int=
roduced in v3.0"
>  CVE_STATUS[CVE-2025-14424] =3D "cpe-incorrect: The vulnerability was int=
roduced in v3.0"
> +CVE_STATUS[CVE-2025-2047] =3D "cpe-incorrect: The vulnerability was intr=
oduced in v3.0"

You probably meant CVE-2026-2047 here? I have fixed it in my branch.
Please let me know if that is not correct.

Thanks,

Anuj

