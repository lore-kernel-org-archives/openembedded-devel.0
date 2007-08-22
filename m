Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <openembedded@hrw.one.pl>) id 1INmeS-0002IE-Bl
	for openembedded-devel@openembedded.org; Wed, 22 Aug 2007 11:37:28 +0200
Received: (qmail 27126 invoked by uid 813007); 22 Aug 2007 09:36:23 -0000
X-clamdmail: clamdmail 0.18a
Received: from v813.rev.tld.pl (HELO home.lan)
	(marcin@hrw.one.pl@195.149.226.213)
	by smtp.host4.kei.pl with ESMTPA; 22 Aug 2007 09:36:23 -0000
From: Marcin Juszkiewicz <openembedded@hrw.one.pl>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 22 Aug 2007 11:36:14 +0200
User-Agent: KMail/1.9.7
References: <E1INbyh-0006rm-0y@linuxtogo.org>
	<46CB6D5B.40501@dominion.kabel.utwente.nl>
	<f96d234e0708211932n4370bd94j2a91f597edc89adb@mail.gmail.com>
In-Reply-To: <f96d234e0708211932n4370bd94j2a91f597edc89adb@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <200708221136.16566.openembedded@hrw.one.pl>
Subject: Re: [oe-commits] org.oe.dev compulab-pxa270.conf: fix serial console setup for 2.6.22 kernel,
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
X-List-Received-Date: Wed, 22 Aug 2007 09:37:33 -0000
Content-Type: text/plain;
  charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Dnia =B6roda, 22 sierpnia 2007, Cliff Brake napisa=B3:

> Let me explain what I'm trying to do, and perhaps someone will have a
> suggestion how I can better do this.  I need to build a small NOR
> image that fits in less than 2.4MB that includes mtd-utils so that the
> NOR rootfs can be used to program the NAND flash.  This is required to
> get away from the proprietary compulab NAND driver and use JFFS2.

packages/images/minimal-image-with-mtd-utils.bb:

require angstrom-minimal-image.bb
RDEPENDS +=3D "mtd-utils"

should do the trick. Then choose better name for recipe and push it into=20
OE.

>   2) create a custom image for the cm-x270 NOR rootfs -- where should
> I put this?

packages/images/

=2D-=20
JID: hrw-jabber.org
OpenEmbedded developer/consultant

If you think of MS-DOS as mono, and Windows as stereo, then Linux is Dolby
Pro-Logic Surround Sound with Bass Boost and all the music is free.




