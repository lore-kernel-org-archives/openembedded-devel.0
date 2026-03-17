Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32213FB5EA8
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 03:05:57 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.68091.1773716749507398319
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Mar 2026 20:05:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=W8/Ho0Ha;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=BrIFNezz;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62H28eNb4022277
	for <openembedded-devel@lists.openembedded.org>; Tue, 17 Mar 2026 03:05:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3fbQPAEFq3gTARV89rBV0TtvWfOvvfAANM5Am/MKmxo=; b=W8/Ho0HalfPWWOrx
	B9g9e4Kw/GUFIzuUWOexhkaDE4cCngx3Nbez6qk+VjMNw5LSbWcQhee5oIBPZWuV
	WI1AkDn1zw44On9IiOwkoE5+3IMi9Dl4TAucvW2zgLAWxZpysrFDejCq3Q7pWs9K
	QINX0PL7Y7VpHQRC7LwBMQOcraDIvnH6p2hwA6AnGKnOM+xebG2cJK1Yx9BeAn0c
	2wOvXnLx/jOjMLgvbMV+PpJ+vI+SFCRWGD8+ig/TszGUKdbcuXg8aPw7VrVEQxMs
	0R0VI5FKxYLfqkr743HEVFuFT0RmpnHRW4dyYOsu7rmDDc/MFpr2Km3yv0Utl8jq
	j/nzqg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxn3fhtuh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 17 Mar 2026 03:05:48 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-89a0a2afc55so42415076d6.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Mar 2026 20:05:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773716748; cv=none;
        d=google.com; s=arc-20240605;
        b=MiWOKJ94rJCa+crWbHzGhpQ+eQNUwGKjnRdU4lW+kmnmEGkJZCEvX7CdGvl9lWC+Sx
         n5uKMiZy9LZtLMflqzuDQocnfXYUv+mycQi0wcwXr4dJD2jsPUx1Okanbnh29h4S+9Vk
         0s4S1j9Q/1F6dsmdQ/u+MBkl1QS63L5H4pckjcshRTQd2SG5LwkKsNigZTPnE4lXvTl0
         BiQN44LnsTjjXqA8wCV4Q52d/mqqrggemZdZ6aYSpQg5Vi/XylkOo7r+tdtvixvZepZ0
         HTTywY7ZSJjLZM1rAe435JBFUREJrrtKy5/IJrvfJIa2knTKNsFWZlckkGF0BpXcEGlw
         T6Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3fbQPAEFq3gTARV89rBV0TtvWfOvvfAANM5Am/MKmxo=;
        fh=dnQLMwJO9GYQoepIlv7y6xYR8K2pm36jJWD4AM/EVzY=;
        b=gbz2DukWv7EP6BvNpEW/NTu2KviB/GGBcuRAsG2RebV49bYgPMpXuVPem/7mU5XNyx
         d/Ik9wK6hT2p4oKbaxh3WeyyaSltHzQjkh4WtwPDAEZBtnO1rB/WB+JwcH+L+cQsa/vB
         c3dMQM//nXMf9tNJytjDQruH3UYDYyw/RPL1hS5BuJRf4dB3iXw1wblOK4ZsaKNvNr+m
         6MJ1keRVLWB8nI60FsCdCVkSGtpi+262YMygdAeeSK7sF4UfT6KiyKkrJ6HuDgHLiA61
         A6FjoqVuMtttaSfZX5Jy6tsrFtvokLZMavRNxeKaFDAQK2llUJBPrknKLXTB1yYUGDbw
         u2pQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773716748; x=1774321548; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3fbQPAEFq3gTARV89rBV0TtvWfOvvfAANM5Am/MKmxo=;
        b=BrIFNezzJkAwd+ayR7BiUdu+lJqRUN7TVGss5jMf6qn+K4zYXQF0BVjJgPjeIyGnBf
         BP0jwtN95+9rZM7QJjICpfXFB6/kOiZ/4z9uqTwditkP9OkDPM0MptlasHz6Ce60Vtlu
         2tXSoGB9yLxF30O4no+8Itr+T+52BfuUhhF0bdmPNAh5keNrUPOZ2b3HZ0vljXcx/AM2
         3xnOo0cIiUgmT2qPoJDoms/VlM0nYGP1HrCyZU5c9nHFEq4NrwT2cxDqftnCryos2IfH
         +VoNu+Bb+ohhb4xpQMgaY3ZTROeV7axzz8XPkxuaOGk6QFVZc72U0uezf6eMh23eYPuz
         UUTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773716748; x=1774321548;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3fbQPAEFq3gTARV89rBV0TtvWfOvvfAANM5Am/MKmxo=;
        b=QpXbzsiFGTqyi66FOlih33/p/dfIBL8qH/FbR6vxcTn8WTtnzIfu5ZBDvW66PCWEro
         j57O2uAKutQ9Yob9wgZtynZeYbUlvE8d+W0vyNOgVdPznbP/0JvrTUZueAZ+7QJNt3UY
         eqnzwRpPT2pailO4qeGuhlvtoWOPzVj8O0VBa+UIwr6655l9QV4P03DEM0tKmj/ArxW6
         M7j5r1M+ndR3L6DFfN1qwYoyge4N0MCM7nEsDbsjaEa9l+C08xtN7A74lZDnM6/2Wptq
         FytKuZu5boBVUXdFChumq4NmC41CYPQ4zxEUKhNNkRZRD3spVyRzIxrWdMRAZhL6SNW7
         rRyw==
X-Gm-Message-State: AOJu0YwUvlj0U7rVeRaNsmW5ISyQOs5dYk/a99fSZeo88JhtgX5SrePz
	V4SOiETJ7v4BGmxqAQc8wVwlAYCb3P+F3qp2LOUfTZ7S0WGGWTwc5xphl3rIgcF2/GLfZv7OAD2
	2VAxdo533CybARZyr64ZjxELasvgicmb4idmqm7N4C938FiSO3+xH2pbey26C+Vmsz6IiewlzG9
	/03Lxhtt98rj3S/f8/Qza9B0BmbPYx3UMETCao56JoYcVm0zP9sjOGtw6KIkqLPXLxOJw=
X-Gm-Gg: ATEYQzwRgbalSsl/p/2r3R1iRwFfwZY7gjRiJTNg4+KfOiTHXL/WRyI0G6x37hmRdR0
	bqwGqlbyUxMbZjRCdNdjxWDyBzmMBC1569wm46hHPOwDbdDfpGo8IyTGWa0cyNcTt+tWSHDhnhv
	Q8Xz8WM22sWfBSYmmaHOnRhEDfz6S4pmY+GIQe+o02fhwovO0hmg1K5w92TwwthFkxj0Xal3v/q
	ogk
X-Received: by 2002:ad4:5891:0:b0:89c:46a8:368f with SMTP id 6a1803df08f44-89c46a83842mr85687536d6.16.1773716747603;
        Mon, 16 Mar 2026 20:05:47 -0700 (PDT)
X-Received: by 2002:ad4:5891:0:b0:89c:46a8:368f with SMTP id
 6a1803df08f44-89c46a83842mr85687386d6.16.1773716747175; Mon, 16 Mar 2026
 20:05:47 -0700 (PDT)
MIME-Version: 1.0
References: <20260311124520.19221-1-sujeetnayak1976@gmail.com>
In-Reply-To: <20260311124520.19221-1-sujeetnayak1976@gmail.com>
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Date: Tue, 17 Mar 2026 11:05:36 +0800
X-Gm-Features: AaiRm52Clv01ndXJnNOKOp0qL47WWwmN68mxdG7LXGjS_ZKwy8m0QSMViQ8Rpxk
Message-ID: <CA+s=J=x0SQZnSCdnj91=4q+XdP2k9d+C0wmxrGBpCcm9wbNm0A@mail.gmail.com>
Subject: Re: [oe] [meta-oe][scarthgap][PATCH] libnice: make crypto library
 configurable via PACKAGECONFIG
To: sujeetnayak1976@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=C5bkCAP+ c=1 sm=1 tr=0 ts=69b8c50c cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=e5mUnYsNAAAA:8 a=Q4-j1AaZAAAA:8 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=a-jkGQjFP3EZp1guEmwA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=Vxmtnl_E_bksehYqCbjh:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-GUID: Z0moQwXRpBEa34xhGYnJQPH-mPYcJVQ0
X-Proofpoint-ORIG-GUID: Z0moQwXRpBEa34xhGYnJQPH-mPYcJVQ0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDAyNCBTYWx0ZWRfXxxdmlKI2cBN/
 au5/wC6RXqoNsXy6vXxk9TmPAjs4hvcCzThZQdRm5+m0Xru4OEFKAgWVU4zvfoRgLsZjwmZgV4J
 B38qMfsynA4tWeyYKgV/8NS6gx8vJHJwgyh+aUPm3VgJaDIqQ9hX4RKY4v4cHKwsLZg4Gfxo5Lm
 dwA4HNhty+mmWw5FoDfs7TyVMeIns1ADiUcjfMZ7Nvfx76v5dCNXz0AEu/UDpDqQ9zBCP/t27IY
 kPfTwQpX8P/aNdAUj6JLCpxtQfyvPGLK2LSLYoxV2+NYYTbBdeza8qxMZMfGpyzYGNJ2FO4m6J4
 0XwcUdjZqs0nkfWESOT8YPeyFxHvY8v18a0T59rzWCwCnbxl1tu4m641FcckkylMG4P3RXCBfZ0
 uXS54Tb0E6rGKa2vr2vD/irsTs5OZS5+2d9Xv4eP0omWRnsVJ1UJxZTqq16g/bZIeXw4QHALsTO
 eqpU9J/xU9zVw91Y9gg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_06,2026-03-16_06,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 impostorscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603170024
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Mar 2026 03:05:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125301

Hi,

Please send backports requests after change has been merged in master
by cherry-picking the merged commit. In this case, please send this
for whinlatter as well.

On Wed, Mar 11, 2026 at 8:45=E2=80=AFPM sujeetnayak1976 via
lists.openembedded.org
<sujeetnayak1976=3Dgmail.com@lists.openembedded.org> wrote:
>
> From: Sujeet Nayak <sujeetnayak1976@gmail.com>
>
> Move gnutls from a hard dependency to a PACKAGECONFIG option,
> defaulting to gnutls. This allows users to select openssl as an
> alternative crypto library by setting PACKAGECONFIG.
>
> Signed-off-by: Sujeet Nayak <sujeetnayak1976@gmail.com>
> ---
>  meta-oe/recipes-support/libnice/libnice_0.1.22.bb | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-support/libnice/libnice_0.1.22.bb b/meta-oe/=
recipes-support/libnice/libnice_0.1.22.bb
> index 175e10fdf6..5c5436dd8d 100644
> --- a/meta-oe/recipes-support/libnice/libnice_0.1.22.bb
> +++ b/meta-oe/recipes-support/libnice/libnice_0.1.22.bb
> @@ -11,7 +11,11 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D9c423250157=
02feda4f4d2f19a55b767 \
>  SRC_URI =3D "http://nice.freedesktop.org/releases/${BP}.tar.gz"
>  SRC_URI[sha256sum] =3D "a5f724cf09eae50c41a7517141d89da4a61ec9eaca32da4a=
0073faed5417ad7e"
>
> -DEPENDS =3D "glib-2.0 gnutls ${@bb.utils.contains('DISTRO_FEATURES', 'ap=
i-documentation', 'graphviz-native', '', d)}"
> +DEPENDS =3D "glib-2.0 ${@bb.utils.contains('DISTRO_FEATURES', 'api-docum=
entation', 'graphviz-native', '', d)}"
> +
> +PACKAGECONFIG ??=3D "gnutls"
> +PACKAGECONFIG[gnutls] =3D "-Dcrypto-library=3Dgnutls,,gnutls"
> +PACKAGECONFIG[openssl] =3D "-Dcrypto-library=3Dopenssl,,openssl"
>
>  PACKAGECONFIG[gupnp] =3D "-Dgupnp=3Denabled,-Dgupnp=3Ddisabled,gupnp"
>  PACKAGECONFIG[gstreamer] =3D "-Dgstreamer=3Denabled,-Dgstreamer=3Ddisabl=
ed,gstreamer1.0"
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#125086): https://lists.openembedded.org/g/openembedde=
d-devel/message/125086
> Mute This Topic: https://lists.openembedded.org/mt/118259287/3616702
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [a=
nuj.mittal@oss.qualcomm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

