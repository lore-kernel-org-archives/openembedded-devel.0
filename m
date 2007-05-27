Received: from [66.111.4.26] (helo=out2.smtp.messagingengine.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <rod@whitby.id.au>) id 1HsRYl-0003ku-8f
	for openembedded-devel@lists.openembedded.org;
	Mon, 28 May 2007 00:49:59 +0200
Received: from compute1.internal (compute1.internal [10.202.2.41])
	by out1.messagingengine.com (Postfix) with ESMTP id D96DD223C3C
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 27 May 2007 18:48:34 -0400 (EDT)
Received: from heartbeat2.messagingengine.com ([10.202.2.161])
	by compute1.internal (MEProxy); Sun, 27 May 2007 18:48:34 -0400
X-Sasl-enc: QGO7G/SrDrrG4esQ8qWh4UNMuegFoqLGCqCsnnXMc1PM 1180306114
Received: from [127.0.0.1] (CPE-58-160-130-105.sa.bigpond.net.au
	[58.160.130.105])
	by mail.messagingengine.com (Postfix) with ESMTP id F1DC912ED4
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 27 May 2007 18:48:33 -0400 (EDT)
Message-ID: <465A0A4E.7060807@whitby.id.au>
Date: Mon, 28 May 2007 08:16:38 +0930
From: Rod Whitby <rod@whitby.id.au>
User-Agent: Thunderbird 1.5.0.10 (Windows/20070221)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4636F787.8030902@whitby.id.au>
	<200705271630.18199.openembedded@hrw.one.pl>
In-Reply-To: <200705271630.18199.openembedded@hrw.one.pl>
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
X-List-Received-Date: Sun, 27 May 2007 22:49:59 -0000
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: quoted-printable

Marcin Juszkiewicz wrote:
> Dnia wtorek, 1 maja 2007, Rod Whitby napisa=B3:
>=20
>> The proposal is to replace MACHINE_TASK_PROVIDER with
>> DEFAULT_TASK_PROVIDER throughout OE, and encourage all image-foo.bb
>> maintainers to base their image on DEFAULT_TASK_PROVIDER (which can be
>> set to task-boot, or task-base, or perhaps some other distro-specific
>> single task-foo value), plus other image-specific stuff.
>=20
> DEFAULT_TASK_PROVIDER is good idea for me. I would like to merge it wit=
h=20
> my proposal change to task-base (adding wifi/bt for pcmcia/usbhost/pci=20
> devices) in a way that we will have:
>=20
> - task-boot
> - task-base
> - task-base-extended (wifi/bt added for pcmcia/usbhost/pci machines)
>=20
> This way we will be able to create images with wifi/bt support for PDA=20
> with pcmcia but no internal wifi/bt by using task-base-extended as=20
> DEFAULT_TASK_PROVIDER (set in distro config) and devices with smaller=20
> amount of space for rootfs will get task-base so users will be free to=20
> install extra stuff.
>=20
> What do you think?

+1 from me.

Can you add:

PROVIDES =3D "${PACKAGES}"

to task-base.bb while you are there?  I know it should not be required
(it should happen automatically), but for some reason the automatic
stuff is not working for this file at the moment.  I cannot build an
image based on task-boot instead of task-base without doing the above.

-- Rod


