Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12969.1793717220254311511
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Nov 2026 06:47:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=QfeEJ01k;
 spf=pass (domain: gmail.com, ip: 209.85.128.180, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-8b0a921ee46so37178187b3.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 03 Nov 2026 06:47:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793717219; cv=none;
        d=google.com; s=arc-20260327;
        b=o9es7eO84RbckNvJEswyP4H1rCn1xhgVcXb58/z7/dvezD2z5HFReksAzCPxYPCIe1
         mK/iw/az1mV25CnKUyTbfBhdyT5n8J18C2LvJwktb1I3am/66HcmZklt+yDEsfgRWhqP
         XdpYk+A96jEzZS0pX/NEKEJfzzyCMroBkQ99hxaKSiek/mVmTO5gzNkZotBxsAIsPQve
         3ISwwJmITjh4Db4xXAhECmf2V8nIGv7i0ihN5xM7RoKfmtMhngHe2NIpRyLkIVSglglL
         0d0O3d4UQbctYGnBQfKjNkTlyH4wMX/QhYca15IhriU2VG7GxLz0uBd0GuZA8+JXmtF1
         P6uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=v9Ow5G02Xqg2hVxr/uI/cOfPbnHOOQM02o3w/aqTuts=;
        fh=IJdHAHJGTGjXtfywiqHyE/fRWIn1m6IRgZklm0lQeXg=;
        b=Xrf6oB/51yFLOGlkjzE3HjsWEGWIeB3s9YloycaboIc65TCj0LqANiTBPdqrZLA4es
         QMuxkPdp00K9uDHQsVBPC52PApsq/tnF1gT4V8Eco0fQY3kp5OTF6LpdF7snhRitT+3L
         Lk3FlC5e7q4zsaqhh5EfFSZqHFH82Udko2R2gXwJIpogqUjEEfHe09wDsWLuS1ZR+iZ2
         o3/h1VHnUcErDG8WvZgwwqA9b73mLwsGaj9KJxhcDtQb84ym7wg3WaEhA7JFFSU3al8P
         V7PrK8Vp2mzDxXuDg4ZM2+RusIEGRngMCd0JbISsV6cDLMbPy8vl00+pTjeaIL4tEabE
         RkOA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793717219; x=1794322019; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v9Ow5G02Xqg2hVxr/uI/cOfPbnHOOQM02o3w/aqTuts=;
        b=QfeEJ01kzDjYVjOERy06N57dDhfAcqtYrJK2Ocg/5ZjsCfEcJqwTjW1GplMzuRoGRm
         xKL4rzJglrNk9HSsYw/mQ+M8CXWutjClKnhnfqsQqVwuwsNPZk59hLmA3CmlDJs2OSFz
         SLf4nDLOyM6CvmILhJVHNaLTKUItGbacHK1Iy2n8h2ygvTdhwsjaBV/CVycfI5X0eJLd
         sW8AIpEGUzCc1JfHX8ULNZXrcLuGoZ9hY6yheVcr55Wu1ty6kxZHEU4eBfZ9oTzKv7P6
         QSC4IovGv3BX7WTJ07pfkHgDxQq6znbeYbOuAwa4DBOk0Toj4EwWJoPjzAYGyrFK9RFM
         pe7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793717219; x=1794322019;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=v9Ow5G02Xqg2hVxr/uI/cOfPbnHOOQM02o3w/aqTuts=;
        b=BtPrOcxFcrBHFgamcYKHTJUedv2NuMsWIHaWihM+DA3BQlceTkEMc+oUV8LlDoXMK9
         vhL1f5fNh/7qzQ1sWTFXKWxQh5KOnZXDF1zfkdPFXvjofz7sArY1DJevJkfFJr5L+gSR
         9kco+25c7nTsAzoS+eKWrLSzKAGu1jPJwXexViHkUSaIrHZ1ffLAwU2y6R4bC4EAIVm7
         vmQI21cEKlrd5/25qtXIaDy5sRC+uWWbNGxyQ/eEzrbOiaXIhy7qC7JVSWnd7Hs2HhKZ
         +DViPCRppDNHbGLjQlRcuAbsV/QxWgugnIs3fLLo3CzfBYC+SBUulgTtcgzEUmYz3eKj
         8laQ==
X-Gm-Message-State: APuU4Z+CVucD3g/Dend5BKuKk207jEKFJPa6iZZ7cQFkqIGg8V1OOGwm
	WteRXKbCmqqhrsL0Lumk1pFCY86VQN6NJs1jZlt7Rp7d0/ConGmNRD8Ne/uS9fwH4AgffYTc6sz
	Kk5++g0dIYMY15ulN5n2Pv8cFQyFuXe2/uhmK
X-Gm-Gg: AYBFou3CGVXZf5njIQ7r6S0/u5tr6wufBzrR7O5oHBzXSyPjlfRoov6+gJrGyJHsUq3
	oyXpydwNd7pIolX/Xx4JwyFrL4mN/CzcKgQA5FJ0DAhJUyI8sEl9zbwIM6Xn1s7B2t+cUJhbyBZ
	zEL0zEzrhmZgEJiexPCZxH/jnGRlOSVwMjSWCUBqczJI5UhHaEXCNmLOqRH4WGJwifs6sTUUVAg
	AXT/wdfsfa+TqanEo+CcYL/+D8wxx9gVaHIc9PRg5WKemf9dwnn52BcMC/mT2EQPjF5btZ7qVvN
	r+zKbUYklmJcGlHyB+Iv3zZiBqZoeTAAnEUe6XcBdsTeIF748cBQ9ZMMzaVgu1XH/Mj2YZqBzWG
	zbjLrYiED85hHo4t1IeG4oyinU3Ca0jSaAFSrZUYFnIz4uCGiYWy/0iOQiqwVTWYHM0WF2SlF98
	570OPSk5PO80ANQzbTbmrIasYE2+gja/glYlhDl8BnBZ5XgoAaagwzr3dnDPjwPTfYzBkcVaufZ
	ii9HE1Y4TU3Fqe4acu/DdCxQjWy5BzGKlE3IpRlMPBO/ThDK3TmKEBTOPSjkqtt77BbzpP/Np4Z
	/3hcJd4ZuvgWL/KwBX817ndLyyIqKXKF/ZyBSV5UU+0PutDXcmmOxOMoxRTr9sbUgSNaTMas4Px
	aMDvxhKXwMZGVBG02Hv7PAA==
X-Received: by 2002:a05:690c:6605:b0:8b0:76e5:ed0c with SMTP id
 00721157ae682-8b2b66f82dbmr79611987b3.39.1793717219257; Tue, 03 Nov 2026
 06:46:59 -0800 (PST)
MIME-Version: 1.0
References: <20261102103459.3625067-1-sean@geanix.com> <20261102103459.3625067-2-sean@geanix.com>
 <CAMKF1soDR+KvfX7YFqfoMG7y6EHxRmk7Aap7E=iTV2Jr8x4z=g@mail.gmail.com> <182CA24C-CD67-4BB5-AE5D-286CB77A3604@geanix.com>
In-Reply-To: <182CA24C-CD67-4BB5-AE5D-286CB77A3604@geanix.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 3 Nov 2026 06:46:32 -0800
X-Gm-Features: AclHuK8VKBnAYgn6Pby9PGEBLfpEiFBGpgypbssn5M8FU9ZvyE-u3qkyfe1OWFw
Message-ID: <CAMKF1soZ=g6SL+afa7vDbH+nujUAvnE+iYvAJprdXG5dQ08F_Q@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 2/2] zsh: make libpcre2 a PACKAGECONFIG
To: Sean Nyekjaer <sean@geanix.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000ae73f5065f605564"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 03 Nov 2026 14:47:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131789

--000000000000ae73f5065f605564
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 3, 2026 at 12:49=E2=80=AFAM Sean Nyekjaer <sean@geanix.com> wro=
te:

>
>
> > On 3 Nov 2026, at 04.15, Khem Raj <raj.khem@gmail.com> wrote:
> >
> >
> >
> > On Mon, Nov 2, 2026 at 2:35=E2=80=AFAM Sean Nyekjaer via openembedded-d=
evel
> <sean=3Dgeanix.com@lists.openembedded.org> wrote:
> > libpcre2 was always in DEPENDS. Move it to a PACKAGECONFIG, enabled
> > by default, so it can be dropped.
> >
> > Signed-off-by: Sean Nyekjaer <sean@geanix.com>
> > ---
> >  meta-oe/recipes-shells/zsh/zsh_5.9.2.bb | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta-oe/recipes-shells/zsh/zsh_5.9.2.bb
> b/meta-oe/recipes-shells/zsh/zsh_5.9.2.bb
> > index 47b9bfc18f..16a769612c 100644
> > --- a/meta-oe/recipes-shells/zsh/zsh_5.9.2.bb
> > +++ b/meta-oe/recipes-shells/zsh/zsh_5.9.2.bb
> > @@ -8,7 +8,7 @@ SECTION =3D "base/shell"
> >  LICENSE =3D "LicenseRef-zsh"
> >  LIC_FILES_CHKSUM =3D "file://LICENCE;md5=3D1a4c4cda3e8096d2fd483ff2f45=
14fec"
> >
> > -DEPENDS =3D "ncurses bison-native libcap libpcre2 groff-native"
> > +DEPENDS =3D "ncurses bison-native libcap groff-native"
> >
> >  SRC_URI =3D
> "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}/${PV}/${BP}.tar.xz"
> >  SRC_URI[sha256sum] =3D
> "36fa734374b44783582cec09bcd67822e2f992c779ec1624ab5596df078d2f81"
> > @@ -44,7 +44,9 @@ ALTERNATIVE_LINK_NAME[sh] =3D "${base_bindir}/sh"
> >  ALTERNATIVE_TARGET[sh] =3D "${base_bindir}/${BPN}"
> >  ALTERNATIVE_PRIORITY =3D "90"
> >
> > +PACKAGECONFIG ??=3D "pcre"
> >  PACKAGECONFIG[gdbm] =3D "--enable-gdbm,--disable-gdbm,gdbm"
> > +PACKAGECONFIG[pcre] =3D "--enable-pcre,--disable-pcre,libpcre2"
> >
> > zsh/pcre module is link=3Ddynamic only and the recipe uses
> --disable-dynamic,
> > so the module is not built as such.
> >
> > Making pcre a PACKAGECONFIG enabled by default, started passing
> > --enable-pcre, which zsh never got before (its default is off). configu=
re
> > then runs pcre2-config, but libpcre2 inherits binconfig-disabled, so
> > `pcre2-config --cflags` returns bogus stuff. One can fix that by using
> pkgconfig
> > or writing a small wrapper for pcre2-config using pkgconfig but servees
> no
> > point if dynamic modules are disabled.
> >
> > Other patch to turn gdbm into a packageconfig also has same problem.
>
> What would be your solution here? Would you prefer the pkgconfig solution=
?
> Should we remove is "=E2=80=94disable-dynamic=E2=80=9D if one is enabling=
 pcre2?
>
>
yes pkfconfig is preferred way to tool the knob and perhaps enable dynamic
modules
but it would be good to know size/perf impact of doing it.


> gdbm is off by default. So should we remove it from DEPENDS and remove
> =E2=80=9C=E2=80=94disable-gdbm=E2=80=9D ?
>
> /Sean
>
> >    # Needed for manpages.bbclass, but they're always installed
> >  PACKAGECONFIG[manpages] =3D ""
> >
> > --
> > 2.55.0
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#131748):
> https://lists.openembedded.org/g/openembedded-devel/message/131748
> > Mute This Topic: https://lists.openembedded.org/mt/122055384/1997914
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[
> raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>
>
>
>

--000000000000ae73f5065f605564
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Nov 3, =
2026 at 12:49=E2=80=AFAM Sean Nyekjaer &lt;<a href=3D"mailto:sean@geanix.co=
m">sean@geanix.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex"><br>
<br>
&gt; On 3 Nov 2026, at 04.15, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail=
.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; On Mon, Nov 2, 2026 at 2:35=E2=80=AFAM Sean Nyekjaer via openembedded-=
devel &lt;sean=3D<a href=3D"mailto:geanix.com@lists.openembedded.org" targe=
t=3D"_blank">geanix.com@lists.openembedded.org</a>&gt; wrote:<br>
&gt; libpcre2 was always in DEPENDS. Move it to a PACKAGECONFIG, enabled<br=
>
&gt; by default, so it can be dropped.<br>
&gt; <br>
&gt; Signed-off-by: Sean Nyekjaer &lt;<a href=3D"mailto:sean@geanix.com" ta=
rget=3D"_blank">sean@geanix.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta-oe/recipes-shells/zsh/<a href=3D"http://zsh_5.9.2.bb" rel=
=3D"noreferrer" target=3D"_blank">zsh_5.9.2.bb</a> | 4 +++-<br>
&gt;=C2=A0 1 file changed, 3 insertions(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/meta-oe/recipes-shells/zsh/<a href=3D"http://zsh_5.9.2.bb=
" rel=3D"noreferrer" target=3D"_blank">zsh_5.9.2.bb</a> b/meta-oe/recipes-s=
hells/zsh/<a href=3D"http://zsh_5.9.2.bb" rel=3D"noreferrer" target=3D"_bla=
nk">zsh_5.9.2.bb</a><br>
&gt; index 47b9bfc18f..16a769612c 100644<br>
&gt; --- a/meta-oe/recipes-shells/zsh/<a href=3D"http://zsh_5.9.2.bb" rel=
=3D"noreferrer" target=3D"_blank">zsh_5.9.2.bb</a><br>
&gt; +++ b/meta-oe/recipes-shells/zsh/<a href=3D"http://zsh_5.9.2.bb" rel=
=3D"noreferrer" target=3D"_blank">zsh_5.9.2.bb</a><br>
&gt; @@ -8,7 +8,7 @@ SECTION =3D &quot;base/shell&quot;<br>
&gt;=C2=A0 LICENSE =3D &quot;LicenseRef-zsh&quot;<br>
&gt;=C2=A0 LIC_FILES_CHKSUM =3D &quot;file://LICENCE;md5=3D1a4c4cda3e8096d2=
fd483ff2f4514fec&quot;<br>
&gt; <br>
&gt; -DEPENDS =3D &quot;ncurses bison-native libcap libpcre2 groff-native&q=
uot;<br>
&gt; +DEPENDS =3D &quot;ncurses bison-native libcap groff-native&quot;<br>
&gt; <br>
&gt;=C2=A0 SRC_URI =3D &quot;${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}/${=
PV}/${BP}.tar.xz&quot;<br>
&gt;=C2=A0 SRC_URI[sha256sum] =3D &quot;36fa734374b44783582cec09bcd67822e2f=
992c779ec1624ab5596df078d2f81&quot;<br>
&gt; @@ -44,7 +44,9 @@ ALTERNATIVE_LINK_NAME[sh] =3D &quot;${base_bindir}/s=
h&quot;<br>
&gt;=C2=A0 ALTERNATIVE_TARGET[sh] =3D &quot;${base_bindir}/${BPN}&quot;<br>
&gt;=C2=A0 ALTERNATIVE_PRIORITY =3D &quot;90&quot;<br>
&gt; <br>
&gt; +PACKAGECONFIG ??=3D &quot;pcre&quot;<br>
&gt;=C2=A0 PACKAGECONFIG[gdbm] =3D &quot;--enable-gdbm,--disable-gdbm,gdbm&=
quot;<br>
&gt; +PACKAGECONFIG[pcre] =3D &quot;--enable-pcre,--disable-pcre,libpcre2&q=
uot;<br>
&gt; <br>
&gt; zsh/pcre module is link=3Ddynamic only and the recipe uses --disable-d=
ynamic,<br>
&gt; so the module is not built as such. <br>
&gt; <br>
&gt; Making pcre a PACKAGECONFIG enabled by default, started passing<br>
&gt; --enable-pcre, which zsh never got before (its default is off). config=
ure<br>
&gt; then runs pcre2-config, but libpcre2 inherits binconfig-disabled, so<b=
r>
&gt; `pcre2-config --cflags` returns bogus stuff. One can fix that by using=
 pkgconfig<br>
&gt; or writing a small wrapper for pcre2-config using pkgconfig but servee=
s no<br>
&gt; point if dynamic modules are disabled.<br>
&gt; <br>
&gt; Other patch to turn gdbm into a packageconfig also has same problem.<b=
r>
<br>
What would be your solution here? Would you prefer the pkgconfig solution?<=
br>
Should we remove is &quot;=E2=80=94disable-dynamic=E2=80=9D if one is enabl=
ing pcre2?<br>
<br></blockquote><div><br></div><div>yes pkfconfig=C2=A0is preferred way to=
 tool the knob and perhaps enable dynamic modules</div><div>but it would be=
 good to know size/perf impact of doing it.</div><div>=C2=A0</div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">
gdbm is off by default. So should we remove it from DEPENDS and remove =E2=
=80=9C=E2=80=94disable-gdbm=E2=80=9D ?<br>
<br>
/Sean<br>
<br>
&gt;=C2=A0 =C2=A0 # Needed for manpages.bbclass, but they&#39;re always ins=
talled<br>
&gt;=C2=A0 PACKAGECONFIG[manpages] =3D &quot;&quot;<br>
&gt; <br>
&gt; -- <br>
&gt; 2.55.0<br>
&gt; <br>
&gt; <br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#131748): <a href=3D"https://lists.openembedded.org=
/g/openembedded-devel/message/131748" rel=3D"noreferrer" target=3D"_blank">=
https://lists.openembedded.org/g/openembedded-devel/message/131748</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/12205538=
4/1997914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.=
org/mt/122055384/1997914</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openem=
bedded.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.o=
rg</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
devel/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedde=
d.org/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com"=
 target=3D"_blank">raj.khem@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; <br>
<br>
<br>
<br>
</blockquote></div></div>

--000000000000ae73f5065f605564--
