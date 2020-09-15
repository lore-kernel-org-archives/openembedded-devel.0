Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com [209.85.208.67])
 by mx.groups.io with SMTP id smtpd.web11.1394.1600188262138608538
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Sep 2020 09:44:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=YplR/IT9;
 spf=pass (domain: gmail.com, ip: 209.85.208.67, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f67.google.com with SMTP id j2so3685355eds.9
        for <openembedded-devel@lists.openembedded.org>; Tue, 15 Sep 2020 09:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=u3JD6Nat5sYZa5lP/0TwtyPljIyA/lpH9HT+ALcdwAs=;
        b=YplR/IT9Fsqoovm6o6Yl5BKAh9GBv8R1CPpnH3LNo72WXGikgb9GLmtSYtzSTlot1d
         ZrZljGpfQ1Wwh3xIutWL7k0KZOU3gfGvGGzN9e33yAyN4WKVOOLi+fiXvi3ZXKd/lbQO
         VCTX5KKbjLu2pP7vxXcjjy5mm/4LqZ56dvkaCs6cHAXQ0PjAyWOtqERlZvzICDiqhZK/
         xu4V41KUVM3NDcp9yE2q3ol+FEOAR58zuN5SGPwqMOPR4ti8b8Z2oq3KpN1vTQc57rkS
         ItXzPPf/AJsatJUBU0fHxE8LYzRS6ahk3UyKtsmUUUIlupxFOFLFoqxoFOBXrWoWQkbP
         DTXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=u3JD6Nat5sYZa5lP/0TwtyPljIyA/lpH9HT+ALcdwAs=;
        b=qp0GQ0MftcqKiq9UWKo2l72HhvedNSaLWGG3bHQAhTdPbcxQeMzgloVGTAkA2VDcTa
         A4jtElckrEYIedc8Jx8xudu0lFB3z4YnRS6PfhPyYWR88B3nZVJxerfOYnLizgo1bALS
         8eihjy8KLG0A8a5v3TOcaYfdpGb0aw0YniItY/jvnJhbj/SxShbOE/TQwt/adtaHvqJh
         kiLJu/9HLbpYff3PqxuCrjHzzsDy0lXGb88+v6I/NMG04VFx3e4qK2hLhE3m545nQvx1
         YZFHEKZtUiBuNpovgmIxW7+/lOKlZF3QCOj0xTZ0Y0HlCU1FmlfKUuyEJ8wQrF6xsUqP
         m2Nw==
X-Gm-Message-State: AOAM533RrNCaaj9HuQLCCG8bid51rvD741GI5CGSlyMWU8IY65ybqHc9
	vM4h+1l/iPz2odBHcsD02A8kmQkbL2EE69s+m20=
X-Google-Smtp-Source: ABdhPJysq+0f83AxJCViKVoXQjwIz/uTDEp+/8BBBo7gmi4u5SOLkHzXB3xg6U9X1KCaKgpa+59K5YNxcSxpDlC0gLM=
X-Received: by 2002:aa7:d059:: with SMTP id n25mr23271154edo.270.1600188260453;
 Tue, 15 Sep 2020 09:44:20 -0700 (PDT)
MIME-Version: 1.0
References: <1599830746-15250-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
In-Reply-To: <1599830746-15250-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Tue, 15 Sep 2020 18:44:09 +0200
Message-ID: <CA+chaQejzHcC14r5mxRMMmKR5wWnpEBmwzK0Zp=YFhRv+4eTtw@mail.gmail.com>
Subject: Re: [oe] [meta-oe] [PATCH] libhugetlbfs: upgrade 2.22 -> 2.23
To: zangrc <zangrc.fnst@cn.fujitsu.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000d6906705af5cdc21"

--000000000000d6906705af5cdc21
Content-Type: text/plain; charset="UTF-8"

This is somehow causing strip to fail when building for arm (I'm seeing it
e.g. in raspberrypi4 builds):

ERROR: libhugetlbfs-1_2.23-r0 do_populate_sysroot: Fatal errors occurred in
subprocesses:
Command '['arm-oe-linux-gnueabi-strip', '--remove-section=.comment',
'--remove-section=.note',
'libhugetlbfs/1_2.23-r0/sysroot-destdir/usr/lib/libhugetlbfs/tests/obj32/linkhuge_rw']'
returned non-zero exit status 1.
Subprocess output:arm-oe-linux-gnueabi-strip:
libhugetlbfs/1_2.23-r0/sysroot-destdir/usr/lib/libhugetlbfs/tests/obj32/stmuFa58:
error: PHDR segment not covered by LOAD segment
arm-oe-linux-gnueabi-strip:
libhugetlbfs/1_2.23-r0/sysroot-destdir/usr/lib/libhugetlbfs/tests/obj32/stmuFa58[.interp]:
file format not recognized

It might be reproducible only with ld-is-gold in DISTRO_FEATURES.

Can you please look into that?


On Fri, Sep 11, 2020 at 3:25 AM zangrc <zangrc.fnst@cn.fujitsu.com> wrote:

> 0001-tests-add-explicit-permissions-to-open-call.patch
> Removed since this is included in 2.23
>
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  ...dd-explicit-permissions-to-open-call.patch | 41 -------------------
>  .../libhugetlbfs/libhugetlbfs_git.bb          |  5 +--
>  2 files changed, 2 insertions(+), 44 deletions(-)
>  delete mode 100644
> meta-oe/recipes-benchmark/libhugetlbfs/files/0001-tests-add-explicit-permissions-to-open-call.patch
>
> diff --git
> a/meta-oe/recipes-benchmark/libhugetlbfs/files/0001-tests-add-explicit-permissions-to-open-call.patch
> b/meta-oe/recipes-benchmark/libhugetlbfs/files/0001-tests-add-explicit-permissions-to-open-call.patch
> deleted file mode 100644
> index 9d52b908e..000000000
> ---
> a/meta-oe/recipes-benchmark/libhugetlbfs/files/0001-tests-add-explicit-permissions-to-open-call.patch
> +++ /dev/null
> @@ -1,41 +0,0 @@
> -From d07d2f9601b49bb72cd4b36838f0c238bd1b0fc1 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Wed, 15 Jan 2020 18:45:09 -0800
> -Subject: [PATCH] tests: add explicit permissions to open() call
> -
> -Fixes
> -gethugepagesizes.c:227:35: error: open with O_CREAT in second argument
> needs 3 arguments
> -|         fd = open(fname, O_WRONLY|O_CREAT);
> -|                                          ^
> -
> -Upstream-Status: Submitted [
> https://groups.google.com/forum/#!topic/libhugetlbfs/anNtDXbQKro]
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - tests/gethugepagesizes.c | 4 ++--
> - 1 file changed, 2 insertions(+), 2 deletions(-)
> -
> -diff --git a/tests/gethugepagesizes.c b/tests/gethugepagesizes.c
> -index 9551b38..5777265 100644
> ---- a/tests/gethugepagesizes.c
> -+++ b/tests/gethugepagesizes.c
> -@@ -223,7 +223,7 @@ void setup_fake_data(long sizes[], int n_elem)
> -               FAIL("mkdtemp: %s", strerror(errno));
> -
> -       sprintf(fname, "%s/meminfo-none", fake_meminfo);
> --      fd = open(fname, O_WRONLY|O_CREAT);
> -+      fd = open(fname, O_WRONLY|O_CREAT, 0600);
> -       if (fd < 0)
> -               FAIL("open: %s", strerror(errno));
> -       if (write(fd, meminfo_base,
> -@@ -233,7 +233,7 @@ void setup_fake_data(long sizes[], int n_elem)
> -               FAIL("close: %s", strerror(errno));
> -
> -       sprintf(fname, "%s/meminfo-hugepages", fake_meminfo);
> --      fd = open(fname, O_WRONLY|O_CREAT);
> -+      fd = open(fname, O_WRONLY|O_CREAT, 0600);
> -       if (fd < 0)
> -               FAIL("open: %s", strerror(errno));
> -       if (write(fd, meminfo_base,
> ---
> -2.25.0
> -
> diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
> b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
> index 4768d7b63..b349096ec 100644
> --- a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
> +++ b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
> @@ -7,10 +7,10 @@ DEPENDS = "sysfsutils"
>  RDEPENDS_${PN} += "bash python3-core"
>  RDEPENDS_${PN}-tests += "bash python3-core"
>
> -PV = "2.22"
> +PV = "2.23"
>  PE = "1"
>
> -SRCREV = "e6499ff92b4a7dcffbd131d1f5d24933e48c3f20"
> +SRCREV = "6b126a4d7da9490fa40fe7e1b962edcb939feddc"
>  SRC_URI = " \
>      git://github.com/libhugetlbfs/libhugetlbfs.git;protocol=https \
>      file://skip-checking-LIB32-and-LIB64-if-they-point-to-the-s.patch \
> @@ -24,7 +24,6 @@ SRC_URI = " \
>      file://0004-shm.c-Mark-glibc-specific-changes-so.patch \
>      file://0005-Include-dirent.h-for-ino_t.patch \
>      file://0006-include-limits.h-for-PATH_MAX.patch \
> -    file://0001-tests-add-explicit-permissions-to-open-call.patch \
>      file://0001-huge_page_setup_helper-use-python3-interpreter.patch \
>  "
>
> --
> 2.25.1
>
>
>
> 
>

--000000000000d6906705af5cdc21
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This is somehow causing strip to fail when building for ar=
m (I&#39;m seeing it e.g. in raspberrypi4 builds):<div><br></div><div>ERROR=
: libhugetlbfs-1_2.23-r0 do_populate_sysroot: Fatal errors occurred in subp=
rocesses:<br>Command &#39;[&#39;arm-oe-linux-gnueabi-strip&#39;, &#39;--rem=
ove-section=3D.comment&#39;, &#39;--remove-section=3D.note&#39;, &#39;libhu=
getlbfs/1_2.23-r0/sysroot-destdir/usr/lib/libhugetlbfs/tests/obj32/linkhuge=
_rw&#39;]&#39; returned non-zero exit status 1.<br>Subprocess output:arm-oe=
-linux-gnueabi-strip: libhugetlbfs/1_2.23-r0/sysroot-destdir/usr/lib/libhug=
etlbfs/tests/obj32/stmuFa58: error: PHDR segment not covered by LOAD segmen=
t<br>arm-oe-linux-gnueabi-strip: libhugetlbfs/1_2.23-r0/sysroot-destdir/usr=
/lib/libhugetlbfs/tests/obj32/stmuFa58[.interp]: file format not recognized=
</div><div><br></div><div>It might be reproducible only with ld-is-gold in =
DISTRO_FEATURES.</div><div><br></div><div>Can you please look into that?<br=
><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"g=
mail_attr">On Fri, Sep 11, 2020 at 3:25 AM zangrc &lt;<a href=3D"mailto:zan=
grc.fnst@cn.fujitsu.com">zangrc.fnst@cn.fujitsu.com</a>&gt; wrote:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">0001-tests-add-explicit-=
permissions-to-open-call.patch<br>
Removed since this is included in 2.23<br>
<br>
Signed-off-by: Zang Ruochen &lt;<a href=3D"mailto:zangrc.fnst@cn.fujitsu.c=
om" target=3D"_blank">zangrc.fnst@cn.fujitsu.com</a>&gt;<br>
---<br>
=C2=A0...dd-explicit-permissions-to-open-call.patch | 41 -----------------=
--<br>
=C2=A0.../libhugetlbfs/<a href=3D"http://libhugetlbfs_git.bb" rel=3D"noref=
errer" target=3D"_blank">libhugetlbfs_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 5 +--<br>
=C2=A02 files changed, 2 insertions(+), 44 deletions(-)<br>
=C2=A0delete mode 100644 meta-oe/recipes-benchmark/libhugetlbfs/files/0001=
-tests-add-explicit-permissions-to-open-call.patch<br>
<br>
diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/files/0001-tests-add-e=
xplicit-permissions-to-open-call.patch b/meta-oe/recipes-benchmark/libhuget=
lbfs/files/0001-tests-add-explicit-permissions-to-open-call.patch<br>
deleted file mode 100644<br>
index 9d52b908e..000000000<br>
--- a/meta-oe/recipes-benchmark/libhugetlbfs/files/0001-tests-add-explicit=
-permissions-to-open-call.patch<br>
+++ /dev/null<br>
@@ -1,41 +0,0 @@<br>
-From d07d2f9601b49bb72cd4b36838f0c238bd1b0fc1 Mon Sep 17 00:00:00 2001<br=
>
-From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank=
">raj.khem@gmail.com</a>&gt;<br>
-Date: Wed, 15 Jan 2020 18:45:09 -0800<br>
-Subject: [PATCH] tests: add explicit permissions to open() call<br>
-<br>
-Fixes<br>
-gethugepagesizes.c:227:35: error: open with O_CREAT in second argument ne=
eds 3 arguments<br>
-|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fd =3D open(fname, O_WRONLY|O_CREAT);<=
br>
-|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ^<br>
-<br>
-Upstream-Status: Submitted [<a href=3D"https://groups.google.com/forum/#!=
topic/libhugetlbfs/anNtDXbQKro" rel=3D"noreferrer" target=3D"_blank">https:=
//groups.google.com/forum/#!topic/libhugetlbfs/anNtDXbQKro</a>]<br>
-Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
----<br>
- tests/gethugepagesizes.c | 4 ++--<br>
- 1 file changed, 2 insertions(+), 2 deletions(-)<br>
-<br>
-diff --git a/tests/gethugepagesizes.c b/tests/gethugepagesizes.c<br>
-index 9551b38..5777265 100644<br>
---- a/tests/gethugepagesizes.c<br>
-+++ b/tests/gethugepagesizes.c<br>
-@@ -223,7 +223,7 @@ void setup_fake_data(long sizes[], int n_elem)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0FAIL(&quot;mkdtemp=
: %s&quot;, strerror(errno));<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0sprintf(fname, &quot;%s/meminfo-none&quot;, fa=
ke_meminfo);<br>
--=C2=A0 =C2=A0 =C2=A0 fd =3D open(fname, O_WRONLY|O_CREAT);<br>
-+=C2=A0 =C2=A0 =C2=A0 fd =3D open(fname, O_WRONLY|O_CREAT, 0600);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (fd &lt; 0)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0FAIL(&quot;open: %=
s&quot;, strerror(errno));<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (write(fd, meminfo_base,<br>
-@@ -233,7 +233,7 @@ void setup_fake_data(long sizes[], int n_elem)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0FAIL(&quot;close: =
%s&quot;, strerror(errno));<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0sprintf(fname, &quot;%s/meminfo-hugepages&quot=
;, fake_meminfo);<br>
--=C2=A0 =C2=A0 =C2=A0 fd =3D open(fname, O_WRONLY|O_CREAT);<br>
-+=C2=A0 =C2=A0 =C2=A0 fd =3D open(fname, O_WRONLY|O_CREAT, 0600);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (fd &lt; 0)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0FAIL(&quot;open: %=
s&quot;, strerror(errno));<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (write(fd, meminfo_base,<br>
--- <br>
-2.25.0<br>
-<br>
diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/<a href=3D"http://libh=
ugetlbfs_git.bb" rel=3D"noreferrer" target=3D"_blank">libhugetlbfs_git.bb</=
a> b/meta-oe/recipes-benchmark/libhugetlbfs/<a href=3D"http://libhugetlbfs_=
git.bb" rel=3D"noreferrer" target=3D"_blank">libhugetlbfs_git.bb</a><br>
index 4768d7b63..b349096ec 100644<br>
--- a/meta-oe/recipes-benchmark/libhugetlbfs/<a href=3D"http://libhugetlbf=
s_git.bb" rel=3D"noreferrer" target=3D"_blank">libhugetlbfs_git.bb</a><br>
+++ b/meta-oe/recipes-benchmark/libhugetlbfs/<a href=3D"http://libhugetlbf=
s_git.bb" rel=3D"noreferrer" target=3D"_blank">libhugetlbfs_git.bb</a><br>
@@ -7,10 +7,10 @@ DEPENDS =3D &quot;sysfsutils&quot;<br>
=C2=A0RDEPENDS_${PN} +=3D &quot;bash python3-core&quot;<br>
=C2=A0RDEPENDS_${PN}-tests +=3D &quot;bash python3-core&quot;<br>
<br>
-PV =3D &quot;2.22&quot;<br>
+PV =3D &quot;2.23&quot;<br>
=C2=A0PE =3D &quot;1&quot;<br>
<br>
-SRCREV =3D &quot;e6499ff92b4a7dcffbd131d1f5d24933e48c3f20&quot;<br>
+SRCREV =3D &quot;6b126a4d7da9490fa40fe7e1b962edcb939feddc&quot;<br>
=C2=A0SRC_URI =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0git://<a href=3D"http://github.com/libhugetlbfs/libhug=
etlbfs.git;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_blank">github.co=
m/libhugetlbfs/libhugetlbfs.git;protocol=3Dhttps</a> \<br>
=C2=A0 =C2=A0 =C2=A0file://skip-checking-LIB32-and-LIB64-if-they-point-to-=
the-s.patch \<br>
@@ -24,7 +24,6 @@ SRC_URI =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0file://0004-shm.c-Mark-glibc-specific-changes-so.patch=
 \<br>
=C2=A0 =C2=A0 =C2=A0file://0005-Include-dirent.h-for-ino_t.patch \<br>
=C2=A0 =C2=A0 =C2=A0file://0006-include-limits.h-for-PATH_MAX.patch \<br>
-=C2=A0 =C2=A0 file://0001-tests-add-explicit-permissions-to-open-call.pat=
ch \<br>
=C2=A0 =C2=A0 =C2=A0file://0001-huge_page_setup_helper-use-python3-interpr=
eter.patch \<br>
=C2=A0&quot;<br>
<br>
-- <br>
2.25.1<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--000000000000d6906705af5cdc21--
