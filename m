Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47706C83F22
	for <webhook@archiver.kernel.org>; Thu, 17 Jul 2025 14:38:59 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
 by mx.groups.io with SMTP id smtpd.web10.416.1752763134649761039
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Jul 2025 07:38:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=Z9kwUfqk;
 spf=pass (domain: konsulko.com, ip: 209.85.219.42, mailfrom: leon.anavi@konsulko.com)
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-6fd0a91ae98so5931706d6.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 17 Jul 2025 07:38:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1752763134; x=1753367934; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FvT7Loufea99Lgu4e27FiP2zXFal1koYWtOX8Ydd92Q=;
        b=Z9kwUfqksGIipMVDl5BH/RVZGzArv2pRiHnPXAARyzPYnh5uLIMplP0s/WlE8JPq67
         3XtYzguU1ulwUMt4m/mTFH5GXXk36f81ZIWgnntOI9SnH6boBlqwu7zlEljPZzZejEny
         a0rB1TNxoC2gT8g5vDf8SuBHJAvYwXvF5Xymc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752763134; x=1753367934;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FvT7Loufea99Lgu4e27FiP2zXFal1koYWtOX8Ydd92Q=;
        b=F0KoO/lvibJ+j9egglFB+1gasrugG69DyOcb6czgjmMtr93lwKsC/X3hcw95fFLKv+
         fBreiNxywr+2t8e8Y3h9MiuAjVPy2DPQowRywjihlRmtflOO82d1/6BRM6R/y2IpSokJ
         tKivuL10jUrNAOWT1SyA/GVqD150Hov25r7ZU/kKrM/ecgMZA8zkORDZbWhOT/PRlB5K
         u0ATak1OUmnvV1rCS8KvS1rEgk17K/rf/JkxetRlAF3dA3dm6dQEP4YnZcFCgbnWerIv
         Ht1fpxyX6Mlle1pNmc3q/pvc5FEOVOpKASxVD+O3xwLmE6vDUhdgHxwds3LX4fVoIynA
         7nkA==
X-Gm-Message-State: AOJu0YzP2ju8Spf956RrVO+3O5yvVQWcUWK5G7pExWsoqzDdsbWxUJs9
	5Ve1ucuWypmJw8mdaWiE95YSDp7eLWSaXF50H4gn4zuIK14uxq4CGRD+Ymol5evEgEJxXI5Uqm0
	mMmNrhkIUdHZyixtRYuH18jTmJLOfctzTuk/BdhymGQ==
X-Gm-Gg: ASbGncuIe9rIz03Z6/X+Rp1hOKLjv2LtDm5GBiH7U+F1MPRkSaahXnf0ijYhDWLohQ/
	CCgVP90sZC7nHr1jyw+OEYUjmgLoB0O+L+pMq49grShcXrBy4AeaIQU6FyA+Bo1r3mxoPEZC6Lc
	vDDIG1kf2aM3ZLrOoXT/Mc7DPNeO8r7VstiWTkeF9SBop/om3vHSHinzUZmQIIxIjOLc34JGV3H
	ZSVKW1iJXMGyig+
X-Google-Smtp-Source: AGHT+IFVqQqUI9xqwJKUABYeMs2JtLR98a6xbDQ/EaQCai41GSY8ZnPM/FU1bZtHh0TmhNH3MLzrNocgcJ7p/MrtfLY=
X-Received: by 2002:a05:6214:2e8a:b0:704:f94e:b5da with SMTP id
 6a1803df08f44-704f94eb9b7mr69178686d6.50.1752763133428; Thu, 17 Jul 2025
 07:38:53 -0700 (PDT)
MIME-Version: 1.0
References: <20250715095402.591088-1-leon.anavi@konsulko.com> <CAMKF1soE0N22PRCEV2Kw2Mt9PUwMWpYnqS9YM2j_g9YbdX0Lxg@mail.gmail.com>
In-Reply-To: <CAMKF1soE0N22PRCEV2Kw2Mt9PUwMWpYnqS9YM2j_g9YbdX0Lxg@mail.gmail.com>
From: Leon Anavi <leon.anavi@konsulko.com>
Date: Thu, 17 Jul 2025 17:38:41 +0300
X-Gm-Features: Ac12FXyZSuUqhLa2Z5h5s4w0gb7mFeriwAUuf8V9H-4nZy1vDjYgBHG-Nk7vToQ
Message-ID: <CALtQ3O3D6hQJ4ycjooxtOy+Nr0tgZn1cQiw45KSAAp5m7xot2Q@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH 1/2] python3-mypy: Upgrade 1.15.0 -> 1.17.0
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000f1a3fa063a20f740"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 17 Jul 2025 14:38:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118614

--000000000000f1a3fa063a20f740
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Khem,

Thank you for letting me know. In a separate commit I've applied a fix
for python3-charset-normalizer and submitted the v2 version. I have also
opened a GitHub pull request to fix this in the upstream of
charset_normalizer: https://github.com/jawah/charset_normalizer/pull/632

Best regards,
Leon

On Tue, Jul 15, 2025 at 10:01=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrot=
e:

> This regressed python3-charset-normalizer module
>
> https://errors.yoctoproject.org/Errors/Details/872281/
>
> On Tue, Jul 15, 2025 at 2:54=E2=80=AFAM Leon Anavi via lists.openembedded=
.org
> <leon.anavi=3Dkonsulko.com@lists.openembedded.org> wrote:
> >
> > Upgrade to release 1.17.0:
> >
> > - Mypy can now optionally generate an error if a match statement
> >   does not match exhaustively, without having to use
> >   assert_never(...). Enable this by using --enable-error-code
> >   exhaustive-match.
> > - Handle corner case: protocol/class variable/descriptor
> > - Fix a few inconsistencies in protocol/type object interactions
> > - Refactor/unify access to static attributes
> > - Remove inconsistencies in operator handling
> > - Make protocol subtyping more consistent
> > - Fix nondeterministic type checking by making join with explicit
> >   Protocol and type promotion commute
> > - Fix nondeterministic type checking caused by nonassociative of
> >   None joins
> > - Fix nondeterministic type checking caused by nonassociativity of
> >   joins
> > - Fix nondeterministic type checking by making join between type
> >   and TypeVar commute
> > - Mypy only supports Python 3.9+. The --force-uppercase-builtins
> >   flag is now deprecated as unnecessary, and a no-op. It will be
> >   removed in a future version.
> >
> > Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
> > ---
> >  .../python/{python3-mypy_1.15.0.bb =3D> python3-mypy_1.17.0.bb}  | 3 +=
+-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >  rename meta-python/recipes-devtools/python/{python3-mypy_1.15.0.bb =3D=
>
> python3-mypy_1.17.0.bb} (82%)
> >
> > diff --git a/meta-python/recipes-devtools/python/python3-mypy_1.15.0.bb
> b/meta-python/recipes-devtools/python/python3-mypy_1.17.0.bb
> > similarity index 82%
> > rename from meta-python/recipes-devtools/python/python3-mypy_1.15.0.bb
> > rename to meta-python/recipes-devtools/python/python3-mypy_1.17.0.bb
> > index ebcac51ea1..0d1e0bd16e 100644
> > --- a/meta-python/recipes-devtools/python/python3-mypy_1.15.0.bb
> > +++ b/meta-python/recipes-devtools/python/python3-mypy_1.17.0.bb
> > @@ -5,7 +5,7 @@ LIC_FILES_CHKSUM =3D
> "file://LICENSE;md5=3D8d62fd8f8648cb018e52857347e340b9"
> >
> >  inherit pypi python_setuptools_build_meta
> >
> > -SRC_URI[sha256sum] =3D
> "404534629d51d3efea5c800ee7c42b72a6554d6c400e6a79eafe15d11341fd43"
> > +SRC_URI[sha256sum] =3D
> "e5d7ccc08ba089c06e2f5629c660388ef1fee708444f1dee0b9203fa031dee03"
> >
> >  BBCLASSEXTEND =3D "native"
> >
> > @@ -14,6 +14,7 @@ DEPENDS +=3D " \
> >      python3-types-psutil-native \
> >      python3-types-setuptools-native \
> >      python3-typing-extensions-native \
> > +    python3-pathspec-native \
> >  "
> >
> >  RDEPENDS:${PN} +=3D " \
> > --
> > 2.39.5
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#118556):
> https://lists.openembedded.org/g/openembedded-devel/message/118556
> > Mute This Topic: https://lists.openembedded.org/mt/114163958/1997914
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[
> raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>


--=20
Leon Anavi
Software Engineer
Mob : +359 88 527 7901
konsulko.com

--000000000000f1a3fa063a20f740
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi=C2=A0Khem,<br><br>Thank you for letting me know. In a s=
eparate commit I&#39;ve applied a fix for=C2=A0python3-charset-normalizer a=
nd submitted the v2 version. I have also opened a GitHub pull request=C2=A0=
to fix this in the upstream of charset_normalizer:=C2=A0<a href=3D"https://=
github.com/jawah/charset_normalizer/pull/632">https://github.com/jawah/char=
set_normalizer/pull/632</a><br><br>Best regards,<br>Leon</div><br><div clas=
s=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_att=
r">On Tue, Jul 15, 2025 at 10:01=E2=80=AFPM Khem Raj &lt;<a href=3D"mailto:=
raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">This regressed python3-charset-normal=
izer module<br>
<br>
<a href=3D"https://errors.yoctoproject.org/Errors/Details/872281/" rel=3D"n=
oreferrer" target=3D"_blank">https://errors.yoctoproject.org/Errors/Details=
/872281/</a><br>
<br>
On Tue, Jul 15, 2025 at 2:54=E2=80=AFAM Leon Anavi via <a href=3D"http://li=
sts.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedd=
ed.org</a><br>
&lt;leon.anavi=3D<a href=3D"mailto:konsulko.com@lists.openembedded.org" tar=
get=3D"_blank">konsulko.com@lists.openembedded.org</a>&gt; wrote:<br>
&gt;<br>
&gt; Upgrade to release 1.17.0:<br>
&gt;<br>
&gt; - Mypy can now optionally generate an error if a match statement<br>
&gt;=C2=A0 =C2=A0does not match exhaustively, without having to use<br>
&gt;=C2=A0 =C2=A0assert_never(...). Enable this by using --enable-error-cod=
e<br>
&gt;=C2=A0 =C2=A0exhaustive-match.<br>
&gt; - Handle corner case: protocol/class variable/descriptor<br>
&gt; - Fix a few inconsistencies in protocol/type object interactions<br>
&gt; - Refactor/unify access to static attributes<br>
&gt; - Remove inconsistencies in operator handling<br>
&gt; - Make protocol subtyping more consistent<br>
&gt; - Fix nondeterministic type checking by making join with explicit<br>
&gt;=C2=A0 =C2=A0Protocol and type promotion commute<br>
&gt; - Fix nondeterministic type checking caused by nonassociative of<br>
&gt;=C2=A0 =C2=A0None joins<br>
&gt; - Fix nondeterministic type checking caused by nonassociativity of<br>
&gt;=C2=A0 =C2=A0joins<br>
&gt; - Fix nondeterministic type checking by making join between type<br>
&gt;=C2=A0 =C2=A0and TypeVar commute<br>
&gt; - Mypy only supports Python 3.9+. The --force-uppercase-builtins<br>
&gt;=C2=A0 =C2=A0flag is now deprecated as unnecessary, and a no-op. It wil=
l be<br>
&gt;=C2=A0 =C2=A0removed in a future version.<br>
&gt;<br>
&gt; Signed-off-by: Leon Anavi &lt;<a href=3D"mailto:leon.anavi@konsulko.co=
m" target=3D"_blank">leon.anavi@konsulko.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../python/{<a href=3D"http://python3-mypy_1.15.0.bb" rel=3D"nor=
eferrer" target=3D"_blank">python3-mypy_1.15.0.bb</a> =3D&gt; <a href=3D"ht=
tp://python3-mypy_1.17.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-m=
ypy_1.17.0.bb</a>}=C2=A0 | 3 ++-<br>
&gt;=C2=A0 1 file changed, 2 insertions(+), 1 deletion(-)<br>
&gt;=C2=A0 rename meta-python/recipes-devtools/python/{<a href=3D"http://py=
thon3-mypy_1.15.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-mypy_1.1=
5.0.bb</a> =3D&gt; <a href=3D"http://python3-mypy_1.17.0.bb" rel=3D"norefer=
rer" target=3D"_blank">python3-mypy_1.17.0.bb</a>} (82%)<br>
&gt;<br>
&gt; diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://pyt=
hon3-mypy_1.15.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-mypy_1.15=
.0.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://python3-m=
ypy_1.17.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-mypy_1.17.0.bb<=
/a><br>
&gt; similarity index 82%<br>
&gt; rename from meta-python/recipes-devtools/python/<a href=3D"http://pyth=
on3-mypy_1.15.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-mypy_1.15.=
0.bb</a><br>
&gt; rename to meta-python/recipes-devtools/python/<a href=3D"http://python=
3-mypy_1.17.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-mypy_1.17.0.=
bb</a><br>
&gt; index ebcac51ea1..0d1e0bd16e 100644<br>
&gt; --- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-my=
py_1.15.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-mypy_1.15.0.bb</=
a><br>
&gt; +++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-my=
py_1.17.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-mypy_1.17.0.bb</=
a><br>
&gt; @@ -5,7 +5,7 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D8d62fd=
8f8648cb018e52857347e340b9&quot;<br>
&gt;<br>
&gt;=C2=A0 inherit pypi python_setuptools_build_meta<br>
&gt;<br>
&gt; -SRC_URI[sha256sum] =3D &quot;404534629d51d3efea5c800ee7c42b72a6554d6c=
400e6a79eafe15d11341fd43&quot;<br>
&gt; +SRC_URI[sha256sum] =3D &quot;e5d7ccc08ba089c06e2f5629c660388ef1fee708=
444f1dee0b9203fa031dee03&quot;<br>
&gt;<br>
&gt;=C2=A0 BBCLASSEXTEND =3D &quot;native&quot;<br>
&gt;<br>
&gt; @@ -14,6 +14,7 @@ DEPENDS +=3D &quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 python3-types-psutil-native \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 python3-types-setuptools-native \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 python3-typing-extensions-native \<br>
&gt; +=C2=A0 =C2=A0 python3-pathspec-native \<br>
&gt;=C2=A0 &quot;<br>
&gt;<br>
&gt;=C2=A0 RDEPENDS:${PN} +=3D &quot; \<br>
&gt; --<br>
&gt; 2.39.5<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#118556): <a href=3D"https://lists.openembedded.org=
/g/openembedded-devel/message/118556" rel=3D"noreferrer" target=3D"_blank">=
https://lists.openembedded.org/g/openembedded-devel/message/118556</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/11416395=
8/1997914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.=
org/mt/114163958/1997914</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openem=
bedded.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.o=
rg</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
devel/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedde=
d.org/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com"=
 target=3D"_blank">raj.khem@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature"><div dir=3D"ltr"><div>Leon Anavi</div><div>Software Engineer</div=
><div>Mob : +359 88 527 7901</div><div><a href=3D"http://konsulko.com" targ=
et=3D"_blank">konsulko.com</a></div></div></div>

--000000000000f1a3fa063a20f740--

