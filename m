Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFDB8F4613A
	for <webhook@archiver.kernel.org>; Mon, 23 Mar 2026 15:01:46 +0000 (UTC)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19745.1774278099908846310
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Mar 2026 08:01:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jbdL1Anv;
 spf=pass (domain: gmail.com, ip: 209.85.128.176, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-79860421382so35400907b3.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 23 Mar 2026 08:01:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774278099; cv=none;
        d=google.com; s=arc-20240605;
        b=enULtky6WCAuX/FNqsmvkg98GQNoVZjov6I9rYyW6ZU2kmKQYL/ZId4JI0H4Rx9SyA
         Ee30iIDQbsoGSQEHuI7YoWLfDw3osMs9m/Eor0Hw4kNUUqqLckvz3kt/b6akBh6J0SaI
         xhUk1iCzIcRkVuPTwpHIUUib9K3TvyFQGimgYqSCgDQrpfedKUZ45SXbNlgaj+9BLgZV
         i7JSLpDZjAMj2rpG6f6wbILmsCKvPDFf/ESFK+EgctiXcv7pFR95d8qz96PlrS5K9VOn
         Npv2yB9m0oBo2/fC88hVAtbPlmgXQeg86k15mJRahHCNsUI1qaCAmtxaEw+wINHfw+4N
         VFKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ZCoQ4qT5dwxPnc8EZ9zIKGGhErfMhqwqtiBOYJou+Ng=;
        fh=7oI9jBHxrWCncumEnzG8BN56QlQkoa9xJ4TUQ95bJdU=;
        b=QfYtplh3anYPbDSeYmB3ea+pss8tGnqjTXDsxFQ49bTKDm2+bbf6Rs0gMcx6R/0fGN
         lyUNYF+sk+TmCqFPUp7KXViq/0dGZnXOtOvaqYRFG2BNo2m4z4YnsiVo9xrBFc3DbUnx
         QKKsp+Do0JhMxKEKco8+DC5OY7RZAko2U9bduwaQnEyhDYh0/kjovYtFCwiYpQd8vPGD
         4JjD7cc+/I1UPh+e9I5rGPzu7QgbmOdkpfKiW9c2Iw80rDSYruj/8r0gpXe3m3CY2IWz
         1hVmtQGz3KoaGGN9euYbhADqGNDxv6fIxIAq2s7iMy+2sAHydfb7LjWPSYOcyaHCMxuF
         dKQg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774278099; x=1774882899; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZCoQ4qT5dwxPnc8EZ9zIKGGhErfMhqwqtiBOYJou+Ng=;
        b=jbdL1Anv7LCtyom8R+kY0L1oHs7MffxQrFyVYwe6TxOZL1JTAqAMPwBCz19sFfTPZd
         z0XVxe6oDODemqLeMiFKjnJ88jtvdMdJK7Jyv7/LfzfYQWrcBfVFJzQPn3X1hjDom9+l
         eJrSC9oSd39kHwaTn1/ueI49W8tVmHuEklwsCqHeV4ieDadSJI2qDl3zzs8cJUdkTHEi
         xLU2Xze7hPdJmmT8XSjKO139lGA/5thPKmQ+rj62ODhof3Eh1JNecZytIxWYVDgVdCgM
         ANOXqOUDm3RBJWBm+W+ZiNZccXZmzC12ksp8IDqkfrYf5RC5soq4w39hYRzhdaMGgasB
         iCbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774278099; x=1774882899;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZCoQ4qT5dwxPnc8EZ9zIKGGhErfMhqwqtiBOYJou+Ng=;
        b=YtnUZx90gDvJ+NPosqBoJerf9MHktBHxwg9mLOfZy/MjB3kuXdu3JVH7JD/GF+6J8X
         TzPEL4itB5z+YvGaGIFOjakmZBJj+6VOjVOgX9y3aNqyaisC68REwTAOBnzTa2aGLbE9
         0K1DH1VX7YlpwZ6gusI8Q5PC7C4v1aAyY6rQqH5xFIDusm88+5UfP5SqISEAckYC2DpT
         K52llSouW2KeGVxpzdZEKTuNTBSL9Or5ZsQHl8XbRYo7utBdsRlEUgcjOmYhwsAFqLtm
         nr9neQTleZi54XLb+GnwYY9SlQS4R4AnTIaLyyetss1C30pze5mrth18SNUasJI0OaEd
         dtwQ==
X-Gm-Message-State: AOJu0Yx1Mf/OBXHqMJHQnPjOE0A+x7xyIkd7KrLTD2T8HFIzzTGSBtKp
	F8jMs8BnnVoRu/UY8+wcZD7wYpsP/psznX0i8Ua7DqvgLyC/gec6TT9BuNV3plwthW1HBq8VbIF
	dDWBznxrLUHibfKHlwE4f1v7AYzE4Yh/LjQ==
X-Gm-Gg: ATEYQzyhcKvpdyFzX1PJe9zD+AIK+jdjbDVlMGXNojtGU8YVm5rC2vTiAX5X0g07Dgc
	cRZwNCPccE4ipkSblD23HGQgdj3zBdZRJJPu1TwqyLZc71lmn5BjREdGTob/dTxu1Kgtgo1ylg2
	P5eRhXGaRDRmtLPpDSFRXgacRBELV2dwVKq/k1gZMyKvVSredH/Gua/u6RqZAMunxhmTQbXmYwn
	ufxEKh4CDNJzcv2IQvCKlXZokAESa34YZ3WKRI0Jh13s8a7yqoop+yTPmcrcWn2yAINLSVy51Wz
	Zo2hhoM5v8dkp2pI9SyRcZ2ZYVRtjSzaIgvz0y8Id3ROCqMykRxxdyS0DmJLl21TTlJopNPNCyM
	Bm/BL6bO/0PUcLyymQzsINAd1
X-Received: by 2002:a05:690c:a058:b0:79a:55f5:a3f6 with SMTP id
 00721157ae682-79a90aeb6b5mr101651877b3.26.1774278098388; Mon, 23 Mar 2026
 08:01:38 -0700 (PDT)
MIME-Version: 1.0
References: <20260323114152.4178269-1-peng.zhang1.cn@windriver.com>
In-Reply-To: <20260323114152.4178269-1-peng.zhang1.cn@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 23 Mar 2026 08:01:10 -0700
X-Gm-Features: AaiRm51IOZXKxmj8fpcFV4fcnAvTl8p9FNp-wmGmRrapzT-4afKOIiTNh9LiBlE
Message-ID: <CAMKF1sp-aYrcBdEAyaNDTDBBi7RoJ8czAZ49CoW2fSGcSTXSQg@mail.gmail.com>
Subject: Re: [oe] [meta-xfce][PATCH 00/15] meta-xfce: upgrade core components
 to 4.21.x and fix cascading build issues
To: peng.zhang1.cn@windriver.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000c989d6064db24fc4"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Mar 2026 15:01:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125519

--000000000000c989d6064db24fc4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Can you rebase it on latest master branch and resend please.

On Mon, Mar 23, 2026 at 4:42=E2=80=AFAM Zhang, Peng (Paul) (CN) via
lists.openembedded.org <peng.zhang1.cn=3Dwindriver.com@lists.openembedded.o=
rg>
wrote:

> From: Zhang Peng <peng.zhang1.cn@windriver.com>
>
> Upgrade meta-xfce core components from 4.20.x to the 4.21.x
> development series.
>
> This patch series must be applied as a whole and individual patches
> should NOT be cherry-picked independently, because of the following
> dependency chain:
>
> libxfce4ui 4.21.x moved libxfce4util-1.0 from Requires to
> Requires.private in its pkg-config file, so `pkg-config --libs
> libxfce4ui-2` no longer emits -lxfce4util. This causes DSO missing
> link errors for autotools consumers that use libxfce4util symbols but
> rely on libxfce4ui to pull in the link dependency. As a result, all
> downstream components that depend on libxfce4ui must be upgraded
> together, and several packages require additional build fixes:
>
> - xfdesktop: switch to meson build system to correctly declare
>   libxfce4util dependency and avoid the DSO link issue
> - xfwm4: backport patch to add missing libxfce4util build flags
> - xfce4-datetime-setter: fix link failure due to missing libxfce4util
>   dependency
> - xfce-polkit: fix link failure by adding missing gtk+-3.0 dependency
> - xfce4-datetime-plugin: fix build with xfce4-panel 4.21.x API changes
>
> Recipe upgrades (patches 01-10):
>   libxfce4ui        4.20.2 -> 4.21.7
>   garcon            4.20.0 -> 4.21.0
>   xfce4-appfinder   4.20.0 -> 4.21.0
>   xfce4-power-manager 4.20.0 -> 4.21.1
>   xfce4-session     4.20.3 -> 4.21.1
>   xfce4-panel       4.20.1 -> 4.21.1
>   xfce4-settings    4.20.1 -> 4.21.1
>   tumbler           4.20.1 -> 4.21.1
>   thunar            4.20.7 -> 4.21.4
>   xfconf            4.20.0 -> 4.21.2
>
> Build fixes (patches 11-15):
>   xfdesktop, xfce4-datetime-plugin, xfwm4,
>   xfce4-datetime-setter, xfce-polkit
>
> Zhang Peng (15):
>   libxfce4ui: upgrade 4.20.2 -> 4.21.7
>   garcon: upgrade 4.20.0 -> 4.21.0
>   xfce4-appfinder: upgrade 4.20.0 -> 4.21.0
>   xfce4-power-manager: upgrade 4.20.0 -> 4.21.1
>   xfce4-session: upgrade 4.20.3 -> 4.21.1
>   xfce4-panel: upgrade 4.20.1 -> 4.21.1
>   xfce4-settings: upgrade 4.20.1 -> 4.21.1
>   tumbler: upgrade 4.20.1 -> 4.21.1
>   thunar: upgrade 4.20.7 -> 4.21.4
>   xfconf: upgrade 4.20.0 -> 4.21.2
>   xfdesktop: switch to meson build system
>   xfce4-datetime-plugin: fix build with xfce4-panel 4.21.x
>   xfwm4: backport patch to add missing libxfce4util build flags
>   xfce4-datetime-setter: fix link failure due to missing libxfce4util
>     dependency
>   xfce-polkit: fix link failure by adding missing gtk+-3.0 dependency
>
>  ...d-missing-direct-dependency-on-gtk-3.patch |  52 ++++++++
>  .../xfce-polkit/xfce-polkit_0.3.bb            |   7 +-
>  ...g-direct-dependencies-to-fix-link-fa.patch |  35 ++++++
>  .../xfce4-datetime-setter_3.32.2.bb           |   6 +-
>  .../datetime/xfce4-datetime-plugin_0.8.3.bb   |   2 +
>  .../{garcon_4.20.0.bb =3D> garcon_4.21.0.bb}    |   8 +-
>  ...splay-full-path-in-generated-headers.patch |  36 ++++++
>  ...xfce4ui_4.20.2.bb =3D> libxfce4ui_4.21.7.bb} |  25 ++--
>  .../{thunar_4.20.7.bb =3D> thunar_4.21.4.bb}    |  12 +-
>  .../{tumbler_4.20.1.bb =3D> tumbler_4.21.1.bb}  |  24 ++--
>  ...er_4.20.0.bb =3D> xfce4-appfinder_4.21.0.bb} |   5 +-
>  ...splay-full-path-in-generated-headers.patch |  36 ++++++
>  ...-panel_4.20.1.bb =3D> xfce4-panel_4.21.1.bb} |   9 +-
>  ...splay-full-path-in-generated-headers.patch |  34 ++++++
>  ....20.0.bb =3D> xfce4-power-manager_4.21.1.bb} |  13 +-
>  ...nfigure.in-hard-code-path-to-iceauth.patch |  43 -------
>  ...eson.build-hard-code-path-to-iceauth.patch |  49 ++++++++
>  ...sion_4.20.3.bb =3D> xfce4-session_4.21.1.bb} |  12 +-
>  ...splay-full-path-in-generated-headers.patch |  36 ++++++
>  ...ngs_4.20.1.bb =3D> xfce4-settings_4.21.1.bb} |  17 ++-
>  ...gdbus-headers-are-generated-before-i.patch | 114 ++++++++++++++++++
>  .../{xfconf_4.20.0.bb =3D> xfconf_4.21.2.bb}    |  12 +-
>  .../xfdesktop/xfdesktop_4.20.1.bb             |  12 +-
>  ...build-Add-missing-libxfce4util-flags.patch |  57 +++++++++
>  meta-xfce/recipes-xfce/xfwm4/xfwm4_4.20.0.bb  |   5 +-
>  25 files changed, 545 insertions(+), 116 deletions(-)
>  create mode 100644
> meta-xfce/recipes-apps/xfce-polkit/files/0001-configure.ac-add-missing-di=
rect-dependency-on-gtk-3.patch
>  create mode 100644
> meta-xfce/recipes-apps/xfce4-datetime-setter/files/0001-build-add-missing=
-direct-dependencies-to-fix-link-fa.patch
>  rename meta-xfce/recipes-xfce/garcon/{garcon_4.20.0.bb =3D>
> garcon_4.21.0.bb} (68%)
>  create mode 100644
> meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui/0001-build-Do-not-display-fu=
ll-path-in-generated-headers.patch
>  rename meta-xfce/recipes-xfce/libxfce4ui/{libxfce4ui_4.20.2.bb =3D>
> libxfce4ui_4.21.7.bb} (58%)
>  rename meta-xfce/recipes-xfce/thunar/{thunar_4.20.7.bb =3D>
> thunar_4.21.4.bb} (67%)
>  rename meta-xfce/recipes-xfce/tumbler/{tumbler_4.20.1.bb =3D>
> tumbler_4.21.1.bb} (65%)
>  rename meta-xfce/recipes-xfce/xfce4-appfinder/{xfce4-appfinder_4.20.0.bb
> =3D> xfce4-appfinder_4.21.0.bb} (72%)
>  create mode 100644
> meta-xfce/recipes-xfce/xfce4-panel/files/0001-build-Do-not-display-full-p=
ath-in-generated-headers.patch
>  rename meta-xfce/recipes-xfce/xfce4-panel/{xfce4-panel_4.20.1.bb =3D>
> xfce4-panel_4.21.1.bb} (85%)
>  create mode 100644
> meta-xfce/recipes-xfce/xfce4-power-manager/files/0001-build-Do-not-displa=
y-full-path-in-generated-headers.patch
>  rename meta-xfce/recipes-xfce/xfce4-power-manager/{
> xfce4-power-manager_4.20.0.bb =3D> xfce4-power-manager_4.21.1.bb} (77%)
>  delete mode 100644
> meta-xfce/recipes-xfce/xfce4-session/xfce4-session/0001-configure.in-hard=
-code-path-to-iceauth.patch
>  create mode 100644
> meta-xfce/recipes-xfce/xfce4-session/xfce4-session/0001-meson.build-hard-=
code-path-to-iceauth.patch
>  rename meta-xfce/recipes-xfce/xfce4-session/{xfce4-session_4.20.3.bb =3D=
>
> xfce4-session_4.21.1.bb} (75%)
>  create mode 100644
> meta-xfce/recipes-xfce/xfce4-settings/files/0001-build-Do-not-display-ful=
l-path-in-generated-headers.patch
>  rename meta-xfce/recipes-xfce/xfce4-settings/{xfce4-settings_4.20.1.bb
> =3D> xfce4-settings_4.21.1.bb} (67%)
>  create mode 100644
> meta-xfce/recipes-xfce/xfconf/xfconf/0001-build-Make-sure-gdbus-headers-a=
re-generated-before-i.patch
>  rename meta-xfce/recipes-xfce/xfconf/{xfconf_4.20.0.bb =3D>
> xfconf_4.21.2.bb} (64%)
>  create mode 100644
> meta-xfce/recipes-xfce/xfwm4/xfwm4/0001-build-Add-missing-libxfce4util-fl=
ags.patch
>
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#125507):
> https://lists.openembedded.org/g/openembedded-devel/message/125507
> Mute This Topic: https://lists.openembedded.org/mt/118462731/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000c989d6064db24fc4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Can you rebase it on latest master branch and resend pleas=
e.</div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"lt=
r" class=3D"gmail_attr">On Mon, Mar 23, 2026 at 4:42=E2=80=AFAM Zhang, Peng=
 (Paul) (CN) via <a href=3D"http://lists.openembedded.org">lists.openembedd=
ed.org</a> &lt;<a href=3D"http://peng.zhang1.cn">peng.zhang1.cn</a>=3D<a hr=
ef=3D"mailto:windriver.com@lists.openembedded.org">windriver.com@lists.open=
embedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">From: Zhang Peng &lt;<a href=3D"mailto:peng.zhang1.cn@windriver=
.com" target=3D"_blank">peng.zhang1.cn@windriver.com</a>&gt;<br>
<br>
Upgrade meta-xfce core components from 4.20.x to the 4.21.x<br>
development series.<br>
<br>
This patch series must be applied as a whole and individual patches<br>
should NOT be cherry-picked independently, because of the following<br>
dependency chain:<br>
<br>
libxfce4ui 4.21.x moved libxfce4util-1.0 from Requires to<br>
Requires.private in its pkg-config file, so `pkg-config --libs<br>
libxfce4ui-2` no longer emits -lxfce4util. This causes DSO missing<br>
link errors for autotools consumers that use libxfce4util symbols but<br>
rely on libxfce4ui to pull in the link dependency. As a result, all<br>
downstream components that depend on libxfce4ui must be upgraded<br>
together, and several packages require additional build fixes:<br>
<br>
- xfdesktop: switch to meson build system to correctly declare<br>
=C2=A0 libxfce4util dependency and avoid the DSO link issue<br>
- xfwm4: backport patch to add missing libxfce4util build flags<br>
- xfce4-datetime-setter: fix link failure due to missing libxfce4util<br>
=C2=A0 dependency<br>
- xfce-polkit: fix link failure by adding missing gtk+-3.0 dependency<br>
- xfce4-datetime-plugin: fix build with xfce4-panel 4.21.x API changes<br>
<br>
Recipe upgrades (patches 01-10):<br>
=C2=A0 libxfce4ui=C2=A0 =C2=A0 =C2=A0 =C2=A0 4.20.2 -&gt; 4.21.7<br>
=C2=A0 garcon=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 4.20.0 -&gt; 4.21.0<=
br>
=C2=A0 xfce4-appfinder=C2=A0 =C2=A04.20.0 -&gt; 4.21.0<br>
=C2=A0 xfce4-power-manager 4.20.0 -&gt; 4.21.1<br>
=C2=A0 xfce4-session=C2=A0 =C2=A0 =C2=A04.20.3 -&gt; 4.21.1<br>
=C2=A0 xfce4-panel=C2=A0 =C2=A0 =C2=A0 =C2=A04.20.1 -&gt; 4.21.1<br>
=C2=A0 xfce4-settings=C2=A0 =C2=A0 4.20.1 -&gt; 4.21.1<br>
=C2=A0 tumbler=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A04.20.1 -&gt; 4.21.1<=
br>
=C2=A0 thunar=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 4.20.7 -&gt; 4.21.4<=
br>
=C2=A0 xfconf=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 4.20.0 -&gt; 4.21.2<=
br>
<br>
Build fixes (patches 11-15):<br>
=C2=A0 xfdesktop, xfce4-datetime-plugin, xfwm4,<br>
=C2=A0 xfce4-datetime-setter, xfce-polkit<br>
<br>
Zhang Peng (15):<br>
=C2=A0 libxfce4ui: upgrade 4.20.2 -&gt; 4.21.7<br>
=C2=A0 garcon: upgrade 4.20.0 -&gt; 4.21.0<br>
=C2=A0 xfce4-appfinder: upgrade 4.20.0 -&gt; 4.21.0<br>
=C2=A0 xfce4-power-manager: upgrade 4.20.0 -&gt; 4.21.1<br>
=C2=A0 xfce4-session: upgrade 4.20.3 -&gt; 4.21.1<br>
=C2=A0 xfce4-panel: upgrade 4.20.1 -&gt; 4.21.1<br>
=C2=A0 xfce4-settings: upgrade 4.20.1 -&gt; 4.21.1<br>
=C2=A0 tumbler: upgrade 4.20.1 -&gt; 4.21.1<br>
=C2=A0 thunar: upgrade 4.20.7 -&gt; 4.21.4<br>
=C2=A0 xfconf: upgrade 4.20.0 -&gt; 4.21.2<br>
=C2=A0 xfdesktop: switch to meson build system<br>
=C2=A0 xfce4-datetime-plugin: fix build with xfce4-panel 4.21.x<br>
=C2=A0 xfwm4: backport patch to add missing libxfce4util build flags<br>
=C2=A0 xfce4-datetime-setter: fix link failure due to missing libxfce4util<=
br>
=C2=A0 =C2=A0 dependency<br>
=C2=A0 xfce-polkit: fix link failure by adding missing gtk+-3.0 dependency<=
br>
<br>
=C2=A0...d-missing-direct-dependency-on-gtk-3.patch |=C2=A0 52 ++++++++<br>
=C2=A0.../xfce-polkit/<a href=3D"http://xfce-polkit_0.3.bb" rel=3D"noreferr=
er" target=3D"_blank">xfce-polkit_0.3.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 =C2=A07 +-<br>
=C2=A0...g-direct-dependencies-to-fix-link-fa.patch |=C2=A0 35 ++++++<br>
=C2=A0.../<a href=3D"http://xfce4-datetime-setter_3.32.2.bb" rel=3D"norefer=
rer" target=3D"_blank">xfce4-datetime-setter_3.32.2.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A06 +-<br>
=C2=A0.../datetime/<a href=3D"http://xfce4-datetime-plugin_0.8.3.bb" rel=3D=
"noreferrer" target=3D"_blank">xfce4-datetime-plugin_0.8.3.bb</a>=C2=A0 =C2=
=A0|=C2=A0 =C2=A02 +<br>
=C2=A0.../{<a href=3D"http://garcon_4.20.0.bb" rel=3D"noreferrer" target=3D=
"_blank">garcon_4.20.0.bb</a> =3D&gt; <a href=3D"http://garcon_4.21.0.bb" r=
el=3D"noreferrer" target=3D"_blank">garcon_4.21.0.bb</a>}=C2=A0 =C2=A0 |=C2=
=A0 =C2=A08 +-<br>
=C2=A0...splay-full-path-in-generated-headers.patch |=C2=A0 36 ++++++<br>
=C2=A0...<a href=3D"http://xfce4ui_4.20.2.bb" rel=3D"noreferrer" target=3D"=
_blank">xfce4ui_4.20.2.bb</a> =3D&gt; <a href=3D"http://libxfce4ui_4.21.7.b=
b" rel=3D"noreferrer" target=3D"_blank">libxfce4ui_4.21.7.bb</a>} |=C2=A0 2=
5 ++--<br>
=C2=A0.../{<a href=3D"http://thunar_4.20.7.bb" rel=3D"noreferrer" target=3D=
"_blank">thunar_4.20.7.bb</a> =3D&gt; <a href=3D"http://thunar_4.21.4.bb" r=
el=3D"noreferrer" target=3D"_blank">thunar_4.21.4.bb</a>}=C2=A0 =C2=A0 |=C2=
=A0 12 +-<br>
=C2=A0.../{<a href=3D"http://tumbler_4.20.1.bb" rel=3D"noreferrer" target=
=3D"_blank">tumbler_4.20.1.bb</a> =3D&gt; <a href=3D"http://tumbler_4.21.1.=
bb" rel=3D"noreferrer" target=3D"_blank">tumbler_4.21.1.bb</a>}=C2=A0 |=C2=
=A0 24 ++--<br>
=C2=A0...<a href=3D"http://er_4.20.0.bb" rel=3D"noreferrer" target=3D"_blan=
k">er_4.20.0.bb</a> =3D&gt; <a href=3D"http://xfce4-appfinder_4.21.0.bb" re=
l=3D"noreferrer" target=3D"_blank">xfce4-appfinder_4.21.0.bb</a>} |=C2=A0 =
=C2=A05 +-<br>
=C2=A0...splay-full-path-in-generated-headers.patch |=C2=A0 36 ++++++<br>
=C2=A0...-<a href=3D"http://panel_4.20.1.bb" rel=3D"noreferrer" target=3D"_=
blank">panel_4.20.1.bb</a> =3D&gt; <a href=3D"http://xfce4-panel_4.21.1.bb"=
 rel=3D"noreferrer" target=3D"_blank">xfce4-panel_4.21.1.bb</a>} |=C2=A0 =
=C2=A09 +-<br>
=C2=A0...splay-full-path-in-generated-headers.patch |=C2=A0 34 ++++++<br>
=C2=A0....<a href=3D"http://20.0.bb" rel=3D"noreferrer" target=3D"_blank">2=
0.0.bb</a> =3D&gt; <a href=3D"http://xfce4-power-manager_4.21.1.bb" rel=3D"=
noreferrer" target=3D"_blank">xfce4-power-manager_4.21.1.bb</a>} |=C2=A0 13=
 +-<br>
=C2=A0...nfigure.in-hard-code-path-to-iceauth.patch |=C2=A0 43 -------<br>
=C2=A0...eson.build-hard-code-path-to-iceauth.patch |=C2=A0 49 ++++++++<br>
=C2=A0...<a href=3D"http://sion_4.20.3.bb" rel=3D"noreferrer" target=3D"_bl=
ank">sion_4.20.3.bb</a> =3D&gt; <a href=3D"http://xfce4-session_4.21.1.bb" =
rel=3D"noreferrer" target=3D"_blank">xfce4-session_4.21.1.bb</a>} |=C2=A0 1=
2 +-<br>
=C2=A0...splay-full-path-in-generated-headers.patch |=C2=A0 36 ++++++<br>
=C2=A0...<a href=3D"http://ngs_4.20.1.bb" rel=3D"noreferrer" target=3D"_bla=
nk">ngs_4.20.1.bb</a> =3D&gt; <a href=3D"http://xfce4-settings_4.21.1.bb" r=
el=3D"noreferrer" target=3D"_blank">xfce4-settings_4.21.1.bb</a>} |=C2=A0 1=
7 ++-<br>
=C2=A0...gdbus-headers-are-generated-before-i.patch | 114 +++++++++++++++++=
+<br>
=C2=A0.../{<a href=3D"http://xfconf_4.20.0.bb" rel=3D"noreferrer" target=3D=
"_blank">xfconf_4.20.0.bb</a> =3D&gt; <a href=3D"http://xfconf_4.21.2.bb" r=
el=3D"noreferrer" target=3D"_blank">xfconf_4.21.2.bb</a>}=C2=A0 =C2=A0 |=C2=
=A0 12 +-<br>
=C2=A0.../xfdesktop/<a href=3D"http://xfdesktop_4.20.1.bb" rel=3D"noreferre=
r" target=3D"_blank">xfdesktop_4.20.1.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 12 +-<br>
=C2=A0...build-Add-missing-libxfce4util-flags.patch |=C2=A0 57 +++++++++<br=
>
=C2=A0meta-xfce/recipes-xfce/xfwm4/<a href=3D"http://xfwm4_4.20.0.bb" rel=
=3D"noreferrer" target=3D"_blank">xfwm4_4.20.0.bb</a>=C2=A0 |=C2=A0 =C2=A05=
 +-<br>
=C2=A025 files changed, 545 insertions(+), 116 deletions(-)<br>
=C2=A0create mode 100644 meta-xfce/recipes-apps/xfce-polkit/files/0001-conf=
igure.ac-add-missing-direct-dependency-on-gtk-3.patch<br>
=C2=A0create mode 100644 meta-xfce/recipes-apps/xfce4-datetime-setter/files=
/0001-build-add-missing-direct-dependencies-to-fix-link-fa.patch<br>
=C2=A0rename meta-xfce/recipes-xfce/garcon/{<a href=3D"http://garcon_4.20.0=
.bb" rel=3D"noreferrer" target=3D"_blank">garcon_4.20.0.bb</a> =3D&gt; <a h=
ref=3D"http://garcon_4.21.0.bb" rel=3D"noreferrer" target=3D"_blank">garcon=
_4.21.0.bb</a>} (68%)<br>
=C2=A0create mode 100644 meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui/0001-=
build-Do-not-display-full-path-in-generated-headers.patch<br>
=C2=A0rename meta-xfce/recipes-xfce/libxfce4ui/{<a href=3D"http://libxfce4u=
i_4.20.2.bb" rel=3D"noreferrer" target=3D"_blank">libxfce4ui_4.20.2.bb</a> =
=3D&gt; <a href=3D"http://libxfce4ui_4.21.7.bb" rel=3D"noreferrer" target=
=3D"_blank">libxfce4ui_4.21.7.bb</a>} (58%)<br>
=C2=A0rename meta-xfce/recipes-xfce/thunar/{<a href=3D"http://thunar_4.20.7=
.bb" rel=3D"noreferrer" target=3D"_blank">thunar_4.20.7.bb</a> =3D&gt; <a h=
ref=3D"http://thunar_4.21.4.bb" rel=3D"noreferrer" target=3D"_blank">thunar=
_4.21.4.bb</a>} (67%)<br>
=C2=A0rename meta-xfce/recipes-xfce/tumbler/{<a href=3D"http://tumbler_4.20=
.1.bb" rel=3D"noreferrer" target=3D"_blank">tumbler_4.20.1.bb</a> =3D&gt; <=
a href=3D"http://tumbler_4.21.1.bb" rel=3D"noreferrer" target=3D"_blank">tu=
mbler_4.21.1.bb</a>} (65%)<br>
=C2=A0rename meta-xfce/recipes-xfce/xfce4-appfinder/{<a href=3D"http://xfce=
4-appfinder_4.20.0.bb" rel=3D"noreferrer" target=3D"_blank">xfce4-appfinder=
_4.20.0.bb</a> =3D&gt; <a href=3D"http://xfce4-appfinder_4.21.0.bb" rel=3D"=
noreferrer" target=3D"_blank">xfce4-appfinder_4.21.0.bb</a>} (72%)<br>
=C2=A0create mode 100644 meta-xfce/recipes-xfce/xfce4-panel/files/0001-buil=
d-Do-not-display-full-path-in-generated-headers.patch<br>
=C2=A0rename meta-xfce/recipes-xfce/xfce4-panel/{<a href=3D"http://xfce4-pa=
nel_4.20.1.bb" rel=3D"noreferrer" target=3D"_blank">xfce4-panel_4.20.1.bb</=
a> =3D&gt; <a href=3D"http://xfce4-panel_4.21.1.bb" rel=3D"noreferrer" targ=
et=3D"_blank">xfce4-panel_4.21.1.bb</a>} (85%)<br>
=C2=A0create mode 100644 meta-xfce/recipes-xfce/xfce4-power-manager/files/0=
001-build-Do-not-display-full-path-in-generated-headers.patch<br>
=C2=A0rename meta-xfce/recipes-xfce/xfce4-power-manager/{<a href=3D"http://=
xfce4-power-manager_4.20.0.bb" rel=3D"noreferrer" target=3D"_blank">xfce4-p=
ower-manager_4.20.0.bb</a> =3D&gt; <a href=3D"http://xfce4-power-manager_4.=
21.1.bb" rel=3D"noreferrer" target=3D"_blank">xfce4-power-manager_4.21.1.bb=
</a>} (77%)<br>
=C2=A0delete mode 100644 meta-xfce/recipes-xfce/xfce4-session/xfce4-session=
/0001-configure.in-hard-code-path-to-iceauth.patch<br>
=C2=A0create mode 100644 meta-xfce/recipes-xfce/xfce4-session/xfce4-session=
/0001-meson.build-hard-code-path-to-iceauth.patch<br>
=C2=A0rename meta-xfce/recipes-xfce/xfce4-session/{<a href=3D"http://xfce4-=
session_4.20.3.bb" rel=3D"noreferrer" target=3D"_blank">xfce4-session_4.20.=
3.bb</a> =3D&gt; <a href=3D"http://xfce4-session_4.21.1.bb" rel=3D"noreferr=
er" target=3D"_blank">xfce4-session_4.21.1.bb</a>} (75%)<br>
=C2=A0create mode 100644 meta-xfce/recipes-xfce/xfce4-settings/files/0001-b=
uild-Do-not-display-full-path-in-generated-headers.patch<br>
=C2=A0rename meta-xfce/recipes-xfce/xfce4-settings/{<a href=3D"http://xfce4=
-settings_4.20.1.bb" rel=3D"noreferrer" target=3D"_blank">xfce4-settings_4.=
20.1.bb</a> =3D&gt; <a href=3D"http://xfce4-settings_4.21.1.bb" rel=3D"nore=
ferrer" target=3D"_blank">xfce4-settings_4.21.1.bb</a>} (67%)<br>
=C2=A0create mode 100644 meta-xfce/recipes-xfce/xfconf/xfconf/0001-build-Ma=
ke-sure-gdbus-headers-are-generated-before-i.patch<br>
=C2=A0rename meta-xfce/recipes-xfce/xfconf/{<a href=3D"http://xfconf_4.20.0=
.bb" rel=3D"noreferrer" target=3D"_blank">xfconf_4.20.0.bb</a> =3D&gt; <a h=
ref=3D"http://xfconf_4.21.2.bb" rel=3D"noreferrer" target=3D"_blank">xfconf=
_4.21.2.bb</a>} (64%)<br>
=C2=A0create mode 100644 meta-xfce/recipes-xfce/xfwm4/xfwm4/0001-build-Add-=
missing-libxfce4util-flags.patch<br>
<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#125507): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/125507" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/125507</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/118462731/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/118462731/1997914</a><br>
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

--000000000000c989d6064db24fc4--

