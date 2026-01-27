Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05307D2594A
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 06:07:55 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3921.1769494065580019662
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Jan 2026 22:07:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JnRgliFN;
 spf=pass (domain: gmail.com, ip: 209.85.128.182, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-7946a1f2430so12845367b3.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 26 Jan 2026 22:07:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769494065; cv=none;
        d=google.com; s=arc-20240605;
        b=E+jJs/0B5jP2ln8gzCrOxSaA10nih0LmjEORRXe6fRPjGcxGOZLd0SnG8sBxTC5sDp
         qsTmCXx0dNnCWoQj31/T7ynZ1z43xIBJObsrnP3PM01cAg2HN/JeEBLJdqY+SNc3Alwr
         wYBxtS2sNq/o9YGK43p3cCqRF6UM+Fe/1VQ2UW9Njkmap/P3dVbu8qnO/NDgKo6PDlSL
         jFXwA46sg7V/rSv1KsdDoZBi4+vImgL2OHD4dl35kHK8rA+RWBSIu2SrOZcr54qEFvGq
         YdiOTVMIP0OhE7B61Zcv8QXgYKQFGkCBAww3aarnm+Q4J4xcGh7WyYA80PhOSDP4AbJL
         lezQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=vucfYN7D86DXpuGeHzpqZhuisZMhMrsBmQQFK1YYA3k=;
        fh=PqrvWOQDuMW7DBEZMtJk4sUef2SPa7RI/TJA4C6UjCM=;
        b=ZGAMybwnjgkMYXW+f9+eIExmsu+jZftVS4R0wFvH48k4ppN0/LirjtCNX2t+wE1apX
         E6dXLoVfgUumIPO2L9DDBhiWSGE0yLo0Bsj7PojyXxtWOaGsop9uIjmB38+xgiVix+Nq
         08ua3rUXWo0/DNCC2NYHmNh11bHQGAZ5A5ocZPJYi254qRh9rarX7/8fwnmgHfg4/3p+
         7n/loWA8leekzw7jlHEPJ9SZ3KNkLhyVOMhH+rnNpQ0qaD0yTGhNXQ7+uCOBfSARbYfz
         OrguQJygWn9YRNYYBNtSTLIQ1DMQOd2HxIsp6WqhbmBFvL4BhX2tnAc/cSxfYyiNRBZw
         2oaw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769494065; x=1770098865; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vucfYN7D86DXpuGeHzpqZhuisZMhMrsBmQQFK1YYA3k=;
        b=JnRgliFNssZNU8svVVqruzmBR4z3pnLnaOKcLmTQHRNjkvLhSiwKtcItoyyyY858h8
         kqj9vhiFS7p1uaOVyEbRWFrKbA/7p1TOIGvsuXJ+7tvtcLJyJFbxQVisKRzeEWp0OsXf
         c7d6l1hCh5rfKoFJAS6TYXS5A6U8E+PlcVlA6MJx3JCVvsnapCjEkWFd2LBKXmEm7Ynv
         1KUFdsmTUNFwYmDdy8cwZreW2N7JNr80IH71VzIeyBT+GtE/iylTiQ4xxjmYtG99zOjS
         4sehBDTKiRFe77nzjLv509zGvHz9cXSUmvkiu0pzMETcx0uXqQUl72apuauqni3SMuz1
         ikjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769494065; x=1770098865;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vucfYN7D86DXpuGeHzpqZhuisZMhMrsBmQQFK1YYA3k=;
        b=SC2ZRkzR+heaeBWsw0xB5LVvMkquZvPPDkpdH4J6GAD9fjYk7vPyPpTH28a9G9+XYe
         OEKoW2eMDfWuwZKdxWWu9VVeYkWHhHMk2ZLanOjo7/olU4/mU4dJs6zwL9LX4NFeJlXl
         3wEaeanwzAxn2eK9dFlKG9Ewzuc+7z/NnXsng7Gnwma1hxIeiYubgB3whZXOstHm6Yvw
         CrWsIEMdD546eHBpJY9rQTFcE/F0UWizmFvYWH/yKqa7ez0D5r516FnfY4I4701Crlxv
         xGMAJK5ZLX3Q09r0RIf2dt3S/vH3oUaPrqN6eEhRaKQxsnGizQtyA5PKkK26ZNl9BokL
         11+g==
X-Gm-Message-State: AOJu0Yxu1RMGwZgXy9U1pTNLHV9iWxooL2JqEiHMMkJJzHSxQmiEVPb2
	O1BJj6yp0IcGZeNdcAh+zzWGq5vjZ0IfI1q//cnonwmNQvUl+iK7PHEZISzAEXUpqIliIvuVP22
	5FUWADm/4QBL3RpOxuMgi2j5vhMvRc4a+wbf37is=
X-Gm-Gg: AZuq6aKxxhR9Gs0J4WWogMCOdb0FrLkYkD9tHnGiHbECqMPIC0J9l0PEx49fBH9TLku
	Eo1B7Cc7X5ph4pZHHJMFLQs/Fp/A7L/7S4EQEGRlx6AwblRL8HTKO1WYaAAEPgRSsNuxCP18XPu
	paTkOvbqdsz4V9Pp86J1BVe/n6K4jDoVWZSm0xvra8Jpnisu8Y/j21hz44NhVEZ9vPAsmNE34Ul
	5ZzPwtxRwVQKRqQ8gCx2y57VPcxCkeJXsivBWl00q5kYNJas8YWjZo7m00B9j3I2MGx4CJtOoM4
	RzSeb8Wn6aLUr2h1jOAy2VvpT+WzNvaA49DZX5qNrDohm9grbFYk9EW+SGlBSbBLW9RZ1v+bntp
	hWcC+izA/Ub3eYq5JJmWkaA2tdBj3iIwVkh81AE8/4kWV
X-Received: by 2002:a05:690c:3608:b0:794:ef5:cf9f with SMTP id
 00721157ae682-7947ac99db1mr4430997b3.60.1769494064453; Mon, 26 Jan 2026
 22:07:44 -0800 (PST)
MIME-Version: 1.0
References: <20260126114506.3846753-1-skandigraun@gmail.com>
In-Reply-To: <20260126114506.3846753-1-skandigraun@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 26 Jan 2026 22:07:18 -0800
X-Gm-Features: AZwV_QjtB9aboqil0Sdw5UP8EligSTMAeUyRUe07c5O7CHJwKyvU4w7xbgCrNoA
Message-ID: <CAMKF1sqVoZJ0eTnb6WrGt0KB2N+g4OHA4qCLG9Kdp_Q=hZsRqw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 1/4] fontforge: upgrade 20230101 -> 20251009
To: skandigraun@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000024dda306495871cd"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Jan 2026 06:07:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123907

--00000000000024dda306495871cd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 26, 2026 at 3:45=E2=80=AFAM Gyorgy Sarvari via lists.openembedd=
ed.org
<skandigraun=3Dgmail.com@lists.openembedded.org> wrote:

> Drop patches that are inluded in this release.
>
> libxi has been removed as a dependency, because the project has dropped
> the x11 drawing backend, it implements everything in gtk.
>
> Changelog: https://github.com/fontforge/fontforge/releases/tag/20251009
>
> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> ---
>  ...ons-containing-invalid-directives-hs.patch | 385 ------------------
>  .../CVE-2024-25081_CVE-2024-25082.patch       | 181 --------
>  ...orge_20230101.bb =3D> fontforge_20251009.bb} |  18 +-
>  3 files changed, 4 insertions(+), 580 deletions(-)
>  delete mode 100644
> meta-oe/recipes-graphics/fontforge/fontforge/0001-Fix-Translations-contai=
ning-invalid-directives-hs.patch
>  delete mode 100644
> meta-oe/recipes-graphics/fontforge/fontforge/CVE-2024-25081_CVE-2024-2508=
2.patch
>  rename meta-oe/recipes-graphics/fontforge/{fontforge_20230101.bb =3D>
> fontforge_20251009.bb} (72%)
>
> diff --git
> a/meta-oe/recipes-graphics/fontforge/fontforge/0001-Fix-Translations-cont=
aining-invalid-directives-hs.patch
> b/meta-oe/recipes-graphics/fontforge/fontforge/0001-Fix-Translations-cont=
aining-invalid-directives-hs.patch
> deleted file mode 100644
> index 6d133254ed..0000000000
> ---
> a/meta-oe/recipes-graphics/fontforge/fontforge/0001-Fix-Translations-cont=
aining-invalid-directives-hs.patch
> +++ /dev/null
> @@ -1,385 +0,0 @@
> -From e6ccc8a8cf1391010a8220836a732da9fab19c69 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Thu, 7 Sep 2023 12:35:12 -0700
> -Subject: [PATCH] Fix Translations containing invalid directives %hs
> -
> -Found with gettext 0.22
> -Older versions of msgfmt were more sloppy, thus allowing such mistakes t=
o
> cause bugs at runtime.
> -
> -https://bugs.gentoo.org/908868
> -https://savannah.gnu.org/bugs/index.php?64333
> -https://github.com/fontforge/fontforge/issues/5251
> -
> -Upstream-Status: Pending
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - fontforgeexe/searchview.c |  2 +-
> - po/ca.po                  |  4 ++--
> - po/de.po                  |  4 ++--
> - po/en_GB.po               |  4 ++--
> - po/fr.po                  | 40 +++++++++++++++++++--------------------
> - po/hr.po                  |  4 ++--
> - po/it.po                  |  8 ++++----
> - po/ja.po                  |  4 ++--
> - po/ko.po                  |  4 ++--
> - po/pl.po                  |  4 ++--
> - po/uk.po                  |  4 ++--
> - po/vi.po                  |  4 ++--
> - 12 files changed, 43 insertions(+), 43 deletions(-)
> -
> -diff --git a/fontforgeexe/searchview.c b/fontforgeexe/searchview.c
> -index 1cb39a221..7e1c109cb 100644
> ---- a/fontforgeexe/searchview.c
> -+++ b/fontforgeexe/searchview.c
> -@@ -516,7 +516,7 @@ return( true );
> -                   if ( ask_if_difficult=3D=3D2 && !searcher->isvisible =
)
> - return( false );
> -                   if ( gwwv_ask(_("Bad Reference"),(const char **)
> buttons,1,1,
> --                          _("The %1$s in the search dialog contains a
> reference to %2$.20hs which does not exist in the new font.\nShould I
> remove the reference?"),
> -+                          _("The %1$s in the search dialog contains a
> reference to %2$.20s which does not exist in the new font.\nShould I remo=
ve
> the reference?"),
> -                               i=3D=3D0?_("Search Pattern"):_("Replace
> Pattern"),
> -                               r->sc->name)=3D=3D1 )
> - return( false );
> -diff --git a/po/ca.po b/po/ca.po
> -index e2349b6ef..6c920b7c0 100644
> ---- a/po/ca.po
> -+++ b/po/ca.po
> -@@ -12347,11 +12347,11 @@ msgstr "Tai"
> -
> - #, c-format
> - msgid ""
> --"The %1$s in the search dialog contains a reference to %2$.20hs which
> does "
> -+"The %1$s in the search dialog contains a reference to %2$.20s which
> does "
> - "not exist in the new font.\n"
> - "Should I remove the reference?"
> - msgstr ""
> --"Al di=C3=A0leg de cerca, %1$s cont=C3=A9 una refer=C3=A8ncia a %2$.20h=
s\n"
> -+"Al di=C3=A0leg de cerca, %1$s cont=C3=A9 una refer=C3=A8ncia a %2$.20s=
\n"
> - "que no existeix en el nou tipus.\n"
> - "Voleu eliminar la refer=C3=A8ncia?"
> -
> -diff --git a/po/de.po b/po/de.po
> -index 41430ffae..8a31aeaa2 100644
> ---- a/po/de.po
> -+++ b/po/de.po
> -@@ -15765,11 +15765,11 @@ msgstr ""
> -
> - #, c-format
> - msgid ""
> --"The %1$s in the search dialog contains a reference to %2$.20hs which
> does "
> -+"The %1$s in the search dialog contains a reference to %2$.20s which
> does "
> - "not exist in the new font.\n"
> - "Should I remove the reference?"
> - msgstr ""
> --"%1$s im Suchdialog enth=C3=A4lt eine Referenz auf %2$.20hs, die in der=
 neuen
> "
> -+"%1$s im Suchdialog enth=C3=A4lt eine Referenz auf %2$.20s, die in der =
neuen "
> - "Schrift nicht existiert.\n"
> - "Soll der Referenz entfernt werden?"
> -
> -diff --git a/po/en_GB.po b/po/en_GB.po
> -index 9bd2d62bb..fce64c97d 100644
> ---- a/po/en_GB.po
> -+++ b/po/en_GB.po
> -@@ -728,11 +728,11 @@ msgstr "Template Colour"
> -
> - #, c-format
> - msgid ""
> --"The %1$s in the search dialog contains a reference to %2$.20hs which
> does "
> -+"The %1$s in the search dialog contains a reference to %2$.20s which
> does "
> - "not exist in the new font.\n"
> - "Should I remove the reference?"
> - msgstr ""
> --"The %1$s in the search dialogue contains a reference to %2$.20hs which
> does "
> -+"The %1$s in the search dialogue contains a reference to %2$.20s which
> does "
> - "not exist in the new font.\n"
> - "Should I remove the reference?"
> -
> -diff --git a/po/fr.po b/po/fr.po
> -index 26e446b38..d130f89bc 100644
> ---- a/po/fr.po
> -+++ b/po/fr.po
> -@@ -291,7 +291,7 @@ msgstr "cha=C3=AEne %1$.30s pour %2$.30s"
> - #. GT: $4 is the changed flag ('*' for the changed items)
> - #, c-format
> - msgid "%1$.80s at %2$d from %3$.90s%4$s"
> --msgstr "%1$.80s =C3=A0 %2$d de %3$.90hs%4$s"
> -+msgstr "%1$.80s =C3=A0 %2$d de %3$.90s%4$s"
> -
> - #. GT: This is the title for a window showing a bitmap character
> - #. GT: It will look something like:
> -@@ -302,7 +302,7 @@ msgstr "%1$.80s =C3=A0 %2$d de %3$.90hs%4$s"
> - #. GT: $4 is the font name
> - #, c-format
> - msgid "%1$.80s at %2$d size %3$d from %4$.80s"
> --msgstr "%1$.80s (%2$d) taille %3$d de %4$.80hs"
> -+msgstr "%1$.80s (%2$d) taille %3$d de %4$.80s"
> -
> - #, c-format
> - msgid "%1$s from lookup subtable %2$.50s"
> -@@ -7433,7 +7433,7 @@ msgid ""
> - "Reverting the file will lose those changes.\n"
> - "Is that what you want?"
> - msgstr ""
> --"La fonte %1$.40s dans le fichier %2$.40hs a =C3=A9t=C3=A9 modifi=C3=A9=
e.\n"
> -+"La fonte %1$.40s dans le fichier %2$.40s a =C3=A9t=C3=A9 modifi=C3=A9e=
.\n"
> - "Revenir vous fera perdre toutes les modifications.\n"
> - "Voulez vous vraiment revenir ?"
> -
> -@@ -19077,11 +19077,11 @@ msgstr ""
> -
> - #, c-format
> - msgid ""
> --"The %1$s in the search dialog contains a reference to %2$.20hs which
> does "
> -+"The %1$s in the search dialog contains a reference to %2$.20s which
> does "
> - "not exist in the new font.\n"
> - "Should I remove the reference?"
> - msgstr ""
> --"Dans %1$s du dialogue de recherche il y a une r=C3=A9f=C3=A9rence vers=
 %2$.20hs
> qui "
> -+"Dans %1$s du dialogue de recherche il y a une r=C3=A9f=C3=A9rence vers=
 %2$.20s
> qui "
> - "n'existe pas dans la nouvelle fonte.\n"
> - "Faut-il supprimer la r=C3=A9f=C3=A9rence ?"
> -
> -@@ -19925,7 +19925,7 @@ msgid ""
> - "The fonts %1$.30s and %2$.30s have a different number of glyphs or
> different "
> - "encodings"
> - msgstr ""
> --"Les fontes %1$.30s et %2$.30hs n'ont pas le m=C3=AAme nombre de glyphe=
s ou
> des "
> -+"Les fontes %1$.30s et %2$.30s n'ont pas le m=C3=AAme nombre de glyphes=
 ou
> des "
> - "codages diff=C3=A9rents"
> -
> - #, c-format
> -@@ -19933,7 +19933,7 @@ msgid ""
> - "The fonts %1$.30s and %2$.30s use different types of splines (one
> quadratic, "
> - "one cubic)"
> - msgstr ""
> --"Les fontes %1$.30s et %2$.30hs utilisent des courbes de B=C3=A9zier d'=
ordres
> "
> -+"Les fontes %1$.30s et %2$.30s utilisent des courbes de B=C3=A9zier d'o=
rdres "
> - "diff=C3=A9rents (quadratique et cubique)"
> -
> - msgid "The generated font won't work with ATM"
> -@@ -19968,8 +19968,8 @@ msgid ""
> - "The glyph %1$.30s in font %2$.30s has a different hint mask on its
> contours "
> - "than in %3$.30s"
> - msgstr ""
> --"Le glyphe %1$.30s dans la police %2$.30hs a un masque de hints
> diff=C3=A9rent que "
> --"dans %3$.30hs"
> -+"Le glyphe %1$.30s dans la police %2$.30s a un masque de hints diff=C3=
=A9rent
> que "
> -+"dans %3$.30s"
> -
> - #, c-format
> - msgid ""
> -@@ -19984,8 +19984,8 @@ msgid ""
> - "The glyph %1$.30s in font %2$.30s has a different number of references
> than "
> - "in %3$.30s"
> - msgstr ""
> --"Le glyphe %1$.30s de la fonte %2$.30hs a un nombre de r=C3=A9f=C3=A9re=
nces
> diff=C3=A9rent "
> --"dans %3$.30hs"
> -+"Le glyphe %1$.30s de la fonte %2$.30s a un nombre de r=C3=A9f=C3=A9ren=
ces
> diff=C3=A9rent "
> -+"dans %3$.30s"
> -
> - #, c-format
> - msgid ""
> -@@ -20457,7 +20457,7 @@ msgstr ""
> - #, c-format
> - msgid "The outlines of glyph %2$.30s were not found in the font %1$.60s=
"
> - msgstr ""
> --"Le contours du glyphe %2$.30s n'ont pas =C3=A9t=C3=A9 trouv=C3=A9s dan=
s la police
> %1$.60hs"
> -+"Le contours du glyphe %2$.30s n'ont pas =C3=A9t=C3=A9 trouv=C3=A9s dan=
s la police
> %1$.60s"
> -
> - msgid "The paths that make up this glyph intersect one another"
> - msgstr "Les chemins qui composent ce glyphe se coupent les uns les
> autres"
> -@@ -21042,7 +21042,7 @@ msgstr "Il y a d=C3=A9j=C3=A0 une sous-table ave=
c ce nom,
> changez de nom SVP"
> -
> - #, c-format
> - msgid "There is already an anchor point named %1$.40s in %2$.40s."
> --msgstr "Il y a d=C3=A9j=C3=A0 une ancre appel=C3=A9e %1$.40s dans %2$.4=
0hs."
> -+msgstr "Il y a d=C3=A9j=C3=A0 une ancre appel=C3=A9e %1$.40s dans %2$.4=
0s."
> -
> - msgid "There is another glyph in the font with this name"
> - msgstr "Il y a un autre glyphe dans la fonte avec ce nom"
> -@@ -21441,8 +21441,8 @@ msgid ""
> - "been able to find is %1$.20s-%2$.20s-%4$d.\n"
> - "Shall I use that or let you search?"
> - msgstr ""
> --"Cette fonte est bas=C3=A9e sur le jeu de caract=C3=A8res %1$.20s-%2$.2=
0hs-%3$d,
> mais "
> --"ce que j'ai trouv=C3=A9 de mieux c'est %1$.20hs-%2$.20hs-%4$d.\n"
> -+"Cette fonte est bas=C3=A9e sur le jeu de caract=C3=A8res %1$.20s-%2$.2=
0s-%3$d,
> mais "
> -+"ce que j'ai trouv=C3=A9 de mieux c'est %1$.20s-%2$.20s-%4$d.\n"
> - "Devrais-je utiliser cette valeur ou pr=C3=A9f=C3=A9rez vous chercher ?=
"
> -
> - msgid ""
> -@@ -21770,7 +21770,7 @@ msgid ""
> - "with a 0 offset for this combination. Would you like to alter this
> kerning "
> - "class entry (or create a kerning pair for just these two glyphs)?"
> - msgstr ""
> --"Cette paire de cr=C3=A9nage (%.20s et %.20hs) est dans une classe de
> cr=C3=A9nage\n"
> -+"Cette paire de cr=C3=A9nage (%.20s et %.20s) est dans une classe de
> cr=C3=A9nage\n"
> - "avec un d=C3=A9placement de 0 pour cette combinaison. Voulez-vous modi=
fier
> cette "
> - "partie\n"
> - "de la classe de cr=C3=A9nage (ou cr=C3=A9er une nouvelle paire rien qu=
e pour ces
> 2 "
> -@@ -24551,8 +24551,8 @@ msgid ""
> - "referred to.\n"
> - "It will not be copied."
> - msgstr ""
> --"Vous essayer de coller une r=C3=A9f=C3=A9rence vers %1$s dans %2$hs.\n=
"
> --"Mais %1$hs n'existe pas dans cette fonte, et FontForge ne trouve pas l=
e
> "
> -+"Vous essayer de coller une r=C3=A9f=C3=A9rence vers %1$s dans %2$s.\n"
> -+"Mais %1$s n'existe pas dans cette fonte, et FontForge ne trouve pas le=
 "
> - "glyphe auquel il se r=C3=A9f=C3=A9rait.\n"
> - "Le glyphe ne sera pas copi=C3=A9."
> -
> -@@ -24562,8 +24562,8 @@ msgid ""
> - "But %1$s does not exist in this font.\n"
> - "Would you like to copy the original splines (or delete the reference)?=
"
> - msgstr ""
> --"Vous essayer de coller une r=C3=A9f=C3=A9rence vers %1$s dans %2$hs.\n=
"
> --"Mais %1$hs n'existe pas dans cette fonte.\n"
> -+"Vous essayer de coller une r=C3=A9f=C3=A9rence vers %1$s dans %2$s.\n"
> -+"Mais %1$s n'existe pas dans cette fonte.\n"
> - "Voulez vous copier le contour d'origine (ou supprimer la r=C3=A9f=C3=
=A9rence)?"
> -
> - msgid ""
> -diff --git a/po/hr.po b/po/hr.po
> -index d261d4ca7..ac41b9250 100644
> ---- a/po/hr.po
> -+++ b/po/hr.po
> -@@ -20156,11 +20156,11 @@ msgstr ""
> -
> - #, c-format
> - msgid ""
> --"The %1$s in the search dialog contains a reference to %2$.20hs which
> does "
> -+"The %1$s in the search dialog contains a reference to %2$.20s which
> does "
> - "not exist in the new font.\n"
> - "Should I remove the reference?"
> - msgstr ""
> --"%1$s u dijalo=C5=A1kom okviru tra=C5=BEenja sadr=C5=BEi referencu na %=
2$.20hs koja ne "
> -+"%1$s u dijalo=C5=A1kom okviru tra=C5=BEenja sadr=C5=BEi referencu na %=
2$.20s koja ne "
> - "postoji u fontu.\n"
> - "=C5=BDeli=C5=A1 li dozvoliti uklanjanje reference?"
> -
> -diff --git a/po/it.po b/po/it.po
> -index e13711485..d0c3ea987 100644
> ---- a/po/it.po
> -+++ b/po/it.po
> -@@ -2303,7 +2303,7 @@ msgid ""
> - "Reverting the file will lose those changes.\n"
> - "Is that what you want?"
> - msgstr ""
> --"Il font %1$.40s nel file %2$.40hs =C3=A8 stato modificato.\n"
> -+"Il font %1$.40s nel file %2$.40s =C3=A8 stato modificato.\n"
> - "Ripristinando il file perderai tutte le modifiche.\n"
> - "=C3=88 quello che vuoi fare?"
> -
> -@@ -5835,7 +5835,7 @@ msgid ""
> - "The glyph %1$.30s has a different number of contours in font %2$.30s
> than in "
> - "%3$.30s"
> - msgstr ""
> --"Il glifo %1$.30s ha un diverso numero di contorni nel font %2$.30hs
> rispetto "
> -+"Il glifo %1$.30s ha un diverso numero di contorni nel font %2$.30s
> rispetto "
> - "a %3$.30s"
> -
> - #, c-format
> -@@ -6235,8 +6235,8 @@ msgid ""
> - "been able to find is %1$.20s-%2$.20s-%4$d.\n"
> - "Shall I use that or let you search?"
> - msgstr ""
> --"Questo font =C3=A8 basato sulla codifica di caratteri %1$.20s-%2$.20hs=
-%3$d,
> ma "
> --"il migliore che io abbia trovato =C3=A8 %1$.20hs-%2$.20hs-%4$d.\n"
> -+"Questo font =C3=A8 basato sulla codifica di caratteri %1$.20s-%2$.20s-=
%3$d,
> ma "
> -+"il migliore che io abbia trovato =C3=A8 %1$.20s-%2$.20s-%4$d.\n"
> - "Devo usare questo valore o preferisci cercare tu stesso?"
> -
> - msgid ""
> -diff --git a/po/ja.po b/po/ja.po
> -index ed9f5a645..206ae82d1 100644
> ---- a/po/ja.po
> -+++ b/po/ja.po
> -@@ -11458,11 +11458,11 @@ msgstr ""
> -
> - #, c-format
> - msgid ""
> --"The %1$s in the search dialog contains a reference to %2$.20hs which
> does "
> -+"The %1$s in the search dialog contains a reference to %2$.20s which
> does "
> - "not exist in the new font.\n"
> - "Should I remove the reference?"
> - msgstr ""
> --"%1$s =E3=81=AB=E3=81=AF, =E6=96=B0=E3=81=97=E3=81=84=E3=83=95=E3=82=A9=
=E3=83=B3=E3=83=88=E3=81=AB=E3=81=AF=E5=90=AB=E3=81=BE=E3=82=8C=E3=81=AA=E3=
=81=84=E3=82=B0=E3=83=AA=E3=83=95 %2$.20hs =E3=81=B8=E3=81=AE=E5=8F=82=E7=
=85=A7=E3=81=8C=E5=90=AB=E3=81=BE=E3=82=8C=E3=81=A6=E3=81=84=E3=81=BE"
> -+"%1$s =E3=81=AB=E3=81=AF, =E6=96=B0=E3=81=97=E3=81=84=E3=83=95=E3=82=A9=
=E3=83=B3=E3=83=88=E3=81=AB=E3=81=AF=E5=90=AB=E3=81=BE=E3=82=8C=E3=81=AA=E3=
=81=84=E3=82=B0=E3=83=AA=E3=83=95 %2$.20s =E3=81=B8=E3=81=AE=E5=8F=82=E7=85=
=A7=E3=81=8C=E5=90=AB=E3=81=BE=E3=82=8C=E3=81=A6=E3=81=84=E3=81=BE"
> - "=E3=81=99.\n"
> - "=E5=8F=82=E7=85=A7=E3=82=92=E5=89=8A=E9=99=A4=E3=81=97=E3=81=BE=E3=81=
=99=E3=81=8B?"
> -
> -diff --git a/po/ko.po b/po/ko.po
> -index 971b4db03..4d5c8d40d 100644
> ---- a/po/ko.po
> -+++ b/po/ko.po
> -@@ -20920,11 +20920,11 @@ msgstr ""
> -
> - #, c-format
> - msgid ""
> --"The %1$s in the search dialog contains a reference to %2$.20hs which
> does "
> -+"The %1$s in the search dialog contains a reference to %2$.20s which
> does "
> - "not exist in the new font.\n"
> - "Should I remove the reference?"
> - msgstr ""
> --"=EA=B2=80=EC=83=89 =EB=8C=80=ED=99=94 =EC=83=81=EC=9E=90=EC=9D=98 %1$s=
=EC=97=90=EB=8A=94 =EC=83=88 =EA=B8=80=EA=BC=B4=EC=97=90 =EC=97=86=EB=8A=94=
 %2$.20hs=EC=97=90 =EB=8C=80=ED=95=9C =EC=B0=B8=EC=A1=B0=EA=B0=80 =ED=8F=AC=
=ED=95=A8=EB=90=98=EC=96=B4 =EC=9E=88"
> -+"=EA=B2=80=EC=83=89 =EB=8C=80=ED=99=94 =EC=83=81=EC=9E=90=EC=9D=98 %1$s=
=EC=97=90=EB=8A=94 =EC=83=88 =EA=B8=80=EA=BC=B4=EC=97=90 =EC=97=86=EB=8A=94=
 %2$.20s=EC=97=90 =EB=8C=80=ED=95=9C =EC=B0=B8=EC=A1=B0=EA=B0=80 =ED=8F=AC=
=ED=95=A8=EB=90=98=EC=96=B4 =EC=9E=88"
> - "=EB=8B=A4.\n"
> - "=EC=B0=B8=EC=A1=B0=EB=A5=BC =EC=A0=9C=EA=B1=B0=ED=95=B4=EC=95=BC =ED=
=95=98=EB=8A=94=EA=B0=80?"
> -
> -diff --git a/po/pl.po b/po/pl.po
> -index 2bbbf00be..c1fd5a454 100644
> ---- a/po/pl.po
> -+++ b/po/pl.po
> -@@ -19552,11 +19552,11 @@ msgstr ""
> -
> - #, c-format
> - msgid ""
> --"The %1$s in the search dialog contains a reference to %2$.20hs which
> does "
> -+"The %1$s in the search dialog contains a reference to %2$.20s which
> does "
> - "not exist in the new font.\n"
> - "Should I remove the reference?"
> - msgstr ""
> --"%1$s w okienku wyszukiwania zawiera odwo=C5=82anie do %2$.20hs, kt=C3=
=B3ry nie "
> -+"%1$s w okienku wyszukiwania zawiera odwo=C5=82anie do %2$.20s, kt=C3=
=B3ry nie "
> - "istnieje w nowym foncie.\n"
> - "Czy usun=C4=85=C4=87 to odwo=C5=82anie?"
> -
> -diff --git a/po/uk.po b/po/uk.po
> -index e3768acc3..3302a1005 100644
> ---- a/po/uk.po
> -+++ b/po/uk.po
> -@@ -19860,11 +19860,11 @@ msgstr ""
> -
> - #, c-format
> - msgid ""
> --"The %1$s in the search dialog contains a reference to %2$.20hs which
> does "
> -+"The %1$s in the search dialog contains a reference to %2$.20s which
> does "
> - "not exist in the new font.\n"
> - "Should I remove the reference?"
> - msgstr ""
> --"%1$s =D1=83 =D0=B4=D1=96=D0=B0=D0=BB=D0=BE=D0=B3=D0=BE=D0=B2=D0=BE=D0=
=BC=D1=83 =D0=B2=D1=96=D0=BA=D0=BD=D1=96 =D0=BF=D0=BE=D1=88=D1=83=D0=BA=D1=
=83 =D0=BC=D1=96=D1=81=D1=82=D0=B8=D1=82=D1=8C =D0=BF=D0=BE=D1=81=D0=B8=D0=
=BB=D0=B0=D0=BD=D0=BD=D1=8F =D0=BD=D0=B0 %2$.20hs, =D1=8F=D0=BA=D0=BE=D0=B3=
=D0=BE =D0=BD=D0=B5
> "
> -+"%1$s =D1=83 =D0=B4=D1=96=D0=B0=D0=BB=D0=BE=D0=B3=D0=BE=D0=B2=D0=BE=D0=
=BC=D1=83 =D0=B2=D1=96=D0=BA=D0=BD=D1=96 =D0=BF=D0=BE=D1=88=D1=83=D0=BA=D1=
=83 =D0=BC=D1=96=D1=81=D1=82=D0=B8=D1=82=D1=8C =D0=BF=D0=BE=D1=81=D0=B8=D0=
=BB=D0=B0=D0=BD=D0=BD=D1=8F =D0=BD=D0=B0 %2$.20s, =D1=8F=D0=BA=D0=BE=D0=B3=
=D0=BE =D0=BD=D0=B5 "
> - "=D1=96=D1=81=D0=BD=D1=83=D1=94 =D1=83 =D0=BD=D0=BE=D0=B2=D0=BE=D0=BC=
=D1=83 =D1=88=D1=80=D0=B8=D1=84=D1=82=D1=96.\n"
> - "=D0=92=D0=B8=D0=BB=D1=83=D1=87=D0=B8=D1=82=D0=B8 =D1=86=D0=B5 =D0=BF=
=D0=BE=D1=81=D0=B8=D0=BB=D0=B0=D0=BD=D0=BD=D1=8F?"
> -
> -diff --git a/po/vi.po b/po/vi.po
> -index 6aee8bb3f..f5eb739e6 100644
> ---- a/po/vi.po
> -+++ b/po/vi.po
> -@@ -17109,11 +17109,11 @@ msgstr ""
> -
> - #, c-format
> - msgid ""
> --"The %1$s in the search dialog contains a reference to %2$.20hs which
> does "
> -+"The %1$s in the search dialog contains a reference to %2$.20s which
> does "
> - "not exist in the new font.\n"
> - "Should I remove the reference?"
> - msgstr ""
> --"Trong h=E1=BB=99p tho=E1=BA=A1i t=C3=ACm ki=E1=BA=BFm, %1$s ch=E1=BB=
=A9a m=E1=BB=99t tham chi=E1=BA=BFu =C4=91=E1=BA=BFn %2$.20hs m=C3=A0
> kh=C3=B4ng t=E1=BB=93n "
> -+"Trong h=E1=BB=99p tho=E1=BA=A1i t=C3=ACm ki=E1=BA=BFm, %1$s ch=E1=BB=
=A9a m=E1=BB=99t tham chi=E1=BA=BFu =C4=91=E1=BA=BFn %2$.20s m=C3=A0 kh=C3=
=B4ng
> t=E1=BB=93n "
> - "t=E1=BA=A1i trong ph=C3=B4ng m=E1=BB=9Bi.\n"
> - "B=E1=BA=A1n c=C3=B3 mu=E1=BB=91n g=E1=BB=A1 b=E1=BB=8F tham chi=E1=BA=
=BFu n=C3=A0y kh=C3=B4ng?"
> -
> ---
> -2.42.0
> -
> diff --git
> a/meta-oe/recipes-graphics/fontforge/fontforge/CVE-2024-25081_CVE-2024-25=
082.patch
> b/meta-oe/recipes-graphics/fontforge/fontforge/CVE-2024-25081_CVE-2024-25=
082.patch
> deleted file mode 100644
> index 40f85e9f33..0000000000
> ---
> a/meta-oe/recipes-graphics/fontforge/fontforge/CVE-2024-25081_CVE-2024-25=
082.patch
> +++ /dev/null
> @@ -1,181 +0,0 @@
> -From 216eb14b558df344b206bf82e2bdaf03a1f2f429 Mon Sep 17 00:00:00 2001
> -From: Peter Kydas <pk@canva.com>
> -Date: Tue, 6 Feb 2024 20:03:04 +1100
> -Subject: [PATCH] fix splinefont shell command injection (#5367)
> -
> -CVE: CVE-2024-25081
> -CVE: CVE-2024-25082
> -Upstream-Status: Backport [
> https://github.com/fontforge/fontforge/commit/216eb14b558df344b206bf82e2b=
daf03a1f2f429
> ]
> -Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ----
> - fontforge/splinefont.c | 123 +++++++++++++++++++++++++++++------------
> - 1 file changed, 89 insertions(+), 34 deletions(-)
> -
> -diff --git a/fontforge/splinefont.c b/fontforge/splinefont.c
> -index 239fdc035..647daee10 100644
> ---- a/fontforge/splinefont.c
> -+++ b/fontforge/splinefont.c
> -@@ -788,11 +788,14 @@ return( name );
> -
> - char *Unarchive(char *name, char **_archivedir) {
> -     char *dir =3D getenv("TMPDIR");
> --    char *pt, *archivedir, *listfile, *listcommand, *unarchivecmd,
> *desiredfile;
> -+    char *pt, *archivedir, *listfile, *desiredfile;
> -     char *finalfile;
> -     int i;
> -     int doall=3Dfalse;
> -     static int cnt=3D0;
> -+    gchar *command[5];
> -+    gchar *stdoutresponse =3D NULL;
> -+    gchar *stderrresponse =3D NULL;
> -
> -     *_archivedir =3D NULL;
> -
> -@@ -827,18 +830,30 @@ return( NULL );
> -     listfile =3D malloc(strlen(archivedir)+strlen("/" TOC_NAME)+1);
> -     sprintf( listfile, "%s/" TOC_NAME, archivedir );
> -
> --    listcommand =3D malloc( strlen(archivers[i].unarchive) + 1 +
> --                      strlen( archivers[i].listargs) + 1 +
> --                      strlen( name ) + 3 +
> --                      strlen( listfile ) +4 );
> --    sprintf( listcommand, "%s %s %s > %s", archivers[i].unarchive,
> --          archivers[i].listargs, name, listfile );
> --    if ( system(listcommand)!=3D0 ) {
> --      free(listcommand); free(listfile);
> --      ArchiveCleanup(archivedir);
> --return( NULL );
> -+    command[0] =3D archivers[i].unarchive;
> -+    command[1] =3D archivers[i].listargs;
> -+    command[2] =3D name;
> -+    command[3] =3D NULL; // command args need to be NULL-terminated
> -+
> -+    if ( g_spawn_sync(
> -+                      NULL,
> -+                      command,
> -+                      NULL,
> -+                      G_SPAWN_SEARCH_PATH,
> -+                      NULL,
> -+                      NULL,
> -+                      &stdoutresponse,
> -+                      &stderrresponse,
> -+                      NULL,
> -+                      NULL
> -+                      ) =3D=3D FALSE) { // did not successfully execute
> -+      ArchiveCleanup(archivedir);
> -+      return( NULL );
> -     }
> --    free(listcommand);
> -+    // Write out the listfile to be read in later
> -+    FILE *fp =3D fopen(listfile, "wb");
> -+    fwrite(stdoutresponse, strlen(stdoutresponse), 1, fp);
> -+    fclose(fp);
> -
> -     desiredfile =3D ArchiveParseTOC(listfile, archivers[i].ars, &doall)=
;
> -     free(listfile);
> -@@ -847,22 +862,28 @@ return( NULL );
> - return( NULL );
> -     }
> -
> --    /* I tried sending everything to stdout, but that doesn't work if
> the */
> --    /*  output is a directory file (ufo, sfdir) */
> --    unarchivecmd =3D malloc( strlen(archivers[i].unarchive) + 1 +
> --                      strlen( archivers[i].listargs) + 1 +
> --                      strlen( name ) + 1 +
> --                      strlen( desiredfile ) + 3 +
> --                      strlen( archivedir ) + 30 );
> --    sprintf( unarchivecmd, "( cd %s ; %s %s %s %s ) > /dev/null",
> archivedir,
> --          archivers[i].unarchive,
> --          archivers[i].extractargs, name, doall ? "" : desiredfile );
> --    if ( system(unarchivecmd)!=3D0 ) {
> --      free(unarchivecmd); free(desiredfile);
> --      ArchiveCleanup(archivedir);
> --return( NULL );
> -+    command[0] =3D archivers[i].unarchive;
> -+    command[1] =3D archivers[i].extractargs;
> -+    command[2] =3D name;
> -+    command[3] =3D doall ? "" : desiredfile;
> -+    command[4] =3D NULL;
> -+
> -+    if ( g_spawn_sync(
> -+                      (gchar*)archivedir,
> -+                      command,
> -+                      NULL,
> -+                      G_SPAWN_SEARCH_PATH,
> -+                      NULL,
> -+                      NULL,
> -+                      &stdoutresponse,
> -+                      &stderrresponse,
> -+                      NULL,
> -+                      NULL
> -+                      ) =3D=3D FALSE) { // did not successfully execute
> -+      free(desiredfile);
> -+      ArchiveCleanup(archivedir);
> -+      return( NULL );
> -     }
> --    free(unarchivecmd);
> -
> -     finalfile =3D malloc( strlen(archivedir) + 1 + strlen(desiredfile) =
+
> 1);
> -     sprintf( finalfile, "%s/%s", archivedir, desiredfile );
> -@@ -885,20 +906,54 @@ struct compressors compressors[] =3D {
> -
> - char *Decompress(char *name, int compression) {
> -     char *dir =3D getenv("TMPDIR");
> --    char buf[1500];
> -     char *tmpfn;
> --
> -+    gchar *command[4];
> -+    gint stdout_pipe;
> -+    gchar buffer[4096];
> -+    gssize bytes_read;
> -+    GByteArray *binary_data =3D g_byte_array_new();
> -+
> -     if ( dir=3D=3DNULL ) dir =3D P_tmpdir;
> -     tmpfn =3D malloc(strlen(dir)+strlen(GFileNameTail(name))+2);
> -     strcpy(tmpfn,dir);
> -     strcat(tmpfn,"/");
> -     strcat(tmpfn,GFileNameTail(name));
> -     *strrchr(tmpfn,'.') =3D '\0';
> --    snprintf( buf, sizeof(buf), "%s < %s > %s",
> compressors[compression].decomp, name, tmpfn );
> --    if ( system(buf)=3D=3D0 )
> --return( tmpfn );
> --    free(tmpfn);
> --return( NULL );
> -+
> -+    command[0] =3D compressors[compression].decomp;
> -+    command[1] =3D "-c";
> -+    command[2] =3D name;
> -+    command[3] =3D NULL;
> -+
> -+    // Have to use async because g_spawn_sync doesn't handle nul-bytes
> in the output (which happens with binary data)
> -+    if (g_spawn_async_with_pipes(
> -+      NULL,
> -+      command,
> -+      NULL,
> -+      G_SPAWN_DO_NOT_REAP_CHILD | G_SPAWN_SEARCH_PATH,
> -+      NULL,
> -+      NULL,
> -+      NULL,
> -+      NULL,
> -+      &stdout_pipe,
> -+      NULL,
> -+      NULL) =3D=3D FALSE) {
> -+      //command has failed
> -+      return( NULL );
> -+    }
> -+
> -+    // Read binary data from pipe and output to file
> -+    while ((bytes_read =3D read(stdout_pipe, buffer, sizeof(buffer))) >=
 0)
> {
> -+        g_byte_array_append(binary_data, (guint8 *)buffer, bytes_read);
> -+    }
> -+    close(stdout_pipe);
> -+
> -+    FILE *fp =3D fopen(tmpfn, "wb");
> -+    fwrite(binary_data->data, sizeof(gchar), binary_data->len, fp);
> -+    fclose(fp);
> -+    g_byte_array_free(binary_data, TRUE);
> -+
> -+              return(tmpfn);
> - }
> -
> - static char *ForceFileToHaveName(FILE *file, char *exten) {
> diff --git a/meta-oe/recipes-graphics/fontforge/fontforge_20230101.bb
> b/meta-oe/recipes-graphics/fontforge/fontforge_20251009.bb
> similarity index 72%
> rename from meta-oe/recipes-graphics/fontforge/fontforge_20230101.bb
> rename to meta-oe/recipes-graphics/fontforge/fontforge_20251009.bb
> index af77ec913e..2d08ee2e57 100644
> --- a/meta-oe/recipes-graphics/fontforge/fontforge_20230101.bb
> +++ b/meta-oe/recipes-graphics/fontforge/fontforge_20251009.bb
> @@ -6,21 +6,17 @@ LIC_FILES_CHKSUM =3D " \
>      file://LICENSE;md5=3Dd042f3d2a8fd7208b704a499168e3c89 \
>  "
>
> -DEPENDS =3D "python3 glib-2.0 pango giflib tiff libxml2 jpeg libtool uth=
ash
> gettext-native libspiro"
> -DEPENDS:append:class-target =3D " libxi"
> +DEPENDS =3D "python3 glib-2.0 pango giflib tiff libxml2 jpeg libtool uth=
ash
> gettext-native libspiro gtkmm3"
>

Adding gtkmm3 adds a dep on gtkmm3-native when extending this recipe to be
native. see

https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/builds/1272/ste=
ps/12/logs/errors

Perhaps it can be limited to just target recipe ?


>
>  inherit cmake pkgconfig python3native python3targetconfig features_check
> gettext gtk-icon-cache mime mime-xdg
>
> -REQUIRED_DISTRO_FEATURES:append:class-target =3D " x11"
> +ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
>
> -# tag 20220308
> -SRCREV =3D "a1dad3e81da03d5d5f3c4c1c1b9b5ca5ebcfcecf"
> -SRC_URI =3D "git://
> github.com/${BPN}/${BPN}.git;branch=3Dmaster;protocol=3Dhttps
> <http://github.com/$%7BBPN%7D/$%7BBPN%7D.git;branch=3Dmaster;protocol=3Dh=
ttps>
> \
> +SRCREV =3D "c41bdb922285f35defd1e1385adfd13bde1ab32a"
> +SRC_URI =3D "git://
> github.com/${BPN}/${BPN}.git;branch=3Dmaster;protocol=3Dhttps;tag=3D${PV}
> <http://github.com/$%7BBPN%7D/$%7BBPN%7D.git;branch=3Dmaster;protocol=3Dh=
ttps;tag=3D$%7BPV%7D>
> \
>             file://0001-include-sys-select-on-non-glibc-platforms.patch \
>             file://0001-fontforgeexe-Use-env-to-find-fontforge.patch \
>             file://0001-cmake-Use-alternate-way-to-detect-libm.patch \
> -
>  file://0001-Fix-Translations-containing-invalid-directives-hs.patch \
> -           file://CVE-2024-25081_CVE-2024-25082.patch \
>  "
>
>  EXTRA_OECMAKE =3D "-DENABLE_DOCS=3DOFF"
> @@ -31,12 +27,6 @@ CFLAGS +=3D "-fno-strict-aliasing"
>  LDFLAGS +=3D "-lpython${PYTHON_BASEVERSION}${PYTHON_ABI}"
>  BUILD_LDFLAGS +=3D "-lpython${PYTHON_BASEVERSION}${PYTHON_ABI}"
>
> -#do_configure:prepend() {
> -# uthash sources are expected in uthash/src
> -#    mkdir -p ${S}/uthash/src
> -#    cp ${STAGING_INCDIR}/ut*.h ${S}/uthash/src
> -#}
> -
>  PACKAGES =3D+ "${PN}-python"
>
>  FILES:${PN} +=3D " \
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#123870):
> https://lists.openembedded.org/g/openembedded-devel/message/123870
> Mute This Topic: https://lists.openembedded.org/mt/117466635/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000024dda306495871cd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jan 26,=
 2026 at 3:45=E2=80=AFAM Gyorgy Sarvari via <a href=3D"http://lists.openemb=
edded.org">lists.openembedded.org</a> &lt;skandigraun=3D<a href=3D"mailto:g=
mail.com@lists.openembedded.org">gmail.com@lists.openembedded.org</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Drop patch=
es that are inluded in this release.<br>
<br>
libxi has been removed as a dependency, because the project has dropped<br>
the x11 drawing backend, it implements everything in gtk.<br>
<br>
Changelog: <a href=3D"https://github.com/fontforge/fontforge/releases/tag/2=
0251009" rel=3D"noreferrer" target=3D"_blank">https://github.com/fontforge/=
fontforge/releases/tag/20251009</a><br>
<br>
Signed-off-by: Gyorgy Sarvari &lt;<a href=3D"mailto:skandigraun@gmail.com" =
target=3D"_blank">skandigraun@gmail.com</a>&gt;<br>
---<br>
=C2=A0...ons-containing-invalid-directives-hs.patch | 385 -----------------=
-<br>
=C2=A0.../CVE-2024-25081_CVE-2024-25082.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0| 1=
81 --------<br>
=C2=A0...<a href=3D"http://orge_20230101.bb" rel=3D"noreferrer" target=3D"_=
blank">orge_20230101.bb</a> =3D&gt; <a href=3D"http://fontforge_20251009.bb=
" rel=3D"noreferrer" target=3D"_blank">fontforge_20251009.bb</a>} |=C2=A0 1=
8 +-<br>
=C2=A03 files changed, 4 insertions(+), 580 deletions(-)<br>
=C2=A0delete mode 100644 meta-oe/recipes-graphics/fontforge/fontforge/0001-=
Fix-Translations-containing-invalid-directives-hs.patch<br>
=C2=A0delete mode 100644 meta-oe/recipes-graphics/fontforge/fontforge/CVE-2=
024-25081_CVE-2024-25082.patch<br>
=C2=A0rename meta-oe/recipes-graphics/fontforge/{<a href=3D"http://fontforg=
e_20230101.bb" rel=3D"noreferrer" target=3D"_blank">fontforge_20230101.bb</=
a> =3D&gt; <a href=3D"http://fontforge_20251009.bb" rel=3D"noreferrer" targ=
et=3D"_blank">fontforge_20251009.bb</a>} (72%)<br>
<br>
diff --git a/meta-oe/recipes-graphics/fontforge/fontforge/0001-Fix-Translat=
ions-containing-invalid-directives-hs.patch b/meta-oe/recipes-graphics/font=
forge/fontforge/0001-Fix-Translations-containing-invalid-directives-hs.patc=
h<br>
deleted file mode 100644<br>
index 6d133254ed..0000000000<br>
--- a/meta-oe/recipes-graphics/fontforge/fontforge/0001-Fix-Translations-co=
ntaining-invalid-directives-hs.patch<br>
+++ /dev/null<br>
@@ -1,385 +0,0 @@<br>
-From e6ccc8a8cf1391010a8220836a732da9fab19c69 Mon Sep 17 00:00:00 2001<br>
-From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank"=
>raj.khem@gmail.com</a>&gt;<br>
-Date: Thu, 7 Sep 2023 12:35:12 -0700<br>
-Subject: [PATCH] Fix Translations containing invalid directives %hs<br>
-<br>
-Found with gettext 0.22<br>
-Older versions of msgfmt were more sloppy, thus allowing such mistakes to =
cause bugs at runtime.<br>
-<br>
-<a href=3D"https://bugs.gentoo.org/908868" rel=3D"noreferrer" target=3D"_b=
lank">https://bugs.gentoo.org/908868</a><br>
-<a href=3D"https://savannah.gnu.org/bugs/index.php?64333" rel=3D"noreferre=
r" target=3D"_blank">https://savannah.gnu.org/bugs/index.php?64333</a><br>
-<a href=3D"https://github.com/fontforge/fontforge/issues/5251" rel=3D"nore=
ferrer" target=3D"_blank">https://github.com/fontforge/fontforge/issues/525=
1</a><br>
-<br>
-Upstream-Status: Pending<br>
-Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
----<br>
- fontforgeexe/searchview.c |=C2=A0 2 +-<br>
- po/ca.po=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 4 ++--<br>
- po/de.po=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 4 ++--<br>
- po/en_GB.po=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0=
 4 ++--<br>
- po/fr.po=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =
40 +++++++++++++++++++--------------------<br>
- po/hr.po=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 4 ++--<br>
- po/it.po=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 8 ++++----<br>
- po/ja.po=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 4 ++--<br>
- po/ko.po=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 4 ++--<br>
- po/pl.po=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 4 ++--<br>
- po/uk.po=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 4 ++--<br>
- po/vi.po=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 4 ++--<br>
- 12 files changed, 43 insertions(+), 43 deletions(-)<br>
-<br>
-diff --git a/fontforgeexe/searchview.c b/fontforgeexe/searchview.c<br>
-index 1cb39a221..7e1c109cb 100644<br>
---- a/fontforgeexe/searchview.c<br>
-+++ b/fontforgeexe/searchview.c<br>
-@@ -516,7 +516,7 @@ return( true );<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ( =
ask_if_difficult=3D=3D2 &amp;&amp; !searcher-&gt;isvisible )<br>
- return( false );<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ( =
gwwv_ask(_(&quot;Bad Reference&quot;),(const char **) buttons,1,1,<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 _(&quot;The %1$s in the search dialog contains a referenc=
e to %2$.20hs which does not exist in the new font.\nShould I remove the re=
ference?&quot;),<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 _(&quot;The %1$s in the search dialog contains a referenc=
e to %2$.20s which does not exist in the new font.\nShould I remove the ref=
erence?&quot;),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i=3D=3D0?_(&quot;Search Pattern&quot;=
):_(&quot;Replace Pattern&quot;),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0r-&gt;sc-&gt;name)=3D=3D1 )<br>
- return( false );<br>
-diff --git a/po/ca.po b/po/ca.po<br>
-index e2349b6ef..6c920b7c0 100644<br>
---- a/po/ca.po<br>
-+++ b/po/ca.po<br>
-@@ -12347,11 +12347,11 @@ msgstr &quot;Tai&quot;<br>
- <br>
- #, c-format<br>
- msgid &quot;&quot;<br>
--&quot;The %1$s in the search dialog contains a reference to %2$.20hs whic=
h does &quot;<br>
-+&quot;The %1$s in the search dialog contains a reference to %2$.20s which=
 does &quot;<br>
- &quot;not exist in the new font.\n&quot;<br>
- &quot;Should I remove the reference?&quot;<br>
- msgstr &quot;&quot;<br>
--&quot;Al di=C3=A0leg de cerca, %1$s cont=C3=A9 una refer=C3=A8ncia a %2$.=
20hs\n&quot;<br>
-+&quot;Al di=C3=A0leg de cerca, %1$s cont=C3=A9 una refer=C3=A8ncia a %2$.=
20s\n&quot;<br>
- &quot;que no existeix en el nou tipus.\n&quot;<br>
- &quot;Voleu eliminar la refer=C3=A8ncia?&quot;<br>
- <br>
-diff --git a/po/de.po b/po/de.po<br>
-index 41430ffae..8a31aeaa2 100644<br>
---- a/po/de.po<br>
-+++ b/po/de.po<br>
-@@ -15765,11 +15765,11 @@ msgstr &quot;&quot;<br>
- <br>
- #, c-format<br>
- msgid &quot;&quot;<br>
--&quot;The %1$s in the search dialog contains a reference to %2$.20hs whic=
h does &quot;<br>
-+&quot;The %1$s in the search dialog contains a reference to %2$.20s which=
 does &quot;<br>
- &quot;not exist in the new font.\n&quot;<br>
- &quot;Should I remove the reference?&quot;<br>
- msgstr &quot;&quot;<br>
--&quot;%1$s im Suchdialog enth=C3=A4lt eine Referenz auf %2$.20hs, die in =
der neuen &quot;<br>
-+&quot;%1$s im Suchdialog enth=C3=A4lt eine Referenz auf %2$.20s, die in d=
er neuen &quot;<br>
- &quot;Schrift nicht existiert.\n&quot;<br>
- &quot;Soll der Referenz entfernt werden?&quot;<br>
- <br>
-diff --git a/po/en_GB.po b/po/en_GB.po<br>
-index 9bd2d62bb..fce64c97d 100644<br>
---- a/po/en_GB.po<br>
-+++ b/po/en_GB.po<br>
-@@ -728,11 +728,11 @@ msgstr &quot;Template Colour&quot;<br>
- <br>
- #, c-format<br>
- msgid &quot;&quot;<br>
--&quot;The %1$s in the search dialog contains a reference to %2$.20hs whic=
h does &quot;<br>
-+&quot;The %1$s in the search dialog contains a reference to %2$.20s which=
 does &quot;<br>
- &quot;not exist in the new font.\n&quot;<br>
- &quot;Should I remove the reference?&quot;<br>
- msgstr &quot;&quot;<br>
--&quot;The %1$s in the search dialogue contains a reference to %2$.20hs wh=
ich does &quot;<br>
-+&quot;The %1$s in the search dialogue contains a reference to %2$.20s whi=
ch does &quot;<br>
- &quot;not exist in the new font.\n&quot;<br>
- &quot;Should I remove the reference?&quot;<br>
- <br>
-diff --git a/po/fr.po b/po/fr.po<br>
-index 26e446b38..d130f89bc 100644<br>
---- a/po/fr.po<br>
-+++ b/po/fr.po<br>
-@@ -291,7 +291,7 @@ msgstr &quot;cha=C3=AEne %1$.30s pour %2$.30s&quot;<br=
>
- #. GT: $4 is the changed flag (&#39;*&#39; for the changed items)<br>
- #, c-format<br>
- msgid &quot;%1$.80s at %2$d from %3$.90s%4$s&quot;<br>
--msgstr &quot;%1$.80s =C3=A0 %2$d de %3$.90hs%4$s&quot;<br>
-+msgstr &quot;%1$.80s =C3=A0 %2$d de %3$.90s%4$s&quot;<br>
- <br>
- #. GT: This is the title for a window showing a bitmap character<br>
- #. GT: It will look something like:<br>
-@@ -302,7 +302,7 @@ msgstr &quot;%1$.80s =C3=A0 %2$d de %3$.90hs%4$s&quot;=
<br>
- #. GT: $4 is the font name<br>
- #, c-format<br>
- msgid &quot;%1$.80s at %2$d size %3$d from %4$.80s&quot;<br>
--msgstr &quot;%1$.80s (%2$d) taille %3$d de %4$.80hs&quot;<br>
-+msgstr &quot;%1$.80s (%2$d) taille %3$d de %4$.80s&quot;<br>
- <br>
- #, c-format<br>
- msgid &quot;%1$s from lookup subtable %2$.50s&quot;<br>
-@@ -7433,7 +7433,7 @@ msgid &quot;&quot;<br>
- &quot;Reverting the file will lose those changes.\n&quot;<br>
- &quot;Is that what you want?&quot;<br>
- msgstr &quot;&quot;<br>
--&quot;La fonte %1$.40s dans le fichier %2$.40hs a =C3=A9t=C3=A9 modifi=C3=
=A9e.\n&quot;<br>
-+&quot;La fonte %1$.40s dans le fichier %2$.40s a =C3=A9t=C3=A9 modifi=C3=
=A9e.\n&quot;<br>
- &quot;Revenir vous fera perdre toutes les modifications.\n&quot;<br>
- &quot;Voulez vous vraiment revenir ?&quot;<br>
- <br>
-@@ -19077,11 +19077,11 @@ msgstr &quot;&quot;<br>
- <br>
- #, c-format<br>
- msgid &quot;&quot;<br>
--&quot;The %1$s in the search dialog contains a reference to %2$.20hs whic=
h does &quot;<br>
-+&quot;The %1$s in the search dialog contains a reference to %2$.20s which=
 does &quot;<br>
- &quot;not exist in the new font.\n&quot;<br>
- &quot;Should I remove the reference?&quot;<br>
- msgstr &quot;&quot;<br>
--&quot;Dans %1$s du dialogue de recherche il y a une r=C3=A9f=C3=A9rence v=
ers %2$.20hs qui &quot;<br>
-+&quot;Dans %1$s du dialogue de recherche il y a une r=C3=A9f=C3=A9rence v=
ers %2$.20s qui &quot;<br>
- &quot;n&#39;existe pas dans la nouvelle fonte.\n&quot;<br>
- &quot;Faut-il supprimer la r=C3=A9f=C3=A9rence ?&quot;<br>
- <br>
-@@ -19925,7 +19925,7 @@ msgid &quot;&quot;<br>
- &quot;The fonts %1$.30s and %2$.30s have a different number of glyphs or =
different &quot;<br>
- &quot;encodings&quot;<br>
- msgstr &quot;&quot;<br>
--&quot;Les fontes %1$.30s et %2$.30hs n&#39;ont pas le m=C3=AAme nombre de=
 glyphes ou des &quot;<br>
-+&quot;Les fontes %1$.30s et %2$.30s n&#39;ont pas le m=C3=AAme nombre de =
glyphes ou des &quot;<br>
- &quot;codages diff=C3=A9rents&quot;<br>
- <br>
- #, c-format<br>
-@@ -19933,7 +19933,7 @@ msgid &quot;&quot;<br>
- &quot;The fonts %1$.30s and %2$.30s use different types of splines (one q=
uadratic, &quot;<br>
- &quot;one cubic)&quot;<br>
- msgstr &quot;&quot;<br>
--&quot;Les fontes %1$.30s et %2$.30hs utilisent des courbes de B=C3=A9zier=
 d&#39;ordres &quot;<br>
-+&quot;Les fontes %1$.30s et %2$.30s utilisent des courbes de B=C3=A9zier =
d&#39;ordres &quot;<br>
- &quot;diff=C3=A9rents (quadratique et cubique)&quot;<br>
- <br>
- msgid &quot;The generated font won&#39;t work with ATM&quot;<br>
-@@ -19968,8 +19968,8 @@ msgid &quot;&quot;<br>
- &quot;The glyph %1$.30s in font %2$.30s has a different hint mask on its =
contours &quot;<br>
- &quot;than in %3$.30s&quot;<br>
- msgstr &quot;&quot;<br>
--&quot;Le glyphe %1$.30s dans la police %2$.30hs a un masque de hints diff=
=C3=A9rent que &quot;<br>
--&quot;dans %3$.30hs&quot;<br>
-+&quot;Le glyphe %1$.30s dans la police %2$.30s a un masque de hints diff=
=C3=A9rent que &quot;<br>
-+&quot;dans %3$.30s&quot;<br>
- <br>
- #, c-format<br>
- msgid &quot;&quot;<br>
-@@ -19984,8 +19984,8 @@ msgid &quot;&quot;<br>
- &quot;The glyph %1$.30s in font %2$.30s has a different number of referen=
ces than &quot;<br>
- &quot;in %3$.30s&quot;<br>
- msgstr &quot;&quot;<br>
--&quot;Le glyphe %1$.30s de la fonte %2$.30hs a un nombre de r=C3=A9f=C3=
=A9rences diff=C3=A9rent &quot;<br>
--&quot;dans %3$.30hs&quot;<br>
-+&quot;Le glyphe %1$.30s de la fonte %2$.30s a un nombre de r=C3=A9f=C3=A9=
rences diff=C3=A9rent &quot;<br>
-+&quot;dans %3$.30s&quot;<br>
- <br>
- #, c-format<br>
- msgid &quot;&quot;<br>
-@@ -20457,7 +20457,7 @@ msgstr &quot;&quot;<br>
- #, c-format<br>
- msgid &quot;The outlines of glyph %2$.30s were not found in the font %1$.=
60s&quot;<br>
- msgstr &quot;&quot;<br>
--&quot;Le contours du glyphe %2$.30s n&#39;ont pas =C3=A9t=C3=A9 trouv=C3=
=A9s dans la police %1$.60hs&quot;<br>
-+&quot;Le contours du glyphe %2$.30s n&#39;ont pas =C3=A9t=C3=A9 trouv=C3=
=A9s dans la police %1$.60s&quot;<br>
- <br>
- msgid &quot;The paths that make up this glyph intersect one another&quot;=
<br>
- msgstr &quot;Les chemins qui composent ce glyphe se coupent les uns les a=
utres&quot;<br>
-@@ -21042,7 +21042,7 @@ msgstr &quot;Il y a d=C3=A9j=C3=A0 une sous-table =
avec ce nom, changez de nom SVP&quot;<br>
- <br>
- #, c-format<br>
- msgid &quot;There is already an anchor point named %1$.40s in %2$.40s.&qu=
ot;<br>
--msgstr &quot;Il y a d=C3=A9j=C3=A0 une ancre appel=C3=A9e %1$.40s dans %2=
$.40hs.&quot;<br>
-+msgstr &quot;Il y a d=C3=A9j=C3=A0 une ancre appel=C3=A9e %1$.40s dans %2=
$.40s.&quot;<br>
- <br>
- msgid &quot;There is another glyph in the font with this name&quot;<br>
- msgstr &quot;Il y a un autre glyphe dans la fonte avec ce nom&quot;<br>
-@@ -21441,8 +21441,8 @@ msgid &quot;&quot;<br>
- &quot;been able to find is %1$.20s-%2$.20s-%4$d.\n&quot;<br>
- &quot;Shall I use that or let you search?&quot;<br>
- msgstr &quot;&quot;<br>
--&quot;Cette fonte est bas=C3=A9e sur le jeu de caract=C3=A8res %1$.20s-%2=
$.20hs-%3$d, mais &quot;<br>
--&quot;ce que j&#39;ai trouv=C3=A9 de mieux c&#39;est %1$.20hs-%2$.20hs-%4=
$d.\n&quot;<br>
-+&quot;Cette fonte est bas=C3=A9e sur le jeu de caract=C3=A8res %1$.20s-%2=
$.20s-%3$d, mais &quot;<br>
-+&quot;ce que j&#39;ai trouv=C3=A9 de mieux c&#39;est %1$.20s-%2$.20s-%4$d=
.\n&quot;<br>
- &quot;Devrais-je utiliser cette valeur ou pr=C3=A9f=C3=A9rez vous cherche=
r ?&quot;<br>
- <br>
- msgid &quot;&quot;<br>
-@@ -21770,7 +21770,7 @@ msgid &quot;&quot;<br>
- &quot;with a 0 offset for this combination. Would you like to alter this =
kerning &quot;<br>
- &quot;class entry (or create a kerning pair for just these two glyphs)?&q=
uot;<br>
- msgstr &quot;&quot;<br>
--&quot;Cette paire de cr=C3=A9nage (%.20s et %.20hs) est dans une classe d=
e cr=C3=A9nage\n&quot;<br>
-+&quot;Cette paire de cr=C3=A9nage (%.20s et %.20s) est dans une classe de=
 cr=C3=A9nage\n&quot;<br>
- &quot;avec un d=C3=A9placement de 0 pour cette combinaison. Voulez-vous m=
odifier cette &quot;<br>
- &quot;partie\n&quot;<br>
- &quot;de la classe de cr=C3=A9nage (ou cr=C3=A9er une nouvelle paire rien=
 que pour ces 2 &quot;<br>
-@@ -24551,8 +24551,8 @@ msgid &quot;&quot;<br>
- &quot;referred to.\n&quot;<br>
- &quot;It will not be copied.&quot;<br>
- msgstr &quot;&quot;<br>
--&quot;Vous essayer de coller une r=C3=A9f=C3=A9rence vers %1$s dans %2$hs=
.\n&quot;<br>
--&quot;Mais %1$hs n&#39;existe pas dans cette fonte, et FontForge ne trouv=
e pas le &quot;<br>
-+&quot;Vous essayer de coller une r=C3=A9f=C3=A9rence vers %1$s dans %2$s.=
\n&quot;<br>
-+&quot;Mais %1$s n&#39;existe pas dans cette fonte, et FontForge ne trouve=
 pas le &quot;<br>
- &quot;glyphe auquel il se r=C3=A9f=C3=A9rait.\n&quot;<br>
- &quot;Le glyphe ne sera pas copi=C3=A9.&quot;<br>
- <br>
-@@ -24562,8 +24562,8 @@ msgid &quot;&quot;<br>
- &quot;But %1$s does not exist in this font.\n&quot;<br>
- &quot;Would you like to copy the original splines (or delete the referenc=
e)?&quot;<br>
- msgstr &quot;&quot;<br>
--&quot;Vous essayer de coller une r=C3=A9f=C3=A9rence vers %1$s dans %2$hs=
.\n&quot;<br>
--&quot;Mais %1$hs n&#39;existe pas dans cette fonte.\n&quot;<br>
-+&quot;Vous essayer de coller une r=C3=A9f=C3=A9rence vers %1$s dans %2$s.=
\n&quot;<br>
-+&quot;Mais %1$s n&#39;existe pas dans cette fonte.\n&quot;<br>
- &quot;Voulez vous copier le contour d&#39;origine (ou supprimer la r=C3=
=A9f=C3=A9rence)?&quot;<br>
- <br>
- msgid &quot;&quot;<br>
-diff --git a/po/hr.po b/po/hr.po<br>
-index d261d4ca7..ac41b9250 100644<br>
---- a/po/hr.po<br>
-+++ b/po/hr.po<br>
-@@ -20156,11 +20156,11 @@ msgstr &quot;&quot;<br>
- <br>
- #, c-format<br>
- msgid &quot;&quot;<br>
--&quot;The %1$s in the search dialog contains a reference to %2$.20hs whic=
h does &quot;<br>
-+&quot;The %1$s in the search dialog contains a reference to %2$.20s which=
 does &quot;<br>
- &quot;not exist in the new font.\n&quot;<br>
- &quot;Should I remove the reference?&quot;<br>
- msgstr &quot;&quot;<br>
--&quot;%1$s u dijalo=C5=A1kom okviru tra=C5=BEenja sadr=C5=BEi referencu n=
a %2$.20hs koja ne &quot;<br>
-+&quot;%1$s u dijalo=C5=A1kom okviru tra=C5=BEenja sadr=C5=BEi referencu n=
a %2$.20s koja ne &quot;<br>
- &quot;postoji u fontu.\n&quot;<br>
- &quot;=C5=BDeli=C5=A1 li dozvoliti uklanjanje reference?&quot;<br>
- <br>
-diff --git a/po/it.po b/po/it.po<br>
-index e13711485..d0c3ea987 100644<br>
---- a/po/it.po<br>
-+++ b/po/it.po<br>
-@@ -2303,7 +2303,7 @@ msgid &quot;&quot;<br>
- &quot;Reverting the file will lose those changes.\n&quot;<br>
- &quot;Is that what you want?&quot;<br>
- msgstr &quot;&quot;<br>
--&quot;Il font %1$.40s nel file %2$.40hs =C3=A8 stato modificato.\n&quot;<=
br>
-+&quot;Il font %1$.40s nel file %2$.40s =C3=A8 stato modificato.\n&quot;<b=
r>
- &quot;Ripristinando il file perderai tutte le modifiche.\n&quot;<br>
- &quot;=C3=88 quello che vuoi fare?&quot;<br>
- <br>
-@@ -5835,7 +5835,7 @@ msgid &quot;&quot;<br>
- &quot;The glyph %1$.30s has a different number of contours in font %2$.30=
s than in &quot;<br>
- &quot;%3$.30s&quot;<br>
- msgstr &quot;&quot;<br>
--&quot;Il glifo %1$.30s ha un diverso numero di contorni nel font %2$.30hs=
 rispetto &quot;<br>
-+&quot;Il glifo %1$.30s ha un diverso numero di contorni nel font %2$.30s =
rispetto &quot;<br>
- &quot;a %3$.30s&quot;<br>
- <br>
- #, c-format<br>
-@@ -6235,8 +6235,8 @@ msgid &quot;&quot;<br>
- &quot;been able to find is %1$.20s-%2$.20s-%4$d.\n&quot;<br>
- &quot;Shall I use that or let you search?&quot;<br>
- msgstr &quot;&quot;<br>
--&quot;Questo font =C3=A8 basato sulla codifica di caratteri %1$.20s-%2$.2=
0hs-%3$d, ma &quot;<br>
--&quot;il migliore che io abbia trovato =C3=A8 %1$.20hs-%2$.20hs-%4$d.\n&q=
uot;<br>
-+&quot;Questo font =C3=A8 basato sulla codifica di caratteri %1$.20s-%2$.2=
0s-%3$d, ma &quot;<br>
-+&quot;il migliore che io abbia trovato =C3=A8 %1$.20s-%2$.20s-%4$d.\n&quo=
t;<br>
- &quot;Devo usare questo valore o preferisci cercare tu stesso?&quot;<br>
- <br>
- msgid &quot;&quot;<br>
-diff --git a/po/ja.po b/po/ja.po<br>
-index ed9f5a645..206ae82d1 100644<br>
---- a/po/ja.po<br>
-+++ b/po/ja.po<br>
-@@ -11458,11 +11458,11 @@ msgstr &quot;&quot;<br>
- <br>
- #, c-format<br>
- msgid &quot;&quot;<br>
--&quot;The %1$s in the search dialog contains a reference to %2$.20hs whic=
h does &quot;<br>
-+&quot;The %1$s in the search dialog contains a reference to %2$.20s which=
 does &quot;<br>
- &quot;not exist in the new font.\n&quot;<br>
- &quot;Should I remove the reference?&quot;<br>
- msgstr &quot;&quot;<br>
--&quot;%1$s =E3=81=AB=E3=81=AF, =E6=96=B0=E3=81=97=E3=81=84=E3=83=95=E3=82=
=A9=E3=83=B3=E3=83=88=E3=81=AB=E3=81=AF=E5=90=AB=E3=81=BE=E3=82=8C=E3=81=AA=
=E3=81=84=E3=82=B0=E3=83=AA=E3=83=95 %2$.20hs =E3=81=B8=E3=81=AE=E5=8F=82=
=E7=85=A7=E3=81=8C=E5=90=AB=E3=81=BE=E3=82=8C=E3=81=A6=E3=81=84=E3=81=BE&qu=
ot;<br>
-+&quot;%1$s =E3=81=AB=E3=81=AF, =E6=96=B0=E3=81=97=E3=81=84=E3=83=95=E3=82=
=A9=E3=83=B3=E3=83=88=E3=81=AB=E3=81=AF=E5=90=AB=E3=81=BE=E3=82=8C=E3=81=AA=
=E3=81=84=E3=82=B0=E3=83=AA=E3=83=95 %2$.20s =E3=81=B8=E3=81=AE=E5=8F=82=E7=
=85=A7=E3=81=8C=E5=90=AB=E3=81=BE=E3=82=8C=E3=81=A6=E3=81=84=E3=81=BE&quot;=
<br>
- &quot;=E3=81=99.\n&quot;<br>
- &quot;=E5=8F=82=E7=85=A7=E3=82=92=E5=89=8A=E9=99=A4=E3=81=97=E3=81=BE=E3=
=81=99=E3=81=8B?&quot;<br>
- <br>
-diff --git a/po/ko.po b/po/ko.po<br>
-index 971b4db03..4d5c8d40d 100644<br>
---- a/po/ko.po<br>
-+++ b/po/ko.po<br>
-@@ -20920,11 +20920,11 @@ msgstr &quot;&quot;<br>
- <br>
- #, c-format<br>
- msgid &quot;&quot;<br>
--&quot;The %1$s in the search dialog contains a reference to %2$.20hs whic=
h does &quot;<br>
-+&quot;The %1$s in the search dialog contains a reference to %2$.20s which=
 does &quot;<br>
- &quot;not exist in the new font.\n&quot;<br>
- &quot;Should I remove the reference?&quot;<br>
- msgstr &quot;&quot;<br>
--&quot;=EA=B2=80=EC=83=89 =EB=8C=80=ED=99=94 =EC=83=81=EC=9E=90=EC=9D=98 %=
1$s=EC=97=90=EB=8A=94 =EC=83=88 =EA=B8=80=EA=BC=B4=EC=97=90 =EC=97=86=EB=8A=
=94 %2$.20hs=EC=97=90 =EB=8C=80=ED=95=9C =EC=B0=B8=EC=A1=B0=EA=B0=80 =ED=8F=
=AC=ED=95=A8=EB=90=98=EC=96=B4 =EC=9E=88&quot;<br>
-+&quot;=EA=B2=80=EC=83=89 =EB=8C=80=ED=99=94 =EC=83=81=EC=9E=90=EC=9D=98 %=
1$s=EC=97=90=EB=8A=94 =EC=83=88 =EA=B8=80=EA=BC=B4=EC=97=90 =EC=97=86=EB=8A=
=94 %2$.20s=EC=97=90 =EB=8C=80=ED=95=9C =EC=B0=B8=EC=A1=B0=EA=B0=80 =ED=8F=
=AC=ED=95=A8=EB=90=98=EC=96=B4 =EC=9E=88&quot;<br>
- &quot;=EB=8B=A4.\n&quot;<br>
- &quot;=EC=B0=B8=EC=A1=B0=EB=A5=BC =EC=A0=9C=EA=B1=B0=ED=95=B4=EC=95=BC =
=ED=95=98=EB=8A=94=EA=B0=80?&quot;<br>
- <br>
-diff --git a/po/pl.po b/po/pl.po<br>
-index 2bbbf00be..c1fd5a454 100644<br>
---- a/po/pl.po<br>
-+++ b/po/pl.po<br>
-@@ -19552,11 +19552,11 @@ msgstr &quot;&quot;<br>
- <br>
- #, c-format<br>
- msgid &quot;&quot;<br>
--&quot;The %1$s in the search dialog contains a reference to %2$.20hs whic=
h does &quot;<br>
-+&quot;The %1$s in the search dialog contains a reference to %2$.20s which=
 does &quot;<br>
- &quot;not exist in the new font.\n&quot;<br>
- &quot;Should I remove the reference?&quot;<br>
- msgstr &quot;&quot;<br>
--&quot;%1$s w okienku wyszukiwania zawiera odwo=C5=82anie do %2$.20hs, kt=
=C3=B3ry nie &quot;<br>
-+&quot;%1$s w okienku wyszukiwania zawiera odwo=C5=82anie do %2$.20s, kt=
=C3=B3ry nie &quot;<br>
- &quot;istnieje w nowym foncie.\n&quot;<br>
- &quot;Czy usun=C4=85=C4=87 to odwo=C5=82anie?&quot;<br>
- <br>
-diff --git a/po/uk.po b/po/uk.po<br>
-index e3768acc3..3302a1005 100644<br>
---- a/po/uk.po<br>
-+++ b/po/uk.po<br>
-@@ -19860,11 +19860,11 @@ msgstr &quot;&quot;<br>
- <br>
- #, c-format<br>
- msgid &quot;&quot;<br>
--&quot;The %1$s in the search dialog contains a reference to %2$.20hs whic=
h does &quot;<br>
-+&quot;The %1$s in the search dialog contains a reference to %2$.20s which=
 does &quot;<br>
- &quot;not exist in the new font.\n&quot;<br>
- &quot;Should I remove the reference?&quot;<br>
- msgstr &quot;&quot;<br>
--&quot;%1$s =D1=83 =D0=B4=D1=96=D0=B0=D0=BB=D0=BE=D0=B3=D0=BE=D0=B2=D0=BE=
=D0=BC=D1=83 =D0=B2=D1=96=D0=BA=D0=BD=D1=96 =D0=BF=D0=BE=D1=88=D1=83=D0=BA=
=D1=83 =D0=BC=D1=96=D1=81=D1=82=D0=B8=D1=82=D1=8C =D0=BF=D0=BE=D1=81=D0=B8=
=D0=BB=D0=B0=D0=BD=D0=BD=D1=8F =D0=BD=D0=B0 %2$.20hs, =D1=8F=D0=BA=D0=BE=D0=
=B3=D0=BE =D0=BD=D0=B5 &quot;<br>
-+&quot;%1$s =D1=83 =D0=B4=D1=96=D0=B0=D0=BB=D0=BE=D0=B3=D0=BE=D0=B2=D0=BE=
=D0=BC=D1=83 =D0=B2=D1=96=D0=BA=D0=BD=D1=96 =D0=BF=D0=BE=D1=88=D1=83=D0=BA=
=D1=83 =D0=BC=D1=96=D1=81=D1=82=D0=B8=D1=82=D1=8C =D0=BF=D0=BE=D1=81=D0=B8=
=D0=BB=D0=B0=D0=BD=D0=BD=D1=8F =D0=BD=D0=B0 %2$.20s, =D1=8F=D0=BA=D0=BE=D0=
=B3=D0=BE =D0=BD=D0=B5 &quot;<br>
- &quot;=D1=96=D1=81=D0=BD=D1=83=D1=94 =D1=83 =D0=BD=D0=BE=D0=B2=D0=BE=D0=
=BC=D1=83 =D1=88=D1=80=D0=B8=D1=84=D1=82=D1=96.\n&quot;<br>
- &quot;=D0=92=D0=B8=D0=BB=D1=83=D1=87=D0=B8=D1=82=D0=B8 =D1=86=D0=B5 =D0=
=BF=D0=BE=D1=81=D0=B8=D0=BB=D0=B0=D0=BD=D0=BD=D1=8F?&quot;<br>
- <br>
-diff --git a/po/vi.po b/po/vi.po<br>
-index 6aee8bb3f..f5eb739e6 100644<br>
---- a/po/vi.po<br>
-+++ b/po/vi.po<br>
-@@ -17109,11 +17109,11 @@ msgstr &quot;&quot;<br>
- <br>
- #, c-format<br>
- msgid &quot;&quot;<br>
--&quot;The %1$s in the search dialog contains a reference to %2$.20hs whic=
h does &quot;<br>
-+&quot;The %1$s in the search dialog contains a reference to %2$.20s which=
 does &quot;<br>
- &quot;not exist in the new font.\n&quot;<br>
- &quot;Should I remove the reference?&quot;<br>
- msgstr &quot;&quot;<br>
--&quot;Trong h=E1=BB=99p tho=E1=BA=A1i t=C3=ACm ki=E1=BA=BFm, %1$s ch=E1=
=BB=A9a m=E1=BB=99t tham chi=E1=BA=BFu =C4=91=E1=BA=BFn %2$.20hs m=C3=A0 kh=
=C3=B4ng t=E1=BB=93n &quot;<br>
-+&quot;Trong h=E1=BB=99p tho=E1=BA=A1i t=C3=ACm ki=E1=BA=BFm, %1$s ch=E1=
=BB=A9a m=E1=BB=99t tham chi=E1=BA=BFu =C4=91=E1=BA=BFn %2$.20s m=C3=A0 kh=
=C3=B4ng t=E1=BB=93n &quot;<br>
- &quot;t=E1=BA=A1i trong ph=C3=B4ng m=E1=BB=9Bi.\n&quot;<br>
- &quot;B=E1=BA=A1n c=C3=B3 mu=E1=BB=91n g=E1=BB=A1 b=E1=BB=8F tham chi=E1=
=BA=BFu n=C3=A0y kh=C3=B4ng?&quot;<br>
- <br>
--- <br>
-2.42.0<br>
-<br>
diff --git a/meta-oe/recipes-graphics/fontforge/fontforge/CVE-2024-25081_CV=
E-2024-25082.patch b/meta-oe/recipes-graphics/fontforge/fontforge/CVE-2024-=
25081_CVE-2024-25082.patch<br>
deleted file mode 100644<br>
index 40f85e9f33..0000000000<br>
--- a/meta-oe/recipes-graphics/fontforge/fontforge/CVE-2024-25081_CVE-2024-=
25082.patch<br>
+++ /dev/null<br>
@@ -1,181 +0,0 @@<br>
-From 216eb14b558df344b206bf82e2bdaf03a1f2f429 Mon Sep 17 00:00:00 2001<br>
-From: Peter Kydas &lt;<a href=3D"mailto:pk@canva.com" target=3D"_blank">pk=
@canva.com</a>&gt;<br>
-Date: Tue, 6 Feb 2024 20:03:04 +1100<br>
-Subject: [PATCH] fix splinefont shell command injection (#5367)<br>
-<br>
-CVE: CVE-2024-25081<br>
-CVE: CVE-2024-25082<br>
-Upstream-Status: Backport [<a href=3D"https://github.com/fontforge/fontfor=
ge/commit/216eb14b558df344b206bf82e2bdaf03a1f2f429" rel=3D"noreferrer" targ=
et=3D"_blank">https://github.com/fontforge/fontforge/commit/216eb14b558df34=
4b206bf82e2bdaf03a1f2f429</a>]<br>
-Signed-off-by: Peter Marko &lt;<a href=3D"mailto:peter.marko@siemens.com" =
target=3D"_blank">peter.marko@siemens.com</a>&gt;<br>
----<br>
- fontforge/splinefont.c | 123 +++++++++++++++++++++++++++++------------<br=
>
- 1 file changed, 89 insertions(+), 34 deletions(-)<br>
-<br>
-diff --git a/fontforge/splinefont.c b/fontforge/splinefont.c<br>
-index 239fdc035..647daee10 100644<br>
---- a/fontforge/splinefont.c<br>
-+++ b/fontforge/splinefont.c<br>
-@@ -788,11 +788,14 @@ return( name );<br>
- <br>
- char *Unarchive(char *name, char **_archivedir) {<br>
-=C2=A0 =C2=A0 =C2=A0char *dir =3D getenv(&quot;TMPDIR&quot;);<br>
--=C2=A0 =C2=A0 char *pt, *archivedir, *listfile, *listcommand, *unarchivec=
md, *desiredfile;<br>
-+=C2=A0 =C2=A0 char *pt, *archivedir, *listfile, *desiredfile;<br>
-=C2=A0 =C2=A0 =C2=A0char *finalfile;<br>
-=C2=A0 =C2=A0 =C2=A0int i;<br>
-=C2=A0 =C2=A0 =C2=A0int doall=3Dfalse;<br>
-=C2=A0 =C2=A0 =C2=A0static int cnt=3D0;<br>
-+=C2=A0 =C2=A0 gchar *command[5];<br>
-+=C2=A0 =C2=A0 gchar *stdoutresponse =3D NULL;<br>
-+=C2=A0 =C2=A0 gchar *stderrresponse =3D NULL;<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0*_archivedir =3D NULL;<br>
- <br>
-@@ -827,18 +830,30 @@ return( NULL );<br>
-=C2=A0 =C2=A0 =C2=A0listfile =3D malloc(strlen(archivedir)+strlen(&quot;/&=
quot; TOC_NAME)+1);<br>
-=C2=A0 =C2=A0 =C2=A0sprintf( listfile, &quot;%s/&quot; TOC_NAME, archivedi=
r );<br>
- <br>
--=C2=A0 =C2=A0 listcommand =3D malloc( strlen(archivers[i].unarchive) + 1 =
+<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 strlen( archivers[i].listargs) + 1 +<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 strlen( name ) + 3 +<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 strlen( listfile ) +4 );<br>
--=C2=A0 =C2=A0 sprintf( listcommand, &quot;%s %s %s &gt; %s&quot;, archive=
rs[i].unarchive,<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 archivers[i].listargs, name, listfile =
);<br>
--=C2=A0 =C2=A0 if ( system(listcommand)!=3D0 ) {<br>
--=C2=A0 =C2=A0 =C2=A0 free(listcommand); free(listfile);<br>
--=C2=A0 =C2=A0 =C2=A0 ArchiveCleanup(archivedir);<br>
--return( NULL );<br>
-+=C2=A0 =C2=A0 command[0] =3D archivers[i].unarchive;<br>
-+=C2=A0 =C2=A0 command[1] =3D archivers[i].listargs;<br>
-+=C2=A0 =C2=A0 command[2] =3D name;<br>
-+=C2=A0 =C2=A0 command[3] =3D NULL; // command args need to be NULL-termin=
ated<br>
-+<br>
-+=C2=A0 =C2=A0 if ( g_spawn_sync(<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 NULL,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 command,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 NULL,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 G_SPAWN_SEARCH_PATH, <br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 NULL, <br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 NULL, <br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &amp;stdoutresponse, <br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &amp;stderrresponse, <br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 NULL, <br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 NULL<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ) =3D=3D FALSE) { // did not successfully execute<br>
-+=C2=A0 =C2=A0 =C2=A0 ArchiveCleanup(archivedir);<br>
-+=C2=A0 =C2=A0 =C2=A0 return( NULL );<br>
-=C2=A0 =C2=A0 =C2=A0}<br>
--=C2=A0 =C2=A0 free(listcommand);<br>
-+=C2=A0 =C2=A0 // Write out the listfile to be read in later<br>
-+=C2=A0 =C2=A0 FILE *fp =3D fopen(listfile, &quot;wb&quot;);<br>
-+=C2=A0 =C2=A0 fwrite(stdoutresponse, strlen(stdoutresponse), 1, fp);<br>
-+=C2=A0 =C2=A0 fclose(fp);<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0desiredfile =3D ArchiveParseTOC(listfile, archivers[i]=
.ars, &amp;doall);<br>
-=C2=A0 =C2=A0 =C2=A0free(listfile);<br>
-@@ -847,22 +862,28 @@ return( NULL );<br>
- return( NULL );<br>
-=C2=A0 =C2=A0 =C2=A0}<br>
- <br>
--=C2=A0 =C2=A0 /* I tried sending everything to stdout, but that doesn&#39=
;t work if the */<br>
--=C2=A0 =C2=A0 /*=C2=A0 output is a directory file (ufo, sfdir) */<br>
--=C2=A0 =C2=A0 unarchivecmd =3D malloc( strlen(archivers[i].unarchive) + 1=
 +<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 strlen( archivers[i].listargs) + 1 +<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 strlen( name ) + 1 +<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 strlen( desiredfile ) + 3 +<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 strlen( archivedir ) + 30 );<br>
--=C2=A0 =C2=A0 sprintf( unarchivecmd, &quot;( cd %s ; %s %s %s %s ) &gt; /=
dev/null&quot;, archivedir,<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 archivers[i].unarchive,<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 archivers[i].extractargs, name, doall =
? &quot;&quot; : desiredfile );<br>
--=C2=A0 =C2=A0 if ( system(unarchivecmd)!=3D0 ) {<br>
--=C2=A0 =C2=A0 =C2=A0 free(unarchivecmd); free(desiredfile);<br>
--=C2=A0 =C2=A0 =C2=A0 ArchiveCleanup(archivedir);<br>
--return( NULL );<br>
-+=C2=A0 =C2=A0 command[0] =3D archivers[i].unarchive;<br>
-+=C2=A0 =C2=A0 command[1] =3D archivers[i].extractargs;<br>
-+=C2=A0 =C2=A0 command[2] =3D name;<br>
-+=C2=A0 =C2=A0 command[3] =3D doall ? &quot;&quot; : desiredfile;<br>
-+=C2=A0 =C2=A0 command[4] =3D NULL;<br>
-+<br>
-+=C2=A0 =C2=A0 if ( g_spawn_sync(<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 (gchar*)archivedir,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 command,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 NULL,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 G_SPAWN_SEARCH_PATH, <br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 NULL, <br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 NULL, <br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &amp;stdoutresponse, <br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &amp;stderrresponse, <br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 NULL, <br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 NULL<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ) =3D=3D FALSE) { // did not successfully execute<br>
-+=C2=A0 =C2=A0 =C2=A0 free(desiredfile);<br>
-+=C2=A0 =C2=A0 =C2=A0 ArchiveCleanup(archivedir);<br>
-+=C2=A0 =C2=A0 =C2=A0 return( NULL );<br>
-=C2=A0 =C2=A0 =C2=A0}<br>
--=C2=A0 =C2=A0 free(unarchivecmd);<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0finalfile =3D malloc( strlen(archivedir) + 1 + strlen(=
desiredfile) + 1);<br>
-=C2=A0 =C2=A0 =C2=A0sprintf( finalfile, &quot;%s/%s&quot;, archivedir, des=
iredfile );<br>
-@@ -885,20 +906,54 @@ struct compressors compressors[] =3D {<br>
- <br>
- char *Decompress(char *name, int compression) {<br>
-=C2=A0 =C2=A0 =C2=A0char *dir =3D getenv(&quot;TMPDIR&quot;);<br>
--=C2=A0 =C2=A0 char buf[1500];<br>
-=C2=A0 =C2=A0 =C2=A0char *tmpfn;<br>
--<br>
-+=C2=A0 =C2=A0 gchar *command[4];<br>
-+=C2=A0 =C2=A0 gint stdout_pipe;<br>
-+=C2=A0 =C2=A0 gchar buffer[4096];<br>
-+=C2=A0 =C2=A0 gssize bytes_read;<br>
-+=C2=A0 =C2=A0 GByteArray *binary_data =3D g_byte_array_new();<br>
-+=C2=A0 =C2=A0 <br>
-=C2=A0 =C2=A0 =C2=A0if ( dir=3D=3DNULL ) dir =3D P_tmpdir;<br>
-=C2=A0 =C2=A0 =C2=A0tmpfn =3D malloc(strlen(dir)+strlen(GFileNameTail(name=
))+2);<br>
-=C2=A0 =C2=A0 =C2=A0strcpy(tmpfn,dir);<br>
-=C2=A0 =C2=A0 =C2=A0strcat(tmpfn,&quot;/&quot;);<br>
-=C2=A0 =C2=A0 =C2=A0strcat(tmpfn,GFileNameTail(name));<br>
-=C2=A0 =C2=A0 =C2=A0*strrchr(tmpfn,&#39;.&#39;) =3D &#39;\0&#39;;<br>
--=C2=A0 =C2=A0 snprintf( buf, sizeof(buf), &quot;%s &lt; %s &gt; %s&quot;,=
 compressors[compression].decomp, name, tmpfn );<br>
--=C2=A0 =C2=A0 if ( system(buf)=3D=3D0 )<br>
--return( tmpfn );<br>
--=C2=A0 =C2=A0 free(tmpfn);<br>
--return( NULL );<br>
-+<br>
-+=C2=A0 =C2=A0 command[0] =3D compressors[compression].decomp;<br>
-+=C2=A0 =C2=A0 command[1] =3D &quot;-c&quot;;<br>
-+=C2=A0 =C2=A0 command[2] =3D name;<br>
-+=C2=A0 =C2=A0 command[3] =3D NULL;<br>
-+<br>
-+=C2=A0 =C2=A0 // Have to use async because g_spawn_sync doesn&#39;t handl=
e nul-bytes in the output (which happens with binary data)<br>
-+=C2=A0 =C2=A0 if (g_spawn_async_with_pipes(<br>
-+=C2=A0 =C2=A0 =C2=A0 NULL, <br>
-+=C2=A0 =C2=A0 =C2=A0 command, <br>
-+=C2=A0 =C2=A0 =C2=A0 NULL, <br>
-+=C2=A0 =C2=A0 =C2=A0 G_SPAWN_DO_NOT_REAP_CHILD | G_SPAWN_SEARCH_PATH,<br>
-+=C2=A0 =C2=A0 =C2=A0 NULL, <br>
-+=C2=A0 =C2=A0 =C2=A0 NULL,=C2=A0 <br>
-+=C2=A0 =C2=A0 =C2=A0 NULL,<br>
-+=C2=A0 =C2=A0 =C2=A0 NULL, <br>
-+=C2=A0 =C2=A0 =C2=A0 &amp;stdout_pipe, <br>
-+=C2=A0 =C2=A0 =C2=A0 NULL, <br>
-+=C2=A0 =C2=A0 =C2=A0 NULL) =3D=3D FALSE) {<br>
-+=C2=A0 =C2=A0 =C2=A0 //command has failed<br>
-+=C2=A0 =C2=A0 =C2=A0 return( NULL );<br>
-+=C2=A0 =C2=A0 }<br>
-+<br>
-+=C2=A0 =C2=A0 // Read binary data from pipe and output to file<br>
-+=C2=A0 =C2=A0 while ((bytes_read =3D read(stdout_pipe, buffer, sizeof(buf=
fer))) &gt; 0) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_byte_array_append(binary_data, (guint8 *)bu=
ffer, bytes_read);<br>
-+=C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 close(stdout_pipe);<br>
-+<br>
-+=C2=A0 =C2=A0 FILE *fp =3D fopen(tmpfn, &quot;wb&quot;);<br>
-+=C2=A0 =C2=A0 fwrite(binary_data-&gt;data, sizeof(gchar), binary_data-&gt=
;len, fp);<br>
-+=C2=A0 =C2=A0 fclose(fp);<br>
-+=C2=A0 =C2=A0 g_byte_array_free(binary_data, TRUE);<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return(tmpfn);<br>
- }<br>
- <br>
- static char *ForceFileToHaveName(FILE *file, char *exten) {<br>
diff --git a/meta-oe/recipes-graphics/fontforge/<a href=3D"http://fontforge=
_20230101.bb" rel=3D"noreferrer" target=3D"_blank">fontforge_20230101.bb</a=
> b/meta-oe/recipes-graphics/fontforge/<a href=3D"http://fontforge_20251009=
.bb" rel=3D"noreferrer" target=3D"_blank">fontforge_20251009.bb</a><br>
similarity index 72%<br>
rename from meta-oe/recipes-graphics/fontforge/<a href=3D"http://fontforge_=
20230101.bb" rel=3D"noreferrer" target=3D"_blank">fontforge_20230101.bb</a>=
<br>
rename to meta-oe/recipes-graphics/fontforge/<a href=3D"http://fontforge_20=
251009.bb" rel=3D"noreferrer" target=3D"_blank">fontforge_20251009.bb</a><b=
r>
index af77ec913e..2d08ee2e57 100644<br>
--- a/meta-oe/recipes-graphics/fontforge/<a href=3D"http://fontforge_202301=
01.bb" rel=3D"noreferrer" target=3D"_blank">fontforge_20230101.bb</a><br>
+++ b/meta-oe/recipes-graphics/fontforge/<a href=3D"http://fontforge_202510=
09.bb" rel=3D"noreferrer" target=3D"_blank">fontforge_20251009.bb</a><br>
@@ -6,21 +6,17 @@ LIC_FILES_CHKSUM =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0file://LICENSE;md5=3Dd042f3d2a8fd7208b704a499168e3c89 \=
<br>
=C2=A0&quot;<br>
<br>
-DEPENDS =3D &quot;python3 glib-2.0 pango giflib tiff libxml2 jpeg libtool =
uthash gettext-native libspiro&quot;<br>
-DEPENDS:append:class-target =3D &quot; libxi&quot;<br>
+DEPENDS =3D &quot;python3 glib-2.0 pango giflib tiff libxml2 jpeg libtool =
uthash gettext-native libspiro gtkmm3&quot;<br></blockquote><div><br></div>=
<div>Adding gtkmm3=C2=A0adds a dep on gtkmm3-native when extending this rec=
ipe to be native. see</div><div><br></div><div><a href=3D"https://autobuild=
er.yoctoproject.org/valkyrie/#/builders/81/builds/1272/steps/12/logs/errors=
">https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/builds/1272/s=
teps/12/logs/errors</a></div><div><br></div><div>Perhaps it can be limited =
to just target recipe ?</div><div>=C2=A0</div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">
<br>
=C2=A0inherit cmake pkgconfig python3native python3targetconfig features_ch=
eck gettext gtk-icon-cache mime mime-xdg<br>
<br>
-REQUIRED_DISTRO_FEATURES:append:class-target =3D &quot; x11&quot;<br>
+ANY_OF_DISTRO_FEATURES =3D &quot;${GTK3DISTROFEATURES}&quot;<br>
<br>
-# tag 20220308<br>
-SRCREV =3D &quot;a1dad3e81da03d5d5f3c4c1c1b9b5ca5ebcfcecf&quot;<br>
-SRC_URI =3D &quot;git://<a href=3D"http://github.com/$%7BBPN%7D/$%7BBPN%7D=
.git;branch=3Dmaster;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_blank"=
>github.com/${BPN}/${BPN}.git;branch=3Dmaster;protocol=3Dhttps</a> \<br>
+SRCREV =3D &quot;c41bdb922285f35defd1e1385adfd13bde1ab32a&quot;<br>
+SRC_URI =3D &quot;git://<a href=3D"http://github.com/$%7BBPN%7D/$%7BBPN%7D=
.git;branch=3Dmaster;protocol=3Dhttps;tag=3D$%7BPV%7D" rel=3D"noreferrer" t=
arget=3D"_blank">github.com/${BPN}/${BPN}.git;branch=3Dmaster;protocol=3Dht=
tps;tag=3D${PV}</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-include-sys-select-on=
-non-glibc-platforms.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-fontforgeexe-Use-env-=
to-find-fontforge.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-cmake-Use-alternate-w=
ay-to-detect-libm.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Fix-Translations-cont=
aining-invalid-directives-hs.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2024-25081_CVE-2024-25=
082.patch \<br>
=C2=A0&quot;<br>
<br>
=C2=A0EXTRA_OECMAKE =3D &quot;-DENABLE_DOCS=3DOFF&quot;<br>
@@ -31,12 +27,6 @@ CFLAGS +=3D &quot;-fno-strict-aliasing&quot;<br>
=C2=A0LDFLAGS +=3D &quot;-lpython${PYTHON_BASEVERSION}${PYTHON_ABI}&quot;<b=
r>
=C2=A0BUILD_LDFLAGS +=3D &quot;-lpython${PYTHON_BASEVERSION}${PYTHON_ABI}&q=
uot;<br>
<br>
-#do_configure:prepend() {<br>
-# uthash sources are expected in uthash/src<br>
-#=C2=A0 =C2=A0 mkdir -p ${S}/uthash/src<br>
-#=C2=A0 =C2=A0 cp ${STAGING_INCDIR}/ut*.h ${S}/uthash/src<br>
-#}<br>
-<br>
=C2=A0PACKAGES =3D+ &quot;${PN}-python&quot;<br>
<br>
=C2=A0FILES:${PN} +=3D &quot; \<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#123870): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/123870" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/123870</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/117466635/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/117466635/1997914</a><br>
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

--00000000000024dda306495871cd--

