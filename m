Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65686F513F8
	for <webhook@archiver.kernel.org>; Fri,  6 Mar 2026 05:32:36 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.63295.1772775154691342875
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Mar 2026 21:32:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=bysgXLO5;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=XYLlJ6LS;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62654Phb4193475
	for <openembedded-devel@lists.openembedded.org>; Fri, 6 Mar 2026 05:32:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3N/++SAlBCb3qQZTCleuT192h+Od5xpk2DQZEa0mCSQ=; b=bysgXLO5n8tCIoV/
	NLha2f5KZP1n8xvgyYTg74GQj7B6ElyYMdzEIBNIbqNFfJ9RI3ENj1HsZfB9phg4
	7yzsqDs1ztiyJavmGR6Ko/b6I4990BToHbCHVRywfXudUXat55QK1ga5Dc1Jqzr2
	Rr6/+nlVxwEXHW1n8Q951PIA4TZ4Pu2K6YIAc06pqId0BgnaU8a+1UPnJ2SOE0u8
	8TFyjgZmGM8U5wLzj+5a5IEZIYMegy0tB2NCATQ4YLK6V98eFbL3TPogCBKKDhp5
	W6v23Ve757vvvfapjBX5dHPpS0xzdS8DnFDN5QqtUiaOaqPIqIUyMn5r20nKEEyT
	pY5/Fg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqrf5r34m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 06 Mar 2026 05:32:33 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-506a81bbb50so116005071cf.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 05 Mar 2026 21:32:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772775152; cv=none;
        d=google.com; s=arc-20240605;
        b=It1EU/df6zIbnGBvybd4L6W7RQ9oGHHgT0UnRCSbY3sKJbMKdl4ErVX5E2CY9Ihx6j
         RwApur9aQEVoaeFFftxBY6IX9uZU8Qk37uytvvUrOQCwbOzw6a64NX6D4uEjYNQ58X4Z
         kVdU76RhOzmwAOF5vRCt/Jk9LAk70AlFYK966zTpQVZ/yY0B3bLVBTbCvuPShmua6eFe
         cVHWBz6WIlqIJb7iVJhnJcecMxewKfBWSkxBZ3Ax8mlWM7fC3LLIwapDjQkhb28sR5Cb
         WWv/+nWs7QnGRINcyf/eRhXWP9e7e8+uQQBPpE8G4NH/gDIxcYTsushlUxye5+2imVd9
         +dCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3N/++SAlBCb3qQZTCleuT192h+Od5xpk2DQZEa0mCSQ=;
        fh=n0ZnAkKOhGDmrf8RLpwnC7FQ6xmEY5rofL6wXnjsXjs=;
        b=XeTzGpIdPzagFk4FDzN7cNZdD/4nK6S6tzB9l/lMKdts5o9vnz9g3UHSuOLoKdQxOd
         jnXnlBTo8RekjwZrLiIADeNajXiXLMNCtq1tMoh1An8oqV0GTqKrPUQQ15MG2HS/eK0Z
         pM4+0WBfZNfyDojGmC/aoNBtldKnUoRy2/zjxZ/1Y1zCadC6bXLOkGw8GFKX4ARo0Yq1
         r3lDN1ts++w+lO9z38G0Ei17ACkTz+qgqW9fMPVr4NQpx+9JR1JCZZQQdkSDaDgHPW2Z
         evWBYBNGSNtCmWhOWeoIRXUPzESMxQE1UitAok7BEFacovEA5LfOf1IMOitN6/j/xTIj
         Vxgg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772775152; x=1773379952; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3N/++SAlBCb3qQZTCleuT192h+Od5xpk2DQZEa0mCSQ=;
        b=XYLlJ6LSSzAV1csMdeNJzeny+9XIKt6+oFBEWImAJdYtkm3g+64yqY6+QsDvFK6mZm
         O+pCkLXwGJXJh00HIP8PYs2Nn15ohR/FPr/aP5gPxWtEs5t05pHZJ6Jy1LK9RiaV7R+q
         MkIIC2wEoPVXuebmu49T5fSEcE6jqC3zU7YcXk7IbL6u9cN5PR4epa5Jl3Cwy85nGRuG
         aHzp3mEh2l8XNDae0BbNbusXEeuVPgWWLFYx5HexoqzXx6OAzQGH7NgzwaxA7ul6lEVZ
         hL+yFhNTZRfzoM2MAl6OT+4yKEL0Z5kXxjaoE++YoLVlEyQN1g5826IWJfSssMkRaXGJ
         FC+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772775152; x=1773379952;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3N/++SAlBCb3qQZTCleuT192h+Od5xpk2DQZEa0mCSQ=;
        b=EA4O/AMyYFPA4kiHfiOoNBVgMrbzG3jCvnThMGTnjKmMTVSCdSEJQ5VOXunIEZxSvL
         Q9qt7o7UqsKI7hlCXUrMZwWsDBy0ygNqw9Y3W97a+2Mpo0Yjn4b6hgSP8DerdBxGXcVE
         QKweqLynWIlUB8qEpAAATHNhsm+/nnyOGqus14K0jtsRjbJdSrcVGTcDzRwC/3f22bo5
         0R5VwXZAir6Ih9teMgqtUvTJSQl1uqapc9cC3YtDNlY6BbpoxcTjyjuQoCIWHte9AnKJ
         ZgwSn9cilXhz5Gax39VQiyPHvrdrYHijvXoBl3WA1lmgE5AG74svAFgJl6luM5gWGmYn
         0ysA==
X-Gm-Message-State: AOJu0YzDL6VP5gBk4Y0NPUrp8ADKHQu8tDow7d0bpZmywRFIxCuQLLc3
	k39wWH8ipZ/0QIMRqWWI8VHwB5dvoyYgzoWs/EX818vle+kRpYdd6U6yp6NUMA3udivvwpl8pSq
	I7Q0NO6Hg00s0meSwjCtCMiWFBRiFk5NeVIU9szD+PQ7FN7lxnYCnkPx8zgtdULNLEg6bcbL92E
	XHlJz9kpNfqK34gXxVMZjqjCYSm6UYkAiqQg5qHU29MeD+Drpxp3dAdI2I7ls=
X-Gm-Gg: ATEYQzygfCQ/POoFQQHy+sfPKeTbewwKdprpUb3KCOcvu/TfsgBOlmigI8fLoIhD9lT
	+eagGNvZR28i8iHwo/2W1mLcFntG7xgU53A2srki0MsOXs6/O/Ol21fNmCOIb3G5voXCVwF+6sv
	GHcLE5wDLIPnosvCtJ1h4ezN+qGueXWKZTkLsiomxfQ3Hxx5T+B0vW0yDxrJKGzA8rztxuTjAHc
	hCz
X-Received: by 2002:ac8:5795:0:b0:501:4b67:1210 with SMTP id d75a77b69052e-508f4974874mr11484921cf.56.1772775152399;
        Thu, 05 Mar 2026 21:32:32 -0800 (PST)
X-Received: by 2002:ac8:5795:0:b0:501:4b67:1210 with SMTP id
 d75a77b69052e-508f4974874mr11484821cf.56.1772775151752; Thu, 05 Mar 2026
 21:32:31 -0800 (PST)
MIME-Version: 1.0
References: <20260224185412.1835468-2-ankur.tyagi85@gmail.com>
In-Reply-To: <20260224185412.1835468-2-ankur.tyagi85@gmail.com>
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Date: Fri, 6 Mar 2026 13:32:20 +0800
X-Gm-Features: AaiRm523OLVMFD8V6-BazY_me-lX-9YhL9DgDyvXY1cza2yX6mmQJHCgLvwx5Zk
Message-ID: <CA+s=J=ypghOCPnCkntAeafipwAp814QkYny7DNct2qKwMRNz4Q@mail.gmail.com>
Subject: Re: [oe][meta-networking][whinlatter][PATCH 1/3] wolfssl: patch CVE-2025-13912
To: ankur.tyagi85@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: rKHxbfGbzfpUccgiiNT581b8USCpuxCY
X-Proofpoint-GUID: rKHxbfGbzfpUccgiiNT581b8USCpuxCY
X-Authority-Analysis: v=2.4 cv=L+oQguT8 c=1 sm=1 tr=0 ts=69aa66f1 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=NEAV23lmAAAA:8 a=PYnjg3YJAAAA:8 a=Q4-j1AaZAAAA:8
 a=pGLkceISAAAA:8 a=VTTltBjBAAAA:8 a=EUspDBNiAAAA:8 a=3ffmNBvFq6SQ1JR6rgMA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=on_vo79ac8RWgsiwd8Ea:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDA1MSBTYWx0ZWRfX/Wk48GC1QbA2
 atCQqHL+lEzk6+pau9eg4JhAckOHeVRPrxZEBogZefT7qrMs27ZQnsmnnjo7WwNGWab3A7fokND
 /Y7IlAuk430jhG+1bwy0uTEddwZ4YhMptHbOa/Lek2zUgwvoXXzgSirwlzqOItqr7C8G8z17YWo
 ogBOhWfNY6ggwDwHbjAYe8sIrGYDhd7cZmQeFKQs+waZkQD5d4goE2QozIt1zN/L3qynyz9/yR4
 kuHJHwy8leqr91af/imKaWrZgR5WdxyiNlC6kEi9bSXwxGcWcRGFhei2UrD6ZnJpDMKoTkOgR/w
 b0eTW2XRbLDondHYoHugGnWBRrlPHenj+Z/YVU0E9bEofsSaQCDeI252yAogmu41wAYM/l708FY
 7lKL9TSXZ+NZjWuszZ9JJZjQxbtEEetDGi/WrsnKfs/CMO5R7EZcafT+ozvXV++Il5lVRN+TTPL
 e+s8/ISW4xsAoboMoAQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_01,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 phishscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060051
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 06 Mar 2026 05:32:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124898

On Wed, Feb 25, 2026 at 2:54=E2=80=AFAM Ankur Tyagi via lists.openembedded.=
org
<ankur.tyagi85=3Dgmail.com@lists.openembedded.org> wrote:
>
> From: Ankur Tyagi <ankur.tyagi85@gmail.com>
>
> Backport changes from PR[1] mentioned in nvd[2]
>
> [1] https://github.com/wolfSSL/wolfssl/pull/9148
> [2] https://nvd.nist.gov/vuln/detail/CVE-2025-13912
>
> Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> ---
>  .../wolfssl/files/CVE-2025-13912.patch        | 439 ++++++++++++++++++
>  .../wolfssl/wolfssl_5.8.0.bb                  |   1 +
>  2 files changed, 440 insertions(+)
>  create mode 100644 meta-networking/recipes-connectivity/wolfssl/files/CV=
E-2025-13912.patch
>
> diff --git a/meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-=
13912.patch b/meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-1=
3912.patch
> new file mode 100644
> index 0000000000..32252058f7
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-13912.p=
atch
> @@ -0,0 +1,439 @@
> +From 797e0e7abf5830d515ca838201c03a47f83356b0 Mon Sep 17 00:00:00 2001
> +From: Daniel Pouzzner <douzzer@wolfssl.com>
> +Date: Tue, 30 Sep 2025 20:35:52 -0500
> +Subject: [PATCH] Merge pull request #9148 from SparkiDev/ct_volatile
> +
> +Mark variables as volatile
> +
> +CVE: CVE-2025-13912
> +Upstream-Status: Backport [https://github.com/wolfSSL/wolfssl/commit/234=
ba7780ad3b7c8c1509973accdc43ed6c328b3]
> +Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> +---
> + src/internal.c         | 25 ++++++++++++---------
> + src/tls.c              |  8 +++++--
> + wolfcrypt/src/aes.c    |  4 ++--
> + wolfcrypt/src/ecc.c    |  8 +++----
> + wolfcrypt/src/misc.c   |  4 ++--
> + wolfcrypt/src/rsa.c    | 18 +++++++++------
> + wolfcrypt/src/sp_int.c | 51 ++++++++++++++++++++++--------------------

This seems to be missing a few more volatile related changes when
compared to the patch mentioned above. Did you skip those on purpose?

> + 7 files changed, 67 insertions(+), 51 deletions(-)
> +
> +diff --git a/src/internal.c b/src/internal.c
> +index eb2f16d63..6b3a227bc 100644
> +--- a/src/internal.c
> ++++ b/src/internal.c
> +@@ -20887,7 +20887,7 @@ static byte MaskPadding(const byte* data, int sz=
, int macSz)
> +         checkSz =3D TLS_MAX_PAD_SZ;
> +
> +     for (i =3D 0; i < checkSz; i++) {
> +-        byte mask =3D ctMaskLTE(i, paddingSz);
> ++        volatile byte mask =3D ctMaskLTE(i, paddingSz);
> +         good |=3D mask & (data[sz - 1 - i] ^ paddingSz);
> +     }
> +
> +@@ -20907,16 +20907,21 @@ static byte MaskPadding(const byte* data, int =
sz, int macSz)
> + static byte MaskMac(const byte* data, int sz, int macSz, byte* expMac)
> + {
> +     int i, j;
> +-    unsigned char mac[WC_MAX_DIGEST_SIZE];
> +-    int scanStart =3D sz - 1 - TLS_MAX_PAD_SZ - macSz;
> +-    int macEnd =3D sz - 1 - data[sz - 1];
> +-    int macStart =3D macEnd - macSz;
> +     int r =3D 0;
> +-    unsigned char started, notEnded;
> ++    unsigned char mac[WC_MAX_DIGEST_SIZE];
> ++    volatile int scanStart =3D sz - 1 - TLS_MAX_PAD_SZ - macSz;
> ++    volatile int macEnd =3D sz - 1 - data[sz - 1];
> ++    volatile int macStart =3D macEnd - macSz;
> ++    volatile int maskScanStart;
> ++    volatile int maskMacStart;
> ++    volatile unsigned char started;
> ++    volatile unsigned char notEnded;
> +     unsigned char good =3D 0;
> +
> +-    scanStart &=3D ctMaskIntGTE(scanStart, 0);
> +-    macStart &=3D ctMaskIntGTE(macStart, 0);
> ++    maskScanStart =3D ctMaskIntGTE(scanStart, 0);
> ++    maskMacStart =3D ctMaskIntGTE(macStart, 0);
> ++    scanStart &=3D maskScanStart;
> ++    macStart &=3D maskMacStart;
> +
> +     /* Div on Intel has different speeds depending on value.
> +      * Use a bitwise AND or mod a specific value (converted to mul). */
> +@@ -41636,7 +41641,7 @@ static int DefTicketEncCb(WOLFSSL* ssl, byte key=
_name[WOLFSSL_TICKET_NAME_SZ],
> +                     case rsa_kea:
> +                     {
> +                         RsaKey* key =3D (RsaKey*)ssl->hsKey;
> +-                        int lenErrMask;
> ++                        volatile int lenErrMask;
> +
> +                         ret =3D RsaDec(ssl,
> +                             input + args->idx,
> +@@ -41850,7 +41855,7 @@ static int DefTicketEncCb(WOLFSSL* ssl, byte key=
_name[WOLFSSL_TICKET_NAME_SZ],
> +                     case rsa_kea:
> +                     {
> +                         byte *tmpRsa;
> +-                        byte mask;
> ++                        volatile byte mask;
> +
> +                         /* Add the signature length to idx */
> +                         args->idx +=3D args->length;
> +diff --git a/src/tls.c b/src/tls.c
> +index 6ad21c924..4f57ea938 100644
> +--- a/src/tls.c
> ++++ b/src/tls.c
> +@@ -944,7 +944,10 @@ static int Hmac_UpdateFinal_CT(Hmac* hmac, byte* di=
gest, const byte* in,
> +     unsigned int k;
> +     int          blockBits, blockMask;
> +     int          lastBlockLen, extraLen, eocIndex;
> +-    int          blocks, safeBlocks, lenBlock, eocBlock;
> ++    int          blocks;
> ++    int          safeBlocks;
> ++    int          lenBlock;
> ++    int          eocBlock;
> +     word32       maxLen;
> +     int          blockSz, padSz;
> +     int          ret;
> +@@ -1054,7 +1057,8 @@ static int Hmac_UpdateFinal_CT(Hmac* hmac, byte* d=
igest, const byte* in,
> +
> +         for (j =3D 0; j < blockSz; j++) {
> +             unsigned char atEoc =3D ctMaskEq(j, eocIndex) & isEocBlock;
> +-            unsigned char pastEoc =3D ctMaskGT(j, eocIndex) & isEocBloc=
k;
> ++            volatile unsigned char maskPastEoc =3D ctMaskGT(j, eocIndex=
);
> ++            volatile unsigned char pastEoc =3D maskPastEoc & isEocBlock=
;
> +             unsigned char b =3D 0;
> +
> +             if (k < headerSz)
> +diff --git a/wolfcrypt/src/aes.c b/wolfcrypt/src/aes.c
> +index 6e7f104dd..2cf7c695e 100644
> +--- a/wolfcrypt/src/aes.c
> ++++ b/wolfcrypt/src/aes.c
> +@@ -6577,7 +6577,7 @@ static WC_INLINE void RIGHTSHIFTX(byte* x)
> + {
> +     int i;
> +     int carryIn =3D 0;
> +-    byte borrow =3D (byte)((0x00U - (x[15] & 0x01U)) & 0xE1U);
> ++    volatile byte borrow =3D (byte)((0x00U - (x[15] & 0x01U)) & 0xE1U);
> +
> +     for (i =3D 0; i < WC_AES_BLOCK_SIZE; i++) {
> +         int carryOut =3D (x[i] & 0x01) << 7;
> +@@ -9113,7 +9113,7 @@ int WARN_UNUSED_RESULT AES_GCM_decrypt_C(
> +     ALIGN16 byte scratch[WC_AES_BLOCK_SIZE];
> +     ALIGN16 byte Tprime[WC_AES_BLOCK_SIZE];
> +     ALIGN16 byte EKY0[WC_AES_BLOCK_SIZE];
> +-    sword32 res;
> ++    volatile sword32 res;
> +
> +     if (ivSz =3D=3D GCM_NONCE_MID_SZ) {
> +         /* Counter is IV with bottom 4 bytes set to: 0x00,0x00,0x00,0x0=
1. */
> +diff --git a/wolfcrypt/src/ecc.c b/wolfcrypt/src/ecc.c
> +index 6d4cd4de7..1fd30cfd9 100644
> +--- a/wolfcrypt/src/ecc.c
> ++++ b/wolfcrypt/src/ecc.c
> +@@ -3166,7 +3166,7 @@ static int ecc_mulmod(const mp_int* k, ecc_point* =
P, ecc_point* Q,
> +     ecc_point** R, mp_int* a, mp_int* modulus, mp_digit mp, WC_RNG* rng=
)
> + {
> +     int      err =3D MP_OKAY;
> +-    int      bytes =3D (mp_count_bits(modulus) + 7) / 8;
> ++    int      bytes =3D (mp_count_bits(modulus) + 7) >> 3;
> +     int      i;
> +     int      j =3D 1;
> +     int      cnt =3D DIGIT_BIT;
> +@@ -3406,7 +3406,7 @@ static int ecc_mulmod(const mp_int* k, ecc_point* =
P, ecc_point* Q,
> +     ecc_point** R, mp_int* a, mp_int* modulus, mp_digit mp, WC_RNG* rng=
)
> + {
> +     int          err =3D MP_OKAY;
> +-    int          bytes =3D (mp_count_bits(modulus) + 7) / 8;
> ++    int          bytes =3D (mp_count_bits(modulus) + 7) >> 3;
> +     int          i;
> +     int          j =3D 1;
> +     int          cnt;
> +@@ -4450,7 +4450,7 @@ int wc_ecc_get_curve_id_from_params(int fieldSize,
> +         Gx =3D=3D NULL || Gy =3D=3D NULL)
> +         return BAD_FUNC_ARG;
> +
> +-    curveSz =3D (fieldSize + 1) / 8;    /* round up */
> ++    curveSz =3D (fieldSize + 1) >> 3;    /* round up */
> +
> +     for (idx =3D 0; ecc_sets[idx].size !=3D 0; idx++) {
> +         if (curveSz =3D=3D ecc_sets[idx].size) {
> +@@ -11922,7 +11922,7 @@ int wc_ecc_sig_size(const ecc_key* key)
> +     keySz =3D key->dp->size;
> +     orderBits =3D wc_ecc_get_curve_order_bit_count(key->dp);
> +     if (orderBits > keySz * 8) {
> +-        keySz =3D (orderBits + 7) / 8;
> ++        keySz =3D (orderBits + 7) >> 3;
> +     }
> +     /* maximum possible signature header size is 7 bytes */
> +     maxSigSz =3D (keySz * 2) + SIG_HEADER_SZ;
> +diff --git a/wolfcrypt/src/misc.c b/wolfcrypt/src/misc.c
> +index 98b83c7ae..496b0dbcc 100644
> +--- a/wolfcrypt/src/misc.c
> ++++ b/wolfcrypt/src/misc.c
> +@@ -762,7 +762,7 @@ WC_MISC_STATIC WC_INLINE void ctMaskCopy(byte mask, =
byte* dst, byte* src,
> +     WC_MISC_STATIC WC_INLINE word32 min(word32 a, word32 b)
> +     {
> + #if !defined(WOLFSSL_NO_CT_OPS) && defined(WORD64_AVAILABLE)
> +-        word32 gte_mask =3D (word32)ctMaskWord32GTE(a, b);
> ++        volatile word32 gte_mask =3D (word32)ctMaskWord32GTE(a, b);
> +         return (a & ~gte_mask) | (b & gte_mask);
> + #else /* WOLFSSL_NO_CT_OPS */
> +         return a > b ? b : a;
> +@@ -778,7 +778,7 @@ WC_MISC_STATIC WC_INLINE void ctMaskCopy(byte mask, =
byte* dst, byte* src,
> +     WC_MISC_STATIC WC_INLINE word32 max(word32 a, word32 b)
> +     {
> + #if !defined(WOLFSSL_NO_CT_OPS) && defined(WORD64_AVAILABLE)
> +-        word32 gte_mask =3D (word32)ctMaskWord32GTE(a, b);
> ++        volatile word32 gte_mask =3D (word32)ctMaskWord32GTE(a, b);
> +         return (a & gte_mask) | (b & ~gte_mask);
> + #else /* WOLFSSL_NO_CT_OPS */
> +         return a > b ? a : b;
> +diff --git a/wolfcrypt/src/rsa.c b/wolfcrypt/src/rsa.c
> +index 94d57bd8b..acd0c04c5 100644
> +--- a/wolfcrypt/src/rsa.c
> ++++ b/wolfcrypt/src/rsa.c
> +@@ -1561,11 +1561,11 @@ static int RsaUnPad_OAEP(byte *pkcsBlock, unsign=
ed int pkcsBlockLen,
> +                             byte* optLabel, word32 labelLen, void* heap=
)
> + {
> +     word32 hLen;
> +-    int ret;
> ++    volatile int ret;
> +     byte h[WC_MAX_DIGEST_SIZE]; /* max digest size */
> +     word32 idx;
> +     word32 i;
> +-    word32 inc;
> ++    volatile word32 inc;
> +
> + #if defined(WOLFSSL_SMALL_STACK) && !defined(WOLFSSL_NO_MALLOC)
> +     byte* tmp  =3D NULL;
> +@@ -1850,9 +1850,11 @@ static int RsaUnPad(const byte *pkcsBlock, unsign=
ed int pkcsBlockLen,
> +     }
> + #ifndef WOLFSSL_RSA_VERIFY_ONLY
> +     else {
> +-        unsigned int j;
> +-        word16 pastSep =3D 0;
> +-        byte   invalid =3D 0;
> ++        unsigned int    j;
> ++        volatile word16 pastSep =3D 0;
> ++        volatile byte   invalid =3D 0;
> ++        volatile byte   minPad;
> ++        volatile int    invalidMask;
> +
> +         i =3D 0;
> +         /* Decrypted with private key - unpad must be constant time. */
> +@@ -1864,7 +1866,8 @@ static int RsaUnPad(const byte *pkcsBlock, unsigne=
d int pkcsBlockLen,
> +         }
> +
> +         /* Minimum of 11 bytes of pre-message data - including leading =
0x00. */
> +-        invalid |=3D ctMaskLT(i, RSA_MIN_PAD_SZ);
> ++        minPad =3D ctMaskLT(i, RSA_MIN_PAD_SZ);
> ++        invalid |=3D minPad;
> +         /* Must have seen separator. */
> +         invalid |=3D (byte)~pastSep;
> +         /* First byte must be 0x00. */
> +@@ -1873,7 +1876,8 @@ static int RsaUnPad(const byte *pkcsBlock, unsigne=
d int pkcsBlockLen,
> +         invalid |=3D ctMaskNotEq(pkcsBlock[1], padValue);
> +
> +         *output =3D (byte *)(pkcsBlock + i);
> +-        ret =3D ((int)-1 + (int)(invalid >> 7)) & ((int)pkcsBlockLen - =
i);
> ++        invalidMask =3D (int)-1 + (int)(invalid >> 7);
> ++        ret =3D invalidMask & ((int)pkcsBlockLen - i);
> +     }
> + #endif
> +
> +diff --git a/wolfcrypt/src/sp_int.c b/wolfcrypt/src/sp_int.c
> +index 1769840e7..0ee8aa252 100644
> +--- a/wolfcrypt/src/sp_int.c
> ++++ b/wolfcrypt/src/sp_int.c
> +@@ -5502,7 +5502,7 @@ int sp_exch(sp_int* a, sp_int* b)
> + int sp_cond_swap_ct_ex(sp_int* a, sp_int* b, int cnt, int swap, sp_int*=
 t)
> + {
> +     unsigned int i;
> +-    sp_int_digit mask =3D (sp_int_digit)0 - (sp_int_digit)swap;
> ++    volatile sp_int_digit mask =3D (sp_int_digit)0 - (sp_int_digit)swap=
;
> +
> +     /* XOR other fields in sp_int into temp - mask set when swapping. *=
/
> +     t->used =3D (a->used ^ b->used) & (sp_size_t)mask;
> +@@ -5772,7 +5772,7 @@ static int _sp_cmp_ct(const sp_int* a, const sp_in=
t* b, unsigned int n)
> + {
> +     int ret =3D MP_EQ;
> +     int i;
> +-    int mask =3D -1;
> ++    volatile int mask =3D -1;
> +
> +     for (i =3D n - 1; i >=3D 0; i--) {
> +         sp_int_digit ad =3D a->dp[i] & ((sp_int_digit)0 - (i < (int)a->=
used));
> +@@ -7305,7 +7305,8 @@ static void _sp_div_2(const sp_int* a, sp_int* r)
> +
> +     /* Shift down each word by 1 and include bottom bit of next at top.=
 */
> +     for (i =3D 0; i < (int)a->used - 1; i++) {
> +-        r->dp[i] =3D (a->dp[i] >> 1) | (a->dp[i+1] << (SP_WORD_SIZE - 1=
));
> ++        r->dp[i]  =3D a->dp[i] >> 1;
> ++        r->dp[i] |=3D a->dp[i+1] << (SP_WORD_SIZE - 1);
> +     }
> +     /* Last word only needs to be shifted down. */
> +     r->dp[i] =3D a->dp[i] >> 1;
> +@@ -7385,7 +7386,7 @@ int sp_div_2_mod_ct(const sp_int* a, const sp_int*=
 m, sp_int* r)
> +         sp_int_digit t;
> +     #endif
> +         /* Mask to apply to modulus. */
> +-        sp_int_digit mask =3D (sp_int_digit)0 - (a->dp[0] & 1);
> ++        volatile sp_int_digit mask =3D (sp_int_digit)0 - (a->dp[0] & 1)=
;
> +         sp_size_t i;
> +
> +     #if 0
> +@@ -7396,7 +7397,7 @@ int sp_div_2_mod_ct(const sp_int* a, const sp_int*=
 m, sp_int* r)
> +         /* Add a to m, if a is odd, into r in constant time. */
> +         for (i =3D 0; i < m->used; i++) {
> +             /* Mask to apply to a - set when used value at index. */
> +-            sp_int_digit mask_a =3D (sp_int_digit)0 - (i < a->used);
> ++            volatile sp_int_digit mask_a =3D (sp_int_digit)0 - (i < a->=
used);
> +
> +         #ifndef SQR_MUL_ASM
> +             /* Conditionally add modulus. */
> +@@ -8017,7 +8018,7 @@ static void sp_clamp_ct(sp_int* a)
> + {
> +     int i;
> +     sp_size_t used =3D a->used;
> +-    sp_size_t mask =3D (sp_size_t)-1;
> ++    volatile sp_size_t mask =3D (sp_size_t)-1;
> +
> +     for (i =3D (int)a->used - 1; i >=3D 0; i--) {
> + #if ((SP_WORD_SIZE =3D=3D 64) && \
> +@@ -8066,9 +8067,9 @@ int sp_addmod_ct(const sp_int* a, const sp_int* b,=
 const sp_int* m, sp_int* r)
> +     sp_int_digit sh;
> +     sp_int_digit t;
> + #endif
> +-    sp_int_digit mask;
> +-    sp_int_digit mask_a =3D (sp_int_digit)-1;
> +-    sp_int_digit mask_b =3D (sp_int_digit)-1;
> ++    volatile sp_int_digit mask;
> ++    volatile sp_int_digit mask_a =3D (sp_int_digit)-1;
> ++    volatile sp_int_digit mask_b =3D (sp_int_digit)-1;
> +     sp_size_t i;
> +
> +     /* Check result is as big as modulus. */
> +@@ -8230,9 +8231,9 @@ static void _sp_submod_ct(const sp_int* a, const s=
p_int* b, const sp_int* m,
> +     sp_int_digit h;
> +     sp_int_digit t;
> + #endif
> +-    sp_int_digit mask;
> +-    sp_int_digit mask_a =3D (sp_int_digit)-1;
> +-    sp_int_digit mask_b =3D (sp_int_digit)-1;
> ++    volatile sp_int_digit mask;
> ++    volatile sp_int_digit mask_a =3D (sp_int_digit)-1;
> ++    volatile sp_int_digit mask_b =3D (sp_int_digit)-1;
> +     unsigned int i;
> +
> +     /* In constant time, subtract b from a putting result in r. */
> +@@ -17458,7 +17459,7 @@ static int _sp_mont_red(sp_int* a, const sp_int*=
 m, sp_int_digit mp, int ct)
> +         /* 1. mask =3D (1 << (NumBits(m) % WORD_SIZE)) - 1
> +          *    Mask when last digit of modulus doesn't have highest bit =
set.
> +          */
> +-        sp_int_digit mask =3D (sp_int_digit)
> ++        volatile sp_int_digit mask =3D (sp_int_digit)
> +             (((sp_int_digit)1 << (bits & (SP_WORD_SIZE - 1))) - 1);
> +         /* Overflow. */
> +         sp_int_word o =3D 0;
> +@@ -17539,7 +17540,7 @@ static int _sp_mont_red(sp_int* a, const sp_int*=
 m, sp_int_digit mp, int ct)
> +     int bits;
> +     sp_int_digit mu;
> +     sp_int_digit o;
> +-    sp_int_digit mask;
> ++    volatile sp_int_digit mask;
> +
> + #if 0
> +     sp_print(a, "a");
> +@@ -18041,7 +18042,7 @@ int sp_unsigned_bin_size(const sp_int* a)
> +     int cnt =3D 0;
> +
> +     if (a !=3D NULL) {
> +-        cnt =3D (sp_count_bits(a) + 7) / 8;
> ++        cnt =3D (sp_count_bits(a) + 7) >> 3;
> +     }
> +
> +     return cnt;
> +@@ -18265,20 +18266,22 @@ int sp_to_unsigned_bin_len_ct(const sp_int* a,=
 byte* out, int outSz)
> +         /* Start at the end of the buffer - least significant byte. */
> +         int j;
> +         unsigned int i;
> +-        sp_int_digit mask =3D (sp_int_digit)-1;
> ++        volatile sp_int_digit mask =3D (sp_int_digit)-1;
> +         sp_int_digit d;
> +
> +         /* Put each digit in. */
> +         i =3D 0;
> +         for (j =3D outSz - 1; j >=3D 0; ) {
> +             unsigned int b;
> ++            volatile unsigned int notFull =3D (i < (unsigned int)a->use=
d - 1);
> ++
> +             d =3D a->dp[i];
> +             /* Place each byte of a digit into the buffer. */
> +             for (b =3D 0; (j >=3D 0) && (b < SP_WORD_SIZEOF); b++) {
> +                 out[j--] =3D (byte)(d & mask);
> +                 d >>=3D 8;
> +             }
> +-            mask &=3D (sp_int_digit)0 - (i < (unsigned int)a->used - 1)=
;
> ++            mask &=3D (sp_int_digit)0 - notFull;
> +             i +=3D (unsigned int)(1 & mask);
> +         }
> +     }
> +@@ -18289,7 +18292,7 @@ int sp_to_unsigned_bin_len_ct(const sp_int* a, b=
yte* out, int outSz)
> +     if (err =3D=3D MP_OKAY) {
> +         unsigned int i;
> +         int j;
> +-        sp_int_digit mask =3D (sp_int_digit)-1;
> ++        volatile sp_int_digit mask =3D (sp_int_digit)-1;
> +
> +         i =3D 0;
> +         for (j =3D outSz - 1; j >=3D 0; j--) {
> +@@ -18360,11 +18363,12 @@ static int _sp_read_radix_16(sp_int* a, const =
char* in)
> +     /* Step through string a character at a time starting at end - leas=
t
> +      * significant byte. */
> +     for (i =3D (int)(XSTRLEN(in) - 1); i >=3D 0; i--) {
> ++        volatile char c =3D in[i];
> +         /* Convert character from hex. */
> +-        int ch =3D (int)HexCharToByte(in[i]);
> ++        int ch =3D (int)HexCharToByte(c);
> +         /* Check for invalid character. */
> +         if (ch < 0) {
> +-            if (!eol_done && CharIsWhiteSpace(in[i]))
> ++            if (!eol_done && CharIsWhiteSpace(c))
> +                 continue;
> +             err =3D MP_VAL;
> +             break;
> +@@ -18424,7 +18428,6 @@ static int _sp_read_radix_10(sp_int* a, const ch=
ar* in)
> + {
> +     int  err =3D MP_OKAY;
> +     int  i;
> +-    char ch;
> +
> +     /* Start with a being zero. */
> +     _sp_zero(a);
> +@@ -18432,7 +18435,7 @@ static int _sp_read_radix_10(sp_int* a, const ch=
ar* in)
> +     /* Process all characters. */
> +     for (i =3D 0; in[i] !=3D '\0'; i++) {
> +         /* Get character. */
> +-        ch =3D in[i];
> ++        volatile char ch =3D in[i];
> +         /* Check character is valid. */
> +         if ((ch >=3D '0') && (ch <=3D '9')) {
> +             /* Assume '0'..'9' are continuous values as characters. */
> +@@ -18794,7 +18797,7 @@ int sp_radix_size(const sp_int* a, int radix, in=
t* size)
> +         }
> +         else {
> +             /* Count of nibbles. */
> +-            int cnt =3D (sp_count_bits(a) + 3) / 4;
> ++            int cnt =3D (sp_count_bits(a) + 3) >> 2;
> +         #ifndef WC_DISABLE_RADIX_ZERO_PAD
> +             /* Must have even number of nibbles to have complete bytes.=
 */
> +             if (cnt & 1) {
> +@@ -19404,7 +19407,7 @@ static int _sp_prime_random_trials(const sp_int*=
 a, int trials, int* result,
> + {
> +     int err =3D MP_OKAY;
> +     int bits =3D sp_count_bits(a);
> +-    word32 baseSz =3D ((word32)bits + 7) / 8;
> ++    word32 baseSz =3D ((word32)bits + 7) >> 3;
> +     DECL_SP_INT_ARRAY(ds, a->used + 1, 2);
> +     DECL_SP_INT_ARRAY(d, a->used * 2 + 1, 2);
> +
> diff --git a/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.8.0.b=
b b/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.8.0.bb
> index af591cfd7a..9cd7c07ad2 100644
> --- a/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.8.0.bb
> +++ b/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.8.0.bb
> @@ -16,6 +16,7 @@ SRC_URI =3D " \
>      git://github.com/wolfSSL/wolfssl.git;protocol=3Dhttps;branch=3Dmaste=
r \
>      file://0001-wolfssl-wolfcrypt-logging.h-and-wolfcrypt-src-loggin.pat=
ch \
>      file://run-ptest \
> +    file://CVE-2025-13912.patch \
>  "
>
>  SRCREV =3D "b077c81eb635392e694ccedbab8b644297ec0285"
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#124586): https://lists.openembedded.org/g/openembedde=
d-devel/message/124586
> Mute This Topic: https://lists.openembedded.org/mt/117981422/3616702
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [a=
nuj.mittal@oss.qualcomm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

