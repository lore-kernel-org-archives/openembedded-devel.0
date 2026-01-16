Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1550CD47CAE
	for <webhook@archiver.kernel.org>; Fri, 16 Jan 2026 01:09:42 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1192.1768525775665820243
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Jan 2026 17:09:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=jvac7XB5;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=IfYMS0Hb;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60FMgSAt4015934
	for <openembedded-devel@lists.openembedded.org>; Fri, 16 Jan 2026 01:09:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V9iCcG763oHUjV/LaRoillUdSi19k/VtnySMuu4A4CE=; b=jvac7XB5c3R0Ovt+
	wKrjaPhHlb0Dr67Q53cj8s0sTD++G5+bK0GjjGXv2+WRxoFH3ornlsJUX3/9OqNj
	xxzboDkZ5ErRAKgLVVnm34qingm0A4AzP2NdcovQKTh2ySF4eBQZWvozi2CyBLJ8
	9Gq1dktxRg+vTLejmfCOm8yUtsL09YHKN4fzE0CLt8CAo2Rn44QTJVSf/ASIeQp5
	zh65bb5wwNoxAvaSFBKvExaGQ3I4ouqJem3/TvGi6W63/nIqKrQ7FvpXTzd0z5GG
	F0ez4LJoURvFdujjYM624V0/OcFzO/jVjTR1z2qLYk+pgEk19W5TOle4PAiA0WKt
	a2eraQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bq98y898r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 16 Jan 2026 01:09:34 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5014d56a63aso42493291cf.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 15 Jan 2026 17:09:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768525774; x=1769130574; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V9iCcG763oHUjV/LaRoillUdSi19k/VtnySMuu4A4CE=;
        b=IfYMS0HbLpvXsWIqkO1OKJrQjswElmRfhNylztw8Sc+a7mBihwNqO5PxevVlyDxQaS
         pnr5bfVzQB1HLJhM81Q/S8tVlVTgYX5pPZrbglN21GMd5sOAuuqPr04j5mPXqpl75NaU
         kWXIkNjxrplDPCUWgSa4Kq4M0dm0Dc8Zk5GJMge4vMdFQzg4HLYw4Ouce4gPf2gzQD/T
         JyQjbUEp2rk9cPfxacvRcEtClAFw8zU+HyiDF009hFP/ocjwY1dimyyygyqZZPwJ4IZF
         /LUGLAGtm+sNulAMIjAiF8gKgg4tvMWhvIdalDPS8/wxkuEwe/OdUN7jIxaNQaLMtGCt
         olrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768525774; x=1769130574;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=V9iCcG763oHUjV/LaRoillUdSi19k/VtnySMuu4A4CE=;
        b=aF0d11bnKTgw/ESG7ftSoeD1U/WvMtJ6qS69b7ZGAuKI0Wz0+mn2jODZNtyeAlfGjF
         iOJ4H/yfhuhJKOpukxiSbWN3E+by6a924tguuzs3QARo8nwRCMgn6Lykr37xamaMdKaY
         vqjVljimIGiJmGqJzHEbRLErXQpVK82d+hvIC5LF6Kb//EqOYHgmNTngcMYNr1sHQHwx
         NJhWtwR3tATvhxQMvZDFDLmt2Z7Ls7bwfsLVALteF53sSNaNVmBN9nNzk2dvEy2jaAX+
         c1xtv20sGYSzQerEECvVUy+9rXsCsz12RcIMg3/qDOFmjjXAiqJPYSiRsscC8Zf6sGAi
         e8WA==
X-Gm-Message-State: AOJu0YyKQWep25TB7tdHcYeXN3XrIoRXZ6NJ2cKG/Yoy8zJhSaMWcfWx
	nqmSIi0WXJR/aDS6VrZ6xYpOUUDIM6WQPOkSNEVQ9mX386Y28s/jX6xWinmg94oDFfzK/TOCMK2
	Sb+174hTIPbKZlqucMXaVv+i+eE0SQ8rmly4Dz69NMlKuJ0s93kagv38Zk18SEBsQeEZxlVIZ8K
	P4G+CvQkBVf1JnllCDNSmS+8JsXpNEClC+OSo9bW1Psu48wgQxF6VIfNo9XdM=
X-Gm-Gg: AY/fxX7MJIMAuaLRQMFj3l6uHKtbQAd2Vv7sH7XBFpUm1PLvS7jDg3lcC/15a3mkV8B
	7gCMNqiYWEsXJZyegtwuDIv8lXMwPzuScY9xYc1fRFGuUX8sD+5QlRP4sa4KaaIOurcM7XuR/Bz
	l5IvmtDX5rKZrT1c/j0NA2PjrnJh0ND1Ge1BRvs50+hZKcyQ2PIQne4vAf6xcozvCd
X-Received: by 2002:a05:622a:19a0:b0:501:1794:f9e7 with SMTP id d75a77b69052e-502a168e14cmr19738701cf.31.1768525773661;
        Thu, 15 Jan 2026 17:09:33 -0800 (PST)
X-Received: by 2002:a05:622a:19a0:b0:501:1794:f9e7 with SMTP id
 d75a77b69052e-502a168e14cmr19738391cf.31.1768525773117; Thu, 15 Jan 2026
 17:09:33 -0800 (PST)
MIME-Version: 1.0
References: <188A2D5D574684EF.2436516@lists.openembedded.org>
In-Reply-To: <188A2D5D574684EF.2436516@lists.openembedded.org>
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Date: Fri, 16 Jan 2026 09:09:18 +0800
X-Gm-Features: AZwV_QisKh9BRAoY4IU-3Sy5uvR2pEMegoz3qXeBD2raMqpW4Gxh7sj9p_E2NGk
Message-ID: <CA+s=J=x_Yg_VWkC38_ndDAzJ_Az8618B6Hck4KP6-3rVNYqTOw@mail.gmail.com>
Subject: Re: [oe] [PATCH 00/51] Scarthgap pull request
To: anuj.mittal@oss.qualcomm.com, Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=FscIPmrq c=1 sm=1 tr=0 ts=69698fce cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=iGHA9ds3AAAA:8 a=Q4-j1AaZAAAA:8
 a=EUspDBNiAAAA:8 a=CUSXG0SrjdMPuB2MosgA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=nM-MV4yxpKKO9kiQg6Ot:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-ORIG-GUID: WPpc2RdtwdIyX7nLiP7nmsxQMdwyNEx5
X-Proofpoint-GUID: WPpc2RdtwdIyX7nLiP7nmsxQMdwyNEx5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDAwNyBTYWx0ZWRfX12cTJmHQ1tiL
 75iTtDzJP/RMGYXcJ5sNwj4C3e+dzhC4A+3x0g65XqGTc1SMLkSLc0HLSf8wngV9r7cwo/Vfppy
 gGs3dCPBU9uO40zwkUOKnZ0VUq1+Rwn+a23y1MY2cGyjgU6EzZk63DM4qk7CJ6PRCACvUEesSP/
 7E3OY+zn6hTjmXx5HYC4LmVr9s5ueLdfFdP88ZhLkQphWwm10LF63JDsISNt/8U+3E5VL/Kh0Nf
 JGPVKEuv+AfGUBcOkOKRY7uHy2YbIrypUzFu1vlOEXqOiavaq8/fxWdlfNQMFRStn7MQtOu31Vc
 yHzyxw5O/m1qJnQ49w9+h1hi8NniM8vUKctQ12wuuGVvjyzq0DTEQofAwCU7pF7+uoxm1tbZJc5
 Y23NbzjBqhfON2ukX3Uo4uty2OePwyhaxhn6drBomyyZpbh0gpCA/c/+oeZs9KE4Ksx2L8Chdvc
 sTnX6n+BEH9b7NM/Zhg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_07,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 impostorscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601160007
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 16 Jan 2026 01:09:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123520

Hi Khem

Can you please merge this pull request if it looks okay?

On Tue, Jan 13, 2026 at 11:41=E2=80=AFAM Anuj Mittal via
lists.openembedded.org
<anuj.mittal=3Doss.qualcomm.com@lists.openembedded.org> wrote:
>
> Please merge these changes in scarthgap. Tested locally and on AB.
> There are a few unresolved buildpaths warning in scarthgap but they are
> not related to these proposed changes.
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/builds/1243
>
> The following changes since commit 2b26d30fc7f478f5735d514f0c1bc28f6a4148=
b6:
>
>   atop: patch CVE-2025-31160 (2025-12-30 07:08:16 +0530)
>
> are available in the Git repository at:
>
>   https://git.openembedded.org/meta-openembedded-contrib anujm/scarthgap
>   https://git.openembedded.org/meta-openembedded-contrib/log/?h=3Danujm/s=
carthgap
>
> Ankur Tyagi (19):
>   cifs-utils: patch CVE-2025-2312
>   frr: ignore CVE-2024-44070
>   libcoap: patch CVE-2025-34468
>   mtr: patch CVE-2025-49809
>   open62541: patch CVE-2024-53429
>   proftpd: patch CVE-2024-48651
>   znc: patch CVE-2024-39844
>   tinyproxy: patch CVE-2025-63938
>   wolfssl: patch CVE-2025-7394
>   libde265: patch CVE-2023-43887
>   libde265: patch CVE-2023-47471
>   vlc: patch CVE-2024-46461
>   opusfile: patch CVE-2022-47021
>   freerdp3: ignore CVE-2025-68118
>   influxdb: ignore CVE-2024-30896
>   krb5: ignore CVE-2025-3576
>   libwebsockets: ignore CVE-2025-1866
>   usb-modeswitch: upgrade 2.6.1 -> 2.6.2
>   usb-modeswitch-data: upgrade 20191128 -> 20251207
>
> Colin McAllister (2):
>   nginx: upgrade 1.25.4 -> 1.25.5
>   nginx: Fix CVE-2025-23419 for 1.25.5
>
> Gyorgy Sarvari (18):
>   imagemagick: upgrade 7.1.1-26 -> 7.1.1-47
>   imagemagick: mark CVE-2023-5341 as patched
>   imagemagick: patch CVE-2025-53014
>   imagemagick: patch CVE-2025-53015
>   imagemagick: patch CVE-2025-53019
>   imagemagick: patch CVE-2025-53101
>   imagemagick: patch CVE-2025-55004
>   imagemagick: patch CVE-2025-55005
>   imagemagick: patch CVE-2025-55154
>   imagemagick: patch CVE-2025-55160
>   imagemagick: patch CVE-2025-55212
>   imagemagick: patch CVE-2025-57803
>   imagemagick: patch CVE-2025-57807
>   imagemagick: patch CVE-2025-62171
>   imagemagick: patch CVE-2025-65955
>   dante: upgrade 1.4.3 -> 1.4.4
>   libao: ignore CVE-2017-11548
>   freerdp3: drop CVE-2025-68118 patch
>
> Katariina Lounento (1):
>   libtar: patch CVEs
>
> Khem Raj (1):
>   dante: Add _GNU_SOURCE for musl builds
>
> Naman Jain (1):
>   unbound: Fix CVE-2025-5994
>
> Peter Marko (6):
>   net-snmp: patch CVE-2025-68615
>   sox: extend CVE_PRODUCT
>   libsodium: patch CVE-2025-69277
>   networkmanager: upgrade 1.46.0 -> 1.46.6
>   synergy: patch CVE-2020-15117
>   id3lib: mark CVE-2007-4460 as fixed
>
> Sanjay Chitroda (1):
>   recipes-core/toybox: Switch SRC_URI to HTTPS for reliable fetch
>
> Vijay Anusuri (1):
>   python3-cbor2: Fix CVE-2025-64076
>
> Wang Mingyu (1):
>   libvpx: upgrade 1.14.0 -> 1.14.1
>
>  .../recipes-multimedia/libao/libao_1.2.0.bb   |   2 +
>  .../libde265/libde265/CVE-2023-43887.patch    |  39 +++
>  .../libde265/libde265/CVE-2023-47471.patch    |  42 +++
>  .../libde265/libde265_1.0.12.bb               |   5 +-
>  .../opusfile/opusfile/CVE-2022-47021.patch    |  45 +++
>  .../opusfile/opusfile_0.12.bb                 |   4 +-
>  .../recipes-multimedia/sox/sox_14.4.2.bb      |   2 +
>  .../vlc/vlc/CVE-2024-46461.patch              |  44 +++
>  .../recipes-multimedia/vlc/vlc_3.0.20.bb      |   1 +
>  ...ger_1.46.0.bb =3D> networkmanager_1.46.6.bb} |   4 +-
>  .../wolfssl/files/CVE-2025-7394-1.patch       |  46 +++
>  .../wolfssl/files/CVE-2025-7394-2.patch       | 275 +++++++++++++++
>  .../wolfssl/files/CVE-2025-7394-3.patch       | 125 +++++++
>  .../wolfssl/files/CVE-2025-7394-4.patch       |  85 +++++
>  .../wolfssl/files/CVE-2025-7394-5.patch       |  40 +++
>  .../wolfssl/files/CVE-2025-7394-6.patch       |  48 +++
>  .../wolfssl/wolfssl_5.7.2.bb                  |   6 +
>  .../proftpd/files/CVE-2024-48651.patch        | 320 ++++++++++++++++++
>  .../recipes-daemons/proftpd/proftpd_1.3.7f.bb |   1 +
>  .../libcoap/libcoap/CVE-2025-34468.patch      | 127 +++++++
>  .../recipes-devtools/libcoap/libcoap_4.3.4.bb |   1 +
>  .../recipes-irc/znc/znc/CVE-2024-39844.patch  |  62 ++++
>  meta-networking/recipes-irc/znc/znc_1.8.2.bb  |   1 +
>  .../dante/{dante_1.4.3.bb =3D> dante_1.4.4.bb}  |   6 +-
>  .../recipes-protocols/frr/frr_9.1.3.bb        |   2 +
>  .../net-snmp/net-snmp/CVE-2025-68615.patch    |  33 ++
>  .../net-snmp/net-snmp_5.9.4.bb                |   1 +
>  .../opcua/open62541/CVE-2024-53429.patch      |  44 +++
>  .../opcua/open62541_1.3.8.bb                  |   1 +
>  .../cifs/cifs-utils/CVE-2025-2312.patch       | 136 ++++++++
>  .../recipes-support/cifs/cifs-utils_7.0.bb    |   4 +-
>  .../mtr/mtr/CVE-2025-49809.patch              |  39 +++
>  .../recipes-support/mtr/mtr_0.95.bb           |   4 +-
>  .../tinyproxy/tinyproxy/CVE-2025-63938.patch  |  42 +++
>  .../tinyproxy/tinyproxy_1.11.1.bb             |   1 +
>  .../unbound/unbound/CVE-2025-5994.patch       | 275 +++++++++++++++
>  .../recipes-support/unbound/unbound_1.19.3.bb |   1 +
>  .../recipes-connectivity/krb5/krb5_1.21.3.bb  |   2 +
>  .../libwebsockets/libwebsockets_4.3.3.bb      |   2 +
>  meta-oe/recipes-core/toybox/toybox_0.8.11.bb  |   2 +-
>  .../libsodium/libsodium/CVE-2025-69277.patch  |  61 ++++
>  .../libsodium/libsodium_1.0.19.bb             |   4 +-
>  .../recipes-dbs/influxdb/influxdb_1.8.10.bb   |   1 +
>  .../recipes-multimedia/id3lib/id3lib_3.8.3.bb |   2 +
>  ...ibvpx-configure-support-blank-prefix.patch |   8 +-
>  .../{libvpx_1.14.0.bb =3D> libvpx_1.14.1.bb}    |   2 +-
>  .../freerdp/freerdp3/CVE-2025-68118.patch     |  57 ----
>  .../recipes-support/freerdp/freerdp3_3.4.0.bb |   3 +-
>  .../imagemagick/CVE-2025-53014.patch          |  25 ++
>  .../imagemagick/CVE-2025-53015.patch          |  51 +++
>  .../imagemagick/CVE-2025-53019.patch          |  26 ++
>  .../imagemagick/CVE-2025-53101.patch          |  54 +++
>  .../imagemagick/CVE-2025-55004.patch          |  65 ++++
>  .../imagemagick/CVE-2025-55005.patch          |  34 ++
>  .../imagemagick/CVE-2025-55154.patch          |  79 +++++
>  .../imagemagick/CVE-2025-55160.patch          | 159 +++++++++
>  .../imagemagick/CVE-2025-55212.patch          |  29 ++
>  .../imagemagick/CVE-2025-57803.patch          |  60 ++++
>  .../imagemagick/CVE-2025-57807.patch          |  45 +++
>  .../imagemagick/CVE-2025-62171.patch          |  26 ++
>  .../imagemagick/CVE-2025-65955.patch          |  25 ++
>  .../imagemagick/imagemagick_7.1.1.bb          |  21 +-
>  ...-missing-prototype-compiler-warnings.patch |  53 +++
>  ...ix-invalid-memory-de-reference-issue.patch |  44 +++
>  ...escriptor-leaks-reported-by-cppcheck.patch | 101 ++++++
>  ...0006-fix-memleak-on-tar_open-failure.patch |  26 ++
>  ...ix-memleaks-in-libtar-sample-program.patch | 119 +++++++
>  ...ng-a-static-buffer-in-th_get_pathnam.patch |  89 +++++
>  ...-for-NULL-before-freeing-th_pathname.patch |  30 ++
>  ...-stdlib.h-for-malloc-in-lib-decode.c.patch |  26 ++
>  ...amming-mistakes-detected-by-static-a.patch | 100 ++++++
>  .../libtar/files/CVE-2013-4420.patch          | 160 +++++++++
>  ...-33640-CVE-2021-33645-CVE-2021-33646.patch |  42 +++
>  .../files/CVE-2021-33643-CVE-2021-33644.patch |  52 +++
>  .../recipes-support/libtar/libtar_1.2.20.bb   |  12 +
>  .../synergy/synergy/CVE-2020-15117.patch      |  48 +++
>  .../recipes-support/synergy/synergy_git.bb    |   1 +
>  ...128.bb =3D> usb-modeswitch-data_20251207.bb} |   3 +-
>  ...witch_2.6.1.bb =3D> usb-modeswitch_2.6.2.bb} |   2 +-
>  .../python/python3-cbor2/CVE-2025-64076.patch |  91 +++++
>  .../python/python3-cbor2_5.6.3.bb             |   1 +
>  .../CVE-2025-23419.patch                      |   0
>  .../nginx/nginx-1.25.5/CVE-2025-23419.patch   | 119 +++++++
>  meta-webserver/recipes-httpd/nginx/nginx.inc  |   1 +
>  .../recipes-httpd/nginx/nginx_1.24.0.bb       |   3 +-
>  .../{nginx_1.25.4.bb =3D> nginx_1.25.5.bb}      |   2 +-
>  86 files changed, 3800 insertions(+), 82 deletions(-)
>  create mode 100644 meta-multimedia/recipes-multimedia/libde265/libde265/=
CVE-2023-43887.patch
>  create mode 100644 meta-multimedia/recipes-multimedia/libde265/libde265/=
CVE-2023-47471.patch
>  create mode 100644 meta-multimedia/recipes-multimedia/opusfile/opusfile/=
CVE-2022-47021.patch
>  create mode 100644 meta-multimedia/recipes-multimedia/vlc/vlc/CVE-2024-4=
6461.patch
>  rename meta-networking/recipes-connectivity/networkmanager/{networkmanag=
er_1.46.0.bb =3D> networkmanager_1.46.6.bb} (98%)
>  create mode 100644 meta-networking/recipes-connectivity/wolfssl/files/CV=
E-2025-7394-1.patch
>  create mode 100644 meta-networking/recipes-connectivity/wolfssl/files/CV=
E-2025-7394-2.patch
>  create mode 100644 meta-networking/recipes-connectivity/wolfssl/files/CV=
E-2025-7394-3.patch
>  create mode 100644 meta-networking/recipes-connectivity/wolfssl/files/CV=
E-2025-7394-4.patch
>  create mode 100644 meta-networking/recipes-connectivity/wolfssl/files/CV=
E-2025-7394-5.patch
>  create mode 100644 meta-networking/recipes-connectivity/wolfssl/files/CV=
E-2025-7394-6.patch
>  create mode 100644 meta-networking/recipes-daemons/proftpd/files/CVE-202=
4-48651.patch
>  create mode 100644 meta-networking/recipes-devtools/libcoap/libcoap/CVE-=
2025-34468.patch
>  create mode 100644 meta-networking/recipes-irc/znc/znc/CVE-2024-39844.pa=
tch
>  rename meta-networking/recipes-protocols/dante/{dante_1.4.3.bb =3D> dant=
e_1.4.4.bb} (88%)
>  create mode 100644 meta-networking/recipes-protocols/net-snmp/net-snmp/C=
VE-2025-68615.patch
>  create mode 100644 meta-networking/recipes-protocols/opcua/open62541/CVE=
-2024-53429.patch
>  create mode 100644 meta-networking/recipes-support/cifs/cifs-utils/CVE-2=
025-2312.patch
>  create mode 100644 meta-networking/recipes-support/mtr/mtr/CVE-2025-4980=
9.patch
>  create mode 100644 meta-networking/recipes-support/tinyproxy/tinyproxy/C=
VE-2025-63938.patch
>  create mode 100644 meta-networking/recipes-support/unbound/unbound/CVE-2=
025-5994.patch
>  create mode 100644 meta-oe/recipes-crypto/libsodium/libsodium/CVE-2025-6=
9277.patch
>  rename meta-oe/recipes-multimedia/webm/{libvpx_1.14.0.bb =3D> libvpx_1.1=
4.1.bb} (96%)
>  delete mode 100644 meta-oe/recipes-support/freerdp/freerdp3/CVE-2025-681=
18.patch
>  create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CVE-2=
025-53014.patch
>  create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CVE-2=
025-53015.patch
>  create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CVE-2=
025-53019.patch
>  create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CVE-2=
025-53101.patch
>  create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CVE-2=
025-55004.patch
>  create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CVE-2=
025-55005.patch
>  create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CVE-2=
025-55154.patch
>  create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CVE-2=
025-55160.patch
>  create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CVE-2=
025-55212.patch
>  create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CVE-2=
025-57803.patch
>  create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CVE-2=
025-57807.patch
>  create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CVE-2=
025-62171.patch
>  create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CVE-2=
025-65955.patch
>  create mode 100644 meta-oe/recipes-support/libtar/files/0003-Fix-missing=
-prototype-compiler-warnings.patch
>  create mode 100644 meta-oe/recipes-support/libtar/files/0004-Fix-invalid=
-memory-de-reference-issue.patch
>  create mode 100644 meta-oe/recipes-support/libtar/files/0005-fix-file-de=
scriptor-leaks-reported-by-cppcheck.patch
>  create mode 100644 meta-oe/recipes-support/libtar/files/0006-fix-memleak=
-on-tar_open-failure.patch
>  create mode 100644 meta-oe/recipes-support/libtar/files/0007-fix-memleak=
s-in-libtar-sample-program.patch
>  create mode 100644 meta-oe/recipes-support/libtar/files/0008-decode-avoi=
d-using-a-static-buffer-in-th_get_pathnam.patch
>  create mode 100644 meta-oe/recipes-support/libtar/files/0009-Check-for-N=
ULL-before-freeing-th_pathname.patch
>  create mode 100644 meta-oe/recipes-support/libtar/files/0010-Added-stdli=
b.h-for-malloc-in-lib-decode.c.patch
>  create mode 100644 meta-oe/recipes-support/libtar/files/0011-libtar-fix-=
programming-mistakes-detected-by-static-a.patch
>  create mode 100644 meta-oe/recipes-support/libtar/files/CVE-2013-4420.pa=
tch
>  create mode 100644 meta-oe/recipes-support/libtar/files/CVE-2021-33640-C=
VE-2021-33645-CVE-2021-33646.patch
>  create mode 100644 meta-oe/recipes-support/libtar/files/CVE-2021-33643-C=
VE-2021-33644.patch
>  create mode 100644 meta-oe/recipes-support/synergy/synergy/CVE-2020-1511=
7.patch
>  rename meta-oe/recipes-support/usb-modeswitch/{usb-modeswitch-data_20191=
128.bb =3D> usb-modeswitch-data_20251207.bb} (77%)
>  rename meta-oe/recipes-support/usb-modeswitch/{usb-modeswitch_2.6.1.bb =
=3D> usb-modeswitch_2.6.2.bb} (91%)
>  create mode 100644 meta-python/recipes-devtools/python/python3-cbor2/CVE=
-2025-64076.patch
>  rename meta-webserver/recipes-httpd/nginx/{files =3D> nginx-1.24.0}/CVE-=
2025-23419.patch (100%)
>  create mode 100644 meta-webserver/recipes-httpd/nginx/nginx-1.25.5/CVE-2=
025-23419.patch
>  rename meta-webserver/recipes-httpd/nginx/{nginx_1.25.4.bb =3D> nginx_1.=
25.5.bb} (74%)
>
> --
> 2.52.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#123393): https://lists.openembedded.org/g/openembedde=
d-devel/message/123393
> Mute This Topic: https://lists.openembedded.org/mt/117238126/3616702
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [a=
nuj.mittal@oss.qualcomm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

