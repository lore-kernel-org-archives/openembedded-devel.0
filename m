Received: from host4.kei.pl ([195.149.226.213] helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1O2lqt-0005bQ-Bg
	for openembedded-devel@lists.openembedded.org;
	Fri, 16 Apr 2010 15:45:08 +0200
Received: (qmail 10370 invoked by uid 813007); 16 Apr 2010 13:41:31 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 16 Apr 2010 13:41:31 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 16 Apr 2010 15:41:22 +0200
User-Agent: KMail/1.13.2 (Linux/2.6.34-rc2-wl-47166-ged2da1f; KDE/4.4.2; x86_64;
	; )
References: <20100416123920.GB3323@jama> <hq9ogk$k1j$2@dough.gmane.org>
In-Reply-To: <hq9ogk$k1j$2@dough.gmane.org>
MIME-Version: 1.0
Message-Id: <201004161541.23250.marcin@juszkiewicz.com.pl>
X-SA-Exim-Connect-IP: 195.149.226.213
X-SA-Exim-Mail-From: marcin@juszkiewicz.com.pl
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Do we really want shared Xserver script for all machines?
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
X-List-Received-Date: Fri, 16 Apr 2010 13:45:09 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Dnia pi=C4=85tek, 16 kwietnia 2010 o 15:25:40 Koen Kooi napisa=C5=82(a):
>   Wouldn't it be better to merge the scripts from xserver-kdrive-common
> and xserver-common and then fix all the sed/awk calls in one place?

I did most of it long time ago and stored as xserver-common 1.30. Script
got simplified, supports Xorg and KDrive, replaces xserver-kdrive-common,
allows to set variables in /etc/default/xserver instead of patching=20
/etc/X11/Xserver file etc.

I did send RFC about it on 3rd August 2009. Merged it into stable/2009 in
October 2009 as we used it on BUG 1.x and 2.0 devices.

I merged my improvements into upstream which gave us 1.31, 1.32 and 1.33
versions (1.30/upstream !=3D 1.30/OE as it was base for my improvements whi=
ch
landed in next upstream versions).

So far I did not noticed anyone using it. For those which use=20
xserver-nodm-init script to boot into root X11 session: you need newer
version from BugLabs repository:

svn://svn.buglabs.net/bug/trunk/com.buglabs.build.oe/meta-bug/packages/xser=
ver-nodm-init

Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




