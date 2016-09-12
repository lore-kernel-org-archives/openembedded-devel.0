Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 70E5D60851
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Sep 2016 01:26:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u8C1QlJp017402
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 11 Sep 2016 18:26:47 -0700 (PDT)
Received: from ALA-MBA.corp.ad.wrs.com ([169.254.3.175]) by
	ALA-HCA.corp.ad.wrs.com ([147.11.189.40]) with mapi id 14.03.0294.000;
	Sun, 11 Sep 2016 18:26:46 -0700
From: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
To: "Joe MacDonald (Joe_MacDonald@mentor.com)" <Joe_MacDonald@mentor.com>,
	"Asselstine, Mark" <Mark.Asselstine@windriver.com>
Thread-Topic: [oe] [meta-networking][PATCH 2/2 v2] samba: restrict the
	blacklist to ARM only
Thread-Index: AQHSCtsUsQ1djr+jjkCgFc4ukvyVpqByK8SAgAAqT4CAArfW0A==
Date: Mon, 12 Sep 2016 01:26:44 +0000
Message-ID: <1B858668EC6A94408DCA5225FDFA85AA013A2BCCE1@ALA-MBA.corp.ad.wrs.com>
References: <cover.1473388166.git.jackie.huang@windriver.com>
	<b21847dcc8605a8522be2bea1c0a1b4788cf841e.1473388166.git.jackie.huang@windriver.com>
	<20160909204446.GB5631@mentor.com>
	<CALbNGRSRPaVEkYqD8sQoD07Mv7Mk4eFB-VHFzJt12haS3KdMpA@mail.gmail.com>
	<20160910003524.GA18761@mentor.com>
In-Reply-To: <20160910003524.GA18761@mentor.com>
Accept-Language: en-US, zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.162.131]
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
X-List-Received-Date: Mon, 12 Sep 2016 01:26:49 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org [mailto:openembed=
ded-devel-
> bounces@lists.openembedded.org] On Behalf Of Joe MacDonald
> Sent: Saturday, September 10, 2016 8:35 AM
> To: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] [meta-networking][PATCH 2/2 v2] samba: restrict the bla=
cklist to ARM only
>=20
> [Re: [oe] [meta-networking][PATCH 2/2 v2] samba: restrict the blacklist t=
o ARM only] On 16.09.10 (Sat
> 00:03) Andreas M=FCller wrote:
>=20
> > On Fri, Sep 9, 2016 at 10:44 PM, Joe MacDonald <Joe_MacDonald@mentor.co=
m> wrote:
> > > [[oe] [meta-networking][PATCH 2/2 v2] samba: restrict the blacklist t=
o ARM only] On 16.09.09 (Fri
> 10:34) jackie.huang@windriver.com wrote:
> > >
> > >> From: Jackie Huang <jackie.huang@windriver.com>
> > >>
> > >> It builds fine except for arm now, and the do_package
> > >> and libpam issue is fixed by:
> > >> "waf-samba.bbclass: Add PACKAGECONFIG_CONFARGS to CONFIGUREOPTS"
> > >
> > > Did you confirm that you're still seeing the failure for arm?
> > >
> > > -J.
> > >
> > >>
> > >> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> > >> ---
> > >>  meta-networking/recipes-connectivity/samba/samba_4.4.5.bb | 6 +++--=
-
> > >>  1 file changed, 3 insertions(+), 3 deletions(-)
> > >>
> > >> diff --git a/meta-networking/recipes-connectivity/samba/samba_4.4.5.=
bb b/meta-
> networking/recipes-connectivity/samba/samba_4.4.5.bb
> > >> index 042203e..c34adcb 100644
> > >> --- a/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
> > >> +++ b/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
> > >> @@ -319,6 +319,6 @@ RDEPENDS_${PN}-pidl_append =3D " perl"
> > >>  FILES_${PN}-pidl =3D "${bindir}/pidl ${datadir}/perl5/Parse"
> > >>
> > >>  # http://errors.yoctoproject.org/Errors/Details/81004/
> > >> -# before this issue it was also failing in do_package and
> > >> -# autodetecting libpam dependency
> > >> -PNBLACKLIST[samba] ?=3D "BROKEN: fails to build with new binutils-2=
.27"
> > >> +BLACKLIST_REASON ?=3D ""
> > >> +BLACKLIST_REASON_arm =3D "BROKEN: fails to build with new binutils-=
2.27"
> > >> +PNBLACKLIST[samba] ?=3D "${BLACKLIST_REASON}"
> > >> --
> > >> 2.8.3
> > >>
> > > --
> > > -Joe MacDonald.
> > > :wq
> > >
> > Did you see [1] - it fixes build for arm.
> >
> > [1] http://lists.openembedded.org/pipermail/openembedded-devel/2016-
> September/108972.html
>=20
> I didn't, actually, but I had picked it up in my tree anyway when I
> scooped up the latest set of changes in master-next.  The reason I was
> asking was because I wasn't seeing a failure anymore in samba on arm and
> was curious why Jackie was still seeing it if I wasn't and I hadn't seen

Actually I never see the failure in:
http://errors.yoctoproject.org/Errors/Details/81004/

and I didn't notice Andreas' patch, I was fixing another issue but Mark ask=
ed me
to include the restrict on ARM, please see:

https://patchwork.openembedded.org/patch/131249/

so I thought at least Mark was still seeing this and sent this patch.

Mark, could you confirm that you're still seeing the failure for arm?

Thanks,
Jackie

> an explicit patch to resolve the issue.  But there it is, mystery
> solved.  Thanks for the heads-up, Andreas.
>=20
> --
> -Joe MacDonald.
> :wq

