Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1Lwvp2-0000uL-05
	for openembedded-devel@openembedded.org; Thu, 23 Apr 2009 12:06:24 +0200
Received: (qmail 3371 invoked by uid 813007); 23 Apr 2009 10:01:46 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 23 Apr 2009 10:01:46 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 Apr 2009 12:01:33 +0200
User-Agent: KMail/1.11.2 (Linux/2.6.30-rc2-00199-g51f1622-dirty; KDE/4.2.2;
	x86_64; ; )
References: <1240449461-26116-1-git-send-email-otavio@debian.org>
	<1240449461-26116-3-git-send-email-otavio@debian.org>
	<1240449461-26116-4-git-send-email-otavio@debian.org>
In-Reply-To: <1240449461-26116-4-git-send-email-otavio@debian.org>
MIME-Version: 1.0
Message-Id: <200904231201.38503.marcin@juszkiewicz.com.pl>
Subject: Re: [PATCH 3/6] machine/geode[gl]x: use more optimization while compiling
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
X-List-Received-Date: Thu, 23 Apr 2009 10:06:24 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Dnia czwartek, 23 kwietnia 2009 o 03:17:38 Otavio Salvador napisa=C5=82(a):
> From: Otavio Salvador <otavio@ossystems.com.br>
>
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>  conf/machine/geodegx.conf             |    2 +-
>  conf/machine/geodelx.conf             |   15 ++++++++-------
>  conf/machine/include/tune-geodegx.inc |    3 +--
>  conf/machine/include/tune-geodelx.inc |    6 +-----
>  4 files changed, 11 insertions(+), 15 deletions(-)

Looks like after those changes both tune files are same. What about=20
creating tune-geode.inc which will be used instead of both?

And if you use any of those two machines consider moving them to linux=20
recipe as GeodeLX is working nicely with recent kernels (I have Debian=20
on alix 1c (geodelx 800) with 2.6.29-debian kernel).

Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




