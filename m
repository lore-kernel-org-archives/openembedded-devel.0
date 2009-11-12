Received: from [83.222.23.61] (helo=relay1.mail.masterhost.ru)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <khimov@altell.ru>) id 1N8X2c-0001cR-LF
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 Nov 2009 11:36:41 +0100
Received: from [UNAVAILABLE] ([80.246.246.162] helo=mate.localnet)
	by relay1.mail.masterhost.ru with esmtp 
	envelope from <khimov@altell.ru> authenticated with rik@osrc.info
	message id 1N8WFJ-000MmK-L7
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 Nov 2009 12:45:42 +0300
From: Roman I Khimov <khimov@altell.ru>
Organization: Altell Ltd.
To: openembedded-devel@lists.openembedded.org
Date: Thu, 12 Nov 2009 12:45:39 +0300
User-Agent: KMail/1.12.2 (Linux/2.6.31-1-amd64; KDE/4.3.2; x86_64; ; )
References: <87fx8kbzyi.wl%peter@chubb.wattle.id.au>
In-Reply-To: <87fx8kbzyi.wl%peter@chubb.wattle.id.au>
MIME-Version: 1.0
Message-Id: <200911121245.40107.khimov@altell.ru>
X-SpamTest-Envelope-From: khimov@altell.ru
X-SpamTest-Group-ID: 00000000
X-SpamTest-Info: Profiles 10741 [Nov 12 2009]
X-SpamTest-Method: none
X-SpamTest-Rate: 0
X-SpamTest-Status: Not detected
X-SpamTest-Status-Extended: not_detected
X-SpamTest-Version: SMTP-Filter Version 3.0.0 [0284], KAS30/Release
X-SA-Exim-Connect-IP: 83.222.23.61
X-SA-Exim-Mail-From: khimov@altell.ru
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Using OpenEmbedded for a virtual environment
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
X-List-Received-Date: Thu, 12 Nov 2009 10:36:41 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

=D0=92 =D1=81=D0=BE=D0=BE=D0=B1=D1=89=D0=B5=D0=BD=D0=B8=D0=B8 =D0=BE=D1=82 =
=D0=A1=D1=80=D0=B5=D0=B4=D0=B0 11 =D0=BD=D0=BE=D1=8F=D0=B1=D1=80=D1=8F 2009=
 22:53:25 =D0=B0=D0=B2=D1=82=D0=BE=D1=80 Peter Chubb =D0=BD=D0=B0=D0=BF=D0=
=B8=D1=81=D0=B0=D0=BB:
>    We're trying to use OE to build a hypervisor, a paravirtualised
>    kernel, and a couple of root file systems.  I'm looking for any
>    best-practice examples of how to set it up for this kind of
>    purpose.  Has anyone done this kind of thing?

What exactly is a problem? We've done this in different kinds of settings.=
=20
Generally, it's very easy to do multiple images (separate tasks with lists =
of=20
all you need for those images, one "container" image for other images if=20
needed, interdependcies via do_rootfs (there was patch do it via DEPENDS, b=
ut=20
it got reverted)), multikernel (for example, if you want to have one Linux=
=20
kernel controling real hardware and another one fully virtualized) build=20
doesn't work out of the box AFAIK, but can be fixed. Building hypervisor or=
=20
microkernel is also not hard, you just need to add proper dependencies to y=
our=20
kernels and configure bootloader appropriately.


