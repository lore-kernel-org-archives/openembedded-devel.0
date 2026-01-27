Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4154CD25944
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 06:50:25 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4657.1769496623149567590
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Jan 2026 22:50:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kVajfZGw;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-47edd6111b4so60247105e9.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 26 Jan 2026 22:50:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769496621; x=1770101421; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=gYs1Vx5bOBlP7xikODaxFSzVpfrsyVUF03bz61ayPqE=;
        b=kVajfZGweAM7SqQrqE1UniMgTJesVicaTiwT4EkvtdCScbP/EpTXf37v+DpV+m3xpJ
         53Rfz2wkuJpZ44TlUbTM0TWNWTZ37RBgxYLV7eTBdb0SucLFs4Dm2Gh5zNLYCggrs9uB
         13Ss+dK4Mfw81+siIIH5ZwKqTel5yNesCKGhOh+DZaqs0wNf+OLb+vjG4Kwt9gB088SG
         1NaT6IGtQvN1SYuliktrO6O0AMjrqCvBP+WSaxQNLKQxiPcCcBLC5QXWmVUp4Y2zCOik
         22YracZe8baGrBtBSF3KJNQnbYFLsS9OSLy5fVICQSGvp6ZJRsforshkdyXbBL4/ngXj
         dZ7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769496621; x=1770101421;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gYs1Vx5bOBlP7xikODaxFSzVpfrsyVUF03bz61ayPqE=;
        b=uCpIRhVAbtCJr2OgOagne0Q0QXegO7YJYtW/cKARCQbIGnBkxHKEUBG4Ux3dHAbcRF
         b6K+GgeSdweSc/O6rYdlxa1rO+DfDmAThGUkOrbCsduVu7xG0kRn/W92eTsU/U3BWZmu
         SseMJhr/YsRvOI+YjSb7ylzIXZ/omPYvaMrxz9Y9VOHLmpTNikVjr532TokTemSy9MRd
         JxXikDr1ZRuuU2OqI1IlR91RvV0iYgx9hunhat0LR4Edwnm/9sEarOF17PgjXADr/53q
         5pxG6uHxPfkLxBnvpHli8a88+SbO9VhbGO9xqTvB5rFEiz7afWLrCAjoGntgd4s275l1
         +VJw==
X-Gm-Message-State: AOJu0Yyemq6WsOal4d2F3JII71vLk44vMp1ggiAkcMO1WS6ME+nXhoEj
	KOM78/9CTu/x7CJc+XhRml0k4dfueg2v7l0Lex60Oqar89DkeVsBqWYl06HxWw==
X-Gm-Gg: AZuq6aKNG85kS3JIcqLhMIi0tzxVM/UXaV4y4VUtKXA7RBUtzh27G5PmtqqsFuLWUMy
	adOi+fvlq0iaubFd79N4CscUzyWz2TmaSUxH9e3vGScMkJEqy35Q/+66bDxKKylE6ggFVOoO3hQ
	cs8Chbenonj2S4umBX7hf0ikpwuO2T7saB/2iunqKC0T524EzSNjcziKB+pkH2lhg4WxBFzGKbf
	XK2ADyJ6jeNOPhd4MZOiFV2yh7+4TgfqlYha+FjTJSOgzdt9T99Aq2x8EZ1NjwgzJOWumjsBH9A
	MI3+yl5V799JCyXrf3eX8fC1vCjnvEUBsHtSSWq65zkE3+pD1JpoovUXOR6ZWTzoWsJL2ZXWgOM
	csVY2omfLOKvuUMetOacfiYNqA9qEuYnWODE6St8YMxKoju2MoRYZfMTUdDIEdqJ4djqQLtK6mZ
	lnA8V9PqIy
X-Received: by 2002:a5d:5d83:0:b0:435:8ff3:cd5d with SMTP id ffacd0b85a97d-435dd0aff4cmr766824f8f.32.1769496620892;
        Mon, 26 Jan 2026 22:50:20 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1c24bf8sm35191925f8f.11.2026.01.26.22.50.20
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 22:50:20 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH v2 1/4] fontforge: upgrade 20230101 -> 20251009
Date: Tue, 27 Jan 2026 07:50:15 +0100
Message-ID: <20260127065019.1324332-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Jan 2026 06:50:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123908

Drop patches that are inluded in this release.

libxi has been removed as a dependency, because the project has dropped
the x11 drawing backend, it implements everything in gtk.

Changelog: https://github.com/fontforge/fontforge/releases/tag/20251009

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---

v2: gtkmm3 has no native version currently. Disable GUI for native builds,
    and make gtkmm3 as a target-only dependency.
v1: https://lists.openembedded.org/g/openembedded-devel/message/123870

 ...ons-containing-invalid-directives-hs.patch | 385 ------------------
 .../CVE-2024-25081_CVE-2024-25082.patch       | 181 --------
 ...orge_20230101.bb => fontforge_20251009.bb} |  21 +-
 3 files changed, 8 insertions(+), 579 deletions(-)
 delete mode 100644 meta-oe/recipes-graphics/fontforge/fontforge/0001-Fix-Translations-containing-invalid-directives-hs.patch
 delete mode 100644 meta-oe/recipes-graphics/fontforge/fontforge/CVE-2024-25081_CVE-2024-25082.patch
 rename meta-oe/recipes-graphics/fontforge/{fontforge_20230101.bb => fontforge_20251009.bb} (74%)

diff --git a/meta-oe/recipes-graphics/fontforge/fontforge/0001-Fix-Translations-containing-invalid-directives-hs.patch b/meta-oe/recipes-graphics/fontforge/fontforge/0001-Fix-Translations-containing-invalid-directives-hs.patch
deleted file mode 100644
index 6d133254ed..0000000000
--- a/meta-oe/recipes-graphics/fontforge/fontforge/0001-Fix-Translations-containing-invalid-directives-hs.patch
+++ /dev/null
@@ -1,385 +0,0 @@
-From e6ccc8a8cf1391010a8220836a732da9fab19c69 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 7 Sep 2023 12:35:12 -0700
-Subject: [PATCH] Fix Translations containing invalid directives %hs
-
-Found with gettext 0.22
-Older versions of msgfmt were more sloppy, thus allowing such mistakes to cause bugs at runtime.
-
-https://bugs.gentoo.org/908868
-https://savannah.gnu.org/bugs/index.php?64333
-https://github.com/fontforge/fontforge/issues/5251
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- fontforgeexe/searchview.c |  2 +-
- po/ca.po                  |  4 ++--
- po/de.po                  |  4 ++--
- po/en_GB.po               |  4 ++--
- po/fr.po                  | 40 +++++++++++++++++++--------------------
- po/hr.po                  |  4 ++--
- po/it.po                  |  8 ++++----
- po/ja.po                  |  4 ++--
- po/ko.po                  |  4 ++--
- po/pl.po                  |  4 ++--
- po/uk.po                  |  4 ++--
- po/vi.po                  |  4 ++--
- 12 files changed, 43 insertions(+), 43 deletions(-)
-
-diff --git a/fontforgeexe/searchview.c b/fontforgeexe/searchview.c
-index 1cb39a221..7e1c109cb 100644
---- a/fontforgeexe/searchview.c
-+++ b/fontforgeexe/searchview.c
-@@ -516,7 +516,7 @@ return( true );
- 		    if ( ask_if_difficult==2 && !searcher->isvisible )
- return( false );
- 		    if ( gwwv_ask(_("Bad Reference"),(const char **) buttons,1,1,
--			    _("The %1$s in the search dialog contains a reference to %2$.20hs which does not exist in the new font.\nShould I remove the reference?"),
-+			    _("The %1$s in the search dialog contains a reference to %2$.20s which does not exist in the new font.\nShould I remove the reference?"),
- 				i==0?_("Search Pattern"):_("Replace Pattern"),
- 			        r->sc->name)==1 )
- return( false );
-diff --git a/po/ca.po b/po/ca.po
-index e2349b6ef..6c920b7c0 100644
---- a/po/ca.po
-+++ b/po/ca.po
-@@ -12347,11 +12347,11 @@ msgstr "Tai"
- 
- #, c-format
- msgid ""
--"The %1$s in the search dialog contains a reference to %2$.20hs which does "
-+"The %1$s in the search dialog contains a reference to %2$.20s which does "
- "not exist in the new font.\n"
- "Should I remove the reference?"
- msgstr ""
--"Al diàleg de cerca, %1$s conté una referència a %2$.20hs\n"
-+"Al diàleg de cerca, %1$s conté una referència a %2$.20s\n"
- "que no existeix en el nou tipus.\n"
- "Voleu eliminar la referència?"
- 
-diff --git a/po/de.po b/po/de.po
-index 41430ffae..8a31aeaa2 100644
---- a/po/de.po
-+++ b/po/de.po
-@@ -15765,11 +15765,11 @@ msgstr ""
- 
- #, c-format
- msgid ""
--"The %1$s in the search dialog contains a reference to %2$.20hs which does "
-+"The %1$s in the search dialog contains a reference to %2$.20s which does "
- "not exist in the new font.\n"
- "Should I remove the reference?"
- msgstr ""
--"%1$s im Suchdialog enthält eine Referenz auf %2$.20hs, die in der neuen "
-+"%1$s im Suchdialog enthält eine Referenz auf %2$.20s, die in der neuen "
- "Schrift nicht existiert.\n"
- "Soll der Referenz entfernt werden?"
- 
-diff --git a/po/en_GB.po b/po/en_GB.po
-index 9bd2d62bb..fce64c97d 100644
---- a/po/en_GB.po
-+++ b/po/en_GB.po
-@@ -728,11 +728,11 @@ msgstr "Template Colour"
- 
- #, c-format
- msgid ""
--"The %1$s in the search dialog contains a reference to %2$.20hs which does "
-+"The %1$s in the search dialog contains a reference to %2$.20s which does "
- "not exist in the new font.\n"
- "Should I remove the reference?"
- msgstr ""
--"The %1$s in the search dialogue contains a reference to %2$.20hs which does "
-+"The %1$s in the search dialogue contains a reference to %2$.20s which does "
- "not exist in the new font.\n"
- "Should I remove the reference?"
- 
-diff --git a/po/fr.po b/po/fr.po
-index 26e446b38..d130f89bc 100644
---- a/po/fr.po
-+++ b/po/fr.po
-@@ -291,7 +291,7 @@ msgstr "chaîne %1$.30s pour %2$.30s"
- #. GT: $4 is the changed flag ('*' for the changed items)
- #, c-format
- msgid "%1$.80s at %2$d from %3$.90s%4$s"
--msgstr "%1$.80s à %2$d de %3$.90hs%4$s"
-+msgstr "%1$.80s à %2$d de %3$.90s%4$s"
- 
- #. GT: This is the title for a window showing a bitmap character
- #. GT: It will look something like:
-@@ -302,7 +302,7 @@ msgstr "%1$.80s à %2$d de %3$.90hs%4$s"
- #. GT: $4 is the font name
- #, c-format
- msgid "%1$.80s at %2$d size %3$d from %4$.80s"
--msgstr "%1$.80s (%2$d) taille %3$d de %4$.80hs"
-+msgstr "%1$.80s (%2$d) taille %3$d de %4$.80s"
- 
- #, c-format
- msgid "%1$s from lookup subtable %2$.50s"
-@@ -7433,7 +7433,7 @@ msgid ""
- "Reverting the file will lose those changes.\n"
- "Is that what you want?"
- msgstr ""
--"La fonte %1$.40s dans le fichier %2$.40hs a été modifiée.\n"
-+"La fonte %1$.40s dans le fichier %2$.40s a été modifiée.\n"
- "Revenir vous fera perdre toutes les modifications.\n"
- "Voulez vous vraiment revenir ?"
- 
-@@ -19077,11 +19077,11 @@ msgstr ""
- 
- #, c-format
- msgid ""
--"The %1$s in the search dialog contains a reference to %2$.20hs which does "
-+"The %1$s in the search dialog contains a reference to %2$.20s which does "
- "not exist in the new font.\n"
- "Should I remove the reference?"
- msgstr ""
--"Dans %1$s du dialogue de recherche il y a une référence vers %2$.20hs qui "
-+"Dans %1$s du dialogue de recherche il y a une référence vers %2$.20s qui "
- "n'existe pas dans la nouvelle fonte.\n"
- "Faut-il supprimer la référence ?"
- 
-@@ -19925,7 +19925,7 @@ msgid ""
- "The fonts %1$.30s and %2$.30s have a different number of glyphs or different "
- "encodings"
- msgstr ""
--"Les fontes %1$.30s et %2$.30hs n'ont pas le même nombre de glyphes ou des "
-+"Les fontes %1$.30s et %2$.30s n'ont pas le même nombre de glyphes ou des "
- "codages différents"
- 
- #, c-format
-@@ -19933,7 +19933,7 @@ msgid ""
- "The fonts %1$.30s and %2$.30s use different types of splines (one quadratic, "
- "one cubic)"
- msgstr ""
--"Les fontes %1$.30s et %2$.30hs utilisent des courbes de Bézier d'ordres "
-+"Les fontes %1$.30s et %2$.30s utilisent des courbes de Bézier d'ordres "
- "différents (quadratique et cubique)"
- 
- msgid "The generated font won't work with ATM"
-@@ -19968,8 +19968,8 @@ msgid ""
- "The glyph %1$.30s in font %2$.30s has a different hint mask on its contours "
- "than in %3$.30s"
- msgstr ""
--"Le glyphe %1$.30s dans la police %2$.30hs a un masque de hints différent que "
--"dans %3$.30hs"
-+"Le glyphe %1$.30s dans la police %2$.30s a un masque de hints différent que "
-+"dans %3$.30s"
- 
- #, c-format
- msgid ""
-@@ -19984,8 +19984,8 @@ msgid ""
- "The glyph %1$.30s in font %2$.30s has a different number of references than "
- "in %3$.30s"
- msgstr ""
--"Le glyphe %1$.30s de la fonte %2$.30hs a un nombre de références différent "
--"dans %3$.30hs"
-+"Le glyphe %1$.30s de la fonte %2$.30s a un nombre de références différent "
-+"dans %3$.30s"
- 
- #, c-format
- msgid ""
-@@ -20457,7 +20457,7 @@ msgstr ""
- #, c-format
- msgid "The outlines of glyph %2$.30s were not found in the font %1$.60s"
- msgstr ""
--"Le contours du glyphe %2$.30s n'ont pas été trouvés dans la police %1$.60hs"
-+"Le contours du glyphe %2$.30s n'ont pas été trouvés dans la police %1$.60s"
- 
- msgid "The paths that make up this glyph intersect one another"
- msgstr "Les chemins qui composent ce glyphe se coupent les uns les autres"
-@@ -21042,7 +21042,7 @@ msgstr "Il y a déjà une sous-table avec ce nom, changez de nom SVP"
- 
- #, c-format
- msgid "There is already an anchor point named %1$.40s in %2$.40s."
--msgstr "Il y a déjà une ancre appelée %1$.40s dans %2$.40hs."
-+msgstr "Il y a déjà une ancre appelée %1$.40s dans %2$.40s."
- 
- msgid "There is another glyph in the font with this name"
- msgstr "Il y a un autre glyphe dans la fonte avec ce nom"
-@@ -21441,8 +21441,8 @@ msgid ""
- "been able to find is %1$.20s-%2$.20s-%4$d.\n"
- "Shall I use that or let you search?"
- msgstr ""
--"Cette fonte est basée sur le jeu de caractères %1$.20s-%2$.20hs-%3$d, mais "
--"ce que j'ai trouvé de mieux c'est %1$.20hs-%2$.20hs-%4$d.\n"
-+"Cette fonte est basée sur le jeu de caractères %1$.20s-%2$.20s-%3$d, mais "
-+"ce que j'ai trouvé de mieux c'est %1$.20s-%2$.20s-%4$d.\n"
- "Devrais-je utiliser cette valeur ou préférez vous chercher ?"
- 
- msgid ""
-@@ -21770,7 +21770,7 @@ msgid ""
- "with a 0 offset for this combination. Would you like to alter this kerning "
- "class entry (or create a kerning pair for just these two glyphs)?"
- msgstr ""
--"Cette paire de crénage (%.20s et %.20hs) est dans une classe de crénage\n"
-+"Cette paire de crénage (%.20s et %.20s) est dans une classe de crénage\n"
- "avec un déplacement de 0 pour cette combinaison. Voulez-vous modifier cette "
- "partie\n"
- "de la classe de crénage (ou créer une nouvelle paire rien que pour ces 2 "
-@@ -24551,8 +24551,8 @@ msgid ""
- "referred to.\n"
- "It will not be copied."
- msgstr ""
--"Vous essayer de coller une référence vers %1$s dans %2$hs.\n"
--"Mais %1$hs n'existe pas dans cette fonte, et FontForge ne trouve pas le "
-+"Vous essayer de coller une référence vers %1$s dans %2$s.\n"
-+"Mais %1$s n'existe pas dans cette fonte, et FontForge ne trouve pas le "
- "glyphe auquel il se référait.\n"
- "Le glyphe ne sera pas copié."
- 
-@@ -24562,8 +24562,8 @@ msgid ""
- "But %1$s does not exist in this font.\n"
- "Would you like to copy the original splines (or delete the reference)?"
- msgstr ""
--"Vous essayer de coller une référence vers %1$s dans %2$hs.\n"
--"Mais %1$hs n'existe pas dans cette fonte.\n"
-+"Vous essayer de coller une référence vers %1$s dans %2$s.\n"
-+"Mais %1$s n'existe pas dans cette fonte.\n"
- "Voulez vous copier le contour d'origine (ou supprimer la référence)?"
- 
- msgid ""
-diff --git a/po/hr.po b/po/hr.po
-index d261d4ca7..ac41b9250 100644
---- a/po/hr.po
-+++ b/po/hr.po
-@@ -20156,11 +20156,11 @@ msgstr ""
- 
- #, c-format
- msgid ""
--"The %1$s in the search dialog contains a reference to %2$.20hs which does "
-+"The %1$s in the search dialog contains a reference to %2$.20s which does "
- "not exist in the new font.\n"
- "Should I remove the reference?"
- msgstr ""
--"%1$s u dijaloškom okviru traženja sadrži referencu na %2$.20hs koja ne "
-+"%1$s u dijaloškom okviru traženja sadrži referencu na %2$.20s koja ne "
- "postoji u fontu.\n"
- "Želiš li dozvoliti uklanjanje reference?"
- 
-diff --git a/po/it.po b/po/it.po
-index e13711485..d0c3ea987 100644
---- a/po/it.po
-+++ b/po/it.po
-@@ -2303,7 +2303,7 @@ msgid ""
- "Reverting the file will lose those changes.\n"
- "Is that what you want?"
- msgstr ""
--"Il font %1$.40s nel file %2$.40hs è stato modificato.\n"
-+"Il font %1$.40s nel file %2$.40s è stato modificato.\n"
- "Ripristinando il file perderai tutte le modifiche.\n"
- "È quello che vuoi fare?"
- 
-@@ -5835,7 +5835,7 @@ msgid ""
- "The glyph %1$.30s has a different number of contours in font %2$.30s than in "
- "%3$.30s"
- msgstr ""
--"Il glifo %1$.30s ha un diverso numero di contorni nel font %2$.30hs rispetto "
-+"Il glifo %1$.30s ha un diverso numero di contorni nel font %2$.30s rispetto "
- "a %3$.30s"
- 
- #, c-format
-@@ -6235,8 +6235,8 @@ msgid ""
- "been able to find is %1$.20s-%2$.20s-%4$d.\n"
- "Shall I use that or let you search?"
- msgstr ""
--"Questo font è basato sulla codifica di caratteri %1$.20s-%2$.20hs-%3$d, ma "
--"il migliore che io abbia trovato è %1$.20hs-%2$.20hs-%4$d.\n"
-+"Questo font è basato sulla codifica di caratteri %1$.20s-%2$.20s-%3$d, ma "
-+"il migliore che io abbia trovato è %1$.20s-%2$.20s-%4$d.\n"
- "Devo usare questo valore o preferisci cercare tu stesso?"
- 
- msgid ""
-diff --git a/po/ja.po b/po/ja.po
-index ed9f5a645..206ae82d1 100644
---- a/po/ja.po
-+++ b/po/ja.po
-@@ -11458,11 +11458,11 @@ msgstr ""
- 
- #, c-format
- msgid ""
--"The %1$s in the search dialog contains a reference to %2$.20hs which does "
-+"The %1$s in the search dialog contains a reference to %2$.20s which does "
- "not exist in the new font.\n"
- "Should I remove the reference?"
- msgstr ""
--"%1$s には, 新しいフォントには含まれないグリフ %2$.20hs への参照が含まれていま"
-+"%1$s には, 新しいフォントには含まれないグリフ %2$.20s への参照が含まれていま"
- "す.\n"
- "参照を削除しますか?"
- 
-diff --git a/po/ko.po b/po/ko.po
-index 971b4db03..4d5c8d40d 100644
---- a/po/ko.po
-+++ b/po/ko.po
-@@ -20920,11 +20920,11 @@ msgstr ""
- 
- #, c-format
- msgid ""
--"The %1$s in the search dialog contains a reference to %2$.20hs which does "
-+"The %1$s in the search dialog contains a reference to %2$.20s which does "
- "not exist in the new font.\n"
- "Should I remove the reference?"
- msgstr ""
--"검색 대화 상자의 %1$s에는 새 글꼴에 없는 %2$.20hs에 대한 참조가 포함되어 있"
-+"검색 대화 상자의 %1$s에는 새 글꼴에 없는 %2$.20s에 대한 참조가 포함되어 있"
- "다.\n"
- "참조를 제거해야 하는가?"
- 
-diff --git a/po/pl.po b/po/pl.po
-index 2bbbf00be..c1fd5a454 100644
---- a/po/pl.po
-+++ b/po/pl.po
-@@ -19552,11 +19552,11 @@ msgstr ""
- 
- #, c-format
- msgid ""
--"The %1$s in the search dialog contains a reference to %2$.20hs which does "
-+"The %1$s in the search dialog contains a reference to %2$.20s which does "
- "not exist in the new font.\n"
- "Should I remove the reference?"
- msgstr ""
--"%1$s w okienku wyszukiwania zawiera odwołanie do %2$.20hs, który nie "
-+"%1$s w okienku wyszukiwania zawiera odwołanie do %2$.20s, który nie "
- "istnieje w nowym foncie.\n"
- "Czy usunąć to odwołanie?"
- 
-diff --git a/po/uk.po b/po/uk.po
-index e3768acc3..3302a1005 100644
---- a/po/uk.po
-+++ b/po/uk.po
-@@ -19860,11 +19860,11 @@ msgstr ""
- 
- #, c-format
- msgid ""
--"The %1$s in the search dialog contains a reference to %2$.20hs which does "
-+"The %1$s in the search dialog contains a reference to %2$.20s which does "
- "not exist in the new font.\n"
- "Should I remove the reference?"
- msgstr ""
--"%1$s у діалоговому вікні пошуку містить посилання на %2$.20hs, якого не "
-+"%1$s у діалоговому вікні пошуку містить посилання на %2$.20s, якого не "
- "існує у новому шрифті.\n"
- "Вилучити це посилання?"
- 
-diff --git a/po/vi.po b/po/vi.po
-index 6aee8bb3f..f5eb739e6 100644
---- a/po/vi.po
-+++ b/po/vi.po
-@@ -17109,11 +17109,11 @@ msgstr ""
- 
- #, c-format
- msgid ""
--"The %1$s in the search dialog contains a reference to %2$.20hs which does "
-+"The %1$s in the search dialog contains a reference to %2$.20s which does "
- "not exist in the new font.\n"
- "Should I remove the reference?"
- msgstr ""
--"Trong hộp thoại tìm kiếm, %1$s chứa một tham chiếu đến %2$.20hs mà không tồn "
-+"Trong hộp thoại tìm kiếm, %1$s chứa một tham chiếu đến %2$.20s mà không tồn "
- "tại trong phông mới.\n"
- "Bạn có muốn gỡ bỏ tham chiếu này không?"
- 
--- 
-2.42.0
-
diff --git a/meta-oe/recipes-graphics/fontforge/fontforge/CVE-2024-25081_CVE-2024-25082.patch b/meta-oe/recipes-graphics/fontforge/fontforge/CVE-2024-25081_CVE-2024-25082.patch
deleted file mode 100644
index 40f85e9f33..0000000000
--- a/meta-oe/recipes-graphics/fontforge/fontforge/CVE-2024-25081_CVE-2024-25082.patch
+++ /dev/null
@@ -1,181 +0,0 @@
-From 216eb14b558df344b206bf82e2bdaf03a1f2f429 Mon Sep 17 00:00:00 2001
-From: Peter Kydas <pk@canva.com>
-Date: Tue, 6 Feb 2024 20:03:04 +1100
-Subject: [PATCH] fix splinefont shell command injection (#5367)
-
-CVE: CVE-2024-25081
-CVE: CVE-2024-25082
-Upstream-Status: Backport [https://github.com/fontforge/fontforge/commit/216eb14b558df344b206bf82e2bdaf03a1f2f429]
-Signed-off-by: Peter Marko <peter.marko@siemens.com>
----
- fontforge/splinefont.c | 123 +++++++++++++++++++++++++++++------------
- 1 file changed, 89 insertions(+), 34 deletions(-)
-
-diff --git a/fontforge/splinefont.c b/fontforge/splinefont.c
-index 239fdc035..647daee10 100644
---- a/fontforge/splinefont.c
-+++ b/fontforge/splinefont.c
-@@ -788,11 +788,14 @@ return( name );
- 
- char *Unarchive(char *name, char **_archivedir) {
-     char *dir = getenv("TMPDIR");
--    char *pt, *archivedir, *listfile, *listcommand, *unarchivecmd, *desiredfile;
-+    char *pt, *archivedir, *listfile, *desiredfile;
-     char *finalfile;
-     int i;
-     int doall=false;
-     static int cnt=0;
-+    gchar *command[5];
-+    gchar *stdoutresponse = NULL;
-+    gchar *stderrresponse = NULL;
- 
-     *_archivedir = NULL;
- 
-@@ -827,18 +830,30 @@ return( NULL );
-     listfile = malloc(strlen(archivedir)+strlen("/" TOC_NAME)+1);
-     sprintf( listfile, "%s/" TOC_NAME, archivedir );
- 
--    listcommand = malloc( strlen(archivers[i].unarchive) + 1 +
--			strlen( archivers[i].listargs) + 1 +
--			strlen( name ) + 3 +
--			strlen( listfile ) +4 );
--    sprintf( listcommand, "%s %s %s > %s", archivers[i].unarchive,
--	    archivers[i].listargs, name, listfile );
--    if ( system(listcommand)!=0 ) {
--	free(listcommand); free(listfile);
--	ArchiveCleanup(archivedir);
--return( NULL );
-+    command[0] = archivers[i].unarchive;
-+    command[1] = archivers[i].listargs;
-+    command[2] = name;
-+    command[3] = NULL; // command args need to be NULL-terminated
-+
-+    if ( g_spawn_sync(
-+                      NULL,
-+                      command,
-+                      NULL,
-+                      G_SPAWN_SEARCH_PATH, 
-+                      NULL, 
-+                      NULL, 
-+                      &stdoutresponse, 
-+                      &stderrresponse, 
-+                      NULL, 
-+                      NULL
-+                      ) == FALSE) { // did not successfully execute
-+      ArchiveCleanup(archivedir);
-+      return( NULL );
-     }
--    free(listcommand);
-+    // Write out the listfile to be read in later
-+    FILE *fp = fopen(listfile, "wb");
-+    fwrite(stdoutresponse, strlen(stdoutresponse), 1, fp);
-+    fclose(fp);
- 
-     desiredfile = ArchiveParseTOC(listfile, archivers[i].ars, &doall);
-     free(listfile);
-@@ -847,22 +862,28 @@ return( NULL );
- return( NULL );
-     }
- 
--    /* I tried sending everything to stdout, but that doesn't work if the */
--    /*  output is a directory file (ufo, sfdir) */
--    unarchivecmd = malloc( strlen(archivers[i].unarchive) + 1 +
--			strlen( archivers[i].listargs) + 1 +
--			strlen( name ) + 1 +
--			strlen( desiredfile ) + 3 +
--			strlen( archivedir ) + 30 );
--    sprintf( unarchivecmd, "( cd %s ; %s %s %s %s ) > /dev/null", archivedir,
--	    archivers[i].unarchive,
--	    archivers[i].extractargs, name, doall ? "" : desiredfile );
--    if ( system(unarchivecmd)!=0 ) {
--	free(unarchivecmd); free(desiredfile);
--	ArchiveCleanup(archivedir);
--return( NULL );
-+    command[0] = archivers[i].unarchive;
-+    command[1] = archivers[i].extractargs;
-+    command[2] = name;
-+    command[3] = doall ? "" : desiredfile;
-+    command[4] = NULL;
-+
-+    if ( g_spawn_sync(
-+                      (gchar*)archivedir,
-+                      command,
-+                      NULL,
-+                      G_SPAWN_SEARCH_PATH, 
-+                      NULL, 
-+                      NULL, 
-+                      &stdoutresponse, 
-+                      &stderrresponse, 
-+                      NULL, 
-+                      NULL
-+                      ) == FALSE) { // did not successfully execute
-+      free(desiredfile);
-+      ArchiveCleanup(archivedir);
-+      return( NULL );
-     }
--    free(unarchivecmd);
- 
-     finalfile = malloc( strlen(archivedir) + 1 + strlen(desiredfile) + 1);
-     sprintf( finalfile, "%s/%s", archivedir, desiredfile );
-@@ -885,20 +906,54 @@ struct compressors compressors[] = {
- 
- char *Decompress(char *name, int compression) {
-     char *dir = getenv("TMPDIR");
--    char buf[1500];
-     char *tmpfn;
--
-+    gchar *command[4];
-+    gint stdout_pipe;
-+    gchar buffer[4096];
-+    gssize bytes_read;
-+    GByteArray *binary_data = g_byte_array_new();
-+    
-     if ( dir==NULL ) dir = P_tmpdir;
-     tmpfn = malloc(strlen(dir)+strlen(GFileNameTail(name))+2);
-     strcpy(tmpfn,dir);
-     strcat(tmpfn,"/");
-     strcat(tmpfn,GFileNameTail(name));
-     *strrchr(tmpfn,'.') = '\0';
--    snprintf( buf, sizeof(buf), "%s < %s > %s", compressors[compression].decomp, name, tmpfn );
--    if ( system(buf)==0 )
--return( tmpfn );
--    free(tmpfn);
--return( NULL );
-+
-+    command[0] = compressors[compression].decomp;
-+    command[1] = "-c";
-+    command[2] = name;
-+    command[3] = NULL;
-+
-+    // Have to use async because g_spawn_sync doesn't handle nul-bytes in the output (which happens with binary data)
-+    if (g_spawn_async_with_pipes(
-+      NULL, 
-+      command, 
-+      NULL, 
-+      G_SPAWN_DO_NOT_REAP_CHILD | G_SPAWN_SEARCH_PATH,
-+      NULL, 
-+      NULL,  
-+      NULL,
-+      NULL, 
-+      &stdout_pipe, 
-+      NULL, 
-+      NULL) == FALSE) {
-+      //command has failed
-+      return( NULL );
-+    }
-+
-+    // Read binary data from pipe and output to file
-+    while ((bytes_read = read(stdout_pipe, buffer, sizeof(buffer))) > 0) {
-+        g_byte_array_append(binary_data, (guint8 *)buffer, bytes_read);
-+    }
-+    close(stdout_pipe);
-+
-+    FILE *fp = fopen(tmpfn, "wb");
-+    fwrite(binary_data->data, sizeof(gchar), binary_data->len, fp);
-+    fclose(fp);
-+    g_byte_array_free(binary_data, TRUE);
-+
-+		return(tmpfn);
- }
- 
- static char *ForceFileToHaveName(FILE *file, char *exten) {
diff --git a/meta-oe/recipes-graphics/fontforge/fontforge_20230101.bb b/meta-oe/recipes-graphics/fontforge/fontforge_20251009.bb
similarity index 74%
rename from meta-oe/recipes-graphics/fontforge/fontforge_20230101.bb
rename to meta-oe/recipes-graphics/fontforge/fontforge_20251009.bb
index af77ec913e..ab3af19cda 100644
--- a/meta-oe/recipes-graphics/fontforge/fontforge_20230101.bb
+++ b/meta-oe/recipes-graphics/fontforge/fontforge_20251009.bb
@@ -7,23 +7,24 @@ LIC_FILES_CHKSUM = " \
 "
 
 DEPENDS = "python3 glib-2.0 pango giflib tiff libxml2 jpeg libtool uthash gettext-native libspiro"
-DEPENDS:append:class-target = " libxi"
+DEPENDS:append:class-target = " gtkmm3"
 
 inherit cmake pkgconfig python3native python3targetconfig features_check gettext gtk-icon-cache mime mime-xdg
 
-REQUIRED_DISTRO_FEATURES:append:class-target = " x11"
+ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
-# tag 20220308
-SRCREV = "a1dad3e81da03d5d5f3c4c1c1b9b5ca5ebcfcecf"
-SRC_URI = "git://github.com/${BPN}/${BPN}.git;branch=master;protocol=https \
+SRCREV = "c41bdb922285f35defd1e1385adfd13bde1ab32a"
+SRC_URI = "git://github.com/${BPN}/${BPN}.git;branch=master;protocol=https;tag=${PV} \
            file://0001-include-sys-select-on-non-glibc-platforms.patch \
            file://0001-fontforgeexe-Use-env-to-find-fontforge.patch \
            file://0001-cmake-Use-alternate-way-to-detect-libm.patch \
-           file://0001-Fix-Translations-containing-invalid-directives-hs.patch \
-           file://CVE-2024-25081_CVE-2024-25082.patch \
 "
 
 EXTRA_OECMAKE = "-DENABLE_DOCS=OFF"
+
+# gui requires gtkmm3, which has no native version at the time of writing this comment
+EXTRA_OECMAKE:append:class-native = " -DENABLE_GUI=OFF"
+
 PACKAGECONFIG = "readline"
 PACKAGECONFIG[readline] = "-DENABLE_READLINE=ON,-DENABLE_READLINE=OFF,readline"
 
@@ -31,12 +32,6 @@ CFLAGS += "-fno-strict-aliasing"
 LDFLAGS += "-lpython${PYTHON_BASEVERSION}${PYTHON_ABI}"
 BUILD_LDFLAGS += "-lpython${PYTHON_BASEVERSION}${PYTHON_ABI}"
 
-#do_configure:prepend() {
-# uthash sources are expected in uthash/src
-#    mkdir -p ${S}/uthash/src
-#    cp ${STAGING_INCDIR}/ut*.h ${S}/uthash/src
-#}
-
 PACKAGES =+ "${PN}-python"
 
 FILES:${PN} += " \

