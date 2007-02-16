Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <openembedded@hrw.one.pl>) id 1HHxdA-0002hN-Ca
	for openembedded-devel@openembedded.org; Fri, 16 Feb 2007 08:35:44 +0100
Received: (qmail 25623 invoked by uid 813007); 16 Feb 2007 07:35:43 -0000
X-clamdmail: clamdmail 0.18a
Received: from v813.rev.tld.pl (HELO home.lan)
	(marcin@hrw.one.pl@195.149.226.213)
	by smtp.host4.kei.pl with ESMTPA; 16 Feb 2007 07:35:43 -0000
From: Marcin Juszkiewicz <openembedded@hrw.one.pl>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 16 Feb 2007 08:35:40 +0100
User-Agent: KMail/1.9.6
References: <1171565169.18829@gatekeeper.stellarwerx.com>
	<e83232070702152025v7de70216j32d24db89ba686b7@mail.gmail.com>
In-Reply-To: <e83232070702152025v7de70216j32d24db89ba686b7@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <200702160835.41453.openembedded@hrw.one.pl>
Subject: Re: Building Distros Directly To HD (Was: Re: OE Booth during fosdem)
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 16 Feb 2007 07:35:47 -0000
Content-Type: text/plain;
  charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Dnia pi=B1tek, 16 lutego 2007, Roderick Taylor napisa=B3:

> Using QEMU has helped me navigate the learning curve.
>
> The fiddly part is writing the filesystem to a QEMU virtual hard disk.
>  To do this I first boot qemu with a ploplinux iso image, start the
> network, fdisk, mkfs, wget the oe file system and extract files to the
> virtual disk.  Once I've got an intial OE image on there, I just use
> ipkg to upgrade and test any other software I need to stick on there.

Poky has scripts which make it VERY easy:

poky-qemu bzImage-qemux86.bin ANY-image-qemux86.rootfs.ext2

do ALL work ;)

http://www.rpsys.net/openzaurus/qemu/ is MUST read for using Qemu with OE.

=2D-=20
JID: hrw-jabber.org
OpenEmbedded developer/consultant

          Warning: Dates in calendar are closer than they appear.




