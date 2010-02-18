Received: from host4.kei.pl ([195.149.226.213] helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1Ni2Qk-0007Hg-HA
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Feb 2010 10:12:21 +0100
Received: (qmail 25983 invoked by uid 813007); 18 Feb 2010 09:09:40 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 18 Feb 2010 09:09:40 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 18 Feb 2010 10:09:06 +0100
User-Agent: KMail/1.12.4 (Linux/2.6.33-rc7-00064-gac73fdd; KDE/4.3.4; x86_64; ;
	)
References: <1266316492.6436.127.camel@rex>
	<b6ebd0a51002160616m462683b3nd2f4b17524395ddf@mail.gmail.com>
	<1266334604.6436.159.camel@rex>
In-Reply-To: <1266334604.6436.159.camel@rex>
MIME-Version: 1.0
Message-Id: <201002181009.07359.marcin@juszkiewicz.com.pl>
X-SA-Exim-Connect-IP: 195.149.226.213
X-SA-Exim-Mail-From: marcin@juszkiewicz.com.pl
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: RFC: Improve our default conf file setup
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
X-List-Received-Date: Thu, 18 Feb 2010 09:12:22 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Dnia wtorek, 16 lutego 2010 o 16:36:44 Richard Purdie napisa=C5=82(a):


> c) Are recipes in a recipes or a packages directory?
> d) How deep are the paths to the .bb files?

BBFILES +=3D "layer-top-dir" and BitBake will traverse subdirs and collect =
all=20
recipes from there. Never mind are they in recipes/ packages/ stuff/ or oth=
er=20
dir. It is working for quite long time now.

> e) What priority are assigned to the layers?

Priorities looks easy when you look at numbers. But problem arrives when yo=
u=20
want layer3 to have higher priority then layer2 and they are not connected.

> f) Should a given layer append or prepend to BBPATH?=20

Those two are important. I remember situation with BugLabs r1.4 overlays wh=
en=20
I had to recreate BBPATH to get proper order of overlays.

Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




