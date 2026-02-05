Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7BF3E9128A
	for <webhook@archiver.kernel.org>; Thu,  5 Feb 2026 07:32:39 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15653.1770276752485919488
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Feb 2026 23:32:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=GRqBuLyl;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=PxC8+lqD;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6153dkNv2639675
	for <openembedded-devel@lists.openembedded.org>; Thu, 5 Feb 2026 07:32:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PQXDEv2+vqAKrCTyPBPpxtUorgWhSIoMSlQiZdQlMMU=; b=GRqBuLylQglzag8T
	1gvgBhEi3q3+p6RAWr7QfvSrdD0wpigs5wa632dgqSTDQpUFsguMGhXMaiqcUitM
	84MkOgDMYYa9Ngw8Y8yUwpEI4GafNANGYUxweFSsr60IhGkq9jqrwjEmOSBEYV20
	BE/wW0utTO3MpakcQyrAjnVRuitLOuRoFBcm6eIMp7l2yV37xuSJT1qXnbmFcMBp
	Aq5OLjS/1SMLbQbEVpRlUveFSVxi93vKFZJaIWfKWhgpvxjGxzZTcLlcE/S2pSeg
	Y/5z4hwsq5Db5g0OWxx4KQrvfew2TvIu7iVnwvxoD7nibayMiAqqhJQ6CxjqmypF
	2wbrMw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c47qvatj0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 05 Feb 2026 07:32:31 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8823f4666abso21937216d6.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 04 Feb 2026 23:32:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770276751; cv=none;
        d=google.com; s=arc-20240605;
        b=WPZo0jIeoyWsfrTUN/iR1JmpwGHdiFFU1CVTkWSv66fjMhgz0mGhMVc+nB9yfHwt/l
         GomDsf4ZdxvWNI1L/e20Ns8Yi3bhTZfwDWS2XzZ7IMmxyPn78dgwBrfSqRNYBDaT/xb7
         czn2oZqgtxEU759oisJQVyOtEHM4Bor37af0TXnPl7R/mkMWmWw13dfuA3rmOvR9l9bZ
         jQlWXV0IbvxFb7pVWr5spr2pJyuC5QQ+Y+w5HuOvRqiDCvhzdJtScMMV8G5KcGUwsQqg
         7kwkG0V6LbvSVdDYFMndFpJOfiuvvqlBm1vTNsHwe8htpqPD0Zs5j7xxw0TO+W2Ec4MS
         Pv5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PQXDEv2+vqAKrCTyPBPpxtUorgWhSIoMSlQiZdQlMMU=;
        fh=2nN/GzVxUjERD0LNgf9vNaPM58ZIkCHYlMJQEwcNq0M=;
        b=eKU0iO/K3EBPLu9HzUP76Lmy0O1bjfF6o1SqxB+Lcj9o95FvAkdeRH/sgH+hghS34B
         kUIx4+woErzJ5hleA4X4hxd07oWuYz6YyPpE+8lzdRcpcM384He3bXMZS9kKv3Nt/bq4
         ApVyf3t/f/WujcV/5qU39XxKqK5gHtets24ajxxEYgpsApXAo6T46T4NTkTKsnB9L+gm
         jI+losrMPA1Ujai8vELwoepKWQXDPL5WgSjAnZIhiHvT7/JBO1KK6YKQy2BAP43qQrBV
         afCEe4Kuy3cJvEuOQewU8o7TGo1G7fK5NgRvlh59Zm2+lL/Z0UGN+5s2fOiJIjcjplEb
         MQ9A==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770276751; x=1770881551; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PQXDEv2+vqAKrCTyPBPpxtUorgWhSIoMSlQiZdQlMMU=;
        b=PxC8+lqD5f5FmZ4SO2oOnr8LuNWC1zOCpRnvZb+hWBrEuz3iQXd4++OCtiatYVdI5s
         c7tAADBYEDLzIBymw2oGbq26rMG6anyfbHHyA+eVujgWgbEp/7H/OqhXxJKPPkV2hwYW
         ++KCuZYegrjh5GP0RYghfh6W8QP58FC1TpH5/HFbCinO8DTjyVVS45CvVsLtPbwHhXPm
         3DEZdfdOg7sS00FUoV2vNBg3FprJfMhjWaBCzMPsomds+M7DxYHxEg0D8bBhtDuP3jNJ
         jkjxRs0lcZA02yfqXq+NsmzqTgh2bVjKBZ34BgKXM8n3kC4Z6wSMZIxhuRXzOf0Kb+4e
         qAuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770276751; x=1770881551;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PQXDEv2+vqAKrCTyPBPpxtUorgWhSIoMSlQiZdQlMMU=;
        b=YqEynp/yoMDFwi2SngJjHtdh9Og2gUXVQjZFV2+2FMzjZ/GYINEOk7kIfsD3rpsWjc
         SX7mgvzIIVbBtIL1imbM+RzmGcTdBzT3rcQGrRDkSgXSjOiHh3hctmmEZ7r49FGwYEDB
         JHAnyl93Ihir0EJkQPsj+G+DfCF2oEvW7qF5nb+djKC7T20+S8/X/W5ODN9ndJUtfJZm
         m5FfrlJk2goNBQgGxFQ4umAFTmuPDOuUZIR4Bt3IBh0g4YYCC82BBV1QkVqpuqJgxRfz
         p5DapVEuhybo61m0TzMf34/lChT7JX7Oq1cC4p9BB/KrNikxiwH+tg0MQ7Q5kdgKRECy
         tuZQ==
X-Gm-Message-State: AOJu0YxV3ALmEjD1WcAXlN9x5o7kH80wjILsmNOb3OrbAwEuuqqG+5CD
	bYW5SExZtA/jle8JaMXYHlpvLf7SVTr7Fy/qvB/w0lkg/7Cgf6IDvtCiMBuPjCRvifgn2D/K9jv
	4q2fFI/MUAdJqOoY2W1fsDzBX7DM5wkbvBJKa9Em5ht0OF2nhuH2hiYe8O33DH1w1yzykGVF0rE
	rQMRSqZCEqlTg1ZHQVr/IK3mdM1KLc93K83iklsu/KvLqqb9yyGio/BPShjZw=
X-Gm-Gg: AZuq6aLGRdW+MnhqHDnscCi4O2y4kdVXmYBL22I8jKcVm06OT6v20FIBAy5iNFlZfhI
	Gn+9CjK+KjTqM7C1ZOg6IJaFTCXWBcZ12CDq1DH3iHBqZjDJ4MX64/sRGadVB/uRy/TnWM7313l
	0orjFVDS7cn7MQdVZV0fktZ90HtRaKhAYxFr/welpEvSS5YBEbgE741Gm/SyoG0d5e
X-Received: by 2002:ad4:5dec:0:b0:894:823e:770b with SMTP id 6a1803df08f44-895221e6979mr80248496d6.70.1770276750775;
        Wed, 04 Feb 2026 23:32:30 -0800 (PST)
X-Received: by 2002:ad4:5dec:0:b0:894:823e:770b with SMTP id
 6a1803df08f44-895221e6979mr80248206d6.70.1770276750184; Wed, 04 Feb 2026
 23:32:30 -0800 (PST)
MIME-Version: 1.0
References: <20260204143603.1103031-1-leon.anavi@konsulko.com>
In-Reply-To: <20260204143603.1103031-1-leon.anavi@konsulko.com>
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Date: Thu, 5 Feb 2026 15:32:18 +0800
X-Gm-Features: AZwV_QjkvgMfExhynUwib56425gbS64ZypTc1WcSYe3Sb7G2ZI6VuOU-JnMEDLs
Message-ID: <CA+s=J=zzMn4GTQCRj+J43737MvsbkMCgMTX9Fg+-0=nNiE3Y_A@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] valkey: Upgrade 9.0.1 -> 9.0.2
To: leon.anavi@konsulko.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=GaEaXAXL c=1 sm=1 tr=0 ts=6984478f cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Q4-j1AaZAAAA:8 a=k-42gJp3AAAA:8
 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=WMk6mJ-21tQC6S_B2K0A:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=uCSXFHLys93vLW5PjgO_:22
X-Proofpoint-GUID: Vhd3CI-qs4jeN31W0sDF7DykZpl21Bfh
X-Proofpoint-ORIG-GUID: Vhd3CI-qs4jeN31W0sDF7DykZpl21Bfh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA1MDA1MSBTYWx0ZWRfX3mfdzr3A5IaJ
 oUqCsV46L8F4sSuc2Lh8Lv323J/66FPgMUaH4+yA1e4U8uNpPx/gNV5EA1o7oEMWc0Y03cicZPQ
 1hHKkd3B5Ri9ej2MDFhP3jxbveLO13v2rTbtSZtwcjbcs1LF8j16XLyw1ZhD0AafAKXvXrgheLX
 r1fYC5wu6xWbCVtXuOXS2jMugfMRw0qR0l6WzpVVsZMfReG1reNfl89Q3vSsDDGUdYOZ9syF81u
 /5ps7vGwNB4kZvBnLBms/zRtpJ8gCdoO08Yi/zHBssL9XMgd0/7F6KoVDms3EcEg0YwBGVVfx8b
 bwohK9uh9dHeyrLt/4tdub1cwg2mckHNHPLsitGVvGqMCys1iJ+XErYgzhQZloXjIBbeVWpRIZW
 LQewIBToxygefMIZgC3ppCUHpUCdqZLEnCuNu/wtzsD/WvLbtZhWO5gPRDXrmJpfDqg5jZZAFv/
 01/RakLmGgjvGfvLYnA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-05_01,2026-02-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 impostorscore=0 malwarescore=0 spamscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602050051
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 05 Feb 2026 07:32:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124198

On Wed, Feb 4, 2026 at 10:36=E2=80=AFPM Leon Anavi via lists.openembedded.o=
rg
<leon.anavi=3Dkonsulko.com@lists.openembedded.org> wrote:
>
> Upgrade to release 9.0.2:
>
> - Avoid memory leak of new argv when HEXPIRE commands target only
>   non-exiting fields
> - Fix HINCRBY and HINCRBYFLOAT to update volatile key tracking
> - Avoid empty hash object when HSETEX added no fields
> - Fix case-sensitive check for the FNX and FXX arguments in HSETEX
> - Prevent assertion in active expiration job after a hash with
>   volatile fields is overwritten
> - Fix HRANDFIELD to return null response when no field could be
>   found
> - Fix HEXPIRE to not delete items when validation rules fail and
>   expiration is in the past
> - Fix how hash is handling overriding of expired fields overwrite
> - HSETEX - Always issue keyspace notifications after validation
> - Make zero a valid TTL for hash fields during import mode and data
>   loading
> - Trigger prepareCommand on argc change in module command filters
> - Restrict TTL from being negative and avoid crash in import-mode
> - Fix chained replica crash when doing dual channel replication
> - Skip slot cache optimization for AOF client to prevent key
>   duplication and data corruption
> - Fix used_memory_dataset underflow due to miscalculated
>   used_memory_overhead
> - Avoid duplicate calculations of network-bytes-out in slot stats
>   with copy-avoidance
> - Fix XREAD returning error on empty stream with + ID
> - Track reply bytes in I/O threads if commandlog-reply-larger-than
>   is -1
> - This makes it possible to mitigate a performance regression in
>   9.0.1 caused by the related bug fix
>
> Fixes references to TMPDIR [buildpaths] and avoids [already-stripped].
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
> ---
>  .../valkey/{valkey_9.0.1.bb =3D> valkey_9.0.2.bb}        | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
>  rename meta-oe/recipes-extended/valkey/{valkey_9.0.1.bb =3D> valkey_9.0.=
2.bb} (87%)
>
> diff --git a/meta-oe/recipes-extended/valkey/valkey_9.0.1.bb b/meta-oe/re=
cipes-extended/valkey/valkey_9.0.2.bb
> similarity index 87%
> rename from meta-oe/recipes-extended/valkey/valkey_9.0.1.bb
> rename to meta-oe/recipes-extended/valkey/valkey_9.0.2.bb
> index 1f27224772..3334f57599 100644
> --- a/meta-oe/recipes-extended/valkey/valkey_9.0.1.bb
> +++ b/meta-oe/recipes-extended/valkey/valkey_9.0.2.bb
> @@ -15,7 +15,7 @@ SRC_URI =3D "git://github.com/valkey-io/valkey.git;bran=
ch=3D9.0;protocol=3Dhttps;tag=3D$
>             file://0001-src-Do-not-reset-FINAL_LIBS.patch \
>             file://GNU_SOURCE-7.patch \
>             "
> -SRCREV =3D "ab3c953b80289d88991095f53c1235fc2f8b44d6"
> +SRCREV =3D "1ac4cfe4c877a6cb8cb2e28fa7094055ac06f64b"
>
>  RPROVIDES:${PN} =3D "virtual-redis"
>
> @@ -44,6 +44,11 @@ do_compile() {
>  }
>
>  do_install() {
> +    # Remove debug paths to avoid TMPDIR [buildpaths] errors
> +    sed -i -e 's#${TMPDIR}##g' ${UNPACKDIR}/${PN}-${PV}/src/valkey-bench=
mark
> +    sed -i -e 's#${TMPDIR}##g' ${UNPACKDIR}/${PN}-${PV}/src/valkey-serve=
r
> +    sed -i -e 's#${TMPDIR}##g' ${UNPACKDIR}/${PN}-${PV}/src/valkey-cli
> +

I think these should be using ${S} instead or the files in ${D} should
be changed after install.

>      export PREFIX=3D${D}/${prefix}
>      oe_runmake install
>      install -d ${D}/${sysconfdir}/valkey
> @@ -63,6 +68,7 @@ do_install() {
>      fi
>  }
>
> +
>  CONFFILES:${PN} =3D "${sysconfdir}/valkey/valkey.conf"
>
>  INITSCRIPT_NAME =3D "valkey-server"
> @@ -71,3 +77,5 @@ INITSCRIPT_PARAMS =3D "defaults 87"
>  SYSTEMD_SERVICE:${PN} =3D "valkey.service"
>
>  CVE_STATUS[CVE-2022-3734] =3D "not-applicable-platform: CVE only applies=
 for Windows."
> +
> +INSANE_SKIP:${PN} =3D "already-stripped"
> --
> 2.47.3
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#124129): https://lists.openembedded.org/g/openembedde=
d-devel/message/124129
> Mute This Topic: https://lists.openembedded.org/mt/117634817/3616702
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [a=
nuj.mittal@oss.qualcomm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

