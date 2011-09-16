Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1R4ZYe-0005JH-Vb
	for openembedded-devel@lists.openembedded.org;
	Fri, 16 Sep 2011 16:38:24 +0200
Received: by fxi1 with SMTP id 1so1827360fxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Sep 2011 07:33:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=dgPiktmwmRqJ3JUoEA3pz+KfNkfkhnhawhWT5r9izAE=;
	b=LG8UX6r6X99S4D8DGg6TwewvLkKMr0WOxB8PPmXkRwLcZ80Y+5Tw/FhGO/eoM17QRz
	Y0PHX7hCEg9goWMDErQVbG4qO+5ESbt3w9aG7EWwybuBPu808LKLwzHvuUIDCz7Fyech
	9gluObx+gXOa4bNFb/rEwzMUBeOG/SQKSge9o=
Received: by 10.223.13.208 with SMTP id d16mr3115836faa.141.1316183591812;
	Fri, 16 Sep 2011 07:33:11 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id x22sm10762407faa.5.2011.09.16.07.33.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 16 Sep 2011 07:33:10 -0700 (PDT)
Date: Fri, 16 Sep 2011 16:33:03 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110916143303.GP7445@jama.jama.net>
References: <6b5477acbb0bbaf15b13f6dbc2121ba0e2fe7100.1316181283.git.Martin.Jansa@gmail.com>
	<443990646f24d1018edc048aff09230ebab2b94f.1316181283.git.Martin.Jansa@gmail.com>
	<j4vlo2$au4$1@dough.gmane.org>
MIME-Version: 1.0
In-Reply-To: <j4vlo2$au4$1@dough.gmane.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH 03/10] xserver-xorg-conf: drop from meta-oe, update xorg-xserver-common.inc to RDEPENDS on xserver-xf86-config from oe-core and bsp layers
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
X-List-Received-Date: Fri, 16 Sep 2011 14:38:25 -0000
X-Groupsio-MsgNum: 34310
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="PT0wT86ZVVq2zanE"
Content-Disposition: inline

--PT0wT86ZVVq2zanE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 16, 2011 at 04:16:34PM +0200, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
> Op 16-09-11 15:56, Martin Jansa schreef:
>=20
> > xserver-xorg-conf: drop from meta-oe, update xorg-xserver-common.inc to=
=20
> > RDEPENDS on xserver-xf86-config from oe-core and bsp layers
>=20
> Which BSP layers are that? Do you have an example on how to convert from
> xserver-xorg-conf to xserver-xf86-config while keeping upgrade paths sane?

I've converted only meta-smartphone BSP layers:
http://git.shr-project.org/git/?p=3Dmeta-smartphone.git;a=3Dcommit;h=3D50dc=
a4e19704fcc4f43df97d616a04b648dfa703
http://git.shr-project.org/git/?p=3Dmeta-smartphone.git;a=3Dcommit;h=3D97f6=
3c45f744a5af13664f8e84167dc629fb6382

But tested upgrade paths only together with switch from xorg-xserver to
xserver-xf86 (on all 3 layers oe-core/meta-oe/meta-sp)

xserver-xf86: upgrade to 1.11.0 and move shared definitions to .inc files
  http://git.openembedded.org/cgit.cgi/openembedded-core-contrib/commit/?h=
=3Djansa/x11&id=3D9ac74def4a67094ded2d27823ba87cd6c2cf3b5d
task-x11: use xserver-xf86-lite as default XSERVER
  http://git.openembedded.org/cgit.cgi/meta-openembedded-contrib/commit/?h=
=3Djansa/x11&id=3D3788736bad0e2ede2530187b17997770cf4679e9
BSPs: switch from xserver-xorg to xserver-xf86(-dri)-lite
  http://git.shr-project.org/git/?p=3Dmeta-smartphone.git;a=3Dcommit;h=3D66=
ce099bd0512eb56db61df25856612d7d89a8d0

But if we ever want meta-x11 layer then we should at least use only one
set of xserver recipes.. and as I know you've proposed to use xorg-*
recipes from old oe.dev in oe-core few times and it always ended without
warm welcome.. (if I remember tsc minutes right..)

Regards,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--PT0wT86ZVVq2zanE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk5zXh8ACgkQN1Ujt2V2gBwytwCdGdS/RbU9/JZe2u4FE4HfSc4T
p3UAnRytAekinP+TohPmwT592RgmpA36
=lCN3
-----END PGP SIGNATURE-----

--PT0wT86ZVVq2zanE--
