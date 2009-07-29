Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1MW5jX-0007Ax-Vb
	for openembedded-devel@openembedded.org; Wed, 29 Jul 2009 11:46:05 +0200
Received: (qmail 9370 invoked by uid 813007); 29 Jul 2009 09:31:11 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 29 Jul 2009 09:31:11 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 29 Jul 2009 11:31:04 +0200
User-Agent: KMail/1.12.0 (Linux/2.6.31-rc4-00009-g83a3792-dirty; KDE/4.2.96;
	x86_64; ; )
References: <4A6FD077.1060001@gmail.com> <h4ou1e$s42$1@ger.gmane.org>
	<4A700A74.7040507@xora.org.uk>
In-Reply-To: <4A700A74.7040507@xora.org.uk>
MIME-Version: 1.0
Message-Id: <200907291131.04967.marcin@juszkiewicz.com.pl>
Subject: Re: [PATCH] remove duplicated code from linux.inc
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
X-List-Received-Date: Wed, 29 Jul 2009 09:46:12 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Dnia =C5=9Broda, 29 lipca 2009 o 10:38:12 Graeme Gregory napisa=C5=82(a):
> Koen Kooi wrote:
> > NAK, this breaks the resulting kernel-image ipk
>
> Double NAK, read the git log, I put this there to specifically make
> stuff work, I thought I had removed it from kernel.bbclass but I
> obviously forgot to push that patch. Doing it in do_deploy is just
> totally wrong.

So maybe remove it from kernel.bbclass/do_deploy and move=20
linux.inc/do_compile_append to kernel.bbclass?

We need to clean linux.inc by moving stuff from it to kernel.bbclass.

Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




