Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10328.1792770769167483756
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Oct 2026 08:52:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=jrYk7FeU;
 spf=pass (domain: gmail.com, ip: 209.85.128.181, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-8b10ac6ab7bso11026257b3.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 23 Oct 2026 08:52:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792770768; cv=none;
        d=google.com; s=arc-20260327;
        b=hRYqSfVvNjAdnSJnqk9bo1hoLs4TkIoEUgfx+C5tRAuWMYpoT2B3imvSdggdy9Dkhp
         WTtXe4EZ/IBShLG56UnsNKbIQBSS4rYM5/AXi/i4WRGNhsoSca7i90GzrvzbaSjunYd6
         qBM4qV55AxozbH0/+caUfMipR+cSuPnEc5tLcQXrG7XpVQP2iDEx1mfCHalCiZc57Dum
         mrDi5kTKzHrRGswdOnFwNebnRpGgnzKbCobi8jYkP0Ai42tRSc/1aP9cCyqaq2zayyuS
         YrIHPcgyskVP/46JxOKUL2PMgyeZfL87X3YpKGAbCHpOsnsUxxDWL0UHv3RRyQLLJ2b2
         i/ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=YaX6csyC/MlV16WaZNSLgTigMPOCotptawaxpH7eA2g=;
        fh=2nN/GzVxUjERD0LNgf9vNaPM58ZIkCHYlMJQEwcNq0M=;
        b=cN9nKvlpsDvxPvFbkRBVAiJqmgNemXkhlrxkYEvIchCDD2uCP1YULJ/OEgg6R/6426
         mFysLF038SbfV/QAM01sUlr4F5jnrdtvVnVfmz32XZIKJmOidKJc0MRIvL+U8TVHdZ/4
         IUGUoNbJDf44VorGWi1R67BplceVvjjPvhPahZ5xE96e2d0QqbIPeNf51DclGYjim6/6
         Ufr65sGZVIGApZgj4n7ui9xAY4rE8/c5ocxJWWY8GrdjwqT7t3iCtQ+csFBr/U4Rd/F2
         qsqTLfV4Y7ikBylNnHObCAny2DhjeC04JypfQToqwjEaNmPihFF3TRhJjgwCW9jw1Uc3
         Z23Q==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792770768; x=1793375568; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YaX6csyC/MlV16WaZNSLgTigMPOCotptawaxpH7eA2g=;
        b=jrYk7FeU03kMy8a9l7Ob45yraFcZ+asmPJQ4taO8O9foLI3nvgD+9wUpj0zVyOuNIx
         YIzyS1goWa6ZNXK1q4iDuX0g0Q3t4a+n9sktpV84gLWkOHJDUBfXUSTyxPR6HJCCIw3N
         gXTp/s06AjW67IILPnG+yHJ4tvfyL8BH7I4u7nRfV3aeTSvnMyZMfargGW1B/z8biOsb
         MgM0znHlk3wTnszQv1GdALbqK6Yi+6Ge/LIiUAHBBvgRihKWRmBO7dgn/KhMJSzAJGum
         QlW/c05D6bAKIhdBNmI/rZFrKwcZYQUN7ldSVMIVdJs6DE71kdHbR/zlhqxtdmGq19NA
         qndw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792770768; x=1793375568;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=YaX6csyC/MlV16WaZNSLgTigMPOCotptawaxpH7eA2g=;
        b=oJElcTeJsWvt59HxF06EGSziqqRDk9wIUEqsuqpBZRk7yrJSZYD/e+IuzTjPH5IriO
         V7TxaLcBAZfVmxw+tuJg2ojBuoO3f7C5wWXoW5P538V/s0ZFxsfgvBL3jp/FYP9bRZE5
         koCQlygagFvfHd8z278ERlvGn8NNfweKksr3Ps18/d408buLcy7WbCe60vgblAoFHfvk
         LSwvm20s/5OsHw5/tpqgLESQqiNJZAO/KLbaTpe4lYoVnHWVjytHgnWIUVtCxss8EjZR
         bpgHrK1KPc0shNCGKU6l/+OmIIMLcKwowS1ide0eLuFGKRlfzGM1AvmRWc7oSCFEw9S6
         aYow==
X-Gm-Message-State: AFq9FYKJljtmaIxmu5MJYCh1JXdBwtrjX6fAttZVNynlDWasb/+tIW50
	Gihx6PwmW/GhqAQnnpHsqbFl3WS88D13ueC9CRu4uQj/FRY+oaZGuvwJSDAdYmCCI5k0jJRStlZ
	OxEzIkpBwJddikVzqKc+MZRPNHAdvbyhesF4L
X-Gm-Gg: AYBFou2b2xMuQrRDWtLEWWtJko2jqH4/ykMadvbyHfhGoXoMbdXYj8amKSziBqEvV5z
	PC2jUvXnv9sxnT++jMSV4I4HIMNTQccMGhJmq/2sW22/KEbo6rGzL3h9MZOeotcsTjSR509KNUM
	IXO/C3An9x2CQn64l+VBWNIhc4smP0HFnv6659uPEN1UXaD999FY0IoJYTDOORTRz0nB/h0gs3H
	dKZqaizrXtBC6la9QyeBoK66i9s0vuGnxwdW1AR3QzMKcGuSBvLUsMf0u8cZPWW1/aeBqsvqeBg
	t8so0cvI5zReKl+GXJUxSaRmx7fT013x1RXMai4NGa9YvfWFnsUAc5bWRghTKeGrXmtQJHpoMz8
	YyCCSovqxAcHLVQP8Kcsl/3N4ejNVrYLj8+PDLOIbqIQq7W1vX1M0aY5G60pkOK4lJOX10bFJ4S
	2zNbpgg/572/baFQZJaDh6cUpO+LkS+/eAH7Zgecqc44Q/y2NQGUiCyInVa94iZZ5cK1iE40F0U
	AYgfGCJA6VslKDEEMTk7xP3lX04huKKxaKERD3Lw39Y38KI68pS+kZ8ce8U/v4do9NInhxUvJ03
	ninT6XBTYMyCShJ03G5c90e1jRHoYluyyMLdL/57/lVHMtZWGynVM0/T9INLLw/2V7EC/Z8WmNP
	2DI4aAFqaPpcXNw0MzAkd+w==
X-Received: by 2002:a05:690c:60c5:b0:8b0:d42c:54e9 with SMTP id
 00721157ae682-8b157dff970mr18822097b3.34.1792770768128; Fri, 23 Oct 2026
 08:52:48 -0700 (PDT)
MIME-Version: 1.0
References: <20261022091708.3453622-1-leon.anavi@konsulko.com> <20261022091708.3453622-2-leon.anavi@konsulko.com>
In-Reply-To: <20261022091708.3453622-2-leon.anavi@konsulko.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 23 Oct 2026 08:52:21 -0700
X-Gm-Features: AclHuK8CYeO1jNF3cnmrs8OTJbPZPiA_1CJEYDl-J3hjSOQ6GCm_PwvgOBZN3SI
Message-ID: <CAMKF1sr-2Du7jMEg4OyYOq1ej8aLPnPW0=9en7hFfSZQNic21Q@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH 2/2] python3-pikepdf: Upgrade
 10.13.0.post1 -> 10.17.0
To: leon.anavi@konsulko.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000cc509d065e83f803"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 23 Oct 2026 15:52:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131378

--000000000000cc509d065e83f803
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Leon

Seeing this error

WARNING: Nothing RPROVIDES 'nativesdk-python3-fonttools' (but
virtual:nativesdk:/home/ubuntu/yoe/sources/meta-openembedded/meta-python/re=
cipes-devtools/python/
python3-pikepdf_10.17.0.bb RDEPENDS on or otherwise requires it)

Please take a look into it.

On Thu, Oct 22, 2026 at 2:17=E2=80=AFAM Leon Anavi via lists.openembedded.o=
rg
<leon.anavi=3Dkonsulko.com@lists.openembedded.org> wrote:

> Upgrade to release 10.17.0:
>
> - Added {class}pikepdf.ObjectSet, which records the objects that a
>   walk of a PDF's object graph has already visited. Objects in a
>   PDF are shared and may refer back to their ancestors, so a search
>   that only limits its depth can take exponential time on quite
>   ordinary files. ObjectSet.add() reports whether an object is new,
>   and tells apart direct objects and objects of different Pdf,
>   which a set of objgen cannot. See {ref}walking-object-graphs.
> - Added {meth}pikepdf.Object.is_same_object_as, which tests whether
>   two references lead to the same object. Neither is, =3D=3D nor
>   comparing objgen answers this reliably.
> - Added {meth}pikepdf.Pdf.content_scopes and
>   {meth}pikepdf.Page.content_scopes, which iterate over every
>   content stream that pages can draw, each with the resource
>   dictionary it uses: the page itself, form XObjects, annotation
>   appearance streams, tiling patterns, Type 3 glyph procedures and
>   soft masks, however they are nested or shared. This is the way to
>   find every font, image or colour space a document uses. Each
>   {class}pikepdf.ContentScope is reported once for the document;
>   pages=3D selects pages and kinds=3D selects what is reported.
> - Added {meth}pikepdf.Page.get_resources, which returns the
>   resources of a page or form XObject for reading. Unlike
>   {attr}pikepdf.Page.resources, it finds resources inherited from
>   the page tree, does not create an empty dictionary when there are
>   none, and returns None instead of raising when /Resources is
>   malformed.
> - Fixed comparing two objects with =3D=3D taking exponential time when
>   the objects being compared share children, such as the same file
>   opened twice. Each pair of objects is now compared once.
> - Fixed {meth}pikepdf.Pdf.add_pages_from hanging on a page with an
>   action whose /Next actions are shared or form a loop.
> - Fixed {meth}pikepdf.Pdf.open_outline reading only the first item
>   at each level of an outline whose items are direct objects. Such
>   items are now made indirect when the outline is saved, as the PDF
>   specification requires.
> - Reading a stream that will not decode now raises
>   {exc}~pikepdf.exceptions.DataDecodingError with the reason,
>   whether the stream's data was read from a file or set from
>   memory. Previously a stream read from a file raised a
>   {exc}~pikepdf.exceptions.PdfError that said only "read_bytes
>   called on unfilterable stream", and the reason was available only
>   from {meth}pikepdf.Pdf.get_warnings. DataDecodingError is a
>   PdfError, so existing handlers are unaffected.
> - An exception raised by a JBIG2 decoder now reaches the caller of
>   {meth}pikepdf.PdfImage.as_pil_image,
>   {meth}pikepdf.PdfImage.extract_to and
>   {meth}pikepdf.PdfImage.read_bytes unchanged, with its own type,
>   message and traceback. Previously, for an image read from a file,
>   it was replaced by a generic DataDecodingError or PdfError.
> - Added {exc}~pikepdf.exceptions.QpdfRuntimeError, raised for
>   errors from qpdf that pikepdf has no more specific exception for.
>   These were previously raised as a bare RuntimeError, which except
>   pikepdf.PikepdfError did not catch. The new exception derives
>   from both {exc}~pikepdf.exceptions.PikepdfError and RuntimeError,
>   so handlers written for RuntimeError still work.
> - The empty name / is now supported. The PDF 1.7 and 2.0
>   specifications define a lone slash as a valid name made of zero
>   characters, but pikepdf.Name('/') raised ValueError, and
>   dictionaries refused / as a key. This broke
>   {meth}pikepdf.Pdf.add_pages_from on files with an empty-named
>   destination such as /Dests << / 3 0 R >>. Such names can now be
>   created, used as dictionary keys, and migrated during page
>   copying. bool(Name('/')) is False, like an empty
>   {class}pikepdf.String. Name(''), which lacks the leading slash,
>   is still rejected. PDF/A does not forbid empty names, and the
>   PDF/A validator accepts them.
> - AcroFormField.get_inheritable_field_value_as_name() now returns a
>   {class}pikepdf.Name, as documented, instead of a str. When the
>   value is missing or not a name, it returns the empty name
>   Name('/'), which is falsy, instead of ''. Comparisons such as =3D=3D
>   '/Tx' are unaffected.
> - Fixed an out-of-bounds read when opening a PDF from a Python file
>   object whose readinto() reports more bytes than were requested.
>   This now raises ValueError, as writing to such a stream already
>   did. Non-blocking streams, whose readinto() returns None, now
>   raise ValueError instead of hanging.
> - Fixed building from source on PyPy, which failed to compile since
>   v10.0. PyPy now reads Python file objects through readinto(),
>   like CPython, instead of copying the result of read().
> - {func}pikepdf.open reads directly from the file descriptor when
>   given a filename, instead of calling the seek() and readinto()
>   methods of a Python file object for every read. Opening and
>   reading a large file with many objects is about four to five
>   times faster, matching the speed of memory mapping
>   (access_mode=3DAccessMode.mmap). Streams passed to
>   {func}pikepdf.open, including plain file objects, are read
>   through their methods as before.
> - Documented {class}pikepdf.TokenFilter with worked examples that
>   shorten numbers and convert RGB colors to grayscale, and
>   explained when to use a token filter instead of
>   {func}pikepdf.parse_content_stream. The API reference no longer
>   says that the parser should not be used to edit content streams.
>   The TokenFilter.handle_token documentation now says correctly
>   that exceptions it raises propagate to the caller.
>
> Extend RDEPENDS with the missing runtime dependencies
> python3-fonttools and python3-jsonschema which are required
> to import pikepdf.pdfa.
>
> Install pdfa_differential.py to pass the tests from
> test_pdfa_differential.py. Fixes:
>
> E   ModuleNotFoundError: No module named 'pdfa_differential'
>
> This work was sponsored by GOVCERT.LU.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
> ---
>  .../python3-pikepdf/0001-pyproject.toml-Do-not-strip.patch  | 4 ++--
>  ...-pikepdf_10.13.0.post1.bb =3D> python3-pikepdf_10.17.0.bb} | 6 +++++-
>  2 files changed, 7 insertions(+), 3 deletions(-)
>  rename meta-python/recipes-devtools/python/{
> python3-pikepdf_10.13.0.post1.bb =3D> python3-pikepdf_10.17.0.bb} (90%)
>
> diff --git
> a/meta-python/recipes-devtools/python/python3-pikepdf/0001-pyproject.toml=
-Do-not-strip.patch
> b/meta-python/recipes-devtools/python/python3-pikepdf/0001-pyproject.toml=
-Do-not-strip.patch
> index 575c3abb7a..3650675069 100644
> ---
> a/meta-python/recipes-devtools/python/python3-pikepdf/0001-pyproject.toml=
-Do-not-strip.patch
> +++
> b/meta-python/recipes-devtools/python/python3-pikepdf/0001-pyproject.toml=
-Do-not-strip.patch
> @@ -1,4 +1,4 @@
> -From 1b326de10bee40f497386921072dd80e2d7ecbde Mon Sep 17 00:00:00 2001
> +From f54475de5f883ab6d021af78b1f33f34e6cd43eb Mon Sep 17 00:00:00 2001
>  From: Leon Anavi <leon.anavi@konsulko.com>
>  Date: Wed, 8 Jul 2026 11:45:11 +0000
>  Subject: [PATCH] pyproject.toml: Do not strip
> @@ -19,7 +19,7 @@ Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
>  diff --git a/pyproject.toml b/pyproject.toml
> -index 9e991c3..d7cee23 100644
> +index a2843de..950a3c2 100644
>  --- a/pyproject.toml
>  +++ b/pyproject.toml
>  @@ -7,7 +7,8 @@ build-backend =3D "scikit_build_core.build"
> diff --git a/meta-python/recipes-devtools/python/
> python3-pikepdf_10.13.0.post1.bb b/meta-python/recipes-devtools/python/
> python3-pikepdf_10.17.0.bb
> similarity index 90%
> rename from meta-python/recipes-devtools/python/
> python3-pikepdf_10.13.0.post1.bb
> rename to meta-python/recipes-devtools/python/python3-pikepdf_10.17.0.bb
> index df98507aae..3801c4826c 100644
> --- a/meta-python/recipes-devtools/python/python3-pikepdf_10.13.0.post1.b=
b
> +++ b/meta-python/recipes-devtools/python/python3-pikepdf_10.17.0.bb
> @@ -4,7 +4,7 @@ HOMEPAGE =3D "https://github.com/pikepdf/pikepdf"
>  LICENSE =3D "MPL-2.0"
>  LIC_FILES_CHKSUM =3D
> "file://LICENSE.txt;md5=3D9741c346eef56131163e13b9db1241b3"
>
> -SRC_URI[sha256sum] =3D
> "4b73f926ebae81f04bf14527af330bd00bb268be767e0f189f7c4c3e4ad7ae0a"
> +SRC_URI[sha256sum] =3D
> "de4ccaae83628e86c1fd473b384c09c6ff1dd35a583a8dacbf61d2aa4bea843b"
>
>  SRC_URI +=3D "file://0001-pyproject.toml-Do-not-strip.patch"
>
> @@ -30,6 +30,8 @@ RDEPENDS:${PN} +=3D " \
>      qpdf \
>      python3-pillow \
>      python3-lxml \
> +    python3-jsonschema \
> +    python3-fonttools \
>  "
>
>  RDEPENDS:${PN}-ptest +=3D " \
> @@ -58,6 +60,8 @@ do_install_ptest:append() {
>      install -m 0644 ${S}/third-party-licenses/openssl.txt
> ${D}${PTEST_PATH}/third-party-licenses/
>      install -m 0644 ${S}/third-party-licenses/qpdf.txt
> ${D}${PTEST_PATH}/third-party-licenses/
>      install -m 0644 ${S}/third-party-licenses/zlib.txt
> ${D}${PTEST_PATH}/third-party-licenses/
> +    install -d ${D}${PTEST_PATH}/misc
> +    install -m 0644 ${S}/misc/pdfa_differential.py ${D}${PTEST_PATH}/mis=
c/
>  }
>
>  BBCLASSEXTEND =3D "native nativesdk"
> --
> 2.47.3
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#131310):
> https://lists.openembedded.org/g/openembedded-devel/message/131310
> Mute This Topic: https://lists.openembedded.org/mt/121881024/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000cc509d065e83f803
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Leon<div><br></div><div>Seeing this error</div><div><br></=
div><div>WARNING: Nothing RPROVIDES &#39;nativesdk-python3-fonttools&#39; (=
but virtual:nativesdk:/home/ubuntu/yoe/sources/meta-openembedded/meta-pytho=
n/recipes-devtools/python/<a href=3D"http://python3-pikepdf_10.17.0.bb">pyt=
hon3-pikepdf_10.17.0.bb</a> RDEPENDS on or otherwise requires it)</div><div=
><br></div><div>Please take a look into it.</div></div><br><div class=3D"gm=
ail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On T=
hu, Oct 22, 2026 at 2:17=E2=80=AFAM Leon Anavi via <a href=3D"http://lists.=
openembedded.org">lists.openembedded.org</a> &lt;leon.anavi=3D<a href=3D"ma=
ilto:konsulko.com@lists.openembedded.org">konsulko.com@lists.openembedded.o=
rg</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">Upgrade to release 10.17.0:<br>
<br>
- Added {class}pikepdf.ObjectSet, which records the objects that a<br>
=C2=A0 walk of a PDF&#39;s object graph has already visited. Objects in a<b=
r>
=C2=A0 PDF are shared and may refer back to their ancestors, so a search<br=
>
=C2=A0 that only limits its depth can take exponential time on quite<br>
=C2=A0 ordinary files. ObjectSet.add() reports whether an object is new,<br=
>
=C2=A0 and tells apart direct objects and objects of different Pdf,<br>
=C2=A0 which a set of objgen cannot. See {ref}walking-object-graphs.<br>
- Added {meth}pikepdf.Object.is_same_object_as, which tests whether<br>
=C2=A0 two references lead to the same object. Neither is, =3D=3D nor<br>
=C2=A0 comparing objgen answers this reliably.<br>
- Added {meth}pikepdf.Pdf.content_scopes and<br>
=C2=A0 {meth}pikepdf.Page.content_scopes, which iterate over every<br>
=C2=A0 content stream that pages can draw, each with the resource<br>
=C2=A0 dictionary it uses: the page itself, form XObjects, annotation<br>
=C2=A0 appearance streams, tiling patterns, Type 3 glyph procedures and<br>
=C2=A0 soft masks, however they are nested or shared. This is the way to<br=
>
=C2=A0 find every font, image or colour space a document uses. Each<br>
=C2=A0 {class}pikepdf.ContentScope is reported once for the document;<br>
=C2=A0 pages=3D selects pages and kinds=3D selects what is reported.<br>
- Added {meth}pikepdf.Page.get_resources, which returns the<br>
=C2=A0 resources of a page or form XObject for reading. Unlike<br>
=C2=A0 {attr}pikepdf.Page.resources, it finds resources inherited from<br>
=C2=A0 the page tree, does not create an empty dictionary when there are<br=
>
=C2=A0 none, and returns None instead of raising when /Resources is<br>
=C2=A0 malformed.<br>
- Fixed comparing two objects with =3D=3D taking exponential time when<br>
=C2=A0 the objects being compared share children, such as the same file<br>
=C2=A0 opened twice. Each pair of objects is now compared once.<br>
- Fixed {meth}pikepdf.Pdf.add_pages_from hanging on a page with an<br>
=C2=A0 action whose /Next actions are shared or form a loop.<br>
- Fixed {meth}pikepdf.Pdf.open_outline reading only the first item<br>
=C2=A0 at each level of an outline whose items are direct objects. Such<br>
=C2=A0 items are now made indirect when the outline is saved, as the PDF<br=
>
=C2=A0 specification requires.<br>
- Reading a stream that will not decode now raises<br>
=C2=A0 {exc}~pikepdf.exceptions.DataDecodingError with the reason,<br>
=C2=A0 whether the stream&#39;s data was read from a file or set from<br>
=C2=A0 memory. Previously a stream read from a file raised a<br>
=C2=A0 {exc}~pikepdf.exceptions.PdfError that said only &quot;read_bytes<br=
>
=C2=A0 called on unfilterable stream&quot;, and the reason was available on=
ly<br>
=C2=A0 from {meth}pikepdf.Pdf.get_warnings. DataDecodingError is a<br>
=C2=A0 PdfError, so existing handlers are unaffected.<br>
- An exception raised by a JBIG2 decoder now reaches the caller of<br>
=C2=A0 {meth}pikepdf.PdfImage.as_pil_image,<br>
=C2=A0 {meth}pikepdf.PdfImage.extract_to and<br>
=C2=A0 {meth}pikepdf.PdfImage.read_bytes unchanged, with its own type,<br>
=C2=A0 message and traceback. Previously, for an image read from a file,<br=
>
=C2=A0 it was replaced by a generic DataDecodingError or PdfError.<br>
- Added {exc}~pikepdf.exceptions.QpdfRuntimeError, raised for<br>
=C2=A0 errors from qpdf that pikepdf has no more specific exception for.<br=
>
=C2=A0 These were previously raised as a bare RuntimeError, which except<br=
>
=C2=A0 pikepdf.PikepdfError did not catch. The new exception derives<br>
=C2=A0 from both {exc}~pikepdf.exceptions.PikepdfError and RuntimeError,<br=
>
=C2=A0 so handlers written for RuntimeError still work.<br>
- The empty name / is now supported. The PDF 1.7 and 2.0<br>
=C2=A0 specifications define a lone slash as a valid name made of zero<br>
=C2=A0 characters, but pikepdf.Name(&#39;/&#39;) raised ValueError, and<br>
=C2=A0 dictionaries refused / as a key. This broke<br>
=C2=A0 {meth}pikepdf.Pdf.add_pages_from on files with an empty-named<br>
=C2=A0 destination such as /Dests &lt;&lt; / 3 0 R &gt;&gt;. Such names can=
 now be<br>
=C2=A0 created, used as dictionary keys, and migrated during page<br>
=C2=A0 copying. bool(Name(&#39;/&#39;)) is False, like an empty<br>
=C2=A0 {class}pikepdf.String. Name(&#39;&#39;), which lacks the leading sla=
sh,<br>
=C2=A0 is still rejected. PDF/A does not forbid empty names, and the<br>
=C2=A0 PDF/A validator accepts them.<br>
- AcroFormField.get_inheritable_field_value_as_name() now returns a<br>
=C2=A0 {class}pikepdf.Name, as documented, instead of a str. When the<br>
=C2=A0 value is missing or not a name, it returns the empty name<br>
=C2=A0 Name(&#39;/&#39;), which is falsy, instead of &#39;&#39;. Comparison=
s such as =3D=3D<br>
=C2=A0 &#39;/Tx&#39; are unaffected.<br>
- Fixed an out-of-bounds read when opening a PDF from a Python file<br>
=C2=A0 object whose readinto() reports more bytes than were requested.<br>
=C2=A0 This now raises ValueError, as writing to such a stream already<br>
=C2=A0 did. Non-blocking streams, whose readinto() returns None, now<br>
=C2=A0 raise ValueError instead of hanging.<br>
- Fixed building from source on PyPy, which failed to compile since<br>
=C2=A0 v10.0. PyPy now reads Python file objects through readinto(),<br>
=C2=A0 like CPython, instead of copying the result of read().<br>
- {func}pikepdf.open reads directly from the file descriptor when<br>
=C2=A0 given a filename, instead of calling the seek() and readinto()<br>
=C2=A0 methods of a Python file object for every read. Opening and<br>
=C2=A0 reading a large file with many objects is about four to five<br>
=C2=A0 times faster, matching the speed of memory mapping<br>
=C2=A0 (access_mode=3DAccessMode.mmap). Streams passed to<br>
=C2=A0 {func}pikepdf.open, including plain file objects, are read<br>
=C2=A0 through their methods as before.<br>
- Documented {class}pikepdf.TokenFilter with worked examples that<br>
=C2=A0 shorten numbers and convert RGB colors to grayscale, and<br>
=C2=A0 explained when to use a token filter instead of<br>
=C2=A0 {func}pikepdf.parse_content_stream. The API reference no longer<br>
=C2=A0 says that the parser should not be used to edit content streams.<br>
=C2=A0 The TokenFilter.handle_token documentation now says correctly<br>
=C2=A0 that exceptions it raises propagate to the caller.<br>
<br>
Extend RDEPENDS with the missing runtime dependencies<br>
python3-fonttools and python3-jsonschema which are required<br>
to import pikepdf.pdfa.<br>
<br>
Install pdfa_differential.py to pass the tests from<br>
test_pdfa_differential.py. Fixes:<br>
<br>
E=C2=A0 =C2=A0ModuleNotFoundError: No module named &#39;pdfa_differential&#=
39;<br>
<br>
This work was sponsored by <a href=3D"http://GOVCERT.LU" rel=3D"noreferrer"=
 target=3D"_blank">GOVCERT.LU</a>.<br>
<br>
Signed-off-by: Leon Anavi &lt;<a href=3D"mailto:leon.anavi@konsulko.com" ta=
rget=3D"_blank">leon.anavi@konsulko.com</a>&gt;<br>
---<br>
=C2=A0.../python3-pikepdf/0001-pyproject.toml-Do-not-strip.patch=C2=A0 | 4 =
++--<br>
=C2=A0...-<a href=3D"http://pikepdf_10.13.0.post1.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">pikepdf_10.13.0.post1.bb</a> =3D&gt; <a href=3D"http://pyth=
on3-pikepdf_10.17.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pikepd=
f_10.17.0.bb</a>} | 6 +++++-<br>
=C2=A02 files changed, 7 insertions(+), 3 deletions(-)<br>
=C2=A0rename meta-python/recipes-devtools/python/{<a href=3D"http://python3=
-pikepdf_10.13.0.post1.bb" rel=3D"noreferrer" target=3D"_blank">python3-pik=
epdf_10.13.0.post1.bb</a> =3D&gt; <a href=3D"http://python3-pikepdf_10.17.0=
.bb" rel=3D"noreferrer" target=3D"_blank">python3-pikepdf_10.17.0.bb</a>} (=
90%)<br>
<br>
diff --git a/meta-python/recipes-devtools/python/python3-pikepdf/0001-pypro=
ject.toml-Do-not-strip.patch b/meta-python/recipes-devtools/python/python3-=
pikepdf/0001-pyproject.toml-Do-not-strip.patch<br>
index 575c3abb7a..3650675069 100644<br>
--- a/meta-python/recipes-devtools/python/python3-pikepdf/0001-pyproject.to=
ml-Do-not-strip.patch<br>
+++ b/meta-python/recipes-devtools/python/python3-pikepdf/0001-pyproject.to=
ml-Do-not-strip.patch<br>
@@ -1,4 +1,4 @@<br>
-From 1b326de10bee40f497386921072dd80e2d7ecbde Mon Sep 17 00:00:00 2001<br>
+From f54475de5f883ab6d021af78b1f33f34e6cd43eb Mon Sep 17 00:00:00 2001<br>
=C2=A0From: Leon Anavi &lt;<a href=3D"mailto:leon.anavi@konsulko.com" targe=
t=3D"_blank">leon.anavi@konsulko.com</a>&gt;<br>
=C2=A0Date: Wed, 8 Jul 2026 11:45:11 +0000<br>
=C2=A0Subject: [PATCH] pyproject.toml: Do not strip<br>
@@ -19,7 +19,7 @@ Signed-off-by: Leon Anavi &lt;<a href=3D"mailto:leon.anav=
i@konsulko.com" target=3D"_blank">leon.anavi@konsulko.com</a>&gt;<br>
=C2=A0 1 file changed, 2 insertions(+), 1 deletion(-)<br>
<br>
=C2=A0diff --git a/pyproject.toml b/pyproject.toml<br>
-index 9e991c3..d7cee23 100644<br>
+index a2843de..950a3c2 100644<br>
=C2=A0--- a/pyproject.toml<br>
=C2=A0+++ b/pyproject.toml<br>
=C2=A0@@ -7,7 +7,8 @@ build-backend =3D &quot;scikit_build_core.build&quot;=
<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
pikepdf_10.13.0.post1.bb" rel=3D"noreferrer" target=3D"_blank">python3-pike=
pdf_10.13.0.post1.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"h=
ttp://python3-pikepdf_10.17.0.bb" rel=3D"noreferrer" target=3D"_blank">pyth=
on3-pikepdf_10.17.0.bb</a><br>
similarity index 90%<br>
rename from meta-python/recipes-devtools/python/<a href=3D"http://python3-p=
ikepdf_10.13.0.post1.bb" rel=3D"noreferrer" target=3D"_blank">python3-pikep=
df_10.13.0.post1.bb</a><br>
rename to meta-python/recipes-devtools/python/<a href=3D"http://python3-pik=
epdf_10.17.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pikepdf_10.17=
.0.bb</a><br>
index df98507aae..3801c4826c 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-pikepdf=
_10.13.0.post1.bb" rel=3D"noreferrer" target=3D"_blank">python3-pikepdf_10.=
13.0.post1.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-pikepdf=
_10.17.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pikepdf_10.17.0.b=
b</a><br>
@@ -4,7 +4,7 @@ HOMEPAGE =3D &quot;<a href=3D"https://github.com/pikepdf/pi=
kepdf" rel=3D"noreferrer" target=3D"_blank">https://github.com/pikepdf/pike=
pdf</a>&quot;<br>
=C2=A0LICENSE =3D &quot;MPL-2.0&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://LICENSE.txt;md5=3D9741c346eef561311=
63e13b9db1241b3&quot;<br>
<br>
-SRC_URI[sha256sum] =3D &quot;4b73f926ebae81f04bf14527af330bd00bb268be767e0=
f189f7c4c3e4ad7ae0a&quot;<br>
+SRC_URI[sha256sum] =3D &quot;de4ccaae83628e86c1fd473b384c09c6ff1dd35a583a8=
dacbf61d2aa4bea843b&quot;<br>
<br>
=C2=A0SRC_URI +=3D &quot;file://0001-pyproject.toml-Do-not-strip.patch&quot=
;<br>
<br>
@@ -30,6 +30,8 @@ RDEPENDS:${PN} +=3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0qpdf \<br>
=C2=A0 =C2=A0 =C2=A0python3-pillow \<br>
=C2=A0 =C2=A0 =C2=A0python3-lxml \<br>
+=C2=A0 =C2=A0 python3-jsonschema \<br>
+=C2=A0 =C2=A0 python3-fonttools \<br>
=C2=A0&quot;<br>
<br>
=C2=A0RDEPENDS:${PN}-ptest +=3D &quot; \<br>
@@ -58,6 +60,8 @@ do_install_ptest:append() {<br>
=C2=A0 =C2=A0 =C2=A0install -m 0644 ${S}/third-party-licenses/openssl.txt $=
{D}${PTEST_PATH}/third-party-licenses/<br>
=C2=A0 =C2=A0 =C2=A0install -m 0644 ${S}/third-party-licenses/qpdf.txt ${D}=
${PTEST_PATH}/third-party-licenses/<br>
=C2=A0 =C2=A0 =C2=A0install -m 0644 ${S}/third-party-licenses/zlib.txt ${D}=
${PTEST_PATH}/third-party-licenses/<br>
+=C2=A0 =C2=A0 install -d ${D}${PTEST_PATH}/misc<br>
+=C2=A0 =C2=A0 install -m 0644 ${S}/misc/pdfa_differential.py ${D}${PTEST_P=
ATH}/misc/<br>
=C2=A0}<br>
<br>
=C2=A0BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
-- <br>
2.47.3<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#131310): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/131310" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/131310</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/121881024/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/121881024/1997914</a><br>
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

--000000000000cc509d065e83f803--
