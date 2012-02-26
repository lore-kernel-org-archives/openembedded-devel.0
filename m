Received: from smtp3-g21.free.fr ([212.27.42.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1S1iAG-00005s-QU
	for openembedded-devel@lists.openembedded.org;
	Sun, 26 Feb 2012 18:45:41 +0100
Received: from eb-e6520 (unknown [82.233.81.124])
	by smtp3-g21.free.fr (Postfix) with ESMTP id 01D38A62A6;
	Sun, 26 Feb 2012 18:37:12 +0100 (CET)
Date: Sun, 26 Feb 2012 18:37:11 +0100
From: Eric =?ISO-8859-1?B?QuluYXJk?= <eric@eukrea.com>
To: Roland <rolandu@gmail.com>
Message-ID: <20120226183711.312b7e58@eb-e6520>
In-Reply-To: <4F4A68FE.2020109@gmail.com>
References: <4F4A68FE.2020109@gmail.com>
Organization: =?ISO-8859-1?B?RXVrculh?= Electromatique
X-Mailer: Claws Mail 3.8.0 (GTK+ 2.24.8; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: angstrom site down, where to find mirrors
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
X-List-Received-Date: Sun, 26 Feb 2012 17:45:41 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi Roland,

Le Sun, 26 Feb 2012 19:16:46 +0200,
Roland <rolandu@gmail.com> a =E9crit :

> Hi.
>=20
> It looks like my first experiments with openembedded started at a bad tim=
e.
>=20
> angstrom distribution's website is down, so some files which are needed=20
> to build anything are gone.
>=20
> I'm trying to create the crosscompiler, but running=20
> recipes/gnu-config/gnu-config_git.bb, do_fetch is impossible since=20
> angstrom website is down, and none of the mirrors work.
>=20
> So my question is:
>=20
> where can I find mirrors for this file, and how do I add the mirrors to=20
> the build system.
>=20
> Thanks for any advise You can give me,
>
you can remove angstrom mirrors by editing :
sources/meta-angstrom/conf/distro/include/angstrom.inc
and commentting out line 96 :
# INHERIT +=3D "angstrom-mirrors"=20

Even when angstrom mirror is up it can be quite slow so you may save
some time by not using the mirror (but some downloads may fail if the
original source is no more available online).

Eric
--=20
http://eukrea.com/en/news/104-2012


