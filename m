Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC2D8C77B75
	for <webhook@archiver.kernel.org>; Tue, 16 May 2023 06:23:30 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web10.14780.1684218201927343549
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 May 2023 23:23:22 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd86.dcpf.telekom.de (fwd86.aul.t-online.de [10.223.144.112])
	by mailout03.t-online.de (Postfix) with SMTP id 7B80146069;
	Tue, 16 May 2023 08:23:18 +0200 (CEST)
Received: from [192.168.178.156] ([79.219.228.204]) by fwd86.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pyo5c-0HM0NE0; Tue, 16 May 2023 08:23:17 +0200
Date: Tue, 16 May 2023 08:23:11 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-oe][PATCH 1/2] paprefs: add recipe
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: Markus Volk <mrksvolk@googlemail.com>,
	openembedded-devel@lists.openembedded.org
Message-Id: <N2NQUR.VMSJ9SVTK49Q1@t-online.de>
In-Reply-To: 
	<CA+chaQex3YhM61ELh9mfk-MACC5z9nTMmeZcYSQ=mTJxYPCbGw@mail.gmail.com>
References: <20230509124612.37627-1-f_l_k@t-online.de>
	<CA+chaQdJjtYgByUO9wNXEC-2hRC7EmsMF_2gwVGY0qRDkSveuQ@mail.gmail.com>
	<G9IQUR.FHRNZP7EKVIS3@googlemail.com>
	<CA+chaQex3YhM61ELh9mfk-MACC5z9nTMmeZcYSQ=mTJxYPCbGw@mail.gmail.com>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-ZVOIehcRQtCMe3p6414K"
X-TOI-EXPURGATEID: 150726::1684218197-14ACBC77-941F5BDE/0/0 CLEAN NORMAL
X-TOI-MSGID: f486df52-263f-4dfc-b89b-eadc326e65af
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 May 2023 06:23:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102622

--=-ZVOIehcRQtCMe3p6414K
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Thanks for this. Your patch has the far better commit message

Am Di, 16. Mai 2023 um 08:21:13 +0200 schrieb Martin Jansa=20
<Martin.Jansa@gmail.com>:
> In the end I've sent one as well:=20
> <https://lists.openembedded.org/g/openembedded-devel/message/102602>=20
> both do the same, lets see which one is picked by Khem sooner.
>=20
> On Tue, May 16, 2023 at 6:39=E2=80=AFAM Markus Volk=20
> <mrksvolk@googlemail.com <mailto:mrksvolk@googlemail.com>> wrote:
>> Thanks for pointing me to this issue. I've sent a patch that adds=20
>> REQUIRED_DISTRO_FEATURES =3D "x11"
>>=20
>> Am Mo, 15. Mai 2023 um 10:13:41 +0200 schrieb Martin Jansa=20
>> <martin.jansa@gmail.com <mailto:martin.jansa@gmail.com>>:
>>> On Tue, May 9, 2023 at 2:46=E2=80=AFPM Markus Volk <f_l_k@t-online.de=20
>>> <mailto:f_l_k@t-online.de>> wrote:
>>>> Signed-off-by: Markus Volk <f_l_k@t-online.de=20
>>>> <mailto:f_l_k@t-online.de>>
>>>>  ---
>>>>   .../pulseaudio/paprefs_1.2.bb <http://paprefs_1.2.bb/>          =20
>>>>        | 18 ++++++++++++++++++
>>>>   1 file changed, 18 insertions(+)
>>>>   create mode 100644=20
>>>> meta-oe/recipes-multimedia/pulseaudio/paprefs_1.2.bb=20
>>>> <http://paprefs_1.2.bb/>
>>>>=20
>>>>  diff --git a/meta-oe/recipes-multimedia/pulseaudio/paprefs_1.2.bb=20
>>>> <http://paprefs_1.2.bb/>=20
>>>> b/meta-oe/recipes-multimedia/pulseaudio/paprefs_1.2.bb=20
>>>> <http://paprefs_1.2.bb/>
>>>>  new file mode 100644
>>>>  index 0000000000..6d0cf7ed7f
>>>>  --- /dev/null
>>>>  +++ b/meta-oe/recipes-multimedia/pulseaudio/paprefs_1.2.bb=20
>>>> <http://paprefs_1.2.bb/>
>>>>  @@ -0,0 +1,18 @@
>>>>  +DESCRIPTION =3D "PulseAudio Preferences (paprefs) is a simple GTK=20
>>>> based configuration dialog for the PulseAudio sound server."
>>>>  +HOMEPAGE =3D=20
>>>> "<https://freedesktop.org/software/pulseaudio/paprefs/>"
>>>>  +LICENSE =3D "GPL-2.0-only"
>>>>  +LIC_FILES_CHKSUM =3D=20
>>>> "file://LICENSE;md5=3D751419260aa954499f7abaabaa882bbe"
>>>>  +
>>>>  +DEPENDS =3D "pulseaudio gtkmm3 gtk+3 libsigc++-3 glibmm"
>>>>  +
>>>>  +inherit meson pkgconfig features_check
>>>>  +
>>>>  +ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
>>>=20
>>> This doesn't build with any gtk3 DISTRO_FEATURES, without x11 in=20
>>> DISTRO_FEATURES gtk3+ doesn't provide gdkx.h and paprefs build=20
>>> fails with:
>>> <http://errors.yoctoproject.org/Errors/Details/704195/>
>>>=20
>>> ../paprefs-1.2/src/paprefs.cc:30:10: fatal error: gdk/gdkx.h: No=20
>>> such file or directory
>>>    30 | #include <gdk/gdkx.h>
>>>       |          ^~~~~~~~~~~~
>>>=20
>>> Please change it to REQUIRED_DISTRO_FEATURES =3D "x11" if you don't=20
>>> care about non-x11 usecase or fix otherwise if you do care.
>>>=20
>>> Regards,


--=-ZVOIehcRQtCMe3p6414K
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto"><div>Thanks for this. Your patch has th=
e far better commit message</div></div><div id=3D"geary-quote" dir=3D"auto"=
><br>Am Di, 16. Mai 2023 um 08:21:13 +0200 schrieb Martin Jansa &lt;Martin.=
Jansa@gmail.com&gt;:<br><blockquote type=3D"cite"><div dir=3D"ltr">In the e=
nd I've sent one as well:&nbsp;<a href=3D"https://lists.openembedded.org/g/=
openembedded-devel/message/102602">https://lists.openembedded.org/g/openemb=
edded-devel/message/102602</a> both do the same, lets see which one is pick=
ed by Khem sooner.</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cla=
ss=3D"gmail_attr">On Tue, May 16, 2023 at 6:39=E2=80=AFAM Markus Volk &lt;<=
a href=3D"mailto:mrksvolk@googlemail.com">mrksvolk@googlemail.com</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div id=3D=
"m_-4721783881392406812geary-body" dir=3D"auto"><div>Thanks for pointing me=
 to this issue. I've sent a patch that adds REQUIRED_DISTRO_FEATURES =3D "x=
11"</div></div><div id=3D"m_-4721783881392406812geary-quote" dir=3D"auto"><=
br>Am Mo, 15. Mai 2023 um 10:13:41 +0200 schrieb Martin Jansa &lt;<a href=
=3D"mailto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com=
</a>&gt;:<br><blockquote type=3D"cite"><div dir=3D"ltr"><div dir=3D"ltr">On=
 Tue, May 9, 2023 at 2:46=E2=80=AFPM Markus Volk &lt;<a href=3D"mailto:f_l_=
k@t-online.de" target=3D"_blank">f_l_k@t-online.de</a>&gt; wrote:<br></div>=
<div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">Signed-off-by: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de" targe=
t=3D"_blank">f_l_k@t-online.de</a>&gt;<br>
---<br>
&nbsp;.../pulseaudio/<a href=3D"http://paprefs_1.2.bb" rel=3D"noreferrer" t=
arget=3D"_blank">paprefs_1.2.bb</a>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; | 18 ++++++++++++++++++<br>
&nbsp;1 file changed, 18 insertions(+)<br>
&nbsp;create mode 100644 meta-oe/recipes-multimedia/pulseaudio/<a href=3D"h=
ttp://paprefs_1.2.bb" rel=3D"noreferrer" target=3D"_blank">paprefs_1.2.bb</=
a><br>
<br>
diff --git a/meta-oe/recipes-multimedia/pulseaudio/<a href=3D"http://papref=
s_1.2.bb" rel=3D"noreferrer" target=3D"_blank">paprefs_1.2.bb</a> b/meta-oe=
/recipes-multimedia/pulseaudio/<a href=3D"http://paprefs_1.2.bb" rel=3D"nor=
eferrer" target=3D"_blank">paprefs_1.2.bb</a><br>
new file mode 100644<br>
index 0000000000..6d0cf7ed7f<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-multimedia/pulseaudio/<a href=3D"http://paprefs_1.2.b=
b" rel=3D"noreferrer" target=3D"_blank">paprefs_1.2.bb</a><br>
@@ -0,0 +1,18 @@<br>
+DESCRIPTION =3D "PulseAudio Preferences (paprefs) is a simple GTK based co=
nfiguration dialog for the PulseAudio sound server."<br>
+HOMEPAGE =3D "<a href=3D"https://freedesktop.org/software/pulseaudio/papre=
fs/" rel=3D"noreferrer" target=3D"_blank">https://freedesktop.org/software/=
pulseaudio/paprefs/</a>"<br>
+LICENSE =3D "GPL-2.0-only"<br>
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D751419260aa954499f7abaabaa882bb=
e"<br>
+<br>
+DEPENDS =3D "pulseaudio gtkmm3 gtk+3 libsigc++-3 glibmm"<br>
+<br>
+inherit meson pkgconfig features_check<br>
+<br>
+ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"<br></blockquote><div><b=
r></div><div>This doesn't build with any gtk3 DISTRO_FEATURES, without x11 =
in DISTRO_FEATURES gtk3+ doesn't provide&nbsp;gdkx.h and paprefs build fail=
s with:</div><div><a href=3D"http://errors.yoctoproject.org/Errors/Details/=
704195/" target=3D"_blank">http://errors.yoctoproject.org/Errors/Details/70=
4195/</a></div><div><br></div><div>../paprefs-1.2/src/paprefs.cc:30:10: fat=
al error: gdk/gdkx.h: No such file or directory<br>&nbsp; &nbsp;30 | #inclu=
de &lt;gdk/gdkx.h&gt;<br>&nbsp; &nbsp; &nbsp; | &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp;^~~~~~~~~~~~<br></div><div><br></div><div>Please change it to REQUIR=
ED_DISTRO_FEATURES =3D "x11" if you don't care about non-x11 usecase or fix=
 otherwise if you do care.</div><div><br></div><div>Regards,</div></div></d=
iv>
</blockquote></div></blockquote></div>
</blockquote></div>
--=-ZVOIehcRQtCMe3p6414K--


