Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web12.152680.1598097092914942201
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 22 Aug 2020 04:51:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=c0YA5Olz;
 spf=pass (domain: gmail.com, ip: 209.85.208.42, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id l23so3727845edv.11
        for <openembedded-devel@lists.openembedded.org>; Sat, 22 Aug 2020 04:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=R/dQT9iUiQ3AdMMRCQq713o2qtIkNGJ6FCf9/PhUsDg=;
        b=c0YA5OlzVDgQkHevOfSbbhAO0Oobi0NQY/U2ayMMWNBSQF9QoQpRmCIepEvLJl9HUE
         rlk4xXRIreS9va9qL25U9ige5y221tq7bYdhpHBW6jPuyp1vT2lNz0nmpYB/Ra/i6PdL
         PXz1Dv4SQ3H/xzljhu9uNRmNbe0bJfiyxn4L+5iKihwn1zw3gmGNcVwx/RMqsSzh3gXT
         1z6UZkGC8ReeJUutAZnSau1ZjsNIGiaVuwWL2PLpmXTEXAJ+xXYRoZdYCI6ge9S8qaX1
         crbCXoVf7VI7L40eGy9CH5gejMEkKEzhUNHomZerkNzMeliN96vfE6J+MFzovNhRXNAS
         w9Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=R/dQT9iUiQ3AdMMRCQq713o2qtIkNGJ6FCf9/PhUsDg=;
        b=F5FX9jdxhA5+FdvjbvuszQG8chH+CwWR2rDuEVVz8p5NReMocm/xjdC3e1968ay8Tf
         ioQG3aFbkQBePtvmU1BJYZVG8bgGQXBta6v+Y1R9PCHtboiIivxfqD50oGjRQcHxJ02s
         jqGFros7OQV64k6cHJhpfSa0V7dplxr8sjyn+4LJ2h7lf50skM0rNN5YRHSWJtu9ur3C
         +5TlX4DGuxZm35R+wgTPLrpuHpEAOUJpTrwv2BfHiQePZiJGb4DfVFxbwycQZommkRWp
         wmWDgHHdQgqnU9AyatWNbm5WEoH4kfhgLvQ07+ADEVjbvxD4wrotWXGuSUMa/CSiMWr8
         5xZw==
X-Gm-Message-State: AOAM530+qsmePYujt6CI3y/BlHsne9KqKCVyq0ODe+f1O/wZeypRklLd
	+rfGdZMbdD5Mxy4xt+i/pbXkF/d/8fpR+9JO4MU=
X-Google-Smtp-Source: ABdhPJx4XYeiqizV1Fb+HFw1C2W340md+w+83uHoiy9aYaCeFkfpzrfkZd9bQjut5WjMe0mhcZg5hFl8bvCtHQ56JD8=
X-Received: by 2002:a50:ef09:: with SMTP id m9mr5618224eds.230.1598097091158;
 Sat, 22 Aug 2020 04:51:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200809063451.3326500-1-raj.khem@gmail.com>
In-Reply-To: <20200809063451.3326500-1-raj.khem@gmail.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Sat, 22 Aug 2020 13:51:19 +0200
Message-ID: <CA+chaQfA=CA4=mgHe49xeZpswhrQM71sa6MTd0726b9Kd2kN2g@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] iwd: Module load dir should be relative to root_dir
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000006f640f05ad75f99e"

--0000000000006f640f05ad75f99e
Content-Type: text/plain; charset="UTF-8"

It doesn't correctly respect nonarch_base_libdir variable when installing
the file.

With this change applied I'm seeing:
ERROR: iwd-1.8-r0 do_package: QA Issue: iwd: Files/directories were
installed but not shipped in any package:
  /usr/lib
  /usr/lib/modules-load.d
  /usr/lib/modules-load.d/pkcs8.conf
Please set FILES such that these items are packaged. Alternatively if they
are unneeded, avoid installing them or delete them within do_install.
iwd: 3 installed and not shipped files. [installed-vs-shipped]

possibly because of using usrmerge DISTRO_FEATURE in this build.

Will check and send follow-up.



On Sun, Aug 9, 2020 at 8:34 AM Khem Raj <raj.khem@gmail.com> wrote:

> This is autodetected by configure from systemd.pc and it depends on
> value of root_dir ( usrmerge ) and not /usr being hardcoded eg. in
> nonarch_libdir this has been fixed in systemd [1]
>
> Fixes
> ERROR: iwd-1.8-r0 do_package: QA Issue: iwd: Files/directories were
> installed but not shipped in any package:
> /lib/modules-load.d
> /lib/modules-load.d/pkcs8.conf
>
> [1]
> https://github.com/systemd/systemd/commit/4a56315a990b802860170ecd1bbd3eb68e14a38b
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta-oe/recipes-connectivity/iwd/iwd_1.8.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-connectivity/iwd/iwd_1.8.bb
> b/meta-oe/recipes-connectivity/iwd/iwd_1.8.bb
> index bfbf3c7fa6..b1e6fea2ff 100644
> --- a/meta-oe/recipes-connectivity/iwd/iwd_1.8.bb
> +++ b/meta-oe/recipes-connectivity/iwd/iwd_1.8.bb
> @@ -41,7 +41,7 @@ do_install_append() {
>
>  FILES_${PN} += " \
>      ${datadir}/dbus-1 \
> -    ${nonarch_libdir}/modules-load.d \
> +    ${nonarch_base_libdir}/modules-load.d \
>      ${systemd_unitdir}/network \
>  "
>
> --
> 2.28.0
>
> 
>

--0000000000006f640f05ad75f99e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">It doesn&#39;t correctly respect nonarch_=
base_libdir variable when installing the file.<div><br></div><div>With this=
 change applied I&#39;m seeing:</div><div>ERROR: iwd-1.8-r0 do_package: QA =
Issue: iwd: Files/directories were installed but not shipped in any package=
:<br>=C2=A0 /usr/lib<br>=C2=A0 /usr/lib/modules-load.d<br>=C2=A0 /usr/lib/m=
odules-load.d/pkcs8.conf<br>Please set FILES such that these items are pack=
aged. Alternatively if they are unneeded, avoid installing them or delete t=
hem within do_install.<br>iwd: 3 installed and not shipped files. [installe=
d-vs-shipped]<br></div><div><br></div><div>possibly because of using=C2=A0u=
srmerge DISTRO_FEATURE in this build.</div><div><br></div><div>Will check a=
nd send follow-up.</div><br><br></div></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sun, Aug 9, 2020 at 8:34 AM Khem R=
aj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">This is auto=
detected by configure from systemd.pc and it depends on<br>
value of root_dir ( usrmerge ) and not /usr being hardcoded eg. in<br>
nonarch_libdir this has been fixed in systemd [1]<br>
<br>
Fixes<br>
ERROR: iwd-1.8-r0 do_package: QA Issue: iwd: Files/directories were instal=
led but not shipped in any package:<br>
/lib/modules-load.d<br>
/lib/modules-load.d/pkcs8.conf<br>
<br>
[1] <a href=3D"https://github.com/systemd/systemd/commit/4a56315a990b80286=
0170ecd1bbd3eb68e14a38b" rel=3D"noreferrer" target=3D"_blank">https://githu=
b.com/systemd/systemd/commit/4a56315a990b802860170ecd1bbd3eb68e14a38b</a><b=
r>
<br>
Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta-oe/recipes-connectivity/iwd/<a href=3D"http://iwd_1.8.bb" rel=
=3D"noreferrer" target=3D"_blank">iwd_1.8.bb</a> | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta-oe/recipes-connectivity/iwd/<a href=3D"http://iwd_1.8.bb=
" rel=3D"noreferrer" target=3D"_blank">iwd_1.8.bb</a> b/meta-oe/recipes-con=
nectivity/iwd/<a href=3D"http://iwd_1.8.bb" rel=3D"noreferrer" target=3D"_b=
lank">iwd_1.8.bb</a><br>
index bfbf3c7fa6..b1e6fea2ff 100644<br>
--- a/meta-oe/recipes-connectivity/iwd/<a href=3D"http://iwd_1.8.bb" rel=
=3D"noreferrer" target=3D"_blank">iwd_1.8.bb</a><br>
+++ b/meta-oe/recipes-connectivity/iwd/<a href=3D"http://iwd_1.8.bb" rel=
=3D"noreferrer" target=3D"_blank">iwd_1.8.bb</a><br>
@@ -41,7 +41,7 @@ do_install_append() {<br>
<br>
=C2=A0FILES_${PN} +=3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0${datadir}/dbus-1 \<br>
-=C2=A0 =C2=A0 ${nonarch_libdir}/modules-load.d \<br>
+=C2=A0 =C2=A0 ${nonarch_base_libdir}/modules-load.d \<br>
=C2=A0 =C2=A0 =C2=A0${systemd_unitdir}/network \<br>
=C2=A0&quot;<br>
<br>
-- <br>
2.28.0<br>
<br>
<br>
</blockquote></div>

--0000000000006f640f05ad75f99e--
