Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC5E3C98315
	for <webhook@archiver.kernel.org>; Mon, 19 Jan 2026 03:10:17 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28348.1768792212012241126
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 18 Jan 2026 19:10:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=PlqOlSxf;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=g73Dn27r;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60INbLfL699030
	for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jan 2026 03:10:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X0Ntapw1zjRLtYCnFU6UIQU1r2k29dwQulBVFW9qxbg=; b=PlqOlSxfhc/rPWDE
	N6raWMojWFFb1vU8I32681r9fxqeVljBqnRshBwuiG7k+UK7j0XBzf9GGfmm0XGo
	Cbj0nPHfZGoT31N0UR/nQO+W1T2DEU26m9hwh7LXCfRY5iTUE7Km4+YOgAHeL3ym
	7vZJbWZQ9T/0lU7+H0gfqS3Hw1J/i0suZ5UfBoK8I2s8e7jIqYmv5DmBywyfeq/f
	Jt6hFIXnDOIrlZ0Ge7OEY33Hy0r9aAK59Dwk65kew0HzNkCAdxR5W0YHjsc12O9S
	pT2mKyMQBimX3U/BX1D8s+MnhK9n5cwrhUd/vdTK2GySKLij9J+dcSvbyIqC80Fe
	NcAsBA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4br1e5kmr0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jan 2026 03:10:10 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-88888397482so102916026d6.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 18 Jan 2026 19:10:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768792210; cv=none;
        d=google.com; s=arc-20240605;
        b=dbgk+GJoAI0c5fiSpQcendwuP+5/cm8BhsVcJzU7rvcCXoORzrY8P2NEfTfY+b2WY9
         +KMO/ma2+TQX1FlKZ5Jrw+FoSYTiOMPCsvZoraqbr9VJ2WzALks96oGH9ghg0f0LbRAh
         IjzJXOfteOHgYA/EwhdBV5Tw0fUytAg554PjNSaAlM6E7vpPoFGAy+uJiL98H1YDk7Th
         fyqIjX9KOmXtK9rUSJ4QF9tTgpCwSd3xuV114hM4D/qoZ0939nxJWTeJK51h9JR8nbWv
         YbVfLXhFp8LzrQL9DTeRqdEP8YO5cU4PpcjbHA2OTFHgRchgUiD3ShfMuII1jVb6dUYa
         XYAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=X0Ntapw1zjRLtYCnFU6UIQU1r2k29dwQulBVFW9qxbg=;
        fh=n0ZnAkKOhGDmrf8RLpwnC7FQ6xmEY5rofL6wXnjsXjs=;
        b=Gb+fBd+eg0bCFyag/v1tbgmwrD4pSdVRC/68PWHpZayrok8qqrnP77eDje719IaVQE
         bvTtZmKW4AGcyhAUxzjM3I0dDhveaT9ro2a4or/1jW68GbnzgRfOnYBHmhrmt/Q2HzsZ
         e4JbM3JXHfc3O4CMLG3vnQzWZv38MlQTXEIqfSoMtUlsJtxSQfcD5+GSAnUhfoOU+EkD
         9zbZYOnDTCVxZ7voJ0n7tLsAGZUOYtR5R7Tvza8nEIWr1iTidLHGIoO9XlGK1DyYSEPJ
         9g+XsJ3RbvShffaYdUu+vDVWdS1szPiV2uZKMxTMGlxzm/w5UFTcpsB0jjQ2QddV+ZSS
         BXKg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768792210; x=1769397010; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X0Ntapw1zjRLtYCnFU6UIQU1r2k29dwQulBVFW9qxbg=;
        b=g73Dn27rdLkpElRi26+7DuCVDDBE+JoWig27Cy+KmkGCTYAK8/ta3G9QhN+trjX3Gl
         XoM7mEnBxpB+ihcPC2/UqqD0Hft+QpKJdJMijjavCyV4aoyPLL+iTcq5FSDrd0/CzBjv
         GDLIaoZcMG7H/1fAH2sq4olfo3ndTqrarZ5+4A6Yc0fKg7Uo6HJhEVK1ca+mJi6EQ/mZ
         rnXVRWaYVb0f1KknjVVgCaFB5h9T+OVKhBjl+4CbnOhnePWWaucmp7H2LjF8jJk6sHdc
         YG9ofk1r0HLvWqNt4wNApLs56gFcwkOQfVL8kkfKexPBousTDqst0rbxPXLwLVmmfLuS
         j7pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768792210; x=1769397010;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=X0Ntapw1zjRLtYCnFU6UIQU1r2k29dwQulBVFW9qxbg=;
        b=p5WAwCMVYddZ+ipPszXptOqYToTtJ4BUaX6AlYh2c3R/VzdeV5KKjSog6snVfZ2JzX
         phCTz8ssNrPO0IXweUMKgYLkL8pFgoh5q21GBww5PD05/8zn9LThTGEoIKfv5MaK9WOv
         /lz9p1EAGq9MTETUj7OMHXDm1WOcCgWrEvYe+VhpWz05w7/c2WQYgTAkbdNM0vlbrteG
         66vy9ENv+kYQo9bvEYiuhGTEFTBDHSVGhtivvRJy9yXsKQstaSEj0BtqWHc6kXkmcL4G
         i5+wAGKsfCiguBgi4FruGau4so/IKSmbMMzrYqXdfqU7/rMNCk4E1rpk9ogt8da6E3UB
         IvDg==
X-Gm-Message-State: AOJu0YxU1/I6PZ0z1VmrY5irgwX222J5hROT/4WJHtDTgvf9HEfiBHxC
	2nrDGTnFtv0q2kSFXxqQPGhXwtc6ZvXtOv2x1EgEiSR46UNzGIVwHKvL4dZ7PpZKfyzpYHqu86K
	jJK4zMnlG8I6NbVpiO6vZZYzJUyZIZ4GzuHCqUWg7ghIOw81VUwkZhvMmhpzuCC6c9CLootbgIu
	VmMdYwgF422tm5565UaqYAQXMhy3AmihpQpugmI8f22E+LV/n/pTsPQUr1Lzc=
X-Gm-Gg: AY/fxX6g5PU6WLpXoG1xt+lNKA9+IK1+4na0UDR6PjZBcUUWpBbcPtdzJSJDvL96jTd
	8QIYaiHU3FLNFyh6rVDJ25q5BNwSYO3QEne/au4MEf8kx6ivWTRQBBcq6Rt23Ql8sG8w+mu3yza
	rA79/XSKtG2Y4kipzl3Vacl03Anasg3QRV/QoUkfIi1HBt7rp8LjQCxO/2ems/BGH1
X-Received: by 2002:a05:6214:124b:b0:888:6ea5:a90b with SMTP id 6a1803df08f44-8942d848f97mr136251636d6.0.1768792210107;
        Sun, 18 Jan 2026 19:10:10 -0800 (PST)
X-Received: by 2002:a05:6214:124b:b0:888:6ea5:a90b with SMTP id
 6a1803df08f44-8942d848f97mr136251526d6.0.1768792209712; Sun, 18 Jan 2026
 19:10:09 -0800 (PST)
MIME-Version: 1.0
References: <20260114130100.1016416-1-ankur.tyagi85@gmail.com> <20260114130100.1016416-16-ankur.tyagi85@gmail.com>
In-Reply-To: <20260114130100.1016416-16-ankur.tyagi85@gmail.com>
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Date: Mon, 19 Jan 2026 11:09:58 +0800
X-Gm-Features: AZwV_Qjhc3kG-I9maYoYRuGDq_i0eBno3VmGha2M0ILAMCxx6od6tBTyDeWb4EQ
Message-ID: <CA+s=J=xeOxMHUN3+ThW8aXgjOL4Xx0_wu6Paz9B2vfLYgVFb6w@mail.gmail.com>
Subject: Re: [oe][meta-python][scarthgap][PATCH 16/20] python3-twisted: patch CVE-2024-41810
To: ankur.tyagi85@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDAyNCBTYWx0ZWRfX1vfnIWxsA2Qx
 P/VH5Y57akvv+TnTv3Zt7p42fOeEgTNIGtX+koRl/e7MitE8AzfVsYkmxVqeLn/g46RVWz//jlz
 vW2rNT3+w/Xv9lLglHFrLqnTq/71huKD48uhvN9CYmD3YlziUmQxHU/BcZlqQkabj19VKTum/Sr
 +avh4WNH2h2z8lEAGVwLlwYN4Q43wbWEPfGULRX4Sn6X6zkFqBY3yfswSpeZ0vy8ulVteDPE3kN
 SJ0A+p6uEmSWbIYfnQVMb44oNznt4OVrak42+Q/ru1V9MWBV5GBoAo4CsXQ3nt8xoFi7uDTqDDr
 docDRoHn7zduZoIqtvx93gDzFB1NWOjCM42e2cpsuJrrBRMXLOwp7xz65ZkaQWhfzN/PdCZnrYQ
 uaQFG5eRRsWuWdKilZLf1uZXcqfzzc7bYrxlKqoUIw+i8kYKiC9v1aWzXbqgInDEYgeoirDYN7A
 /J8QS6UDgecSu+x0Ueg==
X-Proofpoint-GUID: rwTR7isMAIVJwZVgRlTjB-mZXt6Apj1w
X-Authority-Analysis: v=2.4 cv=U5yfzOru c=1 sm=1 tr=0 ts=696da092 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=PYnjg3YJAAAA:8 a=NEAV23lmAAAA:8
 a=Q4-j1AaZAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=cy8h8lwo6NzRi0p_UE4A:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-ORIG-GUID: rwTR7isMAIVJwZVgRlTjB-mZXt6Apj1w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-17_03,2026-01-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 spamscore=0 phishscore=0 bulkscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601190024
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Jan 2026 03:10:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123582

On Wed, Jan 14, 2026 at 9:02=E2=80=AFPM Ankur Tyagi via lists.openembedded.=
org
<ankur.tyagi85=3Dgmail.com@lists.openembedded.org> wrote:
>
> From: Ankur Tyagi <ankur.tyagi85@gmail.com>
>
> Details: https://nvd.nist.gov/vuln/detail/CVE-2024-41810
>
> Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> ---
>  .../python3-twisted/CVE-2024-41810.patch      | 33 +++++++++++++++++++
>  .../python/python3-twisted_24.3.0.bb          |  1 +
>  2 files changed, 34 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python/python3-twisted/C=
VE-2024-41810.patch
>
> diff --git a/meta-python/recipes-devtools/python/python3-twisted/CVE-2024=
-41810.patch b/meta-python/recipes-devtools/python/python3-twisted/CVE-2024=
-41810.patch
> new file mode 100644
> index 0000000000..0c195be23a
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-twisted/CVE-2024-41810.=
patch
> @@ -0,0 +1,33 @@
> +From 50ddc840e1518edacbd8b26d246f15255bb5498e Mon Sep 17 00:00:00 2001
> +From: Adi Roiban <adiroiban@gmail.com>
> +Date: Mon, 29 Jul 2024 14:28:03 +0100
> +Subject: [PATCH] Merge commit from fork
> +
> +Added HTML output encoding the "URL" parameter of the "redirectTo" funct=
ion
> +
> +CVE: CVE-2024-41810
> +Upstream-Status: Backport [https://github.com/twisted/twisted/commit/046=
a164f89a0f08d3239ecebd750360f8914df33]
> +(cherry picked from commit 046a164f89a0f08d3239ecebd750360f8914df33)
> +Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> +---
> + src/twisted/web/newsfragments/12263.bugfix | 1 +
> + src/twisted/web/newsfragments/9839.bugfix  | 1 +

This doesn't look correct and comparing to the original commit, is
missing the fix. Please also include the changes done to the commit
when backporting.

> + 2 files changed, 2 insertions(+)
> + create mode 100644 src/twisted/web/newsfragments/12263.bugfix
> + create mode 100644 src/twisted/web/newsfragments/9839.bugfix
> +
> +diff --git a/src/twisted/web/newsfragments/12263.bugfix b/src/twisted/we=
b/newsfragments/12263.bugfix
> +new file mode 100644
> +index 0000000000..b3982ca0fb
> +--- /dev/null
> ++++ b/src/twisted/web/newsfragments/12263.bugfix
> +@@ -0,0 +1 @@
> ++twisted.web.util.redirectTo now HTML-escapes the provided URL in the fa=
llback response body it returns (GHSA-cf56-g6w6-pqq2). The issue is being t=
racked with CVE-2024-41810.
> +\ No newline at end of file
> +diff --git a/src/twisted/web/newsfragments/9839.bugfix b/src/twisted/web=
/newsfragments/9839.bugfix
> +new file mode 100644
> +index 0000000000..1e2e7f7298
> +--- /dev/null
> ++++ b/src/twisted/web/newsfragments/9839.bugfix
> +@@ -0,0 +1 @@
> ++twisted.web.util.redirectTo now HTML-escapes the provided URL in the fa=
llback response body it returns (GHSA-cf56-g6w6-pqq2, CVE-2024-41810).
> diff --git a/meta-python/recipes-devtools/python/python3-twisted_24.3.0.b=
b b/meta-python/recipes-devtools/python/python3-twisted_24.3.0.bb
> index 272aecb8b0..d90bdb227f 100644
> --- a/meta-python/recipes-devtools/python/python3-twisted_24.3.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-twisted_24.3.0.bb
> @@ -9,6 +9,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dc1c5d2c2493b84=
8f83864bdedd67bbf5"
>  SRC_URI +=3D " \
>      file://CVE-2024-41671-0001.patch \
>      file://CVE-2024-41671-0002.patch \
> +    file://CVE-2024-41810.patch \
>  "
>
>  SRC_URI[sha256sum] =3D "6b38b6ece7296b5e122c9eb17da2eeab3d98a198f50ca9ef=
d00fb03e5b4fd4ae"
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#123469): https://lists.openembedded.org/g/openembedde=
d-devel/message/123469
> Mute This Topic: https://lists.openembedded.org/mt/117260246/3616702
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [a=
nuj.mittal@oss.qualcomm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

