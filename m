Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1N0aAM-0007uG-H3
	for openembedded-devel@openembedded.org; Wed, 21 Oct 2009 14:19:49 +0200
Received: (qmail 25914 invoked by uid 813007); 21 Oct 2009 12:18:47 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 21 Oct 2009 12:18:47 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 21 Oct 2009 14:20:33 +0200
User-Agent: KMail/1.12.2 (Linux/2.6.32-rc3-00052-g0eca52a; KDE/4.3.2; x86_64; ;
	)
References: <1255966150-1854-1-git-send-email-marcin@juszkiewicz.com.pl>
	<4ADCAB0E.9050607@mwester.net>
	<200910192018.29300.marcin@juszkiewicz.com.pl>
In-Reply-To: <200910192018.29300.marcin@juszkiewicz.com.pl>
MIME-Version: 1.0
Message-Id: <200910211420.34763.marcin@juszkiewicz.com.pl>
X-SA-Exim-Connect-IP: 195.149.226.213
X-SA-Exim-Mail-From: marcin@juszkiewicz.com.pl
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Updating kernels to latest stable versions
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
X-List-Received-Date: Wed, 21 Oct 2009 12:19:49 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Dnia poniedzia=C5=82ek, 19 pa=C5=BAdziernika 2009 o 20:18:28 Marcin Juszkie=
wicz napisa=C5=82(a):

> And those reasons are why I did not pushed any of those this time (before=
 I
> updated .30 and .31). Tomorrow will do some build testing.

I did a check for applying all patches for those machines (they alter SRC_U=
RI):

2.6.18 - at91sam9263ek=20
2.6.19 - at91sam9263ek=20
2.6.20 - n2100, at91sam9263ek
2.6.21 - simpad, kb9202, at91sam9263ek, sarge-at91, gumstix-verdex (FAIL), =
gumstix-connex (FAIL)
2.6.22 - cm-x270, bd-neon
2.6.23 - em-x270, cm-x270, mpc8313e-rdb, mpc8323e-rdb
2.6.24 - simpad, gesbc-9302, mpc8313e-rdb, cm-x270, ts72xx (FAIL), oxnas (F=
AIL), hipox (FAIL)
2.6.25 - mpc8313e-rdb, cm-x270, at32stk1000 (FAIL on fetching), at91-l9260,=
 m8050
2.6.26 - boc01, mpc8313e-rdb, topas910
2.6.27 - boc01, progear, simpad
2.6.28 - at91sam9263ek, ronetix-pm9263, stb225, collie, tosa, gamecube, tx2=
7 FAIL
2.6.29 - boc01, canyonlands, micro2440 FAIL, tosa, ep93xx, cm-x270, stamp9g=
20evb
2.6.30 - mpc8315e-rdb, at91sam9263ek
2.6.31 - boc01, ep93xx=20

So this changeset breaks few devices at patch level:
gumstix-verdex/connex in 2.6.21, ts72xx/oxnas/hipox in 2.6.24,
tx27 in 2.6.28 and micro2440 in 2.6.29.

at32stk1000 patch was not available for fetching.

Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




