Return-Path: <jpuhlman@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1C8BC48BD1
	for <webhook@archiver.kernel.org>; Mon, 11 Apr 2022 17:17:59 +0000 (UTC)
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com
 [209.85.160.52])
 by mx.groups.io with SMTP id smtpd.web09.2496.1649471496128319268
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 08 Apr 2022 19:31:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=aysC5bbx;
 spf=pass (domain: mvista.com, ip: 209.85.160.52,
 mailfrom: jpuhlman@mvista.com)
Received: by mail-oa1-f52.google.com with SMTP id
 586e51a60fabf-e2aaf7bb6fso168668fac.1
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 08 Apr 2022 19:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pgij+pOLgBxRZrfnp26uCnYWi3mjIG8xUg7DS2Dlreg=;
        b=aysC5bbx7BINEcC1614+8ShxOXnL7cMgab9BDqVMonYs+LWqzACAFfxgSm70iKM3S4
         MLUt5B9JegZu7A9/QBR7H77MAXkuryp7yXXKv0yaNcQzcrY9tqvSO7rB96bHOtdhJvhH
         f/6g2PBQdz4l6EA7bLbZVEbgvimYHgWKivUZg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pgij+pOLgBxRZrfnp26uCnYWi3mjIG8xUg7DS2Dlreg=;
        b=du6VW3yaxFx5nILSWM4X2NFrcCu/AdYrZ0JCOkyvvuPi3R3b4DI19I4fYmZv5vpcIg
         cUnf68X8ODdlk1Zpsjf9LZJNWNUE1Nki6J+FY3I7OfJFxT+n1ilUrUcokPl3vQaDHu1K
         4ax2psEQqrY/XDdZIXYG3X/zFIWLMaJBbuEJ2/87mxDGMjeD1dZl3VaVus1vqzybDJg4
         mbvRqcmhhcwkvi0wGXCcnjUnghVj38MzAmEczS+jtUxuavc9SRq2dpW+O1GOeSiNnClR
         vVlT7LFvoEXk12Ce1DbHzYlgJtU8LBgDZtay98PkwVu1wOygj/p+Tgc/hm+Z6/O1pguL
         swFQ==
X-Gm-Message-State: AOAM533SVFpD0/K7g+pxLRpvfou5SZm5tJtO/ZShmqAbkpmV3wxg7OQg
	OHMeI6JHALuaD7x8esO8s+az+FMwhMkGJ4ZRWmFIcg==
X-Google-Smtp-Source: 
 ABdhPJwOpR5zA/lG/2QPNWsO2i8Mun0klpwqkAtDvwXP6qQTiJxbBapFgq46sRwVdzT31i/JHzbgyP7ClF2ZBfWtdPM=
X-Received: by 2002:a05:6870:42c5:b0:db:ec20:9879 with SMTP id
 z5-20020a05687042c500b000dbec209879mr10016585oah.136.1649471495429; Fri, 08
 Apr 2022 19:31:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220408194242.1224639-1-jpuhlman@mvista.com>
 <65578df1-1e96-d136-7c1a-db73d6c18d37@gmail.com>
In-Reply-To: <65578df1-1e96-d136-7c1a-db73d6c18d37@gmail.com>
From: Jeremy Puhlman <jpuhlman@mvista.com>
Date: Fri, 8 Apr 2022 19:31:24 -0700
Message-ID: 
 <CADe5tdMt=8SPVxBOr4ZNvO_sNw=5byOPhRvt27Groc847yNPqA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] ndctl: Remove run test of typeof
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000008d746805dc2f824e"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 11 Apr 2022 17:17:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96490

--0000000000008d746805dc2f824e
Content-Type: text/plain; charset="UTF-8"

Yeah I saw that later in the day, it addresses the same issue.

On Fri, Apr 8, 2022, 12:54 PM Khem Raj <raj.khem@gmail.com> wrote:

> there is a patch in master-next
>
> https://lists.openembedded.org/g/openembedded-devel/message/96468
>
> does this solve your issue ?
>
> On 4/8/22 12:42 PM, Jeremy Puhlman wrote:
> > ../git/meson.build:213:0: ERROR: Can not run test applications in this
> cross environment.
> >
> > Signed-off-by: Jeremy A. Puhlman <jpuhlman@mvista.com>
> > ---
> >   ...sume-typeof-exists-in-our-modern-gcc.patch | 45 +++++++++++++++++++
> >   meta-oe/recipes-core/ndctl/ndctl_v73.bb       |  4 +-
> >   2 files changed, 48 insertions(+), 1 deletion(-)
> >   create mode 100644
> meta-oe/recipes-core/ndctl/ndctl/0001-Assume-typeof-exists-in-our-modern-gcc.patch
> >
> > diff --git
> a/meta-oe/recipes-core/ndctl/ndctl/0001-Assume-typeof-exists-in-our-modern-gcc.patch
> b/meta-oe/recipes-core/ndctl/ndctl/0001-Assume-typeof-exists-in-our-modern-gcc.patch
> > new file mode 100644
> > index 000000000..b47510a6b
> > --- /dev/null
> > +++
> b/meta-oe/recipes-core/ndctl/ndctl/0001-Assume-typeof-exists-in-our-modern-gcc.patch
> > @@ -0,0 +1,45 @@
> > +From 3abfe16bf2eb89efe3c823a935a6752c4a5b99d1 Mon Sep 17 00:00:00 2001
> > +From: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
> > +Date: Fri, 8 Apr 2022 19:31:02 +0000
> > +Subject: [PATCH] Assume typeof exists in our modern gcc
> > +
> > +cc.run tests are not useful in a cross environment.
> > +
> > +Upstream-Status: Inappropriate [Assumes modern compiler]
> > +Signed-off-by: Jeremy A. Puhlman <jpuhlman@mvista.com>
> > +---
> > + meson.build | 18 ++----------------
> > + 1 file changed, 2 insertions(+), 16 deletions(-)
> > +
> > +diff --git a/meson.build b/meson.build
> > +index 42e11aa..e8d218b 100644
> > +--- a/meson.build
> > ++++ b/meson.build
> > +@@ -210,22 +210,8 @@ conf.set('ENABLE_DESTRUCTIVE',
> get_option('destructive').enabled())
> > + conf.set('ENABLE_LOGGING', get_option('logging').enabled())
> > + conf.set('ENABLE_DEBUG', get_option('dbg').enabled())
> > +
> > +-typeof = cc.run('''
> > +-  int main() {
> > +-    struct {
> > +-      char a[16];
> > +-    } x;
> > +-    typeof(x) y;
> > +-
> > +-    return sizeof(x) == sizeof(y);
> > +-  }
> > +-  '''
> > +-)
> > +-
> > +-if typeof.compiled() and typeof.returncode() == 1
> > +-  conf.set('HAVE_TYPEOF', 1)
> > +-  conf.set('HAVE_STATEMENT_EXPR', 1)
> > +-endif
> > ++conf.set('HAVE_TYPEOF', 1)
> > ++conf.set('HAVE_STATEMENT_EXPR', 1)
> > +
> > + if target_machine.endian() == 'big'
> > +   conf.set('HAVE_BIG_ENDIAN', 1)
> > +--
> > +2.33.0
> > +
> > diff --git a/meta-oe/recipes-core/ndctl/ndctl_v73.bb
> b/meta-oe/recipes-core/ndctl/ndctl_v73.bb
> > index c88d39297..e2049ce2f 100644
> > --- a/meta-oe/recipes-core/ndctl/ndctl_v73.bb
> > +++ b/meta-oe/recipes-core/ndctl/ndctl_v73.bb
> > @@ -13,7 +13,9 @@ inherit meson pkgconfig bash-completion systemd
> >   SRCREV = "dd58d43458943d20ff063850670bf54a5242c9c5"
> >   SRC_URI = "git://github.com/pmem/ndctl.git;branch=main;protocol=https
> \
> >              file://0001-util-Correct-path-to-iniparser.h.patch \
> > -           file://0001-meson-Use-pkg-config-to-detect-iniparser.patch"
> > +           file://0001-meson-Use-pkg-config-to-detect-iniparser.patch \
> > +           file://0001-Assume-typeof-exists-in-our-modern-gcc.patch \
> > +"
> >
> >   UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>v\d+(\.\d+)*)"
> >
> >
> >
> >
> >
> >
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#96488):
> https://lists.openembedded.org/g/openembedded-devel/message/96488
> Mute This Topic: https://lists.openembedded.org/mt/90343683/2167262
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> jpuhlman@mvista.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--0000000000008d746805dc2f824e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Yeah I saw that later in the day, it addresses the same i=
ssue.</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_a=
ttr">On Fri, Apr 8, 2022, 12:54 PM Khem Raj &lt;<a href=3D"mailto:raj.khem@=
gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-=
left:1ex">there is a patch in master-next<br>
<br>
<a href=3D"https://lists.openembedded.org/g/openembedded-devel/message/9646=
8" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openembedd=
ed.org/g/openembedded-devel/message/96468</a><br>
<br>
does this solve your issue ?<br>
<br>
On 4/8/22 12:42 PM, Jeremy Puhlman wrote:<br>
&gt; ../git/meson.build:213:0: ERROR: Can not run test applications in this=
 cross environment.<br>
&gt; <br>
&gt; Signed-off-by: Jeremy A. Puhlman &lt;<a href=3D"mailto:jpuhlman@mvista=
.com" target=3D"_blank" rel=3D"noreferrer">jpuhlman@mvista.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0...sume-typeof-exists-in-our-modern-gcc.patch | 45 +++++++=
++++++++++++<br>
&gt;=C2=A0 =C2=A0meta-oe/recipes-core/ndctl/<a href=3D"http://ndctl_v73.bb"=
 rel=3D"noreferrer noreferrer" target=3D"_blank">ndctl_v73.bb</a>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 4 +-<br>
&gt;=C2=A0 =C2=A02 files changed, 48 insertions(+), 1 deletion(-)<br>
&gt;=C2=A0 =C2=A0create mode 100644 meta-oe/recipes-core/ndctl/ndctl/0001-A=
ssume-typeof-exists-in-our-modern-gcc.patch<br>
&gt; <br>
&gt; diff --git a/meta-oe/recipes-core/ndctl/ndctl/0001-Assume-typeof-exist=
s-in-our-modern-gcc.patch b/meta-oe/recipes-core/ndctl/ndctl/0001-Assume-ty=
peof-exists-in-our-modern-gcc.patch<br>
&gt; new file mode 100644<br>
&gt; index 000000000..b47510a6b<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-oe/recipes-core/ndctl/ndctl/0001-Assume-typeof-exists-in-ou=
r-modern-gcc.patch<br>
&gt; @@ -0,0 +1,45 @@<br>
&gt; +From 3abfe16bf2eb89efe3c823a935a6752c4a5b99d1 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: &quot;Jeremy A. Puhlman&quot; &lt;<a href=3D"mailto:jpuhlman@mv=
ista.com" target=3D"_blank" rel=3D"noreferrer">jpuhlman@mvista.com</a>&gt;<=
br>
&gt; +Date: Fri, 8 Apr 2022 19:31:02 +0000<br>
&gt; +Subject: [PATCH] Assume typeof exists in our modern gcc<br>
&gt; +<br>
&gt; +cc.run tests are not useful in a cross environment.<br>
&gt; +<br>
&gt; +Upstream-Status: Inappropriate [Assumes modern compiler]<br>
&gt; +Signed-off-by: Jeremy A. Puhlman &lt;<a href=3D"mailto:jpuhlman@mvist=
a.com" target=3D"_blank" rel=3D"noreferrer">jpuhlman@mvista.com</a>&gt;<br>
&gt; +---<br>
&gt; + meson.build | 18 ++----------------<br>
&gt; + 1 file changed, 2 insertions(+), 16 deletions(-)<br>
&gt; +<br>
&gt; +diff --git a/meson.build b/meson.build<br>
&gt; +index 42e11aa..e8d218b 100644<br>
&gt; +--- a/meson.build<br>
&gt; ++++ b/meson.build<br>
&gt; +@@ -210,22 +210,8 @@ conf.set(&#39;ENABLE_DESTRUCTIVE&#39;, get_optio=
n(&#39;destructive&#39;).enabled())<br>
&gt; + conf.set(&#39;ENABLE_LOGGING&#39;, get_option(&#39;logging&#39;).ena=
bled())<br>
&gt; + conf.set(&#39;ENABLE_DEBUG&#39;, get_option(&#39;dbg&#39;).enabled()=
)<br>
&gt; +<br>
&gt; +-typeof =3D cc.run(&#39;&#39;&#39;<br>
&gt; +-=C2=A0 int main() {<br>
&gt; +-=C2=A0 =C2=A0 struct {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 char a[16];<br>
&gt; +-=C2=A0 =C2=A0 } x;<br>
&gt; +-=C2=A0 =C2=A0 typeof(x) y;<br>
&gt; +-<br>
&gt; +-=C2=A0 =C2=A0 return sizeof(x) =3D=3D sizeof(y);<br>
&gt; +-=C2=A0 }<br>
&gt; +-=C2=A0 &#39;&#39;&#39;<br>
&gt; +-)<br>
&gt; +-<br>
&gt; +-if typeof.compiled() and typeof.returncode() =3D=3D 1<br>
&gt; +-=C2=A0 conf.set(&#39;HAVE_TYPEOF&#39;, 1)<br>
&gt; +-=C2=A0 conf.set(&#39;HAVE_STATEMENT_EXPR&#39;, 1)<br>
&gt; +-endif<br>
&gt; ++conf.set(&#39;HAVE_TYPEOF&#39;, 1)<br>
&gt; ++conf.set(&#39;HAVE_STATEMENT_EXPR&#39;, 1)<br>
&gt; +<br>
&gt; + if target_machine.endian() =3D=3D &#39;big&#39;<br>
&gt; +=C2=A0 =C2=A0conf.set(&#39;HAVE_BIG_ENDIAN&#39;, 1)<br>
&gt; +--<br>
&gt; +2.33.0<br>
&gt; +<br>
&gt; diff --git a/meta-oe/recipes-core/ndctl/<a href=3D"http://ndctl_v73.bb=
" rel=3D"noreferrer noreferrer" target=3D"_blank">ndctl_v73.bb</a> b/meta-o=
e/recipes-core/ndctl/<a href=3D"http://ndctl_v73.bb" rel=3D"noreferrer nore=
ferrer" target=3D"_blank">ndctl_v73.bb</a><br>
&gt; index c88d39297..e2049ce2f 100644<br>
&gt; --- a/meta-oe/recipes-core/ndctl/<a href=3D"http://ndctl_v73.bb" rel=
=3D"noreferrer noreferrer" target=3D"_blank">ndctl_v73.bb</a><br>
&gt; +++ b/meta-oe/recipes-core/ndctl/<a href=3D"http://ndctl_v73.bb" rel=
=3D"noreferrer noreferrer" target=3D"_blank">ndctl_v73.bb</a><br>
&gt; @@ -13,7 +13,9 @@ inherit meson pkgconfig bash-completion systemd<br>
&gt;=C2=A0 =C2=A0SRCREV =3D &quot;dd58d43458943d20ff063850670bf54a5242c9c5&=
quot;<br>
&gt;=C2=A0 =C2=A0SRC_URI =3D &quot;git://<a href=3D"http://github.com/pmem/=
ndctl.git;branch=3Dmain;protocol=3Dhttps" rel=3D"noreferrer noreferrer" tar=
get=3D"_blank">github.com/pmem/ndctl.git;branch=3Dmain;protocol=3Dhttps</a>=
 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-util-Corre=
ct-path-to-iniparser.h.patch \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-meson-Use-pkg-co=
nfig-to-detect-iniparser.patch&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-meson-Use-pkg-co=
nfig-to-detect-iniparser.patch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Assume-typeof-ex=
ists-in-our-modern-gcc.patch \<br>
&gt; +&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0UPSTREAM_CHECK_GITTAGREGEX =3D &quot;(?P&lt;pver&gt;v\d+(\=
.\d+)*)&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#96488): <a href=3D"https://lists.openembedded.org/g/ope=
nembedded-devel/message/96488" rel=3D"noreferrer noreferrer" target=3D"_bla=
nk">https://lists.openembedded.org/g/openembedded-devel/message/96488</a><b=
r>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/90343683/2167=
262" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openembe=
dded.org/mt/90343683/2167262</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank" rel=3D"noreferrer">openembedded-devel+owner@lists.=
openembedded.org</a><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.opene=
mbedded.org/g/openembedded-devel/unsub</a> [<a href=3D"mailto:jpuhlman@mvis=
ta.com" target=3D"_blank" rel=3D"noreferrer">jpuhlman@mvista.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--0000000000008d746805dc2f824e--

