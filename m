Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web12.18187.1607104485537190737
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 04 Dec 2020 09:54:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WP7+nJ45;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id jx16so9888488ejb.10
        for <openembedded-devel@lists.openembedded.org>; Fri, 04 Dec 2020 09:54:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vnRNIFSMpEfxMSCnx6dplW19Y5EricihbMhsfSB9yXE=;
        b=WP7+nJ45t80sgDi75A7dAomzjGSTSMw3jR8uMjrCV1CYunAdo2CcOeDQVs3U4I/JaX
         jSz7Ua+5/Z5pzuNvBAhO8/lRTAA5fU3J+g25yUTCTsumTOPhk6HjIOH/EVwuux8j9xiB
         blMjFJlE5BzUXAxsoBSiSZiC+w/gDdNTCs2dOOvQNOYR4rUaiaxJ5F65sqwH2QjGg+Vd
         tVHxnW4FbX3KqPvKhU51tILEtQxZRzsGg+iltjnzIcF64S4hIWQWqC2ZxymF6fqJsiTM
         dlvKUUGy/MBhy15SuvmbbxpZgWpoVBpU/6bi1AgnKuuMbpl9X8abjc0qiQXdPLYkuZmN
         G2Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vnRNIFSMpEfxMSCnx6dplW19Y5EricihbMhsfSB9yXE=;
        b=gzb9vmRjK9k50WRop8QmAhg3suWF4oGy75LWo5gaYq1Pc5CcyNmUdtXDFHzHPpFZn8
         gCCmQmYGmgO6VOmsjtNtpwPcNjRF5UZ0yOzD87zmb/2+pYN1sNwsu/5+iGeYeSh4HhfG
         VabuC6NpXk0MZJ6w1WTv6mmrU6Afa2JNv/PCHzKphjOlEpt2I25BQnloA0wAMUmM5HXp
         CYaZY7Clg8nVqfv8rP36O55HpK0nJm+ax2zzagFNKaQsy8UaH7wnK6jhhv3c6ojxFbPE
         uIgoreYxpVxU7JYs9DDeeErIc5gboAUFsatL/MT6hooHrkaEwGQkEDfrpXuU8lKEyYdH
         VfNQ==
X-Gm-Message-State: AOAM5319vdRelYoVyKjDvzVAjI8DYaB/2n2fyrJsqEZbzPbr1uk6Mh3i
	Kg6ZbBEKg5b8QxUnA6XH83OWNxDi85EJr7ZMtPU=
X-Google-Smtp-Source: ABdhPJxJZrFD20nndMFYz+RmzHnF2+eyuA0uW95MStL2BqUI992TboVBaJXo6IoxO4kIh+Lu2kH7ubrTt0mdHHrflOQ=
X-Received: by 2002:a17:907:444f:: with SMTP id on23mr8347114ejb.300.1607104483722;
 Fri, 04 Dec 2020 09:54:43 -0800 (PST)
MIME-Version: 1.0
References: <1607101539-25986-1-git-send-email-r.karszniewicz@phytec.de>
In-Reply-To: <1607101539-25986-1-git-send-email-r.karszniewicz@phytec.de>
From: "Jose Quaresma" <quaresma.jose@gmail.com>
Date: Fri, 4 Dec 2020 17:54:32 +0000
Message-ID: <CANPvuR=hxwotgoEE=MS+mTf7zJLRREBjQ+7QnNBANRYgkbGtag@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] firmwared: add recipe
To: Robert Karszniewicz <r.karszniewicz@phytec.de>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000de89ce05b5a72bf5"

--000000000000de89ce05b5a72bf5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Robert Karszniewicz <r.karszniewicz@phytec.de> escreveu no dia sexta,
4/12/2020 =C3=A0(s) 17:05:

> This program is needed for loading external firmware via Linux' fallback
> mechanism.
>
> Signed-off-by: Robert Karszniewicz <r.karszniewicz@phytec.de>
> ---
> I wasn't sure which subdirectory to put it in, but I picked recipes-bsp.
> Thanks.
>
>  .../firmwared/firmwared/firmwared.service          |  9 +++++++
>  meta-oe/recipes-bsp/firmwared/firmwared_git.bb     | 29
> ++++++++++++++++++++++
>  2 files changed, 38 insertions(+)
>  create mode 100644
> meta-oe/recipes-bsp/firmwared/firmwared/firmwared.service
>  create mode 100644 meta-oe/recipes-bsp/firmwared/firmwared_git.bb
>
> diff --git a/meta-oe/recipes-bsp/firmwared/firmwared/firmwared.service
> b/meta-oe/recipes-bsp/firmwared/firmwared/firmwared.service
> new file mode 100644
> index 000000000000..c2106a25168c
> --- /dev/null
> +++ b/meta-oe/recipes-bsp/firmwared/firmwared/firmwared.service
> @@ -0,0 +1,9 @@
> +[Unit]
> +Description=3DLinux Firmware Loader Daemon
> +
> +[Service]
> +Type=3Dsimple
> +ExecStart=3D@BINDIR@/firmwared -d /lib/firmware
> +
> +[Install]
> +WantedBy=3Dmulti-user.target
> diff --git a/meta-oe/recipes-bsp/firmwared/firmwared_git.bb
> b/meta-oe/recipes-bsp/firmwared/firmwared_git.bb
> new file mode 100644
> index 000000000000..3b2a8070bdd3
> --- /dev/null
> +++ b/meta-oe/recipes-bsp/firmwared/firmwared_git.bb
> @@ -0,0 +1,29 @@
> +SUMMARY =3D "Linux Firmware Loader Daemon"
> +DESCRIPTION =3D "The Linux Firmware Loader Daemon monitors the kernel f=
or \
> +firmware requests and uploads the firmware blobs it has via the sysfs \
> +interface."
> +HOMEPAGE =3D "https://github.com/teg/firmwared"
> +PR =3D "r0"
> +LICENSE =3D "Apache-2.0"
> +LIC_FILES_CHKSUM =3D
> "file://LICENSE-APACHE;md5=3D7b486c2338d225a1405d979ed2c15ce8 \
> +                    file://COPYING;md5=3Ddaa868b8e1ae17d03228a1145b4060=
da"
> +
> +SRC_URI =3D "git://github.com/teg/firmwared.git \
> +           file://firmwared.service"
> +
> +PV =3D "1+git${SRCPV}"
> +SRCREV =3D "2e6b5db43d63a5c0283a4cae9a6a20b7ad107a04"
> +
> +S =3D "${WORKDIR}/git"
> +
> +DEPENDS =3D "glib-2.0 systemd"
> +
> +inherit pkgconfig autotools systemd
> +
> +SYSTEMD_SERVICE_${PN} =3D "firmwared.service"
> +
> +do_install_append() {
> +    install -d ${D}${systemd_unitdir}/system
> +    install -m 0644 ${WORKDIR}/firmwared.service
> ${D}${systemd_unitdir}/system
>

you can using systemd_system_unitdir

-install -m 0644 ${WORKDIR}/firmwared.service ${D}${systemd_unitdir}/syste=
m
+install -m 0644 ${WORKDIR}/firmwared.service ${D}${systemd_system_unitdir=
}

+    sed -i -e 's,@BINDIR@,${bindir},g'
> ${D}${systemd_unitdir}/system/firmwared.service
> +}
> --
> 2.7.4
>
>
>=20
>
>

--=20
best regards,
Jos=C3=A9 Quaresma

--000000000000de89ce05b5a72bf5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Robert Karszniewicz &lt;<a href=3D"ma=
ilto:r.karszniewicz@phytec.de">r.karszniewicz@phytec.de</a>&gt; escreveu no=
 dia sexta, 4/12/2020 =C3=A0(s) 17:05:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">This program is needed for loading external firmware=
 via Linux&#39; fallback<br>
mechanism.<br>
<br>
Signed-off-by: Robert Karszniewicz &lt;<a href=3D"mailto:r.karszniewicz@ph=
ytec.de" target=3D"_blank">r.karszniewicz@phytec.de</a>&gt;<br>
---<br>
I wasn&#39;t sure which subdirectory to put it in, but I picked recipes-bs=
p.<br>
Thanks.<br>
<br>
=C2=A0.../firmwared/firmwared/firmwared.service=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 9 +++++++<br>
=C2=A0meta-oe/recipes-bsp/firmwared/<a href=3D"http://firmwared_git.bb" re=
l=3D"noreferrer" target=3D"_blank">firmwared_git.bb</a>=C2=A0 =C2=A0 =C2=A0=
| 29 ++++++++++++++++++++++<br>
=C2=A02 files changed, 38 insertions(+)<br>
=C2=A0create mode 100644 meta-oe/recipes-bsp/firmwared/firmwared/firmwared=
.service<br>
=C2=A0create mode 100644 meta-oe/recipes-bsp/firmwared/<a href=3D"http://f=
irmwared_git.bb" rel=3D"noreferrer" target=3D"_blank">firmwared_git.bb</a><=
br>
<br>
diff --git a/meta-oe/recipes-bsp/firmwared/firmwared/firmwared.service b/m=
eta-oe/recipes-bsp/firmwared/firmwared/firmwared.service<br>
new file mode 100644<br>
index 000000000000..c2106a25168c<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-bsp/firmwared/firmwared/firmwared.service<br>
@@ -0,0 +1,9 @@<br>
+[Unit]<br>
+Description=3DLinux Firmware Loader Daemon<br>
+<br>
+[Service]<br>
+Type=3Dsimple<br>
+ExecStart=3D@BINDIR@/firmwared -d /lib/firmware<br>
+<br>
+[Install]<br>
+WantedBy=3Dmulti-user.target<br>
diff --git a/meta-oe/recipes-bsp/firmwared/<a href=3D"http://firmwared_git=
.bb" rel=3D"noreferrer" target=3D"_blank">firmwared_git.bb</a> b/meta-oe/re=
cipes-bsp/firmwared/<a href=3D"http://firmwared_git.bb" rel=3D"noreferrer" =
target=3D"_blank">firmwared_git.bb</a><br>
new file mode 100644<br>
index 000000000000..3b2a8070bdd3<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-bsp/firmwared/<a href=3D"http://firmwared_git.bb" re=
l=3D"noreferrer" target=3D"_blank">firmwared_git.bb</a><br>
@@ -0,0 +1,29 @@<br>
+SUMMARY =3D &quot;Linux Firmware Loader Daemon&quot;<br>
+DESCRIPTION =3D &quot;The Linux Firmware Loader Daemon monitors the kerne=
l for \<br>
+firmware requests and uploads the firmware blobs it has via the sysfs \<b=
r>
+interface.&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"https://github.com/teg/firmwared" rel=3D"no=
referrer" target=3D"_blank">https://github.com/teg/firmwared</a>&quot;<br>
+PR =3D &quot;r0&quot;<br>
+LICENSE =3D &quot;Apache-2.0&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE-APACHE;md5=3D7b486c2338d225a140=
5d979ed2c15ce8 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fil=
e://COPYING;md5=3Ddaa868b8e1ae17d03228a1145b4060da&quot;<br>
+<br>
+SRC_URI =3D &quot;git://<a href=3D"http://github.com/teg/firmwared.git" r=
el=3D"noreferrer" target=3D"_blank">github.com/teg/firmwared.git</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://firmwared.service&quot;<b=
r>
+<br>
+PV =3D &quot;1+git${SRCPV}&quot;<br>
+SRCREV =3D &quot;2e6b5db43d63a5c0283a4cae9a6a20b7ad107a04&quot;<br>
+<br>
+S =3D &quot;${WORKDIR}/git&quot;<br>
+<br>
+DEPENDS =3D &quot;glib-2.0 systemd&quot;<br>
+<br>
+inherit pkgconfig autotools systemd<br>
+<br>
+SYSTEMD_SERVICE_${PN} =3D &quot;firmwared.service&quot;<br>
+<br>
+do_install_append() {<br>
+=C2=A0 =C2=A0 install -d ${D}${systemd_unitdir}/system<br>
+=C2=A0 =C2=A0 install -m 0644 ${WORKDIR}/firmwared.service ${D}${systemd_=
unitdir}/system<br></blockquote><div><br></div><div>you can using systemd_s=
ystem_unitdir<br></div><div><br></div><div>-install -m 0644 ${WORKDIR}/firm=
wared.service ${D}${systemd_unitdir}/system<br></div><div>+install -m 0644 =
${WORKDIR}/firmwared.service ${D}${<span style=3D"color:rgb(0,0,0)">systemd=
_system_unitdir</span>}</div><div><br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">
+=C2=A0 =C2=A0 sed -i -e &#39;s,@BINDIR@,${bindir},g&#39; ${D}${systemd_un=
itdir}/system/firmwared.service<br>
+}<br>
-- <br>
2.7.4<br>
<br>
<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr=
" class=3D"gmail_signature"><div dir=3D"ltr">best regards,<br>Jos=C3=A9 Qua=
resma</div></div></div>

--000000000000de89ce05b5a72bf5--
