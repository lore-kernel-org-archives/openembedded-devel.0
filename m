Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5214C433EF
	for <webhook@archiver.kernel.org>; Tue,  1 Mar 2022 15:24:16 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web11.9452.1646148255620541047
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Mar 2022 07:24:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=dsmTKnFF;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: ticotimo@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id p15so32194511ejc.7
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Mar 2022 07:24:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ooMvEPPLfOr7G5zOOfey9VXtDfAAoO/K6mwdKy3tSkA=;
        b=dsmTKnFFD7QGKVZZJqGIEgkUrYnnz12jKoj3UrkLwfInSRfrWVOBVePxfd0KT46jSQ
         a/c8n0Cct12cuA0kARnNPqsVGJqa65FQDzO89DbIJcTrSQOwQLCMcchwP90qIVydVhBn
         VQZeCsIcYubTeOAPElyk6jffePj/JW2EtzreMGq8ueg/XpoggtBjqYYucl8yIWTkBb8W
         AXiPn7xDMwDskQKCM/2jUYBfFiOjYuUUNUgf7qFZagwmOL1impRuMlsfF5WHwqusublY
         b3TkQuZhk8YE5u1dG49K71Ip1wo1Wz06zy3Aisms8I+Sxt7MGjyRdg17iE8OEOjHyZew
         Y3oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ooMvEPPLfOr7G5zOOfey9VXtDfAAoO/K6mwdKy3tSkA=;
        b=y51um88bbvSwXHGp3gkEHQ73A/QnvZybTz+H51nQSijkkaltsdSZBooBKw1E4zyShH
         oXbo4gJJn2X/Dhe5lZsr4dtXYIcnlWJN2JEWeY2TiaiR6G5kZ2i3kPQUezTUvguYtUUr
         ACVohs1V3+YqIEcsaCtxd/5LSKVaDxix+jaOZ3maQmaOszswhJSRkl03d5gvvNg4QZcT
         WelHU2XjtsQq+UqTXBNwUuy3IU1kcvUTpiMOyt6K6x5a1mBSVYW4s9n2SIKzqG5ZTNmr
         mJ5u6mzq5ztteEsawtrwnHaQgIzEY3mtKukHyMnwiv7IWrfTnj1tchhHLW+dXTQ2D53w
         SH6w==
X-Gm-Message-State: AOAM532sZTHfNi9QNoCYQ2YhIUf2C+ReSJBJ+AcVznZ0nLIYxUqB+Ce7
	eF2AtR0m1fZvHU2IAFNcWwfL7ilU7hFgjDHGYJwIZmEs
X-Google-Smtp-Source: 
 ABdhPJwJ/8t0N94t+fTs3Kyl4Ea56o0NCnahZN3d/cJm8lx1slbNQtMJCYlb7UGiuVnjPzslNTOlEjQJvNqnWq9PBk4=
X-Received: by 2002:a17:906:3e4b:b0:6cf:7f02:9332 with SMTP id
 t11-20020a1709063e4b00b006cf7f029332mr19326919eji.404.1646148254004; Tue, 01
 Mar 2022 07:24:14 -0800 (PST)
MIME-Version: 1.0
References: <20220228215547.17414-1-jsbronder@cold-front.org>
 <CAMKF1soSRc1dFegS7Me0xcjJU3NfO2BCH-=o-wawjBHSnb4dqA@mail.gmail.com>
 <38d51c4e-880c-38b8-e6f1-618e6f4b49fb@windriver.com>
 <CAMKF1spH-xA=hL5EE2SDc1jEsEgDyz8KUQ_qm70NMtbc29Ucjw@mail.gmail.com>
In-Reply-To: 
 <CAMKF1spH-xA=hL5EE2SDc1jEsEgDyz8KUQ_qm70NMtbc29Ucjw@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Tue, 1 Mar 2022 07:24:02 -0800
Message-ID: 
 <CANx9H-CoKdRH1EbX4+KnnJV2RAvmA05UJDvtfg+v32RNa+kBCw@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] python3-termcolor: drop recipe
To: Khem Raj <raj.khem@gmail.com>
Cc: hongxu <hongxu.jia@windriver.com>,
 Justin Bronder <jsbronder@cold-front.org>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000ed7ae105d929c145"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Mar 2022 15:24:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95635

--000000000000ed7ae105d929c145
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 1, 2022 at 6:46 AM Khem Raj <raj.khem@gmail.com> wrote:

>
>
> On Tue, Mar 1, 2022 at 1:53 AM hongxu <hongxu.jia@windriver.com> wrote:
>
>> On 3/1/22 06:34, Khem Raj wrote:
>> > [Please note: This e-mail is from an EXTERNAL e-mail address]
>> >
>> > Hongxu added this recipe in 2019, I would like to hear from him. Maybe
>> > he has future plans for this recipe.
>>
>> This recipe is required by tensorflow, but long time no maintain, I am
>> open to remove it in OE
>>
>> I will move the recipe to meta-tensorflow
>
>
> There is a fix for it to build with wheel so we don=E2=80=99t have need t=
o remove
> it and since it=E2=80=99s still needed by Other layers it makes sense to =
keep it
> here
>

I agree. We can keep it until a suitable replacement that is better
maintained can be used.


>
>>
>> //Hongxu
>>
>> > On Mon, Feb 28, 2022 at 1:55 PM Justin Bronder <
>> jsbronder@cold-front.org> wrote:
>> >> No releases since 2011, no upstream repository and does not build wit=
h
>> >> bdist_wheel.  If you depend upon this recipe, please work with upstre=
am
>> >> to update the package to PEP-517 packaging.
>> >>
>> >> Note that there are alternatives on PyPI and numerous forks on github=
,
>> >> but none appear to have become canonical.
>> >>
>> >> Signed-off-by: Justin Bronder <jsbronder@cold-front.org>
>> >> ---
>> >>   .../packagegroups/packagegroup-meta-python.bb        |  1 -
>> >>   .../python/python3-termcolor_1.1.0.bb                | 12
>> ------------
>> >>   2 files changed, 13 deletions(-)
>> >>   delete mode 100644 meta-python/recipes-devtools/python/
>> python3-termcolor_1.1.0.bb
>> >>
>> >> diff --git a/meta-python/recipes-core/packagegroups/
>> packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/
>> packagegroup-meta-python.bb
>> >> index 9626231bba..dbfa991ebe 100644
>> >> --- a/meta-python/recipes-core/packagegroups/
>> packagegroup-meta-python.bb
>> >> +++ b/meta-python/recipes-core/packagegroups/
>> packagegroup-meta-python.bb
>> >> @@ -421,7 +421,6 @@ RDEPENDS:packagegroup-meta-python3 =3D "\
>> >>       python3-sympy \
>> >>       python3-tabulate \
>> >>       python3-term \
>> >> -    python3-termcolor \
>> >>       python3-textparser \
>> >>       python3-texttable \
>> >>       python3-thrift \
>> >> diff --git a/meta-python/recipes-devtools/python/
>> python3-termcolor_1.1.0.bb b/meta-python/recipes-devtools/python/
>> python3-termcolor_1.1.0.bb
>> >> deleted file mode 100644
>> >> index 17df7f983d..0000000000
>> >> --- a/meta-python/recipes-devtools/python/python3-termcolor_1.1.0.bb
>> >> +++ /dev/null
>> >> @@ -1,12 +0,0 @@
>> >> -SUMMARY =3D "ANSII Color formatting for output in terminal"
>> >> -HOMEPAGE =3D "https://pypi.python.org/pypi/termcolor"
>> >> -SECTION =3D "devel/python"
>> >> -LICENSE =3D "MIT"
>> >> -LIC_FILES_CHKSUM =3D
>> "file://COPYING.txt;md5=3D809e8749b63567978acfbd81d9f6a27d"
>> >> -
>> >> -inherit pypi setuptools3
>> >> -
>> >> -SRC_URI[md5sum] =3D "043e89644f8909d462fbbfa511c768df"
>> >> -SRC_URI[sha256sum] =3D
>> "1d6d69ce66211143803fbc56652b41d73b4a400a2891d7bf7a1cdf4c02de613b"
>> >> -
>> >> -BBCLASSEXTEND =3D "native"
>> >> --
>> >> 2.35.1
>> >>
>> >>
>> >>
>> >>
>>
>>
>>
>>
>>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#95634):
> https://lists.openembedded.org/g/openembedded-devel/message/95634
> Mute This Topic: https://lists.openembedded.org/mt/89462395/924729
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> ticotimo@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000ed7ae105d929c145
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Mar 1, 2022 at 6:46 AM Khem R=
aj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div><br></d=
iv><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr=
">On Tue, Mar 1, 2022 at 1:53 AM hongxu &lt;<a href=3D"mailto:hongxu.jia@wi=
ndriver.com" target=3D"_blank">hongxu.jia@windriver.com</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">On 3/1/22 06:34, Khe=
m Raj wrote:<br>
&gt; [Please note: This e-mail is from an EXTERNAL e-mail address]<br>
&gt;<br>
&gt; Hongxu added this recipe in 2019, I would like to hear from him. Maybe=
<br>
&gt; he has future plans for this recipe.<br>
<br>
This recipe is required by tensorflow, but long time no maintain, I am <br>
open to remove it in OE<br>
<br>
I will move the recipe to meta-tensorflow</blockquote><div dir=3D"auto"><br=
></div><div dir=3D"auto">There is a fix for it to build with wheel so we do=
n=E2=80=99t have need to remove it and since it=E2=80=99s still needed by O=
ther layers it makes sense to keep it here=C2=A0</div></div></div></blockqu=
ote><div><br></div><div>I agree. We can keep it until a suitable replacemen=
t that is better maintained can be used.</div><div>=C2=A0</div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex"><div><div class=3D"gmail_quote"><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex" dir=3D"auto"><br>
<br>
//Hongxu<br>
<br>
&gt; On Mon, Feb 28, 2022 at 1:55 PM Justin Bronder &lt;<a href=3D"mailto:j=
sbronder@cold-front.org" target=3D"_blank">jsbronder@cold-front.org</a>&gt;=
 wrote:<br>
&gt;&gt; No releases since 2011, no upstream repository and does not build =
with<br>
&gt;&gt; bdist_wheel.=C2=A0 If you depend upon this recipe, please work wit=
h upstream<br>
&gt;&gt; to update the package to PEP-517 packaging.<br>
&gt;&gt;<br>
&gt;&gt; Note that there are alternatives on PyPI and numerous forks on git=
hub,<br>
&gt;&gt; but none appear to have become canonical.<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Justin Bronder &lt;<a href=3D"mailto:jsbronder@cold=
-front.org" target=3D"_blank">jsbronder@cold-front.org</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 =C2=A0.../packagegroups/<a href=3D"http://packagegroup-meta-=
python.bb" rel=3D"noreferrer" target=3D"_blank">packagegroup-meta-python.bb=
</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 -<br>
&gt;&gt;=C2=A0 =C2=A0.../python/<a href=3D"http://python3-termcolor_1.1.0.b=
b" rel=3D"noreferrer" target=3D"_blank">python3-termcolor_1.1.0.bb</a>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 12 ------------<br>
&gt;&gt;=C2=A0 =C2=A02 files changed, 13 deletions(-)<br>
&gt;&gt;=C2=A0 =C2=A0delete mode 100644 meta-python/recipes-devtools/python=
/<a href=3D"http://python3-termcolor_1.1.0.bb" rel=3D"noreferrer" target=3D=
"_blank">python3-termcolor_1.1.0.bb</a><br>
&gt;&gt;<br>
&gt;&gt; diff --git a/meta-python/recipes-core/packagegroups/<a href=3D"htt=
p://packagegroup-meta-python.bb" rel=3D"noreferrer" target=3D"_blank">packa=
gegroup-meta-python.bb</a> b/meta-python/recipes-core/packagegroups/<a href=
=3D"http://packagegroup-meta-python.bb" rel=3D"noreferrer" target=3D"_blank=
">packagegroup-meta-python.bb</a><br>
&gt;&gt; index 9626231bba..dbfa991ebe 100644<br>
&gt;&gt; --- a/meta-python/recipes-core/packagegroups/<a href=3D"http://pac=
kagegroup-meta-python.bb" rel=3D"noreferrer" target=3D"_blank">packagegroup=
-meta-python.bb</a><br>
&gt;&gt; +++ b/meta-python/recipes-core/packagegroups/<a href=3D"http://pac=
kagegroup-meta-python.bb" rel=3D"noreferrer" target=3D"_blank">packagegroup=
-meta-python.bb</a><br>
&gt;&gt; @@ -421,7 +421,6 @@ RDEPENDS:packagegroup-meta-python3 =3D &quot;\=
<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0python3-sympy \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0python3-tabulate \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0python3-term \<br>
&gt;&gt; -=C2=A0 =C2=A0 python3-termcolor \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0python3-textparser \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0python3-texttable \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0python3-thrift \<br>
&gt;&gt; diff --git a/meta-python/recipes-devtools/python/<a href=3D"http:/=
/python3-termcolor_1.1.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-t=
ermcolor_1.1.0.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http=
://python3-termcolor_1.1.0.bb" rel=3D"noreferrer" target=3D"_blank">python3=
-termcolor_1.1.0.bb</a><br>
&gt;&gt; deleted file mode 100644<br>
&gt;&gt; index 17df7f983d..0000000000<br>
&gt;&gt; --- a/meta-python/recipes-devtools/python/<a href=3D"http://python=
3-termcolor_1.1.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-termcolo=
r_1.1.0.bb</a><br>
&gt;&gt; +++ /dev/null<br>
&gt;&gt; @@ -1,12 +0,0 @@<br>
&gt;&gt; -SUMMARY =3D &quot;ANSII Color formatting for output in terminal&q=
uot;<br>
&gt;&gt; -HOMEPAGE =3D &quot;<a href=3D"https://pypi.python.org/pypi/termco=
lor" rel=3D"noreferrer" target=3D"_blank">https://pypi.python.org/pypi/term=
color</a>&quot;<br>
&gt;&gt; -SECTION =3D &quot;devel/python&quot;<br>
&gt;&gt; -LICENSE =3D &quot;MIT&quot;<br>
&gt;&gt; -LIC_FILES_CHKSUM =3D &quot;file://COPYING.txt;md5=3D809e8749b6356=
7978acfbd81d9f6a27d&quot;<br>
&gt;&gt; -<br>
&gt;&gt; -inherit pypi setuptools3<br>
&gt;&gt; -<br>
&gt;&gt; -SRC_URI[md5sum] =3D &quot;043e89644f8909d462fbbfa511c768df&quot;<=
br>
&gt;&gt; -SRC_URI[sha256sum] =3D &quot;1d6d69ce66211143803fbc56652b41d73b4a=
400a2891d7bf7a1cdf4c02de613b&quot;<br>
&gt;&gt; -<br>
&gt;&gt; -BBCLASSEXTEND =3D &quot;native&quot;<br>
&gt;&gt; --<br>
&gt;&gt; 2.35.1<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; <br>
&gt;&gt;<br>
<br>
<br>
<br>
<br>
</blockquote></div></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#95634): <a href=3D"https://lists.openembedded.org/g/ope=
nembedded-devel/message/95634" rel=3D"noreferrer" target=3D"_blank">https:/=
/lists.openembedded.org/g/openembedded-devel/message/95634</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/89462395/9247=
29" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt/=
89462395/924729</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:ticotimo@gmail.com" targ=
et=3D"_blank">ticotimo@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000ed7ae105d929c145--

