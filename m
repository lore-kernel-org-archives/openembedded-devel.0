Received: from [200.17.161.174] (helo=listas.ossystems.com.br)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio@freedom.ind.br>) id 1L7wKv-0002ao-CK
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Dec 2008 19:20:33 +0100
Received: from internet.ossystems.com.br
	(201-40-162-47.cable.viacabocom.com.br [201.40.162.47])
	by listas.ossystems.com.br (Postfix) with ESMTP id 36B45401F9
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Dec 2008 14:17:02 -0200 (BRST)
Received: from ossystems.com.br (unknown [10.1.0.243])
	by internet.ossystems.com.br (Postfix) with ESMTP id 02EB0C3AF
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Dec 2008 16:16:13 -0200 (BRST)
Received: by ossystems.com.br (Postfix, from userid 1000)
	id 32DD8610074; Wed,  3 Dec 2008 16:16:58 -0200 (BRST)
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
From: Otavio Salvador <otavio@debian.org>
Organization: O.S. Systems Ltda.
X-URL: http://www.debian.org/~otavio/
X-Attribution: O.S.
Date: Wed, 03 Dec 2008 16:16:58 -0200
Message-ID: <87hc5lp1id.fsf@neumann.lab.ossystems.com.br>
User-Agent: Gnus/5.11 (Gnus v5.11) Emacs/22.2 (gnu/linux)
MIME-Version: 1.0
Subject: wierd rdepends on libvolume-id-dev
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
X-List-Received-Date: Wed, 03 Dec 2008 18:20:34 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello,

I've noticed a very weird rdepends on libvolume-id-dev. Take a look
bellow:

otavio@neumann:~/hacking/ossystems/oe$ dpkg -I tmp/deploy/glibc/ipk/i486/ud=
ev_*_i486.ipk=20
 novo pacote debian, vers=C3=A3o 2.0.
 tamanho 83462 bytes: arquivo de controle=3D 842 bytes.
     947 bytes,    13 linhas      control=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20
     103 bytes,     7 linhas   *  postinst             #!/bin/sh
      37 bytes,     2 linhas   *  postrm               #!/bin/sh
      62 bytes,     4 linhas   *  prerm                #!/bin/sh
 Package: udev
 Version: 124-r8.1
 Description: udev is a daemon which dynamically creates and removes device=
 nodes from /dev/, handles hotplug events and loads drivers at boot time. I=
t replaces the hotplug package and requires a kernel not older than 2.6.12.
 Section: base
 Priority: optional
 Maintainer: Angstrom Developers <angstrom-distro-devel@linuxtogo.org>
 License: GPL
 Architecture: i486
 OE: udev
 Homepage: http://www.ossystems.com.br
 Depends: update-rc.d, libvolume-id-dev (>=3D 124), libc6 (>=3D 2.6.1), ude=
v-locale*
 Provides: hotplug
 Source: http://kernel.org/pub/linux/utils/kernel/hotplug/udev-124.tar.gz f=
ile://noasmlinkage.patch;patch=3D1 file://flags.patch;patch=3D1 file://vol_=
id_ld.patch;patch=3D1 file://udevtrigger_add_devname_filtering.patch;patch=
=3D1 file://mount.blacklist file://run.rules file://udev.rules file://devfs=
-udev.rules file://links.conf file://permissions.rules file://mount.sh file=
://network.sh file://local.rules file://init

Do someone has any idea why it has this depends?

--=20
        O T A V I O    S A L V A D O R
---------------------------------------------
 E-mail: otavio@debian.org      UIN: 5906116
 GNU/Linux User: 239058     GPG ID: 49A5F855
 Home Page: http://otavio.ossystems.com.br
---------------------------------------------
"Microsoft sells you Windows ... Linux gives
 you the whole house."


