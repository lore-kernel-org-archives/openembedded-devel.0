Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f170.google.com (mail-ea0-f170.google.com
	[209.85.215.170])
	by mail.openembedded.org (Postfix) with ESMTP id A3CB06E9A6
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  1 Feb 2014 07:42:50 +0000 (UTC)
Received: by mail-ea0-f170.google.com with SMTP id k10so2752309eaj.15
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Jan 2014 23:42:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=7mtPsJGauXw6+D9af6z5Sr8kd21G2k2f8+4ZkDIhIek=;
	b=TyaVgRSd6nUfDdp53DF0FeHYSuiHjRBq3YYjwSaG81JAw5ue43Wxbdujy3pUq3eUop
	1L6dezjhuc1yH92jVbs3sVZ75Ljqqb2/9M4xaJjY5xSw37j/Ezj5lTpeUeeUYh/SHXah
	JQLXsigBYJ/kgGZpFnKd8iYSDghzt/WrD87zksSayCMPRjcvQlcG1Drr9Fd92TCv1QG5
	Ytkbr+9pAXc0y89hWLxhgc49vXiAhXIdQs71COHKTsd9uFGiFfjEdDG8r7F2qr+nDzqk
	mNx2bSxmQK3+2GGaKBJpA59f2yxL9t7RALKgQhwNZRcttZW2BBpGWrFi7qGVWzP/fMFK
	l18w==
X-Received: by 10.14.5.11 with SMTP id 11mr717429eek.57.1391240571333;
	Fri, 31 Jan 2014 23:42:51 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id n7sm46280745eef.5.2014.01.31.23.42.49
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 31 Jan 2014 23:42:50 -0800 (PST)
Date: Sat, 1 Feb 2014 08:42:59 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140201074259.GA3718@jama>
References: <1391198644-9408-1-git-send-email-diego.sueiro@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1391198644-9408-1-git-send-email-diego.sueiro@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [for-dora] systemd: journald fix ignored disk space restrictions
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 01 Feb 2014 07:42:51 -0000
X-Groupsio-MsgNum: 48016
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Q4+B1pX2h4duw/kc"
Content-Disposition: inline

--Q4+B1pX2h4duw/kc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 31, 2014 at 06:04:04PM -0200, Diego Sueiro wrote:
> The upstream bug report can be seen at:
> [Systemd #68161] -- https://bugs.freedesktop.org/show_bug.cgi?id=3D68161
>=20
> This backports the patches need to address this in the 206 version.

Hello Diego, this belongs to openembedded-core ML.

It's not clear from the bug report, but these patches are included in
208 release right? Please check and mention it in commit message to
explain that this isn't needed in oe-core/master.

Thanks

> Signed-off-by: Diego Sueiro <diego.sueiro@gmail.com>
> ---
>  ...ournald-fix-fd-leak-in-journal_file_empty.patch |   27 ++++++++++++++
>  ...urnald-fix-vacuuming-of-archived-journals.patch |   37 ++++++++++++++=
++++++
>  meta/recipes-core/systemd/systemd_206.bb           |    2 ++
>  3 files changed, 66 insertions(+)
>  create mode 100644 meta/recipes-core/systemd/systemd/journald-fix-fd-lea=
k-in-journal_file_empty.patch
>  create mode 100644 meta/recipes-core/systemd/systemd/journald-fix-vacuum=
ing-of-archived-journals.patch
>=20
> diff --git a/meta/recipes-core/systemd/systemd/journald-fix-fd-leak-in-jo=
urnal_file_empty.patch b/meta/recipes-core/systemd/systemd/journald-fix-fd-=
leak-in-journal_file_empty.patch
> new file mode 100644
> index 0000000..a83c858
> --- /dev/null
> +++ b/meta/recipes-core/systemd/systemd/journald-fix-fd-leak-in-journal_f=
ile_empty.patch
> @@ -0,0 +1,27 @@
> +journald: fix fd leak in journal_file_empty
> +Before my previous patch, journal_file_empty wasn't be called with the
> +correct filename. Now that it's being called with the correct filename
> +it leaks file descriptors. This patch closes the file descriptors before
> +returning.
> +
> +Signed-off-by: George McCollister <george.mccollister@gmail.com>
> +
> +
> +Index: systemd-206/src/journal/journal-vacuum.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- systemd-206.orig/src/journal/journal-vacuum.c	2013-07-21 19:43:28.14=
6183128 -0300
> ++++ systemd-206/src/journal/journal-vacuum.c	2014-01-29 20:43:27.4923432=
95 -0200
> +@@ -129,9 +129,9 @@
> + }
> +=20
> + static int journal_file_empty(int dir_fd, const char *name) {
> +-        int fd, r;
> ++        int r;
> +         le64_t n_entries;
> +-
> ++        _cleanup_close_ int fd;
> +         fd =3D openat(dir_fd, name, O_RDONLY|O_CLOEXEC|O_NOFOLLOW|O_NON=
BLOCK);
> +         if (fd < 0)
> +                 return -errno;
> +
> +Upstream-Status: Backport [207]
> diff --git a/meta/recipes-core/systemd/systemd/journald-fix-vacuuming-of-=
archived-journals.patch b/meta/recipes-core/systemd/systemd/journald-fix-va=
cuuming-of-archived-journals.patch
> new file mode 100644
> index 0000000..7c59200
> --- /dev/null
> +++ b/meta/recipes-core/systemd/systemd/journald-fix-vacuuming-of-archive=
d-journals.patch
> @@ -0,0 +1,37 @@
> +journald: fix vacuuming of archived journals
> +d_name is modified on line 227 so if the entire journal name is needed
> +again p must be used. Before this change when journal_file_empty was cal=
led
> +on archived journals it would always return with -2.
> +
> +Signed-off-by: George McCollister <george.mccollister@gmail.com>
> +
> +Index: systemd-206/src/journal/journal-vacuum.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- systemd-206.orig/src/journal/journal-vacuum.c	2014-01-29 20:43:27.49=
2343295 -0200
> ++++ systemd-206/src/journal/journal-vacuum.c	2014-01-29 20:48:55.0763568=
76 -0200
> +@@ -265,18 +265,18 @@
> +                         /* We do not vacuum active files or unknown fil=
es! */
> +                         continue;
> +=20
> +-                if (journal_file_empty(dirfd(d), de->d_name)) {
> ++                if (journal_file_empty(dirfd(d), p)) {
> +=20
> +                         /* Always vacuum empty non-online files. */
> +=20
> +-                        if (unlinkat(dirfd(d), de->d_name, 0) >=3D 0)
> +-                                log_debug("Deleted empty journal %s/%s.=
", directory, de->d_name);
> ++                        if (unlinkat(dirfd(d), p, 0) >=3D 0)
> ++                                log_debug("Deleted empty journal %s/%s.=
", directory, p);
> +                         else if (errno !=3D ENOENT)
> +-                                log_warning("Failed to delete %s/%s: %m=
", directory, de->d_name);
> ++                                log_warning("Failed to delete %s/%s: %m=
", directory, p);
> +                         continue;
> +                 }
> +=20
> +-                patch_realtime(directory, de->d_name, &st, &realtime);
> ++                patch_realtime(directory, p, &st, &realtime);
> +=20
> +                 GREEDY_REALLOC(list, n_allocated, n_list + 1);
> +
> +
> +Upstream-Status: Backport [207]=20
> diff --git a/meta/recipes-core/systemd/systemd_206.bb b/meta/recipes-core=
/systemd/systemd_206.bb
> index a1a8bd7..e7d0f1f 100644
> --- a/meta/recipes-core/systemd/systemd_206.bb
> +++ b/meta/recipes-core/systemd/systemd_206.bb
> @@ -21,6 +21,8 @@ SRC_URI =3D "http://www.freedesktop.org/software/system=
d/systemd-${PV}.tar.xz \
>             file://0001-use-CAP_MKNOD-ConditionCapability.patch \
>             file://0001-Use-bin-mkdir-instead-of-host-mkdir-path.patch \
>             file://binfmt-install.patch \
> +           file://journald-fix-fd-leak-in-journal_file_empty.patch \
> +           file://journald-fix-vacuuming-of-archived-journals.patch \
>             file://touchscreen.rules \
>             ${UCLIBCPATCHES} \
>             file://00-create-volatile.conf \
> --=20
> 1.7.10.4
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Q4+B1pX2h4duw/kc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlLspYMACgkQN1Ujt2V2gByHSwCfe1AfxLG/tAFRsFcf+9t9zNeV
kL4AniXsnetIXHZKNJzgrs72WUH3ibRj
=0o6P
-----END PGP SIGNATURE-----

--Q4+B1pX2h4duw/kc--
