Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RggfQ-0000Hu-K4
	for openembedded-devel@lists.openembedded.org;
	Fri, 30 Dec 2011 18:54:56 +0100
Received: by eeit10 with SMTP id t10so8816732eei.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Dec 2011 09:47:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Xj2XLqTC2kavQWdsbp2EJ8fwkeuAVdU4aTBBmM96CyQ=;
	b=HdRjVkcX4v7zjNN+jGx2WEAh1pCCoQ+4YLpyyaRNrAMymiD82ed0kSABHHMYVCQVrR
	cf8eYioMgm3V++S+89iLJJwaV4D9StZwaB+qEOXaU4Bdy3c3YxRHaKqJPSBYLKNDhrwR
	V5PiRLxxyaZRK6dw0gwklSq8BjHncZj04+m7E=
Received: by 10.14.187.143 with SMTP id y15mr15803808eem.96.1325267260918;
	Fri, 30 Dec 2011 09:47:40 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id 76sm150704281eeh.0.2011.12.30.09.47.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 30 Dec 2011 09:47:40 -0800 (PST)
Date: Fri, 30 Dec 2011 18:47:28 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20111230174728.GK16885@jama.jama.net>
References: <cover.1325263010.git.otavio@ossystems.com.br>
	<jdksmv$83n$1@dough.gmane.org>
	<CAP9ODKrwPeDTXoi-KxOWs3s_HcoX8n-F4WB7PYCc8m99hEVK+g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP9ODKrwPeDTXoi-KxOWs3s_HcoX8n-F4WB7PYCc8m99hEVK+g@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH v3 0/3] Move xserver-nodm-init systemd support to xserver-nodm-init-systemd
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
X-List-Received-Date: Fri, 30 Dec 2011 17:54:56 -0000
X-Groupsio-MsgNum: 36327
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="nhAUiXSLan16V5i8"
Content-Disposition: inline

--nhAUiXSLan16V5i8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 30, 2011 at 03:40:11PM -0200, Otavio Salvador wrote:
> On Fri, Dec 30, 2011 at 15:34, Koen Kooi <koen@dominion.thruhere.net> wro=
te:
>=20
> > Still missing a few:
> >
> > koen@dominion:/OE/tentacle/sources/openembedded-core$ for i in ../* ; do
> > echo $(basename $PWD); git grep xserver-nodm-init | grep -v
> > distro_tracking_fields ; cd $i ; done
> > openembedded-core
> > meta/conf/multilib.conf:BBCLASSEXTEND_append_pn-xserver-nodm-init =3D "
> > ${MULTILIBS}"
> > meta/recipes-sato/tasks/task-core-x11.bb:# elsa, xserver-nodm-init
> > meta/recipes-sato/tasks/task-core-x11.bb:
> > VIRTUAL-RUNTIME_graphical_init_manager
> > ?=3D "xserver-nodm-init"
> >
>=20
> This is OE-Core ...
>=20
>=20
> > ...
>=20
> recipes-images/angstrom/efl-nodm-image.bb:    xserver-nodm-init \
> >
>=20
> I don't use angstrom, sorry.
>  ...
>   meta-efl/recipes-efl/efl/elsa_svn.bb:RCONFLICTS_${PN} +=3D
> "xserver-nodm-init"
>=20
> > meta-efl/recipes-efl/efl/elsa_svn.bb:RREPLACES_${PN} +=3D
> > "xserver-nodm-init"
> > meta-efl/recipes-efl/efl/elsa_svn.bb:RCONFLICTS_${PN}-systemd +=3D
> > "xserver-nodm-init"
> > meta-efl/recipes-efl/efl/elsa_svn.bb:RREPLACES_${PN}-systemd +=3D
> > "xserver-nodm-init"
> > meta-oe/recipes-core/tasks/task-x11_1.0.bb:# elsa, xserver-nodm-init
> > meta-oe/recipes-core/tasks/task-x11_1.0.bb:
> > VIRTUAL-RUNTIME_graphical_init_manager
> > ?=3D "xserver-nodm-init"
> >
>=20
> Fixed on this patchset.
>=20
>=20
> > meta-openpandora
> > meta-shr
> > meta-smartphone
> > meta-shr/conf/distro/shr.conf:VIRTUAL-RUNTIME_graphical_init_manager =3D
> > "xserver-nodm-init"
> > meta-ti
> > recipes-misc/images/cloud9-gfx-image.bb:
> >  xserver-nodm-init \
> > meta-xilinx
> > koen@dominion:/OE/tentacle/sources/openembedded-core$
> >
>=20
> Meta-TI and Meta-SHR isn't on my business too ... sorry.

Yes meta-shr/shr has xserver-nodm-init and expects sysvinit only, so
this is right. I'll add xserver-nodm-init-systemd to meta-shr/jansa/systemd=
=20
when it's in meta-oe and meta-shr/jansa/systemd-elsa is using elsa anyway.

Regards,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--nhAUiXSLan16V5i8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk79+TAACgkQN1Ujt2V2gBwiTQCeKRfPUgnTQ1puzlurIOO5cTYK
8fYAmwY6vyrd3WKYeD/QS8RRHbq6nDVm
=l8fa
-----END PGP SIGNATURE-----

--nhAUiXSLan16V5i8--
