Return-Path: <joe.slater@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4E6387318D
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Aug 2016 16:52:35 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u7IGqZb5029583
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Aug 2016 09:52:35 -0700 (PDT)
Received: from ALA-MBA.corp.ad.wrs.com ([169.254.3.25]) by
	ALA-HCA.corp.ad.wrs.com ([147.11.189.40]) with mapi id 14.03.0248.002;
	Thu, 18 Aug 2016 09:52:35 -0700
From: "Slater, Joseph" <joe.slater@windriver.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-networking][PATCH 1/1] yp-tools: fix compile errors
Thread-Index: AQHR+MULCUvDIt6A5E60OFRhAoWToaBOP3iAgACvBbA=
Date: Thu, 18 Aug 2016 16:52:34 +0000
Message-ID: <007BD92917A2324FA403BCF9A464CF84B62087B0@ALA-MBA.corp.ad.wrs.com>
References: <1471465334-32622-1-git-send-email-jslater@windriver.com>
	<69F4079B-660E-417C-827B-8D7458865C6E@gmail.com>
In-Reply-To: <69F4079B-660E-417C-827B-8D7458865C6E@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [147.11.216.160]
MIME-Version: 1.0
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
X-List-Received-Date: Thu, 18 Aug 2016 16:52:36 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org [mailto:openembed=
ded-devel-
> bounces@lists.openembedded.org] On Behalf Of Khem Raj
> Sent: Wednesday, August 17, 2016 4:20 PM
> To: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] [meta-networking][PATCH 1/1] yp-tools: fix compile erro=
rs
>=20
>=20
> > On Aug 17, 2016, at 1:22 PM, Joe Slater <jslater@windriver.com> wrote:
> >
> > Fix two fatal warnings.  The cast error only
> > occurs for some architectures.
> >
> > Signed-off-by: Joe Slater <jslater@windriver.com>
> > ---
> > .../nis/yp-tools/alignment-cheat.patch             |   58 +++++++++++++=
+++++++
> > .../recipes-support/nis/yp-tools_3.3.bb            |    3 +-
> > 2 files changed, 59 insertions(+), 2 deletions(-)
> > create mode 100644 meta-networking/recipes-support/nis/yp-tools/alignme=
nt-cheat.patch
> >
> > diff --git a/meta-networking/recipes-support/nis/yp-tools/alignment-che=
at.patch b/meta-
> networking/recipes-support/nis/yp-tools/alignment-cheat.patch
> > new file mode 100644
> > index 0000000..856e42e
> > --- /dev/null
> > +++ b/meta-networking/recipes-support/nis/yp-tools/alignment-cheat.patc=
h
> > @@ -0,0 +1,58 @@
> > +yp-tools: avoid fatal cast warning
> > +
> > +The way casting is done, we will get a fatal alignment warning on some
> > +architectures.  This patch cheats our way around this.
> > +
>=20
> These changes look fine, however you should run it by the upstream.

Version 4.2 of the tools seems to bear little resemblance to 3.3.  The code=
 and
structures patched here no longer exist.

>=20
> > +We also eliminate an unused constant which causes a fatal warning.
> > +
> > +Upstream-status: Pending
> > +
> > +Signed-off-by: Joe Slater <jslater@windriver.com>
> > +
> > +
> > +--- a/lib/do_ypcall.c
> > ++++ b/lib/do_ypcall.c
> > +@@ -44,7 +44,9 @@ struct dom_binding
> > + typedef struct dom_binding dom_binding;
> > +
> > + static const struct timeval RPCTIMEOUT =3D {25, 0};
> > ++#if 0
> > + static const struct timeval UDPTIMEOUT =3D {5, 0};
> > ++#endif
>=20
> perhaps its better to remove the unused code instead of making preprocess=
or
> work even more.

Probably.  I think RPCTIMEOUT made it to 4.2, but UDPTIMEOUT did not.

>=20
> > + static int const MAXTRIES =3D 2;
> > + static pthread_mutex_t ypbindlist_lock =3D PTHREAD_MUTEX_INITIALIZER;
> > + static dom_binding *ypbindlist =3D NULL;
> > +@@ -381,7 +383,7 @@ __ypclnt_call (u_long prog, xdrproc_t xa
> > +
> > + int
> > + do_ypcall (const char *domain, u_long prog, xdrproc_t xargs,
> > +-	   caddr_t req, xdrproc_t xres, caddr_t resp)
> > ++	   caddr_t req, xdrproc_t xres, void *resp)
> > + {
> > +   dom_binding *ydb;
> > +   int status;
> > +@@ -450,9 +452,9 @@ do_ypcall (const char *domain, u_long pr
> > + /* Like do_ypcall, but translate the status value if necessary.  */
> > + int
> > + do_ypcall_tr (const char *domain, u_long prog, xdrproc_t xargs,
> > +-	      caddr_t req, xdrproc_t xres, caddr_t resp)
> > ++	      caddr_t req, xdrproc_t xres, void *resp)
> > + {
> > +-  int status =3D do_ypcall (domain, prog, xargs, req, xres, resp);
> > ++  int status =3D do_ypcall (domain, prog, xargs, req, xres, (void *) =
resp);
>=20
> resp is already a void pointer why is this typecast needed ?

I put it in someplace along the line in trying to fix the problem and forgo=
t
to take it out.

V2 or leave it?  This code does not look like it's going anywhere beyond he=
re.

Joe


>=20
> > +   if (status =3D=3D YPERR_SUCCESS)
> > +     /* We cast to ypresp_val although the pointer could also be of
> > +        type ypresp_key_val or ypresp_master or ypresp_order or
> > +--- a/lib/internal.h
> > ++++ b/lib/internal.h
> > +@@ -17,8 +17,8 @@
> > + #define _INTERNAL_H_
> > +
> > + extern int do_ypcall (const char *domain, u_long prog, xdrproc_t xarg=
s,
> > +-		      caddr_t req, xdrproc_t xres, caddr_t resp);
> > ++		      caddr_t req, xdrproc_t xres, void *resp);
> > + extern int do_ypcall_tr (const char *domain, u_long prog, xdrproc_t x=
args,
> > +-			 caddr_t req, xdrproc_t xres, caddr_t resp);
> > ++			 caddr_t req, xdrproc_t xres, void *resp);
> > + extern int yp_maplist (const char *, struct ypmaplist **);
> > + #endif
> > diff --git a/meta-networking/recipes-support/nis/yp-tools_3.3.bb b/meta=
-
> networking/recipes-support/nis/yp-tools_3.3.bb
> > index b89f0b8..69217fa 100644
> > --- a/meta-networking/recipes-support/nis/yp-tools_3.3.bb
> > +++ b/meta-networking/recipes-support/nis/yp-tools_3.3.bb
> > @@ -11,11 +11,10 @@ ypwhich, yppasswd, domainname, nisdomainname \
> > and ypdomainname. \
> > "
> >
> > -PNBLACKLIST[yp-tools] ?=3D "BROKEN: fails to build for qemuarm."
> > -
> > SRC_URI =3D "http://www.linux-nis.org/download/yp-tools/${BP}.tar.bz2 \
> >            file://domainname.service \
> >            file://yp-tools-ipv4-ipv6-Provide-an-in-place-version-of-map=
v4v6addr.patch \
> > +           file://alignment-cheat.patch \
> > "
> > SRC_URI[md5sum] =3D "acebeecc11a73fb8097503670344834c"
> > SRC_URI[sha256sum] =3D "812be817df3d4c25813552be336c6c6ad5aedaf65611b81=
af3ad9f98fb3c2e50"
> > --
> > 1.7.9.5
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel


