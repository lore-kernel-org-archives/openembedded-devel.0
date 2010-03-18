Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1Ns78W-0003XL-RK
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Mar 2010 05:15:13 +0100
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1Ns75V-000507-VJ from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Mar 2010 21:12:02 -0700
Received: from NA1-MAIL.mgc.mentorg.com ([147.34.98.181]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Wed, 17 Mar 2010 21:12:01 -0700
Received: from 172.30.80.84 ([172.30.80.84]) by NA1-MAIL.mgc.mentorg.com
	([147.34.98.181]) with Microsoft Exchange Server HTTP-DAV ; 
	Thu, 18 Mar 2010 04:11:56 +0000
Received: from trini-m4400 by na1-mail.mgc.mentorg.com;
	17 Mar 2010 21:11:54 -0700
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <E1Ns2kd-0004yU-TV@melo.openembedded.org>
References: <E1Ns2kd-0004yU-TV@melo.openembedded.org>
Organization: Mentor Graphics Corporation
Date: Wed, 17 Mar 2010 21:11:54 -0700
Message-ID: <1268885514.7079.1.camel@trini-m4400>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-OriginalArrivalTime: 18 Mar 2010 04:12:01.0464 (UTC)
	FILETIME=[28EB4B80:01CAC651]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [oe-commits] Paul Eggleton : opkg: update to include upstream libopkg C++ header fixes
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
X-List-Received-Date: Thu, 18 Mar 2010 04:15:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2010-03-17 at 23:34 +0000, git version control wrote:
> Module: openembedded.git
> Branch: org.openembedded.dev
> Commit: c914d3308df4025d39d4fde4de198b8c392d6a41
> URL:    http://gitweb.openembedded.net/?p=3Dopenembedded.git&a=3Dcommit;h=
=3Dc914d3308df4025d39d4fde4de198b8c392d6a41
>=20
> Author: Paul Eggleton <bluelightning@bluelightning.org>
> Date:   Wed Mar 17 23:32:11 2010 +0000
>=20
> opkg: update to include upstream libopkg C++ header fixes
>=20
> ---
>=20
>  conf/distro/include/sane-srcrevs.inc |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>=20
> diff --git a/conf/distro/include/sane-srcrevs.inc b/conf/distro/include/s=
ane-srcrevs.inc
> index b4a6cbb..b07d8d0 100644
> --- a/conf/distro/include/sane-srcrevs.inc
> +++ b/conf/distro/include/sane-srcrevs.inc
> @@ -145,7 +145,7 @@ SRCREV_pn-openmoocow ?=3D "39648419825cddfea1cb1321e5=
52a12b71fede14"
>  SRCREV_pn-openocd ?=3D "517"
>  SRCREV_pn-openocd-native ?=3D "517"
>  SRCREV_pn-opimd-utils ?=3D "1872cdebe1209123710259e25cb8c8b47a627112"
> -SRCREV_pn-opkg ?=3D "526"
> +SRCREV_pn-opkg ?=3D "527"
>  SRCREV_pn-opkg-native ?=3D "526"
>  SRCREV_pn-opkg-sdk ?=3D "526"
>  SRCREV_pn-opkg-utils ?=3D "4578"

Please, pretty please, can we change to:
SRCREV_OPKG ?=3D "nnn"
SRCREV_pn-opkg ?=3D "${SRCREV_OPKG}"
SRCREV_pn-opkg-native ?=3D "${SRCREV_OPKG}"
SRCREV_pn-opkg-sdk ?=3D "${SRCREV_OPKG}"

All three really are just as important to not have broken because they
weren't tested hard enough (iirc, the argument that was made last time).

--=20
Tom Rini <tom_rini@mentor.com>
Mentor Graphics Corporation


