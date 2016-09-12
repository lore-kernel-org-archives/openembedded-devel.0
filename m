Return-Path: <Mark.Asselstine@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B89CD77029
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Sep 2016 13:06:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u8CD6f7E027129
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 12 Sep 2016 06:06:43 -0700 (PDT)
Received: from yow-masselst-d1.localnet (128.224.56.91) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.294.0; Mon, 12 Sep 2016 06:06:40 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
Date: Mon, 12 Sep 2016 09:06:39 -0400
Message-ID: <26802314.gkp84O62sb@yow-masselst-d1>
Organization: Wind River Internation Inc.
User-Agent: KMail/5.1.3 (Linux/4.4.0-21-generic; KDE/5.18.0; x86_64; ; )
In-Reply-To: <1B858668EC6A94408DCA5225FDFA85AA013A2BCCE1@ALA-MBA.corp.ad.wrs.com>
References: <cover.1473388166.git.jackie.huang@windriver.com>
	<20160910003524.GA18761@mentor.com>
	<1B858668EC6A94408DCA5225FDFA85AA013A2BCCE1@ALA-MBA.corp.ad.wrs.com>
MIME-Version: 1.0
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH 2/2 v2] samba: restrict the blacklist to ARM only
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
X-List-Received-Date: Mon, 12 Sep 2016 13:06:46 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

On Sunday, September 11, 2016 9:26:44 PM EDT Huang, Jie (Jackie) wrote:
> > -----Original Message-----
> > From: openembedded-devel-bounces@lists.openembedded.org
> > [mailto:openembedded-devel- bounces@lists.openembedded.org] On Behalf Of
> > Joe MacDonald
> > Sent: Saturday, September 10, 2016 8:35 AM
> > To: openembedded-devel@lists.openembedded.org
> > Subject: Re: [oe] [meta-networking][PATCH 2/2 v2] samba: restrict the
> > blacklist to ARM only
> >=20
> > [Re: [oe] [meta-networking][PATCH 2/2 v2] samba: restrict the blacklist=
 to
> > ARM only] On 16.09.10 (Sat>=20
> > 00:03) Andreas M=FCller wrote:
> > > On Fri, Sep 9, 2016 at 10:44 PM, Joe MacDonald=20
<Joe_MacDonald@mentor.com> wrote:
> > > > [[oe] [meta-networking][PATCH 2/2 v2] samba: restrict the blacklist=
 to
> > > > ARM only] On 16.09.09 (Fri>=20
> > 10:34) jackie.huang@windriver.com wrote:
> > > >> From: Jackie Huang <jackie.huang@windriver.com>
> > > >>=20
> > > >> It builds fine except for arm now, and the do_package
> > > >> and libpam issue is fixed by:
> > > >> "waf-samba.bbclass: Add PACKAGECONFIG_CONFARGS to CONFIGUREOPTS"
> > > >=20
> > > > Did you confirm that you're still seeing the failure for arm?
> > > >=20
> > > > -J.
> > > >=20
> > > >> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> > > >> ---
> > > >>=20
> > > >>  meta-networking/recipes-connectivity/samba/samba_4.4.5.bb | 6 +++=
=2D--
> > > >>  1 file changed, 3 insertions(+), 3 deletions(-)
> > > >>=20
> > > >> diff --git
> > > >> a/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb b/meta=
=2D>=20
> > networking/recipes-connectivity/samba/samba_4.4.5.bb
> >=20
> > > >> index 042203e..c34adcb 100644
> > > >> --- a/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
> > > >> +++ b/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
> > > >> @@ -319,6 +319,6 @@ RDEPENDS_${PN}-pidl_append =3D " perl"
> > > >>=20
> > > >>  FILES_${PN}-pidl =3D "${bindir}/pidl ${datadir}/perl5/Parse"
> > > >> =20
> > > >>  # http://errors.yoctoproject.org/Errors/Details/81004/
> > > >>=20
> > > >> -# before this issue it was also failing in do_package and
> > > >> -# autodetecting libpam dependency
> > > >> -PNBLACKLIST[samba] ?=3D "BROKEN: fails to build with new
> > > >> binutils-2.27"
> > > >> +BLACKLIST_REASON ?=3D ""
> > > >> +BLACKLIST_REASON_arm =3D "BROKEN: fails to build with new
> > > >> binutils-2.27"
> > > >> +PNBLACKLIST[samba] ?=3D "${BLACKLIST_REASON}"
> > > >> --
> > > >> 2.8.3
> > > >=20
> > > > --
> > > > -Joe MacDonald.
> > > >=20
> > > > :wq
> > >=20
> > > Did you see [1] - it fixes build for arm.
> > >=20
> > > [1] http://lists.openembedded.org/pipermail/openembedded-devel/2016->=
 >=20
> > September/108972.html
> >=20
> > I didn't, actually, but I had picked it up in my tree anyway when I
> > scooped up the latest set of changes in master-next.  The reason I was
> > asking was because I wasn't seeing a failure anymore in samba on arm and
> > was curious why Jackie was still seeing it if I wasn't and I hadn't seen
>=20
> Actually I never see the failure in:
> http://errors.yoctoproject.org/Errors/Details/81004/
>=20
> and I didn't notice Andreas' patch, I was fixing another issue but Mark
> asked me to include the restrict on ARM, please see:
>=20
> https://patchwork.openembedded.org/patch/131249/
>=20
> so I thought at least Mark was still seeing this and sent this patch.
>=20
> Mark, could you confirm that you're still seeing the failure for arm?

I was never able to reproduce the issue but was working on the assumption t=
hat=20
it was still a real issue, and thus the need to continue to blacklist ARM. =
if=20
the issue no longer exists then the proper thing to do would be to remove t=
he=20
blacklist entry and in the commit log which does this, identify what change=
d=20
to remedy the situation.=20

Mark


>=20
> Thanks,
> Jackie
>=20
> > an explicit patch to resolve the issue.  But there it is, mystery
> > solved.  Thanks for the heads-up, Andreas.
> >=20
> > --
> > -Joe MacDonald.
> >=20
> > :wq



