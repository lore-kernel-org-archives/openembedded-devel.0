Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3FBEC77B7A
	for <webhook@archiver.kernel.org>; Fri, 19 May 2023 16:10:39 +0000 (UTC)
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
 by mx.groups.io with SMTP id smtpd.web11.30436.1684512632058111136
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 May 2023 09:10:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=RLEgm+xq;
 spf=pass (domain: gmail.com, ip: 209.85.167.170, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-38eda4ef362so2065129b6e.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 19 May 2023 09:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684512631; x=1687104631;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OUOdAihysm2hM29kpBp+QsSTtiQDyCnzIlmg8H/ElFI=;
        b=RLEgm+xqSzN2R8Sc3rG/Icjx++O4jcimI+WGZ6uJq0I5UO8McwRK++uEccv5I08BhY
         InxnWeMehjwl7NFn7eXSGg04CPjbdp2g4IY0Bd1Es6QUPMsQhxdUA9IEa4O60RhbohQb
         vNH8MZnoLHlv3Och6FbW8ktQLUndDXB7hYp30R69vlvw9bjf2f9hBIG4+35eZd4oCrR5
         odQP5WJGOJhgWzDpKJEyEcSUGstx8MGxtsluGQor/CTw+6XivKOVCSBKoEQkD3ym77c6
         nLQ0sAOxA3Y279pL3wMuYE042Tb20DUyGeMJnBzxF6DmJaa7MKNEvVz0HJWIdNlMIW2A
         jWkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684512631; x=1687104631;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OUOdAihysm2hM29kpBp+QsSTtiQDyCnzIlmg8H/ElFI=;
        b=Yt4mjvns77hjLZW9DyOogAMvudcG2jOzI9OJOEAkTPCSlQu+9g1X/cmdGkd+HhdQjq
         frN0HV99T32UL18jLOHMTaxhBW/E4Kfw5QNy5wVOLOvCzhbvgYH8O7tFP1iwkJzlGIW/
         qSircUNcKLTyONF50fpgBfTk/wfphDyv5aNBB1laVRLQXFD5U3xIC5HR/dESKQVqcOKs
         fbIUw35UHFo+oFJlANhabRRor0OGJqul/Rl0lgwQpWwDn8vrZORbYnDnWIQf6o4iQTzO
         P3ppwli6yhbjRZUGX2O3mSkFY8azJDMeZOtIGXT+LdXIggLx7wmAg4ygkRBs4KU2Qa4F
         yg9g==
X-Gm-Message-State: AC+VfDz6QtVOCy4vuIpYOTWsICPxAP94UlCwcJyLm5oPuzlqc3xXsLJH
	eDF4fbldQOuWakb7luQLOXoK1Y04x6kk08rwp/k=
X-Google-Smtp-Source: ACHHUZ5dOYYpJbnqAwATxuyZSAWzB7AqR91QxSrcQNJoRZMxcGd0w0p6fPveRTOfqF5HF9FZp5Nt8XrP9PL9ZLaRGSg=
X-Received: by 2002:aca:120e:0:b0:393:fb3e:6151 with SMTP id
 14-20020aca120e000000b00393fb3e6151mr1317101ois.50.1684512631045; Fri, 19 May
 2023 09:10:31 -0700 (PDT)
MIME-Version: 1.0
References: <400ca12b-5176-d872-3314-1dfed4de43e7@gmail.com>
In-Reply-To: <400ca12b-5176-d872-3314-1dfed4de43e7@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 19 May 2023 09:10:05 -0700
Message-ID: <CAMKF1spC+SaY7rd_Cu_e536joNuMdJLAeUvgPpTZ5C3A89aBeg@mail.gmail.com>
Subject: Re: mickeldore merge request: May 19th
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 19 May 2023 16:10:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102674

merged thanks Armin.

On Fri, May 19, 2023 at 5:57=E2=80=AFAM akuster808 <akuster808@gmail.com> w=
rote:
>
> The following changes since commit 54b177f4acb3048d21a68f180fc183d0fdf47a=
94:
>
>    meta-networking/licenses/netperf: remove unused license (2023-05-08
> 08:03:30 -0400)
>
> are available in the Git repository at:
>
>    https://git.openembedded.org/meta-openembedded mickledore-next
>
> for you to fetch changes up to c032fd0b1a9d444711103c2703dfa8e2964a3865:
>
>    redis: upgrade 6.2.11 -> 6.2.12 (2023-05-16 07:32:31 -0400)
>
> ----------------------------------------------------------------
> Changqing Li (1):
>        redis: upgrade 6.2.11 -> 6.2.12
>
> Martin Jansa (14):
>        libreport: add dependency on libarchive
>        libxmlb: add missing dependency on glib-2.0 and xz
>        geoclue: fix build without gobject-introspection-data
>        appstream: fix build without gobject-introspection-data
>        ostree: fix build without gobject-introspection-data
>        rdfind: fix build with -Werror=3Dreturn-type
>        spice-gtk: respect gobject-introspection-data
>        cpulimit: fix do_install with multilib
>        libnfs: fix installed-vs-shipped issues with multilib
>        btrfsmaintenance: install to ${datadir}/${BPN}
>        libtomcrypt: pass LIBPATH to fix installed-vs-shipped with multili=
b
>        nanopb: fix installed-vs-shipped with multilib
>        nv-codec-headers: fix installed-vs-shipped with multilib
>        zfs: fix installation paths for multilib
>
>   meta-filesystems/recipes-filesystems/zfs/zfs_2.1.9.bb           | 36
> ++++++++++------
>   .../recipes-utils/btrfsmaintenance/btrfsmaintenance_0.5.bb      | 4 +-
>   .../nv-codec-headers/nv-codec-headers_12.0.16.0.bb              | 2 +-
>   meta-networking/recipes-support/spice/spice-gtk_0.42.bb         | 9 +++=
-
>   ...1-CMakeLists.txt-allow-to-set-PYTHON_INSTDIR-from-outs.patch | 67
> +++++++++++++++++++++++++++++
>   .../meta-python/recipes-devtools/nanopb/nanopb_0.4.7.bb         | 6 ++-
>   ...1-CMakeLists.txt-respect-CMAKE_INSTALL_LIBDIR-for-mult.patch | 61
> ++++++++++++++++++++++++++
>   meta-oe/recipes-connectivity/libnfs/libnfs_5.0.2.bb             | 4 +-
>   meta-oe/recipes-crypto/libtomcrypt/libtomcrypt_1.18.2.bb        | 2 +-
>   meta-oe/recipes-extended/libreport/libreport_2.17.8.bb          | 2 +-
>   meta-oe/recipes-extended/ostree/ostree_2023.2.bb                | 3 ++
>   .../recipes-extended/redis/{redis_6.2.11.bb =3D> redis_6.2.12.bb} |  2 =
+-
>   meta-oe/recipes-gnome/libxmlb/libxmlb_0.3.10.bb                 | 2 +
>   ...1-libgeoclue-don-t-try-to-use-g-ir-scanner-when-intros.patch | 30
> +++++++++++++
>   meta-oe/recipes-navigation/geoclue/geoclue_2.7.0.bb             | 4 +-
>   meta-oe/recipes-support/appstream/appstream_0.16.1.bb           | 2 +-
>   meta-oe/recipes-support/cpulimit/cpulimit_0.2.bb                | 4 +-
>   .../rdfind/0001-configure.ac-fix-C-11-support-check.patch       | 37
> ++++++++++++++++
>   meta-oe/recipes-support/rdfind/rdfind_1.5.0.bb                  | 1 +
>   19 files changed, 251 insertions(+), 27 deletions(-)
>   create mode 100644
> meta-oe/dynamic-layers/meta-python/recipes-devtools/nanopb/nanopb/0001-CM=
akeLists.txt-allow-to-set-PYTHON_INSTDIR-from-outs.patch
>   create mode 100644
> meta-oe/recipes-connectivity/libnfs/libnfs/0001-CMakeLists.txt-respect-CM=
AKE_INSTALL_LIBDIR-for-mult.patch
>   rename meta-oe/recipes-extended/redis/{redis_6.2.11.bb =3D>
> redis_6.2.12.bb} (96%)
>   create mode 100644
> meta-oe/recipes-navigation/geoclue/geoclue/0001-libgeoclue-don-t-try-to-u=
se-g-ir-scanner-when-intros.patch
>   create mode 100644
> meta-oe/recipes-support/rdfind/rdfind/0001-configure.ac-fix-C-11-support-=
check.patch
>

