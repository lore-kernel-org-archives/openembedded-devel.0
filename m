Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9AD8C83F17
	for <webhook@archiver.kernel.org>; Tue, 15 Jul 2025 19:01:19 +0000 (UTC)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
 by mx.groups.io with SMTP id smtpd.web11.3293.1752606075017193281
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Jul 2025 12:01:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=R3Z6NfY6;
 spf=pass (domain: gmail.com, ip: 209.85.219.177, mailfrom: raj.khem@gmail.com)
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e8b67d2acfbso5257324276.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 15 Jul 2025 12:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752606074; x=1753210874; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JfZkRopt59ZceMwAnYpxTxGUyswEwz3843G+6Jw1G/E=;
        b=R3Z6NfY64pwtnB/Z+OdxocRY53DP6qQEyYhJ1jDUlJ7Xe7ZfKGjLWD/qQRbqz99Qnw
         sqPSUZAZITQw2cFU0+ge/6IsxPJpOQw/X1hgxZ33oibERDRMJqG5SnOt5KL24xbF2kCS
         sItsu2yasNAmTDznHKwUHgc7QkWl0KaAuPHcOPFN+n1XqIDwzD1hXbEjqnH3Z8gwMWtK
         G6p4OV5RxdI1fNJOEUI8SFJRkR5a4ZLGWcu+5HltTlwgyhWxp/XSG+M8u9xiGfXb5cOQ
         Y+bW0G6O/bblVXVhjuVEvoG182pKa/0MpMYS1Wl5K+RLw253RwvUOVbLI72Aeg1vLHRI
         HBLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752606074; x=1753210874;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JfZkRopt59ZceMwAnYpxTxGUyswEwz3843G+6Jw1G/E=;
        b=filknzWuxv/qHhpmKO2fzSpPX5rlPrMs/+opgGobfmB8eanQOJSPXmfrFZnkqVznep
         ldCBlXN1ehcjCZznutjA0K8sy+gqP+OfnK0p5ONLpWXW+aqn/7a800nIJtuszlpHOAWW
         uNqlnIX9V+pUvsBRrOeGsNDniSrUSb2jPFWo46OFrWv+7RM+6nKPX9aZia9lQCHlx9v6
         IxvGwBEyc6NLcALLABPP8o3DKEh9b9FOn61uh9tw98LEuC3v/FgQvTHW9QajBLruTaIp
         GV0qPloTYIaxn7xY7/nubivQnjdsWwQJ2WzTe9zPE5wFEvqXWpWt62jyYks/VzXQt48I
         TkDQ==
X-Gm-Message-State: AOJu0Yzig3dI1o2lGozrIKZ6Agdfh22Y7thwrGoFEUUGNsGKtXZnm5BD
	7jyf2QyADq5D9XePL/mrrbMRkyQGmWDTg5RvhPI5G4dfC7MtmbCaC1BFOvDud5kjRahDFTgyljB
	otbUCV9dI2RXa+6Si3QQiBRrs8awUMjs=
X-Gm-Gg: ASbGncs4tDy6h6WbLl2MYl1qNw46slPrdNt0z7XxOIAOZQBJ8wYN+Wed8og02q5qEGm
	oSeTxlbUbpYwiN1etR+VAp9q+/yLdxIsgmPJVtrTcak8dxb8ionjnsJdEtNf+Qk67C/0JCpWY/W
	sUIQgUIJ99GDMsanZ4F8jty1g4d/X5xl4JU/PtDhSl9C9pNEGVptmHHkGzpHejtAhTEsjE1K1Is
	crq0zGKrj4z4rZKTB5ePxPgktd/aoNsBGaRePd9ESQd/Q==
X-Google-Smtp-Source: AGHT+IHat9cI3VANsRVZmKoKRRDV4070aVKXp+p9/j5Ns9fdW2HjELPwCsyxFqTFx7djt588mGng24wyKkikpt8ksWM=
X-Received: by 2002:a05:6902:480f:b0:e8b:bc7c:af56 with SMTP id
 3f1490d57ef6-e8bc1d9efa7mr336287276.49.1752606073640; Tue, 15 Jul 2025
 12:01:13 -0700 (PDT)
MIME-Version: 1.0
References: <20250715095402.591088-1-leon.anavi@konsulko.com>
In-Reply-To: <20250715095402.591088-1-leon.anavi@konsulko.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 15 Jul 2025 12:00:47 -0700
X-Gm-Features: Ac12FXycl43WVCLo_4cYFi5Zsu-6GSGgAKYp3L872PzmLI1A7uNGbzesasXN-4Y
Message-ID: <CAMKF1soE0N22PRCEV2Kw2Mt9PUwMWpYnqS9YM2j_g9YbdX0Lxg@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH 1/2] python3-mypy: Upgrade 1.15.0 -> 1.17.0
To: leon.anavi@konsulko.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 15 Jul 2025 19:01:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118566

This regressed python3-charset-normalizer module

https://errors.yoctoproject.org/Errors/Details/872281/

On Tue, Jul 15, 2025 at 2:54=E2=80=AFAM Leon Anavi via lists.openembedded.o=
rg
<leon.anavi=3Dkonsulko.com@lists.openembedded.org> wrote:
>
> Upgrade to release 1.17.0:
>
> - Mypy can now optionally generate an error if a match statement
>   does not match exhaustively, without having to use
>   assert_never(...). Enable this by using --enable-error-code
>   exhaustive-match.
> - Handle corner case: protocol/class variable/descriptor
> - Fix a few inconsistencies in protocol/type object interactions
> - Refactor/unify access to static attributes
> - Remove inconsistencies in operator handling
> - Make protocol subtyping more consistent
> - Fix nondeterministic type checking by making join with explicit
>   Protocol and type promotion commute
> - Fix nondeterministic type checking caused by nonassociative of
>   None joins
> - Fix nondeterministic type checking caused by nonassociativity of
>   joins
> - Fix nondeterministic type checking by making join between type
>   and TypeVar commute
> - Mypy only supports Python 3.9+. The --force-uppercase-builtins
>   flag is now deprecated as unnecessary, and a no-op. It will be
>   removed in a future version.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
> ---
>  .../python/{python3-mypy_1.15.0.bb =3D> python3-mypy_1.17.0.bb}  | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>  rename meta-python/recipes-devtools/python/{python3-mypy_1.15.0.bb =3D> =
python3-mypy_1.17.0.bb} (82%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-mypy_1.15.0.bb b=
/meta-python/recipes-devtools/python/python3-mypy_1.17.0.bb
> similarity index 82%
> rename from meta-python/recipes-devtools/python/python3-mypy_1.15.0.bb
> rename to meta-python/recipes-devtools/python/python3-mypy_1.17.0.bb
> index ebcac51ea1..0d1e0bd16e 100644
> --- a/meta-python/recipes-devtools/python/python3-mypy_1.15.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-mypy_1.17.0.bb
> @@ -5,7 +5,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D8d62fd8f8648cb=
018e52857347e340b9"
>
>  inherit pypi python_setuptools_build_meta
>
> -SRC_URI[sha256sum] =3D "404534629d51d3efea5c800ee7c42b72a6554d6c400e6a79=
eafe15d11341fd43"
> +SRC_URI[sha256sum] =3D "e5d7ccc08ba089c06e2f5629c660388ef1fee708444f1dee=
0b9203fa031dee03"
>
>  BBCLASSEXTEND =3D "native"
>
> @@ -14,6 +14,7 @@ DEPENDS +=3D " \
>      python3-types-psutil-native \
>      python3-types-setuptools-native \
>      python3-typing-extensions-native \
> +    python3-pathspec-native \
>  "
>
>  RDEPENDS:${PN} +=3D " \
> --
> 2.39.5
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#118556): https://lists.openembedded.org/g/openembedde=
d-devel/message/118556
> Mute This Topic: https://lists.openembedded.org/mt/114163958/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

