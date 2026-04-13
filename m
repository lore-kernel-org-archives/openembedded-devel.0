Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77997F45A0F
	for <webhook@archiver.kernel.org>; Mon, 13 Apr 2026 11:41:10 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.270343.1776080465863287052
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Apr 2026 04:41:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=mQW1eN4Z;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=Gyqo13jv;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63D5ps22533404
	for <openembedded-devel@lists.openembedded.org>; Mon, 13 Apr 2026 11:41:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nv30NCFhpU2onKHsOFYwZULBE/26zf1Det9MJElYYqI=; b=mQW1eN4ZnVJ3eSjD
	jhov3glgjp/gotjtfZU0w1GzaN0bg9BPGMR99JLG+aXrNSx7aHvLvriRgQa7Wb+j
	ks5EnQAmV6RnxPmD2mmqJRdLIB0IDVUJhFhWwGINltRsG6lMHFQ5dNJ9NaQXx+eE
	aBjZSsZOwOSXizeJQI4lLwT/h9roFCvJh9FjtlEuQgcog5bhkawS3X7YcqwKQLxF
	30uYXZ4QeXE8NWAnIbNb6Jw7jwE5ME+D8BIdUbJ4ZsupS0FTSl/NtIcoAjMT3qZk
	GmcOAEyrj+bW4jdPrCapZAeWzJjeuGlsErCG1lRe9GVrkirGVZagqlIU7cBRaLoy
	aBBWpw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dff2bd3ep-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 13 Apr 2026 11:41:05 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8aca3b7b536so27083356d6.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 13 Apr 2026 04:41:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776080464; cv=none;
        d=google.com; s=arc-20240605;
        b=Xq3yfcT+WCd3GcVuvCEjeeq4PDtqOG3vkxxsmiKdxe3cc++NLQhpZPT4y1Gs7+Eqcu
         nDHiBzUggFakYa5AutK7uRw+qD3Z/UGABqi2Rl9GJsVBHxbDbFjxYcwTfooyhLArG1Ny
         Nt7djg8NqESHc924W9hQRGo8HVJakX26nZPHCfkWqcerwuaGxIBbpF12QEH3oXIDM3cT
         KFiWlSjFZovVPvFY5NJws6h6LdBPZWjCyVFY1hFAAY/0HINv4EPeusfTIAHjfm3l0eeO
         XpIH0bV9p2eHn3MPmUxm9W9+We597C0R4Lg9sGUC8phfT85m9dDy4dUQXl8pnbvY6cRV
         cK9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nv30NCFhpU2onKHsOFYwZULBE/26zf1Det9MJElYYqI=;
        fh=n0ZnAkKOhGDmrf8RLpwnC7FQ6xmEY5rofL6wXnjsXjs=;
        b=R0BkdtvFsCxD6vv8ClQxgJL2Gj46Ix5bdxGZp4IjZsrg/iHUKKJBiMLX5tjikXFPbB
         UY0xJu/xWgwBNrN3oo8PCA4w6YHHjVD6W4aFlm4DcHFkeojwIAFlgPVX+hEFsFHccwfX
         ob6Hr8nUUYW3hEfcwiY8ancRByWLOzd9tqFrGJHLk+XuOUN1vuz0WWzq5HG2DTqJjs9/
         yGLRATsEY4dXg7rZ+JAmLOBd8wa4QW1UiCfoYcOeK67ny7wzlKYkLqz+80Mvd2VM+VGO
         kzAw46+RTQPrWVJbMAb5WigH6M0c9OBnnfhR4B2Tj7tzoIfkeJhkUnFaB4JFpPCn73EG
         ymSw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776080464; x=1776685264; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nv30NCFhpU2onKHsOFYwZULBE/26zf1Det9MJElYYqI=;
        b=Gyqo13jv6MU6matjteRYW/U28nfICfT17uwpoO+0M10CfeLCiqDyxb4hludu4QTGmK
         KAHY6Ac+4dUzxa6EJs5D6i12hC2IoGJbyeFGd58hMYTdhKVtbEJc/CPhgZYbZaXPlbNe
         AUeU6hv6By0Vji/xS+hJDNG41iUfgwsVDQrFnI3QDL0iRZz3hf/h1VJmL5CGGRvpqVBP
         OBBEjfRAUfkLK7TnN8cRiif3kbBrJ37QB8A/QIaiO9gkBRS/07VPYm5shM8npT2nWlbp
         AQwa6ihF+G1EulMHm5V179469bRozx5UYqs8o6F4MfEeThg9K7zvQH+2kDUCHoUmDxXi
         FJPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776080464; x=1776685264;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nv30NCFhpU2onKHsOFYwZULBE/26zf1Det9MJElYYqI=;
        b=hKv1EiXs7XJ36lxy5gqgneggf2RdFF7qNxO9VdfxnSwwanoAzLhG2Ri/xourX/VvOB
         rm+aBjOXr7OdDvwmOvN9mS0Jg9Z+zAFNeOolKFppLQ2hX83MqJCdwpgMo0wr8jP8vN2A
         QmF3I8iv9nct5vzu2AoCtidbKwED2P4eB32Qpodviumf8bUChCId/ePaqd1/6jnhyZfW
         YlJaCarQKdYz/aq6+nDO5diiVGCnRiRIYUwCgzqGCsLnJF63ym/SoQUNkAGoeAHFqkOk
         vK6AXOpNm2n1XGabTwrxoRQGIS/jEbqhVPYhTSW5hzCn5F6OrSO+g8PDb9bCioJJoKdp
         aiVQ==
X-Gm-Message-State: AOJu0YwBKMrQ2hcDgdJZ9DCpOdx67x2mZ0x7yyw11cz2l/L0s+T1x7T5
	28XOlGEe7u/Hg3/3O7gn2QNVGONX61hWvN6PDONIuGw/HSto0o+qZ4+DlNjydjxJsn13nIaxRNB
	eSO1PFYfxD5Iks19ZhBENGt5pdNP7c0RB/c//jTUw4qbRrtBZgtzhzMfuPv6CrL4KLwOzBrHykV
	Ep43BPgGGP697EoJdGCTxnmDskXcMCD9yy9wGPxi0AI07QbUUJ3hFw6cvqMDU=
X-Gm-Gg: AeBDievX/q8HpcC/0R6krLulAGJKC7ojLWxbbDG5p8EU9dsdjsFsiCAUF3MAwi2+48T
	zcSFrTD76II7JPPe+7RYYmnFTSwS7ULD2dWth/b/RNuhU2Z9RMHc6TJurc2G9bV+BMAvZ8EIrrh
	vZesiI35jS9fopyrn4//YhP9ercsbrmD9lMBCAyZjAhvlwf+TFdkp259gMmWpjG7ksXsjKTjLhK
	M7m
X-Received: by 2002:a05:6214:4c84:b0:8ac:a6c5:c7d1 with SMTP id 6a1803df08f44-8aca6c5c984mr64513186d6.8.1776080464068;
        Mon, 13 Apr 2026 04:41:04 -0700 (PDT)
X-Received: by 2002:a05:6214:4c84:b0:8ac:a6c5:c7d1 with SMTP id
 6a1803df08f44-8aca6c5c984mr64512856d6.8.1776080463577; Mon, 13 Apr 2026
 04:41:03 -0700 (PDT)
MIME-Version: 1.0
References: <20260409112208.1119823-1-ankur.tyagi85@gmail.com> <20260409112208.1119823-8-ankur.tyagi85@gmail.com>
In-Reply-To: <20260409112208.1119823-8-ankur.tyagi85@gmail.com>
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Date: Mon, 13 Apr 2026 19:40:52 +0800
X-Gm-Features: AQROBzCCmgNWDALY4h-aZoQChgStgcShNjaEfs_7dS39aNr6Gwz_luG6RNfWYAU
Message-ID: <CA+s=J=zOjo=epSeHkT9TxynpEM8VH3zM51wFdBTvz2bZsY_yfQ@mail.gmail.com>
Subject: Re: [oe][meta-webserver][scarthgap][PATCH 8/8] nginx: fix CVE-2026-32647
To: ankur.tyagi85@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDExNSBTYWx0ZWRfX61VwBj2s+Tn/
 zMuOMecVZItbh1+5LaoGeaZNQ9TOF8OlD1RmeBu75dHuLIT1RO088sC+yekrNd1/yaerWyIG131
 wTJuizgvKOGxQuhilaouqQVyaSQRGjZ0WXmcg8FU1DsittWiTPjWomp35NWhNOBX72UlpKevprZ
 KYVwwSV+/u5A+4jTu2tecXdhqQlOqKROwZJuNL/Tf5FqvnHluRnh2aX0KrlP0fw/IFYZIzdH+vW
 ZEJiYaOuNotp5JJDi1pqQsJLZu7/PcufwZ0c77rmcTN5RY0H4rDK7Gl08NAYQ+hE8NVa7b41zP/
 e2sSgDOAnCrfm/i39N0awn3PTLVqC/EcweFuoRJhR4HTVbKIev+2qRoK1zdrkab3kaCnWz8HosW
 ZypGeajEOIQmdqvDuePRDzXxjhFAP+CE/lMbNHTslY5OfGF4Co2nTYuVitVbPs1gA+boWMaFK4C
 Ctli/+2iEE5L4tGa4mQ==
X-Proofpoint-GUID: sX0f54_fyL0E0A6E7L13ECZs4ToeBoWu
X-Proofpoint-ORIG-GUID: sX0f54_fyL0E0A6E7L13ECZs4ToeBoWu
X-Authority-Analysis: v=2.4 cv=W4gIkxWk c=1 sm=1 tr=0 ts=69dcd651 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=n2LCcfabAAAA:8 a=PYnjg3YJAAAA:8 a=NEAV23lmAAAA:8
 a=Q4-j1AaZAAAA:8 a=pGLkceISAAAA:8 a=L4EWI0dvAAAA:8 a=52mZ9Kkmbp5oVjFlJRQA:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22 a=4Yw60klCxmr9x6OUr44h:22
 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_03,2026-04-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 spamscore=0 clxscore=1015 phishscore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604130115
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Apr 2026 11:41:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126276

On Thu, Apr 9, 2026 at 7:23=E2=80=AFPM Ankur Tyagi via lists.openembedded.o=
rg
<ankur.tyagi85=3Dgmail.com@lists.openembedded.org> wrote:
>
> From: Ankur Tyagi <ankur.tyagi85@gmail.com>
>
> As per the advisory[1] mentioned in NVD[2], version 1.28.3 contains the f=
ix.
> Backport the commits[3][4] from 1.28.3 changelog matching the description=
.
>
> [1] https://my.f5.com/manage/s/article/K000160366
> [2] https://nvd.nist.gov/vuln/detail/CVE-2026-32647
> [3] https://github.com/nginx/nginx/commit/a172c880cb51f882a5dc999437e8b3a=
4f87630cc
> [4] https://github.com/nginx/nginx/commit/b23ac73b00313d159a99636c21ef71b=
828781018
>
> Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> ---
>  .../nginx/nginx-1.24.0/CVE-2026-32647-1.patch | 77 ++++++++++++++++
>  .../nginx/nginx-1.24.0/CVE-2026-32647-2.patch | 87 +++++++++++++++++++
>  .../recipes-httpd/nginx/nginx_1.24.0.bb       |  2 +
>  3 files changed, 166 insertions(+)
>  create mode 100644 meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CVE-2=
026-32647-1.patch
>  create mode 100644 meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CVE-2=
026-32647-2.patch
>
> diff --git a/meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CVE-2026-326=
47-1.patch b/meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CVE-2026-32647=
-1.patch
> new file mode 100644
> index 0000000000..506a3fb887
> --- /dev/null
> +++ b/meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CVE-2026-32647-1.pa=
tch
> @@ -0,0 +1,77 @@
> +From c694db97c62f33d621e73937a63e7b5c206c16c9 Mon Sep 17 00:00:00 2001
> +From: Roman Arutyunyan <arut@nginx.com>
> +Date: Sat, 21 Feb 2026 12:04:36 +0400
> +Subject: [PATCH] Mp4: avoid zero size buffers in output.
> +
> +Previously, data validation checks did not cover the cases when the outp=
ut
> +contained empty buffers.  Such buffers are considered illegal and produc=
e
> +"zero size buf in output" alerts.  The change rejects the mp4 files whic=
h
> +produce such alerts.
> +
> +Also, the change fixes possible buffer overread and overwrite that could
> +happen while processing empty stco and co64 atoms, as reported by
> +Pavel Kohout (Aisle Research) and Tim Becker.
> +
> +(cherry picked from commit a172c880cb51f882a5dc999437e8b3a4f87630cc)
> +
> +CVE: CVE-2026-32647
> +Upstream-Status: Backport [https://github.com/nginx/nginx/commit/a172c88=
0cb51f882a5dc999437e8b3a4f87630cc]
> +Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> +---
> + src/http/modules/ngx_http_mp4_module.c | 15 +++++++++------
> + 1 file changed, 9 insertions(+), 6 deletions(-)
> +
> +diff --git a/src/http/modules/ngx_http_mp4_module.c b/src/http/modules/n=
gx_http_mp4_module.c
> +index 041ad263b..13d87cd6a 100644
> +--- a/src/http/modules/ngx_http_mp4_module.c
> ++++ b/src/http/modules/ngx_http_mp4_module.c
> +@@ -901,8 +901,11 @@ ngx_http_mp4_process(ngx_http_mp4_file_t *mp4)
> +         }
> +     }
> +
> +-    if (end_offset < start_offset) {
> +-        end_offset =3D start_offset;
> ++    if (end_offset <=3D start_offset) {
> ++        ngx_log_error(NGX_LOG_ERR, mp4->file.log, 0,
> ++                      "no data between start time and end time in \"%s\=
"",
> ++                      mp4->file.name.data);
> ++        return NGX_ERROR;
> +     }
> +
> +     mp4->moov_size +=3D 8;
> +@@ -913,7 +916,7 @@ ngx_http_mp4_process(ngx_http_mp4_file_t *mp4)
> +
> +     *prev =3D &mp4->mdat_atom;
> +
> +-    if (start_offset > mp4->mdat_data.buf->file_last) {
> ++    if (start_offset >=3D mp4->mdat_data.buf->file_last) {
> +         ngx_log_error(NGX_LOG_ERR, mp4->file.log, 0,
> +                       "start time is out mp4 mdat atom in \"%s\"",
> +                       mp4->file.name.data);
> +@@ -3416,7 +3419,7 @@ ngx_http_mp4_update_stsz_atom(ngx_http_mp4_file_t =
*mp4,
> +     if (data) {
> +         entries =3D trak->sample_sizes_entries;
> +
> +-        if (trak->start_sample > entries) {
> ++        if (trak->start_sample >=3D entries) {
> +             ngx_log_error(NGX_LOG_ERR, mp4->file.log, 0,
> +                           "start time is out mp4 stsz samples in \"%s\"=
",
> +                           mp4->file.name.data);
> +@@ -3591,7 +3594,7 @@ ngx_http_mp4_update_stco_atom(ngx_http_mp4_file_t =
*mp4,
> +         return NGX_ERROR;
> +     }
> +
> +-    if (trak->start_chunk > trak->chunks) {
> ++    if (trak->start_chunk >=3D trak->chunks) {
> +         ngx_log_error(NGX_LOG_ERR, mp4->file.log, 0,
> +                       "start time is out mp4 stco chunks in \"%s\"",
> +                       mp4->file.name.data);
> +@@ -3806,7 +3809,7 @@ ngx_http_mp4_update_co64_atom(ngx_http_mp4_file_t =
*mp4,
> +         return NGX_ERROR;
> +     }
> +
> +-    if (trak->start_chunk > trak->chunks) {
> ++    if (trak->start_chunk >=3D trak->chunks) {
> +         ngx_log_error(NGX_LOG_ERR, mp4->file.log, 0,
> +                       "start time is out mp4 co64 chunks in \"%s\"",
> +                       mp4->file.name.data);
> diff --git a/meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CVE-2026-326=
47-2.patch b/meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CVE-2026-32647=
-2.patch
> new file mode 100644
> index 0000000000..80bf94f5f1
> --- /dev/null
> +++ b/meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CVE-2026-32647-2.pa=
tch
> @@ -0,0 +1,87 @@
> +From 1742d7fe92ed355ffa5aa68609b96f00f582f3d6 Mon Sep 17 00:00:00 2001
> +From: Roman Arutyunyan <arut@nginx.com>
> +Date: Mon, 2 Mar 2026 21:12:34 +0400
> +Subject: [PATCH] Mp4: fixed possible integer overflow on 32-bit platform=
s.
> +

This is same as:
https://lists.openembedded.org/g/openembedded-devel/message/126024
sent earlier for a different CVE. Can you please check and resend?

