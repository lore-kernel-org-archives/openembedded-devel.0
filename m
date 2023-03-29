Return-Path: <yashinde145@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C12BEC6FD18
	for <webhook@archiver.kernel.org>; Wed, 29 Mar 2023 15:12:16 +0000 (UTC)
Subject: Re: [meta-oe][PATCH] librelp: fix function inline errors in debug build
To: openembedded-devel@lists.openembedded.org
From: "Yash Shinde" <yashinde145@gmail.com>
X-Originating-Location: Mumbai, Maharashtra, IN (103.51.138.249)
X-Originating-Platform: Windows Chrome 111
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 29 Mar 2023 08:12:12 -0700
References: <f6a4a396-84a6-9787-ad8a-d4e283a6442d@windriver.com>
In-Reply-To: <f6a4a396-84a6-9787-ad8a-d4e283a6442d@windriver.com>
Message-ID: <28476.1680102637231692864@lists.openembedded.org>
X-Old-Date: Wed, 29 Mar 2023 08:10:37 -0700
Content-Type: multipart/alternative; boundary="bLkbgkmRuErDNBgbA1GC"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Mar 2023 15:12:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101821
Message-ID: <20230329151212.nr6OxBTg4xTE03zv2X3UZEqXz8VcdCkkfnM4jNKeN0I@z>

--bLkbgkmRuErDNBgbA1GC
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

>=20
>=20
>=20
> Hi Yash,
>=20
>=20
>=20
>=20
>=20
>=20
>=20
> First, if we're going to take this approach, you should revert my
> work-around as part of this commit:
>=20
>=20
>=20
> commit ca10312c4c7e88d67f4b487ae9afcbfdf92898d6
> Author:=C2=A0=C2=A0=C2=A0=C2=A0 Randy MacLeod <Randy.MacLeod@...> ( Randy=
.MacLeod@... )
> Date: Wed Mar 1 19:24:27 2023
>=20
> librelp: make inline errors be warnings in debug build
> ...
>=20
>=20

Will send a v2 if needed.

>=20
>=20
>=20
> BUT...
>=20
>=20
>=20
> The problem isn't so much that the code doesn't get in-lined when doing a
> debug build but
> that it fails to compile.=C2=A0 I think this is a compiler regressions si=
nce
> I was not able to reproduce the error when compiling natively using
> Ubuntu-22.04 (gcc-11.3) but
> was able to reproduce it using Fedora-37, gcc --version : gcc (GCC) 12.2.=
1
> 20221121 (Red Hat 12.2.1-4)
>=20
>=20
>=20
>=20
>=20
>=20
>=20
> Does the change you made actually build with the two compiler versions
> above?
>=20
>=20

I tested the changes in LINCD sources which have GCC 12.2. I didn=E2=80=99t=
 check the above mentioned version.

>=20
>=20
>=20
>=20
> Is there documentation that states that
>=20
> static inline void
>=20
> is not as portable as:
>=20
> __attribute__((always_inline))
> static inline void
>=20
>=20
>=20
>=20
>=20
> I suspect there is not but I'm not a compiler geek!
>=20
>=20

As you mentioned in https://github.com/rsyslog/librelp/issues/256#issue-160=
5905115 ( https://github.com/rsyslog/librelp/issues/256#:~:text=3DOh%20and%=
20it%20only%20happens%20when%20using%20%2DOg%20not%20%2DO%5B0%2D3%5D ) , it=
 happens only when complied without any optimization and as per https://gcc=
.gnu.org/onlinedocs/gcc/Inline.html ( https://gcc.gnu.org/onlinedocs/gcc/In=
line.html#:~:text=3DGCC%20does%20not%20inline,const%20char)%20__attribute__=
((always_inline))%3B ) it=E2=80=99s mentioned that:

>=20
> GCC does not inline any functions when not optimizing unless you specify
> the =E2=80=98always_inline=E2=80=99 attribute for the function, like this=
:
> /* Prototype.=C2=A0 */ inline void foo (const char)
> __attribute__((always_inline));
>=20

Please let me know if we are on the same page.

>=20
>=20
>=20
> ../Randy
>=20
>=20

Regards,

Yash

--bLkbgkmRuErDNBgbA1GC
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<blockquote>
<p>Hi Yash,</p>
<p>&nbsp;</p>
<p>First, if we're going to take this approach, you should revert my work-a=
round as part of this commit:</p>
<p>commit ca10312c4c7e88d67f4b487ae9afcbfdf92898d6<br />Author:&nbsp;&nbsp;=
&nbsp;&nbsp; Randy MacLeod&nbsp;<a class=3D"moz-txt-link-rfc2396E" href=3D"=
mailto:Randy.MacLeod@..." target=3D"_blank" rel=3D"nofollow noopener">&lt;R=
andy.MacLeod@...&gt;</a><br />Date: Wed Mar 1 19:24:27 2023<br /><br />&nbs=
p;&nbsp;&nbsp; librelp: make inline errors be warnings in debug build<br />=
&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; ...</p>
</blockquote>
Will send a v2 if needed.<br />
<blockquote>
<p>BUT...</p>
<p>The problem isn't so much that the code doesn't get in-lined when doing =
a debug build but<br />that it fails to compile.&nbsp; I think this is a co=
mpiler regressions since<br />I was&nbsp;<em>not</em>&nbsp;able to reproduc=
e the error when compiling natively using Ubuntu-22.04 (gcc-11.3) but<br />=
<em>was</em>&nbsp;able to reproduce it using Fedora-37, gcc --version : gcc=
 (GCC) 12.2.1 20221121 (Red Hat 12.2.1-4)</p>
<p>&nbsp;</p>
<p>Does the change you made actually build with the two compiler versions a=
bove?</p>
</blockquote>
I tested the changes in LINCD sources which have GCC 12.2. I didn&rsquo;t c=
heck the above mentioned version.<br />
<blockquote>
<p><br />Is there documentation that states that</p>
<pre class=3D"moz-quote-pre">static inline void

is not as portable as:

__attribute__((always_inline)) static inline void</pre>
<p>&nbsp;</p>
<p>I suspect there is not but I'm not a compiler geek!</p>
</blockquote>
<div>As you mentioned in <a href=3D"https://github.com/rsyslog/librelp/issu=
es/256#:~:text=3DOh%20and%20it%20only%20happens%20when%20using%20%2DOg%20no=
t%20%2DO%5B0%2D3%5D" target=3D"_blank" rel=3D"noopener">https://github.com/=
rsyslog/librelp/issues/256#issue-1605905115</a>, it happens only when compl=
ied without any optimization and as per <a href=3D"https://gcc.gnu.org/onli=
nedocs/gcc/Inline.html#:~:text=3DGCC%20does%20not%20inline,const%20char)%20=
__attribute__((always_inline))%3B" target=3D"_blank" rel=3D"nofollow noopen=
er">https://gcc.gnu.org/onlinedocs/gcc/Inline.html</a> it&rsquo;s mentioned=
 that:</div>
<div>&nbsp;</div>
<blockquote>
<div>GCC does not inline any functions when not optimizing unless you speci=
fy the &lsquo;always_inline&rsquo; attribute for the function, like this:&n=
bsp;</div>
<div>/* Prototype.&nbsp; */ inline void foo (const char) __attribute__((alw=
ays_inline));&nbsp;</div>
</blockquote>
<div>Please let me know if we are on the same page.</div>
<blockquote>
<p>../Randy</p>
</blockquote>
<p>Regards,</p>
<p>Yash</p>

--bLkbgkmRuErDNBgbA1GC--

