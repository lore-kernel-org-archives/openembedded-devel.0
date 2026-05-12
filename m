Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6494DCD37BE
	for <webhook@archiver.kernel.org>; Tue, 12 May 2026 04:36:02 +0000 (UTC)
Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.68326.1778560556928190678
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 May 2026 21:35:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=JtkbtZyF;
 spf=pass (domain: gmail.com, ip: 74.125.224.44, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-65db820588aso1628220d50.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 11 May 2026 21:35:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778560556; cv=none;
        d=google.com; s=arc-20240605;
        b=SJidpsf+R42zxrTrhLUJa/obegNRfYussy/l0Hh09CmkI+RQWM9DcIfrIOexgu/MC0
         p+cYCRu5A6ECEjOegGxrQ/G3WLd1dYUT5cpI/rNkLdFwcvNwgIXvpVGPRRzleSWJMCDE
         usmHxmeNf9Ymex/7GkWNbweI0576ZkzV2nThztuVP8kXv4XLaUXJ0MOg3ksUnaHyuoED
         bMys1WHAjGYHeHHDd+haorw/lXDNBVQd1p2sNyQSsZT0D+QuEPL6S6mykqh2dyUkM+jV
         yFIChiwwe4Wvq4PBnGlIINX/ixdCG9TUiUVoZbhchhkaoeHpW9Qd9ufeTTmqeIzL3sQf
         HXPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=HmjqrufJmdW6h5vD7gKNFnaX76+32oxRY5TnKqr2NHE=;
        fh=cX5R9mTFFKWDKYXAnGebsRNb6K1PdcMoSnKyLGEFfg4=;
        b=kB2mVdkTPeBgbh02jD43NXTXRZRwk41r/7DkEdH6kSnHjNC4fWuShLvnS2D5JiKFT1
         +fLY5j/HQ8Ai1bbdnc2S7eYm0X6p8XoPROkjxnO2qRjkqUE2rBwDJ8puk7W/VKSFeY9m
         I1lsbi/TrAhQFPOE+4fiAnC/UyGpAVJOLnz6oYGfdLvorokxQ3H5GLOcBckMfAzCuSOK
         Sjz0ya4wO3mNY3JXSXEPuuLLYBd2jhq2m/xhZAKK2d0Qw8/AquCwmU8K2yU52Skcw5Jx
         GQXSQcIvrhHktbjp77zepQQZRHtZMCC7jnqWfpjb4hZR7pKmH3Q8eGdIHkEe0M6l2r09
         Wz/w==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778560556; x=1779165356; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HmjqrufJmdW6h5vD7gKNFnaX76+32oxRY5TnKqr2NHE=;
        b=JtkbtZyF+YXbiQHPwowXMUwDGsJgcaHgT7PKJGdbaIfdBLhDXHYFxgcZ6m9TVHgrGt
         LmMkruSC25qYDPkCOrqS4vGwb+PcMgXeiURz/vbUGQwTM4oLUUG51N/0rEERhyllHHAt
         VUSDVkqLbSArPhCfzuI/szJOWHw3zMYsxtBCA8u/uz/sof/ta/hD0X2zF+8nSIGoMWYf
         47vFIs+wZly1pe9AuXCGEOSncpiDhXZaaO7Q11Rofnzwff31GnRFybd1FRRSqvFja02L
         ClVmBd/cvkPp1Fl+BruLKtSipgZPHYw8/I8zw6xDME8fK1QzgOFewWvQmOEUX/9WoRzW
         y5AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778560556; x=1779165356;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HmjqrufJmdW6h5vD7gKNFnaX76+32oxRY5TnKqr2NHE=;
        b=MGTm9z/39z4jBcYGG/cpG7nxxbuvevbtNjmsm61SH64YMPz0b5PRXt6T4KF6YfZ0i3
         qE2U56gkcKspxu1w7cBVmzqK8Yx1EBh9O9C/l7n9P34nZ1YQglQIyzAtbhnoY3Y2tMpJ
         A5NzRBt/r/zJ4V9A3D0kAEWklceyvLThyCpXmxLVjjnrN3GIQr3Qkc+OfU9DXggY78wF
         7N96C2IiYRJe2L/EaFdOS7VHC64u2ePCLSDH/ojM6fzdTn/54EPbOnl0begfqin/+xcc
         BBRkVo2p+830kcVcIKGAsl5YN2iaQ88kZKu6E+UHoohmiqIg0PjJ8eUJywSFUSMTqGS8
         bnVw==
X-Gm-Message-State: AOJu0Yx5cBkHcvcxU40CdpGhvIZhP7Fe2kYahefuq9sFPyAhsapZruoi
	Dx9xnknqSbk9cAGeMZ6ddRLUlzYkb2rPkBPITOjLGY/9mYItjcWQRtZjFTv9fswRtOzoMl9MRm9
	dLck7joKyjxbhLItZV/7u6SdLjg0wEk8=
X-Gm-Gg: Acq92OEXM4WSorl+7BJ1JzxChHepzSmEZKN+1OkGWSoQrcJQkP4KySRJsHXROl3RfAO
	cZwDAWsIuaiuG7/ZXeEtlLK0aQS52wBJZ37UAslfmtMraC9wDgMQVedtgAj9TySJr34giPKoe++
	md3mn/NT/ueyf+yPB+SqS8Sq31tlc/vo2peHHOX+SxUU+v7J+7U0c5LaAQs0yUjnqyC8WLBGlHw
	A41a6hUQ2t8luXu/0RE0m9QpxhzPdnPANTvQoO++WG3iAnrh87RRXWfZlviWiOjywi9OM47rLak
	aUYPmzEZ9Yg0Kw1wOD3zxkajLUgo1Lfk50v2isCzIAfzwwMDTa5vm2w72t6ZV+EQMd7zySATin6
	L/MpZDk8Wo9b/8K0l/7RZHvR5ps+BpGyzb837msy80VLmFL5BGu7Um/4tTVUULylu7w7F/Hu1re
	HNDgmd
X-Received: by 2002:a05:690e:d58:b0:65c:1302:ee48 with SMTP id
 956f58d0204a3-65de1382769mr1063738d50.54.1778560556072; Mon, 11 May 2026
 21:35:56 -0700 (PDT)
MIME-Version: 1.0
References: <20260511-bash-rr-v2-1-4987ca21e7d8@non.se.com>
In-Reply-To: <20260511-bash-rr-v2-1-4987ca21e7d8@non.se.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 11 May 2026 21:35:28 -0700
X-Gm-Features: AVHnY4JxQqOQT5eCn3lNdfbPb0aI15KltJJxauQ0kSX6YoUmJfCNuwFmXmw3Ano
Message-ID: <CAMKF1soSKFt_BdUsN-ir=BWRsJOOwPPV9YYfR0HEcYZ2-uj-GA@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH v2] openvpn: create an extra package
 for the dns-updown script
To: louis.rannou@semalibre.com
Cc: openembedded-devel@lists.openembedded.org, 
	Louis Rannou <louis.rannou@non.se.com>, pascal.eberhard@non.se.com
Content-Type: multipart/alternative; boundary="00000000000028050c065197668a"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 12 May 2026 04:36:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126856

--00000000000028050c065197668a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 11, 2026 at 4:56=E2=80=AFAM Louis Rannou via lists.openembedded=
.org
<louis.rannou=3Dsemalibre.com@lists.openembedded.org> wrote:

> From: Louis Rannou <louis.rannou@non.se.com>
>
> The dns-updown script is written in bash which is under the GPLv3
> license. As this script is optional, it is preffered to have it in an ext=
ra
> package.
>

Does ptest work ok after this change ?


>
> Signed-off-by: Louis Rannou <louis.rannou@non.se.com>
> ---
> change in v2: new package openvpn-dns-updown
> ---
>  meta-networking/recipes-support/openvpn/openvpn_2.7.0.bb | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/meta-networking/recipes-support/openvpn/openvpn_2.7.0.bb
> b/meta-networking/recipes-support/openvpn/openvpn_2.7.0.bb
> index 0cbe4641cd..6ddebde4d1 100644
> --- a/meta-networking/recipes-support/openvpn/openvpn_2.7.0.bb
> +++ b/meta-networking/recipes-support/openvpn/openvpn_2.7.0.bb
> @@ -47,7 +47,7 @@ PACKAGECONFIG[iproute2] =3D
> "--enable-iproute2,,iproute2,iproute2-ip"
>  PACKAGECONFIG[systemd] =3D "--enable-systemd,--disable-systemd,systemd"
>  PACKAGECONFIG[selinux] =3D "--enable-selinux,--disable-selinux,libselinu=
x"
>
> -RDEPENDS:${PN}:append =3D " bash"
> +RDEPENDS:${PN}-dns-updown:append =3D " bash"
>  RDEPENDS:${PN}-ptest:append =3D " bash"
>
>  do_install:append() {
> @@ -114,7 +114,7 @@ do_install_ptest() {
>      cp -f ${S}/tests/t_lpback.sh ${D}/${PTEST_PATH}
>  }
>
> -PACKAGES =3D+ " ${PN}-sample "
> +PACKAGES =3D+ " ${PN}-dns-updown ${PN}-sample "
>
>  RRECOMMENDS:${PN} =3D "kernel-module-tun"
>
> @@ -124,5 +124,6 @@ FILES:${PN} +=3D
> "${systemd_system_unitdir}/openvpn-server@.service \
>                  ${systemd_system_unitdir}/openvpn-client@.service \
>                  ${nonarch_libdir}/tmpfiles.d \
>                 "
> +FILES:${PN}-dns-updown =3D "${libexecdir}/openvpn/dns-updown"
>  FILES:${PN}-sample =3D "${sysconfdir}/openvpn/sample/ \
>                       "
>
> ---
> base-commit: 420222862f5a6d95023b8f5f3b7e1808b2264ef9
> change-id: 20260506-bash-rr-5fd0820519e4
>
> Best regards,
> --
> Louis Rannou <louis.rannou@non.se.com>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#126849):
> https://lists.openembedded.org/g/openembedded-devel/message/126849
> Mute This Topic: https://lists.openembedded.org/mt/119254470/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000028050c065197668a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, May 11,=
 2026 at 4:56=E2=80=AFAM Louis Rannou via <a href=3D"http://lists.openembed=
ded.org">lists.openembedded.org</a> &lt;louis.rannou=3D<a href=3D"mailto:se=
malibre.com@lists.openembedded.org">semalibre.com@lists.openembedded.org</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Fro=
m: Louis Rannou &lt;<a href=3D"mailto:louis.rannou@non.se.com" target=3D"_b=
lank">louis.rannou@non.se.com</a>&gt;<br>
<br>
The dns-updown script is written in bash which is under the GPLv3<br>
license. As this script is optional, it is preffered to have it in an extra=
<br>
package.<br></blockquote><div><br></div><div>Does ptest work ok after this=
=C2=A0change=C2=A0?</div><div>=C2=A0</div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">
<br>
Signed-off-by: Louis Rannou &lt;<a href=3D"mailto:louis.rannou@non.se.com" =
target=3D"_blank">louis.rannou@non.se.com</a>&gt;<br>
---<br>
change in v2: new package openvpn-dns-updown<br>
---<br>
=C2=A0meta-networking/recipes-support/openvpn/<a href=3D"http://openvpn_2.7=
.0.bb" rel=3D"noreferrer" target=3D"_blank">openvpn_2.7.0.bb</a> | 5 +++--<=
br>
=C2=A01 file changed, 3 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/meta-networking/recipes-support/openvpn/<a href=3D"http://open=
vpn_2.7.0.bb" rel=3D"noreferrer" target=3D"_blank">openvpn_2.7.0.bb</a> b/m=
eta-networking/recipes-support/openvpn/<a href=3D"http://openvpn_2.7.0.bb" =
rel=3D"noreferrer" target=3D"_blank">openvpn_2.7.0.bb</a><br>
index 0cbe4641cd..6ddebde4d1 100644<br>
--- a/meta-networking/recipes-support/openvpn/<a href=3D"http://openvpn_2.7=
.0.bb" rel=3D"noreferrer" target=3D"_blank">openvpn_2.7.0.bb</a><br>
+++ b/meta-networking/recipes-support/openvpn/<a href=3D"http://openvpn_2.7=
.0.bb" rel=3D"noreferrer" target=3D"_blank">openvpn_2.7.0.bb</a><br>
@@ -47,7 +47,7 @@ PACKAGECONFIG[iproute2] =3D &quot;--enable-iproute2,,ipro=
ute2,iproute2-ip&quot;<br>
=C2=A0PACKAGECONFIG[systemd] =3D &quot;--enable-systemd,--disable-systemd,s=
ystemd&quot;<br>
=C2=A0PACKAGECONFIG[selinux] =3D &quot;--enable-selinux,--disable-selinux,l=
ibselinux&quot;<br>
<br>
-RDEPENDS:${PN}:append =3D &quot; bash&quot;<br>
+RDEPENDS:${PN}-dns-updown:append =3D &quot; bash&quot;<br>
=C2=A0RDEPENDS:${PN}-ptest:append =3D &quot; bash&quot;<br>
<br>
=C2=A0do_install:append() {<br>
@@ -114,7 +114,7 @@ do_install_ptest() {<br>
=C2=A0 =C2=A0 =C2=A0cp -f ${S}/tests/t_lpback.sh ${D}/${PTEST_PATH}<br>
=C2=A0}<br>
<br>
-PACKAGES =3D+ &quot; ${PN}-sample &quot;<br>
+PACKAGES =3D+ &quot; ${PN}-dns-updown ${PN}-sample &quot;<br>
<br>
=C2=A0RRECOMMENDS:${PN} =3D &quot;kernel-module-tun&quot;<br>
<br>
@@ -124,5 +124,6 @@ FILES:${PN} +=3D &quot;${systemd_system_unitdir}/openvp=
n-server@.service \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${systemd_sys=
tem_unitdir}/openvpn-client@.service \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${nonarch_lib=
dir}/tmpfiles.d \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
+FILES:${PN}-dns-updown =3D &quot;${libexecdir}/openvpn/dns-updown&quot;<br=
>
=C2=A0FILES:${PN}-sample =3D &quot;${sysconfdir}/openvpn/sample/ \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &quot;<br>
<br>
---<br>
base-commit: 420222862f5a6d95023b8f5f3b7e1808b2264ef9<br>
change-id: 20260506-bash-rr-5fd0820519e4<br>
<br>
Best regards,<br>
-- <br>
Louis Rannou &lt;<a href=3D"mailto:louis.rannou@non.se.com" target=3D"_blan=
k">louis.rannou@non.se.com</a>&gt;<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#126849): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/126849" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/126849</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/119254470/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/119254470/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--00000000000028050c065197668a--

