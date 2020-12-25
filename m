Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web09.8633.1608889615665568273
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Dec 2020 01:46:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=THZoGla3;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id j22so5828542eja.13
        for <openembedded-devel@lists.openembedded.org>; Fri, 25 Dec 2020 01:46:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=q9+19GICDRNc+HdYSoccXO8f+mws7lUTUXzMQTXMbNI=;
        b=THZoGla3ChswT/oK52h1aQrDfx2IZ111RXw23h1lRY5M6e91Qxu8emU12P+62ENWDE
         Y8tlOjQvDkzGoXyjFNEln2BZRzIuueGeEZ3WwXCJ78r2aY1oqPixLjs9sNQWkXiePzcf
         Uqu2kvJvnYooYZ3biFc81kEMhsEHpc3iviPrCcBoSown36Ejonyz7f1tbvXHYl36ufYx
         jlcQdZbu+YT3ScsTf9DuhixbM41enWsCUm4CvmuzrCX8mQA+juvZg/e4jSO3eDlqpxKc
         VDGZ696EAz3P9yqkVUo/WWSO100s+eVw8n1MuQFP1lYpw3f/P+Fkx7TbcZlORl853v8j
         uFhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=q9+19GICDRNc+HdYSoccXO8f+mws7lUTUXzMQTXMbNI=;
        b=id8jkDxhvq1ZhOgbZmm+aQAoSGQmBF2ujXq5uz0d4bs6RqmC2kn3TOKwKQhAGTaeMz
         Os6h0g89fMctviLqK49hzkVfYZMltFM/H/trleAHwPm2jqxY9gGJoXK4TSVPPglKJa3k
         D1RlYSk08kq9Ix3/lpCw1eUvtTNEJul/t/govA2MqQVAcVnWFNoyc+4bKrs0dnzut09O
         w3FR5wUPt3Zgfz6J0GRTBAWipt+K6BOId5+UL9AepOJFpYYD3yPBC9ImTYj4u8NRYMd+
         sfBgdY0iOZIepcuVImbU/89/RGYzAHBXGrG86vo7y6+G+3PJKMh24edYjeC744/8V3do
         kcoA==
X-Gm-Message-State: AOAM5311bornfSS0t0jG/RLRqw14HRswNCNO9EOgi3PIN/MBuax6cnS/
	wB6/Qlr/AZpU1vAVORZ1AdIVrZRfsGXy227jzgQ=
X-Google-Smtp-Source: ABdhPJx5u+fAadHzJjTA5DnbDwdc1PmN/RfcEiDnlG8M7gXcjXNfN+jNVfSs0Gr78xUOAwT09qPVTgODG/0FapXo1UE=
X-Received: by 2002:a17:906:851:: with SMTP id f17mr31151362ejd.392.1608889614049;
 Fri, 25 Dec 2020 01:46:54 -0800 (PST)
MIME-Version: 1.0
References: <20201208182629.3651761-1-fabio.berton@ossystems.com.br> <16535AD03B199DA5.27639@lists.openembedded.org>
In-Reply-To: <16535AD03B199DA5.27639@lists.openembedded.org>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Fri, 25 Dec 2020 10:46:42 +0100
Message-ID: <CA+chaQdkVLG7d3GmQjvkFJj5dcU9sugfdA=eo0-FExQ6E0Qy0w@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] linuxconsole: Add recipe for version 1.7.0
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: Fabio Berton <fabio.berton@ossystems.com.br>, 
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000eda47f05b746cd61"

--000000000000eda47f05b746cd61
Content-Type: text/plain; charset="UTF-8"

and there is also this with usrmerge enabled:

ERROR: linuxconsole-1.7.0-r0 do_package: QA Issue: linuxconsole:
Files/directories were installed but not shipped in any package:
  /lib
  /lib/udev
  /lib/udev/js-set-enum-leds
  /lib/udev/rules.d
  /lib/udev/rules.d/80-stelladaptor-joystick.rules
Please set FILES such that these items are packaged. Alternatively if they
are unneeded, avoid installing them or delete them within do_install.
linuxconsole: 5 installed and not shipped files. [installed-vs-shipped]

On Wed, Dec 23, 2020 at 2:15 PM Martin Jansa via lists.openembedded.org
<Martin.Jansa=gmail.com@lists.openembedded.org> wrote:

> On Tue, Dec 8, 2020 at 7:26 PM Fabio Berton <fabio.berton@ossystems.com.br>
> wrote:
>
>> Add linuxconsole and inputattach-config recipes. The inputattach-config
>> recipe is intend to use as machine configuration file for inputattach.
>>
>> Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
>> ....
>
> +FILES_joystick += "\
>> +    ${bindir}/evdev-joystick \
>> +    ${bindir}/ffcfstress \
>> +    ${bindir}/ffmvforce \
>> +    ${bindir}/ffset \
>> +    ${bindir}/fftest \
>> +    ${bindir}/jscal \
>> +    ${bindir}/jscal-restore \
>> +    ${bindir}/jscal-store \
>> +    ${bindir}/jstest \
>> +    ${datadir}/joystick \
>> +    ${base_libdir}/udev/rules.d/51-these-are-not-joysticks-rm.rules \
>> +    ${base_libdir}/udev/js-set-enum-leds \
>> +    ${base_libdir}/udev/rules.d/60-joystick.rules \
>> +    ${base_libdir}/udev/rules.d/80-stelladaptor-joystick.rules \
>> +"
>> +
>> +RDEPENDS_inputattach += "inputattach-config"
>> +
>> +RDEPENDS_joystick += "\
>> +    bash \
>> +    gawk \
>> +"
>>
>
> would you mind if I split jscal files to separate package with these
> runtime dependencies?
>
> We have joystick-jscal package in joystick recipe in meta-ros:
>
> https://github.com/ros/meta-ros/commit/ee3a3f6051594bdf39322d43ec08cce0df8f172c
> and it would make transition a bit simpler - but we also don't really use
> joystick anymore, so I don't have strong opinion on this, for now I'm
> replacing our joystick recipe with linuxconsole bbappend which does this,
> if you think it's useful I'll send patch for meta-oe to separate the
> package here.
>
> Cheers,
>
> 
>
>

--000000000000eda47f05b746cd61
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">and there is also this with usrmerge enabled:<div><br><div=
>ERROR: linuxconsole-1.7.0-r0 do_package: QA Issue: linuxconsole: Files/dir=
ectories were installed but not shipped in any package:<br>=C2=A0 /lib<br>=
=C2=A0 /lib/udev<br>=C2=A0 /lib/udev/js-set-enum-leds<br>=C2=A0 /lib/udev/=
rules.d<br>=C2=A0 /lib/udev/rules.d/80-stelladaptor-joystick.rules<br>Pleas=
e set FILES such that these items are packaged. Alternatively if they are u=
nneeded, avoid installing them or delete them within do_install.<br>linuxco=
nsole: 5 installed and not shipped files. [installed-vs-shipped]<br></div><=
/div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_a=
ttr">On Wed, Dec 23, 2020 at 2:15 PM Martin Jansa via <a href=3D"http://lis=
ts.openembedded.org">lists.openembedded.org</a> &lt;Martin.Jansa=3D<a href=
=3D"mailto:gmail.com@lists.openembedded.org">gmail.com@lists.openembedded.=
org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x"><div dir=3D"ltr"><div dir=3D"ltr">On Tue, Dec 8, 2020 at 7:26 PM Fabio B=
erton &lt;<a href=3D"mailto:fabio.berton@ossystems.com.br" target=3D"_blank=
">fabio.berton@ossystems.com.br</a>&gt; wrote:<br></div><div class=3D"gmail=
_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">Add linuxconsole =
and inputattach-config recipes. The inputattach-config<br>
recipe is intend to use as machine configuration file for inputattach.<br>
<br>
Signed-off-by: Fabio Berton &lt;<a href=3D"mailto:fabio.berton@ossystems.c=
om.br" target=3D"_blank">fabio.berton@ossystems.com.br</a>&gt;<br>....</blo=
ckquote><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">+FILES_joystick +=
=
=3D &quot;\<br>
+=C2=A0 =C2=A0 ${bindir}/evdev-joystick \<br>
+=C2=A0 =C2=A0 ${bindir}/ffcfstress \<br>
+=C2=A0 =C2=A0 ${bindir}/ffmvforce \<br>
+=C2=A0 =C2=A0 ${bindir}/ffset \<br>
+=C2=A0 =C2=A0 ${bindir}/fftest \<br>
+=C2=A0 =C2=A0 ${bindir}/jscal \<br>
+=C2=A0 =C2=A0 ${bindir}/jscal-restore \<br>
+=C2=A0 =C2=A0 ${bindir}/jscal-store \<br>
+=C2=A0 =C2=A0 ${bindir}/jstest \<br>
+=C2=A0 =C2=A0 ${datadir}/joystick \<br>
+=C2=A0 =C2=A0 ${base_libdir}/udev/rules.d/51-these-are-not-joysticks-rm.r=
ules \<br>
+=C2=A0 =C2=A0 ${base_libdir}/udev/js-set-enum-leds \<br>
+=C2=A0 =C2=A0 ${base_libdir}/udev/rules.d/60-joystick.rules \<br>
+=C2=A0 =C2=A0 ${base_libdir}/udev/rules.d/80-stelladaptor-joystick.rules =
\<br>
+&quot;<br>
+<br>
+RDEPENDS_inputattach +=3D &quot;inputattach-config&quot;<br>
+<br>
+RDEPENDS_joystick +=3D &quot;\<br>
+=C2=A0 =C2=A0 bash \<br>
+=C2=A0 =C2=A0 gawk \<br>
+&quot;<br></blockquote><div><br></div><div>would you mind if I split jsca=
l files to separate package with these runtime dependencies?</div><div><br>=
</div><div>We have joystick-jscal package in joystick recipe in meta-ros:</=
div><div><a href=3D"https://github.com/ros/meta-ros/commit/ee3a3f6051594bdf=
39322d43ec08cce0df8f172c" target=3D"_blank">https://github.com/ros/meta-ros=
/commit/ee3a3f6051594bdf39322d43ec08cce0df8f172c</a><br></div><div>and it w=
ould make transition a bit simpler - but we also don&#39;t really use joyst=
ick anymore, so I don&#39;t have strong opinion on this, for now I&#39;m re=
placing our joystick recipe with linuxconsole bbappend which does this, if =
you think it&#39;s useful I&#39;ll send patch for meta-oe to separate the p=
ackage here.</div><div><br></div><div>Cheers,</div></div></div>
<br>
<br>
<br>
</blockquote></div>

--000000000000eda47f05b746cd61--
