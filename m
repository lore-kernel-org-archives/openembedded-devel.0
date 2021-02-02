Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web09.54359.1612282409990569825
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Feb 2021 08:13:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=nJJCG5DD;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id a9so12435344ejr.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 02 Feb 2021 08:13:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2OlpzxJ+6ts5lW3/iIlYlbiTfqTPTW5a0lR+3w4xORg=;
        b=nJJCG5DD/urX0Q7GdSsevAw/Iw5f0qWG6YeEV+m3R6Wyv0tPZqCNk872XBkIaM64tL
         yXcPkt8Vv4/70Ky8WM+Bfw5J4TkWJReqJtYYfZxIXybz9V8zZqfovB/dpQATIMxG8/yZ
         inL7CLZzRH3oQZiRxZhz0x/Ccqw3IrmcDA9ECSJ7V2xgUvQ3enP/QHLktRLNpLTOzA87
         aiHhBNJqYszR7Wr++4TGyJ72V9mARe+5wZuFbw8m7D2sV9gcOiG+6WsxuLTPnSr4p9rK
         A0t4vj6YZ/sbhtobJL343+CrIHPHjbf4ilCPe2X7mhRhBnsDXXLcew3+ePaarT5lkyre
         Y4bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2OlpzxJ+6ts5lW3/iIlYlbiTfqTPTW5a0lR+3w4xORg=;
        b=iKaTsTqRADV1bms4TdMJWd9Ra2DcHg2VzxM9pTi5BeZlKfVyl7mz0kAoy5pnC3hmYK
         bN7x4FnrQ9wsPTeB4Z4O6sIIBwXBj/oxEWBSztnz0VMvwGqO3A/aHAvj49ZqwUMiU4q0
         HL2Y7VyvRORoctk+uNGLEvhce7KbYiS7yc5ClZndO8DJ86hJPK3y3yl0km6hwWvCJP6I
         p2e8DxhsjjYB+Wh6/k3BTMF5wVbf9PPyfEVamhcTXxp2cVk0avdPU2r4iaNQOljmKwT4
         0YEXMgkUE2FWDWLKoDmAsT2x84bZQsJItpMYS6NvioSaCKrqS7qsi2nCKO4sCGI/MISe
         tAmw==
X-Gm-Message-State: AOAM531BAJnSzCkUQUNZV93BczlwRavjxD1IYJ8Wf/1SArct8lesROPA
	MfjUuVisKb4a5ECEHAYglYl2YFtYuYU5zvG54k2w5yxEMdh8LA==
X-Google-Smtp-Source: ABdhPJxU0eJP4llvn9b1ou93f2d+lEEm2mI4GTcVtJBaRoamlcm5YNQJ9Ux+gCFQje1gDdqiHa6yq1auXTq+die+a7E=
X-Received: by 2002:a17:906:8053:: with SMTP id x19mr13067412ejw.470.1612282408411;
 Tue, 02 Feb 2021 08:13:28 -0800 (PST)
MIME-Version: 1.0
References: <20210129093909.95809-1-mingli.yu@windriver.com>
In-Reply-To: <20210129093909.95809-1-mingli.yu@windriver.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Tue, 2 Feb 2021 17:13:17 +0100
Message-ID: <CA+chaQdxEC9Gut0wQzbTLhq71y207ENz+cMpkwmu3E9rEye-TA@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH] net-snmp: improve reproducibility
To: "Yu, Mingli" <mingli.yu@windriver.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000003b24a505ba5cc07b"

--0000000000003b24a505ba5cc07b
Content-Type: text/plain; charset="UTF-8"

dash doesn't like this:
sed: can't read
net-snmp/5.9-r0/image/usr/lib/pkgconfig/{netsnmp-agent.pc,netsnmp.pc}: No
such file or directory

will send a fix shortly

On Fri, Jan 29, 2021 at 10:39 AM Yu, Mingli <mingli.yu@windriver.com> wrote:

> From: Mingli Yu <mingli.yu@windriver.com>
>
> Add a patch to fix the gap between 32bit and 64bit system when
> the configure option "--with-openssl=${STAGING_EXECPREFIXDIR}"
> passed in.
>
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>  ...ath.m4-keep-consistent-between-32bit.patch | 39 +++++++++++++++++++
>  .../net-snmp/net-snmp_5.9.bb                  |  7 +++-
>  2 files changed, 44 insertions(+), 2 deletions(-)
>  create mode 100644
> meta-networking/recipes-protocols/net-snmp/net-snmp/0001-ac_add_search_path.m4-keep-consistent-between-32bit.patch
>
> diff --git
> a/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-ac_add_search_path.m4-keep-consistent-between-32bit.patch
> b/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-ac_add_search_path.m4-keep-consistent-between-32bit.patch
> new file mode 100644
> index 000000000..4cd729044
> --- /dev/null
> +++
> b/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-ac_add_search_path.m4-keep-consistent-between-32bit.patch
> @@ -0,0 +1,39 @@
> +From 6f8ea2e841ad45eed193310b599d3f3b410ae91d Mon Sep 17 00:00:00 2001
> +From: Mingli Yu <mingli.yu@windriver.com>
> +Date: Fri, 29 Jan 2021 08:49:15 +0000
> +Subject: [PATCH] ac_add_search_path.m4: keep consistent between 32bit and
> 64bit
> +
> +With configure option "--with-openssl=${STAGING_EXECPREFIXDIR}", it
> behaves
> +differently between 32bit and 64bit system as the openssl lib resides
> under
>
> +/build/tmp/work/corei7-64-wrs-linux/net-snmp/5.9-r0/recipe-sysroot/usr/lib64
> +for 64bit system, but resides under [1] for 32bit system.
> +
> +So add the patch to fix the gap between 32bit and 64bit system.
> +
> +[1]
> /build/tmp/work/corei7-64-wrs-linux/net-snmp/5.9-r0/recipe-sysroot/usr/lib
> +
> +Upstream-Status: Inappropriate [configuration specific]
> +
> +Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> +---
> + m4/ac_add_search_path.m4 | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/m4/ac_add_search_path.m4 b/m4/ac_add_search_path.m4
> +index 8e0a819..961f587 100644
> +--- a/m4/ac_add_search_path.m4
> ++++ b/m4/ac_add_search_path.m4
> +@@ -3,8 +3,8 @@ dnl Add a search path to the LIBS and CPPFLAGS variables
> + dnl
> + AC_DEFUN([AC_ADD_SEARCH_PATH],[
> +   if test "x$1" != x -a -d $1; then
> +-     if test -d $1/lib; then
> +-       LDFLAGS="-L$1/lib $LDFLAGS"
> ++     if test -d $1/${libdir:5}; then
> ++       LDFLAGS="-L$1/${libdir:5} $LDFLAGS"
> +      fi
> +      if test -d $1/include; then
> +       CPPFLAGS="-I$1/include $CPPFLAGS"
> +--
> +2.29.2
> +
> diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.bb
> b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.bb
> index bee83c4d1..ac78ed2d5 100644
> --- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.bb
> +++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.bb
> @@ -25,6 +25,7 @@ SRC_URI =
> "${SOURCEFORGE_MIRROR}/net-snmp/net-snmp-${PV}.tar.gz \
>             file://net-snmp-5.7.2-fix-engineBoots-value-on-SIGHUP.patch \
>             file://net-snmp-fix-for-disable-des.patch \
>             file://reproducibility-have-printcap.patch \
> +
>  file://0001-ac_add_search_path.m4-keep-consistent-between-32bit.patch \
>             "
>  SRC_URI[sha256sum] =
> "04303a66f85d6d8b16d3cc53bde50428877c82ab524e17591dfceaeb94df6071"
>
> @@ -128,10 +129,12 @@ do_install_append() {
>          -e 's@[^ ]*--with-install-prefix=[^ "]*@@g' \
>          -e 's@[^ ]*PKG_CONFIG_PATH=[^ "]*@@g' \
>          -e 's@[^ ]*PKG_CONFIG_LIBDIR=[^ "]*@@g' \
> -        -e 's@-L${STAGING_DIR_HOST}${libdir}@@g' \
> -        -e 's@-I${STAGING_DIR_HOST}${includedir}@@g' \
> +        -e 's@${STAGING_DIR_HOST}@@g' \
>          -i ${D}${bindir}/net-snmp-config
>
> +    sed -e 's@${STAGING_DIR_HOST}@@g' \
> +        -i ${D}${libdir}/pkgconfig/{netsnmp-agent.pc,netsnmp.pc}
> +
>      if [ "${HAS_PERL}" = "1" ]; then
>          sed -e "s@^NSC_INCLUDEDIR=.*@NSC_INCLUDEDIR=\$\{includedir\}@g" \
>              -e "s@^NSC_LIBDIR=-L.*@NSC_LIBDIR=-L\$\{libdir\}@g" \
> --
> 2.17.1
>
>
> 
>
>

--0000000000003b24a505ba5cc07b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">dash doesn&#39;t like this:<div>sed: can&#39;t read net-sn=
mp/5.9-r0/image/usr/lib/pkgconfig/{netsnmp-agent.pc,netsnmp.pc}: No such fi=
le or directory<br></div><div><br></div><div>will send a fix shortly</div><=
/div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">O=
n Fri, Jan 29, 2021 at 10:39 AM Yu, Mingli &lt;<a href=3D"mailto:mingli.yu@=
windriver.com">mingli.yu@windriver.com</a>&gt; wrote:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">From: Mingli Yu &lt;<a href=3D"mailto=
:mingli.yu@windriver.com" target=3D"_blank">mingli.yu@windriver.com</a>&gt;=
<br>
<br>
Add a patch to fix the gap between 32bit and 64bit system when<br>
the configure option &quot;--with-openssl=3D${STAGING_EXECPREFIXDIR}&quot;=
<br>
passed in.<br>
<br>
Signed-off-by: Mingli Yu &lt;<a href=3D"mailto:mingli.yu@windriver.com" ta=
rget=3D"_blank">mingli.yu@windriver.com</a>&gt;<br>
---<br>
=C2=A0...ath.m4-keep-consistent-between-32bit.patch | 39 +++++++++++++++++=
++<br>
=C2=A0.../net-snmp/<a href=3D"http://net-snmp_5.9.bb" rel=3D"noreferrer" t=
arget=3D"_blank">net-snmp_5.9.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 7 +++-<br>
=C2=A02 files changed, 44 insertions(+), 2 deletions(-)<br>
=C2=A0create mode 100644 meta-networking/recipes-protocols/net-snmp/net-sn=
mp/0001-ac_add_search_path.m4-keep-consistent-between-32bit.patch<br>
<br>
diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-ac_a=
dd_search_path.m4-keep-consistent-between-32bit.patch b/meta-networking/rec=
ipes-protocols/net-snmp/net-snmp/0001-ac_add_search_path.m4-keep-consistent=
-between-32bit.patch<br>
new file mode 100644<br>
index 000000000..4cd729044<br>
--- /dev/null<br>
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-ac_add_sear=
ch_path.m4-keep-consistent-between-32bit.patch<br>
@@ -0,0 +1,39 @@<br>
+From 6f8ea2e841ad45eed193310b599d3f3b410ae91d Mon Sep 17 00:00:00 2001<br=
>
+From: Mingli Yu &lt;<a href=3D"mailto:mingli.yu@windriver.com" target=3D"=
_blank">mingli.yu@windriver.com</a>&gt;<br>
+Date: Fri, 29 Jan 2021 08:49:15 +0000<br>
+Subject: [PATCH] ac_add_search_path.m4: keep consistent between 32bit and=
 64bit<br>
+<br>
+With configure option &quot;--with-openssl=3D${STAGING_EXECPREFIXDIR}&quo=
t;, it behaves<br>
+differently between 32bit and 64bit system as the openssl lib resides und=
er<br>
+/build/tmp/work/corei7-64-wrs-linux/net-snmp/5.9-r0/recipe-sysroot/usr/li=
b64<br>
+for 64bit system, but resides under [1] for 32bit system.<br>
+<br>
+So add the patch to fix the gap between 32bit and 64bit system.<br>
+<br>
+[1] /build/tmp/work/corei7-64-wrs-linux/net-snmp/5.9-r0/recipe-sysroot/us=
r/lib<br>
+<br>
+Upstream-Status: Inappropriate [configuration specific]<br>
+<br>
+Signed-off-by: Mingli Yu &lt;<a href=3D"mailto:mingli.yu@windriver.com" t=
arget=3D"_blank">mingli.yu@windriver.com</a>&gt;<br>
+---<br>
+ m4/ac_add_search_path.m4 | 4 ++--<br>
+ 1 file changed, 2 insertions(+), 2 deletions(-)<br>
+<br>
+diff --git a/m4/ac_add_search_path.m4 b/m4/ac_add_search_path.m4<br>
+index 8e0a819..961f587 100644<br>
+--- a/m4/ac_add_search_path.m4<br>
++++ b/m4/ac_add_search_path.m4<br>
+@@ -3,8 +3,8 @@ dnl Add a search path to the LIBS and CPPFLAGS variables<=
br>
+ dnl<br>
+ AC_DEFUN([AC_ADD_SEARCH_PATH],[<br>
+=C2=A0 =C2=A0if test &quot;x$1&quot; !=3D x -a -d $1; then<br>
+-=C2=A0 =C2=A0 =C2=A0if test -d $1/lib; then<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0LDFLAGS=3D&quot;-L$1/lib $LDFLAGS&quot;<br>
++=C2=A0 =C2=A0 =C2=A0if test -d $1/${libdir:5}; then<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0LDFLAGS=3D&quot;-L$1/${libdir:5} $LDFLAGS&quo=
t;<br>
+=C2=A0 =C2=A0 =C2=A0 fi<br>
+=C2=A0 =C2=A0 =C2=A0 if test -d $1/include; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0CPPFLAGS=3D&quot;-I$1/include $CPPFLAGS&quot;<=
br>
+-- <br>
+2.29.2<br>
+<br>
diff --git a/meta-networking/recipes-protocols/net-snmp/<a href=3D"http://=
net-snmp_5.9.bb" rel=3D"noreferrer" target=3D"_blank">net-snmp_5.9.bb</a> b=
/meta-networking/recipes-protocols/net-snmp/<a href=3D"http://net-snmp_5.9.=
bb" rel=3D"noreferrer" target=3D"_blank">net-snmp_5.9.bb</a><br>
index bee83c4d1..ac78ed2d5 100644<br>
--- a/meta-networking/recipes-protocols/net-snmp/<a href=3D"http://net-snm=
p_5.9.bb" rel=3D"noreferrer" target=3D"_blank">net-snmp_5.9.bb</a><br>
+++ b/meta-networking/recipes-protocols/net-snmp/<a href=3D"http://net-snm=
p_5.9.bb" rel=3D"noreferrer" target=3D"_blank">net-snmp_5.9.bb</a><br>
@@ -25,6 +25,7 @@ SRC_URI =3D &quot;${SOURCEFORGE_MIRROR}/net-snmp/net-snm=
p-${PV}.tar.gz \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://net-snmp-5.7.2-fix-engine=
Boots-value-on-SIGHUP.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://net-snmp-fix-for-disable-=
des.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://reproducibility-have-prin=
tcap.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-ac_add_search_path.m=
4-keep-consistent-between-32bit.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;04303a66f85d6d8b16d3cc53bde50428877c82a=
b524e17591dfceaeb94df6071&quot;<br>
<br>
@@ -128,10 +129,12 @@ do_install_append() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-e &#39;s@[^ ]*--with-install-prefix=3D[=
^ &quot;]*@@g&#39; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-e &#39;s@[^ ]*PKG_CONFIG_PATH=3D[^ &quo=
t;]*@@g&#39; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-e &#39;s@[^ ]*PKG_CONFIG_LIBDIR=3D[^ &q=
uot;]*@@g&#39; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 -e &#39;s@-L${STAGING_DIR_HOST}${libdir}@@g&#=
39; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 -e &#39;s@-I${STAGING_DIR_HOST}${includedir}@=
@g&#39; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 -e &#39;s@${STAGING_DIR_HOST}@@g&#39; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-i ${D}${bindir}/net-snmp-config<br>
<br>
+=C2=A0 =C2=A0 sed -e &#39;s@${STAGING_DIR_HOST}@@g&#39; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 -i ${D}${libdir}/pkgconfig/{netsnmp-agent.pc,=
netsnmp.pc}<br>
+<br>
=C2=A0 =C2=A0 =C2=A0if [ &quot;${HAS_PERL}&quot; =3D &quot;1&quot; ]; then=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sed -e &quot;s@^NSC_INCLUDEDIR=3D.*@NSC_=
INCLUDEDIR=3D\$\{includedir\}@g&quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-e &quot;s@^NSC_LIBDIR=3D-=
L.*@NSC_LIBDIR=3D-L\$\{libdir\}@g&quot; \<br>
-- <br>
2.17.1<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--0000000000003b24a505ba5cc07b--
