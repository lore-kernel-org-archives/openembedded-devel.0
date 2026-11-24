Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13039.1795504887492430953
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Nov 2026 23:21:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=YhkGw18h;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=DQId+Se9;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO2kAcY196967
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Nov 2026 07:21:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3tA2taEE1sVxGvyc+XGJXMpUr7l1aO6HRIu0Ba8Wo3M=; b=YhkGw18h7zhe2ysK
	WqY365a+9Mw28nFAyS2RlaDGxgN7AZCkKBZVPMsqNjLzVbasieIhrcF7l3ZRmSfV
	BmABZN0SROqRTIyD1YfMcIqGKE+O2LrNGlYh45NPBEAkQRrPIx8LlDBLrOFTLYk7
	3Frr6neNsoZyckp/12UGAHg2b1BnRpK5j9iPZDTIVMMKvt5zp4k8Q6tKRwbi+E6O
	BPyy4hQ8YXNgHWFfWSz/wELo30V/hLX3sNU7CkL4iOi5llF3VoktbpskdMc702i6
	d9QOkELqre+bQJFHTiNTI/Q3AqBzYRQOG2PBemonYYpz8lFoZ/ny3GotN88YGjJr
	t0YqWg==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4ukrabk7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Nov 2026 07:21:26 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-8b4cc42ac12so52481507b3.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 23 Nov 2026 23:21:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795504885; cv=none;
        d=google.com; s=arc-20260327;
        b=Ux9Mk58nWJvektFwDBT4qb1DURjNyp/EdIHhsq1oS+7gnMFis67QIY68a+Al4eheed
         ICBn86iLoKGPbOGa602res/+Y4Zr9/lcz8CLR5N6lFNpt1sPkxdpdVHDEn1QBhurz8fi
         DhbHTWmmUiEnewh6kXhgihT5/GY9/OQuO7p/rUlTvgzv3dU+D8rcN7DXARINlcnBg1Ok
         gfZjiTZudpbUc9t0agLKcjAO2CRYQl5WQa0QEUYiw1EeNPS6fVc7WUtlNonCsTJ8Zi59
         LgjWD29xvCzowl9g/orwJpFPJsTlEhvXk0AfecXBNL8VTGHijAgblCa8E/GIX5e+zU1K
         EnsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3tA2taEE1sVxGvyc+XGJXMpUr7l1aO6HRIu0Ba8Wo3M=;
        fh=evSEETYhi+I0CuI6tByd4fnFrTN2ZdiJ4UqxZ44kUtI=;
        b=TZe7xX3oBNXuKcpZYuDYSu46vQh61xSAizubhqTcrSAY/FkPja6AWVl0r8QtCRpaPP
         eVr5m3ZpzJbjz68jRv5hsiIphMXFQlJr/nrdi20owEiF/CsYxGQhalyvd8viMdeGCbxC
         BZe/LhhsmD837QWIYZGMXOOxO4Sv0Z34252SKzod/Kd/YQjzgw2UEdEZmWFkJh/3whYl
         ghCXeI+EHJhmDwpxptzQCxCvkfN8vuU5rC2AQsxe1qq7Qn0AledPMCm1AUbqbaZSV64O
         UrqkxDXsJGRKfJ+vG1Hh5ZRYSsCVWwhFdlNqcSzowFWcNzoJfEzFjAEdgTz0gmrr1o7c
         5tNQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795504885; x=1796109685; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3tA2taEE1sVxGvyc+XGJXMpUr7l1aO6HRIu0Ba8Wo3M=;
        b=DQId+Se9axvc2TYrJ/iW4Be2490OYDDS0D7njECbmPTDvnLlOXN70EqCyDfsAmyXPC
         918JBL/3sbtDVUh1wFsSmoUe50deTuXMbi812U/530+uXhjuuRlBNon46kvboDIdARjV
         TxA4OF0XXf2OyOAlmoPWrgXEdcHujXpaTbQ/8mtr60YPViJ/HjYGFhXYEJgyfMgYGw7E
         dKzeqvHwFxoODA8Z4fm+OocIEetlippZtj7PkBaifpu3WFg/yVnELR/eth9aKHT9UmCR
         VMfcbK3SysJdQRG5oKL8YnduAnXN/25q3Mw0RGUI3a1B5cxia+YzU1tA2klvkK/AN6Gz
         AeDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795504885; x=1796109685;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3tA2taEE1sVxGvyc+XGJXMpUr7l1aO6HRIu0Ba8Wo3M=;
        b=FyMi2usv6OKHdBpYw7YtGfcdc0OIfeHG+/BcxZh11PyYwMzxoYwYrmbF76ObLIv8OQ
         E49xrkw/mOpZY738NbyMOOs4cn/2UG2KuCZNDLPj67hONCX/hmdEgiR5uuhY2BR0dJ59
         V5C+oxEMP7sOYyPA+Rce8M3pre40MYNcrGVQk9xJffo9bvj9G6G/e+SCYhLGPLmZpwWg
         +1doL9cIfoRcnn1tOYps3ttMrj3Y6RZtqmy+hzELr2Td90mmMKGA9Y845ZiH5hflZnas
         qXiKVsGVVA5wWEyWMLJxXEuTJ9CB3M2SPxTlsMkkXN8PdcQeIjSGTVrio/Vt/CEjxQnQ
         ChXg==
X-Gm-Message-State: APuU4Z/H2hZMkeU6F8fWEBpt8tjda20rwmgrM3WtqYLy+aUvTzNbPiqI
	rtglfsJQITtEBP3d72Flo71I3I2LfBdJYy5BKEWAHbVj5zJnK3uj6DkXWXY24P6QdT+NhDp+dSh
	0yjIABU0tUQ3m46/TAapMbkEnbCsLBxFIbi7cTNCbRWuU4X05wE/rwQZis3NAdX4b5abN9dseeQ
	E1fbDjTOcFf5ps04o649eXpDvNWXemze2RiRAV1MObV2hLcd/pRZIwkGqBea8=
X-Gm-Gg: AZFdTZfcSF2RGZ4ebLyyR7MrkxQC9HtyAZi/eUU9PVAR0cY9GhhcqkMmRL9zmJvB4YZ
	OwxAi2mqhUfbyMXCNK4RzokXRSeku4wJ+m3dDtGsmUQicyS3qovA7gt1j46DkXksgMduxYQsbfe
	RieT64HRqn3sz5h5HL2Hj9xoXmOF9PdO50qdR9+0zvkrFqFkQDerXdisud7Q==
X-Received: by 2002:a05:690e:43d3:b0:67d:b299:df5c with SMTP id 956f58d0204a3-67df43f35bcmr3520120d50.22.1795504884740;
        Mon, 23 Nov 2026 23:21:24 -0800 (PST)
X-Received: by 2002:a05:690e:43d3:b0:67d:b299:df5c with SMTP id
 956f58d0204a3-67df43f35bcmr3520114d50.22.1795504884271; Mon, 23 Nov 2026
 23:21:24 -0800 (PST)
MIME-Version: 1.0
References: <20261029203012.3210324-1-peter.marko@siemens.com> <AS8PR10MB50736F6F65C7B5C09F83BC97FD442@AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AS8PR10MB50736F6F65C7B5C09F83BC97FD442@AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM>
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 15:21:12 +0800
X-Gm-Features: Aa3M54rUHKtM9VoRjNydfYunD5PGPg-PZ4JGMjRQW-STt0dIDTIMPQkY-8kB7P8
Message-ID: <CA+s=J=z4tto-q4DobP-uN-nwGb1koAbF+K+erow1d6rFp3EaAQ@mail.gmail.com>
Subject: Re: [meta-oe][scarthgap][PATCH] zchunk: patch CVE-2026-117556
To: "Marko, Peter" <Peter.Marko@siemens.com>
Cc: "openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDAyOSBTYWx0ZWRfX31elp5AwQnjf
 vlpScI6dDvpBnv2y1+V8XF3AZEDxnFtD8gyMBBC97rBwgeVsqPuxf2sX8mQR3c/rD6mvfnm+YG+
 aRgJjCO0iJMhlaDwuBN7oSKi+xs29XU=
X-Proofpoint-ORIG-GUID: vCEIcogD0FsUf2lpf6mk42FYRy9FbnFF
X-Authority-Analysis: v=2.4 cv=M+rYuCws c=1 sm=1 tr=0 ts=6b053af6 cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=xNf9USuDAAAA:8 a=NEAV23lmAAAA:8 a=a_U1oVfrAAAA:8
 a=Q4-j1AaZAAAA:8 a=B_wzZKeTAAAA:8 a=XUEzWemcrIUaBDyyJ78A:9 a=QEXdDO2ut3YA:10
 a=kLokIza1BN8a-hAJ3hfR:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=iblVP3yQClW3uTx43Gse:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDAyOSBTYWx0ZWRfX+v3z9hR5XOkc
 eq/egZYs0JyDpPSRWsF2bKpolPqXjRyHVxSWSmizT1RchIjR8qximmz1TV2NFksjECOtle/xkuP
 vfuHcFKuL9N9mc9WkTJgSMxdRnikjfBzJ06wYLDaVAiHeiVVaWiyG7XM2hyqX2Dp5L2F9E7XVSq
 Dr7nmTgAyq4Q/pYhmnwYPpBx7LpzMBe6BR35orxHLhZqHL1B9rkCKNTE+Y/FCmr7LoiMYwXWAts
 81Z++joBh9ZeLjULLaTkB8q7QOTNwTSKCf2eKd1s0eEELYDqWhAA1QElQlLeIun55VLtrfq8hKj
 bQi6Qfwf8X2vKdwilxgszOzGVVxeRm6cyKHLnzv3xEL+ZqJmddq8uQZySche86X1/scwe+asvNT
 gAURmWqZjyQxfd+XImXTnQ+f/v0jbFY71urmi3zafRpwL5NrDDqi58N+zV9wPe208wJ+9ryGBLB
 /psEW90nh5KtgkllWlw==
X-Proofpoint-GUID: vCEIcogD0FsUf2lpf6mk42FYRy9FbnFF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 spamscore=0 adultscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240029
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 24 Nov 2026 07:21:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132934

Hi Peter,

On Tue, Nov 24, 2026 at 3:18=E2=80=AFPM Marko, Peter <Peter.Marko@siemens.c=
om> wrote:
>
> Gentle ping.
> This one is missing in last scarthgap merge...

I left it on purpose because I was waiting for your response. I think
this fix introduces a problem that requires another patch to be
backported.

>
> Peter
>
> > -----Original Message-----
> > From: Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>
> > Sent: Thursday, October 29, 2026 9:30 PM
> > To: openembedded-devel@lists.openembedded.org
> > Cc: Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>
> > Subject: [meta-oe][scarthgap][PATCH] zchunk: patch CVE-2026-117556
> >
> > From: Peter Marko <peter.marko@siemens.com>
> >
> > Pick patch per [1].
> > Also pick related patch to apply it correctly.
> >
> > [1] https://security-tracker.debian.org/tracker/CVE-2026-117556
> >
> > Signed-off-by: Peter Marko <peter.marko@siemens.com>
> > ---
> >  .../zchunk/zchunk/CVE-2026-117556-01.patch    | 150 ++++++++
> >  .../zchunk/zchunk/CVE-2026-117556-02.patch    | 329 ++++++++++++++++++
> >  .../recipes-support/zchunk/zchunk_1.4.0.bb    |   6 +-
> >  3 files changed, 484 insertions(+), 1 deletion(-)
> >  create mode 100644 meta-oe/recipes-support/zchunk/zchunk/CVE-2026-
> > 117556-01.patch
> >  create mode 100644 meta-oe/recipes-support/zchunk/zchunk/CVE-2026-
> > 117556-02.patch
> >
> > diff --git a/meta-oe/recipes-support/zchunk/zchunk/CVE-2026-117556-01.p=
atch
> > b/meta-oe/recipes-support/zchunk/zchunk/CVE-2026-117556-01.patch
> > new file mode 100644
> > index 00000000000..01ac3cca92f
> > --- /dev/null
> > +++ b/meta-oe/recipes-support/zchunk/zchunk/CVE-2026-117556-01.patch
> > @@ -0,0 +1,150 @@
> > +From ab6aedbe5a1e9597ba9b9e50462af476a0655f7a Mon Sep 17 00:00:00
> > 2001
> > +From: Jonathan Dieter <jonathan@dieter.ie>
> > +Date: Thu, 30 Jul 2026 20:51:11 +0100
> > +Subject: [PATCH] Fix a number of memory related bugs in zchunk
> > +
> > +Credit for this patch and for bringing these bugs to my attention goes=
 to
> > +glitchfox.  Additionally, after glitchfox brought this to my attention=
, I
> > +received a PR to fix the optional element bug from lilu5458.
> > +
> > +Authored-by: glitchfox@benjaminali.com
> > +Signed-off-by: Jonathan Dieter <jonathan@dieter.ie>
> > +
> > +CVE: CVE-2026-117556
> > +Upstream-Status: Backport
> > [https://github.com/zchunk/zchunk/commit/ab6aedbe5a1e9597ba9b9e50462af4=
7
> > 6a0655f7a]
> > +Signed-off-by: Peter Marko <peter.marko@siemens.com>
> > +---
> > + src/lib/comp/comp.c        |  8 +++++---
> > + src/lib/dl/range.c         |  3 +++
> > + src/lib/header.c           |  4 ++++
> > + src/lib/index/index_read.c | 20 +++++++++++++++-----
> > + 4 files changed, 27 insertions(+), 8 deletions(-)
> > +
> > +diff --git a/src/lib/comp/comp.c b/src/lib/comp/comp.c
> > +index 414727d..1c116a6 100644
> > +--- a/src/lib/comp/comp.c
> > ++++ b/src/lib/comp/comp.c
> > +@@ -101,7 +101,8 @@ static size_t comp_read_from_dc(zckCtx *zck, zckCo=
mp
> > *comp, char *dst,
> > +     size_t dl_size =3D dst_size;
> > +     if(dl_size > comp->dc_data_size - comp->dc_data_loc)
> > +         dl_size =3D comp->dc_data_size - comp->dc_data_loc;
> > +-    memcpy(dst, comp->dc_data+comp->dc_data_loc, dl_size);
> > ++    if(dl_size > 0)
> > ++        memcpy(dst, comp->dc_data+comp->dc_data_loc, dl_size);
> > +     comp->dc_data_loc +=3D dl_size;
> > +     if(dl_size > 0)
> > +         zck_log(ZCK_LOG_DEBUG, "Reading %llu bytes from decompressed
> > buffer",
> > +@@ -414,8 +415,9 @@ bool comp_add_to_dc(zckCtx *zck, zckComp *comp,
> > const char *src,
> > +                 (long long unsigned) comp->dc_data_loc);
> > +     zck_log(ZCK_LOG_DEBUG, "Adding %llu bytes to decompressed buffer"=
,
> > +             (long long unsigned) src_size);
> > +-    memcpy(temp, comp->dc_data + comp->dc_data_loc,
> > +-           comp->dc_data_size - comp->dc_data_loc);
> > ++    if(comp->dc_data_size > comp->dc_data_loc)
> > ++        memcpy(temp, comp->dc_data + comp->dc_data_loc,
> > ++               comp->dc_data_size - comp->dc_data_loc);
> > +     free(comp->dc_data);
> > +     comp->dc_data_size -=3D comp->dc_data_loc;
> > +     comp->dc_data_loc =3D 0;
> > +diff --git a/src/lib/dl/range.c b/src/lib/dl/range.c
> > +index d4f7426..d786551 100644
> > +--- a/src/lib/dl/range.c
> > ++++ b/src/lib/dl/range.c
> > +@@ -153,6 +153,9 @@ void ZCK_PUBLIC_API zck_range_free(zckRange
> > **info) {
> > + }
> > +
> > + char ZCK_PUBLIC_API *zck_get_range_char(zckCtx *zck, zckRange *range)=
 {
> > ++    if(range =3D=3D NULL || range->first =3D=3D NULL)
> > ++        return zmalloc(1);
> > ++
> > +     int buf_size =3D BUF_SIZE;
> > +     char *output =3D zmalloc(buf_size);
> > +     if (!output) {
> > +diff --git a/src/lib/header.c b/src/lib/header.c
> > +index 57adc31..e28935d 100644
> > +--- a/src/lib/header.c
> > ++++ b/src/lib/header.c
> > +@@ -195,6 +195,10 @@ static bool read_preface(zckCtx *zck) {
> > +             if(!compint_to_size(zck, &data_size, header+length, &leng=
th,
> > +                                 max_length))
> > +                 return false;
> > ++            if(data_size > max_length - length) {
> > ++                set_fatal_error(zck, "Optional element exceeds header=
 size");
> > ++                return false;
> > ++            }
> > +             if(!read_optional_element(zck, id, data_size, header+leng=
th))
> > +                 return false;
> > +             length +=3D data_size;
> > +diff --git a/src/lib/index/index_read.c b/src/lib/index/index_read.c
> > +index 6ec0a8d..8f57f23 100644
> > +--- a/src/lib/index/index_read.c
> > ++++ b/src/lib/index/index_read.c
> > +@@ -47,7 +47,7 @@ bool index_read(zckCtx *zck, char *data, size_t size=
,
> > size_t max_length) {
> > +
> > +     /* Read and configure hash type */
> > +     int hash_type =3D 0;
> > +-    if(!compint_to_int(zck, &hash_type, data + length, &length, max_l=
ength)) {
> > ++    if(!compint_to_int(zck, &hash_type, data + length, &length, size)=
) {
> > +         set_fatal_error(zck, "Unable to read hash type");
> > +         return false;
> > +     }
> > +@@ -59,7 +59,7 @@ bool index_read(zckCtx *zck, char *data, size_t size=
,
> > size_t max_length) {
> > +     /* Read number of index entries */
> > +     size_t index_count;
> > +     if(!compint_to_size(zck, &index_count, data + length, &length,
> > +-                        max_length)) {
> > ++                        size)) {
> > +         set_fatal_error(zck, "Unable to read index count");
> > +         return false;
> > +     }
> > +@@ -69,7 +69,7 @@ bool index_read(zckCtx *zck, char *data, size_t size=
,
> > size_t max_length) {
> > +     size_t idx_loc =3D 0;
> > +     int count =3D 0;
> > +     while(length < size) {
> > +-        if(length + zck->index.digest_size > max_length) {
> > ++        if(zck->index.digest_size > size - length) {
> > +             set_fatal_error(zck, "Read past end of header");
> > +             return false;
> > +         }
> > +@@ -99,6 +99,12 @@ bool index_read(zckCtx *zck, char *data, size_t siz=
e,
> > size_t max_length) {
> > +         /* Read uncompressed entry digest, if any */
> > +         if (zck->has_uncompressed_source) {
> > +             /* same size for digest as compressed */
> > ++            if(zck->index.digest_size > size - length) {
> > ++                set_fatal_error(zck, "Read past end of index");
> > ++                free(new->digest);
> > ++                free(new);
> > ++                return false;
> > ++            }
> > +             new->digest_uncompressed =3D zmalloc(zck->index.digest_si=
ze);
> > +             if (!new->digest_uncompressed) {
> > +                 free(new->digest);
> > +@@ -116,7 +122,7 @@ bool index_read(zckCtx *zck, char *data, size_t si=
ze,
> > size_t max_length) {
> > +         /* Read and store entry length */
> > +         size_t chunk_length =3D 0;
> > +         if(!compint_to_size(zck, &chunk_length, data+length, &length,
> > +-                            max_length)) {
> > ++                            size)) {
> > +             set_fatal_error(zck, "Unable to read chunk %i compressed =
size",
> > +                             count);
> > +             return false;
> > +@@ -127,7 +133,7 @@ bool index_read(zckCtx *zck, char *data, size_t si=
ze,
> > size_t max_length) {
> > +         /* Read and store uncompressed entry length */
> > +         chunk_length =3D 0;
> > +         if(!compint_to_size(zck, &chunk_length, data+length, &length,
> > +-                            max_length)) {
> > ++                            size)) {
> > +             set_fatal_error(zck, "Unable to read chunk %i uncompresse=
d size",
> > +                             count);
> > +             return false;
> > +@@ -146,6 +152,10 @@ bool index_read(zckCtx *zck, char *data, size_t s=
ize,
> > size_t max_length) {
> > +             zck->index.first =3D new;
> > +         prev =3D new;
> > +     }
> > ++    if(count =3D=3D 0 || (size_t)count !=3D index_count) {
> > ++        set_fatal_error(zck, "Index entry count does not match index =
data");
> > ++        return false;
> > ++    }
> > +     free(zck->index_string);
> > +     zck->index_string =3D NULL;
> > +     return true;
> > diff --git a/meta-oe/recipes-support/zchunk/zchunk/CVE-2026-117556-02.p=
atch
> > b/meta-oe/recipes-support/zchunk/zchunk/CVE-2026-117556-02.patch
> > new file mode 100644
> > index 00000000000..968632cbeb8
> > --- /dev/null
> > +++ b/meta-oe/recipes-support/zchunk/zchunk/CVE-2026-117556-02.patch
> > @@ -0,0 +1,329 @@
> > +From 02b371a64bf98245df97315d07c684a0ca5ea1df Mon Sep 17 00:00:00
> > 2001
> > +From: Jonathan Dieter <jonathan@dieter.ie>
> > +Date: Mon, 26 Oct 2026 18:07:06 +0000
> > +Subject: [PATCH] Fix out-of-bounds read
> > +
> > +Also, add a flag for doing memory tests.
> > +
> > +Thanks to HaiND (Nguyen Dinh Hai), Post and Telecommunication Institut=
e
> > +of Technology, github.com/Haind03 for flagging up this issue
> > +
> > +Signed-off-by: Jonathan Dieter <jonathan@dieter.ie>
> > +
> > +CVE: CVE-2026-117556
> > +Upstream-Status: Backport
> > [https://github.com/zchunk/zchunk/commit/02b371a64bf98245df97315d07c684=
a0
> > ca5ea1df]
> > +Signed-off-by: Peter Marko <peter.marko@siemens.com>
> > +---
> > + src/lib/compint.c         |   4 +
> > + src/lib/header.c          |  16 +--
> > + test/meson.build          |  10 ++
> > + test/read_header_bounds.c | 203
> > ++++++++++++++++++++++++++++++++++++++
> > + 4 files changed, 227 insertions(+), 6 deletions(-)
> > + create mode 100644 test/read_header_bounds.c
> > +
> > +diff --git a/src/lib/compint.c b/src/lib/compint.c
> > +index 5178559..7324d12 100644
> > +--- a/src/lib/compint.c
> > ++++ b/src/lib/compint.c
> > +@@ -48,6 +48,10 @@ int compint_to_size(zckCtx *zck, size_t *val, const=
 char
> > *compint,
> > +     VALIDATE_BOOL(zck);
> > +
> > +     *val =3D 0;
> > ++    if(max_length =3D=3D 0) {
> > ++        set_fatal_error(zck, "Read past end of header");
> > ++        return false;
> > ++    }
> > +     size_t old_val =3D 0;
> > +     const unsigned char *i =3D (unsigned char *)compint;
> > +     int count =3D 0;
> > +diff --git a/src/lib/header.c b/src/lib/header.c
> > +index e28935d..05f8895 100644
> > +--- a/src/lib/header.c
> > ++++ b/src/lib/header.c
> > +@@ -164,7 +164,8 @@ static bool read_preface(zckCtx *zck) {
> > +
> > +     /* Read flags */
> > +     size_t flags =3D 0;
> > +-    if(!compint_to_size(zck, &flags, header+length, &length, max_leng=
th))
> > ++    if(!compint_to_size(zck, &flags, header+length, &length,
> > ++                        max_length - length))
> > +         return false;
> > +     if(!check_flags(zck, flags))
> > +         return false;
> > +@@ -174,7 +175,8 @@ static bool read_preface(zckCtx *zck) {
> > +     int tmp =3D 0;
> > +
> > +     /* Read and initialize compression type */
> > +-    if(!compint_to_int(zck, &tmp, header+length, &length, max_length)=
)
> > ++    if(!compint_to_int(zck, &tmp, header+length, &length,
> > ++                       max_length - length))
> > +         return false;
> > +     if(!comp_ioption(zck, ZCK_COMP_TYPE, tmp))
> > +         return false;
> > +@@ -185,15 +187,16 @@ static bool read_preface(zckCtx *zck) {
> > +     if(zck->has_optional_elems) {
> > +         size_t opt_count =3D 0;
> > +         if(!compint_to_size(zck, &opt_count, header+length, &length,
> > +-                            max_length))
> > ++                            max_length - length))
> > +             return false;
> > +         for(size_t i=3D0; i<opt_count; i++) {
> > +             size_t id =3D 0;
> > +             size_t data_size =3D 0;
> > +-            if(!compint_to_size(zck, &id, header+length, &length, max=
_length))
> > ++            if(!compint_to_size(zck, &id, header+length, &length,
> > ++                                max_length - length))
> > +                 return false;
> > +             if(!compint_to_size(zck, &data_size, header+length, &leng=
th,
> > +-                                max_length))
> > ++                                max_length - length))
> > +                 return false;
> > +             if(data_size > max_length - length) {
> > +                 set_fatal_error(zck, "Optional element exceeds header=
 size");
> > +@@ -206,7 +209,8 @@ static bool read_preface(zckCtx *zck) {
> > +     }
> > +
> > +     /* Read and initialize index size */
> > +-    if(!compint_to_int(zck, &tmp, header+length, &length, max_length)=
)
> > ++    if(!compint_to_int(zck, &tmp, header+length, &length,
> > ++                       max_length - length))
> > +         return false;
> > +     zck->index_size =3D tmp;
> > +
> > +diff --git a/test/meson.build b/test/meson.build
> > +index 66a1820..fc7a35f 100644
> > +--- a/test/meson.build
> > ++++ b/test/meson.build
> > +@@ -52,6 +52,11 @@ exitcodecheck =3D executable('exitcodecheck',
> > +                       include_directories: incdir,
> > +                       dependencies: [zstd_dep, openssl_dep],
> > +                       c_args: preprocessor_defines)
> > ++read_header_bounds =3D executable('read_header_bounds',
> > ++                      ['read_header_bounds.c'] + util_sources,
> > ++                      include_directories: incdir,
> > ++                      dependencies: [zstd_dep, openssl_dep],
> > ++                      c_args: preprocessor_defines)
> > + zck_cmp_uncomp =3D executable(
> > +     'zck_cmp_uncomp',
> > +     ['zck_cmp_uncomp.c'],
> > +@@ -73,6 +78,11 @@ test(
> > +     empty,
> > +     is_parallel: false
> > + )
> > ++test(
> > ++    'rejects truncated preface without over-reading',
> > ++    read_header_bounds,
> > ++    is_parallel: false
> > ++)
> > + test(
> > +     'check version info in zck',
> > +     zck,
> > +diff --git a/test/read_header_bounds.c b/test/read_header_bounds.c
> > +new file mode 100644
> > +index 0000000..2162de6
> > +--- /dev/null
> > ++++ b/test/read_header_bounds.c
> > +@@ -0,0 +1,203 @@
> > ++/*
> > ++ * Copyright 2026 Jonathan Dieter <jonathan@dieter.ie>
> > ++ *
> > ++ * Redistribution and use in source and binary forms, with or without
> > ++ * modification, are permitted provided that the following conditions=
 are met:
> > ++ *
> > ++ *  1. Redistributions of source code must retain the above copyright=
 notice,
> > ++ *     this list of conditions and the following disclaimer.
> > ++ *
> > ++ *  2. Redistributions in binary form must reproduce the above copyri=
ght notice,
> > ++ *     this list of conditions and the following disclaimer in the do=
cumentation
> > ++ *     and/or other materials provided with the distribution.
> > ++ *
> > ++ * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND
> > CONTRIBUTORS "AS IS"
> > ++ * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
> > LIMITED TO, THE
> > ++ * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A
> > PARTICULAR PURPOSE
> > ++ * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR
> > CONTRIBUTORS BE
> > ++ * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
> > EXEMPLARY, OR
> > ++ * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
> > PROCUREMENT OF
> > ++ * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
> > OR BUSINESS
> > ++ * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
> > LIABILITY, WHETHER IN
> > ++ * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
> > OTHERWISE)
> > ++ * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
> > ADVISED OF THE
> > ++ * POSSIBILITY OF SUCH DAMAGE.
> > ++ */
> > ++
> > ++/* Regression test for the read_preface() out-of-bounds read - Only w=
ill
> > ++ * report an issue when run under a sanitizer */
> > ++
> > ++#include <stdlib.h>
> > ++#include <stdio.h>
> > ++#include <string.h>
> > ++#include <stdbool.h>
> > ++#include <unistd.h>
> > ++#include <sys/types.h>
> > ++#include <sys/stat.h>
> > ++#include <fcntl.h>
> > ++#include <zck.h>
> > ++#include "zck_private.h"
> > ++#include "util.h"
> > ++
> > ++#ifndef O_BINARY
> > ++#define O_BINARY 0
> > ++#endif
> > ++
> > ++#define TEST_FILE "read_header_bounds.zck"
> > ++
> > ++/* Exit code that tells meson the test was skipped */
> > ++#define SKIP 77
> > ++
> > ++/* The over-read is only caught by a memory checker, so only run unde=
r
> > ++ * valgrind (which preloads its own libraries) or AddressSanitizer */
> > ++static bool memory_checked(void) {
> > ++#ifdef __SANITIZE_ADDRESS__
> > ++    return true;
> > ++#else
> > ++    const char *preload =3D getenv("LD_PRELOAD");
> > ++    return preload !=3D NULL && strstr(preload, "vgpreload") !=3D NUL=
L;
> > ++#endif
> > ++}
> > ++
> > ++/* Compute the SHA-256 header digest over the given bytes, using libz=
ck's own
> > ++ * hashing so it matches what read_header_from_file() will calculate.=
 */
> > ++static char *header_digest(const char *buf, size_t size) {
> > ++    zckCtx *zck =3D zck_create();
> > ++    if(zck =3D=3D NULL)
> > ++        return NULL;
> > ++
> > ++    zckHashType ht;
> > ++    zckHash hash;
> > ++    memset(&hash, 0, sizeof(hash));  /* hash_init() closes it before =
use */
> > ++    if(!hash_setup(zck, &ht, ZCK_HASH_SHA256) ||
> > ++       !hash_init(zck, &hash, &ht) ||
> > ++       !hash_update(zck, &hash, buf, size)) {
> > ++        zck_free(&zck);
> > ++        return NULL;
> > ++    }
> > ++    char *digest =3D hash_finalize(zck, &hash);
> > ++    zck_free(&zck);
> > ++    return digest;
> > ++}
> > ++
> > ++int main(void) {
> > ++    if(!memory_checked()) {
> > ++        printf("Skipping: needs valgrind or AddressSanitizer\n");
> > ++        return SKIP;
> > ++    }
> > ++
> > ++    char cibuf[MAX_COMP_SIZE];
> > ++    size_t cilen;
> > ++
> > ++    /* SHA-256 digest size, read from libzck rather than hard-coded. =
*/
> > ++    zckHashType ht;
> > ++    if(!hash_setup(NULL, &ht, ZCK_HASH_SHA256)) {
> > ++        printf("ERROR: unable to set up SHA-256\n");
> > ++        exit(1);
> > ++    }
> > ++    size_t digest_size =3D ht.digest_size;
> > ++
> > ++    /* --- Header body (the preface) ---
> > ++     * full data digest (zero bytes) + flags(0) + a truncated compres=
sion-type
> > ++     * compint.  The final byte has its high bit clear, so the reader=
 believes
> > ++     * the integer continues past the end of the header. */
> > ++    char body[64];
> > ++    size_t body_len =3D 0;
> > ++
> > ++    memset(body + body_len, 0, digest_size);         /* data digest *=
/
> > ++    body_len +=3D digest_size;
> > ++
> > ++    cilen =3D 0;
> > ++    compint_from_size(cibuf, 0, &cilen);             /* flags =3D 0 *=
/
> > ++    memcpy(body + body_len, cibuf, cilen);
> > ++    body_len +=3D cilen;
> > ++
> > ++    body[body_len++] =3D 0x00;  /* unterminated compression-type comp=
int */
> > ++
> > ++    /* --- Lead ---
> > ++     * "\0ZCK1" + compint(hash type) + compint(header length).  The h=
eader
> > ++     * digest that follows is computed over the lead prefix plus the =
body,
> > ++     * which is exactly the range read_header_from_file() hashes. */
> > ++    char lead[16];
> > ++    size_t lead_len =3D 0;
> > ++
> > ++    memcpy(lead, "\0ZCK1", 5);
> > ++    lead_len =3D 5;
> > ++
> > ++    cilen =3D 0;
> > ++    compint_from_size(cibuf, ZCK_HASH_SHA256, &cilen);
> > ++    memcpy(lead + lead_len, cibuf, cilen);
> > ++    lead_len +=3D cilen;
> > ++
> > ++    cilen =3D 0;
> > ++    compint_from_size(cibuf, body_len, &cilen);
> > ++    memcpy(lead + lead_len, cibuf, cilen);
> > ++    lead_len +=3D cilen;
> > ++
> > ++    /* digest =3D SHA256(lead prefix + body) */
> > ++    char *to_hash =3D zmalloc(lead_len + body_len);
> > ++    if(to_hash =3D=3D NULL)
> > ++        exit(1);
> > ++    memcpy(to_hash, lead, lead_len);
> > ++    memcpy(to_hash + lead_len, body, body_len);
> > ++    char *digest =3D header_digest(to_hash, lead_len + body_len);
> > ++    free(to_hash);
> > ++    if(digest =3D=3D NULL) {
> > ++        printf("ERROR: unable to compute header digest\n");
> > ++        exit(1);
> > ++    }
> > ++
> > ++    /* Write the file: lead, digest, body */
> > ++    int out =3D open(TEST_FILE, O_WRONLY | O_CREAT | O_TRUNC |
> > O_BINARY, 0666);
> > ++    if(out < 0) {
> > ++        perror("Unable to open " TEST_FILE " for writing");
> > ++        free(digest);
> > ++        exit(1);
> > ++    }
> > ++    if(write(out, lead, lead_len) !=3D (ssize_t)lead_len ||
> > ++       write(out, digest, digest_size) !=3D (ssize_t)digest_size ||
> > ++       write(out, body, body_len) !=3D (ssize_t)body_len) {
> > ++        perror("Short write");
> > ++        close(out);
> > ++        free(digest);
> > ++        exit(1);
> > ++    }
> > ++    close(out);
> > ++    free(digest);
> > ++
> > ++    /* Read it back: the header must be rejected, not over-read */
> > ++    int in =3D open(TEST_FILE, O_RDONLY | O_BINARY);
> > ++    if(in < 0) {
> > ++        perror("Unable to open " TEST_FILE " for reading");
> > ++        exit(1);
> > ++    }
> > ++
> > ++    /* Drive the read stages individually so the test targets the pre=
face */
> > ++    zckCtx *zck =3D zck_create();
> > ++    if(zck =3D=3D NULL) {
> > ++        close(in);
> > ++        exit(1);
> > ++    }
> > ++    if(!zck_init_adv_read(zck, in) || !zck_read_lead(zck)) {
> > ++        printf("ERROR: lead parse failed unexpectedly: %s\n",
> > ++               zck_get_error(zck));
> > ++        zck_free(&zck);
> > ++        close(in);
> > ++        unlink(TEST_FILE);
> > ++        exit(1);
> > ++    }
> > ++
> > ++    int rc =3D 0;
> > ++    if(zck_read_header(zck)) {
> > ++        printf("ERROR: zck_read_header accepted a truncated preface\n=
");
> > ++        rc =3D 1;
> > ++    } else {
> > ++        printf("zck_read_header correctly rejected truncated preface:=
 %s\n",
> > ++               zck_get_error(zck));
> > ++    }
> > ++
> > ++    zck_free(&zck);
> > ++    close(in);
> > ++    unlink(TEST_FILE);
> > ++    return rc;
> > ++}
> > diff --git a/meta-oe/recipes-support/zchunk/zchunk_1.4.0.bb b/meta-oe/r=
ecipes-
> > support/zchunk/zchunk_1.4.0.bb
> > index 0c8a9c7a5f0..04476782d33 100644
> > --- a/meta-oe/recipes-support/zchunk/zchunk_1.4.0.bb
> > +++ b/meta-oe/recipes-support/zchunk/zchunk_1.4.0.bb
> > @@ -3,7 +3,11 @@ DESCRIPTION =3D "A file format designed for highly eff=
icient
> > deltas while maintain
> >  LICENSE =3D "BSD-2-Clause"
> >  LIC_FILES_CHKSUM =3D
> > "file://LICENSE;md5=3Ddaf6e68539f564601a5a5869c31e5242"
> >
> > -SRC_URI =3D "git://github.com/zchunk/zchunk.git;protocol=3Dhttps;branc=
h=3Dmain"
> > +SRC_URI =3D " \
> > +    git://github.com/zchunk/zchunk.git;protocol=3Dhttps;branch=3Dmain =
\
> > +    file://CVE-2026-117556-01.patch \
> > +    file://CVE-2026-117556-02.patch \
> > +"
> >
> >  SRCREV =3D "4dd91d31157ede4a1b092721d944ae2fdd161cd9"
> >  S =3D "${WORKDIR}/git"
