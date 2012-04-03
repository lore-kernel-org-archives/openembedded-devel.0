Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1SF5bV-0004Wt-Pm
	for openembedded-devel@lists.openembedded.org;
	Tue, 03 Apr 2012 17:25:05 +0200
Received: by wgbdr12 with SMTP id dr12so3324406wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Apr 2012 08:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=XBLy2PS/6A7rkFQXByaZQD3AezC9IPtRLz3CkOUbkpk=;
	b=hXPE8AL9Xi4nSxXLsI+Sz6+HEcCIeQVf8mZ+94zJ8zroOJbd+9uSe5oZBhAmCt/5Vx
	TjjJwdaCs0rYQGqmkHV6V5IYiOsZKqhU1RdJjArOuDy4Z25s4GdekHvY2GgEya3oD8+I
	25WlogzJuV61AULtp1ZNVJnLtl9YHGhbXDxEGn26Rm9MlgoBDJcBPtEmIrvEHx59dTNU
	no8WUYI9L7RV/kJAvl/z6d0vbw/Cap9Y6s8IYlOBVTaV/R90sec+JAi/LEYar32/zRE5
	QgyO6tSsRB/XFjfgpTVJfrjwn6mrztcPhjVn6oyKMZ28NF/tpk6k1CQ8Cfe3xEROgNL8
	66rg==
MIME-Version: 1.0
Received: by 10.180.92.130 with SMTP id cm2mr37450589wib.4.1333466156134; Tue,
	03 Apr 2012 08:15:56 -0700 (PDT)
Received: by 10.223.89.83 with HTTP; Tue, 3 Apr 2012 08:15:56 -0700 (PDT)
In-Reply-To: <1333466031-3328-1-git-send-email-s.stirtzel@googlemail.com>
References: <1333466031-3328-1-git-send-email-s.stirtzel@googlemail.com>
Date: Tue, 3 Apr 2012 17:15:56 +0200
Message-ID: <CAGiJk9eNVMWQznpqqeKmQ_NQwxFVq5rka6RL-PaZGuBbRAw6Yg@mail.gmail.com>
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] [meta-oe] mysql5: Fix QA warnings, move .a files to staticdev.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 03 Apr 2012 15:25:06 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

2012/4/3 Samuel Stirtzel <s.stirtzel@googlemail.com>:
> Signed-off-by: Samuel Stirtzel <s.stirtzel@googlemail.com>
> ---
> =C2=A0meta-oe/recipes-support/mysql/mysql5_5.1.40.inc | =C2=A0 34 +++++++=
++++++++++++----
> =C2=A01 files changed, 28 insertions(+), 6 deletions(-)
>
> diff --git a/meta-oe/recipes-support/mysql/mysql5_5.1.40.inc b/meta-oe/re=
cipes-support/mysql/mysql5_5.1.40.inc
> index 865deb2..d436333 100644
> --- a/meta-oe/recipes-support/mysql/mysql5_5.1.40.inc
> +++ b/meta-oe/recipes-support/mysql/mysql5_5.1.40.inc
> @@ -78,8 +78,8 @@ pkg_postrm_mysql5-server () {
> =C2=A0}
>
> =C2=A0PACKAGES =3D "${PN}-dbg ${PN} \
> -libmysqlclient-r libmysqlclient-r-dev libmysqlclient-r-dbg \
> -libmysqlclient libmysqlclient-dev libmysqlclient-dbg \
> +libmysqlclient-r libmysqlclient-r-dev libmysqlclient-r-staticdev libmysq=
lclient-r-dbg \
> +libmysqlclient libmysqlclient-dev libmysqlclient-staticdev libmysqlclien=
t-dbg \
> =C2=A0${PN}-client ${PN}-server ${PN}-leftovers"
> =C2=A0CONFFILES_${PN}-server +=3D "${sysconfdir}/my.cnf"
>
> @@ -87,18 +87,40 @@ FILES_${PN} =3D " "
> =C2=A0RDEPENDS_${PN} =3D "${PN}-client ${PN}-server"
> =C2=A0ALLOW_EMPTY_${PN} =3D "1"
>
> -FILES_libmysqlclient =3D "${libdir}/libmysqlclient.so.*"
> +FILES_libmysqlclient =3D "\
> +${libdir}/libmysqlclient.so.* \
> +${libdir}/plugin/*.so.*"
> =C2=A0FILES_libmysqlclient-dev =3D " \
> =C2=A0${includedir}/mysql/ \
> -${libdir}/lib* \
> -${libdir}/plugin/* \
> +${libdir}/libmysqlclient.so \
> +${libdir}/libmysqlclient.la \
> +${libdir}/plugin/*.so \
> +${libdir}/plugin/*.la \
> =C2=A0${sysconfdir}/aclocal \
> =C2=A0${bindir}/mysql_config"
> +FILES_libmysqlclient-staticdev =3D "\
> +${libdir}/libmysqlclient.a \
> +${libdir}/libmysys.a \
> +${libdir}/libmyisam.a \
> +${libdir}/libmysqld.a \
> +${libdir}/libheap.a \
> +${libdir}/libvio.a \
> +${libdir}/libmystrings.a \
> +${libdir}/libdbug.a \
> +${libdir}/libmyisammrg.a \
> +${libdir}/plugin/ha_innodb_plugin.a \
> +${libdir}/plugin/ha_example.a \
> +${libdir}/plugin/ha_blackhole.a \
> +${libdir}/plugin/ha_federated.a \
> +${libdir}/plugin/ha_archive.a"
> =C2=A0FILES_libmysqlclient-dbg =3D "${libdir}/plugin/.debug/ \
> =C2=A0/usr/mysql-test/lib/My/SafeProcess/.debug/my_safe_process"
>
> =C2=A0FILES_libmysqlclient-r =3D "${libdir}/libmysqlclient_r.so.*"
> -FILES_libmysqlclient-r-dev =3D "${libdir}/libmysqlclient_r.*"
> +FILES_libmysqlclient-r-dev =3D "\
> +${libdir}/libmysqlclient_r.so \
> +${libdir}/libmysqlclient_r.la"
> +FILES_libmysqlclient-r-staticdev =3D "${libdir}/libmysqlclient_r.a"
> =C2=A0FILES_libmysqlclient-r-dbg =3D "${libdir}/plugin/.debuglibmysqlclie=
nt_r.so.*"
>
> =C2=A0FILES_${PN}-client =3D "\
> --
> 1.7.5.4
>

Sorry sent the wrong patch version V2 will come soon.

--=20
Regards
Samuel


