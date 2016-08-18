Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 76B5977026
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Aug 2016 18:20:12 +0000 (UTC)
Received: from svr-orw-fem-05.mgc.mentorg.com ([147.34.97.43])
	by relay1.mentorg.com with esmtp 
	id 1baRvA-0000AI-25 from Joe_MacDonald@mentor.com ;
	Thu, 18 Aug 2016 11:20:04 -0700
Received: from burninator (147.34.91.1) by svr-orw-fem-05.mgc.mentorg.com
	(147.34.97.43) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 18 Aug 2016 11:20:03 -0700
Received: by burninator (Postfix, from userid 1000)	id 0A3F3581216; Thu, 18
	Aug 2016 14:20:03 -0400 (EDT)
Date: Thu, 18 Aug 2016 14:20:03 -0400
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: "Slater, Joseph" <joe.slater@windriver.com>
Message-ID: <20160818182002.GA4892@mentor.com>
References: <1471465334-32622-1-git-send-email-jslater@windriver.com>
	<69F4079B-660E-417C-827B-8D7458865C6E@gmail.com>
	<007BD92917A2324FA403BCF9A464CF84B62087B0@ALA-MBA.corp.ad.wrs.com>
MIME-Version: 1.0
In-Reply-To: <007BD92917A2324FA403BCF9A464CF84B62087B0@ALA-MBA.corp.ad.wrs.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-704 http://www.vim.org
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH 1/1] yp-tools: fix compile errors
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
X-List-Received-Date: Thu, 18 Aug 2016 18:20:13 -0000
X-Groupsio-MsgNum: 62733
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="a8Wt8u1KmwUX3Y2C"
Content-Disposition: inline

--a8Wt8u1KmwUX3Y2C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Re: [oe] [meta-networking][PATCH 1/1] yp-tools: fix compile errors] On 16.=
08.18 (Thu 16:52) Slater, Joseph wrote:

>=20
>=20
> > -----Original Message-----
> > From: openembedded-devel-bounces@lists.openembedded.org [mailto:openemb=
edded-devel-
> > bounces@lists.openembedded.org] On Behalf Of Khem Raj
> > Sent: Wednesday, August 17, 2016 4:20 PM
> > To: openembedded-devel@lists.openembedded.org
> > Subject: Re: [oe] [meta-networking][PATCH 1/1] yp-tools: fix compile er=
rors
> >=20
> >=20
> > > On Aug 17, 2016, at 1:22 PM, Joe Slater <jslater@windriver.com> wrote:
> > >
> > > Fix two fatal warnings.  The cast error only
> > > occurs for some architectures.
> > >
> > > Signed-off-by: Joe Slater <jslater@windriver.com>
> > > ---
> > > .../nis/yp-tools/alignment-cheat.patch             |   58 +++++++++++=
+++++++++
> > > .../recipes-support/nis/yp-tools_3.3.bb            |    3 +-
> > > 2 files changed, 59 insertions(+), 2 deletions(-)
> > > create mode 100644 meta-networking/recipes-support/nis/yp-tools/align=
ment-cheat.patch
> > >
> > > diff --git a/meta-networking/recipes-support/nis/yp-tools/alignment-c=
heat.patch b/meta-
> > networking/recipes-support/nis/yp-tools/alignment-cheat.patch
> > > new file mode 100644
> > > index 0000000..856e42e
> > > --- /dev/null
> > > +++ b/meta-networking/recipes-support/nis/yp-tools/alignment-cheat.pa=
tch
> > > @@ -0,0 +1,58 @@
> > > +yp-tools: avoid fatal cast warning
> > > +
> > > +The way casting is done, we will get a fatal alignment warning on so=
me
> > > +architectures.  This patch cheats our way around this.
> > > +
> >=20
> > These changes look fine, however you should run it by the upstream.
>=20
> Version 4.2 of the tools seems to bear little resemblance to 3.3.  The co=
de and
> structures patched here no longer exist.

Hmm, in that case, I wonder why we wouldn't just do the uprev to 3.5
(the end of the line for the 3.x series) or 4.2.  More thinking out loud
than anything, I suppose, but if you know of a good reason to not push
3.3 off a cliff entirely, let me know.

> > > +We also eliminate an unused constant which causes a fatal warning.
> > > +
> > > +Upstream-status: Pending
> > > +
> > > +Signed-off-by: Joe Slater <jslater@windriver.com>
> > > +
> > > +
> > > +--- a/lib/do_ypcall.c
> > > ++++ b/lib/do_ypcall.c
> > > +@@ -44,7 +44,9 @@ struct dom_binding
> > > + typedef struct dom_binding dom_binding;
> > > +
> > > + static const struct timeval RPCTIMEOUT =3D {25, 0};
> > > ++#if 0
> > > + static const struct timeval UDPTIMEOUT =3D {5, 0};
> > > ++#endif
> >=20
> > perhaps its better to remove the unused code instead of making preproce=
ssor
> > work even more.
>=20
> Probably.  I think RPCTIMEOUT made it to 4.2, but UDPTIMEOUT did not.

So please make this change in your v2, then.  It's a personal bias
thing, probably, but it seems to me there's almost never any value to
leaving a "#if 0" block in code these days.  Particularly not when
we're talking about a patch that gets applied by quilt in the build
system which is then trivial to restore the deleted code if, for some
reason, you need it.

-J.

> > > + static int const MAXTRIES =3D 2;
> > > + static pthread_mutex_t ypbindlist_lock =3D PTHREAD_MUTEX_INITIALIZE=
R;
> > > + static dom_binding *ypbindlist =3D NULL;
> > > +@@ -381,7 +383,7 @@ __ypclnt_call (u_long prog, xdrproc_t xa
> > > +
> > > + int
> > > + do_ypcall (const char *domain, u_long prog, xdrproc_t xargs,
> > > +-	   caddr_t req, xdrproc_t xres, caddr_t resp)
> > > ++	   caddr_t req, xdrproc_t xres, void *resp)
> > > + {
> > > +   dom_binding *ydb;
> > > +   int status;
> > > +@@ -450,9 +452,9 @@ do_ypcall (const char *domain, u_long pr
> > > + /* Like do_ypcall, but translate the status value if necessary.  */
> > > + int
> > > + do_ypcall_tr (const char *domain, u_long prog, xdrproc_t xargs,
> > > +-	      caddr_t req, xdrproc_t xres, caddr_t resp)
> > > ++	      caddr_t req, xdrproc_t xres, void *resp)
> > > + {
> > > +-  int status =3D do_ypcall (domain, prog, xargs, req, xres, resp);
> > > ++  int status =3D do_ypcall (domain, prog, xargs, req, xres, (void *=
) resp);
> >=20
> > resp is already a void pointer why is this typecast needed ?
>=20
> I put it in someplace along the line in trying to fix the problem and for=
got
> to take it out.
>=20
> V2 or leave it?  This code does not look like it's going anywhere beyond =
here.
>=20
> Joe
>=20
>=20
> >=20
> > > +   if (status =3D=3D YPERR_SUCCESS)
> > > +     /* We cast to ypresp_val although the pointer could also be of
> > > +        type ypresp_key_val or ypresp_master or ypresp_order or
> > > +--- a/lib/internal.h
> > > ++++ b/lib/internal.h
> > > +@@ -17,8 +17,8 @@
> > > + #define _INTERNAL_H_
> > > +
> > > + extern int do_ypcall (const char *domain, u_long prog, xdrproc_t xa=
rgs,
> > > +-		      caddr_t req, xdrproc_t xres, caddr_t resp);
> > > ++		      caddr_t req, xdrproc_t xres, void *resp);
> > > + extern int do_ypcall_tr (const char *domain, u_long prog, xdrproc_t=
 xargs,
> > > +-			 caddr_t req, xdrproc_t xres, caddr_t resp);
> > > ++			 caddr_t req, xdrproc_t xres, void *resp);
> > > + extern int yp_maplist (const char *, struct ypmaplist **);
> > > + #endif
> > > diff --git a/meta-networking/recipes-support/nis/yp-tools_3.3.bb b/me=
ta-
> > networking/recipes-support/nis/yp-tools_3.3.bb
> > > index b89f0b8..69217fa 100644
> > > --- a/meta-networking/recipes-support/nis/yp-tools_3.3.bb
> > > +++ b/meta-networking/recipes-support/nis/yp-tools_3.3.bb
> > > @@ -11,11 +11,10 @@ ypwhich, yppasswd, domainname, nisdomainname \
> > > and ypdomainname. \
> > > "
> > >
> > > -PNBLACKLIST[yp-tools] ?=3D "BROKEN: fails to build for qemuarm."
> > > -
> > > SRC_URI =3D "http://www.linux-nis.org/download/yp-tools/${BP}.tar.bz2=
 \
> > >            file://domainname.service \
> > >            file://yp-tools-ipv4-ipv6-Provide-an-in-place-version-of-m=
apv4v6addr.patch \
> > > +           file://alignment-cheat.patch \
> > > "
> > > SRC_URI[md5sum] =3D "acebeecc11a73fb8097503670344834c"
> > > SRC_URI[sha256sum] =3D "812be817df3d4c25813552be336c6c6ad5aedaf65611b=
81af3ad9f98fb3c2e50"
> > > --
> > > 1.7.9.5
> > >
> > > --
> > > _______________________________________________
> > > Openembedded-devel mailing list
> > > Openembedded-devel@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>=20
--=20
-Joe MacDonald.
:wq

--a8Wt8u1KmwUX3Y2C
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJXtfxMAAoJEEn8ffcsOfaWGTIIALyHP8Rxx9kBbWX/cv8DrbAa
CHlobz1AOQflHf4p5AEYET/RsUf5uLJQmUfgW5J5S1jUG1k7e9nGtVQYm8NG+R+m
FPOlJorz65/VKpAuRAtBznZ3cnzD8F6KIsEg6VP/01Nqe6sey2ywKQFeYx6ABdGR
lt/czWo9U9NIKHnXI5GByWJ4JQ8vsrpXkW25ft+8DCrtMKijwP5xEmkTUtNsZKb3
7knwuNtG4WbuYbEbAOxZHn9fpLrL1M8OMmI2xJvvRf7nw+4P32h81n72d35fxPdZ
2C7u5M5Tpv1aBAJYgzqOOqYIf7FD1uZ0QtoOtxt2ZcHxKLIQeT1h+5FFBZlKWWU=
=oP32
-----END PGP SIGNATURE-----

--a8Wt8u1KmwUX3Y2C--
