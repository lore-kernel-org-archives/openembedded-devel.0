Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1MeDmF-0001Tg-Nl
	for openembedded-devel@openembedded.org; Thu, 20 Aug 2009 21:58:29 +0200
Received: (qmail 19331 invoked by uid 813007); 20 Aug 2009 19:41:08 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 20 Aug 2009 19:41:08 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 20 Aug 2009 21:41:06 +0200
User-Agent: KMail/1.12.0 (Linux/2.6.31-rc5-00256-g8e6bcae; KDE/4.3.0; x86_64; ;
	)
References: <4A83BD15.7070006@atmel.com> <h61vvo$n4v$1@ger.gmane.org>
	<4A8515F3.3070502@atmel.com>
In-Reply-To: <4A8515F3.3070502@atmel.com>
MIME-Version: 1.0
Message-Id: <200908202141.07520.marcin@juszkiewicz.com.pl>
Subject: Re: Ideas for scripts, to save work, when building several boards
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
X-List-Received-Date: Thu, 20 Aug 2009 19:58:32 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Dnia pi=C4=85tek, 14 sierpnia 2009 o 09:44:51 Ulf Samuelsson napisa=C5=82(a=
):
> The reason for doing a script is to allow building multiple stuff
> when I am sleeping or travelling, and as long as things complete
> I do not mind the 10 minute pauses.
>
> When I am working interactively, I do not want to specify MACHINE
> everytime I do something
>
> Maybe this is something that would work...
> alias bitbake=3D"MACHINE=3D${BB_MACHINE} /path/to/bitbake"

I do that in this style:

for mach in LIST-OF-BOARDS;do MACHINE=3D$mach bitbake something;done

This works fine in Bash and allow to do anything from remote etc.

My last use was:

for mach in `ls openembedded/conf/machine/at91*`;do export MACHINE=3D`basen=
ame=20
$mach .conf`; bitbake -cclean base-files sysvinit task-base task-boot; bitb=
ake=20
console-image;done

To make it work you should have to use MACHINE ?=3D "machinename" in conf/*=
=2Econf=20
files or just not set MACHINE there at all.

Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




