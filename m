Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEFB8D79751
	for <webhook@archiver.kernel.org>; Sat, 31 Jan 2026 07:59:16 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5129.1769846346913854908
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 30 Jan 2026 23:59:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=Q1AnxYbr;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=MH1Lk7sf;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60V4UDwA308548
	for <openembedded-devel@lists.openembedded.org>; Sat, 31 Jan 2026 07:59:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QUcWI5dyRVYlwj/g25m031GUDEk6w3+ApOyQ2mvc4gM=; b=Q1AnxYbr/N/0/s78
	1xannNfbj3JHD53gcRznO+cSWRzEkqdIzEaqAdmXzH6KEozW26F/6fJmeFvSUchy
	gelPJiA3+0viH4tXAUz7lx53Aj7PUkpqahCPq173kBSlGVg12d2enhC3cPgerETC
	X6bpHn4BnmF6gYHMyQpqY/OutnJbXfwqYBCeGqWGr0MpgV9XgHLFAOVUuvUwMReT
	DYALo0tboNHcVgaiwfyNmOptxQhBqPGIHoEINVuyN8D93yfoECf09oUQbiuHcB6R
	go7kfWha3IUJ30oH6sZX5cLDEYlOutpmDDAi6FecbWecCQtX5qRXQCa5GRnjEnBg
	b+BAyg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1as4rej3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sat, 31 Jan 2026 07:59:06 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5014b22d678so39065001cf.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 30 Jan 2026 23:59:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769846345; cv=none;
        d=google.com; s=arc-20240605;
        b=P5jqdySkrusQfBamp+Puw/Ai0gYb33/WIzzotyGAqJCAlegLLO1URJnBve0A3S2Swp
         X88+4ZR8sH13m1IPYh6iNE9lnPVo2Vyrgk/KK0vdUlOKbnIszQ2zCia8VWWFihsaMpkc
         M6emoUU08BVzKbhU7KIe7/iwMlznMzQAVgyxhRPr33Ra6Ixa4QDp37maoZKA6drWN9wL
         WLTObr3IKG+Eug/QrODP5QpMvfzxhv69mHJCEwa3Nqwra6CL/1fzpnr5z/fp9kKo9uy5
         W4OvFJ8mTeZJpCe38o8gbRXz7Yo0G1x1WKx0dfQ1q8JuT9B4VkGGMY3xYD/Qs4l2f+Im
         NCCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QUcWI5dyRVYlwj/g25m031GUDEk6w3+ApOyQ2mvc4gM=;
        fh=n7DbajzgREMuKubg4S9maRYdU2dwZ0X2SK74LKU6leA=;
        b=G8ZHAXtcyh1N58s56JEC8iIU1tPsIb5SIjcV3+vMto/XfociNfN8gHhDKvNIQNzpJ5
         7GSv3tMVMsY9rsCqe2y9CpbJKmDdBgxroSzt0wve32kEhlY5jZZq/KhbEX3xy55QOiZb
         Q7NDR0ceFCEvHG5/LRoJ7vT1sAeS5+0wg2kNAZMzlPRX4Juqlq/gknVnztnSB02v14dV
         KpFVAzAZ65sM1v+V1qjWvl06kxoQrWfqhiuHzD4bNjdvRBmn59zvwh/yylNmVS4F6was
         w7ywRPcVFfBYwuKmYHB3zKMB76pzvoIkjGs+YmvjWSlEC0e2ITSCZw9yZnjqyhroJMtp
         PFDg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769846345; x=1770451145; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QUcWI5dyRVYlwj/g25m031GUDEk6w3+ApOyQ2mvc4gM=;
        b=MH1Lk7sfMjGqTPH/0grYNywuhN2OAfQUCxcY8rJ+tfzxB2jKuRswtEULEdrO5BX9h5
         CZabP48nhir1IWbu18rL+jqCDQPXcwmyWlVKmT/PEMTld6JbNlXChALkEG1bsn5rLmST
         /4cEBqyQjE1qv2bM9YbYxoq++zjccBfkoYoKh0TkwKYIbSISRqELIqQN9retlzfdVvhp
         soJ64vdlj308w2SjrtWXb2HTFhF1883gY46TKwtbfc/csgRkcomfFsrUHUofEh98QzS9
         gcsFMU9GKgAUfUjR+nJCIvYu1WjzIn+N3tONueTSm/0wtXxpih6GrN3A6nbTyib3ghqm
         0CCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769846345; x=1770451145;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QUcWI5dyRVYlwj/g25m031GUDEk6w3+ApOyQ2mvc4gM=;
        b=Lvu0OOLZIUbcFVaCRahy8GmS7rqFF6cDzNdtmbY1pCKluChL4lxLmhqwFftX2lVkKg
         YXL2xE2SjoCnE6C8ioeiAYmYPzwJok/nHafDNGcm03ARH6tpanReFsiAEiruJ+WByzZU
         +j9lX52UYBqihGoO/FINtj2JgOfcrbvmsWfg941TGECbdknqoWh3wfwqlU6teJx2oRQO
         EjKHSSpWQykGsMU/z+95w2Kh4iaWQjcRFxDvA9nOrfW6gPJMNrGfTVUQn7PMNyTqCJja
         NkLc7MFo4/81v75KErEWKvHv/ejbQk9o9nAS4sSVUd2DLhOEJj37gSgl8DPPS0+UE9HN
         WQ3A==
X-Forwarded-Encrypted: i=1; AJvYcCUbfWcMJtmMkkrMYK8VFjUYOUxwixAs6IAo8b8mhfa/5BAEIH28gPUNlPl/YXI1VkZuguqS4AxFGqPtrhygJd/J5gU=@lists.openembedded.org
X-Gm-Message-State: AOJu0YzPh/B2mlTq8xcw03MtdDyyvn+zuV76Kd45MfOhxex+aMv+3sIQ
	lHMsFkNETVcB28Gp1JR9emoJdwY2ffHmfivYQTOeR0A3JmBZ+i0Cy7u8+GIqfp9P+cDncOAXUdX
	zRSLY8nVIi8448t8D98mpKEu9H1wL5qfUfcylmBADzVnVoBl9S9ChUiD7WVtCydg0jVsutlg4R1
	GvgvMaL388QHVrxb5PmTltJOTxtvL+hoxlooJf4Xw2CYatgDND+6VX4evjxfo=
X-Gm-Gg: AZuq6aKufYrCHL1jJ2KRG1s0M5jrFm53W/8XZZf3Z7MNwI0M82OgBQtVSuqxxywncIq
	ywOcudMAQLUSwDkoIwus9XVuXW5xHTENo+m3io0EiKTAmpnFuhPCd71hquKFb6y7N4qhG9t5oAv
	qpVUSk7Un6lD8WcQVy9dZZn+5KJpLLDtJ9/uRSaOWuOutKLM/bdhWXVt7ECzUDVzys
X-Received: by 2002:a05:622a:e:b0:503:4bc:c926 with SMTP id d75a77b69052e-505d22ddd80mr69718501cf.83.1769846345310;
        Fri, 30 Jan 2026 23:59:05 -0800 (PST)
X-Received: by 2002:a05:622a:e:b0:503:4bc:c926 with SMTP id
 d75a77b69052e-505d22ddd80mr69718441cf.83.1769846344827; Fri, 30 Jan 2026
 23:59:04 -0800 (PST)
MIME-Version: 1.0
References: <188E348B7689C3BC.3837557@lists.openembedded.org>
In-Reply-To: <188E348B7689C3BC.3837557@lists.openembedded.org>
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Date: Sat, 31 Jan 2026 15:58:53 +0800
X-Gm-Features: AZwV_Qj37wdsabUU5KpDG20DRe1ax-Rl1uE9XSnez603xl1SmUe1HnaVLboEcxQ
Message-ID: <CA+s=J=xZcs=m0hQQCx9zhu7VBOkp=t-ZCXL35nUyNvwCb-BKLw@mail.gmail.com>
Subject: Re: [oe] [PATCH 00/18] Scarthgap pull request
To: anuj.mittal@oss.qualcomm.com
Cc: raj.khem@gmail.com, openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: q1M6oinrfj8-XJverubzmHOVGE-Hs-Wg
X-Proofpoint-GUID: q1M6oinrfj8-XJverubzmHOVGE-Hs-Wg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMxMDA2NSBTYWx0ZWRfXwq3F45pzCl6G
 xOA1eLltK9Huz9F6uG3vw/uNA9VqDPT01Isvwu/z26PN9Msa6HZN3U+VkL436d31vO4lo5It8ai
 PKCP+vYmEXniv0Sd9WGW7NtPUmDOUTHZx1d4GwvBG9wfvWhi6xRRu9FodcVDx6ppYQi21T7F1HO
 2ZtxpR2A3ikfdjkY9Un/eE2jB2II/pY6hRJnFxdzAanUowU9Zhwt0bXD0aRJZRnH94fDjn3Dp6R
 7Q23CeMRCgpg02V7Ul+pklILnCCMeNgurRXmQjwxQWpW85puaN0UYZPRvKIpMIadEIZACzX6Rae
 sb2wqu64C22yOa440atSt6dHjJ44G++GtYNsrIst8xhekEXeEZoUPfFg2x7qsRGDYSKAd9gZfGQ
 8+BumgGFows58sqAoCf64ypEjz2jQxvo+KfB55QNp7O/qC5H1nW5KRncY/NUZ6oPX3niLyvtXyN
 PmitWHAZrKKjwz1CI8w==
X-Authority-Analysis: v=2.4 cv=bIEb4f+Z c=1 sm=1 tr=0 ts=697db64a cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=iGHA9ds3AAAA:8 a=Q4-j1AaZAAAA:8
 a=EUspDBNiAAAA:8 a=JlCpI7e2dqWfBSmgtskA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=nM-MV4yxpKKO9kiQg6Ot:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-30_04,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601310065
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 31 Jan 2026 07:59:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124017

Hi Khem

Can you please merge this pull request if it looks good?

On Mon, Jan 26, 2026 at 2:37=E2=80=AFPM Anuj Mittal via lists.openembedded.=
org
<anuj.mittal=3Doss.qualcomm.com@lists.openembedded.org> wrote:
>
> Please merge these changes in scarthgap. Tested locally and on
> autobuilder.
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/builds/1269
>
> The following changes since commit 2759d8870ea387b76c902070bed8a6649ff47b=
56:
>
>   php 8.2.29: CVE-2025-14177 (2026-01-19 12:15:49 +0530)
>
> are available in the Git repository at:
>
>   https://git.openembedded.org/meta-openembedded-contrib anujm/scarthgap
>   https://git.openembedded.org/meta-openembedded-contrib/log/?h=3Danujm/s=
carthgap
>
> Ankur Tyagi (3):
>   python3-aiohttp: patch CVE-2025-53643
>   python3-cbor2: patch CVE-2025-68131
>   python3-twisted: patch CVE-2024-41810
>
> Archana Polampalli (1):
>   tcpreplay: fix CVE-2025-51006
>
> Gyorgy Sarvari (12):
>   python3-django: upgrade 4.2.20 -> 4.2.27
>   redis: ignore CVE-2025-46686
>   strongswan: patch CVE-2025-62291
>   python3-flask-cors: upgrade 4.0.0 -> 4.0.2
>   python3-waitress: upgrade 3.0.0 -> 3.0.2
>   python3-twitter: mark CVE-2012-5825 patched
>   python3-m2crypto: ignore CVE-2009-0127
>   python3-m2crypto: mark CVE-2020-25657 as patched
>   openvpn: ignore CVE-2025-13751
>   acpitool: update SRC_URI
>   xerces-c: set CVE_PRODUCT
>   gnome-keyring: set CVE_PRODUCT
>
> Joao Marcos Costa (1):
>   linuxptp: add missing prefix to CVE ID
>
> Peter Marko (1):
>   libmad: ignore CVE-2017-11552 and CVE-2018-7263
>
>  .../gnome-keyring/gnome-keyring_46.1.bb       |   2 +
>  .../recipes-support/openvpn/openvpn_2.6.14.bb |   1 +
>  .../strongswan/CVE-2025-62291.patch           |  45 ++
>  .../strongswan/strongswan_5.9.14.bb           |   3 +-
>  .../tcpreplay/tcpreplay/CVE-2025-51006.patch  |  97 ++++
>  .../tcpreplay/tcpreplay_4.4.4.bb              |   1 +
>  .../recipes-bsp/acpitool/acpitool_0.5.1.bb    |   3 +-
>  .../linuxptp/linuxptp_4.1.bb                  |   2 +-
>  .../xerces-c/xerces-c_3.2.5.bb                |   2 +
>  .../recipes-extended/redis/redis_6.2.21.bb    |   2 +
>  .../recipes-extended/redis/redis_7.2.12.bb    |   2 +
>  .../libmad/libmad_0.15.1b.bb                  |   3 +
>  .../python3-aiohttp/CVE-2025-53643.patch      | 192 +++++++
>  .../python/python3-aiohttp_3.9.5.bb           |   4 +-
>  .../python/python3-cbor2/CVE-2025-68131.patch | 517 ++++++++++++++++++
>  .../python/python3-cbor2_5.6.4.bb             |   1 +
>  .../0001-lower-setuptools-requirements.patch  |  25 +
>  ...ngo_4.2.20.bb =3D> python3-django_4.2.27.bb} |   9 +-
>  .../python3-flask-cors/CVE-2024-6221.patch    | 110 ----
>  ...s_4.0.0.bb =3D> python3-flask-cors_4.0.2.bb} |   8 +-
>  .../python/python3-m2crypto_0.40.1.bb         |   3 +
>  ...-41671-0002.patch =3D> CVE-2024-41671.patch} |   4 +
>  ...-41671-0001.patch =3D> CVE-2024-41810.patch} |   6 +-
>  .../python/python3-twisted_24.3.0.bb          |   4 +-
>  .../python/python3-twitter_4.14.0.bb          |   2 +
>  ...ess_3.0.0.bb =3D> python3-waitress_3.0.2.bb} |   2 +-
>  26 files changed, 922 insertions(+), 128 deletions(-)
>  create mode 100644 meta-networking/recipes-support/strongswan/strongswan=
/CVE-2025-62291.patch
>  create mode 100644 meta-networking/recipes-support/tcpreplay/tcpreplay/C=
VE-2025-51006.patch
>  create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/C=
VE-2025-53643.patch
>  create mode 100644 meta-python/recipes-devtools/python/python3-cbor2/CVE=
-2025-68131.patch
>  create mode 100644 meta-python/recipes-devtools/python/python3-django-4.=
2.27/0001-lower-setuptools-requirements.patch
>  rename meta-python/recipes-devtools/python/{python3-django_4.2.20.bb =3D=
> python3-django_4.2.27.bb} (44%)
>  delete mode 100644 meta-python/recipes-devtools/python/python3-flask-cor=
s/CVE-2024-6221.patch
>  rename meta-python/recipes-devtools/python/{python3-flask-cors_4.0.0.bb =
=3D> python3-flask-cors_4.0.2.bb} (71%)
>  rename meta-python/recipes-devtools/python/python3-twisted/{CVE-2024-416=
71-0002.patch =3D> CVE-2024-41671.patch} (98%)
>  rename meta-python/recipes-devtools/python/python3-twisted/{CVE-2024-416=
71-0001.patch =3D> CVE-2024-41810.patch} (95%)
>  rename meta-python/recipes-devtools/python/{python3-waitress_3.0.0.bb =
=3D> python3-waitress_3.0.2.bb} (82%)
>
> --
> 2.52.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#123858): https://lists.openembedded.org/g/openembedde=
d-devel/message/123858
> Mute This Topic: https://lists.openembedded.org/mt/117464430/3616702
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [a=
nuj.mittal@oss.qualcomm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

