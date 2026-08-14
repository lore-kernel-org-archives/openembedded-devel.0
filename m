Return-Path: <ricardo.salveti@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 488BFC5CFCF
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 03:03:53 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5393.1786676623554286307
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Aug 2026 20:03:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=Q0TQR2U0;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=JIGw5pOE;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: ricardo.salveti@oss.qualcomm.com)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67E19bTQ551064
	for <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 03:03:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZiQyffi4BkJ3bYqF1Iv7mq66a04gxUyQE2qBEFsLhsU=; b=Q0TQR2U0/+/lGbzQ
	7Ye4euMttgneHLsAle0tMxs5gFf2m2+Gbj0fDkPIY1sfp3/mOK/TH4BPDcvLlSYD
	G3E3hKtLrbB2xrc9VAtZ8cMpStXjG6ndJ5reWpgW5PROurGlZosVQz39iC8JTFdz
	hUDpfzINOrzL6cMSVed1T+8ribF+qOdC0Ge2g1bBZAapVrBAGefY7BSsgaCv8x6e
	oh47wDJobDtKpZC4oUmtbyzIlWX9sPW6s+Wy6autsP+p5VKN2fEqHDiwPLni2xsW
	qo2TnUh7jOV5eQC2CptMnTip3cLUECBvmNtHYAbxyIRQDBYyaswsnyYPvWWpybbc
	DiC+5A==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g1pea0tft-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 03:03:41 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38ec0f510a9so1058106a91.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 20:03:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786676621; cv=none;
        d=google.com; s=arc-20260327;
        b=LeKJnASt1zuOnTs0KDCs/dvveDQtNnCON3CIhp8ICg0i3gnC7PaobPlwnjTLjxhzWb
         RMnY5+LpDGMUlskJocWOSiC7hTJrPTFm/VUIEtt6iYdmLLwlYT+lSMLYMmUK4drXiKxB
         hWv35v/am3nlH7vAVh8CPjhRIL965BL019tbdhv75YoGlMPGxRgvQmVfPB2shaz1ID8i
         YDEHCICNrnvyLW2CpXDWCUCHlCzPfqu+qu53o1ME6zUgs4HTrzHJsw8h5xHXBafpVtJD
         Se7Vgp/M9aFq42XN8OZUrbbTknWZyl+SZaE00Gs866O+2vbDR9XU9/e6ZbZ+GZcB1YfM
         7RwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZiQyffi4BkJ3bYqF1Iv7mq66a04gxUyQE2qBEFsLhsU=;
        fh=32dNYDkrd4iFDxQzsKU/8p0Pftk8aq/K3E3B1xpVIPU=;
        b=Mt/8xLilzGdMmwT62y+OqXO6oFBGaqT7pQpjhHhCxXktJ3QNV5V+PCYlm0Zgzsr+Pj
         /BbFeFLAz60XkFZdAROhQywCAr8WbuKOm+8/HjUcQX2YEr/NPJIW44JGo02YaRWmiB4I
         z0ADYJmYkmGb3T0AYc10eSrFU3IH4XxFTIRnaG4w7EkFeLbWIAHkIg1aMHArTZ6oKCK8
         FWbQld2k00HDcvP4H6oYION/SpfwNJvaqMssSrK9I2bI/DGR5VsbQnKqE7nElTarMdIO
         dfXsawirm1J1OfLg8p/yFQSa0a0abomVtlETzO0wLJpmFiomVa1bDxD6/QqDyiWEyzQg
         t1gg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786676621; x=1787281421; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZiQyffi4BkJ3bYqF1Iv7mq66a04gxUyQE2qBEFsLhsU=;
        b=JIGw5pOEvfmSjPvKyhvZYfgPvlIoDVYfqOBkMWH5y5nnC+MgrszElKVU2zyTP/yltC
         4U7/OIEsgDhr2cmbg2PEcQP2PkmVWEaE8kryQ1J7bb036I1uE/gTNhMajBCr+FQSYfzY
         cFB9iIAmgUIF8WPguKa+4WIyh8J5hOk7enIU4DHiCn5VPABHgBiWFc68QFbMhKwSiCMR
         gRkJWY4fYZjwWsx5Uyt5+h1UYQH7gFYU3q/vtvMps6feuJ8ntyQWQLqhvye9D8iQnFmF
         D5CHe/bCkOxTntSHT1SySwow2kyXQiBNalWQMiYs6bFC58rbwUX8AXB82eze2sHnsYjN
         c7lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786676621; x=1787281421;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZiQyffi4BkJ3bYqF1Iv7mq66a04gxUyQE2qBEFsLhsU=;
        b=beht+4hTwA1vXVeGXh/a0i7r33tGzQhaCHOH3j/zyDCkl8M9BkJE6NgUOakcvo6QG1
         QBcbGsBnZrOa7rj8T3lrmr37DBrBMhxQJkyI6c356SnKoNdee706kzdrlUOy5BklW03q
         4GcMv+PKaK37uFWoiUKGAre78c8dflOyf054mPJ8kJ+i0iNX1ZFagLO2jNz62PKCwq9T
         lVTC3gSFosaujnC5VVimf1liZD64gtY7f+W5TyERJGKOjgG1Mcre8S6F4dv8wS1SgtB2
         QzGpppbP7XYhCyjhTor3+ojkUISmpQ9Bx4GR3XC4MSus3ClkyETNkYEeOahW+yY9Vp7N
         Z9OQ==
X-Gm-Message-State: AOJu0YxyzBEGpNHY7xvzmrMvH9yqS5QWkHah5ZQd8FI7BrLMtLinfNRR
	h26PyNdrIOxVuIIfowrdoszgZoqWwUWOKMKMYoZnVFdjFvP8jb6tcKbJqYnxZoZbosTGA0EeGcK
	U1KNkb/AyA80J+ONlvwjuZqV/ayXtbnXOCAzetEy/4hEJC/OcD05B13RI3D837ZaJXNPAnjOXKq
	mqRT93L7on/f23x927fWwUGfvf/nsOi72I2askf3k79KuSh5P0KogYeMStaVw=
X-Gm-Gg: AR+sD12fqM3eA585hCqho/dnwnKT3ixXYjLhM4vwVt36Mj8704UUSLl+0WbCs9efKoB
	vdgeIwUrrq5wpxXzbBqCYfKX01+xQgWeft/1ZrWuuduF2sjkZyY1NY16P3aAIPgQ71R/exMeMmx
	lAzvY+e3mqJOArsL273Isgnl1ZYb/NimuIRbIahBEGAddfhpR+LmYD5txVRlc=
X-Received: by 2002:a17:90b:2747:b0:38e:2f21:3bb5 with SMTP id 98e67ed59e1d1-3933baa0da9mr3169957a91.21.1786676620933;
        Thu, 13 Aug 2026 20:03:40 -0700 (PDT)
X-Received: by 2002:a17:90b:2747:b0:38e:2f21:3bb5 with SMTP id
 98e67ed59e1d1-3933baa0da9mr3169906a91.21.1786676620406; Thu, 13 Aug 2026
 20:03:40 -0700 (PDT)
MIME-Version: 1.0
References: <18CB8CCAF01A0A8E.2642277@lists.openembedded.org>
In-Reply-To: <18CB8CCAF01A0A8E.2642277@lists.openembedded.org>
From: Ricardo Salveti <ricardo.salveti@oss.qualcomm.com>
Date: Fri, 14 Aug 2026 00:03:03 -0300
X-Gm-Features: AUfX_mwhq8PrjFstTOMXomtZVH3WKuW9BQQclz7ByOxPseL5Ke8oBeR5_RS_QLo
Message-ID: <CAA_5you2hS+utY0CxV0vi-3Po5QoKy9g_R6e9fGaSVCwqByF7w@mail.gmail.com>
Subject: Re: [oe] [PATCH] uboot-sign: list the TEE loadable behind U-Boot
To: ricardo.salveti@oss.qualcomm.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=TbGmcxQh c=1 sm=1 tr=0 ts=6a7e858e cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=Q4-j1AaZAAAA:8 a=EUspDBNiAAAA:8
 a=k69B84YmCLOPaA9RM6AA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-GUID: MMOvY3W45B0FsQpFOJAd5YTnHmyM-jys
X-Proofpoint-ORIG-GUID: MMOvY3W45B0FsQpFOJAd5YTnHmyM-jys
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE0MDAyNCBTYWx0ZWRfX4VFEfdIFvIkw
 M2ahdItsWmsBx6JZ4khhCCDQpI+Ix+kgjE9CedqbPZhuqWPkeLzw82BnAGF2UbF78F99nv/hz71
 ZOaBoQe6wXhUhLGGRljtZo261f8ZYWt+eTGZH14pF/QaXTdo1t5ukHemJ1lTiUTiD69PDjECos5
 0CqB/bqahtX6TC2XudcKKWZ31/iCkU8+RPxfwsh5rfdUQm7q8N0Og0fq3daV/tQJZwWfQkC6rEl
 jinPbiQVd2WtHoZJMHXMQ9gFCz0/wV10vEdki5XdItOPCc/MRZC2nXkcRH5TuvnguT1r0vXbVZp
 3K4mfAqIdDwcYncRWR/E63HTWUtw49i/AIqlgsT7OH+hBfLIriDfYijmwRw2wXzvHUWl/RB6+/D
 iqGmcTR4xBCeGJOv/lk98sXrba1qZuyp6Bx9USnbI4QL+R8aRuC5LMHVyyEltYtLK7whv1QBesK
 g02h4JPqMBqmB49I3Qg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE0MDAyNCBTYWx0ZWRfXxQYJph589f0W
 1OLxksRjMdBmy778H1rrFxl3VfSQ8lLhHxFUqqAdyLf9qRDUFZR5O7ULWANBlIITtPHK2mZJAue
 N6LAPPdMPZa+z8vKpiQ2E+oCVxZwH2s=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-14_01,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 adultscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608140024
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 03:03:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129030

Please ignore, it was supposed to go to oe-core, fat fingers.

On Fri, Aug 14, 2026 at 12:01=E2=80=AFAM Ricardo Salveti via
lists.openembedded.org
<ricardo.salveti=3Doss.qualcomm.com@lists.openembedded.org> wrote:
>
> uboot_fitimage_assemble() prepends the TEE image to the "loadables"
> property of the configuration, which puts it ahead of U-Boot. That order
> is not only cosmetic.
>
> An SPL that hands off to the ARM Trusted Firmware (CONFIG_SPL_ATF)
> describes the images it loaded to the next stage through the /fit-images
> node of the device tree it passes on, and common/spl/spl_fit.c only
> records a loadable there once spl_image->fdt_addr is set. That happens
> when it loads an image os_takes_devicetree() accepts, which is U-Boot.
> Images listed ahead of U-Boot are therefore loaded but never described,
> and spl_invoke_atf() in common/spl/spl_atf.c, which looks up the BL32
> entry point by searching /fit-images for an IH_OS_TEE image, finds
> nothing. BL31 is then entered without a BL32 entry point and OP-TEE is
> never started.
>
> Append the TEE image instead, so that the assembled order becomes "atf",
> "uboot", "tee".
>
> This does not regress the configurations that work today:
>
> - Where U-Boot is the image selected as firmware, it is loaded before the
>   loop over the loadables runs, so the device tree is already in place an=
d
>   every loadable is recorded whatever its position. This is the shape of
>   the FIT that arch/arm/dts/imx8mm-u-boot.dtsi describes, with
>   firmware =3D "uboot" and loadables =3D "atf", "tee".
>
> - Where the ARM Trusted Firmware is the firmware, U-Boot has to come
>   first among the loadables, which is what this change produces. The
>   binman description in arch/arm/dts/rockchip-u-boot.dtsi already ends up
>   in that order: it selects fit,firmware =3D "atf-1", "u-boot" and genera=
tes
>   the loadables from its images node, where the U-Boot entry precedes the
>   OP-TEE one.
>
> - Nothing else in the SPL depends on the position of the TEE image. An
>   arm32 OP-TEE image is recorded by spl_fit_image_record_arm32_optee()
>   wherever it appears, and the fallback that takes the entry point from
>   the first loadable only applies when the image selected as firmware
>   carries none, while every image generated here is emitted with one.
>
> The images in the FIT and their contents are unchanged; only the order in
> which they are named in the property differs. Update the order the
> selftest expects accordingly.
>
> AI-Generated: Uses Claude Code
>
> Signed-off-by: Ricardo Salveti <ricardo.salveti@oss.qualcomm.com>
> ---
>  meta/classes-recipe/uboot-sign.bbclass   | 5 ++++-
>  meta/lib/oeqa/selftest/cases/fitimage.py | 4 ++--
>  2 files changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/meta/classes-recipe/uboot-sign.bbclass b/meta/classes-recipe=
/uboot-sign.bbclass
> index 33f9abdb79..66d8171c9f 100644
> --- a/meta/classes-recipe/uboot-sign.bbclass
> +++ b/meta/classes-recipe/uboot-sign.bbclass
> @@ -458,7 +458,10 @@ EOF
>          };
>  EOF
>         if [ "${UBOOT_FIT_TEE}" =3D "1" ] ; then
> -               conf_loadables=3D"\"tee\", ${conf_loadables}"
> +               # Listed behind U-Boot: an SPL handing off to the ARM Tru=
sted
> +               # Firmware only describes the images it loaded to the nex=
t stage
> +               # once it has loaded the one it appends the device tree t=
o.
> +               conf_loadables=3D"${conf_loadables}, \"tee\""
>                 uboot_fitimage_tee
>         fi
>
> diff --git a/meta/lib/oeqa/selftest/cases/fitimage.py b/meta/lib/oeqa/sel=
ftest/cases/fitimage.py
> index 451878aafd..3d8bdc4a74 100644
> --- a/meta/lib/oeqa/selftest/cases/fitimage.py
> +++ b/meta/lib/oeqa/selftest/cases/fitimage.py
> @@ -1798,7 +1798,7 @@ class UBootFitImageTests(FitImageTestCase):
>                  'entry =3D <%s>;' % bb_vars['UBOOT_FIT_TEE_ENTRYPOINT'],
>                  'compression =3D "none";',
>              ]
> -            loadables.insert(0, "tee")
> +            loadables.append("tee")
>          if bb_vars['UBOOT_FIT_ARM_TRUSTED_FIRMWARE'] =3D=3D "1":
>              its_field_check +=3D [
>                  'description =3D "ARM Trusted Firmware";',
> @@ -1850,7 +1850,7 @@ class UBootFitImageTests(FitImageTestCase):
>              }
>          }
>          if bb_vars['UBOOT_FIT_TEE'] =3D=3D "1":
> -            loadables.insert(0, "tee")
> +            loadables.append("tee")
>              req_sections['tee'] =3D {
>                  "Type": "Trusted Execution Environment Image",
>                  # "Load Address": bb_vars['UBOOT_FIT_TEE_LOADADDRESS'], =
not printed by mkimage?
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#129029): https://lists.openembedded.org/g/openembedde=
d-devel/message/129029
> Mute This Topic: https://lists.openembedded.org/mt/120744267/8966622
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
icardo.salveti@oss.qualcomm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

