Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0962ECD343F
	for <webhook@archiver.kernel.org>; Thu, 21 May 2026 03:37:11 +0000 (UTC)
Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28876.1779334624515316639
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 May 2026 20:37:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=HSqxKio0;
 spf=pass (domain: gmail.com, ip: 74.125.224.47, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-651b4d09141so5513881d50.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 20 May 2026 20:37:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779334623; cv=none;
        d=google.com; s=arc-20240605;
        b=R9TdnFzTnpSVB1OMmt8IGsJ1Loa5X0dSEH9B6UxpSF3HsDI8A+OXW6wtRL/vTugxA9
         +fd9uMmY8HndIKXI+s9xwhMa68FeCjQNCyQyYVqroUCJhlWRlsTVktIk+U+tkZAU+Z1X
         IWXSIAQ+HszYchUjbWob/DsKoseblTzJuRObxh+d0AhOp9yYrpicJAcWNCm2MyeiTEqG
         ys2+LxJJL2NORsU/xfZkm3YO4o0OtBzP6kcov6THKVfeulNa+Llr0NEBjG3rwrkWuEHO
         hplvn13OOwC/S6D3jqCMm1SItgkdb6OiONcG1erA/sBiCX+pFkYSTOwOx+4aawi6XPtN
         GFAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=U+H5725ahBDpheR8ecPsKPBIyIH097uZ8FHJjrFOdvA=;
        fh=sQq4UwMItvi2zQkbQsQ7gG/lHqOQ30Mc0djsN0hkevw=;
        b=jEgz7CTF3kp+VXCmC727A8DizHvvEISjD47IPoiEayVv27A7JZ1TGZvUiGtTLC1H0d
         wc8whbkXhw8pU0+hdqZZEOeJjHPARoks2dOztfN9QV0WHv6ZhK6HHJ+HpBTCcfa8DNBU
         M7KEVqc8ZDUSrPd4oVzBAv9O240gMiDhEvuyum0JWQXlllaJaGfHHPwfI+5UV3a1yCxl
         9M/CAgLZOVn768Lhb3MUoavK1rQr8A1nCDmC8yug8ExgzM9vDMQKaV+OTxFIsrPcDlZz
         HghcjwrfoFsTf2AYRYkQ2ArhD9pCdmBBwPogJhwPuegaLIYRJ1wfTyGOx8PocMHsIMXm
         Z0Ig==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779334623; x=1779939423; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=U+H5725ahBDpheR8ecPsKPBIyIH097uZ8FHJjrFOdvA=;
        b=HSqxKio0gghxgyqMY7nIVTU4jMl1ZQGrO3s6MxZj1cBnS7kzm/qm6xvvrDY10FLDzi
         w1CZjPW0fXo3vQrbYEqSPOaFogf68lYha/B8Ft6I6cAD7tX/r1EOFFwG+IVaYwFKe7/X
         sOwPYiRAdi/+88d5yheG1AEnro+5fPSZqFLbId6UE4oV3VlUjpmk30RmySq9AS9j/YJw
         D/OB4rA3cpsu5GNLfPfpevAzNIQKJFiL7uHQEk849DG+Uips1K+ZEy5ue4CzHlxEvAK4
         qDTj1LuFRY1n5kJjhGMde4L6qtybQphvGhh0aIlQ3WOBwe6sCJ6CofTfkY4ByHTqy+aL
         YoYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779334623; x=1779939423;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U+H5725ahBDpheR8ecPsKPBIyIH097uZ8FHJjrFOdvA=;
        b=bASm0WEaXovd+rNmX4DCF+Mmj6JHd9LT6fACpHOQ9N1FGYKrU7dwzdgGP6VQ+28LMA
         5tQN7d4fQwv0tvwNxFmoow5sl3t6z5fxq++G4bqDLwSgwuATIFspnVT2SKNWzSGjTKNj
         h0kOGVZRj2T6UdxZIgXHkfm8We3BK1swuef0UEDsFKd3W35m+0vclxmpO6+nsAsVGdug
         WTPNPg0GkDcyjUkntUBjPBNiXyU+fvPUkyxX235k9HrbbZAscwWlEo6HXt6CUAGKbbxC
         BvdVfr2B4pmVSAcFLClQnBL6rv6d9MwcVfgetdTkkQ5niGX33satcVFr2ITPx5qpiXP6
         EQXA==
X-Gm-Message-State: AOJu0YwNSb5TisisK1AGr6hLNVn7UIHIleAsAvvcRcvWeD/JnkG2Yje0
	F3bWeyuz8QDVqS1ie1PB2PhT2ZultZmkrWMYcPqyEVC2t2ZRpamPdKV117rG4kTdKJj11IoZq+I
	txxIwQ7Vrrapj55r9EVIDaza20JT7w8A24Rt0
X-Gm-Gg: Acq92OHCsi1Lk/NUqqs0MOYJfnzf7Xbze/WzI9jCG+3dk4BJuf0zgn4GQavZTq17xMu
	Anr3JNqrVVQ2fX6dlaN2WKA0guZpJY9m7l1Kfut1ZI8obD1Wx0NBsJ/ZRbvHi/0NlDjzrrlFjxA
	HsA5Of8pS17CdwVT+0DJgYI8IKy2Z2va4kk+m2iDQaQqabK/J6xvTxUftkccgl3Vwwq0iRSGJET
	2LyMKGAysaLXhGLyO7wuToZRrbdNyk9jh6qk1fV4GqeNsiZwmhYJUu7wXQECE4V/v7BX8M6sQCB
	39PJB4ng28G96bsncmMgW6EEfLBkOpOeog68GSREh6LtkJVwL+ZFALE+pkfLuhxniEqHNtF+Vdr
	A90/MZ4ALV8uraIdiFJV357ulq/s1hlyvk+9GhzhkdwG5z2fEvAkUWGgYU8mxIhwuoX6cqVPsIu
	c8CIOM
X-Received: by 2002:a05:690e:408e:b0:65e:b19e:2f48 with SMTP id
 956f58d0204a3-65eb19e410amr251501d50.4.1779334623384; Wed, 20 May 2026
 20:37:03 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1779004358.git.anuj.mittal@oss.qualcomm.com>
In-Reply-To: <cover.1779004358.git.anuj.mittal@oss.qualcomm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 20 May 2026 20:36:36 -0700
X-Gm-Features: AVHnY4I1xzf9HucOJo7ze54w8ytWIiONewid-MRaa-aUgOOuuk7A8AK_ughGVmE
Message-ID: <CAMKF1sot4DOyNJcGdUi3rc2SWFTGR_VTQ1ab-NhKnqkn6UrJiA@mail.gmail.com>
Subject: Re: [oe] [wrynose][PATCH 00/29] Wrynose pull request
To: anuj.mittal@oss.qualcomm.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000029d82406524ba001"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 May 2026 03:37:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127124

--00000000000029d82406524ba001
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Installed now. Thanks Anuj.

On Sun, May 17, 2026 at 1:24=E2=80=AFAM Anuj Mittal via lists.openembedded.=
org
<anuj.mittal=3Doss.qualcomm.com@lists.openembedded.org> wrote:

> Includes some build and CVE fixes and some upgrades that included only bu=
g
> fixes.
>
> Tested locally and on autobuilder.
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/builds/1526
>
> The following changes since commit
> 420222862f5a6d95023b8f5f3b7e1808b2264ef9:
>
>   networkmanager: re-implement the vala detection (2026-04-24 18:39:52
> -0700)
>
> are available in the Git repository at:
>
>   https://git.openembedded.org/meta-openembedded-contrib anujm/wrynose
>
> https://git.openembedded.org/meta-openembedded-contrib/log/?h=3Danujm/wry=
nose
>
> for you to fetch changes up to 9af4488d46cb4fd4c0d2d64820c86225ebd6ac71:
>
>   libtsm: upgrade 4.4.3 -> 4.5.0 (2026-05-17 11:52:30 +0530)
>
> ----------------------------------------------------------------
>
> Adam Duskett (1):
>   kmscon: upgrade 9.3.3 -> 9.3.5
>
> Changqing Li (1):
>   postfix: make it can compile with linux 7.x
>
> Ernest Van Hoecke (1):
>   jsoncpp: Fix C++11 ABI breakage when compiled with C++17
>
> Fabian Pflug (1):
>   pkcs11-provider: fix build error on 32 bit systems
>
> Gianfranco Costamagna (1):
>   vboxguestdrivers: Upgrade to 7.2.8
>
> Gyorgy Sarvari (1):
>   libcoap: mark CVE-2026-29013 patched
>
> Hongxu Jia (1):
>   thin-provisioning-tools: fix compile failure on 32bit BSPs
>
> Jason Schonberg (2):
>   xfdesktop: upgrade 4.20.1 -> 4.20.2
>   orage: upgrade 4.20.2 -> 4.20.3
>
> Jiaying Song (1):
>   python3-blivet: switch from setuptools3_legacy to
>     python_setuptools_build_meta
>
> Liu Yiding (1):
>   eog: Add HOMEPAGE
>
> Liyin Zhang (1):
>   apache2: upgrade 2.4.66 -> 2.4.67
>
> Peter Marko (1):
>   cryptsetup: update udev package config
>
> Ross Burton (1):
>   iwd: depend on the regulatory database
>
> Wang Mingyu (10):
>   bubblewrap: upgrade 0.11.1 -> 0.11.2
>   fastfetch: upgrade 2.61.0 -> 2.62.1
>   imagemagick: upgrade 7.1.2-19 -> 7.1.2-21
>   strongswan: upgrade 6.0.5 -> 6.0.6
>   valkey: upgrade 9.0.3 -> 9.0.4
>   libauthen-sasl-perl: upgrade 2.1800 -> 2.2000
>   hunspell: upgrade 1.7.2 -> 1.7.3
>   znc: upgrade 1.10.1 -> 1.10.2
>   python3-ujson: upgrade 5.12.0 -> 5.12.1
>   libtsm: upgrade 4.4.3 -> 4.5.0
>
> Yi Zhao (4):
>   webkitgtk3: fix build on riscv64
>   proftpd: upgrade 1.3.9 -> 1.3.9a
>   postfix: upgrade 3.10.8 -> 3.10.9
>   nftables: improve reproducibility
>
> Zhang Xiao (1):
>   python3-aspectlib: Fix pytest compatibility
>
>  meta-gnome/recipes-gnome/eog/eog_49.3.bb      |   2 +
>  .../files/0001-Fix-build-with-musl.patch      |  50 +++
>  ...kedefs-Account-for-linux-7.x-version.patch |  47 +++
>  .../{postfix_3.10.8.bb =3D> postfix_3.10.9.bb}  |   4 +-
>  .../{proftpd_1.3.9.bb =3D> proftpd_1.3.9a.bb}   |   4 +-
>  .../libcoap/libcoap_4.3.5b.bb                 |   1 +
>  ...URCE_DATE_EPOCH-for-build-time-stamp.patch |  41 ++
>  .../recipes-filter/nftables/nftables_1.1.6.bb |   1 +
>  .../znc/{znc_1.10.1.bb =3D> znc_1.10.2.bb}      |   2 +-
>  ...trongswan_6.0.5.bb =3D> strongswan_6.0.6.bb} |   2 +-
>  meta-oe/recipes-connectivity/iwd/iwd_3.12.bb  |   1 +
>  .../cryptsetup/cryptsetup_2.8.6.bb            |   2 +-
>  ...akage-when-compiled-with-C-17-1668-1.patch | 368 ++++++++++++++++++
>  .../recipes-devtools/jsoncpp/jsoncpp_1.9.7.bb |   1 +
>  .../{valkey_9.0.3.bb =3D> valkey_9.0.4.bb}      |   2 +-
>  .../{kmscon_9.3.3.bb =3D> kmscon_9.3.5.bb}      |   2 +-
>  .../{libtsm_4.4.3.bb =3D> libtsm_4.5.0.bb}      |   2 +-
>  ...blewrap_0.11.1.bb =3D> bubblewrap_0.11.2.bb} |   2 +-
>  ...astfetch_2.61.0.bb =3D> fastfetch_2.62.1.bb} |   2 +-
>  .../{hunspell_1.7.2.bb =3D> hunspell_1.7.3.bb}  |   4 +-
>  ...ck_7.1.2-19.bb =3D> imagemagick_7.1.2-21.bb} |   2 +-
>  ...-Fix-i686-build-failures-in-cipher.c.patch |  62 +++
>  .../pkcs11-provider/pkcs11-provider_1.2.bb    |   1 +
>  .../thin-provisioning-tools_1.3.1.bb          |   4 +-
>  ...ers_7.2.6.bb =3D> vboxguestdrivers_7.2.8.bb} |   2 +-
>  .../webkitgtk/webkitgtk3_2.50.6.bb            |   4 +
>  ....1800.bb =3D> libauthen-sasl-perl_2.2000.bb} |   2 +-
>  ...-aspectlib-backport-fix-for-selftest.patch |  37 ++
>  .../python/python3-aspectlib_2.0.0.bb         |   1 +
>  ...json_5.12.0.bb =3D> python3-ujson_5.12.1.bb} |   2 +-
>  .../python-blivet/python3-blivet_3.13.2.bb    |   2 +-
>  .../{apache2_2.4.66.bb =3D> apache2_2.4.67.bb}  |   2 +-
>  .../{orage_4.20.2.bb =3D> orage_4.20.3.bb}      |   2 +-
>  ...fdesktop_4.20.1.bb =3D> xfdesktop_4.20.2.bb} |   2 +-
>  34 files changed, 642 insertions(+), 23 deletions(-)
>  create mode 100644
> meta-networking/recipes-daemons/postfix/files/0001-Fix-build-with-musl.pa=
tch
>  create mode 100644
> meta-networking/recipes-daemons/postfix/files/0001-makedefs-Account-for-l=
inux-7.x-version.patch
>  rename meta-networking/recipes-daemons/postfix/{postfix_3.10.8.bb =3D>
> postfix_3.10.9.bb} (98%)
>  rename meta-networking/recipes-daemons/proftpd/{proftpd_1.3.9.bb =3D>
> proftpd_1.3.9a.bb} (98%)
>  create mode 100644
> meta-networking/recipes-filter/nftables/nftables/0001-build-support-SOURC=
E_DATE_EPOCH-for-build-time-stamp.patch
>  rename meta-networking/recipes-irc/znc/{znc_1.10.1.bb =3D> znc_1.10.2.bb=
}
> (94%)
>  rename meta-networking/recipes-support/strongswan/{strongswan_6.0.5.bb
> =3D> strongswan_6.0.6.bb} (99%)
>  create mode 100644
> meta-oe/recipes-devtools/jsoncpp/jsoncpp/0001-Fix-C-11-ABI-breakage-when-=
compiled-with-C-17-1668-1.patch
>  rename meta-oe/recipes-extended/valkey/{valkey_9.0.3.bb =3D>
> valkey_9.0.4.bb} (98%)
>  rename meta-oe/recipes-graphics/kmscon/{kmscon_9.3.3.bb =3D>
> kmscon_9.3.5.bb} (97%)
>  rename meta-oe/recipes-graphics/libtsm/{libtsm_4.4.3.bb =3D>
> libtsm_4.5.0.bb} (95%)
>  rename meta-oe/recipes-security/bubblewrap/{bubblewrap_0.11.1.bb =3D>
> bubblewrap_0.11.2.bb} (90%)
>  rename meta-oe/recipes-support/fastfetch/{fastfetch_2.61.0.bb =3D>
> fastfetch_2.62.1.bb} (98%)
>  rename meta-oe/recipes-support/hunspell/{hunspell_1.7.2.bb =3D>
> hunspell_1.7.3.bb} (89%)
>  rename meta-oe/recipes-support/imagemagick/{imagemagick_7.1.2-19.bb =3D>
> imagemagick_7.1.2-21.bb} (99%)
>  create mode 100644
> meta-oe/recipes-support/pkcs11-provider/files/0001-Fix-i686-build-failure=
s-in-cipher.c.patch
>  rename meta-oe/recipes-support/vboxguestdrivers/{
> vboxguestdrivers_7.2.6.bb =3D> vboxguestdrivers_7.2.8.bb} (97%)
>  rename meta-perl/recipes-perl/libauthen/{libauthen-sasl-perl_2.1800.bb
> =3D> libauthen-sasl-perl_2.2000.bb} (92%)
>  create mode 100644
> meta-python/recipes-devtools/python/python3-aspectlib/0001-python3-aspect=
lib-backport-fix-for-selftest.patch
>  rename meta-python/recipes-devtools/python/{python3-ujson_5.12.0.bb =3D>
> python3-ujson_5.12.1.bb} (88%)
>  rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.66.bb =3D>
> apache2_2.4.67.bb} (99%)
>  rename meta-xfce/recipes-apps/orage/{orage_4.20.2.bb =3D> orage_4.20.3.b=
b}
> (88%)
>  rename meta-xfce/recipes-xfce/xfdesktop/{xfdesktop_4.20.1.bb =3D>
> xfdesktop_4.20.2.bb} (88%)
>
> --
> 2.53.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#127013):
> https://lists.openembedded.org/g/openembedded-devel/message/127013
> Mute This Topic: https://lists.openembedded.org/mt/119355181/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000029d82406524ba001
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Installed now. Thanks Anuj.</div><br><div class=3D"gmail_q=
uote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, M=
ay 17, 2026 at 1:24=E2=80=AFAM Anuj Mittal via <a href=3D"http://lists.open=
embedded.org">lists.openembedded.org</a> &lt;anuj.mittal=3D<a href=3D"mailt=
o:oss.qualcomm.com@lists.openembedded.org">oss.qualcomm.com@lists.openembed=
ded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">Includes some build and CVE fixes and some upgrades that included on=
ly bug fixes.<br>
<br>
Tested locally and on autobuilder.<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/buil=
ds/1526" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproj=
ect.org/valkyrie/#/builders/81/builds/1526</a><br>
<br>
The following changes since commit 420222862f5a6d95023b8f5f3b7e1808b2264ef9=
:<br>
<br>
=C2=A0 networkmanager: re-implement the vala detection (2026-04-24 18:39:52=
 -0700)<br>
<br>
are available in the Git repository at:<br>
<br>
=C2=A0 <a href=3D"https://git.openembedded.org/meta-openembedded-contrib" r=
el=3D"noreferrer" target=3D"_blank">https://git.openembedded.org/meta-opene=
mbedded-contrib</a> anujm/wrynose<br>
=C2=A0 <a href=3D"https://git.openembedded.org/meta-openembedded-contrib/lo=
g/?h=3Danujm/wrynose" rel=3D"noreferrer" target=3D"_blank">https://git.open=
embedded.org/meta-openembedded-contrib/log/?h=3Danujm/wrynose</a><br>
<br>
for you to fetch changes up to 9af4488d46cb4fd4c0d2d64820c86225ebd6ac71:<br=
>
<br>
=C2=A0 libtsm: upgrade 4.4.3 -&gt; 4.5.0 (2026-05-17 11:52:30 +0530)<br>
<br>
----------------------------------------------------------------<br>
<br>
Adam Duskett (1):<br>
=C2=A0 kmscon: upgrade 9.3.3 -&gt; 9.3.5<br>
<br>
Changqing Li (1):<br>
=C2=A0 postfix: make it can compile with linux 7.x<br>
<br>
Ernest Van Hoecke (1):<br>
=C2=A0 jsoncpp: Fix C++11 ABI breakage when compiled with C++17<br>
<br>
Fabian Pflug (1):<br>
=C2=A0 pkcs11-provider: fix build error on 32 bit systems<br>
<br>
Gianfranco Costamagna (1):<br>
=C2=A0 vboxguestdrivers: Upgrade to 7.2.8<br>
<br>
Gyorgy Sarvari (1):<br>
=C2=A0 libcoap: mark CVE-2026-29013 patched<br>
<br>
Hongxu Jia (1):<br>
=C2=A0 thin-provisioning-tools: fix compile failure on 32bit BSPs<br>
<br>
Jason Schonberg (2):<br>
=C2=A0 xfdesktop: upgrade 4.20.1 -&gt; 4.20.2<br>
=C2=A0 orage: upgrade 4.20.2 -&gt; 4.20.3<br>
<br>
Jiaying Song (1):<br>
=C2=A0 python3-blivet: switch from setuptools3_legacy to<br>
=C2=A0 =C2=A0 python_setuptools_build_meta<br>
<br>
Liu Yiding (1):<br>
=C2=A0 eog: Add HOMEPAGE<br>
<br>
Liyin Zhang (1):<br>
=C2=A0 apache2: upgrade 2.4.66 -&gt; 2.4.67<br>
<br>
Peter Marko (1):<br>
=C2=A0 cryptsetup: update udev package config<br>
<br>
Ross Burton (1):<br>
=C2=A0 iwd: depend on the regulatory database<br>
<br>
Wang Mingyu (10):<br>
=C2=A0 bubblewrap: upgrade 0.11.1 -&gt; 0.11.2<br>
=C2=A0 fastfetch: upgrade 2.61.0 -&gt; 2.62.1<br>
=C2=A0 imagemagick: upgrade 7.1.2-19 -&gt; 7.1.2-21<br>
=C2=A0 strongswan: upgrade 6.0.5 -&gt; 6.0.6<br>
=C2=A0 valkey: upgrade 9.0.3 -&gt; 9.0.4<br>
=C2=A0 libauthen-sasl-perl: upgrade 2.1800 -&gt; 2.2000<br>
=C2=A0 hunspell: upgrade 1.7.2 -&gt; 1.7.3<br>
=C2=A0 znc: upgrade 1.10.1 -&gt; 1.10.2<br>
=C2=A0 python3-ujson: upgrade 5.12.0 -&gt; 5.12.1<br>
=C2=A0 libtsm: upgrade 4.4.3 -&gt; 4.5.0<br>
<br>
Yi Zhao (4):<br>
=C2=A0 webkitgtk3: fix build on riscv64<br>
=C2=A0 proftpd: upgrade 1.3.9 -&gt; 1.3.9a<br>
=C2=A0 postfix: upgrade 3.10.8 -&gt; 3.10.9<br>
=C2=A0 nftables: improve reproducibility<br>
<br>
Zhang Xiao (1):<br>
=C2=A0 python3-aspectlib: Fix pytest compatibility<br>
<br>
=C2=A0meta-gnome/recipes-gnome/eog/<a href=3D"http://eog_49.3.bb" rel=3D"no=
referrer" target=3D"_blank">eog_49.3.bb</a>=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=
=A02 +<br>
=C2=A0.../files/0001-Fix-build-with-musl.patch=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
50 +++<br>
=C2=A0...kedefs-Account-for-linux-7.x-version.patch |=C2=A0 47 +++<br>
=C2=A0.../{<a href=3D"http://postfix_3.10.8.bb" rel=3D"noreferrer" target=
=3D"_blank">postfix_3.10.8.bb</a> =3D&gt; <a href=3D"http://postfix_3.10.9.=
bb" rel=3D"noreferrer" target=3D"_blank">postfix_3.10.9.bb</a>}=C2=A0 |=C2=
=A0 =C2=A04 +-<br>
=C2=A0.../{<a href=3D"http://proftpd_1.3.9.bb" rel=3D"noreferrer" target=3D=
"_blank">proftpd_1.3.9.bb</a> =3D&gt; <a href=3D"http://proftpd_1.3.9a.bb" =
rel=3D"noreferrer" target=3D"_blank">proftpd_1.3.9a.bb</a>}=C2=A0 =C2=A0|=
=C2=A0 =C2=A04 +-<br>
=C2=A0.../libcoap/<a href=3D"http://libcoap_4.3.5b.bb" rel=3D"noreferrer" t=
arget=3D"_blank">libcoap_4.3.5b.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
=C2=A0...URCE_DATE_EPOCH-for-build-time-stamp.patch |=C2=A0 41 ++<br>
=C2=A0.../recipes-filter/nftables/<a href=3D"http://nftables_1.1.6.bb" rel=
=3D"noreferrer" target=3D"_blank">nftables_1.1.6.bb</a> |=C2=A0 =C2=A01 +<b=
r>
=C2=A0.../znc/{<a href=3D"http://znc_1.10.1.bb" rel=3D"noreferrer" target=
=3D"_blank">znc_1.10.1.bb</a> =3D&gt; <a href=3D"http://znc_1.10.2.bb" rel=
=3D"noreferrer" target=3D"_blank">znc_1.10.2.bb</a>}=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A02 +-<br>
=C2=A0...<a href=3D"http://trongswan_6.0.5.bb" rel=3D"noreferrer" target=3D=
"_blank">trongswan_6.0.5.bb</a> =3D&gt; <a href=3D"http://strongswan_6.0.6.=
bb" rel=3D"noreferrer" target=3D"_blank">strongswan_6.0.6.bb</a>} |=C2=A0 =
=C2=A02 +-<br>
=C2=A0meta-oe/recipes-connectivity/iwd/<a href=3D"http://iwd_3.12.bb" rel=
=3D"noreferrer" target=3D"_blank">iwd_3.12.bb</a>=C2=A0 |=C2=A0 =C2=A01 +<b=
r>
=C2=A0.../cryptsetup/<a href=3D"http://cryptsetup_2.8.6.bb" rel=3D"noreferr=
er" target=3D"_blank">cryptsetup_2.8.6.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0...akage-when-compiled-with-C-17-1668-1.patch | 368 +++++++++++++++++=
+<br>
=C2=A0.../recipes-devtools/jsoncpp/<a href=3D"http://jsoncpp_1.9.7.bb" rel=
=3D"noreferrer" target=3D"_blank">jsoncpp_1.9.7.bb</a> |=C2=A0 =C2=A01 +<br=
>
=C2=A0.../{<a href=3D"http://valkey_9.0.3.bb" rel=3D"noreferrer" target=3D"=
_blank">valkey_9.0.3.bb</a> =3D&gt; <a href=3D"http://valkey_9.0.4.bb" rel=
=3D"noreferrer" target=3D"_blank">valkey_9.0.4.bb</a>}=C2=A0 =C2=A0 =C2=A0 =
|=C2=A0 =C2=A02 +-<br>
=C2=A0.../{<a href=3D"http://kmscon_9.3.3.bb" rel=3D"noreferrer" target=3D"=
_blank">kmscon_9.3.3.bb</a> =3D&gt; <a href=3D"http://kmscon_9.3.5.bb" rel=
=3D"noreferrer" target=3D"_blank">kmscon_9.3.5.bb</a>}=C2=A0 =C2=A0 =C2=A0 =
|=C2=A0 =C2=A02 +-<br>
=C2=A0.../{<a href=3D"http://libtsm_4.4.3.bb" rel=3D"noreferrer" target=3D"=
_blank">libtsm_4.4.3.bb</a> =3D&gt; <a href=3D"http://libtsm_4.5.0.bb" rel=
=3D"noreferrer" target=3D"_blank">libtsm_4.5.0.bb</a>}=C2=A0 =C2=A0 =C2=A0 =
|=C2=A0 =C2=A02 +-<br>
=C2=A0...<a href=3D"http://blewrap_0.11.1.bb" rel=3D"noreferrer" target=3D"=
_blank">blewrap_0.11.1.bb</a> =3D&gt; <a href=3D"http://bubblewrap_0.11.2.b=
b" rel=3D"noreferrer" target=3D"_blank">bubblewrap_0.11.2.bb</a>} |=C2=A0 =
=C2=A02 +-<br>
=C2=A0...<a href=3D"http://astfetch_2.61.0.bb" rel=3D"noreferrer" target=3D=
"_blank">astfetch_2.61.0.bb</a> =3D&gt; <a href=3D"http://fastfetch_2.62.1.=
bb" rel=3D"noreferrer" target=3D"_blank">fastfetch_2.62.1.bb</a>} |=C2=A0 =
=C2=A02 +-<br>
=C2=A0.../{<a href=3D"http://hunspell_1.7.2.bb" rel=3D"noreferrer" target=
=3D"_blank">hunspell_1.7.2.bb</a> =3D&gt; <a href=3D"http://hunspell_1.7.3.=
bb" rel=3D"noreferrer" target=3D"_blank">hunspell_1.7.3.bb</a>}=C2=A0 |=C2=
=A0 =C2=A04 +-<br>
=C2=A0...<a href=3D"http://ck_7.1.2-19.bb" rel=3D"noreferrer" target=3D"_bl=
ank">ck_7.1.2-19.bb</a> =3D&gt; <a href=3D"http://imagemagick_7.1.2-21.bb" =
rel=3D"noreferrer" target=3D"_blank">imagemagick_7.1.2-21.bb</a>} |=C2=A0 =
=C2=A02 +-<br>
=C2=A0...-Fix-i686-build-failures-in-cipher.c.patch |=C2=A0 62 +++<br>
=C2=A0.../pkcs11-provider/<a href=3D"http://pkcs11-provider_1.2.bb" rel=3D"=
noreferrer" target=3D"_blank">pkcs11-provider_1.2.bb</a>=C2=A0 =C2=A0 |=C2=
=A0 =C2=A01 +<br>
=C2=A0.../<a href=3D"http://thin-provisioning-tools_1.3.1.bb" rel=3D"norefe=
rrer" target=3D"_blank">thin-provisioning-tools_1.3.1.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A04 +-<br>
=C2=A0...<a href=3D"http://ers_7.2.6.bb" rel=3D"noreferrer" target=3D"_blan=
k">ers_7.2.6.bb</a> =3D&gt; <a href=3D"http://vboxguestdrivers_7.2.8.bb" re=
l=3D"noreferrer" target=3D"_blank">vboxguestdrivers_7.2.8.bb</a>} |=C2=A0 =
=C2=A02 +-<br>
=C2=A0.../webkitgtk/<a href=3D"http://webkitgtk3_2.50.6.bb" rel=3D"noreferr=
er" target=3D"_blank">webkitgtk3_2.50.6.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A04 +<br>
=C2=A0....<a href=3D"http://1800.bb" rel=3D"noreferrer" target=3D"_blank">1=
800.bb</a> =3D&gt; <a href=3D"http://libauthen-sasl-perl_2.2000.bb" rel=3D"=
noreferrer" target=3D"_blank">libauthen-sasl-perl_2.2000.bb</a>} |=C2=A0 =
=C2=A02 +-<br>
=C2=A0...-aspectlib-backport-fix-for-selftest.patch |=C2=A0 37 ++<br>
=C2=A0.../python/<a href=3D"http://python3-aspectlib_2.0.0.bb" rel=3D"noref=
errer" target=3D"_blank">python3-aspectlib_2.0.0.bb</a>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
=C2=A0...<a href=3D"http://json_5.12.0.bb" rel=3D"noreferrer" target=3D"_bl=
ank">json_5.12.0.bb</a> =3D&gt; <a href=3D"http://python3-ujson_5.12.1.bb" =
rel=3D"noreferrer" target=3D"_blank">python3-ujson_5.12.1.bb</a>} |=C2=A0 =
=C2=A02 +-<br>
=C2=A0.../python-blivet/<a href=3D"http://python3-blivet_3.13.2.bb" rel=3D"=
noreferrer" target=3D"_blank">python3-blivet_3.13.2.bb</a>=C2=A0 =C2=A0 |=
=C2=A0 =C2=A02 +-<br>
=C2=A0.../{<a href=3D"http://apache2_2.4.66.bb" rel=3D"noreferrer" target=
=3D"_blank">apache2_2.4.66.bb</a> =3D&gt; <a href=3D"http://apache2_2.4.67.=
bb" rel=3D"noreferrer" target=3D"_blank">apache2_2.4.67.bb</a>}=C2=A0 |=C2=
=A0 =C2=A02 +-<br>
=C2=A0.../{<a href=3D"http://orage_4.20.2.bb" rel=3D"noreferrer" target=3D"=
_blank">orage_4.20.2.bb</a> =3D&gt; <a href=3D"http://orage_4.20.3.bb" rel=
=3D"noreferrer" target=3D"_blank">orage_4.20.3.bb</a>}=C2=A0 =C2=A0 =C2=A0 =
|=C2=A0 =C2=A02 +-<br>
=C2=A0...<a href=3D"http://fdesktop_4.20.1.bb" rel=3D"noreferrer" target=3D=
"_blank">fdesktop_4.20.1.bb</a> =3D&gt; <a href=3D"http://xfdesktop_4.20.2.=
bb" rel=3D"noreferrer" target=3D"_blank">xfdesktop_4.20.2.bb</a>} |=C2=A0 =
=C2=A02 +-<br>
=C2=A034 files changed, 642 insertions(+), 23 deletions(-)<br>
=C2=A0create mode 100644 meta-networking/recipes-daemons/postfix/files/0001=
-Fix-build-with-musl.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-daemons/postfix/files/0001=
-makedefs-Account-for-linux-7.x-version.patch<br>
=C2=A0rename meta-networking/recipes-daemons/postfix/{<a href=3D"http://pos=
tfix_3.10.8.bb" rel=3D"noreferrer" target=3D"_blank">postfix_3.10.8.bb</a> =
=3D&gt; <a href=3D"http://postfix_3.10.9.bb" rel=3D"noreferrer" target=3D"_=
blank">postfix_3.10.9.bb</a>} (98%)<br>
=C2=A0rename meta-networking/recipes-daemons/proftpd/{<a href=3D"http://pro=
ftpd_1.3.9.bb" rel=3D"noreferrer" target=3D"_blank">proftpd_1.3.9.bb</a> =
=3D&gt; <a href=3D"http://proftpd_1.3.9a.bb" rel=3D"noreferrer" target=3D"_=
blank">proftpd_1.3.9a.bb</a>} (98%)<br>
=C2=A0create mode 100644 meta-networking/recipes-filter/nftables/nftables/0=
001-build-support-SOURCE_DATE_EPOCH-for-build-time-stamp.patch<br>
=C2=A0rename meta-networking/recipes-irc/znc/{<a href=3D"http://znc_1.10.1.=
bb" rel=3D"noreferrer" target=3D"_blank">znc_1.10.1.bb</a> =3D&gt; <a href=
=3D"http://znc_1.10.2.bb" rel=3D"noreferrer" target=3D"_blank">znc_1.10.2.b=
b</a>} (94%)<br>
=C2=A0rename meta-networking/recipes-support/strongswan/{<a href=3D"http://=
strongswan_6.0.5.bb" rel=3D"noreferrer" target=3D"_blank">strongswan_6.0.5.=
bb</a> =3D&gt; <a href=3D"http://strongswan_6.0.6.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">strongswan_6.0.6.bb</a>} (99%)<br>
=C2=A0create mode 100644 meta-oe/recipes-devtools/jsoncpp/jsoncpp/0001-Fix-=
C-11-ABI-breakage-when-compiled-with-C-17-1668-1.patch<br>
=C2=A0rename meta-oe/recipes-extended/valkey/{<a href=3D"http://valkey_9.0.=
3.bb" rel=3D"noreferrer" target=3D"_blank">valkey_9.0.3.bb</a> =3D&gt; <a h=
ref=3D"http://valkey_9.0.4.bb" rel=3D"noreferrer" target=3D"_blank">valkey_=
9.0.4.bb</a>} (98%)<br>
=C2=A0rename meta-oe/recipes-graphics/kmscon/{<a href=3D"http://kmscon_9.3.=
3.bb" rel=3D"noreferrer" target=3D"_blank">kmscon_9.3.3.bb</a> =3D&gt; <a h=
ref=3D"http://kmscon_9.3.5.bb" rel=3D"noreferrer" target=3D"_blank">kmscon_=
9.3.5.bb</a>} (97%)<br>
=C2=A0rename meta-oe/recipes-graphics/libtsm/{<a href=3D"http://libtsm_4.4.=
3.bb" rel=3D"noreferrer" target=3D"_blank">libtsm_4.4.3.bb</a> =3D&gt; <a h=
ref=3D"http://libtsm_4.5.0.bb" rel=3D"noreferrer" target=3D"_blank">libtsm_=
4.5.0.bb</a>} (95%)<br>
=C2=A0rename meta-oe/recipes-security/bubblewrap/{<a href=3D"http://bubblew=
rap_0.11.1.bb" rel=3D"noreferrer" target=3D"_blank">bubblewrap_0.11.1.bb</a=
> =3D&gt; <a href=3D"http://bubblewrap_0.11.2.bb" rel=3D"noreferrer" target=
=3D"_blank">bubblewrap_0.11.2.bb</a>} (90%)<br>
=C2=A0rename meta-oe/recipes-support/fastfetch/{<a href=3D"http://fastfetch=
_2.61.0.bb" rel=3D"noreferrer" target=3D"_blank">fastfetch_2.61.0.bb</a> =
=3D&gt; <a href=3D"http://fastfetch_2.62.1.bb" rel=3D"noreferrer" target=3D=
"_blank">fastfetch_2.62.1.bb</a>} (98%)<br>
=C2=A0rename meta-oe/recipes-support/hunspell/{<a href=3D"http://hunspell_1=
.7.2.bb" rel=3D"noreferrer" target=3D"_blank">hunspell_1.7.2.bb</a> =3D&gt;=
 <a href=3D"http://hunspell_1.7.3.bb" rel=3D"noreferrer" target=3D"_blank">=
hunspell_1.7.3.bb</a>} (89%)<br>
=C2=A0rename meta-oe/recipes-support/imagemagick/{<a href=3D"http://imagema=
gick_7.1.2-19.bb" rel=3D"noreferrer" target=3D"_blank">imagemagick_7.1.2-19=
.bb</a> =3D&gt; <a href=3D"http://imagemagick_7.1.2-21.bb" rel=3D"noreferre=
r" target=3D"_blank">imagemagick_7.1.2-21.bb</a>} (99%)<br>
=C2=A0create mode 100644 meta-oe/recipes-support/pkcs11-provider/files/0001=
-Fix-i686-build-failures-in-cipher.c.patch<br>
=C2=A0rename meta-oe/recipes-support/vboxguestdrivers/{<a href=3D"http://vb=
oxguestdrivers_7.2.6.bb" rel=3D"noreferrer" target=3D"_blank">vboxguestdriv=
ers_7.2.6.bb</a> =3D&gt; <a href=3D"http://vboxguestdrivers_7.2.8.bb" rel=
=3D"noreferrer" target=3D"_blank">vboxguestdrivers_7.2.8.bb</a>} (97%)<br>
=C2=A0rename meta-perl/recipes-perl/libauthen/{<a href=3D"http://libauthen-=
sasl-perl_2.1800.bb" rel=3D"noreferrer" target=3D"_blank">libauthen-sasl-pe=
rl_2.1800.bb</a> =3D&gt; <a href=3D"http://libauthen-sasl-perl_2.2000.bb" r=
el=3D"noreferrer" target=3D"_blank">libauthen-sasl-perl_2.2000.bb</a>} (92%=
)<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-aspect=
lib/0001-python3-aspectlib-backport-fix-for-selftest.patch<br>
=C2=A0rename meta-python/recipes-devtools/python/{<a href=3D"http://python3=
-ujson_5.12.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-ujson_5.12.0=
.bb</a> =3D&gt; <a href=3D"http://python3-ujson_5.12.1.bb" rel=3D"noreferre=
r" target=3D"_blank">python3-ujson_5.12.1.bb</a>} (88%)<br>
=C2=A0rename meta-webserver/recipes-httpd/apache2/{<a href=3D"http://apache=
2_2.4.66.bb" rel=3D"noreferrer" target=3D"_blank">apache2_2.4.66.bb</a> =3D=
&gt; <a href=3D"http://apache2_2.4.67.bb" rel=3D"noreferrer" target=3D"_bla=
nk">apache2_2.4.67.bb</a>} (99%)<br>
=C2=A0rename meta-xfce/recipes-apps/orage/{<a href=3D"http://orage_4.20.2.b=
b" rel=3D"noreferrer" target=3D"_blank">orage_4.20.2.bb</a> =3D&gt; <a href=
=3D"http://orage_4.20.3.bb" rel=3D"noreferrer" target=3D"_blank">orage_4.20=
.3.bb</a>} (88%)<br>
=C2=A0rename meta-xfce/recipes-xfce/xfdesktop/{<a href=3D"http://xfdesktop_=
4.20.1.bb" rel=3D"noreferrer" target=3D"_blank">xfdesktop_4.20.1.bb</a> =3D=
&gt; <a href=3D"http://xfdesktop_4.20.2.bb" rel=3D"noreferrer" target=3D"_b=
lank">xfdesktop_4.20.2.bb</a>} (88%)<br>
<br>
-- <br>
2.53.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#127013): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/127013" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/127013</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/119355181/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/119355181/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--00000000000029d82406524ba001--

