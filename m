Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4A4D077120
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Oct 2015 06:16:17 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t9G6GHuu000226
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Oct 2015 23:16:18 -0700 (PDT)
Received: from ALA-MBA.corp.ad.wrs.com ([169.254.3.159]) by
	ALA-HCA.corp.ad.wrs.com ([147.11.189.40]) with mapi id 14.03.0248.002;
	Thu, 15 Oct 2015 23:16:17 -0700
From: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-oe][PATCH] polkit: fix an incomplete patch
Thread-Index: AQHRBnMuVlT/At7LvUSrPeMvylDcC55tpxsg
Date: Fri, 16 Oct 2015 06:16:16 +0000
Message-ID: <1B858668EC6A94408DCA5225FDFA85AA010BCF8412@ALA-MBA.corp.ad.wrs.com>
References: <1444791091-27572-1-git-send-email-jackie.huang@windriver.com>
	<20151014112609.GA22448@jama>
In-Reply-To: <20151014112609.GA22448@jama>
Accept-Language: en-US, zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.162.236]
MIME-Version: 1.0
Subject: Re: [meta-oe][PATCH] polkit: fix an incomplete patch
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
X-List-Received-Date: Fri, 16 Oct 2015 06:16:18 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org [mailto:openembed=
ded-devel-
> bounces@lists.openembedded.org] On Behalf Of Martin Jansa
> Sent: Wednesday, October 14, 2015 7:26 PM
> To: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] [meta-oe][PATCH] polkit: fix an incomplete patch
>=20
> On Wed, Oct 14, 2015 at 10:51:31AM +0800, jackie.huang@windriver.com wrot=
e:
> > From: Jackie Huang <jackie.huang@windriver.com>
> >
> > The patch 0001-do-not-hardcoded-libdir.patch to fix libprivdir is
> > incomplete, it missed to fix the one in data/Makefile.am, and causes
> > failure:
> >
> > systemd[676]: polkit.service: Failed at step EXEC spawning
> > /usr/lib/polkit-1/polkitd: No such file or directory
> >
> > Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> > ---
> >  .../polkit/0001-do-not-hardcoded-libdir.patch      | 31 ++++++++++++++=
++------
> >  1 file changed, 23 insertions(+), 8 deletions(-)
>=20
> error:
> meta-oe/recipes-extended/polkit/polkit/0001-do-not-hardcoded-libdir.patch=
:
> does not exist in index
>=20
> It was removed in:
> commit f86ba9a5583d3b493651134bf710d28dd6509765
> Author: Reinette Chatre <reinette.chatre@intel.com>
> Date:   Thu Sep 24 15:03:01 2015 -0700
>=20
>     polkit: fix relocation of polkit binaries

Ok, I see, please skip it.

Thanks,
Jackie

>=20
> >
> > diff --git
> > a/meta-oe/recipes-extended/polkit/polkit/0001-do-not-hardcoded-libdir.
> > patch
> > b/meta-oe/recipes-extended/polkit/polkit/0001-do-not-hardcoded-libdir.
> > patch
> > index e605e30..21ef578 100644
> > ---
> > a/meta-oe/recipes-extended/polkit/polkit/0001-do-not-hardcoded-libdir.
> > patch
> > +++ b/meta-oe/recipes-extended/polkit/polkit/0001-do-not-hardcoded-lib
> > +++ dir.patch
> > @@ -1,6 +1,6 @@
> > -From c9e09d9b101109832b1dcb050f0c8b588e276686 Mon Sep 17 00:00:00
> > 2001
> > -From: Zhenhua Luo <zhenhua.luo@freescale.com>
> > -Date: Mon, 4 May 2015 04:11:27 -0500
> > +From fd07fbf131e31124094d9123091604dd32726750 Mon Sep 17 00:00:00
> > +2001
> > +From: Jackie Huang <jackie.huang@windriver.com>
> > +Date: Wed, 14 Oct 2015 10:30:12 +0800
> >  Subject: [PATCH] do not hardcoded libdir
> >
> >  Upstream-Status: Pending
> > @@ -8,13 +8,28 @@ Upstream-Status: Pending  libdir is hardcoded to
> > ${prefix}/lib, but we want it to support multilib
> >
> >  Signed-off-by: Chunrong Guo <B40290@freescale.com>
> > +Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> >  ---
> > - polkitagent/Makefile.am   | 2 +-
> > - polkitbackend/Makefile.am | 2 +-
> > - 2 files changed, 2 insertions(+), 2 deletions(-)
> > + data/Makefile.am              | 2 +-
> > + src/polkitagent/Makefile.am   | 2 +-
> > + src/polkitbackend/Makefile.am | 2 +-
> > + 3 files changed, 3 insertions(+), 3 deletions(-)
> >
> > +diff --git a/data/Makefile.am b/data/Makefile.am index
> > +fe0f1d5..52cb4b4 100644
> > +--- a/data/Makefile.am
> > ++++ b/data/Makefile.am
> > +@@ -2,7 +2,7 @@
> > +
> > + NULL =3D
> > +
> > +-libprivdir =3D $(prefix)/lib/polkit-1
> > ++libprivdir =3D $(libdir)/polkit-1
> > +
> > + #
> > + --------------------------------------------------------------------
> > + --------------------------------
> > +
> >  diff --git a/src/polkitagent/Makefile.am
> > b/src/polkitagent/Makefile.am -index 3bc364e..7d1ac0e 100644
> > +index 58a55bd..1b6156b 100644
> >  --- a/src/polkitagent/Makefile.am
> >  +++ b/src/polkitagent/Makefile.am
> >  @@ -78,7 +78,7 @@ libpolkit_agent_1_la_LIBADD =3D                     =
          		\
> > @@ -27,7 +42,7 @@ index 3bc364e..7d1ac0e 100644
> >
> >   polkit_agent_helper_1_SOURCES =3D 					\
> >  diff --git a/src/polkitbackend/Makefile.am
> > b/src/polkitbackend/Makefile.am -index 9f430d0..1f7610b 100644
> > +index 547ca82..78ed934 100644
> >  --- a/src/polkitbackend/Makefile.am
> >  +++ b/src/polkitbackend/Makefile.am
> >  @@ -67,7 +67,7 @@ rules_DATA =3D 50-default.rules
> > --
> > 1.9.1
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>=20
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

