Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
 by mx.groups.io with SMTP id smtpd.web08.17594.1616995433604936112
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Mar 2021 22:23:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=tw7LFDTM;
 spf=pass (domain: gmail.com, ip: 209.85.160.174, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f174.google.com with SMTP id l13so8547406qtu.9
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 Mar 2021 22:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=xtnFxhk9Ci2y3isFZAObw/ZnBXP9WUddaDYt4DHrYlw=;
        b=tw7LFDTMivpi/ng0ZItn0M7Qd3YAbHoCpQ7f5yvXpZotvfs0lSwPJfqVjn7E/2w8k0
         CJoi7We00pbMdlqgu1SCUQ7thLpLM0W+mxJ8NXuord/j+OQ+j/s3POVdQj2UuJeFyiTf
         avjy5tMZqx53WH6MOdjQlk/Wgcz/7gvonxeASHQzhPhiHUoqOQBk6JTJNNfXeIEvSY/J
         VH9J4PM33yUkE5zu+InWkIf3OMJwjJJoDiAw7IF7GjO4t0e5YjjGyWRTvIrzmNhjrDaW
         yTTrRh7Kznvrdpa0vv0K0V1rrqCnj3OGAhhEn62HS2loJIwUshOE6Y5+if+WFl0vxHvG
         FHLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=xtnFxhk9Ci2y3isFZAObw/ZnBXP9WUddaDYt4DHrYlw=;
        b=R6TJOP8WXqVN/i4WJELpiV5iV/n0DnPbFYQbriCbqH22crH2ogvFg3Hf2qIUzXSCT8
         KGeKYOvIbqjvJOjGKKEwg4ObDA9D1eoQmLxaKvakA8EiR47f76lCQQ7eZQEaAKaZGT3+
         y5qTfFPdShme5z/rl/g16yJWzZlOfIhL73hgcwsXTDvASvuGOdAEzGglGeNDV7tWb/Hf
         dIbSn3g5wXYGmkftucDSEkqEl6VbH2AhC3k9mwyK6fVPM0USWqaf5tnCrBf2D3HqoPCp
         O+HtTbOjPS2+51MNNtw4Tg1mskLg49+5jcke8PdIYnMbJQbvV5ly36EEiXFJMpQnh0mK
         5X4w==
X-Gm-Message-State: AOAM532z7yC/3onP7tjmMi7dhqrpDMgEkptgOt59yuKTs9o7jz5OT54w
	/cClBdfHaUNkbbt7fwLHxpwMrixuBH3CzKFTjzI=
X-Google-Smtp-Source: ABdhPJyPjYo8nrWMLW/0h+x2NJj3b01SmYVwObiIlghpJyDAi+jl8wPCgxeKnwyptMpA/fA0c00Bp/6j0a8OCs4GYsM=
X-Received: by 2002:ac8:4b6d:: with SMTP id g13mr21332077qts.369.1616995432619;
 Sun, 28 Mar 2021 22:23:52 -0700 (PDT)
MIME-Version: 1.0
References: <1616936635-30281-1-git-send-email-Neetika.Singh@kpit.com>
In-Reply-To: <1616936635-30281-1-git-send-email-Neetika.Singh@kpit.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sun, 28 Mar 2021 22:23:26 -0700
Message-ID: <CAMKF1sqnNaR9VoSATPJy9neFgA_8UZaj9xDF018YuN+zi+A2fQ@mail.gmail.com>
Subject: Re: [meta-oe][master][PATCH] libcroco: Add fix for CVE-2020-12825
To: "Neetika.Singh" <Neetika.Singh@kpit.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>, 
	Nisha Parrakat <nisha.parrakat@kpit.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

please send this to openembedde-core mailing list as this recipe
belongs to oe-core layer.

On Sun, Mar 28, 2021 at 6:04 AM Neetika.Singh <Neetika.Singh@kpit.com> wrot=
e:
>
> From: Neetika Singh <Neetika.Singh@kpit.com>
>
> Added refreshed patch for CVE issue CVE-2020-12825
> Link: https://gitlab.com/inkscape/inkscape/-/commit/203d62efefe6f79080863=
dda61593003b4c31f25
>
> Signed-off-by: Neetika.Singh <Neetika.Singh@kpit.com>
> ---
>  .../libcroco/libcroco/CVE-2020-12825.patch         | 190 +++++++++++++++=
++++++
>  meta/recipes-support/libcroco/libcroco_0.6.13.bb   |  22 +++
>  2 files changed, 212 insertions(+)
>  create mode 100644 meta/recipes-support/libcroco/libcroco/CVE-2020-12825=
.patch
>  create mode 100644 meta/recipes-support/libcroco/libcroco_0.6.13.bb
>
> diff --git a/meta/recipes-support/libcroco/libcroco/CVE-2020-12825.patch =
b/meta/recipes-support/libcroco/libcroco/CVE-2020-12825.patch
> new file mode 100644
> index 0000000..f6c6a55
> --- /dev/null
> +++ b/meta/recipes-support/libcroco/libcroco/CVE-2020-12825.patch
> @@ -0,0 +1,190 @@
> +From 203d62efefe6f79080863dda61593003b4c31f25 Mon Sep 17 00:00:00 2001
> +From: Michael Catanzaro <mcatanzaro@gnome.org>
> +Date: Thu, 13 Aug 2020 20:03:05 -0500
> +Subject: [PATCH] libcroco parser: limit recursion in block and any produ=
ctions
> +
> +If we don't have any limits, we can recurse forever and overflow the
> +stack.
> +
> +This is for CVE-2020-12825: Stack overflow in cr_parser_parse_any_core
> +in cr-parser.c.
> +
> +Bug: https://gitlab.gnome.org/Archive/libcroco/-/issues/8
> +Patch from https://gitlab.gnome.org/Archive/libcroco/-/merge_requests/5
> +
> +CVE: CVE-2020-12825
> +Upstream Status: Backport [https://gitlab.com/inkscape/inkscape/-/commit=
/203d62efefe6f79080863dda61593003b4c31f25.patch]
> +---
> + src/cr-parser.c | 44 ++++++++++++++++++++-----------
> + 1 file changed, 29 insertions(+), 15 deletions(-)
> +
> +diff --git a/src/cr-parser.c b/src/cr-parser.c
> +index d85e71f0fc..cd7b6ebd4a 100644
> +--- a/src/cr-parser.c
> ++++ b/src/cr-parser.c
> +@@ -136,6 +136,8 @@ struct _CRParserPriv {
> +
> + #define CHARS_TAB_SIZE 12
> +
> ++#define RECURSIVE_CALLERS_LIMIT 100
> ++
> + /**
> +  * IS_NUM:
> +  *@a_char: the char to test.
> +@@ -343,9 +345,11 @@ static enum CRStatus cr_parser_parse_selector_core =
(CRParser * a_this);
> +
> + static enum CRStatus cr_parser_parse_declaration_core (CRParser * a_thi=
s);
> +
> +-static enum CRStatus cr_parser_parse_any_core (CRParser * a_this);
> ++static enum CRStatus cr_parser_parse_any_core (CRParser * a_this,
> ++                                               guint      n_calls);
> +
> +-static enum CRStatus cr_parser_parse_block_core (CRParser * a_this);
> ++static enum CRStatus cr_parser_parse_block_core (CRParser * a_this,
> ++                                                 guint      n_calls);
> +
> + static enum CRStatus cr_parser_parse_value_core (CRParser * a_this);
> +
> +@@ -783,7 +787,7 @@ cr_parser_parse_atrule_core (CRParser * a_this)
> +         cr_parser_try_to_skip_spaces_and_comments (a_this);
> +
> +         do {
> +-                status =3D cr_parser_parse_any_core (a_this);
> ++                status =3D cr_parser_parse_any_core (a_this, 0);
> +         } while (status =3D=3D CR_OK);
> +
> +         status =3D cr_tknzr_get_next_token (PRIVATE (a_this)->tknzr,
> +@@ -794,7 +798,7 @@ cr_parser_parse_atrule_core (CRParser * a_this)
> +                 cr_tknzr_unget_token (PRIVATE (a_this)->tknzr,
> +                                       token);
> +                 token =3D NULL;
> +-                status =3D cr_parser_parse_block_core (a_this);
> ++                status =3D cr_parser_parse_block_core (a_this, 0);
> +                 CHECK_PARSING_STATUS (status,
> +                                       FALSE);
> +                 goto done;
> +@@ -929,11 +933,11 @@ cr_parser_parse_selector_core (CRParser * a_this)
> +
> +         RECORD_INITIAL_POS (a_this, &init_pos);
> +
> +-        status =3D cr_parser_parse_any_core (a_this);
> ++        status =3D cr_parser_parse_any_core (a_this, 0);
> +         CHECK_PARSING_STATUS (status, FALSE);
> +
> +         do {
> +-                status =3D cr_parser_parse_any_core (a_this);
> ++                status =3D cr_parser_parse_any_core (a_this, 0);
> +
> +         } while (status =3D=3D CR_OK);
> +
> +@@ -955,10 +959,12 @@ cr_parser_parse_selector_core (CRParser * a_this)
> +  *in chapter 4.1 of the css2 spec.
> +  *block ::=3D '{' S* [ any | block | ATKEYWORD S* | ';' ]* '}' S*;
> +  *@param a_this the current instance of #CRParser.
> ++ *@param n_calls used to limit recursion depth
> +  *FIXME: code this function.
> +  */
> + static enum CRStatus
> +-cr_parser_parse_block_core (CRParser * a_this)
> ++cr_parser_parse_block_core (CRParser * a_this,
> ++                            guint      n_calls)
> + {
> +         CRToken *token =3D NULL;
> +         CRInputPos init_pos;
> +@@ -966,6 +972,9 @@ cr_parser_parse_block_core (CRParser * a_this)
> +
> +         g_return_val_if_fail (a_this && PRIVATE (a_this), CR_BAD_PARAM_=
ERROR);
> +
> ++        if (n_calls > RECURSIVE_CALLERS_LIMIT)
> ++                return CR_ERROR;
> ++
> +         RECORD_INITIAL_POS (a_this, &init_pos);
> +
> +         status =3D cr_tknzr_get_next_token (PRIVATE (a_this)->tknzr, &t=
oken);
> +@@ -995,13 +1004,13 @@ cr_parser_parse_block_core (CRParser * a_this)
> +         } else if (token->type =3D=3D CBO_TK) {
> +                 cr_tknzr_unget_token (PRIVATE (a_this)->tknzr, token);
> +                 token =3D NULL;
> +-                status =3D cr_parser_parse_block_core (a_this);
> ++                status =3D cr_parser_parse_block_core (a_this, n_calls =
+ 1);
> +                 CHECK_PARSING_STATUS (status, FALSE);
> +                 goto parse_block_content;
> +         } else {
> +                 cr_tknzr_unget_token (PRIVATE (a_this)->tknzr, token);
> +                 token =3D NULL;
> +-                status =3D cr_parser_parse_any_core (a_this);
> ++                status =3D cr_parser_parse_any_core (a_this, n_calls + =
1);
> +                 CHECK_PARSING_STATUS (status, FALSE);
> +                 goto parse_block_content;
> +         }
> +@@ -1108,7 +1117,7 @@ cr_parser_parse_value_core (CRParser * a_this)
> +                 status =3D cr_tknzr_unget_token (PRIVATE (a_this)->tknz=
r,
> +                                                token);
> +                 token =3D NULL;
> +-                status =3D cr_parser_parse_block_core (a_this);
> ++                status =3D cr_parser_parse_block_core (a_this, 0);
> +                 CHECK_PARSING_STATUS (status, FALSE);
> +                 ref++;
> +                 goto continue_parsing;
> +@@ -1122,7 +1131,7 @@ cr_parser_parse_value_core (CRParser * a_this)
> +                 status =3D cr_tknzr_unget_token (PRIVATE (a_this)->tknz=
r,
> +                                                token);
> +                 token =3D NULL;
> +-                status =3D cr_parser_parse_any_core (a_this);
> ++                status =3D cr_parser_parse_any_core (a_this, 0);
> +                 if (status =3D=3D CR_OK) {
> +                         ref++;
> +                         goto continue_parsing;
> +@@ -1162,10 +1162,12 @@
> +  *        | FUNCTION | DASHMATCH | '(' any* ')' | '[' any* ']' ] S*;
> +  *
> +  *@param a_this the current instance of #CRParser.
> ++ *@param n_calls used to limit recursion depth
> +  *@return CR_OK upon successfull completion, an error code otherwise.
> +  */
> + static enum CRStatus
> +-cr_parser_parse_any_core (CRParser * a_this)
> ++cr_parser_parse_any_core (CRParser * a_this,
> ++                          guint      n_calls)
> + {
> +         CRToken *token1 =3D NULL,
> +                 *token2 =3D NULL;
> +@@ -1173,6 +1184,9 @@ cr_parser_parse_any_core (CRParser * a_this)
> +
> +         g_return_val_if_fail (a_this, CR_BAD_PARAM_ERROR);
> +
> ++        if (n_calls > RECURSIVE_CALLERS_LIMIT)
> ++                return CR_ERROR;
> ++
> +         RECORD_INITIAL_POS (a_this, &init_pos);
> +
> +         status =3D cr_tknzr_get_next_token (PRIVATE (a_this)->tknzr, &t=
oken1);
> +@@ -1211,7 +1225,7 @@ cr_parser_parse_any_core (CRParser * a_this)
> +                  *We consider parameter as being an "any*" production.
> +                  */
> +                 do {
> +-                        status =3D cr_parser_parse_any_core (a_this);
> ++                        status =3D cr_parser_parse_any_core (a_this, n_=
calls + 1);
> +                 } while (status =3D=3D CR_OK);
> +
> +                 ENSURE_PARSING_COND (status =3D=3D CR_PARSING_ERROR);
> +@@ -1236,7 +1250,7 @@ cr_parser_parse_any_core (CRParser * a_this)
> +                 }
> +
> +                 do {
> +-                        status =3D cr_parser_parse_any_core (a_this);
> ++                        status =3D cr_parser_parse_any_core (a_this, n_=
calls + 1);
> +                 } while (status =3D=3D CR_OK);
> +
> +                 ENSURE_PARSING_COND (status =3D=3D CR_PARSING_ERROR);
> +@@ -1264,7 +1278,7 @@ cr_parser_parse_any_core (CRParser * a_this)
> +                 }
> +
> +                 do {
> +-                        status =3D cr_parser_parse_any_core (a_this);
> ++                        status =3D cr_parser_parse_any_core (a_this, n_=
calls + 1);
> +                 } while (status =3D=3D CR_OK);
> +
> +                 ENSURE_PARSING_COND (status =3D=3D CR_PARSING_ERROR);
> +--
> +GitLab
> diff --git a/meta/recipes-support/libcroco/libcroco_0.6.13.bb b/meta/reci=
pes-support/libcroco/libcroco_0.6.13.bb
> new file mode 100644
> index 0000000..fd5927e
> --- /dev/null
> +++ b/meta/recipes-support/libcroco/libcroco_0.6.13.bb
> @@ -0,0 +1,22 @@
> +SUMMARY =3D "Cascading Style Sheet (CSS) parsing and manipulation toolki=
t"
> +HOMEPAGE =3D "http://www.gnome.org/"
> +BUGTRACKER =3D "https://bugzilla.gnome.org/"
> +
> +LICENSE =3D "LGPLv2 & LGPLv2.1"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D55ca817ccb7d5b5b66355690e9abc=
605 \
> +                    file://src/cr-rgb.c;endline=3D22;md5=3D31d5f0944d556=
c8589d04ea6055fcc66 \
> +                    file://tests/cr-test-utils.c;endline=3D21;md5=3D2382=
c27934cae1d3792fcb17a6142c4e"
> +
> +SECTION =3D "x11/utils"
> +DEPENDS =3D "glib-2.0 libxml2 zlib"
> +BBCLASSEXTEND =3D "native nativesdk"
> +EXTRA_OECONF +=3D "--enable-Bsymbolic=3Dauto"
> +
> +BINCONFIG =3D "${bindir}/croco-0.6-config"
> +
> +inherit gnomebase gtk-doc binconfig-disabled
> +
> +SRC_URI +=3D "file://CVE-2020-12825.patch"
> +
> +SRC_URI[archive.md5sum] =3D "c80c5a8385011a0260dce6bd0da93dce"
> +SRC_URI[archive.sha256sum] =3D "767ec234ae7aa684695b3a735548224888132e06=
3f92db585759b422570621d4"
> --
> 2.7.4
>
> This message contains information that may be privileged or confidential =
and is the property of the KPIT Technologies Ltd. It is intended only for t=
he person to whom it is addressed. If you are not the intended recipient, y=
ou are not authorized to read, print, retain copy, disseminate, distribute,=
 or use this message or any part thereof. If you receive this message in er=
ror, please notify the sender immediately and delete all copies of this mes=
sage. KPIT Technologies Ltd. does not accept any liability for virus infect=
ed mails.
