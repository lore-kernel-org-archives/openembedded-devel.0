Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.web10.168791.1598153824957327900
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 22 Aug 2020 20:37:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=QG96gFHN;
 spf=pass (domain: gmail.com, ip: 209.85.222.169, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f169.google.com with SMTP id m7so4707859qki.12
        for <openembedded-devel@lists.openembedded.org>; Sat, 22 Aug 2020 20:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bs/2xm3Ud58S1/S+s+VZEzyJ1C5jE/gkBKYB0uPNtFU=;
        b=QG96gFHN11YeipJYJtpDwbTl3dVshThWyaUiM5gav2h/jVYsS4IWAEcP68Xf1gvxdA
         Nx1zfwvOe8e68veDsK9KssV1vZ9f6vqZ/qYoGD/+dyNbo2idKpZRi21cAIGro1vlGFoY
         79a0rA7eoeDOEtwqp1c+mpRzwwrwq9q3HrmD6WOFqQahPTNOc8cy1j7h3znbkLXmK2qa
         QX16i78NAqr0uIZ/q9XSg9dEFSBbRC5OB4fFJ5V8eLunA3Ih1sFh9kGmJo1WFyTNzf4S
         /YaKOZa1D7Kw8owt/rCmGEDKztmF7be1nFKDgEzO6lbhZd2Alm+8UnN/UYbmpBYcJbbi
         t9dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bs/2xm3Ud58S1/S+s+VZEzyJ1C5jE/gkBKYB0uPNtFU=;
        b=MlEoQQ6lxyvGEX76pf8Ip/iPIM1SJlNUHBTVVaZfbUB1rvESzpaQAulpO7Se8GHDBV
         d5ujkYz/G5bstJ3nLXSqrbGdhJaaNJt3AKuN/vtAByLexEjfn57Sn+S5ZRdtJx1xmvEr
         Zxeji4hKBim0/hCY4gJh3UVwBarJ6QFC5V75pua9IqM/05baD7K306WwPhKPYwuZMyjx
         4mKBMWOmteCId6OYBFeR6yfOKAEk0Rdnv1Iw2eclh4W7DEk+4Q88qq2/1Ed9SwztYbqK
         vBlVtcbgQqMsmTHstzdI3ViGSa1AC6gSR+/VIwT4v3Vl+BCqChMnPXj97B650RnO4fys
         kWKw==
X-Gm-Message-State: AOAM532TRoVbUBwkwLTUxOM0WFXBJYnuc5CmnidmDtsU3tgKOpwaPKBj
	9f5VfEE+Ww9nuIHR+BXZO+o+nNVWTfGdAItOmHQ=
X-Google-Smtp-Source: ABdhPJysCfykHVokTFU4+MvizaPfzNtJ56dM26vX59bbfIoDwwkXqWlzPmP+YNDtGyrKP5yAZTuSTKZhehkR/fpmBQw=
X-Received: by 2002:a37:9b15:: with SMTP id d21mr168617qke.9.1598153824014;
 Sat, 22 Aug 2020 20:37:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200809063451.3326500-1-raj.khem@gmail.com> <CA+chaQfA=CA4=mgHe49xeZpswhrQM71sa6MTd0726b9Kd2kN2g@mail.gmail.com>
In-Reply-To: <CA+chaQfA=CA4=mgHe49xeZpswhrQM71sa6MTd0726b9Kd2kN2g@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sat, 22 Aug 2020 20:36:53 -0700
Message-ID: <CAMKF1sr-eiAP_J6qeoibsFZPUFd6kRZ+se4Pnb1id7nR2B5-sw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] iwd: Module load dir should be relative to root_dir
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000fa187d05ad832e9e"

--000000000000fa187d05ad832e9e
Content-Type: text/plain; charset="UTF-8"

Yes I have a revert staged in master-next

On Sat, Aug 22, 2020 at 4:51 AM Martin Jansa <martin.jansa@gmail.com> wrote:

> It doesn't correctly respect nonarch_base_libdir variable when installing
> the file.
>
> With this change applied I'm seeing:
> ERROR: iwd-1.8-r0 do_package: QA Issue: iwd: Files/directories were
> installed but not shipped in any package:
>   /usr/lib
>   /usr/lib/modules-load.d
>   /usr/lib/modules-load.d/pkcs8.conf
> Please set FILES such that these items are packaged. Alternatively if they
> are unneeded, avoid installing them or delete them within do_install.
> iwd: 3 installed and not shipped files. [installed-vs-shipped]
>
> possibly because of using usrmerge DISTRO_FEATURE in this build.
>
> Will check and send follow-up.
>
>
>
> On Sun, Aug 9, 2020 at 8:34 AM Khem Raj <raj.khem@gmail.com> wrote:
>
>> This is autodetected by configure from systemd.pc and it depends on
>>
>>
>> value of root_dir ( usrmerge ) and not /usr being hardcoded eg. in
>>
>>
>> nonarch_libdir this has been fixed in systemd [1]
>>
>>
>>
>>
>>
>> Fixes
>>
>>
>> ERROR: iwd-1.8-r0 do_package: QA Issue: iwd: Files/directories were
>> installed but not shipped in any package:
>>
>>
>> /lib/modules-load.d
>>
>>
>> /lib/modules-load.d/pkcs8.conf
>>
>>
>>
>>
>>
>> [1]
>> https://github.com/systemd/systemd/commit/4a56315a990b802860170ecd1bbd3eb68e14a38b
>>
>>
>>
>>
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>
>>
>> ---
>>
>>
>>  meta-oe/recipes-connectivity/iwd/iwd_1.8.bb | 2 +-
>>
>>
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>>
>>
>>
>>
>> diff --git a/meta-oe/recipes-connectivity/iwd/iwd_1.8.bb
>> b/meta-oe/recipes-connectivity/iwd/iwd_1.8.bb
>>
>>
>> index bfbf3c7fa6..b1e6fea2ff 100644
>>
>>
>> --- a/meta-oe/recipes-connectivity/iwd/iwd_1.8.bb
>>
>>
>> +++ b/meta-oe/recipes-connectivity/iwd/iwd_1.8.bb
>>
>>
>> @@ -41,7 +41,7 @@ do_install_append() {
>>
>>
>>
>>
>>
>>  FILES_${PN} += " \
>>
>>
>>      ${datadir}/dbus-1 \
>>
>>
>> -    ${nonarch_libdir}/modules-load.d \
>>
>>
>> +    ${nonarch_base_libdir}/modules-load.d \
>>
>>
>>      ${systemd_unitdir}/network \
>>
>>
>>  "
>
>
>>
>>
>>
>>
>>
>> --
>>
>>
>> 2.28.0
>>
>>
>>
>>
>>
>> 
>>
>>
>>
>
>

--000000000000fa187d05ad832e9e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div dir=3D"auto">Yes I have a revert staged in master-next=C2=A0</div=
></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_=
attr">On Sat, Aug 22, 2020 at 4:51 AM Martin Jansa &lt;<a href=3D"mailto:ma=
rtin.jansa@gmail.com">martin.jansa@gmail.com</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-w=
idth:1px;border-left-style:solid;padding-left:1ex;border-left-color:rgb(204=
,204,204)"><div dir=3D"ltr"><div dir=3D"ltr">It doesn&#39;t correctly respe=
ct nonarch_base_libdir variable when installing the file.<div><br></div><di=
v>With this change applied I&#39;m seeing:</div><div>ERROR: iwd-1.8-r0 do_p=
ackage: QA Issue: iwd: Files/directories were installed but not shipped in =
any package:<br>=C2=A0 /usr/lib<br>=C2=A0 /usr/lib/modules-load.d<br>=C2=A0=
 /usr/lib/modules-load.d/pkcs8.conf<br>Please set FILES such that these ite=
ms are packaged. Alternatively if they are unneeded, avoid installing them =
or delete them within do_install.<br>iwd: 3 installed and not shipped files=
. [installed-vs-shipped]<br></div><div><br></div><div>possibly because of u=
sing=C2=A0usrmerge DISTRO_FEATURE in this build.</div><div><br></div><div>W=
ill check and send follow-up.</div><br><br></div></div><br><div class=3D"gm=
ail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Aug 9, 2020 at 8:3=
4 AM Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">r=
aj.khem@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:=
solid;padding-left:1ex;border-left-color:rgb(204,204,204)">This is autodete=
cted by configure from systemd.pc and it depends on<br><br><br>value of roo=
t_dir ( usrmerge ) and not /usr being hardcoded eg. in<br><br><br>nonarch_l=
ibdir this has been fixed in systemd [1]<br><br><br><br><br><br>Fixes<br><b=
r><br>ERROR: iwd-1.8-r0 do_package: QA Issue: iwd: Files/directories were i=
nstalled but not shipped in any package:<br><br><br>/lib/modules-load.d<br>=
<br><br>/lib/modules-load.d/pkcs8.conf<br><br><br><br><br><br>[1] <a href=
=3D"https://github.com/systemd/systemd/commit/4a56315a990b802860170ecd1bbd=
3eb68e14a38b" rel=3D"noreferrer" target=3D"_blank">https://github.com/syste=
md/systemd/commit/4a56315a990b802860170ecd1bbd3eb68e14a38b</a><br><br><br><=
br><br><br>Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com=
" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br><br><br>---<br><br><br>=
=C2=A0meta-oe/recipes-connectivity/iwd/<a href=3D"http://iwd_1.8.bb" rel=
=3D"noreferrer" target=3D"_blank">iwd_1.8.bb</a> | 2 +-<br><br><br>=C2=A01=
 file changed, 1 insertion(+), 1 deletion(-)<br><br><br><br><br><br>diff --=
git a/meta-oe/recipes-connectivity/iwd/<a href=3D"http://iwd_1.8.bb" rel=3D=
"noreferrer" target=3D"_blank">iwd_1.8.bb</a> b/meta-oe/recipes-connectivit=
y/iwd/<a href=3D"http://iwd_1.8.bb" rel=3D"noreferrer" target=3D"_blank">iw=
d_1.8.bb</a><br><br><br>index bfbf3c7fa6..b1e6fea2ff 100644<br><br><br>--- =
a/meta-oe/recipes-connectivity/iwd/<a href=3D"http://iwd_1.8.bb" rel=3D"nor=
eferrer" target=3D"_blank">iwd_1.8.bb</a><br><br><br>+++ b/meta-oe/recipes-=
connectivity/iwd/<a href=3D"http://iwd_1.8.bb" rel=3D"noreferrer" target=3D=
"_blank">iwd_1.8.bb</a><br><br><br>@@ -41,7 +41,7 @@ do_install_append() {<=
br><br><br><br><br><br>=C2=A0FILES_${PN} +=3D &quot; \<br><br><br>=C2=A0 =
=C2=A0 =C2=A0${datadir}/dbus-1 \<br><br><br>-=C2=A0 =C2=A0 ${nonarch_libdi=
r}/modules-load.d \<br><br><br>+=C2=A0 =C2=A0 ${nonarch_base_libdir}/module=
s-load.d \<br><br><br>=C2=A0 =C2=A0 =C2=A0${systemd_unitdir}/network \<br><=
br><br>=C2=A0&quot;</blockquote></div><div class=3D"gmail_quote"><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width=
:1px;border-left-style:solid;padding-left:1ex;border-left-color:rgb(204,204=
,204)"><br><br><br><br><br><br>-- <br><br><br>2.28.0<br><br><br><br><br><br=
><br><br><br></blockquote></div><br><br></blockquote></div></div>

--000000000000fa187d05ad832e9e--
