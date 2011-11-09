Received: from vms173005pub.verizon.net ([206.46.173.5])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1RNx7c-0003sg-QA
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Nov 2011 02:38:36 +0100
Received: from gandalf.denix.org ([unknown] [96.240.135.93])
	by vms173005.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LUD000BSDLG95G5@vms173005.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Tue,
	08 Nov 2011 19:32:05 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 55FC614AF5D; Tue,
	08 Nov 2011 20:32:04 -0500 (EST)
Date: Tue, 08 Nov 2011 20:32:04 -0500
From: Denys Dmytriyenko <denis@denix.org>
In-reply-to: <CAPOJ94NE2DBeyuW5zqusE-HL4dTxGVvf3U0n0dfnscC0UzF0Sw@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-id: <20111109013204.GE15391@denix.org>
MIME-version: 1.0
References: <CAPOJ94PUaBtZkRHE_v_x4raOQZnBtHp9bt6mvoMjZGmPTQ=-jQ@mail.gmail.com>
	<CA+M6bXkfk40ztOn+WFocLFGzLRU6PE4z5Qf_9=NAnhO_U4QFSg@mail.gmail.com>
	<CAPOJ94NE2DBeyuW5zqusE-HL4dTxGVvf3U0n0dfnscC0UzF0Sw@mail.gmail.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
Cc: meta-ti@yoctoproject.org
Subject: Re: forcing dependency on genext2fs-native
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
X-List-Received-Date: Wed, 09 Nov 2011 01:38:37 -0000
Content-type: text/plain; charset=iso-8859-1
Content-transfer-encoding: QUOTED-PRINTABLE
Content-disposition: inline

On Tue, Nov 08, 2011 at 02:00:28PM -0600, Peter Bigot wrote:
> On Tue, Nov 8, 2011 at 1:23 PM, Tom Rini <tom.rini@gmail.com> wrote=
:
> > On Tue, Nov 8, 2011 at 11:25 AM, Peter Bigot <bigotp@acm.org> wro=
te:
> >> I've added a DEPENDS +=3D "genext2fs-native" for a recipe in met=
a-ti,
> >> but the corresponding package is not getting built. =A0bitbake -=
DDD
> >> says:
> >>
> >> DEBUG: Added dependency genext2fs-native for
> >> /prj/oe/angstrom/sources/meta-ti/recipes-misc/images/cloud9-gfx-=
image.bb
> >> DEBUG: providers for genext2fs-native are: ['genext2fs-native']
> >> DEBUG: sorted providers for genext2fs-native are:
> >> ['virtual:native:/prj/oe/angstrom/sources/openembedded-core/meta=
/recipes-devtools/genext2fs/genext2fs_1.4.1.bb']
> >> DEBUG: adding virtual:native:/prj/oe/angstrom/sources/openembedd=
ed-core/meta/recipes-devtools/genext2fs/genext2fs_1.4.1.bb
> >> to satisfy genext2fs-native
> >>
> >> I'm guessing the "virtual:native:" means somebody thinks genext2=
fs
> >> should already be installed on the host. =A0It's not available o=
n
> >> Fedora, so this decision is wrong. =A0I haven't been able to fig=
ure out
> >> what's causing this to happen.
> >
> > No, it means that the "virtual:native" (coming from BBCLASSEXTEND=
 in
> > the recipe file) is being selected to provide "genext2fs-native"
> > (since in many cases we don't have a separate -native recipe, we =
just
> > use BBCLASSEXTEND). =A0What's probably happening is that you need
> > genext2fs to exist for a specific task and just "DEPENDS +=3D
> > genext2fs-native" really means "make do_configure depend on
> > genext2fs-native being in the sysroot". =A0Did you modify
> > cloud9-gfx-image? =A0It should already get the DEPENDS right for
> > populating the image.
>=20
> The build had failed in meta-ti/classes/sdcard_image.bbclass which
> used genext2fs to build an sdimg image.
>=20
> I had added DEPENDS +=3D "genext2fs-native" to
> meta-ti/recipes-misc/images/ti-hw-bringup-image.bb since it was wha=
t
> inherited sdcard_image.
>=20
> On further investigation cued by your response, it seems that the
> correct change is instead to add:
>=20
> IMAGE_DEPENDS_sdimg =3D "genext2fs-native"
>=20
> analogously to what's done for the other image types.  With that th=
e
> bitbake of cloud9-gfx-image does the right thing.

Thanks for your report! Can you please submit a patch to meta-ti mail=
ing list=20
at meta-ti@yoctoproject.org
Thanks.

--=20
Denys



