Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A0A4C43327
	for <webhook@archiver.kernel.org>; Fri, 26 Jun 2026 14:58:47 +0000 (UTC)
Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36965.1782485922431044911
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Jun 2026 07:58:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=JdkICCnq;
 spf=pass (domain: gmail.com, ip: 74.125.224.50, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-664a10cd4a4so802720d50.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 26 Jun 2026 07:58:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782485921; cv=none;
        d=google.com; s=arc-20260327;
        b=ruoBaaIe13LOiE14u7DzoIKXvBSthgFsa0NZtiSOeUGFLKbslV56MPoIUEC3McBQ3Z
         c2pTwTLDcO8p4YlB+3aw2Hi2zQhxX4vVAcYGVrF0sgLJ8wBBD5k/OARFru6fVbfRxmJc
         3vur16/jqDyzRXkc/3foWEhRI5PZJgYhX2LIyT6CIvsbZ1Ht5fqDgVaYqySzL6lVvbKf
         U5VmFwoyEwxojCd+ax2g72l7QNDo5dqUq6BC4bihGbUgFA1ndrkIRfsk/2PM5U6s2vlm
         DpVjLTLKPAG9D6yq4W7q7DCNXsCFYLKy5KRgdwQJtD05kUHdCl/Kq+Syxtif6bDEoR1L
         TadA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=2jFD4IzxV+DQ5pDGUS+K4QRwDBn6cvT7g8PwCVE3D5M=;
        fh=LZspYXC3IzyIN8FmVwz229n7pZIWt1HqVNc3WYXGu+o=;
        b=SAAPa2uTeOpTfjE3S1CuB4oZwbJhXcecDSq13iZaXL+UoXTEAgSIdbCaFZ8sMHy5hq
         3ArRtA+L/Hb0SdapXsr+hsIo2aQXSKWtb+kcgCU91wYQ46X1MgMVQn/Of+9Yio8PseZ2
         QkVv8AGg1GDE3nE0XVvRUKeECRrhzuTYdk7d6LD7TkiKVP+Rjf28tekPpjpiaKQz/mmo
         jEJ8r2etjMi0emHzIfpvT3DaDqndfNMFHUta+OajzH9jEjg1nF9JMgQcOrzMdOpdgY3J
         PdYvARMB4UXjD3GmUeg0UWRyFiE+0sKOBfJlxIH0RjsxShu/Pb2kU6z3xq50WEtMNEvt
         7p5Q==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782485921; x=1783090721; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2jFD4IzxV+DQ5pDGUS+K4QRwDBn6cvT7g8PwCVE3D5M=;
        b=JdkICCnqGL5d6CQBIrd3ZrVjGRGvM4Nrv/shmESn/+ASToMDZyr9U5Dit7UTJhKQ9S
         5PElmDWQzpxpL/LauJ8Ecz3DUbS6n0oJkuvw+kCnlHuoVn8sYOW8CGUGDJhoH7e2XbV5
         NbxxVUgxISiW0S3qGJEhctY+MtgKYWF0xcc17D9pdVVfztJ/bHeQXBjytGWQpYXF6/kc
         FKHZDxJd0/3rLsEd99o6mWiEEKLqXdz3M6PMkWmzUqNUxSFmHd7nd9J7xdfKxsKNcFsJ
         kb/CLkvMT4KJSOLsIq4VpHp/KjSp5B9N12uiEKYqjEsJnoPR7yNvuCO/bjQRihqnMx7P
         N4og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782485921; x=1783090721;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2jFD4IzxV+DQ5pDGUS+K4QRwDBn6cvT7g8PwCVE3D5M=;
        b=eiaWJp2RqDsZZHvGBe+TNfqmjfvTwf499UM0xuHb/p73uFPd4u7iOMpgmDJXieXVeL
         qsYg1kFAb6TNi3YN3pLGj9PXlE8LLeCk9q1JD04ijxfDIo7qItTeMfY1RqRl6V1D36RG
         FLOBJ+Ov2n0SBHR8UbbkVCv8zt8ACK3npTv11mgl8zpxospNhu6dZYVucPoYADqKQEEh
         tvn6IjeiTrrcvgI6twN3zHqbx82uQvbLtoRyWF/jB03S2mIfScoY1LfcpDLGKVWFUfDn
         iFtljzyqQlP0Y/WRV/5NRBdTrZUJF/WM9OX731dPVKKn7VBI+HDJU2xK5BDMAEg1Q2KA
         TwQQ==
X-Gm-Message-State: AOJu0YxURQDjdNwTFBWx3GxMp7umKek5rKa08p4932Y0q5GrHvqqnhx9
	glc2G7GLLd4Gz2+jACfsL5UmPXohTeYV91yykgqANqEvp9Y1Vy+/uTGBZ81NHrGUhuG9RGXpFur
	BqO222ELWE4P5jqkmKYxUC5IleTl1O5yiEfRdfNoNhQ==
X-Gm-Gg: AfdE7cm0Pikf0HK+g12fRARqUboQdBdd+TxgU7hjgusSGM0WSuAdWAVrSYi3Y6TxLJU
	h+xF9sq4vkKoUfk22XxFAs524RIHfnuO/D3nAliPM6JF22pOyMRtZdVCzMaNJ5ga18ai7aDy1W7
	V3cvSHE1b+Zjz/ejY9fvB79ONZ6w/CwFuc1mCJdrakhlLppss8ti/6wZmV3+r686aAY0Bb3lzUX
	BQVzzcRUDHaSscyaVRNr6A7Iv77S0RsghCNN6wbkTlqVDmzUG6nfsCcRip+7v7kz2VFYFi93gZL
	EHemQCmINQXrBEpYDn+z+rlYGu/mqgooU+V/cp95x5rSsXFRv0vT8yG4LAD1zRz0gZEIdoNXxRU
	hTOYzVXS7mx4eyuHvGykYsO41U7ha48OfW0JnmPcbnd8UHCdAgwERC/cbYX/acwLDEq2TLQ==
X-Received: by 2002:a05:690e:150b:b0:660:e35e:ac09 with SMTP id
 956f58d0204a3-66487c136ebmr5378046d50.8.1782485921315; Fri, 26 Jun 2026
 07:58:41 -0700 (PDT)
MIME-Version: 1.0
References: <20260626141317.56506-1-f_l_k@t-online.de>
In-Reply-To: <20260626141317.56506-1-f_l_k@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 26 Jun 2026 07:58:15 -0700
X-Gm-Features: AVVi8CcZ8zF3StMYklHrfuWCGiTZMCn__br-f4e6fSrwZXbW9vIVqk3N0hINbb0
Message-ID: <CAMKF1srcJ1VtroyUtKz72db5vDTSQk97HY=9Rs1La8pm9vqAow@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCHv2] flatpak: update 1.17.6 -> 1.18.0
To: f_l_k@t-online.de
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000028408a065529580a"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 26 Jun 2026 14:58:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127798

--00000000000028408a065529580a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

There are some invisible bidi UTF characters in commit message that are
problematic for tools to apply it, Maybe its better to summarize the
changes instead of taking the changelog as it is.

  Checking attestation on all messages, may take a moment...
  ---
    =E2=9C=97 [PATCH v2] flatpak: update 1.17.6 -> 1.18.0
  ---
  WARNING: Message contains suspicious unicode control characters!
           Subject: [meta-oe][PATCHv2] flatpak: update 1.17.6 -> 1.18.0
              Line: * Translation updates: zh_CN (#6671)
              -----------------------------^
              Char: LEFT-TO-RIGHT MARK (0x200e)
           If you are sure about this, rerun with the right flag to allow.

On Fri, Jun 26, 2026 at 7:13=E2=80=AFAM Markus Volk via lists.openembedded.=
org
<f_l_k=3Dt-online.de@lists.openembedded.org> wrote:

> Changes in 1.18.0
> ~~~~~~~~~~~~~~~~~
> Released: 2026-06-08
>
> Enhancements:
>
> * Improve error handling and printed output of `flatpak-coredumpctl`
> (#6649,
>   #6680)
>
> * Support the AMD vendor specific compute interface (`/dev/kfd`) via the
> DRI
>   device permission (#6648)
>
> * Improve the output of `flatpak update` with failure causes (#6657)
>
> * Improve startup time for fish shell integration (#6635)
>
> * Translation updates: =E2=80=8Ezh_CN (#6671)
>
> Bug fixes:
>
> * Fix building when HAVE_LIBSYSTEMD but not USE_SYSTEM_HELPER is defined
> (#6652)
>
> * Ignore system bus failures in parental controls check (#6663)
>
> * Fix some return values and replace deprecated `GTimeVal` with
>   `g_get_real_time()` (#6646)
>
> * Suppress an unused-result warning in the tests (#6655)
>
> Changes in 1.17.7
> ~~~~~~~~~~~~~~~~~~
> Released: 2026-05-06
>
> Enhancements:
>
> * Add the new permission conditionals `has-usb-device` and
> `has-usb-portal` to
>   allow apps to drop --device=3Dall and --device=3Dusb permissions (#6560=
)
>
> * Always send the `Flatpak-Upgrade-From` header when updating instead of
>   freshly installing, to improve the quality of statistics (#6626)
>
> * Improve how the absence of the system repo is handled (#6621)
>
> * Changes to repos are now more atomic which helps to avoid them being in
> an
>   invalid state. This could be observed when importing the GPG key failed=
,
>   because the system clock was wrong. (#6547)
>
> * A function to report the age of the configuration was added to
> libflatpak,
>   which will help GNOME Software to prevent unnecessary work (#6532)
>
> * Improvements to the build system (#6614, #6610)
>
> * Improve various tests (#6604, #6606, #6619, #6617, #6605, #6625)
>
> * Translation updates: tr (#6629), =E2=80=8Ezh_CN (#6630)
>
> Bug fixes:
>
> * Fix a regression in handling of the fallback-x11 permission, which was
>   affecting overrides from Flatseal (#6632)
>
> * Fix a memory leak in the Flatpak portal (#6613)
>
> * Install SELinux configuration files to the right directory (#6622)
>
> * Silence wrong `lseek()` errors when creating sub-sandboxes (#6609)
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  .../flatpak/{flatpak_1.17.6.bb =3D> flatpak_1.18.0.bb}            | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-oe/recipes-extended/flatpak/{flatpak_1.17.6.bb =3D>
> flatpak_1.18.0.bb} (98%)
>
> diff --git a/meta-oe/recipes-extended/flatpak/flatpak_1.17.6.bb
> b/meta-oe/recipes-extended/flatpak/flatpak_1.18.0.bb
> similarity index 98%
> rename from meta-oe/recipes-extended/flatpak/flatpak_1.17.6.bb
> rename to meta-oe/recipes-extended/flatpak/flatpak_1.18.0.bb
> index 1512b7239f..879455f63c 100644
> --- a/meta-oe/recipes-extended/flatpak/flatpak_1.17.6.bb
> +++ b/meta-oe/recipes-extended/flatpak/flatpak_1.18.0.bb
> @@ -8,7 +8,7 @@ SRC_URI =3D " \
>      file://0001-flatpak-pc-add-pc_sysrootdir.patch \
>  "
>
> -SRCREV =3D "9b21874f1a175a9b7c79175a221fa043e202ca73"
> +SRCREV =3D "5de2b58bdafde88515d9d6b9189bd1cfd3b88c46"
>
>
>  inherit meson pkgconfig gettext systemd gtk-doc gobject-introspection
> python3native mime features_check useradd
> --
> 2.54.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#127796):
> https://lists.openembedded.org/g/openembedded-devel/message/127796
> Mute This Topic: https://lists.openembedded.org/mt/119990168/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000028408a065529580a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">There are some invisible bidi UTF characters in commit mes=
sage that are problematic for tools to apply it, Maybe its better to summar=
ize the changes instead of taking the changelog as it is.<div><br></div><di=
v>=C2=A0 Checking attestation on all messages, may take a moment...<br>=C2=
=A0 ---<br>=C2=A0 =C2=A0 =E2=9C=97 [PATCH v2] flatpak: update 1.17.6 -&gt; =
1.18.0<br>=C2=A0 ---<br>=C2=A0 WARNING: Message contains suspicious unicode=
 control characters!<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Subject: [=
meta-oe][PATCHv2] flatpak: update 1.17.6 -&gt; 1.18.0<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Line: * Translation updates: zh_CN (#6671)<=
br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -----------------------=
------^<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Char: LEFT-TO-R=
IGHT MARK (0x200e)<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0If you are s=
ure about this, rerun with the right flag to allow.</div></div><br><div cla=
ss=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_at=
tr">On Fri, Jun 26, 2026 at 7:13=E2=80=AFAM Markus Volk via <a href=3D"http=
://lists.openembedded.org">lists.openembedded.org</a> &lt;f_l_k=3D<a href=
=3D"mailto:t-online.de@lists.openembedded.org">t-online.de@lists.openembedd=
ed.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">Changes in 1.18.0<br>
~~~~~~~~~~~~~~~~~<br>
Released: 2026-06-08<br>
<br>
Enhancements:<br>
<br>
* Improve error handling and printed output of `flatpak-coredumpctl` (#6649=
,<br>
=C2=A0 #6680)<br>
<br>
* Support the AMD vendor specific compute interface (`/dev/kfd`) via the DR=
I<br>
=C2=A0 device permission (#6648)<br>
<br>
* Improve the output of `flatpak update` with failure causes (#6657)<br>
<br>
* Improve startup time for fish shell integration (#6635)<br>
<br>
* Translation updates: =E2=80=8Ezh_CN (#6671)<br>
<br>
Bug fixes:<br>
<br>
* Fix building when HAVE_LIBSYSTEMD but not USE_SYSTEM_HELPER is defined (#=
6652)<br>
<br>
* Ignore system bus failures in parental controls check (#6663)<br>
<br>
* Fix some return values and replace deprecated `GTimeVal` with<br>
=C2=A0 `g_get_real_time()` (#6646)<br>
<br>
* Suppress an unused-result warning in the tests (#6655)<br>
<br>
Changes in 1.17.7<br>
~~~~~~~~~~~~~~~~~~<br>
Released: 2026-05-06<br>
<br>
Enhancements:<br>
<br>
* Add the new permission conditionals `has-usb-device` and `has-usb-portal`=
 to<br>
=C2=A0 allow apps to drop --device=3Dall and --device=3Dusb permissions (#6=
560)<br>
<br>
* Always send the `Flatpak-Upgrade-From` header when updating instead of<br=
>
=C2=A0 freshly installing, to improve the quality of statistics (#6626)<br>
<br>
* Improve how the absence of the system repo is handled (#6621)<br>
<br>
* Changes to repos are now more atomic which helps to avoid them being in a=
n<br>
=C2=A0 invalid state. This could be observed when importing the GPG key fai=
led,<br>
=C2=A0 because the system clock was wrong. (#6547)<br>
<br>
* A function to report the age of the configuration was added to libflatpak=
,<br>
=C2=A0 which will help GNOME Software to prevent unnecessary work (#6532)<b=
r>
<br>
* Improvements to the build system (#6614, #6610)<br>
<br>
* Improve various tests (#6604, #6606, #6619, #6617, #6605, #6625)<br>
<br>
* Translation updates: tr (#6629), =E2=80=8Ezh_CN (#6630)<br>
<br>
Bug fixes:<br>
<br>
* Fix a regression in handling of the fallback-x11 permission, which was<br=
>
=C2=A0 affecting overrides from Flatseal (#6632)<br>
<br>
* Fix a memory leak in the Flatpak portal (#6613)<br>
<br>
* Install SELinux configuration files to the right directory (#6622)<br>
<br>
* Silence wrong `lseek()` errors when creating sub-sandboxes (#6609)<br>
<br>
Signed-off-by: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de" target=
=3D"_blank">f_l_k@t-online.de</a>&gt;<br>
---<br>
=C2=A0.../flatpak/{<a href=3D"http://flatpak_1.17.6.bb" rel=3D"noreferrer" =
target=3D"_blank">flatpak_1.17.6.bb</a> =3D&gt; <a href=3D"http://flatpak_1=
.18.0.bb" rel=3D"noreferrer" target=3D"_blank">flatpak_1.18.0.bb</a>}=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
=C2=A0rename meta-oe/recipes-extended/flatpak/{<a href=3D"http://flatpak_1.=
17.6.bb" rel=3D"noreferrer" target=3D"_blank">flatpak_1.17.6.bb</a> =3D&gt;=
 <a href=3D"http://flatpak_1.18.0.bb" rel=3D"noreferrer" target=3D"_blank">=
flatpak_1.18.0.bb</a>} (98%)<br>
<br>
diff --git a/meta-oe/recipes-extended/flatpak/<a href=3D"http://flatpak_1.1=
7.6.bb" rel=3D"noreferrer" target=3D"_blank">flatpak_1.17.6.bb</a> b/meta-o=
e/recipes-extended/flatpak/<a href=3D"http://flatpak_1.18.0.bb" rel=3D"nore=
ferrer" target=3D"_blank">flatpak_1.18.0.bb</a><br>
similarity index 98%<br>
rename from meta-oe/recipes-extended/flatpak/<a href=3D"http://flatpak_1.17=
.6.bb" rel=3D"noreferrer" target=3D"_blank">flatpak_1.17.6.bb</a><br>
rename to meta-oe/recipes-extended/flatpak/<a href=3D"http://flatpak_1.18.0=
.bb" rel=3D"noreferrer" target=3D"_blank">flatpak_1.18.0.bb</a><br>
index 1512b7239f..879455f63c 100644<br>
--- a/meta-oe/recipes-extended/flatpak/<a href=3D"http://flatpak_1.17.6.bb"=
 rel=3D"noreferrer" target=3D"_blank">flatpak_1.17.6.bb</a><br>
+++ b/meta-oe/recipes-extended/flatpak/<a href=3D"http://flatpak_1.18.0.bb"=
 rel=3D"noreferrer" target=3D"_blank">flatpak_1.18.0.bb</a><br>
@@ -8,7 +8,7 @@ SRC_URI =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0file://0001-flatpak-pc-add-pc_sysrootdir.patch \<br>
=C2=A0&quot;<br>
<br>
-SRCREV =3D &quot;9b21874f1a175a9b7c79175a221fa043e202ca73&quot;<br>
+SRCREV =3D &quot;5de2b58bdafde88515d9d6b9189bd1cfd3b88c46&quot;<br>
<br>
<br>
=C2=A0inherit meson pkgconfig gettext systemd gtk-doc gobject-introspection=
 python3native mime features_check useradd<br>
-- <br>
2.54.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#127796): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/127796" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/127796</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/119990168/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/119990168/1997914</a><br>
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

--00000000000028408a065529580a--

