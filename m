Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
 by mx.groups.io with SMTP id smtpd.web10.13624.1586188048942779370
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Apr 2020 08:47:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=mqtO/Yp/;
 spf=pass (domain: gmail.com, ip: 209.85.160.174, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f174.google.com with SMTP id s30so66021qth.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 06 Apr 2020 08:47:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=362Fr1WyNG4+H5j5JyiX5p641eGU/I3TtnPsmgQgv5o=;
        b=mqtO/Yp/AtHrSZh2HUCPrkxAV3omWuBsJ4KLzymcbArbcTBtiWLtKFqycXlHkwlQmv
         gyEJX/k6BmT0KPnoLIdxqYPAWwb9XzsH0mFVMaWHDo0WPr5vpd+B08sfPtIwdEa8ikTP
         txNqzDqNegzGaO0tcaiHeDiConPeQsdmcrIJ6jT+iHCmi/EHwyc/DGfDogajuHaar1iw
         VLvcH6tb0mXD9TUK36uyUK2JKp+G7CFknXB5zsIxWIcGQPK+RBoAJctMZevAW1F0jwvG
         EvvhxpH+MvT4w0OPAFHRvUNMUPxXDnskPYqr4cHfbl2CQ1B8w9JSqSdkATv39LK15eoD
         307w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=362Fr1WyNG4+H5j5JyiX5p641eGU/I3TtnPsmgQgv5o=;
        b=TS0YSwTk6SAKtEWMGV8T7mktuMK+pID7cAm67LSYbQ6kZ0WcwsZNdKxkLhSbLq9YZw
         V801jd0JyU6l9ef8h3gM/JIt0AA/BILeI3My/0MgO0mZt14kEoEtVlXoG2psikjyYoBF
         CY41TbCXG/Ka4/6wGOzPy+CoEJQV4lKm5W1NNUmqL40pfTPRdE5AiLI7wHPVti+ANMqq
         r7IeMPBgj2YA9YPleaHKaUhaCvugEraAyHy0wC8JQ9Vh+IUNnmWaRErRu711JtfmIV4w
         IHtamKUe1yeWlAhR4Q5MOEK9f3NLytsobtHWKm9Y2p2vbjCVuGSQDQDGTWsz8zoRhXkP
         6ybw==
X-Gm-Message-State: AGi0PubKVbBznDnJkl4eJ1EIgmPTOC31eTbzIxDzhE2e/F/Jac4clv8E
	Ud1j7+D7Xf97HSJI0jOiFCEqIaNFSc46OWRzeOs=
X-Google-Smtp-Source: APiQypLqwv4Rq634Xlt9g6PGY1E+XujCokJpyOSa60cZxS/KxVpllnBqyJ368BRFcyrD6qRG930pO0A1lPfU82HFLUs=
X-Received: by 2002:ac8:66cf:: with SMTP id m15mr40113qtp.146.1586188046531;
 Mon, 06 Apr 2020 08:47:26 -0700 (PDT)
MIME-Version: 1.0
References: <20200406092032.3574-1-schnitzeltony@gmail.com>
In-Reply-To: <20200406092032.3574-1-schnitzeltony@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Mon, 6 Apr 2020 08:46:59 -0700
Message-ID: <CAMKF1srTJ_ao-V78cLwVfGOV3HUoeaD4H28J8Ajh_rrJE=9Rjg@mail.gmail.com>
Subject: Re: [oe] [PATCH 00/14] GNOME 3.34.5 upgrades
To: "Andreas M?ller" <schnitzeltony@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 6, 2020 at 2:20 AM Andreas M?ller <schnitzeltony@gmail.com> wro=
te:
>
> Am aware that GNOME released 3.36 but
>
> * we are close to dunfell

if its WIP we can still consider 3.36

> * GNOME 3.36 - more specific gjs - requires mozjs-68 which we don't have=
 yet
>   (and is yet another challenge)

I See, if you have details on mozjs 68 that would be helpful,


>
> Andreas M=C3=BCller (14):
>   gnome-desktop3: 3.34.4 upgrade 3.34.5
>   mutter: upgrade 3.34.4 -> 3.34.5
>   gnome-shell: upgrade 3.34.4 -> 3.34.5
>   gnome-control-center: upgrade 3.34.4 -> 3.34.5
>   gjs: upgrade 1.58.5 -> 1.58.6
>   libsigc++-2.0: upgrade 2.10.2 -> 2.10.3
>   libsigc++-3: upgrade 3.0.2 -> 3.0.3
>   libgsf: upgrade 1.14.46 -> 1.14.47
>   pangomm; upgrade 2.42.0 -> 2.42.1
>   tracker: upgrade 2.3.1 -> 2.3.4
>   tracker-miners: upgrade 2.3.1 -> 2.3.3
>   geocode-glib: upgrade 3.26.1 -> 3.26.2
>   gnome-bluetooth: upgrade 3.34.0 -> 3.34.1
>   libgdata: upgrade 0.17.11 -> 0.17.12
>


staged these changes in master-next

>  .../{geocode-glib_3.26.1.bb =3D> geocode-glib_3.26.2.bb}        | 4 ++-=
-
>  meta-gnome/recipes-gnome/gjs/{gjs_1.58.5.bb =3D> gjs_1.58.6.bb} | 4 ++-=
-
>  .../{gnome-bluetooth_3.34.0.bb =3D> gnome-bluetooth_3.34.1.bb}  | 4 ++-=
-
>  ...ontrol-center_3.34.4.bb =3D> gnome-control-center_3.34.5.bb} | 4 ++-=
-
>  .../{gnome-desktop3_3.34.4.bb =3D> gnome-desktop3_3.34.5.bb}    | 4 ++-=
-
>  .../{gnome-shell_3.34.4.bb =3D> gnome-shell_3.34.5.bb}          | 4 ++-=
-
>  .../libgdata/{libgdata_0.17.11.bb =3D> libgdata_0.17.12.bb}     | 4 ++-=
-
>  .../libgsf/{libgsf_1.14.46.bb =3D> libgsf_1.14.47.bb}           | 4 ++-=
-
>  .../mutter/{mutter_3.34.4.bb =3D> mutter_3.34.5.bb}             | 4 ++-=
-
>  .../{tracker-miners_2.3.1.bb =3D> tracker-miners_2.3.3.bb}      | 4 ++-=
-
>  .../tracker/{tracker_2.3.1.bb =3D> tracker_2.3.4.bb}            | 4 ++-=
-
>  .../{libsigc++-2.0_2.10.2.bb =3D> libsigc++-2.0_2.10.3.bb}      | 4 ++-=
-
>  .../{libsigc++-3_3.0.2.bb =3D> libsigc++-3_3.0.3.bb}            | 4 ++-=
-
>  .../pango/{pangomm_2.42.0.bb =3D> pangomm_2.42.1.bb}            | 4 ++-=
-
>  14 files changed, 28 insertions(+), 28 deletions(-)
>  rename meta-gnome/recipes-gnome/geocode-glib/{geocode-glib_3.26.1.bb =
=3D> geocode-glib_3.26.2.bb} (73%)
>  rename meta-gnome/recipes-gnome/gjs/{gjs_1.58.5.bb =3D> gjs_1.58.6.bb} =
(87%)
>  rename meta-gnome/recipes-gnome/gnome-bluetooth/{gnome-bluetooth_3.34.0=
.bb =3D> gnome-bluetooth_3.34.1.bb} (78%)
>  rename meta-gnome/recipes-gnome/gnome-control-center/{gnome-control-cen=
ter_3.34.4.bb =3D> gnome-control-center_3.34.5.bb} (89%)
>  rename meta-gnome/recipes-gnome/gnome-desktop/{gnome-desktop3_3.34.4.bb=
 =3D> gnome-desktop3_3.34.5.bb} (88%)
>  rename meta-gnome/recipes-gnome/gnome-shell/{gnome-shell_3.34.4.bb =3D>=
 gnome-shell_3.34.5.bb} (91%)
>  rename meta-gnome/recipes-gnome/libgdata/{libgdata_0.17.11.bb =3D> libg=
data_0.17.12.bb} (87%)
>  rename meta-gnome/recipes-gnome/libgsf/{libgsf_1.14.46.bb =3D> libgsf_1=
.14.47.bb} (79%)
>  rename meta-gnome/recipes-gnome/mutter/{mutter_3.34.4.bb =3D> mutter_3.=
34.5.bb} (95%)
>  rename meta-gnome/recipes-gnome/tracker/{tracker-miners_2.3.1.bb =3D> t=
racker-miners_2.3.3.bb} (93%)
>  rename meta-gnome/recipes-gnome/tracker/{tracker_2.3.1.bb =3D> tracker_=
2.3.4.bb} (90%)
>  rename meta-oe/recipes-core/libsigc++-2.0/{libsigc++-2.0_2.10.2.bb =3D>=
 libsigc++-2.0_2.10.3.bb} (77%)
>  rename meta-oe/recipes-core/libsigc++-2.0/{libsigc++-3_3.0.2.bb =3D> li=
bsigc++-3_3.0.3.bb} (77%)
>  rename meta-oe/recipes-graphics/pango/{pangomm_2.42.0.bb =3D> pangomm_2=
.42.1.bb} (82%)
>
> --
> 2.21.1
>
>=20
