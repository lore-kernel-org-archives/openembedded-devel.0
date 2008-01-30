Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <openembedded@haerwu.biz>) id 1JKB2X-0000MI-84
	for openembedded-devel@openembedded.org; Wed, 30 Jan 2008 12:23:37 +0100
Received: (qmail 24382 invoked by uid 813007); 30 Jan 2008 11:23:44 -0000
X-clamdmail: clamdmail 0.18a
Received: from v813.rev.tld.pl (HELO home.lan)
	(marcin@hrw.one.pl@195.149.226.213)
	by smtp.host4.kei.pl with ESMTPA; 30 Jan 2008 11:23:44 -0000
From: Marcin Juszkiewicz <openembedded@haerwu.biz>
To: angstrom-distro-devel@linuxtogo.org
Date: Wed, 30 Jan 2008 12:23:13 +0100
User-Agent: KMail/1.9.7
References: <47A05B52.6000202@gmail.com>
In-Reply-To: <47A05B52.6000202@gmail.com>
MIME-Version: 1.0
Message-Id: <200801301223.17721.openembedded@haerwu.biz>
Cc: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [Angstrom-devel] [RFC] add kernel-module-loop to roofs for collie and tosa
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
X-List-Received-Date: Wed, 30 Jan 2008 11:23:39 -0000
Content-Type: text/plain;
  charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Dnia Wednesday, 30 of January 2008, Junqian Gordon Xu napisa=B3:
> altboot-console-image needs loopback file support either in the kernel
> or as kernel module.=20

It is not 'altboot-console-image' which needs it but altboot.=20

> CONFIG_BLK_DEV_LOOP=3Dm were set for both collie and tosa. Other Z deviced
> has loopback file support built into the kernel.=20

Probably not for long as kernel size increase with each version ;(

> I would propose the following change [both dev and stable] to pack=20
> kernel-module-loop into the default rootfs for collie and tosa; and
> bump PR for task-base.

As altboot needs it then it has to be added as RRECOMMENDS to altboot=20
recipe rather.

=2D-=20
JID: hrw-jabber.org
OpenEmbedded developer/consultant

            We're here to give you a computer, not a religion.
            		-- Bob Pariseau, at the introduction of the Amiga




