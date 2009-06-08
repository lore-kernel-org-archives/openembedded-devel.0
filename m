Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1MDfXD-0001Oo-EU
	for openembedded-devel@openembedded.org; Mon, 08 Jun 2009 16:09:11 +0200
Received: (qmail 25446 invoked by uid 813007); 8 Jun 2009 13:59:42 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 8 Jun 2009 13:59:41 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 8 Jun 2009 16:00:42 +0200
User-Agent: KMail/1.11.4 (Linux/2.6.30-rc6-00082-g7aff192-dirty; KDE/4.2.4;
	x86_64; ; )
References: <d741b6090902221034t224cd1e5ja6b3e863fd54bbda@mail.gmail.com>
	<49A1C706.6000906@techworks.ie>
In-Reply-To: <49A1C706.6000906@techworks.ie>
MIME-Version: 1.0
Message-Id: <200906081600.49096.marcin@juszkiewicz.com.pl>
Subject: Re: ep93xx, ts72xx, gesbc-9302 and more (was Re: Angstrom, ep93xx, broken rootfs)
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
X-List-Received-Date: Mon, 08 Jun 2009 14:09:11 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Dnia niedziela, 22 lutego 2009 o 22:43:34 Christian Gagneraud=20
napisa=C5=82(a):

> I would like to highlight an "issue" to oe developpers: The machine
> name "ep93xx" is completely misleading, because it refers to a CPU
> name not a board/machine name, the conf/machine/ep93xx.conf file says
> that this is for the "Cirrus Logic EP-93xx Development Platform",
> which is the vendor development board for the EP-93xx CPU, so the
> name should be something like "ep93xxevb" or "devkit-ep93xx", or
> whatever saying it refers to a dev board not to all EP-93xx based
> machine.

I use EDB9301 here. 2.6.29 kernel from OE should works on all EDB93xx=20
boards made by Cirrus Logic (I enabled their support).

> As well, there is a conf/machine/include/tune-ep9312.inc which is not
> used by any machine conf file, does anyone know why?
> That's  a pity because this serie of CPU (EP93xx) has FP support
> support through maverick crunch. Which is supported by linux and
> gcc4, and this is exactly the purpose of this tune-ep9312.inc file (i
> did not test it yet, see below).

As you noted in next email the problem is with toolchain. The good thing=20
is that Martin Guy and Hasjim Williams got it sorted. I merged their=20
work recently into OpenEmbedded. By default "ep93xx" machine do not use=20
it because cpu cycles are then wasted in context switches and there is=20
no big speedup in normal applications (those which use heavy FP can be=20
compiled for Maverick optimisations).

> I'm currently working with a TS-7260 and a TS-7800 boards.

> Later on, i would like to experiment with maverick crunch, to check
> if it is usable and really brings noticable FP performance. If so,
> then: - rename the conf/machine/include/tune-ep9312.inc to
> conf/machine/include/tune-ep93xx.inc
> - make the machine conf files use tune-ep93xx.inc instead of
> tune-arm920t.inc

tune-ep3912 is named like this because -march=3Dep3912 which it uses.=20
Please update to recent OE and test MaverickCrunch on your board.


Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




