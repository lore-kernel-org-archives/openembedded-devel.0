Received: from host4.kei.pl ([195.149.226.213] helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1Nr9kp-0003Kj-SF
	for openembedded-devel@lists.openembedded.org;
	Mon, 15 Mar 2010 13:50:49 +0100
Received: (qmail 5748 invoked by uid 813007); 15 Mar 2010 12:47:43 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 15 Mar 2010 12:47:43 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 15 Mar 2010 13:46:42 +0100
User-Agent: KMail/1.13.1 (Linux/2.6.33-rc7-00064-gac73fdd; KDE/4.4.1; x86_64; ;
	)
References: <201003150738.22158.marcin@juszkiewicz.com.pl>
	<1268659726-20887-1-git-send-email-nicolas.ferre@atmel.com>
In-Reply-To: <1268659726-20887-1-git-send-email-nicolas.ferre@atmel.com>
MIME-Version: 1.0
Message-Id: <201003151346.43686.marcin@juszkiewicz.com.pl>
X-SA-Exim-Connect-IP: 195.149.226.213
X-SA-Exim-Mail-From: marcin@juszkiewicz.com.pl
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] linux-2.6.30: add linux4sam patches
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
X-List-Received-Date: Mon, 15 Mar 2010 12:50:49 -0000
Content-Type: Text/Plain;
  charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable

Dnia poniedzia=B3ek, 15 marca 2010 o 14:28:46 Nicolas Ferre napisa=B3(a):
> Marcin, what do you think of this patch architecture and URI management?

Nice. Few notes:

1. do it all in linux_2.6.30.bb recipe
2. we rather user CAPS for variable names
3. AT91_SRC_URI =3D "contents of at91_kernel + contents of lnx4sam_exp3" wo=
uld=20
be better
4. can't you just squash 2.6.30-at91-exp3.tar.gz into one patch?
=20
> The defconfig are not included in this patch and shall be sent in another
> patch series.

Merge those into one patch - otherwise you will make "PR bump" flood.

Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




