Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id A6069601F6
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 May 2016 14:08:34 +0000 (UTC)
Received: from svr-orw-fem-02x.mgc.mentorg.com ([147.34.96.206]
	helo=SVR-ORW-FEM-02.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1azlrO-00005v-I8 from Joe_MacDonald@mentor.com ;
	Mon, 09 May 2016 07:08:34 -0700
Received: from burninator (147.34.91.1) by svr-orw-fem-02.mgc.mentorg.com
	(147.34.96.168) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 9 May 2016 07:08:34 -0700
Received: by burninator (Postfix, from userid 1000)	id 23494581180; Mon,  9
	May 2016 10:08:33 -0400 (EDT)
Date: Mon, 9 May 2016 10:08:33 -0400
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Message-ID: <20160509140831.GC21815@mentor.com>
References: <1462734493-3819-1-git-send-email-paul.gortmaker@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1462734493-3819-1-git-send-email-paul.gortmaker@windriver.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-704 http://www.vim.org
User-Agent: Mutt/1.5.23 (2014-03-12)
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
X-List-Received-Date: Mon, 09 May 2016 14:08:36 -0000
X-Groupsio-MsgNum: 61431
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="lMM8JwqTlfDpEaS6"
Content-Disposition: inline

--lMM8JwqTlfDpEaS6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[[PATCH v2 0/2] netcf build fail / gnulib handling fix.] On 16.05.08 (Sun 1=
5:08) Paul Gortmaker wrote:

> In the previous version[1] of the attempt to fix the netcf build on
> newer hosts, Martin noted that my change broke fontforge.
>=20
> The reason for that is the ./bootstrap in fontforge is older and
> doesn't support the "--no-git" option I used for netcf.
>=20
> This highlighted the fact that we will want to be able to use
> different args to the ./bootstrap for different packages.
>=20
> The first commit moves the configure_prepend step as-is out to
> the packages, so we can do the above, and thus making
> autotools-bootstrap unused in the process.
>=20
> The second commit fixes the netcf prepend to not overwrite
> contents from the netcf package itself, which was the source
> of the build failure.
>=20
> The functionality of the prepend for fontforge is left as-is
> so that it will continue to build w/o issue.

I've no objection to this change, it seems sensible and low-impact to
me.  That said, if there's any objection to removing the
autotools-bootstrap class, I'd also support a version of this that
leaves the class but divorces netcf from it.

I wonder, though, now that I'm thinking about it, if the crux of the
change is going from:

 21     # | ...
 22     ./bootstrap --force
 23     cd $currdir
 24 }

to something like:

 21     # | ...
 22     ./bootstrap --force --no-git --gnulib-srcdir=3D.gnulib
 23     cd $currdir
 24 }

with the extra logic around the "rmdir .gnulib" being somewhat
peripheral, would it be possible to extend the class instead with a new
varaible that would be set in the respective recipe file, using, say,
breakpad.bbclass as an example?

What I'm thinking of here is something like this:

>>> do_configure_prepend() {
>>>     currdir=3D`pwd`
>>>     cd ${S}
>>>=20
>>>     rmdir ${S}/.gnulib || cat >.gitmodules <<EOF
>>> [submodule "gnulib"]
>>>    path =3D gnulib
>>>    url =3D git://git.sv.gnu.org/gnulib
>>> EOF
>>>     if [ -d ${S}/.gnulib ] ; then
>>>         cp -rf ${STAGING_DATADIR}/gnulib ${S}
>>>     else
>>>         cp -rf ${STAGING_DATADIR}/gnulib ${S}
>>>     fi
>>>=20
>>>     # --force to avoid errors on reconfigure e.g if recipes changed we =
depend on
>>>     # | bootstrap: running: libtoolize --quiet
>>>     # | libtoolize:   error: 'libltdl/COPYING.LIB' exists: use '--force=
' to overwrite
>>>     # | ...
>>>     ./bootstrap --force ${BOOTSTRAP_EXTRA}
>>>     cd $currdir
>>> }

then in fontforge, just leave everything as-is (until it gets a review /
update / whatever) and in netcf's recipe we just add a line:

   BOOTSTRAP_EXTRA =3D "--no-git --gnulib-srcdir=3D.gnulib"

Obviously the above is all un-tested and mostly just off-the-top-of-
my-head thinking, so maybe it's completely unworkable.  If Martin is
okay with the patches as sent, I'm fine with them too.

--=20
-Joe MacDonald.
:wq

--lMM8JwqTlfDpEaS6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJXMJnaAAoJEEn8ffcsOfaWvy8IALo7d++3il3b2/mgSX8OszUH
lugv4dbw273YR/gnssuG1ImXYBP3s2/5/fbyvGiMavwWVpauF2sjnFIfDKXIrZgZ
wZ5imMWbWauKbeMarLtmTtCehlNSt436wsumKENUm7/wrYkRh7T9JheP7Ysp9iKj
FdZNz6Gy48hcrDzUtqsWCbg70MHUf8KTeL8zNavKX8ZbK63Q3LCeh6PbXRtAfjtO
KO26oNAgBlsX75/y99SWNqsYjgMvrvKdKLS8mFPp8rzeHXikeyMnSpb7m9l6CmRo
f6p7O85IVaZVKHMgSyv+YdHLf7lyMhCrxYkKPs9TY9Bv6hcjhwryawvjpBdgPCA=
=w/kz
-----END PGP SIGNATURE-----

--lMM8JwqTlfDpEaS6--
