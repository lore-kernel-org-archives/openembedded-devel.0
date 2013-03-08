Received: from mail-oa0-f48.google.com ([209.85.219.48])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ka6sox@gmail.com>) id 1UDq9I-0007vz-ME
	for openembedded-devel@lists.openembedded.org;
	Fri, 08 Mar 2013 06:47:22 +0100
Received: by mail-oa0-f48.google.com with SMTP id j1so1545037oag.7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Mar 2013 21:30:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:date:message-id:subject:from:to
	:content-type; bh=kRzQYDy1P+pGXvp0aNtR6p+DVHFzMLwGLuVflnq4FqU=;
	b=Yx9aXQv2mcgyLS9JPV+Y5qp9FSFDtkedEckfiE/FfZjPyI6DgLpx5e9WUadDNojDOP
	kiiOu9GFLwUd7RC52TQAa28zxMX5qd7BA+Okvk8cEM7qBobc1+nzjQiZOSNh6Drl/Uw+
	AdQp6C/JivMlbOhtVGo0h3vZ1phTCAlreFslxVrhXdKy9f1+1oa9OCEQC52BI4oINpq5
	3aEvuysOAOuuUcB41Tw6frG96RwCWhWlbTVFAdQYzj28J3/SuUBnuXB5QytUaGMVpR2p
	wk9GhDNGhCBDaCb7fc+RIxBwIfaAFZWj++kcFJX1YPOSf6p6DZKEJXVCGFamZPs8BU6T
	9XLQ==
MIME-Version: 1.0
X-Received: by 10.182.144.42 with SMTP id sj10mr595645obb.66.1362720646744;
	Thu, 07 Mar 2013 21:30:46 -0800 (PST)
Received: by 10.76.142.66 with HTTP; Thu, 7 Mar 2013 21:30:46 -0800 (PST)
Date: Thu, 7 Mar 2013 21:30:46 -0800
Message-ID: <CAHQecY7V9WRQ0u0wnuXM4W4255v0mwiyt+_EqmihExuo0c4jyQ@mail.gmail.com>
From: Tom King <ka6sox@gmail.com>
To: openembedded-devel@lists.openembedded.org, apelete@seketeli.net
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [2011.03-maintenance][PATCH 2/7] git: update SRC_URI
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
X-List-Received-Date: Fri, 08 Mar 2013 05:47:23 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

I have added these to the OE Sourcemirror and you are good to go for
updating the recipies.

Cheers

Tom

From: Apelete Seketeli <apelete@seketeli.net>
To: openembedded-devel@lists.openembedded.org
Cc: Tom King <ka6sox@gmail.com>
Date: Tue, 5 Mar 2013 10:23:45 +0100
Subject: Re: [oe] [2011.03-maintenance][PATCH 2/7] git: update SRC_URI
Le 02-Mar-13, Apelete Seketeli a =E9crit:
> Hello Tom,
>
> Le 02-Mar-13, Martin Jansa a =E9crit:
> > On Sat, Mar 02, 2013 at 04:32:27PM +0100, Apelete Seketeli wrote:
> > > Le 02-Mar-13, Martin Jansa a =E9crit:
> > > > On Sat, Mar 02, 2013 at 12:57:03PM +0100, Apelete Seketeli wrote:
> > > > > Update SRC_URI to build.shr-project.org since git source packages
are
> > > > > no longer available from kernel.org.
> > > > > ---
> > > > >  recipes/git/git.inc |    2 +-
> > > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > >
> > > > > diff --git a/recipes/git/git.inc b/recipes/git/git.inc
> > > > > index eb59a2c..ae656e1 100644
> > > > > --- a/recipes/git/git.inc
> > > > > +++ b/recipes/git/git.inc
> > > > > @@ -2,7 +2,7 @@ DESCRIPTION =3D "The git revision control system
used by the Linux kernel develope
> > > > >  SECTION =3D "console/utils"
> > > > >  LICENSE =3D "GPLv2"
> > > > >
> > > > > -SRC_URI =3D "${KERNELORG_MIRROR}/pub/linux/software/scm/git/git-=
${
PV}.tar.bz2;name=3Dsrc"
> > > > > +SRC_URI =3D "
http://build.shr-project.org/sources/git-${PV}.tar.bz2;name=3Dsrc"
> > > >
> > > > I don't know how long I'll keep "old" PREMIRROR there, it would be
> > > > better to send missing archives to Tom King to add them to
> > > > sources.oe.org which is more official source (and probably already
> > > > listed in default MIRRORS)
> > >
> > > How do I send Tom King the missing archives ?
> > > I'll reformat the patches into a v2 as soon as this is fixed.
> >
> > You can send him URLs to needed archives on yocto and shr premirrors
> > and he will wget it from there.
>
> Could you please add the following archives to
> sources.openembedded.org ? I need them to fix non-working SRC_URIs in
> many recipes:
>
> http://downloads.yoctoproject.org/mirror/sources/libcap-2.20.tar.bz2
> http://downloads.yoctoproject.org/mirror/sources/Linux-PAM-1.1.1.tar.bz2
> http://downloads.yoctoproject.org/mirror/sources/netbase_4.21.tar.gz
> http://build.shr-project.org/sources/udev-151.tar.gz
> http://build.shr-project.org/sources/udev-162.tar.gz
> http://build.shr-project.org/sources/udev-165.tar.gz
> http://build.shr-project.org/sources/git-1.7.3.5.tar.bz2
>
> Please let me know when the archives are available at
> sources.openembedded.org, I'll reformat this patchset into v2 and
> resend the pull request then.

I'm replying to myself here as a reminder request to feedback: still
need the above mentioned archives to be added to
sources.openembedded.org. Is Tom King currently around ?

Cheers.
--
        Apelete

