Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1Nwgx3-0006hF-RM
	for openembedded-devel@lists.openembedded.org;
	Tue, 30 Mar 2010 21:18:15 +0200
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1Nwgtt-0004VV-Hk from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Tue, 30 Mar 2010 12:14:57 -0700
Received: from NA1-MAIL.mgc.mentorg.com ([147.34.98.181]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Tue, 30 Mar 2010 12:14:57 -0700
Received: from 172.30.80.170 ([172.30.80.170]) by NA1-MAIL.mgc.mentorg.com
	([147.34.98.181]) with Microsoft Exchange Server HTTP-DAV ; 
	Tue, 30 Mar 2010 19:14:47 +0000
Received: from trini-m4400 by na1-mail.mgc.mentorg.com;
	30 Mar 2010 12:14:46 -0700
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <E1Nwfep-0007c6-NX@melo.openembedded.org>
References: <E1Nwfep-0007c6-NX@melo.openembedded.org>
Organization: Mentor Graphics Corporation
Date: Tue, 30 Mar 2010 12:14:46 -0700
Message-ID: <1269976486.6277.80.camel@trini-m4400>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-OriginalArrivalTime: 30 Mar 2010 19:14:57.0239 (UTC)
	FILETIME=[49278670:01CAD03D]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [oe-commits] Roman I Khimov : clamav-0.94.2: remove deprecated options from config file
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
X-List-Received-Date: Tue, 30 Mar 2010 19:18:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2010-03-30 at 17:55 +0000, git version control wrote:
> Module: openembedded.git
> Branch: org.openembedded.dev
> Commit: 1f71e0d0b6f76e74ed848d75f6b50896f2ae160b
> URL:    http://gitweb.openembedded.net/?p=3Dopenembedded.git&a=3Dcommit;h=
=3D1f71e0d0b6f76e74ed848d75f6b50896f2ae160b
>=20
> Author: Roman I Khimov <khimov@altell.ru>
> Date:   Mon Mar 29 22:30:23 2010 +0400
>=20
> clamav-0.94.2: remove deprecated options from config file
>=20
> Signed-off-by: Roman I Khimov <khimov@altell.ru>
>=20
> ---
>=20
>  recipes/clamav/clamav_0.94.2.bb |    6 +++++-
>  1 files changed, 5 insertions(+), 1 deletions(-)
>=20
> diff --git a/recipes/clamav/clamav_0.94.2.bb b/recipes/clamav/clamav_0.94=
.2.bb
> index e85cc50..3ce005f 100644
> --- a/recipes/clamav/clamav_0.94.2.bb
> +++ b/recipes/clamav/clamav_0.94.2.bb
> @@ -2,5 +2,9 @@ require clamav.inc
> =20
>  EXTRA_OECONF +=3D "--program-transform-name=3D''"
> =20
> -PR =3D "${INC_PR}.0"
> +PR =3D "${INC_PR}.1"
> =20
> +do_install_append() {
> +	# Remove deprecated options
> +	sed -ri "/Archive(Block)?Max/d" ${D}/${sysconfdir}/clamd.conf
> +}
> \ No newline at end of file

Maybe we should start making this per version?  I know we're
inconsistent about this stuff a good bit, but it seems like that's the
best way to handle incompatible config files.  I say this since it seems
possible that come April we have the old stuff in the conf file and no
versions that need it.  Now that I've said this in public, someone might
make a note to make sure that doesn't happen, but I think the point is
still valid ;)

--=20
Tom Rini <tom_rini@mentor.com>
Mentor Graphics Corporation


