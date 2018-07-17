Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 4CF4D606BF
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Jul 2018 07:20:07 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id a19-v6so378707wmb.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Jul 2018 00:20:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=FIANizMSpxhTpV05rRAgWAvidBDSRJP94nZbKVlM7L0=;
	b=KlZN/3i39f3BmUZ88VtphHYplN0uII0bG6iZN46KLVUiAR7vrdQsYF3cytiJSPUNN4
	Grd4hLecKCuVUbSUfsmCMQuQjKkfM6hwmDS1VkWoI6R3sAqOWqftJziAVdqvl0ULFgff
	CbXuAjtTeQGtau98Cv0LKHvmLzX4XbVud5d4iCq3080IoAp1rfedG+Ox78WsDBqd87Dl
	66v1FHJscp5Lq0tOccyZ9nIMXhrb4FaEeaCMUHueFzZEtl44EO6CPNimDTnlVN2dld7M
	6zhl3Znuu7X55ffdoIhNVTjK53P81FbxhElVksSU9qiWW15cyE1DJzcsrra5q17JwnZp
	sVzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=FIANizMSpxhTpV05rRAgWAvidBDSRJP94nZbKVlM7L0=;
	b=W5M51QmvbPfgIAACac8YaloeVyOT6Tf8F014wRoIpTKJQaiiNb3MYIQprcIu3t7mqD
	2YDBYYvK7GoHcb7lBUdo1hYNU0E1woW+hkdBKELP/1fhkOr9uZbhaJ+oWwaYldjyjfxf
	+qylM+ua3EUVuxD9JzY2NuDgdDs870yLrDEJ8O8GTFMFRFuU075I4ub+5gm+TLqNe/E2
	XoU/Ct9CJnOYlW4Ft0BMFkkj0cn5SqC1QevkgCofF77PBVvstp91d1Ix29pfb9ZBFcse
	tqyOKSDYQ8uX2AVY6U45Y7o80rHvidxmlx8lThG3+Oy5afJbYWT1TnfsR6UaXf4DPFbA
	eGAw==
X-Gm-Message-State: AOUpUlHxZ0rpMNzMi2GaeyJqiB9fwy4/2ZBjziw1HqUHVh8aNDBXFyK6
	bEzmIctrkefE4kRHZH0jFxX3og==
X-Google-Smtp-Source: AAOMgpeuvL9gz1QgYPNXQqTJ8e9g2UfBbsk3QXP24AvKsV4RniExjwPoMAZrY678gvloH/LAjDDqTg==
X-Received: by 2002:a1c:d0ce:: with SMTP id
	h197-v6mr505414wmg.97.1531812007888; 
	Tue, 17 Jul 2018 00:20:07 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	d7-v6sm610957wro.92.2018.07.17.00.20.06
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 17 Jul 2018 00:20:06 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 17 Jul 2018 09:20:08 +0200
To: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Message-ID: <20180717072008.GA2101@jama>
References: <20180716092221.32243-1-rasmus.villemoes@prevas.dk>
MIME-Version: 1.0
In-Reply-To: <20180716092221.32243-1-rasmus.villemoes@prevas.dk>
User-Agent: Mutt/1.10.0 (2018-05-17)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-qt5][PATCH] qfilesystemengine_unix.cpp: optionally disable use of statx(2)
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 17 Jul 2018 07:20:07 -0000
X-Groupsio-MsgNum: 73391
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="VbJkn9YxBvnuCH5J"
Content-Disposition: inline

--VbJkn9YxBvnuCH5J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 16, 2018 at 11:22:21AM +0200, Rasmus Villemoes wrote:
> When used inside an unprivileged docker container, statx(2) gets
> rejected with -EPERM by the default seccomp profile, unless the host
> runs an almost-bleeding edge version of docker (at least 18.04). That
> causes most qt apps, qmake in particular, to fail.
>=20
> While the qt release notes do mention this
>=20
>    - Qt uses the statx(2) system call for obtaining file information on
>    kernels 4.12 and later. Some older container systems install system ca=
ll
>    protection rules that do not include this system call. If you experien=
ce
>    problems running Qt applications inside containers (such as the report=
 of
>    a file not existing when it does), ensure the statx(2) is allowed in t=
he
>    container configuration.
>=20
> it's not always feasible nor reasonable to upgrade (or tell one's
> customers to upgrade) the build infrastructure, especially since several
> distros as of this writing don't even seem to ship such a recent version
> in their official repositories.
>=20
> This opt-in patch simply monkey-patches out any (the only) use of statx
> and ensures that the -ENOSYS fallbacks are used. While I agree that this
> is really a bug in the container system, this takes the short and
> pragmatic approach to getting things to work.
>=20
> To opt-in, just prepend no-xstat: to OVERRIDES in some global
> configuration file, possibly restricting that to e.g. native and
> nativesdk.
>=20
> Signed-off-by: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
> ---
>  ...temengine_unix.cpp-disable-use-of-statx-2.patch | 58 ++++++++++++++++=
++++++
>  recipes-qt/qt5/qt5-git.inc                         |  2 +
>  2 files changed, 60 insertions(+)
>  create mode 100644 recipes-qt/qt5/files/0001-qfilesystemengine_unix.cpp-=
disable-use-of-statx-2.patch
>=20
> diff --git a/recipes-qt/qt5/files/0001-qfilesystemengine_unix.cpp-disable=
-use-of-statx-2.patch b/recipes-qt/qt5/files/0001-qfilesystemengine_unix.cp=
p-disable-use-of-statx-2.patch
> new file mode 100644
> index 0000000..6efbfe4
> --- /dev/null
> +++ b/recipes-qt/qt5/files/0001-qfilesystemengine_unix.cpp-disable-use-of=
-statx-2.patch
> @@ -0,0 +1,58 @@
> +From dc5218c70d445a4692271add1a17091afb230095 Mon Sep 17 00:00:00 2001
> +From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
> +Date: Mon, 16 Jul 2018 09:50:06 +0200
> +Subject: [PATCH] qfilesystemengine_unix.cpp: disable use of statx(2)
> +
> +When used inside an unprivileged docker container, statx(2) gets
> +rejected with -EPERM by the default seccomp profile, unless the host
> +runs an almost-bleeding edge version of docker (at least 18.04). That
> +causes most qt apps, qmake in particular, to fail.
> +
> +While the qt release notes do mention this
> +
> +   - Qt uses the statx(2) system call for obtaining file information on
> +   kernels 4.12 and later. Some older container systems install system c=
all
> +   protection rules that do not include this system call. If you experie=
nce
> +   problems running Qt applications inside containers (such as the repor=
t of
> +   a file not existing when it does), ensure the statx(2) is allowed in =
the
> +   container configuration.
> +
> +it's not always feasible nor reasonable to upgrade (or tell one's
> +customers to upgrade) the build infrastructure.
> +
> +This opt-in patch simply monkey-patches out any (the only) use of statx
> +and ensures that the -ENOSYS fallbacks are used.
> +
> +https://github.com/docker/for-linux/issues/208
> +https://github.com/moby/moby/pull/36417
> +
> +Upstream-Status: Inappropriate [workaround]
> +---
> + src/corelib/io/qfilesystemengine_unix.cpp | 4 ++++
> + 1 file changed, 4 insertions(+)
> +
> +diff --git a/src/corelib/io/qfilesystemengine_unix.cpp b/src/corelib/io/=
qfilesystemengine_unix.cpp
> +index b974af80dc..5f574901e3 100644
> +--- a/src/corelib/io/qfilesystemengine_unix.cpp
> ++++ b/src/corelib/io/qfilesystemengine_unix.cpp
> +@@ -320,6 +320,9 @@ mtime(const T &statBuffer, int)
> + #ifdef STATX_BASIC_STATS
> + static int qt_real_statx(int fd, const char *pathname, int flags, struc=
t statx *statxBuffer)
> + {
> ++#if 1
> ++    return -ENOSYS;
> ++#else
> + #ifdef Q_ATOMIC_INT8_IS_SUPPORTED
> +     static QBasicAtomicInteger<qint8> statxTested  =3D Q_BASIC_ATOMIC_I=
NITIALIZER(0);
> + #else
> +@@ -337,6 +340,7 @@ static int qt_real_statx(int fd, const char *pathnam=
e, int flags, struct statx *
> +     }
> +     statxTested.store(1);
> +     return ret =3D=3D -1 ? -errno : 0;
> ++#endif
> + }
> +=20
> + static int qt_statx(const char *pathname, struct statx *statxBuffer)
> +--=20
> +2.16.4
> +
> diff --git a/recipes-qt/qt5/qt5-git.inc b/recipes-qt/qt5/qt5-git.inc
> index 09b6cc5..41f9b7a 100644
> --- a/recipes-qt/qt5/qt5-git.inc
> +++ b/recipes-qt/qt5/qt5-git.inc
> @@ -15,3 +15,5 @@ CVE_PRODUCT =3D "qt"
>  S =3D "${WORKDIR}/git"
> =20
>  PV =3D "5.11.1+git${SRCPV}"
> +
> +SRC_URI_append_no-xstat =3D " file://0001-qfilesystemengine_unix.cpp-dis=
able-use-of-statx-2.patch"

Isn't this applicable only to *qtbase* ?

> --=20
> 2.16.4
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--VbJkn9YxBvnuCH5J
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCW02YpwAKCRA3VSO3ZXaA
HP/uAJ9rQuvQowO1EFLBOT89sJCM1nGz6wCgnTkqhKsameB/5/BZ7IDs+9JrUMk=
=d+jW
-----END PGP SIGNATURE-----

--VbJkn9YxBvnuCH5J--
