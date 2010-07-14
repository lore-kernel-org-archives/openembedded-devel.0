Received: from host4.kei.pl ([195.149.226.213] helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1OZ8ng-0005jj-Qx
	for openembedded-devel@lists.openembedded.org;
	Wed, 14 Jul 2010 22:43:29 +0200
Received: (qmail 30918 invoked by uid 813007); 14 Jul 2010 20:43:26 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 14 Jul 2010 20:43:26 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 14 Jul 2010 22:43:34 +0200
User-Agent: KMail/1.13.5 (Linux/2.6.35-6-generic; KDE/4.4.92; x86_64; ; )
References: <4C3DF5BF.9040103@zafena.se>
In-Reply-To: <4C3DF5BF.9040103@zafena.se>
MIME-Version: 1.0
Message-Id: <201007142243.36837.marcin@juszkiewicz.com.pl>
X-SA-Exim-Connect-IP: 195.149.226.213
X-SA-Exim-Mail-From: marcin@juszkiewicz.com.pl
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: OpenJDK-6 ARM Shark LLVM JIT testing
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
X-List-Received-Date: Wed, 14 Jul 2010 20:43:29 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Dnia =C5=9Broda, 14 lipca 2010 o 19:37:03 Xerxes R=C3=A5nby napisa=C5=82(a):
> Hi all!
>=20
> I have committed some ARM Shark CPU features auto-detection code into
> oe.dev.
> http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3D1ea15a2cd=
7317
> 8c3fbab36b544a6601b1d1c32bf This patch will make OpenJDK use the best ARM
> CPU features available when generating code using the Shark JIT.

> I need your help in order to find and catch the LLVM JIT bugs by testing
> running Shark and report if
> LLVM asserts during code generation.

LLVM does not supports Thumb - thats hurt. Ubuntu had to disable Shark to g=
et=20
openjdk-6 built for armel.

Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




