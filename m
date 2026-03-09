Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1B58EF3709
	for <webhook@archiver.kernel.org>; Mon,  9 Mar 2026 08:11:32 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9238.1773043884005177341
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Mar 2026 01:11:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=oZ0S5L9y;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=gaP7sWvd;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6293kfAO820019
	for <openembedded-devel@lists.openembedded.org>; Mon, 9 Mar 2026 08:11:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jFMV8Ax61YOfMj5H873ZP1ngWVXM0ouqaSZSVTnpZCA=; b=oZ0S5L9yTDEWHpQ6
	M9XbAy3U6UpmsHo0YUfmhQhtrlJjRf3ZE022RqMZCZrKq/SdzMWj+ITqheNcHiaX
	CmITCGuvLRvCJXoh/0d7gJiBbZK6t15xznrEglbrXf9ldMm51dGnr9OvpWSs5fSY
	v3h+FDh76rKhKlFY8phkiwxiUp3sEZdlbK2LE1CoslCAWJTgojPlwE51Hk+fQF+A
	bcMxIXFXUMcR8RJurkWmbpHhO05naj/gkfDGo/TfyeoLSUs5yv8WF/qPjC6l5oII
	O4rNiYYOAT4qHAiH4UKpWkNm20xLYPxVFxQFImw02YyfUxZE1GE/vA9goykK3hVS
	aoNrYg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cr9qevtg6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 09 Mar 2026 08:11:22 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8954803bd74so125619836d6.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 09 Mar 2026 01:11:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773043882; cv=none;
        d=google.com; s=arc-20240605;
        b=CMMeaONZhgnpH90ooJuwPAW26nt+XKtX9fb6OOgNLR2YEeNsr4dwXWuBFCwFVsxBkD
         2zbMjAY9O1F/KGhvgru6OZiK/BWsPVtvU6xyaI8Sqjmt8P8LIxHpjFT6V+8QX10YaElT
         A/VZog/q0aNH44i/2vmhaxu5s62vQR+lAiXJ1pr5xhei0UZntsZiPXrcpS4h9z2S9DtT
         ckZ446nMFGZbZjug+HZuTqntb+0bLmfKkSGdupHNotCXU041BKJpvSuoJ+LDCI5jW7CD
         gykYDbSgWrxulK3iC9Sr3IuPTtViLhygMcga7Qy+QH+sCS1VaN4fiu5GVYWF7kGlbvus
         Tydg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jFMV8Ax61YOfMj5H873ZP1ngWVXM0ouqaSZSVTnpZCA=;
        fh=Cy+PWVSZ/rg8sSF1Gvz3KlUEJWt6CfxHO+x1gcTBGig=;
        b=gLVIDaDhR48aFhu4VgQSZrhNnmgxuMjWinqnrgBzh5Wz68anhKeRaQizuNF8GZkV7X
         uskdhHhke7iIH1MadAjLBOAsi9317VWBKsNgOzfBkv6Oup9HLHlscn/plpix1FfFggMm
         U3a8/EmnkXqAIc83sMjjNSwl0RP4Ifidhb+x1CcvZAVZQ340TlA6mEYuxNTYfVSkeG4g
         4EC1AmznRbpHe3SveeoGXB4r7L+LwXTlvO9zZV7jQZjUdGnd0XgJ0C66UXzvWzrrkpJM
         qbPIRvdpiOy/wrrzDeIWYTXwgdspkY9RJwsO5lcpxJHGaYHegDqVgX5PfEtYCfDP8/1K
         OGkg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773043882; x=1773648682; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jFMV8Ax61YOfMj5H873ZP1ngWVXM0ouqaSZSVTnpZCA=;
        b=gaP7sWvd6ZU6wxbpyBVaN1EcG2j39t2HWpJUiVAy++YeFmoq1E7H2evVpJBUoNFdyH
         w9c4souVKFxLuNQwlg2dVcQCh9hZrV2DRigG22Xft9X5KSYQCC0XG8unCcKruUyw7AD1
         5jhjYgGN1JRh2YiDcnsHqK4aiQb9TbPRtyYiWWPB6pUEUz8FPPEJGePmo53tkPQ/aE/Q
         6gzFSN8/stoTdu673nxfXc0/6NrNLULwoJWUk9bALNOHRfsxUWVC/aQUziXrs73jpssj
         uRyJ3yJEPZQSdIbx6iKHBlipm64oiJH1zLtjeyrJNwcML2tbjuTbFHqS0UP96nY30xV4
         A0Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773043882; x=1773648682;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jFMV8Ax61YOfMj5H873ZP1ngWVXM0ouqaSZSVTnpZCA=;
        b=xSlH2edkaQuWsi72qzPExeycy6zVAZJyKyckkVkjdYZjjKW8Hk6Cl0gLdbe544cqYY
         8pk6F2ESDmkam6D016Ay2qGPcp/GEbnh5Ix6MlB/3D9mylLV5/EWATlzqvAUIhmHb6Iu
         7k7yAfNzDndJJbp1wJWH7qradXu6Xa1PlNAyfAnMVfuZXXivcYsMVVDJ1YMRWoWGCmo7
         Z8E7bN86WxmP3LSPWMHJlaMhh77uBtqYbawvPM7r/uc9dwTDdUZYa0+sSOUfghQKSQO9
         Jz1I3UL1I6MaC8YQJPSQM1hnhslATPMrXq54Y0GhzeREe2dRkt/UgnAUuUNe449ihmFS
         P8BA==
X-Gm-Message-State: AOJu0YwiC1IdHZE89vzH5Lj7UIvfj8zy7t6wHTM1R4n46NAGO4kJ9NDi
	G5E6kFLm1+O1UsgYf3JsXGluoeoKn8G3fJjcF3l0vrriaK6NDULZUSIAsCwpjvfx1JzHqjHZ05E
	q2AyMV4Dbp3u/cLaSELpdMNkN8IpmuLx+Vrbt39j2930LtY7DBr6chnvA2XXiJIDtC2JJaOGaii
	dCC6asvUx6fMnIqvqB1Cgq0unuOpfLOz6P1nWR+57Iq1PQmhjgdJoaWETgVmo=
X-Gm-Gg: ATEYQzyPGxVjw3gJgjoTcF/GLbkmaad4fT1QxiWn19IumtgYIk++n7vbjZuVjFddZ/Q
	y4T2CfKnsYoCVvO2uWfda22J/gqrdzFCXGYiEqUNlPwuFRIp4OfDgYCzMR0AZ1JNjx9DxwZHm71
	6vSETSCypJydlYCqyR3bWHwVCKxjxhG7p7ijFEvk4Etrd0uHRqNTjRb/ipDr0GLrcmY3jF+K01l
	jLp
X-Received: by 2002:ad4:5d41:0:b0:894:3d7d:b488 with SMTP id 6a1803df08f44-89a30affd5fmr148254176d6.66.1773043881716;
        Mon, 09 Mar 2026 01:11:21 -0700 (PDT)
X-Received: by 2002:ad4:5d41:0:b0:894:3d7d:b488 with SMTP id
 6a1803df08f44-89a30affd5fmr148253976d6.66.1773043881188; Mon, 09 Mar 2026
 01:11:21 -0700 (PDT)
MIME-Version: 1.0
References: <20260309063956.1548385-1-mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <20260309063956.1548385-1-mohammad.rafi.shaik@oss.qualcomm.com>
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Date: Mon, 9 Mar 2026 16:11:10 +0800
X-Gm-Features: AaiRm52qx7aBq1G5LTx2G9g5N8NBDATzPf3uQJJpFD_NRMEAVaRu3VjkOy9Na-A
Message-ID: <CA+s=J=z9-XrUaha_K5V=i563yb=FNCzKfKC4dxJrct1DU=_PYQ@mail.gmail.com>
Subject: Re: [oe] [meta-multimedia][PATCH] module-protocol-native: Fix socket activation
To: mohammad.rafi.shaik@oss.qualcomm.com
Cc: openembedded-devel@lists.openembedded.org,
        Sairamreddy Bojja <sbojja@qti.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: qdonr-laVWrN3yDteK951KymQI9b9ptO
X-Proofpoint-GUID: qdonr-laVWrN3yDteK951KymQI9b9ptO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDA3NCBTYWx0ZWRfXxw7NALtUJsr7
 nUxv5ilzLdBjr8F1zVf/FhmOdCc2HgzF6hQsy0DLUOJBvc6px586vnhjRTKDqMMKDhVRFy0GQoe
 Ok87IOiuHsE00NPqmO700ctFRtuO7j4/JxxcF28bhx6rMov68A3RdSWS/MvnkvtD16hK7xJ+C+C
 q+6ycyDiV6Lq1JDy5Tt+OB83Qry4Xsd0H+2tmDlT+IL+VxOFiPV6wE8EAwOx98cO7kL7Gs5bSGf
 blEBIlZOqR3jbcfhBLTkvqyyr4N9pi/hbROxVBeDRPFyj5lm2z2q1lzoS/Kuk4xy2IGbYJi+jfe
 UI4XQiW6DJaitySFRacwwib+dbc0ubpuGmspApTAlzX2F/kvPSKAO5TxAcglNlqrSIWzIHN2BaC
 CuPmCGOBtNmkqFgkRd3eCwewlXH8MFHusbLyznaymlDFh8L4vMEUXsGcO4sf/YXNGEQ/tx5kAbl
 Gx15RIwhyWTeZRxDPZQ==
X-Authority-Analysis: v=2.4 cv=dcqNHHXe c=1 sm=1 tr=0 ts=69ae80ab cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=e5mUnYsNAAAA:8 a=Q4-j1AaZAAAA:8 a=EUspDBNiAAAA:8
 a=3-RhneuVAAAA:8 a=lCJd1fzJlJPhQUOkNSYA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=Vxmtnl_E_bksehYqCbjh:22 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=VLVLkjT_5ZicWzSuYqSo:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_02,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090074
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 09 Mar 2026 08:11:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124957

Hi,

On Mon, Mar 9, 2026 at 2:56=E2=80=AFPM Mohammad Rafi Shaik via
lists.openembedded.org
<mohammad.rafi.shaik=3Doss.qualcomm.com@lists.openembedded.org> wrote:
>
> From: Sairamreddy Bojja <sbojja@qti.qualcomm.com>
>
> Fix path comparison in is_socket_unix() and don't unset LISTEN_FDS since
> the function that uses it is called more than once and it was not unset
> when sd_listen_fds() was used.

Please explain the change being proposed for meta-multimedia.

Change commit message to start with recipe-name:

>
> Link: https://gitlab.freedesktop.org/pipewire/pipewire/-/commit/f4e174870=
eb8cbe60c922d3bf181f3eb2347523c
> Signed-off-by: Sairamreddy Bojja <sbojja@qti.qualcomm.com>
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> ---
>  ...rotocol-native-Fix-socket-activation.patch | 86 +++++++++++++++++++
>  .../pipewire/pipewire_1.6.0.bb                |  1 +
>  2 files changed, 87 insertions(+)
>  create mode 100644 meta-multimedia/recipes-multimedia/pipewire/pipewire/=
0001-module-protocol-native-Fix-socket-activation.patch
>
> diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire/0001-mo=
dule-protocol-native-Fix-socket-activation.patch b/meta-multimedia/recipes-=
multimedia/pipewire/pipewire/0001-module-protocol-native-Fix-socket-activat=
ion.patch
> new file mode 100644
> index 0000000000..c345067932
> --- /dev/null
> +++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire/0001-module-pr=
otocol-native-Fix-socket-activation.patch
> @@ -0,0 +1,86 @@
> +From f4e174870eb8cbe60c922d3bf181f3eb2347523c Mon Sep 17 00:00:00 2001
> +From: Jonas Holmberg <jonashg@axis.com>
> +Date: Mon, 2 Mar 2026 10:28:26 +0100
> +Subject: [PATCH] module-protocol-native: Fix socket activation
> +
> +Fix path comparison in is_socket_unix() and don't unset LISTEN_FDS since
> +the function that uses it is called more than once and it was not unset
> +when sd_listen_fds() was used.
> +
> +Fixes #5140
> +Upstream-Status: Backport
> +[https://gitlab.freedesktop.org/pipewire/pipewire/-/commit/f4e174870eb8c=
be60c922d3bf181f3eb2347523c]
> +---
> + src/modules/module-protocol-native.c       |  2 +-
> + src/modules/module-protocol-pulse/server.c |  2 +-
> + src/modules/network-utils.h                | 14 +++++---------
> + 3 files changed, 7 insertions(+), 11 deletions(-)
> +
> +diff --git a/src/modules/module-protocol-native.c b/src/modules/module-p=
rotocol-native.c
> +index 2be92a847..98a43829b 100644
> +--- a/src/modules/module-protocol-native.c
> ++++ b/src/modules/module-protocol-native.c
> +@@ -907,7 +907,7 @@ static int add_socket(struct pw_protocol *protocol, =
struct server *s, struct soc
> +       bool activated =3D false;
> +
> +       {
> +-              int i, n =3D listen_fd();
> ++              int i, n =3D listen_fds();
> +               for (i =3D 0; i < n; ++i) {
> +                       if (is_socket_unix(LISTEN_FDS_START + i, SOCK_STR=
EAM,
> +                                               s->addr.sun_path) > 0) {
> +diff --git a/src/modules/module-protocol-pulse/server.c b/src/modules/mo=
dule-protocol-pulse/server.c
> +index aeab710b0..637757dfd 100644
> +--- a/src/modules/module-protocol-pulse/server.c
> ++++ b/src/modules/module-protocol-pulse/server.c
> +@@ -576,7 +576,7 @@ static bool is_stale_socket(int fd, const struct soc=
kaddr_un *addr_un)
> +
> + static int check_socket_activation(const char *path)
> + {
> +-      const int n =3D listen_fd();
> ++      const int n =3D listen_fds();
> +
> +       for (int i =3D 0; i < n; i++) {
> +               const int fd =3D LISTEN_FDS_START + i;
> +diff --git a/src/modules/network-utils.h b/src/modules/network-utils.h
> +index a89b7d3bd..6ff80dd7a 100644
> +--- a/src/modules/network-utils.h
> ++++ b/src/modules/network-utils.h
> +@@ -143,7 +143,7 @@ static inline bool pw_net_addr_is_any(struct sockadd=
r_storage *addr)
> +
> + /* Returns the number of file descriptors passed for socket activation.
> +  * Returns 0 if none, -1 on error. */
> +-static inline int listen_fd(void)
> ++static inline int listen_fds(void)
> + {
> +       uint32_t n;
> +       int i, flags;
> +@@ -161,8 +161,6 @@ static inline int listen_fd(void)
> +                       return -1;
> +       }
> +
> +-      unsetenv("LISTEN_FDS");
> +-
> +       return (int)n;
> + }
> +
> +@@ -192,12 +190,10 @@ static inline int is_socket_unix(int fd, int type,=
 const char *path)
> +               if (addr.sun_family !=3D AF_UNIX)
> +                       return 0;
> +               size_t length =3D strlen(path);
> +-              if (length > 0) {
> +-                      if (len < offsetof(struct sockaddr_un, sun_path) =
+ length)
> +-                              return 0;
> +-                      if (memcmp(addr.sun_path, path, length) !=3D 0)
> +-                              return 0;
> +-              }
> ++              if (len < offsetof(struct sockaddr_un, sun_path) + length=
 + 1)
> ++                      return 0;
> ++              if (memcmp(addr.sun_path, path, length + 1) !=3D 0)
> ++                      return 0;
> +       }
> +
> +       return 1;
> +--
> +2.34.1
> +
> diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.6.0.b=
b b/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.6.0.bb
> index dea1a169d0..742720ef60 100644
> --- a/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.6.0.bb
> +++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.6.0.bb
> @@ -15,6 +15,7 @@ DEPENDS =3D "dbus ncurses"
>  SRCREV =3D "700cea78dbe7564131d51b21a7795e2567ee048a"
>  BRANCH =3D "${@oe.utils.trim_version('${PV}', 2)}"
>  SRC_URI =3D "git://gitlab.freedesktop.org/pipewire/pipewire.git;branch=
=3D${BRANCH};protocol=3Dhttps;tag=3D${PV}"
> +SRC_URI +=3D "file://0001-module-protocol-native-Fix-socket-activation.p=
atch"
>
>
>  inherit meson pkgconfig systemd gettext useradd
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#124955): https://lists.openembedded.org/g/openembedde=
d-devel/message/124955
> Mute This Topic: https://lists.openembedded.org/mt/118217162/3616702
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [a=
nuj.mittal@oss.qualcomm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

