Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f43.google.com (mail-ee0-f43.google.com [74.125.83.43])
	by mail.openembedded.org (Postfix) with ESMTP id 7266565D8D
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Apr 2014 11:19:00 +0000 (UTC)
Received: by mail-ee0-f43.google.com with SMTP id e53so2931061eek.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Apr 2014 04:19:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=wZQnaQYqLhkd9QnXY3zpy9IL28PRhJcJz22RzeLX5cU=;
	b=ipZ7vBEFxLTuLliQso93jRTWQ1B/AjKIixUyJl0LFCqnx8Oa7cN/Z6xIC3wxRe7Gge
	Q2rABDc28aovjotxwkjyieMrJpJBB+A0klG71d87uAGsJSFCbbHL019JuLm3rTdHPAsz
	I/LBPo1IWoZ/FZ5dotiaaW5xKjbn2aYeXNDgMxqNePP1TUyYkNHaDvZjSzUkQ+EMZgPb
	RmmiiDlERewPK3CdAlteiFnzNDx8Uj1hm4+yy3ObeMaPrnkyz6ff6yE7DPUatWMnZ1c2
	QTqmIOoBKxy9oe2fqJ+IB9Ga/+5Z1ZP62cK4SjurMpzWoXP0HervvZt9P+0qVIYEYiXg
	SoVg==
X-Received: by 10.15.45.130 with SMTP id b2mr37912900eew.28.1397992741243;
	Sun, 20 Apr 2014 04:19:01 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	o7sm93759674eew.25.2014.04.20.04.18.59
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 20 Apr 2014 04:19:00 -0700 (PDT)
Date: Sun, 20 Apr 2014 13:19:05 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140420111905.GQ2486@jama>
References: <1397330049-20282-1-git-send-email-paul@paulbarker.me.uk>
	<1397330049-20282-2-git-send-email-paul@paulbarker.me.uk>
MIME-Version: 1.0
In-Reply-To: <1397330049-20282-2-git-send-email-paul@paulbarker.me.uk>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [PATCH] vim: Upgrade to v7.4.258
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
X-List-Received-Date: Sun, 20 Apr 2014 11:19:00 -0000
X-Groupsio-MsgNum: 49324
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="dwlrTrmaMopxYcLA"
Content-Disposition: inline

--dwlrTrmaMopxYcLA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 12, 2014 at 08:14:09PM +0100, Paul Barker wrote:
> The patch against configure.in was resubmitted to the vim mailing list an=
d was
> merged into the upstream sources so is no longer needed.

Merged, thanks!

>=20
> Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
> ---
>  .../vim/files/configure.in_remove_CC_quotes.patch       | 17 -----------=
------
>  .../vim/{vim_7.4.155.bb =3D> vim_7.4.258.bb}              |  5 ++---
>  2 files changed, 2 insertions(+), 20 deletions(-)
>  delete mode 100644 meta-oe/recipes-support/vim/files/configure.in_remove=
_CC_quotes.patch
>  rename meta-oe/recipes-support/vim/{vim_7.4.155.bb =3D> vim_7.4.258.bb} =
(96%)
>=20
> diff --git a/meta-oe/recipes-support/vim/files/configure.in_remove_CC_quo=
tes.patch b/meta-oe/recipes-support/vim/files/configure.in_remove_CC_quotes=
=2Epatch
> deleted file mode 100644
> index c8cfe8e..0000000
> --- a/meta-oe/recipes-support/vim/files/configure.in_remove_CC_quotes.pat=
ch
> +++ /dev/null
> @@ -1,17 +0,0 @@
> -upstream: http://groups.google.com/group/vim_dev/browse_thread/thread/56=
85c3b859e3c793#=20
> -status: reported upstream
> ---- vim72-orig/src/configure.in	2010-09-29 19:13:33.000000000 +0200
> -+++ vim72/src/configure.in	2010-09-29 19:17:07.000000000 +0200
> -@@ -35,10 +35,10 @@
> - fi
> - if test "$GCC" =3D yes; then
> -   dnl method that should work for nearly all versions
> --  gccversion=3D`"$CC" -dumpversion`
> -+  gccversion=3D`$CC -dumpversion`
> -   if test "x$gccversion" =3D "x"; then
> -     dnl old method; fall-back for when -dumpversion doesn't work
> --    gccversion=3D`"$CC" --version | sed -e '2,$d' -e 's/darwin.//' -e '=
s/^[[^0-9]]*\([[0-9]]\.[[0-9.]]*\).*$/\1/g'`
> -+    gccversion=3D`$CC --version | sed -e '2,$d' -e 's/darwin.//' -e 's/=
^[[^0-9]]*\([[0-9]]\.[[0-9.]]*\).*$/\1/g'`
> -   fi
> -   dnl version 4.0.1 was reported to cause trouble on Macintosh by Marci=
n Dalecki
> -   if test "$gccversion" =3D "3.0.1" -o "$gccversion" =3D "3.0.2" -o "$g=
ccversion" =3D "4.0.1"; then
> diff --git a/meta-oe/recipes-support/vim/vim_7.4.155.bb b/meta-oe/recipes=
-support/vim/vim_7.4.258.bb
> similarity index 96%
> rename from meta-oe/recipes-support/vim/vim_7.4.155.bb
> rename to meta-oe/recipes-support/vim/vim_7.4.258.bb
> index 0d98e7a..878c79e 100644
> --- a/meta-oe/recipes-support/vim/vim_7.4.155.bb
> +++ b/meta-oe/recipes-support/vim/vim_7.4.258.bb
> @@ -6,9 +6,8 @@ RSUGGESTS_${PN} =3D "diffutils"
>  LICENSE =3D "vim"
>  LIC_FILES_CHKSUM =3D "file://../runtime/doc/uganda.txt;md5=3Db779e18be6e=
d77facc770691c967b8f8"
> =20
> -SRC_URI =3D "hg://vim.googlecode.com/hg/;protocol=3Dhttps;module=3Dvim \
> -	   file://configure.in_remove_CC_quotes.patch;patchdir=3D.."
> -SRCREV =3D "v7-4-155"
> +SRC_URI =3D "hg://vim.googlecode.com/hg/;protocol=3Dhttps;module=3Dvim"
> +SRCREV =3D "v7-4-258"
> =20
>  S =3D "${WORKDIR}/${PN}/src"
> =20
> --=20
> 1.9.2
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--dwlrTrmaMopxYcLA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlNTrSkACgkQN1Ujt2V2gBxIXgCcD/pRg2hT1cj4syk0nUYmxrXN
EQoAnAvx1wm/nEpNsjwrALekQu/W2ddp
=ayY8
-----END PGP SIGNATURE-----

--dwlrTrmaMopxYcLA--
