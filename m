Received: from smtp2-g21.free.fr ([212.27.42.2])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1S77ya-0003E9-V5
	for openembedded-devel@lists.openembedded.org;
	Mon, 12 Mar 2012 17:20:01 +0100
Received: from eb-e6520 (unknown [82.240.38.71])
	by smtp2-g21.free.fr (Postfix) with ESMTP id 0AA364B0012
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Mar 2012 17:11:15 +0100 (CET)
Date: Mon, 12 Mar 2012 17:11:14 +0100
From: Eric =?ISO-8859-1?B?QuluYXJk?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120312171114.31605333@eb-e6520>
In-Reply-To: <CAOd_LFz=vdziR_t_fKR=139=b=vzBgK4hyWxytXS+e0xf7ZTRQ@mail.gmail.com>
References: <CAOd_LFz=vdziR_t_fKR=139=b=vzBgK4hyWxytXS+e0xf7ZTRQ@mail.gmail.com>
Organization: =?ISO-8859-1?B?RXVrculh?= Electromatique
X-Mailer: Claws Mail 3.8.0 (GTK+ 2.24.8; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
Subject: Re: login problem
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
X-List-Received-Date: Mon, 12 Mar 2012 16:20:01 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi Cliff,

Le Mon, 12 Mar 2012 10:50:52 -0500,
Cliff Brake <cliff.brake@gmail.com> a =E9crit :

> I have a customer who would prefer to use sysvinit (over systemd), so
> I'm trying various non-systemd images.  core-image-minimal built with
> recent oe-core, meta-oe, and meta-angstrom is giving me the following
> when I try to log in:
>=20
> beagleboard login: root
> login: no valid shadow password
>=20
> Wondering if anyone else has tried this recently, and should it work?
> Are we still trying to keep sysvinit images working in Angstrom?
>=20
with this :
IMAGE_INSTALL +=3D "angstrom-task-boot dropbear initscripts"

IMAGE_LOGIN_MANAGER =3D "shadow"
IMAGE_DEV_MANAGER =3D "busybox-mdev"
IMAGE_INIT_MANAGER =3D "sysvinit sysvinit-pidof"
IMAGE_INITSCRIPTS =3D "initscripts"

IMAGE_INSTALL +=3D "\
	task-boot \
	${IMAGE_INITSCRIPTS} \
	${IMAGE_DEV_MANAGER} \
	${IMAGE_INIT_MANAGER} \
	${IMAGE_LOGIN_MANAGER} \
	..."


it works fine here (oe-core + meta-oe + meta-angstrom)

Eric
--=20
http://eukrea.com/en/news/104-2012


