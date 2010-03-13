Received: from host4.kei.pl ([195.149.226.213] helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1NqTk1-0007jB-AP
	for openembedded-devel@lists.openembedded.org;
	Sat, 13 Mar 2010 16:59:09 +0100
Received: (qmail 8044 invoked by uid 813007); 13 Mar 2010 15:56:07 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 13 Mar 2010 15:56:07 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 13 Mar 2010 16:55:13 +0100
User-Agent: KMail/1.13.1 (Linux/2.6.33-rc7-00064-gac73fdd; KDE/4.4.1; x86_64; ;
	)
References: <1268429974-12872-1-git-send-email-ulf.samuelsson@atmel.com>
	<hnfpdp$mg6$1@dough.gmane.org> <4B9B8207.1040909@atmel.com>
In-Reply-To: <4B9B8207.1040909@atmel.com>
MIME-Version: 1.0
Message-Id: <201003131655.14839.marcin@juszkiewicz.com.pl>
X-SA-Exim-Connect-IP: 195.149.226.213
X-SA-Exim-Mail-From: marcin@juszkiewicz.com.pl
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] multimedia:;Add media contents to rootfs
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
X-List-Received-Date: Sat, 13 Mar 2010 15:59:10 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Dnia sobota, 13 marca 2010 o 13:16:07 Ulf Samuelsson napisa=C5=82(a):
> > NAK. Package never never touch $HOME, if you want things installed into
> > $HOME, look into /etc/skel.
=20
> The purpose is not to have a "multimedia" directory in each home
> so I dont think "/etc/skel" is applicable.

Store your multimedia in /usr/share/multimedia/ and make ~/multimedia symli=
nk=20
for each user. This way it will work for those who use /home/ on other=20
partition (so do not write it during initial populating of rootfs) and you=
=20
will have your data available and everybody will be happy.
=20
> The purpose of this package is to be able to easily load some
> jpeg pictures, movies, mp3 files into the root file system
> when you build a demo.
=20
Idea is nice - I like it.

Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




