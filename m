Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE71AC5DF80
	for <webhook@archiver.kernel.org>; Tue, 18 Aug 2026 08:59:05 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4434.1787043533242151403
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Aug 2026 01:58:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=VBsAYBxl;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=UQx5QhHs;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67I8BGOJ645005
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Aug 2026 08:58:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	skJS0MeaUADaEkvR35pMicDvs0dGpgko7IRKbVMz454=; b=VBsAYBxlUWv/MP4/
	pEe9ROSPdECaaXQ/C/iXB6qBToFK/PJvnac1ZN5KjcnIFRGi8iAr0FJ14hGaLpyg
	DapWgC1qf/aTzL7c+iTEWvwFJ38njz4jzfUaTqZqnGwrAp1mFzVz7mTW3zIpYwvS
	rrsqLbYRuq9TFZURX62Htgn0ZdqRio5LkbvasQsR8TIq4VDR6TkNHihoyd8b0jIA
	JKZEfpk1136hCd82CxeA/LPLVieuFqFV84c1EMmNpeKlh3y/f+HKUpshLTfIXHtM
	oor4BEXG0PB8FXScemC89Mh/mwWaPPEL+9b+5SjagH7EWf8bnHvQgUj3wcI5MhSm
	ZYJ5aw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4611bps5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Aug 2026 08:58:51 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8eac2620cb0so43138016d6.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 18 Aug 2026 01:58:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787043531; cv=none;
        d=google.com; s=arc-20260327;
        b=ryfldOen88vgqswfxSj5VSMw21+I3mkxht/pKtCioFM8cl4UNFxstF3eDjg5PZ1wjU
         HJYZ8+hXObyZzzwlafXiMebwX+yfolZL5Kl/YdbEQxHVhZdNMaLkcD4XNIItmONzRv6X
         hdeqhDvoSuL9yqdDtpSilVvne+T5DWIKr/9wfEZv7p/IvjalyG/k/ntV7n5fBqt5kdaS
         A0SqxazXkVoXFVeDXDKKZuUIqnbccldHQOyupNGWIjT4JaXu17eyzLLXReScM/04soGn
         Hw05dtWJWZ/FKsi3RAzgXRHbNaxPMlNfaxeXlwn8qdlcZ20GX8Y3L+nA2TYRLc2xE0/p
         jy5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=skJS0MeaUADaEkvR35pMicDvs0dGpgko7IRKbVMz454=;
        fh=drq823r7ydpbKw7ViFWCJg7MI7Y0hA51AMeT4WNd/gs=;
        b=YUMeKxpZymdeGk9+aBYiMmKG5JmbzxBVpxqufA3YvTLJeCGIp5tRY8RhXI1iQfMIGo
         B1lB6axrWv8J+r9uY0Ggz1J0vLdWwtKYycE/xIoOpU0ZaZTwvqtaY4+ANpE54GjuZXwm
         GPmyKk+Uo2v5FEMKuDOe0TZpy6bYfSMvwV69R81a/+EQ0ix+rBSxXQOxLeigre40KWYX
         RM3xK2EJiRVuNxtTm5z4nO2OCcusMuBIyLgjhEpq3xrgJOi7mwXI9ay4Mo+xZSyEuI4L
         9O5xyNeh4NCV03LO5iQce/ejyyCEhVxmBeJH4Zd4f93wwCkL7p4KWskKzA/+yNvETorI
         sLyQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787043531; x=1787648331; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=skJS0MeaUADaEkvR35pMicDvs0dGpgko7IRKbVMz454=;
        b=UQx5QhHscZF1+8GOl12LBMslweMF7jO1dM3MR6A4LJ4hcNJ6kPuaU+fwRnEU8g0phx
         TuCAXf6Q1HIStJfK23sDLd53TqmiF+gIOP0IuBhSs303lB3RqtRIGAJdRHatjkefv9Nq
         9M+j0ANp1rukZtYot31lATetyZKoqr5JvE/u6Uk0N5fzIoH8QRbZpB3noe3Z4UjtFKmI
         GG8PyhNr/W2I7t948QzPmzVPFy3kzn+t8oGG6REFnb6I3KLvpgoVQqNozJ83fBrTCWtG
         kkEXKT4T8clh9+veJOgquRkmP7WWb5nBokg7UjFU6WQ8Ur9IOqkdc/E7D19MfdOBE8v6
         Vzgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787043531; x=1787648331;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=skJS0MeaUADaEkvR35pMicDvs0dGpgko7IRKbVMz454=;
        b=HemnN1tOPl42w7CXPlpiQ2hSwhkLgagtWEnElqCvQtQlysVJjm3BebInIM8BQfScxQ
         D4yVqBSyZjX9rJMhzMIZlqJrtXdPThk8rqNHf29dviUFBuGU4PfOFhwwgmwZNeiyYCn6
         0BPK+ZDmzd8iistcV3lne/wicwpn93khGLSDQb8XygyNl/aB0F2txzfKI9LsYF9HNoSW
         Ma0knbpanSwJP0Xj156/xmGzgas5JVNR6UaiUyJM9BP972lKyUKVwS76BuVnitSWFlyx
         jjqPH6NU8KH1omKbPCcPrR2mQHew4zRE8OcFqR+TZTdYfClgbvFMcP68YNg1BGxxPryv
         ThJw==
X-Gm-Message-State: AOJu0YzdeWOSK1MSmxcEchYgUn+XxgvCR/uitTScmPDOIY5R/S/9hIYM
	0Q5RCXWPw7rw4nkXi1RiFfzhcvRbbQJ6VBuQ4nTGt4RAEYYeaycmENyJS3jpnvSOceEfXtRx5jY
	UHdkHzieGVb3FEhHXT+BM7KtrkRCGzGFjx0+dq/UnrHhE9nU9uNz6qss+TXY2nrJmXc6BdfecUJ
	VLwEl6kTHnaGGdES0tqf4THvP6SFos9XnI8Dbj29/Kz8a7KanEw/MlcO+993M=
X-Gm-Gg: AR+sD13ufjI4lzv9FxqDmz0ysq06MRxf6XIxXpLhd2gEBejxnrsNdGWRMlcKtsKc664
	5HFXZQzpmZBRDaowY66hToCe1iLEMF8pSyrZXnQPTgLsD7XxBSYoDWcg4rPbX+cx65uOQy+VwSe
	B7nT5zP1Iml3fyJ9uaH9Qy6yMXDlG3sUbiNt6mRtyvrZiv789Fn8wZZLinRUA=
X-Received: by 2002:a05:6214:4688:b0:8f1:1081:a950 with SMTP id 6a1803df08f44-90a91d86016mr386410246d6.22.1787043530886;
        Tue, 18 Aug 2026 01:58:50 -0700 (PDT)
X-Received: by 2002:a05:6214:4688:b0:8f1:1081:a950 with SMTP id
 6a1803df08f44-90a91d86016mr386410046d6.22.1787043530409; Tue, 18 Aug 2026
 01:58:50 -0700 (PDT)
MIME-Version: 1.0
References: <20260814012931.294128-1-hangtian.zhu@oss.qualcomm.com>
In-Reply-To: <20260814012931.294128-1-hangtian.zhu@oss.qualcomm.com>
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Date: Tue, 18 Aug 2026 14:28:38 +0530
X-Gm-Features: AcwNN1XhC5rsP-6mvJaUMfI259bTeHQXln4BLv3xyksweiK1Lymn5fEXA2ylIVM
Message-ID: <CA+s=J=z5y8RKOCCMu9Awvk=P=9B7sjbHtB4M7ysQUjF-59thjw@mail.gmail.com>
Subject: Re: [oe] [wrynose] hostapd: upgrade 2.11 to 2.12
To: hangtian.zhu@oss.qualcomm.com
Cc: openembedded-devel@lists.openembedded.org,
        qli_sdc_iot_wlan_host_oss.external@qti.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: kg3yxjPV2o6sQvdB1W3YC6ihLI02tRvN
X-Proofpoint-ORIG-GUID: kg3yxjPV2o6sQvdB1W3YC6ihLI02tRvN
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDA2NSBTYWx0ZWRfX/azlAnmGir1W
 mKElpmNnJH+cmV2svtXUGKFuMILk4eo508edrJKrI0/IeC4RG7am5PG+64fXzmIhvRpTY0ZszND
 H4piVH1z7Bay/C5fYOBI5rSSEYlGbcA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDA2NSBTYWx0ZWRfXwWxHeHlc+hkN
 NFIOycjdLy0Oeiflms//D8tE5zsU7hTaWPe+B0iIDGsz5P9vKMLFoG2/p9uEpjPKAgFcuoPqEnS
 XbP36/INTR2xQlUENx33wlAemK26RXDHks4na0PNOqGgquTPPe/gWPQ7A6R3PnZwgnb8S/FZzIU
 6Y8ekSqv/xxajX5cayQk+Qf8VFlEQR2mms7em6bIQ/QeXh120aD75OpESRUzdHT7Dd1lHnmp3pD
 DUKSGCxgP3gabpMhb8iUtznu+YzwKG6LLou6akcHmh4xz1L4rChLnSQah6C1BsjgyTQcthU9hyu
 SCzGJkQIEWRgAkDBPRo10/+oeT4iAr9vh9z63PILZe7efkGpI8XIgGb3FOa0IX7XXLdGZSYGVa7
 s9pmv3hZZyhy93BwJ4+9td9SgdI9vvH8AhnzeRKxRPGcYVgs4rovt8Swe+szd+hvRtxNKn8HWSO
 V1Pd9cl/Yxx9qmk0weA==
X-Authority-Analysis: v=2.4 cv=UslT8ewB c=1 sm=1 tr=0 ts=6a841ecb cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=yaAG3qJ-AAAA:8 a=Q4-j1AaZAAAA:8 a=EUspDBNiAAAA:8
 a=3-RhneuVAAAA:8 a=COk6AnOGAAAA:8 a=a_U1oVfrAAAA:8 a=n4oD4LL4Utlfgit3OnUA:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22 a=oLVlbjkABFOu4cUI0CGI:22
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=VLVLkjT_5ZicWzSuYqSo:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 suspectscore=0 phishscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180065
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Aug 2026 08:59:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129229

Hi!

On Fri, Aug 14, 2026 at 11:54=E2=80=AFAM Hangtian Zhu via
lists.openembedded.org
<hangtian.zhu=3Doss.qualcomm.com@lists.openembedded.org> wrote:
>
> Rename the recipe to 2.12 and update the upstream source checksum.
> Refresh LIC_FILES_CHKSUM for README changes in the new release.
>
> Drop local backports no longer needed with 2.12: CONFIG_SAE_PK
> base64 build fix, color switch settings initialization, and
> CVE-2025-24912 RADIUS fixes.
>
> Signed-off-by: Hangtian Zhu <hangtian.zhu@oss.qualcomm.com>
> ---
>  ...e64-for-hostapd-CONFIG_SAE_PK-builds.patch | 40 ----------
>  ...learing-up-settings-for-color-switch.patch | 34 --------
>  .../hostapd/hostapd/CVE-2025-24912-01.patch   | 79 -------------------
>  .../hostapd/hostapd/CVE-2025-24912-02.patch   | 70 ----------------
>  .../{hostapd_2.11.bb =3D> hostapd_2.12.bb}      |  8 +-

This isn't a bug fix only upgrade and not suitable for wrynose branch.

Thanks,

Anuj

>  5 files changed, 2 insertions(+), 229 deletions(-)
>  delete mode 100644 meta-oe/recipes-connectivity/hostapd/hostapd/0001-Inc=
lude-base64-for-hostapd-CONFIG_SAE_PK-builds.patch
>  delete mode 100644 meta-oe/recipes-connectivity/hostapd/hostapd/0002-hos=
tapd-Fix-clearing-up-settings-for-color-switch.patch
>  delete mode 100644 meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2025=
-24912-01.patch
>  delete mode 100644 meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2025=
-24912-02.patch
>  rename meta-oe/recipes-connectivity/hostapd/{hostapd_2.11.bb =3D> hostap=
d_2.12.bb} (80%)
>
> diff --git a/meta-oe/recipes-connectivity/hostapd/hostapd/0001-Include-ba=
se64-for-hostapd-CONFIG_SAE_PK-builds.patch b/meta-oe/recipes-connectivity/=
hostapd/hostapd/0001-Include-base64-for-hostapd-CONFIG_SAE_PK-builds.patch
> deleted file mode 100644
> index e790e8e0f2..0000000000
> --- a/meta-oe/recipes-connectivity/hostapd/hostapd/0001-Include-base64-fo=
r-hostapd-CONFIG_SAE_PK-builds.patch
> +++ /dev/null
> @@ -1,40 +0,0 @@
> -From 430bc89b9a29537d9d22bb42406f3d14072a01d4 Mon Sep 17 00:00:00 2001
> -From: Jouni Malinen <j@w1.fi>
> -Date: Sun, 22 Dec 2024 18:53:12 +0200
> -Subject: [PATCH] Include base64 for hostapd CONFIG_SAE_PK builds
> -
> -CONFIG_SAE_PK=3Dy needs base64 functionality, so set NEED_BASE64
> -automatically for it.
> -
> -Signed-off-by: Jouni Malinen <j@w1.fi>
> -Upstream-Status: Backport [https://git.w1.fi/cgit/hostap/commit/?id=3D43=
0bc89b9a29537d9d22bb42406f3d14072a01d4]
> -Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> ----
> - hostapd/Android.mk | 1 +
> - hostapd/Makefile   | 1 +
> - 2 files changed, 2 insertions(+)
> -
> -diff --git a/hostapd/Android.mk b/hostapd/Android.mk
> -index e6c2fbf18..6e0d77d28 100644
> ---- a/hostapd/Android.mk
> -+++ b/hostapd/Android.mk
> -@@ -260,6 +260,7 @@ OBJS +=3D src/common/sae.c
> - ifdef CONFIG_SAE_PK
> - L_CFLAGS +=3D -DCONFIG_SAE_PK
> - NEED_AES_SIV=3Dy
> -+NEED_BASE64=3Dy
> - OBJS +=3D src/common/sae_pk.c
> - endif
> - NEED_ECC=3Dy
> -diff --git a/hostapd/Makefile b/hostapd/Makefile
> -index fa0d366a8..c3419c10e 100644
> ---- a/hostapd/Makefile
> -+++ b/hostapd/Makefile
> -@@ -299,6 +299,7 @@ OBJS +=3D ../src/common/sae.o
> - ifdef CONFIG_SAE_PK
> - CFLAGS +=3D -DCONFIG_SAE_PK
> - NEED_AES_SIV=3Dy
> -+NEED_BASE64=3Dy
> - OBJS +=3D ../src/common/sae_pk.o
> - endif
> - NEED_ECC=3Dy
> diff --git a/meta-oe/recipes-connectivity/hostapd/hostapd/0002-hostapd-Fi=
x-clearing-up-settings-for-color-switch.patch b/meta-oe/recipes-connectivit=
y/hostapd/hostapd/0002-hostapd-Fix-clearing-up-settings-for-color-switch.pa=
tch
> deleted file mode 100644
> index 5d6cce3f14..0000000000
> --- a/meta-oe/recipes-connectivity/hostapd/hostapd/0002-hostapd-Fix-clear=
ing-up-settings-for-color-switch.patch
> +++ /dev/null
> @@ -1,34 +0,0 @@
> -From 161327f91d956771996c96ea1b6e4e1cb8dc074c Mon Sep 17 00:00:00 2001
> -From: Stone Zhang <quic_stonez@quicinc.com>
> -Date: Mon, 14 Oct 2024 18:47:32 +0800
> -Subject: [PATCH] hostapd: Fix clearing up settings for color switch
> -
> -Settings for color switch (struct cca_settings settings)
> -is used without zero clearing, which causes the member
> -settings->ubpr->unsol_bcast_probe_resp_intervalettings
> -to be a random value. It is againsts the NLA policy of
> -NL80211_UNSOL_BCAST_PROBE_RESP_ATTR_INT and causes
> -BSS color switch failure.
> -
> -Fixes: 654d2395dddf ("BSS coloring: Handling of collision events and tri=
ggering CCA")
> -Signed-off-by: Stone Zhang <quic_stonez@quicinc.com>
> -Upstream-Status: Backport [https://w1.fi/cgit/hostap.git/commit/?id=3D16=
1327f91d956771996c96ea1b6e4e1cb8dc074c]
> ----
> - src/ap/hostapd.c | 1 +
> - 1 file changed, 1 insertion(+)
> -
> -diff --git a/src/ap/hostapd.c b/src/ap/hostapd.c
> -index 5ba2cab2c..90e93b6dc 100644
> ---- a/src/ap/hostapd.c
> -+++ b/src/ap/hostapd.c
> -@@ -4768,6 +4768,7 @@ static void hostapd_switch_color_timeout_handler(v=
oid *eloop_data,
> -               struct cca_settings settings;
> -               int ret;
> -
> -+              os_memset(&settings, 0, sizeof(settings));
> -               hostapd_cleanup_cca_params(bss);
> -               bss->cca_color =3D r;
> -               bss->cca_count =3D 10;
> ---
> -2.45.2
> -
> diff --git a/meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2025-24912-=
01.patch b/meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2025-24912-01.p=
atch
> deleted file mode 100644
> index 36660b5880..0000000000
> --- a/meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2025-24912-01.patc=
h
> +++ /dev/null
> @@ -1,79 +0,0 @@
> -From 726432d7622cc0088ac353d073b59628b590ea44 Mon Sep 17 00:00:00 2001
> -From: Jouni Malinen <j@w1.fi>
> -Date: Sat, 25 Jan 2025 11:21:16 +0200
> -Subject: [PATCH] RADIUS: Drop pending request only when accepting the re=
sponse
> -
> -The case of an invalid authenticator in a RADIUS response could imply
> -that the response is not from the correct RADIUS server and as such,
> -such a response should be discarded without changing internal state for
> -the pending request. The case of an unknown response (RADIUS_RX_UNKNOWN)
> -is somewhat more complex since it could have been indicated before
> -validating the authenticator. In any case, it seems better to change the
> -state for the pending request only when we have fully accepted the
> -response.
> -
> -Allowing the internal state of pending RADIUS request to change based on
> -responses that are not fully validation could have allow at least a
> -theoretical DoS attack if an attacker were to have means for injecting
> -RADIUS messages to the network using the IP address of the real RADIUS
> -server and being able to do so more quickly than the real server and
> -with the matching identifier from the request header (i.e., either by
> -flooding 256 responses quickly or by having means to capture the RADIUS
> -request). These should not really be realistic options in a properly
> -protected deployment, but nevertheless it is good to be more careful in
> -processing RADIUS responses.
> -
> -Remove a pending RADIUS request from the internal list only when having
> -fully accepted a matching RADIUS response, i.e., after one of the
> -registered handlers has confirmed that the authenticator is valid and
> -processing of the response has succeeded.
> -
> -Signed-off-by: Jouni Malinen <j@w1.fi>
> -
> -CVE: CVE-2025-24912
> -Upstream-Status: Backport [https://w1.fi/cgit/hostap/commit/?id=3D726432=
d7622cc0088ac353d073b59628b590ea44]
> -Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ----
> - src/radius/radius_client.c | 15 +++++++--------
> - 1 file changed, 7 insertions(+), 8 deletions(-)
> -
> -diff --git a/src/radius/radius_client.c b/src/radius/radius_client.c
> -index 2a7f36170..7909b29a7 100644
> ---- a/src/radius/radius_client.c
> -+++ b/src/radius/radius_client.c
> -@@ -1259,13 +1259,6 @@ static void radius_client_receive(int sock, void =
*eloop_ctx, void *sock_ctx)
> -                      roundtrip / 100, roundtrip % 100);
> -       rconf->round_trip_time =3D roundtrip;
> -
> --      /* Remove ACKed RADIUS packet from retransmit list */
> --      if (prev_req)
> --              prev_req->next =3D req->next;
> --      else
> --              radius->msgs =3D req->next;
> --      radius->num_msgs--;
> --
> -       for (i =3D 0; i < num_handlers; i++) {
> -               RadiusRxResult res;
> -               res =3D handlers[i].handler(msg, req->msg, req->shared_se=
cret,
> -@@ -1276,6 +1269,13 @@ static void radius_client_receive(int sock, void =
*eloop_ctx, void *sock_ctx)
> -                       radius_msg_free(msg);
> -                       /* fall through */
> -               case RADIUS_RX_QUEUED:
> -+                      /* Remove ACKed RADIUS packet from retransmit lis=
t */
> -+                      if (prev_req)
> -+                              prev_req->next =3D req->next;
> -+                      else
> -+                              radius->msgs =3D req->next;
> -+                      radius->num_msgs--;
> -+
> -                       radius_client_msg_free(req);
> -                       return;
> -               case RADIUS_RX_INVALID_AUTHENTICATOR:
> -@@ -1297,7 +1297,6 @@ static void radius_client_receive(int sock, void *=
eloop_ctx, void *sock_ctx)
> -                      msg_type, hdr->code, hdr->identifier,
> -                      invalid_authenticator ? " [INVALID AUTHENTICATOR]"=
 :
> -                      "");
> --      radius_client_msg_free(req);
> -
> -  fail:
> -       radius_msg_free(msg);
> diff --git a/meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2025-24912-=
02.patch b/meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2025-24912-02.p=
atch
> deleted file mode 100644
> index add2e47048..0000000000
> --- a/meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2025-24912-02.patc=
h
> +++ /dev/null
> @@ -1,70 +0,0 @@
> -From 339a334551ca911187cc870f4f97ef08e11db109 Mon Sep 17 00:00:00 2001
> -From: Jouni Malinen <quic_jouni@quicinc.com>
> -Date: Wed, 5 Feb 2025 19:23:39 +0200
> -Subject: [PATCH] RADIUS: Fix pending request dropping
> -
> -A recent change to this moved the place where the processed RADIUS
> -request was removed from the pending list to happen after the message
> -handler had been called. This did not take into account possibility of
> -the handler adding a new pending request in the list and the prev_req
> -pointer not necessarily pointing to the correct entry anymore. As such,
> -some of the pending requests could have been lost and that would result
> -in not being able to process responses to those requests and also, to a
> -memory leak.
> -
> -Fix this by determining prev_req at the point when the pending request
> -is being removed, i.e., after the handler function has already added a
> -new entry.
> -
> -Fixes: 726432d7622c ("RADIUS: Drop pending request only when accepting t=
he response")
> -Signed-off-by: Jouni Malinen <quic_jouni@quicinc.com>
> -
> -CVE: CVE-2025-24912
> -Upstream-Status: Backport [https://w1.fi/cgit/hostap/commit/?id=3D339a33=
4551ca911187cc870f4f97ef08e11db109]
> -Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ----
> - src/radius/radius_client.c | 10 +++++++---
> - 1 file changed, 7 insertions(+), 3 deletions(-)
> -
> -diff --git a/src/radius/radius_client.c b/src/radius/radius_client.c
> -index 7909b29a7..d4faa7936 100644
> ---- a/src/radius/radius_client.c
> -+++ b/src/radius/radius_client.c
> -@@ -1099,7 +1099,7 @@ static void radius_client_receive(int sock, void *=
eloop_ctx, void *sock_ctx)
> -       struct radius_hdr *hdr;
> -       struct radius_rx_handler *handlers;
> -       size_t num_handlers, i;
> --      struct radius_msg_list *req, *prev_req;
> -+      struct radius_msg_list *req, *prev_req, *r;
> -       struct os_reltime now;
> -       struct hostapd_radius_server *rconf;
> -       int invalid_authenticator =3D 0;
> -@@ -1224,7 +1224,6 @@ static void radius_client_receive(int sock, void *=
eloop_ctx, void *sock_ctx)
> -               break;
> -       }
> -
> --      prev_req =3D NULL;
> -       req =3D radius->msgs;
> -       while (req) {
> -               /* TODO: also match by src addr:port of the packet when u=
sing
> -@@ -1236,7 +1235,6 @@ static void radius_client_receive(int sock, void *=
eloop_ctx, void *sock_ctx)
> -                   hdr->identifier)
> -                       break;
> -
> --              prev_req =3D req;
> -               req =3D req->next;
> -       }
> -
> -@@ -1270,6 +1268,12 @@ static void radius_client_receive(int sock, void =
*eloop_ctx, void *sock_ctx)
> -                       /* fall through */
> -               case RADIUS_RX_QUEUED:
> -                       /* Remove ACKed RADIUS packet from retransmit lis=
t */
> -+                      prev_req =3D NULL;
> -+                      for (r =3D radius->msgs; r; r =3D r->next) {
> -+                              if (r =3D=3D req)
> -+                                      break;
> -+                              prev_req =3D r;
> -+                      }
> -                       if (prev_req)
> -                               prev_req->next =3D req->next;
> -                       else
> diff --git a/meta-oe/recipes-connectivity/hostapd/hostapd_2.11.bb b/meta-=
oe/recipes-connectivity/hostapd/hostapd_2.12.bb
> similarity index 80%
> rename from meta-oe/recipes-connectivity/hostapd/hostapd_2.11.bb
> rename to meta-oe/recipes-connectivity/hostapd/hostapd_2.12.bb
> index ce1c145fd7..7673ce0d38 100644
> --- a/meta-oe/recipes-connectivity/hostapd/hostapd_2.11.bb
> +++ b/meta-oe/recipes-connectivity/hostapd/hostapd_2.12.bb
> @@ -2,23 +2,19 @@ SUMMARY =3D "User space daemon for extended IEEE 802.11=
 management"
>  HOMEPAGE =3D "http://w1.fi/hostapd/"
>  SECTION =3D "kernel/userland"
>  LICENSE =3D "BSD-3-Clause"
> -LIC_FILES_CHKSUM =3D "file://hostapd/README;beginline=3D5;endline=3D47;m=
d5=3D8e2c69e491b28390f9de0df1f64ebd6d"
> +LIC_FILES_CHKSUM =3D "file://hostapd/README;beginline=3D5;endline=3D47;m=
d5=3D4d666937756a064d6d90d128a32c3571"
>
>  DEPENDS =3D "libnl openssl"
>
>  SRC_URI =3D " \
>      http://w1.fi/releases/hostapd-${PV}.tar.gz \
> -    file://0001-Include-base64-for-hostapd-CONFIG_SAE_PK-builds.patch \
> -    file://0002-hostapd-Fix-clearing-up-settings-for-color-switch.patch =
\
>      file://defconfig \
>      file://init \
>      file://hostapd.service \
> -    file://CVE-2025-24912-01.patch \
> -    file://CVE-2025-24912-02.patch \
>  "
>
>
> -SRC_URI[sha256sum] =3D "2b3facb632fd4f65e32f4bf82a76b4b72c501f995a4f62e3=
30219fe7aed1747a"
> +SRC_URI[sha256sum] =3D "f43502561c28ba47ab77e18e1a973d07361c68cc8b14178e=
619bd5796b70eabd"
>
>  inherit update-rc.d systemd pkgconfig features_check
>
>
> base-commit: 6bf0d8ad57b33950bab4c7f6c037e1ccb6f6e2eb
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#129039): https://lists.openembedded.org/g/openembedde=
d-devel/message/129039
> Mute This Topic: https://lists.openembedded.org/mt/120745383/3616702
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [a=
nuj.mittal@oss.qualcomm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

