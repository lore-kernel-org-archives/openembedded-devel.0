Return-Path: <martin.jansa@gmail.com>
Received: from mail-lf0-f50.google.com (mail-lf0-f50.google.com
	[209.85.215.50])
	by mail.openembedded.org (Postfix) with ESMTP id 423B376A51
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  3 Apr 2016 15:44:44 +0000 (UTC)
Received: by mail-lf0-f50.google.com with SMTP id c126so17044873lfb.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 03 Apr 2016 08:44:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=Guq0wO7GeElbmD8ygkmNlPqZayy75ApYa+cF0YhTIpM=;
	b=M90BXmIMiiBTU7kL6D0xj3Ex37akWjUj4i8XMVRqrWEuLEO9gJf0kGo0rwEKcZgC3h
	P7k2Q4ySRicBTDIqbN0s8hDafWS84C6ztFwXzxr9o5friH7nUj93L5V4sjAPCjAu14cr
	7wSYuoZbfPDGagy0IT66hShQzDs3tJGCvz5jl4OKQ/s+VdBzB3Su80YKihOeRKKJyjZJ
	iz026eOr27w3ZkcbjeunpM2ATJTJDUwNKnIjDysvoe8MsAWFcSuil4di2UnzoU42cV9o
	C6/kybVv2ZT0Nu0PwvIrorGU5K6/j06p/j+rDjOHmq5x/sJtI2moJ0r7XGMpShpwp7k4
	UgwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=Guq0wO7GeElbmD8ygkmNlPqZayy75ApYa+cF0YhTIpM=;
	b=CR6c5AwtRDXqBIY+4UmoQaU/XuaTWZwDiy+ZxLr3mo1WF2t3pWuZwmKIBqFsvD6i56
	KwgDhZ7ev85m8QFCiK+inH/C9tbEzCytlRL4zkml6rKB7PG2uyeCXFsqk47Z0Tztveek
	WyryCWqCgEHvP0vgs53J9L7LyzpY00cBPU0Kb+KqpucNUTztYkzNgiGkB/gCo7vtyyFJ
	mkXHQtjWRbdn4LVRvdYmKlKdj+2Slmn/z3phP08v9YGryDg/pZISDXhQYjYhjCFt4Hde
	djuV/4TZphEVETc0H6XYbPPcZjDOoB7iDaBIuCu6pa4tZ5IczD9XiYzii7Y7hRJPja5o
	mG+A==
X-Gm-Message-State: AD7BkJJtkmAx+wAAb/aOhurSpSU2psc+w5dWjSl/fGTJOZ0qRIjIWThu0hqVAWW0trwM2A==
X-Received: by 10.194.122.138 with SMTP id ls10mr13992547wjb.51.1459698283989; 
	Sun, 03 Apr 2016 08:44:43 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	t3sm24381870wjz.11.2016.04.03.08.44.42
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 03 Apr 2016 08:44:42 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Sun, 3 Apr 2016 17:45:06 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160403154506.GA27687@jama>
References: <1459453082-22086-1-git-send-email-paul.gortmaker@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1459453082-22086-1-git-send-email-paul.gortmaker@windriver.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [PATCH] autotools-bootstrap: don't fake submodule to avoid gnulib download
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
X-List-Received-Date: Sun, 03 Apr 2016 15:44:47 -0000
X-Groupsio-MsgNum: 60807
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="2oS5YaxWCcQjTEyO"
Content-Disposition: inline

--2oS5YaxWCcQjTEyO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 31, 2016 at 03:38:02PM -0400, Paul Gortmaker wrote:
> We were creating a .gitmodules on the fly to avoid downloading the
> gnulib via git.  However this is problematic if the pkg had its own
> .gitmodules already -- we'd clobber it and this breaks netcf build:
>=20
>    ./bootstrap: getting gnulib files...
>    error: pathspec 'gnulib' did not match any file(s) known to git.
>=20
> There is a more proper way to do this:  bootstrap supports this:
>=20
>  --no-git           do not use git to update gnulib.  Requires that
>                     --gnulib-srcdir point to a correct gnulib snapshot

This breaks fontforge build:
http://errors.yoctoproject.org/Errors/Details/59785/

>=20
> and if we use that, we can use our sysroot copy of gnulib without
> having to fake a .gitmodules submodule file.  This keeps the build
> of netcf happy.
>=20
> Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
>=20
> diff --git a/meta-oe/classes/autotools-bootstrap.bbclass b/meta-oe/classe=
s/autotools-bootstrap.bbclass
> index 8d7af1b47222..cae037559aa4 100644
> --- a/meta-oe/classes/autotools-bootstrap.bbclass
> +++ b/meta-oe/classes/autotools-bootstrap.bbclass
> @@ -7,18 +7,13 @@ do_configure_prepend() {
>      currdir=3D`pwd`
>      cd ${S}
> =20
> -    # avoid bootstrap cloning gnulib on every configure
> -    cat >.gitmodules <<EOF
> -[submodule "gnulib"]
> -	path =3D gnulib
> -	url =3D git://git.sv.gnu.org/gnulib
> -EOF
> +    # avoid bootstrap cloning gnulib on every configure, hence "--no-git=
".
>      cp -rf ${STAGING_DATADIR}/gnulib ${S}
> =20
>      # --force to avoid errors on reconfigure e.g if recipes changed we d=
epend on
>      # | bootstrap: running: libtoolize --quiet
>      # | libtoolize:   error: 'libltdl/COPYING.LIB' exists: use '--force'=
 to overwrite
>      # | ...
> -    ./bootstrap --force
> +    ./bootstrap --force --no-git --gnulib-srcdir=3Dgnulib
>      cd $currdir
>  }
> --=20
> 2.7.2
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--2oS5YaxWCcQjTEyO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlcBOn8ACgkQN1Ujt2V2gBxYtQCfT9m178XZ3IuyyQsWpfK6tvt5
tz8Anjn52LKVSDNlqtz9vFRu0VPXO3zo
=sTnH
-----END PGP SIGNATURE-----

--2oS5YaxWCcQjTEyO--
