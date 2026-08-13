Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF10CC5B572
	for <webhook@archiver.kernel.org>; Thu, 13 Aug 2026 05:02:08 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12554.1786597321086048590
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Aug 2026 22:02:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=eOZkM2jk;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=UY1/9WDJ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67D2L8T92543676
	for <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 05:02:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4S5e7OlS50/MVba/MvznI7fq0sTuR0ZF/5hTrFWol0Y=; b=eOZkM2jk3ulQUwrJ
	8a+aiL57bdyYCvnXLrhdudoCupGnLtgR1NSwGMidmBC3D3/gjQrQIMaCoUohLeZO
	lQRgjrkueQaV1BEpOMYaI6WJmGhxB0+sgehpul1rSD27tIv5oFsxByB7nObhlHe8
	1Pg6l6RqQPkv+idbSReAc85nDMXwrpzf5uU2VkcidFwjOEPZXqZ0D1h7Q/xX5WKN
	ensdzU95/2e8wnrL9DYJ2Ex5hTv7mcJvYaXX8cSlKJZrcMBlb/vN/v+SRFjn1oe+
	XGxgNzUPOt0MVtTT4wCMp8Ek2ocI92qZCnWNUzfftRDa4ff3yPQcB1FamrmmXPJG
	GBCFQA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g152m8gkp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 05:01:59 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5283fa0656dso8367711cf.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 12 Aug 2026 22:01:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786597318; cv=none;
        d=google.com; s=arc-20260327;
        b=l+PwhPpxiB2aCgvzP7TWxrHburaVnZQLdwZTTQBQxm3hnRYNDUMhbGuYvdLn5eo1hl
         aOCusJYYHZIf/4hMbzsxHavZz44kRoGg2Iqf7cDSRjZtyxcj5THDkWV4reVMpHgeQGmd
         u27iJ9NL67Uomoa6Coahm26YLwEgUo7GatPc1eCO148sBdrBXFQ7GDLFRgFKvJxMpbvX
         aUeuwg3tkDJFCJE25vuQJsKAjszEAGLT7q8yOrpSefFJVfG4ETeAhxs2smP2PoKQD0sk
         64B04xVG4swGEJa21wjs/wILuE+UOxG+O00d6RPlmNxO/kg+x/t3VDxzMZvepMQMyV11
         8mzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4S5e7OlS50/MVba/MvznI7fq0sTuR0ZF/5hTrFWol0Y=;
        fh=n0ZnAkKOhGDmrf8RLpwnC7FQ6xmEY5rofL6wXnjsXjs=;
        b=B5ZpaeqbaToQGQGqDggPvcQhbUV+A7ktI1JrObrOlt9SUcNQr1xVmAIio6voyxOA5o
         heq4MCbqLB5w8ZctgKkoRh5qInVVgaod+4fI2KtwvFIo8vzDqpApUrLjhMYila1meW7I
         wrrGTBcGnhSO0r/MwxqgEjtlMJohUZSHcFsKkolymblr3L5f3SOPooHxLxt0Nujvj8Ip
         1xYaAB36FHI9MEDo5d+6jXAUENQXiyM5WvioPAoPTJg5efQ3fdq1ruVtZ2ctgs/R4/Op
         1HlT0AUP1dkkOP1KrpfhK+Hfagsz/6SUWWJD4JoaErTE1sa6Y0E1OJ19gofe4PwLNlPV
         I/SA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786597318; x=1787202118; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4S5e7OlS50/MVba/MvznI7fq0sTuR0ZF/5hTrFWol0Y=;
        b=UY1/9WDJT9RtSY5+2f/jrmlYqdRpWf3UJ0upGf+nEd6rFbnTBJ9UOxd5gNTH9bNlh4
         2H8O6AXlhn6v8fb4iONkWX5/PH/lbW8rMzZaNdexxJvbpIIIsNIJeiC6is4HkN0BGLo6
         4/9i665POXjNfHGKuJGRR4ji1wFNmLVQKfgiec5WZm+IGexmsX3GoTnjybeZXBSYrTdH
         frzqDSvliiQwyUIh0XhG+MLiL/LPs4KSqJ1BAR21Rs9sG+r4pVQwqSDBsYacUfi6LUKF
         /KZN5qA1Mt2/+KU6XwIvVAV1GrTczv8sXqJ5zLJ46eMUWYzetXQlNipu7kBfmdolZSuu
         cy/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786597318; x=1787202118;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4S5e7OlS50/MVba/MvznI7fq0sTuR0ZF/5hTrFWol0Y=;
        b=WqnMFtgwsz3Ztl1cdvuymPhmTxkRhTZlB4QLsa0mA2fAi1elGj7Lu3A0D1cBeCPwrU
         BuudmYLbs/J7hcbHQ9od7PbZDJ97+Rh9RaprKtSIFYFF8QfZSsXAzszAaGR2OAAuqz+M
         TAXMm8QneqLA8aylj3PVcsbL5I/zHSmp6i7+yYniYiFNqmYNvJRGI3/kwRIw0abPIsSn
         fzVYfuwoToxMiCBS4EUh7dD/GfcJicvyhrVjZG52d4Tr67VrlwlDxAu0NM5TzvDKm6QL
         DUgcjc/5EYQWRE1+8W6gAftbFj2qORrX29bwVC7JS87VP8jtqpwDFJsa4iMEgm/i0VMN
         tc5A==
X-Gm-Message-State: AOJu0Ywv06HYJ2CZJuIDhaeE0cT35osgv9HEpAbBVraDv5mz6FPu56fN
	6vm91ZQ8kRK3crorcqmO1MSIjx9KuF/i5jTgptBP9ubLKuoC7l2mS6eOr1qgtWtLCyspci6tHKd
	FaDiTuLxeKo5rGASpIDkA57AfdOpbJQaYroaVjH6TbUen34+ZOjMoK5Bxayyf3nLmLfstZ6Xfsc
	VNj+mvVnjUKlt2pLBuWw+hY61kRuGjRQyh0yAUTz7OmVi0tv9AXq4g7HHOoI0=
X-Gm-Gg: AR+sD12E8nFeUdCo5M5Ri7Ewf7/2E16O6/tfcMveDkMVzeAgZ0La4+Ldt62MFx9aKBD
	A0Q/OUuj6qsHp7hQinwqi/rti2kQxE8wZPC5RDo/P7j7zOqd+ZYmaUIiIBp+ub5UVY/i86BXz3z
	usNP9ocv1Cqkh0z5Qps6WCz1EKhWXw00QsQSKhupsBy/J4F+JNoYbeYQw=
X-Received: by 2002:a05:6214:5002:b0:8f1:74b0:a4ec with SMTP id 6a1803df08f44-90a80e2d043mr25291006d6.4.1786597318370;
        Wed, 12 Aug 2026 22:01:58 -0700 (PDT)
X-Received: by 2002:a05:6214:5002:b0:8f1:74b0:a4ec with SMTP id
 6a1803df08f44-90a80e2d043mr25290776d6.4.1786597317999; Wed, 12 Aug 2026
 22:01:57 -0700 (PDT)
MIME-Version: 1.0
References: <20260807070953.2275518-1-ankur.tyagi85@gmail.com> <20260807070953.2275518-6-ankur.tyagi85@gmail.com>
In-Reply-To: <20260807070953.2275518-6-ankur.tyagi85@gmail.com>
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Date: Thu, 13 Aug 2026 13:01:46 +0800
X-Gm-Features: AUfX_my3HnpmwUATrAWkhi4MiTSuuCUIoDiOm4KhfvQzt3yTzwhaq0JQkgDYwzc
Message-ID: <CA+s=J=y_bvvoFonaQNb4V2JqTDZoETDpEQL9B=A6tzVAjowpUw@mail.gmail.com>
Subject: Re: [oe][meta-oe][scarthgap][PATCH 6/6] jsoncpp: upgrade 1.9.5 -> 1.9.7
To: ankur.tyagi85@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEzMDAzMiBTYWx0ZWRfX9BaLnAnap/Z1
 PV3N8gMdSyA+YewodLKGvngrYnmTZXWJl1yZTiklGpxvRQDMoHoKcGdSOuWVKt1neB3PeMPq4ik
 9mPaRkVEsPhRvrOcBu/i5n0LlOjWZ2c=
X-Proofpoint-GUID: eHYdoHf1zVo_QdDaz7626VytbXZw0kSm
X-Authority-Analysis: v=2.4 cv=D8R37PRj c=1 sm=1 tr=0 ts=6a7d4fc7 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=vgaqWCHjAAAA:20 a=iGHA9ds3AAAA:8 a=Q4-j1AaZAAAA:8
 a=pGLkceISAAAA:8 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=Pk9j0751xQPq99sykEgA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=nM-MV4yxpKKO9kiQg6Ot:22
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEzMDAzMiBTYWx0ZWRfX3uML7uDRh0et
 HsED9s+GWLSxt+kzyv0SKgXwWDetMWG+0TVjYXlV/iXMNwSH3aZSaiO5UyuMh0HklVxIGYrJ448
 IO43ZDOAW6kduzJ7zDPoc7M1vUGYHqFh1RetbxYYY48yG787QB8Q+43Jbrshs83QGjwZ0is+rgS
 d/NMKFdNLlIjK3+PH9th/uQIuKY6nTL1NJd52BtDNjRUsgN5Apg4IouCiIU8U7063JeeuXhV0Mc
 Md/7pwsH8TiAjmOQUYMVrSu82sPxv8PQjKH3mKgknPJ1zyL0MdDLetvgKBBTHVAi7n4er+chanA
 NZqJPcr9bWX6SnIED8oQPeqfF2LEFiKKpcFt5Ev2K122kQYOzOZsP9nXNftkkgZfZtW6J7i81Lk
 zaLSrN51xLE7orNCHXP0HG9AQOTiY2n+eovegKQocmSE3EcZIDI5w/ISDKkM3DdWc8KWzPSA+dG
 jua2hMAKzHFnpn3jHXw==
X-Proofpoint-ORIG-GUID: eHYdoHf1zVo_QdDaz7626VytbXZw0kSm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-13_01,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 priorityscore=1501
 adultscore=0 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608130032
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 05:02:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128933

On Fri, Aug 7, 2026 at 3:10=E2=80=AFPM Ankur Tyagi via lists.openembedded.o=
rg
<ankur.tyagi85=3Dgmail.com@lists.openembedded.org> wrote:
>
> From: Ankur Tyagi <ankur.tyagi85@gmail.com>
>
> https://github.com/open-source-parsers/jsoncpp/releases/tag/1.9.6
> https://github.com/open-source-parsers/jsoncpp/releases/tag/1.9.7

This seems to be causing build errors for sysdig:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/builds/1719

I didn't check in detail but I remember this version had introduced
ABI breakage, which was fixed later.

>
> Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> ---
>  .../jsoncpp/{jsoncpp_1.9.5.bb =3D> jsoncpp_1.9.7.bb}              | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-oe/recipes-devtools/jsoncpp/{jsoncpp_1.9.5.bb =3D> jsoncpp_1=
.9.7.bb} (93%)
>
> diff --git a/meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.5.bb b/meta-oe/=
recipes-devtools/jsoncpp/jsoncpp_1.9.7.bb
> similarity index 93%
> rename from meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.5.bb
> rename to meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.7.bb
> index c54dc94666..8194c554da 100644
> --- a/meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.5.bb
> +++ b/meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.7.bb
> @@ -13,7 +13,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D5d73c165a0f9=
e86a1342f32d19ec5926"
>
>  PE =3D "1"
>
> -SRCREV =3D "5defb4ed1a4293b8e2bf641e16b156fb9de498cc"
> +SRCREV =3D "3455302847cf1e4671f1d8f5fa953fd46a7b1404"
>  SRC_URI =3D "git://github.com/open-source-parsers/jsoncpp;branch=3Dmaste=
r;protocol=3Dhttps"
>
>  S =3D "${WORKDIR}/git"
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#128863): https://lists.openembedded.org/g/openembedde=
d-devel/message/128863
> Mute This Topic: https://lists.openembedded.org/mt/120639193/3616702
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [a=
nuj.mittal@oss.qualcomm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

