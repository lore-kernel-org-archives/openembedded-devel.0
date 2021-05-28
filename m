Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
 by mx.groups.io with SMTP id smtpd.web11.11522.1622222176311421787
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 May 2021 10:16:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=AIOULtcD;
 spf=pass (domain: gmail.com, ip: 209.85.222.171, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f171.google.com with SMTP id k4so4839527qkd.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 28 May 2021 10:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=gSqhKiZWzEXfnww/MEVXxXQ10W/6dvMuNfwNf/kQ5lg=;
        b=AIOULtcDkai8DcSDEgiquUyrTKHxAk16CIoqFroUAKABFclURQHF9o0E72nvdD84vO
         7rI9X1+AZUutkpKxCtY3wPEfwYmI2+fxyIfM6NUdx7SwCxQurdc5ENIrwkWSgMmIzIKF
         AnAqx2jSWSo6uXbc28KEbjraxnZkPOyhJP1xBtof10x+QNAYpbkSKx1vbDmKx781wfx3
         aAujEe7cRk2k0rSRTzRurZMWy0kR20Zejgy9kquPhC1w/YmeKF2pcLhE2bmdGjWrvb7f
         aU8+69wUi4ts4zKXH8H9kxHYyTnNnZBaSslQcUiYGNIEpiTG0aHTzLyVjqm5oHiJ/qQO
         XlZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=gSqhKiZWzEXfnww/MEVXxXQ10W/6dvMuNfwNf/kQ5lg=;
        b=d4m5/MttDZAXOugHjWJ0Wj0QCeVz2ZfFS3jGjnGw95GIXPsvxSWotdVfCJUoCsbIj+
         dlK9xF4w0CoUOIS+DcTdhzumgOhiNPYuLxipefsd0lK+Bt9iSQt3e+XFcC6luUfBYOz9
         BzMfb0YbmlrB2qXFJQF/VGoV8RJ1Ks61lxaKj+SiWFuT0nGH+R/vxmgfboFfdcHcCC4J
         Fr8jFnf0welVgBzHZmuSSLEUipIK0zNuh92GnE3cOW18nYFOJkoxDa00NTZLLWNadirb
         vniIuKA4b0lhLnkF1eOAXjScNLl3VCbkWniW3joj81d1hSo0c0rxQ4QYHoadOmXw+ss6
         i8ZA==
X-Gm-Message-State: AOAM5316UbN65Ph7ruhh6xPAh1EyFiTY7Hn2gF9sNKSNH6maosx5uBCZ
	Z2tyk7AeysMBxoistOunKVW1x+vTUT7TllUXOUk=
X-Google-Smtp-Source: ABdhPJz7HsFas3EMwjFb4qcTkDExjUnd7c4XYbKcUuFX6MhF8lVL/pRBwOFCAVfUS0erEUdCZMqiXHmAtoLItSk8Pbo=
X-Received: by 2002:a37:9c17:: with SMTP id f23mr4977334qke.125.1622222175346;
 Fri, 28 May 2021 10:16:15 -0700 (PDT)
MIME-Version: 1.0
References: <02803737-39e0-d54a-8351-03232280e370@gmail.com>
In-Reply-To: <02803737-39e0-d54a-8351-03232280e370@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Fri, 28 May 2021 10:15:49 -0700
Message-ID: <CAMKF1spfOg1+Jie-+7zDPdBrojdj0X_PGmXdvhha5yaZe9T5MA@mail.gmail.com>
Subject: Re: Hardknott merge request May 28th
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

merged now thank you

On Fri, May 28, 2021 at 9:03 AM akuster808 <akuster808@gmail.com> wrote:
>
> The following changes since commit cf5bd6a8308108b4313a1e45ce8aa87e73125b=
f9:
>
>   xfce4-settings: upgrade 4.16.0 -> 4.16.1 (2021-05-17 07:18:41 -0700)
>
> are available in the Git repository at:
>
>   https://git.openembedded.org/meta-openembedded hardknott-next
>
> for you to fetch changes up to 9ee0e08ba2395b9cb93f2273bb1018adb3630407:
>
>   libgtop: fix do_compile error (2021-05-23 08:29:00 -0700)
>
> ----------------------------------------------------------------
> Alexander Vickberg (1):
>       hostapd: fix building with CONFIG_TLS=3Dinternal
>
> Andreas M=C3=BCller (1):
>       libgtop: tidy up recipe
>
> Changqing Li (1):
>       libgtop: fix do_compile error
>
> Khem Raj (1):
>       opencv: Disable tbb on riscv/musl
>
> Leon Anavi (4):
>       python3-cerberus: Upgrade 1.3.3 -> 1.3.4
>       python3-robotframework: Upgrade 4.0.1 -> 4.0.2
>       python3-rfc3339-validator: Upgrade 0.1.3 -> 0.1.4
>       python3-pymongo: Upgrade 3.11.3 -> 3.11.4
>
> Saul Wold (2):
>       opencv: remove tbb packageconfig for powerpc
>       sysdig: disable building for ppc
>
> Trevor Gamblin (2):
>       python3-django: upgrade 2.2.20 -> 2.2.22
>       python3-django: upgrade 3.2 -> 3.2.2
>
> wangmy (10):
>       uftrace: Fix a plthook crash on aarch64 with binutils2.35.1 and
> later versions on aarch64
>       exiv2: Fix CVE-2021-29457
>       exiv2: Fix CVE-2021-29458
>       exiv2: Fix CVE-2021-29463
>       exiv2: Fix CVE-2021-3482
>       exiv2: Fix CVE-2021-29464
>       exiv2: Fix CVE-2021-29470
>       exiv2: Fix CVE-2021-29473
>       libsdl: Fix CVE-2019-13616
>       trace-cmd: Conflict resolution
>
> zangrc (1):
>       postgresql: upgrade 13.2 -> 13.3
>
>  .../libgtop/0001-fix-compile-error-for-cross-compile.patch      |  37
> +++++++++
>  meta-gnome/recipes-gnome/libgtop/libgtop_2.40.0.bb              |   7 +-
>  .../hostapd/hostapd/0001-Prepare-for-CVE-2021-30004.patch.patch |  45
> +++++++++++
>  meta-oe/recipes-connectivity/hostapd/hostapd_2.9.bb             |   1 +
>  .../0001-configure.in-bypass-autoconf-2.69-version-check.patch  |   2 +-
>  .../postgresql/{postgresql_13.2.bb =3D> postgresql_13.3.bb}       |   2 =
+-
>  .../uftrace/0001-Fix-error-on-aarch64-with-binutils2.35.1.patch |  27
> -------
>  ...1-aarch64-Fix-a-plthook-crash-on-aarch64-with-binutils.patch |  47
> +++++++++++
>  meta-oe/recipes-devtools/uftrace/uftrace_0.9.4.bb               |   2 +-
>  meta-oe/recipes-extended/sysdig/sysdig_git.bb                   |   2 +
>  .../recipes-graphics/libsdl/libsdl-1.2.15/CVE-2019-13616.patch  |  27
> +++++++
>  meta-oe/recipes-graphics/libsdl/libsdl_1.2.15.bb                |   1 +
>  meta-oe/recipes-kernel/trace-cmd/trace-cmd_2.9.1.bb             |   2 +
>  meta-oe/recipes-support/exiv2/exiv2/CVE-2021-29457.patch        |  26
> ++++++
>  meta-oe/recipes-support/exiv2/exiv2/CVE-2021-29458.patch        |  37
> +++++++++
>  meta-oe/recipes-support/exiv2/exiv2/CVE-2021-29463.patch        | 120
> ++++++++++++++++++++++++++++
>  meta-oe/recipes-support/exiv2/exiv2/CVE-2021-29464.patch        |  72
> +++++++++++++++++
>  meta-oe/recipes-support/exiv2/exiv2/CVE-2021-29470.patch        |  32
> ++++++++
>  meta-oe/recipes-support/exiv2/exiv2/CVE-2021-29473.patch        |  21 ++=
+++
>  meta-oe/recipes-support/exiv2/exiv2/CVE-2021-3482.patch         |  54
> +++++++++++++
>  meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb                   |   9 ++=
-
>  meta-oe/recipes-support/opencv/opencv_4.5.2.bb                  |   6 ++
>  .../{python3-cerberus_1.3.3.bb =3D> python3-cerberus_1.3.4.bb}    |   4 =
+-
>  meta-python/recipes-devtools/python/python3-django_2.2.20.bb    |   9 --=
-
>  meta-python/recipes-devtools/python/python3-django_2.2.22.bb    |   9 ++=
+
>  .../python/{python3-django_3.2.bb =3D> python3-django_3.2.2.bb}   |   4 =
+-
>  .../{python3-pymongo_3.11.3.bb =3D> python3-pymongo_3.11.4.bb}    |   2 =
+-
>  ...39-validator_0.1.3.bb =3D> python3-rfc3339-validator_0.1.4.bb} |   2 =
+-
>  ...-robotframework_4.0.1.bb =3D> python3-robotframework_4.0.2.bb} |   2 =
+-
>  29 files changed, 561 insertions(+), 50 deletions(-)
>  create mode 100644
> meta-gnome/recipes-gnome/libgtop/libgtop/0001-fix-compile-error-for-cross=
-compile.patch
>  create mode 100644
> meta-oe/recipes-connectivity/hostapd/hostapd/0001-Prepare-for-CVE-2021-30=
004.patch.patch
>  rename meta-oe/recipes-dbs/postgresql/{postgresql_13.2.bb =3D>
> postgresql_13.3.bb} (78%)
>  delete mode 100644
> meta-oe/recipes-devtools/uftrace/uftrace/0001-Fix-error-on-aarch64-with-b=
inutils2.35.1.patch
>  create mode 100644
> meta-oe/recipes-devtools/uftrace/uftrace/0001-aarch64-Fix-a-plthook-crash=
-on-aarch64-with-binutils.patch
>  create mode 100644
> meta-oe/recipes-graphics/libsdl/libsdl-1.2.15/CVE-2019-13616.patch
>  create mode 100644 meta-oe/recipes-support/exiv2/exiv2/CVE-2021-29457.pa=
tch
>  create mode 100644 meta-oe/recipes-support/exiv2/exiv2/CVE-2021-29458.pa=
tch
>  create mode 100644 meta-oe/recipes-support/exiv2/exiv2/CVE-2021-29463.pa=
tch
>  create mode 100644 meta-oe/recipes-support/exiv2/exiv2/CVE-2021-29464.pa=
tch
>  create mode 100644 meta-oe/recipes-support/exiv2/exiv2/CVE-2021-29470.pa=
tch
>  create mode 100644 meta-oe/recipes-support/exiv2/exiv2/CVE-2021-29473.pa=
tch
>  create mode 100644 meta-oe/recipes-support/exiv2/exiv2/CVE-2021-3482.pat=
ch
>  rename meta-python/recipes-devtools/python/{python3-cerberus_1.3.3.bb
> =3D> python3-cerberus_1.3.4.bb} (75%)
>  delete mode 100644
> meta-python/recipes-devtools/python/python3-django_2.2.20.bb
>  create mode 100644
> meta-python/recipes-devtools/python/python3-django_2.2.22.bb
>  rename meta-python/recipes-devtools/python/{python3-django_3.2.bb =3D>
> python3-django_3.2.2.bb} (59%)
>  rename meta-python/recipes-devtools/python/{python3-pymongo_3.11.3.bb
> =3D> python3-pymongo_3.11.4.bb} (91%)
>  rename
> meta-python/recipes-devtools/python/{python3-rfc3339-validator_0.1.3.bb
> =3D> python3-rfc3339-validator_0.1.4.bb} (83%)
>  rename
> meta-python/recipes-devtools/python/{python3-robotframework_4.0.1.bb =3D>
> python3-robotframework_4.0.2.bb} (91%)
>
