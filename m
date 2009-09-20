Received: from [209.85.221.175] (helo=mail-qy0-f175.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1MpO7Q-0007Pv-7o
	for openembedded-devel@lists.openembedded.org;
	Sun, 20 Sep 2009 17:14:31 +0200
Received: by qyk5 with SMTP id 5so207808qyk.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Sep 2009 08:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=sck6PgRislpEfHgIlBm1VJTImi6cSE0mxz2TKKptBZU=;
	b=IeYn0/0CFd+pfyrpgDfcqEJGMdIf+aCO7p8EgPr01YfcIbkJwrLJkYryrnHM3lfrl1
	EBpTvZPmHTx4VqQx6SZNUMZhpO3c6AGMsnXOHzzRnPV0vcloGA91tN1ZMRbk3jaA44oM
	vUN3IQGi2bBUnPHuUL4hdFnV2uY0KycdQNld8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=PdWrev+MMw9+EX8wWepaYnH++xrL20QeiA9Dqdmv4N4tRf+HuiZ5aft8b//pzxTGQ7
	QHtBAOLYg3N6vol58Sn4AYjOTb7LjrNgf/wwwXma7p8msUPCtg0nCUKSRYTCP732pchb
	/oTwWlmo0ugawB6MHGBJBOP4K9nX8jnFn04bA=
MIME-Version: 1.0
Received: by 10.229.15.75 with SMTP id j11mr851706qca.69.1253459632305; Sun, 
	20 Sep 2009 08:13:52 -0700 (PDT)
In-Reply-To: <1253428380-27587-1-git-send-email-denis@denix.org>
References: <1253428380-27587-1-git-send-email-denis@denix.org>
Date: Sun, 20 Sep 2009 08:13:52 -0700
Message-ID: <19c1b8a90909200813u30642a87g38fc83cfb2b59d36@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.221.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [RFC][PATCH] package.bbclass: export subpackage individual version, if different from main
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
X-List-Received-Date: Sun, 20 Sep 2009 15:14:31 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 19, 2009 at 11:33 PM, Denys Dmytriyenko <denis@denix.org> wrote=
:
> Fixes the wrong versioned runtime dependency for shlib subpackages with
> own versions. Consider this:
>
> PACKAGES =3D "libfoo libbar"
> PV_libfoo =3D "1"
> PV_libbar =3D "2"
> PV =3D "3"
>
> That will generate libfoo_1 and libbar_2 packages, but version 3 will be
> exported in shlibs database, leading to the following versioned runtime
> dependencies:
>
> RDEPENDS: libfoo (>=3D3) libbar (>=3D3)

Can RPROVIDES fill in this void somehow.

>
> This fixes the problem.
>
> Signed-off-by: Denys Dmytriyenko <denis@denix.org>
>
> ---
> =C2=A0classes/package.bbclass | =C2=A0 =C2=A06 +++++-
> =C2=A01 files changed, 5 insertions(+), 1 deletions(-)
>
> diff --git a/classes/package.bbclass b/classes/package.bbclass
> index 5a9fa50..7a0ba80 100644
> --- a/classes/package.bbclass
> +++ b/classes/package.bbclass
> @@ -652,6 +652,10 @@ python package_do_shlibs() {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0needs_ldconfig =3D=
 False
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.debug(2, "calcu=
lating shlib provides for %s" % pkg)
>
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pkgver =3D bb.data.get=
Var('PV_' + pkg, d, 1)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if not pkgver:
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 pkgver =3D ver
> +
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0needed[pkg] =3D []
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sonames =3D list()
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0top =3D os.path.jo=
in(pkgdest, pkg)
> @@ -696,7 +700,7 @@ python package_do_shlibs() {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0fd.close()
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0package_stagefile(shlibs_file, d)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0fd =3D open(shver_file, 'w')
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 fd.write(ver + '\n')
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 fd.write(pkgver + '\n')
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0fd.close()
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0package_stagefile(shver_file, d)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if needs_ldconfig =
and use_ldconfig:
> --
> 1.6.3.3
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


