Received: from mail.reciva.com ([82.71.203.194] helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1NPwgy-0008HK-DV
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 Dec 2009 12:26:19 +0100
Received: from castle.reciva.com ([82.71.203.193]
	helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtps (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1NPwf5-0000J3-4e
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 Dec 2009 11:24:19 +0000
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <philb@gnu.org>) id 1NPwf4-0004XT-NJ
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 Dec 2009 11:24:18 +0000
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <op.u5qvsqdlmn1qzu@guohr-laptop-ubuntu>
References: <> <1262160936-28480-1-git-send-email-camelguo@gmail.com>
	<1262164396.2553.2.camel@lenovo.internal.reciva.com>
	<op.u5qvsqdlmn1qzu@guohr-laptop-ubuntu>
Date: Wed, 30 Dec 2009 11:24:14 +0000
Message-Id: <1262172255.15344.118.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.3 
X-SA-Exim-Connect-IP: 82.71.203.194
X-SA-Exim-Mail-From: philb@gnu.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] Remove the micro distro specific overridding of variables
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
X-List-Received-Date: Wed, 30 Dec 2009 11:26:19 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

It sounds to me as though micro is simply not the right DISTRO for your
purposes.  If you want to use eglibc, and you want the packages to
contain the full complement of files, you might be better off with
minimal.

p.

On Wed, 2009-12-30 at 17:39 +0800, Guo Hongruan wrote:
> I searched the whole openembedded directory and found the following =20
> references of micro as DISTRO overriding.
> recipes/base-passwd/base-passwd_3.5.20.bb:do_install_micro () {
> recipes/sysvinit/sysvinit_2.86.bb:RRECOMMENDS_${PN}_micro =3D ""
>=20
> Through the above references, I can say that the initial motion of using =
=20
> micro as overriding is trying to keep the image as small as possible. To =
=20
> achieve the goal, the initial author added the check/overriding of =20
> micro/micro-uclibc. But how many space will be saved by just no installin=
g =20
> the several plain text files? I think the basic unit of installation =20
> should be package not file. To keep the image small, we should control th=
e =20
> packages installed.
>=20
> If someone realy does not want to install some files in =20
> base-file/base-passwd/sysvinit to keep the image smaller, they can =20
> rewrites the corresponding recipes and put them into their private bb fil=
e =20
> collection.
>=20
> =E5=9C=A8 Wed, 30 Dec 2009 17:13:16 +0800=EF=BC=8CPhil Blundell <philb@gn=
u.org> =E5=86=99=E9=81=93:
>=20
> > This patch is wrong.  If you make this change then base-files will gain
> > a whole load of files which are not wanted for micro.
> >
> > p.
> >
> > On Wed, 2009-12-30 at 16:15 +0800, Guo Hongruan wrote:
> >> 1. Remove the *_micro variable overridding;
> >> 2. Remove the micro/micro-uclibc specific installation decision, which=
 =20
> >> causes the installation of base-file failed when =20
> >> DISTRO=3Dmicro/micro-uclibc.
> >> ---
> >>  recipes/base-files/base-files_3.0.14.bb |   70 =20
> >> ++++++++++++++-----------------
> >>  1 files changed, 31 insertions(+), 39 deletions(-)
> >>
> >> diff --git a/recipes/base-files/base-files_3.0.14.bb =20
> >> b/recipes/base-files/base-files_3.0.14.bb
> >> index 483aef7..61bb71e 100644
> >> --- a/recipes/base-files/base-files_3.0.14.bb
> >> +++ b/recipes/base-files/base-files_3.0.14.bb
> >> @@ -46,12 +46,7 @@ dirs755 =3D "/bin /boot /dev ${sysconfdir} =20
> >> ${sysconfdir}/default \
> >>  	   /media/union /media/realroot /media/hdd \
> >>  	   /media/mmc1"
> >>
> >> -dirs755_micro =3D "/dev /proc /sys ${sysconfdir}"
> >> -dirs2775_micro =3D ""
> >> -dirs1777_micro =3D "/tmp"
> >> -
> >>  media =3D "card cf net ram"
> >> -media_micro =3D ""
> >>
> >>  volatiles =3D "cache run log lock tmp"
> >>  conffiles =3D "${sysconfdir}/debian_version ${sysconfdir}/host.conf \
> >> @@ -93,40 +88,38 @@ do_install () {
> >>  		echo ${hostname} > ${D}${sysconfdir}/hostname
> >>  	fi
> >>
> >> -        if [ "${DISTRO}" !=3D "micro" -a "${DISTRO}" !=3D "micro-ucli=
bc" =20
> >> ]; then
> >> -                install -m 644 ${WORKDIR}/issue*  ${D}${sysconfdir}
> >> -
> >> -                if [ -n "${DISTRO_NAME}" ]; then
> >> -        		echo -n "${DISTRO_NAME} " >> ${D}${sysconfdir}/issue
> >> -        		echo -n "${DISTRO_NAME} " >> ${D}${sysconfdir}/issue.net
> >> -        		if [ -n "${DISTRO_VERSION}" ]; then
> >> -        			echo -n "${DISTRO_VERSION} " >> ${D}${sysconfdir}/issue
> >> -        			echo -n "${DISTRO_VERSION} " >> ${D}${sysconfdir}/issue.ne=
t
> >> -        		fi
> >> -        		echo "\n \l" >> ${D}${sysconfdir}/issue
> >> -        		echo >> ${D}${sysconfdir}/issue
> >> -        		echo "%h"    >> ${D}${sysconfdir}/issue.net
> >> -        		echo >> ${D}${sysconfdir}/issue.net
> >> -        	else
> >> - 	                install -m 0644 ${WORKDIR}/issue =20
> >> ${D}${sysconfdir}/issue
> >> -                        install -m 0644 ${WORKDIR}/issue.net =20
> >> ${D}${sysconfdir}/issue.net
> >> -                fi
> >> +	install -m 644 ${WORKDIR}/issue*  ${D}${sysconfdir}
> >> +
> >> +	if [ -n "${DISTRO_NAME}" ]; then
> >> +		echo -n "${DISTRO_NAME} " >> ${D}${sysconfdir}/issue
> >> +		echo -n "${DISTRO_NAME} " >> ${D}${sysconfdir}/issue.net
> >> +		if [ -n "${DISTRO_VERSION}" ]; then
> >> +			echo -n "${DISTRO_VERSION} " >> ${D}${sysconfdir}/issue
> >> +			echo -n "${DISTRO_VERSION} " >> ${D}${sysconfdir}/issue.net
> >> +		fi
> >> +		echo "\n \l" >> ${D}${sysconfdir}/issue
> >> +		echo >> ${D}${sysconfdir}/issue
> >> +		echo "%h"    >> ${D}${sysconfdir}/issue.net
> >> +		echo >> ${D}${sysconfdir}/issue.net
> >> +	else
> >> +		install -m 0644 ${WORKDIR}/issue ${D}${sysconfdir}/issue
> >> +		install -m 0644 ${WORKDIR}/issue.net ${D}${sysconfdir}/issue.net
> >> +	fi
> >> +
> >> +	install -m 0644 ${WORKDIR}/fstab ${D}${sysconfdir}/fstab
> >> +	install -m 0644 ${WORKDIR}/filesystems ${D}${sysconfdir}/filesystems
> >> +	install -m 0644 ${WORKDIR}/usbd ${D}${sysconfdir}/default/usbd
> >> +	install -m 0644 ${WORKDIR}/profile ${D}${sysconfdir}/profile
> >> +	install -m 0755 ${WORKDIR}/share/dot.profile =20
> >> ${D}${sysconfdir}/skel/.profile
> >> +	install -m 0755 ${WORKDIR}/share/dot.bashrc =20
> >> ${D}${sysconfdir}/skel/.bashrc
> >> +	install -m 0644 ${WORKDIR}/inputrc ${D}${sysconfdir}/inputrc
> >> +	install -m 0644 ${WORKDIR}/motd ${D}${sysconfdir}/motd
> >> +	for license in BSD GPL-2 LGPL-2 LGPL-2.1 Artistic GPL-3 LGPL-3 =20
> >> GFDL-1.2; do
> >> +		install -m 0644 ${WORKDIR}/licenses/$license =20
> >> ${D}${datadir}/common-licenses/
> >> +	done
> >>
> >> -                install -m 0644 ${WORKDIR}/fstab =20
> >> ${D}${sysconfdir}/fstab
> >> -        	install -m 0644 ${WORKDIR}/filesystems =20
> >> ${D}${sysconfdir}/filesystems
> >> -        	install -m 0644 ${WORKDIR}/usbd ${D}${sysconfdir}/default/us=
bd
> >> -        	install -m 0644 ${WORKDIR}/profile ${D}${sysconfdir}/profile
> >> -        	install -m 0755 ${WORKDIR}/share/dot.profile =20
> >> ${D}${sysconfdir}/skel/.profile
> >> -        	install -m 0755 ${WORKDIR}/share/dot.bashrc =20
> >> ${D}${sysconfdir}/skel/.bashrc
> >> -        	install -m 0644 ${WORKDIR}/inputrc ${D}${sysconfdir}/inputrc
> >> -        	install -m 0644 ${WORKDIR}/motd ${D}${sysconfdir}/motd
> >> -        	for license in BSD GPL-2 LGPL-2 LGPL-2.1 Artistic GPL-3 =20
> >> LGPL-3 GFDL-1.2; do
> >> -	        	install -m 0644 ${WORKDIR}/licenses/$license =20
> >> ${D}${datadir}/common-licenses/
> >> -        	done
> >> -
> >> -	        ln -sf /proc/mounts ${D}${sysconfdir}/mtab
> >> -        	install -m 0644 ${WORKDIR}/host.conf =20
> >> ${D}${sysconfdir}/host.conf
> >> -        fi
> >> +	ln -sf /proc/mounts ${D}${sysconfdir}/mtab
> >> +	install -m 0644 ${WORKDIR}/host.conf ${D}${sysconfdir}/host.conf
> >>
> >>  	install -m 0644 ${WORKDIR}/nsswitch.conf =20
> >> ${D}${sysconfdir}/nsswitch.conf
> >>  }
> >> @@ -168,7 +161,6 @@ PACKAGE_ARCH_rt3000 =3D "rt3000"
> >>  PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> >>
> >>  CONFFILES_${PN} =3D "${sysconfdir}/fstab ${sysconfdir}/hostname"
> >> -CONFFILES_${PN}_micro =3D ""
> >>  CONFFILES_${PN}_nylon =3D "${sysconfdir}/resolv.conf ${sysconfdir}/fs=
tab =20
> >> ${sysconfdir}/hostname"
> >>  CONFFILES_${PN}_slugos =3D "${sysconfdir}/resolv.conf =20
> >> ${sysconfdir}/fstab ${sysconfdir}/hostname"
> >>
> >
> >
> >
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>=20
>=20



