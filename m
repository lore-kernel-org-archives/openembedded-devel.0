Received: from bsmtp5.bon.at ([195.3.86.187] helo=bsmtp.bon.at)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <pgsellmann@portner-elektronik.at>)
	id 1Q0ZRP-00013E-04 for openembedded-devel@lists.openembedded.org;
	Fri, 18 Mar 2011 14:10:07 +0100
Received: from aspire.localdomain (unknown [88.116.171.82])
	by bsmtp.bon.at (Postfix) with ESMTP id 134F8130060
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Mar 2011 14:08:17 +0100 (CET)
From: Peter Gsellmann <pgsellmann@portner-elektronik.at>
Organization: PORTNER Elektronik
To: openembedded-devel@lists.openembedded.org
Date: Fri, 18 Mar 2011 14:08:15 +0100
User-Agent: KMail/1.13.5 (Linux/2.6.32.26-175.fc12.x86_64; KDE/4.4.5; x86_64; ;
	)
References: <201103171154.23397.pgsellmann@portner-elektronik.at>
	<201103171654.31619.pgsellmann@portner-elektronik.at>
	<0C757E680E33864AB113392C7E83F910BE5145@GSX300A.mxchg.m.corp>
In-Reply-To: <0C757E680E33864AB113392C7E83F910BE5145@GSX300A.mxchg.m.corp>
MIME-Version: 1.0
Message-Id: <201103181408.16366.pgsellmann@portner-elektronik.at>
Subject: Re: [PATCH 3/3] base-files-3.0.14 configuration files
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
X-List-Received-Date: Fri, 18 Mar 2011 13:10:07 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Am Freitag, 18. M=E4rz 2011, 09:59:17 schrieb Hauser, Wolfgang (external):
> >> > Mark some files in ${sysconfdir} as configuration files so they are
> >> not blindly overwritten when upgrading
> >>=20
> >> I would suggest a pre-/post processing in the packages, like debian
> >> does.
> >> If a config file exists or is changed, the current File will be
> rotated
> >> or, if possible, left as it is and the new=20
> >> file is installed beside the changed one.
>=20
> >The opkg does not touch a present config file, but installs the new
> file with the name *-opkg
> >So if you do a find /etc -name \*-opkg you see the conflicts.
>=20
> >Any sensible conversion from old to new config file should be made by
> the package itself.
>=20
> As I experienced, opkg exits with an error code if a config file already
> exists, so if you want to create an image, the process will break at
> that error.
> It wasn't possible to create an image automatically then.
If you create a fresh new image, the config files should not exist.
opkg should not complain.

Problem arises if you do a 'opkg upgrade' from the running target;
With patch, opkg knows about Conffiles of base-files:
root@us-3:~# opkg info base-files
Package: base-files
Version: 3.0.14-r101.9
Provides:
Status: install user installed
Section: base
Architecture: pcontrol_g20
Maintainer: Angstrom Developers <angstrom-distro-devel@linuxtogo.org>
MD5Sum: d5553232d20233866c7f626b7f1d6d4f
Size: 4336
=46ilename: base-files_3.0.14-r101.9_pcontrol_g20.ipk
Conffiles:
 /etc/fstab 8a0d747a1565dfb39ae3b27b33ab5031
 /etc/hostname 0e97f4187e8f27c48206165806f9310a
 /etc/motd d41d8cd98f00b204e9800998ecf8427e
 /etc/profile 573d43f3c53d5bdabca7ec2317f5eb28
 /etc/nsswitch.conf 109e33e2c91d1853b5bc56078a96aa18
 /etc/host.conf a61b9f6548d337c1cc1e5a4de39f7b7f
Source: file://nsswitch.conf file://motd file://inputrc file://host.conf fi=
le://profile file://profile.d file://fstab file://filesystems file://issue.=
net file://issue file://usbd file://share/dot.bashrc file://share/dot.profi=
le file://licenses/BSD file://licenses/GPL-2 file://licenses/GPL-3 file://l=
icenses/LGPL-2 file://licenses/LGPL-2.1 file://licenses/LGPL-3 file://licen=
ses/GFDL-1.2 file://licenses/Artistic
Description: Miscellaneous files for the base system.
Installed-Time: 1300270958


As you can see, opkg maintains some md5-hash value for the unchanged Conffi=
le so a sensible conflict resolution is possible.
If it is not done so, its a opkg bug

Tested: it is possible to create an image with this patch.
Tested: 'opkg upgrade' handles the Conffiles as expected.

Peter


