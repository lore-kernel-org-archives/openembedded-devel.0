Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14741C2D0CD
	for <webhook@archiver.kernel.org>; Sat, 17 May 2025 19:05:20 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
 by mx.groups.io with SMTP id smtpd.web10.17456.1747508709556564406
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 17 May 2025 12:05:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gP2aSicL;
 spf=pass (domain: gmail.com, ip: 209.85.208.173, mailfrom: martin.jansa@gmail.com)
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-32909637624so6233251fa.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 17 May 2025 12:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747508707; x=1748113507; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NFQTSy9+0fYzY8XnMy36914ZYn5xv/Gwiqz7kqiT8Ik=;
        b=gP2aSicL/XedX9b6a31wet3j82k0kxrOJJn9xYI35UtfS/zeZmsYQlfwRQourlaI8q
         +2EP6Xer78hppIid3aqKnZPfV0nREohrGOSho6sO5tJMQzCjNmtWXHUeQj2QcvOf00i/
         T5IqnLLQ1uOjaHPl9NaSh3/1oqBOHA1uH+ZizlCCP2bpIyXLLIYWTZR1GYndBhnl6hkD
         DyQSnUGp1nschCfMj6YUkFtm/yfY2ydgpBAbhpgFzq8oPpaqeT0DTRLeaKVXthhHqd5F
         0+HIOy9KP+TCO5P5DwI515n4uT/KkiFL3+2qabFrImbRHdOdD7ULOmV2iAD8ByTyNuKy
         T5iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747508707; x=1748113507;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NFQTSy9+0fYzY8XnMy36914ZYn5xv/Gwiqz7kqiT8Ik=;
        b=iOp5vHmmyKW8+608WDr4/SKbOU7UkhWPJBylzewjxZkJsgQymuykWK0W7J2IefTKQQ
         98HaBB/cuNccGN/JSQH0l8ZW2oKX2cV2X3ARIi0YY1jg421ljtz2H9Hhv71UeSN4zCoa
         S2WbagTpKYaagprDpOKm0sf6Iwk9rvYVAUIApsUiqAg9PevofqXCTfbBR7wYXqdzF0Gi
         b65F8TZ0unaMSkjWH/N0Hew3GBnIULHZu7Uhw6b0AoLl8izD140yXKxIq/9k6yPZghcR
         lEY6p0vr57qrgysOWMkOCWIy+KtFbCTusZGGTTo6NceP55IptS+8UD5s8+7HhZvk1O46
         mmUA==
X-Forwarded-Encrypted: i=1; AJvYcCVVonzK0cv9bWUoth9x2zjoGW0qmaySeBLb65uSWT9UDTz/94g6J79xYelrcYQuK7QAHLkiAA+2sKjxehDlfKx1dho=@lists.openembedded.org
X-Gm-Message-State: AOJu0YwBr3NvTrC38WyJrpy9z/ZCZO9W6guGrrSELq4amBf68BmKRp31
	V6UFVHcfwFvPBTQCzvR/2j3bqEqwVfGEgdgfMhIB27MPn9nfKHYLRfJqlOEs8OFJ1VL36aV4MUh
	ro2yYHAOXR6PtKi6+pdbyWN3+KIaKVRA=
X-Gm-Gg: ASbGnctjX7Qs1z95yzEsOR8wSZJA1TKRDo7VSfXjozQXkN0aVYEhjUiuHZffk18MFIx
	eZfKtNP220Esp9JUeEPsC4RcfiQEBBo9P/8JxocG4OOmC/3FrXp37Nv1KR3y0piBxzW5wABGPL1
	O/pSKNoh3QiHCgW8WOtUYsrJSue5ZXelfQoVA=
X-Google-Smtp-Source: AGHT+IHaeWJmjNII3Z27insrhhz7R+YwT8lGDH1QMMddcY/E3WYjLFY1jjwyt01J309JcLS5YymfyXdPXeTpNV91oxE=
X-Received: by 2002:a05:651c:54b:b0:307:deea:f576 with SMTP id
 38308e7fff4ca-328077c37efmr26247811fa.34.1747508707225; Sat, 17 May 2025
 12:05:07 -0700 (PDT)
MIME-Version: 1.0
References: <b890ddb1-a925-4b80-997c-15d7486d12b2@gmail.com>
In-Reply-To: <b890ddb1-a925-4b80-997c-15d7486d12b2@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sat, 17 May 2025 21:04:55 +0200
X-Gm-Features: AX0GCFsQvDUQ9OBMYRTH1npelJ9-BClX75SMfKgLTmgcRPA7bNCkFN_PcYYOXdM
Message-ID: <CA+chaQfCK=W0sNv0=imkoNCatJb0ykF+2GOrJhhqxDUOPajm=Q@mail.gmail.com>
Subject: Re: [oe] walnascar merge request: May 17th
To: akuster808@gmail.com
Cc: Khem Raj <raj.khem@gmail.com>, 
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 17 May 2025 19:05:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117445

On Sat, May 17, 2025 at 7:59=E2=80=AFPM Armin Kuster via
lists.openembedded.org <akuster808=3Dgmail.com@lists.openembedded.org>
wrote:
>
> The following changes since commit 0d2d2d193a1619b6dbebaf335f1ef785478049=
e3:
>
>    meta-openemnedded: Add myself as walnascar maintainer (2025-04-16
> 18:20:05 -0700)
>
> are available in the Git repository at:
>
>    https://git.openembedded.org/meta-openembedded walnascar-next
>
> for you to fetch changes up to 2169c9afcc0945045bea49f58011080942d4ddb4:
>
>    pipewire: Avoid having pipewire-native depend on pipewire (2025-05-17
> 11:56:50 -0600)
>
> ----------------------------------------------------------------
> Changqing Li (6):
>        version-check.conf: add CHECK_VERSION_PV for pn-netperf
>        python3-pyyaml-include: update SRCREV
>        version-check.conf: mute bridge-utils version mismatch warning
>        libuser: correct the package version
>        turbostat: make turbostat's version align with kernel version
>        lvm2: correct PKGV for package libdevmapper
>
> Jason Schonberg (2):
>        c-ares: upgrade 1.34.1 -> 1.34.2
>        c-ares: upgrade 1.34.2 -> 1.34.3
>
> Khem Raj (2):
>        apache2: Scrub -ffile-prefix-map in build.nice file
>        python3-posix-ipc: switch to PEP-517 build backend
>
> Peter Kjellerstedt (2):
>        meta-networking/README.md: Correct the branch for dependent layers
>        pipewire: Avoid having pipewire-native depend on pipewire
>
> Wang Mingyu (2):
>        php: upgrade 8.4.5 -> 8.4.6
>        python3-posix-ipc: upgrade 1.1.1 -> 1.2.0

This upgrade needs additional fix from:
https://git.openembedded.org/meta-openembedded/commit/?id=3D14fa41b559b1d4e=
4185094ab38494c0f2010f297

> Yi Zhao (1):
>        catch2: upgrade 3.8.0 -> 3.8.1
>
> Yogita Urade (1):
>        poppler: upgrade 25.01.0 -> 25.04.0
>
>   .../libuser/0001-configure.ac-update-version-to-0.64.patch      | 25
> ++++++++++++++++
>   meta-gnome/recipes-support/libuser/libuser_0.64.bb              | 1 +
>   meta-multimedia/recipes-multimedia/pipewire/pipewire_1.4.1.bb   | 4 ++-
>   meta-networking/README.md                                       | 6 ++-=
-
>   meta-oe/conf/version-check.conf                                 | 3 ++
>   meta-oe/recipes-devtools/php/php/0003-iconv-fix-detection.patch | 11
> +++----
>   meta-oe/recipes-devtools/php/{php_8.4.5.bb =3D> php_8.4.6.bb} |  2 +-
>   .../recipes-kernel/turbostat/{turbostat_3.4.bb =3D> turbostat.bb} |  7 =
+++++
>   .../c-ares/{c-ares_1.34.1.bb =3D> c-ares_1.34.3.bb} |  2 +-
>   meta-oe/recipes-support/lvm2/lvm2.inc                           | 23
> +++++++++++++++
>   .../poppler/{poppler_25.01.0.bb =3D> poppler_25.04.0.bb} |  2 +-
>   .../recipes-test/catch2/{catch2_3.8.0.bb =3D> catch2_3.8.1.bb} |  2 +-
>   .../0001-Use-default-cc-from-environment-variable.patch         | 45
> -----------------------------
>   .../{python3-posix-ipc_1.1.1.bb =3D> python3-posix-ipc_1.2.0.bb} |  8 +=
+---
>   .../recipes-devtools/python/python3-pyyaml-include_2.2.bb       | 6 +++=
-
>   meta-webserver/recipes-httpd/apache2/apache2_2.4.63.bb          | 2 +-
>   16 files changed, 82 insertions(+), 67 deletions(-)
>   create mode 100644
> meta-gnome/recipes-support/libuser/libuser/0001-configure.ac-update-versi=
on-to-0.64.patch
>   rename meta-oe/recipes-devtools/php/{php_8.4.5.bb =3D> php_8.4.6.bb} (9=
9%)
>   rename meta-oe/recipes-kernel/turbostat/{turbostat_3.4.bb =3D>
> turbostat.bb} (94%)
>   rename meta-oe/recipes-support/c-ares/{c-ares_1.34.1.bb =3D>
> c-ares_1.34.3.bb} (91%)
>   rename meta-oe/recipes-support/poppler/{poppler_25.01.0.bb =3D>
> poppler_25.04.0.bb} (96%)
>   rename meta-oe/recipes-test/catch2/{catch2_3.8.0.bb =3D>
> catch2_3.8.1.bb} (92%)
>   delete mode 100644
> meta-python/recipes-devtools/python/python3-posix-ipc/0001-Use-default-cc=
-from-environment-variable.patch
>   rename meta-python/recipes-devtools/python/{python3-posix-ipc_1.1.1.bb
> =3D> python3-posix-ipc_1.2.0.bb} (51%)
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#117444): https://lists.openembedded.org/g/openembedde=
d-devel/message/117444
> Mute This Topic: https://lists.openembedded.org/mt/113165095/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [m=
artin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

