Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <openembedded@hrw.one.pl>) id 1HsJmb-0002Ol-0j
	for openembedded-devel@openembedded.org; Sun, 27 May 2007 16:31:46 +0200
Received: (qmail 18300 invoked by uid 813007); 27 May 2007 14:30:21 -0000
X-clamdmail: clamdmail 0.18a
Received: from v813.rev.tld.pl (HELO home.lan)
	(marcin@hrw.one.pl@195.149.226.213)
	by smtp.host4.kei.pl with ESMTPA; 27 May 2007 14:30:21 -0000
From: Marcin Juszkiewicz <openembedded@hrw.one.pl>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 27 May 2007 16:30:16 +0200
User-Agent: KMail/1.9.7
References: <4636F787.8030902@whitby.id.au>
In-Reply-To: <4636F787.8030902@whitby.id.au>
MIME-Version: 1.0
Message-Id: <200705271630.18199.openembedded@hrw.one.pl>
Subject: Re: RFC: Rename MACHINE_TASK_PROVIDER to DEFAULT_TASK_PROVIDER
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
X-List-Received-Date: Sun, 27 May 2007 14:31:46 -0000
Content-Type: text/plain;
  charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Dnia wtorek, 1 maja 2007, Rod Whitby napisa=B3:

> The proposal is to replace MACHINE_TASK_PROVIDER with
> DEFAULT_TASK_PROVIDER throughout OE, and encourage all image-foo.bb
> maintainers to base their image on DEFAULT_TASK_PROVIDER (which can be
> set to task-boot, or task-base, or perhaps some other distro-specific
> single task-foo value), plus other image-specific stuff.

DEFAULT_TASK_PROVIDER is good idea for me. I would like to merge it with=20
my proposal change to task-base (adding wifi/bt for pcmcia/usbhost/pci=20
devices) in a way that we will have:

=2D task-boot
=2D task-base
=2D task-base-extended (wifi/bt added for pcmcia/usbhost/pci machines)

This way we will be able to create images with wifi/bt support for PDA=20
with pcmcia but no internal wifi/bt by using task-base-extended as=20
DEFAULT_TASK_PROVIDER (set in distro config) and devices with smaller=20
amount of space for rootfs will get task-base so users will be free to=20
install extra stuff.

What do you think?

=2D-=20
JID: hrw-jabber.org
OpenEmbedded developer/consultant

               Life's not fair. But the root password helps.




