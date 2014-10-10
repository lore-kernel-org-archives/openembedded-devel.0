Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f171.google.com (mail-wi0-f171.google.com
	[209.85.212.171])
	by mail.openembedded.org (Postfix) with ESMTP id 09FBA6AC7B
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Oct 2014 10:42:17 +0000 (UTC)
Received: by mail-wi0-f171.google.com with SMTP id em10so1613813wid.4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Oct 2014 03:42:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=cYoI24nEA8ZAd7Zn7ZbQqXyD87gmQai1OPWc1Ps1Mw8=;
	b=1I4RE6+17/jG3OdtsLUbE5ap4jhS/1HC0M01FGWcCIqcJ33yMyEs/yfgzdkay22m6p
	lslplL8uCTmW4RoA6uG8xSh7Zdd/bi2T9bl7zLC098gmL2vcaTDzcDPgRybqjV+AyW3B
	RXmS5ztPRpP8YB5PaB6ndhwglf9q3sKywFUsyj3q0Q7I9vEfmhRsN2cMN6MMjwooYhu8
	tYZHaLZe9Iye9X4HuQ0DiMA/jk8ObTlN6WNioa0HrVzSYXMaBC7QhCi3+K9k9AMgyAjn
	V4fuBg4Y6pBOgCY3zhRC7fp1c4u7tTwtE8TlG1cN2Md3MRKiP+qqF3mJUqZGYLe/79un
	S6QA==
X-Received: by 10.194.3.78 with SMTP id a14mr2192689wja.91.1412937737959;
	Fri, 10 Oct 2014 03:42:17 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	wk5sm6581030wjb.12.2014.10.10.03.42.16
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 10 Oct 2014 03:42:16 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 10 Oct 2014 12:43:23 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20141010104323.GL12322@jama>
References: <543689B7.5050109@urbanec.net>
MIME-Version: 1.0
In-Reply-To: <543689B7.5050109@urbanec.net>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [PATCH] Fix for gcc bug 61144
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
X-List-Received-Date: Fri, 10 Oct 2014 10:42:21 -0000
X-Groupsio-MsgNum: 52427
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qo7zVO9a9OQ5oQtr"
Content-Disposition: inline

--qo7zVO9a9OQ5oQtr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 10, 2014 at 12:12:23AM +1100, Peter Urbanec wrote:
> See https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D61144 for details.
>=20
> This patch is taken from the gcc repository and should be obsoleted by a=
=20
> gcc release after 4.9.1
>=20
> The problem is severe enough (at least from my point of view) to need=20
> this patch until the next gcc release is available.

Wrong MP, this belongs to oe-core ML.

> commit 03ae7912aadbf3b55b966a1367f07c7dbbddda80
> Author: Peter Urbanec
> Date:   Fri Oct 10 00:03:28 2014 +1100
>=20
>     gcc: Patch for gcc bug 61144.
>    =20
>     This fixes gcc bug 6144, which in my case exhibited itself as a kernel
>     module that failed to load. This was because static platform_data
>     structures were being corrupted with the optimiser being set to any
>     value other than -O0.
>=20
> diff --git a/meta/recipes-devtools/gcc/gcc-4.9.inc b/meta/recipes-devtool=
s/gcc/gcc-4.9.inc
> index 25778bd..9a66cd2 100644
> --- a/meta/recipes-devtools/gcc/gcc-4.9.inc
> +++ b/meta/recipes-devtools/gcc/gcc-4.9.inc
> @@ -70,6 +70,7 @@ SRC_URI =3D "\
>      file://0053-gcc-fix-segfault-from-calling-free-on-non-malloc-d-a.pat=
ch \
>      file://0054-gcc-Makefile.in-fix-parallel-building-failure.patch \
>      file://0055-PR-rtl-optimization-61801.patch \
> +    file://0056-top-level-reorder_gcc-bug-61144.patch \
>  "
>  SRC_URI[md5sum] =3D "fddf71348546af523353bd43d34919c1"
>  SRC_URI[sha256sum] =3D "d334781a124ada6f38e63b545e2a3b8c2183049515a1abab=
6d513f109f1d717e"
> diff --git a/meta/recipes-devtools/gcc/gcc-4.9/0056-top-level-reorder_gcc=
-bug-61144.patch b/meta/recipes-devtools/gcc/gcc-4.9/0056-top-level-reorder=
_gcc-bug-61144.patch
> new file mode 100644
> index 0000000..11fa969
> --- /dev/null
> +++ b/meta/recipes-devtools/gcc/gcc-4.9/0056-top-level-reorder_gcc-bug-61=
144.patch
> @@ -0,0 +1,25 @@
> +--- /dev/null
> ++++ b/meta/recipes-devtools/gcc/gcc-4.9/0056-top-level-reorder_gcc-bug-6=
1144.patch
> +@@ -0,0 +1,21 @@
> ++--- a/gcc/varpool.c    2014/10/05 02:50:01     215895
> +++++ b/gcc/varpool.c    2014/10/05 04:52:19     215896
> ++@@ -329,8 +329,16 @@
> ++
> ++   /* Variables declared 'const' without an initializer
> ++      have zero as the initializer if they may not be
> ++-     overridden at link or run time.  */
> ++-  if (!DECL_INITIAL (real_decl)
> +++     overridden at link or run time.
> +++
> +++     It is actually requirement for C++ compiler to optimize const var=
iables
> +++     consistently. As a GNU extension, do not enfore this rule for use=
r defined
> +++     weak variables, so we support interposition on:
> +++     static const int dummy =3D 0;
> +++     extern const int foo __attribute__((__weak__, __alias__("dummy"))=
);
> +++   */
> +++  if ((!DECL_INITIAL (real_decl)
> +++       || (DECL_WEAK (decl) && !DECL_COMDAT (decl)))
> ++       && (DECL_EXTERNAL (decl) || decl_replaceable_p (decl)))
> ++     return error_mark_node;
> ++=20
> +

> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--qo7zVO9a9OQ5oQtr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlQ3uEsACgkQN1Ujt2V2gBzo9ACaAhkKl2Y5hvhHD0lb04zMiR40
1HMAnjNNSv1rRDPmgA79cBH0ecyojWAz
=400p
-----END PGP SIGNATURE-----

--qo7zVO9a9OQ5oQtr--
