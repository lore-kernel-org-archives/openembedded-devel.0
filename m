Return-Path: <Paul.Gortmaker@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id EFC837317C
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 May 2016 15:20:04 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u49FK3e6019366
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 9 May 2016 08:20:03 -0700 (PDT)
Received: from yow-pgortmak-d1 (128.224.56.57) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 9 May 2016 08:20:03 -0700
Received: by yow-pgortmak-d1 (Postfix, from userid 1000)	id 24F25280127; Mon,
	9 May 2016 11:20:02 -0400 (EDT)
Date: Mon, 9 May 2016 11:20:02 -0400
From: Paul Gortmaker <paul.gortmaker@windriver.com>
To: Martin Jansa <martin.jansa@gmail.com>
Message-ID: <20160509152002.GY18139@windriver.com>
References: <1462734493-3819-1-git-send-email-paul.gortmaker@windriver.com>
	<20160509140831.GC21815@mentor.com> <20160509142654.GC2560@jama>
MIME-Version: 1.0
In-Reply-To: <20160509142654.GC2560@jama>
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
X-List-Received-Date: Mon, 09 May 2016 15:20:05 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Re: [PATCH v2 0/2] netcf build fail / gnulib handling fix.] On 09/05/2016 =
(Mon 16:26) Martin Jansa wrote:

> On Mon, May 09, 2016 at 10:08:33AM -0400, Joe MacDonald wrote:
> > [[PATCH v2 0/2] netcf build fail / gnulib handling fix.] On 16.05.08 (S=
un 15:08) Paul Gortmaker wrote:
> >=20
> > > In the previous version[1] of the attempt to fix the netcf build on
> > > newer hosts, Martin noted that my change broke fontforge.
> > >=20
> > > The reason for that is the ./bootstrap in fontforge is older and
> > > doesn't support the "--no-git" option I used for netcf.
> > >=20
> > > This highlighted the fact that we will want to be able to use
> > > different args to the ./bootstrap for different packages.
> > >=20
> > > The first commit moves the configure_prepend step as-is out to
> > > the packages, so we can do the above, and thus making
> > > autotools-bootstrap unused in the process.
> > >=20
> > > The second commit fixes the netcf prepend to not overwrite
> > > contents from the netcf package itself, which was the source
> > > of the build failure.
> > >=20
> > > The functionality of the prepend for fontforge is left as-is
> > > so that it will continue to build w/o issue.
> >=20
> > I've no objection to this change, it seems sensible and low-impact to
> > me.  That said, if there's any objection to removing the
> > autotools-bootstrap class, I'd also support a version of this that
> > leaves the class but divorces netcf from it.
> >=20
> > I wonder, though, now that I'm thinking about it, if the crux of the
> > change is going from:
> >=20
> >  21     # | ...
> >  22     ./bootstrap --force
> >  23     cd $currdir
> >  24 }
> >=20
> > to something like:
> >=20
> >  21     # | ...
> >  22     ./bootstrap --force --no-git --gnulib-srcdir=3D.gnulib
> >  23     cd $currdir
> >  24 }
> >=20
> > with the extra logic around the "rmdir .gnulib" being somewhat
> > peripheral, would it be possible to extend the class instead with a new
> > varaible that would be set in the respective recipe file, using, say,
> > breakpad.bbclass as an example?
> >=20
> > What I'm thinking of here is something like this:
> >=20
> > >>> do_configure_prepend() {
> > >>>     currdir=3D`pwd`
> > >>>     cd ${S}
> > >>>=20
> > >>>     rmdir ${S}/.gnulib || cat >.gitmodules <<EOF
> > >>> [submodule "gnulib"]
> > >>>    path =3D gnulib
> > >>>    url =3D git://git.sv.gnu.org/gnulib
> > >>> EOF
> > >>>     if [ -d ${S}/.gnulib ] ; then
> > >>>         cp -rf ${STAGING_DATADIR}/gnulib ${S}
> > >>>     else
> > >>>         cp -rf ${STAGING_DATADIR}/gnulib ${S}
> > >>>     fi
> > >>>=20
> > >>>     # --force to avoid errors on reconfigure e.g if recipes changed=
 we depend on
> > >>>     # | bootstrap: running: libtoolize --quiet
> > >>>     # | libtoolize:   error: 'libltdl/COPYING.LIB' exists: use '--f=
orce' to overwrite
> > >>>     # | ...
> > >>>     ./bootstrap --force ${BOOTSTRAP_EXTRA}
> > >>>     cd $currdir
> > >>> }
> >=20
> > then in fontforge, just leave everything as-is (until it gets a review /
> > update / whatever) and in netcf's recipe we just add a line:
> >=20
> >    BOOTSTRAP_EXTRA =3D "--no-git --gnulib-srcdir=3D.gnulib"
> >=20
> > Obviously the above is all un-tested and mostly just off-the-top-of-
> > my-head thinking, so maybe it's completely unworkable.  If Martin is
> > okay with the patches as sent, I'm fine with them too.
>=20
> I'm fine with current patches, but was wondering the same, why not
> introduce variable so that the same bbclass can be used by both "new"
> and "old" bootstrap versions.

I did consider a solution along the lines of the above, but the more I
thought about it, and looked for users outside OE (e.g. Yocto) the more
I came to the conclusion that the class was largely a solution looking
for a problem.  There are just these two users of the class now. =20

Anyone trying to use gnulib (which BTW is meant to help build GNU source
on non-GNU systems -so hopefully it remains uncommon) is most likely going
to have to do some custom pre-config [e.g. create submodule file or not]
so the class boils down to infrastructure for one bootstrap line to be
"shared".

>=20
> But I don't know anything about this bootstrap, so cannot say if we can
> expect only these 2 variants or if every bootstrap usage is really
> specific to given recipe and not worth sharing the common part in bbclass.

Per above, I think it is safe to say we won't see hundreds of gnulib
users, and speaking only for myself, the fact it was a class to begin
with led me down the wrong path thinking that I should fix the sharing
by standardizing on a common bootstrap etc. etc. which was ugly.

Here we retain the value of not downloading gnulib multiple times, and
we give the pkgs full independence on how they handle bootstrap without
trying to confine them into what we predict they might need.

Paul.
--

>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



