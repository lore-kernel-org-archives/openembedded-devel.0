Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 0F87977C4D
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Apr 2017 15:53:23 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga105.jf.intel.com with ESMTP; 06 Apr 2017 08:53:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,160,1488873600"; d="scan'208,217";a="85384148"
Received: from acucurul-mobl.ger.corp.intel.com ([10.252.23.88])
	by fmsmga005.fm.intel.com with ESMTP; 06 Apr 2017 08:53:23 -0700
From: Tim Orling <timothy.t.orling@linux.intel.com>
Message-Id: <135C9ECC-83BB-47C4-8E41-75879D7797F6@linux.intel.com>
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Date: Thu, 6 Apr 2017 17:53:21 +0200
In-Reply-To: <CAP9mK5MgaDEeYtGuCfB4o_nhoyHkVW+YiRacb95OKcifK_bL4w@mail.gmail.com>
To: Andrej Rode <andrej.rode@ettus.com>
References: <20170406011225.25591-1-andrej.rode@ettus.com>
	<171FD608-F7C9-4CE8-9401-5E2848728E63@linux.intel.com>
	<CAP9mK5MgaDEeYtGuCfB4o_nhoyHkVW+YiRacb95OKcifK_bL4w@mail.gmail.com>
X-Mailer: Apple Mail (2.3273)
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-python][PATCH] systemd-python: add a new recipe
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
X-List-Received-Date: Thu, 06 Apr 2017 15:53:24 -0000
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable


> On Apr 6, 2017, at 9:13 AM, Andrej Rode <andrej.rode@ettus.com> wrote:
>=20
>=20
> On Wed, Apr 5, 2017 at 11:30 PM, Tim Orling =
<timothy.t.orling@linux.intel.com =
<mailto:timothy.t.orling@linux.intel.com>> wrote:
>=20
> > On Apr 6, 2017, at 3:12 AM, Andrej Rode <andrej.rode@ettus.com =
<mailto:andrej.rode@ettus.com>> wrote:
> >
> > Adds new recipe for systemd-python, python bindings for libsystemd
> >
>=20
> This is breaking Debian naming for python packages, it should be =
python-systemd, not systemd-python. We need to be consistent.
> =20
> I thought about python-systemd-python, but that looked silly. =
python-systemd is probably acceptable.

I agree. I=E2=80=99ve had similar issues with naming of perl modules in =
the past=E2=80=A6

> =20
> > Signed-off-by: Andrej Rode <andrej.rode@ettus.com =
<mailto:andrej.rode@ettus.com>>
> > ---
> > meta-python/recipes-devtools/python/systemd-python_234.bb =
<http://systemd-python_234.bb/> | 11 +++++++++++
> > 1 file changed, 11 insertions(+)
> > create mode 100644 =
meta-python/recipes-devtools/python/systemd-python_234.bb =
<http://systemd-python_234.bb/>
> >
> > diff --git =
a/meta-python/recipes-devtools/python/systemd-python_234.bb =
<http://systemd-python_234.bb/> =
b/meta-python/recipes-devtools/python/systemd-python_234.bb =
<http://systemd-python_234.bb/>
> > new file mode 100644
> > index 0000000..4cfa629
> > --- /dev/null
> > +++ b/meta-python/recipes-devtools/python/systemd-python_234.bb =
<http://systemd-python_234.bb/>
> > @@ -0,0 +1,11 @@
> > +SUMMARY =3D "Python interface for libsystemd"
> > +HOMEPAGE =3D "https://github.com/systemd/systemd-python =
<https://github.com/systemd/systemd-python>=E2=80=9D

This URL 404s for me.
It looks like it should be:
https://github.com/systemd/python-systemd

And FWIW, Debian itself uses =E2=80=98python-systemd=E2=80=99 for the =
package name:
https://anonscm.debian.org/cgit/pkg-systemd/python-systemd.git

It looks like PyPi is where the confusion comes in:
https://pypi.python.org/pypi/systemd-python/234

Cheers.

=E2=80=94Tim

> > +LICENSE =3D "LGPLv2+"
> > +LIC_FILES_CHKSUM =3D =
"file://LICENSE.txt;md5=3D4fbd65380cdd255951079008b364516c"
> > +DEPENDS +=3D "systemd"
> > +RDEPENDS_${PN} +=3D "systemd"
> > +
> > +SRC_URI[md5sum] =3D "5071ea5bcb976186e92a3f5e75df221d"
> > +SRC_URI[sha256sum] =3D =
"fd0e44bf70eadae45aadc292cb0a7eb5b0b6372cd1b391228047d33895db83e7"
> > +
> > +inherit pypi setuptools
> > --
> > 2.10.2
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org =
<mailto:Openembedded-devel@lists.openembedded.org>
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel =
<http://lists.openembedded.org/mailman/listinfo/openembedded-devel>
>=20
>=20


