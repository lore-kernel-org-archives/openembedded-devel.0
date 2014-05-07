Return-Path: <sgh@sgh.dk>
Received: from mx-aarh-3.stofanet.dk (mx-aarh-3.stofanet.dk [212.10.10.13])
	by mail.openembedded.org (Postfix) with ESMTP id D68E26098B
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 May 2014 11:17:01 +0000 (UTC)
Received: from 5634f347.rev.stofanet.dk ([86.52.243.71] helo=asrock)
	by mx-aarh-3.stofanet.dk (envelope-from <sgh@sgh.dk>)
	with esmtp id 1WhzqO-0000xf-0q; Wed, 07 May 2014 13:17:00 +0200
Received: from koontz.localnet (localhost [127.0.0.1])
	by asrock (Postfix) with ESMTPS id EBCCE7EC0C;
	Wed,  7 May 2014 13:16:59 +0200 (CEST)
From: =?ISO-8859-1?Q?S=F8ren?= Holm <sgh@sgh.dk>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Date: Wed, 07 May 2014 13:16:59 +0200
Message-ID: <9465494.5B6U7XsnM9@koontz>
User-Agent: KMail/4.13 (Linux/3.13.0-24-lowlatency; KDE/4.13.0; i686; ; )
In-Reply-To: <8485696.3mtcMOoHMt@peggleto-mobl5.ger.corp.intel.com>
References: <1399454777-2868-1-git-send-email-sgh@sgh.dk>
	<2543976.qS9USN9dCY@peggleto-mobl5.ger.corp.intel.com>
	<8485696.3mtcMOoHMt@peggleto-mobl5.ger.corp.intel.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH] ifplugd: Added ifplugd recipe.
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
X-List-Received-Date: Wed, 07 May 2014 11:17:05 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Thanks for the feedback Paul

Are there a document stating the "best pratice" sequence of lines in re=
cipes?

that said I might have been grabing the recipe from OE-Classic. Before =
posting=20
this patch I tried to find the recipe on layers.openembedded.org withou=
t luck.

But just skip the patch - connman is the way to go I guess.


Onsdag den 7. maj 2014 11:43:40 skrev Paul Eggleton:
> On Wednesday 07 May 2014 11:34:23 Paul Eggleton wrote:
> > Hi S=F8ren,
> >=20
> > So leaving aside that ifplugd is completely dead upstream, a few sm=
all
> > pieces of feedback on the recipe:
> >=20
> > On Wednesday 07 May 2014 11:26:17 S=F8ren Holm wrote:
> > > Signed-off-by: S=F8ren Holm <sgh@sgh.dk>
> > > ---
> > >=20
> > >  .../ifplugd/files/ifplugd.conf                     | 42
> > >=20
> > > ++++++++++++++++++++++ .../recipes-connectivity/ifplugd/ifplugd_0=
.28.bb
> > >=20
> > > 23 ++++++++++++ 2 files changed, 65 insertions(+)
> > >=20
> > >  create mode 100644
> > >=20
> > > meta-networking/recipes-connectivity/ifplugd/files/ifplugd.conf c=
reate
> > > mode
> > > 100644 meta-networking/recipes-connectivity/ifplugd/ifplugd_0.28.=
bb
> > >=20
> > > diff --git
> > > a/meta-networking/recipes-connectivity/ifplugd/files/ifplugd.conf=

> > > b/meta-networking/recipes-connectivity/ifplugd/files/ifplugd.conf=
 new
> > > file mode 100644
> > > index 0000000..1e0f83a
> > > --- /dev/null
> > > +++ b/meta-networking/recipes-connectivity/ifplugd/files/ifplugd.=
conf
> > > @@ -0,0 +1,42 @@
> > > +# -*-sh-*-
> > > +# $Id: ifplugd.conf 43 2003-09-13 11:25:11Z lennart $
> > > +
> > > +# This file is part of ifplugd.
> > > +#
> > > +# ifplugd is free software; you can redistribute it and/or modif=
y it
> > > under
> > > +# the terms of the GNU General Public License as published by th=
e Free
> > > +# Software Foundation; either version 2 of the License, or (at y=
our
> > > +# option) any later version.
> > > +#
> > > +# ifplugd is distributed in the hope that it will be useful, but=

> > > WITHOUT
> > > +# ANY WARRANTY; without even the implied warranty of MERCHANTABI=
LITY or
> > > +# FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public L=
icense
> > > +# for more details.
> > > +#
> > > +# You should have received a copy of the GNU General Public Lice=
nse
> > > +# along with ifplugd; if not, write to the Free Software Foundat=
ion,
> > > +# Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA.
> > > +
> > > +# ifplugd configuration file
> > > +
> > > +# Please note that this is a bourne shell fragment sourced by th=
e
> > > +# init script of ifplugd.
> > > +
> > > +# Specify the interfaces to control here, separated by spaces.
> > > +# Ifplugd processes will be started for each of these interfaces=
 when
> > > +# the ifplugd init script is called with the "start" argument. Y=
ou may
> > > +# use the magic string "auto" to make the init script start or s=
top
> > > +# ifplugd processes for ALL eth and wlan interfaces that are ava=
ilable
> > > +# according to /proc/net/dev. Note that the list of interfaces
> > > +# appearing in /proc/net/dev may depend on which kernel modules =
you
> > > +# have loaded.
> > > +INTERFACES=3D"eth0"
> > > +
> > > +# Additional parameters for ifplugd.
> > > +# (Run "ifplugd -h" for further information.)
> > > +ARGS=3D"-fwI -u0 -d10"
> > > +
> > > +# Additional parameters for ifplugd for the specified interface.=
  Note
> > > +# that $ARGS is ignored, when a variable like this is set for an=

> > > +# interface
> > > +#ARGS_wlan0=3D"-MwI -u5 -d5"
> > > diff --git
> > > a/meta-networking/recipes-connectivity/ifplugd/ifplugd_0.28.bb
> > > b/meta-networking/recipes-connectivity/ifplugd/ifplugd_0.28.bb ne=
w file
> > > mode 100644
> > > index 0000000..340d5f4
> > > --- /dev/null
> > > +++ b/meta-networking/recipes-connectivity/ifplugd/ifplugd_0.28.b=
b
> > > @@ -0,0 +1,23 @@
> > > +DESCRIPTION =3D "Daemon for monitoring ethernet device link stat=
e"
> >=20
> > Please use SUMMARY instead of DESCRIPTION of a
>=20
> Sorry, that should have been "Please use SUMMARY instead of DESCRIPTI=
ON for
> a short description like this".
>=20
> Cheers,
> Paul

--=20
S=F8ren Holm

