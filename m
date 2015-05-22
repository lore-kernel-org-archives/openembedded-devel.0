Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 3A831609B2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 May 2015 08:41:25 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP; 22 May 2015 01:41:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,474,1427785200"; d="scan'208";a="496947262"
Received: from gfois-mobl2.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.27.18])
	by FMSMGA003.fm.intel.com with ESMTP; 22 May 2015 01:41:26 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Andreas =?ISO-8859-1?Q?M=FCller?= <schnitzeltony@googlemail.com>
Date: Fri, 22 May 2015 09:41:25 +0100
Message-ID: <22737241.NHZM3DgOrk@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.7 (Linux/3.19.7-200.fc21.x86_64; KDE/4.14.7; x86_64; ; )
In-Reply-To: <CALbNGRTLxNG6936gZ1N_W2tpOpAtO8oDN7hnm=kZs-GPoVMe-A@mail.gmail.com>
References: <20150520212053.62A5E5040E@opal.openembedded.org>
	<CALbNGRTLxNG6936gZ1N_W2tpOpAtO8oDN7hnm=kZs-GPoVMe-A@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [oe-commits] Shiqun Lin : sanity.bbclass: improve the sanity check for PATH and BBPATH
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
X-List-Received-Date: Fri, 22 May 2015 08:41:26 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

On Friday 22 May 2015 07:15:36 Andreas M=FCller wrote:
> On Wed, May 20, 2015 at 11:20 PM,  <git@git.openembedded.org> wrote:
> > Module: openembedded-core.git
> > Branch: master-next
> > Commit: b6a23572b8f14e27d4341892b9069e7cac1e9c14
> > URL:  =20
> > http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommit;h=
=3Db6a23572b
> > 8f14e27d4341892b9069e7cac1e9c14
> >=20
> > Author: Shiqun Lin <Shiqun.Lin@windriver.com>
> > Date:   Wed Jan  7 15:00:31 2015 +0800
> >=20
> > sanity.bbclass: improve the sanity check for PATH and BBPATH
> >=20
> > Build fails if "./" is in the PATH
> >=20
> > To reproduce the issue:
> >   $ export PATH=3D"./:$PATH"
> >   $ make -C build-tools elfutils
> >  =20
> >   Error: ./ld: unrecognized option '--sysroot=3D/'
> >=20
> > Signed-off-by: Shiqun Lin <Shiqun.Lin@windriver.com>
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> >=20
> > ---
> >=20
> >  meta/classes/sanity.bbclass | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> >=20
> > diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbcl=
ass
> > index fc8c980..e738110 100644
> > --- a/meta/classes/sanity.bbclass
> > +++ b/meta/classes/sanity.bbclass
> >=20
> > @@ -653,9 +653,9 @@ def check_sanity_version_change(status, d):
> >              status.addresult("You have a 32-bit libc, but no 32-bi=
t
> >              headers.  You must install the 32-bit libc headers.\n"=
)>     =20
> >      bbpaths =3D d.getVar('BBPATH', True).split(":")
> >=20
> > -    if ("." in bbpaths or "" in bbpaths) and not status.reparse:
> >=20
> > +    if ("." in bbpaths or "./" in bbpaths or "" in bbpaths) and no=
t=20
status.reparse:
> >          status.addresult("BBPATH references the current directory,=
 either
> >          through "    \>=20
> > -                "an empty entry, or a '.'.\n\t This is unsafe and =
means
> > your "\ +                "an empty entry, a './' or a '.'.\n\t This=
 is
> > unsafe and means your "\>=20
> >                  "layer configuration is adding empty elements to
> >                  BBPATH.\n\t "\
> >                  "Please check your layer.conf files and other BBPA=
TH "  =20
> >                      \
> >                  "settings to remove the current working directory =
"     =20
> >                      \
> >=20
> > @@ -693,8 +693,8 @@ def check_sanity_everybuild(status, d):
> >      sanity_check_conffiles(status, d)
> >     =20
> >      paths =3D d.getVar('PATH', True).split(":")
> >=20
> > -    if "." in paths or "" in paths:
> > -        status.addresult("PATH contains '.' or '' (empty element),=
 which
> > will break the build, please remove this.\nParsed PATH is " + str(p=
aths)
> > + "\n") +    if "." in paths or "./" in paths or "" in paths:
> > +        status.addresult("PATH contains '.', './' or '' (empty ele=
ment),
> > which will break the build, please remove this.\nParsed PATH is " +=

> > str(paths) + "\n")>=20
> >      # Check that the DISTRO is valid, if set
> >      # need to take into account DISTRO renaming DISTRO
> >=20
> > --
>=20
> The PATH part is problematic: My system (fedora 22) or my user - have=

> not yet checked where it comes from - sets './' in PATH. I am not
> happy risking fallout on my system for yocto's sanity.

FWIW, it's not in PATH for my account on F21.

Cheers,
Paul

--=20

Paul Eggleton
Intel Open Source Technology Centre

