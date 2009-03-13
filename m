Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1Li6s3-0001bO-8p
	for openembedded-devel@openembedded.org; Fri, 13 Mar 2009 13:52:15 +0100
Received: (qmail 14712 invoked by uid 813007); 13 Mar 2009 12:51:56 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 13 Mar 2009 12:51:55 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 Mar 2009 13:51:55 +0100
User-Agent: KMail/1.11.0 (Linux/2.6.29-rc7-00188-gebdcc81; KDE/4.2.1; x86_64; ;
	)
References: <1236875362.11134.22.camel@homestead>
	<200903122027.20010.marcin@juszkiewicz.com.pl>
	<1236895366.17908.127.camel@homestead>
In-Reply-To: <1236895366.17908.127.camel@homestead>
MIME-Version: 1.0
Message-Id: <200903131351.55908.marcin@juszkiewicz.com.pl>
Subject: Re: Working with the Target
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
X-List-Received-Date: Fri, 13 Mar 2009 12:52:15 -0000
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Dnia czwartek, 12 marca 2009 o 23:02:46 Shane Dixon napisa=C5=82(a):

> On Thu, 2009-03-12 at 20:27 +0100, Marcin Juszkiewicz wrote:
> > I used my at91sam9263ek with kernel fetched via TFTP and NFS root
> > for quite long time. It is very useful way to change rootfs
> > contents - especially when you can press 'Reset' any time without
> > risk of unfinished transactions.

> I'd like to setup the same thing, but I didn't see anything in the OE
> manual for creating a bootable rootfs directory.

IMAGE_FSTYPES +=3D "tar.gz" will give you tarball which you unpack (as=20
root) and use as NFS root.

> Would it be possible for you to dump a few files like your u-boot
> printenv,

ethaddr=3D3a:1f:34:08:54:54
bootdelay=3D3
baudrate=3D115200
filesize=3D1713b0
fileaddr=3D22200000
tboot=3Dtftp 0x22200000 at91 ; bootm 0x22200000
env=3Dbootcmd run tboot
bootcmd=3Drun tboot
serverip=3D192.168.1.112
ipaddr=3D192.168.1.250
bootargs=3Dconsole=3DttyS0,115200 rootfstype=3Dubifs ubi.mtd=3D2=20
root=3Dubi0:rootfs
ubifsboot=3Dconsole=3DttyS0,115200 rootfstype=3Dubifs ubi.mtd=3D2=20
root=3Dubi0:rootfs
nfsb=3Dsetenv bootargs root=3D301 root=3D/dev/nfs=20
nfsroot=3D192.168.1.112:/srv/nfs/at91/bug ip=3D192.168.1.250:::255.255.255.=
0=20
console=3DttyS0
stdin=3Dserial
stdout=3Dserial
stderr=3Dserial

As you see I fetch kernel via TFTP and boot into ubifs on mtd2. If I=20
want to boot into NFS root I just enter u-boot and use 'nfsroot' +=20
'nfsb' variables as bootargs.

> your tftp config,=20

13:51 hrw@home:default$ cat tftpd-hpa
#Defaults for tftpd-hpa
RUN_DAEMON=3D"yes"
OPTIONS=3D"-l -s /srv/tftpd/"


> your nfs config,=20

/srv/nfs/  *(rw,sync,no_root_squash,no_subtree_check)

> and local.conf?

MACHINE=3D"at91sam9263ek"
DISTRO=3D"angstrom-2008.1"

Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




