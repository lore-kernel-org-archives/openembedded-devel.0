Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id B03CA60144
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 May 2014 10:43:43 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 07 May 2014 03:43:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,1002,1389772800"; d="scan'208";a="527726204"
Received: from unknown (HELO peggleto-mobl5.ger.corp.intel.com)
	([10.252.122.213])
	by fmsmga001.fm.intel.com with ESMTP; 07 May 2014 03:43:41 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: =?ISO-8859-1?Q?S=F8ren?= Holm <sgh@sgh.dk>
Date: Wed, 07 May 2014 11:43:40 +0100
Message-ID: <8485696.3mtcMOoHMt@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.12.5 (Linux/3.14.2-200.fc20.x86_64; KDE/4.12.4; x86_64; ; )
In-Reply-To: <2543976.qS9USN9dCY@peggleto-mobl5.ger.corp.intel.com>
References: <1399454777-2868-1-git-send-email-sgh@sgh.dk>
	<2543976.qS9USN9dCY@peggleto-mobl5.ger.corp.intel.com>
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
X-List-Received-Date: Wed, 07 May 2014 10:43:47 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

On Wednesday 07 May 2014 11:34:23 Paul Eggleton wrote:
> Hi S=F8ren,
>=20
> So leaving aside that ifplugd is completely dead upstream, a few smal=
l
> pieces of feedback on the recipe:
>=20
> On Wednesday 07 May 2014 11:26:17 S=F8ren Holm wrote:
> > Signed-off-by: S=F8ren Holm <sgh@sgh.dk>
> > ---
> >=20
> >  .../ifplugd/files/ifplugd.conf                     | 42
> >=20
> > ++++++++++++++++++++++ .../recipes-connectivity/ifplugd/ifplugd_0.2=
8.bb =20
> > |
> > 23 ++++++++++++ 2 files changed, 65 insertions(+)
> >=20
> >  create mode 100644
> >=20
> > meta-networking/recipes-connectivity/ifplugd/files/ifplugd.conf cre=
ate
> > mode
> > 100644 meta-networking/recipes-connectivity/ifplugd/ifplugd_0.28.bb=

> >=20
> > diff --git
> > a/meta-networking/recipes-connectivity/ifplugd/files/ifplugd.conf
> > b/meta-networking/recipes-connectivity/ifplugd/files/ifplugd.conf n=
ew
> > file mode 100644
> > index 0000000..1e0f83a
> > --- /dev/null
> > +++ b/meta-networking/recipes-connectivity/ifplugd/files/ifplugd.co=
nf
> > @@ -0,0 +1,42 @@
> > +# -*-sh-*-
> > +# $Id: ifplugd.conf 43 2003-09-13 11:25:11Z lennart $
> > +
> > +# This file is part of ifplugd.
> > +#
> > +# ifplugd is free software; you can redistribute it and/or modify =
it
> > under
> > +# the terms of the GNU General Public License as published by the =
Free
> > +# Software Foundation; either version 2 of the License, or (at you=
r
> > +# option) any later version.
> > +#
> > +# ifplugd is distributed in the hope that it will be useful, but W=
ITHOUT
> > +# ANY WARRANTY; without even the implied warranty of MERCHANTABILI=
TY or
> > +# FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public Lic=
ense
> > +# for more details.
> > +#
> > +# You should have received a copy of the GNU General Public Licens=
e
> > +# along with ifplugd; if not, write to the Free Software Foundatio=
n,
> > +# Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA.
> > +
> > +# ifplugd configuration file
> > +
> > +# Please note that this is a bourne shell fragment sourced by the
> > +# init script of ifplugd.
> > +
> > +# Specify the interfaces to control here, separated by spaces.
> > +# Ifplugd processes will be started for each of these interfaces w=
hen
> > +# the ifplugd init script is called with the "start" argument. You=
 may
> > +# use the magic string "auto" to make the init script start or sto=
p
> > +# ifplugd processes for ALL eth and wlan interfaces that are avail=
able
> > +# according to /proc/net/dev. Note that the list of interfaces
> > +# appearing in /proc/net/dev may depend on which kernel modules yo=
u
> > +# have loaded.
> > +INTERFACES=3D"eth0"
> > +
> > +# Additional parameters for ifplugd.
> > +# (Run "ifplugd -h" for further information.)
> > +ARGS=3D"-fwI -u0 -d10"
> > +
> > +# Additional parameters for ifplugd for the specified interface.  =
Note
> > +# that $ARGS is ignored, when a variable like this is set for an
> > +# interface
> > +#ARGS_wlan0=3D"-MwI -u5 -d5"
> > diff --git a/meta-networking/recipes-connectivity/ifplugd/ifplugd_0=
.28.bb
> > b/meta-networking/recipes-connectivity/ifplugd/ifplugd_0.28.bb new =
file
> > mode 100644
> > index 0000000..340d5f4
> > --- /dev/null
> > +++ b/meta-networking/recipes-connectivity/ifplugd/ifplugd_0.28.bb
> > @@ -0,0 +1,23 @@
> > +DESCRIPTION =3D "Daemon for monitoring ethernet device link state"=

>=20
> Please use SUMMARY instead of DESCRIPTION of a

Sorry, that should have been "Please use SUMMARY instead of DESCRIPTION=
 for a=20
short description like this".

Cheers,
Paul

--=20

Paul Eggleton
Intel Open Source Technology Centre

