Received: from [93.97.175.187] (helo=dan.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1MTxWw-0005UW-P0
	for openembedded-devel@openembedded.org; Thu, 23 Jul 2009 14:36:15 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	n6NCKulj014796 for <openembedded-devel@openembedded.org>;
	Thu, 23 Jul 2009 13:20:56 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 2YZ1VM8tUqXC for <openembedded-devel@openembedded.org>;
	Thu, 23 Jul 2009 13:20:56 +0100 (BST)
Received: from [192.168.1.3] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	n6NCKnvO014773
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-devel@openembedded.org>;
	Thu, 23 Jul 2009 13:20:51 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <200907231246.26866.khimov@altell.ru>
References: <1248201134.26475.15.camel@dax.rpnet.com>
	<200907230948.13502.khimov@altell.ru>
	<1248336291.14790.19.camel@dax.rpnet.com>
	<200907231246.26866.khimov@altell.ru>
Date: Thu, 23 Jul 2009 13:19:56 +0100
Message-Id: <1248351596.14790.28.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
X-MIME-Autoconverted: from 8bit to quoted-printable by dan.rpsys.net id
	n6NCKulj014796
Subject: Re: [Bitbake-dev] Bitbake runqueue performance improvement
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
X-List-Received-Date: Thu, 23 Jul 2009 12:36:15 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, 2009-07-23 at 12:46 +0400, Roman I Khimov wrote:
> On =D0=A7=D0=B5=D1=82=D0=B2=D0=B5=D1=80=D0=B3 23 =D0=B8=D1=8E=D0=BB=D1=8F=
 2009 12:04:51 Richard Purdie wrote:
> > do_rootfs[depends] +=3D "some-other-image-task:do_rootfs"
> >
> > Is there some reason this doesn't work?
>=20
> Well, that would work, obviously, but seemed like a bad style to me, we=
 have=20
> DEPENDS for recipe dependencies, so why images should be that different=
? And=20
> in my case it would be
>=20
> do_rootfs[depends] +=3D "image2:do_rootfs image3:do_rootfs image4:do_ro=
otfs \
> 	image5:do_rootfs"
>=20
> compared to
>=20
> DEPENDS +=3D "image2 image3 image4 image5"
>=20
> which worked well for quite some time.
>=20
> If there is any way to keep this DEPENDS behaviour?

DEPENDS is defined to mean that everything listed there must have
completed its staging task (do_populate_staging) before the recipe in
question's configure task has run.

Its a shorthand for creating dependencies of the most common kind and
you are overloading it with something with a different meaning which
just happens to work if you fudge things in the right places.

The whole point is that we want the dependencies to be clear. Your
approach is anything but clear IMO.

Also note that DEPENDS only gets its magical meaning from the entry in
base.bbclass which says:

do_configure[deptask] =3D "do_populate_staging"

and these forms are what bitbake actually works with, not the shorthand
convenience forms of DEPENDS and RDEPENDS.

Cheers,

Richard



