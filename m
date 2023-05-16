Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7E6EC77B75
	for <webhook@archiver.kernel.org>; Tue, 16 May 2023 06:21:30 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web10.14749.1684218088858976609
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 May 2023 23:21:29 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=B4pcXMl2;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3062b101ae1so8921833f8f.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 15 May 2023 23:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684218087; x=1686810087;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mOK1clJMXB8gMpTA3q51/UVz6AiGLqoTWQKZJPaS94Q=;
        b=B4pcXMl254O0fhCiniJj8rZwUScCUuUxPVgnskrGN0aD1Pm4T58J4TlMK5NTTkm6v4
         zxOlpm4ZRAkSkv/0Cl4mvizplO18EOV8DQbcOxUB+B/Bzo1BS//mFXgmMMrGs4M9LvdM
         st0ABhWSSa5wLl/h40HQyeHuqKeSg9TRxyLXp19RMfw79aTiZYcDLKlJSX9Cvm4SKYte
         L8cAIaq+76EynJ+yYWUqFjXRhPee1RMjXA248UgXPUZZNIB6pbVqVNlcUVy8WvP8Hp0Y
         fjW0S6LKiQHEOdG5fXMgp+ukIdMXStoX2S7BKwvQ8rYpSi2zCtChk+qv0Vd3Waas4FWZ
         VYKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684218087; x=1686810087;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mOK1clJMXB8gMpTA3q51/UVz6AiGLqoTWQKZJPaS94Q=;
        b=iVXePNfoEQqvr/liFceHhSwEZYOrGkiIQmzDMn7qn29poHrqsBxmkD7apZniYN7y4J
         jLD+Jg7OqHWRFCXfdF51Uej0RrWPZYiiHWuWSn8YyCGajRcO37KwGI4nFciERqu+e/iL
         eYAd6+LzC0v+ezaB8NzFbQ3mx2B8nP+hkEXe+nixA7ZHhtr2EDc235KaPJXZomStPUjX
         uGc7LY3HrY5xZvC2vCgv8oa/ECZSueoYzGEDg4ox7/VGrKE+L4fTosumlEbgVkK281Gc
         gbYqx8fQ1myEMKqZJ9WxhMzqekRZFkALdB9rAbr6wg3Iq+DwUlL2Tq8IJhWsoAA3/teU
         ONhw==
X-Gm-Message-State: AC+VfDxRCH1EVVwt0ElyYhMqwvV+Epf3LECrsGlb94rP/74jS6E9a5wX
	y21mgrRnJCOCOssJ6bjB0Rue0OLWHG671yi/ShM=
X-Google-Smtp-Source: ACHHUZ7dIHwrqCJTuTwyPcf1Lv/AF+fBOWX6NSfsGwXgU0Cj77Obz8CSUO3wM027EiRHawMqShAU1wt4/TQi1XNj3hM=
X-Received: by 2002:a5d:6a8b:0:b0:304:6762:2490 with SMTP id
 s11-20020a5d6a8b000000b0030467622490mr28815804wru.3.1684218086581; Mon, 15
 May 2023 23:21:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230509124612.37627-1-f_l_k@t-online.de> <CA+chaQdJjtYgByUO9wNXEC-2hRC7EmsMF_2gwVGY0qRDkSveuQ@mail.gmail.com>
 <G9IQUR.FHRNZP7EKVIS3@googlemail.com>
In-Reply-To: <G9IQUR.FHRNZP7EKVIS3@googlemail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 16 May 2023 08:21:13 +0200
Message-ID: <CA+chaQex3YhM61ELh9mfk-MACC5z9nTMmeZcYSQ=mTJxYPCbGw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 1/2] paprefs: add recipe
To: Markus Volk <mrksvolk@googlemail.com>
Cc: Markus Volk <f_l_k@t-online.de>, openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000c66a6c05fbc994b1"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 May 2023 06:21:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102621

--000000000000c66a6c05fbc994b1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

In the end I've sent one as well:
https://lists.openembedded.org/g/openembedded-devel/message/102602 both do
the same, lets see which one is picked by Khem sooner.

On Tue, May 16, 2023 at 6:39=E2=80=AFAM Markus Volk <mrksvolk@googlemail.co=
m> wrote:

> Thanks for pointing me to this issue. I've sent a patch that adds
> REQUIRED_DISTRO_FEATURES =3D "x11"
>
> Am Mo, 15. Mai 2023 um 10:13:41 +0200 schrieb Martin Jansa <
> martin.jansa@gmail.com>:
>
> On Tue, May 9, 2023 at 2:46=E2=80=AFPM Markus Volk <f_l_k@t-online.de> wr=
ote:
>
>> Signed-off-by: Markus Volk <f_l_k@t-online.de>
>> ---
>>  .../pulseaudio/paprefs_1.2.bb                  | 18 ++++++++++++++++++
>>  1 file changed, 18 insertions(+)
>>  create mode 100644 meta-oe/recipes-multimedia/pulseaudio/paprefs_1.2.bb
>>
>> diff --git a/meta-oe/recipes-multimedia/pulseaudio/paprefs_1.2.bb
>> b/meta-oe/recipes-multimedia/pulseaudio/paprefs_1.2.bb
>> new file mode 100644
>> index 0000000000..6d0cf7ed7f
>> --- /dev/null
>> +++ b/meta-oe/recipes-multimedia/pulseaudio/paprefs_1.2.bb
>> @@ -0,0 +1,18 @@
>> +DESCRIPTION =3D "PulseAudio Preferences (paprefs) is a simple GTK based
>> configuration dialog for the PulseAudio sound server."
>> +HOMEPAGE =3D "https://freedesktop.org/software/pulseaudio/paprefs/"
>> +LICENSE =3D "GPL-2.0-only"
>> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D751419260aa954499f7abaabaa88=
2bbe"
>> +
>> +DEPENDS =3D "pulseaudio gtkmm3 gtk+3 libsigc++-3 glibmm"
>> +
>> +inherit meson pkgconfig features_check
>> +
>> +ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
>>
>
> This doesn't build with any gtk3 DISTRO_FEATURES, without x11 in
> DISTRO_FEATURES gtk3+ doesn't provide gdkx.h and paprefs build fails with=
:
> http://errors.yoctoproject.org/Errors/Details/704195/
>
> ../paprefs-1.2/src/paprefs.cc:30:10: fatal error: gdk/gdkx.h: No such fil=
e
> or directory
>    30 | #include <gdk/gdkx.h>
>       |          ^~~~~~~~~~~~
>
> Please change it to REQUIRED_DISTRO_FEATURES =3D "x11" if you don't care
> about non-x11 usecase or fix otherwise if you do care.
>
> Regards,
>
>

--000000000000c66a6c05fbc994b1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">In the end I&#39;ve sent one as well:=C2=A0<a href=3D"http=
s://lists.openembedded.org/g/openembedded-devel/message/102602">https://lis=
ts.openembedded.org/g/openembedded-devel/message/102602</a> both do the sam=
e, lets see which one is picked by Khem sooner.</div><br><div class=3D"gmai=
l_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, May 16, 2023 at 6:39=
=E2=80=AFAM Markus Volk &lt;<a href=3D"mailto:mrksvolk@googlemail.com">mrks=
volk@googlemail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex"><div id=3D"m_-4721783881392406812geary-body" dir=3D"auto=
"><div>Thanks for pointing me to this issue. I&#39;ve sent a patch that add=
s REQUIRED_DISTRO_FEATURES =3D &quot;x11&quot;</div></div><div id=3D"m_-472=
1783881392406812geary-quote" dir=3D"auto"><br>Am Mo, 15. Mai 2023 um 10:13:=
41 +0200 schrieb Martin Jansa &lt;<a href=3D"mailto:martin.jansa@gmail.com"=
 target=3D"_blank">martin.jansa@gmail.com</a>&gt;:<br><blockquote type=3D"c=
ite"><div dir=3D"ltr"><div dir=3D"ltr">On Tue, May 9, 2023 at 2:46=E2=80=AF=
PM Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de" target=3D"_blank">f=
_l_k@t-online.de</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">Signed-off-by: Markus Volk &lt;<=
a href=3D"mailto:f_l_k@t-online.de" target=3D"_blank">f_l_k@t-online.de</a>=
&gt;<br>
---<br>
=C2=A0.../pulseaudio/<a href=3D"http://paprefs_1.2.bb" rel=3D"noreferrer" t=
arget=3D"_blank">paprefs_1.2.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 | 18 ++++++++++++++++++<br>
=C2=A01 file changed, 18 insertions(+)<br>
=C2=A0create mode 100644 meta-oe/recipes-multimedia/pulseaudio/<a href=3D"h=
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
+DESCRIPTION =3D &quot;PulseAudio Preferences (paprefs) is a simple GTK bas=
ed configuration dialog for the PulseAudio sound server.&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"https://freedesktop.org/software/pulseaudio/=
paprefs/" rel=3D"noreferrer" target=3D"_blank">https://freedesktop.org/soft=
ware/pulseaudio/paprefs/</a>&quot;<br>
+LICENSE =3D &quot;GPL-2.0-only&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D751419260aa954499f7abaabaa=
882bbe&quot;<br>
+<br>
+DEPENDS =3D &quot;pulseaudio gtkmm3 gtk+3 libsigc++-3 glibmm&quot;<br>
+<br>
+inherit meson pkgconfig features_check<br>
+<br>
+ANY_OF_DISTRO_FEATURES =3D &quot;${GTK3DISTROFEATURES}&quot;<br></blockquo=
te><div><br></div><div>This doesn&#39;t build with any gtk3 DISTRO_FEATURES=
, without x11 in DISTRO_FEATURES gtk3+ doesn&#39;t provide=C2=A0gdkx.h and =
paprefs build fails with:</div><div><a href=3D"http://errors.yoctoproject.o=
rg/Errors/Details/704195/" target=3D"_blank">http://errors.yoctoproject.org=
/Errors/Details/704195/</a></div><div><br></div><div>../paprefs-1.2/src/pap=
refs.cc:30:10: fatal error: gdk/gdkx.h: No such file or directory<br>=C2=A0=
 =C2=A030 | #include &lt;gdk/gdkx.h&gt;<br>=C2=A0 =C2=A0 =C2=A0 | =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0^~~~~~~~~~~~<br></div><div><br></div><div>Please=
 change it to REQUIRED_DISTRO_FEATURES =3D &quot;x11&quot; if you don&#39;t=
 care about non-x11 usecase or fix otherwise if you do care.</div><div><br>=
</div><div>Regards,</div></div></div>
</blockquote></div></blockquote></div>

--000000000000c66a6c05fbc994b1--

