Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 8A1796E630
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 May 2016 14:26:46 +0000 (UTC)
Received: by mail-wm0-f43.google.com with SMTP id n129so140333634wmn.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 May 2016 07:26:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=DIvBWoS5q82iuLj3cCa4l17zp81iMrAH5feg4Bii89U=;
	b=j8Pb8QLnTJZ4RvJvbGx3pqd90e8g+uPyNaIG6lT2v7bOBddBC1Bw01yVXEJ87ZBqQW
	t7CAbI7OfGVnWY2OFV3q/2zFKVuKYA7DRVZiVcKLV/D45/e9Rt1qqbb0A+5SQzniBo71
	yF9dNHI49+TVY/ACZrtIoWPhy39bi/VvpDAWyoxiBxU2lvk3a0yU9ooimkHD5srzjRPU
	/BrLMfaX4XbzOTPVE/XSyaKyiHYc2nG+9i7XSOp46FskMCN/SdeY/30l8RhVQQ5JpIc2
	QiILgTYONkbD3GmlK6G0IEz4As8Qh7UAPMrDAyL6dw/QWuNWOeFYZ0tVFDGR8o6Ammzc
	m99Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=DIvBWoS5q82iuLj3cCa4l17zp81iMrAH5feg4Bii89U=;
	b=OzssqvD3aiAjpdnPim+OOftl8C3BOxTAAPjSNPczCIyJjrfevJAbAsoPIgW8NeXTvP
	Od0SG/mzJ4cVYhQMbs7+fAZBYexX0Lr0H/g+WSsFkV1PSdeFNMZ/nDR0pyeBFpzJ/8ex
	SruJNRSu1th8ffLJcmp0b8QosS6JVfmyucCKSchoXRW7WVGNsVzt7isNRbazlmH7V4DV
	G8GbZGAy6ioBBuGH+j3W1cHa6GRm8bmEK0mZT7UInZ1oeU8X9meiXi8VDZP+poyBldOn
	+VJpGjffW0EqLd06cygjuiXWVPJixr+I8X7jFAAjvXU5x7rknXgyZkyRAMhwLly9NKXl
	QC8g==
X-Gm-Message-State: AOPr4FUFZJzdU0y/wCexFLZzI6E3tTxADd13hJpTNvOMl9ANpqtQ3yYwN0IxzGoqBmHoRg==
X-Received: by 10.194.173.161 with SMTP id bl1mr33780915wjc.11.1462804007108; 
	Mon, 09 May 2016 07:26:47 -0700 (PDT)
Received: from localhost ([86.49.34.37]) by smtp.gmail.com with ESMTPSA id
	ju3sm31507074wjb.11.2016.05.09.07.26.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 09 May 2016 07:26:45 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 9 May 2016 16:26:54 +0200
To: Joe MacDonald <Joe_MacDonald@mentor.com>
Message-ID: <20160509142654.GC2560@jama>
References: <1462734493-3819-1-git-send-email-paul.gortmaker@windriver.com>
	<20160509140831.GC21815@mentor.com>
MIME-Version: 1.0
In-Reply-To: <20160509140831.GC21815@mentor.com>
User-Agent: Mutt/1.6.1 (2016-04-27)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH v2 0/2] netcf build fail / gnulib handling fix.
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
X-List-Received-Date: Mon, 09 May 2016 14:26:48 -0000
X-Groupsio-MsgNum: 61432
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="pAwQNkOnpTn9IO2O"
Content-Disposition: inline

--pAwQNkOnpTn9IO2O
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 09, 2016 at 10:08:33AM -0400, Joe MacDonald wrote:
> [[PATCH v2 0/2] netcf build fail / gnulib handling fix.] On 16.05.08 (Sun=
 15:08) Paul Gortmaker wrote:
>=20
> > In the previous version[1] of the attempt to fix the netcf build on
> > newer hosts, Martin noted that my change broke fontforge.
> >=20
> > The reason for that is the ./bootstrap in fontforge is older and
> > doesn't support the "--no-git" option I used for netcf.
> >=20
> > This highlighted the fact that we will want to be able to use
> > different args to the ./bootstrap for different packages.
> >=20
> > The first commit moves the configure_prepend step as-is out to
> > the packages, so we can do the above, and thus making
> > autotools-bootstrap unused in the process.
> >=20
> > The second commit fixes the netcf prepend to not overwrite
> > contents from the netcf package itself, which was the source
> > of the build failure.
> >=20
> > The functionality of the prepend for fontforge is left as-is
> > so that it will continue to build w/o issue.
>=20
> I've no objection to this change, it seems sensible and low-impact to
> me.  That said, if there's any objection to removing the
> autotools-bootstrap class, I'd also support a version of this that
> leaves the class but divorces netcf from it.
>=20
> I wonder, though, now that I'm thinking about it, if the crux of the
> change is going from:
>=20
>  21     # | ...
>  22     ./bootstrap --force
>  23     cd $currdir
>  24 }
>=20
> to something like:
>=20
>  21     # | ...
>  22     ./bootstrap --force --no-git --gnulib-srcdir=3D.gnulib
>  23     cd $currdir
>  24 }
>=20
> with the extra logic around the "rmdir .gnulib" being somewhat
> peripheral, would it be possible to extend the class instead with a new
> varaible that would be set in the respective recipe file, using, say,
> breakpad.bbclass as an example?
>=20
> What I'm thinking of here is something like this:
>=20
> >>> do_configure_prepend() {
> >>>     currdir=3D`pwd`
> >>>     cd ${S}
> >>>=20
> >>>     rmdir ${S}/.gnulib || cat >.gitmodules <<EOF
> >>> [submodule "gnulib"]
> >>>    path =3D gnulib
> >>>    url =3D git://git.sv.gnu.org/gnulib
> >>> EOF
> >>>     if [ -d ${S}/.gnulib ] ; then
> >>>         cp -rf ${STAGING_DATADIR}/gnulib ${S}
> >>>     else
> >>>         cp -rf ${STAGING_DATADIR}/gnulib ${S}
> >>>     fi
> >>>=20
> >>>     # --force to avoid errors on reconfigure e.g if recipes changed w=
e depend on
> >>>     # | bootstrap: running: libtoolize --quiet
> >>>     # | libtoolize:   error: 'libltdl/COPYING.LIB' exists: use '--for=
ce' to overwrite
> >>>     # | ...
> >>>     ./bootstrap --force ${BOOTSTRAP_EXTRA}
> >>>     cd $currdir
> >>> }
>=20
> then in fontforge, just leave everything as-is (until it gets a review /
> update / whatever) and in netcf's recipe we just add a line:
>=20
>    BOOTSTRAP_EXTRA =3D "--no-git --gnulib-srcdir=3D.gnulib"
>=20
> Obviously the above is all un-tested and mostly just off-the-top-of-
> my-head thinking, so maybe it's completely unworkable.  If Martin is
> okay with the patches as sent, I'm fine with them too.

I'm fine with current patches, but was wondering the same, why not
introduce variable so that the same bbclass can be used by both "new"
and "old" bootstrap versions.

But I don't know anything about this bootstrap, so cannot say if we can
expect only these 2 variants or if every bootstrap usage is really
specific to given recipe and not worth sharing the common part in bbclass.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--pAwQNkOnpTn9IO2O
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlcwni4ACgkQN1Ujt2V2gBwUoACfQwbZ+NrhkkJB45kEhtp0Lgsk
7XsAoINF6H/ntSQBXxCOPWoUCiq9tF/U
=z5ph
-----END PGP SIGNATURE-----

--pAwQNkOnpTn9IO2O--
