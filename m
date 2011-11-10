Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1RORg6-0007aK-E3
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Nov 2011 11:16:14 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 10 Nov 2011 02:09:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,488,1315206000"; d="scan'208";a="35270638"
Received: from unknown (HELO helios.localnet) ([10.252.121.140])
	by AZSMGA002.ch.intel.com with ESMTP; 10 Nov 2011 02:09:49 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 10 Nov 2011 09:47:34 +0000
Message-ID: <2977361.KIYvSC26hZ@helios>
Organization: Intel Corporation
User-Agent: KMail/4.7.2 (Linux/3.0.0-12-generic-pae; KDE/4.7.2; i686; ; )
In-Reply-To: <20111110074717.GC3933@ad.chargestorm.se>
References: <201111092321.33622.schnitzeltony@gmx.de>
	<20111110074717.GC3933@ad.chargestorm.se>
MIME-Version: 1.0
Subject: Re: systemd packages -> image
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
X-List-Received-Date: Thu, 10 Nov 2011 10:16:15 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

On Thursday 10 November 2011 08:47:17 Anders Darander wrote:
> * Andreas M=FCller <schnitzeltony@gmx.de> [111109 23:17]:
> > Imagine a recipe is included into an image by a task and later gets=

> > systemd- native support.
> > How about forcing the packages in SYSTEMD_PACKAGES packed into imag=
es in
> > case
> >=20
> > IMAGE_INIT_MANAGER  =3D "systemd"
> >=20
> > is found in the image definition?
>=20
> Sure, that sounds like a nice idea. Although, in that case, SysV-init=

> files should probably also be packaged in separate packages and be
> installed in a similar manner.

Why are we going to such an effort to provide both sysvinit and systemd=
 in the=20
same distro? Why not make it a distro policy decision? This would save =
a huge=20
amount of work.

Cheers,
Paul

--=20

Paul Eggleton
Intel Open Source Technology Centre


