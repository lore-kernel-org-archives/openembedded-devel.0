Received: from comal.ext.ti.com ([198.47.26.152])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chase.maupin@ti.com>) id 1TM4l8-0000gN-QK
	for openembedded-devel@lists.openembedded.org;
	Thu, 11 Oct 2012 00:28:11 +0200
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id q9AMBisV019273;
	Wed, 10 Oct 2012 17:11:44 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q9AMBi5l005631;
	Wed, 10 Oct 2012 17:11:44 -0500
Received: from DLEE12.ent.ti.com ([fe80::3867:617:aab3:5956]) by
	DFLE72.ent.ti.com ([fe80::5c48:b90d:af93:5822%30]) with mapi id
	14.01.0323.003; Wed, 10 Oct 2012 17:11:44 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: Denys Dmytriyenko <denis@denix.org>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [PATCH 0/1][for-denzil] kernel: cherry-pick header fix
Thread-Index: AQHNpzHPXY+yZvqrnEmk12vzoKeCypezF0xg
Date: Wed, 10 Oct 2012 22:11:42 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED10159257C76@DLEE12.ent.ti.com>
References: <1349907519-17119-1-git-send-email-Chase.Maupin@ti.com>
	<20121010215408.GH16944@denix.org>
In-Reply-To: <20121010215408.GH16944@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH 0/1][for-denzil] kernel: cherry-pick header fix
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
X-List-Received-Date: Wed, 10 Oct 2012 22:28:11 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: Denys Dmytriyenko [mailto:denis@denix.org]
> Sent: Wednesday, October 10, 2012 4:54 PM
> To: openembedded-devel@lists.openembedded.org
> Cc: Maupin, Chase
> Subject: Re: [oe] [PATCH 0/1][for-denzil] kernel: cherry-pick
> header fix
>=20
> On Wed, Oct 10, 2012 at 05:18:38PM -0500, Chase Maupin wrote:
> > All,
> >
> > This patch is a cherry-pick of the change made in meta-
> openembedded
> > master to fix the kernel header staging location.  Without this
> > change builds of external modules using the denzil branch will
> fail
> > to find the staged headers because they will be looking in the
> > "kernel" directory instead of the "usr/src/kernel" directory.
> >
> > The STAGING_KERNEL_DIR set in bitbake.conf of oe-core in the
> > denzil branch of the repository has already been updated to use
> > ${STAGING_DIR_HOST}/usr/src/kernel
> >
> > I hope I got this patch formatted right since I just did a
> > cherry-pick into my denzil branch and created the patch.  If
> this
> > is not the correct format please let me know.  The commit I
> > cherry-picked was 8c724c4ab8e946763c813e5174dbfd5ac8a5ddda
> >
> > Darren Hart (1):
> >   kernel: Add kernel headers to kernel-dev package
> >
> >  meta-oe/classes/kernel.bbclass |   27 ++++++++++++------------
> ---
> >  1 files changed, 12 insertions(+), 15 deletions(-)
>=20
> FYI, it is already in the queue with other related patches. See
> my earlier
> email.

OK.  I haven't seen that message come by yet.  I guess it is floating in th=
e ether :)

>=20
> --
> Denys


