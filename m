Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1EE7D10366
	for <webhook@archiver.kernel.org>; Tue, 25 Nov 2025 22:43:40 +0000 (UTC)
Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6657.1764110617168960137
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Nov 2025 14:43:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PY6b+Rzn;
 spf=pass (domain: gmail.com, ip: 74.125.224.52, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-640d0895d7cso472782d50.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 25 Nov 2025 14:43:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764110616; x=1764715416; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PJVlhoXdzGfkush0yXp2+6FIyGw60wNgaHJfJYtRz/0=;
        b=PY6b+Rznqy2pZLztjGMyNIpwNtx5VFlDJ2ym+vR11bTQe2fTyUGf/ohqxLA2nOm+MK
         k9iTAA3zNKCFKcVl/EofkPsApRwI2RwK0hADAvDjgP568jyL9MfUj0wEd75t2n0evKYt
         sRCau9HA7+OGC+oBWo8V3sbCkgGSgVLBJcfglgvoP3oyw59aAT79J2W7ai6MlFl8rH2O
         986smNKmwcJOScE0TNm2X41Unhbh3tidUITqfDj0T3rRcPZq6fPNN67BT/eJClxWeWef
         TZGS2smRM+0dvRJj0iTTt2xfvDuViBIfeWrUpkodhAsYydRzs6dklZ/F6zfqPqwXC7xI
         Q/Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764110616; x=1764715416;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PJVlhoXdzGfkush0yXp2+6FIyGw60wNgaHJfJYtRz/0=;
        b=NSiXj+D8ImlPOnffj1Y/kIdQBlUK5zslzi8xmf2wSP/J95roKsL6kCLrOrR56NjPRP
         3DH9AdJ+8GnkMcA3255IbMSzV4NzYU+I8YwUsNlToFmug4sO/LCzuNIyhmLyi9E/1Crw
         Q42QHB5SXJVbSbWMdA9Nnok4xvjNRrBdj+QatpPo3Fc4ROjRgqHEKv0kdoTFVRNmI35H
         FkG/jZxzfl5GzaCWWTBklpvNTiyoqsDjP76P1TLVGGQTarprqBZYjivRi5Bbij5tceEO
         NXtUOV5Q+dRWjwxlA7o4/9L3awkgkqOCD7aCyNfz6cD+A796wfzEIdxnSfW/pdRpMqx9
         jhzg==
X-Gm-Message-State: AOJu0Yxh/Bl9EHJNrtXj9RMGVePX9TEEXxwIy9OatTgJvh/4sPeQzjVs
	bi4tWcj4VpiV47SGxVXPjkfF7wAutn4lMgoAn17bcec5oN699h0Jqc5YzkJvR5pXJkpAUF4GhAl
	7o7I8HZ+wDu8C4yKQ7o+m1uFfTlk4f8qVF1yO
X-Gm-Gg: ASbGncuFwMcKe1Dt6XPHBdCZi3nwleoMuUAATrKF2nVfL8o5JFtXCU8TXTHIN+Haaof
	Pq/doDxHXZzc3GKEU8QyLakRpCJ6T7xg/IMuGKr5YOEykcgWbZqoz3dpKJ80OFqXB9KA121KCPT
	w85Tzmq9kzTFYAkr7KbZ2W5ZsJvwvw0SMleb0f85AohJoT40pTR1N3CrXlKAQxjnyawEhfwbKKY
	XNEvkK825yGa+vGm5OKo2t/hEjfmW+rq0cDRrnvi4YqJjfzhVsH6kfkUWvEt6uo/vBkhjQipSI9
	Zk4QPItD6N44ysUM5/P+mAlIP5jpA6ljLzxac7BQYWWrY3Nb9aj9GuHO29nklQPxk3cTRF6+7Yi
	x1r0U4poJ+Zud+p8OL0ufmRIsqabxrQaFDnn9LmYgbebeZQ==
X-Google-Smtp-Source: AGHT+IE36ih0qQWJjqCjFiqg7y+fTcVe0agqNlxOZRFu7FLDrKFDjmdRgo2i1kEideh8i/fP1xq4qxxlHXvXV13iMdk=
X-Received: by 2002:a05:690e:1514:b0:636:2079:1879 with SMTP id
 956f58d0204a3-642f8ded219mr16062318d50.10.1764110616104; Tue, 25 Nov 2025
 14:43:36 -0800 (PST)
MIME-Version: 1.0
References: <20251125103644.3585-1-liuyd.fnst@fujitsu.com>
In-Reply-To: <20251125103644.3585-1-liuyd.fnst@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 25 Nov 2025 14:43:10 -0800
X-Gm-Features: AWmQ_blkb9sMtZxR6hjsCoUFTyfAf7D6RulOiKVvQng-uIn2rUhh2P6FiLL-vmU
Message-ID: <CAMKF1srBfJe9Zhh8fHyAepk+STnFU6ObLC-dBvfCawF0JbBEeQ@mail.gmail.com>
Subject: Re: [oe][meta-oe][PATCH] php: upgrade 8.4.15 -> 8.5.0
To: liuyd.fnst@fujitsu.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000009e122606447302ed"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Nov 2025 22:43:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122064

--0000000000009e122606447302ed
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

xdebug fails to build with this since it can only build with PHP upto 8.4,
I would suggest you submit it along with xdebug 3.5.0 ( when it releases )

On Tue, Nov 25, 2025 at 2:36=E2=80=AFAM Yiding Liu (Fujitsu) via
lists.openembedded.org <liuyd.fnst=3Dfujitsu.com@lists.openembedded.org>
wrote:

> 1. Changelog:
>   https://github.com/php/php-src/releases/tag/php-8.5.0
>
> 2. Remove opcache-related options as it was not in 8.5.0.
>
> 3. Fix FILES:${PN}-fpm to resolve following error:
>   ERROR: php-8.5.0-r0 do_package: QA Issue: php: Files/directories were
> installed but not shipped in any package:
>   /usr/share/php
>   /usr/share/php/fpm
>   /usr/share/php/fpm/status.html
> Please set FILES such that these items are packaged. Alternatively if the=
y
> are unneeded, avoid installing them or delete them within do_install.
>
> Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
> ---
>  .../php/{php_8.4.15.bb =3D> php_8.5.0.bb}             | 13 ++++---------
>  1 file changed, 4 insertions(+), 9 deletions(-)
>  rename meta-oe/recipes-devtools/php/{php_8.4.15.bb =3D> php_8.5.0.bb} (9=
4%)
>
> diff --git a/meta-oe/recipes-devtools/php/php_8.4.15.bb
> b/meta-oe/recipes-devtools/php/php_8.5.0.bb
> similarity index 94%
> rename from meta-oe/recipes-devtools/php/php_8.4.15.bb
> rename to meta-oe/recipes-devtools/php/php_8.5.0.bb
> index 629eef0519..412ffd9f06 100644
> --- a/meta-oe/recipes-devtools/php/php_8.4.15.bb
> +++ b/meta-oe/recipes-devtools/php/php_8.5.0.bb
> @@ -32,7 +32,7 @@ UPSTREAM_CHECK_REGEX =3D
> "releases/tag/php-(?P<pver>\d+(\.\d+)+)"
>
>  S =3D "${UNPACKDIR}/php-${PV}"
>
> -SRC_URI[sha256sum] =3D
> "b7155bdd498d60d63e4bc320dc224863976d31b5bd9339699726c961255a3197"
> +SRC_URI[sha256sum] =3D
> "cd16cb045b34a6cec6a83008e1b335f365c7a832fcc483df82308664c6d021f9"
>
>  CVE_STATUS_GROUPS +=3D "CVE_STATUS_PHP"
>  CVE_STATUS_PHP[status] =3D "fixed-version: The name of this product is
> exactly the same as github.com/emlog/emlog. CVE can be safely ignored."
> @@ -91,7 +91,7 @@ EXTRA_OECONF:class-native =3D " \
>                  ${COMMON_EXTRA_OECONF} \
>  "
>
> -PACKAGECONFIG ??=3D "mysql sqlite3 opcache openssl \
> +PACKAGECONFIG ??=3D "mysql sqlite3 openssl \
>                     ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6 pam', d)}=
 \
>  "
>  PACKAGECONFIG:class-native =3D ""
> @@ -104,7 +104,6 @@ PACKAGECONFIG[mysql] =3D "--with-mysqli=3Dmysqlnd \
>                          --with-pdo-mysql=3Dmysqlnd \
>                          ,--without-mysqli --without-pdo-mysql \
>                          ,mysql5"
> -PACKAGECONFIG[opcache] =3D "--enable-opcache,--disable-opcache"
>  PACKAGECONFIG[openssl] =3D "--with-openssl,--without-openssl,openssl"
>  PACKAGECONFIG[pam] =3D ",,libpam"
>  PACKAGECONFIG[pgsql] =3D
> "--with-pgsql=3D${STAGING_DIR_TARGET}${exec_prefix},--without-pgsql,postg=
resql"
> @@ -230,13 +229,12 @@ php_sysroot_preprocess () {
>
>  MODPHP_PACKAGE =3D "${@bb.utils.contains('PACKAGECONFIG', 'apache2',
> '${PN}-modphp', '', d)}"
>
> -PACKAGES =3D "${PN}-dbg ${PN}-cli ${PN}-phpdbg ${PN}-cgi ${PN}-fpm
> ${PN}-fpm-apache2 ${PN}-pear ${MODPHP_PACKAGE} ${PN}-dev ${PN}-staticdev
> ${PN}-doc ${PN}-opcache ${PN}"
> +PACKAGES =3D "${PN}-dbg ${PN}-cli ${PN}-phpdbg ${PN}-cgi ${PN}-fpm
> ${PN}-fpm-apache2 ${PN}-pear ${MODPHP_PACKAGE} ${PN}-dev ${PN}-staticdev
> ${PN}-doc ${PN}"
>
>  RDEPENDS:${PN} +=3D "libgcc"
>  RDEPENDS:${PN}-pear =3D "${PN}"
>  RDEPENDS:${PN}-cli =3D "${PN}"
>  RDEPENDS:${PN}-modphp =3D "${PN} apache2"
> -RDEPENDS:${PN}-opcache =3D "${PN}"
>
>  ALLOW_EMPTY:${PN} =3D "1"
>
> @@ -244,9 +242,7 @@ INITSCRIPT_PACKAGES =3D "${PN}-fpm"
>  inherit update-rc.d
>
>  # WARNING: lib32-php-8.0.12-r0 do_package_qa: QA Issue: lib32-php: ELF
> binary /usr/libexec/apache2/modules/libphp.so has relocations in .text
> [textrel]
> -#WARNING: lib32-php-8.0.12-r0 do_package_qa: QA Issue: lib32-php-opcache=
:
> ELF binary /usr/lib/php8/extensions/no-debug-zts-20200930/opcache.so has
> relocations in .text [textrel]
>  INSANE_SKIP:${PN}:append:x86 =3D " textrel"
> -INSANE_SKIP:${PN}-opcache:append:x86 =3D " textrel"
>
>  FILES:${PN}-dbg =3D+ "${bindir}/.debug \
>                      ${libexecdir}/apache2/modules/.debug"
> @@ -254,7 +250,7 @@ FILES:${PN}-doc +=3D "${PHP_LIBDIR}/php/doc"
>  FILES:${PN}-cli =3D "${bindir}/php"
>  FILES:${PN}-phpdbg =3D "${bindir}/phpdbg"
>  FILES:${PN}-cgi =3D "${bindir}/php-cgi"
> -FILES:${PN}-fpm =3D "${sbindir}/php-fpm ${sysconfdir}/php-fpm.conf
> ${datadir}/fpm ${sysconfdir}/init.d/php-fpm
> ${sysconfdir}/php-fpm.d/www.conf.default"
> +FILES:${PN}-fpm =3D "${sbindir}/php-fpm ${sysconfdir}/php-fpm.conf
> ${datadir}/php/fpm ${sysconfdir}/init.d/php-fpm
> ${sysconfdir}/php-fpm.d/www.conf.default"
>  FILES:${PN}-fpm-apache2 =3D "${sysconfdir}/apache2/conf.d/php-fpm.conf"
>  CONFFILES:${PN}-fpm =3D "${sysconfdir}/php-fpm.conf"
>  CONFFILES:${PN}-fpm-apache2 =3D "${sysconfdir}/apache2/conf.d/php-fpm.co=
nf"
> @@ -273,7 +269,6 @@ FILES:${PN}-dev =3D "${includedir}/php
> ${PHP_LIBDIR}/build ${bindir}/phpize \
>                  ${PHP_LIBDIR}/php/.depdblock ${PHP_LIBDIR}/php/.filemap =
\
>                  ${PHP_LIBDIR}/php/.lock ${PHP_LIBDIR}/php/test"
>  FILES:${PN}-staticdev +=3D "${PHP_LIBDIR}/extensions/*/*.a"
> -FILES:${PN}-opcache =3D "${PHP_LIBDIR}/extensions/*/opcache${SOLIBSDEV}"
>  FILES:${PN} =3D "${PHP_LIBDIR}/php"
>  FILES:${PN} +=3D "${bindir} ${libexecdir}/apache2"
>
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#122053):
> https://lists.openembedded.org/g/openembedded-devel/message/122053
> Mute This Topic: https://lists.openembedded.org/mt/116466909/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000009e122606447302ed
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">xdebug fails to build with this since it can only build wi=
th PHP upto 8.4, I would suggest you submit it along with xdebug 3.5.0 ( wh=
en it releases )</div><br><div class=3D"gmail_quote gmail_quote_container">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Nov 25, 2025 at 2:36=E2=80=AF=
AM Yiding Liu (Fujitsu) via <a href=3D"http://lists.openembedded.org">lists=
.openembedded.org</a> &lt;liuyd.fnst=3D<a href=3D"mailto:fujitsu.com@lists.=
openembedded.org">fujitsu.com@lists.openembedded.org</a>&gt; wrote:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">1. Changelog:<br>
=C2=A0 <a href=3D"https://github.com/php/php-src/releases/tag/php-8.5.0" re=
l=3D"noreferrer" target=3D"_blank">https://github.com/php/php-src/releases/=
tag/php-8.5.0</a><br>
<br>
2. Remove opcache-related options as it was not in 8.5.0.<br>
<br>
3. Fix FILES:${PN}-fpm to resolve following error:<br>
=C2=A0 ERROR: php-8.5.0-r0 do_package: QA Issue: php: Files/directories wer=
e installed but not shipped in any package:<br>
=C2=A0 /usr/share/php<br>
=C2=A0 /usr/share/php/fpm<br>
=C2=A0 /usr/share/php/fpm/status.html<br>
Please set FILES such that these items are packaged. Alternatively if they =
are unneeded, avoid installing them or delete them within do_install.<br>
<br>
Signed-off-by: Liu Yiding &lt;<a href=3D"mailto:liuyd.fnst@fujitsu.com" tar=
get=3D"_blank">liuyd.fnst@fujitsu.com</a>&gt;<br>
---<br>
=C2=A0.../php/{<a href=3D"http://php_8.4.15.bb" rel=3D"noreferrer" target=
=3D"_blank">php_8.4.15.bb</a> =3D&gt; <a href=3D"http://php_8.5.0.bb" rel=
=3D"noreferrer" target=3D"_blank">php_8.5.0.bb</a>}=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 13 ++++---------<br>
=C2=A01 file changed, 4 insertions(+), 9 deletions(-)<br>
=C2=A0rename meta-oe/recipes-devtools/php/{<a href=3D"http://php_8.4.15.bb"=
 rel=3D"noreferrer" target=3D"_blank">php_8.4.15.bb</a> =3D&gt; <a href=3D"=
http://php_8.5.0.bb" rel=3D"noreferrer" target=3D"_blank">php_8.5.0.bb</a>}=
 (94%)<br>
<br>
diff --git a/meta-oe/recipes-devtools/php/<a href=3D"http://php_8.4.15.bb" =
rel=3D"noreferrer" target=3D"_blank">php_8.4.15.bb</a> b/meta-oe/recipes-de=
vtools/php/<a href=3D"http://php_8.5.0.bb" rel=3D"noreferrer" target=3D"_bl=
ank">php_8.5.0.bb</a><br>
similarity index 94%<br>
rename from meta-oe/recipes-devtools/php/<a href=3D"http://php_8.4.15.bb" r=
el=3D"noreferrer" target=3D"_blank">php_8.4.15.bb</a><br>
rename to meta-oe/recipes-devtools/php/<a href=3D"http://php_8.5.0.bb" rel=
=3D"noreferrer" target=3D"_blank">php_8.5.0.bb</a><br>
index 629eef0519..412ffd9f06 100644<br>
--- a/meta-oe/recipes-devtools/php/<a href=3D"http://php_8.4.15.bb" rel=3D"=
noreferrer" target=3D"_blank">php_8.4.15.bb</a><br>
+++ b/meta-oe/recipes-devtools/php/<a href=3D"http://php_8.5.0.bb" rel=3D"n=
oreferrer" target=3D"_blank">php_8.5.0.bb</a><br>
@@ -32,7 +32,7 @@ UPSTREAM_CHECK_REGEX =3D &quot;releases/tag/php-(?P&lt;pv=
er&gt;\d+(\.\d+)+)&quot;<br>
<br>
=C2=A0S =3D &quot;${UNPACKDIR}/php-${PV}&quot;<br>
<br>
-SRC_URI[sha256sum] =3D &quot;b7155bdd498d60d63e4bc320dc224863976d31b5bd933=
9699726c961255a3197&quot;<br>
+SRC_URI[sha256sum] =3D &quot;cd16cb045b34a6cec6a83008e1b335f365c7a832fcc48=
3df82308664c6d021f9&quot;<br>
<br>
=C2=A0CVE_STATUS_GROUPS +=3D &quot;CVE_STATUS_PHP&quot;<br>
=C2=A0CVE_STATUS_PHP[status] =3D &quot;fixed-version: The name of this prod=
uct is exactly the same as <a href=3D"http://github.com/emlog/emlog" rel=3D=
"noreferrer" target=3D"_blank">github.com/emlog/emlog</a>. CVE can be safel=
y ignored.&quot;<br>
@@ -91,7 +91,7 @@ EXTRA_OECONF:class-native =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${COMMON_EXTR=
A_OECONF} \<br>
=C2=A0&quot;<br>
<br>
-PACKAGECONFIG ??=3D &quot;mysql sqlite3 opcache openssl \<br>
+PACKAGECONFIG ??=3D &quot;mysql sqlite3 openssl \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${@bb=
.utils.filter(&#39;DISTRO_FEATURES&#39;, &#39;ipv6 pam&#39;, d)} \<br>
=C2=A0&quot;<br>
=C2=A0PACKAGECONFIG:class-native =3D &quot;&quot;<br>
@@ -104,7 +104,6 @@ PACKAGECONFIG[mysql] =3D &quot;--with-mysqli=3Dmysqlnd =
\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0--with-pdo-mysql=3Dmysqlnd \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0,--without-mysqli --without-pdo-mysql \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0,mysql5&quot;<br>
-PACKAGECONFIG[opcache] =3D &quot;--enable-opcache,--disable-opcache&quot;<=
br>
=C2=A0PACKAGECONFIG[openssl] =3D &quot;--with-openssl,--without-openssl,ope=
nssl&quot;<br>
=C2=A0PACKAGECONFIG[pam] =3D &quot;,,libpam&quot;<br>
=C2=A0PACKAGECONFIG[pgsql] =3D &quot;--with-pgsql=3D${STAGING_DIR_TARGET}${=
exec_prefix},--without-pgsql,postgresql&quot;<br>
@@ -230,13 +229,12 @@ php_sysroot_preprocess () {<br>
<br>
=C2=A0MODPHP_PACKAGE =3D &quot;${@bb.utils.contains(&#39;PACKAGECONFIG&#39;=
, &#39;apache2&#39;, &#39;${PN}-modphp&#39;, &#39;&#39;, d)}&quot;<br>
<br>
-PACKAGES =3D &quot;${PN}-dbg ${PN}-cli ${PN}-phpdbg ${PN}-cgi ${PN}-fpm ${=
PN}-fpm-apache2 ${PN}-pear ${MODPHP_PACKAGE} ${PN}-dev ${PN}-staticdev ${PN=
}-doc ${PN}-opcache ${PN}&quot;<br>
+PACKAGES =3D &quot;${PN}-dbg ${PN}-cli ${PN}-phpdbg ${PN}-cgi ${PN}-fpm ${=
PN}-fpm-apache2 ${PN}-pear ${MODPHP_PACKAGE} ${PN}-dev ${PN}-staticdev ${PN=
}-doc ${PN}&quot;<br>
<br>
=C2=A0RDEPENDS:${PN} +=3D &quot;libgcc&quot;<br>
=C2=A0RDEPENDS:${PN}-pear =3D &quot;${PN}&quot;<br>
=C2=A0RDEPENDS:${PN}-cli =3D &quot;${PN}&quot;<br>
=C2=A0RDEPENDS:${PN}-modphp =3D &quot;${PN} apache2&quot;<br>
-RDEPENDS:${PN}-opcache =3D &quot;${PN}&quot;<br>
<br>
=C2=A0ALLOW_EMPTY:${PN} =3D &quot;1&quot;<br>
<br>
@@ -244,9 +242,7 @@ INITSCRIPT_PACKAGES =3D &quot;${PN}-fpm&quot;<br>
=C2=A0inherit update-rc.d<br>
<br>
=C2=A0# WARNING: lib32-php-8.0.12-r0 do_package_qa: QA Issue: lib32-php: EL=
F binary /usr/libexec/apache2/modules/libphp.so has relocations in .text [t=
extrel]<br>
-#WARNING: lib32-php-8.0.12-r0 do_package_qa: QA Issue: lib32-php-opcache: =
ELF binary /usr/lib/php8/extensions/no-debug-zts-20200930/opcache.so has re=
locations in .text [textrel]<br>
=C2=A0INSANE_SKIP:${PN}:append:x86 =3D &quot; textrel&quot;<br>
-INSANE_SKIP:${PN}-opcache:append:x86 =3D &quot; textrel&quot;<br>
<br>
=C2=A0FILES:${PN}-dbg =3D+ &quot;${bindir}/.debug \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0${libexecdir}/apache2/modules/.debug&quot;<br>
@@ -254,7 +250,7 @@ FILES:${PN}-doc +=3D &quot;${PHP_LIBDIR}/php/doc&quot;<=
br>
=C2=A0FILES:${PN}-cli =3D &quot;${bindir}/php&quot;<br>
=C2=A0FILES:${PN}-phpdbg =3D &quot;${bindir}/phpdbg&quot;<br>
=C2=A0FILES:${PN}-cgi =3D &quot;${bindir}/php-cgi&quot;<br>
-FILES:${PN}-fpm =3D &quot;${sbindir}/php-fpm ${sysconfdir}/php-fpm.conf ${=
datadir}/fpm ${sysconfdir}/init.d/php-fpm ${sysconfdir}/php-fpm.d/www.conf.=
default&quot;<br>
+FILES:${PN}-fpm =3D &quot;${sbindir}/php-fpm ${sysconfdir}/php-fpm.conf ${=
datadir}/php/fpm ${sysconfdir}/init.d/php-fpm ${sysconfdir}/php-fpm.d/www.c=
onf.default&quot;<br>
=C2=A0FILES:${PN}-fpm-apache2 =3D &quot;${sysconfdir}/apache2/conf.d/php-fp=
m.conf&quot;<br>
=C2=A0CONFFILES:${PN}-fpm =3D &quot;${sysconfdir}/php-fpm.conf&quot;<br>
=C2=A0CONFFILES:${PN}-fpm-apache2 =3D &quot;${sysconfdir}/apache2/conf.d/ph=
p-fpm.conf&quot;<br>
@@ -273,7 +269,6 @@ FILES:${PN}-dev =3D &quot;${includedir}/php ${PHP_LIBDI=
R}/build ${bindir}/phpize \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${PHP_LIBDIR}=
/php/.depdblock ${PHP_LIBDIR}/php/.filemap \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${PHP_LIBDIR}=
/php/.lock ${PHP_LIBDIR}/php/test&quot;<br>
=C2=A0FILES:${PN}-staticdev +=3D &quot;${PHP_LIBDIR}/extensions/*/*.a&quot;=
<br>
-FILES:${PN}-opcache =3D &quot;${PHP_LIBDIR}/extensions/*/opcache${SOLIBSDE=
V}&quot;<br>
=C2=A0FILES:${PN} =3D &quot;${PHP_LIBDIR}/php&quot;<br>
=C2=A0FILES:${PN} +=3D &quot;${bindir} ${libexecdir}/apache2&quot;<br>
<br>
-- <br>
2.43.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#122053): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/122053" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/122053</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/116466909/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/116466909/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--0000000000009e122606447302ed--

