Received: from host4.kei.pl ([195.149.226.213] helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1OFP3t-0003wP-O4
	for openembedded-devel@lists.openembedded.org;
	Fri, 21 May 2010 12:02:39 +0200
Received: (qmail 29315 invoked by uid 813007); 21 May 2010 09:58:36 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 21 May 2010 09:58:36 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 21 May 2010 11:58:41 +0200
User-Agent: KMail/1.13.3 (Linux/2.6.32-22-generic; KDE/4.4.3; x86_64; ; )
References: <AANLkTilUZ3dToBwFw4QzKZkyrDUxT2Y2rO7T3CvYNjQ-@mail.gmail.com>
	<AANLkTinAOE1YAoEEqHuOQoIWuXDJ_SZZL4wcWe2D9tri@mail.gmail.com>
	<AANLkTilad9w4Dh67o_qqPaTHJRTvLBKrI7YbkUNl4A6G@mail.gmail.com>
In-Reply-To: <AANLkTilad9w4Dh67o_qqPaTHJRTvLBKrI7YbkUNl4A6G@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <201005211158.42460.marcin@juszkiewicz.com.pl>
X-SA-Exim-Connect-IP: 195.149.226.213
X-SA-Exim-Mail-From: marcin@juszkiewicz.com.pl
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Problem with building glibc
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
X-List-Received-Date: Fri, 21 May 2010 10:02:39 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Dnia pi=C4=85tek, 21 maja 2010 o 11:48:24 Grzegorz Toporek napisa=C5=82(a):

> I would love to work with angstrom, however I'm using Colibri evaluation
> board with Intel=C2=AE PXA270 Processor (this is a students project and I=
 can't
> change it). Is it possible to run system built for angstrom on my board or
> I just miss something?!

Angstrom supports nearly every board which OpenEmbedded supports. Colibri i=
s=20
just another device. Build Angstrom for it, use it and you will soon find o=
ut=20
how much work you do not have to do due to feeds with already built softwar=
e.

Making own distribution and then properly maintain it is lot of work and I=
=20
would never suggest that for someone who just started with OpenEmbedded.

Also one thing: do not use tune-iwmmxt for Colibri. This does not give any=
=20
special improvements for system. Add "iwmmxt" to MACHINE_FEATURES like it i=
s=20
in few machines already - this will give you optimized versions of those=20
packages where it is really worth to enable that.

And do not get flooded by Wis=C5=82a :D

Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




