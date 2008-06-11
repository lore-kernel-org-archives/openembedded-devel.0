Received: from [58.28.6.13] (helo=oberon.wxnz.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <tkemp@klc.net.nz>) id 1K6Etp-0005DN-Uw
	for openembedded-devel@lists.openembedded.org;
	Wed, 11 Jun 2008 03:13:18 +0200
Received: from [192.168.10.2] (ip-118-90-48-148.xdsl.xnet.co.nz
	[118.90.48.148])
	by oberon.wxnz.net (Postfix) with ESMTP id 46BDE46409D
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Jun 2008 13:09:33 +1200 (NZST)
From: Terry Kemp <tkemp@klc.net.nz>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1213098621.16999.94.camel@sulphur.klc>
References: <1213098621.16999.94.camel@sulphur.klc>
Date: Wed, 11 Jun 2008 13:07:46 +1200
Message-Id: <1213146466.20679.16.camel@sulphur.klc>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.2 (2.22.2-2.fc9) 
Subject: Re: tar & ar native vs host (Fedora 9 issues)
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Wed, 11 Jun 2008 01:13:18 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, 2008-06-10 at 23:50 +1200, Terry Kemp wrote:
> Hello devs,
>=20
> I have been working on
> http://bugs.openembedded.net/show_bug.cgi?id=3D4350
> and I have attached my recipe mods to this for review should someone
> care to look at them.=20
>=20

Just to confirm...

same deal with building latest mtn pull of dev...

[tmk@sulphur org.openembedded.dev]$ mtn status
Current branch: org.openembedded.dev
Changes against parent 30fc86774a3da064f530c39eeff1e97d6a7020a0
  patched  packages/linux/gumstix-kernel_2.6.21.bb
  patched  packages/linux/gumstix-linux.inc
  patched  site/common-glibc


[tmk@sulphur build]$
cat /build/OE/gumstix-connex/build/tmp/angstrom/work/gumstix-connex-angst=
rom-linux-gnueabi/minimal-image-1.0-r0/temp/log.do_rootfs.13586
+ rm -rf /build/OE/gumstix-connex/build/tmp/angstrom/rootfs
+ mkdir -p /build/OE/gumstix-connex/build/tmp/angstrom/rootfs
+ '[' 0 '!=3D' 1 ']'
+ for devtable
in /build/OE/org.openembedded.dev/files/device_table-minimal.txt
+ makedevs -r /build/OE/gumstix-connex/build/tmp/angstrom/rootfs
-D /build/OE/org.openembedded.dev/files/device_table-minimal.txt
+ rootfs_ipk_do_rootfs
+ set -x
+ package_update_index_ipk
+ set -x
+ ipkgarchs=3D'all any noarch arm armv4 armv4t armv5e armv5te
gumstix-connex'
+ '[' '!' -z '' ']'
+
touch /build/OE/gumstix-connex/build/tmp/angstrom/deploy/glibc/ipk/Packag=
es
+ ipkg-make-index
-r /build/OE/gumstix-connex/build/tmp/angstrom/deploy/glibc/ipk/Packages
-p /build/OE/gumstix-connex/build/tmp/angstrom/deploy/glibc/ipk/Packages
-l /build/OE/gumstix-connex/build/tmp/angstrom/deploy/glibc/ipk/Packages.=
filelist -m /build/OE/gumstix-connex/build/tmp/angstrom/deploy/glibc/ipk

+ for arch in '$ipkgarchs'
+ '['
-e /build/OE/gumstix-connex/build/tmp/angstrom/deploy/glibc/ipk/all/ ']'
+
touch /build/OE/gumstix-connex/build/tmp/angstrom/deploy/glibc/ipk/all/Pa=
ckages
+ ipkg-make-index
-r /build/OE/gumstix-connex/build/tmp/angstrom/deploy/glibc/ipk/all/Packa=
ges -p /build/OE/gumstix-connex/build/tmp/angstrom/deploy/glibc/ipk/all/P=
ackages -l /build/OE/gumstix-connex/build/tmp/angstrom/deploy/glibc/ipk/a=
ll/Packages.filelist -m /build/OE/gumstix-connex/build/tmp/angstrom/deplo=
y/glibc/ipk/all/
Traceback (most recent call last):
  File
"/build/OE/gumstix-connex/build/tmp/angstrom/staging/i686-linux/usr/bin/i=
pkg-make-index", line 114, in <module>
    pkg =3D ipkg.Package(filename)
  File
"/build/OE/gumstix-connex/build/tmp/angstrom/staging/i686-linux/usr/bin/i=
pkg.py", line 161, in __init__
    tarStream =3D ar.open("control.tar.gz")
  File
"/build/OE/gumstix-connex/build/tmp/angstrom/staging/i686-linux/usr/bin/a=
rfile.py", line 59, in open
    f =3D self._scan(fname)
  File
"/build/OE/gumstix-connex/build/tmp/angstrom/staging/i686-linux/usr/bin/a=
rfile.py", line 79, in _scan
    size =3D int(descriptor[5])
IndexError: list index out of range
[tmk@sulphur build]$=20


Same fix being tested now.

=EF=BB=BF
Terry




