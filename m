Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C80BFF885A
	for <webhook@archiver.kernel.org>; Wed, 29 Apr 2026 03:18:12 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3786.1777432688443514774
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Apr 2026 20:18:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=aRAM0Bo2;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=OdiE2seo;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63SHafvY019540
	for <openembedded-devel@lists.openembedded.org>; Wed, 29 Apr 2026 03:18:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HarNsgVR9ZXclkclVSy3W5CdefoMaC9MyWuNgiNh9MY=; b=aRAM0Bo2wfqLnbMv
	KdTvG+PY2bPCwIuNtdMLncWJT1smz8n/uZdL28axQ3AM9qFgCbThEmE996MXun4c
	eQGcXdVuri5GlQ/wDl7iZ0ms6XcHCxAng1eElWDbtqTajiesFVLKlw2rCz8UlOUI
	ws1g8SkKcUDVG7ygxVd3eITE8zMZAdDVNjiRw5Zo7V2vpnk4UbSQ76nKSfukb723
	bnR0XKX7yxl64NXD9f8tc6JGQPcN95L/CYHcp4uVA+IlTWGGSUqyckOv48V+cYTo
	e5vxYReYpfng2OWyvuKF7LRzO/ijUYwk0fShCMzqadKeQOiPDpBp39q7xZnIlFjt
	2eIY/w==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4du1ee9pg1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 29 Apr 2026 03:18:07 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8acd145817dso100249606d6.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 28 Apr 2026 20:18:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777432687; cv=none;
        d=google.com; s=arc-20240605;
        b=bjof1BlXB6SvukW469gCta/SpW9cujGRXzUSL9BLVUPPqxUGJgs+KGsngedzDXSVc1
         9YJ0gTQ+u1CHYbRqind6Obgs81c13ECuHipT6xTcVX0OQbv51RCuUW1ikQGg/NXf6TRP
         6yttMSw+ADjwt2KYcN1Orr0LRqOaXcCmc/7ZwUaXT6+WqbxDXnNH9FPgDqn0eyS80n0R
         pBfJnaqhssdIWXobE1mBFiwwO363nz578ChYlcblZP/q2hD7BrWad45+yQdeDV7hC+4P
         BNEj614Ja2snc7hyYKFsSlKmhOOGWKR0eEHNslhrIQ6ul3SGy/wrUsFBADEblZX9u9MI
         oTdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HarNsgVR9ZXclkclVSy3W5CdefoMaC9MyWuNgiNh9MY=;
        fh=Q3D/Ahwz/78jcvxaOXGJ4XKpxBsLysDTsuQxdLd6AAw=;
        b=QQivUxqurt7R+xmzNBcFXNRY2f/mFLBEFz8RlWxl9u6f32fTzSLlC2WsCEliS/p89U
         LrMZJrjFCp9Rn0t30rpcSVRaKsHtrlR1vSF3SH4K7Ii+IuJi4j/oEK1gELxswEOtzfIA
         ewjJ5LjEX3oYePiP6hpRkWYaDQZqT7usYS75IeNy1hGiTkHSIOqFkXvzwhfISEf/UHdN
         fUFHbFe6M2uDwLuSKRbmYg2WFr0n0H/FJS7y7LGKC8m1UwIsrT61zuPj9TUn8X13WSgJ
         4ipqAJLl8JSqsFOaRv169T9JVkDXIbT3rVJsbh9N0t4gws74VuLfk3RAmBXcCW2Owfqt
         +sEA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777432687; x=1778037487; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HarNsgVR9ZXclkclVSy3W5CdefoMaC9MyWuNgiNh9MY=;
        b=OdiE2seoH5I0KaSZSIXfooJm4puq+K+LJdDlR1rRrExd2ZWUZmspnNuK93FoaWETvI
         iBDPWAoRLSdNhtvS2XJu8+wFvwdk0ZRqUWYluxspUcZWY90nDXxQqFKsT0JmRpOilojs
         x/+rwVA4IEOQLcdF6lkk40AxU5JWSNtTukb3JbB/pJxJYB4Bm91F9MMawXqe6xFvjBB5
         P4NjHCf+IIDoYx9jALFrQNlGYYvTujAQPJc+iWnz2KLxr0SNjpyzxGSPcIvnOiVQYsg3
         pdcs7kNOMTVy1bjexQDoDPTXcz2dRdKQUqyyfCCQCOGuiT1e4DoeAQTPKAU340r4ALgH
         V0TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777432687; x=1778037487;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HarNsgVR9ZXclkclVSy3W5CdefoMaC9MyWuNgiNh9MY=;
        b=F75JGE3q+G0GjApRhH3wbNGwvTkXrBEmJ3s4N2NqQVTkaVW0e3fZUila4TmFJ3vSVX
         mwA+Dfz3jd2G715JONTeU/1FUv+kyR06+x5aBsyuBK+FGdTvu3lgITtuSojD/YtpW9pJ
         yHdC4I1tuX3F2bEnVm3NA1HvNk25UG3qH01fZmMRjaE8Qf5WD3Tf/IabhaZ4gwtDPDHo
         OuyLVbjFw6B6M8mlljqxWMgNzufeThYcMl8t7FvtoZxh0MTg7hMEmB20X8LdKFn7HTKC
         cbdr6kRCAhZnKJp3pSUhhMDKK6AH8WEFB1UCfP2qnpMW6eJE4cUv8ng2p/U+So56SEre
         1VOQ==
X-Gm-Message-State: AOJu0YydOfblynxCEmAOszh6Fj6qRiSqpSkphn/k5dqYhXmtCMOmdtx4
	Col5xMQj2NfseNzKlG9MarGsKGJ5tKxD7rN2CfmZmQP4AErVtZxahgUsZ39Kxc3MG5sFxwiKWbd
	M04WGS2b235u1FpitUn6uHSZ0OKISXTto66z3CKIz7WTMf1qDtALX6ASuB3NPdybVk58O0yxYln
	PGfsHZYB+HJw5tErw8fvhXHbRwJg3pJPgpewcGcd7ib2InfDfXnk7lKUd9kTI=
X-Gm-Gg: AeBDietvoEUpVWm8uIn+MUXwlnQS7YHsMw2s+md7ieMGbh5J+TMCOb7jS5jFIAhPqL+
	9jw57GiiDgpllC+7Cueybk6Ic/h/m9PNKtWAiasWKN68Xns2Pa+xUqWrDxuOCgos3d+6a0Ly8Zk
	EQZek+dnB+D8wqP4kMQ0Ix+yRm91tW2bgaDXMq9HNHiZlgBLeQ5SBnzvce+685LNB7pLUl+YSHB
	CHWB8cMsXNK08E=
X-Received: by 2002:ad4:5ded:0:b0:8ac:b402:9af1 with SMTP id 6a1803df08f44-8b3e3205df3mr92293526d6.47.1777432686835;
        Tue, 28 Apr 2026 20:18:06 -0700 (PDT)
X-Received: by 2002:ad4:5ded:0:b0:8ac:b402:9af1 with SMTP id
 6a1803df08f44-8b3e3205df3mr92293116d6.47.1777432686248; Tue, 28 Apr 2026
 20:18:06 -0700 (PDT)
MIME-Version: 1.0
References: <20260428090053.3401574-1-mikko.rapeli@linaro.org>
In-Reply-To: <20260428090053.3401574-1-mikko.rapeli@linaro.org>
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 11:17:55 +0800
X-Gm-Features: AVHnY4JtRqmH6PPeKH-OvDkgkc6pFxXvFFrJKDyoMZCuJrclrOrCxUHCWQC80JA
Message-ID: <CA+s=J=xW4-4Os8Y=nkvAX9SjuSmzuebd-=SKhdT_RrMBZcx4=Q@mail.gmail.com>
Subject: Re: [oe] [meta-oe][scarthgap][PATCH 1/2] onig: fix gcc 15 build
To: mikko.rapeli@linaro.org
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=C/7ZDwP+ c=1 sm=1 tr=0 ts=69f1786f cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=cbDXEXchAAAA:20 a=Q4-j1AaZAAAA:8 a=KKAkSRfTAAAA:8
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=PvL_pLwV6fTBRE85QLYA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=cvBusfyB2V15izCimMoJ:22
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDAyOCBTYWx0ZWRfX62Sy3fTAiLEB
 Ce5rQwSzrqCXzheLBS0OTuiDlmzPv6BqvbX1bBtbgy7g+iTgHmIWk5s68GmVyaU+jnmZIfVBI39
 mqPbA9+EcCfkIUxmkiS/Q1OI9Qpap4kIdCt1IUwvzub5dDGVnNLvFM9+37vGMm3aYiPfuLtThc6
 0xDgssbAJ63Lbh+FH3J3u95cJt8X4lTnF/hfUDIWHUB5VrAGkkf5YfOBsod9ZG011ydt1oBJ0Z1
 7SxvdIkVPw4G8hqaCElisMW8Mn69/+I9VOuOSgK6NWuYMuSWhnqVGz0TbHMOmjSb3x8lgLv85FH
 CxVW8zv1jrcTpFbNrbXo1evh6lPadkTWgkYTI9dxZfjU6cnXFIQ8ePDDAPa9VzhBXvEbgonyera
 i+JHY2voQH+w4rRxCIse8gDNRWhE4nGHOYuLxgK4a0v7DHTplX2yj7s+kdWb7owJU0jHazVn0UD
 9B8otRi1u8YPu7CHaqw==
X-Proofpoint-GUID: Z-yuwsFIe_ELj-D37OCGnLBB-k94ZNBJ
X-Proofpoint-ORIG-GUID: Z-yuwsFIe_ELj-D37OCGnLBB-k94ZNBJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290028
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Apr 2026 03:18:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126660

Hi,

On Tue, Apr 28, 2026 at 5:01=E2=80=AFPM Mikko Rapeli via
lists.openembedded.org
<mikko.rapeli=3Dlinaro.org@lists.openembedded.org> wrote:
>
> With backport from upstream 6.9.10.
>
> Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> ---
>  ...08dee4a01dee60c4cd67f2e2e46484ef50a5.patch | 138 ++++++++++++++++++
>  meta-oe/recipes-support/onig/onig_6.9.9.bb    |   1 +
>  2 files changed, 139 insertions(+)
>  create mode 100644 meta-oe/recipes-support/onig/onig/5f1408dee4a01dee60c=
4cd67f2e2e46484ef50a5.patch
>
> diff --git a/meta-oe/recipes-support/onig/onig/5f1408dee4a01dee60c4cd67f2=
e2e46484ef50a5.patch b/meta-oe/recipes-support/onig/onig/5f1408dee4a01dee60=
c4cd67f2e2e46484ef50a5.patch
> new file mode 100644
> index 0000000000..f0683c2ebd
> --- /dev/null
> +++ b/meta-oe/recipes-support/onig/onig/5f1408dee4a01dee60c4cd67f2e2e4648=
4ef50a5.patch
> @@ -0,0 +1,138 @@
> +From 5f1408dee4a01dee60c4cd67f2e2e46484ef50a5 Mon Sep 17 00:00:00 2001
> +From: "K.Kosako" <kkosako0@gmail.com>
> +Date: Mon, 18 Nov 2024 00:18:12 +0900
> +Subject: [PATCH] fix #312: Build failure with GCC 15 (C23)
> +

This is missing Upstream-Status and Signed-off.

> +---
> + src/regparse.c | 44 ++++++++++++++++++++++++++++++++++++--------
> + src/st.h       |  9 +--------
> + 2 files changed, 37 insertions(+), 16 deletions(-)
> +
> +Upstream-Status: Backport [5f1408dee4a01dee60c4cd67f2e2e46484ef50a5]
> +Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> +
> +diff --git a/src/regparse.c b/src/regparse.c
> +index 24bcbaac..9acdd6e2 100644
> +--- a/src/regparse.c
> ++++ b/src/regparse.c
> +@@ -793,8 +793,13 @@ onig_print_names(FILE* fp, regex_t* reg)
> + #endif /* ONIG_DEBUG */
> +
> + static int
> +-i_free_name_entry(UChar* key, NameEntry* e, void* arg ARG_UNUSED)
> ++i_free_name_entry(st_data_t akey, st_data_t ae, st_data_t arg ARG_UNUSE=
D)
> + {
> ++  UChar* key;
> ++  NameEntry* e;
> ++
> ++  key =3D (UChar* )akey;
> ++  e =3D (NameEntry* )ae;
> +   xfree(e->name);
> +   if (IS_NOT_NULL(e->back_refs)) xfree(e->back_refs);
> +   xfree(key);
> +@@ -850,8 +855,14 @@ typedef struct {
> + } INamesArg;
> +
> + static int
> +-i_names(UChar* key ARG_UNUSED, NameEntry* e, INamesArg* arg)
> ++i_names(st_data_t key ARG_UNUSED, st_data_t ae, st_data_t aarg)
> + {
> ++  NameEntry* e;
> ++  INamesArg* arg;
> ++
> ++  e =3D (NameEntry* )ae;
> ++  arg =3D (INamesArg* )aarg;
> ++
> +   int r =3D (*(arg->func))(e->name,
> +                          e->name + e->name_len,
> +                          e->back_num,
> +@@ -883,9 +894,14 @@ onig_foreach_name(regex_t* reg,
> + }
> +
> + static int
> +-i_renumber_name(UChar* key ARG_UNUSED, NameEntry* e, GroupNumMap* map)
> ++i_renumber_name(st_data_t key ARG_UNUSED, st_data_t ae, st_data_t amap)
> + {
> +   int i;
> ++  NameEntry* e;
> ++  GroupNumMap* map;
> ++
> ++  e =3D (NameEntry* )ae;
> ++  map =3D (GroupNumMap* )amap;
> +
> +   if (e->back_num > 1) {
> +     for (i =3D 0; i < e->back_num; i++) {
> +@@ -1374,9 +1390,14 @@ static int CalloutNameIDCounter;
> + #ifdef USE_ST_LIBRARY
> +
> + static int
> +-i_free_callout_name_entry(st_callout_name_key* key, CalloutNameEntry* e=
,
> +-                          void* arg ARG_UNUSED)
> ++i_free_callout_name_entry(st_data_t akey, st_data_t ae, st_data_t arg A=
RG_UNUSED)
> + {
> ++  st_callout_name_key* key;
> ++  CalloutNameEntry* e;
> ++
> ++  key =3D (st_callout_name_key* )akey;
> ++  e =3D (CalloutNameEntry* )ae;
> ++
> +   if (IS_NOT_NULL(e)) {
> +     xfree(e->name);
> +   }
> +@@ -1870,10 +1891,14 @@ typedef intptr_t   CalloutTagVal;
> + #define CALLOUT_TAG_LIST_FLAG_TAG_EXIST     (1<<0)
> +
> + static int
> +-i_callout_callout_list_set(UChar* key, CalloutTagVal e, void* arg)
> ++i_callout_callout_list_set(st_data_t key ARG_UNUSED, st_data_t ae, st_d=
ata_t arg)
> + {
> +   int num;
> +-  RegexExt* ext =3D (RegexExt* )arg;
> ++  CalloutTagVal e;
> ++  RegexExt* ext;
> ++
> ++  e   =3D (CalloutTagVal )ae;
> ++  ext =3D (RegexExt* )arg;
> +
> +   num =3D (int )e - 1;
> +   ext->callout_list[num].flag |=3D CALLOUT_TAG_LIST_FLAG_TAG_EXIST;
> +@@ -1926,8 +1951,11 @@ onig_callout_tag_is_exist_at_callout_num(regex_t*=
 reg, int callout_num)
> + }
> +
> + static int
> +-i_free_callout_tag_entry(UChar* key, CalloutTagVal e, void* arg ARG_UNU=
SED)
> ++i_free_callout_tag_entry(st_data_t akey, st_data_t e ARG_UNUSED, st_dat=
a_t arg ARG_UNUSED)
> + {
> ++  UChar* key;
> ++
> ++  key =3D (UChar* )akey;
> +   xfree(key);
> +   return ST_DELETE;
> + }
> +diff --git a/src/st.h b/src/st.h
> +index 5efee8bb..70798dc5 100644
> +--- a/src/st.h
> ++++ b/src/st.h
> +@@ -34,13 +34,6 @@ enum st_retval {ST_CONTINUE, ST_STOP, ST_DELETE, ST_C=
HECK};
> + #ifndef _
> + # define _(args) args
> + #endif
> +-#ifndef ANYARGS
> +-# ifdef __cplusplus
> +-#   define ANYARGS ...
> +-# else
> +-#   define ANYARGS
> +-# endif
> +-#endif
> +
> + st_table *st_init_table _((struct st_hash_type *));
> + st_table *st_init_table_with_size _((struct st_hash_type *, int));
> +@@ -52,7 +45,7 @@ int st_delete _((st_table *, st_data_t *, st_data_t *)=
);
> + int st_delete_safe _((st_table *, st_data_t *, st_data_t *, st_data_t))=
;
> + int st_insert _((st_table *, st_data_t, st_data_t));
> + int st_lookup _((st_table *, st_data_t, st_data_t *));
> +-int st_foreach _((st_table *, int (*)(ANYARGS), st_data_t));
> ++int st_foreach _((st_table *, int (*)(st_data_t, st_data_t, st_data_t),=
 st_data_t));
> + void st_add_direct _((st_table *, st_data_t, st_data_t));
> + void st_free_table _((st_table *));
> + void st_cleanup_safe _((st_table *, st_data_t));
> diff --git a/meta-oe/recipes-support/onig/onig_6.9.9.bb b/meta-oe/recipes=
-support/onig/onig_6.9.9.bb
> index b29437db1e..b545fc7596 100644
> --- a/meta-oe/recipes-support/onig/onig_6.9.9.bb
> +++ b/meta-oe/recipes-support/onig/onig_6.9.9.bb
> @@ -11,6 +11,7 @@ SRC_URI =3D "\
>      https://github.com/kkos/oniguruma/releases/download/v${PV}/${BP}.tar=
.gz \
>      file://0001-build-don-t-link-against-host-system-libraries.patch \
>      file://0002-build-enable-serial-tests-automake-option-for-ptest.patc=
h \
> +    file://5f1408dee4a01dee60c4cd67f2e2e46484ef50a5.patch \
>      file://run-ptest \
>  "
>
> --
> 2.51.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#126649): https://lists.openembedded.org/g/openembedde=
d-devel/message/126649
> Mute This Topic: https://lists.openembedded.org/mt/119045170/3616702
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [a=
nuj.mittal@oss.qualcomm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

